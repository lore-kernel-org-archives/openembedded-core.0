Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.8566.1590130868408768906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2020 00:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04M715FV008267
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 22 May 2020 00:01:05 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Fri, 22 May 2020 00:01:04 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <martin.jansa@gmail.com>
Subject: [PATCH v2 2/2] Revert "webkitgtk, pinentry: require gobject-introspection-data in DISTRO_FEATURES when libsecret PACKAGECONFIG is enabled"
Date: Fri, 22 May 2020 15:00:23 +0800
Message-ID: <20200522070023.38061-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200522070023.38061-1-kai.kang@windriver.com>
References: <20200522070023.38061-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

This reverts commit 91264e5e0ab40b796e214edd84c72bc88b363778.

It adds meson options 'instrospection' to disable gobject introspection
files build. So no need to check distro feature 'gobject-introspection-data'
any longer.

Keep the spaces adjustment and comment removal.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb    | 6 ++----
 meta/recipes-support/pinentry/pinentry_1.1.0.bb | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
index 51596077b4..e9941c7a2c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
@@ -26,9 +26,7 @@ SRC_URI[sha256sum] = "b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc6
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'libsecret', 'gobject-introspection-data', '', d)} \
-"
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'opengl', '', d)}"
 
 CVE_PRODUCT = "webkitgtk webkitgtk\+"
 
@@ -44,7 +42,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
                    enchant \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-introspection-data', 'libsecret', '', d)} \
+                   libsecret \
                   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
diff --git a/meta/recipes-support/pinentry/pinentry_1.1.0.bb b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
index dc9069b9d5..d9ca0732f7 100644
--- a/meta/recipes-support/pinentry/pinentry_1.1.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
@@ -19,9 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "3829315cb0a1e9cedc05ffe6def7a2c6"
 SRC_URI[sha256sum] = "68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570"
 
-inherit autotools pkgconfig features_check
-
-REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'libsecret', 'gobject-introspection-data', '', d)}"
+inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "ncurses libcap"
 
@@ -29,6 +27,7 @@ PACKAGECONFIG[ncurses] = "--enable-ncurses  --with-ncurses-include-dir=${STAGING
 PACKAGECONFIG[libcap] = "--with-libcap, --without-libcap, libcap"
 PACKAGECONFIG[qt] = "--enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase"
 PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0"
+
 PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
 
 EXTRA_OECONF = " \
-- 
2.17.1

