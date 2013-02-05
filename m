Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1U2n5i-0007qz-Cb
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 19:18:00 +0100
Received: from mail184-tx2-R.bigfish.com (10.9.14.235) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 5 Feb 2013 17:47:02 +0000
Received: from mail184-tx2 (localhost [127.0.0.1])	by
	mail184-tx2-R.bigfish.com (Postfix) with ESMTP id 55D7C22025E	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:47:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h1155h)
Received: from mail184-tx2 (localhost.localdomain [127.0.0.1]) by mail184-tx2
	(MessageSwitch) id 1360086420344573_19164;
	Tue,  5 Feb 2013 17:47:00 +0000 (UTC)
Received: from TX2EHSMHS035.bigfish.com (unknown [10.9.14.252])	by
	mail184-tx2.bigfish.com (Postfix) with ESMTP id 3223134007A	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 17:47:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS035.bigfish.com
	(10.9.99.135) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 5 Feb 2013 17:46:54 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 5 Feb 2013 17:46:54 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r15Hkj8E032069	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Feb 2013 10:46:53 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Feb 2013 11:46:48 -0600
Message-ID: <1360086408-29832-5-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1360086408-29832-1-git-send-email-msm@freescale.com>
References: <1360086408-29832-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 5/5] oprofile: fix cross compile on powerpc and add libpfm4 dep
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 18:18:01 -0000
Content-Type: text/plain

Fixes [YOCTO #3717]

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../0001-fix-powerpc-cross-compiling.patch         |   35 ++++++++++++++++++++
 meta/recipes-kernel/oprofile/oprofile_0.9.8.bb     |    7 ++--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch

diff --git a/meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch b/meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch
new file mode 100644
index 0000000..d4dffb1
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile/0001-fix-powerpc-cross-compiling.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Submitted
+
+From cd8aafe5ca48e8d809188df6e42f20efd5cbefd1 Mon Sep 17 00:00:00 2001
+From: Matthew McClintock <msm@freescale.com>
+Date: Tue, 5 Feb 2013 11:05:00 -0600
+Subject: [PATCH] fix powerpc cross compiling
+
+You can't determine the target for running on by running uname
+on the build machine. Use a better method instead.
+
+Signed-off-by: Matthew McClintock <msm@freescale.com>
+---
+ configure.ac |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index a9b1ee4..4b73cdd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -155,10 +155,10 @@ fi
+ 
+ AC_DEFINE_UNQUOTED(HAVE_PERF_EVENTS, $HAVE_PERF_EVENTS, [Kernel support for perf_events exists])
+ 
++AC_CANONICAL_HOST
+ if test "$HAVE_PERF_EVENTS" = "1"; then
+ 	PFM_LIB=
+-	arch="`uname -m`"
+-	if test "$arch" = "ppc64" || test "$arch" = "ppc"; then
++	if test "$host_cpu" = "powerpc"; then
+ 		AC_CHECK_HEADER(perfmon/pfmlib.h,,[AC_MSG_ERROR([pfmlib.h not found; usually provided in papi devel package])])
+ 		AC_CHECK_LIB(pfm,pfm_get_os_event_encoding, HAVE_LIBPFM3='0'; HAVE_LIBPFM='1', [
+ 			AC_CHECK_LIB(pfm, pfm_get_event_name, HAVE_LIBPFM3='1'; HAVE_LIBPFM='1',
+-- 
+1.7.9.7
+
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
index 6075163..79363a6 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.8.bb
@@ -1,15 +1,18 @@
 require oprofile.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS += "virtual/kernel"
+DEPENDS_append_powerpc = " libpfm4"
+DEPENDS_append_powerpc64 = " libpfm4"
 
 SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
             file://0001-Add-rmb-definition-for-AArch64-architecture.patch \
             file://0001-OProfile-doesn-t-build-for-32-bit-ppc-the-operf_util.patch \
             file://0001-Handle-early-perf_events-kernel-without-PERF_RECORD_.patch \
             file://0001-Fix-up-configure-to-handle-architectures-that-do-not.patch \
-            file://0001-Change-configure-to-look-for-libpfm4-function-first-.patch"
+            file://0001-Change-configure-to-look-for-libpfm4-function-first-.patch \
+            file://0001-fix-powerpc-cross-compiling.patch "
 
 SRC_URI[md5sum] = "6d127023af1dd1cf24e15411229f3cc8"
 SRC_URI[sha256sum] = "ab45900fa1a23e5d5badf3c0a55f26c17efe6e184efcf00b371433751fa761bc"
-- 
1.7.9.7




