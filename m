Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 63E827604C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:35:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5F8Z7xj027610
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jun 2018 01:35:07 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 15 Jun 2018 01:35:07 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<alexander.kanavin@linux.intel.com>, <raj.khem@gmail.com>
Date: Fri, 15 Jun 2018 16:35:05 +0800
Message-ID: <1529051705-100332-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] boost: Improve reproducibility
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
X-List-Received-Date: Fri, 15 Jun 2018 08:35:08 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Set .file section explicitly for .S files to avoid
the linker introduces the host path in symbols for
object files whose source file is .S
Otherwise, there is a host path in the symbols as
below:
$ readelf --wide --symbols /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/libboost_context.so.1.67.0
42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/asm/make_x86_64_sysv_elf_gas.o

[YOCTO #12708]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...e_x86_64_sysv_elf_gas.S-set-.file-section.patch | 48 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.67.0.bb         |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch

diff --git a/meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch b/meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch
new file mode 100644
index 0000000..c2ac49e
--- /dev/null
+++ b/meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch
@@ -0,0 +1,48 @@
+From c99f798407e44c86e9f64f5b1adf3b4d0549eef2 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 15 Jun 2018 16:21:56 +0800
+Subject: [PATCH] make_x86_64_sysv_elf_gas.S: set .file section
+
+Set .file section explicitly for .S files to avoid
+the linker introduces the host path in symbols for
+object files whose source file is .S
+Otherwise, there is a host path in the symbols as below:
+$ readelf --wide --symbols /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/libboost_context.so.1.67.0
+
+42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/asm/make_x86_64_sysv_elf_gas.o
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ libs/context/src/asm/make_i386_sysv_elf_gas.S   | 1 +
+ libs/context/src/asm/make_x86_64_sysv_elf_gas.S | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/libs/context/src/asm/make_i386_sysv_elf_gas.S b/libs/context/src/asm/make_i386_sysv_elf_gas.S
+index de77e88..b76de26 100644
+--- a/libs/context/src/asm/make_i386_sysv_elf_gas.S
++++ b/libs/context/src/asm/make_i386_sysv_elf_gas.S
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "make_i386_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff --git a/libs/context/src/asm/make_x86_64_sysv_elf_gas.S b/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
+index 25a0c00..0ef3756 100644
+--- a/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
++++ b/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "make_x86_64_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .type make_fcontext,@function
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/boost/boost_1.67.0.bb b/meta/recipes-support/boost/boost_1.67.0.bb
index eb50899..7bb4511 100644
--- a/meta/recipes-support/boost/boost_1.67.0.bb
+++ b/meta/recipes-support/boost/boost_1.67.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "\
     file://boost-math-disable-pch-for-gcc.patch \
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+    file://0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch \
 "
-- 
2.7.4


