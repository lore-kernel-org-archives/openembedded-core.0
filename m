Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A48DC433FE
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:37 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.88631.1638342986688137482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344641"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344641"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:36 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918923"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 12/14] python3: upgrade 3.9.5 -> 3.9.6
Date: Wed,  1 Dec 2021 15:16:12 +0800
Message-Id: 
 <3b721c28543df9e4d899ea1efdf445319c88ae92.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159015

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
removed since it is included in 3.9.6

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a12d978f2046fc5d3abc96db3753e378f29ecae)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...sue36464-parallel-build-race-problem.patch | 34 -------------------
 .../{python3_3.9.5.bb => python3_3.9.6.bb}    |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
 rename meta/recipes-devtools/python/{python3_3.9.5.bb => python3_3.9.6.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
deleted file mode 100644
index 237645bc60..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 840fda32c82550259d02a7a56a78a9c05162b1a1 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 8 May 2019 16:10:29 +0800
-Subject: [PATCH] Makefile: fix Issue36464 (parallel build race problem)
-
-When using make -j with the 'install' target, it's possible for altbininstall
-(which normally creates BINDIR) and libainstall (which doesn't, though it
-installs python-config there) to race, resulting in a failure due to
-attempting to install python-config into a nonexistent BINDIR. Ensure it also
-exists in the libainstall target.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/13186]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- Makefile.pre.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.pre.in b/Makefile.pre.in
-index 15f3687..7e9f173 100644
---- a/Makefile.pre.in
-+++ b/Makefile.pre.in
-@@ -1456,7 +1456,7 @@ LIBPL=		@LIBPL@
- LIBPC=		$(LIBDIR)/pkgconfig
- 
- libainstall:	@DEF_MAKE_RULE@ python-config
--	@for i in $(LIBDIR) $(LIBPL) $(LIBPC); \
-+	@for i in $(LIBDIR) $(LIBPL) $(LIBPC) $(BINDIR); \
- 	do \
- 		if test ! -d $(DESTDIR)$$i; then \
- 			echo "Creating directory $$i"; \
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.6.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.9.5.bb
rename to meta/recipes-devtools/python/python3_3.9.6.bb
index 2b05bd530e..7fa6fc62dc 100644
--- a/meta/recipes-devtools/python/python3_3.9.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.6.bb
@@ -20,7 +20,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://python-config.patch \
            file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
            file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
-           file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
            file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
            file://crosspythonpath.patch \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
@@ -39,7 +38,7 @@ SRC_URI_append_class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "0c5a140665436ec3dbfbb79e2dfb6d192655f26ef4a29aeffcb6d1820d716d83"
+SRC_URI[sha256sum] = "397920af33efc5b97f2e0b57e91923512ef89fc5b3c1d21dbfc8c4828ce0108a"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.33.1


