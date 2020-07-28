Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZNxKN0mODQ+Rk1XIIa0sNbB2velHq3UKdqIYgP/BId7kJMD65f0jxOzi1zUPc0NlFqkwQdRML4
 YcnMrdLqTdTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699682"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699682"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:51 -0700
IronPort-SDR: WgIG2RStMKjz4wzdYeABhix/ODCOQt5CMU4bD5UVTsIrdCuxt6ATgLbX9qlhxjxaV8hwDUQZ51
 Qp+RGCxjwozg==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245751"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 08/32] patchelf: Add patch to address corrupt shared library issue
Date: Tue, 28 Jul 2020 16:51:09 +0800
Message-Id: <1969b67592bf1cfb0088f89ecde516abf614238f.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

patchelf can corrupt shared libraries if the program headers don't
immediately follow the elf header. Add a patch submitted upstream
to address this.

(From OE-Core rev: faaf5f34332290708f3720a5488b3d1549d9e95a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e7811c787bbe2f5d49b3506309499acc27189988)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../patchelf/patchelf/fix-phdrs.patch         | 37 +++++++++++++++++++
 .../patchelf/patchelf_0.10.bb                 |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
new file mode 100644
index 0000000000..d087bd7855
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/fix-phdrs.patch
@@ -0,0 +1,37 @@
+When running patchelf on some existing patchelf'd binaries to change to longer 
+RPATHS, ldd would report the binaries as invalid. The output of objdump -x on 
+those libraryies should show the top of the .dynamic section is getting trashed,
+something like:
+
+0x600000001 0x0000000000429000
+0x335000 0x0000000000335000
+0xc740 0x000000000000c740
+0x1000 0x0000000000009098
+SONAME libglib-2.0.so.0
+
+(which should be RPATH and DT_NEEDED entries)
+
+This was tracked down to the code which injects the PT_LOAD section.
+
+The issue is that if the program headers were previously relocated to the end 
+of the file which was how patchelf operated previously, the relocation code 
+wouldn't work properly on a second run as it now assumes they're located after 
+the elf header. This change forces them back to immediately follow the elf
+header which is where the code has made space for them.
+
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/202]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+RP 2020/6/2
+
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -762,6 +762,7 @@ void ElfFile<ElfFileParamNames>::rewrite
+     }
+ 
+     /* Add a segment that maps the replaced sections into memory. */
++    wri(hdr->e_phoff, sizeof(Elf_Ehdr));
+     phdrs.resize(rdi(hdr->e_phnum) + 1);
+     wri(hdr->e_phnum, rdi(hdr->e_phnum) + 1);
+     Elf_Phdr & phdr = phdrs[rdi(hdr->e_phnum) - 1];
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.10.bb b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
index cc983e033a..e4a604ec70 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.10.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.10.bb
@@ -1,6 +1,7 @@
 SRC_URI = "https://nixos.org/releases/${BPN}/${BPN}-${PV}/${BPN}-${PV}.tar.bz2 \
            file://handle-read-only-files.patch \
            file://fix-adjusting-startPage.patch \
+           file://fix-phdrs.patch \
            "
 
 LICENSE = "GPLv3"
-- 
2.25.4

