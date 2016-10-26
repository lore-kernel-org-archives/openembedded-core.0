Return-Path: <jussi.kukkonen@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7EE607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:28:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 26 Oct 2016 06:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,550,1473145200"; d="scan'208";a="23939317"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 26 Oct 2016 06:28:02 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 1ABA76A4006;
	Wed, 26 Oct 2016 06:27:27 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 16:27:45 +0300
Message-Id: <82ad55565920ef03325fc5a4c7e42f5be03abaa0.1477488358.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
References: <a9e6d45292ddc9ff04c359ac3f2016f4ed22e548.1477488358.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477488358.git.jussi.kukkonen@intel.com>
References: <cover.1477488358.git.jussi.kukkonen@intel.com>
Subject: [PATCH 04/14] glib-2.0: Upgrade 2.48.2 -> 2.50.1
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
X-List-Received-Date: Wed, 26 Oct 2016 13:28:01 -0000

Six-monthly feature release.

glib-2.0-utils now includes "gio" command line utility.

Drop a patch that's now upstream. Add PACKAGECONFIG for libmount,
enabled by default.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../glib-2.0/0002-tests-Ignore-y2k-warnings.patch  | 42 ----------------------
 .../{glib-2.0_2.48.2.bb => glib-2.0_2.50.1.bb}     |  5 ++-
 meta/recipes-core/glib-2.0/glib.inc                |  3 +-
 3 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.48.2.bb => glib-2.0_2.50.1.bb} (82%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch b/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
deleted file mode 100644
index f61fa0a..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0002-tests-Ignore-y2k-warnings.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b06b22fecc7deda8c65e28670562ca2371e4e725 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 16 Apr 2016 13:43:54 -0700
-Subject: [PATCH 2/2] tests: Ignore y2k warnings
-
-silences
-| ../../../../../../../../workspace/sources/glib-2.0/glib/tests/gdatetime.c: In function 'test_strftime':
-| ../../../../../../../../workspace/sources/glib-2.0/glib/tests/gdatetime.c:1338:3: error: '%c' yields only last 2 digits of year in some locales [-Werror=format-y2k]
-|    "a%a A%A b%b B%B c%c C%C d%d e%e F%F g%g G%G h%h H%H I%I j%j m%m M%M "
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- glib/tests/gdatetime.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
-index 16a163c..e6062fc 100644
---- a/glib/tests/gdatetime.c
-+++ b/glib/tests/gdatetime.c
-@@ -1326,6 +1326,9 @@ test_z (void)
-   g_time_zone_unref (tz);
- }
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-y2k"
-+
- static void
- test_strftime (void)
- {
-@@ -1351,6 +1354,7 @@ test_strftime (void)
-     }
- #endif
- }
-+#pragma GCC diagnostic pop
- 
- static void
- test_find_interval (void)
--- 
-2.8.0
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.48.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
similarity index 82%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.48.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
index a45f644..00ae7ef 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.48.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.50.1.bb
@@ -16,11 +16,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://gi-exclude.patch \
            file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch \
            file://0001-Do-not-ignore-return-value-of-write.patch \
-           file://0002-tests-Ignore-y2k-warnings.patch \
            "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch \
                                 file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "f4ac1aa2efd4f5798c37625ea697ac57"
-SRC_URI[sha256sum] = "f25e751589cb1a58826eac24fbd4186cda4518af772806b666a3f91f66e6d3f4"
+SRC_URI[md5sum] = "6baee4d7e3b1ec791b4ced93976365ee"
+SRC_URI[sha256sum] = "2ef87a78f37c1eb5b95f4cc95efd5b66f69afad9c9c0899918d04659cf6df7dd"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 906e0d4..acac0ba 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -30,9 +30,10 @@ inherit autotools gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even
 
 S = "${WORKDIR}/glib-${PV}"
 
-PACKAGECONFIG ??= "system-pcre"
+PACKAGECONFIG ??= "system-pcre libmount"
 # To use the system pcre it must be configured with --enable-unicode-properties
 PACKAGECONFIG[system-pcre] = "--with-pcre=system,--with-pcre=internal,libpcre"
+PACKAGECONFIG[libmount] = "--enable-libmount,--disable-libmount,util-linux"
 
 CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
 
-- 
2.1.4


