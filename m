Return-Path: <darcy.watkins@inmotiontechnology.com>
X-Greylist: delayed 381 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 29 Jul 2014 16:19:33 UTC
Received: from maui.inmotion.gotdns.com (gw.inmotiontechnology.com
	[184.71.143.26])
	by mail.openembedded.org (Postfix) with ESMTP id 63AF36A359
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jul 2014 16:19:33 +0000 (UTC)
Received: from kihei.inmotion.gotdns.com (kihei.inmotion.gotdns.com
	[192.168.3.163])
	by maui.inmotion.gotdns.com (Postfix) with ESMTP id 32A79B6221C;
	Tue, 29 Jul 2014 09:13:13 -0700 (PDT)
Received: by kihei.inmotion.gotdns.com (Postfix, from userid 1029)
	id 1E287E0450; Tue, 29 Jul 2014 09:13:13 -0700 (PDT)
From: Darcy Watkins <dwatkins@sierrawireless.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jul 2014 09:13:05 -0700
Message-Id: <1406650385-23946-1-git-send-email-dwatkins@sierrawireless.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [daisy][PATCH] binutils: Add fix for recent patch on older gcc
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
X-List-Received-Date: Tue, 29 Jul 2014 16:19:42 -0000

From: Darcy Watkins <dwatkins>

The recent bintuils patch update breaks on older gccs such as CentOS 6.
Backport a patch to address this.

(From master: 540b7a196a00c4dc1bf8f7c87e68e80ab310756e)
(From OE-Core rev: 76f65e73081f52cea718ef164f9d1d7a5c65d537)

Signed-off-by: Darcy Watkins <dwatkins@sierrawireless.com>
---
 meta/recipes-devtools/binutils/binutils-2.24.inc   |  1 +
 .../binutils/binutils-uninitialised-warning.patch  | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.24.inc b/meta/recipes-devtools/binutils/binutils-2.24.inc
index ef6a4eb..8f3216f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.24.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.24.inc
@@ -31,6 +31,7 @@ SRC_URI = "\
      file://fix-pr16428.patch \
      file://replace_macros_with_static_inline.patch \
      file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.patch \
+     file://binutils-uninitialised-warning.patch \
      "
 
 SRC_URI[md5sum] = "e0f71a7b2ddab0f8612336ac81d9636b"
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.patch b/meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.patch
new file mode 100644
index 0000000..2feb80c
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/binutils-uninitialised-warning.patch
@@ -0,0 +1,50 @@
+From f9c316c4d75be236bbaa8464ef803ed2d3859d6d Mon Sep 17 00:00:00 2001
+From: H.J. Lu <hjl.tools@gmail.com>
+Date: Wed, 15 Jan 2014 07:43:19 -0800
+Subject: [PATCH 1/1] Silence uninitialized warning on ehdr_start_save
+
+Older GCC, like 4.1/4.2, will issue an uninitialized warning on
+ehdr_start_save.  This patch silences by using
+
+struct bfd_link_hash_entry ehdr_start_save = ehdr_start_save;
+
+	* emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
+	Silence uninitialized warning on ehdr_start_save with older
+	GCC.
+
+Upstream-Status: Backport
+---
+ ld/ChangeLog          |    6 ++++++
+ ld/emultempl/elf32.em |    2 +-
+ 2 files changed, 7 insertions(+), 1 deletions(-)
+
+#diff --git a/ld/ChangeLog b/ld/ChangeLog
+#index eaa6b93..91055de 100644
+#--- a/ld/ChangeLog
+#+++ b/ld/ChangeLog
+#@@ -1,3 +1,9 @@
+#+2014-01-15  H.J. Lu  <hongjiu.lu@intel.com>
+#+
+#+	* emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation):
+#+	Silence uninitialized warning on ehdr_start_save with older
+#+	GCC.
+#+
+# 2014-01-15  Alan Modra  <amodra@gmail.com>
+# 
+# 	* emultempl/elf32.em (gld${EMULATION_NAME}_before_allocation): Define
+diff --git a/ld/emultempl/elf32.em b/ld/emultempl/elf32.em
+index 13f86f0..569c7f7 100644
+--- a/ld/emultempl/elf32.em
++++ b/ld/emultempl/elf32.em
+@@ -1481,7 +1481,7 @@ gld${EMULATION_NAME}_before_allocation (void)
+   asection *sinterp;
+   bfd *abfd;
+   struct elf_link_hash_entry *ehdr_start = NULL;
+-  struct bfd_link_hash_entry ehdr_start_save;
++  struct bfd_link_hash_entry ehdr_start_save = ehdr_start_save;
+ 
+   if (is_elf_hash_table (link_info.hash))
+     {
+-- 
+1.7.1
+
-- 
1.7.12.4


