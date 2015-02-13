Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0072.outbound.protection.outlook.com [157.56.111.72])
	by mail.openembedded.org (Postfix) with ESMTP id C9526733FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:41:42 +0000 (UTC)
Received: from BN1BFFO11OLC004.protection.gbl (10.58.144.33) by
	BN1BFFO11HUB026.protection.gbl (10.58.144.173) with Microsoft SMTP
	Server (TLS) id 15.1.87.10; Fri, 13 Feb 2015 07:41:41 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11OLC004.mail.protection.outlook.com (10.58.145.15) with
	Microsoft
	SMTP Server (TLS) id 15.1.87.10 via Frontend Transport; Fri, 13 Feb 2015
	07:41:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YMAp0-0005bc-Ls
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Feb 2015 23:37:54 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 17:41:34 +1000
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21326.004
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <428b4cf477914c768270fb0b99efadb0@BN1BFFO11OLC004.protection.gbl>
X-EOPAttributedMessage: 0
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; lists.openembedded.org; dkim=none
	(message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(6806004)(92566002)(62966003)(450100001)(87936001)(19580395003)(19580405001)(77156002)(48376002)(74316001)(108616004)(53416004)(575784001)(104016003)(92726002)(86362001)(33646002)(50226001)(50986999)(47776003)(50466002)(229853001)(15975445007)(106466001)(110136001)(2351001)(46102003)(41533002)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB026;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:nov;
	PTR:unknown-60-83.xilinx.com; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB026;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN1BFFO11HUB026; 
X-Forefront-PRVS: 0486A0CB86
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN1BFFO11HUB026; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2015 07:41:41.0995 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB026
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH] libaio: Backport generic arch detection patch
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
X-List-Received-Date: Fri, 13 Feb 2015 07:41:44 -0000
Content-Type: text/plain

* Backport the patch which adds generic architecture detection
* Remove the no longer required patch to fix padding for mips64

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
It appears the libaio_fix_for_mip64.patch changes are only upstream as
far as the Debian patch overlays, and did not reach libaio upstream
(https://git.fedorahosted.org/cgit/libaio.git/). However with the
generic architecture detection patch, the mips64 patch is no longer
required.

I have tested this change on all qemu* machines in oe-core, as well as
qemumicroblaze from meta-xilinx.
---
 ...neric-arch-dectection-for-padding-defines.patch | 65 ++++++++++++++++++++++
 .../libaio/libaio/libaio_fix_for_mips64.patch      | 58 -------------------
 meta/recipes-extended/libaio/libaio_0.3.110.bb     |  2 +-
 3 files changed, 66 insertions(+), 59 deletions(-)
 create mode 100644 meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch
 delete mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch

diff --git a/meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch b/meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch
new file mode 100644
index 0000000..bba7e55
--- /dev/null
+++ b/meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch
@@ -0,0 +1,65 @@
+From: Nathan Rossi <nathan.rossi@xilinx.com>
+Date: Tue, 27 Jan 2015 14:59:35 +1000
+Subject: [PATCH] Generic arch dectection for padding defines
+
+When available use the GNU C defines for endian and bitwidth to
+determine the padding required. This reduces the need to define the
+padding selection for every architecture.
+
+Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
+Signed-off-by: Jeff Moyer <jmoyer@redhat.com>
+Upstream-Status: Backport
+---
+ src/libaio.h | 16 ++++++++++++----
+ 1 file changed, 12 insertions(+), 4 deletions(-)
+
+diff --git a/src/libaio.h b/src/libaio.h
+index 1223146..4a4e0f5 100644
+--- a/src/libaio.h
++++ b/src/libaio.h
+@@ -52,14 +52,18 @@ typedef enum io_iocb_cmd {
+ /* little endian, 32 bits */
+ #if defined(__i386__) || (defined(__arm__) && !defined(__ARMEB__)) || \
+     defined(__sh__) || defined(__bfin__) || defined(__MIPSEL__) || \
+-    defined(__cris__)
++    defined(__cris__) || \
++    (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
++         __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ && __SIZEOF_LONG__ == 4)
+ #define PADDED(x, y)	x; unsigned y
+ #define PADDEDptr(x, y)	x; unsigned y
+ #define PADDEDul(x, y)	unsigned long x; unsigned y
+ 
+ /* little endian, 64 bits */
+ #elif defined(__ia64__) || defined(__x86_64__) || defined(__alpha__) || \
+-      (defined(__aarch64__) && defined(__AARCH64EL__))
++      (defined(__aarch64__) && defined(__AARCH64EL__)) || \
++      (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
++          __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ && __SIZEOF_LONG__ == 8)
+ #define PADDED(x, y)	x, y
+ #define PADDEDptr(x, y)	x
+ #define PADDEDul(x, y)	unsigned long x
+@@ -67,7 +71,9 @@ typedef enum io_iocb_cmd {
+ /* big endian, 64 bits */
+ #elif defined(__powerpc64__) || defined(__s390x__) || \
+       (defined(__sparc__) && defined(__arch64__)) || \
+-      (defined(__aarch64__) && defined(__AARCH64EB__))
++      (defined(__aarch64__) && defined(__AARCH64EB__)) || \
++      (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
++           __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__ && __SIZEOF_LONG__ == 8)
+ #define PADDED(x, y)	unsigned y; x
+ #define PADDEDptr(x,y)	x
+ #define PADDEDul(x, y)	unsigned long x
+@@ -76,7 +82,9 @@ typedef enum io_iocb_cmd {
+ #elif defined(__PPC__) || defined(__s390__) || \
+       (defined(__arm__) && defined(__ARMEB__)) || \
+       defined(__sparc__) || defined(__MIPSEB__) || defined(__m68k__) || \
+-      defined(__hppa__) || defined(__frv__) || defined(__avr32__)
++      defined(__hppa__) || defined(__frv__) || defined(__avr32__) || \
++      (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
++           __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__ && __SIZEOF_LONG__ == 4)
+ #define PADDED(x, y)	unsigned y; x
+ #define PADDEDptr(x, y)	unsigned y; x
+ #define PADDEDul(x, y)	unsigned y; unsigned long x
+-- 
+2.1.1
+
diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch
deleted file mode 100644
index 9d4bb46..0000000
--- a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 62fd97fbc5c53835baa18f210fca593fc8b5c636 Mon Sep 17 00:00:00 2001
-From: Jianchuan Wang <jianchuan.wang@windriver.com>
-Date: Wed, 15 Oct 2014 07:04:02 +0800
-Subject: [PATCH] libaio: fix for mips64
-    
-Add mips64 support in the libaio.h
- - add macro PADDED/PADDEDptr/PADDEDul in the mips64 for structure iocb 
-   to be matched userland with kernel
-
-Upstream-Status: Backport
-
-Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
----
- src/libaio.h | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-Index: libaio-0.3.110/src/libaio.h
-===================================================================
---- libaio-0.3.110.orig/src/libaio.h
-+++ libaio-0.3.110/src/libaio.h
-@@ -51,7 +51,7 @@ typedef enum io_iocb_cmd {
- 
- /* little endian, 32 bits */
- #if defined(__i386__) || (defined(__arm__) && !defined(__ARMEB__)) || \
--    defined(__sh__) || defined(__bfin__) || defined(__MIPSEL__) || \
-+    defined(__sh__) || defined(__bfin__) || (defined(__mips__) && defined(__MIPSEL__)) || \
-     defined(__cris__)
- #define PADDED(x, y)	x; unsigned y
- #define PADDEDptr(x, y)	x; unsigned y
-@@ -59,7 +59,8 @@ typedef enum io_iocb_cmd {
- 
- /* little endian, 64 bits */
- #elif defined(__ia64__) || defined(__x86_64__) || defined(__alpha__) || \
--      (defined(__aarch64__) && defined(__AARCH64EL__))
-+      (defined(__aarch64__) && defined(__AARCH64EL__)) || \
-+      (defined(__mips64) && defined(__MIPSEL__))
- #define PADDED(x, y)	x, y
- #define PADDEDptr(x, y)	x
- #define PADDEDul(x, y)	unsigned long x
-@@ -67,7 +68,8 @@ typedef enum io_iocb_cmd {
- /* big endian, 64 bits */
- #elif defined(__powerpc64__) || defined(__s390x__) || \
-       (defined(__sparc__) && defined(__arch64__)) || \
--      (defined(__aarch64__) && defined(__AARCH64EB__))
-+      (defined(__aarch64__) && defined(__AARCH64EB__)) || \
-+      (defined(__mips64) && defined(__MIPSEL__))
- #define PADDED(x, y)	unsigned y; x
- #define PADDEDptr(x,y)	x
- #define PADDEDul(x, y)	unsigned long x
-@@ -75,7 +77,7 @@ typedef enum io_iocb_cmd {
- /* big endian, 32 bits */
- #elif defined(__PPC__) || defined(__s390__) || \
-       (defined(__arm__) && defined(__ARMEB__)) || \
--      defined(__sparc__) || defined(__MIPSEB__) || defined(__m68k__) || \
-+      defined(__sparc__) || (defined(__mips__) && defined(__MIPSEB__)) || defined(__m68k__) || \
-       defined(__hppa__) || defined(__frv__) || defined(__avr32__)
- #define PADDED(x, y)	unsigned y; x
- #define PADDEDptr(x, y)	unsigned y; x
diff --git a/meta/recipes-extended/libaio/libaio_0.3.110.bb b/meta/recipes-extended/libaio/libaio_0.3.110.bb
index 9e36414..cbe29ce 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.110.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.110.bb
@@ -6,11 +6,11 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
+           file://generic-arch-dectection-for-padding-defines.patch \
            file://00_arches.patch \
            file://destdir.patch \
            file://libaio_fix_for_x32.patch \
            file://libaio_fix_for_mips_syscalls.patch \
-           file://libaio_fix_for_mips64.patch \
 "
 
 SRC_URI[md5sum] = "2a35602e43778383e2f4907a4ca39ab8"
-- 
2.1.1


