Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.5641.1632473672868978670
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 18O8sUjG006282
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 01:54:31 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 24 Sep 2021 01:54:30 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 24 Sep 2021 01:54:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 24 Sep 2021 01:54:29 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] vim: fix CVEs
Date: Fri, 24 Sep 2021 16:53:35 +0800
Message-ID: <20210924085335.34911-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix CVE-2021-3778 and CVE-2021-3796.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../vim/files/CVE-2021-3778.patch             | 33 +++++++++++++
 .../vim/files/CVE-2021-3796.patch             | 49 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +
 3 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/recipes-support/vim/files/CVE-2021-3778.patch
new file mode 100644
index 0000000000..918ebb1bfc
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3778.patch
@@ -0,0 +1,33 @@
+From 9ba62f1042513fcadcc4e8fdcee171db66ef1d69 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 24 Sep 2021 15:15:24 +0800
+Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid utf-8
+ character
+
+Problem:    Reading beyond end of line with invalid utf-8 character.
+Solution:   Check for NUL when advancing.
+
+Upstream-Status: Backport[https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f]
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
index 0000000000..b4eeae05aa
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
@@ -0,0 +1,49 @@
+From 6d02e1429771c00046b48f26e53ca4123c3ce4e1 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Fri, 24 Sep 2021 16:01:09 +0800
+Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
+
+Problem:    Using freed memory when replacing. (Dhiraj Mishra)
+Solution:   Get the line pointer after calling ins_copychar().
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
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
2.17.1

