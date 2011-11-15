Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQC1-0001Vi-EJ
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:23 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410727"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:44 -0800
Message-Id: <8b2381afdc134a1bff6087f11166273c9f184f64.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/16] boost: Update to 1.47.0 & Cleanup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Nov 2011 21:05:23 -0000

Removed boost-jam-native since it was an older version
no incompatible with boost 1.47.
Modified boost to use BBCLASSEXTEND native for the bjam
native binary.
Removed older unused patches.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/boost/boost-jam-native.inc    |   32 ---
 .../boost/boost-jam-native_3.1.18.bb               |    8 -
 .../boost/{boost-36.inc => boost.inc}              |   42 +++-
 .../boost/{boost_1.44.0.bb => boost_1.47.0.bb}     |   13 +-
 .../recipes-support/boost/files/1.34.1-gcc43.patch |  226 -----------------
 .../boost/files/atomic_count_gcc_atomicity.patch   |   15 --
 meta/recipes-support/boost/files/gcc41.patch       |   16 --
 meta/recipes-support/boost/files/gcc43.patch       |  258 --------------------
 .../recipes-support/boost/files/linux-uclibc.patch |   12 -
 .../boost/files/unit_test_log10f.patch             |   22 --
 10 files changed, 43 insertions(+), 601 deletions(-)
 delete mode 100644 meta/recipes-support/boost/boost-jam-native.inc
 delete mode 100644 meta/recipes-support/boost/boost-jam-native_3.1.18.bb
 rename meta/recipes-support/boost/{boost-36.inc => boost.inc} (88%)
 rename meta/recipes-support/boost/{boost_1.44.0.bb => boost_1.47.0.bb} (66%)
 delete mode 100644 meta/recipes-support/boost/files/1.34.1-gcc43.patch
 delete mode 100644 meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
 delete mode 100644 meta/recipes-support/boost/files/gcc41.patch
 delete mode 100644 meta/recipes-support/boost/files/gcc43.patch
 delete mode 100644 meta/recipes-support/boost/files/linux-uclibc.patch
 delete mode 100644 meta/recipes-support/boost/files/unit_test_log10f.patch

diff --git a/meta/recipes-support/boost/boost-jam-native.inc b/meta/recipes-support/boost/boost-jam-native.inc
deleted file mode 100644
index c5a9d99..0000000
--- a/meta/recipes-support/boost/boost-jam-native.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-# The Boost web site provides free peer-reviewed portable
-# C++ source libraries. The emphasis is on libraries which
-# work well with the C++ Standard Library. The libraries are
-# intended to be widely useful, and are in regular use by
-# thousands of programmers across a broad spectrum of applications.
-DESCRIPTION = "Make system for boost (native)"
-HOMEPAGE = "http://www.boost.org/"
-SECTION = "devel"
-LICENSE = "Boost"
-INC_PR = "r1"
-
-LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/boost/boost-jam-${PV}.tgz"
-S = "${WORKDIR}/boost-jam-${PV}"
-
-inherit native
-
-do_compile() {
-	set -ex
-	rm -rf bin.*
-	./build.sh gcc
-}
-
-# This is too terrible - the build script doesn't give any good
-# way I can see to find out where the binaries are placed, so
-# rely on only one bin.foo directory being created.
-do_install () {
-	set -ex
-	install -d ${D}${bindir}/
-	install -c -m 755 bin.*/bjam ${D}${bindir}/
-}
diff --git a/meta/recipes-support/boost/boost-jam-native_3.1.18.bb b/meta/recipes-support/boost/boost-jam-native_3.1.18.bb
deleted file mode 100644
index 7a0b1a8..0000000
--- a/meta/recipes-support/boost/boost-jam-native_3.1.18.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-include boost-jam-native.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/boost/boost-jam-${PV}.tgz"
-
-SRC_URI[md5sum] = "f790e022d658db38db5cc4aeeccad3f1"
-SRC_URI[sha256sum] = "85dbb72c29837ba89cb5408782c82459b34fdecaedea8b54ce1cb3cb9990121a"
diff --git a/meta/recipes-support/boost/boost-36.inc b/meta/recipes-support/boost/boost.inc
similarity index 88%
rename from meta/recipes-support/boost/boost-36.inc
rename to meta/recipes-support/boost/boost.inc
index 8b0622f..ddb65b7 100644
--- a/meta/recipes-support/boost/boost-36.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -6,15 +6,22 @@
 DESCRIPTION = "Free peer-reviewed portable C++ source libraries"
 HOMEPAGE = "http://www.boost.org/"
 SECTION = "libs"
-DEPENDS = "boost-jam-native zlib"
+DEPENDS = "boost-native zlib"
+DEPENDS_virtclass-native = ""
 LICENSE = "Boost"
-PR = "r4"
 
 ARM_INSTRUCTION_SET = "arm"
+
 BOOST_VER = "${@"_".join(d.getVar("PV",1).split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV",1).split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
+INC_PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BOOST_P}.tar.bz2"
+
+S = "${WORKDIR}/${BOOST_P}"
+
 BOOST_LIBS = "\
 	date_time \
 	filesystem \
@@ -37,8 +44,6 @@ BOOST_LIBS = "\
 #PYTHON_ROOT = "${STAGING_DIR_HOST}/${prefix}"
 #PYTHON_VERSION = "2.5"
 
-S = "${WORKDIR}/${BOOST_P}"
-
 # Make a package for each library, plus -dev
 PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
@@ -148,3 +153,32 @@ do_install() {
 		--includedir=${D}${includedir} \
 		install
 }
+
+BBCLASSEXTEND = "native"
+
+do_configure_virtclass-native() {
+	:
+}
+
+do_boostconfig_virtclass-native() {
+	:
+}
+
+do_compile_virtclass-native() {
+	set -ex
+	cd ${S}/tools/build/v2/engine
+	rm -rf bin.*
+	./build.sh gcc
+}
+
+# This is too terrible - the build script doesn't give any good
+# way I can see to find out where the binaries are placed, so
+# rely on only one bin.foo directory being created.
+do_install_virtclass-native () {
+	set -ex
+	cd ${S}/tools/build/v2/engine
+	install -d ${D}${bindir}/
+	install -c -m 755 bin.*/bjam ${D}${bindir}/
+}
+
+
diff --git a/meta/recipes-support/boost/boost_1.44.0.bb b/meta/recipes-support/boost/boost_1.47.0.bb
similarity index 66%
rename from meta/recipes-support/boost/boost_1.44.0.bb
rename to meta/recipes-support/boost/boost_1.47.0.bb
index 722149d..e1e0ca1 100644
--- a/meta/recipes-support/boost/boost_1.44.0.bb
+++ b/meta/recipes-support/boost/boost_1.47.0.bb
@@ -1,16 +1,13 @@
-include boost-36.inc
+include boost.inc
 
-LICENSE = "Boost"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/boost/${BOOST_P}.tar.bz2 \
-           file://arm-intrinsics.patch \
-          "
+SRC_URI += "file://arm-intrinsics.patch"
 
-SRC_URI[md5sum] = "f02578f5218f217a9f20e9c30e119c6a"
-SRC_URI[sha256sum] = "45c328029d97d1f1dc7ff8c9527cd0c5cc356636084a800bca2ee4bfab1978db"
+SRC_URI[md5sum] = "a2dc343f7bc7f83f8941e47ed4a18200"
+SRC_URI[sha256sum] = "815a5d9faac4dbd523fbcf3fe1065e443c0bbf43427c44aa423422c6ec4c2e31"
 
 BJAM_OPTS    = '${BJAM_TOOLS} \
                 --builddir=${S}/${TARGET_SYS} \
diff --git a/meta/recipes-support/boost/files/1.34.1-gcc43.patch b/meta/recipes-support/boost/files/1.34.1-gcc43.patch
deleted file mode 100644
index 172e19a..0000000
--- a/meta/recipes-support/boost/files/1.34.1-gcc43.patch
+++ /dev/null
@@ -1,226 +0,0 @@
-Upstream-Status: Backport
-
-Index: boost_1_34_1/boost/archive/polymorphic_iarchive.hpp
-===================================================================
---- boost_1_34_1.orig/boost/archive/polymorphic_iarchive.hpp	2005-12-11 07:12:51.000000000 +0100
-+++ boost_1_34_1/boost/archive/polymorphic_iarchive.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -17,6 +17,7 @@
- //  See http://www.boost.org for updates, documentation, and revision history.
- 
- #include <cstddef> // std::size_t
-+#include <climits>
- #include <boost/config.hpp>
- 
- #if defined(BOOST_NO_STDC_NAMESPACE)
-Index: boost_1_34_1/boost/archive/polymorphic_oarchive.hpp
-===================================================================
---- boost_1_34_1.orig/boost/archive/polymorphic_oarchive.hpp	2006-02-12 06:43:06.000000000 +0100
-+++ boost_1_34_1/boost/archive/polymorphic_oarchive.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -17,6 +17,7 @@
- //  See http://www.boost.org for updates, documentation, and revision history.
- 
- #include <cstddef> // size_t
-+#include <climits>
- #include <string>
- 
- #include <boost/config.hpp>
-Index: boost_1_34_1/boost/date_time/date_facet.hpp
-===================================================================
---- boost_1_34_1.orig/boost/date_time/date_facet.hpp	2005-09-05 23:10:50.000000000 +0200
-+++ boost_1_34_1/boost/date_time/date_facet.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -429,7 +429,7 @@
-     typedef std::basic_string<CharT> string_type;
-     typedef CharT                    char_type;
-     typedef boost::date_time::period_parser<date_type, CharT>  period_parser_type;
--    typedef special_values_parser<date_type,CharT> special_values_parser_type; 
-+    typedef boost::date_time::special_values_parser<date_type,CharT> special_values_parser_type; 
-     typedef std::vector<std::basic_string<CharT> > input_collection_type;
-     typedef format_date_parser<date_type, CharT> format_date_parser_type;
-     // date_generators stuff goes here
-Index: boost_1_34_1/boost/mpl/zip_view.hpp
-===================================================================
---- boost_1_34_1.orig/boost/mpl/zip_view.hpp	2004-09-02 17:40:42.000000000 +0200
-+++ boost_1_34_1/boost/mpl/zip_view.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -37,7 +37,7 @@
-     typedef zip_iterator<
-           typename transform1<
-                 IteratorSeq
--              , next<_1>
-+              , boost::mpl::next<_1>
-             >::type
-         > next;
- };
-@@ -48,8 +48,8 @@
- struct zip_view
- {
-  private:
--    typedef typename transform1< Sequences, begin<_1> >::type first_ones_;
--    typedef typename transform1< Sequences, end<_1> >::type last_ones_;
-+    typedef typename transform1< Sequences, boost::mpl::begin<_1> >::type first_ones_;
-+    typedef typename transform1< Sequences, boost::mpl::end<_1> >::type last_ones_;
-     
-  public:
-     typedef nested_begin_end_tag tag;
-Index: boost_1_34_1/boost/python/detail/def_helper.hpp
-===================================================================
---- boost_1_34_1.orig/boost/python/detail/def_helper.hpp	2004-09-16 03:00:28.000000000 +0200
-+++ boost_1_34_1/boost/python/detail/def_helper.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -155,7 +155,7 @@
-           , T3 const&
-           , T4 const&
-           , default_call_policies
--          , keywords<0>
-+          , boost::python::detail::keywords<0>
-           , char const*
-           , void(not_specified::*)()   // A function pointer type which is never an
-                                        // appropriate default implementation
-Index: boost_1_34_1/boost/regex/v4/basic_regex_creator.hpp
-===================================================================
---- boost_1_34_1.orig/boost/regex/v4/basic_regex_creator.hpp	2006-07-16 18:06:38.000000000 +0200
-+++ boost_1_34_1/boost/regex/v4/basic_regex_creator.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -24,6 +24,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- 
- namespace re_detail{
-Index: boost_1_34_1/boost/regex/v4/basic_regex.hpp
-===================================================================
---- boost_1_34_1.orig/boost/regex/v4/basic_regex.hpp	2007-06-05 19:28:18.000000000 +0200
-+++ boost_1_34_1/boost/regex/v4/basic_regex.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -23,6 +23,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- #ifdef BOOST_MSVC
- #pragma warning(push)
-Index: boost_1_34_1/boost/regex/v4/basic_regex_parser.hpp
-===================================================================
---- boost_1_34_1.orig/boost/regex/v4/basic_regex_parser.hpp	2006-12-20 18:19:05.000000000 +0100
-+++ boost_1_34_1/boost/regex/v4/basic_regex_parser.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -23,6 +23,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- namespace re_detail{
- 
-Index: boost_1_34_1/boost/regex/v4/cpp_regex_traits.hpp
-===================================================================
---- boost_1_34_1.orig/boost/regex/v4/cpp_regex_traits.hpp	2007-01-15 12:09:44.000000000 +0100
-+++ boost_1_34_1/boost/regex/v4/cpp_regex_traits.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -41,6 +41,7 @@
- 
- #include <istream>
- #include <ios>
-+#include <climits>
- 
- #ifdef BOOST_HAS_ABI_HEADERS
- #  include BOOST_ABI_PREFIX
-Index: boost_1_34_1/boost/regex/v4/perl_matcher.hpp
-===================================================================
---- boost_1_34_1.orig/boost/regex/v4/perl_matcher.hpp	2006-10-18 14:55:30.000000000 +0200
-+++ boost_1_34_1/boost/regex/v4/perl_matcher.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -18,6 +18,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- namespace re_detail{
- 
-Index: boost_1_34_1/boost/regex/v4/regex_split.hpp
-===================================================================
---- boost_1_34_1.orig/boost/regex/v4/regex_split.hpp	2005-01-21 18:22:38.000000000 +0100
-+++ boost_1_34_1/boost/regex/v4/regex_split.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -21,6 +21,8 @@
- #ifndef BOOST_REGEX_SPLIT_HPP
- #define BOOST_REGEX_SPLIT_HPP
- 
-+#include <climits>
-+
- namespace boost{
- 
- #ifdef BOOST_HAS_ABI_HEADERS
-Index: boost_1_34_1/boost/regex/v4/states.hpp
-===================================================================
---- boost_1_34_1.orig/boost/regex/v4/states.hpp	2005-09-20 14:01:25.000000000 +0200
-+++ boost_1_34_1/boost/regex/v4/states.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -23,6 +23,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- namespace re_detail{
- 
-Index: boost_1_34_1/boost/serialization/collection_traits.hpp
-===================================================================
---- boost_1_34_1.orig/boost/serialization/collection_traits.hpp	2005-06-21 07:19:04.000000000 +0200
-+++ boost_1_34_1/boost/serialization/collection_traits.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -22,6 +22,7 @@
- // compiles recognize the same set of primitive types, the possibility
- // exists for archives to be non-portable if class information for primitive
- // types is included.  This is addressed by the following macros.
-+#include <climits>
- #include <boost/config.hpp>
- #include <boost/mpl/integral_c.hpp>
- #include <boost/mpl/integral_c_tag.hpp>
-Index: boost_1_34_1/boost/spirit/phoenix/operators.hpp
-===================================================================
---- boost_1_34_1.orig/boost/spirit/phoenix/operators.hpp	2006-08-25 18:27:30.000000000 +0200
-+++ boost_1_34_1/boost/spirit/phoenix/operators.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -24,6 +24,7 @@
- #include <boost/spirit/phoenix/composite.hpp>
- #include <boost/config.hpp>
- #include <boost/mpl/if.hpp>
-+#include <climits>
- 
- ///////////////////////////////////////////////////////////////////////////////
- namespace phoenix {
-Index: boost_1_34_1/boost/test/test_tools.hpp
-===================================================================
---- boost_1_34_1.orig/boost/test/test_tools.hpp	2007-02-22 18:57:29.000000000 +0100
-+++ boost_1_34_1/boost/test/test_tools.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -42,6 +42,7 @@
- #include <boost/mpl/or.hpp>
- 
- // STL
-+#include <climits>
- #include <cstddef>          // for std::size_t
- #include <iosfwd>
- 
-Index: boost_1_34_1/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp
-===================================================================
---- boost_1_34_1.orig/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp	2006-12-20 17:38:24.000000000 +0100
-+++ boost_1_34_1/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -16,6 +16,7 @@
- #include <string>
- #include <cstdio>
- #include <cstdarg>
-+#include <cstring>
- #if defined(BOOST_SPIRIT_DEBUG)
- #include <iostream>
- #endif // defined(BOOST_SPIRIT_DEBUG)
-Index: boost_1_34_1/boost/wave/util/flex_string.hpp
-===================================================================
---- boost_1_34_1.orig/boost/wave/util/flex_string.hpp	2006-04-25 19:21:01.000000000 +0200
-+++ boost_1_34_1/boost/wave/util/flex_string.hpp	2008-09-20 20:55:21.000000000 +0200
-@@ -94,6 +94,7 @@
- #include <limits>
- #include <stdexcept>
- #include <cstddef>
-+#include <cstring>
- 
- // this must occur after all of the includes and before any code appears
- #ifdef BOOST_HAS_ABI_HEADERS
diff --git a/meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch b/meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
deleted file mode 100644
index 64d5884..0000000
--- a/meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport
-
-Index: boost_1_33_1/boost/detail/atomic_count_gcc.hpp
-===================================================================
---- boost_1_33_1.orig/boost/detail/atomic_count_gcc.hpp	2008-05-01 20:43:45.000000000 +0200
-+++ boost_1_33_1/boost/detail/atomic_count_gcc.hpp	2008-05-01 20:43:55.000000000 +0200
-@@ -17,7 +17,7 @@
- //  http://www.boost.org/LICENSE_1_0.txt)
- //
- 
--#include <bits/atomicity.h>
-+#include <ext/atomicity.h>
- 
- namespace boost
- {
diff --git a/meta/recipes-support/boost/files/gcc41.patch b/meta/recipes-support/boost/files/gcc41.patch
deleted file mode 100644
index a1bd57e..0000000
--- a/meta/recipes-support/boost/files/gcc41.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Backport
-
-diff -ur boost_1_33_1.orig/boost/bind.hpp boost_1_33_1/boost/bind.hpp
---- boost_1_33_1.orig/boost/bind.hpp	2008-10-11 10:30:03.000000000 +0200
-+++ boost_1_33_1/boost/bind.hpp	2008-10-11 10:41:25.000000000 +0200
-@@ -28,6 +28,10 @@
- #include <boost/bind/arg.hpp>
- #include <boost/detail/workaround.hpp>
- 
-+#if __GNUC__ == 4 && __GNUC_MINOR__ == 1
-+#  include <boost/visit_each.hpp>
-+#endif
-+
- // Borland-specific bug, visit_each() silently fails to produce code
- 
- #if defined(__BORLANDC__)
diff --git a/meta/recipes-support/boost/files/gcc43.patch b/meta/recipes-support/boost/files/gcc43.patch
deleted file mode 100644
index dbf980d..0000000
--- a/meta/recipes-support/boost/files/gcc43.patch
+++ /dev/null
@@ -1,258 +0,0 @@
-Upstream-Status: Backport
-
-diff -aNru boost_1_34_1-ORIGINAL/boost/archive/polymorphic_iarchive.hpp boost_1_34_1/boost/archive/polymorphic_iarchive.hpp
---- boost_1_34_1-ORIGINAL/boost/archive/polymorphic_iarchive.hpp	2005-12-11 00:12:51.000000000 -0600
-+++ boost_1_34_1/boost/archive/polymorphic_iarchive.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -17,6 +17,7 @@
- //  See http://www.boost.org for updates, documentation, and revision history.
- 
- #include <cstddef> // std::size_t
-+#include <climits>
- #include <boost/config.hpp>
- 
- #if defined(BOOST_NO_STDC_NAMESPACE)
-diff -aNru boost_1_34_1-ORIGINAL/boost/archive/polymorphic_oarchive.hpp boost_1_34_1/boost/archive/polymorphic_oarchive.hpp
---- boost_1_34_1-ORIGINAL/boost/archive/polymorphic_oarchive.hpp	2006-02-11 23:43:06.000000000 -0600
-+++ boost_1_34_1/boost/archive/polymorphic_oarchive.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -17,6 +17,7 @@
- //  See http://www.boost.org for updates, documentation, and revision history.
- 
- #include <cstddef> // size_t
-+#include <climits>
- #include <string>
- 
- #include <boost/config.hpp>
-diff -aNru boost_1_34_1-ORIGINAL/boost/date_time/date_facet.hpp boost_1_34_1/boost/date_time/date_facet.hpp
---- boost_1_34_1-ORIGINAL/boost/date_time/date_facet.hpp	2005-09-05 16:10:50.000000000 -0500
-+++ boost_1_34_1/boost/date_time/date_facet.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -429,7 +429,7 @@
-     typedef std::basic_string<CharT> string_type;
-     typedef CharT                    char_type;
-     typedef boost::date_time::period_parser<date_type, CharT>  period_parser_type;
--    typedef special_values_parser<date_type,CharT> special_values_parser_type; 
-+    typedef boost::date_time::special_values_parser<date_type,CharT> special_values_parser_type; 
-     typedef std::vector<std::basic_string<CharT> > input_collection_type;
-     typedef format_date_parser<date_type, CharT> format_date_parser_type;
-     // date_generators stuff goes here
-diff -aNru boost_1_34_1-ORIGINAL/boost/mpl/zip_view.hpp boost_1_34_1/boost/mpl/zip_view.hpp
---- boost_1_34_1-ORIGINAL/boost/mpl/zip_view.hpp	2004-09-02 10:40:42.000000000 -0500
-+++ boost_1_34_1/boost/mpl/zip_view.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -37,7 +37,7 @@
-     typedef zip_iterator<
-           typename transform1<
-                 IteratorSeq
--              , next<_1>
-+              , boost::mpl::next<_1>
-             >::type
-         > next;
- };
-@@ -48,8 +48,8 @@
- struct zip_view
- {
-  private:
--    typedef typename transform1< Sequences, begin<_1> >::type first_ones_;
--    typedef typename transform1< Sequences, end<_1> >::type last_ones_;
-+    typedef typename transform1< Sequences, boost::mpl::begin<_1> >::type first_ones_;
-+    typedef typename transform1< Sequences, boost::mpl::end<_1> >::type last_ones_;
-     
-  public:
-     typedef nested_begin_end_tag tag;
-diff -aNru boost_1_34_1-ORIGINAL/boost/python/detail/def_helper.hpp boost_1_34_1/boost/python/detail/def_helper.hpp
---- boost_1_34_1-ORIGINAL/boost/python/detail/def_helper.hpp	2004-09-15 20:00:28.000000000 -0500
-+++ boost_1_34_1/boost/python/detail/def_helper.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -155,7 +155,7 @@
-           , T3 const&
-           , T4 const&
-           , default_call_policies
--          , keywords<0>
-+          , boost::python::detail::keywords<0>
-           , char const*
-           , void(not_specified::*)()   // A function pointer type which is never an
-                                        // appropriate default implementation
-diff -aNru boost_1_34_1-ORIGINAL/boost/regex/v4/basic_regex_creator.hpp boost_1_34_1/boost/regex/v4/basic_regex_creator.hpp
---- boost_1_34_1-ORIGINAL/boost/regex/v4/basic_regex_creator.hpp	2006-07-16 11:06:38.000000000 -0500
-+++ boost_1_34_1/boost/regex/v4/basic_regex_creator.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -24,6 +24,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- 
- namespace re_detail{
-diff -aNru boost_1_34_1-ORIGINAL/boost/regex/v4/basic_regex.hpp boost_1_34_1/boost/regex/v4/basic_regex.hpp
---- boost_1_34_1-ORIGINAL/boost/regex/v4/basic_regex.hpp	2007-06-05 12:28:18.000000000 -0500
-+++ boost_1_34_1/boost/regex/v4/basic_regex.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -23,6 +23,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- #ifdef BOOST_MSVC
- #pragma warning(push)
-diff -aNru boost_1_34_1-ORIGINAL/boost/regex/v4/basic_regex_parser.hpp boost_1_34_1/boost/regex/v4/basic_regex_parser.hpp
---- boost_1_34_1-ORIGINAL/boost/regex/v4/basic_regex_parser.hpp	2006-12-20 11:19:05.000000000 -0600
-+++ boost_1_34_1/boost/regex/v4/basic_regex_parser.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -23,6 +23,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- namespace re_detail{
- 
-diff -aNru boost_1_34_1-ORIGINAL/boost/regex/v4/cpp_regex_traits.hpp boost_1_34_1/boost/regex/v4/cpp_regex_traits.hpp
---- boost_1_34_1-ORIGINAL/boost/regex/v4/cpp_regex_traits.hpp	2007-01-15 05:09:44.000000000 -0600
-+++ boost_1_34_1/boost/regex/v4/cpp_regex_traits.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -41,6 +41,7 @@
- 
- #include <istream>
- #include <ios>
-+#include <climits>
- 
- #ifdef BOOST_HAS_ABI_HEADERS
- #  include BOOST_ABI_PREFIX
-diff -aNru boost_1_34_1-ORIGINAL/boost/regex/v4/perl_matcher.hpp boost_1_34_1/boost/regex/v4/perl_matcher.hpp
---- boost_1_34_1-ORIGINAL/boost/regex/v4/perl_matcher.hpp	2006-10-18 07:55:30.000000000 -0500
-+++ boost_1_34_1/boost/regex/v4/perl_matcher.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -18,6 +18,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- namespace re_detail{
- 
-diff -aNru boost_1_34_1-ORIGINAL/boost/regex/v4/regex_split.hpp boost_1_34_1/boost/regex/v4/regex_split.hpp
---- boost_1_34_1-ORIGINAL/boost/regex/v4/regex_split.hpp	2005-01-21 11:22:38.000000000 -0600
-+++ boost_1_34_1/boost/regex/v4/regex_split.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -21,6 +21,8 @@
- #ifndef BOOST_REGEX_SPLIT_HPP
- #define BOOST_REGEX_SPLIT_HPP
- 
-+#include <climits>
-+
- namespace boost{
- 
- #ifdef BOOST_HAS_ABI_HEADERS
-diff -aNru boost_1_34_1-ORIGINAL/boost/regex/v4/states.hpp boost_1_34_1/boost/regex/v4/states.hpp
---- boost_1_34_1-ORIGINAL/boost/regex/v4/states.hpp	2005-09-20 07:01:25.000000000 -0500
-+++ boost_1_34_1/boost/regex/v4/states.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -23,6 +23,8 @@
- #  include BOOST_ABI_PREFIX
- #endif
- 
-+#include <climits>
-+
- namespace boost{
- namespace re_detail{
- 
-diff -aNru boost_1_34_1-ORIGINAL/boost/serialization/collection_traits.hpp boost_1_34_1/boost/serialization/collection_traits.hpp
---- boost_1_34_1-ORIGINAL/boost/serialization/collection_traits.hpp	2005-06-21 00:19:04.000000000 -0500
-+++ boost_1_34_1/boost/serialization/collection_traits.hpp	2008-03-03 03:09:49.000000000 -0600
-@@ -22,6 +22,7 @@
- // compiles recognize the same set of primitive types, the possibility
- // exists for archives to be non-portable if class information for primitive
- // types is included.  This is addressed by the following macros.
-+#include <climits>
- #include <boost/config.hpp>
- #include <boost/mpl/integral_c.hpp>
- #include <boost/mpl/integral_c_tag.hpp>
-diff -aNru boost_1_34_1-ORIGINAL/boost/spirit/phoenix/operators.hpp boost_1_34_1/boost/spirit/phoenix/operators.hpp
---- boost_1_34_1-ORIGINAL/boost/spirit/phoenix/operators.hpp	2006-08-25 11:27:30.000000000 -0500
-+++ boost_1_34_1/boost/spirit/phoenix/operators.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -24,6 +24,7 @@
- #include <boost/spirit/phoenix/composite.hpp>
- #include <boost/config.hpp>
- #include <boost/mpl/if.hpp>
-+#include <climits>
- 
- ///////////////////////////////////////////////////////////////////////////////
- namespace phoenix {
-diff -aNru boost_1_34_1-ORIGINAL/boost/test/test_tools.hpp boost_1_34_1/boost/test/test_tools.hpp
---- boost_1_34_1-ORIGINAL/boost/test/test_tools.hpp	2007-02-22 11:57:29.000000000 -0600
-+++ boost_1_34_1/boost/test/test_tools.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -42,6 +42,7 @@
- #include <boost/mpl/or.hpp>
- 
- // STL
-+#include <climits>
- #include <cstddef>          // for std::size_t
- #include <iosfwd>
- 
-diff -aNru boost_1_34_1-ORIGINAL/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp boost_1_34_1/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp
---- boost_1_34_1-ORIGINAL/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp	2006-12-20 10:38:24.000000000 -0600
-+++ boost_1_34_1/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -16,6 +16,7 @@
- #include <string>
- #include <cstdio>
- #include <cstdarg>
-+#include <cstring>
- #if defined(BOOST_SPIRIT_DEBUG)
- #include <iostream>
- #endif // defined(BOOST_SPIRIT_DEBUG)
-diff -aNru boost_1_34_1-ORIGINAL/boost/wave/util/flex_string.hpp boost_1_34_1/boost/wave/util/flex_string.hpp
---- boost_1_34_1-ORIGINAL/boost/wave/util/flex_string.hpp	2006-04-25 12:21:01.000000000 -0500
-+++ boost_1_34_1/boost/wave/util/flex_string.hpp	2008-03-03 03:08:59.000000000 -0600
-@@ -94,6 +94,7 @@
- #include <limits>
- #include <stdexcept>
- #include <cstddef>
-+#include <cstring>
- 
- // this must occur after all of the includes and before any code appears
- #ifdef BOOST_HAS_ABI_HEADERS
- 
---- boost_1_33_1/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp	2008-07-05 01:50:04.000000000 +0200
-+++ boost_1_34_1/boost/wave/cpplexer/re2clex/cpp_re2c_lexer.hpp	2006-12-20 17:38:24.000000000 +0100
-@@ -295,17 +325,20 @@
-     
-     lex_functor(IteratorT const &first, IteratorT const &last, 
-             PositionT const &pos, boost::wave::language_support language)
--    :   lexer(first, last, pos, language)
-+    :   re2c_lexer(first, last, pos, language)
-     {}
-     virtual ~lex_functor() {}
-     
- // get the next token from the input stream
--    token_type get() { return lexer.get(); }
--    void set_position(PositionT const &pos) 
--    { lexer.set_position(pos); }
-+    token_type get() { return re2c_lexer.get(); }
-+    void set_position(PositionT const &pos) { re2c_lexer.set_position(pos); }
-+#if BOOST_WAVE_SUPPORT_PRAGMA_ONCE != 0
-+    bool has_include_guards(std::string& guard_name) const 
-+        { return re2c_lexer.has_include_guards(guard_name); }
-+#endif    
- 
- private:
--    lexer<IteratorT, PositionT> lexer;
-+    lexer<IteratorT, PositionT> re2c_lexer;
- };
- 
- ///////////////////////////////////////////////////////////////////////////////
-@@ -338,7 +371,7 @@
- //  It is coupled to the iterator type to allow to decouple the lexer/iterator 
- //  configurations at compile time.
- //
--//  This function is declared inside the cpp_slex_token.hpp file, which is 
-+//  This function is declared inside the cpp_lex_token.hpp file, which is 
- //  referenced by the source file calling the lexer and the source file, which
- //  instantiates the lex_functor. But is is defined here, so it will be 
- //  instantiated only while compiling the source file, which instantiates the 
-@@ -356,8 +389,8 @@
-     IteratorT const &last, PositionT const &pos, 
-     boost::wave::language_support language)
- {
--    return new re2clex::lex_functor<IteratorT, PositionT>(first, last, pos,
--        language);
-+    using re2clex::lex_functor;
-+    return new lex_functor<IteratorT, PositionT>(first, last, pos, language);
- }
- 
- #undef BOOST_WAVE_RE2C_NEW_LEXER_INLINE
diff --git a/meta/recipes-support/boost/files/linux-uclibc.patch b/meta/recipes-support/boost/files/linux-uclibc.patch
deleted file mode 100644
index 470e084..0000000
--- a/meta/recipes-support/boost/files/linux-uclibc.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- /dev/null	1969-12-31 16:00:00.000000000 -0800
-+++ boost_1_32_0/boost/config/platform/linux-uclibc.hpp	2005-07-05 14:51:56.237294460 -0700
-@@ -0,0 +1,7 @@
-+// Modifications required to support uClibC libc implementation.
-+// Default to Linux...
-+#include "linux.hpp"
-+
-+// Override anything uClibC doesn't support.
-+// At present (0.9.27) the nl_types.h header exists but is not implemented
-+#undef BOOST_HAS_NL_TYPES_H
diff --git a/meta/recipes-support/boost/files/unit_test_log10f.patch b/meta/recipes-support/boost/files/unit_test_log10f.patch
deleted file mode 100644
index 8eec589..0000000
--- a/meta/recipes-support/boost/files/unit_test_log10f.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Backport
-
---- boost_1_32_0/libs/test/src/unit_test_result.cpp.orig	2005-07-05 11:00:53.887594850 -0700
-+++ boost_1_32_0/libs/test/src/unit_test_result.cpp	2005-07-05 11:01:20.683533034 -0700
-@@ -144,7 +144,7 @@
-                                         unit_test_counter num_passed, unit_test_counter num_failed )
-     {
-         unit_test_counter total_test_cases = num_passed + num_failed;
--        std::size_t       width = static_cast<std::size_t>( std::log10( (float)(std::max)( num_passed, num_failed ) ) ) + 1;
-+        std::size_t       width = static_cast<std::size_t>( std::log10( (double)(std::max)( num_passed, num_failed ) ) ) + 1;
- 
-         where_to << std::setw( indent ) << "" << std::setw( width ) << num_passed
-                  << " test " << ps_name( num_passed != 1, "case" ) << " out of " << total_test_cases << " passed\n"
-@@ -158,7 +158,7 @@
-     {
-         unit_test_counter total_assertions = num_passed + num_failed;
-         std::size_t       width            = total_assertions > 0 
--                                               ? static_cast<std::size_t>( std::log10( (float)(std::max)( num_passed, num_failed ) ) ) + 1
-+                                               ? static_cast<std::size_t>( std::log10( (double)(std::max)( num_passed, num_failed ) ) ) + 1
-                                                : 1;
-         
-         where_to << std::setw( indent ) << "" << std::setw( width ) << num_passed 
-- 
1.7.6.4



