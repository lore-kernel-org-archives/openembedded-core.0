Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qgi8T-00015d-Jy
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jul 2011 20:56:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2011 11:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,522,1304319600"; d="scan'208";a="29496869"
Received: from nbuild2.sc.intel.com ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jul 2011 11:52:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 11:52:40 -0700
Message-Id: <35a0b360dc6287560c307bf3a60deaccb38c1ab7.1310496679.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <664a92ced9bc0614d5ba98244bfdfc32e3e2b637.1310496679.git.nitin.a.kamble@intel.com>
References: <664a92ced9bc0614d5ba98244bfdfc32e3e2b637.1310496679.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1310496679.git.nitin.a.kamble@intel.com>
References: <cover.1310496679.git.nitin.a.kamble@intel.com>
Subject: [PATCH 3/3] eglibc: fix runtime assertion failure
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
X-List-Received-Date: Tue, 12 Jul 2011 18:56:46 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes bug [YOCTO #1237]

Runtime assertion errors were observed:
Inconsistency detected by ld.so: dl-deps.c: 622: _dl_map_object_deps: Assertion `nlist > 1' failed!

A fix was available for this issue:
 http://sourceware.org/bugzilla/show_bug.cgi?id=12454

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../eglibc/eglibc-2.13/glibc_bug_fix_12454.patch   |  179 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
 2 files changed, 181 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch b/meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch
new file mode 100644
index 0000000..71ba851
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch
@@ -0,0 +1,179 @@
+Upstream-Status: Inappropriate [backport]
+
+Imported by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/12
+
+From 6b1e7d1992cd89032df431c0e0d1418b97e57cd8 Mon Sep 17 00:00:00 2001
+From: Ulrich Drepper <drepper@gmail.com>
+Date: Mon, 30 May 2011 12:31:25 -0400
+Subject: [PATCH] Handle DSOs without any dependency in ld.so
+
+---
+ ChangeLog     |    6 ++++
+ NEWS          |    4 +-
+ elf/dl-deps.c |   93 +++++++++++++++++++++++++++++---------------------------
+ elf/dl-fini.c |   10 ++++--
+ elf/rtld.c    |    1 -
+ 5 files changed, 62 insertions(+), 52 deletions(-)
+
+Index: libc/ChangeLog
+===================================================================
+--- libc.orig/ChangeLog
++++ libc/ChangeLog
+@@ -1,3 +1,13 @@
++2011-05-30  Ulrich Drepper  <drepper@gmail.com>
++
++	[BZ #12454]
++	* elf/dl-deps.c (_dl_map_object_deps): Run initializer sorting only
++	when there are multiple maps.
++	* elf/dl-fini.c (_dl_sort_fini): Check for list of one.
++	(_dl_fini): Remove test here.
++
++ 	* elf/rtld.c (dl_main): Don't allow the loader to load itself.
++
+ 2010-09-28  Andreas Schwab  <schwab@redhat.com>
+ 	    Ulrich Drepper  <drepper@gmail.com>
+ 
+Index: libc/elf/dl-deps.c
+===================================================================
+--- libc.orig/elf/dl-deps.c
++++ libc/elf/dl-deps.c
+@@ -613,61 +613,64 @@ Filters not supported with LD_TRACE_PREL
+ 	map->l_searchlist.r_list[i]->l_reserved = 0;
+     }
+ 
+-  /* Now determine the order in which the initialization has to happen.  */
++  /* Sort the initializer list to take dependencies into account.  The binary
++     itself will always be initialize last.  */
+   memcpy (l_initfini, map->l_searchlist.r_list,
+ 	  nlist * sizeof (struct link_map *));
+-
+-  /* We can skip looking for the binary itself which is at the front
+-     of the search list.  */
+-  assert (nlist > 1);
+-  i = 1;
+-  bool seen[nlist];
+-  memset (seen, false, nlist * sizeof (seen[0]));
+-  while (1)
++  if (__builtin_expect (nlist > 1, 1))
+     {
+-      /* Keep track of which object we looked at this round.  */
+-      seen[i] = true;
+-      struct link_map *thisp = l_initfini[i];
+-
+-      /* Find the last object in the list for which the current one is
+-	 a dependency and move the current object behind the object
+-	 with the dependency.  */
+-      unsigned int k = nlist - 1;
+-      while (k > i)
++      /* We can skip looking for the binary itself which is at the front
++	 of the search list.  */
++      i = 1;
++      bool seen[nlist];
++      memset (seen, false, nlist * sizeof (seen[0]));
++      while (1)
+ 	{
+-	  struct link_map **runp = l_initfini[k]->l_initfini;
+-	  if (runp != NULL)
+-	    /* Look through the dependencies of the object.  */
+-	    while (*runp != NULL)
+-	      if (__builtin_expect (*runp++ == thisp, 0))
+-		{
+-		  /* Move the current object to the back past the last
+-		     object with it as the dependency.  */
+-		  memmove (&l_initfini[i], &l_initfini[i + 1],
+-			   (k - i) * sizeof (l_initfini[0]));
+-		  l_initfini[k] = thisp;
+-
+-		  if (seen[i + 1])
++	  /* Keep track of which object we looked at this round.  */
++	  seen[i] = true;
++	  struct link_map *thisp = l_initfini[i];
++
++	  /* Find the last object in the list for which the current one is
++	     a dependency and move the current object behind the object
++	     with the dependency.  */
++	  unsigned int k = nlist - 1;
++	  while (k > i)
++	    {
++	      struct link_map **runp = l_initfini[k]->l_initfini;
++	      if (runp != NULL)
++		/* Look through the dependencies of the object.  */
++		while (*runp != NULL)
++		  if (__builtin_expect (*runp++ == thisp, 0))
+ 		    {
+-		      ++i;
+-		      goto next_clear;
++		      /* Move the current object to the back past the last
++			 object with it as the dependency.  */
++		      memmove (&l_initfini[i], &l_initfini[i + 1],
++			       (k - i) * sizeof (l_initfini[0]));
++		      l_initfini[k] = thisp;
++
++		      if (seen[i + 1])
++			{
++			  ++i;
++			  goto next_clear;
++			}
++
++		      memmove (&seen[i], &seen[i + 1],
++			       (k - i) * sizeof (seen[0]));
++		      seen[k] = true;
++
++		      goto next;
+ 		    }
+ 
+-		  memmove (&seen[i], &seen[i + 1], (k - i) * sizeof (seen[0]));
+-		  seen[k] = true;
++	      --k;
++	    }
+ 
+-		  goto next;
+-		}
++	  if (++i == nlist)
++	    break;
++	next_clear:
++	  memset (&seen[i], false, (nlist - i) * sizeof (seen[0]));
+ 
+-	  --k;
++	next:;
+ 	}
+-
+-      if (++i == nlist)
+-	break;
+-    next_clear:
+-      memset (&seen[i], false, (nlist - i) * sizeof (seen[0]));
+-
+-    next:;
+     }
+ 
+   /* Terminate the list of dependencies.  */
+Index: libc/elf/dl-fini.c
+===================================================================
+--- libc.orig/elf/dl-fini.c
++++ libc/elf/dl-fini.c
+@@ -33,9 +33,12 @@ internal_function
+ _dl_sort_fini (struct link_map *l, struct link_map **maps, size_t nmaps,
+ 	       char *used, Lmid_t ns)
+ {
++  /* A list of one element need not be sorted.  */
++  if (nmaps == 1)
++    return;
++
+   /* We can skip looking for the binary itself which is at the front
+      of the search list for the main namespace.  */
+-  assert (nmaps > 1);
+   unsigned int i = ns == LM_ID_BASE;
+   bool seen[nmaps];
+   memset (seen, false, nmaps * sizeof (seen[0]));
+@@ -195,9 +198,8 @@ _dl_fini (void)
+       assert (ns == LM_ID_BASE || i == nloaded || i == nloaded - 1);
+       nmaps = i;
+ 
+-      if (nmaps > 1)
+-	/* Now we have to do the sorting.  */
+-	_dl_sort_fini (GL(dl_ns)[ns]._ns_loaded, maps, nmaps, NULL, ns);
++      /* Now we have to do the sorting.  */
++      _dl_sort_fini (GL(dl_ns)[ns]._ns_loaded, maps, nmaps, NULL, ns);
+ 
+       /* We do not rely on the linked list of loaded object anymore from
+ 	 this point on.  We have our own list here (maps).  The various
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index be65787..feaf7ca 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -4,7 +4,7 @@ SRCREV = "14157"
 
 DEPENDS += "gperf-native"
 FILESPATHPKG =. "eglibc-svn:"
-PR = "r6"
+PR = "r7"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -16,6 +16,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://stack-protector-test.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
+           file://glibc_bug_fix_12454.patch \
 	   "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.4.4



