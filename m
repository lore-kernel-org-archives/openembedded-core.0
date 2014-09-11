Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA5F65FE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 02:28:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8B2SOgY014750
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Sep 2014 19:28:25 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Sep 2014 19:28:24 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Sep 2014 10:28:28 +0800
Message-ID: <1410402508-24172-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] texinfo: integrate texinfo 4.8
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
X-List-Received-Date: Thu, 11 Sep 2014 02:28:32 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

It is a GPLv2 package

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../texinfo/texinfo-4.8/check-locale-h.patch       |   28 ++++++++++
 .../texinfo-4.8/do-compile-native-tools.patch      |   49 +++++++++++++++++
 .../texinfo-4.8/using-native-makeinfo.patch        |   24 +++++++++
 meta/recipes-extended/texinfo/texinfo_4.8.bb       |   56 ++++++++++++++++++++
 4 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch
 create mode 100644 meta/recipes-extended/texinfo/texinfo_4.8.bb

diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch b/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
new file mode 100644
index 0000000..4a8cc57
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.8/check-locale-h.patch
@@ -0,0 +1,28 @@
+fix the macro check
+
+Upstream-status: Pending
+
+configure does not check if locale.h exists, but check setlocale,
+if setlocale exist, the locale.h should exist.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ lib/system.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/system.h b/lib/system.h
+index 946eb3c..c70037b 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -42,7 +42,7 @@ extern char *substring (const char *, const char *);
+ #include <ctype.h>
+ 
+ /* All systems nowadays probably have these functions, but ... */
+-#ifdef HAVE_LOCALE_H
++#ifdef HAVE_SETLOCALE
+ #include <locale.h>
+ #endif
+ #ifndef HAVE_SETLOCALE
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch b/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch
new file mode 100644
index 0000000..2cc5fbb
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.8/do-compile-native-tools.patch
@@ -0,0 +1,49 @@
+From 458e9450cecf703f55536e609365162719585900 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Wed, 10 Sep 2014 17:03:29 +0800
+Subject: [PATCH] do not compile host tools, since we have native
+
+Upstream-status: Pending
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ configure.ac | 23 +----------------------
+ 1 file changed, 1 insertion(+), 22 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b46130d..cf58654 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -90,28 +90,7 @@ AC_CANONICAL_BUILD
+ # $native_tools is also added to SUBDIRS in the main Makefile.am,
+ # so that make compiles the native tools first.
+ #
+-if test "$cross_compiling" = no; then
+-  native_tools=
+-else
+-  native_tools=tools
+-  test -d "$native_tools" || mkdir "$native_tools"
+-  confdir=`(cd "$srcdir";pwd)`
+-  # Make sure the secondary configure won't fail with
+-  # "error: source directory already configured".
+-  rm -f config.status
+-  AC_MSG_NOTICE([[Doing configure of native tools (${build}).]])
+-  cd "$native_tools" || exit 1
+-  # Run secondary configure in alternate environment or
+-  # it gets the wrong CC etc.  env -i gives this build host configure
+-  # a clean environment.
+-  env -i CC="${BUILD_CC}" AR="${BUILD_AR}" RANLIB="${BUILD_RANLIB}" \
+-      PATH="${PATH}" \
+-      tools_only=1 \
+-    ${confdir}/configure --build=${build} --host=${build} \
+-                         --disable-rpath --disable-nls
+-  cd .. || exit 1
+-  AC_MSG_NOTICE([[Continuing with main configure (${host}).]])
+-fi
++native_tools=
+ AC_SUBST(native_tools)
+ AM_CONDITIONAL(TOOLS_ONLY, [[test "x$tools_only" = x1]])
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch b/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch
new file mode 100644
index 0000000..d9bed69
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo-4.8/using-native-makeinfo.patch
@@ -0,0 +1,24 @@
+From 9b0df7d6d3c18cfac82c291d60a5357d1bc8d9d0 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Wed, 10 Sep 2014 17:10:03 +0800
+Subject: [PATCH] using native makeinfo
+
+Upstream-status: Pending
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ doc/Makefile.am                                |   2 +-
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index 63df818..b6ceb34 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -19,7 +19,7 @@ man_MANS = info.1 infokey.1 install-info.1 makeinfo.1 texindex.1 texi2dvi.1 \
+ 
+ # Use the programs built in our distribution, taking account of possible
+ # cross-compiling.
+-MAKEINFO = $(top_builddir)/$(native_tools)/makeinfo/makeinfo
++MAKEINFO = makeinfo
+ INSTALL_INFO = $(top_builddir)/$(native_tools)/util/install-info
+ 
+ TXI_XLATE = txi-cs.tex txi-de.tex txi-en.tex txi-es.tex txi-fr.tex \
diff --git a/meta/recipes-extended/texinfo/texinfo_4.8.bb b/meta/recipes-extended/texinfo/texinfo_4.8.bb
new file mode 100644
index 0000000..6b36b97
--- /dev/null
+++ b/meta/recipes-extended/texinfo/texinfo_4.8.bb
@@ -0,0 +1,56 @@
+SUMMARY = "Documentation system for on-line information and printed output"
+DESCRIPTION = "Texinfo is a documentation system that can produce both \
+online information and printed output from a single source file. The \
+GNU Project uses the Texinfo file format for most of its documentation."
+HOMEPAGE = "http://www.gnu.org/software/texinfo/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PROVIDES_append_class-native = " texinfo-4.8-replacement-native"
+
+DEPENDS = "zlib ncurses texinfo-4.8-replacement-native"
+DEPENDS_class-native = "zlib-native ncurses-native"
+
+TARGET_PATCH = "file://use_host_makedoc.patch \
+           file://using-native-makeinfo.patch \
+"
+TARGET_PATCH_class-native = ""
+
+SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
+           file://check-locale-h.patch \
+           file://do-compile-native-tools.patch \
+           ${TARGET_PATCH} \
+          "
+
+SRC_URI[md5sum] = "4e9a1a591ed236003d0d4b008bf07eef"
+SRC_URI[sha256sum] = "1f3cdeebe65fdf510f55d765ab1031b54416aa5bc2635b6a54ef9bcb2367c917"
+
+S = "${WORKDIR}/${BP}"
+tex_texinfo = "texmf/tex/texinfo"
+
+inherit gettext autotools
+
+do_install_append() {
+	mkdir -p ${D}${datadir}/${tex_texinfo}
+	install -p -m644 ${S}/doc/texinfo.tex ${S}/doc/txi-??.tex ${D}${datadir}/${tex_texinfo}
+}
+
+do_install_append_class-native() {
+	install -m 755 info/makedoc ${D}${bindir}
+	install -m 755 makeinfo/makeinfo ${D}${bindir}
+}
+
+PACKAGES += "info info-doc"
+
+FILES_info = "${bindir}/info ${bindir}/infokey ${bindir}/install-info"
+FILES_info-doc = "${infodir}/info.info ${infodir}/dir ${infodir}/info-*.info \
+                  ${mandir}/man1/info.1* ${mandir}/man5/info.5* \
+                  ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
+
+FILES_${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo"
+FILES_${PN}-doc = "${infodir}/texinfo* \
+                   ${datadir}/${tex_texinfo} \
+                   ${mandir}/man1 ${mandir}/man5"
+
+BBCLASSEXTEND = "native"
-- 
1.7.10.4


