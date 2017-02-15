Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75B1C77250
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:17:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1F9H9uM003691
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:17:10 -0800
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Wed, 15 Feb 2017 01:17:07 -0800
From: Yuanjie Huang <yuanjie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Feb 2017 01:17:07 -0800
Message-ID: <20170215091707.34181-1-yuanjie.huang@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] gcc: Fix CVE-2016-6131 in libiberty
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
X-List-Received-Date: Wed, 15 Feb 2017 09:17:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

[NVD] -- https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6131

The demangler in GNU Libiberty allows remote attackers to cause a denial
of service (infinite loop, stack overflow, and crash) via a cycle in the
references of remembered mangled types.

[BZ #71696] -- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71696

2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>

	PR c++/71696
	* cplus-dem.c: Prevent infinite recursion when there is a cycle
	in the referencing of remembered mangled types.
	(work_stuff): New stack to keep track of the remembered mangled
	types that are currently being processed.
	(push_processed_type): New method to push currently processed
	remembered type onto the stack.
	(pop_processed_type): New method to pop currently processed
	remembered type from the stack.
	(work_stuff_copy_to_from): Copy values of new variables.
	(delete_non_B_K_work_stuff): Free stack memory.
	(demangle_args): Push/Pop currently processed remembered type.
	(do_type): Do not demangle a cyclic reference and push/pop
	referenced remembered type.

cherry-picked from commit of
git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239143 138bc75d-0d04-0410-961f-82ee72b054a4

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-5.4.inc              |   1 +
 .../gcc/gcc-5.4/CVE-2016-6131.patch                | 251 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-6.3.inc              |   4 +-
 .../gcc/gcc-6.3/CVE-2016-6131.patch                | 251 +++++++++++++++++++++
 4 files changed, 506 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.4.inc b/meta/recipes-devtools/gcc/gcc-5.4.inc
index 338530f..b769675 100644
--- a/meta/recipes-devtools/gcc/gcc-5.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.4.inc
@@ -89,6 +89,7 @@ SRC_URI = "\
            file://0057-unwind-fix-for-musl.patch \
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
            file://0059-libgcc-use-ldflags.patch \
+           file://CVE-2016-6131.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch b/meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
new file mode 100644
index 0000000..ca4f6b4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
@@ -0,0 +1,251 @@
+From b3f6b32165d3f437bd0ac6269c3c499b68ecf036 Mon Sep 17 00:00:00 2001
+From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 4 Aug 2016 16:53:18 +0000
+Subject: [PATCH] Fix for PR71696 in Libiberty Demangler
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[BZ #71696] -- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71696
+
+2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>
+
+	PR c++/71696
+	* cplus-dem.c: Prevent infinite recursion when there is a cycle
+	in the referencing of remembered mangled types.
+	(work_stuff): New stack to keep track of the remembered mangled
+	types that are currently being processed.
+	(push_processed_type): New method to push currently processed
+	remembered type onto the stack.
+	(pop_processed_type): New method to pop currently processed
+	remembered type from the stack.
+	(work_stuff_copy_to_from): Copy values of new variables.
+	(delete_non_B_K_work_stuff): Free stack memory.
+	(demangle_args): Push/Pop currently processed remembered type.
+	(do_type): Do not demangle a cyclic reference and push/pop
+	referenced remembered type.
+
+cherry-picked from commit of
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239143 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-status: Backport [master]
+CVE: CVE-2016-6131
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ libiberty/ChangeLog                   | 17 ++++++++
+ libiberty/cplus-dem.c                 | 78 ++++++++++++++++++++++++++++++++---
+ libiberty/testsuite/demangle-expected | 18 ++++++++
+ 3 files changed, 108 insertions(+), 5 deletions(-)
+
+diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
+index 9859ad3..7939480 100644
+--- a/libiberty/ChangeLog
++++ b/libiberty/ChangeLog
+@@ -1,3 +1,20 @@
++2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>
++
++	PR c++/71696
++	* cplus-dem.c: Prevent infinite recursion when there is a cycle
++	in the referencing of remembered mangled types.
++	(work_stuff): New stack to keep track of the remembered mangled
++	types that are currently being processed.
++	(push_processed_type): New method to push currently processed
++	remembered type onto the stack.
++	(pop_processed_type): New method to pop currently processed
++	remembered type from the stack.
++	(work_stuff_copy_to_from): Copy values of new variables.
++	(delete_non_B_K_work_stuff): Free stack memory.
++	(demangle_args): Push/Pop currently processed remembered type.
++	(do_type): Do not demangle a cyclic reference and push/pop
++	referenced remembered type.
++
+ 2016-06-03  Release Manager
+ 
+ 	* GCC 5.4.0 released.
+diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
+index 7514e57..f21e630 100644
+--- a/libiberty/cplus-dem.c
++++ b/libiberty/cplus-dem.c
+@@ -144,6 +144,9 @@ struct work_stuff
+   string* previous_argument; /* The last function argument demangled.  */
+   int nrepeats;         /* The number of times to repeat the previous
+ 			   argument.  */
++  int *proctypevec;     /* Indices of currently processed remembered typevecs.  */
++  int proctypevec_size;
++  int nproctypes;
+ };
+ 
+ #define PRINT_ANSI_QUALIFIERS (work -> options & DMGL_ANSI)
+@@ -435,6 +438,10 @@ iterate_demangle_function (struct work_stuff *,
+ 
+ static void remember_type (struct work_stuff *, const char *, int);
+ 
++static void push_processed_type (struct work_stuff *, int);
++
++static void pop_processed_type (struct work_stuff *);
++
+ static void remember_Btype (struct work_stuff *, const char *, int, int);
+ 
+ static int register_Btype (struct work_stuff *);
+@@ -1301,6 +1308,10 @@ work_stuff_copy_to_from (struct work_stuff *to, struct work_stuff *from)
+       memcpy (to->btypevec[i], from->btypevec[i], len);
+     }
+ 
++  if (from->proctypevec)
++    to->proctypevec =
++      XDUPVEC (int, from->proctypevec, from->proctypevec_size);
++
+   if (from->ntmpl_args)
+     to->tmpl_argvec = XNEWVEC (char *, from->ntmpl_args);
+ 
+@@ -1329,11 +1340,17 @@ delete_non_B_K_work_stuff (struct work_stuff *work)
+   /* Discard the remembered types, if any.  */
+ 
+   forget_types (work);
+-  if (work -> typevec != NULL)
++  if (work->typevec != NULL)
+     {
+-      free ((char *) work -> typevec);
+-      work -> typevec = NULL;
+-      work -> typevec_size = 0;
++      free ((char *) work->typevec);
++      work->typevec = NULL;
++      work->typevec_size = 0;
++    }
++  if (work->proctypevec != NULL)
++    {
++      free (work->proctypevec);
++      work->proctypevec = NULL;
++      work->proctypevec_size = 0;
+     }
+   if (work->tmpl_argvec)
+     {
+@@ -3552,6 +3569,8 @@ static int
+ do_type (struct work_stuff *work, const char **mangled, string *result)
+ {
+   int n;
++  int i;
++  int is_proctypevec;
+   int done;
+   int success;
+   string decl;
+@@ -3564,6 +3583,7 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+ 
+   done = 0;
+   success = 1;
++  is_proctypevec = 0;
+   while (success && !done)
+     {
+       int member;
+@@ -3616,8 +3636,15 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+ 	      success = 0;
+ 	    }
+ 	  else
++	    for (i = 0; i < work->nproctypes; i++)
++	      if (work -> proctypevec [i] == n)
++	        success = 0;
++
++	  if (success)
+ 	    {
+-	      remembered_type = work -> typevec[n];
++	      is_proctypevec = 1;
++	      push_processed_type (work, n);
++	      remembered_type = work->typevec[n];
+ 	      mangled = &remembered_type;
+ 	    }
+ 	  break;
+@@ -3840,6 +3867,9 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+     string_delete (result);
+   string_delete (&decl);
+ 
++  if (is_proctypevec)
++    pop_processed_type (work);
++
+   if (success)
+     /* Assume an integral type, if we're not sure.  */
+     return (int) ((tk == tk_none) ? tk_integral : tk);
+@@ -4252,6 +4282,41 @@ do_arg (struct work_stuff *work, const char **mangled, string *result)
+ }
+ 
+ static void
++push_processed_type (struct work_stuff *work, int typevec_index)
++{
++  if (work->nproctypes >= work->proctypevec_size)
++    {
++      if (!work->proctypevec_size)
++	{
++	  work->proctypevec_size = 4;
++	  work->proctypevec = XNEWVEC (int, work->proctypevec_size);
++	}
++      else
++	{
++	  if (work->proctypevec_size < 16)
++	    /* Double when small.  */
++	    work->proctypevec_size *= 2;
++	  else
++	    {
++	      /* Grow slower when large.  */
++	      if (work->proctypevec_size > (INT_MAX / 3) * 2)
++                xmalloc_failed (INT_MAX);
++              work->proctypevec_size = (work->proctypevec_size * 3 / 2);
++	    }
++          work->proctypevec
++            = XRESIZEVEC (int, work->proctypevec, work->proctypevec_size);
++	}
++    }
++    work->proctypevec [work->nproctypes++] = typevec_index;
++}
++
++static void
++pop_processed_type (struct work_stuff *work)
++{
++  work->nproctypes--;
++}
++
++static void
+ remember_type (struct work_stuff *work, const char *start, int len)
+ {
+   char *tem;
+@@ -4515,10 +4580,13 @@ demangle_args (struct work_stuff *work, const char **mangled,
+ 		{
+ 		  string_append (declp, ", ");
+ 		}
++	      push_processed_type (work, t);
+ 	      if (!do_arg (work, &tem, &arg))
+ 		{
++		  pop_processed_type (work);
+ 		  return (0);
+ 		}
++	      pop_processed_type (work);
+ 	      if (PRINT_ARG_TYPES)
+ 		{
+ 		  string_appends (declp, &arg);
+diff --git a/libiberty/testsuite/demangle-expected b/libiberty/testsuite/demangle-expected
+index 1d8b771..d690b23 100644
+--- a/libiberty/testsuite/demangle-expected
++++ b/libiberty/testsuite/demangle-expected
+@@ -4429,3 +4429,21 @@ __vt_90000000000cafebabe
+ 
+ _Z80800000000000000000000
+ _Z80800000000000000000000
++#
++# Tests write access violation PR70926
++
++0__Ot2m02R5T0000500000
++0__Ot2m02R5T0000500000
++#
++
++0__GT50000000000_
++0__GT50000000000_
++#
++
++__t2m05B500000000000000000_
++__t2m05B500000000000000000_
++#
++# Tests stack overflow PR71696
++
++__10%0__S4_0T0T0
++%0<>::%0(%0<>)
+-- 
+2.9.3
+
diff --git a/meta/recipes-devtools/gcc/gcc-6.3.inc b/meta/recipes-devtools/gcc/gcc-6.3.inc
index 0f1b88b..a8fca56 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -81,7 +81,9 @@ SRC_URI = "\
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            ${BACKPORTS} \
 "
-BACKPORTS = ""
+BACKPORTS = "\
+           file://CVE-2016-6131.patch \
+"
 SRC_URI[md5sum] = "677a7623c7ef6ab99881bc4e048debb6"
 SRC_URI[sha256sum] = "f06ae7f3f790fbf0f018f6d40e844451e6bc3b7bc96e128e63b09825c1f8b29f"
 
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch b/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
new file mode 100644
index 0000000..f189c60
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
@@ -0,0 +1,251 @@
+From 59a0e4bd8391962f62600ae3ac95ab0fba74d464 Mon Sep 17 00:00:00 2001
+From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 4 Aug 2016 16:53:18 +0000
+Subject: [PATCH] Fix for PR71696 in Libiberty Demangler
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[BZ #71696] -- https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71696
+
+2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>
+
+	PR c++/71696
+	* cplus-dem.c: Prevent infinite recursion when there is a cycle
+	in the referencing of remembered mangled types.
+	(work_stuff): New stack to keep track of the remembered mangled
+	types that are currently being processed.
+	(push_processed_type): New method to push currently processed
+	remembered type onto the stack.
+	(pop_processed_type): New method to pop currently processed
+	remembered type from the stack.
+	(work_stuff_copy_to_from): Copy values of new variables.
+	(delete_non_B_K_work_stuff): Free stack memory.
+	(demangle_args): Push/Pop currently processed remembered type.
+	(do_type): Do not demangle a cyclic reference and push/pop
+	referenced remembered type.
+
+cherry-picked from commit of
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@239143 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-status: Backport [master]
+CVE: CVE-2016-6131
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ libiberty/ChangeLog                   | 17 ++++++++
+ libiberty/cplus-dem.c                 | 78 ++++++++++++++++++++++++++++++++---
+ libiberty/testsuite/demangle-expected | 18 ++++++++
+ 3 files changed, 108 insertions(+), 5 deletions(-)
+
+diff --git a/libiberty/ChangeLog b/libiberty/ChangeLog
+index 240138f..adf1d72 100644
+--- a/libiberty/ChangeLog
++++ b/libiberty/ChangeLog
+@@ -1,3 +1,20 @@
++2016-08-04  Marcel Böhme  <boehme.marcel@gmail.com>
++
++	PR c++/71696
++	* cplus-dem.c: Prevent infinite recursion when there is a cycle
++	in the referencing of remembered mangled types.
++	(work_stuff): New stack to keep track of the remembered mangled
++	types that are currently being processed.
++	(push_processed_type): New method to push currently processed
++	remembered type onto the stack.
++	(pop_processed_type): New method to pop currently processed
++	remembered type from the stack.
++	(work_stuff_copy_to_from): Copy values of new variables.
++	(delete_non_B_K_work_stuff): Free stack memory.
++	(demangle_args): Push/Pop currently processed remembered type.
++	(do_type): Do not demangle a cyclic reference and push/pop
++	referenced remembered type.
++
+ 2016-12-21  Release Manager
+ 
+ 	* GCC 6.3.0 released.
+diff --git a/libiberty/cplus-dem.c b/libiberty/cplus-dem.c
+index 7514e57..f21e630 100644
+--- a/libiberty/cplus-dem.c
++++ b/libiberty/cplus-dem.c
+@@ -144,6 +144,9 @@ struct work_stuff
+   string* previous_argument; /* The last function argument demangled.  */
+   int nrepeats;         /* The number of times to repeat the previous
+ 			   argument.  */
++  int *proctypevec;     /* Indices of currently processed remembered typevecs.  */
++  int proctypevec_size;
++  int nproctypes;
+ };
+ 
+ #define PRINT_ANSI_QUALIFIERS (work -> options & DMGL_ANSI)
+@@ -435,6 +438,10 @@ iterate_demangle_function (struct work_stuff *,
+ 
+ static void remember_type (struct work_stuff *, const char *, int);
+ 
++static void push_processed_type (struct work_stuff *, int);
++
++static void pop_processed_type (struct work_stuff *);
++
+ static void remember_Btype (struct work_stuff *, const char *, int, int);
+ 
+ static int register_Btype (struct work_stuff *);
+@@ -1301,6 +1308,10 @@ work_stuff_copy_to_from (struct work_stuff *to, struct work_stuff *from)
+       memcpy (to->btypevec[i], from->btypevec[i], len);
+     }
+ 
++  if (from->proctypevec)
++    to->proctypevec =
++      XDUPVEC (int, from->proctypevec, from->proctypevec_size);
++
+   if (from->ntmpl_args)
+     to->tmpl_argvec = XNEWVEC (char *, from->ntmpl_args);
+ 
+@@ -1329,11 +1340,17 @@ delete_non_B_K_work_stuff (struct work_stuff *work)
+   /* Discard the remembered types, if any.  */
+ 
+   forget_types (work);
+-  if (work -> typevec != NULL)
++  if (work->typevec != NULL)
+     {
+-      free ((char *) work -> typevec);
+-      work -> typevec = NULL;
+-      work -> typevec_size = 0;
++      free ((char *) work->typevec);
++      work->typevec = NULL;
++      work->typevec_size = 0;
++    }
++  if (work->proctypevec != NULL)
++    {
++      free (work->proctypevec);
++      work->proctypevec = NULL;
++      work->proctypevec_size = 0;
+     }
+   if (work->tmpl_argvec)
+     {
+@@ -3552,6 +3569,8 @@ static int
+ do_type (struct work_stuff *work, const char **mangled, string *result)
+ {
+   int n;
++  int i;
++  int is_proctypevec;
+   int done;
+   int success;
+   string decl;
+@@ -3564,6 +3583,7 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+ 
+   done = 0;
+   success = 1;
++  is_proctypevec = 0;
+   while (success && !done)
+     {
+       int member;
+@@ -3616,8 +3636,15 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+ 	      success = 0;
+ 	    }
+ 	  else
++	    for (i = 0; i < work->nproctypes; i++)
++	      if (work -> proctypevec [i] == n)
++	        success = 0;
++
++	  if (success)
+ 	    {
+-	      remembered_type = work -> typevec[n];
++	      is_proctypevec = 1;
++	      push_processed_type (work, n);
++	      remembered_type = work->typevec[n];
+ 	      mangled = &remembered_type;
+ 	    }
+ 	  break;
+@@ -3840,6 +3867,9 @@ do_type (struct work_stuff *work, const char **mangled, string *result)
+     string_delete (result);
+   string_delete (&decl);
+ 
++  if (is_proctypevec)
++    pop_processed_type (work);
++
+   if (success)
+     /* Assume an integral type, if we're not sure.  */
+     return (int) ((tk == tk_none) ? tk_integral : tk);
+@@ -4252,6 +4282,41 @@ do_arg (struct work_stuff *work, const char **mangled, string *result)
+ }
+ 
+ static void
++push_processed_type (struct work_stuff *work, int typevec_index)
++{
++  if (work->nproctypes >= work->proctypevec_size)
++    {
++      if (!work->proctypevec_size)
++	{
++	  work->proctypevec_size = 4;
++	  work->proctypevec = XNEWVEC (int, work->proctypevec_size);
++	}
++      else
++	{
++	  if (work->proctypevec_size < 16)
++	    /* Double when small.  */
++	    work->proctypevec_size *= 2;
++	  else
++	    {
++	      /* Grow slower when large.  */
++	      if (work->proctypevec_size > (INT_MAX / 3) * 2)
++                xmalloc_failed (INT_MAX);
++              work->proctypevec_size = (work->proctypevec_size * 3 / 2);
++	    }
++          work->proctypevec
++            = XRESIZEVEC (int, work->proctypevec, work->proctypevec_size);
++	}
++    }
++    work->proctypevec [work->nproctypes++] = typevec_index;
++}
++
++static void
++pop_processed_type (struct work_stuff *work)
++{
++  work->nproctypes--;
++}
++
++static void
+ remember_type (struct work_stuff *work, const char *start, int len)
+ {
+   char *tem;
+@@ -4515,10 +4580,13 @@ demangle_args (struct work_stuff *work, const char **mangled,
+ 		{
+ 		  string_append (declp, ", ");
+ 		}
++	      push_processed_type (work, t);
+ 	      if (!do_arg (work, &tem, &arg))
+ 		{
++		  pop_processed_type (work);
+ 		  return (0);
+ 		}
++	      pop_processed_type (work);
+ 	      if (PRINT_ARG_TYPES)
+ 		{
+ 		  string_appends (declp, &arg);
+diff --git a/libiberty/testsuite/demangle-expected b/libiberty/testsuite/demangle-expected
+index 157d2ee..8793a0b 100644
+--- a/libiberty/testsuite/demangle-expected
++++ b/libiberty/testsuite/demangle-expected
+@@ -4491,3 +4491,21 @@ void eat<int*, Foo()::{lambda(auto:1*, auto:2*)#6}>(int*&, Foo()::{lambda(auto:1
+ 
+ _Z3eatIPiZ3BarIsEvvEUlPsPT_PT0_E0_EvRS3_RS5_
+ void eat<int*, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}>(int*&, void Bar<short>()::{lambda(short*, auto:1*, auto:2*)#2}&)
++#
++# Tests write access violation PR70926
++
++0__Ot2m02R5T0000500000
++0__Ot2m02R5T0000500000
++#
++
++0__GT50000000000_
++0__GT50000000000_
++#
++
++__t2m05B500000000000000000_
++__t2m05B500000000000000000_
++#
++# Tests stack overflow PR71696
++
++__10%0__S4_0T0T0
++%0<>::%0(%0<>)
+-- 
+2.9.3
+
-- 
2.9.3


