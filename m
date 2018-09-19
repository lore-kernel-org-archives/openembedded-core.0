Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id EFF6F7949B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 13:02:58 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w8JD2wrw015833
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 15:02:59 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.201])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w8JD2w6v032107;
	Wed, 19 Sep 2018 15:02:58 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D346AA42C50;
	Wed, 19 Sep 2018 15:02:57 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 15:02:52 +0200
Message-Id: <20180919130252.28499-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] dropbear: remove localoptions.h in source searching
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2018 13:02:59 -0000

- localoptions.h is automatically searched in build directory

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-core/dropbear/dropbear.inc            |  1 -
 .../0007-fix-localoptions-search-path.patch        | 51 ----------------------
 2 files changed, 52 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index dc24ea71bf..d92a2f3991 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -15,7 +15,6 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://CVE-2018-15599.patch \
            file://0001-urandom-xauth-changes-to-options.h.patch \
-           file://0007-fix-localoptions-search-path.patch \
            file://init \
            file://dropbearkey.service \
            file://dropbear@.service \
diff --git a/meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch b/meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch
deleted file mode 100644
index 02a6cf9268..0000000000
--- a/meta/recipes-core/dropbear/dropbear/0007-fix-localoptions-search-path.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From a63288c4d203850110a5a72d27fa0d7202ceadbc Mon Sep 17 00:00:00 2001
-From: Andrej Valek <andrej.valek@siemens.com>
-Date: Tue, 10 Apr 2018 12:30:09 +0200
-Subject: [PATCH] fix localoptions.h searching in out of tree building
-
-When dropbear is build out of tree, is necessary to search for localoptions
-header file is source directory.
-
-Upstream-Status: Submitted [https://github.com/mkj/dropbear/pull/62]
-
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
----
- Makefile.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index e7d52a2..a615896 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -17,6 +17,9 @@ STATIC_LTM=libtommath/libtommath.a
- 
- LIBTOM_LIBS=@LIBTOM_LIBS@
- 
-+VPATH=@srcdir@
-+srcdir=@srcdir@
-+
- ifeq (@BUNDLED_LIBTOM@, 1)
- LIBTOM_DEPS=$(STATIC_LTC) $(STATIC_LTM) 
- LIBTOM_CLEAN=ltc-clean ltm-clean
-@@ -25,7 +28,7 @@ LIBTOM_LIBS=$(STATIC_LTC) $(STATIC_LTM)
- endif
- 
- OPTION_HEADERS = default_options_guard.h sysoptions.h
--ifneq ($(wildcard localoptions.h),)
-+ifneq ($(wildcard $(srcdir)/localoptions.h),)
- CFLAGS+=-DLOCALOPTIONS_H_EXISTS
- OPTION_HEADERS += localoptions.h
- endif
-@@ -65,9 +68,6 @@ dropbearkeyobjs=$(COMMONOBJS) $(KEYOBJS)
- dropbearconvertobjs=$(COMMONOBJS) $(CONVERTOBJS)
- scpobjs=$(SCPOBJS)
- 
--VPATH=@srcdir@
--srcdir=@srcdir@
--
- prefix=@prefix@
- exec_prefix=@exec_prefix@
- datarootdir = @datarootdir@
--- 
-2.11.0
-
-- 
2.11.0


