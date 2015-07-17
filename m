Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 57C19760E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 03:04:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H34oa8019777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:04:50 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 16 Jul 2015 20:04:49 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Jul 2015 10:58:44 +0800
Message-ID: <1437101924-15700-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 2/2] kexec-tools: change powerpc memory size limit
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
X-List-Received-Date: Fri, 17 Jul 2015 03:04:50 -0000
Content-Type: text/plain

From: Quanyang Wang <quanyang.wang@windriver.com>

When run "kexec" in powerpc board, the kexec has a limit that
the kernel text and bss size must be less than 24M. But now
some kernel size exceed the limit. So we need to change the limit,
else will get the error log as below:

my_load:669: do
Could not find a free area of memory of 0x12400 bytes...
Could not find a free area of memory of 0x13000 bytes...
locate_hole failed

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...0002-powerpc-change-the-memory-size-limit.patch | 38 ++++++++++++++++++++++
 meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb     |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch b/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch
new file mode 100644
index 0000000..d6b6383
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0002-powerpc-change-the-memory-size-limit.patch
@@ -0,0 +1,38 @@
+From b19b68eab567aa534cf8dec79fe18e3dc0e14043 Mon Sep 17 00:00:00 2001
+From: Quanyang Wang <quanyang.wang@windriver.com>
+Date: Tue, 16 Jun 2015 12:59:57 +0800
+Subject: [PATCH] powerpc: change the memory size limit
+
+When run "kexec" in powerpc board, the kexec has a limit that
+the kernel text and bss size must be less than 24M. But now
+some kernel size exceed the limit. So we need to change the limit,
+else will get the error log as below:
+
+my_load:669: do
+Could not find a free area of memory of 0x12400 bytes...
+Could not find a free area of memory of 0x13000 bytes...
+locate_hole failed
+
+Upstream-Status: Pending
+
+Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
+---
+ kexec/arch/ppc/kexec-ppc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/arch/ppc/kexec-ppc.h b/kexec/arch/ppc/kexec-ppc.h
+index 904cf48..a097ecd 100644
+--- a/kexec/arch/ppc/kexec-ppc.h
++++ b/kexec/arch/ppc/kexec-ppc.h
+@@ -42,7 +42,7 @@ void dol_ppc_usage(void);
+  * During inital setup the kernel does not map the whole memory but a part of
+  * it. On Book-E that is 64MiB, 601 24MiB or 256MiB (if possible).
+  */
+-#define KERNEL_ACCESS_TOP (24 * 1024 * 1024)
++#define KERNEL_ACCESS_TOP (36 * 1024 * 1024)
+ 
+ /* boot block version 17 as defined by the linux kernel */
+ struct bootblock {
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
index db5649b..6164ff5 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.9.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch \
             file://kexec-aarch64.patch \
             file://kexec-x32.patch \
             file://0001-purgatory-Disabling-GCC-s-stack-protection.patch \
+            file://0002-powerpc-change-the-memory-size-limit.patch \
          "
 
 SRC_URI[md5sum] = "4ecb7ab7ad9eb6ce413899bdb07a8426"
-- 
1.9.1


