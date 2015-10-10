Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CA2B27701C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 07:34:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9A7YmXL027518
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Oct 2015 00:34:54 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sat, 10 Oct 2015 00:34:48 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 10 Oct 2015 15:27:07 +0800
Message-ID: <1444462027-27197-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH] gcc-4.x: fix wrong warning when using the universal zero initializer {0}
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
X-List-Received-Date: Sat, 10 Oct 2015 07:35:09 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When I upgrade efivar to 0.21, it fails to compile with error messages:

| linux.c:850:9: error: missing braces around initializer
[-Werror=missing-braces]
|   struct ifreq ifr = { 0, };
|          ^

It is a known issue of gcc. Backport patch from

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119

to fix wrong warning when using the universal zero initializer {0}.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
 ...-gcc-483-universal-initializer-no-warning.patch | 107 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 ...-gcc-483-universal-initializer-no-warning.patch | 107 +++++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 6a2454d..b3e1c33 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
     file://0047-repomembug.patch \
     file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
     file://target-gcc-includedir.patch \
+    file://0051-gcc-483-universal-initializer-no-warning.patch \
 "
 SRC_URI[md5sum] = "5a84a30839b2aca22a2d723de2a626ec"
 SRC_URI[sha256sum] = "4a80aa23798b8e9b5793494b8c976b39b8d9aa2e53cd5ed5534aff662a7f8695"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch b/meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch
new file mode 100644
index 0000000..fde227b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch
@@ -0,0 +1,107 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
+wrong warning when using the universal zero initializer {0}
+
+Backported to GCC 4.8.3
+
+Subject: 2014-06-05  S. Gilles  <sgilles@terpmail.umd.edu>
+X-Git-Url: http://repo.or.cz/w/official-gcc.git/commitdiff_plain/95cdf3fdf2d440eb7775def8e35ab970651c33d9?hp=14a3093e9943937cbc63dfbf4d51ca60f8325b29
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@211289 138bc75d-0d04-0410-961f-82ee72b054a4
+
+--- gcc-4.8.3.org/gcc/c/c-typeck.c	2014-08-03 20:52:09.257042137 +0200
++++ gcc-4.8.3/gcc/c/c-typeck.c	2014-08-03 20:57:10.645042614 +0200
+@@ -62,9 +62,9 @@
+    if expr.original_code == SIZEOF_EXPR.  */
+ tree c_last_sizeof_arg;
+ 
+-/* Nonzero if we've already printed a "missing braces around initializer"
+-   message within this initializer.  */
+-static int missing_braces_mentioned;
++/* Nonzero if we might need to print a "missing braces around
++   initializer" message within this initializer.  */
++static int found_missing_braces;
+ 
+ static int require_constant_value;
+ static int require_constant_elements;
+@@ -6379,6 +6379,9 @@
+ /* 1 if this constructor is erroneous so far.  */
+ static int constructor_erroneous;
+ 
++/* 1 if this constructor is the universal zero initializer { 0 }.  */
++static int constructor_zeroinit;
++
+ /* Structure for managing pending initializer elements, organized as an
+    AVL tree.  */
+ 
+@@ -6540,7 +6543,7 @@
+   constructor_stack = 0;
+   constructor_range_stack = 0;
+ 
+-  missing_braces_mentioned = 0;
++  found_missing_braces = 0;
+ 
+   spelling_base = 0;
+   spelling_size = 0;
+@@ -6635,6 +6638,7 @@
+   constructor_type = type;
+   constructor_incremental = 1;
+   constructor_designated = 0;
++  constructor_zeroinit = 1;
+   designator_depth = 0;
+   designator_erroneous = 0;
+ 
+@@ -6832,11 +6836,8 @@
+ 	set_nonincremental_init (braced_init_obstack);
+     }
+ 
+-  if (implicit == 1 && warn_missing_braces && !missing_braces_mentioned)
+-    {
+-      missing_braces_mentioned = 1;
+-      warning_init (OPT_Wmissing_braces, "missing braces around initializer");
+-    }
++  if (implicit == 1)
++    found_missing_braces = 1;
+ 
+   if (TREE_CODE (constructor_type) == RECORD_TYPE
+ 	   || TREE_CODE (constructor_type) == UNION_TYPE)
+@@ -6969,16 +6970,23 @@
+ 	}
+     }
+ 
++  if (vec_safe_length (constructor_elements) != 1)
++    constructor_zeroinit = 0;
++
++  /* Warn when some structs are initialized with direct aggregation.  */
++  if (!implicit && found_missing_braces && warn_missing_braces
++      && !constructor_zeroinit)
++    {
++      warning_init (OPT_Wmissing_braces,
++		    "missing braces around initializer");
++    }
++
+   /* Warn when some struct elements are implicitly initialized to zero.  */
+   if (warn_missing_field_initializers
+       && constructor_type
+       && TREE_CODE (constructor_type) == RECORD_TYPE
+       && constructor_unfilled_fields)
+     {
+-	bool constructor_zeroinit =
+-	 (vec_safe_length (constructor_elements) == 1
+-	  && integer_zerop ((*constructor_elements)[0].value));
+-
+ 	/* Do not warn for flexible array members or zero-length arrays.  */
+ 	while (constructor_unfilled_fields
+ 	       && (!DECL_SIZE (constructor_unfilled_fields)
+@@ -8093,6 +8101,9 @@
+   designator_depth = 0;
+   designator_erroneous = 0;
+ 
++  if (!implicit && value.value && !integer_zerop (value.value))
++    constructor_zeroinit = 0;
++
+   /* Handle superfluous braces around string cst as in
+      char x[] = {"foo"}; */
+   if (string_flag
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 691ba5f..95b553c 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -80,6 +80,7 @@ SRC_URI = "\
     file://0062-Use-SYSTEMLIBS_DIR-replacement-instead-of-hardcoding.patch \
     file://0063-nativesdk-gcc-support.patch \
     file://0064-handle-target-sysroot-multilib.patch \
+    file://0065-gcc-483-universal-initializer-no-warning.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch b/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch
new file mode 100644
index 0000000..fde227b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch
@@ -0,0 +1,107 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+Fix for https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119
+wrong warning when using the universal zero initializer {0}
+
+Backported to GCC 4.8.3
+
+Subject: 2014-06-05  S. Gilles  <sgilles@terpmail.umd.edu>
+X-Git-Url: http://repo.or.cz/w/official-gcc.git/commitdiff_plain/95cdf3fdf2d440eb7775def8e35ab970651c33d9?hp=14a3093e9943937cbc63dfbf4d51ca60f8325b29
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@211289 138bc75d-0d04-0410-961f-82ee72b054a4
+
+--- gcc-4.8.3.org/gcc/c/c-typeck.c	2014-08-03 20:52:09.257042137 +0200
++++ gcc-4.8.3/gcc/c/c-typeck.c	2014-08-03 20:57:10.645042614 +0200
+@@ -62,9 +62,9 @@
+    if expr.original_code == SIZEOF_EXPR.  */
+ tree c_last_sizeof_arg;
+ 
+-/* Nonzero if we've already printed a "missing braces around initializer"
+-   message within this initializer.  */
+-static int missing_braces_mentioned;
++/* Nonzero if we might need to print a "missing braces around
++   initializer" message within this initializer.  */
++static int found_missing_braces;
+ 
+ static int require_constant_value;
+ static int require_constant_elements;
+@@ -6379,6 +6379,9 @@
+ /* 1 if this constructor is erroneous so far.  */
+ static int constructor_erroneous;
+ 
++/* 1 if this constructor is the universal zero initializer { 0 }.  */
++static int constructor_zeroinit;
++
+ /* Structure for managing pending initializer elements, organized as an
+    AVL tree.  */
+ 
+@@ -6540,7 +6543,7 @@
+   constructor_stack = 0;
+   constructor_range_stack = 0;
+ 
+-  missing_braces_mentioned = 0;
++  found_missing_braces = 0;
+ 
+   spelling_base = 0;
+   spelling_size = 0;
+@@ -6635,6 +6638,7 @@
+   constructor_type = type;
+   constructor_incremental = 1;
+   constructor_designated = 0;
++  constructor_zeroinit = 1;
+   designator_depth = 0;
+   designator_erroneous = 0;
+ 
+@@ -6832,11 +6836,8 @@
+ 	set_nonincremental_init (braced_init_obstack);
+     }
+ 
+-  if (implicit == 1 && warn_missing_braces && !missing_braces_mentioned)
+-    {
+-      missing_braces_mentioned = 1;
+-      warning_init (OPT_Wmissing_braces, "missing braces around initializer");
+-    }
++  if (implicit == 1)
++    found_missing_braces = 1;
+ 
+   if (TREE_CODE (constructor_type) == RECORD_TYPE
+ 	   || TREE_CODE (constructor_type) == UNION_TYPE)
+@@ -6969,16 +6970,23 @@
+ 	}
+     }
+ 
++  if (vec_safe_length (constructor_elements) != 1)
++    constructor_zeroinit = 0;
++
++  /* Warn when some structs are initialized with direct aggregation.  */
++  if (!implicit && found_missing_braces && warn_missing_braces
++      && !constructor_zeroinit)
++    {
++      warning_init (OPT_Wmissing_braces,
++		    "missing braces around initializer");
++    }
++
+   /* Warn when some struct elements are implicitly initialized to zero.  */
+   if (warn_missing_field_initializers
+       && constructor_type
+       && TREE_CODE (constructor_type) == RECORD_TYPE
+       && constructor_unfilled_fields)
+     {
+-	bool constructor_zeroinit =
+-	 (vec_safe_length (constructor_elements) == 1
+-	  && integer_zerop ((*constructor_elements)[0].value));
+-
+ 	/* Do not warn for flexible array members or zero-length arrays.  */
+ 	while (constructor_unfilled_fields
+ 	       && (!DECL_SIZE (constructor_unfilled_fields)
+@@ -8093,6 +8101,9 @@
+   designator_depth = 0;
+   designator_erroneous = 0;
+ 
++  if (!implicit && value.value && !integer_zerop (value.value))
++    constructor_zeroinit = 0;
++
+   /* Handle superfluous braces around string cst as in
+      char x[] = {"foo"}; */
+   if (string_flag
-- 
2.6.1


