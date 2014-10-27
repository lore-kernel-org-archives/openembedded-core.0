Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E80C86E67C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 09:24:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9R9Ock5015357
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Oct 2014 02:24:38 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 27 Oct 2014 02:24:38 -0700
Message-ID: <544E0F53.3010600@windriver.com>
Date: Mon, 27 Oct 2014 17:24:35 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Anders Darander <anders@chargestorm.se>
References: <cover.1414394124.git.Chong.Lu@windriver.com>
	<1c4ed8e4a604bcd7c7fd2609024f8fbfca43d1a4.1414394124.git.Chong.Lu@windriver.com>
	<20141027085931.GA27393@ad.chargestorm.se>
In-Reply-To: <20141027085931.GA27393@ad.chargestorm.se>
X-Originating-IP: [128.224.162.204]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: add bash to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Oct 2014 09:24:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/27/2014 04:59 PM, Anders Darander wrote:
> * Chong Lu <Chong.Lu@windriver.com> [141027 08:19]:
>> systemd-216+gitAUTOINC+5d0ae62c66: systemd-kernel-install requires /bin/bash,
>> but no providers in its RDEPENDS [file-rdeps]
> How much bashisms are it in the files in systemd-kernel-install?
> Would it be possible to to patch the scripts to use standard posixh sh
> instead of bash?
>
> It's always good/nice to not force bash to be installed.
>
> Cheers,
> Anders
>

Hi Anders,

It has lots of bashisms:

$ checkbashisms ./usr/bin/kernel-install
possible bashism in ./usr/bin/kernel-install line 32 (local -opt):
     local -a files
possible bashism in ./usr/bin/kernel-install line 35 (readarray):
     readarray -t files < <(
possible bashism in ./usr/bin/kernel-install line 38 (alternative test 
command ([[ foo ]] should be [ foo ])):
                 if [[ -e "$i" ]]; then
possible bashism in ./usr/bin/kernel-install line 45 (bash arrays, 
${name[0|*|@]}):
     for f in "${files[@]}"; do
possible bashism in ./usr/bin/kernel-install line 47 (alternative test 
command ([[ foo ]] should be [ foo ])):
             if [[ -e "$d/$f" ]]; then
possible bashism in ./usr/bin/kernel-install line 58 (should be 'b = a'):
     if [ "$i" == "--help" -o "$i" == "-h" ]; then
possible bashism in ./usr/bin/kernel-install line 58 (should be 'b = a'):
     if [ "$i" == "--help" -o "$i" == "-h" ]; then
possible bashism in ./usr/bin/kernel-install line 64 (alternative test 
command ([[ foo ]] should be [ foo ])):
if [[ "${0##*/}" == 'installkernel' ]]; then
possible bashism in ./usr/bin/kernel-install line 64 (should be 'b = a'):
if [[ "${0##*/}" == 'installkernel' ]]; then
possible bashism in ./usr/bin/kernel-install line 74 (alternative test 
command ([[ foo ]] should be [ foo ])):
if [[ -f /etc/machine-id ]]; then
possible bashism in ./usr/bin/kernel-install line 78 (alternative test 
command ([[ foo ]] should be [ foo ])):
if ! [[ $MACHINE_ID ]]; then
possible bashism in ./usr/bin/kernel-install line 84 (alternative test 
command ([[ foo ]] should be [ foo ])):
if [[ ! $COMMAND ]] || [[ ! $KERNEL_VERSION ]]; then
possible bashism in ./usr/bin/kernel-install line 92 (readarray):
readarray -t PLUGINS < <(
possible bashism in ./usr/bin/kernel-install line 100 (alternative test 
command ([[ foo ]] should be [ foo ])):
         if [[ ! "$KERNEL_IMAGE" ]]; then
possible bashism in ./usr/bin/kernel-install line 110 (bash arrays, 
${name[0|*|@]}):
         for f in "${PLUGINS[@]}"; do
possible bashism in ./usr/bin/kernel-install line 111 (alternative test 
command ([[ foo ]] should be [ foo ])):
             if [[ -x $f ]]; then
possible bashism in ./usr/bin/kernel-install line 113 (should be 
VAR="${VAR}foo"):
                 ((ret+=$?))
possible bashism in ./usr/bin/kernel-install line 113 ('((' should be 
'$(('):
                 ((ret+=$?))
possible bashism in ./usr/bin/kernel-install line 119 (bash arrays, 
${name[0|*|@]}):
         for f in "${PLUGINS[@]}"; do
possible bashism in ./usr/bin/kernel-install line 120 (alternative test 
command ([[ foo ]] should be [ foo ])):
             if [[ -x $f ]]; then
possible bashism in ./usr/bin/kernel-install line 122 (should be 
VAR="${VAR}foo"):
                 ((ret+=$?))
possible bashism in ./usr/bin/kernel-install line 122 ('((' should be 
'$(('):
                 ((ret+=$?))
possible bashism in ./usr/bin/kernel-install line 127 (should be 
VAR="${VAR}foo"):
         ((ret+=$?))
possible bashism in ./usr/bin/kernel-install line 127 ('((' should be 
'$(('):
         ((ret+=$?))

$ checkbashisms ./usr/lib/kernel/install.d/50-depmod.install
possible bashism in ./usr/lib/kernel/install.d/50-depmod.install line 5 
(alternative test command ([[ foo ]] should be [ foo ])):
[[ $1 == "add" ]] || exit 0
possible bashism in ./usr/lib/kernel/install.d/50-depmod.install line 5 
(should be 'b = a'):
[[ $1 == "add" ]] || exit 0
possible bashism in ./usr/lib/kernel/install.d/50-depmod.install line 6 
(alternative test command ([[ foo ]] should be [ foo ])):
[[ $2 ]] || exit 1

$ checkbashisms ./usr/lib/kernel/install.d/90-loaderentry.install
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 10 (alternative test command ([[ foo ]] should be [ foo ])):
if [[ -f /etc/machine-id ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 14 (alternative test command ([[ foo ]] should be [ foo ])):
if ! [[ $MACHINE_ID ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 21 (alternative test command ([[ foo ]] should be [ foo ])):
if [[ $COMMAND == remove ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 21 (should be 'b = a'):
if [[ $COMMAND == remove ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 25 (alternative test command ([[ foo ]] should be [ foo ])):
if ! [[ $COMMAND == add ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 25 (should be 'b = a'):
if ! [[ $COMMAND == add ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 29 (alternative test command ([[ foo ]] should be [ foo ])):
if ! [[ $KERNEL_IMAGE ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 33 (alternative test command ([[ foo ]] should be [ foo ])):
if [[ -f /etc/os-release ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 35 (alternative test command ([[ foo ]] should be [ foo ])):
elif [[ -f /usr/lib/os-release ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 39 (alternative test command ([[ foo ]] should be [ foo ])):
if ! [[ $PRETTY_NAME ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 43 (declare):
declare -a BOOT_OPTIONS
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 45 (alternative test command ([[ foo ]] should be [ foo ])):
if [[ -f /etc/kernel/cmdline ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 46 (readarray):
     readarray -t BOOT_OPTIONS < /etc/kernel/cmdline
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 49 (bash arrays, ${name[0|*|@]}):
if ! [[ ${BOOT_OPTIONS[*]} ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 49 (alternative test command ([[ foo ]] should be [ foo ])):
if ! [[ ${BOOT_OPTIONS[*]} ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 50 (read with option other than -r):
     read -ar line < /proc/cmdline
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 51 (bash arrays, ${name[0|*|@]}):
     for i in "${line[@]}"; do
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 52 (alternative test command ([[ foo ]] should be [ foo ])):
         [[ "${i#initrd=*}" != "$i" ]] && continue
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 53 (bash arrays, ${name[0|*|@]}):
         BOOT_OPTIONS[${#BOOT_OPTIONS[@]}]="$i"
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 57 (bash arrays, ${name[0|*|@]}):
if ! [[ ${BOOT_OPTIONS[*]} ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 57 (alternative test command ([[ foo ]] should be [ foo ])):
if ! [[ ${BOOT_OPTIONS[*]} ]]; then
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 79 (bash arrays, ${name[0|*|@]}):
     echo "options    ${BOOT_OPTIONS[*]}"
possible bashism in ./usr/lib/kernel/install.d/90-loaderentry.install 
line 82 (alternative test command ([[ foo ]] should be [ foo ])):
     [[ -f $BOOT_DIR_ABS/initrd ]] && \
         echo "initrd     $BOOT_DIR/initrd"

Best Regards
Chong

