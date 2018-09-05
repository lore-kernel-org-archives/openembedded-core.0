Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BBBD774C97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 16:30:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w85GUhpH021121
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2018 09:30:43 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 09:30:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2018 12:30:40 -0400
Message-ID: <20180905163040.171177-2-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20180905163040.171177-1-mark.hatle@windriver.com>
References: <20180905163040.171177-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] prelink: Update to the latest version of prelink
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
X-List-Received-Date: Wed, 05 Sep 2018 16:30:41 -0000
Content-Type: text/plain

The new version of prelink includes the fix for a segmentation fault due to
using e_shnum vs e_shstrndx.

In addition the following changes are incorporated:

    2018-08-29   Khem Raj <raj.khem@gmail.com>
	* src/elf.h: Add RISC-V defines
	* src/rtld/dl-tls.c: Add RISC-V support
	* src/rtld/rtld.c: Add RISC-V support

    2018-08-29  Robert Yang  <liezhi.yang@windriver.com>
	* src/dso.c: use ehdr.e_shstrndx as index

    2017-06-20  Andrew Stubbs  <ams@codesourcery.com>
	* src/arch-x86_64.c (x86_64_prelink_conflict_rela): Also convert
	R_X86_64_32 conflicts to R_X86_64_IRELATIVE for ifuncs.
	* src/arch-x86_64.c (PL_ARCH(x32)): Set mmap_end to 0x60000000.

    2017-06-20  Joseph Myers  <joseph@codesourcery.com>
	* src/rtld/rtld.c (load_ld_so_conf): Add argument use_x32.
	(main): Update call to load_ld_so_conf.

    2017-06-20   Kyle Russell <bkylerussell@gmail.com>
	* src/rtld/rtld.c: Add missing DT_NEEDED DSOs to needed_list

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 ...01-src-dso.c-use-ehdr.e_shstrndx-as-index.patch | 39 ----------------------
 meta/recipes-devtools/prelink/prelink_git.bb       |  5 ++-
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch

diff --git a/meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch b/meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch
deleted file mode 100644
index d2cd1a70e2..0000000000
--- a/meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 107290910ff846532d944ddb78edda436bb6ae63 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 15 Aug 2018 17:53:43 +0800
-Subject: [PATCH] src/dso.c: use ehdr.e_shstrndx as index
-
-According to struct elf32_hd, the e_shnum is section header number, and the
-index is e_shstrndx, not e_shnum.
-
-This can fix segmention fault when handle libqb.so.0.18.2 from libqb_1.0.3.
-It fails to handle libqb.so.0.18.2 and get errors:
-Symbol section index outside of section numbers
-
-Then segmentation fault, this is because the e_shnum is 34, while e_shstrndx is
-27 (it would be 33 when no errors), I've checked several elf files to confirm
-that the ones after e_shstrndx is NULL, so use e_shstrndx should be correct.
-
-Upstream-Status: Submitted [https://lists.yoctoproject.org/pipermail/yocto/2018-August/042240.html]
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- src/dso.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dso.c b/src/dso.c
-index ae5e04d..c59d81f 100644
---- a/src/dso.c
-+++ b/src/dso.c
-@@ -1659,7 +1659,7 @@ close_dso_1 (DSO *dso)
-     {
-       int i;
- 
--      for (i = 1; i < dso->ehdr.e_shnum; ++i)
-+      for (i = 1; i < dso->ehdr.e_shstrndx; ++i)
- 	{
- 	  Elf_Scn *scn = dso->scn[i];
- 	  Elf_Data *data = NULL;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index c5eaedd4d9..3f2a2e227d 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -9,7 +9,7 @@ and executables, so that far fewer relocations need to be resolved at \
 runtime and thus programs come up faster."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-SRCREV = "05aeafd053e56356ec8c62f4bb8f7b95bae192f3"
+SRCREV = "a853a5d715d84eec93aa68e8f2df26b7d860f5b2"
 PV = "1.0+git${SRCPV}"
 
 #
@@ -27,12 +27,11 @@ FILES_${PN}-cron = "${sysconfdir}/cron.daily ${sysconfdir}/default"
 
 PACKAGES =+ "${PN}-cron"
 
-SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
+SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink_staging \
            file://prelink.conf \
            file://prelink.cron.daily \
            file://prelink.default \
            file://macros.prelink \
-           file://0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch \
 "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.16.0.rc2


