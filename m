Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 004B478508
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:15:17 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id x17so27693wmd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 01:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Z3gYC6KvGvawvo/mkFYCA3/MYZIftOUnfofKRWLSCnE=;
	b=Sp332ZEonGJ6PcugsolRcpYr33qo0/CAyy+GOVR7Eo++n4dSeKBj9taECrnZ3Fi4xz
	f/qXgKGKgGqEqEtphjgo3VBjCeTe4pJuiJ69FeJxpxH3XxwVzeo79feNeGLszhIBGip8
	1q8toDu5tmasLqwAIVwrbtLU2FczoYEkmDlV6nH4UDoBJCbFUXmSKR4Tyz6r43JPXNl+
	JjkwIipyhBviMkorfzxKZpwdwFEynB1ELx0Ah+3LT0kHkc40JUct1Kgow6Du1RVLesGe
	2Cdw0sHFWt6hqtmkCE0JoYtMuO6Osw8K6HTYCNHkIT7wRvzUTGwSGsTh9Vb1BbXlszWE
	tcKw==
X-Gm-Message-State: AHPjjUhcSiEradol75kXe4Q+ZyGof1Eq52CQZqGx9+E/4SmQ0E7ogT6P
	Q/laDHWnz+VR4bT3paY=
X-Google-Smtp-Source: ADKCNb5XZCxtGo6sEIgzUD2M+ZESwE2LiSw9Bn1ajy5r0ev4WRtmE/zzxLPpLCYQXN1h0H8NG7J3dg==
X-Received: by 10.80.175.33 with SMTP id g30mr15179359edd.279.1505290517482;
	Wed, 13 Sep 2017 01:15:17 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id t5sm3209652edh.32.2017.09.13.01.15.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 01:15:16 -0700 (PDT)
Message-ID: <1505290515.32675.4.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 09:15:15 +0100
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
X-List-Received-Date: Wed, 13 Sep 2017 08:15:18 -0000
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

AFAICS, zImage is specific to x86 and arm, all other arches, including MIPS
have no zImage Makefile target, so we'll never get here.


Cheers,
Andre'


