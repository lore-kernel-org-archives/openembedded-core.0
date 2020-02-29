Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 50FDC619ED
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 05:04:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2020 21:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,498,1574150400"; d="scan'208";a="437640513"
Received: from wrath.jf.intel.com ([10.54.31.24])
	by fmsmga005.fm.intel.com with ESMTP; 28 Feb 2020 21:04:31 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2020 21:03:59 -0800
Message-Id: <20200229050359.12933-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH v2] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Sat, 29 Feb 2020 05:04:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add patch to fix missing sys/time.h include in tests/atk_test_util.h

Release notes:
https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424f4d087ac90d1172d/NEWS

License-Update: Changed to LGPL-2.1+

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...til.h-add-missing-sys-time.h-include.patch | 61 +++++++++++++++++++
 ...i2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb} | 11 ++--
 2 files changed, 68 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch
 rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb => at-spi2-atk_2.34.1.bb} (53%)

diff --git a/meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch b/meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch
new file mode 100644
index 0000000000..f64e46eccd
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch
@@ -0,0 +1,61 @@
+From a8f9b2d36dc887216e8923047dc309435dd8b254 Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Fri, 28 Feb 2020 10:49:41 -0800
+Subject: [PATCH] atk_test_util.h: add missing sys/time.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On centos-7, we see errors likei [1]:
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field ‘tv_sec’ specified in initializer
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess elements in struct initializer [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near initialization for ‘timeout’) [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field ‘tv_nsec’ specified in initializer
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess elements in struct initializer [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near initialization for ‘timeout’) [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size of ‘timeout’ isn’t known
+  struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
+                  ^
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit declaration of function ‘nanosleep’ [-Wimplicit-function-declaration]
+    nanosleep(&timeout, NULL);
+    ^
+../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function ‘terminate_app’:
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable ‘timeout’ has initializer but incomplete type
+  struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
+         ^
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field ‘tv_sec’ specified in initializer
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess elements in struct initializer [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near initialization for ‘timeout’) [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field ‘tv_nsec’ specified in initializer
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess elements in struct initializer [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near initialization for ‘timeout’) [enabled by default]
+../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage size of ‘timeout’ isn’t known
+  struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
+
+This is because of missing sys/time.h in tests/atk_test_util.h [2]
+
+Thanks go to Khem Raj for pointing this out [3]
+
+[1] http://errors.yoctoproject.org/Errors/Details/392974/
+[2] https://gitlab.gnome.org/GNOME/at-spi2-atk/issues/14
+[3] http://lists.openembedded.org/pipermail/openembedded-core/2020-February/293707.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
+---
+ tests/atk_test_util.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/atk_test_util.h b/tests/atk_test_util.h
+index d69e650..98a2c01 100644
+--- a/tests/atk_test_util.h
++++ b/tests/atk_test_util.h
+@@ -26,6 +26,7 @@
+ 
+ #include <stdio.h>
+ #include <unistd.h>
++#include <sys/time.h>
+ #include <glib.h>
+ #include <stdio.h>
+ #include <stdlib.h>
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
similarity index 53%
rename from meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
index b717a9c7f7..6947559200 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.32.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
@@ -1,16 +1,19 @@
 SUMMARY = "AT-SPI 2 Toolkit Bridge"
 HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "6a4b27bace3b9352721ed462b95f6291"
-SRC_URI[archive.sha256sum] = "0b51e6d339fa2bcca3a3e3159ccea574c67b107f1ac8b00047fa60e34ce7a45c"
+SRC_URI[archive.md5sum] = "e0f99641c5a403041c4214be04722e15"
+SRC_URI[archive.sha256sum] = "776df930748fde71c128be6c366a987b98b6ee66d508ed9c8db2355bf4b9cc16"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase features_check upstream-version-is-even
 
+# gnomebase.bbclass sets SRC_URI = , so we need to append after, at least for -native
+SRC_URI += " file://0001-atk_test_util.h-add-missing-sys-time.h-include.patch"
+
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
-- 
2.24.0


