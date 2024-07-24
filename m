Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7071C3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 15:54:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.14404.1721836480129380189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 08:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XriKRi5I;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DC3E240004;
	Wed, 24 Jul 2024 15:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721836478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bZNds2yobYmvkD4W5FHwbOcNNoCPA0NObGWyM9yDaxs=;
	b=XriKRi5IB2jGkku/7L01N4T1tbtT8LHyvNR7Y4Y5o7G0J5wLFAee+MCKWyyuN/47JBuEBU
	5Oh8VwmOsqlueAqS8dXTzLi5yY70NevyjVX01+fcxcWqTnvjtdu/iiNSw8o66zo93M5kQd
	sFRfWT/65TTvodDvsBhDuOxacyIm5ht4aGECo0M2jPTUpvJZ3AFreEE/PlsWPlKXPLolBv
	7/mS4sUIG0nV26OGHXz62alIqzIELpOLUeUVLHZ0TjDbGBmAiKdQe2WflQ4zzkxPK23BRo
	UT5vRDk60rgjCuLe1zAkueBmHwiqbgNLw7XbTosoe9L1Tj3ZwRediXPaQACnfg==
Date: Wed, 24 Jul 2024 17:54:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 0/6] Use the kernel from sstate when
 building fitImages
Message-ID: <20240724155437833444ee@mail.local>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202457

Hello,

I'm pretty sure this causes this failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/151/builds/2005/steps/12/logs/stdio

And also those oe-selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6945/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6987/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7000/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/7010/steps/14/logs/stdio


On 15/07/2024 16:10:37+0200, Adrian Freihofer wrote:
> Changes in comparison to v1:
> - Add the missing dependency from do_image_wic to
>   initramfs.do_image_complete which caused the build failure on the AB.
> - Support symbolic links for $dtb_path again, as suggested by Mark.
> - Simplify the refactoring of the uboot_prep_kimage function.
> - Evaluate staging via sysroot instead of taking the kernel artifacts
>   from the deploy folder. But there is an issue with this approach: It
>   does not allow to remove the dependency from do_deploy on do_install.
> - Rebasing to latest master
> 
> If the KERNEL_IMAGETYPES(S) contains fitImage, the kernel is always
> rebuilt when something changes in the initramfs frequently.
> This is even worse if the build runs from an empty TMPDIR. The kernel
> re-build starts by fetching the large kernel git repository and
> recompiling it from scratch.
> 
> This cannot be improved if INITRAMFS_IMAGE_BUNDLE = "1". If the kernel
> Makefile is needed to generate the initramfs bundle the kernel build
> folder is required.
> But for a build configuration with INITRAMFS_IMAGE_BUNDLE = "" the
> build folder is not needed. Creating the initramfs bundle requires:
> linux.bin, DTBs and the initramfs which are available in the deploy
> directory. That means creating the fitImage can be done with artifacts
> which are already cached by the sstate.
> 
> There is an extra commit providing a html file. This html file provides
> some graphics which show the changes in the kernel's task dependencies.
> I hope this simplifies the re-view of this patch series.
> 
> Testing:
> - oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg \
>      reproducible -T yocto-mirrors -T machine -T toolchain-user \
>      -T toolchain-system
> - Build for core-image-minimal for MACHINE = "genericarm64"
>   (failure from AB was reproducible and is fixed now)
> - Build clean followed by build from sstate
>   Note: Adding this test to oe-selftest failed because sstate is read only
>   - Clean build config:
>     KERNEL_IMAGETYPE = "Image"
>     KERNEL_IMAGETYPES += " fitImage "
>     KERNEL_CLASSES = " kernel-fitimage "
>     IMAGE_FSTYPES += "cpio.gz"
>     INITRAMFS_IMAGE = "core-image-minimal"
>     IMAGE_NAME_SUFFIX:pn-core-image-minimal = ""
>     UBOOT_RD_LOADADDRESS = "0x88000000"
>     UBOOT_RD_ENTRYPOINT = "0x88000000"
>     UBOOT_LOADADDRESS = "0x80080000"
>     UBOOT_ENTRYPOINT = "0x80080000"
>     FIT_DESC = "A model description"
>     FOO_VAR = "1"
>     INHERIT += "image-buildinfo"
>     IMAGE_BUILDINFO_VARS:append = " FOO_VAR"
>   - Append the following and rebuild with sstate:
>     FOO_VAR = "2"
>     TMPDIR = "${TOPDIR}/tmp-2"
>   - Check the log files:
>     - tmp/log/cooker/qemux86-64 contains:
>       linux-yocto-6.6.35+git-r0: task do_deploy: Succeeded
>       linux-yocto-6.6.35+git-r0: task do_deploy_fitimage_unbundled: Succeeded
>     - tmp-2/log/cooker/qemux86-64 contains:
>       linux-yocto-6.6.35+git-r0: task do_deploy_setscene: Succeeded
>       linux-yocto-6.6.35+git-r0: task do_deploy_fitimage_unbundled: Succeeded
> - To re-view the chagnes in the task dependencies, the script bellow
>   has been used. It confirms:
>   - For builds with fitImage and unbundled initramfs:
>     - the do_deploy_fitimage_unbundled task runs after do_deploy
>     - do_assemble_fitimage_initramfs is not executed
>     - do_bundle_initramfs is not executed
>     - It works for fitImage in KERNEL_IMAGETYPE as well as for fitImage
>       in KERNEL_IMAGETYPES
>   - For builds with fitImage and bundled initramfs: No changes
>   - For builds with fitImage, without initramfs:
>     - do_assemble_fitimage_initramfs is not executed
>     - do_bundle_initramfs is not executed
> 
> OUTPUT_FILE=task-depends.md
> GIT_BRANCH=master
> GIT_BRANCH_NEXT=adrianf/kernel-fitimage-sstate
> 
> echo "# Task dependeny changes" > "$OUTPUT_FILE"
> echo "" >> "$OUTPUT_FILE"
> 
> run_bitbake(){
>     echo "$1" >> "$OUTPUT_FILE"
>     echo "" >> "$OUTPUT_FILE"
> 
>     bitbake virtual/kernel -g
>     grep -E '(digraph depends|linux-yocto|\})' task-depends.dot \
>     | grep -v -E '(spdx|do_kernel_configcheck|do_prepare_recipe_sysroot|do_populate_lic|native.do_populate_sysroot)' \
>     | grep -v -E '(depmodwrapper-cross.do_populate_sysroot|binutils-cross-x86_64.do_populate_sysroot|do_package)' \
>     | grep -v -E '(do_validate_branches|do_unpack|do_recipe_qa|do_patch|do_kernel_checkout|do_kernel_configme|do_kernel_metadata)' \
>     | grep -v -E '(do_sizecheck|do_strip|do_compile_kernelmodules|do_shared_workdir|do_transform_kernel|do_kernel_link_images)' \
>     | grep -v -E '(do_kernel_version_sanity_check|do_symlink_kernsrc|do_deploy_source_date_epoch|do_configure|do_fetch)' \
>     | sed -e 's;\\n\:.*.bb;;g' -e 's;linux-yocto[. ];;g' > task-depends-filtered.dot
> 
>     echo '```plantuml' >> "$OUTPUT_FILE"
>     cat task-depends-filtered.dot >> "$OUTPUT_FILE"
>     echo '```' >> "$OUTPUT_FILE"
>     echo "" >> "$OUTPUT_FILE"
> }
> 
> run_bitbake_per_branch(){
>     echo "## Configuration: $1" >> "$OUTPUT_FILE"
>     echo "" >> "$OUTPUT_FILE"
>     echo '```raw' >> "$OUTPUT_FILE"
>     cat build/conf/auto.conf >> "$OUTPUT_FILE"
>     echo '```' >> "$OUTPUT_FILE"
>     echo "" >> "$OUTPUT_FILE"
> 
>     git checkout $GIT_BRANCH
>     run_bitbake "### branch: $GIT_BRANCH"
>     mv -f task-depends-filtered.dot task-depends-filtered-old.dot
> 
>     git checkout $GIT_BRANCH_NEXT
>     run_bitbake "### branch: $GIT_BRANCH_NEXT"
> 
>     echo "## Diff" >> "$OUTPUT_FILE"
>     echo "" >> "$OUTPUT_FILE"
>     echo '```patch' >> "$OUTPUT_FILE"
>     diff task-depends-filtered-old.dot task-depends-filtered.dot >> "$OUTPUT_FILE"
>     echo '```' >> "$OUTPUT_FILE"
>     echo "" >> "$OUTPUT_FILE"
> }
> 
> cat << EOF > build/conf/auto.conf
> KERNEL_IMAGETYPE = "Image"
> KERNEL_IMAGETYPES += " fitImage "
> KERNEL_CLASSES = " kernel-fitimage "
> IMAGE_FSTYPES += "cpio.gz"
> INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> EOF
> run_bitbake_per_branch "image, fitimage, initramfs, unbundled"
> 
> cat << EOF > build/conf/auto.conf
> KERNEL_IMAGETYPE:forcevariable = "fitImage"
> KERNEL_CLASSES = " kernel-fitimage "
> IMAGE_FSTYPES += "cpio.gz"
> INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> EOF
> run_bitbake_per_branch "fitimage, initramfs, unbundled"
> 
> cat << EOF > build/conf/auto.conf
> KERNEL_IMAGETYPE = "Image"
> KERNEL_IMAGETYPES += " fitImage "
> KERNEL_CLASSES = " kernel-fitimage "
> IMAGE_FSTYPES += "cpio.gz"
> INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> INITRAMFS_IMAGE_BUNDLE = "1"
> EOF
> run_bitbake_per_branch "image, fitimage, initramfs, bundled"
> 
> cat << EOF > build/conf/auto.conf
> KERNEL_IMAGETYPE = "Image"
> KERNEL_IMAGETYPES += " fitImage "
> KERNEL_CLASSES = " kernel-fitimage "
> EOF
> run_bitbake_per_branch "image, fitimage"
> 
> rm -f build/conf/auto.conf task-depends-filtered-old.dot task-depends-filtered.dot task-depends.dot
> 
> Adrian Freihofer (6):
>   kernel-fitimage: fix intentation
>   kernel-fitimage: fix external dtb check
>   kernel: refactor linux compression
>   kernel-fitimage: refactor fitimage_assemble
>   kernel: refactor fitimage
>   kernel-fitimage: run unbundled fitimage after deploy
> 
>  meta/classes-recipe/image.bbclass           |  12 +-
>  meta/classes-recipe/kernel-fitimage.bbclass | 188 ++++++++++++--------
>  meta/classes-recipe/kernel-uboot.bbclass    |   1 +
>  meta/classes-recipe/kernel.bbclass          |  31 ++--
>  4 files changed, 148 insertions(+), 84 deletions(-)
> 
> -- 
> 2.45.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201926): https://lists.openembedded.org/g/openembedded-core/message/201926
> Mute This Topic: https://lists.openembedded.org/mt/107231736/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

