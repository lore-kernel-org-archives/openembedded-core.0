Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 71BE560939
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 12:09:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 07 Aug 2017 05:09:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="1179821036"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 07 Aug 2017 05:09:39 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 5A08F5804B6;
	Mon,  7 Aug 2017 05:09:38 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 15:09:29 +0300
Message-Id: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libinput: Upgrade 1.7.3 -> 1.8.1
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
X-List-Received-Date: Mon, 07 Aug 2017 12:09:39 -0000

New feature release, see
https://lists.freedesktop.org/archives/wayland-devel/2017-June/034286.html
for the major features. This is the last major release to support
autotools.

Configure flag "--enable-event-gui" changed name.

Configure flags no longer default to "auto": explicitly disable the
things that were previously automatically disabled.

Package the binaries into libinput-bin while being careful with
packaging as the main package gets renamed to libinput10.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../wayland/{libinput_1.7.3.bb => libinput_1.8.1.bb}      | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.7.3.bb => libinput_1.8.1.bb} (57%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.7.3.bb b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
similarity index 57%
rename from meta/recipes-graphics/wayland/libinput_1.7.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.8.1.bb
index 6194fba..fdae3f8 100644
--- a/meta/recipes-graphics/wayland/libinput_1.7.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.1.bb
@@ -10,16 +10,21 @@ DEPENDS = "libevdev udev mtdev"
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
            file://touchpad-serial-synaptics-need-to-fake-new-touches-on-TRIPLETAP.patch \
 "
-SRC_URI[md5sum] = "f2993b477db8d7ec0e785ce04ffecb03"
-SRC_URI[sha256sum] = "096d612d2711f0caa2de544976ff3729e6233511ab373808644cc2dd5affcb1d"
+SRC_URI[md5sum] = "8247f0bb67052ffb272c50c3cb9c5998"
+SRC_URI[sha256sum] = "e3590a9037e561a5791c8bd3b34bfd30fad5cacd8cbefc0d75fafe3a41d07147"
 
-inherit autotools pkgconfig
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


