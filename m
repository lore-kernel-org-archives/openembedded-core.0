Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3muicDnaTpKOOMZbUJTEZnBd8MwMuZkHcB605CYLKClrMGQDTeoEipUxVu43ErerMn8FZkSOi3
 EfqNbshrp13Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794699"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794699"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:58 -0700
IronPort-SDR: o+toXuPRFRGkNVZ+PJafJQ1tHEFGm+rVxUBLV6azc1wm811RFR35grd6r/qAoiFQjwVv/NkceH
 XY0Eaz+K4+EQ==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331548"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/31] patchelf: Fix alignment patch
Date: Fri,  7 May 2021 15:02:17 +0800
Message-Id: <69e5a81ceeba3104ba5954dadc7c65cfa4b1be9b.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous fix was in the right direction but needed to account
for the section alignment of the current section. Tweak the patch
to handle this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e464efc07a8997c43998a9c6a9544be11ab4f303)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../patchelf/patchelf/alignmentfix.patch      | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
index 62e11a5e7f..a06876e50a 100644
--- a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
+++ b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
@@ -31,12 +31,14 @@ Index: git/src/patchelf.cc
 ===================================================================
 --- git.orig/src/patchelf.cc
 +++ git/src/patchelf.cc
-@@ -1035,6 +1035,8 @@ void ElfFile<ElfFileParamNames>::normali
-                 phdrs.push_back(new_phdr);
- 
-             curr_off += size;
-+            /* The next section offset would be aligned */
-+            curr_off = roundUp(curr_off, sectionAlignment);
-         }
-     }
-     wri(hdr->e_phnum, phdrs.size());
+@@ -1010,8 +1010,9 @@ void ElfFile<ElfFileParamNames>::normali
+             size_t size = 0;
+             for (const auto & shdr : shdrs) {
+                 if (rdi(shdr.sh_type) != SHT_NOTE) continue;
+-                if (rdi(shdr.sh_offset) != curr_off) continue;
++                if (rdi(shdr.sh_offset) != roundUp(curr_off, rdi(shdr.sh_addralign))) continue;
+                 size = rdi(shdr.sh_size);
++                curr_off = roundUp(curr_off, rdi(shdr.sh_addralign));
+                 break;
+             }
+             if (size == 0)
-- 
2.30.2

