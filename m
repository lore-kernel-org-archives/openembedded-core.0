Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.3865.1586412252677567956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 23:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.72,361,1580745600"; 
   d="scan'208";a="88733122"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 09 Apr 2020 14:04:08 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 1556449DF12F
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Apr 2020 13:53:44 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 9 Apr 2020 14:04:07 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] at-spi2-atk: upgrade 2.34.1 -> 2.34.2
Date: Thu, 9 Apr 2020 22:48:28 +0800
Message-ID: <1586443708-20777-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 1556449DF12F.ACBB9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

0001-atk_test_util.h-add-missing-sys-time.h-include.patch was removed since it was included in 2.34.2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...til.h-add-missing-sys-time.h-include.patch | 61 -------------------
 ...i2-atk_2.34.1.bb => at-spi2-atk_2.34.2.bb} |  7 +--
 2 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch
 rename meta/recipes-support/atk/{at-spi2-atk_2.34.1.bb => at-spi2-atk_2.34.2.bb} (64%)

diff --git a/meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch b/meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch
deleted file mode 100644
index f64e46eccd..0000000000
--- a/meta/recipes-support/atk/at-spi2-atk/0001-atk_test_util.h-add-missing-sys-time.h-include.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From a8f9b2d36dc887216e8923047dc309435dd8b254 Mon Sep 17 00:00:00 2001
-From: Tim Orling <timothy.t.orling@linux.intel.com>
-Date: Fri, 28 Feb 2020 10:49:41 -0800
-Subject: [PATCH] atk_test_util.h: add missing sys/time.h include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-On centos-7, we see errors likei [1]:
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field ‘tv_sec’ specified in initializer
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess elements in struct initializer [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near initialization for ‘timeout’) [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error: unknown field ‘tv_nsec’ specified in initializer
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: excess elements in struct initializer [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: warning: (near initialization for ‘timeout’) [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error: storage size of ‘timeout’ isn’t known
-  struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
-                  ^
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5: warning: implicit declaration of function ‘nanosleep’ [-Wimplicit-function-declaration]
-    nanosleep(&timeout, NULL);
-    ^
-../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function ‘terminate_app’:
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: variable ‘timeout’ has initializer but incomplete type
-  struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
-         ^
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field ‘tv_sec’ specified in initializer
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess elements in struct initializer [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near initialization for ‘timeout’) [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: error: unknown field ‘tv_nsec’ specified in initializer
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: excess elements in struct initializer [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10: warning: (near initialization for ‘timeout’) [enabled by default]
-../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19: error: storage size of ‘timeout’ isn’t known
-  struct timespec timeout = { .tv_sec = 0, .tv_nsec = 10 * 1000000 };
-
-This is because of missing sys/time.h in tests/atk_test_util.h [2]
-
-Thanks go to Khem Raj for pointing this out [3]
-
-[1] http://errors.yoctoproject.org/Errors/Details/392974/
-[2] https://gitlab.gnome.org/GNOME/at-spi2-atk/issues/14
-[3] http://lists.openembedded.org/pipermail/openembedded-core/2020-February/293707.html
-
-Upstream-Status: Pending
-
-Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
----
- tests/atk_test_util.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/atk_test_util.h b/tests/atk_test_util.h
-index d69e650..98a2c01 100644
---- a/tests/atk_test_util.h
-+++ b/tests/atk_test_util.h
-@@ -26,6 +26,7 @@
- 
- #include <stdio.h>
- #include <unistd.h>
-+#include <sys/time.h>
- #include <glib.h>
- #include <stdio.h>
- #include <stdlib.h>
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
similarity index 64%
rename from meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
index 6947559200..db62ae8fac 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.1.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
@@ -3,17 +3,14 @@ HOMEPAGE = "https://wiki.linuxfoundation.org/accessibility/d-bus"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "e0f99641c5a403041c4214be04722e15"
-SRC_URI[archive.sha256sum] = "776df930748fde71c128be6c366a987b98b6ee66d508ed9c8db2355bf4b9cc16"
+SRC_URI[archive.md5sum] = "58cd278574e101363b18d9a8b7053d67"
+SRC_URI[archive.sha256sum] = "901323cee0eef05c01ec4dee06c701aeeca81a314a7d60216fa363005e27f4f0"
 
 DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core libxml2"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase features_check upstream-version-is-even
 
-# gnomebase.bbclass sets SRC_URI = , so we need to append after, at least for -native
-SRC_URI += " file://0001-atk_test_util.h-add-missing-sys-time.h-include.patch"
-
 PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
 
 FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
-- 
2.17.1



