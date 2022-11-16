Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7D7C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 21:32:10 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.1499.1668634322217422842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 13:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Gc37sU5F;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F015B60003;
	Wed, 16 Nov 2022 21:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668634320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NzN6BZwTlggMzO9yF/DZXhBYQHU5jRcmA5450O9VEhk=;
	b=Gc37sU5FAi8W8YwaTxUYz1eRbxnb4R7JhEXUUNGrBeW9mWX3+ukFnGpEb5URRXyJ26q7k2
	0gyfsVHYTMdRJhj3DB6GeTyKBsNdIEr7zqsE5XQaQXAWRMbkDDoiQskI+Ag4dgPyeEzjca
	YSGb+F9Y6djclPJpEj6ftxy9UtUFA6xE+nOYS5In3ua5fwcxleBaWR3STCV4h0Qc8c4BbO
	6FeDzZsoKEnkNbF4+K6n3ppEyleu6HdKjNlRENB3IePT/eF0ooXyx3BzucC6hIFY6nfUXU
	2BLX9tnFNHJI6GOmjje+84sEvLFaGAk2OllT5UITxJ+ge36K7WVaUfOY9JiP7g==
Date: Wed, 16 Nov 2022 22:31:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 00/10] kernel: consolidated pull request
Message-ID: <Y3VWz2WA0jyn7T1Q@mail.local>
References: <cover.1668558954.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1668558954.git.bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 21:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173392

Hello Bruce,

It seems this series makes an efutils ptest fail:

backtrace: No modules recognized in core file
backtrace-child-core.18977: no main
rmdir: failed to remove 'test-18969': Directory not empty
FAIL: run-backtrace-native-core.sh

I guess something changed in the core generation.

On 15/11/2022 19:38:18-0500, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's the batched up -stable and -dev updates that I've been testing
> for a while.
> 
> I've included both the 6.0 and 6.1 dev kernel updates, as both were
> tested, and someone might want to use v6.0 as a development kernel,
> and could use that commit as a baseline.
> 
> I ran into issues with devsrc and lttng-modules with 6.1, but have
> all architectures working now. mips64 is throwing a trace on boot, but
> I was able to complete testing. I'll revisit that later for 6.1+.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit 44bb88cc869f3b42440d6f7aad000e706b739a2b:
> 
>   mesa: do not rely on native llvm-config in target sysroot (2022-11-15 09:38:38 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (10):
>   linux-yocto-dev: bump to v6.0+
>   linux-yocto/5.19: update to v5.19.16
>   linux-yocto/5.15: update to v5.15.74
>   linux-yocto/5.19: update to v5.19.17
>   linux-yocto/5.15: update to v5.15.76
>   linux-yocto/5.19: cfg: intel and vesa updates
>   kern-tools: integrate ZFS speedup patch
>   linux-yocto-dev: bump to v6.1
>   kernel-devsrc: fix for v6.1+
>   lttng-modules: fix build for v6.1+
> 
>  .../kern-tools/kern-tools-native_git.bb       |   2 +-
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  25 +-
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  |   4 +-
>  .../linux/linux-yocto-rt_5.15.bb              |   6 +-
>  .../linux/linux-yocto-rt_5.19.bb              |   6 +-
>  .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
>  .../linux/linux-yocto-tiny_5.19.bb            |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
>  meta/recipes-kernel/linux/linux-yocto_5.19.bb |  26 +-
>  ...on-drop-kmem_alloc-avoid-dereferenci.patch | 278 ++++++++++++++++++
>  .../lttng/lttng-modules_2.13.7.bb             |   1 +
>  11 files changed, 343 insertions(+), 43 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
> 
> -- 
> 2.19.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173363): https://lists.openembedded.org/g/openembedded-core/message/173363
> Mute This Topic: https://lists.openembedded.org/mt/95057283/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

