Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B7C356FF01
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 14:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 092893141DFF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:30:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id lWIzV5K2whLh
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:30:24 +0200 (CEST)
Received: from [172.22.22.61] (55d413ac.access.ecotel.net [85.212.19.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 671823141DFD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:30:24 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <571640FF.4040000@opendreambox.org>
Date: Tue, 19 Apr 2016 16:30:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1461070003-12494-2-git-send-email-yannick.gicquel@iot.bzh>
Subject: Re: [RFC PATCH 1/4] u-boot: basic support of device tree blob reassembly
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
X-List-Received-Date: Tue, 19 Apr 2016 14:30:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Yannick,

On 19.04.2016 14:46, Yannick Gicquel wrote:
> This introduces a new task 'assemble_dtb' to handle the concatenation of U-Boot
> without DTB and the compiled U-Boot DTB while using CONFIG_OF_SEPARATE.
> Basically, this task merges the u-boot-nodtb.bin and the device tree blob using
> the 'cat' command and overrides the u-boot.bin file which is generated
> at the compilation step.
> 
> This task is intended to be used in the verified-boot image generation process
> after the kernel-fitimage class had appended a public key to the device tree
> blob. It is placed after the do_deploy and before the do_install tasks and it
> replaces the u-boot binaries in both deploy directory and build directory
> in order to minimize the changes in later tasks.
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
> ---
>  meta/recipes-bsp/u-boot/u-boot-sign.inc | 21 +++++++++++++++++++++
>  meta/recipes-bsp/u-boot/u-boot.inc      | 22 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-sign.inc
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-sign.inc b/meta/recipes-bsp/u-boot/u-boot-sign.inc
> new file mode 100644
> index 0000000..c88a2a1
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot-sign.inc
> @@ -0,0 +1,21 @@
> +# This file is part of U-Boot verified boot support and is intended to be
> +# included from u-boot recipe and from kernel-fitimage.bbclass
> +#
> +# The signature procedure requires the user to generate an RSA key and
> +# certificate in a directory and to define the following variable:
> +#
> +# UBOOT_SIGN_KEYDIR = "/keys/directory"
> +# UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
> +# UBOOT_SIGN_ENABLE = "1"
> +#
> +# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
> +#
> +# For more details, please refer to U-boot documentation.
> +
> +UBOOT_SIGN_ENABLE ?= "0"
> +UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
> +UBOOT_DTB_BINARY ?= "u-boot.dtb"
> +UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
> +UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
> +UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
> +UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 3ba866d..29b0b95 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -65,6 +65,28 @@ UBOOT_ENV_BINARY ?= "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
>  UBOOT_ENV_IMAGE ?= "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SUFFIX}"
>  UBOOT_ENV_SYMLINK ?= "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
>  
> +# The use of verified boot requires to share environment variables with kernel
> +# fitImage class as the mkimage call requires dtb filepath to append signature
> +# public key.
> +require u-boot-sign.inc
> +
> +do_assemble_dtb() {
> +	# Concatenate U-Boot w/o DTB & DTB with public key
> +	# (cf. kernel-fitimage.bbclass for more details)
> +	cd ${DEPLOYDIR}
> +	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
> +		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
> +			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${S}/${UBOOT_BINARY}

in general, you should avoid writing to ${S} (source). It's better to
write to ${B} (build).

> +		else
> +			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
> +		fi
> +	fi
> +}
> +
> +addtask assemble_dtb after do_deploy before do_install

The task do_deploy executes after do_install. Does it really work this
way? I think bitbake should try to detect this and error out.

Maybe you could just use do_install_append and add the dependency below
to do_install.

Regards,
Andreas

> +do_assemble_dtb[depends] += "${@' ${PREFERRED_PROVIDER_virtual/kernel}:do_assemble_fitimage' if '${UBOOT_SIGN_ENABLE}' == '1' else ''}"
> +
>  do_compile () {
>  	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', 'ld-is-gold', '', d)}" = "ld-is-gold" ] ; then
>  		sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' config.mk
> 


