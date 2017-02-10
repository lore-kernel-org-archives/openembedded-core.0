Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0015177248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1A3NKeX026292
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:20 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:19 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:08 -0800
Message-ID: <1de59d2add506592107d445ae32e17154c523993.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] gnu-efi: 3.0.4 -> 3.0.5
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:20 -0000
Content-Type: text/plain

* Remove aarch64-initplat.c-fix-const-qualifier.patch which is already
  in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../aarch64-initplat.c-fix-const-qualifier.patch   | 35 ----------------------
 .../gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} |  5 ++--
 2 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.4.bb => gnu-efi_3.0.5.bb} (92%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
deleted file mode 100644
index 965f074ebe5..00000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/aarch64-initplat.c-fix-const-qualifier.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From dc83b84dc8b4e71efce47143497aac6c126065cf Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Mon, 18 Jul 2016 08:40:29 -0700
-Subject: [PATCH] lib/aarch64/initplat.c: fix const qualifier
-
-Fixed:
-initplat.c:44:35: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
-     unsigned char *p = dest, *q = src;
-                                   ^~~
-cc1: all warnings being treated as errors
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- lib/aarch64/initplat.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/aarch64/initplat.c b/lib/aarch64/initplat.c
-index 2ac03a7..aae7beb 100644
---- a/lib/aarch64/initplat.c
-+++ b/lib/aarch64/initplat.c
-@@ -41,7 +41,8 @@ void *memset(void *s, int c, __SIZE_TYPE__ n)
- 
- void *memcpy(void *dest, const void *src, __SIZE_TYPE__ n)
- {
--    unsigned char *p = dest, *q = src;
-+    unsigned char *p = dest;
-+    const unsigned char *q = src;
- 
-     while (n--)
-         *p++ = *q++;
--- 
-2.9.0
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
similarity index 92%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
index 9edd539b556..f46381d5f19 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.4.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.5.bb
@@ -16,11 +16,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
            file://gcc46-compatibility.patch \
-           file://aarch64-initplat.c-fix-const-qualifier.patch \
           "
 
-SRC_URI[md5sum] = "612e0f327f31c4b8468ef55f4eeb9649"
-SRC_URI[sha256sum] = "51a00428c3ccb96db24089ed8394843c4f83cf8f42c6a4dfddb4b7c23f2bf8af"
+SRC_URI[md5sum] = "1f719c9c135778aa6b087b89a1cc2423"
+SRC_URI[sha256sum] = "bd8fcd5914f18fc0e4ba948ab03b00013e528504f529c60739b748f6ef130b22"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.11.0.rc2.dirty


