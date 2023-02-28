Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B60C64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 16:18:49 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.27924.1677601126617057482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 08:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=B6pWXKyB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8ED06E000D;
	Tue, 28 Feb 2023 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677601124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cq0h6XHka0n7yo3nV64fDNhHXTt2GZ2dHiL1OlHiIoQ=;
	b=B6pWXKyBgEU0bcAaEsf09GVhVZfsmErwvmP16MbaxpJsq6hwm2HxtJZFp7zZI+ocK3945l
	ui3/fZOWre1XPa3Y/ZFb44xnZvvepcsd/6EU5Hu0ITqjJ8or69lsZAZ3XWgfKtR0JdNby8
	jNCSgDzlXnlNO56o45SN5gSs2XCw6JK4hATgu80is6w9Qp6ODB3qLvTl5KJkIa5aeB7ZCB
	YUhorvbrMUD6HPCVvFslLC/Uem5unrJUBfAJaYNe1+qJ4RyPonYTnHQdFLinUkDCylP+50
	5ptyKgBDlJwVo4q46+GjyPii5VLsiR26nULqCOODcjbzag/QtgFghJF/Hx7JrQ==
Date: Tue, 28 Feb 2023 17:18:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
Message-ID: <Y/4pZDsT0R9iSH+m@mail.local>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223065816.3151823-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 16:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177844

Hello Khem,

As discussed I gave it a go again and got this:

| /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_corefile_thread(thread_info*, linux_corefile_thread_data*)':
| linux-tdep.c:(.text+0x13ac): undefined reference to `gcore_elf_build_thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
| /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bfd*, int*)':
| linux-tdep.c:(.text+0x49d7): undefined reference to `gcore_elf_make_tdesc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
| collect2: error: ld returned 1 exit status
| make[2]: *** [Makefile:2149: gdb] Error 1
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi/gdb'
| make[1]: *** [Makefile:11122: all-gdb] Error 2
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi'
| make: *** [Makefile:1005: all] Error 2
| ERROR: oe_runmake failed

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6741/steps/14/logs/stdio

I already reported it on the gdb upgrade:

https://lists.openembedded.org/g/openembedded-core/topic/97152035#177576


On 22/02/2023 22:58:16-0800, Khem Raj wrote:
> Use DT_RUNPATH over DT_RPATH. If DT_RUNPATH is present, LD_LIBRARY_PATH is searched before
> DT_RUNPATH, Search order is DT_RPATH then LD_LIBRARY_PATH then
> DT_RUNPATH, this order ensures that injecting
> malicious shared objects is way harder with DT_RUNPATH.
> 
> This is now default on major linux distributions already
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index b2dbf241df..c69d29448f 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -96,6 +96,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>                  --disable-werror \
>                  --enable-deterministic-archives \
>                  --enable-plugins \
> +                --enable-new-dtags \
>                  --disable-gdb \
>                  --disable-gdbserver \
>                  --disable-libdecnumber \
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177602): https://lists.openembedded.org/g/openembedded-core/message/177602
> Mute This Topic: https://lists.openembedded.org/mt/97178429/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

