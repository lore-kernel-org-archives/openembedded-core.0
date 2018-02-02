Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1104F78845
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Feb 2018 17:38:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Feb 2018 09:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,450,1511856000"; d="scan'208";a="15016418"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 02 Feb 2018 09:38:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Feb 2018 19:38:15 +0200
Message-Id: <20180202173815.9500-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
References: <20180202173815.9500-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] libfm: add a patch to fix build errors with recent versions of gtk-doc
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
X-List-Received-Date: Fri, 02 Feb 2018 17:38:16 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...Enclose-text-in-programlisting-into-CDATA.patch | 76 ++++++++++++++++++++++
 meta/recipes-support/libfm/libfm_1.2.5.bb          |  4 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch

diff --git a/meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch b/meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch
new file mode 100644
index 00000000000..40e53291e1c
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch
@@ -0,0 +1,76 @@
+From ed4ca8c0b17ff5d3c768b92409c1787e3f3f1841 Mon Sep 17 00:00:00 2001
+From: Andriy Grytsenko <andrej@rep.kiev.ua>
+Date: Sun, 26 Nov 2017 22:30:15 +0200
+Subject: [PATCH 2/2] Enclose text in <programlisting> into <![CDATA[
+
+New gtk-doc fails on tag-like data in it.
+See https://bugs.freedesktop.org/show_bug.cgi?id=101585
+That is definitely bug of gtk-doc but let workaround it.
+
+Upstream-Status: Backport [https://git.lxde.org/gitweb/?p=lxde/libfm.git;a=commit;h=b072ee0400432d72fdf86ba9fed74a7e0ec11ec1]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/base/fm-module.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/base/fm-module.c b/src/base/fm-module.c
+index d364b2d..2e8c978 100644
+--- a/src/base/fm-module.c
++++ b/src/base/fm-module.c
+@@ -44,7 +44,7 @@
+  * of that type should include:
+  * <example id="example-fm-dummy-h">
+  * <title>Sample of fm-dummy.h</title>
+- * <programlisting>
++ * <programlisting><![CDATA[
+  * #include <libfm/fm.h>
+  *
+  * #define FM_MODULE_dummy_VERSION 1
+@@ -54,7 +54,7 @@
+  * } FmDummyInit;
+  *
+  * extern FmDummyInit fm_module_init_dummy;
+- * </programlisting>
++ * ]]></programlisting>
+  * </example>
+  * The FM_MODULE_dummy_VERSION is a number which should be increased each
+  * time something in FmDummyInit structure is changed. The FmDummyInit
+@@ -65,7 +65,7 @@
+  * module handling in your code:
+  * <example id="example-fm-dummy-widget-c">
+  * <title>Sample of fm-dummy-widget.c</title>
+- * <programlisting>
++ * <programlisting><![CDATA[
+  * #include "fm-dummy.h"
+  *
+  * FM_MODULE_DEFINE_TYPE(dummy, FmDummyInit, 1)
+@@ -87,7 +87,7 @@
+  *         result = module->get_new("test sample");
+  *     return result;
+  * }
+- * </programlisting>
++ * ]]></programlisting>
+  * </example>
+  *
+  * Third thing application should do is to register module type on the
+@@ -108,7 +108,7 @@
+  * interface (see the fm-dummy.h header example above):
+  * <example id="example-fm-dummy-test-c">
+  * <title>Sample of module dummy/test</title>
+- * <programlisting>
++ * <programlisting><![CDATA[
+  * #include "fm-dummy.h"
+  *
+  * FM_DEFINE_MODULE(dummy, test)
+@@ -121,7 +121,7 @@
+  * FmDummyInit fm_module_init_dummy = {
+  *     fm_dummy_test_get_new;
+  * };
+- * </programlisting>
++ * ]]></programlisting>
+  * </example>
+  * The fm_module_init_dummy should be exactly the same structure that is
+  * defined in the header file above.
+-- 
+2.15.1
+
diff --git a/meta/recipes-support/libfm/libfm_1.2.5.bb b/meta/recipes-support/libfm/libfm_1.2.5.bb
index 6844243c1e3..c1deea68531 100644
--- a/meta/recipes-support/libfm/libfm_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.5.bb
@@ -12,7 +12,9 @@ SECTION = "x11/libs"
 DEPENDS = "glib-2.0 pango gtk+3 menu-cache intltool-native libexif libfm-extra gettext-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
-           file://0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch"
+           file://0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch \
+           file://0001-Enclose-text-in-programlisting-into-CDATA.patch \
+           "
 
 SRC_URI[md5sum] = "a1ba9ae5e920f38b647dd511edd6c807"
 SRC_URI[sha256sum] = "c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a"
-- 
2.15.1


