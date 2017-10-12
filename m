Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 72C7F78242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 14:54:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 07:54:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,366,1503385200"; d="scan'208";a="322496254"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2017 07:54:56 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 17:51:14 +0300
Message-Id: <bc4d188a0698d98e891031d1b9b2e5212bf48951.1507819701.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
References: <cover.1507819700.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/7] libinput: convert to meson build
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
X-List-Received-Date: Thu, 12 Oct 2017 14:54:55 -0000

Drop autotools-specific patch.

Drop libunwind option, as it is only used if tests are enabled
(and they're unconditionally not enabled).

Add a backported upstream fix for invalid meson options.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Fix-meson-options-default-values.patch    | 50 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/libinput_1.8.3.bb    | 13 +++---
 2 files changed, 57 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/0001-Fix-meson-options-default-values.patch

diff --git a/meta/recipes-graphics/wayland/libinput/0001-Fix-meson-options-default-values.patch b/meta/recipes-graphics/wayland/libinput/0001-Fix-meson-options-default-values.patch
new file mode 100644
index 00000000000..615bbcd3f96
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/0001-Fix-meson-options-default-values.patch
@@ -0,0 +1,50 @@
+From 10e022a2b18a089265d07b9d0887dba157e066b9 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 10 Oct 2017 08:04:35 +1000
+Subject: [PATCH] Fix meson options default values
+
+The keyword is 'value', not 'default'. With meson 0.43 this now stops
+building.
+
+https://bugs.freedesktop.org/show_bug.cgi?id=103162
+
+Upstream-Status: Backport
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson_options.txt | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/meson_options.txt b/meson_options.txt
+index 9861d2d..144f916 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,20 +1,20 @@
+ option('udev-dir',
+        type: 'string',
+-       default: '',
++       value: '',
+        description: 'udev base directory [default=$prefix/lib/udev]')
+ option('libwacom',
+        type: 'boolean',
+-       default: true,
++       value: true,
+        description: 'Use libwacom for tablet identification (default=true)')
+ option('debug-gui',
+        type: 'boolean',
+-       default: true,
++       value: true,
+        description: 'Enable the "debug-gui" feature in the libinput tool [default=true]')
+ option('tests',
+        type: 'boolean',
+-       default: true,
++       value: true,
+        description: 'Build the tests [default=true]')
+ option('documentation',
+        type: 'boolean',
+-       default: true,
++       value: true,
+        description: 'Build the documentation [default=true]')
+-- 
+2.14.1
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.8.3.bb b/meta/recipes-graphics/wayland/libinput_1.8.3.bb
index 3a02c4b1d24..ce59e30582e 100644
--- a/meta/recipes-graphics/wayland/libinput_1.8.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.3.bb
@@ -7,21 +7,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
+           file://0001-Fix-meson-options-default-values.patch \
+           "
 
 SRC_URI[md5sum] = "5265244853ad7cf41232b0d3ee805ab9"
 SRC_URI[sha256sum] = "2fe2e2f52f0971a9c43541b8f26582ca8df6ed4bb9050e85eb40d4ff6b13142d"
 
-inherit autotools pkgconfig lib_package
+inherit meson pkgconfig lib_package
 
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
-PACKAGECONFIG[libwacom] = "--enable-libwacom,--disable-libwacom,libwacom"
-PACKAGECONFIG[gui] = "--enable-debug-gui,--disable-debug-gui,cairo gtk+3"
+PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
+PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
-EXTRA_OECONF += "--with-udev-dir=${UDEVDIR} --disable-documentation --disable-tests"
+EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} -Ddocumentation=false -Dtests=false"
 
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
 RPROVIDES_${PN} = "libinput"
-- 
2.14.1


