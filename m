Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 50BF76FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 10:28:52 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b189so6917279wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 03:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i8Kx6T6BrTLygYOt0kG9OPGKKg07qoPlw7OGt5/AhVk=;
	b=bEB7a+3Idc2Dn6HOd7+IYnsbhJsWjbE2vlC8DnI/8ocSbgGhEF/DiCJShn8OcJfPC3
	qK3+6ChL3vBHIIDxsDf66eBUrnJfwupl7+cnYIA0eaxVH5CqkxfJB26jW6lPgNJia1Jm
	IWTWYXXwlIvfGQuPtObRwrXrx+siPzuAqxG/bn9QHjXPvicgkicfw6Zxsz0nkYrfNyHE
	C+ML8+g9Cssr5hNksCdpcb2QncgE7mPM4ets951pPwPO8oZKdBemKiS2B1un0D+qg9Ly
	TJTu92K5BRLaUnMAaF2GtkAvtP5VdgB/FDQ4SUxe7lhvCb9bhnvYoNmS30wDyvtV4fyu
	Fz4w==
X-Gm-Message-State: AMCzsaXV84eLGMUejyY6ok1BEg72u1B+ws4vPxq/HPyN0mvvUlf3DpgI
	RqcEQdLitzg5AcugZuzwd3iULkQ4
X-Google-Smtp-Source: ABhQp+RPkLlraoG+9HEXlm+DMQGTT2fxqdzPrAXw39aDSGZ61CUAgWPEzwS0rx1H+VdVrefJhpBrnQ==
X-Received: by 10.80.158.194 with SMTP id a60mr24094051edf.182.1509013733523; 
	Thu, 26 Oct 2017 03:28:53 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c32sm3266942eda.57.2017.10.26.03.28.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 26 Oct 2017 03:28:51 -0700 (PDT)
Message-ID: <1509013730.13607.86.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Oct 2017 11:28:50 +0100
In-Reply-To: <20171025180312.10308-2-thomas.perrot@tupi.fr>
References: <20171025180312.10308-1-thomas.perrot@tupi.fr>
	<20171025180312.10308-2-thomas.perrot@tupi.fr>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [meta][PATCH 2/3] Fix some issues in the fitImage generation
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
X-List-Received-Date: Thu, 26 Oct 2017 10:28:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Thomas,

On Wed, 2017-10-25 at 20:03 +0200, Thomas Perrot wrote:
> Ignore fitImage type in do_bundle_initramfs task because the packaging is
> made by do_assemble_fitimage_initramfs

You should also follow the instructions from the patchtest email you're
receiving
http://lists.openembedded.org/pipermail/openembedded-core/2017-October/143668.html

In particular https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Otherwise your patches won't be merged.

In this case, you should prefix your patch subject line with the <target>,
and it's always helpful to add some log output e.g.

---snip---
kernel.bbclass: support fitImage and INITRAMFS_IMAGE_BUNDLE together

When enabling INITRAMFS_IMAGE_BUNDLE and fitImages, the build
aborts because 

| mv: cannot stat 'arch/arm64/boot/fitImage': No such file or directory
| WARNING: .../temp/run.do_bundle_initramfs.30337:1 exit 1 from 'mv -f arch/arm64/boot/$type arch/arm64/boot/$type.initramfs'
| ERROR: Function failed: do_bundle_initramfs (log file is located at .../temp/log.do_bundle_initramfs.30337)
| ERROR: Task (kernel.bb.bb:do_bundle_initramfs) failed with exit code '1'

This is because do_bundle_initramfs incorrectly treats 'fitImage'
as a kernel make target that needs to be re-run to achieve initramfs
image bundling, which it shouldn't.

Fix by simply skipping 'fitImage' in this case.

Signed-off-by: ...
---snap---


Same for all the other patches.

We'll get there :-)


Cheers,
Andre'


> 
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> ---
>  meta/classes/kernel.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 756707a3c2..7f8c8985f3 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -208,7 +208,9 @@ do_bundle_initramfs () {
>  		# Backing up kernel image relies on its type(regular file
> or symbolic link)
>  		tmp_path=""
>  		for type in ${KERNEL_IMAGETYPES} ; do
> -			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
> +			if [ "$type" = "fitImage" ] ; then
> +				continue
> +			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
>  				linkpath=`readlink -n
> ${KERNEL_OUTPUT_DIR}/$type`
>  				realpath=`readlink -fn
> ${KERNEL_OUTPUT_DIR}/$type`
>  				mv -f $realpath $realpath.bak
> -- 
> 2.13.6
> 

