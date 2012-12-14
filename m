Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TjLJn-0004ex-2M
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 03:48:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBE2XW5a010996
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2012 18:33:32 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 13 Dec 2012 18:33:30 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 10:33:42 +0800
Message-ID: <d3e8c395fb8063e2ba91a4c3afa32fa6978e26e1.1355378367.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1355378367.git.Qi.Chen@windriver.com>
References: <cover.1355378367.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] ICU: upgrade to 50.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 02:48:10 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade ICU to 50.1.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../icu/files/fix-parallel-build.patch             |   19 -----
 meta/recipes-support/icu/files/gccfix.patch        |   19 -----
 .../icu/files/icu-add-pkgconfig-support.patch      |   43 ------------
 .../icu/files/larger-cmd-size.patch                |   27 -------
 meta/recipes-support/icu/files/noldlibpath.patch   |   52 --------------
 .../icu/files/use-g++-for-linking.patch            |   74 --------------------
 meta/recipes-support/icu/{icu-3.6.inc => icu.inc}  |   49 ++-----------
 meta/recipes-support/icu/icu_3.6.bb                |    6 --
 meta/recipes-support/icu/icu_50.1.bb               |   11 +++
 9 files changed, 16 insertions(+), 284 deletions(-)
 delete mode 100644 meta/recipes-support/icu/files/fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/icu/files/gccfix.patch
 delete mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
 delete mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch
 delete mode 100644 meta/recipes-support/icu/files/noldlibpath.patch
 delete mode 100644 meta/recipes-support/icu/files/use-g++-for-linking.patch
 rename meta/recipes-support/icu/{icu-3.6.inc => icu.inc} (41%)
 delete mode 100644 meta/recipes-support/icu/icu_3.6.bb
 create mode 100644 meta/recipes-support/icu/icu_50.1.bb

diff --git a/meta/recipes-support/icu/files/fix-parallel-build.patch b/meta/recipes-support/icu/files/fix-parallel-build.patch
deleted file mode 100644
index 5b01a4c..0000000
--- a/meta/recipes-support/icu/files/fix-parallel-build.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: pending
-
-Fix parallel builds
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
-
-Index: source/data/Makefile.in
-===================================================================
---- source.orig/data/Makefile.in	2011-09-02 02:03:37.000000000 +0400
-+++ source/data/Makefile.in	2011-09-02 02:06:26.000000000 +0400
-@@ -351,8 +351,8 @@
- endif
-
-
--build-dir: $(BUILD_DIRS)
--$(BUILD_DIRS):
-+$(MAINBUILDDIR) $(BUILD_DIRS): build-dir
-+build-dir:
-	-$(MKINSTALLDIRS) $(BUILD_DIRS)
diff --git a/meta/recipes-support/icu/files/gccfix.patch b/meta/recipes-support/icu/files/gccfix.patch
deleted file mode 100644
index 755341f..0000000
--- a/meta/recipes-support/icu/files/gccfix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Fixes an error which prevents compilation
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: source/layoutex/ParagraphLayout.cpp
-===================================================================
---- source.orig/layoutex/ParagraphLayout.cpp	2009-06-30 11:48:47.000000000 +0100
-+++ source/layoutex/ParagraphLayout.cpp	2009-06-30 11:49:06.000000000 +0100
-@@ -798,7 +798,7 @@
- 
-     return nullLanguageCode;
- }
--#elif
-+#else
- 
- // TODO - dummy implementation for right now...
- le_int32 ParagraphLayout::getLanguageCode(const Locale *locale)
diff --git a/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch b/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
deleted file mode 100644
index c7cd9d5..0000000
--- a/meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Inappropriate [version]
-ICU-3.6 has no pkgconfig, so I add it here. 
-But ICU has had pkgconfig support since 4.6.
-So this patch is inappropriate to upstream.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-Index: configure.in
-=============================================================
---- a/configure.in
-+++ b/configure.in
-@@ -1057,4 +1057,7 @@ echo "This may cause ICU to fail to build. Please make sure that GNU make"
- echo "is in your PATH so that this configure script can detect its location."
- fi
- 
-+AC_CONFIG_FILES([icu.pc])
-+AC_OUTPUT
-+
- $as_unset _CXX_CXXSUFFIX
-
-Index: icu.pc.in
-=============================================================
---- /dev/null
-+++ b/icu.pc.in
-@@ -0,0 +1,15 @@
-+# Process this file with autoconf to produce a pkg-config metadata file.
-+
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+unicode_version=@UNICODE_VERSION@
-+
-+Name: ICU
-+Description: International Component for Unicode libraries
-+Requires:
-+Version: @VERSION@
-+Libs: -L${libdir} -licui18n -licuuc -licudata
-+Libs.private: -L{libdir} -lpthread -lm
-+Cflags: -I${includedir} -O2 -pipe -g -feliminate-unused-debug-types
--- 
-1.7.11.2
-
diff --git a/meta/recipes-support/icu/files/larger-cmd-size.patch b/meta/recipes-support/icu/files/larger-cmd-size.patch
deleted file mode 100644
index 74a84f1..0000000
--- a/meta/recipes-support/icu/files/larger-cmd-size.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Allocate a larger memory size for cmd
-
-The length of the command line can be longer than 1024 sometimes,
-which will cause a "Segmentation fault" error.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Pending
----
- tools/pkgdata/pkgdata.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/pkgdata/pkgdata.c b/tools/pkgdata/pkgdata.c
---- a/tools/pkgdata/pkgdata.c
-+++ b/tools/pkgdata/pkgdata.c
-@@ -439,7 +439,7 @@ main(int argc, char* argv[]) {
- /* POSIX - execute makefile */
- static int executeMakefile(const UPKGOptions *o)
- {
--    char cmd[1024];
-+    char cmd[2048];
-     /*char pwd[1024];*/
-     const char *make;
-     int rc;
--- 
-1.7.10.2
-
diff --git a/meta/recipes-support/icu/files/noldlibpath.patch b/meta/recipes-support/icu/files/noldlibpath.patch
deleted file mode 100644
index 8543044..0000000
--- a/meta/recipes-support/icu/files/noldlibpath.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-Setting LD_LIBRARY_PATH is a really bad idea when cross compiling. Simplest way
-to disable this is to rename the variable as per the patch below, then its 
-harmless. This is a hack.
-
-RP 10/6/2010
-
-Upstream-Status: Inappropriate [Other]
-Hacky workaround not likely to be accepted upstream.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: source/config/Makefile.inc.in
-===================================================================
---- source.orig/config/Makefile.inc.in	2010-06-10 21:49:19.000000000 +0100
-+++ source/config/Makefile.inc.in	2010-06-10 21:49:46.000000000 +0100
-@@ -126,7 +126,7 @@
- ##################################################################
- # Environment variable to set a runtime search path
- #   (Overridden when necessary in -mh files)
--LDLIBRARYPATH_ENVVAR = LD_LIBRARY_PATH
-+LDLIBRARYPATH_ENVVAR = LD_LIBRARY_PATH2
- 
- # Versioned target for a shared library
- FINAL_SO_TARGET = $(SO_TARGET).$(SO_TARGET_VERSION)
-Index: source/icudefs.mk.in
-===================================================================
---- source.orig/icudefs.mk.in	2010-06-10 21:51:03.000000000 +0100
-+++ source/icudefs.mk.in	2010-06-10 21:51:09.000000000 +0100
-@@ -150,7 +150,7 @@
- SHLIB.cc=     $(CXX) $(CXXFLAGS) $(LDFLAGS) -shared
- 
- # Environment variable to set a runtime search path
--LDLIBRARYPATH_ENVVAR = LD_LIBRARY_PATH
-+LDLIBRARYPATH_ENVVAR = LD_LIBRARY_PATH2
- 
- # Versioned target for a shared library.
- FINAL_SO_TARGET = $(SO_TARGET).$(SO_TARGET_VERSION)
-Index: source/tools/genrb/gendtjar.pl
-===================================================================
---- source.orig/tools/genrb/gendtjar.pl	2010-06-10 21:51:36.000000000 +0100
-+++ source/tools/genrb/gendtjar.pl	2010-06-10 21:52:03.000000000 +0100
-@@ -68,8 +68,8 @@
-         $icuLibDir = abs_path($icuBinDir."/../lib");
-         $path .=":$icuBinDir:$icuLibDir";
-         
--        $libpath = $ENV{'LD_LIBRARY_PATH'}.":$icuLibDir";
--        $ENV{'LD_LIBRARY_PATH'} = $libpath;
-+        $libpath = $ENV{'LD_LIBRARY_PATH2'}.":$icuLibDir";
-+        $ENV{'LD_LIBRARY_PATH2'} = $libpath;
-         
-         #print ("#####  LD_LIBRARY_PATH = $ENV{'LD_LIBRARY_PATH'}\n");
-     
diff --git a/meta/recipes-support/icu/files/use-g++-for-linking.patch b/meta/recipes-support/icu/files/use-g++-for-linking.patch
deleted file mode 100644
index f477dad..0000000
--- a/meta/recipes-support/icu/files/use-g++-for-linking.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Use g++ for linking.
-
-Upstream-Status: Inappropriate [Other]
-Build system specific
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
----
- tools/genccode/Makefile.in |    2 +-
- tools/gencmn/Makefile.in   |    2 +-
- tools/genrb/Makefile.in    |    2 +-
- tools/pkgdata/Makefile.in  |    2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
---- source.orig/tools/genccode/Makefile.in
-+++ source/tools/genccode/Makefile.in
-@@ -76,11 +76,11 @@ check-local: all-local
- Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
- 	cd $(top_builddir) \
- 	 && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
- 
- $(TARGET) : $(OBJECTS)
--	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS)
-+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
- 
- 
- %.$(SECTION): $(srcdir)/%.$(SECTION).in
- 	cd $(top_builddir) \
- 	 && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
---- source.orig/tools/gencmn/Makefile.in
-+++ source/tools/gencmn/Makefile.in
-@@ -76,11 +76,11 @@ check-local: all-local
- Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
- 	cd $(top_builddir) \
- 	 && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
- 
- $(TARGET) : $(OBJECTS)
--	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS)
-+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
- 
- %.$(SECTION): $(srcdir)/%.$(SECTION).in
- 	cd $(top_builddir) \
- 	 && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
- 
---- source.orig/tools/genrb/Makefile.in
-+++ source/tools/genrb/Makefile.in
-@@ -84,11 +84,11 @@ Makefile: $(srcdir)/Makefile.in  $(top_b
- 
- $(TARGET) : $(OBJECTS)
- 	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS) 
- 
- $(DERB) : $(DERB_OBJ)
--	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS) 
-+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
- 
- 
- # This line is needed to serialize builds when the gmake -j option is used.
- $(TARGET_STUB_NAME).$(SECTION): $(DERB_STUB_NAME).$(SECTION)
- 
---- source.orig/tools/pkgdata/Makefile.in
-+++ source/tools/pkgdata/Makefile.in
-@@ -81,11 +81,11 @@ check-local: all-local
- Makefile: $(srcdir)/Makefile.in  $(top_builddir)/config.status
- 	cd $(top_builddir) \
- 	 && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
- 
- $(TARGET) : $(OBJECTS)
--	$(LINK.c) $(OUTOPT)$@ $^ $(LIBS) 
-+	$(LINK.cc) $(OUTOPT)$@ $^ $(LIBS)
- 
- 
- %.$(SECTION): $(srcdir)/%.$(SECTION).in
- 	cd $(top_builddir) \
- 	 && CONFIG_FILES=$(subdir)/$@ CONFIG_HEADERS= $(SHELL) ./config.status
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu.inc
similarity index 41%
rename from meta/recipes-support/icu/icu-3.6.inc
rename to meta/recipes-support/icu/icu.inc
index 8caf71c..13e77a0 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -1,21 +1,8 @@
 SUMMARY = "International Component for Unicode libraries"
 DESCRIPTION = "The International Component for Unicode (ICU) is a mature, portable set of C/C++ and Java libraries for Unicode support, software internationalization (I18N) and globalization (G11N), giving applications the same results on all platforms."
-HOMEPAGE = "http://www-01.ibm.com/software/globalization/icu/index.jsp"
-
-BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-3_6-src.tgz \
-           file://gccfix.patch \
-           file://fix-parallel-build.patch \
-           file://use-g++-for-linking.patch \
-           file://larger-cmd-size.patch \
-	   file://icu-add-pkgconfig-support.patch \
-           "
-SRC_URI = "${BASE_SRC_URI} \
-           file://noldlibpath.patch \
-           "
-SRC_URI_class-native = "${BASE_SRC_URI}"
+HOMEPAGE = "http://site.icu-project.org/"
 
 LICENSE = "ICU"
-LIC_FILES_CHKSUM = "file://../license.html;md5=5c94767cedb5d6987c902ac850ded2c6"
 DEPENDS = "icu-native"
 DEPENDS_class-native = ""
 
@@ -26,36 +13,11 @@ FULL_OPTIMIZATION_arm = "-Os"
 
 inherit autotools pkgconfig binconfig
 
-do_configure() {
-	libtoolize --force
-	gnu-configize --force
-	if [ "${PN}" != "icu-native" ]; then
-		OLD=`pwd`
-		cd ${S}
-		autoconf
-		cd ${OLD}
-	fi
-	oe_runconf
-	if [ "${PN}" != "icu-native" ]; then
-		# In the non-native case we need to make substitutions to use
-		# the native versions of the tools
-		for i in */Makefile* */*.inc */*/Makefile* */*/*.inc */*/*.inc.in ; do
-			sed -i -e 's:$(INVOKE) $(BINDIR)/:$(INVOKE) :g' $i 
-			sed -i -e 's:$(BINDIR)/::g' $i 
-		done
-	fi
-}
-
-do_compile() {
-	oe_runmake 'CXX=${CXX}'
-}
+EXTRA_OECONF = "--with-cross-build=${TMPDIR}/work/${BUILD_SYS}/${BPN}-native/${PV}-${PR}/icu/source"
+EXTRA_OECONF_class-native = ""
 
-do_install_append() {
-        chmod +x ${D}${libdir}/lib*
-	if [ "${PN}" != "icu-native" ]; then
-		install -d ${D}/${libdir}/pkgconfig
-        	install -m 0644 ${S}/icu.pc ${D}/${libdir}/pkgconfig
-	fi
+do_configure_prepend() {
+    [ -f acinclude.m4 ] || cp aclocal.m4 acinclude.m4
 }
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicule libiculx libicutu libicuio"
@@ -72,4 +34,3 @@ FILES_libicuio = "${libdir}/libicuio.so.*"
 
 BBCLASSEXTEND = "native"
 
-SSTATE_SCAN_FILES += "Makefile.inc"
diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/icu/icu_3.6.bb
deleted file mode 100644
index f50abe2..0000000
--- a/meta/recipes-support/icu/icu_3.6.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require icu-3.6.inc
-
-PR = "r10"
-
-SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
-SRC_URI[sha256sum] = "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
diff --git a/meta/recipes-support/icu/icu_50.1.bb b/meta/recipes-support/icu/icu_50.1.bb
new file mode 100644
index 0000000..8f65c6d
--- /dev/null
+++ b/meta/recipes-support/icu/icu_50.1.bb
@@ -0,0 +1,11 @@
+require icu.inc
+
+LIC_FILES_CHKSUM = "file://../license.html;md5=4ee45701e87d34303281978e3b78ecda"
+
+PR = "r1"
+
+BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/50.1/icu4c-50_1-src.tgz"
+SRC_URI = "${BASE_SRC_URI}"
+
+SRC_URI[md5sum] = "cf7bf9e56aa6c2057a8b6f464046483e"
+SRC_URI[sha256sum] = "68592b3c07d9b86100f41d0172eb1a81f3ffb2a8fef1104d7395099079ba7350"
\ No newline at end of file
-- 
1.7.9.5



