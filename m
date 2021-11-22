Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBC7C4167B
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.1409.1637547653184145617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122220"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122220"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:45 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428859"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:44 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/16] vim: fix CVE-2021-3875
Date: Mon, 22 Nov 2021 10:20:17 +0800
Message-Id: 
 <de2493aac4f8ea9d8e4e59efa1359567fa186319.1637546583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 02:20:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158547

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch to fix CVE-2021-3875.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
index 1841498b74..65b0b2e330 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
            file://CVE-2021-3903.patch \
            file://CVE-2021-3872.patch \
+           file://CVE-2021-3875.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.33.1


