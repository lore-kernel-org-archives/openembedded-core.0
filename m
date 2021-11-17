Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B94C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 09:20:52 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.4804.1637140851465948803
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AH9KolW000933
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:51 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1AH9KoOl026224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 01:20:50 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 01:20:50 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 01:20:47 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 01:20:46 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 4/4] vim: fix CVE-2021-3927 and CVE-2021-3928
Date: Wed, 17 Nov 2021 17:18:26 +0800
Message-ID: <20211117091826.22740-4-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117091826.22740-1-mingli.yu@windriver.com>
References: <20211117091826.22740-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 09:20:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158381

From: Mingli Yu <mingli.yu@windriver.com>

Backport patches to fix CVE-2021-3927 and CVE-2021-3928.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
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
index 315fb32ca9..a953c6953d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -23,6 +23,8 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://CVE-2021-3903.patch \
            file://CVE-2021-3872.patch \
            file://CVE-2021-3875.patch \
+           file://CVE-2021-3927.patch \
+           file://CVE-2021-3928.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.17.1


