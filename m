Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CDABC74CCC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254267"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:41 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:34 +0300
Message-Id: <20180504123244.43049-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/14] libfm: update to 1.3.0.2
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
X-List-Received-Date: Fri, 04 May 2018 12:38:40 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...libfm-extra_1.2.5.bb => libfm-extra_1.3.0.2.bb} |  4 +-
 ...-library-path-to-avoid-host-contamination.patch | 23 +++++++
 ...Enclose-text-in-programlisting-into-CDATA.patch | 76 ----------------------
 .../libfm/{libfm_1.2.5.bb => libfm_1.3.0.2.bb}     |  6 +-
 4 files changed, 28 insertions(+), 81 deletions(-)
 rename meta/recipes-support/libfm/{libfm-extra_1.2.5.bb => libfm-extra_1.3.0.2.bb} (80%)
 create mode 100644 meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch
 delete mode 100644 meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch
 rename meta/recipes-support/libfm/{libfm_1.2.5.bb => libfm_1.3.0.2.bb} (89%)

diff --git a/meta/recipes-support/libfm/libfm-extra_1.2.5.bb b/meta/recipes-support/libfm/libfm-extra_1.3.0.2.bb
similarity index 80%
rename from meta/recipes-support/libfm/libfm-extra_1.2.5.bb
rename to meta/recipes-support/libfm/libfm-extra_1.3.0.2.bb
index c0fd83ef344..734d010d319 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.3.0.2.bb
@@ -11,8 +11,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
           "
 
-SRC_URI[md5sum] = "a1ba9ae5e920f38b647dd511edd6c807"
-SRC_URI[sha256sum] = "c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a"
+SRC_URI[md5sum] = "02a024714d51e0d37afc7bd596a44f3b"
+SRC_URI[sha256sum] = "18d06f7996ce1cf8947df6e106bc0338c6ae0c4138c316f2501f6f6f435c7c72"
 
 S = "${WORKDIR}/libfm-${PV}"
 
diff --git a/meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch b/meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch
new file mode 100644
index 00000000000..f4c89127fc1
--- /dev/null
+++ b/meta/recipes-support/libfm/libfm/0001-Do-not-add-library-path-to-avoid-host-contamination.patch
@@ -0,0 +1,23 @@
+From 07260295e031e845e38ba874fa6ab500790c4aaf Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 2 May 2018 16:48:47 +0300
+Subject: [PATCH] Do not add library path to avoid host contamination
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/modules/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/modules/Makefile.am b/src/modules/Makefile.am
+index e61f4e0..01c15bd 100644
+--- a/src/modules/Makefile.am
++++ b/src/modules/Makefile.am
+@@ -11,7 +11,6 @@ AM_CPPFLAGS = \
+ # tell libtool we compile module not library
+ AM_LDFLAGS = \
+ 	-no-undefined -module -avoid-version -shared -export-dynamic \
+-	-L$(libdir) \
+ 	$(GIO_LIBS)
+ 
+ # the module should be linked only with libfm, not libfm-gtk or whatever
diff --git a/meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch b/meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch
deleted file mode 100644
index 40e53291e1c..00000000000
--- a/meta/recipes-support/libfm/libfm/0001-Enclose-text-in-programlisting-into-CDATA.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From ed4ca8c0b17ff5d3c768b92409c1787e3f3f1841 Mon Sep 17 00:00:00 2001
-From: Andriy Grytsenko <andrej@rep.kiev.ua>
-Date: Sun, 26 Nov 2017 22:30:15 +0200
-Subject: [PATCH 2/2] Enclose text in <programlisting> into <![CDATA[
-
-New gtk-doc fails on tag-like data in it.
-See https://bugs.freedesktop.org/show_bug.cgi?id=101585
-That is definitely bug of gtk-doc but let workaround it.
-
-Upstream-Status: Backport [https://git.lxde.org/gitweb/?p=lxde/libfm.git;a=commit;h=b072ee0400432d72fdf86ba9fed74a7e0ec11ec1]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/base/fm-module.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/base/fm-module.c b/src/base/fm-module.c
-index d364b2d..2e8c978 100644
---- a/src/base/fm-module.c
-+++ b/src/base/fm-module.c
-@@ -44,7 +44,7 @@
-  * of that type should include:
-  * <example id="example-fm-dummy-h">
-  * <title>Sample of fm-dummy.h</title>
-- * <programlisting>
-+ * <programlisting><![CDATA[
-  * #include <libfm/fm.h>
-  *
-  * #define FM_MODULE_dummy_VERSION 1
-@@ -54,7 +54,7 @@
-  * } FmDummyInit;
-  *
-  * extern FmDummyInit fm_module_init_dummy;
-- * </programlisting>
-+ * ]]></programlisting>
-  * </example>
-  * The FM_MODULE_dummy_VERSION is a number which should be increased each
-  * time something in FmDummyInit structure is changed. The FmDummyInit
-@@ -65,7 +65,7 @@
-  * module handling in your code:
-  * <example id="example-fm-dummy-widget-c">
-  * <title>Sample of fm-dummy-widget.c</title>
-- * <programlisting>
-+ * <programlisting><![CDATA[
-  * #include "fm-dummy.h"
-  *
-  * FM_MODULE_DEFINE_TYPE(dummy, FmDummyInit, 1)
-@@ -87,7 +87,7 @@
-  *         result = module->get_new("test sample");
-  *     return result;
-  * }
-- * </programlisting>
-+ * ]]></programlisting>
-  * </example>
-  *
-  * Third thing application should do is to register module type on the
-@@ -108,7 +108,7 @@
-  * interface (see the fm-dummy.h header example above):
-  * <example id="example-fm-dummy-test-c">
-  * <title>Sample of module dummy/test</title>
-- * <programlisting>
-+ * <programlisting><![CDATA[
-  * #include "fm-dummy.h"
-  *
-  * FM_DEFINE_MODULE(dummy, test)
-@@ -121,7 +121,7 @@
-  * FmDummyInit fm_module_init_dummy = {
-  *     fm_dummy_test_get_new;
-  * };
-- * </programlisting>
-+ * ]]></programlisting>
-  * </example>
-  * The fm_module_init_dummy should be exactly the same structure that is
-  * defined in the header file above.
--- 
-2.15.1
-
diff --git a/meta/recipes-support/libfm/libfm_1.2.5.bb b/meta/recipes-support/libfm/libfm_1.3.0.2.bb
similarity index 89%
rename from meta/recipes-support/libfm/libfm_1.2.5.bb
rename to meta/recipes-support/libfm/libfm_1.3.0.2.bb
index 596408353fa..62d6a51e871 100644
--- a/meta/recipes-support/libfm/libfm_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.0.2.bb
@@ -13,11 +13,11 @@ DEPENDS = "glib-2.0 glib-2.0-native pango gtk+3 menu-cache intltool-native libex
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-Correctly-check-the-stamp-file-that-indicates-if-we-.patch \
-           file://0001-Enclose-text-in-programlisting-into-CDATA.patch \
+           file://0001-Do-not-add-library-path-to-avoid-host-contamination.patch \
            "
 
-SRC_URI[md5sum] = "a1ba9ae5e920f38b647dd511edd6c807"
-SRC_URI[sha256sum] = "c706bb1020cf5f2d6f5a9226f692ce1985947134dcf2bde64278bd0420779b5a"
+SRC_URI[md5sum] = "02a024714d51e0d37afc7bd596a44f3b"
+SRC_URI[sha256sum] = "18d06f7996ce1cf8947df6e106bc0338c6ae0c4138c316f2501f6f6f435c7c72"
 
 inherit autotools pkgconfig gtk-doc gettext distro_features_check
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-- 
2.16.1


