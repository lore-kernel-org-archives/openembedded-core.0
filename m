Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82662C433FE
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:16 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.10087.1632927554721798137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="224613751"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="224613751"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="520858405"
Received: from zkeh-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.143.173])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/10] vim: fix CVEs
Date: Wed, 29 Sep 2021 22:58:59 +0800
Message-Id: 
 <48a9709f955c1523918c891ca5c94f7bf5c71c54.1632903759.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632903759.git.anuj.mittal@intel.com>
References: <cover.1632903759.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 14:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156458

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix CVE-2021-3778 and CVE-2021-3796.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../vim/files/CVE-2021-3778.patch             | 34 +++++++++++++
 .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/recipes-support/vim/files/CVE-2021-3778.patch
new file mode 100644
index 0000000000..04ac413e56
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3778.patch
@@ -0,0 +1,34 @@
+From 9ba62f1042513fcadcc4e8fdcee171db66ef1d69 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 24 Sep 2021 15:15:24 +0800
+Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid utf-8
+ character
+
+Problem:    Reading beyond end of line with invalid utf-8 character.
+Solution:   Check for NUL when advancing.
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f]
+CVE: CVE-2021-3778
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/regexp_nfa.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
+index fb512f961..2806408de 100644
+--- a/src/regexp_nfa.c
++++ b/src/regexp_nfa.c
+@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, char_u *match_text)
+ 		match = FALSE;
+ 		break;
+ 	    }
+-	    len2 += MB_CHAR2LEN(c2);
++	    len2 += enc_utf8 ? utf_ptr2len(rex.line + col + len2)
++	                                                     : MB_CHAR2LEN(c2);
+ 	}
+ 	if (match
+ 		// check that no composing char follows
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
new file mode 100644
index 0000000000..31475af04c
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
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/normal.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/normal.c b/src/normal.c
+index c4963e621..305b514bc 100644
+--- a/src/normal.c
++++ b/src/normal.c
+@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
+ 	    {
+ 		/*
+ 		 * Get ptr again, because u_save and/or showmatch() will have
+-		 * released the line.  At the same time we let know that the
+-		 * line will be changed.
++		 * released the line. This may also happen in ins_copychar().
++		 * At the same time we let know that the line will be changed.
+ 		 */
+-		ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+ 		if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
+ 		{
+ 		  int c = ins_copychar(curwin->w_cursor.lnum
+ 					   + (cap->nchar == Ctrl_Y ? -1 : 1));
++
++		  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+ 		  if (c != NUL)
+ 		    ptr[curwin->w_cursor.col] = c;
+ 		}
+ 		else
++		{
++		    ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
+ 		    ptr[curwin->w_cursor.col] = cap->nchar;
++		}
+ 		if (p_sm && msg_silent == 0)
+ 		    showmatch(cap->nchar);
+ 		++curwin->w_cursor.col;
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6fe8fb90db..e45f9b828d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -17,6 +17,8 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+           file://CVE-2021-3778.patch \
+           file://CVE-2021-3796.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
-- 
2.31.1


