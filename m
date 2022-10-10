Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B1FC433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 21:49:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.420.1665438557760055132
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 14:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZmKDHlR8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9E5EAE0002;
	Mon, 10 Oct 2022 21:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665438555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s/VG9PpWha6VUAO/uWgqzHuy6xUbHJsCYlgd2n1az6g=;
	b=ZmKDHlR8lvznbAt1Lm1m3ui5XAj8A4zVJ5uv+fJ3LcpUe5UNqmg4Xkht4LefDrKwDZGTtD
	damGXQ47d0djA12rGNpLfRSNqbhKgzaS4OT9ssrWT6U+H93AsdPCRzZWPCz+Uj8p9/u8/6
	W47oA6D/7BLWXL1UJpBvTOBZ4NSKtajV57DGx63/75Qcf7hm2sO65S/aUuJ9PVFoNQDvZ1
	LmZdP4M0ORbNY5w++RG85TRh8LfHUT7FvsaGC2JkIwYWsGk6UVg+jGVP+nnYnahJ5KrN63
	FDkYlCrDYYkIZvsu8gk+koVSKUhKBPBXke4cwD6SORLDuwH1UYz9EyOLJRzM1g==
Date: Mon, 10 Oct 2022 23:49:13 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] mtd-utils: upgrade 2.1.4 -> 2.1.5
Message-ID: <Y0STWTmB8F3Thyac@mail.local>
References: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
 <1665391113-8040-4-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1665391113-8040-4-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 21:49:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171587

Hello,

This breaks oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4237/steps/14/logs/stdio

It would be greatly appreciated if you could ensure running oe-selftest
before submitting

On 10/10/2022 16:38:32+0800, wangmy wrote:
> 0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
> removed since it's included in 2.1.5
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...used-linux-fs.h-header-from-includes.patch | 31 -------------------
>  meta/recipes-devtools/mtd/mtd-utils_git.bb    |  8 ++---
>  2 files changed, 3 insertions(+), 36 deletions(-)
>  delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
> 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
> deleted file mode 100644
> index 73d4a8475f..0000000000
> --- a/meta/recipes-devtools/mtd/mtd-utils/0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 6fb10bd18488ed84776675bc1b2982800a51d839 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 6 Aug 2022 20:14:38 -0700
> -Subject: [mtd-utils][PATCH] tests: Remove unused linux/fs.h header from includes
> -
> -This header is not needed, moreover it includes linux/mount.h which is
> -now in conflict[1] with glibc provided sys/mount.h from glibc 2.36 onwards
> -
> -[1] https://sourceware.org/glibc/wiki/Release/2.36
> -
> -Upstream-Status: Submitted [https://lists.infradead.org/pipermail/linux-mtd/2022-August/094667.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - tests/fs-tests/lib/tests.c | 1 -
> - 1 file changed, 1 deletion(-)
> -
> -diff --git a/tests/fs-tests/lib/tests.c b/tests/fs-tests/lib/tests.c
> -index d1a2e0c..3db0426 100644
> ---- a/tests/fs-tests/lib/tests.c
> -+++ b/tests/fs-tests/lib/tests.c
> -@@ -35,7 +35,6 @@
> - #include <sys/vfs.h>
> - #include <sys/mount.h>
> - #include <sys/statvfs.h>
> --#include <linux/fs.h>
> - #include <linux/jffs2.h>
> - 
> - #include "tests.h"
> --- 
> -2.37.1
> -
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 943666e529..2d76991d2f 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -11,12 +11,10 @@ inherit autotools pkgconfig update-alternatives
>  DEPENDS = "zlib e2fsprogs util-linux"
>  RDEPENDS:mtd-utils-tests += "bash"
>  
> -PV = "2.1.4"
> +PV = "2.1.5"
>  
> -SRCREV = "c7f1bfa44a84d02061787e2f6093df5cc40b9f5c"
> -SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master \
> -           file://0001-tests-Remove-unused-linux-fs.h-header-from-includes.patch \
> -           "
> +SRCREV = "3f3b4cc6c3120107e7aaa21c6415772a255ac49c"
> +SRC_URI = "git://git.infradead.org/mtd-utils.git;branch=master"
>  
>  S = "${WORKDIR}/git"
>  
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171561): https://lists.openembedded.org/g/openembedded-core/message/171561
> Mute This Topic: https://lists.openembedded.org/mt/94232218/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

