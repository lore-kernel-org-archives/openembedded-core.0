Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Gd5GBJPM5k5MIAfIhyRLL7tBFsNeH65m+QO5n5g8MGFOygyIdssKhw7lQIFHvWdjwvPNk+TDIy
 q3KM3MLLYkPQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258354"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:34 -0700
IronPort-SDR: 174YnPLxiNZp/jh5fEu5yTAR2uJ2uA3bSaVG6jNRB+j6un28nUqR6S9pJUknmvsamV41n8jDp7
 ijX5mxdoGHDw==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883678"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:32 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/10] patchelf: Backport fix from upstream for note section overlap error
Date: Thu, 29 Apr 2021 12:41:06 +0800
Message-Id: <738530b30c2538f7ecd151c0f0f5283075230bab.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport a patch from upstream to fix an error:
patchelf: cannot normalize PT_NOTE segment: non-contiguous SHT_NOTE sections

seen on our ubuntu1604 autobuilder worker.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80e8f7d34d7032cc94b61bf155eac7648e6b6c74)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...c83653ce1b5fc201ff6db93b966394766814.patch | 44 +++++++++++++++++++
 .../patchelf/patchelf_0.12.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch b/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
new file mode 100644
index 0000000000..ba35ec6ffc
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/6edec83653ce1b5fc201ff6db93b966394766814.patch
@@ -0,0 +1,44 @@
+From 6edec83653ce1b5fc201ff6db93b966394766814 Mon Sep 17 00:00:00 2001
+From: rmnull <rmnull@users.noreply.github.com>
+Date: Tue, 18 Aug 2020 20:22:52 +0530
+Subject: [PATCH] mark phdrs synced with sections, avoid rechecking it when
+ syncing note sections to segments.
+
+This also serves as a bug fix when a previously synced note segment
+overlaps with another section and creates a false alarm.
+
+Upstream-Status: Backport
+---
+ src/patchelf.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/patchelf.cc b/src/patchelf.cc
+index 05ec793..622f0b6 100644
+--- a/src/patchelf.cc
++++ b/src/patchelf.cc
+@@ -669,6 +669,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
+             memset(contents + rdi(shdr.sh_offset), 'X', rdi(shdr.sh_size));
+     }
+ 
++    std::set<unsigned int> noted_phdrs = {};
+     for (auto & i : replacedSections) {
+         std::string sectionName = i.first;
+         auto & shdr = findSection(sectionName);
+@@ -721,7 +722,7 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
+                 shdr.sh_addralign = orig_shdr.sh_addralign;
+ 
+             for (unsigned int j = 0; j < phdrs.size(); ++j)
+-                if (rdi(phdrs[j].p_type) == PT_NOTE) {
++                if (rdi(phdrs[j].p_type) == PT_NOTE && noted_phdrs.find(j) == noted_phdrs.end()) {
+                     Elf_Off p_start = rdi(phdrs[j].p_offset);
+                     Elf_Off p_end = p_start + rdi(phdrs[j].p_filesz);
+                     Elf_Off s_start = rdi(orig_shdr.sh_offset);
+@@ -739,6 +740,8 @@ void ElfFile<ElfFileParamNames>::writeReplacedSections(Elf_Off & curOff,
+                     phdrs[j].p_offset = shdr.sh_offset;
+                     phdrs[j].p_vaddr = phdrs[j].p_paddr = shdr.sh_addr;
+                     phdrs[j].p_filesz = phdrs[j].p_memsz = shdr.sh_size;
++
++                    noted_phdrs.insert(j);
+                 }
+         }
+ 
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 95886c6d3a..2eb09aee32 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -6,6 +6,7 @@ LICENSE = "GPLv3"
 
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
+           file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
            "
 SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
 
-- 
2.30.2

