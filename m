Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD1E2772BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:42:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1A3g7Rf026607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 9 Feb 2017 19:42:07 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:42:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:42:02 -0800
Message-ID: <c56868473619fb4a7179db4f75fe9feb622e990e.1486697927.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486697927.git.liezhi.yang@windriver.com>
References: <cover.1486697927.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpcre2: add it for newer vte
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
X-List-Received-Date: Fri, 10 Feb 2017 03:42:09 -0000
Content-Type: text/plain

There are two major versions of the PCRE library. The newest version, PCRE2,
was released in 2015 and is at version 10.22.

The original, very widely deployed PCRE library, originally released in 1997,
is at version 8.40, and the API and feature set are stable, future releases
will be for bugfixes only. All new future features will be to PCRE2, not the
original PCRE 8.x series.

The newer vte depends on libpcre2, so add it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libpcre/libpcre2/pcre-cross.patch              | 65 ++++++++++++++++++++++
 meta/recipes-support/libpcre/libpcre2_10.22.bb     | 56 +++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2_10.22.bb

diff --git a/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch b/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
new file mode 100644
index 0000000..9516caf
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
@@ -0,0 +1,65 @@
+Fix for cross compiling
+
+Fixed:
+| ./dftables src/pcre2_chartables.c
+| make: ./dftables: Command not found
+| make: *** [src/pcre2_chartables.c] Error 127
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 38f1d41..2bde083 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -298,9 +298,21 @@ bin_SCRIPTS = pcre2-config
+ ## to copy a distributed set of tables that are defined for ASCII code. In this
+ ## case, dftables is not needed.
+ 
++CC_FOR_BUILD = @CC_FOR_BUILD@
++CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
++CCLD_FOR_BUILD = @CCLD_FOR_BUILD@
++LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@
++
+ if WITH_REBUILD_CHARTABLES
+ noinst_PROGRAMS += dftables
+ dftables_SOURCES = src/dftables.c
++
++dftables_LINK = $(CCLD_FOR_BUILD) -o $@
++dftables_LDFLAGS = $(LDFLAGS_FOR_BUILD)
++
++src/dftables.o: $(srcdir)/src/dftables.c
++	$(CC_FOR_BUILD) -c $(CFLAGS_FOR_BUILD) -o $@ $(srcdir)/src/dftables.c
++
+ src/pcre2_chartables.c: dftables$(EXEEXT)
+ 	rm -f $@
+ 	./dftables$(EXEEXT) $@
+diff --git a/configure.ac b/configure.ac
+index d7c57aa..d6eb0aa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -59,6 +59,23 @@ then
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
++
+ # Check for a 64-bit integer type
+ AC_TYPE_INT64_T
+ 
diff --git a/meta/recipes-support/libpcre/libpcre2_10.22.bb b/meta/recipes-support/libpcre/libpcre2_10.22.bb
new file mode 100644
index 0000000..1e00ed5
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2_10.22.bb
@@ -0,0 +1,56 @@
+DESCRIPTION = "There are two major versions of the PCRE library. The \
+newest version is PCRE2, which is a re-working of the original PCRE \
+library to provide an entirely new API. The original, very widely \
+deployed PCRE library's API and feature are stable, future releases \
+ will be for bugfixes only. All new future features will be to PCRE2, \
+not the original PCRE 8.x series."
+SUMMARY = "Perl Compatible Regular Expressions version 2"
+HOMEPAGE = "http://www.pcre.org"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=ab9633efd38d6f799398df2c248b5aec"
+
+SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
+           file://pcre-cross.patch \
+"
+
+SRC_URI[md5sum] = "c0c02517938ee2b0d350d53edf450664"
+SRC_URI[sha256sum] = "b2b44619f4ac6c50ad74c2865fd56807571392496fae1c9ad7a70993d018f416"
+
+S = "${WORKDIR}/pcre2-${PV}"
+
+PROVIDES += "pcre2"
+DEPENDS += "bzip2 zlib"
+
+BINCONFIG = "${bindir}/pcre2-config"
+
+inherit autotools binconfig-disabled
+
+EXTRA_OECONF = "\
+    --enable-newline-is-lf \
+    --enable-rebuild-chartables \
+    --with-link-size=2 \
+    --with-match-limit=10000000 \
+"
+
+# Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to
+# set CFLAGS_FOR_BUILD, required for the libpcre build.
+BUILD_CFLAGS =+ "-DLINK_SIZE=2 -I${B}/src"
+CFLAGS += "-D_REENTRANT"
+CXXFLAGS_append_powerpc = " -lstdc++"
+
+export CCLD_FOR_BUILD ="${BUILD_CCLD}"
+
+PACKAGES =+ "pcre2grep pcre2grep-doc pcre2test pcre2test-doc"
+
+SUMMARY_pcre2grep = "grep utility that uses perl 5 compatible regexes"
+SUMMARY_pcre2grep-doc = "grep utility that uses perl 5 compatible regexes - docs"
+SUMMARY_pcre2test = "program for testing Perl-comatible regular expressions"
+SUMMARY_pcre2test-doc = "program for testing Perl-comatible regular expressions - docs"
+
+FILES_pcre2grep = "${bindir}/pcre2grep"
+FILES_pcre2grep-doc = "${mandir}/man1/pcre2grep.1"
+FILES_pcre2test = "${bindir}/pcre2test"
+FILES_pcre2test-doc = "${mandir}/man1/pcre2test.1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.9.0


