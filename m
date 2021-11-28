Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F0DC433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.53350.1638136715881715443
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nEZ7q+ri;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id o14so10493713plg.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OzR5WzVJ/f0+yez32KGUtPHzvE/tFuNAfquUfDL4KUE=;
        b=nEZ7q+ri56XC9SsyKs+rolCXFBZGWgvi6eBg0JcbUCQSpubfmbL34Ksr0A0p1LqCg1
         HqHLDMN6b1fOkt090GOEnEH91fuQnxGrTCNOyH6aGPONwSwVJdc84cUClTSv0iPseCqQ
         bhTSzr96c7Mce6stpQRZJyI2+mn1m1nwJei/3xG8FgTsJykpCV1XD85cMC73jEsG9uF1
         1o1ZFLmz0cEEHvy0ldsQpFfWAEy4IeIvYMgzM5CjdKnNcZz9cvpjyk879PiaHgJ/6O4b
         lXOMsnf3cDip0f9+0l6Kc/K0LlspQKufXjNvFQfxZJG5DVRzC698xndu6XFFzmOK//ar
         /oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzR5WzVJ/f0+yez32KGUtPHzvE/tFuNAfquUfDL4KUE=;
        b=S2qapns+kBp3NvCK8vdNs5e6l57Mwi2tttP8IYQAwtc8Luf+ZdzJs7lMQ8hN9YaVj2
         d6j3dFx7JTxtYFIhqapfsldmy0n3wv4aysvLuuvjWtVzQFdRCmh0nx1Z5CMW+aUPh9qU
         6j6TRIZOXxJCrPnLoUk1UpYMy5GHt4rsfJeq1T3tSRyfKwZxwK6rk49VcWBaQii421Y/
         zg8rea8+yVX869cSlCPvqcw8WbT51+7EOdeBjWExR2Y8ZfF0rrUP+aiCToTZ8eC9mrPt
         QA8e7rad3XTCp936GXoBzhS8+gYgCWPh4A8xkgF7z6gUOyjVKqq4P8QcR6RMU/TtARBr
         ZJ/A==
X-Gm-Message-State: AOAM530OED1ZSXj8+iqifrP0SI9CmlzxUr5u1Nox8ukWpShT1YL84FGr
	jogtOTSUkrOhtoJj1xAPxd6gu2TpihD5Yns5478=
X-Google-Smtp-Source: 
 ABdhPJzWvQsc4KkwFkDahjHAvvoyXjLEI+ATsrgyD6Oa2+ip6F1jxtrLz+5qEBjsON1xuG53AH7TAQ==
X-Received: by 2002:a17:902:c7c4:b0:141:deb4:1b2f with SMTP id
 r4-20020a170902c7c400b00141deb41b2fmr55414878pla.44.1638136714677;
        Sun, 28 Nov 2021 13:58:34 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/42] Revert "vim: fix 2021-3796"
Date: Sun, 28 Nov 2021 11:57:19 -1000
Message-Id: 
 <bf489893714d1c2d2e4694a5a1e313b661c9fdc4.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158889

This reverts commit 53ce5f292fd8d65fd89c977364ea6f7d813c7566.

Reverting in preparation for fixes from master

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/CVE-2021-3796.patch             | 50 -------------------
 1 file changed, 50 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
deleted file mode 100644
index 666bd5c48b..0000000000
--- a/meta/recipes-support/vim/files/CVE-2021-3796.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 6d02e1429771c00046b48f26e53ca4123c3ce4e1 Mon Sep 17 00:00:00 2001
-From: Bram Moolenaar <Bram@vim.org>
-Date: Fri, 24 Sep 2021 16:01:09 +0800
-Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
-
-Problem:    Using freed memory when replacing. (Dhiraj Mishra)
-Solution:   Get the line pointer after calling ins_copychar().
-
-Upstream-Status: Backport [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
-CVE: CVE-2021-3796
-
-Signed-off-by: Minjae Kim  <flowergom@gmail.com>
----
- src/normal.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/normal.c b/src/normal.c
-index c4963e621..305b514bc 100644
---- a/src/normal.c
-+++ b/src/normal.c
-@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
-           {
-               /*
-                * Get ptr again, because u_save and/or showmatch() will have
--               * released the line.  At the same time we let know that the
--               * line will be changed.
-+               * released the line. This may also happen in ins_copychar().
-+               * At the same time we let know that the line will be changed.
-                */
--              ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
-               if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
-               {
-                 int c = ins_copychar(curwin->w_cursor.lnum
-                                          + (cap->nchar == Ctrl_Y ? -1 : 1));
-+
-+                ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
-                 if (c != NUL)
-                   ptr[curwin->w_cursor.col] = c;
-               }
-               else
-+              {
-+                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
-                   ptr[curwin->w_cursor.col] = cap->nchar;
-+              }
-               if (p_sm && msg_silent == 0)
-                   showmatch(cap->nchar);
-               ++curwin->w_cursor.col;
--- 
-2.17.1
-
-- 
2.25.1


