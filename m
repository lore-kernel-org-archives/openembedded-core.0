Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDW-0001Zu-EK
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753342"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:30 -0700
Message-Id: <f0e9251b694fae92b9a5f00e0b7ebaba3a80e1e9.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 43/50] binutils: Fix build when compiling target binutils recipe with gcc 4.6
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:21 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils/clone-shadow.patch           |   79 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    3 +-
 2 files changed, 81 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/clone-shadow.patch

diff --git a/meta/recipes-devtools/binutils/binutils/clone-shadow.patch b/meta/recipes-devtools/binutils/binutils/clone-shadow.patch
new file mode 100644
index 0000000..2939011
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/clone-shadow.patch
@@ -0,0 +1,79 @@
+This fixes a global shadow warning. The warning is treated as error hence breaks the build of target
+binutils.
+
+ /b/openembedded-core/build/tmp-uclibc/work/armv5te-oe-linux-uclibceabi/binutils-2.21.1-r1/binutils-2.21.1/gas/config/obj-elf.c: In function 'obj_elf_parse_section_letters':
+| /b/openembedded-core/build/tmp-uclibc/work/armv5te-oe-linux-uclibceabi/binutils-2.21.1-r1/binutils-2.21.1/gas/config/obj-elf.c:744:68: error: declaration of 'clone' shadows a global declaration [-Werror=shadow]
+| /b/openembedded-core/build/tmp-uclibc/work/armv5te-oe-linux-uclibceabi/binutils-2.21.1-r1/binutils-2.21.1/gas/config/obj-elf.c: In function 'obj_elf_section':
+| /b/openembedded-core/build/tmp-uclibc/work/armv5te-oe-linux-uclibceabi/binutils-2.21.1-r1/binutils-2.21.1/gas/config/obj-elf.c:981:16: error: declaration of 'clone' shadows a global declaration [-Werror=shadow]
+| cc1: all warnings being treated as errors
+|
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: binutils-2.21.1/gas/config/obj-elf.c
+===================================================================
+--- binutils-2.21.1.orig/gas/config/obj-elf.c	2011-03-23 07:14:03.000000000 -0700
++++ binutils-2.21.1/gas/config/obj-elf.c	2011-07-16 19:05:57.003831035 -0700
+@@ -741,10 +741,10 @@
+ }
+ 
+ static bfd_vma
+-obj_elf_parse_section_letters (char *str, size_t len, bfd_boolean *clone)
++obj_elf_parse_section_letters (char *str, size_t len, bfd_boolean *cloneit)
+ {
+   bfd_vma attr = 0;
+-  *clone = FALSE;
++  *cloneit = FALSE;
+ 
+   while (len > 0)
+     {
+@@ -775,7 +775,7 @@
+ 	  attr |= SHF_TLS;
+ 	  break;
+ 	case '?':
+-	  *clone = TRUE;
++	  *cloneit = TRUE;
+ 	  break;
+ 	/* Compatibility.  */
+ 	case 'm':
+@@ -978,7 +978,7 @@
+ 
+       if (*input_line_pointer == '"')
+ 	{
+-	  bfd_boolean clone;
++	  bfd_boolean cloneit;
+ 
+ 	  beg = demand_copy_C_string (&dummy);
+ 	  if (beg == NULL)
+@@ -986,7 +986,7 @@
+ 	      ignore_rest_of_line ();
+ 	      return;
+ 	    }
+-	  attr |= obj_elf_parse_section_letters (beg, strlen (beg), &clone);
++	  attr |= obj_elf_parse_section_letters (beg, strlen (beg), &cloneit);
+ 
+ 	  SKIP_WHITESPACE ();
+ 	  if (*input_line_pointer == ',')
+@@ -1038,10 +1038,10 @@
+ 	      attr &= ~SHF_MERGE;
+ 	    }
+ 
+-	  if ((attr & SHF_GROUP) != 0 && clone)
++	  if ((attr & SHF_GROUP) != 0 && cloneit)
+ 	    {
+ 	      as_warn (_("? section flag ignored with G present"));
+-	      clone = FALSE;
++	      cloneit = FALSE;
+ 	    }
+ 	  if ((attr & SHF_GROUP) != 0 && *input_line_pointer == ',')
+ 	    {
+@@ -1063,7 +1063,7 @@
+ 	      attr &= ~SHF_GROUP;
+ 	    }
+ 
+-	  if (clone)
++	  if (cloneit)
+ 	    {
+ 	      const char *now_group = elf_group_name (now_seg);
+ 	      if (now_group != NULL)
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.1.bb b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
index 4eb6566..e1a16a6 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.1.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.21.1.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r1"
+PR = "r2"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -29,6 +29,7 @@ SRC_URI = "\
      file://libiberty_path_fix.patch \
      file://binutils-poison.patch \
      file://libtool-rpath-fix.patch \
+     file://clone-shadow.patch \
      "
 
 SRC_URI[md5sum] = "a22801a9cad45c85e9ff6afc10537d72"
-- 
1.7.3.4



