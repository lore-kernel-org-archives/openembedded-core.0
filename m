Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D284C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 07:29:10 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.28964.1635146949231096078
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 00:29:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ad9VuhsC;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: flowergom@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id f11so9859199pfc.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xj+ABG9a7iu38t6qKDA/i4OjdD2iZppb+J+PkvME+08=;
        b=Ad9VuhsCB/FO7EkeSwmK5ioRy1ZWQJ857YTctqxpoG31br7ok5YiiYH4UF1GhCNUmT
         kksQXSjcJXjfiZmAHrG1/kb+bwzJoUe9/hUKvfmuOjAv8I3NMz2tFpO4h+u0ZA0Bms6v
         oIpQiozKqCcx7NXma7+lKokat89eBqUsQ/wBNGJgWvaZvmQ+SLcdZC4xB13S2cfEY1sP
         jKNoTdIqXaY1928wbUkldlu9tHCbISz6kydMzCsl0S8X5quqHjDxNoFArXDOKSi3yb8t
         Hq9Sau+yg0CCr+wLOmjFZvG5sWCEscr9kXmJOkVwEz09YqUtLOnZi91uRuuVN/P3MGj5
         e6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xj+ABG9a7iu38t6qKDA/i4OjdD2iZppb+J+PkvME+08=;
        b=V0cLNid9Sk2OJeQ/NQnSpTaM6yXYcwBGl14E0EeyFNbX44scdGJmdvcRu72gcE02Ct
         JC/hMd1QSAbCXXtPUYlymChk4NInq/q88b7ZOU9KPuhSS5S0cSfrtLy+aX2jVYADeaN+
         1QeCYzbuSzsxsT51XHbfBoeqFSpnAFVjirLpwvFW3xm4pkduqVrQggw8hbhhGOsEswCM
         Z6gUSRflL2IQXP7XipQPIX+ziqZ119jaeyJgXMXwwxZuzfMO58HN+s/GZi6g/xVHHMwW
         0z3GWijuJlEnclgDssQuTUKKdObrufgFl911BvTXuFZIq+OdI3hMLQ+0l4mW7fnOUDHb
         aFLA==
X-Gm-Message-State: AOAM530fy7cGr3N1IPEGIrPEVvudoqpQbT5U/GQHgxOpqli0kmgSRhJr
	Q2wjWk+hO3Qj7XAarcAwpOAGw4f9qQ4f1XWtXl8=
X-Google-Smtp-Source: 
 ABdhPJyxpITo2Kbfyma6c1ig2xxC5TNC9SVRWk730/+j+c2atbQPeTkEuQHJNSBM8BUaXl7IbLrimw==
X-Received: by 2002:a62:1647:0:b0:47b:f098:1005 with SMTP id
 68-20020a621647000000b0047bf0981005mr4043641pfw.40.1635146948272;
        Mon, 25 Oct 2021 00:29:08 -0700 (PDT)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 n19sm3272837pjq.40.2021.10.25.00.29.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Oct 2021 00:29:07 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH v2] vim: fix 2021-3796
Date: Mon, 25 Oct 2021 16:28:57 +0900
Message-Id: <20211025072857.910-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 07:29:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157332

vim is vulnerable to Use After Free
Problem: Checking first character of url twice.

reference:
https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3

Signed-off-by: Minjae Kim <flowergom@gmail.com>
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
2.30.1 (Apple Git-130)


