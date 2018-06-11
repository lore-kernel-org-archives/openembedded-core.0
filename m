Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id F065778C81
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 20:42:46 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id w7-v6so21780747wrn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=6lW5PQw4gHKp461kHztrdYAzN+lSqDsYB9ayhfTTZN4=;
	b=l94WWB+ZQkdyCodrlPcTzQRiRzmY4kSGR+CLXEvf4gM1xknFIOI0eyDsO3q3sggeJ3
	afYgBfYlBhD2wz3nUw45NMY31FxQdwW1I6hrsCM5xYQSB+zOAOSaSTW/fXHnDbSMd/MO
	/1uNKEcbG3JKGmmRhB4RCh1t+1PFh+loU/cSSvOsHAaLkH5jOeM/t8qZPlveL8TlNqQC
	SdBQo9La6SE7MasQZ0BEeYEeyPLAvRViSmXEj+7xYAdOzPIZzm9XzrOh2g6O+4NAOFRx
	YDMYmFNlz6w7ADUwPFYKi2wi9jsNlmosbgIUfVb6mycc4GCH10PfXk4pZ9uxwxyZf7dN
	XmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6lW5PQw4gHKp461kHztrdYAzN+lSqDsYB9ayhfTTZN4=;
	b=C6GzoVixhUah2vF27bkGXjCAUFU3b95UQr7MqTwxjzeOFG6XGId2lIoyfOyvHM7uVO
	A/xhF554ZHnZs/pjDkCgpkl1YdimdaXMoBANV0/JApQs6pG5psLzFwOyCQxQf8vMQxU5
	W7GCIPEXQcdWc29gWjXjMdD8u7UWGd4yA+SeYYTQV0wocg12V4HvCAc3VoDpZHI6E9ZS
	NAJGqyWV4rxgA5gnMsmvr6hD+c/Kxwjq+ORYctwoG4ImvqtXHM209YvNeAVbodWulX1V
	s7RQ06fJKk7Rx3NMlegXnp61VtYThsVw9UFfQXYpteSIe6q1DOOkeR5n8LvfVR/thL6W
	Fz3A==
X-Gm-Message-State: APt69E0uLaHGW94HycYl83xZ811ykAEgt3o7VGh7AMTiz9iHlTL7ONd/
	V4NK27/AZtd9sWNFiArilkREFBFM
X-Google-Smtp-Source: ADUXVKKzXWEa3MyXTCj3XlOKMsQLPzQrAP10jSZxv7vcWp0Yfx9+x0AHTQUABpd7OW2Z6UVUV+VlCw==
X-Received: by 2002:adf:9525:: with SMTP id 34-v6mr439918wrs.99.1528749767096; 
	Mon, 11 Jun 2018 13:42:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a184-v6sm9921857wmf.30.2018.06.11.13.42.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 13:42:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jun 2018 21:42:43 +0100
Message-Id: <20180611204243.3022-1-ross.burton@intel.com>
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
X-List-Received-Date: Mon, 11 Jun 2018 20:42:47 -0000

alsa-tools is actually a collection of 20 separate tools, each with their own
configure scripts.  The dependencies are varied, old, and estoric (FLTK, GTK+ 1, 2,
and 3, PyGTK 2, Qt3).

Instead of maintaining patches to try and pick a subset that builds, use
PACKAGECONFIG and some magic to build what the user requests.

By default we build all the tools which have no dependencies, and the tools
which need GTK+ 2 or GTK+ 3 if the relevant DISTRO_FEATURES are enabled.

The ncurses build dependency doesn't seem to be checked for, so remove that.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...g-Wreserved-user-defined-literal-warnings.patch | 14 +++-
 .../alsa/alsa-tools/autotools.patch                | 44 -----------
 .../alsa/alsa-tools/gitcompile_hdajacksensetest    | 13 ----
 .../alsa/alsa-tools/makefile_no_gtk.patch          | 29 -------
 meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb   | 91 +++++++++++++++-------
 5 files changed, 71 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/autotools.patch
 delete mode 100755 meta/recipes-multimedia/alsa/alsa-tools/gitcompile_hdajacksensetest
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch

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
diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
index e065eec6b8d..a54999f817b 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-tools_1.1.6.bb
@@ -3,16 +3,13 @@ HOMEPAGE = "http://www.alsa-project.org"
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
            "
 
@@ -20,36 +17,70 @@ SRC_URI[md5sum] = "5ca8c9437ae779997cd62fb2815fef19"
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


