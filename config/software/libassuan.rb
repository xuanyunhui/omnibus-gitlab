#
# Copyright:: Copyright (c) 2017 GitLab Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name 'libassuan'
default_version '2.4.4'

license 'LGPL-2.1'
license_file 'COPYING.LIB'

source url: "https://www.gnupg.org/ftp/gcrypt/libassuan/libassuan-#{version}.tar.bz2",
       sha256: '9e69a102272324de0bb56025779f84fd44901afcc6eac51505f6a63ea5737ca1'

dependency 'libgpg-error'

relative_path "libassuan-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  command './configure ' \
    "--prefix=#{install_dir}/embedded --disable-doc", env: env

  make "-j #{workers}", env: env
  make 'install', env: env
end
