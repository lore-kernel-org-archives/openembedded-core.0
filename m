Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id BC65C76FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 14:38:01 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nH12j73Mxz3hkLg;
	Thu, 17 Sep 2015 16:31:57 +0200 (CEST)
X-Auth-Info: wIlSk8l0Lz1B19eCvSlVWA3pw2Tz8A+zrV1fqIJXS+g=
Received: from chi.lan (host-82-135-33-74.customer.m-online.net [82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3nH12j0clDzvhTg;
	Thu, 17 Sep 2015 16:31:57 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 16:31:56 +0200
Message-Id: <1442500317-9064-8-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442500317-9064-1-git-send-email-marex@denx.de>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>, lftan@altera.com, waltergoossens@home.nl
Subject: [PATCH 7/8] pixman: Fix missing FE_DIVBYZERO on nios2
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
X-List-Received-Date: Thu, 17 Sep 2015 14:38:02 -0000

The FE_DIVBYZERO is missing on nios2 , add a small patch to pixman
which checks for the presence of FE_DIVBYZERO and disables the test
which depends on it.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch | 65 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch

diff --git a/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch b/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
new file mode 100644
index 0000000..8aac226
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/pixman/0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch
@@ -0,0 +1,65 @@
+From fcd5eb9bd0e8674a6f4987a8fce7dc1ba8f9320c Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Thu, 17 Sep 2015 03:08:36 +0200
+Subject: [PATCH] [v3] test: add a check for FE_DIVBYZERO
+
+Some architectures, such as Microblaze and Nios2, currently do not
+implement FE_DIVBYZERO, even though they have <fenv.h> and
+feenableexcept(). This commit adds a configure.ac check to verify
+whether FE_DIVBYZERO is defined or not, and if not, disables the
+problematic code in test/utils.c.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Marek Vasut <marex@denx.de>
+
+---
+Changes v1 -> v2:
+
+ * Use the ac_cv_have_decl_FE_DIVBYZERO variable, which is
+   automatically set by AC_CHECK_DECL, to decide whether or not
+   HAVE_FEDIVBYZERO should be defined.
+
+Changes v2 -> v3:
+
+ * Use action-if-yes of AC_CHECK_DECL as suggested in
+   http://lists.freedesktop.org/archives/pixman/2014-February/003176.html
+---
+ configure.ac | 5 +++++
+ test/utils.c | 2 ++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index f93cc30..424bfd3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -891,6 +891,11 @@ if test x$have_feenableexcept = xyes; then
+    AC_DEFINE(HAVE_FEENABLEEXCEPT, 1, [Whether we have feenableexcept()])
+ fi
+ 
++AC_CHECK_DECL([FE_DIVBYZERO],
++	[AC_DEFINE(HAVE_FEDIVBYZERO, 1, [Whether we have FE_DIVBYZERO])],
++	[],
++	[[#include <fenv.h>]])
++
+ AC_CHECK_FUNC(gettimeofday, have_gettimeofday=yes, have_gettimeofday=no)
+ AC_CHECK_HEADER(sys/time.h, have_sys_time_h=yes, have_sys_time_h=no)
+ if test x$have_gettimeofday = xyes && test x$have_sys_time_h = xyes; then
+diff --git a/test/utils.c b/test/utils.c
+index 222d4d5..8657966 100644
+--- a/test/utils.c
++++ b/test/utils.c
+@@ -966,9 +966,11 @@ enable_divbyzero_exceptions (void)
+ {
+ #ifdef HAVE_FENV_H
+ #ifdef HAVE_FEENABLEEXCEPT
++#ifdef HAVE_FEDIVBYZERO
+     feenableexcept (FE_DIVBYZERO);
++#endif
+ #endif
+ #endif
+ }
+ 
+ void
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
index eae59b6..317a568 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.32.6.bb
@@ -31,6 +31,7 @@ SRC_URI += "\
             file://0001-ARM-qemu-related-workarounds-in-cpu-features-detecti.patch \
             file://mips-export-revert.patch \
 	    file://asm_include.patch \
+	    file://0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch \
 "
 
 SRC_URI[md5sum] = "8a9e8f14743a39cf303803f369c1f344"
-- 
2.1.4


