Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A1966025E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 06:20:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4V6KWDc016604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 May 2018 23:20:33 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 30 May 2018 23:20:31 -0700
From: <mingli.yu@windriver.com>
To: <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2018 23:20:31 -0700
Message-ID: <20180531062031.40334-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] boost: Improve reproducibility
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
X-List-Received-Date: Thu, 31 May 2018 06:20:36 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

boost_context includes some assembly source
files and will export the assembly object file
make_x86_64_sysv_elf_gas.o which contains host
path as below:
$ readelf --wide --symbols /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/libboost_context.so.1.67
42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/asm/make_x86_64_sysv_elf_gas.o

Enable stirp for boost_context to hidden the
symbols

[YOCTO #12708]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-support/boost/boost.inc               |  1 +
 .../boost/boost-context-hidden-the-symbols.patch   | 37 ++++++++++++++++++++++
 meta/recipes-support/boost/boost_1.67.0.bb         |  1 +
 3 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/boost-context-hidden-the-symbols.patch

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 6984bee7777..5a2086b3332 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -197,4 +197,5 @@ do_install() {
 
 }
 
+INSANE_SKIP_${PN} = "already-stripped"
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/boost/boost/boost-context-hidden-the-symbols.patch b/meta/recipes-support/boost/boost/boost-context-hidden-the-symbols.patch
new file mode 100644
index 00000000000..0b6ed285621
--- /dev/null
+++ b/meta/recipes-support/boost/boost/boost-context-hidden-the-symbols.patch
@@ -0,0 +1,37 @@
+From 8e0c2d18a929f05bfadcbf351b244488917af86a Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Wed, 30 May 2018 15:05:57 +0800
+Subject: [PATCH] boost_context: strip the symbols
+
+The boost context library exports the 
+make_x86_64_sysv_elf_gas.o which contains
+host path as below:
+$ readelf --wide --symbols /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/libboost_context.so.1.67.0
+
+42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/asm/make_x86_64_sysv_elf_gas.o
+
+Enable strip to hidden the symbols for 
+boost context library 
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ libs/context/build/Jamfile.v2 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libs/context/build/Jamfile.v2 b/libs/context/build/Jamfile.v2
+index 82ee76e..a6bd12f 100644
+--- a/libs/context/build/Jamfile.v2
++++ b/libs/context/build/Jamfile.v2
+@@ -822,6 +822,7 @@ lib boost_context
+    : impl_sources
+      execution_context.cpp
+      stack_traits_sources
++   : <strip>on
+    ;
+ 
+ boost-install boost_context ;
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/boost/boost_1.67.0.bb b/meta/recipes-support/boost/boost_1.67.0.bb
index eb50899d562..8ba32d1574f 100644
--- a/meta/recipes-support/boost/boost_1.67.0.bb
+++ b/meta/recipes-support/boost/boost_1.67.0.bb
@@ -7,4 +7,5 @@ SRC_URI += "\
     file://boost-math-disable-pch-for-gcc.patch \
     file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
     file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
+    file://boost-context-hidden-the-symbols.patch \
 "
-- 
2.11.0


