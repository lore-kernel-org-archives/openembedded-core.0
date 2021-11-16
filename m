Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE81C433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:13 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.378.1637080325948614472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214448487"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="214448487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:12 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956689"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/17] vim: add patch number to CVE-2021-3778 patch
Date: Wed, 17 Nov 2021 00:31:46 +0800
Message-Id: 
 <851a5d697918247c05f7d59782f84c430771fd48.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158353

From: Ross Burton <ross@burtonini.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 222be29051a3543ac63a0eb07019e90d44429b16)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../vim/files/CVE-2021-3778.patch             | 37 +++++++++++++------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/recipes-support/vim/files/CVE-2021-3778.patch
index 769a7a07ac..544af04458 100644
--- a/meta/recipes-support/vim/files/CVE-2021-3778.patch
+++ b/meta/recipes-support/vim/files/CVE-2021-3778.patch
@@ -1,4 +1,4 @@
-From eb41373c8c88b0789e5cf04669d6116f9a199264 Mon Sep 17 00:00:00 2001
+From 6d351cec5b97cb72b226d03bd727e453a235ed8d Mon Sep 17 00:00:00 2001
 From: Minjae Kim <flowergom@gmail.com>
 Date: Sun, 26 Sep 2021 23:48:00 +0000
 Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid utf-8
@@ -10,16 +10,18 @@ Solution: Check for NUL when advancing.
 Upstream-Status: Accepted [https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f]
 CVE: CVE-2021-3778
 Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
 ---
  src/regexp_nfa.c                 | 3 ++-
  src/testdir/test_regexp_utf8.vim | 7 +++++++
- 2 files changed, 9 insertions(+), 1 deletion(-)
+ src/version.c                    | 2 ++
+ 3 files changed, 11 insertions(+), 1 deletion(-)
 
-Index: git/src/regexp_nfa.c
-===================================================================
---- git.orig/src/regexp_nfa.c
-+++ git/src/regexp_nfa.c
-@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int re
+diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
+index fb512f961..ace83a1a3 100644
+--- a/src/regexp_nfa.c
++++ b/src/regexp_nfa.c
+@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, char_u *match_text)
  		match = FALSE;
  		break;
  	    }
@@ -29,10 +31,10 @@ Index: git/src/regexp_nfa.c
  	}
  	if (match
  		// check that no composing char follows
-Index: git/src/testdir/test_regexp_utf8.vim
-===================================================================
---- git.orig/src/testdir/test_regexp_utf8.vim
-+++ git/src/testdir/test_regexp_utf8.vim
+diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_utf8.vim
+index 19ff882be..e0665818b 100644
+--- a/src/testdir/test_regexp_utf8.vim
++++ b/src/testdir/test_regexp_utf8.vim
 @@ -215,3 +215,10 @@ func Test_optmatch_toolong()
    set re=0
  endfunc
@@ -44,3 +46,16 @@ Index: git/src/testdir/test_regexp_utf8.vim
 +  bwipe!
 +  call delete('Xinvalid')
 +endfunc
+diff --git a/src/version.c b/src/version.c
+index 8912f6215..85bdfc601 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -742,6 +742,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    3409,
+ /**/
+     3402,
+ /**/
-- 
2.33.1


