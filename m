Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9730C60268
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 07:15:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Aug 2017 00:15:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,346,1498546800"; d="scan'208";a="888108586"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2017 00:15:08 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 6BFC45809F3;
	Wed,  9 Aug 2017 00:15:07 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Aug 2017 10:14:59 +0300
Message-Id: <1502262899-25128-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCHv2] libinput: Upgrade 1.7.3 -> 1.8.1
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
X-List-Received-Date: Wed, 09 Aug 2017 07:15:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New feature release, see
https://lists.freedesktop.org/archives/wayland-devel/2017-June/034286.html
for the major features. This is the last major release to support
autotools.

Configure flag "--enable-event-gui" changed name.

Configure flags no longer default to "auto": explicitly disable the
things that were previously automatically disabled.

Package the binaries into libinput-bin while being careful with
packaging as the main package gets renamed to libinput10.

Add patch to fix a race in install.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

Changes since v1:
* Fix the install race found on autobuilder

Thanks,
  Jussi


 .../0001-tools-Fix-race-in-autotools-install.patch | 37 ++++++++++++++++++++++
 .../{libinput_1.7.3.bb => libinput_1.8.1.bb}       | 17 +++++++---
 2 files changed, 49 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
 rename meta/recipes-graphics/wayland/{libinput_1.7.3.bb => libinput_1.8.1.bb} (54%)

diff --git a/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch b/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
new file mode 100644
index 0000000..4667538
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
@@ -0,0 +1,37 @@
+From 5e8864c5b7a2e258eea041b0ef66dac7fcab9b7f Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 9 Aug 2017 09:47:14 +0300
+Subject: [PATCH] tools: Fix race in (autotools) install
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+exec/data distinction is done based on install dir so compat scripts
+must be moved in exec hook.
+
+This should fix this occasional failure:
+| install: cannot change permissions of
+| ‘/usr/bin/libinput-debug-events.compat’: No such file or directory
+
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted
+---
+ tools/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 2c8660b..7ee8b90 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -63,7 +63,7 @@ endif
+ 
+ EXTRA_DIST = make-ptraccel-graphs.sh install-compat-scripts.sh $(bin_SCRIPTS)
+ 
+-install-data-hook:
++install-exec-hook:
+ 	(cd $(DESTDIR)$(bindir) && mv libinput-list-devices.compat libinput-list-devices)
+ 	(cd $(DESTDIR)$(bindir) && mv libinput-debug-events.compat libinput-debug-events)
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.7.3.bb b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
similarity index 54%
rename from meta/recipes-graphics/wayland/libinput_1.7.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.8.1.bb
index 6194fba..f75298b 100644
--- a/meta/recipes-graphics/wayland/libinput_1.7.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
@@ -9,17 +9,24 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
+           file://0001-tools-Fix-race-in-autotools-install.patch \
 "
-SRC_URI[md5sum] = "f2993b477db8d7ec0e785ce04ffecb03"
-SRC_URI[sha256sum] = "096d612d2711f0caa2de544976ff3729e6233511ab373808644cc2dd5affcb1d"
 
-inherit autotools pkgconfig
+SRC_URI[md5sum] = "8247f0bb67052ffb272c50c3cb9c5998"
+SRC_URI[sha256sum] = "e3590a9037e561a5791c8bd3b34bfd30fad5cacd8cbefc0d75fafe3a41d07147"
+
+inherit autotools pkgconfig lib_package
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[libunwind] = "--with-libunwind,--without-libunwind,libunwind"
 PACKAGECONFIG[libwacom] = "--enable-libwacom,--disable-libwacom,libwacom"
-PACKAGECONFIG[gui] = "--enable-event-gui,--disable-event-gui,cairo gtk+3"
+PACKAGECONFIG[gui] = "--enable-debug-gui,--disable-debug-gui,cairo gtk+3"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
-EXTRA_OECONF += "--with-udev-dir=${UDEVDIR}"
+EXTRA_OECONF += "--with-udev-dir=${UDEVDIR} --disable-documentation --disable-tests"
+
+# package name changed in 1.8.1 upgrade: make sure package upgrades work
+RPROVIDES_${PN} = "libinput"
+RREPLACES_${PN} = "libinput"
+RCONFLICTS_${PN} = "libinput"
-- 
2.1.4


