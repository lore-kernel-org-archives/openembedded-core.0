Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 38F5D6A39D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 01:54:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6T1sx4Q027726
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 18:54:59 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 28 Jul 2013 18:54:58 -0700
Message-ID: <51F5CB79.6080101@windriver.com>
Date: Mon, 29 Jul 2013 09:55:05 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1374642547.git.Qi.Chen@windriver.com>
	<5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
In-Reply-To: <5dc3be245a9757c51dadd7ce446c5116ce79496d.1374642547.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 9/9] Generate ssh keys at rootfs creation time in case of a read-only rootfs
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
X-List-Received-Date: Mon, 29 Jul 2013 01:54:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for all the reviews and comments.
I'll drop this patch and send out a version 2 of this patchset.

Best Regards,
Chen Qi

On 07/26/2013 03:39 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> To avoid generating ssh keys every time a system with read-only rootfs
> starts, we generate ssh keys at rootfs creation time.
>
> This change only has effect for systems with read-only rootfs.
>
> [YOCTO #4103]
> [YOCTO #4887]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/image.bbclass                         |   15 +++++++++++++++
>   meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   10 +++++++---
>   meta/recipes-core/dropbear/dropbear.inc            |    6 +++++-
>   meta/recipes-core/dropbear/dropbear/init           |   19 ++-----------------
>   4 files changed, 29 insertions(+), 21 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 3bc57d3..9a0692a 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -263,6 +263,21 @@ read_only_rootfs_hook () {
>   		if [ -x ${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh ]; then
>   			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
>   		fi
> +	        # Generate ssh keys at rootfs time
> +		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
> +			[ -r ${IMAGE_ROOTFS}/etc/default/dropbear ] && . ${IMAGE_ROOTFS}/etc/default/dropbear
> +			DROPBEAR_RSAKEY_DEFAULT="/etc/dropbear/dropbear_rsa_host_key"
> +			DROPBEAR_DSSKEY_DEFAULT="/etc/dropbear/dropbear_dss_host_key"
> +			test -n "$DROPBEAR_RSAKEY" || DROPBEAR_RSAKEY=$DROPBEAR_RSAKEY_DEFAULT
> +			test -n "$DROPBEAR_DSSKEY" || DROPBEAR_DSSKEY=$DROPBEAR_DSSKEY_DEFAULT
> +			dropbearkey -t rsa -f ${IMAGE_ROOTFS}$DROPBEAR_RSAKEY
> +			dropbearkey -t dss -f ${IMAGE_ROOTFS}$DROPBEAR_DSSKEY
> +		fi
> +		if [ -d ${IMAGE_ROOTFS}/etc/ssh ]; then
> +			ssh-keygen -q -f ${IMAGE_ROOTFS}/etc/ssh/ssh_host_rsa_key -N '' -t rsa
> +			ssh-keygen -q -f ${IMAGE_ROOTFS}/etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa
> +			ssh-keygen -q -f ${IMAGE_ROOTFS}/etc/ssh/ssh_host_dsa_key -N '' -t dsa
> +		fi
>   	fi
>   }
>   
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> index ab2eefb..40dc4ca 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> @@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=e326045657e842541d3f35aada442507"
>   
>   PR = "r0"
>   
> -DEPENDS = "zlib openssl"
> +DEPENDS = "zlib openssl openssh-native"
> +DEPENDS_class-native = "zlib-native openssl-native"
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   
>   RPROVIDES_${PN}-ssh = "ssh"
> @@ -41,7 +42,7 @@ INITSCRIPT_PACKAGES = "${PN}-sshd"
>   INITSCRIPT_NAME_${PN}-sshd = "sshd"
>   INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
>   
> -PACKAGECONFIG ??= "tcp-wrappers"
> +PACKAGECONFIG_class-target ??= "tcp-wrappers"
>   PACKAGECONFIG[tcp-wrappers] = "--with-tcp-wrappers,,tcp-wrappers"
>   
>   inherit autotools
> @@ -49,6 +50,7 @@ inherit autotools
>   # LFS support:
>   CFLAGS += "-D__FILE_OFFSET_BITS=64"
>   export LD = "${CC}"
> +export LD_class-native = "${CC}"
>   
>   EXTRA_OECONF = "--with-rand-helper=no \
>                   ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)} \
> @@ -74,7 +76,7 @@ do_compile_append () {
>   	install -m 0644 ${WORKDIR}/ssh_config ${S}/
>   }
>   
> -do_install_append () {
> +do_install_append_class-target () {
>   	for i in ${DISTRO_FEATURES};
>   	do
>   		if [ ${i} = "pam" ];  then
> @@ -102,6 +104,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
>   
>   RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>   RDEPENDS_${PN}-sshd += "${PN}-keygen"
> +RDEPENDS_${PN}_class-native = ""
>   
>   CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
>   CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
> @@ -110,3 +113,4 @@ ALTERNATIVE_PRIORITY = "90"
>   ALTERNATIVE_${PN}-scp = "scp"
>   ALTERNATIVE_${PN}-ssh = "ssh"
>   
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
> index be93d60..381b8aa 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -9,11 +9,13 @@ INC_PR = "r1"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5b0c2f0d0c49dfde9558ae2036683c"
>   
> -DEPENDS = "zlib"
> +DEPENDS = "zlib dropbear-native"
>   RPROVIDES_${PN} = "ssh sshd"
>   
>   DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
>   
> +DEPENDS_class-native = "zlib-native"
> +
>   SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
>              file://0001-urandom-xauth-changes-to-options.h.patch \
>              file://0002-static_build_fix.patch \
> @@ -88,3 +90,5 @@ pkg_postrm_append_${PN} () {
>           rm ${sysconfdir}/dropbear/dropbear_dss_host_key
>     fi
>   }
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-core/dropbear/dropbear/init b/meta/recipes-core/dropbear/dropbear/init
> index e8fed3f..5140b0b 100755
> --- a/meta/recipes-core/dropbear/dropbear/init
> +++ b/meta/recipes-core/dropbear/dropbear/init
> @@ -28,23 +28,8 @@ test "$NO_START" = "0" || exit 0
>   test -x "$DAEMON" || exit 0
>   test ! -h /var/service/dropbear || exit 0
>   
> -readonly_rootfs=0
> -for flag in `awk '{ if ($2 == "/") { split($4,FLAGS,",") } }; END { for (f in FLAGS) print FLAGS[f] }' </proc/mounts`; do
> -  case $flag in
> -   ro)
> -     readonly_rootfs=1
> -     ;;
> -  esac
> -done
> -
> -if [ $readonly_rootfs = "1" ]; then
> -  mkdir -p /var/lib/dropbear
> -  DROPBEAR_RSAKEY_DEFAULT="/var/lib/dropbear/dropbear_rsa_host_key"
> -  DROPBEAR_DSSKEY_DEFAULT="/var/lib/dropbear/dropbear_dss_host_key"
> -else
> -  DROPBEAR_RSAKEY_DEFAULT="/etc/dropbear/dropbear_rsa_host_key"
> -  DROPBEAR_DSSKEY_DEFAULT="/etc/dropbear/dropbear_dss_host_key"
> -fi
> +DROPBEAR_RSAKEY_DEFAULT="/etc/dropbear/dropbear_rsa_host_key"
> +DROPBEAR_DSSKEY_DEFAULT="/etc/dropbear/dropbear_dss_host_key"
>   
>   test -z "$DROPBEAR_BANNER" || \
>     DROPBEAR_EXTRA_ARGS="$DROPBEAR_EXTRA_ARGS -b $DROPBEAR_BANNER"


