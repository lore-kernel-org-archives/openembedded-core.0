Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5E6CE7A9A
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 16:04:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.65165.1695657864343158679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 09:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=byLjDfN/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4532FF807;
	Mon, 25 Sep 2023 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695657862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eTp3F2Q6QAk2PyWDerKsRAuoiTuTZf/VWXN5DELOScE=;
	b=byLjDfN/aTAI6g3UIOn+vD/Zc9rDQ56pTtcpbpYSIRhTtVN3THbsefnfKbecDG90IzKRSw
	2lQVhWfHCDYBuXoEF3hEg9zOoMElUjIICpqqrXzziFNI0bLUa6spPwD4ElRFOqu5aIIukq
	TH0Xp1WcokPh+EtPNDmuDbiGbKyVUbXw/d/yTHAT6qpVqM4PxMoa9hqSTHXZ1mOv9NRykL
	nmflt2lD8dwnVi0rjLexS8Oxw7BFuFAFerBp2PUaiClT4ZGt+GR6E3LaQTKe3fiM7EfoBK
	I8dnSD6Xjl/HPprO06NsFJK2BOlKtHyZ9bLAFvagsTm6nENRevTwPTYDq74r6A==
Date: Mon, 25 Sep 2023 18:04:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 1/5] musl: Update to latest
Message-ID: <20230925160421c389ced3@mail.local>
References: <20230922210508.24087-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230922210508.24087-1-raj.khem@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 16:04:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188193

Hello,

I had this with the series:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7848/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7876/steps/12/logs/stdio

make[2]: Entering directory '/home/root/buildtest/cpio-2.13/rmt'
  CC       rmt.o
  CCLD     rmt
/usr/lib/gcc/i686-poky-linux-musl/13.2.0/../../../../i686-poky-linux-musl/bin/ld: rmt.o: in function `parse_opt':
/home/root/buildtest/cpio-2.13/rmt/rmt.c:715:(.text+0x190): undefined reference to `error'
/usr/lib/gcc/i686-poky-linux-musl/13.2.0/../../../../i686-poky-linux-musl/bin/ld: rmt.o: in function `main':
/home/root/buildtest/cpio-2.13/rmt/rmt.c:780:(.text.startup+0x170): undefined reference to `error'
/usr/lib/gcc/i686-poky-linux-musl/13.2.0/../../../../i686-poky-linux-musl/bin/ld: /home/root/buildtest/cpio-2.13/rmt/rmt.c:783:(.text.startup+0x7af): undefined reference to `error'
collect2: error: ld returned 1 exit status
make[2]: Leaving directory '/home/root/buildtest/cpio-2.13/rmt'
make[2]: *** [Makefile:1221: rmt] Error 1
make[1]: *** [Makefile:1282: all-recursive] Error 1
make[1]: Leaving directory '/home/root/buildtest/cpio-2.13'
make: *** [Makefile:1222: all] Error 2



On 22/09/2023 14:05:04-0700, Khem Raj wrote:
> Brings following bug fixes
> 
> * 79bdacff glob: fix wrong return code when aborting before any matches
> * 7291c6c6 statvfs: allocate spare for f_type
> * 39e43f08 math: fix ld80 powl(x,huge) and powl(LDBL_MAX,small)
> * 6d101027 math: fix ld80 acoshl(x) for x < 0
> 
> Drop MIRRORS and switch to etalabs.net for git fetch URI
> original repo is not working correcting with git Fetcher
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v3: Update SRC_URI to fetchable location
> 
>  meta/recipes-core/musl/musl_git.bb | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 4a4fe978f93..7dd949ffafd 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,21 +4,17 @@
>  require musl.inc
>  inherit linuxloader
>  
> -SRCREV = "83b858f83b658bd34eca5d8ad4d145f673ae7e5e"
> +SRCREV = "79bdacff83a6bd5b70ff5ae5eb8b6de82c2f7c30"
>  
>  BASEVER = "1.2.4"
>  
>  PV = "${BASEVER}+git"
>  
> -# mirror is at git://github.com/kraj/musl.git
> -
> -SRC_URI = "git://git.musl-libc.org/git/musl.git;branch=master;protocol=https \
> +SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
>            "
>  
> -MIRRORS += "git://git.musl-libc.org/git/musl.git git://github.com/kraj/musl.git"
> -
>  S = "${WORKDIR}/git"
>  
>  PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188133): https://lists.openembedded.org/g/openembedded-core/message/188133
> Mute This Topic: https://lists.openembedded.org/mt/101529915/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

