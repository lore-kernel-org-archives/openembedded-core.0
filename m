Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABE957926E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:09:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7G69EVW013708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:09:14 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 23:09:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 14:19:46 +0800
Message-ID: <a72f9d73653cd4cac9239b27c3971df9caafe4ce.1534400247.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534400247.git.liezhi.yang@windriver.com>
References: <cover.1534400247.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] prelink: use ehdr.e_shstrndx as index rather than ehdr.e_shnum
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
X-List-Received-Date: Thu, 16 Aug 2018 06:09:13 -0000
Content-Type: text/plain

[YOCTO #12791]

According to struct elf32_hd, the e_shnum is section header number, and the
index is e_shstrndx, not e_shnum.

This can fix segmention fault when handle libqb.so.0.18.2 from libqb_1.0.3.
It fails to handle libqb.so.0.18.2 and get errors:
Symbol section index outside of section numbers

Then segmentation fault, this is because the e_shnum is 34, while e_shstrndx is
27 (it would be 33 when no errors), I've checked several elf files to confirm
that the ones after e_shstrndx is NULL, so use e_shstrndx should be correct.

Fixed:
MACHINE="qemux86-64"
IMAGE_INSTALL_append = " libqb" #libqp is from meta-openembedded
$ bitbake core-image-minimal
Segmention fault

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...01-src-dso.c-use-ehdr.e_shstrndx-as-index.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/prelink/prelink_git.bb       |  4 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch

diff --git a/meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch b/meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch
new file mode 100644
index 0000000..397c7d3
--- /dev/null
+++ b/meta/recipes-devtools/prelink/prelink/0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch
@@ -0,0 +1,39 @@
+From 107290910ff846532d944ddb78edda436bb6ae63 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 15 Aug 2018 17:53:43 +0800
+Subject: [PATCH] src/dso.c: use ehdr.e_shstrndx as index
+
+According to struct elf32_hd, the e_shnum is section header number, and the
+index is e_shstrndx, not e_shnum.
+
+This can fix segmention fault when handle libqb.so.0.18.2 from libqb_1.0.3.
+It fails to handle libqb.so.0.18.2 and get errors:
+Symbol section index outside of section numbers
+
+Then segmentation fault, this is because the e_shnum is 34, while e_shstrndx is
+27 (it would be 33 when no errors), I've checked several elf files to confirm
+that the ones after e_shstrndx is NULL, so use e_shstrndx should be correct.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/dso.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dso.c b/src/dso.c
+index ae5e04d..c59d81f 100644
+--- a/src/dso.c
++++ b/src/dso.c
+@@ -1659,7 +1659,7 @@ close_dso_1 (DSO *dso)
+     {
+       int i;
+ 
+-      for (i = 1; i < dso->ehdr.e_shnum; ++i)
++      for (i = 1; i < dso->ehdr.e_shstrndx; ++i)
+ 	{
+ 	  Elf_Scn *scn = dso->scn[i];
+ 	  Elf_Data *data = NULL;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 0f6d16e..c5eaedd 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -31,7 +31,9 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink \
            file://prelink.conf \
            file://prelink.cron.daily \
            file://prelink.default \
-	   file://macros.prelink"
+           file://macros.prelink \
+           file://0001-src-dso.c-use-ehdr.e_shstrndx-as-index.patch \
+"
 UPSTREAM_CHECK_COMMITS = "1"
 
 TARGET_OS_ORIG := "${TARGET_OS}"
-- 
2.7.4


