Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8A10860237
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 03:55:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9B3tXxk017557
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:55:33 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 10 Oct 2018 20:55:32 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Oct 2018 12:06:53 +0800
Message-ID: <cd5b331cec3562d6adcf4f8d4b5d42679894d5ce.1539230757.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1539230757.git.liezhi.yang@windriver.com>
References: <cover.1539230757.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] prelink: Fix Segmentation fault error when prelink qemu
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
X-List-Received-Date: Thu, 11 Oct 2018 03:55:32 -0000
Content-Type: text/plain

The info->resolvetls might be NULL according to src/prelink.c:
[snip]
 /* Dynamic linker does not depend on any other library,
    all symbols resolve to themselves with the exception
    of SHN_UNDEF symbols which resolve to 0.  */
if (info->symtab[r_sym].st_shndx == SHN_UNDEF)
  {
    info->resolveent = NULL;
    info->resolvetls = NULL;
[snip]

So we must check it before use its members, otherwise, there might be
Segmentation fault error.

Fixed:
MACHINE = "qemumips"
IMAGE_INSTALL_append = " qemu"
$ bitbake core-image-minimal
[snip]
| /path/to/qemumips-poky-linux/core-image-minimal/1.0-r0/temp/run.prelink_image.1000: line 111:  1010 Segmentation fault      (core dumped)
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ps.c-check-info-resolvetls-before-use-its.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/prelink/prelink_git.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch

diff --git a/meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch b/meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch
new file mode 100644
index 0000000..b168824
--- /dev/null
+++ b/meta/recipes-devtools/prelink/prelink/0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch
@@ -0,0 +1,51 @@
+From 2136969e3e196b9cf7f4788340efa4b1d9b39565 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 11 Oct 2018 10:05:52 +0800
+Subject: [PATCH] src/arch-mips.c: check info->resolvetls before use its member
+
+The info->resolvetls might be NULL according to src/prelink.c:
+[snip]
+ /* Dynamic linker does not depend on any other library,
+    all symbols resolve to themselves with the exception
+    of SHN_UNDEF symbols which resolve to 0.  */
+if (info->symtab[r_sym].st_shndx == SHN_UNDEF)
+  {
+    info->resolveent = NULL;
+    info->resolvetls = NULL;
+[snip]
+
+So we must check it before use its members, otherwise, there might be
+Segmentation fault error.
+
+Fixed:
+MACHINE = "qemumips"
+IMAGE_INSTALL_append = " qemu"
+$ bitbake core-image-minimal
+[snip]
+| /path/to/qemumips-poky-linux/core-image-minimal/1.0-r0/temp/run.prelink_image.1000: line 111:  1010 Segmentation fault      (core dumped)
+[snip]
+
+Upstream-Status: Submitted [https://lists.yoctoproject.org/pipermail/yocto/2018-October/042812.html]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/arch-mips.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/arch-mips.c b/src/arch-mips.c
+index ccb1834..02c608f 100644
+--- a/src/arch-mips.c
++++ b/src/arch-mips.c
+@@ -567,7 +567,8 @@ mips_prelink_reloc (struct prelink_info *info, GElf_Addr r_offset,
+       if (dso->ehdr.e_type == ET_EXEC)
+ 	{
+ 	  value = info->resolve (info, r_sym, r_type);
+-	  value += info->resolvetls->offset - TLS_TP_OFFSET;
++	  if (info->resolvetls != NULL)
++	    value += info->resolvetls->offset - TLS_TP_OFFSET;
+ 	  if (r_type == R_MIPS_TLS_TPREL32)
+ 	    mips_prelink_32bit_reloc (dso, rela, value);
+ 	  else
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 3f2a2e2..b1261d5 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink_sta
            file://prelink.cron.daily \
            file://prelink.default \
            file://macros.prelink \
+           file://0001-src-arch-mips.c-check-info-resolvetls-before-use-its.patch \
 "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.7.4


