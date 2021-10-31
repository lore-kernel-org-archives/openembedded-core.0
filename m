Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DAFC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:06 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.33501.1635699485811867128
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=A31nThjp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id gn3so10634602pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IcYA1RDOzEnuM1vHVmLChPudH6llZ5bsBSTYl4XKaio=;
        b=A31nThjpOdJm/ygcHcg/s+fKbDEYSAaehNhfQNJEW7yKdQMJW7aEHtswp0Me/Mn1Ry
         nlUtXMPC2JoL0B30B222tzGlAV3BO1gmPXo/z6BoUGqL4HTcgkyC3psFLBMCK7qG5tqU
         MxtQ8v9zoIm06ZjhQ1f5Y4WnBTR/9nDMq9sNqJrvtpKNlnTc+ofIzJoZwFV8Q/aqDCGr
         3wBdwhJCVEahdQdNwkdoL2Ug90ZZZOclC9ZF1B8XyXOmmv9ImIibhfnKvLHe/CiX60Ua
         NZxJ8DlRrpu6VaWSoWOPH6ztHBVOU6jrMzhQKYHIMKGNh+v95xQ6fdX52EOlJYNb5B2U
         uKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IcYA1RDOzEnuM1vHVmLChPudH6llZ5bsBSTYl4XKaio=;
        b=YKldEei+hSb6mLCveldWA5EqZMyQeRQpftoZg54AUpH4yGGvYhR+yg4vVocCYLf3ro
         +s5q6fwtdVwZifVRIF3XGfqlENptheARz0a1eFCIFbT1mSPkCC4xhjYtf1+f78IaUlXw
         oEsZ5jXixACodN92QdTkyRFwtxMXAbMeuxg2UClEzYY2TV+Wle72fvt5vLCkOf8e0Typ
         IbWQz+5odTbLl2BkT7Xx4mCu5+G7iNFvaWMv6t+pUk80wcvlcXUyBk4UNlJlqa6R3BiG
         u7n0stja+b15b1/sVFPpEs2hNZ8OErRc8dSf0nWn14Cz9UFWePaV5fm+bZ9XadW4z4vp
         S4VQ==
X-Gm-Message-State: AOAM533YWX8vkB7Q/5v/dXe1dT3299K0Kj1SzFst7Oe/XoG+kLmpTER2
	t+SWNkJXMSFvW4qVi2kCEpve8AsJVQk00HDjFIM=
X-Google-Smtp-Source: 
 ABdhPJwyJkiyGLZN1JeGpJD8S0hPm03RjijPxbhhuk4fyuc67WlUoIOAO8HldMzuCla/YRddJXNMVw==
X-Received: by 2002:a17:90a:b786:: with SMTP id
 m6mr32933890pjr.30.1635699484935;
        Sun, 31 Oct 2021 09:58:04 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/29] vim: fix 2021-3796
Date: Sun, 31 Oct 2021 06:57:21 -1000
Message-Id: 
 <53ce5f292fd8d65fd89c977364ea6f7d813c7566.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157660

From: Minjae Kim <flowergom@gmail.com>

vim is vulnerable to Use After Free
Problem: Checking first character of url twice.

reference:
https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3

Signed-off-by: Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
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
-- 
2.25.1


