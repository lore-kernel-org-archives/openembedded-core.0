Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A0B9A7D53D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 13:43:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 06:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="180369141"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga003.jf.intel.com with ESMTP; 19 Aug 2019 06:43:14 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2019 21:43:11 +0800
Message-Id: <1566222191-19728-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] binutils: fix CVE-2019-14250 CVE-2019-14444
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
X-List-Received-Date: Mon, 19 Aug 2019 13:43:23 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc   |  2 ++
 .../binutils/binutils/CVE-2019-14250.patch         | 33 ++++++++++++++++++++++
 .../binutils/binutils/CVE-2019-14444.patch         | 28 ++++++++++++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 31c24a3..d3c5293 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -50,6 +50,8 @@ SRC_URI = "\
      file://CVE-2019-9077.patch \
      file://CVE-2019-9071.patch \
      file://CVE-2019-12972.patch \
+     file://CVE-2019-14250.patch \
+     file://CVE-2019-14444.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
new file mode 100644
index 0000000..c915a83
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-14250.patch
@@ -0,0 +1,33 @@
+From df78be05daf4eb07f60f50ec1080cb979af32ec0 Mon Sep 17 00:00:00 2001
+From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 23 Jul 2019 07:33:32 +0000
+Subject: [PATCH] libiberty: Check zero value shstrndx in simple-object-elf.c
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@273718 138bc75d-0d04-0410-961f-82ee72b054a4
+
+CVE: CVE-2019-14250
+Upstream-Status: Backport [from gcc: https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=273718]
+[Removed Changelog entry]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+diff --git a/libiberty/simple-object-elf.c b/libiberty/simple-object-elf.c
+index 502388991a08..bdee963634d6 100644
+--- a/libiberty/simple-object-elf.c
++++ b/libiberty/simple-object-elf.c
+@@ -548,7 +548,15 @@ simple_object_elf_match (unsigned char header[SIMPLE_OBJECT_MATCH_HEADER_LEN],
+       XDELETE (eor);
+       return NULL;
+     }
+-
++  
++  if (eor->shstrndx == 0)
++    {
++      *errmsg = "invalid ELF shstrndx == 0";
++      *err = 0;
++      XDELETE (eor);
++      return NULL;
++    }
++  
+   return (void *) eor;
+ }
+ 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
new file mode 100644
index 0000000..85b9a9f
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-14444.patch
@@ -0,0 +1,28 @@
+From e17869db99195849826eaaf5d2d0eb2cfdd7a2a7 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 5 Aug 2019 10:40:35 +0100
+Subject: [PATCH] Catch potential integer overflow in readelf when processing
+ corrupt binaries.
+
+	PR 24829
+	* readelf.c (apply_relocations): Catch potential integer overflow
+	whilst checking reloc location against section size.
+
+CVE: CVE-2019-14444
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=e17869db99195849826eaaf5d2d0eb2cfdd7a2a7]
+[Removed Changelog entry]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index b896ad9f406..e785fde43e7 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -13366,7 +13366,7 @@ apply_relocations (Filedata *                 filedata,
+ 	    }
+ 
+ 	  rloc = start + rp->r_offset;
+-	  if ((rloc + reloc_size) > end || (rloc < start))
++	  if (rloc >= end || (rloc + reloc_size) > end || (rloc < start))
+ 	    {
+ 	      warn (_("skipping invalid relocation offset 0x%lx in section %s\n"),
+ 		    (unsigned long) rp->r_offset,
-- 
2.7.4


