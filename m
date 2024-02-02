Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6ACC47DB3
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 15:07:59 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.24913.1706886476172737764
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 07:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Mwr9ec9m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0273D1C000C;
	Fri,  2 Feb 2024 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706886474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vp2mi2Y2q63SjM191eEz2FGQIcKcHF4VuXv1NAni69w=;
	b=Mwr9ec9msponeB8jazxS/p7/yphI6jLbh9HsDIGBvkuALhe+N/9z27olVz8rcSI1fxHx0F
	OKHLes7W7XrZUmMmmKVqvCCBei1wvAwkm+lAvyU04UQE1wfiF2mo4BKQctXvRSr3gugCur
	Y3NhIuX91CEo0HL7ayYR3YNMpJlBZpOyMMVJOSL5YkkNNlMz1q/5UTqcDvdpZNPSmrB7Kt
	SoS9TqtJ4kcXCr9VkAq9ur6yPwnH9l8JQWH89xBh6eCOLkUZTdxq9gzlxwz9fL1OWo8muF
	so+HQe5fZ0uav0PFQwYRYOqCRGHhY577ZSre7QxLTez62r+P/+2mhjjB+lyqcw==
Date: Fri, 2 Feb 2024 16:07:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Daniel =?iso-8859-1?Q?D=EDaz?= <daniel.diaz@linaro.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] ltp: Update to 20240129
Message-ID: <202402021507535468a87c@mail.local>
References: <20240131183243.30223-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240131183243.30223-1-petr.vorel@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 15:07:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194802

On 31/01/2024 19:32:43+0100, Petr Vorel wrote:
> Removed patch accepted upstream as
> 8c53cc947 ("testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE")
> 
> Rebase runtest/mm patch.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Hi Richard, Daniel, Khem,
> 
> could anybody please test this update if build (it should).
> 
> Also, it'd be good nice to rerun proc01 -m 128 and report me with the
> details, maybe we can fix it. If still problematic, it'd be nice to turn
> disable_hanging_tests.patch into proper git patch (makes rebasing patch
> on new LTP version easier).

This fails on the autobuilders:

https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/5957/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/5917/steps/12/logs/stdio

> 
> Kind regards,
> Petr
> 
>  ...001-Remove-OOM-tests-from-runtest-mm.patch |  6 ++--
>  ...-syscalls-fcntl-define-_LARGEFILE64_.patch | 28 -------------------
>  .../ltp/{ltp_20230929.bb => ltp_20240129.bb}  |  3 +-
>  3 files changed, 4 insertions(+), 33 deletions(-)
>  delete mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
>  rename meta/recipes-extended/ltp/{ltp_20230929.bb => ltp_20240129.bb} (97%)
> 
> diff --git a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> index 6d945700be..cc98079651 100644
> --- a/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> +++ b/meta/recipes-extended/ltp/ltp/0001-Remove-OOM-tests-from-runtest-mm.patch
> @@ -14,10 +14,10 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>   1 file changed, 6 deletions(-)
>  
>  diff --git a/runtest/mm b/runtest/mm
> -index 6537666a9..e5a091a5a 100644
> +index d859b331c..3c2962f44 100644
>  --- a/runtest/mm
>  +++ b/runtest/mm
> -@@ -73,12 +73,6 @@ ksm06_2 ksm06 -n 8000
> +@@ -74,12 +74,6 @@ ksm07 ksm07
>   
>   cpuset01 cpuset01
>   
> @@ -31,5 +31,5 @@ index 6537666a9..e5a091a5a 100644
>   
>   thp01 thp01 -I 120
>  -- 
> -2.33.0
> +2.43.0
>  
> diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> deleted file mode 100644
> index dbe63f2170..0000000000
> --- a/meta/recipes-extended/ltp/ltp/0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From f4f75ce9218b469d91b536218de3323977edc529 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Tue, 13 Jun 2023 15:10:33 +0200
> -Subject: [PATCH] testcases/kernel/syscalls/fcntl: define _LARGEFILE64_SOURCE
> -
> -This is required for off64_t to be available on musl systems.
> -
> -Upstream-Status: Submitted [https://github.com/linux-test-project/ltp/pull/1047]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - testcases/kernel/syscalls/fcntl/Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/testcases/kernel/syscalls/fcntl/Makefile b/testcases/kernel/syscalls/fcntl/Makefile
> -index df663a50a..aac774111 100644
> ---- a/testcases/kernel/syscalls/fcntl/Makefile
> -+++ b/testcases/kernel/syscalls/fcntl/Makefile
> -@@ -17,6 +17,6 @@ include $(abs_srcdir)/../utils/newer_64.mk
> - 
> - %_64: CPPFLAGS += -D_FILE_OFFSET_BITS=64
> - 
> --CPPFLAGS		+= -D_GNU_SOURCE
> -+CPPFLAGS		+= -D_GNU_SOURCE -D_LARGEFILE64_SOURCE
> - 
> - include $(top_srcdir)/include/mk/generic_leaf_target.mk
> --- 
> -2.30.2
> -
> diff --git a/meta/recipes-extended/ltp/ltp_20230929.bb b/meta/recipes-extended/ltp/ltp_20240129.bb
> similarity index 97%
> rename from meta/recipes-extended/ltp/ltp_20230929.bb
> rename to meta/recipes-extended/ltp/ltp_20240129.bb
> index 5c43346883..5cd33bb6a3 100644
> --- a/meta/recipes-extended/ltp/ltp_20230929.bb
> +++ b/meta/recipes-extended/ltp/ltp_20240129.bb
> @@ -24,12 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
>  
>  CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
>  CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
> -SRCREV = "110d3be6a9c58674de3e366b96a70f0129a5d299"
> +SRCREV = "68737d20556d37364c95776044b1119c0912a36a"
>  
>  SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             file://disable_hanging_tests.patch \
> -           file://0001-testcases-kernel-syscalls-fcntl-define-_LARGEFILE64_.patch \
>             "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194532): https://lists.openembedded.org/g/openembedded-core/message/194532
> Mute This Topic: https://lists.openembedded.org/mt/104081044/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

