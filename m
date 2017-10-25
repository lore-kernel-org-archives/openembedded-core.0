Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1544A62134
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 10:13:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q124so852508wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Oct 2017 03:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Q6wD/PoHlNLvJbDlk1hs6Dwt7+ChoeEk2db7YqQs16c=;
	b=sJ7Q21iAguL9tbySurQC460emziuKunptaVP+uFPnrGavC78WwCvy8yfYU/XNgGPch
	t+M4RdZ7PDv6s4tWmcTALTWb9wrvPZodCfjigTEgYmDo7fLEjbLPvHwcRXmLOzHtd+qU
	0xp7M0GsA283EFUYy/HceyIWb2VbZY3yVHmDFS92pFHxgJ130uj+A2zxsJszlMZlDCJg
	3B7bda+KcSrnXNlc/yLAGFMIvCsbdztIe+dNFeRFYnB0ah6ZnJnJQmaa5Q9o7gdgbLaQ
	7Azlo7BqjAFdWf6ZHGOrF0OTBA+Eq/1tXn4BAjo+AE5Nib0jsocn7ago2O5aNOhvvkOU
	k1rA==
X-Gm-Message-State: AMCzsaX4K4CPb9elIcdI2CqG8SUx4iCwv01H+lGFKbw3QrlmoN0tcIHE
	CeHQQDkZxjgNtjeDoTyijUzVPBLV
X-Google-Smtp-Source: ABhQp+RpW8HmZ1j7kg6ZVW98FqyLR1kL8rFNAmYm4OKg0ch/HpSMhQQT4nbqVv9xh9HzLYhy4qyiiw==
X-Received: by 10.28.132.73 with SMTP id g70mr1202276wmd.33.1508926409472;
	Wed, 25 Oct 2017 03:13:29 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a79sm2158996wma.14.2017.10.25.03.13.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Oct 2017 03:13:28 -0700 (PDT)
Message-ID: <1508926407.13607.53.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Oct 2017 11:13:27 +0100
In-Reply-To: <20171025073248.24161-1-thomas.perrot@tupi.fr>
References: <20171025073248.24161-1-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][PATCH 1/2] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 25 Oct 2017 10:13:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-10-25 at 09:32 +0200, Thomas Perrot wrote:
> - Bad image type replacement for aarch64
> - Fix DTB path in fitimage.its

It doesn't look like the DTB bit is still relevant in this commit.

> - Ignore fitImage type in do_bundle_initramfs task because the packaging
> is made by do_assemble_fitimage_initramfs
> - the images for arm64 are not compressed the linux_comp variable must
> therefore be none

I think it would also make sense to split this into multiple commits, as
your aarch64 fixes and fitimage fixes aren't directly related.

> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass |  7 +++++--
>  meta/classes/kernel-uboot.bbclass    | 11 ++++++++---
>  meta/classes/kernel.bbclass          |  4 +++-
>  3 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index 179185b6b2..0789ba611f 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -7,10 +7,13 @@ python __anonymous () {
>          depends = "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>  
> -        if d.getVar("UBOOT_ARCH") == "mips":
> +        uarch = d.getVar("UBOOT_ARCH")
> +        if uarch == "mips":
>              replacementtype = "vmlinuz.bin"
> -        elif d.getVar("UBOOT_ARCH") == "x86":
> +        elif uarch == "x86":
>              replacementtype = "bzImage"
> +        elif uarch == "arm64":
> +            replacementtype = "Image"

Can you keep these tests in alphabetical order please?

>          else:
>              replacementtype = "zImage"
>  
> diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-
> uboot.bbclass
> index 87f02654fa..06d293039a 100644
> --- a/meta/classes/kernel-uboot.bbclass
> +++ b/meta/classes/kernel-uboot.bbclass
> @@ -1,5 +1,5 @@
>  uboot_prep_kimage() {
> -	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
> +	if [ -e arch/${ARCH}/boot/compressed/vmlinux ] ; then
>  		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
>  		linux_suffix=""
>  		linux_comp="none"
> @@ -11,8 +11,13 @@ uboot_prep_kimage() {
>  		linux_comp="none"
>  	else
>  		vmlinux_path="vmlinux"
> -		linux_suffix=".gz"
> -		linux_comp="gzip"
> +		if [ "${ARCH}" = "arm64" ] ; then
> +			linux_suffix=""
> +			linux_comp="none"
> +		else
> +			linux_suffix=".gz"
> +			linux_comp="gzip"
> +		fi
>  	fi

I believe U-Boot supports decompression on any architecture independent of
kernel decompression support. It also supports multiple decompressors, not
just gzip. It would make sense to rather be able to configure the
compression method for U-Boot in a more generic way (including turning it
off completely) for any supported target.


Cheers,
Andre'


