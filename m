Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3461FC4332F
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:55 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.1452.1637547654753978524
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122222"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122222"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:48 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428868"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:47 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/16] vim: fix CVE-2021-3927 and CVE-2021-3928
Date: Mon, 22 Nov 2021 10:20:19 +0800
Message-Id: 
 <41ba5054fc4d014ab3a2af0cc7673e275aaecee0.1637546583.git.anuj.mittal@intel.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/158551

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix CVE-2021-3927 and CVE-2021-3928.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../vim/files/CVE-2021-3927.patch             | 32 +++++++++++++++++
 .../vim/files/CVE-2021-3928.patch             | 34 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 ++
 3 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3927.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3928.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3927.patch b/meta/recipes-support/vim/files/CVE-2021-3927.patch
new file mode 100644
index 0000000000..90b1b6b82e
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3927.patch
@@ -0,0 +1,32 @@
+From f334a87204b4aab76536063b37b4d4a10be46a3a Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Wed, 17 Nov 2021 11:09:48 +0800
+Subject: [PATCH] patch 8.2.3581: reading character past end of line
+
+Problem:    Reading character past end of line.
+Solution:   Correct the cursor column.
+
+CVE: CVE-2021-3927
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/0b5b06cb4777d1401fdf83e7d48d287662236e7e]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/ex_docmd.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ex_docmd.c b/src/ex_docmd.c
+index 89d33ba90..54d7f4cb3 100644
+--- a/src/ex_docmd.c
++++ b/src/ex_docmd.c
+@@ -6905,6 +6905,7 @@ ex_put(exarg_T *eap)
+ 	eap->forceit = TRUE;
+     }
+     curwin->w_cursor.lnum = eap->line2;
++    check_cursor_col();
+     do_put(eap->regname, eap->forceit ? BACKWARD : FORWARD, 1L,
+ 						       PUT_LINE|PUT_CURSLINE);
+ }
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/files/CVE-2021-3928.patch b/meta/recipes-support/vim/files/CVE-2021-3928.patch
new file mode 100644
index 0000000000..8672367ab9
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3928.patch
@@ -0,0 +1,34 @@
+From ad7f7a3f81077ddfac451acd33ca049b9f2a5178 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Wed, 17 Nov 2021 11:22:21 +0800
+Subject: [PATCH] patch 8.2.3582: reading uninitialized memory when giving
+ spell suggestions
+
+Problem:    Reading uninitialized memory when giving spell suggestions.
+Solution:   Check that preword is not empty.
+
+CVE: CVE-2021-3928
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/15d9890eee53afc61eb0a03b878a19cb5672f732]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/spellsuggest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/spellsuggest.c b/src/spellsuggest.c
+index 9d6df7930..88307b203 100644
+--- a/src/spellsuggest.c
++++ b/src/spellsuggest.c
+@@ -1600,7 +1600,7 @@ suggest_trie_walk(
+ 		    // char, e.g., "thes," -> "these".
+ 		    p = fword + sp->ts_fidx;
+ 		    MB_PTR_BACK(fword, p);
+-		    if (!spell_iswordp(p, curwin))
++		    if (!spell_iswordp(p, curwin) && *preword != NUL)
+ 		    {
+ 			p = preword + STRLEN(preword);
+ 			MB_PTR_BACK(preword, p);
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 65b0b2e330..864006192b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://CVE-2021-3903.patch \
            file://CVE-2021-3872.patch \
            file://CVE-2021-3875.patch \
+           file://CVE-2021-3927.patch \
+           file://CVE-2021-3928.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.33.1


