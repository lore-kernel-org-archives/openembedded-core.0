Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4066272ACC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 22:51:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jan 2015 14:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,733,1413270000"; d="scan'208";a="635157236"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.248.119])
	by orsmga001.jf.intel.com with ESMTP; 09 Jan 2015 14:51:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jan 2015 14:51:39 -0800
Message-Id: <5502855f5d78fb94cfb79b1cab8abe3605b7da61.1420843293.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1420843293.git.sgw@linux.intel.com>
References: <cover.1420843293.git.sgw@linux.intel.com>
In-Reply-To: <cover.1420843293.git.sgw@linux.intel.com>
References: <cover.1420843293.git.sgw@linux.intel.com>
Subject: [PATCH 2/5 v2] gnu-efi: Upgrade to 3.0.1
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
X-List-Received-Date: Fri, 09 Jan 2015 22:51:58 -0000

This newer version adds ARM64 support and the license
information is updated to correctly reflect BSD and GPLv2

Remove parallel-make.patch that was accepted upstream.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnu-efi/gnu-efi/parallel-make.patch            | 22 ----------------------
 .../gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0.1.bb}  | 17 +++++++++--------
 2 files changed, 9 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0u.bb => gnu-efi_3.0.1.bb} (55%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
deleted file mode 100644
index 27c94e8..0000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix parallel make failure
-
-Upstream-Status: Submitted [Maintainer directly]
-
-Add a missing dependency which resulted in a race leading to failure
-on larger values of -j.
-
-Signed-off-by: Darren Hart <dvhart@linux.intel.com>
-
-Index: gnu-efi-3.0/Makefile
-===================================================================
---- gnu-efi-3.0.orig/Makefile
-+++ gnu-efi-3.0/Makefile
-@@ -42,6 +42,8 @@ include $(SRCDIR)/Make.defaults
- 
- SUBDIRS = lib gnuefi inc apps
- 
-+gnuefi: lib
-+
- all:	check_gcc $(SUBDIRS)
- 
- $(SUBDIRS):
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
similarity index 55%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
index dbf2a07..f2603db 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.1.bb
@@ -1,19 +1,20 @@
 SUMMARY = "Libraries for producing EFI binaries"
 HOMEPAGE = "http://sourceforge.net/projects/gnu-efi/"
 SECTION = "devel"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=5fb358a180f484b285b0d99acdc29666"
+LICENSE = "GPLv2+ | BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://README.efilib;md5=d234379cbdd5c97c64554da2fcd07a8e \
+                    file://gnuefi/crt0-efi-aarch64.S;endline=19;md5=16ba1cab9013de9dd9746d1ee44f5b14 \
+                    file://gnuefi/crt0-efi-arm.S;endline=10;md5=b413c332f01f0265911d4aba42d5cf2c \
+                   "
 
-SRC_URI = "http://downloads.sourceforge.net/gnu-efi/gnu-efi_3.0u.orig.tar.gz \
-           file://parallel-make.patch \
+SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
           "
-SRC_URI[md5sum] = "d15d3c700e79a1e2938544d73edc572d"
-SRC_URI[sha256sum] = "3c0d450d5829204ca05dcb3b2aae772e52c379b7c7e09146759c6315606f934e"
 
-COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
+SRC_URI[md5sum] = "c4099c443b6b0c2b04dedc33e7814ec0"
+SRC_URI[sha256sum] = "e2e8d5940347eebfb00eaaeef107a8ba59e7838e40bc716c74d9a36fff648f1f"
 
-S = "${WORKDIR}/gnu-efi-3.0"
+COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
 
 def gnu_efi_arch(d):
     import re
-- 
2.1.0


