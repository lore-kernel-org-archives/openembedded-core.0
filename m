Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E97DC77B7A
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 21:54:47 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3476.1684619679073142071
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 14:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SsvQbnP8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1AD461BF206;
	Sat, 20 May 2023 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684619676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cL8mvuGRbRWEmchW2pNAGbaDeG19IQSOm4c2ecDf0+k=;
	b=SsvQbnP8b7WYv63y22ywl7GHFg8bX/HT+cDVIRH6SaptikSK7y0aQwcYbVejZbjwfmOYHt
	BCD/r/JM/Rk2SYh92evvimVS6Fas8lYdF9ZSqXX8Y4R5gpvnFoVe/999bhMWxXNJKGrUaj
	01Q6CGTQ7W0bwW0X5f5lO2XgqEm37c5Zy2EHXdajjiKi+XZ1AtdxY+Q+4k8GXOomgJTWRR
	bmy7CmqeGhiGTUTUP/s1WxxJlBlnkOcEh7OR28/ZjYSui32gIhJJv37H/xozXD96FFBAxz
	85H7YM8g5LN97RZAW8TmP8er/59LzWwgT2t8HXa7koTrubmBS622KsoG3hGilQ==
Date: Sat, 20 May 2023 23:54:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH v2 1/3] gdb: package python support separately
Message-ID: <202305202154355c2ad3ee@mail.local>
References: <20230519095811.1387602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519095811.1387602-1-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 21:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181575

Hello,

This breaks package.PackageTests.test_gdb_hardlink_debug

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5204/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5154/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5233/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5196/steps/14/logs/stdio

On 19/05/2023 11:58:09+0200, Alexander Kanavin wrote:
> This avoids pulling in the whole python stack if only
> the main package is installed.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/gdb/gdb-common.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
> index 9db61b785f3..d03f744a845 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -33,13 +33,17 @@ EXTRA_OECONF = "--disable-gdbtk --disable-x --disable-werror \
>  PACKAGECONFIG ??= "readline ${@bb.utils.filter('DISTRO_FEATURES', 'debuginfod', d)}"
>  # Use --without-system-readline to compile with readline 5.
>  PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline"
> -PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3,python3 python3-codecs"
> +PACKAGECONFIG[python] = "--with-python=${WORKDIR}/python,--without-python,python3"
>  PACKAGECONFIG[babeltrace] = "--with-babeltrace,--without-babeltrace,babeltrace"
>  # ncurses is already a hard DEPENDS, but would be added here if it weren't
>  PACKAGECONFIG[tui] = "--enable-tui,--disable-tui"
>  PACKAGECONFIG[xz] = "--with-lzma --with-liblzma-prefix=${STAGING_DIR_HOST},--without-lzma,xz"
>  PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod, elfutils"
>  
> +PACKAGES =+ "${PN}-python"
> +RDEPENDS:${PN}-python = "python3 python3-codecs"
> +FILES:${PN}-python = "${datadir}/gdb/python/"
> +
>  GDBPROPREFIX = "--program-prefix=''"
>  
>  DISABLE_STATIC = ""
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181543): https://lists.openembedded.org/g/openembedded-core/message/181543
> Mute This Topic: https://lists.openembedded.org/mt/99009068/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

