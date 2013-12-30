Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46C966B272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 02:00:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBU20MVh021056
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2013 18:00:22 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 29 Dec 2013 18:00:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Dec 2013 18:02:25 +0800
Message-ID: <e2ee4779247431dcf338b041d5da7e4fb5eb06f6.1388397582.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388397582.git.liezhi.yang@windriver.com>
References: <cover.1388397582.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] automake: upgrade to 1.14
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
X-List-Received-Date: Mon, 30 Dec 2013 02:00:22 -0000
Content-Type: text/plain

Upgrade from 1.13.4 to 1.14:
- Remove the PATHFIXPATCH variable and path_prog_fixes.patch since the
  problem can be fixed by the do_install_append().

- Remove prefer-cpio-over-pax-for-ustar-archives.patch since it have
  been fixed by the upgrade.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../automake/automake/path_prog_fixes.patch        | 41 ------------------
 .../prefer-cpio-over-pax-for-ustar-archives.patch  | 48 ----------------------
 .../{automake_1.13.4.bb => automake_1.14.bb}       | 14 ++-----
 3 files changed, 4 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/path_prog_fixes.patch
 delete mode 100644 meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
 rename meta/recipes-devtools/automake/{automake_1.13.4.bb => automake_1.14.bb} (75%)

diff --git a/meta/recipes-devtools/automake/automake/path_prog_fixes.patch b/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
deleted file mode 100644
index 9ee0672..0000000
--- a/meta/recipes-devtools/automake/automake/path_prog_fixes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
----
- Makefile.am |    3 ++-
- Makefile.in |    3 ++-
- aclocal.in  |    4 ++--
- automake.in |    6 ++++--
- 4 files changed, 10 insertions(+), 6 deletions(-)
-
-Index: automake-1.12.1/aclocal.in
-===================================================================
---- automake-1.12.1.orig/aclocal.in
-+++ automake-1.12.1/aclocal.in
-@@ -1,8 +1,8 @@
--#!@PERL@ -w
-+#!@bindir@/env perl
- # -*- perl -*-
- # @configure_input@
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @bindir@/env perl -S "$0" "$@";; esac'
-     if 0;
- 
- # aclocal - create aclocal.m4 by scanning configure.ac
-Index: automake-1.12.1/automake.in
-===================================================================
---- automake-1.12.1.orig/automake.in
-+++ automake-1.12.1/automake.in
-@@ -1,8 +1,10 @@
--#!@PERL@ -w
-+#!@bindir@/env perl
- # -*- perl -*-
- # @configure_input@
- 
--eval 'case $# in 0) exec @PERL@ -S "$0";; *) exec @PERL@ -S "$0" "$@";; esac'
-+use warnings;
-+
-+eval 'case $# in 0) exec @bindir@/env perl -S "$0";; *) exec @bindir@/env perl -S "$0" "$@";; esac'
-     if 0;
- 
- # automake - create Makefile.in from Makefile.am
diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
deleted file mode 100644
index 6ffff83..0000000
--- a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-When the user has a UID or GID that is larger than the ustar format
-supports, pax does not error out gracefully in some cases (FC13).  In
-this case cpio does.
-
-See for more details: http://debbugs.gnu.org/cgi/bugreport.cgi?bug=8343
-
-Additionally drop tar.m4 out of that part of the Makefile or we end up in
-a fatal attempt to regen loop:
-
-CDPATH="${ZSH_VERSION+.}:" && cd . && perllibdir="automake-1.11.1/lib:./lib" "automake-1.11.1/aclocal" --acdir=m4 -I m4
-/bin/sh: automake-1.11.1/aclocal: No such file or directory
-make: *** [aclocal.m4] Error 127
-
-Upstream-Status: Pending
-
-Signed-off-by: Tom Rini <tom_rini@mentor.com>
-
-Updated for version 1.11.3:
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/03/14
-
-Updated for version 1.13.2:
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-
-diff -Nurd automake-1.13.2/Makefile.in automake-1.13.2/Makefile.in
---- automake-1.13.2/Makefile.in	2013-05-15 23:12:58.000000000 +0300
-+++ automake-1.13.2/Makefile.in	2013-05-23 02:13:41.364026301 +0300
-@@ -141,7 +141,7 @@
- 	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
- 	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/silent.m4 \
- 	$(top_srcdir)/m4/strip.m4 $(top_srcdir)/m4/substnot.m4 \
--	$(top_srcdir)/m4/tar.m4 $(top_srcdir)/configure.ac
-+	$(top_srcdir)/configure.ac
- am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
- 	$(ACLOCAL_M4)
- am__CONFIG_DISTCLEAN_FILES = config.status config.cache config.log \
-diff -Nurd automake-1.13.2/m4/tar.m4 automake-1.13.2/m4/tar.m4
---- automake-1.13.2/m4/tar.m4	2013-05-13 23:12:48.000000000 +0300
-+++ automake-1.13.2/m4/tar.m4	2013-05-23 02:13:26.600025805 +0300
-@@ -26,7 +26,7 @@
- AC_SUBST([AMTAR], ['$${TAR-tar}'])
-
- # We'll loop over all known methods to create a tar archive until one works.
--_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
-+_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
-
- m4_if([$1], [v7],
-   [am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'],
\ No newline at end of file
diff --git a/meta/recipes-devtools/automake/automake_1.13.4.bb b/meta/recipes-devtools/automake/automake_1.14.bb
similarity index 75%
rename from meta/recipes-devtools/automake/automake_1.13.4.bb
rename to meta/recipes-devtools/automake/automake_1.14.bb
index b114d99..ac83de1 100644
--- a/meta/recipes-devtools/automake/automake_1.13.4.bb
+++ b/meta/recipes-devtools/automake/automake_1.14.bb
@@ -1,6 +1,6 @@
 require automake.inc
 LICENSE="GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" 
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS_class-native = "autoconf-native"
 
 NAMEVER = "${@oe.utils.trim_version("${PV}", 2)}"
@@ -18,18 +18,12 @@ RDEPENDS_${PN} += "\
 
 RDEPENDS_${PN}_class-native = "autoconf-native perl-native-runtime"
 
-PATHFIXPATCH = "file://path_prog_fixes.patch"
-PATHFIXPATCH_class-native = ""
-PATHFIXPATCH_class-nativesdk = ""
-
-SRC_URI += "${PATHFIXPATCH} \
-	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
-	    file://python-libdir.patch \
+SRC_URI += " file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch \
             file://buildtest.patch"
 
-SRC_URI[md5sum] = "9199e266993a5bbdc914923349d51e3e"
-SRC_URI[sha256sum] = "4c93abc0bff54b296f41f92dd3aa1e73e554265a6f719df465574983ef6f878c"
+SRC_URI[md5sum] = "a3c0d9298c6112f5f2c26c639ccaaed7"
+SRC_URI[sha256sum] = "7847424d4204d1627c129e9c15b81e145836afa2a1bf9003ffe10aa26ea75755"
 
 do_install_append () {
     install -d ${D}${datadir}
-- 
1.8.3.1


