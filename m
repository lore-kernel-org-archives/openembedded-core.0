Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6884.1620370976483734079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: GO5w6hnfidUVpovDqNEnjxvy0SS8mqXO4xRsnG+KtG8C5+IvsVTiemlLGGBIIxKIegu1h4d8p1
 RQM4/t5sdBRg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794684"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794684"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:55 -0700
IronPort-SDR: iGj9qFyrhrSoQtY1wVscUi4qyL6loD2ANp9P6zyQl8XxVHRddWE5uJroQwA25I57k6dqAeD7P3
 2RgFDkX2gsAA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331543"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/31] patchelf: Fix note section alignment issues
Date: Fri,  7 May 2021 15:02:15 +0800
Message-Id: <8a051bf055623f1ef5ca94d9291162ac7ce871c6.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Improve note section normalization was added to patchelf in recent versions
however if fails if there are two note sections which aren't sized to match
section alignment. Tweak the code to account for section alignment.

This fixes patchelf failures on the autobuilder, particularly to ccache-native.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fee8dde0d597b511b37d8dcf215e8355980d5f2b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../patchelf/patchelf/alignmentfix.patch      | 42 +++++++++++++++++++
 .../patchelf/patchelf_0.12.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch

diff --git a/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
new file mode 100644
index 0000000000..62e11a5e7f
--- /dev/null
+++ b/meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
@@ -0,0 +1,42 @@
+If a binary has multiple SHT_NOTE sections and corresponding PT_NOTE
+headers, we can see the error:
+
+patchelf: cannot normalize PT_NOTE segment: non-contiguous SHT_NOTE sections
+
+if the SHT_NOTE sections aren't sized to end on aligned boundaries. An example
+would be a binary with:
+
+  [ 2] .note.ABI-tag     NOTE             00000000000002f4  000002f4
+       0000000000000020  0000000000000000   A       0     0     4
+  [ 3] .note.gnu.propert NOTE             0000000000000318  00000318
+       0000000000000030  0000000000000000   A       0     0     8
+  [ 4] .note.gnu.build-i NOTE             0000000000000348  00000348
+       0000000000000024  0000000000000000   A       0     0     4
+
+  NOTE           0x0000000000000318 0x0000000000000318 0x0000000000000318
+                 0x0000000000000030 0x0000000000000030  R      0x8
+  NOTE           0x00000000000002f4 0x00000000000002f4 0x00000000000002f4
+                 0x0000000000000078 0x0000000000000074  R      0x4
+
+since the PT_NOTE section at 2f4 covers [2] and [3] but the code
+calclates curr_off should be 314, not the 318 in the binary. This
+is an alignment issue.
+
+To fix this, we need to round curr_off to the next section alignment.
+
+Upstream-Status: Submitted [https://github.com/NixOS/patchelf/pull/274]
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/src/patchelf.cc
+===================================================================
+--- git.orig/src/patchelf.cc
++++ git/src/patchelf.cc
+@@ -1035,6 +1035,8 @@ void ElfFile<ElfFileParamNames>::normali
+                 phdrs.push_back(new_phdr);
+ 
+             curr_off += size;
++            /* The next section offset would be aligned */
++            curr_off = roundUp(curr_off, sectionAlignment);
+         }
+     }
+     wri(hdr->e_phnum, phdrs.size());
diff --git a/meta/recipes-devtools/patchelf/patchelf_0.12.bb b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
index 2eb09aee32..7c97ea0789 100644
--- a/meta/recipes-devtools/patchelf/patchelf_0.12.bb
+++ b/meta/recipes-devtools/patchelf/patchelf_0.12.bb
@@ -7,6 +7,7 @@ LICENSE = "GPLv3"
 SRC_URI = "git://github.com/NixOS/patchelf;protocol=https \
            file://handle-read-only-files.patch \
            file://6edec83653ce1b5fc201ff6db93b966394766814.patch \
+           file://alignmentfix.patch \
            "
 SRCREV = "8d3a16e97294e3c5521c61b4c8835499c9918264"
 
-- 
2.30.2

