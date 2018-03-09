Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9ADCD78937
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:03:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:03:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651897"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:03:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:47 +0200
Message-Id: <20180309185614.31113-9-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 09/36] gcc: drop patch that is already upstream
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
X-List-Received-Date: Fri, 09 Mar 2018 19:03:03 -0000

Due to patch fuzz, it was applied again, so the same code sequence was
repeated twice. Not sure if that caused any bugs, but certainly wasn't
the right thing to do.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc              |  1 -
 ...le-non-legitimate-address-in-riscv_legiti.patch | 51 ----------------------
 2 files changed, 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index 5d3b8d7ec31..d56d2c5e06c 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -73,7 +73,6 @@ SRC_URI = "\
            file://0047-sync-gcc-stddef.h-with-musl.patch \
            file://0048-gcc-Enable-static-PIE.patch \
            file://fix-segmentation-fault-precompiled-hdr.patch \
-           file://0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch \
            file://no-sse-fix-test-case-failures.patch \
            ${BACKPORTS} \
 "
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch b/meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
deleted file mode 100644
index 5a14d04b6f8..00000000000
--- a/meta/recipes-devtools/gcc/gcc-7.3/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 16210e6270e200cd4892a90ecef608906be3a130 Mon Sep 17 00:00:00 2001
-From: Kito Cheng <kito.cheng@gmail.com>
-Date: Thu, 4 May 2017 02:11:13 +0800
-Subject: [PATCH] RISC-V: Handle non-legitimate address in
- riscv_legitimize_move
-
-GCC may generate non-legitimate address due to we allow some
-load/store with non-legitimate address in pic.md.
-
-  2017-05-12  Kito Cheng  <kito.cheng@gmail.com>
-
-      * config/riscv/riscv.c (riscv_legitimize_move): Handle
-      non-legitimate address.
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- gcc/ChangeLog            |  5 +++++
- gcc/config/riscv/riscv.c | 16 ++++++++++++++++
- 2 files changed, 21 insertions(+)
-
-diff --git a/gcc/config/riscv/riscv.c b/gcc/config/riscv/riscv.c
-index f7fec4bfcf8..d519be1659a 100644
---- a/gcc/config/riscv/riscv.c
-+++ b/gcc/config/riscv/riscv.c
-@@ -1385,6 +1385,22 @@ riscv_legitimize_move (enum machine_mode mode, rtx dest, rtx src)
-       return true;
-     }
- 
-+  /* RISC-V GCC may generate non-legitimate address due to we provide some
-+     pattern for optimize access PIC local symbol and it's make GCC generate
-+     unrecognizable instruction during optmizing.  */
-+
-+  if (MEM_P (dest) && !riscv_legitimate_address_p (mode, XEXP (dest, 0),
-+						   reload_completed))
-+    {
-+      XEXP (dest, 0) = riscv_force_address (XEXP (dest, 0), mode);
-+    }
-+
-+  if (MEM_P (src) && !riscv_legitimate_address_p (mode, XEXP (src, 0),
-+						  reload_completed))
-+    {
-+      XEXP (src, 0) = riscv_force_address (XEXP (src, 0), mode);
-+    }
-+
-   return false;
- }
- 
--- 
-2.14.2
-
-- 
2.16.1


