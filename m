Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB29CC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 09:57:29 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web12.6018.1634119048058650084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 02:57:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id DFF10240006;
	Wed, 13 Oct 2021 09:57:25 +0000 (UTC)
Date: Wed, 13 Oct 2021 11:57:25 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core@lists.openembedded.org, Abdellatif.ElKhlifi@arm.com,
	Walter Schweizer <walter.schweizer@siemens.com>
Subject: Re: [OE-core][PATCH v2 2/2] kernel-fitimage: use correct kernel image
Message-ID: <YWathVAwfGUafaRL@piout.net>
References: <20211005202256.54023-1-andrej.valek@siemens.com>
 <20211006070031.156404-2-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006070031.156404-2-andrej.valek@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 09:57:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156897

Hello,

This series causes the following failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2699/steps/15/logs/stdio

2021-10-12 00:31:47,557 - oe-selftest - INFO - fitimage.FitImageTests.test_initramfs_bundle (subunit.RemotedTestCase)
2021-10-12 00:31:47,665 - oe-selftest - INFO -  ... FAIL
Stderr:
2021-10-11 21:55:16,664 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-16604/conf/local.conf
2021-10-11 21:55:16,665 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2021-10-12 00:31:47,666 - oe-selftest - INFO - 10: 3/13 335/444 (2817.06s) (fitimage.FitImageTests.test_initramfs_bundle)
2021-10-12 00:31:47,666 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/selftest/cases/fitimage.py", line 803, in test_initramfs_bundle
    self.assertTrue(test_passed == True,"kernel node does not match expectation")
  File "/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.9/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : kernel node does not match expectation

It failed on all 4 oe-selftest builds

On 06/10/2021 09:00:31+0200, Andrej Valek wrote:
> Even if initramfs_bundle_path was used, a wrong compression was reflected
> in output its template file. Use linux.bin as universal kernel image.
> The linux.bin file covers both cases.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 886ed13029..8718ce7e16 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -495,22 +495,7 @@ fitimage_assemble() {
>  	fitimage_emit_section_maint $1 imagestart
>  
>  	uboot_prep_kimage
> -
> -	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
> -		initramfs_bundle_path="arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE_REPLACEMENT}".initramfs"
> -		if [ -e "$initramfs_bundle_path" ]; then
> -
> -			#
> -			# Include the kernel/rootfs bundle.
> -			#
> -
> -			fitimage_emit_section_kernel $1 $kernelcount "$initramfs_bundle_path" "$linux_comp"
> -		else
> -			bbwarn "$initramfs_bundle_pat not found."
> -		fi
> -	else
> -		fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
> -	fi
> +	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
>  
>  	#
>  	# Step 2: Prepare a DTB image section
> -- 
> 2.31.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156674): https://lists.openembedded.org/g/openembedded-core/message/156674
> Mute This Topic: https://lists.openembedded.org/mt/86113979/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

