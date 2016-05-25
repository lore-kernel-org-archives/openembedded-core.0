Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id E06CB601D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 22:39:03 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3rFRrj1MQMz3hjXS;
	Thu, 26 May 2016 00:33:41 +0200 (CEST)
X-Auth-Info: /g9zv2dTB+jaq6QPUJSLX3k9XXDH5AbfEIg16I1AYdc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3rFRrj08STzvdWS; 
	Thu, 26 May 2016 00:33:40 +0200 (CEST)
Message-ID: <57462849.1040004@denx.de>
Date: Thu, 26 May 2016 00:33:45 +0200
From: Marek Vasut <marex@denx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: George McCollister <george.mccollister@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <1464132351-7955-1-git-send-email-george.mccollister@gmail.com>
In-Reply-To: <1464132351-7955-1-git-send-email-george.mccollister@gmail.com>
Subject: Re: [PATCH] kernel-fitimage: add initramfs support
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
X-List-Received-Date: Wed, 25 May 2016 22:39:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 05/25/2016 01:25 AM, George McCollister wrote:
> If INITRAMFS_IMAGE is set, build an additional fitImage containing the
> initramfs. Copy the additional fitImage and the source .its file used to
> create it to DEPLOYDIR. The fitImage containing the initramfs must be
> built before do_deploy and after do_install to avoid circular dependencies.

Yes, the circular dep is quite nasty.

> UBOOT_RD_LOADADDRESS - Specifies the load address used by u-boot for the
>                        initramfs.
> UBOOT_RD_ENTRYPOINT  - Specifies the entry point used by u-boot for the
>                        initramfs.
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 275 +++++++++++++++++++++++------------
>  1 file changed, 180 insertions(+), 95 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 298eda2..2c2a642 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -14,7 +14,7 @@ python __anonymous () {
>  
>          image = d.getVar('INITRAMFS_IMAGE', True)
>          if image:
> -            d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> +            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
>  
>          # Verified boot will sign the fitImage and append the public key to
>          # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
> @@ -30,8 +30,9 @@ UBOOT_MKIMAGE_DTCOPTS ??= ""
>  #
>  # Emit the fitImage ITS header
>  #
> +# $1 ... .its filename
>  fitimage_emit_fit_header() {
> -	cat << EOF >> fit-image.its
> +	cat << EOF >> ${1}
>  /dts-v1/;
>  
>  / {
> @@ -43,32 +44,33 @@ EOF
>  #
>  # Emit the fitImage section bits
>  #
> -# $1 ... Section bit type: imagestart - image section start
> +# $1 ... .its filename
> +# $2 ... Section bit type: imagestart - image section start
>  #                          confstart  - configuration section start
>  #                          sectend    - section end
>  #                          fitend     - fitimage end
>  #
>  fitimage_emit_section_maint() {
> -	case $1 in
> +	case $2 in
>  	imagestart)
> -		cat << EOF >> fit-image.its
> +		cat << EOF >> ${1}
>  
>          images {
>  EOF
>  	;;
>  	confstart)
> -		cat << EOF >> fit-image.its
> +		cat << EOF >> ${1}
>  
>          configurations {
>  EOF
>  	;;
>  	sectend)
> -		cat << EOF >> fit-image.its
> +		cat << EOF >> ${1}
>  	};
>  EOF
>  	;;
>  	fitend)
> -		cat << EOF >> fit-image.its
> +		cat << EOF >> ${1}
>  };
>  EOF
>  	;;

OK

> @@ -78,9 +80,10 @@ EOF
>  #
>  # Emit the fitImage ITS kernel section
>  #
> -# $1 ... Image counter
> -# $2 ... Path to kernel image
> -# $3 ... Compression type
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to kernel image
> +# $4 ... Compression type
>  fitimage_emit_section_kernel() {
>  
>  	kernel_csum="sha1"
> @@ -88,17 +91,17 @@ fitimage_emit_section_kernel() {
>  	ENTRYPOINT=${UBOOT_ENTRYPOINT}
>  	if test -n "${UBOOT_ENTRYSYMBOL}"; then
>  		ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> -			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
> +			awk '$4=="${UBOOT_ENTRYSYMBOL}" {print $2}'`
>  	fi
>  
> -	cat << EOF >> fit-image.its
> -                kernel@${1} {
> +	cat << EOF >> ${1}
> +                kernel@${2} {
>                          description = "Linux kernel";
> -                        data = /incbin/("${2}");
> +                        data = /incbin/("${3}");
>                          type = "kernel";
>                          arch = "${UBOOT_ARCH}";
>                          os = "linux";
> -                        compression = "${3}";
> +                        compression = "${4}";
>                          load = <${UBOOT_LOADADDRESS}>;
>                          entry = <${ENTRYPOINT}>;
>                          hash@1 {

OK

> @@ -111,16 +114,17 @@ EOF
>  #
>  # Emit the fitImage ITS DTB section
>  #
> -# $1 ... Image counter
> -# $2 ... Path to DTB image
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to DTB image
>  fitimage_emit_section_dtb() {
>  
>  	dtb_csum="sha1"
>  
> -	cat << EOF >> fit-image.its
> -                fdt@${1} {
> +	cat << EOF >> ${1}
> +                fdt@${2} {
>                          description = "Flattened Device Tree blob";
> -                        data = /incbin/("${2}");
> +                        data = /incbin/("${3}");
>                          type = "flat_dt";
>                          arch = "${UBOOT_ARCH}";
>                          compression = "none";

OK

> @@ -132,10 +136,39 @@ EOF
>  }
>  
>  #
> +# Emit the fitImage ITS ramdisk section
> +#
> +# $1 ... .its filename
> +# $2 ... Image counter
> +# $3 ... Path to ramdisk image
> +fitimage_emit_section_ramdisk() {
> +
> +	ramdisk_csum="sha1"
> +
> +	cat << EOF >> ${1}
> +                ramdisk@${2} {
> +                        description = "ramdisk image";
> +                        data = /incbin/("${3}");
> +                        type = "ramdisk";
> +                        arch = "${UBOOT_ARCH}";
> +                        os = "linux";

Do you need to set this for ramdisk ?

> +                        compression = "none";
> +                        load = <${UBOOT_RD_LOADADDRESS}>;
> +                        entry = <${UBOOT_RD_ENTRYPOINT}>;
> +                        hash@1 {
> +                                algo = "${ramdisk_csum}";
> +                        };
> +                };
> +EOF
> +}
> +
> +#
>  # Emit the fitImage ITS configuration section
>  #
> -# $1 ... Linux kernel ID
> -# $2 ... DTB image ID
> +# $1 ... .its filename
> +# $2 ... Linux kernel ID
> +# $3 ... DTB image ID
> +# $4 ... ramdisk ID
>  fitimage_emit_section_config() {
>  
>  	conf_csum="sha1"
> @@ -144,21 +177,29 @@ fitimage_emit_section_config() {
>  	fi
>  
>  	# Test if we have any DTBs at all
> -	if [ -z "${2}" ] ; then
> +	if [ -z "${3}" ] ; then
>  		conf_desc="Boot Linux kernel"
>  		fdt_line=""
> -	else
> +		ramdisk_line=""
> +	elif [ -z "${4}" ]; then
>  		conf_desc="Boot Linux kernel with FDT blob"
> -		fdt_line="fdt = \"fdt@${2}\";"
> +		fdt_line="fdt = \"fdt@${3}\";"
> +		ramdisk_line=""
> +	else
> +		# TODO - handle ramdisk without FDT blob

I really don't like the todo here :) Maybe you can check if the DT image
ends with .dtb or not to discern ramdisk and DT ?

> +		conf_desc="Boot Linux kernel with FDT blob, ramdisk"
> +		fdt_line="fdt = \"fdt@${3}\";"
> +		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
>  	fi
> -	kernel_line="kernel = \"kernel@${1}\";"
> +	kernel_line="kernel = \"kernel@${2}\";"
>  
> -	cat << EOF >> fit-image.its
> +	cat << EOF >> ${1}
>                  default = "conf@1";
>                  conf@1 {
>                          description = "${conf_desc}";
>  			${kernel_line}
>  			${fdt_line}
> +			${ramdisk_line}
>                          hash@1 {
>                                  algo = "${conf_csum}";
>                          };
> @@ -166,102 +207,131 @@ EOF
>  
>  	if [ ! -z "${conf_sign_keyname}" ] ; then
>  
> -		if [ -z "${2}" ] ; then
> +		if [ -z "${3}" ] ; then
>  			sign_line="sign-images = \"kernel\";"
> -		else
> +		elif [ -z "${4}" ]; then
>  			sign_line="sign-images = \"fdt\", \"kernel\";"
> +		else
> +			sign_line="sign-images = \"ramdisk\", \"fdt\", \"kernel\";"
>  		fi
>  
> -		cat << EOF >> fit-image.its
> +		cat << EOF >> ${1}
>                          signature@1 {
>                                  algo = "${conf_csum},rsa2048";
>                                  key-name-hint = "${conf_sign_keyname}";
> -                                sign-images = "fdt", "kernel";
> +                                ${sign_line}
>                          };
>  EOF
>  	fi
>  
> -	cat << EOF >> fit-image.its
> +	cat << EOF >> ${1}
>                  };

OK

>  EOF
>  }
>  
> -do_assemble_fitimage() {
> -	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> -		kernelcount=1
> -		dtbcount=""
> -		rm -f fit-image.its arch/${ARCH}/boot/fitImage
> -
> -		fitimage_emit_fit_header
> -
> -		#
> -		# Step 1: Prepare a kernel image section.
> -		#
> -		fitimage_emit_section_maint imagestart
> -
> -		uboot_prep_kimage
> -		fitimage_emit_section_kernel "${kernelcount}" linux.bin "${linux_comp}"
> -
> -		#
> -		# Step 2: Prepare a DTB image section
> -		#
> -		if test -n "${KERNEL_DEVICETREE}"; then
> -			dtbcount=1
> -			for DTB in ${KERNEL_DEVICETREE}; do
> -				if echo ${DTB} | grep -q '/dts/'; then
> -					bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
> -					DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> -				fi
> -				DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
> -				if [ ! -e "${DTB_PATH}" ]; then
> -					DTB_PATH="arch/${ARCH}/boot/${DTB}"
> -				fi
> -
> -				fitimage_emit_section_dtb ${dtbcount} ${DTB_PATH}
> -				dtbcount=`expr ${dtbcount} + 1`
> -			done
> -		fi
> +#
> +# Assemble fitImage
> +#
> +# $1 ... .its filename
> +# $2 ... fitImage name
> +# $3 ... include ramdisk
> +fitimage_assemble() {
> +	kernelcount=1
> +	dtbcount=""
> +	ramdiskcount=${3}
> +	rm -f ${1} arch/${ARCH}/boot/${2}
> +
> +	fitimage_emit_fit_header ${1}
> +
> +	#
> +	# Step 1: Prepare a kernel image section.
> +	#
> +	fitimage_emit_section_maint ${1} imagestart
> +
> +	uboot_prep_kimage
> +	fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
> +
> +	#
> +	# Step 2: Prepare a DTB image section
> +	#
> +	if test -n "${KERNEL_DEVICETREE}"; then
> +		dtbcount=1
> +		for DTB in ${KERNEL_DEVICETREE}; do
> +			if echo ${DTB} | grep -q '/dts/'; then
> +				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
> +				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
> +			fi
> +			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
> +			if [ ! -e "${DTB_PATH}" ]; then
> +				DTB_PATH="arch/${ARCH}/boot/${DTB}"
> +			fi
> +
> +			fitimage_emit_section_dtb ${1} ${dtbcount} ${DTB_PATH}
> +			dtbcount=`expr ${dtbcount} + 1`
> +		done
> +	fi
>  
> -		fitimage_emit_section_maint sectend
> +	#
> +	# Step 3: Prepare a ramdisk section.
> +	#
> +	if [ "x${ramdiskcount}" = "x1" ] ; then
> +		copy_initramfs
> +		fitimage_emit_section_ramdisk ${1} "${ramdiskcount}" ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
> +	fi
>  
> -		# Force the first Kernel and DTB in the default config
> -		kernelcount=1
> -		dtbcount=1
> +	fitimage_emit_section_maint ${1} sectend
> +
> +	# Force the first Kernel and DTB in the default config
> +	kernelcount=1
> +	dtbcount=1
>  
> -		#
> -		# Step 3: Prepare a configurations section
> -		#
> -		fitimage_emit_section_maint confstart
> +	#
> +	# Step 4: Prepare a configurations section
> +	#
> +	fitimage_emit_section_maint ${1} confstart
>  
> -		fitimage_emit_section_config ${kernelcount} ${dtbcount}
> +	fitimage_emit_section_config ${1} ${kernelcount} ${dtbcount} ${ramdiskcount}
>  
> -		fitimage_emit_section_maint sectend
> +	fitimage_emit_section_maint ${1} sectend
>  
> -		fitimage_emit_section_maint fitend
> +	fitimage_emit_section_maint ${1} fitend
>  
> -		#
> -		# Step 4: Assemble the image
> -		#
> +	#
> +	# Step 5: Assemble the image
> +	#
> +	uboot-mkimage \
> +		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> +		-f ${1} \
> +		arch/${ARCH}/boot/${2}
> +
> +	#
> +	# Step 6: Sign the image and add public key to U-Boot dtb
> +	#
> +	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
>  		uboot-mkimage \
>  			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> -			-f fit-image.its \
> -			arch/${ARCH}/boot/fitImage
> -
> -		#
> -		# Step 5: Sign the image and add public key to U-Boot dtb
> -		#
> -		if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
> -			uboot-mkimage \
> -				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> -				-F -k "${UBOOT_SIGN_KEYDIR}" \
> -				-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}" \
> -				-r arch/${ARCH}/boot/fitImage
> -		fi
> +			-F -k "${UBOOT_SIGN_KEYDIR}" \
> +			-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}" \
> +			-r arch/${ARCH}/boot/${2}
> +	fi
> +}
> +
> +do_assemble_fitimage() {
> +	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
> +		fitimage_assemble fit-image.its fitImage
>  	fi
>  }
>  
>  addtask assemble_fitimage before do_install after do_compile
>  
> +do_assemble_fitimage_initramfs() {
> +	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" -a -n "${INITRAMFS_IMAGE}" ; then
> +		fitimage_assemble fit-image-${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
> +	fi
> +}
> +
> +addtask assemble_fitimage_initramfs before do_deploy after do_install
> +
>  kernel_do_deploy[vardepsexclude] = "DATETIME"
>  kernel_do_deploy_append() {
>  	# Update deploy directory
> @@ -275,8 +345,23 @@ kernel_do_deploy_append() {
>  		linux_bin_symlink_name=${KERNEL_IMAGETYPE}-linux.bin-${MACHINE}
>  		install -m 0644 linux.bin ${DEPLOYDIR}/${linux_bin_base_name}.bin
>  
> +		if [ -n "${INITRAMFS_IMAGE}" ]; then
> +			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
> +			its_initramfs_base_name="${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +			its_initramfs_symlink_name=${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${MACHINE}
> +			install -m 0644 fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/${its_initramfs_base_name}.its
> +			fit_initramfs_base_name="${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +			fit_initramfs_symlink_name=${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${MACHINE}
> +			install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin
> +		fi
> +
>  		cd ${DEPLOYDIR}
>  		ln -sf ${its_base_name}.its ${its_symlink_name}.its
>  		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
> +
> +		if [ -n "${INITRAMFS_IMAGE}" ]; then
> +			ln -sf ${its_initramfs_base_name}.its ${its_initramfs_symlink_name}.its
> +			ln -sf ${fit_initramfs_base_name}.bin ${fit_initramfs_symlink_name}.bin
> +		fi
>  	fi
>  }
> 
Cool stuff, thanks!

-- 
Best regards,
Marek Vasut

