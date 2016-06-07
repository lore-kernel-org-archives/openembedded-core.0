Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E6BD177150
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174388"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:05 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:24 +0300
Message-Id: <f9bade58e0e9408424ec2d2d1d82b07de5b1e3ca.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 06/37] settings-daemon: Upgrade to 0.0.2
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:31 -0000

* New versions builds with gdk-x11-3.0 and supports gconf key
  "matchbox_theme".
* Remove patch that's already upstream.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../files/dso_linking_change_build_fix.patch       | 31 ----------------------
 ...ings-daemon_git.bb => settings-daemon_0.0.2.bb} |  9 +++----
 2 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
 rename meta/recipes-sato/settings-daemon/{settings-daemon_git.bb => settings-daemon_0.0.2.bb} (85%)

diff --git a/meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
deleted file mode 100644
index 5943744..0000000
--- a/meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-after gcc linking has changed, all the libraries must be explicitely specified to for linking. 
-This patch avoids this linking error:
-
-| make  all-am^M
-| make[1]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/settings-daemon-0.0+svnr2059-r3/settings-daemon'^M
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -Wall -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o settings-daemon settings_daemon-xsettings-common.o settings_daemon-xsettings-manager.o settings_daemon-settings-daemon.o -pthread -lgconf-2 -ldbus-glib-1 -ldbus-1 -lpthread -lgdk-x11-2.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0^M
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: *^A: invalid DSO for symbol `XCreateSimpleWindow' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so.6: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[1]: *** [settings-daemon] Error 1^M
-| make[1]: Leaving directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/settings-daemon-0.0+svnr2059-r3/settings-daemon'^M
-| make: *** [all] Error 2^M
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Index: settings-daemon/configure.ac
-===================================================================
---- settings-daemon.orig/configure.ac
-+++ settings-daemon/configure.ac
-@@ -14,7 +14,7 @@ AC_PROG_CC
- 
- 
- dnl TODO: make gconf optional
--PKG_CHECK_MODULES(APP, [gconf-2.0 gdk-x11-2.0])
-+PKG_CHECK_MODULES(APP, [gconf-2.0 gdk-x11-2.0 x11])
- 
- 
- AC_SUBST(APP_CFLAGS)
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
similarity index 85%
rename from meta/recipes-sato/settings-daemon/settings-daemon_git.bb
rename to meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index c061553..56eb656 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -4,16 +4,15 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
-DEPENDS = "gconf glib-2.0 gtk+"
+DEPENDS = "gconf glib-2.0 gtk+3"
 SECTION = "x11"
-SRCREV = "9a99528b02255450db81176abd9bbcc1dab9a4c1"
-PV = "0.0+git${SRCPV}"
-
 
+# SRCREV tagged 0.0.2
+SRCREV = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
 SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
            file://addsoundkeys.patch;apply=yes \
            file://70settings-daemon.sh \
-           file://dso_linking_change_build_fix.patch"
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


