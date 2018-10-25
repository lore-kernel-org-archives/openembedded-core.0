Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0F6D79312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 08:40:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9P8dXaU007041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Oct 2018 01:39:43 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 25 Oct 2018 01:39:22 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 16:39:18 +0800
Message-ID: <1540456759-247805-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
References: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] tk: add new recipe(move from meta-oe)
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
X-List-Received-Date: Thu, 25 Oct 2018 08:40:08 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Move tk recipe from meta-oe to add tkinter
support for python.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../tk/configure.use.fontconfig.with.xft.patch     | 13 ++++
 meta/recipes-devtools/tcltk/tk/confsearch.diff     | 35 ++++++++++
 meta/recipes-devtools/tcltk/tk/fix-xft.diff        | 16 +++++
 meta/recipes-devtools/tcltk/tk/non-linux.diff      | 27 ++++++++
 meta/recipes-devtools/tcltk/tk/tklibrary.diff      | 22 ++++++
 meta/recipes-devtools/tcltk/tk/tkprivate.diff      | 41 +++++++++++
 meta/recipes-devtools/tcltk/tk_8.6.8.bb            | 79 ++++++++++++++++++++++
 7 files changed, 233 insertions(+)
 create mode 100644 meta/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
 create mode 100644 meta/recipes-devtools/tcltk/tk/confsearch.diff
 create mode 100644 meta/recipes-devtools/tcltk/tk/fix-xft.diff
 create mode 100644 meta/recipes-devtools/tcltk/tk/non-linux.diff
 create mode 100644 meta/recipes-devtools/tcltk/tk/tklibrary.diff
 create mode 100644 meta/recipes-devtools/tcltk/tk/tkprivate.diff
 create mode 100644 meta/recipes-devtools/tcltk/tk_8.6.8.bb

diff --git a/meta/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch b/meta/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
new file mode 100644
index 0000000..a0c157f
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
@@ -0,0 +1,13 @@
+--- a/configure.in.orig	2014-05-10 14:35:39.859147385 +0000
++++ b/configure.in	2014-05-10 14:36:20.282925184 +0000
+@@ -554,8 +554,8 @@
+ 	dnl make sure package configurator (xft-config or pkg-config
+ 	dnl says that xft is present.
+ 	    found_xft=yes
+-	    XFT_CFLAGS=`pkg-config --cflags xft 2>/dev/null` || found_xft="no"
+-	    XFT_LIBS=`pkg-config --libs xft 2>/dev/null` || found_xft="no"
++	    XFT_CFLAGS=`pkg-config --cflags xft fontconfig 2>/dev/null` || found_xft="no"
++	    XFT_LIBS=`pkg-config --libs xft fontconfig 2>/dev/null` || found_xft="no"
+ 	AC_MSG_RESULT([$found_xft])
+ 	dnl make sure that compiling against Xft header file doesn't bomb
+ 	if test "$found_xft" = "yes" ; then
diff --git a/meta/recipes-devtools/tcltk/tk/confsearch.diff b/meta/recipes-devtools/tcltk/tk/confsearch.diff
new file mode 100644
index 0000000..4dbd9a4
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk/confsearch.diff
@@ -0,0 +1,35 @@
+Patch by Sergei Golovan allows to find tclConfig.sh in /usr/share/tcltk/tcl8.5
+and tkConfig.sh in /usr/share/tcltk/tk8.5 where they are located in Debian
+installation.
+
+--- tk8.5-8.5.8.orig/unix/configure
++++ tk8.5-8.5.8/unix/configure
+@@ -1431,7 +1431,8 @@
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/pkg/lib 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
+ 			`ls -d /usr/lib 2>/dev/null` \
+ 			`ls -d /usr/lib64 2>/dev/null` \
+ 			; do
+ 		    if test -f "$i/tclConfig.sh" ; then
+--- tk8.5-8.5.8.orig/unix/tcl.m4
++++ tk8.5-8.5.8/unix/tcl.m4
+@@ -93,7 +93,8 @@
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/pkg/lib 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tcl8.5 2>/dev/null` \
+ 			`ls -d /usr/lib 2>/dev/null` \
+ 			`ls -d /usr/lib64 2>/dev/null` \
+ 			; do
+ 		    if test -f "$i/tclConfig.sh" ; then
+@@ -223,7 +224,8 @@
+ 			`ls -d ${prefix}/lib 2>/dev/null` \
+ 			`ls -d /usr/local/lib 2>/dev/null` \
+ 			`ls -d /usr/contrib/lib 2>/dev/null` \
++			`ls -d /usr/share/tcltk/tk8.5 2>/dev/null` \
+ 			`ls -d /usr/lib 2>/dev/null` \
+ 			`ls -d /usr/lib64 2>/dev/null` \
+ 			; do
+ 		    if test -f "$i/tkConfig.sh" ; then
diff --git a/meta/recipes-devtools/tcltk/tk/fix-xft.diff b/meta/recipes-devtools/tcltk/tk/fix-xft.diff
new file mode 100644
index 0000000..d1bb710
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk/fix-xft.diff
@@ -0,0 +1,16 @@
+--- /tmp/configure.in	2010-05-19 13:29:03.000000000 +0200
++++ unix/configure.in	2010-05-19 13:42:05.000000000 +0200
+@@ -526,13 +526,9 @@
+ 	found_xft="yes"
+ 	dnl make sure package configurator (xft-config or pkg-config
+ 	dnl says that xft is present.
+-	XFT_CFLAGS=`xft-config --cflags 2>/dev/null` || found_xft="no"
+-	XFT_LIBS=`xft-config --libs 2>/dev/null` || found_xft="no"
+-	if test "$found_xft" = "no" ; then
+ 	    found_xft=yes
+ 	    XFT_CFLAGS=`pkg-config --cflags xft 2>/dev/null` || found_xft="no"
+ 	    XFT_LIBS=`pkg-config --libs xft 2>/dev/null` || found_xft="no"
+-	fi
+ 	AC_MSG_RESULT([$found_xft])
+ 	dnl make sure that compiling against Xft header file doesn't bomb
+ 	if test "$found_xft" = "yes" ; then
diff --git a/meta/recipes-devtools/tcltk/tk/non-linux.diff b/meta/recipes-devtools/tcltk/tk/non-linux.diff
new file mode 100644
index 0000000..7d31f9f
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk/non-linux.diff
@@ -0,0 +1,27 @@
+Patch by Sergei Golovan (originally by Mike Markley and Chris Waters) fixes
+building on non-linux Debian architectures.
+
+--- tk8.5-8.5.8.orig/unix/configure
++++ tk8.5-8.5.8/unix/configure
+@@ -4447,6 +4447,9 @@
+ 		if test "`uname -s`" = "AIX" ; then
+ 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
+ 		fi
++		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
++		    tcl_cv_sys_version=NetBSD-Debian
++		fi
+ 	    fi
+ 	fi
+
+--- tk8.5-8.5.8.orig/unix/tcl.m4
++++ tk8.5-8.5.8/unix/tcl.m4
+@@ -962,6 +962,9 @@
+ 		if test "`uname -s`" = "AIX" ; then
+ 		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
+ 		fi
++		if test "`uname -s`" = "NetBSD" -a -f /etc/debian_version ; then
++		    tcl_cv_sys_version=NetBSD-Debian
++		fi
+ 	    fi
+ 	fi
+     ])
diff --git a/meta/recipes-devtools/tcltk/tk/tklibrary.diff b/meta/recipes-devtools/tcltk/tk/tklibrary.diff
new file mode 100644
index 0000000..ee38c2a
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk/tklibrary.diff
@@ -0,0 +1,22 @@
+--- tk8.5-8.5.8.orig/unix/configure
++++ tk8.5-8.5.8/unix/configure
+@@ -11070,7 +11070,7 @@
+     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
+ fi
+ 
+-TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
++test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
+ PRIVATE_INCLUDE_DIR='$(includedir)'
+ HTML_DIR='$(DISTDIR)/html'
+ TK_PKG_DIR='tk$(VERSION)'
+--- tk8.5-8.5.8.orig/unix/configure.in
++++ tk8.5-8.5.8/unix/configure.in
+@@ -607,7 +607,7 @@
+     TCL_STUB_FLAGS="-DUSE_TCL_STUBS"
+ fi
+ 
+-TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
++test -z "$TK_LIBRARY" && TK_LIBRARY='$(prefix)/lib/tk$(VERSION)'
+ PRIVATE_INCLUDE_DIR='$(includedir)'
+ HTML_DIR='$(DISTDIR)/html'
+ TK_PKG_DIR='tk$(VERSION)'
diff --git a/meta/recipes-devtools/tcltk/tk/tkprivate.diff b/meta/recipes-devtools/tcltk/tk/tkprivate.diff
new file mode 100644
index 0000000..4e15469
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk/tkprivate.diff
@@ -0,0 +1,41 @@
+Patch by Chris Waters sets path which are normally point to a directory
+with Tk sources to a subdirectory of /usr/include/tcl8.4 (debian/rules
+puts private Tk headers there).
+
+--- tk8.5-8.5.8.orig/unix/tkConfig.sh.in
++++ tk8.5-8.5.8/unix/tkConfig.sh.in
+@@ -55,7 +55,7 @@
+ 
+ # String to pass to linker to pick up the Tk library from its
+ # build directory.
+-TK_BUILD_LIB_SPEC='@TK_BUILD_LIB_SPEC@'
++TK_BUILD_LIB_SPEC='@TK_LIB_SPEC@'
+ 
+ # String to pass to linker to pick up the Tk library from its
+ # installed directory.
+@@ -71,7 +71,7 @@
+ # different place than the directory containing the source files, this
+ # points to the location of the sources, not the location where Tk was
+ # compiled.
+-TK_SRC_DIR='@TK_SRC_DIR@'
++TK_SRC_DIR='@includedir@/tk-private'
+ 
+ # Needed if you want to make a 'fat' shared library library
+ # containing tk objects or link a different wish.
+@@ -86,14 +86,14 @@
+ 
+ # String to pass to linker to pick up the Tk stub library from its
+ # build directory.
+-TK_BUILD_STUB_LIB_SPEC='@TK_BUILD_STUB_LIB_SPEC@'
++TK_BUILD_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
+ 
+ # String to pass to linker to pick up the Tk stub library from its
+ # installed directory.
+ TK_STUB_LIB_SPEC='@TK_STUB_LIB_SPEC@'
+ 
+ # Path to the Tk stub library in the build directory.
+-TK_BUILD_STUB_LIB_PATH='@TK_BUILD_STUB_LIB_PATH@'
++TK_BUILD_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
+ 
+ # Path to the Tk stub library in the install directory.
+ TK_STUB_LIB_PATH='@TK_STUB_LIB_PATH@'
diff --git a/meta/recipes-devtools/tcltk/tk_8.6.8.bb b/meta/recipes-devtools/tcltk/tk_8.6.8.bb
new file mode 100644
index 0000000..13dc4d7
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk_8.6.8.bb
@@ -0,0 +1,79 @@
+SUMMARY = "Tool Command Language ToolKit Extension"
+HOMEPAGE = "http://tcl.sourceforge.net"
+SECTION = "devel/tcltk"
+
+# http://www.tcl.tk/software/tcltk/license.html
+LICENSE = "tcl"
+LIC_FILES_CHKSUM = "file://../license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../compat/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../doc/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../library/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../macosx/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../tests/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../unix/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../win/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+    file://../xlib/license.terms;md5=c88f99decec11afa967ad33d314f87fe \
+"
+
+DEPENDS = "tcl virtual/libx11 libxt"
+
+SRC_URI = "\
+    ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
+    file://confsearch.diff;striplevel=2 \
+    file://non-linux.diff;striplevel=2 \
+    file://tklibrary.diff;striplevel=2 \
+    file://tkprivate.diff;striplevel=2 \
+    file://fix-xft.diff \
+    file://configure.use.fontconfig.with.xft.patch \
+"
+SRC_URI[md5sum] = "5e0faecba458ee1386078fb228d008ba"
+SRC_URI[sha256sum] = "49e7bca08dde95195a27f594f7c850b088be357a7c7096e44e1158c7a5fd7b33"
+
+S = "${WORKDIR}/${BPN}${PV}/unix"
+
+# Short version format: "8.6"
+VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
+
+LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
+inherit autotools distro_features_check
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
+EXTRA_OECONF = "\
+    --enable-threads \
+    --with-x \
+    --with-tcl=${STAGING_BINDIR_CROSS} \
+    --libdir=${libdir} \
+"
+
+do_install_append() {
+    ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
+    oe_libinstall -so libtk${VER} ${D}${libdir}
+    ln -sf wish${VER} ${D}${bindir}/wish
+
+    # Even after passing libdir=${libdir} at config, some incorrect dirs are still generated for the multilib build
+    if [ "$libdir" != "/usr/lib" ]; then
+        # Move files to correct library directory
+        mv ${D}/usr/lib/tk${VER}/* ${D}/${libdir}/tk${VER}/
+        # Remove unneeded/incorrect dir ('usr/lib/')
+        rm -rf ${D}/usr/lib
+    fi
+}
+
+PACKAGECONFIG ??= "xft"
+PACKAGECONFIG[xft] = "--enable-xft,--disable-xft,xft"
+PACKAGECONFIG[xss] = "--enable-xss,--disable-xss,libxscrnsaver libxext"
+
+PACKAGES =+ "${PN}-lib"
+
+FILES_${PN}-lib = "${libdir}/libtk${VER}.so*"
+FILES_${PN} += "${libdir}/tk*"
+
+# isn't getting picked up by shlibs code
+RDEPENDS_${PN} += "tk-lib"
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native"
+
+# Fix the path in sstate
+SSTATE_SCAN_FILES += "*Config.sh"
-- 
2.7.4


