Return-Path: <B40290@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0250.outbound.messaging.microsoft.com [213.199.154.250])
	by mail.openembedded.org (Postfix) with ESMTP id 896E86BC8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:01:46 +0000 (UTC)
Received: from mail225-DB9-R.bigfish.com (10.174.16.230) by
	DB9EHSOBE018.bigfish.com (10.174.14.81) with Microsoft SMTP Server id
	14.1.225.22; Wed, 28 Aug 2013 09:01:46 +0000
Received: from mail225-DB9 (localhost [127.0.0.1])	by
	mail225-DB9-R.bigfish.com (Postfix) with ESMTP id 3EA443401B6	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:01:46 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah186068h8275bh8275dh1de097hz2dh2a8h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail225-DB9 (localhost.localdomain [127.0.0.1]) by mail225-DB9
	(MessageSwitch) id 1377680504279940_9670;
	Wed, 28 Aug 2013 09:01:44 +0000 (UTC)
Received: from DB9EHSMHS009.bigfish.com (unknown [10.174.16.232])	by
	mail225-DB9.bigfish.com (Postfix) with ESMTP id 2E5AAE003F	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:01:44 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS009.bigfish.com
	(10.174.14.19) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 28 Aug 2013 09:01:43 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Wed, 28 Aug 2013 09:01:41 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r7S91cob003399;	Wed, 28 Aug 2013 02:01:39 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2013 17:01:33 +0800
Message-ID: <1377680493-12488-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] gcc-4.8: fix ICE of cross-compile for PowerPC e500v2 targets
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
X-List-Received-Date: Wed, 28 Aug 2013 09:01:48 -0000
Content-Type: text/plain

  * http://gcc.gnu.org/bugzilla//show_bug.cgi?id=57717#c7

  * fix the segfault issue of dd on e500v2 targets
    Since double-float is disabled for e500v2 targets build due to ICE of gcc-4.8.1,
    accordingly %Ld format of sprintf is disabled.
    Address Bug 4910 - [p1022ds]urandom: segmentation fault

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |    1 +
 .../0045-gcc-4.8-PR57717-PowerPC-E500v2.patch      |   21 ++++++++++++++++++++
 2 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 39f323d..0fbbc1d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -74,6 +74,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0042-pr57748.patch \
 	   file://0043-cpp.patch \
 	   file://0044-gengtypes.patch \
+	   file://0045-gcc-4.8-PR57717-PowerPC-E500v2.patch \
 	  "
 SRC_URI[md5sum] = "3b2386c114cd74185aa3754b58a79304"
 SRC_URI[sha256sum] = "545b44be3ad9f2c4e90e6880f5c9d4f0a8f0e5f67e1ffb0d45da9fa01bb05813"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch b/meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch
new file mode 100644
index 0000000..96fa1da
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0045-gcc-4.8-PR57717-PowerPC-E500v2.patch
@@ -0,0 +1,21 @@
+This backports fix from http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57717
+
+Upstream-Status: Backport
+Signed-off-by: Julian Brown <Julian_Brown@mentor.com>
+
+fix for PR57717 (PowerPC E500v2)
+http://gcc.gnu.org/ml/gcc-patches/2013-08/msg00668.html
+
+--- a/gcc/config/rs6000/rs6000.c	2013-05-09 20:54:06.000000000 -0500
++++ b/gcc/config/rs6000/rs6000.c	2013-08-28 01:25:24.865218744 -0500
+@@ -6337,9 +6337,7 @@
+       && GET_CODE (XEXP (x, 1)) == CONST_INT
+       && reg_offset_p
+       && !SPE_VECTOR_MODE (mode)
+-      && !(TARGET_E500_DOUBLE && (mode == DFmode || mode == TFmode
+-				  || mode == DDmode || mode == TDmode
+-				  || mode == DImode))
++      && !(TARGET_E500_DOUBLE && GET_MODE_SIZE (mode) > UNITS_PER_WORD)
+       && VECTOR_MEM_NONE_P (mode))
+     {
+       HOST_WIDE_INT val = INTVAL (XEXP (x, 1));
-- 
1.7.5.4



