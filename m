Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.35917.1612794865410366987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 06:34:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,162,1610380800"; 
   d="scan'208";a="104333019"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Feb 2021 22:34:18 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 87D414CE6F8D
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Feb 2021 22:34:15 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Feb 2021 22:34:18 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v4] libdrm: upgrade 2.4.103 -> 2.4.104
Date: Mon, 8 Feb 2021 22:34:10 +0800
Message-ID: <1612794850-43263-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 87D414CE6F8D.A611F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Add 0001-meson-Also-search-for-rst2man.py.patch to fix bug of program rst2man cannot be found.

Add dependency python3-docutils-native to manpages.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...001-meson-Also-search-for-rst2man.py.patch | 30 +++++++++++++++++++
 .../{libdrm_2.4.103.bb => libdrm_2.4.104.bb}  |  8 +++--
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.103.bb => libdrm_2.4.104.bb} (90%)

diff --git a/meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch b/meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch
new file mode 100644
index 0000000000..67fafd40c3
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/0001-meson-Also-search-for-rst2man.py.patch
@@ -0,0 +1,30 @@
+From 4129a8c6911b6b0ef3665cb167da6b635c29614d Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Mon, 8 Feb 2021 17:30:52 +0900
+Subject: [PATCH] meson: Also search for rst2man.py
+
+That's what upstream docutils installs by default.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/drm/-/commit/62b9a3eee9bdaafa766e92d5bebeb4e59845c45a]
+
+Signed-off-by: Heiko Becker's avatarHeiko Becker <heirecka@exherbo.org>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a4d8d70..07d2e08 100644
+--- a/meson.build
++++ b/meson.build
+@@ -261,7 +261,7 @@ else
+ endif
+ 
+ with_man_pages = get_option('man-pages')
+-prog_rst2man = find_program('rst2man', required: with_man_pages == 'true')
++prog_rst2man = find_program('rst2man', 'rst2man.py', required: with_man_pages == 'true')
+ with_man_pages = with_man_pages != 'false' and prog_rst2man.found()
+ 
+ config.set10('HAVE_VISIBILITY',
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.103.bb b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
similarity index 90%
rename from meta/recipes-graphics/drm/libdrm_2.4.103.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.104.bb
index 1028d618ae..ff869d6db9 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.103.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.104.bb
@@ -10,9 +10,11 @@ LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c5
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs"
 
-SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz"
+SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.xz \
+           file://0001-meson-Also-search-for-rst2man.py.patch \
+          "
 
-SRC_URI[sha256sum] = "3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222"
+SRC_URI[sha256sum] = "d66ad8b5c2441015ac1333e40137bb803c3bde3612ff040286fcc12158ea1bcb"
 
 inherit meson pkgconfig manpages
 
@@ -34,7 +36,7 @@ PACKAGECONFIG[valgrind] = "-Dvalgrind=true,-Dvalgrind=false,valgrind"
 PACKAGECONFIG[install-test-programs] = "-Dinstall-test-programs=true,-Dinstall-test-programs=false"
 PACKAGECONFIG[cairo-tests] = "-Dcairo-tests=true,-Dcairo-tests=false"
 PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false,udev"
-PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native python3-docutils-native"
 
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-- 
2.25.1



