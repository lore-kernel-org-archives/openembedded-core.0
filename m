Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sbfpj-00014q-2I
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:33:07 +0200
Received: by pbbrq2 with SMTP id rq2so6811292pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PTtnCSBMWJGFXc3Kzt1bxAT2ONHU9v510VYRe/afgEE=;
	b=sOP5bcaWxoKPQRA305m5s2nfzjQmiJ3SIOyGyirIQX71fUpz1sWv3zEcCFTcXv7dmH
	nhYHXhG+gu+iqBAwB4obpDxSxpCLfn1BKxdkmZC4GeqSdyJgaKGZ+zmSWSycM/n0UQRd
	Sg76hKw55dIzz2KjW23UGsW7VNZWv1zkn4fPnUFj8fLKZtJOXzKiAruNWaKgNk3fTLfv
	YobREYwlElMS8x5sbmWVTbUZdkqNG1GYcMS37yBvsbr0N1Xk953A3NRT1mRoDUm6qwEq
	lIMg1Xr2tSAY8kyC209ZGfXlR3sE475GLfNZftc/75nYzwyHMeMT9DO7LleQp+5D5WnX
	jebg==
Received: by 10.68.219.202 with SMTP id pq10mr43190221pbc.82.1338848560886;
	Mon, 04 Jun 2012 15:22:40 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id we10sm34017pbc.13.2012.06.04.15.22.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 15:22:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2012 15:21:40 -0700
Message-Id: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1338848379.git.raj.khem@gmail.com>
References: <cover.1338848379.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] binutils_2.22: Backport to fix bogus textrels
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
X-List-Received-Date: Mon, 04 Jun 2012 22:33:07 -0000

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



