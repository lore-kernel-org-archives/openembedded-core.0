Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 41D4D788AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:42:39 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id v18so12298661wrv.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=B2hS35Sm5vBoGJtxjYV1sOpVWhlNEJnSFMItv5u2vKk=;
	b=GsDk4AXwk+icIcQeT09WLnhD7TBUilOG4udLsg4tyiScQIuIkg4jd/pTBqHMw7bhUT
	XCQSF9fE5Ftg2RkmVAhvslQHM1r4vL1SHVHTP987yy0hwT3DNkCWiho8Nb1uMz3CjA2F
	O8mD2RSUfnMOLLIwHfbci9d7wHgwlmzcHf8LNkeVWwVg1QZfKbkYvVQvYCat3ndP4x7a
	m+7Tjeswse25WEKa30qgOuGfoLZrpWIRMCEf4SH5aDQ9W8Gy5et1Gn8KydPhRfUprKzD
	VZcECbr063MvxjgAtLyQzYbMRv3VUoSW3cWtvsvi10jzXDg0Eo+N2EeC9HUX8ce9dNsy
	g6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=B2hS35Sm5vBoGJtxjYV1sOpVWhlNEJnSFMItv5u2vKk=;
	b=hwCAxV1yY+JDvIxwvZirOy6sBmtdbvEbZKmWnyARLUnNEGc7oYMrsBImLeF05We6Pl
	NAHrS2VKQAODl4VaJcwC8ZG54U9NLprRVzgRAHogVJwXwfGGFrsLHqlhrAl7F5Bi4+Z0
	RSG0Dqo8K9W3G+O+8n1wDDu2oPnqnbql+yLR5GEBEWf/q9GuCNUzUBZe6e3cW8ydohjr
	vfd7PP3cszd5CxpBlqasa/uO8jnwF7ndmn/JAQWCXv27jMNJ/PCIl+2YAjQD0Ss3F6As
	44MbP3kGe339Cxr50G9+J+ck1Im8jRND76XfY5gH0n+FALFrOudjC8cUuf/1OV6SnmHn
	bXYA==
X-Gm-Message-State: AElRT7EFFJqLOg6yagowqn6YdpSfCS82KoMRgfdlkPJIVDbm8uLWA/Uh
	Heqvilb+ayHKpXEJ9Eyn9e5e4A==
X-Google-Smtp-Source: AG47ELtWVohMEzs1nRqyl/o3nsSK/7zP5YmeA4A29n7dTa+t2wqPQ4TCcov3eF9hGfx0hemDdtKs9g==
X-Received: by 10.223.177.194 with SMTP id r2mr2749162wra.89.1520728960571;
	Sat, 10 Mar 2018 16:42:40 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p12sm3647661wre.89.2018.03.10.16.42.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Mar 2018 16:42:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 11 Mar 2018 00:42:18 +0000
Message-Id: <be00ad34a3827a4205718609f349bc6e8a09733b.1520728802.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <cover.1520728802.git.Martin.Jansa@gmail.com>
References: <cover.1520728802.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [morty][PATCH 06/16] gcc: Fix CVE-2016-6131 in libiberty
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
X-List-Received-Date: Sun, 11 Mar 2018 00:42:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yuanjie Huang <yuanjie.huang@windriver.com>

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

(From OE-Core rev: 3c288b181a4cfecc80b48994f4dd2df285e4d1d0)

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96a16c4181d18b8580dad243350d589586cb2b07)
---
 meta/recipes-devtools/gcc/gcc-5.4.inc              |   1 +
 .../gcc/gcc-5.4/CVE-2016-6131.patch                | 251 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-6.3.inc              |   1 +
 .../gcc/gcc-6.3/CVE-2016-6131.patch                | 251 +++++++++++++++++++++
 4 files changed, 504 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.4.inc b/meta/recipes-devtools/gcc/gcc-5.4.inc
index 338530fd6d..b7696756af 100644
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
index 0000000000..88524c342e
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
+Upstream-Status: Backport [master]
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
index 4f04c012c1..71d0affb89 100644
--- a/meta/recipes-devtools/gcc/gcc-6.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
@@ -83,6 +83,7 @@ SRC_URI = "\
            ${BACKPORTS} \
 "
 BACKPORTS = "\
+           file://CVE-2016-6131.patch \
            file://ubsan-fix-check-empty-string.patch \
 "
 SRC_URI[md5sum] = "677a7623c7ef6ab99881bc4e048debb6"
diff --git a/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch b/meta/recipes-devtools/gcc/gcc-6.3/CVE-2016-6131.patch
new file mode 100644
index 0000000000..e873cc6e85
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
+Upstream-Status: Backport [master]
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
2.15.1


