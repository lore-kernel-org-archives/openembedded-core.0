Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63533748D2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 05:43:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T5h7Id023086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 22:43:07 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 22:43:06 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:01:23 +0800
Message-ID: <70410729fba11765f6d412dac4605e6fc788d501.1538197206.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538197206.git.kai.kang@windriver.com>
References: <cover.1538197206.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/10] gobject-introspection: fix multilib install file conflicts
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
X-List-Received-Date: Sat, 29 Sep 2018 05:43:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix multilib isntall file conflicts for gobject-introspection.
* use multilib_script.bbclass to handle ${bindir}/g-ir-annotation-tool
  and ${bindir}/g-ir-scanner
* add configure option to install .gir files to an alternative path

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...nfigure.ac-make-GIR_DIR-configurable.patch | 65 +++++++++++++++++++
 .../gobject-introspection_1.58.0.bb           | 10 ++-
 2 files changed, 72 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
new file mode 100644
index 0000000000..07fb20ed29
--- /dev/null
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
@@ -0,0 +1,65 @@
+configure.ac: make GIR_DIR configurable
+
+.gir files are arch related which contain such as lengths of pointers
+that they are different for 64 and 32 bits target. It causes install
+file conflicts for multilib when intall gobject-introspection and
+lib32-gobject-introspection both.
+
+Add configure option 'with-gir-dir-prefix' to make .gir could be
+installed to a configured path such as ${libdir}. And update girdir in
+.pc files as well.
+
+Upstream-Status: Submitted [https://github.com/GNOME/gobject-introspection/pull/17]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ configure.ac                              | 5 ++++-
+ gobject-introspection-1.0.pc.in           | 2 +-
+ gobject-introspection-no-export-1.0.pc.in | 2 +-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b4294c57..dc78b832 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -114,7 +114,10 @@ GIR_SUFFIX="gir-1.0"
+ AC_SUBST(GIR_SUFFIX)
+ AC_DEFINE_UNQUOTED(GIR_SUFFIX, "$GIR_SUFFIX", [Name of the gir directory])
+ 
+-GIR_DIR="$EXPANDED_DATADIR/$GIR_SUFFIX"
++AC_ARG_WITH(gir-dir-prefix,
++		AS_HELP_STRING([--with-gir-dir-prefix], [Director prefix for gir installation]),
++		[GIR_DIR_PREFIX="$withval"], [GIR_DIR_PREFIX="$EXPANDED_DATADIR"])
++GIR_DIR="$GIR_DIR_PREFIX/$GIR_SUFFIX"
+ AC_SUBST(GIR_DIR)
+ AC_DEFINE_UNQUOTED(GIR_DIR, "$GIR_DIR", [Director prefix for gir installation])
+ 
+diff --git a/gobject-introspection-1.0.pc.in b/gobject-introspection-1.0.pc.in
+index a08b5d27..3409856c 100644
+--- a/gobject-introspection-1.0.pc.in
++++ b/gobject-introspection-1.0.pc.in
+@@ -10,7 +10,7 @@ g_ir_scanner=${bindir}/g-ir-scanner
+ g_ir_compiler=${bindir}/g-ir-compiler@EXEEXT@
+ g_ir_generate=${bindir}/g-ir-generate@EXEEXT@
+ gidatadir=${datadir}/gobject-introspection-1.0
+-girdir=${datadir}/gir-1.0
++girdir=@GIR_DIR@
+ typelibdir=${libdir}/girepository-1.0
+ 
+ Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
+diff --git a/gobject-introspection-no-export-1.0.pc.in b/gobject-introspection-no-export-1.0.pc.in
+index d214d22d..745aaade 100644
+--- a/gobject-introspection-no-export-1.0.pc.in
++++ b/gobject-introspection-no-export-1.0.pc.in
+@@ -9,7 +9,7 @@ includedir=@includedir@
+ g_ir_scanner=${bindir}/g-ir-scanner
+ g_ir_compiler=${bindir}/g-ir-compiler@EXEEXT@
+ g_ir_generate=${bindir}/g-ir-generate@EXEEXT@
+-girdir=${datadir}/gir-1.0
++girdir=@GIR_DIR@
+ typelibdir=${libdir}/girepository-1.0
+ 
+ Cflags: -I${includedir}/gobject-introspection-1.0 @FFI_PC_CFLAGS@
+-- 
+2.19.0.rc2
+
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
index de898a788b..67817049a5 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch \
            file://0001-giscanner-add-a-lib-dirs-envvar-option.patch \
            file://0001-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch \
+           file://0001-configure.ac-make-GIR_DIR-configurable.patch \
            "
 
 SRC_URI[md5sum] = "94fec875276262037bfcd51226db12fe"
@@ -24,7 +25,9 @@ SRC_URI[sha256sum] = "27c1590a32749de0a5481ce897772547043e94bccba4bc0a7edb3d8513
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even
+inherit autotools pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${bindir}/g-ir-annotation-tool ${PN}:${bindir}/g-ir-scanner"
 
 DEPENDS_append = " libffi zlib glib-2.0 python3 flex-native bison-native autoconf-archive"
 
@@ -51,6 +54,7 @@ EXTRA_OECONF_class-target = " \
     --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
 "
+EXTRA_OECONF_append = " --with-gir-dir-prefix=${libdir}"
 
 # Need to ensure ld.so.conf exists so prelink-native works
 # both before we build and if we install from sstate
@@ -94,7 +98,7 @@ EOF
 # This prevents g-ir-scanner from writing cache data to $HOME
 export GI_SCANNER_DISABLE_CACHE=1
 
-g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 "\$@"
+g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_LIBDIR}/gir-1.0 "\$@"
 EOF
         chmod +x ${B}/g-ir-scanner-wrapper
 
@@ -178,7 +182,7 @@ FILES_${PN}_append = " ${libdir}/girepository-*/*.typelib"
 
 # .gir files go to dev package, as they're needed for developing (but not for running)
 # things that depends on introspection.
-FILES_${PN}-dev_append = " ${datadir}/gir-*/*.gir"
+FILES_${PN}-dev_append = " ${libdir}/gir-*/*.gir"
 FILES_${PN}-dev_append = " ${datadir}/gir-*/*.rnc"
 
 # These are used by gobject-based packages
-- 
2.18.0


