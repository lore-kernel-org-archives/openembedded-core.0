Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FECC433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 02:45:20 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.3203.1634870719276487457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 19:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ha+lmMzc;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id f5so1996840pgc.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 19:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ud3M/Wq+gKvgQ6JkhnJbcGrY6CLsaIzWoag/sUfimxA=;
        b=ha+lmMzcBZV2aWzWpq9qr8/G274BgHuBhfbfESjCpKhB9CFa/17qGiDyKkeM6mWVQN
         QHS44PG6SM3DQAolcU4Ye1m3BrGHBCilV5Yo/jHqaHppU1O2PbzxfOhlcvaTF4EXdMl+
         TEsrA0QrPG7T+8f6BqO8/5/dpfTyGw2rAWdzprQlZc5M2bPcdkf1beiWT3RJmPZ6Y7PE
         /ZYeKqiD1NW49oTCuQbmMaQauBevLF3LLK85aRMyWHl2qOvEQvnbToAXn/rWIivBN4QE
         +gCILrOc2bdHmWQj8kWRlD7LKa/l2pHLpgnKwvygATdYEu6n+ZgnH7aGkbSYxwBDoK4o
         vc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ud3M/Wq+gKvgQ6JkhnJbcGrY6CLsaIzWoag/sUfimxA=;
        b=7bUK6TxGlYg5Zr0sA0jpbLK3ZITpzHilYQ+1a6NPc3zIz2FQe9cFNkExcyhwHvWPaO
         wz8suHOXdWX5sf+mB8d1Sg+AUnFV6/raabmbTv5pmvRzPJtzKsQQex7+W6Nvm+0pldsV
         dGhfVFcrHNcxf1Bc5szwK7dQ7+iUpowMVtpzJY14+qj90Jc0nOR0CJhZ1QG5HgDzemic
         mKoxgj3uRFdZlWrj/judubri0+ndZhA42tbnf8689I+jP8vx2uC87JkHIlKMvk970nr/
         MVygUBPiTT5E844erDVjZ1k9JcQer34uBLwzjCxYd2ZzEY1Wvfdb+CsiRc89n0IN7uxp
         Aciw==
X-Gm-Message-State: AOAM532qb/VLu0FFa+xcyFJ/RyLfor7Wpd7jRqrhYKx3N6mK5BbP3n4n
	BXZb+lGSseNWFhERr2bmOxFRMvYZ1+578Fna/SE=
X-Google-Smtp-Source: 
 ABdhPJzI5D0B40rEINYKptOCMjfugGraw7LOcIj5rEWxpxt3s40CrR5pzVLL1IqlJTuCd46UhQhOlw==
X-Received: by 2002:a05:6a00:248a:b0:44c:ecc5:a165 with SMTP id
 c10-20020a056a00248a00b0044cecc5a165mr9336501pfv.43.1634870718184;
        Thu, 21 Oct 2021 19:45:18 -0700 (PDT)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id z2sm6607413pgn.8.2021.10.21.19.45.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Oct 2021 19:45:17 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] vim: fix 2021-3796
Date: Fri, 22 Oct 2021 11:45:06 +0900
Message-Id: <20211022024506.1011-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Oct 2021 02:45:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157291

vim is vulnerable to Use After Free
Problem:    Checking first character of url twice.

reference:
https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
---
 .../vim/files/CVE-2021-3796.patch             | 70 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  3 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
new file mode 100644
index 0000000000..08becb4d9a
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
@@ -0,0 +1,70 @@
+From 296bf20889e66e3235e199838c6e360db2c4166d Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Fri, 22 Oct 2021 02:24:32 +0000
+Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
+
+Problem:    Using freed memory when replacing. (Dhiraj Mishra)
+Solution:   Get the line pointer after calling ins_copychar().
+
+Upstream-Status: Accepted [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
+CVE: CVE-2021-3796
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ src/normal.c              | 11 +++++++----
+ src/testdir/test_edit.vim | 12 ++++++++++++
+ 2 files changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/src/normal.c b/src/normal.c
+index c4963e621..277c92595 100644
+--- a/src/normal.c
++++ b/src/normal.c
+@@ -5009,19 +5009,22 @@ nv_replace(cmdarg_T *cap)
+           {
+               /*
+                * Get ptr again, because u_save and/or showmatch() will have
+-               * released the line.  At the same time we let know that the
++               * released the line. This may also happen in ins_copychar().
++               * At the same time we let know that the
+                * line will be changed.
+                */
+-              ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+               if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
+               {
+                 int c = ins_copychar(curwin->w_cursor.lnum
+                                          + (cap->nchar == Ctrl_Y ? -1 : 1));
++
++                ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+                 if (c != NUL)
+                   ptr[curwin->w_cursor.col] = c;
+-              }
+-              else
++              } else {
+                   ptr[curwin->w_cursor.col] = cap->nchar;
++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
++              }
+               if (p_sm && msg_silent == 0)
+                   showmatch(cap->nchar);
+               ++curwin->w_cursor.col;
+diff --git a/src/testdir/test_edit.vim b/src/testdir/test_edit.vim
+index 4e29e7fe1..d7565e1ea 100644
+--- a/src/testdir/test_edit.vim
++++ b/src/testdir/test_edit.vim
+@@ -1519,3 +1519,15 @@ func Test_edit_noesckeys()
+   bwipe!
+   set esckeys
+ endfunc
++
++" Test for getting the character of the line below after "p"
++func Test_edit_put_CTRL_E()
++  set encoding=latin1
++  new
++  let @" = ''
++  sil! norm orggRx
++  sil! norm pr
++  call assert_equal(['r', 'r'], getline(1, 2))
++  bwipe!
++  set encoding=utf-8
++endfunc
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index db1e9caf4d..917f82404b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,7 +18,8 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://no-path-adjust.patch \
            file://racefix.patch \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
-          file://CVE-2021-3778.patch \
+           file://CVE-2021-3778.patch \
+          file://CVE-2021-3796.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.30.1 (Apple Git-130)


