Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOw1-000460-KC
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:46 +0200
Received: by dalh21 with SMTP id h21so3401882dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PTtnCSBMWJGFXc3Kzt1bxAT2ONHU9v510VYRe/afgEE=;
	b=f3PvKahBDlXYOonPv08FgaZXW573i9nQfVbJU6fOGY/uN9BGlGhnoEYx2kfaHQ+ntk
	VdaGikO+NYk3dIVn8i7WKZxMM1KA/Ny5AfK9uPD4JBd3Yg8TbHqDR0epaz1G5K0eJTWL
	Hw40DWReg3EQcXxdngWKs/TUHXMLFH3EQOTyhNtXpAKWoKNjF5z/Z79tRT6P7+0/OstR
	QAhpMGbYdmJocxR5V55AZa5sAMo/Ckn2bedcw4moPV/ctaMTFH5YQhXkTFRKqpV2Ptg2
	R/yABsh0VEkIDWa7h0v2UusIFxux5V1VTlUC9llruM+FassY0Qf5G9tfB9ReM2+0lqt3
	C0xw==
Received: by 10.68.200.104 with SMTP id jr8mr8314613pbc.9.1339260253395;
	Sat, 09 Jun 2012 09:44:13 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:42:59 -0700
Message-Id: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 01/16] binutils_2.22: Backport to fix bogus textrels
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
X-List-Received-Date: Sat, 09 Jun 2012 16:54:46 -0000

This is reported by prelinker which does not
go well with textrels.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../binutils/binutils/0001-PR-ld-13470.patch       |   82 ++++++++++++++++++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    3 +-
 2 files changed, 84 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-PR-ld-13470.patch

diff --git a/meta/recipes-devtools/binutils/binutils/0001-PR-ld-13470.patch b/meta/recipes-devtools/binutils/binutils/0001-PR-ld-13470.patch
new file mode 100644
index 0000000..0a0e064
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-PR-ld-13470.patch
@@ -0,0 +1,82 @@
+From 82fdddd1c4e37881db9b4c6a944261521c6f10ac Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@bigpond.net.au>
+Date: Sat, 3 Dec 2011 00:57:59 +0000
+Subject: [PATCH] 	PR ld/13470 	* elf32-ppc.c
+ (ppc_elf_copy_indirect_symbol): Revert substantive 
+ change in 2011-07-01 commit.  Comment. 	*
+ elf64-ppc.c (ppc64_elf_copy_indirect_symbol): Likewise.
+
+---
+ bfd/ChangeLog   |    7 +++++++
+ bfd/elf32-ppc.c |   14 ++++++++++----
+ bfd/elf64-ppc.c |   14 ++++++++++----
+ 3 files changed, 27 insertions(+), 8 deletions(-)
+
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: binutils-2.22/bfd/elf32-ppc.c
+===================================================================
+--- binutils-2.22.orig/bfd/elf32-ppc.c	2011-11-21 01:29:21.000000000 -0800
++++ binutils-2.22/bfd/elf32-ppc.c	2012-05-31 14:28:48.273784929 -0700
+@@ -2987,10 +2987,6 @@
+   edir->elf.needs_plt |= eind->elf.needs_plt;
+   edir->elf.pointer_equality_needed |= eind->elf.pointer_equality_needed;
+ 
+-  /* If we were called to copy over info for a weak sym, that's all.  */
+-  if (eind->elf.root.type != bfd_link_hash_indirect)
+-    return;
+-
+   if (eind->dyn_relocs != NULL)
+     {
+       if (edir->dyn_relocs != NULL)
+@@ -3022,6 +3018,16 @@
+       eind->dyn_relocs = NULL;
+     }
+ 
++  /* If we were called to copy over info for a weak sym, that's all.
++     You might think dyn_relocs need not be copied over;  After all,
++     both syms will be dynamic or both non-dynamic so we're just
++     moving reloc accounting around.  However, ELIMINATE_COPY_RELOCS 
++     code in ppc_elf_adjust_dynamic_symbol needs to check for
++     dyn_relocs in read-only sections, and it does so on what is the
++     DIR sym here.  */
++  if (eind->elf.root.type != bfd_link_hash_indirect)
++    return;
++
+   /* Copy over the GOT refcount entries that we may have already seen to
+      the symbol which just became indirect.  */
+   edir->elf.got.refcount += eind->elf.got.refcount;
+Index: binutils-2.22/bfd/elf64-ppc.c
+===================================================================
+--- binutils-2.22.orig/bfd/elf64-ppc.c	2011-11-21 01:29:24.000000000 -0800
++++ binutils-2.22/bfd/elf64-ppc.c	2012-05-31 14:28:48.285784951 -0700
+@@ -4435,10 +4435,6 @@
+   edir->elf.ref_regular_nonweak |= eind->elf.ref_regular_nonweak;
+   edir->elf.needs_plt |= eind->elf.needs_plt;
+ 
+-  /* If we were called to copy over info for a weak sym, that's all.  */
+-  if (eind->elf.root.type != bfd_link_hash_indirect)
+-    return;
+-
+   /* Copy over any dynamic relocs we may have on the indirect sym.  */
+   if (eind->dyn_relocs != NULL)
+     {
+@@ -4471,6 +4467,16 @@
+       eind->dyn_relocs = NULL;
+     }
+ 
++  /* If we were called to copy over info for a weak sym, that's all.
++     You might think dyn_relocs need not be copied over;  After all,
++     both syms will be dynamic or both non-dynamic so we're just
++     moving reloc accounting around.  However, ELIMINATE_COPY_RELOCS 
++     code in ppc64_elf_adjust_dynamic_symbol needs to check for
++     dyn_relocs in read-only sections, and it does so on what is the
++     DIR sym here.  */
++  if (eind->elf.root.type != bfd_link_hash_indirect)
++    return;
++
+   /* Copy over got entries that we may have already seen to the
+      symbol which just became indirect.  */
+   if (eind->elf.got.glist != NULL)
diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
index 9f62883..7b6adef 100644
--- a/meta/recipes-devtools/binutils/binutils_2.22.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -1,6 +1,6 @@
 require binutils.inc
 
-PR = "r8"
+PR = "r9"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
@@ -32,6 +32,7 @@ SRC_URI = "\
      file://binutils-powerpc-e5500.patch \
      file://binutils-armv5e.patch \
      file://mips64-default-ld-emulation.patch \
+     file://0001-PR-ld-13470.patch \
      "
 
 SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
-- 
1.7.5.4



