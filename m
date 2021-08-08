Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.13568.1628450357313667794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 12:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CA3DE20003;
	Sun,  8 Aug 2021 19:19:14 +0000 (UTC)
Date: Sun, 8 Aug 2021 21:19:14 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] kernel-fitimage: images should not be signed with the same keys as the configurations
Message-ID: <YRAuMiM44mQ/oMnM@piout.net>
References: <20210806161038.1593772-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20210806161038.1593772-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On 06/08/2021 18:10:38+0200, Thomas Perrot wrote:
> Otherwise the "required" property, from UBOOT_DTB_BINARY, will be set to "conf"
> and no error will be raised in case of error.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 40 ++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index a9d1002200c9..72f692e40e63 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -60,6 +60,14 @@ FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
>  # Sign individual images as well
>  FIT_SIGN_INDIVIDUAL ?= "0"
>  
> +# Keys used to sign individually images nodes.
> +# The keys to sign images nodes must be different from those used to sign
> +# configurations nodes, otherwise the "required" property, from
> +# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails on "image".
> +# Then images signature checking will not be mandatory and no error will be
> +# raised.
> +# UBOOT_SIGN_IMG_KEYNAME = "dev2" # keys name in keydir (eg. "dev2.crt", "dev2.key")
> +
>  #
>  # Emit the fitImage ITS header
>  #
> @@ -121,7 +129,7 @@ fitimage_emit_section_kernel() {
>  
>  	kernel_csum="${FIT_HASH_ALG}"
>  	kernel_sign_algo="${FIT_SIGN_ALG}"
> -	kernel_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> +	kernel_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
>  
>  	ENTRYPOINT="${UBOOT_ENTRYPOINT}"
>  	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> @@ -167,7 +175,7 @@ fitimage_emit_section_dtb() {
>  
>  	dtb_csum="${FIT_HASH_ALG}"
>  	dtb_sign_algo="${FIT_SIGN_ALG}"
> -	dtb_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> +	dtb_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
>  
>  	dtb_loadline=""
>  	dtb_ext=${DTB##*.}
> @@ -214,7 +222,7 @@ fitimage_emit_section_boot_script() {
>  
>          bootscr_csum="${FIT_HASH_ALG}"
>  	bootscr_sign_algo="${FIT_SIGN_ALG}"
> -	bootscr_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> +	bootscr_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
>  
>          cat << EOF >> ${1}
>                  bootscr-${2} {
> @@ -278,7 +286,7 @@ fitimage_emit_section_ramdisk() {
>  
>  	ramdisk_csum="${FIT_HASH_ALG}"
>  	ramdisk_sign_algo="${FIT_SIGN_ALG}"
> -	ramdisk_sign_keyname="${UBOOT_SIGN_KEYNAME}"
> +	ramdisk_sign_keyname="${UBOOT_SIGN_IMG_KEYNAME}"
>  	ramdisk_loadline=""
>  	ramdisk_entryline=""
>  
> @@ -475,6 +483,10 @@ fitimage_assemble() {
>  	bootscr_id=""
>  	rm -f ${1} arch/${ARCH}/boot/${2}
>  
> +	if [ "${UBOOT_SIGN_KEYNAME}" = "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
> +		bbfatal "Keys used to sign images and configuration nodes must be different."

This breaks oe-selftest, as seen in:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2383/steps/14/logs/stdio


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
