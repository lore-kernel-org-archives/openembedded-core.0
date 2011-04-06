Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q7Qey-0006qK-J0
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 13:12:29 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 06 Apr 2011 04:10:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,309,1299484800"; d="scan'208";a="729812262"
Received: from unknown (HELO localhost) ([10.255.12.213])
	by orsmga001.jf.intel.com with ESMTP; 06 Apr 2011 04:10:21 -0700
Message-Id: <4efb7a4809b1ae00400f4c2275407d4b2d46d596.1302087686.git.josh@linux.intel.com>
In-Reply-To: <cover.1302087686.git.josh@linux.intel.com>
References: <cover.1302087686.git.josh@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 11:51:25 +0100
Date: Wed, 06 Apr 2011 12:10:20 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 1/1] elfutils: remove unused variables to fix compilation with GCC 4.6
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
X-List-Received-Date: Wed, 06 Apr 2011 11:12:29 -0000

From: Joshua Lock <josh@linux.intel.com>

Unused variables trigger a warning in GCC 4.6 which are caught by -Werror as
used in the elfutils makefiles and therefore the build fails.

This patch adds some consolidated fixes from upstream to remove the unused
variables, they will no longer be required as of elfutils 0.152

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../elfutils/elfutils-0.148/remove-unused.patch    |  152 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    3 +-
 2 files changed, 154 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
new file mode 100644
index 0000000..064331a
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
@@ -0,0 +1,152 @@
+Remove unused variables from the code to prevent -Werror causing a build
+failure on hosts with GCC 4.6.
+
+These changes are all upstream so should not be required once we've updated
+to elfutils 0.152 or later. Therefore this patch consolidates several
+changes from elfutils upstream by Roland McGrath into a single file so that
+it's easier to remove later once we upgrade.
+Links to upstream gitweb of the consolidated commits follow:
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=7094d00a169afb27e0323f8580e817798ae7c240
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=fd992543185126eb0280c1ee0883e073020499b4
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=4db89f04bb59327abd7a3b60e88f2e7e73c65c79
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=8f6c1795ab9d41f03805eebd55767070ade55aac
+- http://git.fedorahosted.org/git?p=elfutils.git;a=commit;h=240784b48aa276822c5a61c9ad6a4355051ce259
+
+Joshua Lock <josh@linux.intel.com> - 06/04/11
+
+Index: elfutils-0.148/libasm/asm_newscn.c
+===================================================================
+--- elfutils-0.148.orig/libasm/asm_newscn.c
++++ elfutils-0.148/libasm/asm_newscn.c
+@@ -162,7 +162,6 @@ asm_newscn (ctx, scnname, type, flags)
+      GElf_Xword flags;
+ {
+   size_t scnname_len = strlen (scnname) + 1;
+-  unsigned long int hval;
+   AsmScn_t *result;
+ 
+   /* If no context is given there might be an earlier error.  */
+@@ -180,8 +179,6 @@ asm_newscn (ctx, scnname, type, flags)
+       return NULL;
+     }
+ 
+-  hval = elf_hash (scnname);
+-
+   rwlock_wrlock (ctx->lock);
+ 
+   /* This is a new section.  */
+Index: elfutils-0.148/src/elflint.c
+===================================================================
+--- elfutils-0.148.orig/src/elflint.c
++++ elfutils-0.148/src/elflint.c
+@@ -707,9 +707,10 @@ section [%2d] '%s': symbol %zu: invalid 
+ 	{
+ 	  if (xndxdata == NULL)
+ 	    {
+-	      ERROR (gettext ("\
++	      if (!no_xndx_warned)
++		ERROR (gettext ("\
+ section [%2d] '%s': symbol %zu: too large section index but no extended section index section\n"),
+-		     idx, section_name (ebl, idx), cnt);
++		       idx, section_name (ebl, idx), cnt);
+ 	      no_xndx_warned = true;
+ 	    }
+ 	  else if (xndx < SHN_LORESERVE)
+@@ -1592,10 +1593,6 @@ check_dynamic (Ebl *ebl, GElf_Ehdr *ehdr
+       [DT_STRSZ] = true,
+       [DT_SYMENT] = true
+     };
+-  GElf_Addr reladdr = 0;
+-  GElf_Word relsz = 0;
+-  GElf_Addr pltreladdr = 0;
+-  GElf_Word pltrelsz = 0;
+ 
+   memset (has_dt, '\0', sizeof (has_dt));
+   memset (has_val_dt, '\0', sizeof (has_val_dt));
+@@ -1694,15 +1691,6 @@ section [%2d] '%s': entry %zu: level 2 t
+ section [%2d] '%s': entry %zu: DT_PLTREL value must be DT_REL or DT_RELA\n"),
+ 	       idx, section_name (ebl, idx), cnt);
+ 
+-      if (dyn->d_tag == DT_REL)
+-	reladdr = dyn->d_un.d_ptr;
+-      if (dyn->d_tag == DT_RELSZ)
+-	relsz = dyn->d_un.d_val;
+-      if (dyn->d_tag == DT_JMPREL)
+-	pltreladdr = dyn->d_un.d_ptr;
+-      if (dyn->d_tag == DT_PLTRELSZ)
+-	pltrelsz = dyn->d_un.d_val;
+-
+       /* Check that addresses for entries are in loaded segments.  */
+       switch (dyn->d_tag)
+ 	{
+Index: elfutils-0.148/src/ldgeneric.c
+===================================================================
+--- elfutils-0.148.orig/src/ldgeneric.c
++++ elfutils-0.148/src/ldgeneric.c
+@@ -285,12 +285,10 @@ static int
+ check_for_duplicate2 (struct usedfiles *newp, struct usedfiles *list)
+ {
+   struct usedfiles *first;
+-  struct usedfiles *prevp;
+ 
+   if (list == NULL)
+     return 0;
+ 
+-  prevp = list;
+   list = first = list->next;
+   do
+     {
+Index: elfutils-0.148/src/ldscript.y
+===================================================================
+--- elfutils-0.148.orig/src/ldscript.y
++++ elfutils-0.148/src/ldscript.y
+@@ -802,12 +802,9 @@ add_versions (struct version *versions)
+ 
+   do
+     {
+-      struct version *oldp;
+-
+       add_id_list (versions->versionname, versions->local_names, true);
+       add_id_list (versions->versionname, versions->global_names, false);
+ 
+-      oldp = versions;
+       versions = versions->next;
+     }
+   while (versions != NULL);
+Index: elfutils-0.148/src/unstrip.c
+===================================================================
+--- elfutils-0.148.orig/src/unstrip.c
++++ elfutils-0.148/src/unstrip.c
+@@ -1301,7 +1301,6 @@ more sections in stripped file than debu
+   /* Match each debuginfo section with its corresponding stripped section.  */
+   bool check_prelink = false;
+   Elf_Scn *unstripped_symtab = NULL;
+-  size_t unstripped_strtab_ndx = SHN_UNDEF;
+   size_t alloc_avail = 0;
+   scn = NULL;
+   while ((scn = elf_nextscn (unstripped, scn)) != NULL)
+@@ -1313,7 +1312,6 @@ more sections in stripped file than debu
+       if (shdr->sh_type == SHT_SYMTAB)
+ 	{
+ 	  unstripped_symtab = scn;
+-	  unstripped_strtab_ndx = shdr->sh_link;
+ 	  continue;
+ 	}
+ 
+Index: elfutils-0.148/src/ldscript.c
+===================================================================
+--- elfutils-0.148.orig/src/ldscript.c
++++ elfutils-0.148/src/ldscript.c
+@@ -2728,12 +2728,9 @@ add_versions (struct version *versions)
+ 
+   do
+     {
+-      struct version *oldp;
+-
+       add_id_list (versions->versionname, versions->local_names, true);
+       add_id_list (versions->versionname, versions->global_names, false);
+ 
+-      oldp = versions;
+       versions = versions->next;
+     }
+   while (versions != NULL);
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index b2f700e..a55b98d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -27,6 +27,7 @@ SRC_URI += "\
         file://testsuite-ignore-elflint.diff \
         file://elf_additions.diff \
 	file://elfutils-fsize.patch \
+	file://remove-unused.patch \
 "
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
-- 
1.7.4.1



