Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id 93F016012C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 08:11:06 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 65fd_10c9_63fd3bb9_8cf1_4c58_b378_175d1b21ad3f;
	Mon, 07 Dec 2015 17:11:01 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 06AEFAC0106
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 17:11:01 +0900 (JST)
Received: from G01JPEXCHYT17.g01.fujitsu.local
	(G01JPEXCHYT17.g01.fujitsu.local [10.128.194.56])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	4246D6D673F for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 17:11:00 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT17.g01.fujitsu.local (10.128.194.56) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 7 Dec 2015 17:10:58 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Dec 2015 17:12:00 +0900
Message-ID: <1449475920-27579-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH] libpcre: upgrade to 8.38
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
X-List-Received-Date: Mon, 07 Dec 2015 08:11:09 -0000
Content-Type: text/plain

This is the latest release in the 8.xx series.
It fixes 46 bugs as listed:
http://vcs.pcre.org/pcre/code/trunk/ChangeLog?view=markup

Vulnerabilities from CVE-2015-8380 to CVE-2015-8395 have been fixed in 8.38.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-support/libpcre/libpcre_8.37.bb | 78 ----------------------------
 1 file changed, 78 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre_8.37.bb

diff --git a/meta/recipes-support/libpcre/libpcre_8.37.bb b/meta/recipes-support/libpcre/libpcre_8.37.bb
deleted file mode 100644
index 1880639..0000000
--- a/meta/recipes-support/libpcre/libpcre_8.37.bb
+++ /dev/null
@@ -1,78 +0,0 @@
-DESCRIPTION = "The PCRE library is a set of functions that implement regular \
-expression pattern matching using the same syntax and semantics as Perl 5. PCRE \
-has its own native API, as well as a set of wrapper functions that correspond \
-to the POSIX regular expression API."
-SUMMARY = "Perl Compatible Regular Expressions"
-HOMEPAGE = "http://www.pcre.org"
-SECTION = "devel"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=7e4937814aee14758c1c95b59c80c44d"
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
-           file://pcre-cross.patch \
-           file://fix-pcre-name-collision.patch \
-           file://run-ptest \
-           file://Makefile \
-"
-
-SRC_URI[md5sum] = "ed91be292cb01d21bc7e526816c26981"
-SRC_URI[sha256sum] = "51679ea8006ce31379fb0860e46dd86665d864b5020fc9cd19e71260eef4789d"
-
-S = "${WORKDIR}/pcre-${PV}"
-
-PROVIDES += "pcre"
-DEPENDS += "bzip2 zlib"
-
-PACKAGECONFIG ??= "pcre8"
-
-PACKAGECONFIG[pcre8] = "--enable-pcre8,--disable-pcre8"
-PACKAGECONFIG[pcre16] = "--enable-pcre16,--disable-pcre16"
-PACKAGECONFIG[pcre32] = "--enable-pcre32,--disable-pcre32"
-PACKAGECONFIG[pcretest-readline] = "--enable-pcretest-libreadline,--disable-pcretest-libreadline,readline,"
-
-BINCONFIG = "${bindir}/pcre-config"
-
-inherit autotools binconfig-disabled ptest
-
-EXTRA_OECONF = "\
-    --enable-newline-is-lf \
-    --enable-rebuild-chartables \
-    --enable-utf8 \
-    --with-link-size=2 \
-    --with-match-limit=10000000 \
-"
-
-# Set LINK_SIZE in BUILD_CFLAGS given that the autotools bbclass use it to
-# set CFLAGS_FOR_BUILD, required for the libpcre build.
-BUILD_CFLAGS =+ "-DLINK_SIZE=2 -I${B}"
-CFLAGS += "-D_REENTRANT"
-CXXFLAGS_append_powerpc = " -lstdc++"
-
-PACKAGES =+ "libpcrecpp libpcreposix pcregrep pcregrep-doc pcretest pcretest-doc"
-
-SUMMARY_libpcrecpp = "${SUMMARY} - C++ wrapper functions"
-SUMMARY_libpcreposix = "${SUMMARY} - C wrapper functions based on the POSIX regex API"
-SUMMARY_pcregrep = "grep utility that uses perl 5 compatible regexes"
-SUMMARY_pcregrep-doc = "grep utility that uses perl 5 compatible regexes - docs"
-SUMMARY_pcretest = "program for testing Perl-comatible regular expressions"
-SUMMARY_pcretest-doc = "program for testing Perl-comatible regular expressions - docs"
-
-FILES_libpcrecpp = "${libdir}/libpcrecpp.so.*"
-FILES_libpcreposix = "${libdir}/libpcreposix.so.*"
-FILES_pcregrep = "${bindir}/pcregrep"
-FILES_pcregrep-doc = "${mandir}/man1/pcregrep.1"
-FILES_pcretest = "${bindir}/pcretest"
-FILES_pcretest-doc = "${mandir}/man1/pcretest.1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_install_ptest() {
-	t=${D}${PTEST_PATH}
-	cp ${WORKDIR}/Makefile $t
-	cp -r ${S}/testdata $t
-	for i in pcre_stringpiece_unittest pcregrep pcretest; \
-	  do cp ${B}/.libs/$i $t; \
-	done
-	for i in RunTest RunGrepTest test-driver; \
-	  do cp ${S}/$i $t; \
-	done
-}
-- 
1.8.4.2


