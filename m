Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1167D782DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:09:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Aug 2017 10:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="1187402142"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2017 10:09:37 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 20:06:24 +0300
Message-Id: <bd3feb331d4bc6e220371f4de2877c0b6a5a61dc.1503507784.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
In-Reply-To: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
References: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 6/7] libinput: convert to meson build
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
X-List-Received-Date: Wed, 23 Aug 2017 17:09:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop autotools-specific patch.

Drop libunwind option, as it is only used if tests are enabled
(and they're unconditionally not enabled).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-tools-Fix-race-in-autotools-install.patch | 37 ----------------------
 meta/recipes-graphics/wayland/libinput_1.8.1.bb    | 10 +++---
 2 files changed, 4 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch

diff --git a/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch b/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
deleted file mode 100644
index 4667538c5eb..00000000000
--- a/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5e8864c5b7a2e258eea041b0ef66dac7fcab9b7f Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 9 Aug 2017 09:47:14 +0300
-Subject: [PATCH] tools: Fix race in (autotools) install
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-exec/data distinction is done based on install dir so compat scripts
-must be moved in exec hook.
-
-This should fix this occasional failure:
-| install: cannot change permissions of
-| ‘/usr/bin/libinput-debug-events.compat’: No such file or directory
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted
----
- tools/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 2c8660b..7ee8b90 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -63,7 +63,7 @@ endif
- 
- EXTRA_DIST = make-ptraccel-graphs.sh install-compat-scripts.sh $(bin_SCRIPTS)
- 
--install-data-hook:
-+install-exec-hook:
- 	(cd $(DESTDIR)$(bindir) && mv libinput-list-devices.compat libinput-list-devices)
- 	(cd $(DESTDIR)$(bindir) && mv libinput-debug-events.compat libinput-debug-events)
- 
--- 
-2.13.3
-
diff --git a/meta/recipes-graphics/wayland/libinput_1.8.1.bb b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
index f75298b899d..3217cc74375 100644
--- a/meta/recipes-graphics/wayland/libinput_1.8.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
@@ -9,22 +9,20 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
-           file://0001-tools-Fix-race-in-autotools-install.patch \
 "
 
 SRC_URI[md5sum] = "8247f0bb67052ffb272c50c3cb9c5998"
 SRC_URI[sha256sum] = "e3590a9037e561a5791c8bd3b34bfd30fad5cacd8cbefc0d75fafe3a41d07147"
 
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


