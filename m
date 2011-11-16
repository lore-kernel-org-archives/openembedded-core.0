Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RQcx5-000751-Jl
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 11:42:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAGAaN1P009893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2011 02:36:23 -0800 (PST)
Received: from localhost.localdomain (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 16 Nov 2011 02:36:23 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2011 18:36:11 +0800
Message-ID: <e4edb77cfaf1aa7e5aed01ad7d279fe2a37d11d8.1321439619.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321439619.git.kai.kang@windriver.com>
References: <cover.1321439619.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 1/1] eglibc_2.13: update SRCREV
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
X-List-Received-Date: Wed, 16 Nov 2011 10:42:48 -0000
Content-Type: text/plain

Update eglibc 2.13 SRCREV to 15508, just to sync with upstream
Remove glibc_bug_fix_12454.patch, because it is already merged.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |    3 +
 .../eglibc/eglibc-2.13/glibc_bug_fix_12454.patch   |  179 --------------------
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    5 +-
 3 files changed, 5 insertions(+), 182 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5cd4c37..d54c7aa 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -5682,6 +5682,9 @@ RECIPE_LATEST_VERSION_pn-groff = "1.21"
 RECIPE_NO_UPDATE_REASON_pn-groff = "1.18.1.4 is latest GPLv2 Version no 1.21"
 
 RECIPE_STATUS_pn-eglibc = "red"
+RECIPE_LATEST_VERSION_pn-eglibc = "2.13-r15508"
+RECIPE_LAST_UPDATE_pn-eglibc = "Nov 16, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn = "Nov 16, 2011"
 
 RECIPE_STATUS_pn-lighttpd = "red"
 RECIPE_LAST_UPDATE_pn-lighttpd = "Jul 28, 2011"
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch b/meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch
deleted file mode 100644
index 71ba851..0000000
--- a/meta/recipes-core/eglibc/eglibc-2.13/glibc_bug_fix_12454.patch
+++ /dev/null
@@ -1,179 +0,0 @@
-Upstream-Status: Inappropriate [backport]
-
-Imported by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/07/12
-
-From 6b1e7d1992cd89032df431c0e0d1418b97e57cd8 Mon Sep 17 00:00:00 2001
-From: Ulrich Drepper <drepper@gmail.com>
-Date: Mon, 30 May 2011 12:31:25 -0400
-Subject: [PATCH] Handle DSOs without any dependency in ld.so
-
----
- ChangeLog     |    6 ++++
- NEWS          |    4 +-
- elf/dl-deps.c |   93 +++++++++++++++++++++++++++++---------------------------
- elf/dl-fini.c |   10 ++++--
- elf/rtld.c    |    1 -
- 5 files changed, 62 insertions(+), 52 deletions(-)
-
-Index: libc/ChangeLog
-===================================================================
---- libc.orig/ChangeLog
-+++ libc/ChangeLog
-@@ -1,3 +1,13 @@
-+2011-05-30  Ulrich Drepper  <drepper@gmail.com>
-+
-+	[BZ #12454]
-+	* elf/dl-deps.c (_dl_map_object_deps): Run initializer sorting only
-+	when there are multiple maps.
-+	* elf/dl-fini.c (_dl_sort_fini): Check for list of one.
-+	(_dl_fini): Remove test here.
-+
-+ 	* elf/rtld.c (dl_main): Don't allow the loader to load itself.
-+
- 2010-09-28  Andreas Schwab  <schwab@redhat.com>
- 	    Ulrich Drepper  <drepper@gmail.com>
- 
-Index: libc/elf/dl-deps.c
-===================================================================
---- libc.orig/elf/dl-deps.c
-+++ libc/elf/dl-deps.c
-@@ -613,61 +613,64 @@ Filters not supported with LD_TRACE_PREL
- 	map->l_searchlist.r_list[i]->l_reserved = 0;
-     }
- 
--  /* Now determine the order in which the initialization has to happen.  */
-+  /* Sort the initializer list to take dependencies into account.  The binary
-+     itself will always be initialize last.  */
-   memcpy (l_initfini, map->l_searchlist.r_list,
- 	  nlist * sizeof (struct link_map *));
--
--  /* We can skip looking for the binary itself which is at the front
--     of the search list.  */
--  assert (nlist > 1);
--  i = 1;
--  bool seen[nlist];
--  memset (seen, false, nlist * sizeof (seen[0]));
--  while (1)
-+  if (__builtin_expect (nlist > 1, 1))
-     {
--      /* Keep track of which object we looked at this round.  */
--      seen[i] = true;
--      struct link_map *thisp = l_initfini[i];
--
--      /* Find the last object in the list for which the current one is
--	 a dependency and move the current object behind the object
--	 with the dependency.  */
--      unsigned int k = nlist - 1;
--      while (k > i)
-+      /* We can skip looking for the binary itself which is at the front
-+	 of the search list.  */
-+      i = 1;
-+      bool seen[nlist];
-+      memset (seen, false, nlist * sizeof (seen[0]));
-+      while (1)
- 	{
--	  struct link_map **runp = l_initfini[k]->l_initfini;
--	  if (runp != NULL)
--	    /* Look through the dependencies of the object.  */
--	    while (*runp != NULL)
--	      if (__builtin_expect (*runp++ == thisp, 0))
--		{
--		  /* Move the current object to the back past the last
--		     object with it as the dependency.  */
--		  memmove (&l_initfini[i], &l_initfini[i + 1],
--			   (k - i) * sizeof (l_initfini[0]));
--		  l_initfini[k] = thisp;
--
--		  if (seen[i + 1])
-+	  /* Keep track of which object we looked at this round.  */
-+	  seen[i] = true;
-+	  struct link_map *thisp = l_initfini[i];
-+
-+	  /* Find the last object in the list for which the current one is
-+	     a dependency and move the current object behind the object
-+	     with the dependency.  */
-+	  unsigned int k = nlist - 1;
-+	  while (k > i)
-+	    {
-+	      struct link_map **runp = l_initfini[k]->l_initfini;
-+	      if (runp != NULL)
-+		/* Look through the dependencies of the object.  */
-+		while (*runp != NULL)
-+		  if (__builtin_expect (*runp++ == thisp, 0))
- 		    {
--		      ++i;
--		      goto next_clear;
-+		      /* Move the current object to the back past the last
-+			 object with it as the dependency.  */
-+		      memmove (&l_initfini[i], &l_initfini[i + 1],
-+			       (k - i) * sizeof (l_initfini[0]));
-+		      l_initfini[k] = thisp;
-+
-+		      if (seen[i + 1])
-+			{
-+			  ++i;
-+			  goto next_clear;
-+			}
-+
-+		      memmove (&seen[i], &seen[i + 1],
-+			       (k - i) * sizeof (seen[0]));
-+		      seen[k] = true;
-+
-+		      goto next;
- 		    }
- 
--		  memmove (&seen[i], &seen[i + 1], (k - i) * sizeof (seen[0]));
--		  seen[k] = true;
-+	      --k;
-+	    }
- 
--		  goto next;
--		}
-+	  if (++i == nlist)
-+	    break;
-+	next_clear:
-+	  memset (&seen[i], false, (nlist - i) * sizeof (seen[0]));
- 
--	  --k;
-+	next:;
- 	}
--
--      if (++i == nlist)
--	break;
--    next_clear:
--      memset (&seen[i], false, (nlist - i) * sizeof (seen[0]));
--
--    next:;
-     }
- 
-   /* Terminate the list of dependencies.  */
-Index: libc/elf/dl-fini.c
-===================================================================
---- libc.orig/elf/dl-fini.c
-+++ libc/elf/dl-fini.c
-@@ -33,9 +33,12 @@ internal_function
- _dl_sort_fini (struct link_map *l, struct link_map **maps, size_t nmaps,
- 	       char *used, Lmid_t ns)
- {
-+  /* A list of one element need not be sorted.  */
-+  if (nmaps == 1)
-+    return;
-+
-   /* We can skip looking for the binary itself which is at the front
-      of the search list for the main namespace.  */
--  assert (nmaps > 1);
-   unsigned int i = ns == LM_ID_BASE;
-   bool seen[nmaps];
-   memset (seen, false, nmaps * sizeof (seen[0]));
-@@ -195,9 +198,8 @@ _dl_fini (void)
-       assert (ns == LM_ID_BASE || i == nloaded || i == nloaded - 1);
-       nmaps = i;
- 
--      if (nmaps > 1)
--	/* Now we have to do the sorting.  */
--	_dl_sort_fini (GL(dl_ns)[ns]._ns_loaded, maps, nmaps, NULL, ns);
-+      /* Now we have to do the sorting.  */
-+      _dl_sort_fini (GL(dl_ns)[ns]._ns_loaded, maps, nmaps, NULL, ns);
- 
-       /* We do not rely on the linked list of loaded object anymore from
- 	 this point on.  We have our own list here (maps).  The various
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index f076ae7..955c4ec 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -1,9 +1,9 @@
 require eglibc.inc
 
-SRCREV = "14157"
+SRCREV = "15508"
 
 DEPENDS += "gperf-native"
-PR = "r17"
+PR = "r18"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -16,7 +16,6 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://armv4-eabi-compile-fix.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
-           file://glibc_bug_fix_12454.patch \
            file://ppc-sqrt.patch \
            file://multilib_readlib.patch \
 	   "
-- 
1.7.5.4



