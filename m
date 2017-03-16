Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E4333775CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489655753; x=1521191753;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=y4fkWhCdlyPLmIaQLXuBXOOfbMim+HkLPyXSmOJrAGU=;
	b=pCle09I8ZYHwnGYYs/brKo6UTw+6SmQTY7pgz6qhhv953PWQBdM6/aS2
	N41CwZB9yy7toVHPYgIWkyT71miO1Q==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2017 02:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="76043296"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 16 Mar 2017 02:15:52 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A9EB82C8001;
	Thu, 16 Mar 2017 02:15:47 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Mar 2017 11:15:35 +0200
Message-Id: <15f002c438a2609fa61fe8f54ab49c4e8f880638.1489655518.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1489655518.git.jussi.kukkonen@intel.com>
References: <cover.1489655518.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] gcc: Remove unused patch
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
X-List-Received-Date: Thu, 16 Mar 2017 09:15:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CVE-2016-4490 applied to gcc < 6.1.1, our version is 6.3

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../gcc/gcc-6.3/CVE-2016-4490.patch                | 290 ---------------------
 1 file changed, 290 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch b/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch
deleted file mode 100644
index f32e91d..0000000
--- a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-4490.patch
+++ /dev/null
@@ -1,290 +0,0 @@
-From 7d235b1b5ea35352c54957ef5530d9a02c46962f Mon Sep 17 00:00:00 2001
-From: bernds <bernds@138bc75d-0d04-0410-961f-82ee72b054a4>
-Date: Mon, 2 May 2016 17:06:40 +0000
-Subject: [PATCH] =?UTF-8?q?Demangler=20integer=20overflow=20fixes=20from?=
- =?UTF-8?q?=20Marcel=20B=C3=B6hme.?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-	PR c++/70498
-	* cp-demangle.c: Parse numbers as integer instead of long to avoid
-	overflow after sanity checks. Include <limits.h> if available.
-	(INT_MAX): Define if necessary.
-	(d_make_template_param): Takes integer argument instead of long.
-	(d_make_function_param): Likewise.
-	(d_append_num): Likewise.
-	(d_identifier): Likewise.
-	(d_number): Parse as and return integer.
-	(d_compact_number): Handle overflow.
-	(d_source_name): Change variable type to integer for parsed number.
-	(d_java_resource): Likewise.
-	(d_special_name): Likewise.
-	(d_discriminator): Likewise.
-	(d_unnamed_type): Likewise.
-	* testsuite/demangle-expected: Add regression test cases.
-
-
-
-git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@235767 138bc75d-0d04-0410-961f-82ee72b054a4
-
-Upstream-Status: Backport
-CVE:  CVE-2016-4490
-[Yocto #9632]
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- libiberty/ChangeLog                   | 19 +++++++++++++
- libiberty/cp-demangle.c               | 52 ++++++++++++++++++++---------------
- libiberty/testsuite/demangle-expected | 14 ++++++++--
- 3 files changed, 61 insertions(+), 24 deletions(-)
-
-Index: git/libiberty/ChangeLog
-===================================================================
---- git.orig/libiberty/ChangeLog
-+++ git/libiberty/ChangeLog
-@@ -1,3 +1,22 @@
-+2016-05-02  Marcel Böhme  <boehme.marcel@gmail.com>
-+
-+   PR c++/70498
-+   * cp-demangle.c: Parse numbers as integer instead of long to avoid
-+   overflow after sanity checks. Include <limits.h> if available.
-+   (INT_MAX): Define if necessary.
-+   (d_make_template_param): Takes integer argument instead of long.
-+   (d_make_function_param): Likewise.
-+   (d_append_num): Likewise.
-+   (d_identifier): Likewise.
-+   (d_number): Parse as and return integer.
-+   (d_compact_number): Handle overflow.
-+   (d_source_name): Change variable type to integer for parsed number.
-+   (d_java_resource): Likewise.
-+   (d_special_name): Likewise.
-+   (d_discriminator): Likewise.
-+   (d_unnamed_type): Likewise.
-+   * testsuite/demangle-expected: Add regression test cases.
-+
- 2016-04-27  Release Manager
- 
- 	* GCC 6.1.0 released.
-Index: git/libiberty/cp-demangle.c
-===================================================================
---- git.orig/libiberty/cp-demangle.c
-+++ git/libiberty/cp-demangle.c
-@@ -128,6 +128,13 @@ extern char *alloca ();
- # endif /* alloca */
- #endif /* HAVE_ALLOCA_H */
- 
-+#ifdef HAVE_LIMITS_H
-+#include <limits.h>
-+#endif
-+#ifndef INT_MAX
-+# define INT_MAX       (int)(((unsigned int) ~0) >> 1)          /* 0x7FFFFFFF */
-+#endif
-+
- #include "ansidecl.h"
- #include "libiberty.h"
- #include "demangle.h"
-@@ -398,7 +405,7 @@ d_make_dtor (struct d_info *, enum gnu_v
-              struct demangle_component *);
- 
- static struct demangle_component *
--d_make_template_param (struct d_info *, long);
-+d_make_template_param (struct d_info *, int);
- 
- static struct demangle_component *
- d_make_sub (struct d_info *, const char *, int);
-@@ -421,9 +428,9 @@ static struct demangle_component *d_unqu
- 
- static struct demangle_component *d_source_name (struct d_info *);
- 
--static long d_number (struct d_info *);
-+static int d_number (struct d_info *);
- 
--static struct demangle_component *d_identifier (struct d_info *, long);
-+static struct demangle_component *d_identifier (struct d_info *, int);
- 
- static struct demangle_component *d_operator_name (struct d_info *);
- 
-@@ -1119,7 +1126,7 @@ d_make_dtor (struct d_info *di, enum gnu
- /* Add a new template parameter.  */
- 
- static struct demangle_component *
--d_make_template_param (struct d_info *di, long i)
-+d_make_template_param (struct d_info *di, int i)
- {
-   struct demangle_component *p;
- 
-@@ -1135,7 +1142,7 @@ d_make_template_param (struct d_info *di
- /* Add a new function parameter.  */
- 
- static struct demangle_component *
--d_make_function_param (struct d_info *di, long i)
-+d_make_function_param (struct d_info *di, int i)
- {
-   struct demangle_component *p;
- 
-@@ -1620,7 +1627,7 @@ d_unqualified_name (struct d_info *di)
- static struct demangle_component *
- d_source_name (struct d_info *di)
- {
--  long len;
-+  int len;
-   struct demangle_component *ret;
- 
-   len = d_number (di);
-@@ -1633,12 +1640,12 @@ d_source_name (struct d_info *di)
- 
- /* number ::= [n] <(non-negative decimal integer)>  */
- 
--static long
-+static int
- d_number (struct d_info *di)
- {
-   int negative;
-   char peek;
--  long ret;
-+  int ret;
- 
-   negative = 0;
-   peek = d_peek_char (di);
-@@ -1681,7 +1688,7 @@ d_number_component (struct d_info *di)
- /* identifier ::= <(unqualified source code identifier)>  */
- 
- static struct demangle_component *
--d_identifier (struct d_info *di, long len)
-+d_identifier (struct d_info *di, int len)
- {
-   const char *name;
- 
-@@ -1702,7 +1709,7 @@ d_identifier (struct d_info *di, long le
-   /* Look for something which looks like a gcc encoding of an
-      anonymous namespace, and replace it with a more user friendly
-      name.  */
--  if (len >= (long) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
-+  if (len >= (int) ANONYMOUS_NAMESPACE_PREFIX_LEN + 2
-       && memcmp (name, ANONYMOUS_NAMESPACE_PREFIX,
- 		 ANONYMOUS_NAMESPACE_PREFIX_LEN) == 0)
-     {
-@@ -1870,7 +1877,7 @@ d_java_resource (struct d_info *di)
- {
-   struct demangle_component *p = NULL;
-   struct demangle_component *next = NULL;
--  long len, i;
-+  int len, i;
-   char c;
-   const char *str;
- 
-@@ -2012,7 +2019,7 @@ d_special_name (struct d_info *di)
- 	case 'C':
- 	  {
- 	    struct demangle_component *derived_type;
--	    long offset;
-+	    int offset;
- 	    struct demangle_component *base_type;
- 
- 	    derived_type = cplus_demangle_type (di);
-@@ -2946,10 +2953,10 @@ d_pointer_to_member_type (struct d_info
- 
- /* <non-negative number> _ */
- 
--static long
-+static int
- d_compact_number (struct d_info *di)
- {
--  long num;
-+  int num;
-   if (d_peek_char (di) == '_')
-     num = 0;
-   else if (d_peek_char (di) == 'n')
-@@ -2957,7 +2964,7 @@ d_compact_number (struct d_info *di)
-   else
-     num = d_number (di) + 1;
- 
--  if (! d_check_char (di, '_'))
-+  if (num < 0 || ! d_check_char (di, '_'))
-     return -1;
-   return num;
- }
-@@ -2969,7 +2976,7 @@ d_compact_number (struct d_info *di)
- static struct demangle_component *
- d_template_param (struct d_info *di)
- {
--  long param;
-+  int param;
- 
-   if (! d_check_char (di, 'T'))
-     return NULL;
-@@ -3171,9 +3178,10 @@ d_expression_1 (struct d_info *di)
- 	}
-       else
- 	{
--	  index = d_compact_number (di) + 1;
--	  if (index == 0)
-+	  index = d_compact_number (di);
-+	  if (index == INT_MAX || index == -1)
- 	    return NULL;
-+	  index ++;
- 	}
-       return d_make_function_param (di, index);
-     }
-@@ -3502,7 +3510,7 @@ d_local_name (struct d_info *di)
- static int
- d_discriminator (struct d_info *di)
- {
--  long discrim;
-+  int discrim;
- 
-   if (d_peek_char (di) != '_')
-     return 1;
-@@ -3558,7 +3566,7 @@ static struct demangle_component *
- d_unnamed_type (struct d_info *di)
- {
-   struct demangle_component *ret;
--  long num;
-+  int num;
- 
-   if (! d_check_char (di, 'U'))
-     return NULL;
-@@ -4086,10 +4094,10 @@ d_append_string (struct d_print_info *dp
- }
- 
- static inline void
--d_append_num (struct d_print_info *dpi, long l)
-+d_append_num (struct d_print_info *dpi, int l)
- {
-   char buf[25];
--  sprintf (buf,"%ld", l);
-+  sprintf (buf,"%d", l);
-   d_append_string (dpi, buf);
- }
- 
-Index: git/libiberty/testsuite/demangle-expected
-===================================================================
---- git.orig/libiberty/testsuite/demangle-expected
-+++ git/libiberty/testsuite/demangle-expected
-@@ -4422,12 +4422,22 @@ void baz<int>(A<sizeof (foo((int)(), (fl
- _Z3fooI1FEN1XIXszdtcl1PclcvT__EEE5arrayEE4TypeEv
- X<sizeof ((P(((F)())())).array)>::Type foo<F>()
- #
--# Tests a use-after-free problem
-+# Tests a use-after-free problem PR70481
- 
- _Q.__0
- ::Q.(void)
- #
--# Tests a use-after-free problem
-+# Tests a use-after-free problem PR70481
- 
- _Q10-__9cafebabe.
- cafebabe.::-(void)
-+#
-+# Tests integer overflow problem PR70492
-+
-+__vt_90000000000cafebabe
-+__vt_90000000000cafebabe
-+#
-+# Tests write access violation PR70498
-+
-+_Z80800000000000000000000
-+_Z80800000000000000000000
-- 
2.1.4


