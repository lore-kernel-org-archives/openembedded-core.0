Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C52C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 16:33:59 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.492.1635179637554066879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 09:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 92E1A100004;
	Mon, 25 Oct 2021 16:33:54 +0000 (UTC)
Date: Mon, 25 Oct 2021 18:33:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] vim: fix 2021-3796
Message-ID: <YXbcciyFE5Xb6vLR@piout.net>
References: <20211024064042.1088-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024064042.1088-1-flowergom@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 16:33:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157351

Hello,

Unless I'm doing something wrong, this still fails to apply:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/4207/steps/11/logs/stdio

On 24/10/2021 15:40:42+0900, Minjae Kim wrote:
> vim is vulnerable to Use After Free
> Problem: Checking first character of url twice.
> 
> reference:
> https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
> ---
>  .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  3 +-
>  2 files changed, 52 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch
> 
> diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> new file mode 100644
> index 0000000000..666bd5c48b
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> @@ -0,0 +1,50 @@
> +From 6d02e1429771c00046b48f26e53ca4123c3ce4e1 Mon Sep 17 00:00:00 2001
> +From: Bram Moolenaar <Bram@vim.org>
> +Date: Fri, 24 Sep 2021 16:01:09 +0800
> +Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
> +
> +Problem:    Using freed memory when replacing. (Dhiraj Mishra)
> +Solution:   Get the line pointer after calling ins_copychar().
> +
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
> +CVE: CVE-2021-3796
> +
> +Signed-off-by: Minjae Kim  <flowergom@gmail.com>
> +---
> + src/normal.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/normal.c b/src/normal.c
> +index c4963e621..305b514bc 100644
> +--- a/src/normal.c
> ++++ b/src/normal.c
> +@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
> +           {
> +               /*
> +                * Get ptr again, because u_save and/or showmatch() will have
> +-               * released the line.  At the same time we let know that the
> +-               * line will be changed.
> ++               * released the line. This may also happen in ins_copychar().
> ++               * At the same time we let know that the line will be changed.
> +                */
> +-              ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> +               if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
> +               {
> +                 int c = ins_copychar(curwin->w_cursor.lnum
> +                                          + (cap->nchar == Ctrl_Y ? -1 : 1));
> ++
> ++                ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> +                 if (c != NUL)
> +                   ptr[curwin->w_cursor.col] = c;
> +               }
> +               else
> ++              {
> ++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> +                   ptr[curwin->w_cursor.col] = cap->nchar;
> ++              }
> +               if (p_sm && msg_silent == 0)
> +                   showmatch(cap->nchar);
> +               ++curwin->w_cursor.col;
> +-- 
> +2.17.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index db1e9caf4d..917f82404b 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -18,7 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git \
>             file://no-path-adjust.patch \
>             file://racefix.patch \
>             file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
> -          file://CVE-2021-3778.patch \
> +           file://CVE-2021-3778.patch \
> +          file://CVE-2021-3796.patch \
>  "
>  
>  SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
> -- 
> 2.30.1 (Apple Git-130)
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157321): https://lists.openembedded.org/g/openembedded-core/message/157321
> Mute This Topic: https://lists.openembedded.org/mt/86550275/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

