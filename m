Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0B8E37FB46
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 15:00:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 471Ld94dCtz3P
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:00:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572188445;
	bh=ReP30iuKhly6USo4snYtdlpLwpbR+IJK+vs2lWCQ1iw=;
	h=From:To:Subject:Date:From;
	b=IknPKM7l8iATSSTouUo+aNQA/P0U/6bE9S82MZta8eXkzeYzd0Jh2M6xsfytU7jCa
	+67Tl5RA09SZPYAFhua5WSOxWz1gqiZUccw23yq4C+kAB4/W/gdO+U73QHES1eHwhP
	DRQcef5p6SHodV0djD7GrJ9iOND3CBg/K+fQjNKjVvgWTGt+ix5x1bFiOcNmgYBPAR
	bSKTYEDxHprBEn+er0VYgAtdMwrQMGSsBDwxh2mnnpIRgblcgP7L31HDznDGfylpxw
	VxwH1LkNGIUG/0Gy1CsBJQUluozufou4DDUWiNUSDDZx4+Lug2GNwh3bsun2Xzngj7
	eVvL+CF8Qtj6Tx3Vah2AREtADbhQVejI9biealRXlAtBW5JLQeSJJFhTkcDWH9MaYW
	YaUzURLWWywtm/Qc3HRffOSh+PAR697TN/RKB3Xs9sI41+X/Tch0JHXbboYhlArrgn
	84S6NaUEIIefFsCL9A2bUFb6zm+XIY7InpQZfB2ORzDH0FTKtzY+9Ggsk1Dfe09IA3
	uL+mQi2aSQDir4fTqIurTF62xzuFP93gbZcOPQKnLEjmxzpFczT5rbt0nVsn058bOz
	CaIAXIro7cb1xeHHGVdVzPkKZaEfcTI+SuuD4GmyduoMX95ivbdqapzylqfVuaqSz3
	ATGuni5F5XZu1GydeNEA8s48=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Oct 2019 17:00:44 +0200
Message-Id: <20191027150044.27128-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] gnu-efi: Upgrade 3.0.9 -> 3.0.10
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
X-List-Received-Date: Sun, 27 Oct 2019 15:00:46 -0000

Part of patch fixed upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v2: systemd-boot build breakage fixed
---
 ...evert-efilink-fix-build-with-gcc-4.8.patch | 38 +++++++++++++++++++
 .../gnu-efi/parallel-make-archives.patch      | 18 ---------
 .../{gnu-efi_3.0.9.bb => gnu-efi_3.0.10.bb}   |  5 ++-
 3 files changed, 41 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.9.bb => gnu-efi_3.0.10.bb} (92%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch
new file mode 100644
index 0000000000..8ab25113a4
--- /dev/null
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch
@@ -0,0 +1,38 @@
+From 1f7b2e5bd6603b30202a66b6317a41e2be85742b Mon Sep 17 00:00:00 2001
+From: Esben Haabendal <esben@haabendal.dk>
+Date: Tue, 26 Mar 2019 13:37:02 +0100
+Subject: Revert "efilink: fix build with gcc 4.8"
+
+This reverts commit 6335e5c697c57d8b5854b8202de3733bcb151ca6, as it breaks
+gcc builds with '-nostdinc' flag.
+
+The fix in 1a53d8f88a452847b25f9689f9a08dbcf82c86e4
+(Fix for problem with undeclared intptr_t type), which is also merged
+fixes the same problem, without causing breakage.
+
+Upstream-Status: Submitted [https://sourceforge.net/p/gnu-efi/code/merge-requests/6/]
+
+Signed-off-by: Esben Haabendal <esben@haabendal.dk>
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ inc/efilink.h | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/inc/efilink.h b/inc/efilink.h
+index b69a6fd..cc5aa2d 100644
+--- a/inc/efilink.h
++++ b/inc/efilink.h
+@@ -1,10 +1,6 @@
+ #ifndef _EFI_LINK_H
+ #define _EFI_LINK_H
+ 
+-#if defined(__GNUC__)
+-#include <stdint.h>
+-#endif
+-
+ /*++
+ 
+ Copyright (c) 1998  Intel Corporation
+-- 
+2.20.1
+
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
index a9806cfdf6..8a0138bbe5 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi/parallel-make-archives.patch
@@ -19,25 +19,7 @@ Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
 [Rebased for 3.0.8]
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- gnuefi/Makefile | 3 ++-
- lib/Makefile    | 2 +-
- 2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/gnuefi/Makefile b/gnuefi/Makefile
-index 2a61699..89b560a 100644
---- a/gnuefi/Makefile
-+++ b/gnuefi/Makefile
-@@ -54,7 +54,8 @@ TARGETS	= crt0-efi-$(ARCH).o libgnuefi.a
- 
- all:	$(TARGETS)
- 
--libgnuefi.a: $(patsubst %,libgnuefi.a(%),$(OBJS))
-+libgnuefi.a: $(OBJS)
-+	$(AR) $(ARFLAGS) $@ $(OBJS)
- 
- clean:
- 	rm -f $(TARGETS) *~ *.o $(OBJS)
 diff --git a/lib/Makefile b/lib/Makefile
 index 0e6410d..048751a 100644
 --- a/lib/Makefile
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
similarity index 92%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
index 6d4c303353..ac6257fab9 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.9.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
@@ -16,10 +16,11 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
+           file://0001-Revert-efilink-fix-build-with-gcc-4.8.patch \
            "
 
-SRC_URI[md5sum] = "32af17b917545a693e549af2439c4a99"
-SRC_URI[sha256sum] = "6715ea7eae1c7e4fc5041034bd3f107ec2911962ed284a081e491646b12277f0"
+SRC_URI[md5sum] = "960a8379b6f95ee73d7778b70bf2a089"
+SRC_URI[sha256sum] = "f12082a3a5f0c3e38c67262a9f34245d139ac2cdfc0a0bdcf03c9b1f56fa4fed"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.17.1


