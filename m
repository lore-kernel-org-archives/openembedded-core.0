Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2E00D71B69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 10:19:55 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id u48so1434312wrf.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 03:19:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4Oz4jq/AaooMWAvVVRfXz8nI9vISgZ4V2PtpkrDlTKA=;
	b=DRnrqift7nhuueDj2XBZvGWRKh+g1qDmJ6YE3ZbmYr2sbRy+zjxhd6KXYW+/UbNPjN
	C58IOileaC2euorc4h46DVHOnodIExzogXuMYHpwMW945UxgtovIDlXO8UgIMHbAnE5S
	hQ/zqLrahZLuayQjyTSNwO9JoB2mS5PrfHvDonbnJPXc1s6T9SUnUxtzCME8RXKeUwMV
	C+WAyNB3HjneE1mLnglMZBWDXiM8w3A/AIeqsLRphMWfb1mqBp6324d9RYQWAanz3Ym6
	I9rt7KVrkXq+igy5GI9rlqN86SF5YLaYs7PSlObidizSKhIK8ZESCmTkmp68Ip0nxFGZ
	SuTw==
X-Gm-Message-State: AHPjjUg+L0WjDbEUUpVijMINnU1pQihWFO5W07nLNcZaDfVUW+O9sNin
	1w1lCYrEhG+rOZ5B8Pk=
X-Google-Smtp-Source: ADKCNb4D8cwCftN1yznGLowayj5kX9nWgCpPSiv7oYE21Jx1Oo8kQEjiKBf9kywa6VcZA2puXCXeJA==
X-Received: by 10.223.147.166 with SMTP id 35mr20358422wrp.90.1505384396776;
	Thu, 14 Sep 2017 03:19:56 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 1sm995333wml.35.2017.09.14.03.19.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 03:19:55 -0700 (PDT)
Message-ID: <1505384395.19222.2.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 11:19:55 +0100
In-Reply-To: <20170912203608.14327-3-otavio@ossystems.com.br>
References: <20170912203608.14327-1-otavio@ossystems.com.br>
	<20170912203608.14327-3-otavio@ossystems.com.br>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Subject: Re: [PATCH v8 3/3] kernel-devicetree.bbclass: Add support to generate append to kernel
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
X-List-Received-Date: Thu, 14 Sep 2017 10:19:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-09-12 at 17:36 -0300, Otavio Salvador wrote:
> The are use cases where the Device Tree appended to the kernel is
> convinient, so we generate the bundle concatenating the kernel (and
> potentionally the initramfs) and the Device Tree binaries.
> 
> To enable it, set KERNEL_DEVICETREE_BUNDLE variable to '1'
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
> Changes in v8:
> - rework append support to support ARM and MIPS (obi)
> 
> Changes in v7:
> - simplified code
> - rename bundle to use .bin extension
> 
> Changes in v6: None
> Changes in v5:
> - add support for initramfs bundle
> 
> Changes in v4:
> - new patch
> 
> Changes in v3: None
> Changes in v2: None
> 
>  meta/classes/kernel-devicetree.bbclass | 62
> +++++++++++++++++++++++++++++++++-
>  1 file changed, 61 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-
> devicetree.bbclass
> index 8723f24212..c618594c96 100644
> --- a/meta/classes/kernel-devicetree.bbclass
> +++ b/meta/classes/kernel-devicetree.bbclass
> @@ -1,6 +1,13 @@
>  # Support for device tree generation
> -PACKAGES_append = " kernel-devicetree"
> +PACKAGES_append = " \
> +    kernel-devicetree \
> +    ${@['kernel-image-zimage-bundle',
> ''][d.getVar('KERNEL_DEVICETREE_BUNDLE') != '1']} \
> +"
>  FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb
> /${KERNEL_IMAGEDEST}/*.dtbo"
> +FILES_kernel-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-
> *.dtb.bin"
> +
> +# Generate kernel+devicetree bundle
> +KERNEL_DEVICETREE_BUNDLE ?= "0"
>  
>  normalize_dtb () {
>  	DTB="$1"
> @@ -20,6 +27,38 @@ get_real_dtb_path_in_kernel () {
>  	echo "${DTB_PATH}"
>  }
>  
> +
> +do_configure_devicetree() {
> +	if [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
> +		if echo ${KERNEL_IMAGETYPE_FOR_MAKE} | grep -q 'zImage';
> then
> +			case "${ARCH}" in
> +				"arm")
> +				config="${B}/.config"
> +				if ! grep -q 'CONFIG_ARM_APPENDED_DTB=y'
> $config; then
> +					bbwarn 'CONFIG_ARM_APPENDED_DTB
> is NOT enabled in the kernel. Enabling it to allow the kernel to boot with
> the Device Tree appended!'
> +					sed -i "/CONFIG_ARM_APPENDED_DTB[
> =]/d" $config
> +					echo "CONFIG_ARM_APPENDED_DTB=y"
> >> $config
> +					echo "#
> CONFIG_ARM_ATAG_DTB_COMPAT is not set" >> $config
> +				fi
> +				;;
> +				"mips")
> +				config="${B}/.config"
> +				if ! grep -q 'CONFIG_MIPS_APPENDED_DTB=y'
> $config; then

Looking more into this, this Kconfig option doesn't actually exist on mips.
Instead, it has these three related options:
CONFIG_MIPS_NO_APPENDED_DTB
CONFIG_MIPS_ELF_APPENDED_DTB
CONFIG_MIPS_RAW_APPENDED_DTB

I've never used this, but I think you'd have to check for
CONFIG_MIPS_RAW_APPENDED_DTB=y for similar semantics to arm.

And the KERNEL_IMAGETYPE_FOR_MAKE can be either vmlinux.bin, or vmlinuz.bin
(where vmlinuz.bin is similar to the arm zImage).

i.e.:
cat vmlinux.bin <filename>.dtb > vmlinux_w_dtb
cat vmlinuz.bin <filename>.dtb > vmlinuz_w_dtb


To also support CONFIG_MIPS_ELF_APPENDED_DTB, you'd have to

objcopy --update-section .appended_dtb=<filename>.dtb vmlinux

instead.


All untested.


Cheers,
Andre'


