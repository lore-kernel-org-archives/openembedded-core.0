Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TkxiH-00012n-LA
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:00:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Dec 2012 05:45:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,309,1355126400"; d="scan'208";a="263751896"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by fmsmga001.fm.intel.com with ESMTP; 18 Dec 2012 05:45:21 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 379E45606CE; Tue, 18 Dec 2012 15:45:35 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: daniel@fooishbar.org, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 15:45:30 +0200
Message-Id: <1355838331-24404-3-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355838331-24404-1-git-send-email-alexandru.damian@intel.com>
References: <1355838331-24404-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/3] Initial commit for wayland/weston 1.0.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2012 14:00:05 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch adds the Weston reference compositing
manager from Wayland.

We add version 1.0.3 which is the latest stable release
in Dec 2012. See the upstream at:

http://wayland.freedesktop.org/releases.html

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-graphics/wayland/weston.inc      |   23 +++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.0.3.bb |    9 +++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston.inc
 create mode 100644 meta/recipes-graphics/wayland/weston_1.0.3.bb

diff --git a/meta/recipes-graphics/wayland/weston.inc b/meta/recipes-graphics/wayland/weston.inc
new file mode 100644
index 0000000..7d26f7f
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston.inc
@@ -0,0 +1,23 @@
+inherit autotools pkgconfig
+
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+SECTION = "wayland/base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466"
+
+DEPENDS = "wayland libxkbcommon gdk-pixbuf pixman cairo glib-2.0 mtdev jpeg"
+DEPENDS += "virtual/egl"
+
+EXTRA_OECONF  = "--enable-wayland-compositor --disable-android-compositor"
+EXTRA_OECONF += "--enable-setuid-install --enable-simple-clients"
+EXTRA_OECONF += "--enable-clients --disable-xwayland"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
+                  "
+PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm libgbm libglapi udev wayland-egl libpam"
+PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
diff --git a/meta/recipes-graphics/wayland/weston_1.0.3.bb b/meta/recipes-graphics/wayland/weston_1.0.3.bb
new file mode 100644
index 0000000..625965b
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston_1.0.3.bb
@@ -0,0 +1,9 @@
+require weston.inc
+
+SRC_URI = "http://wayland.freedesktop.org/releases/weston-1.0.3.tar.xz \
+	  "
+SRC_URI[md5sum] = "f82ac2e013e6b6a6303ac4ba7b64c7f2"
+SRC_URI[sha256sum] = "3136a7d2f654ea3e946d4217f7e25321248ad2921f1f4e2504dda58968e04853"
+
+PR = "r0"
+
-- 
1.7.10.4



