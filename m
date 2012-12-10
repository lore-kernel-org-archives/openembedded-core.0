Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1Ti4wD-0007jt-MV
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 16:06:36 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1168347wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5RJ4s+9J9wRP9N5sG9KHGwlqveVXxdfENMm52p7os+0=;
	b=XAqm1k4kLQbv80OtIiRZayphTvrSB/rWqjYJcnXCcGEcBvL607xJWWQtxkZhjS8Jip
	ftoUwKlgxED69ywQW3pJC7wqyEHmnVdAJ7Hba5/+YUchGpYd1MAdrV9tkRYGs7znnjBS
	GcBgBIZUEl//QcjJ9nDQNksgli+B9as3fczhgIvCQu42xgvRA5zokM+VBAFesjA9Vyfj
	q5d9TswUio4w0kHOboI1JqZITek/TqbuXy3lKEEevuB8XhYDjeut/tEmS4mF6EiIsqTj
	kkM7e0+zHKJ0Iy5zSkBx4l5RuLXquefTX/Q25ptMHor92AYu/+LZIpYtHwjlkXTEfyuM
	PWbQ==
Received: by 10.216.90.144 with SMTP id e16mr5528806wef.48.1355151122754;
	Mon, 10 Dec 2012 06:52:02 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id u6sm11843592wif.2.2012.12.10.06.51.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 06:52:01 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 19:51:21 +0500
Message-Id: <1355151081-4889-2-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1355151081-4889-1-git-send-email-fahad_usman@mentor.com>
References: <fahad_usman@mentor.com>
	<1355151081-4889-1-git-send-email-fahad_usman@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [PATCH 2/2] libpcre: Improve the recipe
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
X-List-Received-Date: Mon, 10 Dec 2012 15:06:36 -0000

- Improve the cross patch to determine *_FOR_BUILD in configure

- Leverage the fact that autotools.bbclass handles *_FOR_BUILD now

- Drop the now unnecessary do_compile override

- Drop the do_split_packages

- Split out packages for pcregrep, pcretest, in addition to libpcrecpp and
libpcreposix

- add nativesdk to BBCLASSEXTEND as well as native

Signed-off-by: Christopher Larson <chris_larson@mentor.com>

- the patch was imported from meta-mentor layer on yoctoproject git server
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit id
62f819b97e356c1d7468fbccbf3a3ceed78b09a8

- broken up the original patch in two parts, this part contains some
improvements to the recipe and the cross patch

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 .../recipes-support/libpcre/files/pcre-cross.patch |   53 +++++++++++-----
 meta/recipes-support/libpcre/libpcre_8.32.bb       |   65 +++++++++++---------
 2 files changed, 72 insertions(+), 46 deletions(-)

diff --git a/meta/recipes-support/libpcre/files/pcre-cross.patch b/meta/recipes-support/libpcre/files/pcre-cross.patch
index 2ae05a1..83880f7 100644
--- a/meta/recipes-support/libpcre/files/pcre-cross.patch
+++ b/meta/recipes-support/libpcre/files/pcre-cross.patch
@@ -1,23 +1,19 @@
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Pending
 
-To be upstreamable, this patch requires check for *_FOR_BUILD, otherwise
-it needs to pass special variables.
-
-It would be nice to implement per-target compiler specification to
-automake, as it is done for linker.
-
-Even better it would be nice to implement native build time targets in
-automake.
-
-Index: pcre-7.6/Makefile.am
-===================================================================
---- pcre-7.6.orig/Makefile.am	2008-01-23 17:58:28.000000000 +0000
-+++ pcre-7.6/Makefile.am	2008-04-03 22:32:00.000000000 +0000
-@@ -147,6 +147,11 @@
+--- pcre-8.32.orig/Makefile.am
++++ pcre-8.32/Makefile.am
+@@ -197,8 +197,18 @@ bin_SCRIPTS = pcre-config
+ 
++CC_FOR_BUILD = @CC_FOR_BUILD@
++CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CCLD_FOR_BUILD = @CCLD_FOR_BUILD@
++LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@
++
+ if WITH_REBUILD_CHARTABLES
  
  noinst_PROGRAMS += dftables
  dftables_SOURCES = dftables.c
-+dftables_LINK = $(LINK_FOR_BUILD) -o $@
++dftables_LINK = $(CCLD_FOR_BUILD) -o $@
 +dftables_LDFLAGS = $(LDFLAGS_FOR_BUILD)
 +
 +dftables.o: $(srcdir)/dftables.c
@@ -25,3 +21,28 @@ Index: pcre-7.6/Makefile.am
  
  pcre_chartables.c: dftables$(EXEEXT)
  	./dftables$(EXEEXT) $@
+--- pcre-8.32.orig/configure.ac
++++ pcre-8.32/configure.ac
+@@ -72,6 +72,22 @@ then
+   fi
+ fi
+ 
++if test x"$cross_compiling" = xyes; then
++    CC_FOR_BUILD="${CC_FOR_BUILD-gcc}"
++    CCLD_FOR_BUILD="${CCLD_FOR_BUILD-gcc}"
++    CFLAGS_FOR_BUILD="${CFLAGS_FOR_BUILD}"
++    LDFLAGS_FOR_BUILD="${LDFLAGS_FOR_BUILD}"
++else
++    CC_FOR_BUILD="${CC_FOR_BUILD-\$(CC)}"
++    CCLD_FOR_BUILD="${CCLD_FOR_BUILD-\$(CCLD)}"
++    CFLAGS_FOR_BUILD="${CFLAGS_FOR_BUILD-\$(CFLAGS)}"
++    LDFLAGS_FOR_BUILD="${LDFLAGS_FOR_BUILD-\$(LDFLAGS)}"
++fi
++AC_ARG_VAR(CC_FOR_BUILD, [build system C compiler])
++AC_ARG_VAR(CCLD_FOR_BUILD, [build system C linker frontend])
++AC_ARG_VAR(CFLAGS_FOR_BUILD, [build system C compiler arguments])
++AC_ARG_VAR(LDFLAGS_FOR_BUILD, [build system C linker frontend arguments])
++
+ # AC_PROG_CXX will return "g++" even if no c++ compiler is installed.
+ # Check for that case, and just disable c++ code if g++ doesn't run.
+ AC_LANG_PUSH(C++)
diff --git a/meta/recipes-support/libpcre/libpcre_8.32.bb b/meta/recipes-support/libpcre/libpcre_8.32.bb
index b6847e8..e434d55 100644
--- a/meta/recipes-support/libpcre/libpcre_8.32.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.32.bb
@@ -5,7 +5,7 @@ to the POSIX regular expression API."
 SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
-PR = "r0"
+PR = "r1"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=115e2bee152e2e23e838a29136094877"
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
@@ -17,37 +17,42 @@ SRC_URI[sha256sum] = "a913fb9bd058ef380a2d91847c3c23fcf98e92dc3b47cd08a53c021c5c
 
 S = "${WORKDIR}/pcre-${PV}"
 
-PROVIDES = "pcre"
-DEPENDS = "bzip2 zlib readline"
+FILESPATH .= ":${@base_set_filespath([bb.which(BBPATH, 'recipes-support/libpcre/files', direction=True)], d)}"
+
+PROVIDES += "pcre"
+DEPENDS += "bzip2 zlib readline"
 
 inherit autotools binconfig
 
 PARALLEL_MAKE = ""
 
-CFLAGS_append = " -D_REENTRANT"
-CXXFLAGS_powerpc += "-lstdc++"
-EXTRA_OECONF = " --with-link-size=2 --enable-newline-is-lf --with-match-limit=10000000 --enable-rebuild-chartables --enable-utf8"
-
-do_compile () {
-	# stop libtool from trying to link with host libraries - fix from #33
-	# this resolve build problem on amd64 - #1015
-	if [ -e ${S}/${HOST_SYS}-libtool ] ; then
-		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
-	else
-		ln -sf ${S}/libtool ${S}/${HOST_SYS}-libtool
-		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${HOST_SYS}-libtool
-	fi
-
-	# The generation of dftables can lead to timestamp problems with ccache
-	# because the generated config.h seems newer.  It is sufficient to ensure that the
-	# attempt to build dftables inside make will actually work (foo_FOR_BUILD is
-	# only used for this).
-	oe_runmake CC_FOR_BUILD="${BUILD_CC}" CFLAGS_FOR_BUILD="-DLINK_SIZE=2 -I${S}/include" LINK_FOR_BUILD="${BUILD_CC} -L${S}/lib"
-}
-
-python populate_packages_prepend () {
-    pcre_libdir = d.expand('${libdir}')
-    do_split_packages(d, pcre_libdir, '^lib(.*)\.so\.+', 'lib%s', 'libpcre %s library', extra_depends='', allow_links=True, prepend=True)
-}
-
-BBCLASSEXTEND = "native"
+EXTRA_OECONF = "\
+    --enable-newline-is-lf \
+    --enable-rebuild-chartables \
+    --enable-utf8 \
+    --with-link-size=2 \
+    --with-match-limit=10000000 \
+"
+
+BUILD_CPPFLAGS += "-DLINK_SIZE=2"
+BUILD_CFLAGS =+ "-I${S}/include"
+CFLAGS += "-D_REENTRANT"
+CXXFLAGS_append_powerpc = " -lstdc++"
+
+PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
+
+SUMMARY_libpcrecpp = "${SUMMARY} - C++ wrapper functions"
+SUMMARY_libpcreposix = "${SUMMARY} - C wrapper functions based on the POSIX regex API"
+SUMMARY_pcregrep = "grep utility that uses perl 5 compatible regexes"
+SUMMARY_pcregrep-doc = "grep utility that uses perl 5 compatible regexes - docs"
+SUMMARY_pcretest = "program for testing Perl-comatible regular expressions"
+SUMMARY_pcretest-doc = "program for testing Perl-comatible regular expressions - docs"
+
+FILES_libpcrecpp = "${libdir}/libpcrecpp.so.*"
+FILES_libpcreposix = "${libdir}/libpcreposix.so.*"
+FILES_pcregrep = "${bindir}/pcregrep"
+FILES_pcregrep-doc = "${mandir}/man1/pcregrep.1"
+FILES_pcretest = "${bindir}/pcretest"
+FILES_pcretest-doc = "${mandir}/man1/pcretest.1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5



