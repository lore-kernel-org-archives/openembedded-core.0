Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D951F72151
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 07:23:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAI7N5vx012004
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Nov 2014 23:23:06 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 17 Nov 2014 23:23:05 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 15:22:54 +0800
Message-ID: <6d00e71e0db5fd70243f69bbd6894a296620a41c.1416295260.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416295260.git.Chong.Lu@windriver.com>
References: <cover.1416295260.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] bison: update to 3.0.2
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
X-List-Received-Date: Tue, 18 Nov 2014 07:23:10 -0000
Content-Type: text/plain

Upgrade bison to 3.0.2.
Don't try to generate docs when cross-compiling.
Remove unneeded patches: dont-depend-on-help2man.patch and
fix_cross_manpage_building.patch

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../bison/bison-do-not-try-to-generate-docs.patch  | 37 ++++++++++++++++++++++
 .../bison/bison/dont-depend-on-help2man.patch      | 32 -------------------
 .../bison/bison/fix_cross_manpage_building.patch   | 19 -----------
 .../bison/{bison_2.7.1.bb => bison_3.0.2.bb}       | 21 ++++++------
 4 files changed, 47 insertions(+), 62 deletions(-)
 create mode 100644 meta/recipes-devtools/bison/bison/bison-do-not-try-to-generate-docs.patch
 delete mode 100644 meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
 delete mode 100644 meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
 rename meta/recipes-devtools/bison/{bison_2.7.1.bb => bison_3.0.2.bb} (70%)

diff --git a/meta/recipes-devtools/bison/bison/bison-do-not-try-to-generate-docs.patch b/meta/recipes-devtools/bison/bison/bison-do-not-try-to-generate-docs.patch
new file mode 100644
index 0000000..53a3d9b
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/bison-do-not-try-to-generate-docs.patch
@@ -0,0 +1,37 @@
+bison: don't try to generate docs
+
+We usually cannot run the just created binaries when cross-compiling,
+so in that case ignore the documentation dependencies.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ doc/local.mk |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/doc/local.mk b/doc/local.mk
+index 4fe0859..27e3cc2 100644
+--- a/doc/local.mk
++++ b/doc/local.mk
+@@ -86,7 +86,7 @@ doc/refcard.pdf: doc/refcard.tex
+ 
+ EXTRA_DIST += $(top_srcdir)/doc/bison.help
+ MAINTAINERCLEANFILES += $(top_srcdir)/doc/bison.help
+-$(top_srcdir)/doc/bison.help: src/bison$(EXEEXT)
++$(top_srcdir)/doc/bison.help:
+ 	$(AM_V_GEN)src/bison$(EXEEXT) --version >doc/bison.help.tmp
+ 	$(AM_V_at) src/bison$(EXEEXT) --help   >>doc/bison.help.tmp
+ 	$(AM_V_at)$(top_srcdir)/build-aux/move-if-change doc/bison.help.tmp $@
+@@ -106,7 +106,7 @@ remove_time_stamp = \
+   sed 's/^\(\.TH[^"]*"[^"]*"[^"]*\)"[^"]*"/\1/'
+ 
+ # Depend on configure to get version number changes.
+-$(top_srcdir)/doc/bison.1: doc/bison.help doc/bison.x $(top_srcdir)/configure
++$(top_srcdir)/doc/bison.1:
+ 	$(AM_V_GEN)$(HELP2MAN)			\
+ 	    --include=$(top_srcdir)/doc/bison.x	\
+ 	    --output=$@.t src/bison$(EXEEXT)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch b/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
deleted file mode 100644
index 21b44bf..0000000
--- a/meta/recipes-devtools/bison/bison/dont-depend-on-help2man.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Inappropriate
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd bison-2.7/doc/Makefile.am bison-2.7/doc/Makefile.am
---- bison-2.7/doc/Makefile.am	2012-12-09 17:51:03.000000000 +0200
-+++ bison-2.7/doc/Makefile.am	2013-01-02 06:49:50.804894071 +0200
-@@ -52,15 +52,11 @@
- ## Man Pages.  ##
- ## ----------- ##
-
--dist_man_MANS = $(srcdir)/bison.1
--
--EXTRA_DIST += $(dist_man_MANS:.1=.x) common.x
--MAINTAINERCLEANFILES += $(dist_man_MANS)
-+EXTRA_DIST += bison.x common.x
-
- # Depend on configure to get version number changes.
- common_dep = $(top_srcdir)/configure $(srcdir)/common.x
- srcsrcdir = $(top_srcdir)/bin
--$(srcdir)/bison.1:      $(common_dep) $(top_srcdir)/src/getargs.c
-
- # Differences to ignore when comparing the man page (the date).
- remove_time_stamp = \
-@@ -94,8 +90,6 @@
-	fi
-	$(AM_V_at)rm -f $@*.t
-
--nodist_man_MANS = yacc.1
--
- ## ------------------------------ ##
- ## Graphviz examples generation.  ##
- ## ------------------------------ ##
diff --git a/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch b/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
deleted file mode 100644
index 8b68379..0000000
--- a/meta/recipes-devtools/bison/bison/fix_cross_manpage_building.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-help2man is looking at the generated binary for help output. This does not work for cross compilations. So taking out the local PREPATH (../src) directory from path so that help2 man can find the native version of the bison in the native sysroot directory.
-
-Date: 2010/06/28
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index c7f2755..af9453a 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -80,7 +80,6 @@ PREPATH = $(top_builddir)/src
- 	  echo cd $$dir '&&' $(MAKE) $(AM_MAKEFLAGS) $$program &&	\
- 	  (cd $$dir && $(MAKE) $(AM_MAKEFLAGS) $$program) || exit;	\
- 	done
--	$(AM_V_at)PATH="$(PREPATH)$(PATH_SEPARATOR)$$PATH";		     \
- 	export PATH;							     \
- 	$(HELP2MAN)							     \
- 	    --include=$*.x						     \
diff --git a/meta/recipes-devtools/bison/bison_2.7.1.bb b/meta/recipes-devtools/bison/bison_3.0.2.bb
similarity index 70%
rename from meta/recipes-devtools/bison/bison_2.7.1.bb
rename to meta/recipes-devtools/bison/bison_3.0.2.bb
index 4a3ad15..74a0e9f 100644
--- a/meta/recipes-devtools/bison/bison_2.7.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.2.bb
@@ -9,28 +9,27 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 DEPENDS = "bison-native flex-native"
 
-BASE_SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
-	        file://m4.patch \
-                file://dont-depend-on-help2man.patch \
-	       "
+SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
+           file://m4.patch \
+           file://bison-do-not-try-to-generate-docs.patch \
+"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
 
-SRC_URI = "${BASE_SRC_URI} \
-           file://fix_cross_manpage_building.patch \
-          "
-
-SRC_URI[md5sum] = "7be02eb973eccf388f1ae750fc09eed0"
-SRC_URI[sha256sum] = "b409adcbf245baadb68d2f66accf6fdca5e282cafec1b865f4b5e963ba8ea7fb"
+SRC_URI[md5sum] = "146be9ff9fbd27497f0bf2286a5a2082"
+SRC_URI[sha256sum] = "a2c3e8528bdb50567d6fa26deeb493dc5ccd7e277b865251608a9e43ac928f3c"
 
 LDFLAGS_prepend_libc-uclibc = " -lrt "
 DEPENDS_class-native = "gettext-minimal-native"
-SRC_URI_class-native = "${BASE_SRC_URI}"
 
 inherit autotools gettext texinfo
 acpaths = "-I ${S}/m4"
 
+do_compile_prepend() {
+	for i in mfcalc calc++ rpcalc; do mkdir -p ${B}/examples/$i; done
+}
+
 do_install_append_class-native() {
 	create_wrapper ${D}/${bindir}/bison \
 		BISON_PKGDATADIR=${STAGING_DATADIR_NATIVE}/bison
-- 
1.9.1


