Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id F0C866022F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 08:09:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t69so8309727wmt.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Oct 2017 01:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RwRFt/gFTfx7YnfCcryB+Hwd0Rxc8ZVYuxw+sGHMkMA=;
	b=Ywac4B04JG04CS/s3m+Hwfo2ZNPC0pXaJJg/F4yFJhyWNmhQV617JmRf6GziAXsT+5
	kj5FWj7o0X92dFSroFLaXKGxE+Ral91Res82VsMsz0UgQGJMAa1TjuT7AQyoAifLMIHP
	WXFJXVt+56PRloZj/GF/FDacbN+jBEGVBpBAZKW8Qh45NVSDTHTcfZLmsmYwGVaC7GpI
	Uq6DQTrDtBy8GslYx3TY1ym8uWIYKOom8Pr79l6wuES8hMkjmSAxps61NhTEwn2W8AcC
	aRddcND7+sBABjMB/cZZHeVX41OGLZ2fANbJbsQduQwgfPcl5DM+KuogokHBrqqncZob
	lusQ==
X-Gm-Message-State: AMCzsaV7q/845PsdAsmxWa6FoBb28RTewrcGb2seC5wtlCUoK9QFvaCx
	O11fFd6XV+6Y/TtHnGdOPshU8gQE
X-Google-Smtp-Source: AOwi7QAPkSBI4zIAlG8/LA0BFH6FmiME6BrrVANUonJA2wC5ydT+anDjvwjP8Yvpt+9c7OoCNx3Zig==
X-Received: by 10.80.183.193 with SMTP id i1mr20008021ede.167.1508314200471;
	Wed, 18 Oct 2017 01:10:00 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 41sm8747928edz.66.2017.10.18.01.09.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 18 Oct 2017 01:09:59 -0700 (PDT)
Message-ID: <1508314198.20275.15.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Oct 2017 09:09:58 +0100
In-Reply-To: <20171018074623.3461-1-thomas.perrot@tupi.fr>
References: <20171018074623.3461-1-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Wed, 18 Oct 2017 08:10:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-10-18 at 09:46 +0200, Thomas Perrot wrote:
> - Bad image type replacement for aarch64
> - Fix DTB path in fitimage.its
> - Ignore fitImage type in do_bundle_initramfs task because the packaging
> is made by do_assemble_fitimage_initramfs
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel-fitimage.bbclass | 6 +++++-
>  meta/classes/kernel.bbclass          | 4 +++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index 2630b47316..abbc309b09 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -7,8 +7,11 @@ python __anonymous () {
>          depends = "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>  
> -        if d.getVar("UBOOT_ARCH") == "x86":
> +        uarch = d.getVar("UBOOT_ARCH")
> +        if uarch == "x86":
>              replacementtype = "bzImage"
> +        elif uarch == "arm64":
> +            replacementtype = "Image"

This isn't in master yet.

>          else:
>              replacementtype = "zImage"
>  
> @@ -351,6 +354,7 @@ fitimage_assemble() {
>  				DTB_PATH="arch/${ARCH}/boot/${DTB}"
>  			fi
>  
> +			DTB=$(echo "${DTB}" | tr '/' '_')

There is a backport request from master to pyro for this pending already.

>  			DTBS="${DTBS} ${DTB}"
>  			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
>  		done
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ce2cab65ae..a8b0d0a061 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -219,7 +219,9 @@ do_bundle_initramfs () {
>  		# Backing up kernel image relies on its type(regular file
> or symbolic link)
>  		tmp_path=""
>  		for type in ${KERNEL_IMAGETYPES} ; do
> -			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> +			if [ "$type" == "fitImage" ] ; then
                                     ^^

This is a bashism, and this change isn't in master yet either.

Cheers,
Andre'


