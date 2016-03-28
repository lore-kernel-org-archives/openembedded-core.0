Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 95F56607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 18:07:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 28 Mar 2016 11:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,407,1455004800"; d="scan'208";a="74660746"
Received: from spareek-mobl6.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.254.108.99])
	by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2016 11:07:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 28 Mar 2016 11:07:16 -0700
Message-Id: <1459188436-13411-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] xf86-video-intel: Add UXA PACKAGECONFIG and 20-intel.conf
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
X-List-Received-Date: Mon, 28 Mar 2016 18:07:18 -0000

This patch adds the UXA Packageconfig option to handle older Intel Graphics
the uxa code when enabled needs a patch from upstream due to a change in the
API of the Xserver.

Also added a generic 20-intel.conf with a commented line to enable the uxa
AccelMethod option.

The Packageconfig only needs to be enabled in genericx86-64 since other
MACHINE configs (such as meta-intel) include the VAAPI acceleration that
handle the graphics hardware corretly.

[YOCTO #8312]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...-call-to-PixmapSyncDirtyHelper-broken-by-.patch | 30 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-intel/20-intel.conf     |  6 +++++
 .../xorg-driver/xf86-video-intel_2.99.917.bb       | 14 ++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/20-intel.conf

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
new file mode 100644
index 0000000..29924bb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch
@@ -0,0 +1,30 @@
+From 2c5063938cc809f624e56efd4673041fa8141e81 Mon Sep 17 00:00:00 2001
+From: Martin Peres <martin.peres@linux.intel.com>
+Date: Thu, 9 Jul 2015 11:26:38 +0300
+Subject: [PATCH] uxa: fix the call to PixmapSyncDirtyHelper, broken by
+ xserver's 90db5ed
+
+[ickle: switch to HAS_DIRTYTRACKING_ROTATION as suggested by Dave Airlie]
+Signed-off-by: Martin Peres <martin.peres@linux.intel.com>
+
+Upstream-Status: Backport
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ src/compat-api.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+index aa93bee..293e9d7 100644
+--- a/src/compat-api.h
++++ b/src/compat-api.h
+@@ -247,3 +247,7 @@ static inline void FreePixmap(PixmapPtr pixmap)
+ #endif
+ 
+ #endif
++
++#if HAS_DIRTYTRACKING_ROTATION
++#define PixmapSyncDirtyHelper(d, dd) PixmapSyncDirtyHelper(d)
++#endif
+-- 
+2.5.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/20-intel.conf b/meta/recipes-graphics/xorg-driver/xf86-video-intel/20-intel.conf
new file mode 100644
index 0000000..0ce1939
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/20-intel.conf
@@ -0,0 +1,6 @@
+
+Section "Device"
+    Identifier  "Intel Graphics"
+    Driver      "intel"
+#uxa    Option      "AccelMethod"  "uxa"
+EndSection
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
index a2f1456..8b67d70 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
@@ -13,8 +13,13 @@ SRC_URI += "file://disable-x11-dri3.patch \
             file://always_include_xorg_server.h.patch \
             file://sna-Protect-against-ABI-breakage-in-recent-versions-.patch \
             file://udev-fstat.patch \
+            ${@bb.utils.contains('PACKAGECONFIG', 'uxa', '${UXA_SRC_URI}', '', d)} \
+            file://20-intel.conf \
            "
 
+UXA_SRC_URI = "file://0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch \
+              "
+
 SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
 SRC_URI[sha256sum] = "00b781eea055582820a123c47b62411bdf6aabf4f03dc0568faec55faf9667c9"
 
@@ -38,3 +43,12 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 FILES_${PN} += "${datadir}/polkit-1"
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/X11/xorg.conf.d
+	install -m 0644 ${WORKDIR}/20-intel.conf ${D}${sysconfdir}/X11/xorg.conf.d
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'uxa', 'true', 'false', d)}; then
+		sed -e "s/#uxa//" -i ${D}${sysconfdir}/X11/xorg.conf.d/20-intel.conf
+        fi
+}
-- 
2.5.0


