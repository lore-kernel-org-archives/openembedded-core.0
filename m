Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 82D377344B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FcUV020950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:39 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:30 -0800
Message-ID: <b1f4c2fe88feae04e8e705b19fec6f8608a66aeb.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] pth: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:37 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../pth/files/pth-fix-parallel.patch               |   48 ++++++++++++++++++++
 meta/recipes-support/pth/pth_2.0.7.bb              |    6 +--
 2 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/pth/files/pth-fix-parallel.patch

diff --git a/meta/recipes-support/pth/files/pth-fix-parallel.patch b/meta/recipes-support/pth/files/pth-fix-parallel.patch
new file mode 100644
index 0000000..08edaff
--- /dev/null
+++ b/meta/recipes-support/pth/files/pth-fix-parallel.patch
@@ -0,0 +1,48 @@
+From df06b8170745eac347acb95f9f374f257621254f Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 29 Jan 2015 18:11:00 -0800
+Subject: [PATCH] Makefile.in: fix for parallel build
+
+Fixed:
+* do_compile
+ pth_uctx.c:31:19: fatal error: pth_p.h: No such file or directory
+ #include "pth_p.h"
+                   ^
+compilation terminated.
+make: *** [pth_uctx.lo] Error 1
+
+* do_install:
+  cp: cannot create regular file `image/usr/lib/pkgconfig/#INST@15507#': No such file or directory
+
+Upstream-Status: Pending
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.in |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index de0390d..381a0ee 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -219,7 +219,8 @@ test_pthread: test_pthread.o test_common.o libpthread.la
+ 
+ #   install the package
+ install: all-for-install
+-	@$(MAKE) $(MKFLAGS) install-dirs install-pth @INSTALL_PTHREAD@ install-pkgconfigDATA
++	@$(MAKE) $(MKFLAGS) install-dirs
++	@$(MAKE) $(MKFLAGS) install-pth @INSTALL_PTHREAD@ install-pkgconfigDATA
+ 	@touch .done-install >/dev/null 2>&1 || $(TRUE)
+ 	@$(MAKE) $(MKFLAGS) what-next
+ install-dirs:
+@@ -432,7 +433,7 @@ TAGS:
+ ##  (AUTOMATICALLY UPDATED - DO NOT EDIT)
+ ##
+ 
+-$(LOBJS): Makefile
++$(LOBJS): Makefile pth_p.h
+ 
+ # DO NOT REMOVE
+ pth_attr.lo: pth_attr.c pth_p.h pth_vers.c pth.h pth_acdef.h pth_acmac.h
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/pth/pth_2.0.7.bb b/meta/recipes-support/pth/pth_2.0.7.bb
index 416e788..9037769 100644
--- a/meta/recipes-support/pth/pth_2.0.7.bb
+++ b/meta/recipes-support/pth/pth_2.0.7.bb
@@ -13,13 +13,13 @@ python __anonymous () {
 }
 
 SRC_URI = "${GNU_MIRROR}/pth/pth-${PV}.tar.gz \
-          file://pth-add-pkgconfig-support.patch"
+          file://pth-add-pkgconfig-support.patch \
+          file://pth-fix-parallel.patch \
+          "
 
 SRC_URI[md5sum] = "9cb4a25331a4c4db866a31cbe507c793"
 SRC_URI[sha256sum] = "72353660c5a2caafd601b20e12e75d865fd88f6cf1a088b306a3963f0bc77232"
 
-PARALLEL_MAKE=""
-
 BINCONFIG = "${bindir}/pth-config"
 
 inherit autotools binconfig-disabled pkgconfig
-- 
1.7.9.5


