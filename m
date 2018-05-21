Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DD10B745AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 09:37:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 May 2018 02:37:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,426,1520924400"; d="scan'208";a="201078446"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 21 May 2018 02:37:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 May 2018 12:37:30 +0300
Message-Id: <20180521093730.40994-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] wireless-tools: remove the recipe
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
X-List-Received-Date: Mon, 21 May 2018 09:37:29 -0000

wireless-tools have been obsolete and superseded by iw for a very long time.

I've checked that images continue to boot and the graphical connman frontend
is still able to list wireless networks; there is no evidence that
wireless-tools are needed by anything.

[YOCTO #12727]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../conf/distro/include/default-providers.inc |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../wireless-tools/avoid_strip.patch          | 21 --------
 .../wireless-tools/ldflags.patch              | 22 --------
 .../wireless-tools/wireless-tools/man.patch   | 15 ------
 .../wireless-tools/remove.ldconfig.call.patch | 19 -------
 .../wireless-tools/wireless-tools_30.pre9.bb  | 50 -------------------
 .../packagegroups/packagegroup-base.bb        |  2 +-
 8 files changed, 1 insertion(+), 130 deletions(-)
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index e65c1ed323d..779b03d50cf 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -23,7 +23,6 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-opkg"
 VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
-VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
 VIRTUAL-RUNTIME_base-utils ?= "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
 
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6d6c148de88..f24e482abe5 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -712,7 +712,6 @@ RECIPE_MAINTAINER_pn-weston-init = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-which = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-wic-tools = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-wireless-tools = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-x11-common = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-x11perf = "Armin Kuster <akuster808@gmail.com>"
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch
deleted file mode 100644
index f34e243de99..00000000000
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools/avoid_strip.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-wireless_tools: Avoid stripping iwmulticall
-
-Upstream-Status: Inappropriate [other]
-  The removed code was from upstream.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur wireless_tools.29.orig/Makefile wireless_tools.29/Makefile
---- wireless_tools.29.orig/Makefile	2011-06-18 11:35:12.183907453 -0500
-+++ wireless_tools.29/Makefile	2011-06-18 11:38:09.995907985 -0500
-@@ -135,9 +135,8 @@
- 
- macaddr: macaddr.o $(IWLIB)
- 
--# Always do symbol stripping here
- iwmulticall: iwmulticall.o
--	$(CC) $(LDFLAGS) -Wl,-s $(XCFLAGS) -o $@ $^ $(LIBS)
-+	$(CC) $(LDFLAGS) $(STRIPFLAGS) $(XCFLAGS) -o $@ $^ $(LIBS)
- 
- # It's a kind of magic...
- wireless.h:
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
deleted file mode 100644
index 6c0d8cbd2e4..00000000000
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools/ldflags.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-wireless-tools: Remove QA warning: No GNU_HASH in the elf binary
-
-Upstream-Status: Inappropriate [other]
-  Useful within bitbake environment only.
-
-Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
-
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- wireless_tools.29.orig/Makefile
-+++ wireless_tools.29/Makefile
-@@ -144,7 +144,7 @@ wireless.h:
- 
- # Compilation of the dynamic library
- $(DYNAMIC): $(OBJS:.o=.so)
--	$(CC) -shared -o $@ -Wl,-soname,$@ $(STRIPFLAGS) $(LIBS) -lc $^
-+	$(CC) -shared -o $@ -Wl,-soname,$@ $(LDFLAGS) $(STRIPFLAGS) $(LIBS) -lc $^
- 
- # Compilation of the static library
- $(STATIC): $(OBJS:.o=.so)
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
deleted file mode 100644
index 6a757dae763..00000000000
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools/man.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: wireless_tools.30/Makefile
-===================================================================
---- wireless_tools.30.orig/Makefile	2014-02-01 00:21:04.148463382 -0800
-+++ wireless_tools.30/Makefile	2014-02-01 00:23:35.448072279 -0800
-@@ -76,7 +76,7 @@
- INSTALL_DIR= $(PREFIX)/sbin
- INSTALL_LIB= $(PREFIX)/lib
- INSTALL_INC= $(PREFIX)/include
--INSTALL_MAN= $(PREFIX)/man
-+INSTALL_MAN= $(PREFIX)/share/man
- 
- # Various commands
- RM = rm -f
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch b/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
deleted file mode 100644
index 3a22c3f1e70..00000000000
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools/remove.ldconfig.call.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache 
-(in my case libstdc++.so cannot be found after building zlib(-native) and I have to call 
-touch */libstdc++.so && /sbin/ldconfig to fix it.
-
-So remove ldconfig call from make install-libs
-
-Upstream-Status: Inappropriate [disable feature]
-
-diff -uNr wireless_tools.29.orig/Makefile wireless_tools.29/Makefile
---- wireless_tools.29.orig/Makefile	2007-09-18 01:56:46.000000000 +0200
-+++ wireless_tools.29/Makefile	2012-02-15 20:46:41.780763514 +0100
-@@ -163,7 +163,6 @@
- 	install -m 755 $(DYNAMIC) $(INSTALL_LIB)
- 	ln -sfn $(DYNAMIC) $(INSTALL_LIB)/$(DYNAMIC_LINK)
- 	@echo "*** Don't forget to add $(INSTALL_LIB) to /etc/ld.so.conf, and run ldconfig as root. ***"
--	@$(LDCONFIG) || echo "*** Could not run ldconfig ! ***"
- 
- # Install the static library
- install-static:: $(STATIC)
diff --git a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb b/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
deleted file mode 100644
index 0a342071e0f..00000000000
--- a/meta/recipes-connectivity/wireless-tools/wireless-tools_30.pre9.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "Tools for the Linux Standard Wireless Extension Subsystem"
-HOMEPAGE = "https://hewlettpackard.github.io/wireless-tools/Tools.html"
-LICENSE = "GPLv2 & (LGPLv2.1 | MPL-1.1 | BSD)"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-			file://iwconfig.c;beginline=1;endline=12;md5=cf710eb1795c376eb10ea4ff04649caf \
-			file://iwevent.c;beginline=59;endline=72;md5=d66a10026d4394f0a5b1c5587bce4537 \
-			file://sample_enc.c;beginline=1;endline=4;md5=838372be07874260b566bae2f6ed33b6"
-SECTION = "base"
-PE = "1"
-
-SRC_URI = "https://hewlettpackard.github.io/wireless-tools/wireless_tools.${PV}.tar.gz \
-           file://remove.ldconfig.call.patch \
-           file://man.patch \
-           file://avoid_strip.patch \
-           file://ldflags.patch \
-          "
-SRC_URI[md5sum] = "ca91ba7c7eff9bfff6926b1a34a4697d"
-SRC_URI[sha256sum] = "abd9c5c98abf1fdd11892ac2f8a56737544fe101e1be27c6241a564948f34c63"
-
-UPSTREAM_CHECK_URI = "https://hewlettpackard.github.io/wireless-tools/Tools.html"
-UPSTREAM_CHECK_REGEX = "wireless_tools\.(?P<pver>(\d+)(\..*|))\.tar\.gz"
-
-S = "${WORKDIR}/wireless_tools.30"
-
-CFLAGS =+ "-I${S}"
-EXTRA_OEMAKE = "-e 'BUILD_SHARED=y' \
-		'INSTALL_DIR=${D}${base_sbindir}' \
-		'INSTALL_LIB=${D}${libdir}' \
-		'INSTALL_INC=${D}${includedir}' \
-		'INSTALL_MAN=${D}${mandir}'"
-
-do_compile() {
-	oe_runmake all libiw.a
-}
-
-do_install() {
-	oe_runmake PREFIX=${D} install-iwmulticall install-dynamic install-man install-hdr
-	install -d ${D}${sbindir}
-	install -m 0755 ifrename ${D}${sbindir}/ifrename
-}
-
-PACKAGES = "libiw libiw-dev libiw-doc ifrename-doc ifrename ${PN} ${PN}-doc ${PN}-dbg"
-
-FILES_libiw = "${libdir}/*.so.*"
-FILES_libiw-dev = "${libdir}/*.a ${libdir}/*.so ${includedir}"
-FILES_libiw-doc = "${mandir}/man7"
-FILES_ifrename = "${sbindir}/ifrename"
-FILES_ifrename-doc = "${mandir}/man8/ifrename.8 ${mandir}/man5/iftab.5"
-FILES_${PN} = "${bindir} ${sbindir}/iw* ${base_sbindir} ${base_bindir} ${sysconfdir}/network"
-FILES_${PN}-doc = "${mandir}"
diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index bb192aed29e..442201c9efa 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -289,7 +289,7 @@ RRECOMMENDS_packagegroup-base-ipsec = "\
 #
 SUMMARY_packagegroup-base-wifi = "WiFi support"
 RDEPENDS_packagegroup-base-wifi = "\
-    ${VIRTUAL-RUNTIME_wireless-tools} \
+    iw \
     wpa-supplicant"
 
 RRECOMMENDS_packagegroup-base-wifi = "\
-- 
2.17.0


