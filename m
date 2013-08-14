Return-Path: <andre.draszik@linaro.org>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4ECA86A457
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 07:32:26 +0000 (UTC)
Received: by mail-bk0-f52.google.com with SMTP id e11so2972632bkh.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 00:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:content-type:content-transfer-encoding:mime-version;
	bh=WLxuAW72xA2HNiti9z5JrVQonwRS82+RBtdcqSq9pFA=;
	b=OKG4bfix2/nedNZ2xZ7afR3/eAS/8ItdJEYkhqgp53xlse/kEhwYHRxH+Rvp35DJ8F
	vWvbRXEuwRgPXYDuuI2hif0Su4k3vMSC7ocKV4XW1KcfV6wAQkhfifuzBoiqzwlIGPom
	R3fVnd8oSytsFdcza/epAwMXXXES+EyizbuPnEzmqC3xw57KVfYyt3WOAIhEMdkQY9t2
	TLqLtzz5PSyKKbf79kAX347smiCARur3xBlU6XhoMWrp8UpXQEEWfMydgpg8N55W54g8
	JWE+mmSJMExJYdF4Byqaofmm3bhgpJ9b+0DoeUtlzQTOSy3Y/yKclosb9pucRGZa1lGL
	FYLQ==
X-Gm-Message-State: ALoCoQnQkCOv5jmET/BWbZSg4sGAaS+ObYVDczheo1ca4KQJHUumjHSnVzPj3LTUlfFD9/1r70gU
X-Received: by 10.204.189.4 with SMTP id dc4mr5370244bkb.2.1376465546263;
	Wed, 14 Aug 2013 00:32:26 -0700 (PDT)
Received: from [10.65.4.44] (sushi.andred.org. [85.214.105.253])
	by mx.google.com with ESMTPSA id od6sm7254573bkb.11.2013.08.14.00.32.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 00:32:25 -0700 (PDT)
Message-ID: <1376465543.6373.132.camel@bril0118.bri.st.com>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 08:32:23 +0100
In-Reply-To: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
References: <1376401955-5676-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Subject: Re: [PATCH v2] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Wed, 14 Aug 2013 07:32:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

Can this please be pushed to dylan as well, please. It's a useful
change, and I then could remove my version of that patch from our
layer :-)


Cheers,
Andre'

On Tue, 2013-08-13 at 10:52 -0300, Otavio Salvador wrote:
> As the Linux kernel, unconditionally, builds the dtc application and
> it is the compatible version with the DeviceTree files shipped within
> the kernel it is better to use it and the kernel build system to
> generate the dtb files.
> 
> Some DeviceTree files rely on CPP and kernel headers to be able to
> generate the dtb binary contents and it is harder to replicate it
> outside of Linux kernel build system so we /use/ it.
> 
> To comply with these assumptions we need to use the dtb file when
> calling 'make' instead of pointing to the DeviceTree source file; the
> code has been made backward compatible but it is advised to move to
> the new definition to avoid warnings as:
> 
> ,----[ Original definition ]
> | KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/imx6q-sabresd.dts"
> `----
> 
> Becomes:
> 
> ,----[ New definition ]
> | KERNEL_DEVICETREE = "imx6q-sabresd.dtb"
> `----
> 
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> Changes in v2:
> - Drop debug warning left by mistake
> - Improve bbwarn message (Bruce Ashfield)
> - Improve commit log (Bruce Ascfield)
> 
>  meta/recipes-kernel/linux/linux-dtb.inc | 58 +++++++++++++++------------------
>  1 file changed, 26 insertions(+), 32 deletions(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 41dd599..cebc76a 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -1,44 +1,38 @@
>  # Support for device tree generation
>  FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
> -KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
>  
>  python __anonymous () {
> -    devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
> -    if devicetree:
> -        depends = d.getVar("DEPENDS", True)
> -        d.setVar("DEPENDS", "%s dtc-native" % depends)
> -        packages = d.getVar("PACKAGES", True)
> -        d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
> +    d.appendVar("PACKAGES", " kernel-devicetree")
>  }
>  
>  do_install_append() {
>  	if test -n "${KERNEL_DEVICETREE}"; then
> -		for DTS_FILE in ${KERNEL_DEVICETREE}; do
> -			if [ ! -f ${DTS_FILE} ]; then
> -				echo "Warning: ${DTS_FILE} is not available!"
> -				continue
> +		for DTB in ${KERNEL_DEVICETREE}; do
> +			if echo ${DTB} | grep -q '/dts/'; then
> +				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
> +				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>  			fi
> -			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> -			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> -			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
> -			install -m 0644 ${DTS_BASE_NAME} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
> +			DTB_BASE_NAME=`basename ${DTB} .dtb`
> +			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +			oe_runmake ${DTB}
> +			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
>  		done
>  	fi
>  }
>  
>  do_deploy_append() {
>  	if test -n "${KERNEL_DEVICETREE}"; then
> -		for DTS_FILE in ${KERNEL_DEVICETREE}; do
> -			if [ ! -f ${DTS_FILE} ]; then
> -				echo "Warning: ${DTS_FILE} is not available!"
> -				continue
> +		for DTB in ${KERNEL_DEVICETREE}; do
> +			if echo ${DTB} | grep -q '/dts/'; then
> +				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
> +				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>  			fi
> -			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> -			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> +			DTB_BASE_NAME=`basename ${DTB} .dtb`
> +			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
>  			install -d ${DEPLOYDIR}
> -			install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
> +			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${DEPLOYDIR}/${DTB_NAME}.dtb
>  			cd ${DEPLOYDIR}
>  			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
>  			cd -
> @@ -48,20 +42,20 @@ do_deploy_append() {
>  
>  pkg_postinst_kernel-devicetree () {
>  	cd /${KERNEL_IMAGEDEST}
> -	for DTS_FILE in ${KERNEL_DEVICETREE}
> +	for DTB_FILE in ${KERNEL_DEVICETREE}
>  	do
> -		DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> -		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
> +		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>  	done
>  }
>  
>  pkg_postrm_kernel-devicetree () {
>  	cd /${KERNEL_IMAGEDEST}
> -	for DTS_FILE in ${KERNEL_DEVICETREE}
> +	for DTB_FILE in ${KERNEL_DEVICETREE}
>  	do
> -		DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
> -		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> -		update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> +		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
> +		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
> +		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
>  	done
>  }



