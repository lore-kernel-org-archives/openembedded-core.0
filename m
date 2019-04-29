Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5E97D8F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:26:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2019 23:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,408,1549958400"; d="scan'208";a="146681137"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.129])
	by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2019 23:26:39 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 14:26:33 +0800
Message-Id: <20190429062636.2338-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] gcc: fix CVE-2018-18484
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
X-List-Received-Date: Mon, 29 Apr 2019 06:26:39 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc         |   1 +
 ...limit-to-libiberty-s-demangling-code.patch | 325 ++++++++++++++++++
 2 files changed, 326 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index 88a9df2049..fe9c7c3602 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -71,6 +71,7 @@ SRC_URI = "\
            file://0038-Re-introduce-spe-commandline-options.patch \
            file://0039-riscv-Disable-multilib-for-OE.patch \
            file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
+           file://0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch b/meta/recipes-devtools/gcc/gcc-8.3/0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch
new file mode 100644
index 0000000000..f3303b6858
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch
@@ -0,0 +1,325 @@
+From e1744e11b1c2b36f91a8847b61bafb8c5e7407ae Mon Sep 17 00:00:00 2001
+From: nickc <nickc@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 7 Dec 2018 10:33:30 +0000
+Subject: [PATCH] Add a recursion limit to libiberty's demangling code. The
+ limit is enabled by default, but can be disabled via a new demangling option.
+
+include	* demangle.h (DMGL_NO_RECURSE_LIMIT): Define.
+        (DEMANGLE_RECURSION_LIMIT): Define
+
+	PR 87681
+	PR 87675
+	PR 87636
+	PR 87350
+	PR 87335
+libiberty * cp-demangle.h (struct d_info): Add recursion_level field.
+	* cp-demangle.c (d_function_type): Add recursion counter.
+	If the recursion limit is reached and the check is not disabled,
+	then return with a failure result.
+	(cplus_demangle_init_info): Initialise the recursion_level field.
+        (d_demangle_callback): If the recursion limit is enabled, check
+	for a mangled string that is so long that there is not enough
+	stack space for the local arrays.
+        * cplus-dem.c (struct work): Add recursion_level field.
+	(squangle_mop_up): Set the numb and numk fields to zero.
+	(work_stuff_copy_to_from): Handle the case where a btypevec or
+	ktypevec field is NULL.
+	(demangle_nested_args): Add recursion counter.  If
+	the recursion limit is not disabled and reached, return with a
+	failure result.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@266886 138bc75d-0d04-0410-961f-82ee72b054a4
+
+CVE: CVE-2018-18484
+Upstream-Status: Backport [https://github.com/gcc-mirror/gcc/commit/03e51746ed98d9106803f6009ebd71ea670ad3b9]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ include/ChangeLog       |  5 +++++
+ include/demangle.h      | 11 +++++++++++
+ libiberty/ChangeLog     | 23 ++++++++++++++++++++++
+ libiberty/cp-demangle.c | 51 ++++++++++++++++++++++++++++++++++++++-----------
+ libiberty/cp-demangle.h |  3 +++
+ libiberty/cplus-dem.c   | 37 +++++++++++++++++++++++++++++++++--
+ 6 files changed, 117 insertions(+), 13 deletions(-)
+
+diff --git a/include/ChangeLog b/include/ChangeLog
+index 02ab336..88b0648 100644
+--- a/include/ChangeLog
++++ b/include/ChangeLog
+@@ -2,6 +2,11 @@
+ 
+ 	* GCC 8.3.0 released.
+ 
++2018-12-07  Nick Clifton  <nickc@redhat.com>
++
++	* demangle.h (DMGL_NO_RECURSE_LIMIT): Define.
++	(DEMANGLE_RECURSION_LIMIT): Define
++
+ 2018-07-26  Release Manager
+ 
+ 	* GCC 8.2.0 released.
+diff --git a/include/demangle.h b/include/demangle.h
+index b8d57cf..9bb8a19 100644
+--- a/include/demangle.h
++++ b/include/demangle.h
+@@ -68,6 +68,17 @@ extern "C" {
+ /* If none of these are set, use 'current_demangling_style' as the default. */
+ #define DMGL_STYLE_MASK (DMGL_AUTO|DMGL_GNU|DMGL_LUCID|DMGL_ARM|DMGL_HP|DMGL_EDG|DMGL_GNU_V3|DMGL_JAVA|DMGL_GNAT|DMGL_DLANG|DMGL_RUST)
+ 
++/* Disable a limit on the depth of recursion in mangled strings.
++   Note if this limit is disabled then stack exhaustion is possible when
++   demangling pathologically complicated strings.  Bug reports about stack
++   exhaustion when the option is enabled will be rejected.  */  
++#define DMGL_NO_RECURSE_LIMIT (1 << 18)	
++
++/* If DMGL_NO_RECURSE_LIMIT is not enabled, then this is the value used as
++   the maximum depth of recursion allowed.  It should be enough for any
++   real-world mangled name.  */
++#define DEMANGLE_RECURSION_LIMIT 1024
++  
+ /* Enumeration of possible demangling styles.
+ 
+    Lucid and ARM styles are still kept logically distinct, even though
+diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
+index 1dd05da..2f77038 100644
+--- a/libiberty/ChangeLog
++++ b/libiberty/ChangeLog
+@@ -9,6 +9,29 @@
+ 	(simple_object_copy_lto_debug_sections): Create file in binary
+ 	mode.
+ 
++2018-12-07  Nick Clifton  <nickc@redhat.com>
++
++	PR 87681
++	PR 87675
++	PR 87636
++	PR 87350
++	PR 87335
++	* cp-demangle.h (struct d_info): Add recursion_level field.
++	* cp-demangle.c (d_function_type): Add recursion counter.
++	If the recursion limit is reached and the check is not disabled,
++	then return with a failure result.
++	(cplus_demangle_init_info): Initialise the recursion_level field.
++	 (d_demangle_callback): If the recursion limit is enabled, check
++	for a mangled string that is so long that there is not enough
++	stack space for the local arrays.
++	 * cplus-dem.c (struct work): Add recursion_level field.
++	(squangle_mop_up): Set the numb and numk fields to zero.
++	(work_stuff_copy_to_from): Handle the case where a btypevec or
++	ktypevec field is NULL.
++	(demangle_nested_args): Add recursion counter.  If
++	the recursion limit is not disabled and reached, return with a
++	failure result.
++
+ 2018-07-26  Release Manager
+ 
+ 	* GCC 8.2.0 released.
+diff --git a/libiberty/cp-demangle.c b/libiberty/cp-demangle.c
+index 3f2a097..c374e46 100644
+--- a/libiberty/cp-demangle.c
++++ b/libiberty/cp-demangle.c
+@@ -2843,21 +2843,35 @@ d_ref_qualifier (struct d_info *di, struct demangle_component *sub)
+ static struct demangle_component *
+ d_function_type (struct d_info *di)
+ {
+-  struct demangle_component *ret;
++  struct demangle_component *ret = NULL;
+ 
+-  if (! d_check_char (di, 'F'))
+-    return NULL;
+-  if (d_peek_char (di) == 'Y')
++  if ((di->options & DMGL_NO_RECURSE_LIMIT) == 0)
+     {
+-      /* Function has C linkage.  We don't print this information.
+-	 FIXME: We should print it in verbose mode.  */
+-      d_advance (di, 1);
++      if (di->recursion_level > DEMANGLE_RECURSION_LIMIT)
++	/* FIXME: There ought to be a way to report
++	   that the recursion limit has been reached.  */
++	return NULL;
++
++      di->recursion_level ++;
+     }
+-  ret = d_bare_function_type (di, 1);
+-  ret = d_ref_qualifier (di, ret);
+ 
+-  if (! d_check_char (di, 'E'))
+-    return NULL;
++  if (d_check_char (di, 'F'))
++    {
++      if (d_peek_char (di) == 'Y')
++	{
++	  /* Function has C linkage.  We don't print this information.
++	     FIXME: We should print it in verbose mode.  */
++	  d_advance (di, 1);
++	}
++      ret = d_bare_function_type (di, 1);
++      ret = d_ref_qualifier (di, ret);
++      
++      if (! d_check_char (di, 'E'))
++	ret = NULL;
++    }
++
++  if ((di->options & DMGL_NO_RECURSE_LIMIT) == 0)
++    di->recursion_level --;
+   return ret;
+ }
+ 
+@@ -6188,6 +6202,7 @@ cplus_demangle_init_info (const char *mangled, int options, size_t len,
+   di->expansion = 0;
+   di->is_expression = 0;
+   di->is_conversion = 0;
++  di->recursion_level = 0;
+ }
+ 
+ /* Internal implementation for the demangler.  If MANGLED is a g++ v3 ABI
+@@ -6227,6 +6242,20 @@ d_demangle_callback (const char *mangled, int options,
+ 
+   cplus_demangle_init_info (mangled, options, strlen (mangled), &di);
+ 
++  /* PR 87675 - Check for a mangled string that is so long
++     that we do not have enough stack space to demangle it.  */
++  if (((options & DMGL_NO_RECURSE_LIMIT) == 0)
++      /* This check is a bit arbitrary, since what we really want to do is to
++	 compare the sizes of the di.comps and di.subs arrays against the
++	 amount of stack space remaining.  But there is no portable way to do
++	 this, so instead we use the recursion limit as a guide to the maximum
++	 size of the arrays.  */
++      && (unsigned long) di.num_comps > DEMANGLE_RECURSION_LIMIT)
++    {
++      /* FIXME: We need a way to indicate that a stack limit has been reached.  */
++      return 0;
++    }
++
+   {
+ #ifdef CP_DYNAMIC_ARRAYS
+     __extension__ struct demangle_component comps[di.num_comps];
+diff --git a/libiberty/cp-demangle.h b/libiberty/cp-demangle.h
+index 51b8a24..d87a830 100644
+--- a/libiberty/cp-demangle.h
++++ b/libiberty/cp-demangle.h
+@@ -122,6 +122,9 @@ struct d_info
+   /* Non-zero if we are parsing the type operand of a conversion
+      operator, but not when in an expression.  */
+   int is_conversion;
++  /* If DMGL_NO_RECURSE_LIMIT is not active then this is set to
++     the current recursion level.  */
++  unsigned int recursion_level;
+ };
+ 
+ /* To avoid running past the ending '\0', don't:
+diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
+index 6d58bd8..8b9646f 100644
+--- a/libiberty/cplus-dem.c
++++ b/libiberty/cplus-dem.c
+@@ -146,6 +146,7 @@ struct work_stuff
+   int *proctypevec;     /* Indices of currently processed remembered typevecs.  */
+   int proctypevec_size;
+   int nproctypes;
++  unsigned int recursion_level;
+ };
+ 
+ #define PRINT_ANSI_QUALIFIERS (work -> options & DMGL_ANSI)
+@@ -1292,12 +1293,14 @@ squangle_mop_up (struct work_stuff *work)
+       free ((char *) work -> btypevec);
+       work->btypevec = NULL;
+       work->bsize = 0;
++      work->numb = 0;
+     }
+   if (work -> ktypevec != NULL)
+     {
+       free ((char *) work -> ktypevec);
+       work->ktypevec = NULL;
+       work->ksize = 0;
++      work->numk = 0;
+     }
+ }
+ 
+@@ -1331,8 +1334,15 @@ work_stuff_copy_to_from (struct work_stuff *to, struct work_stuff *from)
+ 
+   for (i = 0; i < from->numk; i++)
+     {
+-      int len = strlen (from->ktypevec[i]) + 1;
++      int len;
++
++      if (from->ktypevec[i] == NULL)
++	{
++	  to->ktypevec[i] = NULL;
++	  continue;
++	}
+ 
++      len = strlen (from->ktypevec[i]) + 1;
+       to->ktypevec[i] = XNEWVEC (char, len);
+       memcpy (to->ktypevec[i], from->ktypevec[i], len);
+     }
+@@ -1342,8 +1352,15 @@ work_stuff_copy_to_from (struct work_stuff *to, struct work_stuff *from)
+ 
+   for (i = 0; i < from->numb; i++)
+     {
+-      int len = strlen (from->btypevec[i]) + 1;
++      int len;
++
++      if (from->btypevec[i] == NULL)
++	{
++	  to->btypevec[i] = NULL;
++	  continue;
++	}
+ 
++      len = strlen (from->btypevec[i]) + 1;
+       to->btypevec[i] = XNEWVEC (char , len);
+       memcpy (to->btypevec[i], from->btypevec[i], len);
+     }
+@@ -1401,6 +1418,7 @@ delete_non_B_K_work_stuff (struct work_stuff *work)
+ 
+       free ((char*) work->tmpl_argvec);
+       work->tmpl_argvec = NULL;
++      work->ntmpl_args = 0;
+     }
+   if (work->previous_argument)
+     {
+@@ -4477,6 +4495,7 @@ remember_Btype (struct work_stuff *work, const char *start,
+ }
+ 
+ /* Lose all the info related to B and K type codes. */
++
+ static void
+ forget_B_and_K_types (struct work_stuff *work)
+ {
+@@ -4502,6 +4521,7 @@ forget_B_and_K_types (struct work_stuff *work)
+ 	}
+     }
+ }
++
+ /* Forget the remembered types, but not the type vector itself.  */
+ 
+ static void
+@@ -4696,6 +4716,16 @@ demangle_nested_args (struct work_stuff *work, const char **mangled,
+   int result;
+   int saved_nrepeats;
+ 
++  if ((work->options & DMGL_NO_RECURSE_LIMIT) == 0)
++    {
++      if (work->recursion_level > DEMANGLE_RECURSION_LIMIT)
++	/* FIXME: There ought to be a way to report
++	   that the recursion limit has been reached.  */
++	return 0;
++
++      work->recursion_level ++;
++    }
++
+   /* The G++ name-mangling algorithm does not remember types on nested
+      argument lists, unless -fsquangling is used, and in that case the
+      type vector updated by remember_type is not used.  So, we turn
+@@ -4722,6 +4752,9 @@ demangle_nested_args (struct work_stuff *work, const char **mangled,
+   --work->forgetting_types;
+   work->nrepeats = saved_nrepeats;
+ 
++  if ((work->options & DMGL_NO_RECURSE_LIMIT) == 0)
++    --work->recursion_level;
++
+   return result;
+ }
+ 
+-- 
+2.7.4
+
-- 
2.20.1


