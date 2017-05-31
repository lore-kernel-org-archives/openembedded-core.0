Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 769627804A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 11:23:22 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 May 2017 04:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,423,1491289200"; d="scan'208";a="93206776"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 31 May 2017 04:23:23 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CC8B95803AB;
	Wed, 31 May 2017 04:23:21 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:23:10 +0300
Message-Id: <59c24c0647e401e0b6886f6e9ebbbb1c88201d31.1496229576.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496229576.git.jussi.kukkonen@intel.com>
References: <cover.1496229576.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] glib-2.0: Upgrade 2.50.3 -> 2.52.2
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
X-List-Received-Date: Wed, 31 May 2017 11:23:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove upstreamed patches (thanks Ross).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../glib-2.0/glib-2.0/fix-conflicting-rand.patch   | 35 ----------------------
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    | 24 ---------------
 .../{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb}     |  8 ++---
 meta/recipes-core/glib-2.0/glib.inc                |  1 +
 4 files changed, 4 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.50.3.bb => glib-2.0_2.52.2.bb} (70%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch b/meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
deleted file mode 100644
index 1571112..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-rand.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Rename 'rand' variable to avoid conflict.
-
-Upstream-Status: pending
-Signed-off-by: Björn Stenberg <bjst@enea.com>
-
-diff -u glib-2.34.3/tests/refcount/signals.c~ glib-2.34.3/tests/refcount/signals.c
---- glib-2.34.3/tests/refcount/signals.c	2012-11-26 17:52:48.000000000 +0100
-+++ glib-2.34.3/tests/refcount/signals.c	2013-02-08 14:24:10.052477546 +0100
-@@ -9,7 +9,7 @@
- #define MY_IS_TEST_CLASS(tclass)   (G_TYPE_CHECK_CLASS_TYPE ((tclass), G_TYPE_TEST))
- #define MY_TEST_GET_CLASS(test)    (G_TYPE_INSTANCE_GET_CLASS ((test), G_TYPE_TEST, GTestClass))
- 
--static GRand *rand;
-+static GRand *grand;
- 
- typedef struct _GTest GTest;
- typedef struct _GTestClass GTestClass;
-@@ -84,7 +84,7 @@
-       NULL
-     };
- 
--    rand = g_rand_new();
-+    grand = g_rand_new();
- 
-     test_type = g_type_register_static (G_TYPE_OBJECT, "GTest",
-         &test_info, 0);
-@@ -218,7 +218,7 @@
- static void
- my_test_do_prop (GTest * test)
- {
--  test->value = g_rand_int (rand);
-+  test->value = g_rand_int (grand);
-   g_object_notify (G_OBJECT (test), "test-prop");
- }
- 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
deleted file mode 100644
index ee43511..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-gettextize-dir.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-# an very old patch cherry-picked in every glib-2.0 patch directory. The earliest container
-# for it is 2.6.5 in OE. The earliest commit for it is c8e5702127e507e82e6f68a4b8c546803accea9d
-# in OE side which ports from previous bitkeeper SCM. In OE side it's only used til 2.12.4.
-#
-# keep it since it's always cleaner to not hardcode destination path. Use @datadir@ is more
-# portable here. mark for upstream
-#
-# by Kevin Tian <kevin.tian@intel.com>, 06/25/2010
-# Rebased by Dongxiao Xu <dongxiao.xu@intel.com>, 11/16/2010
-
-Upstream-Status: Inappropriate [configuration]
-
-diff -ruN glib-2.27.3-orig/glib-gettextize.in glib-2.27.3/glib-gettextize.in
---- glib-2.27.3-orig/glib-gettextize.in	2009-04-01 07:04:20.000000000 +0800
-+++ glib-2.27.3/glib-gettextize.in	2010-11-16 12:55:06.874605916 +0800
-@@ -52,7 +52,7 @@
- datadir=@datadir@
- datarootdir=@datarootdir@
- 
--gettext_dir=$prefix/share/glib-2.0/gettext
-+gettext_dir=@datadir@/glib-2.0/gettext
- 
- while test $# -gt 0; do
-   case "$1" in
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.50.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.52.2.bb
similarity index 70%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.50.3.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.52.2.bb
index 22ea347..6f01aef 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.50.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.52.2.bb
@@ -6,7 +6,6 @@ SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://configure-libtool.patch \
-           file://fix-conflicting-rand.patch \
            file://run-ptest \
            file://ptest-paths.patch \
            file://uclibc_musl_translation.patch \
@@ -18,8 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Test-for-pthread_getname_np-before-using-it.patch \
            "
 
-SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
-                                file://relocate-modules.patch"
+SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "381ab22934f296750d036aa55a397ded"
-SRC_URI[sha256sum] = "82ee94bf4c01459b6b00cb9db0545c2237921e3060c0b74cff13fbc020cfd999"
+SRC_URI[md5sum] = "ec099bce26ce6a85104ed1d89bb45856"
+SRC_URI[sha256sum] = "f00e5d9e2a2948b1da25fcba734a6b7a40f556de8bc9f528a53f6569969ac5d0"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e8cdefd..2caa341 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -65,6 +65,7 @@ FILES_${PN}-dev += "${libdir}/glib-2.0/include \
                     ${bindir}/glib-compile-resources \
                     ${datadir}/glib-2.0/gettext/po/Makefile.in.in \
                     ${datadir}/glib-2.0/schemas/gschema.dtd \
+                    ${datadir}/glib-2.0/valgrind/glib.supp \
                     ${datadir}/gettext/its"
 FILES_${PN}-dbg += "${datadir}/glib-2.0/gdb ${datadir}/gdb"
 FILES_${PN}-codegen = "${datadir}/glib-2.0/codegen/*.py \
-- 
2.1.4


