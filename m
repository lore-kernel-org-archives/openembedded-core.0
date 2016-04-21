Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 83C7660249
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 14:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id A8B2C3141F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 16:06:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id acL0VsOiE-OG
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 16:06:32 +0200 (CEST)
Received: from [172.22.22.61] (55d441eb.access.ecotel.net [85.212.65.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E9B413141F54
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 16:06:31 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <5718DE65.1070402@opendreambox.org>
Date: Thu, 21 Apr 2016 16:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
Subject: Re: [RFC][PATCH v2 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Thu, 21 Apr 2016 14:06:40 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 20.04.2016 15:50, Yannick Gicquel wrote:
> This introduces a new uboot-sign.class to support U-Boot verified boot.
> 
> This part delivers the new class file, with related environment variables, and
> a basic prepend to do_install task which performs the concatenation of the
> u-boot-nodtb.bin and the device tree blob. The 'cat' command used
> overrides the u-boot.bin in both DEPLOYDIR & build dir to propagate the
> changes in later tasks (do_install, do_package, etc.)
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/classes/uboot-sign.bbclass    | 59 ++++++++++++++++++++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot.inc |  2 +-
>  2 files changed, 60 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes/uboot-sign.bbclass
> 
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
> new file mode 100644
> index 0000000..63a5181
> --- /dev/null
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -0,0 +1,59 @@
> +# This file is part of U-Boot verified boot support and is intended to be
> +# inherited from u-boot recipe and from kernel-fitimage.bbclass.
> +#
> +# The signature procedure requires the user to generate an RSA key and
> +# certificate in a directory and to define the following variable:
> +#
> +#   UBOOT_SIGN_KEYDIR = "/keys/directory"
> +#   UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
> +#   UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
> +#   UBOOT_SIGN_ENABLE = "1"
> +#
> +# As verified boot depends on fitImage generation, following is also required:
> +#
> +#   KERNEL_CLASSES ?= " kernel-fitimage "
> +#   KERNEL_IMAGETYPE ?= "fitImage"
> +#
> +# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
> +#
> +# The tasks sequence is as below, using DEPLOY_IMAGE_DIR as common place to
> +# treat the device tree blob:
> +#
> +# u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> u-boot:do_install
> +#
> +# For more details on signature process, please refer to U-boot documentation.
> +
> +# Signature activation.
> +UBOOT_SIGN_ENABLE ?= "0"
> +
> +# Default value for deployment filenames.
> +UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
> +UBOOT_DTB_BINARY ?= "u-boot.dtb"
> +UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
> +UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
> +UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
> +

I think you should split the file at this point and either put the lines
above into uboot-sign-base.bbclass and include it from here or put the
lines below into u-boot.inc directly. This way you don't add unnecessary
code for u-boot to kernel recipes, and lose the dependency on PN =
"u-boot" at the same time.

Regards,
Andreas

> +#
> +# Following is relevant only for u-boot recipes:
> +#
> +
> +do_install_prepend_pn-u-boot () {
> +	# Concatenate U-Boot w/o DTB & DTB with public key
> +	# (cf. kernel-fitimage.bbclass for more details)
> +	cd ${DEPLOYDIR}
> +	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
> +		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${B}/${UBOOT_BINARY}
> +		else
> +			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
> +		fi
> +	fi
> +}
> +
> +python () {
> +	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == 'u-boot':
> +		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
> +		d.appendVarFlag('do_install', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
> +}
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 3ba866d..037f35c 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> -inherit uboot-config deploy
> +inherit uboot-config uboot-sign deploy
>  
>  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
>  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> 


