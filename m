Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71A8C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 18:59:57 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.3459.1748890795971236972
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O7wxZnb3;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fac7147cb8so92826756d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748890795; x=1749495595; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfqQlLNNxpG+6tmHsOAMXz0DXcKyhJv/obr0CsMWmn0=;
        b=O7wxZnb3KzpqmElXqOwUJVnjHFQMY6e/DlSH6rnwxGSrupzZpspCyUCo2jzceCHDPv
         iud1EW6gYqgC9tm/xnJc/9y3tOC1i72WJiGeFzvGh+4U+gjHxKIwrdlkOE9Xe+geAPbO
         /lVoLv3WuWpQmTeyoABjuAU5hBM5NWxVrh3dr1vxRe0u4i2qOFMzg6iygwXQGig33xpC
         zUk1oCQZBXNKvjAk+6kYkZG+1PbQ/Cy20V7ffMiZdPyjayHlJ/lWfkRSK8QwhJhxA90u
         gCEpCRe4CzNrlc8KgbfybrbKU8JVMIX4HLVeE4bwNm+5kFTfaN3JqTmpvqQnIkKRdWvq
         D9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748890795; x=1749495595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfqQlLNNxpG+6tmHsOAMXz0DXcKyhJv/obr0CsMWmn0=;
        b=uG3QEzhFyoxAt7HF3VL4iu73GbxQNLkQeJ79cfp56Lyr+6XSr/UYyO/Qlo34aiB5gi
         Cgj2+sxsBUj1PmQuXxEBbK4rSGG+8Dzz7/+wHayHQsipqWgN8D/3R61VGE4fJWOaIZbB
         k7mOeB/s0cfqO0Huamf2Y0dOCCchNdc+I7X4jhHqf41StOWpWdwBWyq/bLjCWIhX6WKt
         bZINhQWoN1kGHxmbOek2oBuEbaOQ2f7TmFGukl3FtXVKbbd/UCIuZOv2zb8pM5JkkK68
         k7koth4ZrySUD4FTuu98pzQJTmQFYicnLfwbIaYzCXXWx3mCAvJRrBow482dowXPUt6I
         EV/g==
X-Gm-Message-State: AOJu0YwjKPrF4kcQ+s54kVpj7o1OKXMcTvk6IoiXo/Z0RLvSFIf0sUC7
	30wFbQARqDMdyLTCqSqgbxupTSW6yuD8IHYCyYr99PAm4Btr1eDylVI8
X-Gm-Gg: ASbGncupLukhiPCYJT4GoEXV7UmHFUfCYNdnw8JqDzEYCj8CvEDmdXUaT5oIDPW7uhu
	gdak4ts4ed6TuCxs2C2tyJ5kczudli7YqNRZ8ASa0ijDDEjuCBwG1mURPbeo0bDm5dF6LPAvJ+k
	nqmpGP8syFL2Yza0izF5DVUBx8Po08e4dRkEZqgp33GXkupPHvTLFSDwVvFIH7CHrmk25ZD7ylm
	OydobEFXt6RdXSepDs5S9ajhlL3se7VFUDGuJQWk3+yDsEM+MntiW+netNxe2ORW7CwvXVGzmAz
	ZcJX6hZ/3hSsHP7xTUuh8FGctv4WVAVqBYbcs0Mz5ZXxmFGR0uDMPyyQE6NOIZICPWkYgHHFXmO
	vjUqz2vZ7qnWZjD2i0XzXjppHJu9vzg==
X-Google-Smtp-Source: AGHT+IGMIAiI3kEj36BvwpfJR8kkwHFPWrjhYUMssF4X1emPutxYoIAOrc270d1+ccqsvElXqE+Puw==
X-Received: by 2002:ad4:5e85:0:b0:6fa:9b1c:740b with SMTP id 6a1803df08f44-6fad1a9b935mr250952456d6.42.1748890794756;
        Mon, 02 Jun 2025 11:59:54 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d33aeesm65197056d6.1.2025.06.02.11.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 11:59:54 -0700 (PDT)
Date: Mon, 2 Jun 2025 14:59:52 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: adrian.freihofer@siemens.com
Cc: openembedded-core@lists.openembedded.org, marex@denx.de,
	a.fatoum@pengutronix.de
Subject: Re: [OE-core] [PATCH v6 20/21] kernel.bbclass: remove support for
 type fitImage
Message-ID: <aD30qIj2BM+s96YO@gmail.com>
References: <20250602075714.32122-1-adrian.freihofer@siemens.com>
 <20250602075714.32122-21-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602075714.32122-21-adrian.freihofer@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 18:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217727



In message: [OE-core] [PATCH v6 20/21] kernel.bbclass: remove support for type fitImage
on 02/06/2025 Adrian Freihofer via lists.openembedded.org wrote:

> From: Adrian Freihofer <adrian.freihofer@siemens.com>
> 
> kernel.bbclass is no longer involved in FIT image creation. Whether a
> FIT image is built now depends entirely on whether the linux-yocto-fitimage
> recipe (or any other recipe capable of producing a FIT image) is selected
> for the build.
> As a result, specifying the kernel image type "fitImage" in
> KERNEL_IMAGETYPE or KERNEL_IMAGETYPES is no longer necessary and gets
> removed.
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 20 +++++++-------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> index 36ce659762e..599996ceb0b 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -84,6 +84,10 @@ python __anonymous () {
>          types = (alttype + ' ' + types).strip()
>      d.setVar('KERNEL_IMAGETYPES', types)
>  
> +    # Since kernel-fitimage.bbclass got replaced by kernel-fit-image.bbclass
> +    if "fitImage" in types:
> +        bb.error("fitImage is no longer supported as a KERNEL_IMAGETYPE(S)")

Can this be a little be more specific ? Indicating the migration
path (the new recipe) would help someone seeing the message.

> +
>      # KERNEL_IMAGETYPES may contain a mixture of image types supported directly
>      # by the kernel build system and types which are created by post-processing
>      # the output of the kernel build system (e.g. compressing vmlinux ->
> @@ -477,17 +481,10 @@ kernel_do_install() {
>  	install -d ${D}/${KERNEL_IMAGEDEST}
>  
>  	#
> -	# When including an initramfs bundle inside a FIT image, the fitImage is created after the install task
> -	# by do_assemble_fitimage_initramfs.
> -	# This happens after the generation of the initramfs bundle (done by do_bundle_initramfs).
> -	# So, at the level of the install task we should not try to install the fitImage. fitImage is still not
> -	# generated yet.
> -	# After the generation of the fitImage, the deploy task copies the fitImage from the build directory to
> -	# the deploy folder.
> +	# bundle_initramfs runs after do_install before do_deploy. do_deploy does what's needed therefore.
>  	#
> -
>  	for imageType in ${KERNEL_IMAGETYPES} ; do
> -		if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
> +		if [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
>  			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
>  		fi
>  	done
> @@ -843,11 +840,8 @@ kernel_do_deploy() {
>  		fi
>  	fi
>  
> -	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> +	if [ -n "${INITRAMFS_IMAGE}" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then

Minor 'nit, but the above change is unrelated to the fit image rework :)

Bruce

>  		for imageType in ${KERNEL_IMAGETYPES} ; do
> -			if [ "$imageType" = "fitImage" ] ; then
> -				continue
> -			fi
>  			initramfsBaseName=$imageType-${INITRAMFS_NAME}
>  			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName${KERNEL_IMAGE_BIN_EXT}
>  			if [ -n "${INITRAMFS_LINK_NAME}" ] ; then
> -- 
> 2.49.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217705): https://lists.openembedded.org/g/openembedded-core/message/217705
> Mute This Topic: https://lists.openembedded.org/mt/113424439/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


