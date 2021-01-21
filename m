Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.1379.1611246138081873702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: BpZZJO8SKAdWS6y5+FtwgwpdQ8n2ilgrpAoW0VcYC5a6WV7gmCuSmFyu80iwF/O8hpqIs5kL9w
 qmMa/vd3TAGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179446370"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="179446370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:25 -0800
IronPort-SDR: w3xBtQg/tuy8nE9dOxskQ50j8j2aQgZDtWqqohDGBEtsjETCTHuxVFcJD675jw+9oe1PkbQEdq
 vmvFGMityJiA==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413630"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/20] binutils: Fix CVE-2020-35448
Date: Fri, 22 Jan 2021 00:21:51 +0800
Message-Id: <f097519cb5d2acc65674f3a1d4c1c716cd2e75ca.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yi Fan Yu <yifan.yu@windriver.com>

Fix related to a buffer overflow in bfd library

CVE Details https://nvd.nist.gov/vuln/detail/CVE-2020-35448

Upstream Tracking https://sourceware.org/bugzilla/show_bug.cgi?id=26574

Patch from Upstream
    https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;
    h=8642dafaef21aa6747cec01df1977e9c52eb4679

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb83312131f6c4f69d89d639085e07ea1f53167e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../binutils/binutils-2.35.1.inc              |  1 +
 .../binutils/binutils/CVE-2020-35448.patch    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.35.1.inc b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
index c92cb75543..775af2b8f2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
@@ -43,5 +43,6 @@ SRC_URI = "\
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patch \
      file://0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch \
+     file://CVE-2020-35448.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch b/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
new file mode 100644
index 0000000000..3bc64776e5
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
@@ -0,0 +1,85 @@
+From 6caa41daeb7aa17c400b7300fb78d207cf064d70 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 4 Sep 2020 19:19:18 +0930
+Subject: [PATCH] PR26574, heap buffer overflow in
+ _bfd_elf_slurp_secondary_reloc_section
+
+A horribly fuzzed object with section headers inside the ELF header.
+Disallow that, and crazy reloc sizes.
+
+	PR 26574
+	* elfcode.h (elf_object_p): Sanity check section header offset.
+	* elf.c (_bfd_elf_slurp_secondary_reloc_section): Sanity check
+	sh_entsize.
+
+Upstream-Status: Backport
+CVE: CVE-2020-35448
+
+Reference to upstream patch:
+https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;
+    h=8642dafaef21aa6747cec01df1977e9c52eb4679
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ bfd/elf.c     | 4 +++-
+ bfd/elfcode.h | 8 ++++----
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index fe375e7346..9f29166399 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -12527,7 +12527,9 @@ _bfd_elf_slurp_secondary_reloc_section (bfd *      abfd,
+       Elf_Internal_Shdr * hdr = & elf_section_data (relsec)->this_hdr;
+ 
+       if (hdr->sh_type == SHT_SECONDARY_RELOC
+-	  && hdr->sh_info == (unsigned) elf_section_data (sec)->this_idx)
++	  && hdr->sh_info == (unsigned) elf_section_data (sec)->this_idx
++	  && (hdr->sh_entsize == ebd->s->sizeof_rel
++	      || hdr->sh_entsize == ebd->s->sizeof_rela))
+ 	{
+ 	  bfd_byte * native_relocs;
+ 	  bfd_byte * native_reloc;
+diff --git a/bfd/elfcode.h b/bfd/elfcode.h
+index f4a7829f27..54ef890637 100644
+--- a/bfd/elfcode.h
++++ b/bfd/elfcode.h
+@@ -568,7 +568,7 @@ elf_object_p (bfd *abfd)
+ 
+   /* If this is a relocatable file and there is no section header
+      table, then we're hosed.  */
+-  if (i_ehdrp->e_shoff == 0 && i_ehdrp->e_type == ET_REL)
++  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_type == ET_REL)
+     goto got_wrong_format_error;
+ 
+   /* As a simple sanity check, verify that what BFD thinks is the
+@@ -578,7 +578,7 @@ elf_object_p (bfd *abfd)
+     goto got_wrong_format_error;
+ 
+   /* Further sanity check.  */
+-  if (i_ehdrp->e_shoff == 0 && i_ehdrp->e_shnum != 0)
++  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_shnum != 0)
+     goto got_wrong_format_error;
+ 
+   ebd = get_elf_backend_data (abfd);
+@@ -615,7 +615,7 @@ elf_object_p (bfd *abfd)
+       && ebd->elf_osabi != ELFOSABI_NONE)
+     goto got_wrong_format_error;
+ 
+-  if (i_ehdrp->e_shoff != 0)
++  if (i_ehdrp->e_shoff >= sizeof (x_ehdr))
+     {
+       file_ptr where = (file_ptr) i_ehdrp->e_shoff;
+ 
+@@ -807,7 +807,7 @@ elf_object_p (bfd *abfd)
+ 	}
+     }
+ 
+-  if (i_ehdrp->e_shstrndx != 0 && i_ehdrp->e_shoff != 0)
++  if (i_ehdrp->e_shstrndx != 0 && i_ehdrp->e_shoff >= sizeof (x_ehdr))
+     {
+       unsigned int num_sec;
+ 
+-- 
+2.29.2
+
-- 
2.29.2

