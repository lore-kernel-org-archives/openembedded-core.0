Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id BC04D74751
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:22:52 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id l41-v6so10304338wre.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=aVeWOfghZTZ0oAFTBWig9VheTUb+VqQNweZWk/YP61g=;
	b=1wc1+jamBL2Ifl+IktKp5KtrrpoYV/0UD6GgB3yDxWCuj94PZYiE+TfviNmG1rQXp8
	aZl+iuTnnPAyEF+/GePmlGDeM9nFIJ5rgnjDGiFpDvhio5LDw3yVVb2l2J0z5+VHr3wv
	EdyuRxUUMLIGFljtMWs6Iyd0THdBmkJ/zdaLFtoAF8jDoXbNxKoKOXnpIyZK0813FSSR
	XuctZte7wQHM08e6PUGup0zy2kpdb/ghTLpVX+xBBVvDmAKEdLr7XzRwRuztKOjeA0U+
	Z+eE8Dc1+8ckUXD6POxWlE2gl0766YV+dy3QdnQHirLfekQ9yQ+k6XdRYZIU5Nbru+wG
	eJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aVeWOfghZTZ0oAFTBWig9VheTUb+VqQNweZWk/YP61g=;
	b=cNbQNwcLYqM4TstJwVUW0X/zfOuSDP5n6bIQicJojLHYHTuM1PySljGrvqfr9EN0xR
	Qi4tfB/Y5wtnz0nwRRqh+8510Tx/eMQR4u3PwVTPccgOVE3u3SHu9OqEk5ShgCgUByvU
	rP1LPigdPcVTs/VDFhftfCQQ50Hr9d5eM1sbILKRuJGg6Q6SDXjuTjjRH/FWtoyysn+5
	LsfKml8GU//+6mZ+Iz4sPGNcUL6Nm0yngRmlLbd+fEVt71Edw+Q6YlnQahtWvxXFHSEJ
	Lbrq91nv36xL3+U6mOUj1CPw/uMzJ5sbyVDIbwvZSRlvGrL0m8GLjEqVUQX+BjkgnmoL
	mUZw==
X-Gm-Message-State: APt69E0j7q/4MOmZE1qgFelz3uITD4eKuGOzawhJSMkV/WyOUSBwAEgp
	aJqxjGzsURRA1laOXtJZzGJbEbL3
X-Google-Smtp-Source: ADUXVKKgU2WzCIa04i7h/VrQLLGc5nzqEVHSscd9fQqxGb8pnxHZ1NHqLMC69izKmm/KwZESiUetOA==
X-Received: by 2002:adf:fb43:: with SMTP id c3-v6mr2188228wrs.32.1529076172822;
	Fri, 15 Jun 2018 08:22:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g11-v6sm8940481wrr.46.2018.06.15.08.22.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 08:22:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 16:22:42 +0100
Message-Id: <20180615152242.28684-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] alsa-tools: rewrite packaging
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
X-List-Received-Date: Fri, 15 Jun 2018 15:22:53 -0000

alsa-tools is actually a collection of 20 separate tools, each with their own
configure scripts.  The dependencies are varied, old, and estoric (FLTK, GTK+ 1, 2,
and 3, PyGTK 2, Qt3).

Instead of maintaining patches to try and pick a subset that builds, use
PACKAGECONFIG and some magic to build what the user requests.

By default we build all the tools which have no dependencies, and the tools
which need GTK+ 2 or GTK+ 3 if the relevant DISTRO_FEATURES are enabled.

Add a patch to fix the build of ld10k1 with musl.

The ncurses build dependency doesn't seem to be checked for, so remove that.

(From OE-Core rev: 83c9405df5748744ef673ac8757bb89d7050ad8d)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...g-Wreserved-user-defined-literal-warnings.patch | 14 +++-
 .../alsa/alsa-tools/autotools.patch                | 44 -----------
 .../alsa/alsa-tools/gitcompile_hdajacksensetest    | 13 ---
 .../alsa/alsa-tools/makefile_no_gtk.patch          | 29 -------
 meta/recipes-multimedia/alsa/alsa-tools/musl.patch | 47 +++++++++++
 meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb   | 92 +++++++++++++++-------
 6 files changed, 119 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
 delete mode 100755 meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/musl.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
index 2290915eab8..c137bc8a284 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
@@ -1,14 +1,18 @@
-From 2e48e4045e1e951433da0ca4b1e49798eedde14f Mon Sep 17 00:00:00 2001
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From a861bdabf02cd9bfb3ec7c0571c563c0fa14adfb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 24 Apr 2018 12:21:18 -0700
-Subject: [PATCH] Fix clang -Wreserved-user-defined-literal warnings
+Date: Tue, 24 Apr 2018 12:24:32 -0700
+Subject: [PATCH] us428control: Fix clang -Wreserved-user-defined-literal
+ warnings
 
 | us428control.cc:66:18: error: invalid suffix on literal; C++11 requires a space between literal and identifier [-Wreserved-user-defined-literal]
 |         printf("usage: "PROGNAME" [-v verbosity_level 0..2] [-c card] [-D device] [-u usb-device] [-m mode]\n");
 |                         ^
 
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/10360805/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
 ---
  us428control/us428control.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,3 +30,5 @@ index e839bf4..8cb3c42 100644
  	printf("mode is one of (us224, us428, mixxx)\n");
  }
  /*
+-- 
+1.7.11.7
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch b/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
deleted file mode 100644
index c85834a593c..00000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From b9a65bf3ba5628cfe8cfd2d10ce2dcf11a606775 Mon Sep 17 00:00:00 2001
-From: Dongxiao Xu <dongxiao.xu@intel.com>
-Date: Thu, 14 Jul 2011 15:40:36 +0800
-Subject: [PATCH] alsa-tools: Fix recipe build error.
-
-Add parameters to autoreconf to support cross compile.
-Remove some sub-components which needs further recipe support.
-
-Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
----
- Makefile          | 4 ++--
- ld10k1/gitcompile | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c32bf25..1119372 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,8 +1,8 @@
- VERSION = 1.1.6
- TOP = .
--SUBDIRS = as10k1 envy24control hdsploader hdspconf hdspmixer \
-+SUBDIRS = as10k1 envy24control \
- 	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
--	  us428control usx2yloader vxloader echomixer ld10k1 qlo10k1 \
-+	  us428control usx2yloader vxloader echomixer \
- 	  hwmixvolume hdajackretask hda-verb hdajacksensetest
- 
- all:
-diff --git a/ld10k1/gitcompile b/ld10k1/gitcompile
-index 99429ac..20005d9 100755
---- a/ld10k1/gitcompile
-+++ b/ld10k1/gitcompile
-@@ -1,6 +1,6 @@
- #!/bin/bash
- 
--autoreconf -fi || exit 1
-+autoreconf $ACLOCAL_FLAGS -fi || exit 1
- export CFLAGS='-O2 -Wall -pipe -g'
- echo "CFLAGS=$CFLAGS"
- echo "./configure $@"
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest b/meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
deleted file mode 100755
index 58328bd3a50..00000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
+++ /dev/null
@@ -1,13 +0,0 @@
-#!/bin/bash
-
-aclocal $ACLOCAL_FLAGS || exit 1
-automake --foreign --add-missing || exit 1
-autoconf || exit 1
-export CFLAGS='-O2 -Wall -pipe -g'
-echo "CFLAGS=$CFLAGS"
-echo "./configure $@"
-./configure $@ || exit 1
-unset CFLAGS
-if [ -z "$GITCOMPILE_NO_MAKE" ]; then
-  make || exit 1
-fi
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
deleted file mode 100644
index 54373d1a8f3..00000000000
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Remove some sub-components which need gtk+.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-Update patch for alsa-tools 1.0.29
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-diff --git a/Makefile b/Makefile
-index 2457a1c..72346d9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,9 +1,9 @@
- VERSION = 1.1.5
- TOP = .
--SUBDIRS = as10k1 envy24control \
--	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
--	  us428control usx2yloader vxloader echomixer \
--	  hwmixvolume hdajackretask hda-verb hdajacksensetest
-+SUBDIRS = as10k1 \
-+	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
-+	  us428control usx2yloader vxloader \
-+	  hwmixvolume hda-verb hdajacksensetest
- 
- all:
- 	@for i in $(SUBDIRS); do \
diff --git a/meta/recipes-multimedia/alsa/alsa-tools/musl.patch b/meta/recipes-multimedia/alsa/alsa-tools/musl.patch
new file mode 100644
index 00000000000..9eb129c379e
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-tools/musl.patch
@@ -0,0 +1,47 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 235d9c5e8381518b0a8661786e7e0cbdd1bbcd01 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 12 Jun 2018 13:24:34 +0100
+Subject: [PATCH] ld10k1: define _GNU_SOURCE and use sighandler_t
+
+__sighandler_t is a glibc internal type which doesn't exist in musl.  By using
+AC_USE_SYSTEM_EXTENSIONS to get _GNU_SOURCE defined, both glibc and musl
+then expose sighandler_t.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ ld10k1/configure.ac      | 1 +
+ ld10k1/src/ld10k1_fnc1.c | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/ld10k1/configure.ac b/ld10k1/configure.ac
+index 276b24e..f48ca31 100644
+--- a/ld10k1/configure.ac
++++ b/ld10k1/configure.ac
+@@ -4,6 +4,7 @@ AC_CONFIG_MACRO_DIR([m4])
+ AM_MAINTAINER_MODE([enable])
+ 
+ AC_CONFIG_HEADERS(config.h)
++AC_USE_SYSTEM_EXTENSIONS
+ AC_PROG_CC
+ AC_PROG_LD
+ AC_PROG_INSTALL
+diff --git a/ld10k1/src/ld10k1_fnc1.c b/ld10k1/src/ld10k1_fnc1.c
+index 343584c..ddc43c6 100644
+--- a/ld10k1/src/ld10k1_fnc1.c
++++ b/ld10k1/src/ld10k1_fnc1.c
+@@ -179,7 +179,7 @@ int main_loop(comm_param *param, int audigy, const char *card_id, int tram_size,
+ {
+ 	fd_set active_fd_set/*, read_fd_set*/;
+ 	int i, j, res = 0;
+-	__sighandler_t old_sig_pipe;
++	sighandler_t old_sig_pipe;
+ 
+ 	int main_sock = 0;
+ 	int data_sock = 0;
+-- 
+2.11.0
+
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
index e065eec6b8d..90e54dbb145 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
@@ -3,53 +3,85 @@ HOMEPAGE = "http://www.alsa-project.org"
 BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2+"
-DEPENDS = "alsa-lib ncurses glib-2.0"
+DEPENDS = "alsa-lib"
 
 LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://ld10k1/COPYING.LIB;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/${BP}.tar.bz2 \
-           file://autotools.patch \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)} \
-           file://gitcompile_hdajacksensetest \
            file://0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch \
+           file://musl.patch \
            "
 
 SRC_URI[md5sum] = "5ca8c9437ae779997cd62fb2815fef19"
 SRC_URI[sha256sum] = "d69c4dc2fb641a974d9903e9eb78c94cb0c7ac6c45bae664f0c9d6c0a1593227"
 
 inherit autotools-brokensep pkgconfig
-
+# brokensep as as10k1 (and probably more) fail out of tree
 CLEANBROKEN = "1"
 
-EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
-PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
-
-# configure.ac/.in doesn't exist so force copy
-AUTOTOOLS_COPYACLOCAL = "1"
-
-do_compile_prepend () {
-    #Automake dir is not correctly detected in cross compilation case
-    export AUTOMAKE_DIR="$(automake --print-libdir)"
-    export ACLOCAL_FLAGS="--system-acdir=${ACLOCALDIR}/ ${ACLOCALEXTRAPATH}"
-
-    cp ${WORKDIR}/gitcompile_hdajacksensetest ${S}/hdajacksensetest/gitcompile
+# Here we use PACKAGECONFIG options to pick which directories we configure/build.
+# Remember on upgrades to check that no new tools have been added.
+PACKAGECONFIG ??= "as10k1 hdajacksensetest hda-verb hdsploader ld10k1 mixartloader pcxhrloader \
+                   sb16_csp seq--sbiload sscape_ctl us428control usx2yloader vxloader \
+                   ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK2DISTROFEATURES}', 'echomixer envy24control rmedigicontrol', '', d)} \
+                   ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'hdajackretask', '', d)} \
+                   "
+
+PACKAGECONFIG[as10k1] = ""
+PACKAGECONFIG[echomixer] = ",,gtk+"
+PACKAGECONFIG[envy24control] = ",,gtk+"
+PACKAGECONFIG[hda-verb] = ""
+PACKAGECONFIG[hdajackretask] = ",,gtk+3"
+PACKAGECONFIG[hdajacksensetest] = ",,glib-2.0"
+PACKAGECONFIG[hdspconf] = ",,fltk"
+PACKAGECONFIG[hdsploader] = ""
+PACKAGECONFIG[hdspmixer] = ",,fltk"
+PACKAGECONFIG[hwmixvolume] = ",,,python-core python-pygtk"
+PACKAGECONFIG[ld10k1] = ""
+PACKAGECONFIG[mixartloader] = ""
+PACKAGECONFIG[pcxhrloader] = ""
+PACKAGECONFIG[qlo10k1] = ",,qt-x11-free"
+PACKAGECONFIG[rmedigicontrol] = ",,gtk+"
+PACKAGECONFIG[sb16_csp] = ""
+PACKAGECONFIG[seq--sbiload] = ""
+PACKAGECONFIG[sscape_ctl] = ""
+PACKAGECONFIG[us428control] = ""
+PACKAGECONFIG[usx2yloader] = ""
+PACKAGECONFIG[vxloader] = ""
+
+python do_configure() {
+    for subdir in d.getVar("PACKAGECONFIG").split():
+        subdir = subdir.replace("--", "/")
+        bb.note("Configuring %s" % subdir)
+        dd = d.createCopy()
+        dd.setVar("S", os.path.join(d.getVar("S"), subdir))
+        bb.build.exec_func("autotools_do_configure", dd)
 }
 
-do_install_append() {
-    sed -i -e "s|/usr/bin/python2|/usr/bin/env python2|g" ${D}${bindir}/hwmixvolume
+python do_compile() {
+    for subdir in d.getVar("PACKAGECONFIG").split():
+        subdir = subdir.replace("--", "/")
+        bb.note("Compiling %s" % subdir)
+        dd = d.createCopy()
+        dd.setVar("S", os.path.join(d.getVar("S"), subdir))
+        bb.build.exec_func("autotools_do_compile", dd)
 }
 
-PACKAGES =+ "${PN}-hwmixvolume"
-
-FILES_${PN}-hwmixvolume = "${bindir}/hwmixvolume"
-
-FILES_${PN} += "${datadir}/ld10k1 \
-                ${datadir}/icons/hicolor \
-               "
-
-RDEPENDS_${PN}-hwmixvolume += "python"
+python do_install() {
+    for subdir in d.getVar("PACKAGECONFIG").split():
+        subdir = subdir.replace("--", "/")
+        bb.note("Installing %s" % subdir)
+        dd = d.createCopy()
+        dd.setVar("S", os.path.join(d.getVar("S"), subdir))
+        bb.build.exec_func("autotools_do_install", dd)
+
+    # Just remove bash-needing init script that isn't installed as an init script
+    try:
+        os.remove(oe.path.join(d.getVar("D"), d.getVar("sbindir"), "ld10k1d"))
+    except:
+        pass
+}
 
+FILES_${PN} += "${datadir}"
-- 
2.11.0


