Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4X-00025y-Sp
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:22:02 +0200
Received: by mail-iy0-f175.google.com with SMTP id 12so2181780iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=sKx5r7c1FXt0bEtF/JWdV++G3WsgzTgiC8V2TElShNc=;
	b=GZOD0oy23m8L/kb95tQoluGDSV6qEbBq9ev0rNuIuGAu94yQJQnPPBba3/41PeC1XZ
	QJSYyFrUDPPH5/Xzox4bd9G6v25ysdOBoXAXQgQYyL0hSo9IU4K+ywascWvIx7Katopq
	Ux8NfVWMh9dWaxsIYPDlHzUToNqlsQG9PuZpY=
Received: by 10.42.152.69 with SMTP id h5mr7848195icw.105.1311034679340;
	Mon, 18 Jul 2011 17:17:59 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:32 -0700
Message-Id: <78ad8c6cf168ebe10360593d2469950d7f316120.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 13/16] binutils: Fix build when compiling target binutils recipe with gcc 4.6
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
X-List-Received-Date: Tue, 19 Jul 2011 00:22:02 -0000

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
1.7.4.1



