Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id EC20B605BD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 01:19:52 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id g10so3898209pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Sep 2014 18:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CNanV7GkkjY+aTQUKUo1FMNnU0EOAqYCzWPjCx3Oj0M=;
	b=msKC158NX6yQEBAPRxslI/gcibhn4mr8tLyMkoq+iRx3vJb+3uGDSaA5LHI5Mae8+G
	LseBFr8OaqU63zMXjeb9kIHZEH/GJZeovlN+eIwzBtFz4xb6BTttlxuI/3dimRPxiBbG
	zBhvhRxtvX79zOi54KOKqCSkIEt/Ej1sEjuMPz/exAtShIAy5DKUlLPw/SD2fz/22LYJ
	Q6tRBskekSa0cc46NHMVEj6V7/3k8Zdru9jYQDIyO+IlMDAeVXdGS9cG5US+n2/A1aRA
	xETW4/N92Gnah96Az0pqVmhmbcEx5kCpNRqrUcW+vOeEnG3LrwU15slsgpIJduUF+o00
	W/7w==
X-Received: by 10.70.101.10 with SMTP id fc10mr29689545pdb.73.1410657593905;
	Sat, 13 Sep 2014 18:19:53 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id vi5sm7567169pbc.65.2014.09.13.18.19.51
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Sep 2014 18:19:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Sep 2014 18:19:40 -0700
Message-Id: <1410657580-5311-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH][Daisy] eglibc: CVE-2014-5119 fix
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
X-List-Received-Date: Sun, 14 Sep 2014 01:19:55 -0000

__gconv_translit_find: Disable function [BZ #17187]

This functionality has never worked correctly, and the implementation
contained a security vulnerability (CVE-2014-5119).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../eglibc/eglibc-2.19/CVE-2014-5119.patch         | 240 +++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.19.bb            |   1 +
 2 files changed, 241 insertions(+)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch
new file mode 100644
index 0000000..51c7037
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.19/CVE-2014-5119.patch
@@ -0,0 +1,240 @@
+CVE-2014-5119
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Upstream commit:
+
+https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=a1a6a401ab0a3c9f15fb7eaebbdcee24192254e8
+
+
+From a1a6a401ab0a3c9f15fb7eaebbdcee24192254e8 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 26 Aug 2014 19:38:59 +0200
+Subject: [PATCH] __gconv_translit_find: Disable function [BZ #17187]
+
+This functionality has never worked correctly, and the implementation
+contained a security vulnerability (CVE-2014-5119).
+---
+ ChangeLog           |    7 ++
+ NEWS                |    9 ++-
+ iconv/gconv_trans.c |  177 +-------------------------------------------------
+ 3 files changed, 19 insertions(+), 174 deletions(-)
+
+Index: libc/NEWS
+===================================================================
+--- libc.orig/NEWS
++++ libc/NEWS
+@@ -26,7 +26,7 @@ Version 2.19
+   16271, 16274, 16283, 16289, 16293, 16314, 16316, 16330, 16337, 16338,
+   16356, 16365, 16366, 16369, 16372, 16375, 16379, 16384, 16385, 16386,
+   16387, 16390, 16394, 16398, 16400, 16407, 16408, 16414, 16430, 16431,
+-  16453, 16474, 16506, 16510, 16529
++  16453, 16474, 16506, 16510, 16529, 17187
+ 
+ * Slovenian translations for glibc messages have been contributed by the
+   Translation Project's Slovenian team of translators.
+Index: libc/iconv/gconv_trans.c
+===================================================================
+--- libc.orig/iconv/gconv_trans.c
++++ libc/iconv/gconv_trans.c
+@@ -241,181 +241,12 @@ __gconv_transliterate (struct __gconv_st
+   return __GCONV_ILLEGAL_INPUT;
+ }
+ 
+-
+-/* Structure to represent results of found (or not) transliteration
+-   modules.  */
+-struct known_trans
+-{
+-  /* This structure must remain the first member.  */
+-  struct trans_struct info;
+-
+-  char *fname;
+-  void *handle;
+-  int open_count;
+-};
+-
+-
+-/* Tree with results of previous calls to __gconv_translit_find.  */
+-static void *search_tree;
+-
+-/* We modify global data.   */
+-__libc_lock_define_initialized (static, lock);
+-
+-
+-/* Compare two transliteration entries.  */
+-static int
+-trans_compare (const void *p1, const void *p2)
+-{
+-  const struct known_trans *s1 = (const struct known_trans *) p1;
+-  const struct known_trans *s2 = (const struct known_trans *) p2;
+-
+-  return strcmp (s1->info.name, s2->info.name);
+-}
+-
+-
+-/* Open (maybe reopen) the module named in the struct.  Get the function
+-   and data structure pointers we need.  */
+-static int
+-open_translit (struct known_trans *trans)
+-{
+-  __gconv_trans_query_fct queryfct;
+-
+-  trans->handle = __libc_dlopen (trans->fname);
+-  if (trans->handle == NULL)
+-    /* Not available.  */
+-    return 1;
+-
+-  /* Find the required symbol.  */
+-  queryfct = __libc_dlsym (trans->handle, "gconv_trans_context");
+-  if (queryfct == NULL)
+-    {
+-      /* We cannot live with that.  */
+-    close_and_out:
+-      __libc_dlclose (trans->handle);
+-      trans->handle = NULL;
+-      return 1;
+-    }
+-
+-  /* Get the context.  */
+-  if (queryfct (trans->info.name, &trans->info.csnames, &trans->info.ncsnames)
+-      != 0)
+-    goto close_and_out;
+-
+-  /* Of course we also have to have the actual function.  */
+-  trans->info.trans_fct = __libc_dlsym (trans->handle, "gconv_trans");
+-  if (trans->info.trans_fct == NULL)
+-    goto close_and_out;
+-
+-  /* Now the optional functions.  */
+-  trans->info.trans_init_fct =
+-    __libc_dlsym (trans->handle, "gconv_trans_init");
+-  trans->info.trans_context_fct =
+-    __libc_dlsym (trans->handle, "gconv_trans_context");
+-  trans->info.trans_end_fct =
+-    __libc_dlsym (trans->handle, "gconv_trans_end");
+-
+-  trans->open_count = 1;
+-
+-  return 0;
+-}
+-
+-
+ int
+ internal_function
+ __gconv_translit_find (struct trans_struct *trans)
+ {
+-  struct known_trans **found;
+-  const struct path_elem *runp;
+-  int res = 1;
+-
+-  /* We have to have a name.  */
+-  assert (trans->name != NULL);
+-
+-  /* Acquire the lock.  */
+-  __libc_lock_lock (lock);
+-
+-  /* See whether we know this module already.  */
+-  found = __tfind (trans, &search_tree, trans_compare);
+-  if (found != NULL)
+-    {
+-      /* Is this module available?  */
+-      if ((*found)->handle != NULL)
+-	{
+-	  /* Maybe we have to reopen the file.  */
+-	  if ((*found)->handle != (void *) -1)
+-	    /* The object is not unloaded.  */
+-	    res = 0;
+-	  else if (open_translit (*found) == 0)
+-	    {
+-	      /* Copy the data.  */
+-	      *trans = (*found)->info;
+-	      (*found)->open_count++;
+-	      res = 0;
+-	    }
+-	}
+-    }
+-  else
+-    {
+-      size_t name_len = strlen (trans->name) + 1;
+-      int need_so = 0;
+-      struct known_trans *newp;
+-
+-      /* We have to continue looking for the module.  */
+-      if (__gconv_path_elem == NULL)
+-	__gconv_get_path ();
+-
+-      /* See whether we have to append .so.  */
+-      if (name_len <= 4 || memcmp (&trans->name[name_len - 4], ".so", 3) != 0)
+-	need_so = 1;
+-
+-      /* Create a new entry.  */
+-      newp = (struct known_trans *) malloc (sizeof (struct known_trans)
+-					    + (__gconv_max_path_elem_len
+-					       + name_len + 3)
+-					    + name_len);
+-      if (newp != NULL)
+-	{
+-	  char *cp;
+-
+-	  /* Clear the struct.  */
+-	  memset (newp, '\0', sizeof (struct known_trans));
+-
+-	  /* Store a copy of the module name.  */
+-	  newp->info.name = cp = (char *) (newp + 1);
+-	  cp = __mempcpy (cp, trans->name, name_len);
+-
+-	  newp->fname = cp;
+-
+-	  /* Search in all the directories.  */
+-	  for (runp = __gconv_path_elem; runp->name != NULL; ++runp)
+-	    {
+-	      cp = __mempcpy (__stpcpy ((char *) newp->fname, runp->name),
+-			      trans->name, name_len);
+-	      if (need_so)
+-		memcpy (cp, ".so", sizeof (".so"));
+-
+-	      if (open_translit (newp) == 0)
+-		{
+-		  /* We found a module.  */
+-		  res = 0;
+-		  break;
+-		}
+-	    }
+-
+-	  if (res)
+-	    newp->fname = NULL;
+-
+-	  /* In any case we'll add the entry to our search tree.  */
+-	  if (__tsearch (newp, &search_tree, trans_compare) == NULL)
+-	    {
+-	      /* Yickes, this should not happen.  Unload the object.  */
+-	      res = 1;
+-	      /* XXX unload here.  */
+-	    }
+-	}
+-    }
+-
+-  __libc_lock_unlock (lock);
+-
+-  return res;
++  /* Transliteration module loading has been removed because it never
++     worked as intended and suffered from a security vulnerability.
++     Consequently, this function always fails.  */
++  return 1;
+ }
+Index: libc/ChangeLog
+===================================================================
+--- libc.orig/ChangeLog
++++ libc/ChangeLog
+@@ -1,3 +1,10 @@
++2014-08-26  Florian Weimer  <fweimer@redhat.com>
++
++	[BZ #17187]
++	* iconv/gconv_trans.c (struct known_trans, search_tree, lock,
++	trans_compare, open_translit, __gconv_translit_find):
++	Remove module loading code.
++
+ 2014-02-06  Carlos O'Donell  <carlos@redhat.com>
+ 
+ 	[BZ #16529]
diff --git a/meta/recipes-core/eglibc/eglibc_2.19.bb b/meta/recipes-core/eglibc/eglibc_2.19.bb
index c65e6a5..090cfe6 100644
--- a/meta/recipes-core/eglibc/eglibc_2.19.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.19.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/eglibc/eglibc-${PV}-svnr25
            file://fix-tibetian-locales.patch \
            file://ppce6500-32b_slow_ieee754_sqrt.patch \
            file://grok_gold.patch \
+           file://CVE-2014-5119.patch \
           "
 SRC_URI[md5sum] = "197836c2ba42fb146e971222647198dd"
 SRC_URI[sha256sum] = "baaa030531fc308f7820c46acdf8e1b2f8e3c1f40bcd28b6e440d1c95d170d4c"
-- 
1.9.1


