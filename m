Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73E3C433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 15:57:38 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.8017.1635004657049914145
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 08:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 10F1A240005;
	Sat, 23 Oct 2021 15:57:34 +0000 (UTC)
Date: Sat, 23 Oct 2021 17:57:34 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] vim: fix 2021-3796
Message-ID: <YXQw7r4KD+GsihFy@piout.net>
References: <20211022024506.1011-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211022024506.1011-1-flowergom@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 15:57:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157302

Hello,

On 22/10/2021 11:45:06+0900, Minjae Kim wrote:
> vim is vulnerable to Use After Free
> Problem:    Checking first character of url twice.
> 
> reference:
> https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
> ---
>  .../vim/files/CVE-2021-3796.patch             | 70 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  3 +-
>  2 files changed, 72 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch
> 
> diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> new file mode 100644
> index 0000000000..08becb4d9a
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> @@ -0,0 +1,70 @@
> +From 296bf20889e66e3235e199838c6e360db2c4166d Mon Sep 17 00:00:00 2001
> +From: Minjae Kim <flowergom@gmail.com>
> +Date: Fri, 22 Oct 2021 02:24:32 +0000
> +Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
> +
> +Problem:    Using freed memory when replacing. (Dhiraj Mishra)
> +Solution:   Get the line pointer after calling ins_copychar().
> +
> +Upstream-Status: Accepted [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
> +CVE: CVE-2021-3796
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>


The patch doesn't seem to apply properly:

https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/866/steps/13/logs/stdio

Can you check?

> +---
> + src/normal.c              | 11 +++++++----
> + src/testdir/test_edit.vim | 12 ++++++++++++
> + 2 files changed, 19 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/normal.c b/src/normal.c
> +index c4963e621..277c92595 100644
> +--- a/src/normal.c
> ++++ b/src/normal.c
> +@@ -5009,19 +5009,22 @@ nv_replace(cmdarg_T *cap)
> +           {
> +               /*
> +                * Get ptr again, because u_save and/or showmatch() will have
> +-               * released the line.  At the same time we let know that the
> ++               * released the line. This may also happen in ins_copychar().
> ++               * At the same time we let know that the
> +                * line will be changed.
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
> +-              }
> +-              else
> ++              } else {
> +                   ptr[curwin->w_cursor.col] = cap->nchar;
> ++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> ++              }
> +               if (p_sm && msg_silent == 0)
> +                   showmatch(cap->nchar);
> +               ++curwin->w_cursor.col;
> +diff --git a/src/testdir/test_edit.vim b/src/testdir/test_edit.vim
> +index 4e29e7fe1..d7565e1ea 100644
> +--- a/src/testdir/test_edit.vim
> ++++ b/src/testdir/test_edit.vim
> +@@ -1519,3 +1519,15 @@ func Test_edit_noesckeys()
> +   bwipe!
> +   set esckeys
> + endfunc
> ++
> ++" Test for getting the character of the line below after "p"
> ++func Test_edit_put_CTRL_E()
> ++  set encoding=latin1
> ++  new
> ++  let @" = ''
> ++  sil! norm orggRx
> ++  sil! norm pr
> ++  call assert_equal(['r', 'r'], getline(1, 2))
> ++  bwipe!
> ++  set encoding=utf-8
> ++endfunc
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
> View/Reply Online (#157291): https://lists.openembedded.org/g/openembedded-core/message/157291
> Mute This Topic: https://lists.openembedded.org/mt/86505722/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

