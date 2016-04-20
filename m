Return-Path: <denis@denix.org>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Apr 2016 20:50:28 UTC
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id A91F86011B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:50:28 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00H4Z73BLN30@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2016 14:49:59 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=Q4-j1AaZAAAA:8
	a=7pPrJlwx-VA8vtAjovYA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 439e2a7c; Wed, 20 Apr 2016 19:49:59 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C7988161FB3; Wed,
	20 Apr 2016 15:49:58 -0400 (EDT)
Date: Wed, 20 Apr 2016 15:49:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-id: <20160420194958.GP16135@denix.org>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
MIME-version: 1.0
In-reply-to: <1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 20 Apr 2016 20:50:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Apr 20, 2016 at 03:50:36PM +0200, Yannick Gicquel wrote:
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
> +#
> +# Following is relevant only for u-boot recipes:
> +#
> +
> +do_install_prepend_pn-u-boot () {

Why _pn-u-boot here? What if I have my own version of u-boot recipe?


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
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

