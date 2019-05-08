Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D39147DD9F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:05:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x48A5SPH019106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2019 03:05:29 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 8 May 2019 03:05:28 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2019 18:05:27 +0800
Message-ID: <1557309927-99133-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python3: fix do_install fail for parallel buiild
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
X-List-Received-Date: Wed, 08 May 2019 10:05:29 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

When using make -j with the 'install' target, it's possible for altbininstall
(which normally creates BINDIR) and libainstall (which doesn't, though it
installs python-config there) to race, resulting in a failure due to
attempting to install python-config into a nonexistent BINDIR. Ensure it also
exists in the libainstall target.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ix-Issue36464-parallel-build-race-problem.patch | 34 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.3.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
new file mode 100644
index 0000000..237645b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
@@ -0,0 +1,34 @@
+From 840fda32c82550259d02a7a56a78a9c05162b1a1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 8 May 2019 16:10:29 +0800
+Subject: [PATCH] Makefile: fix Issue36464 (parallel build race problem)
+
+When using make -j with the 'install' target, it's possible for altbininstall
+(which normally creates BINDIR) and libainstall (which doesn't, though it
+installs python-config there) to race, resulting in a failure due to
+attempting to install python-config into a nonexistent BINDIR. Ensure it also
+exists in the libainstall target.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/13186]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile.pre.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 15f3687..7e9f173 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1456,7 +1456,7 @@ LIBPL=		@LIBPL@
+ LIBPC=		$(LIBDIR)/pkgconfig
+ 
+ libainstall:	@DEF_MAKE_RULE@ python-config
+-	@for i in $(LIBDIR) $(LIBPL) $(LIBPC); \
++	@for i in $(LIBDIR) $(LIBPL) $(LIBPC) $(BINDIR); \
+ 	do \
+ 		if test ! -d $(DESTDIR)$$i; then \
+ 			echo "Creating directory $$i"; \
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
index 081ecf4..413d35a 100644
--- a/meta/recipes-devtools/python/python3_3.7.3.bb
+++ b/meta/recipes-devtools/python/python3_3.7.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0002-Don-t-do-runtime-test-to-get-float-byte-order.patch \
            file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
+           file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


