Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5032AC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 12:31:26 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.21394.1657715477119021618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 05:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nq7u/5Dd;
 spf=pass (domain: bootlin.com, ip: 217.70.178.232,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 98380200002;
	Wed, 13 Jul 2022 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657715475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WvxAuM2jUfJF2ml7c0r4nG4rJkVWm/t1uFuAIqgAxMQ=;
	b=nq7u/5DdsGoaibPc6LkNEWb0JIVPUTYFLecF13iF5enphPXUU+SwecW2uBbKfKuruG04Yn
	SZFNX24UQhx+XKf5ukFcCYpmzOjUlCETNtt2voMY3VBEllueX0FlHtuRLsWW5KMdGslc0P
	TbhHCDsb5XZ3GAKx779HkffClDib31IpupfwPbLwbKzecUGqf2Tdw5dWwzG8rlTvn4nZe3
	eUpMQYy7cHTTfO3AVJSOxUYijdaZFHkNDhOzdK3HTOQBEERZLKTnB1oEy9pIj4VSfRvsy8
	XEeqjdDGZJNIxnI/TvHjKy0TYeJxjyy6zsfP8KZ0TS+GdEGLb0G5SmqFOC1Mgw==
Date: Wed, 13 Jul 2022 14:31:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org, max.krummenacher@toradex.com
Subject: Re: [OE-core] [PATCH V2 1/1] meta: introduce
 UBOOT_MKIMAGE_KERNEL_TYPE
Message-ID: <Ys67Eg+WYRvmSrK1@mail.local>
References: <20220709081221.5601-1-liu.ming50@gmail.com>
 <20220709081221.5601-2-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220709081221.5601-2-liu.ming50@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 12:31:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167956

Hello,

I believe this is the cause of the following failures:

2022-07-13 10:51:39,025 - oe-selftest - INFO - fitimage.FitImageTests.test_initramfs_bundle (subunit.RemotedTestCase)
2022-07-13 10:51:39,025 - oe-selftest - INFO -  ... FAIL
Stderr:
2022-07-13 10:06:12,424 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-33314/conf/local.conf
2022-07-13 10:06:12,425 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2022-07-13 10:51:39,025 - oe-selftest - INFO - 10: 3/27 373/493 (826.21s) (fitimage.FitImageTests.test_initramfs_bundle)
2022-07-13 10:51:39,025 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/fitimage.py", line 803, in test_initramfs_bundle
    self.assertTrue(test_passed == True,"kernel node does not match expectation")
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/lib/python3.9/unittest/case.py", line 682, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : kernel node does not match expectation

https://autobuilder.yoctoproject.org/typhoon/#builders/80/builds/3765/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/79/builds/3813/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/86/builds/3778/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#builders/87/builds/3824/steps/14/logs/stdio


On 09/07/2022 10:12:21+0200, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> Sometimes an end user might want to choose another kernel type argument
> for uboot-mkimage other than "kernel", for instance: "kernel_noload".
> 
> Let's introduce a variable UBOOT_MKIMAGE_KERNEL_TYPE to support that,
> and it could be used by BSP layers as well.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/kernel-fitimage.bbclass     | 2 +-
>  meta/classes/kernel-uboot.bbclass        | 3 +++
>  meta/classes/kernel-uimage.bbclass       | 2 +-
>  meta/lib/oeqa/selftest/cases/fitimage.py | 3 ++-
>  4 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 7e09b075ff..2112ae4cfa 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -148,7 +148,7 @@ fitimage_emit_section_kernel() {
>                  kernel-$2 {
>                          description = "Linux kernel";
>                          data = /incbin/("$3");
> -                        type = "kernel";
> +                        type = "${UBOOT_MKIMAGE_KERNEL_TYPE}";
>                          arch = "${UBOOT_ARCH}";
>                          os = "linux";
>                          compression = "$4";
> diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
> index 2facade818..1bc98e042d 100644
> --- a/meta/classes/kernel-uboot.bbclass
> +++ b/meta/classes/kernel-uboot.bbclass
> @@ -2,6 +2,9 @@
>  FIT_KERNEL_COMP_ALG ?= "gzip"
>  FIT_KERNEL_COMP_ALG_EXTENSION ?= ".gz"
>  
> +# Kernel image type passed to mkimage (i.e. kernel kernel_noload...)
> +UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
> +
>  uboot_prep_kimage() {
>  	if [ -e arch/${ARCH}/boot/compressed/vmlinux ]; then
>  		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
> index cedb4fa070..2e661ea916 100644
> --- a/meta/classes/kernel-uimage.bbclass
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -30,6 +30,6 @@ do_uboot_mkimage() {
>  			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print "0x"$1;exit}'`
>  	fi
>  
> -	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
> +	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T ${UBOOT_MKIMAGE_KERNEL_TYPE} -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
>  	rm -f linux.bin
>  }
> diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
> index e6bfd1257e..7e6479c9ca 100644
> --- a/meta/lib/oeqa/selftest/cases/fitimage.py
> +++ b/meta/lib/oeqa/selftest/cases/fitimage.py
> @@ -763,6 +763,7 @@ FIT_HASH_ALG = "sha256"
>  
>          kernel_load = str(get_bb_var('UBOOT_LOADADDRESS'))
>          kernel_entry = str(get_bb_var('UBOOT_ENTRYPOINT'))
> +        kernel_type = str(get_bb_var('UBOOT_MKIMAGE_KERNEL_TYPE'))
>          kernel_compression = str(get_bb_var('FIT_KERNEL_COMP_ALG'))
>          uboot_arch = str(get_bb_var('UBOOT_ARCH'))
>          fit_hash_alg = str(get_bb_var('FIT_HASH_ALG'))
> @@ -775,7 +776,7 @@ FIT_HASH_ALG = "sha256"
>              'kernel-1 {',
>              'description = "Linux kernel";',
>              'data = /incbin/("linux.bin");',
> -            'type = "kernel";',
> +            'type = "' + kernel_type + '";',
>              'arch = "' + uboot_arch + '";',
>              'os = "linux";',
>              'compression = "' + kernel_compression + '";',
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167837): https://lists.openembedded.org/g/openembedded-core/message/167837
> Mute This Topic: https://lists.openembedded.org/mt/92268338/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

