Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Pgowda" <pgowda.cve@gmail.com>
Subject: [PATCH v3] gcc: Fix CVE-2021-42574 testcase
Date: Sat, 25 Dec 2021 06:32:44 -0800
Message-Id: <20211225143244.182974-1-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda <pgowda.cve@gmail.com>

Modify the testcases properly to generate expected output.

Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=51c500269bf53749b107807d84271385fad35628]
Upstream-Status: Backport [https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=bef32d4a28595e933f24fef378cf052a30b674a7]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../gcc/gcc/0002-CVE-2021-42574.patch         | 536 ++++++++----------
 .../gcc/gcc/0004-CVE-2021-42574.patch         |  20 +-
 2 files changed, 258 insertions(+), 298 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
index 9bad81d4d0..d40735621a 100644
--- a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
+++ b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-42574.patch
@@ -142,9 +142,8 @@ Signed-off-by: Pgowda <pgowda.cve@gmail.com>
  create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-9.c
 
 diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
-index 8a4cd634f77..3976fc368db 100644
---- a/gcc/c-family/c.opt
-+++ b/gcc/c-family/c.opt
+--- a/gcc/c-family/c.opt	2021-12-24 20:36:18.424153360 -0800
++++ b/gcc/c-family/c.opt	2021-12-24 20:52:31.835651314 -0800
 @@ -370,6 +370,30 @@ Wbad-function-cast
  C ObjC Var(warn_bad_function_cast) Warning
  Warn about casting functions to incompatible types.
@@ -177,9 +176,8 @@ index 8a4cd634f77..3976fc368db 100644
  C ObjC C++ ObjC++ Var(warn_bool_compare) Warning LangEnabledBy(C ObjC C++ ObjC++,Wall)
  Warn about boolean expression compared with an integer value different from true/false.
 diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
-index 6070288856c..a22758d18ee 100644
---- a/gcc/doc/invoke.texi
-+++ b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-12-24 20:36:21.264105609 -0800
++++ b/gcc/doc/invoke.texi	2021-12-24 20:52:31.843651178 -0800
 @@ -326,7 +326,9 @@ Objective-C and Objective-C++ Dialects}.
  -Warith-conversion @gol
  -Warray-bounds  -Warray-bounds=@var{n} @gol
@@ -216,17 +214,15 @@ index 6070288856c..a22758d18ee 100644
  @opindex Wno-bool-compare
  @opindex Wbool-compare
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
-new file mode 100644
-index 00000000000..34f5ac19271
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-10.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-10.c	2021-12-24 20:53:10.051000540 -0800
 @@ -0,0 +1,27 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
 +/* { dg-options "-Wbidi-chars=unpaired" } */
 +/* More nesting testing.  */
 +
-+/* RLEâ« LRIâ¦ PDFâ¬ PDIâ©*/
++/* RLE‫ LRI⁦ PDF‬ PDI⁩*/
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int LRE_\u202a_PDF_\u202c;
 +int LRE_\u202a_PDF_\u202c_LRE_\u202a_PDF_\u202c;
@@ -249,75 +245,69 @@ index 00000000000..34f5ac19271
 +int RLI_\u2067_RLI_\u2067_RLI_\u2067_RLI_\u2067_FSI_\u2068_PDI_\u2069_PDI_\u2069_PDI_\u2069_PDI_\u2069;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
-new file mode 100644
-index 00000000000..270ce2368a9
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-11.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-11.c	2021-12-24 20:53:10.562991821 -0800
 @@ -0,0 +1,13 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
 +/* { dg-options "-Wbidi-chars=unpaired" } */
 +/* Test that we warn when mixing UCN and UTF-8.  */
 +
-+int LRE_âª_PDF_\u202c;
++int LRE_‪_PDF_\u202c;
 +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+int LRE_\u202a_PDF_â¬_;
++int LRE_\u202a_PDF_‬_;
 +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+const char *s1 = "LRE_âª_PDF_\u202c";
++const char *s1 = "LRE_‪_PDF_\u202c";
 +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
-+const char *s2 = "LRE_\u202a_PDF_â¬";
++const char *s2 = "LRE_\u202a_PDF_‬";
 +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
-new file mode 100644
-index 00000000000..b07eec1da91
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-12.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-12.c	2021-12-24 20:53:10.890986236 -0800
 @@ -0,0 +1,19 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile { target { c || c++11 } } } */
 +/* { dg-options "-Wbidi-chars=any" } */
 +/* Test raw strings.  */
 +
-+const char *s1 = R"(a b c LREâª 1 2 3 PDFâ¬ x y z)";
++const char *s1 = R"(a b c LRE‪ 1 2 3 PDF‬ x y z)";
 +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+const char *s2 = R"(a b c RLEâ« 1 2 3 PDFâ¬ x y z)";
++const char *s2 = R"(a b c RLE‫ 1 2 3 PDF‬ x y z)";
 +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+const char *s3 = R"(a b c LROâ­ 1 2 3 PDFâ¬ x y z)";
++const char *s3 = R"(a b c LRO‭ 1 2 3 PDF‬ x y z)";
 +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+const char *s4 = R"(a b c RLOâ® 1 2 3 PDFâ¬ x y z)";
++const char *s4 = R"(a b c RLO‮ 1 2 3 PDF‬ x y z)";
 +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+const char *s7 = R"(a b c FSIâ¨ 1 2 3 PDIâ© x y) z";
++const char *s7 = R"(a b c FSI⁨ 1 2 3 PDI⁩ x y) z";
 +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+const char *s8 = R"(a b c PDIâ© x y )z";
++const char *s8 = R"(a b c PDI⁩ x y )z";
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+const char *s9 = R"(a b c PDFâ¬ x y z)";
++const char *s9 = R"(a b c PDF‬ x y z)";
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-diff -uprN '-x*.orig' '-x*.rej' del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c
---- del/gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	1969-12-31 16:00:00.000000000 -0800
-+++ gcc-11.2.0/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	2021-12-13 23:11:22.328439287 -0800
+diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-13.c b/gcc/testsuite/c-c++-common/Wbidi-chars-13.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-13.c	2021-12-24 20:53:11.190981126 -0800
 @@ -0,0 +1,17 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile { target { c || c++11 } } } */
 +/* { dg-options "-Wbidi-chars=unpaired" } */
 +/* Test raw strings.  */
 +
-+const char *s1 = R"(a b c LREâª 1 2 3)";
++const char *s1 = R"(a b c LRE‪ 1 2 3)";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s2 = R"(a b c RLEâ« 1 2 3)";
++const char *s2 = R"(a b c RLE‫ 1 2 3)";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s3 = R"(a b c LROâ­ 1 2 3)";
++const char *s3 = R"(a b c LRO‭ 1 2 3)";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s4 = R"(a b c FSIâ¨ 1 2 3)";
++const char *s4 = R"(a b c FSI⁨ 1 2 3)";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s5 = R"(a b c LRIâ¦ 1 2 3)";
++const char *s5 = R"(a b c LRI⁦ 1 2 3)";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+const char *s6 = R"(a b c RLIâ§ 1 2 3)";
++const char *s6 = R"(a b c RLI⁧ 1 2 3)";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
-new file mode 100644
-index 00000000000..ba5f75d9553
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-14.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-14.c	2021-12-24 20:53:11.482976153 -0800
 @@ -0,0 +1,38 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -325,13 +315,13 @@ index 00000000000..ba5f75d9553
 +/* Test PDI handling, which also pops any subsequent LREs, RLEs, LROs,
 +   or RLOs.  */
 +
-+/* LRI_â¦_LRI_â¦_RLE_â«_RLE_â«_RLE_â«_PDI_â©*/
++/* LRI_⁦_LRI_⁦_RLE_‫_RLE_‫_RLE_‫_PDI_⁩*/
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// LRI_â¦_RLE_â«_RLE_â«_RLE_â«_PDI_â©
-+// LRI_â¦_RLO_â®_RLE_â«_RLE_â«_PDI_â©
-+// LRI_â¦_RLO_â®_RLE_â«_PDI_â©
-+// FSI_â¨_RLO_â®_PDI_â©
-+// FSI_â¨_FSI_â¨_RLO_â®_PDI_â©
++// LRI_⁦_RLE_‫_RLE_‫_RLE_‫_PDI_⁩
++// LRI_⁦_RLO_‮_RLE_‫_RLE_‫_PDI_⁩
++// LRI_⁦_RLO_‮_RLE_‫_PDI_⁩
++// FSI_⁨_RLO_‮_PDI_⁩
++// FSI_⁨_FSI_⁨_RLO_‮_PDI_⁩
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +
 +int LRI_\u2066_LRI_\u2066_LRE_\u202a_LRE_\u202a_LRE_\u202a_PDI_\u2069;
@@ -358,10 +348,8 @@ index 00000000000..ba5f75d9553
 +int FSI_\u2068_FSI_\u2068_PDF_\u202c_PDI_\u2069;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
-new file mode 100644
-index 00000000000..a0ce8ff5e2c
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-15.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-15.c	2021-12-24 20:53:11.738971793 -0800
 @@ -0,0 +1,59 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -369,182 +357,170 @@ index 00000000000..a0ce8ff5e2c
 +/* Test unpaired bidi control chars in multiline comments.  */
 +
 +/*
-+ * LREâª end
++ * LRE‪ end
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +/*
-+ * RLEâ« end
++ * RLE‫ end
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +/*
-+ * LROâ­ end
++ * LRO‭ end
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +/*
-+ * RLOâ® end
++ * RLO‮ end
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +/*
-+ * LRIâ¦ end
++ * LRI⁦ end
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +/*
-+ * RLIâ§ end
++ * RLI⁧ end
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +/*
-+ * FSIâ¨ end
++ * FSI⁨ end
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/* LREâª
-+   PDFâ¬ */
++/* LRE‪
++   PDF‬ */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
-+/* FSIâ¨
-+   PDIâ© */
++/* FSI⁨
++   PDI⁩ */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +
-+/* LRE<âª>
++/* LRE<‪>
 + *
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-3 } */
 +
 +/*
-+ * LRE<âª>
++ * LRE<‪>
 + */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +
 +/*
 + *
-+ * LRE<âª> */
++ * LRE<‪> */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +
-+/* RLI<â§> */ /* PDI<â©> */
++/* RLI<⁧> */ /* PDI<⁩> */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRE<âª> */ /* PDF<â¬> */
++/* LRE<‪> */ /* PDF<‬> */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
-new file mode 100644
-index 00000000000..baa0159861c
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-16.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-16.c	2021-12-24 20:53:11.998967366 -0800
 @@ -0,0 +1,26 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
 +/* { dg-options "-Wbidi-chars=any" } */
 +/* Test LTR/RTL chars.  */
 +
-+/* LTR<â> */
++/* LTR<‎> */
 +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+// LTR<â>
++// LTR<‎>
 +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+/* RTL<â> */
++/* RTL<‏> */
 +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
-+// RTL<â>
++// RTL<‏>
 +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
 +
-+const char *s1 = "LTR<â>";
++const char *s1 = "LTR<‎>";
 +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
 +const char *s2 = "LTR\u200e";
 +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
 +const char *s3 = "LTR\u200E";
 +/* { dg-warning "U\\+200E" "" { target *-*-* } .-1 } */
-+const char *s4 = "RTL<â>";
++const char *s4 = "RTL<‏>";
 +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
 +const char *s5 = "RTL\u200f";
 +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
 +const char *s6 = "RTL\u200F";
 +/* { dg-warning "U\\+200F" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
-new file mode 100644
-index 00000000000..07cb4321f96
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-17.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-17.c	2021-12-24 20:53:12.286962462 -0800
 @@ -0,0 +1,30 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
 +/* { dg-options "-Wbidi-chars=unpaired" } */
 +/* Test LTR/RTL chars.  */
 +
-+/* LTR<â> */
++/* LTR<‎> */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// LTR<â>
++// LTR<‎>
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* RTL<â> */
++/* RTL<‏> */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// RTL<â>
++// RTL<‏>
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +int ltr_\u200e;
 +/* { dg-error "universal character " "" { target *-*-* } .-1 } */
 +int rtl_\u200f;
 +/* { dg-error "universal character " "" { target *-*-* } .-1 } */
 +
-+const char *s1 = "LTR<â>";
++const char *s1 = "LTR<‎>";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +const char *s2 = "LTR\u200e";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +const char *s3 = "LTR\u200E";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+const char *s4 = "RTL<â>";
++const char *s4 = "RTL<‏>";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +const char *s5 = "RTL\u200f";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +const char *s6 = "RTL\u200F";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
-new file mode 100644
-index 00000000000..2340374f276
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-1.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-1.c	2021-12-24 20:53:12.518958510 -0800
 @@ -0,0 +1,12 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
 +
 +int main() {
 +    int isAdmin = 0;
-+    /*â® } â¦if (isAdmin)â© â¦ begin admins only */
++    /*‮ } ⁦if (isAdmin)⁩ ⁦ begin admins only */
 +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
 +        __builtin_printf("You are an admin.\n");
-+    /* end admins only â® { â¦*/
++    /* end admins only ‮ { ⁦*/
 +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
 +    return 0;
 +}
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
-new file mode 100644
-index 00000000000..2340374f276
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-2.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-2.c	2021-12-24 20:53:12.778954082 -0800
 @@ -0,0 +1,9 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
 +
 +int main() {
-+    /* Say hello; newlineâ§/*/ return 0 ;
++    /* Say hello; newline⁧/*/ return 0 ;
 +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
 +    __builtin_printf("Hello world.\n");
 +    return 0;
 +}
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
-new file mode 100644
-index 00000000000..9dc7edb6e64
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-3.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-3.c	2021-12-24 20:53:13.038949654 -0800
 @@ -0,0 +1,11 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
 +
 +int main() {
 +    const char* access_level = "user";
-+    if (__builtin_strcmp(access_level, "userâ® â¦// Check if adminâ© â¦")) {
++    if (__builtin_strcmp(access_level, "user‮ ⁦// Check if admin⁩ ⁦")) {
 +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
 +        __builtin_printf("You are an admin.\n");
 +    }
 +    return 0;
 +}
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
-new file mode 100644
-index 00000000000..639e5c62e88
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-4.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-4.c	2021-12-24 20:53:13.382943796 -0800
 @@ -0,0 +1,188 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -553,89 +529,89 @@ index 00000000000..639e5c62e88
 +   string literals, character constants), both UCN and UTF-8.  The bidi
 +   chars here are properly terminated, except for the character constants.  */
 +
-+/* a b c LREâª 1 2 3 PDFâ¬ x y z */
++/* a b c LRE‪ 1 2 3 PDF‬ x y z */
 +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+/* a b c RLEâ« 1 2 3 PDFâ¬ x y z */
++/* a b c RLE‫ 1 2 3 PDF‬ x y z */
 +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+/* a b c LROâ­ 1 2 3 PDFâ¬ x y z */
++/* a b c LRO‭ 1 2 3 PDF‬ x y z */
 +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+/* a b c RLOâ® 1 2 3 PDFâ¬ x y z */
++/* a b c RLO‮ 1 2 3 PDF‬ x y z */
 +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+/* a b c LRIâ¦ 1 2 3 PDIâ© x y z */
++/* a b c LRI⁦ 1 2 3 PDI⁩ x y z */
 +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+/* a b c RLIâ§ 1 2 3 PDIâ© x y */
++/* a b c RLI⁧ 1 2 3 PDI⁩ x y */
 +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+/* a b c FSIâ¨ 1 2 3 PDIâ© x y z */
++/* a b c FSI⁨ 1 2 3 PDI⁩ x y z */
 +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
 +
 +/* Same but C++ comments instead.  */
-+// a b c LREâª 1 2 3 PDFâ¬ x y z
++// a b c LRE‪ 1 2 3 PDF‬ x y z
 +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+// a b c RLEâ« 1 2 3 PDFâ¬ x y z
++// a b c RLE‫ 1 2 3 PDF‬ x y z
 +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+// a b c LROâ­ 1 2 3 PDFâ¬ x y z
++// a b c LRO‭ 1 2 3 PDF‬ x y z
 +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+// a b c RLOâ® 1 2 3 PDFâ¬ x y z
++// a b c RLO‮ 1 2 3 PDF‬ x y z
 +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+// a b c LRIâ¦ 1 2 3 PDIâ© x y z
++// a b c LRI⁦ 1 2 3 PDI⁩ x y z
 +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+// a b c RLIâ§ 1 2 3 PDIâ© x y
++// a b c RLI⁧ 1 2 3 PDI⁩ x y
 +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+// a b c FSIâ¨ 1 2 3 PDIâ© x y z
++// a b c FSI⁨ 1 2 3 PDI⁩ x y z
 +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
 +
 +/* Here we're closing an unopened context, warn when =any.  */
-+/* a b c PDIâ© x y z */
++/* a b c PDI⁩ x y z */
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+/* a b c PDFâ¬ x y z */
++/* a b c PDF‬ x y z */
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
-+// a b c PDIâ© x y z
++// a b c PDI⁩ x y z
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+// a b c PDFâ¬ x y z
++// a b c PDF‬ x y z
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
 +
 +/* Multiline comments.  */
-+/* a b c PDIâ© x y z
++/* a b c PDI⁩ x y z
 +   */
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
-+/* a b c PDFâ¬ x y z
++/* a b c PDF‬ x y z
 +   */
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
 +/* first
-+   a b c PDIâ© x y z
++   a b c PDI⁩ x y z
 +   */
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-2 } */
 +/* first
-+   a b c PDFâ¬ x y z
++   a b c PDF‬ x y z
 +   */
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-2 } */
 +/* first
-+   a b c PDIâ© x y z */
++   a b c PDI⁩ x y z */
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
 +/* first
-+   a b c PDFâ¬ x y z */
++   a b c PDF‬ x y z */
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
 +
 +void
 +g1 ()
 +{
-+  const char *s1 = "a b c LREâª 1 2 3 PDFâ¬ x y z";
++  const char *s1 = "a b c LRE‪ 1 2 3 PDF‬ x y z";
 +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+  const char *s2 = "a b c RLEâ« 1 2 3 PDFâ¬ x y z";
++  const char *s2 = "a b c RLE‫ 1 2 3 PDF‬ x y z";
 +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+  const char *s3 = "a b c LROâ­ 1 2 3 PDFâ¬ x y z";
++  const char *s3 = "a b c LRO‭ 1 2 3 PDF‬ x y z";
 +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+  const char *s4 = "a b c RLOâ® 1 2 3 PDFâ¬ x y z";
++  const char *s4 = "a b c RLO‮ 1 2 3 PDF‬ x y z";
 +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+  const char *s5 = "a b c LRIâ¦ 1 2 3 PDIâ© x y z";
++  const char *s5 = "a b c LRI⁦ 1 2 3 PDI⁩ x y z";
 +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+  const char *s6 = "a b c RLIâ§ 1 2 3 PDIâ© x y z";
++  const char *s6 = "a b c RLI⁧ 1 2 3 PDI⁩ x y z";
 +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+  const char *s7 = "a b c FSIâ¨ 1 2 3 PDIâ© x y z";
++  const char *s7 = "a b c FSI⁨ 1 2 3 PDI⁩ x y z";
 +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+  const char *s8 = "a b c PDIâ© x y z";
++  const char *s8 = "a b c PDI⁩ x y z";
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
-+  const char *s9 = "a b c PDFâ¬ x y z";
++  const char *s9 = "a b c PDF‬ x y z";
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
 +
 +  const char *s10 = "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
@@ -689,21 +665,21 @@ index 00000000000..639e5c62e88
 +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
 +}
 +
-+int aâªbâ¬c;
++int a‪b‬c;
 +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
-+int aâ«bâ¬c;
++int a‫b‬c;
 +/* { dg-warning "U\\+202B" "" { target *-*-* } .-1 } */
-+int aâ­bâ¬c;
++int a‭b‬c;
 +/* { dg-warning "U\\+202D" "" { target *-*-* } .-1 } */
-+int aâ®bâ¬c;
++int a‮b‬c;
 +/* { dg-warning "U\\+202E" "" { target *-*-* } .-1 } */
-+int aâ¦bâ©c;
++int a⁦b⁩c;
 +/* { dg-warning "U\\+2066" "" { target *-*-* } .-1 } */
-+int aâ§bâ©c;
++int a⁧b⁩c;
 +/* { dg-warning "U\\+2067" "" { target *-*-* } .-1 } */
-+int aâ¨bâ©c;
++int a⁨b⁩c;
 +/* { dg-warning "U\\+2068" "" { target *-*-* } .-1 } */
-+int Aâ¬X;
++int A‬X;
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
 +int A\u202cY;
 +/* { dg-warning "U\\+202C" "" { target *-*-* } .-1 } */
@@ -735,10 +711,8 @@ index 00000000000..639e5c62e88
 +int X\u2069;
 +/* { dg-warning "U\\+2069" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
-new file mode 100644
-index 00000000000..68cb053144b
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-5.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-5.c	2021-12-24 20:53:14.370926970 -0800
 @@ -0,0 +1,188 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -747,89 +721,89 @@ index 00000000000..68cb053144b
 +   string literals, character constants), both UCN and UTF-8.  The bidi
 +   chars here are properly terminated, except for the character constants.  */
 +
-+/* a b c LREâª 1 2 3 PDFâ¬ x y z */
++/* a b c LRE‪ 1 2 3 PDF‬ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLEâ« 1 2 3 PDFâ¬ x y z */
++/* a b c RLE‫ 1 2 3 PDF‬ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LROâ­ 1 2 3 PDFâ¬ x y z */
++/* a b c LRO‭ 1 2 3 PDF‬ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLOâ® 1 2 3 PDFâ¬ x y z */
++/* a b c RLO‮ 1 2 3 PDF‬ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LRIâ¦ 1 2 3 PDIâ© x y z */
++/* a b c LRI⁦ 1 2 3 PDI⁩ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLIâ§ 1 2 3 PDIâ© x y */
++/* a b c RLI⁧ 1 2 3 PDI⁩ x y */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c FSIâ¨ 1 2 3 PDIâ© x y z */
++/* a b c FSI⁨ 1 2 3 PDI⁩ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +
 +/* Same but C++ comments instead.  */
-+// a b c LREâª 1 2 3 PDFâ¬ x y z
++// a b c LRE‪ 1 2 3 PDF‬ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLEâ« 1 2 3 PDFâ¬ x y z
++// a b c RLE‫ 1 2 3 PDF‬ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LROâ­ 1 2 3 PDFâ¬ x y z
++// a b c LRO‭ 1 2 3 PDF‬ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLOâ® 1 2 3 PDFâ¬ x y z
++// a b c RLO‮ 1 2 3 PDF‬ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LRIâ¦ 1 2 3 PDIâ© x y z
++// a b c LRI⁦ 1 2 3 PDI⁩ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLIâ§ 1 2 3 PDIâ© x y
++// a b c RLI⁧ 1 2 3 PDI⁩ x y
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c FSIâ¨ 1 2 3 PDIâ© x y z
++// a b c FSI⁨ 1 2 3 PDI⁩ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +
 +/* Here we're closing an unopened context, warn when =any.  */
-+/* a b c PDIâ© x y z */
++/* a b c PDI⁩ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c PDFâ¬ x y z */
++/* a b c PDF‬ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c PDIâ© x y z
++// a b c PDI⁩ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+// a b c PDFâ¬ x y z
++// a b c PDF‬ x y z
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +
 +/* Multiline comments.  */
-+/* a b c PDIâ© x y z
++/* a b c PDI⁩ x y z
 +   */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
-+/* a b c PDFâ¬ x y z
++/* a b c PDF‬ x y z
 +   */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
 +/* first
-+   a b c PDIâ© x y z
++   a b c PDI⁩ x y z
 +   */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
 +/* first
-+   a b c PDFâ¬ x y z
++   a b c PDF‬ x y z
 +   */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-2 } */
 +/* first
-+   a b c PDIâ© x y z */
++   a b c PDI⁩ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +/* first
-+   a b c PDFâ¬ x y z */
++   a b c PDF‬ x y z */
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +
 +void
 +g1 ()
 +{
-+  const char *s1 = "a b c LREâª 1 2 3 PDFâ¬ x y z";
++  const char *s1 = "a b c LRE‪ 1 2 3 PDF‬ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s2 = "a b c RLEâ« 1 2 3 PDFâ¬ x y z";
++  const char *s2 = "a b c RLE‫ 1 2 3 PDF‬ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s3 = "a b c LROâ­ 1 2 3 PDFâ¬ x y z";
++  const char *s3 = "a b c LRO‭ 1 2 3 PDF‬ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s4 = "a b c RLOâ® 1 2 3 PDFâ¬ x y z";
++  const char *s4 = "a b c RLO‮ 1 2 3 PDF‬ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s5 = "a b c LRIâ¦ 1 2 3 PDIâ© x y z";
++  const char *s5 = "a b c LRI⁦ 1 2 3 PDI⁩ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s6 = "a b c RLIâ§ 1 2 3 PDIâ© x y z";
++  const char *s6 = "a b c RLI⁧ 1 2 3 PDI⁩ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s7 = "a b c FSIâ¨ 1 2 3 PDIâ© x y z";
++  const char *s7 = "a b c FSI⁨ 1 2 3 PDI⁩ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s8 = "a b c PDIâ© x y z";
++  const char *s8 = "a b c PDI⁩ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s9 = "a b c PDFâ¬ x y z";
++  const char *s9 = "a b c PDF‬ x y z";
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +
 +  const char *s10 = "a b c LRE\u202a 1 2 3 PDF\u202c x y z";
@@ -883,21 +857,21 @@ index 00000000000..68cb053144b
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +}
 +
-+int aâªbâ¬c;
++int a‪b‬c;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ«bâ¬c;
++int a‫b‬c;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ­bâ¬c;
++int a‭b‬c;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ®bâ¬c;
++int a‮b‬c;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ¦bâ©c;
++int a⁦b⁩c;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ§bâ©c;
++int a⁧b⁩c;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int aâ¨bâ©c;
++int a⁨b⁩c;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
-+int Aâ¬X;
++int A‬X;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 +int A\u202cY;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
@@ -929,10 +903,8 @@ index 00000000000..68cb053144b
 +int X\u2069;
 +/* { dg-bogus "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
-new file mode 100644
-index 00000000000..0ce6fff2dee
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-6.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-6.c	2021-12-24 20:53:14.770920157 -0800
 @@ -0,0 +1,155 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -940,160 +912,158 @@ index 00000000000..0ce6fff2dee
 +/* Test nesting of bidi chars in various contexts.  */
 +
 +/* Terminated by the wrong char:  */
-+/* a b c LREâª 1 2 3 PDIâ© x y z */
++/* a b c LRE‪ 1 2 3 PDI⁩ x y z */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLEâ« 1 2 3 PDIâ© x y  z*/
++/* a b c RLE‫ 1 2 3 PDI⁩ x y  z*/
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LROâ­ 1 2 3 PDIâ© x y z */
++/* a b c LRO‭ 1 2 3 PDI⁩ x y z */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLOâ® 1 2 3 PDIâ© x y z */
++/* a b c RLO‮ 1 2 3 PDI⁩ x y z */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c LRIâ¦ 1 2 3 PDFâ¬ x y z */
++/* a b c LRI⁦ 1 2 3 PDF‬ x y z */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c RLIâ§ 1 2 3 PDFâ¬ x y z */
++/* a b c RLI⁧ 1 2 3 PDF‬ x y z */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* a b c FSIâ¨ 1 2 3 PDFâ¬ x y  z*/
++/* a b c FSI⁨ 1 2 3 PDF‬ x y  z*/
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +
-+/* LREâª PDFâ¬ */
-+/* LREâª LREâª PDFâ¬ PDFâ¬ */
-+/* PDFâ¬ LREâª PDFâ¬ */
-+/* LREâª PDFâ¬ LREâª PDFâ¬ */
-+/* LREâª LREâª PDFâ¬ */
++/* LRE‪ PDF‬ */
++/* LRE‪ LRE‪ PDF‬ PDF‬ */
++/* PDF‬ LRE‪ PDF‬ */
++/* LRE‪ PDF‬ LRE‪ PDF‬ */
++/* LRE‪ LRE‪ PDF‬ */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* PDFâ¬ LREâª */
++/* PDF‬ LRE‪ */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +
-+// a b c LREâª 1 2 3 PDIâ© x y z
++// a b c LRE‪ 1 2 3 PDI⁩ x y z
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLEâ« 1 2 3 PDIâ© x y  z*/
++// a b c RLE‫ 1 2 3 PDI⁩ x y  z*/
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LROâ­ 1 2 3 PDIâ© x y z 
++// a b c LRO‭ 1 2 3 PDI⁩ x y z 
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLOâ® 1 2 3 PDIâ© x y z 
++// a b c RLO‮ 1 2 3 PDI⁩ x y z 
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c LRIâ¦ 1 2 3 PDFâ¬ x y z 
++// a b c LRI⁦ 1 2 3 PDF‬ x y z 
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c RLIâ§ 1 2 3 PDFâ¬ x y z 
++// a b c RLI⁧ 1 2 3 PDF‬ x y z 
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// a b c FSIâ¨ 1 2 3 PDFâ¬ x y  z
++// a b c FSI⁨ 1 2 3 PDF‬ x y  z
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +
-+// LREâª PDFâ¬ 
-+// LREâª LREâª PDFâ¬ PDFâ¬
-+// PDFâ¬ LREâª PDFâ¬
-+// LREâª PDFâ¬ LREâª PDFâ¬
-+// LREâª LREâª PDFâ¬
++// LRE‪ PDF‬ 
++// LRE‪ LRE‪ PDF‬ PDF‬
++// PDF‬ LRE‪ PDF‬
++// LRE‪ PDF‬ LRE‪ PDF‬
++// LRE‪ LRE‪ PDF‬
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+// PDFâ¬ LREâª
++// PDF‬ LRE‪
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +
 +void
 +g1 ()
 +{
-+  const char *s1 = "a b c LREâª 1 2 3 PDIâ© x y z";
++  const char *s1 = "a b c LRE‪ 1 2 3 PDI⁩ x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s2 = "a b c LRE\u202a 1 2 3 PDI\u2069 x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s3 = "a b c RLEâ« 1 2 3 PDIâ© x y ";
++  const char *s3 = "a b c RLE‫ 1 2 3 PDI⁩ x y ";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s4 = "a b c RLE\u202b 1 2 3 PDI\u2069 x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s5 = "a b c LROâ­ 1 2 3 PDIâ© x y z";
++  const char *s5 = "a b c LRO‭ 1 2 3 PDI⁩ x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s6 = "a b c LRO\u202d 1 2 3 PDI\u2069 x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s7 = "a b c RLOâ® 1 2 3 PDIâ© x y z";
++  const char *s7 = "a b c RLO‮ 1 2 3 PDI⁩ x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s8 = "a b c RLO\u202e 1 2 3 PDI\u2069 x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s9 = "a b c LRIâ¦ 1 2 3 PDFâ¬ x y z";
++  const char *s9 = "a b c LRI⁦ 1 2 3 PDF‬ x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s10 = "a b c LRI\u2066 1 2 3 PDF\u202c x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s11 = "a b c RLIâ§ 1 2 3 PDFâ¬ x y z\
++  const char *s11 = "a b c RLI⁧ 1 2 3 PDF‬ x y z\
 +    ";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +  const char *s12 = "a b c RLI\u2067 1 2 3 PDF\u202c x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s13 = "a b c FSIâ¨ 1 2 3 PDFâ¬ x y z";
++  const char *s13 = "a b c FSI⁨ 1 2 3 PDF‬ x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s14 = "a b c FSI\u2068 1 2 3 PDF\u202c x y z";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s15 = "PDFâ¬ LREâª";
++  const char *s15 = "PDF‬ LRE‪";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s16 = "PDF\u202c LRE\u202a";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s17 = "LREâª PDFâ¬";
++  const char *s17 = "LRE‪ PDF‬";
 +  const char *s18 = "LRE\u202a PDF\u202c";
-+  const char *s19 = "LREâª LREâª PDFâ¬ PDFâ¬";
++  const char *s19 = "LRE‪ LRE‪ PDF‬ PDF‬";
 +  const char *s20 = "LRE\u202a LRE\u202a PDF\u202c PDF\u202c";
-+  const char *s21 = "PDFâ¬ LREâª PDFâ¬";
++  const char *s21 = "PDF‬ LRE‪ PDF‬";
 +  const char *s22 = "PDF\u202c LRE\u202a PDF\u202c";
-+  const char *s23 = "LREâª LREâª PDFâ¬";
++  const char *s23 = "LRE‪ LRE‪ PDF‬";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s24 = "LRE\u202a LRE\u202a PDF\u202c";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s25 = "PDFâ¬ LREâª";
++  const char *s25 = "PDF‬ LRE‪";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +  const char *s26 = "PDF\u202c LRE\u202a";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s27 = "PDFâ¬ LRE\u202a";
++  const char *s27 = "PDF‬ LRE\u202a";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+  const char *s28 = "PDF\u202c LREâª";
++  const char *s28 = "PDF\u202c LRE‪";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +}
 +
-+int aLREâªbPDIâ©;
++int aLRE‪bPDI⁩;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int A\u202aB\u2069C;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aRLEâ«bPDIâ©;
++int aRLE‫bPDI⁩;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int a\u202bB\u2069c;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aLROâ­bPDIâ©;
++int aLRO‭bPDI⁩;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int a\u202db\u2069c2;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aRLOâ®bPDIâ©;
++int aRLO‮bPDI⁩;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int a\u202eb\u2069;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aLRIâ¦bPDFâ¬;
++int aLRI⁦bPDF‬;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int a\u2066b\u202c;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aRLIâ§bPDFâ¬c
++int aRLI⁧bPDF‬c
 +;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-2 } */
 +int a\u2067b\u202c;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aFSIâ¨bPDFâ¬;
++int aFSI⁨bPDF‬;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int a\u2068b\u202c;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aFSIâ¨bPD\u202C;
++int aFSI⁨bPD\u202C;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aFSI\u2068bPDFâ¬_;
++int aFSI\u2068bPDF‬_;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+int aLREâªbPDFâ¬b; 
++int aLRE‪bPDF‬b; 
 +int A\u202aB\u202c;
-+int a_LREâª_LREâª_b_PDFâ¬_PDFâ¬;
++int a_LRE‪_LRE‪_b_PDF‬_PDF‬;
 +int A\u202aA\u202aB\u202cB\u202c;
-+int aPDFâ¬bLREadPDFâ¬;
++int aPDF‬bLREadPDF‬;
 +int a_\u202C_\u202a_\u202c;
-+int a_LREâª_b_PDFâ¬_c_LREâª_PDFâ¬;
++int a_LRE‪_b_PDF‬_c_LRE‪_PDF‬;
 +int a_\u202a_\u202c_\u202a_\u202c_;
-+int a_LREâª_b_PDFâ¬_c_LREâª;
++int a_LRE‪_b_PDF‬_c_LRE‪;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int a_\u202a_\u202c_\u202a_;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
-new file mode 100644
-index 00000000000..d012d420ec0
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-7.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-7.c	2021-12-24 20:53:15.070915048 -0800
 @@ -0,0 +1,9 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -1105,10 +1075,8 @@ index 00000000000..d012d420ec0
 +/* a b c \u202a 1 2 3 */
 +/* a b c \u202A 1 2 3 */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
-new file mode 100644
-index 00000000000..4f54c5092ec
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-8.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-8.c	2021-12-24 20:53:15.370909939 -0800
 @@ -0,0 +1,13 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -1124,10 +1092,8 @@ index 00000000000..4f54c5092ec
 +int a_\U0000202a_4;
 +/* { dg-warning "U\\+202A" "" { target *-*-* } .-1 } */
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
-new file mode 100644
-index 00000000000..e2af1b1ca97
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-9.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-9.c	2021-12-24 20:53:15.618905716 -0800
 @@ -0,0 +1,29 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -1135,33 +1101,32 @@ index 00000000000..e2af1b1ca97
 +/* Test that we properly separate bidi contexts (comment/identifier/character
 +   constant/string literal).  */
 +
-+/* LRE ->âª<- */ int pdf_\u202c_1;
++/* LRE ->‪<- */ int pdf_\u202c_1;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* RLE ->â«<- */ int pdf_\u202c_2;
++/* RLE ->‫<- */ int pdf_\u202c_2;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRO ->â­<- */ int pdf_\u202c_3;
++/* LRO ->‭<- */ int pdf_\u202c_3;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* RLO ->â®<- */ int pdf_\u202c_4;
++/* RLO ->‮<- */ int pdf_\u202c_4;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRI ->â¦<-*/ int pdi_\u2069_1;
++/* LRI ->⁦<-*/ int pdi_\u2069_1;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* RLI ->â§<- */ int pdi_\u2069_12;
++/* RLI ->⁧<- */ int pdi_\u2069_12;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* FSI ->â¨<- */ int pdi_\u2069_3;
++/* FSI ->⁨<- */ int pdi_\u2069_3;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +
-+const char *s1 = "LRE\u202a"; /* PDF ->â¬<- */
++const char *s1 = "LRE\u202a"; /* PDF ->‬<- */
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
-+/* LRE ->âª<- */ const char *s2 = "PDF\u202c";
++/* LRE ->‪<- */ const char *s2 = "PDF\u202c";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +const char *s3 = "LRE\u202a"; int pdf_\u202c_5;
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 +int lre_\u202a; const char *s4 = "PDF\u202c";
 +/* { dg-warning "unpaired" "" { target *-*-* } .-1 } */
 diff --git a/libcpp/include/cpplib.h b/libcpp/include/cpplib.h
-index 176f8c5bbce..112b9c24751 100644
---- a/libcpp/include/cpplib.h
-+++ b/libcpp/include/cpplib.h
+--- a/libcpp/include/cpplib.h	2021-07-27 23:55:08.712307227 -0700
++++ b/libcpp/include/cpplib.h	2021-12-24 20:52:31.847651110 -0800
 @@ -318,6 +318,17 @@ enum cpp_main_search
    CMS_system,  /* Search the system INCLUDE path.  */
  };
@@ -1202,9 +1167,8 @@ index 176f8c5bbce..112b9c24751 100644
  
  /* Callback for header lookup for HEADER, which is the name of a
 diff --git a/libcpp/init.c b/libcpp/init.c
-index 5a424e23553..f9a8f5f088f 100644
---- a/libcpp/init.c
-+++ b/libcpp/init.c
+--- a/libcpp/init.c	2021-07-27 23:55:08.716307283 -0700
++++ b/libcpp/init.c	2021-12-24 20:52:31.847651110 -0800
 @@ -219,6 +219,7 @@ cpp_create_reader (enum c_lang lang, cpp
        = ENABLE_CANONICAL_SYSTEM_HEADERS;
    CPP_OPTION (pfile, ext_numeric_literals) = 1;
@@ -1214,9 +1178,8 @@ index 5a424e23553..f9a8f5f088f 100644
    /* Default CPP arithmetic to something sensible for the host for the
       benefit of dumb users like fix-header.  */
 diff --git a/libcpp/internal.h b/libcpp/internal.h
-index 8577cab6c83..0ce0246c5a2 100644
---- a/libcpp/internal.h
-+++ b/libcpp/internal.h
+--- a/libcpp/internal.h	2021-07-27 23:55:08.716307283 -0700
++++ b/libcpp/internal.h	2021-12-24 20:52:31.847651110 -0800
 @@ -597,6 +597,13 @@ struct cpp_reader
    /* Location identifying the main source file -- intended to be line
       zero of said file.  */
@@ -1232,9 +1195,8 @@ index 8577cab6c83..0ce0246c5a2 100644
  
  /* Character classes.  Based on the more primitive macros in safe-ctype.h.
 diff --git a/libcpp/lex.c b/libcpp/lex.c
-index fa2253d41c3..6a4fbce6030 100644
---- a/libcpp/lex.c
-+++ b/libcpp/lex.c
+--- a/libcpp/lex.c	2021-07-27 23:55:08.716307283 -0700
++++ b/libcpp/lex.c	2021-12-24 20:52:31.847651110 -0800
 @@ -1164,6 +1164,324 @@ _cpp_process_line_notes (cpp_reader *pfi
      }
  }
diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
index 4999c71b64..14b969a5e0 100644
--- a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
+++ b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-42574.patch
@@ -90,11 +90,10 @@ Signed-off-by: Pgowda <pgowda.cve@gmail.com>
  2 files changed, 257 insertions(+), 48 deletions(-)
  create mode 100644 gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
 
+
 diff --git a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
-new file mode 100644
-index 00000000000..298750a2a64
---- /dev/null
-+++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c
+--- a/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/c-c++-common/Wbidi-chars-ranges.c	2021-12-24 20:53:15.618905716 -0800
 @@ -0,0 +1,54 @@
 +/* PR preprocessor/103026 */
 +/* { dg-do compile } */
@@ -104,7 +103,7 @@ index 00000000000..298750a2a64
 +
 +int test_unpaired_bidi () {
 +    int isAdmin = 0;
-+    /*â® } â¦if (isAdmin)â© â¦ begin admins only */
++    /*‮ } ⁦if (isAdmin)⁩ ⁦ begin admins only */
 +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
 +#if 0
 +   { dg-begin-multiline-output "" }
@@ -117,7 +116,7 @@ index 00000000000..298750a2a64
 +#endif
 +
 +        __builtin_printf("You are an admin.\n");
-+    /* end admins only â® { â¦*/
++    /* end admins only ‮ { ⁦*/
 +/* { dg-warning "bidirectional" "" { target *-*-* } .-1 } */
 +#if 0
 +   { dg-begin-multiline-output "" }
@@ -133,7 +132,7 @@ index 00000000000..298750a2a64
 +    return 0;
 +}
 +
-+int LRE_âª_PDF_\u202c;
++int LRE_‪_PDF_\u202c;
 +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
 +#if 0
 +   { dg-begin-multiline-output "" }
@@ -142,7 +141,7 @@ index 00000000000..298750a2a64
 +   { dg-end-multiline-output "" }
 +#endif
 +
-+const char *s1 = "LRE_âª_PDF_\u202c";
++const char *s1 = "LRE_‪_PDF_\u202c";
 +/* { dg-warning "mismatch" "" { target *-*-* } .-1 } */
 +#if 0
 +   { dg-begin-multiline-output "" }
@@ -151,9 +150,8 @@ index 00000000000..298750a2a64
 +   { dg-end-multiline-output "" }
 +#endif
 diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 2421d6c0f40..94c36f0d014 100644
---- a/libcpp/lex.c
-+++ b/libcpp/lex.c
+--- a/libcpp/lex.c	2021-12-24 20:59:55.132097460 -0800
++++ b/libcpp/lex.c	2021-12-24 20:59:36.172420707 -0800
 @@ -1172,11 +1172,34 @@ namespace bidi {
    /* All the UTF-8 encodings of bidi characters start with E2.  */
    constexpr uchar utf8_start = 0xe2;
-- 
2.31.1

