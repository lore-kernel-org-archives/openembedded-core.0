Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B60C433F5
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 03:42:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.3625.1634874123129398409
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pp2I3ou5;
 spf=pass (domain: gmail.com, ip: 209.85.216.49,
 mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id oa4so1980540pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 20:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yx3s9lSyADPfaMXrzmeN+R3QJcqH+Fc15tUq07S2S0=;
        b=pp2I3ou5F37gNFpQOH6zdfIw5UVRWeTFRBi4KEM0IWXhB16GB6asyRowBeH/QiWaWV
         bKNjxLcR7dYcPZJSWfLoko8BfyACGVDyIqJPI473g5MFXPyuKbHd3OEYCuEZe5buzr/b
         ZK5NsDTu+JfY2ioibe8MdlFKlEFZmkmMF1XW/OPHWjJnpZmSXt86s3zBAhX/riGSeOP3
         KuoJcu9tCzQxIsFGIaPna2jyd8OdqIhpIwgDN9K0+5Tm2tZEVjNH7B5ZudizS5yPwyZg
         iw3O8NmfiXFt0YFU+lIEhWdmK0gaNjTlolbPDA0iXQ+42+y63qmpcfa9EXcrP9QSkya7
         gd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8yx3s9lSyADPfaMXrzmeN+R3QJcqH+Fc15tUq07S2S0=;
        b=rFFxT8hGrlvYBYaJMT4jayINf8pVQySqOh60hCZCKgIi35DMmXtOwII8+F23RyFg3V
         DpvqxGpErV/4PtJvPERl3tg5xLROOavI/nbkzkIgQZ8lUIhfJIlwGj5OuVEDffkX/bKr
         hp5dSdWRBGSTUilx51jCwPFN4wOnxMZyGBgt97KGDp8EpfxETEvWch6xmB02R1zX9Qsb
         k4lXBbmXmhaFd61eFDdPD96gRTJej3rZs8OH38X+I9NsdzBsTpr01BqBJ4GFlt6Z+CFw
         xAoKWaUfgavRVLSbbLLozRpzW/HLql0mtojiZayjS5aO8uY+g5KJit2Y34/Pube94UXv
         BGtg==
X-Gm-Message-State: AOAM531Wh1sF7ITZjkyl2jmHcYBrgfADFK9WSNsEqU21IsE9+q7gox0t
	GuhKFEv2RE1X4tmpynchIyBhIAXeYx1mjLp5RpU=
X-Google-Smtp-Source: 
 ABdhPJxZD7RE/DaiLk9lDoxCHJR1WRWEHSuUpGJYH+6fSjy5bgRjkSwdk9eisK8MbSmCulieOTLPxg==
X-Received: by 2002:a17:902:e883:b0:13f:1393:d185 with SMTP id
 w3-20020a170902e88300b0013f1393d185mr9121887plg.64.1634874122204;
        Thu, 21 Oct 2021 20:42:02 -0700 (PDT)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 a20sm7432561pfn.136.2021.10.21.20.42.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Oct 2021 20:42:01 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] vim: fix 2021-3796
Date: Fri, 22 Oct 2021 12:41:56 +0900
Message-Id: <20211022034156.1551-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Oct 2021 03:42:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157293

vim is vulnerable to Use After Free
Problem: Checking first character of url twice.

reference:
https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
---
 .../vim/files/CVE-2021-3796.patch             | 70 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 71 insertions(+)
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
index fc4e205b74..0973a368c0 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://racefix.patch \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
 	   file://CVE-2021-3778.patch \
+           file://CVE-2021-3796.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.30.1 (Apple Git-130)


