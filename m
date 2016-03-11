Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 25F1C73218
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 13:07:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 11 Mar 2016 05:07:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="907975312"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2016 05:07:04 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 15:12:27 +0200
Message-Id: <57bf8e3c2ac8236d0bee9420edab0d2d608a437d.1457698804.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
References: <cdfe332fa18ab7007527661a7cb458f899f04336.1457698804.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1457698804.git.jussi.kukkonen@intel.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
Subject: [RFC PATCH 08/12] settings-daemon: Upgrade to JKU
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
X-List-Received-Date: Fri, 11 Mar 2016 13:07:04 -0000

Remove patch that's already upstream.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../files/dso_linking_change_build_fix.patch       | 31 ----------------------
 .../settings-daemon/settings-daemon_git.bb         |  8 +++---
 2 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch

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
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
index c061553..28035e9 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
@@ -4,16 +4,16 @@ BUGTRACKER = "http://bugzilla.yoctoproject.org/"
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://xsettings-manager.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b \
                     file://xsettings-common.h;endline=22;md5=7cfac9d2d4dc3694cc7eb605cf32a69b"
-DEPENDS = "gconf glib-2.0 gtk+"
+DEPENDS = "gconf glib-2.0 gtk+3"
 SECTION = "x11"
-SRCREV = "9a99528b02255450db81176abd9bbcc1dab9a4c1"
+SRCREV = "4a06d2169cf1fdcb4427c105fdc54fc80c3f334b"
 PV = "0.0+git${SRCPV}"
 
 
-SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
+SRC_URI = "git://github.com/jku/xsettings-daemon.git;branch=gtk3 \
            file://addsoundkeys.patch;apply=yes \
            file://70settings-daemon.sh \
-           file://dso_linking_change_build_fix.patch"
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.1.4


