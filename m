Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8917BC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:20:53 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.4837.1637140852441687400
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AH9KhaF000911
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:43 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AH9KbtV026218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:43 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 01:20:39 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 01:20:38 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 01:20:37 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/4] vim: fix CVE-2021-3875
Date: Wed, 17 Nov 2021 17:18:24 +0800
Message-ID: <20211117091826.22740-2-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117091826.22740-1-mingli.yu@windriver.com>
References: <20211117091826.22740-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 09:20:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158382

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to fix CVE-2021-3875.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../vim/files/CVE-2021-3875.patch             | 37 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3875.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3875.patch b/meta/recipes-support/vim/files/CVE-2021-3875.patch
new file mode 100644
index 0000000000..d62d875f8e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3875.patch
@@ -0,0 +1,37 @@
+From 40aa9802ef56d3cdbe256b4c9e58049953051a2d Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Mon, 15 Nov 2021 14:34:50 +0800
+Subject: [PATCH] patch 8.2.3489: ml_get error after search with range
+
+Problem:    ml_get error after search with range.
+Solution:   Limit the line number to the buffer line count.
+
+CVE: CVE-2021-3875
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/35a319b77f897744eec1155b736e9372c9c5575f]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/ex_docmd.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/ex_docmd.c b/src/ex_docmd.c
+index fb07450f8..89d33ba90 100644
+--- a/src/ex_docmd.c
++++ b/src/ex_docmd.c
+@@ -3586,8 +3586,10 @@ get_address(
+ 
+ 		    // When '/' or '?' follows another address, start from
+ 		    // there.
+-		    if (lnum != MAXLNUM)
+-			curwin->w_cursor.lnum = lnum;
++		    if (lnum > 0 && lnum != MAXLNUM)
++			curwin->w_cursor.lnum =
++			        lnum > curbuf->b_ml.ml_line_count
++			                   ? curbuf->b_ml.ml_line_count : lnum;
+ 
+ 		    // Start a forward search at the end of the line (unless
+ 		    // before the first line).
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 362c822f05..315fb32ca9 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
            file://CVE-2021-3903.patch \
            file://CVE-2021-3872.patch \
+           file://CVE-2021-3875.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.17.1


