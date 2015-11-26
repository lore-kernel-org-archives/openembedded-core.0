Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 878C66011F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 20:50:04 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3p69yq5vDXz3hjB6;
	Thu, 26 Nov 2015 21:43:15 +0100 (CET)
X-Auth-Info: a2CYZIfPLlPU9ZP3+3HD1qHaXfdxOIpSZDK1K/wLgrY=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3p69yq2G5kzvdWt;
	Thu, 26 Nov 2015 21:43:15 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 21:43:05 +0100
Message-Id: <1448570585-13334-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>, Thomas Chou <thomas@wytron.com.tw>,
	Ley Foon Tan <lftan@altera.com>, Walter Goossens <waltergoossens@home.nl>
Subject: [PATCH] cmake: Add nios2 support
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
X-List-Received-Date: Thu, 26 Nov 2015 20:50:05 -0000

Add the necessary bits for nios2 support into cmake.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Ley Foon Tan <lftan@altera.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
Cc: Thomas Chou <thomas@wytron.com.tw>
Cc: Walter Goossens <waltergoossens@home.nl>
---
 meta/recipes-devtools/cmake/cmake.inc              |  1 +
 .../cmake/cmake/0001-Add-NIOS2-CPU-support.patch   | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 57e93ac..f43327e 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -14,6 +14,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 SRC_URI = "http://www.cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
+           file://0001-Add-NIOS2-CPU-support.patch \
            "
 
 SRC_URI[md5sum] = "52638576f4e1e621fed6c3410d3a1b12"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch b/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
new file mode 100644
index 0000000..6e0ab9f
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
@@ -0,0 +1,50 @@
+From 3f8c3d3011ea192da2c761560b615f55763715ef Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Thu, 26 Nov 2015 21:31:04 +0100
+Subject: [PATCH] Add NIOS2 CPU support
+
+Add necessary bits to support the NIOS2 little-endian CPU.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Cc: Ley Foon Tan <lftan@altera.com>
+Cc: Thomas Chou <thomas@wytron.com.tw>
+Cc: Walter Goossens <waltergoossens@home.nl>
+Upstream-Status: Submitted
+---
+ Source/kwsys/CPU.h.in    | 4 ++++
+ Utilities/KWIML/ABI.h.in | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/Source/kwsys/CPU.h.in b/Source/kwsys/CPU.h.in
+index 884d71a..66ffbb1 100644
+--- a/Source/kwsys/CPU.h.in
++++ b/Source/kwsys/CPU.h.in
+@@ -88,6 +88,10 @@
+ #elif defined(__mips) || defined(__mips__) || defined(__MIPS__)
+ # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
+ 
++/* NIOS2 */
++#elif defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
++# define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_LITTLE
++
+ /* OpenRISC 1000 */
+ #elif defined(__or1k__)
+ # define @KWSYS_NAMESPACE@_CPU_ENDIAN_ID @KWSYS_NAMESPACE@_CPU_ENDIAN_ID_BIG
+diff --git a/Utilities/KWIML/ABI.h.in b/Utilities/KWIML/ABI.h.in
+index 6300ada..87b6e96 100644
+--- a/Utilities/KWIML/ABI.h.in
++++ b/Utilities/KWIML/ABI.h.in
+@@ -398,6 +398,10 @@ suppression macro @KWIML@_ABI_NO_VERIFY was defined.
+ #elif defined(__mips) || defined(__mips__) || defined(__MIPS__)
+ # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
+ 
++/* NIOS2 */
++#elif defined(__NIOS2__) || defined(__NIOS2) || defined(__nios2__)
++# define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_LITTLE
++
+ /* OpenRISC 1000 */
+ #elif defined(__or1k__)
+ # define @KWIML@_ABI_ENDIAN_ID @KWIML@_ABI_ENDIAN_ID_BIG
+-- 
+2.6.2
+
-- 
2.1.4


