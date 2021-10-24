Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A34C433F5
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 06:40:51 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.16008.1635057650512268506
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 23:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Iu04vJ3B;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: flowergom@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id c4so1805867plg.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 23:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krtSax32GnRQMzmPTsASn5VDp0W7ykD8vBpdkjaAbtI=;
        b=Iu04vJ3BPneJmjnp4Mc2AJBm3wwJliCjz5HoANka1d2S3yJ5txB6FZGCKXuG7xDlTZ
         g7nFTnKGVCd+tkxdjxQdsRTMxENGiNCmLc4O2SOmSkg5ZHYn+YVIajJJGKSXcFdMJ6J0
         e4E7ApsPO98tlprJO0nAWq3rqr+mQ5cvITp1Ljr4azKP2t5bun3ZC8EVPyegcABDR4te
         coc1S9XdZTkgIfO26qko8wxbero+NPGijfbH7QQ/83VLNfdoRdr2YPqvLHlF3h1jGS7V
         0XYTtydNvYyVTsP5cbcgE7Qv4eFMBq8ydNACr9vOPq2CSaDZ3IvQBrMr/ypKj4bb5CPO
         qbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=krtSax32GnRQMzmPTsASn5VDp0W7ykD8vBpdkjaAbtI=;
        b=KUN4RcT4oTJhFCNJudNpxDLZqxEBM4rWM25JDpFsj9aH7tM/wTokHfbDiUMFp05Tqn
         5ItPxFr73GXihZRg5JzXqwtJ+Uu4FAd3yfUJ+xdsH1FybdO3mx35pDsErXYg9YhKjQc3
         JI83bxz73mnKoY+Fz1+quJ5H5ekA8CdPKGcRrUbQkqAirturDrs1Vc8F6GDJ6/+koO/c
         PYCkITzwJ/KW7XIbgBtn2eAddgokcGHA5n/N9236b8HPLj7pK3iFvnbVkGtxPXmYoaSO
         wMXEPV1NxibnbDg7Fw3ZoG11OrngjM4aVUKFMePKF4TElvwV4QE3DmKxYf06w1A8STO2
         W7dA==
X-Gm-Message-State: AOAM532XgDETNCP7+Oj/lkR2rJXBTMcqGBii9QtY3nzfyoIBlaXEesKr
	Cj5/fDRcqVJ5GNI8QHwzue8r3ovDcSMTxNsF1dc=
X-Google-Smtp-Source: 
 ABdhPJxxjRod1/Lz6KBGlBJP6JoLz64FR2s/Iw91pqwXu8vWDZDz1XJP1tSW6DDpqiYBFa0k/UO+LA==
X-Received: by 2002:a17:90a:8912:: with SMTP id
 u18mr11451926pjn.69.1635057649365;
        Sat, 23 Oct 2021 23:40:49 -0700 (PDT)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 y9sm14324995pjj.6.2021.10.23.23.40.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 23 Oct 2021 23:40:48 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH v2] vim: fix 2021-3796
Date: Sun, 24 Oct 2021 15:40:42 +0900
Message-Id: <20211024064042.1088-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 06:40:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157321

vim is vulnerable to Use After Free
Problem: Checking first character of url twice.

reference:
https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
---
 .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  3 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
new file mode 100644
index 0000000000..666bd5c48b
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
@@ -0,0 +1,50 @@
+From 6d02e1429771c00046b48f26e53ca4123c3ce4e1 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 24 Sep 2021 16:01:09 +0800
+Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
+
+Problem:    Using freed memory when replacing. (Dhiraj Mishra)
+Solution:   Get the line pointer after calling ins_copychar().
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
+CVE: CVE-2021-3796
+
+Signed-off-by: Minjae Kim  <flowergom@gmail.com>
+---
+ src/normal.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/normal.c b/src/normal.c
+index c4963e621..305b514bc 100644
+--- a/src/normal.c
++++ b/src/normal.c
+@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
+           {
+               /*
+                * Get ptr again, because u_save and/or showmatch() will have
+-               * released the line.  At the same time we let know that the
+-               * line will be changed.
++               * released the line. This may also happen in ins_copychar().
++               * At the same time we let know that the line will be changed.
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
+               }
+               else
++              {
++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+                   ptr[curwin->w_cursor.col] = cap->nchar;
++              }
+               if (p_sm && msg_silent == 0)
+                   showmatch(cap->nchar);
+               ++curwin->w_cursor.col;
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


