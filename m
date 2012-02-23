Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S0SCC-0005kE-V8
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 07:30:29 +0100
Received: from mail10-ch1-R.bigfish.com (10.43.68.244) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Thu, 23 Feb 2012 06:22:01 +0000
Received: from mail10-ch1 (localhost [127.0.0.1])	by mail10-ch1-R.bigfish.com
	(Postfix) with ESMTP id 533DDC04AD	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:22:01 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail10-ch1 (localhost.localdomain [127.0.0.1]) by mail10-ch1
	(MessageSwitch) id 1329978109139577_1057;
	Thu, 23 Feb 2012 06:21:49 +0000 (UTC)
Received: from CH1EHSMHS029.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail10-ch1.bigfish.com (Postfix) with ESMTP id
	415042C01F3 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 06:21:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS029.bigfish.com
	(10.43.70.29) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 23 Feb 2012 06:21:47 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Thu, 23 Feb 2012 00:21:52 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q1N6LnqT006062 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 23:21:52 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Feb 2012 00:21:49 -0600
Message-ID: <1329978109-642-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1329978109-642-1-git-send-email-msm@freescale.com>
References: <1329978109-642-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/2] tune-ppce5500: consolidate ppce5500 and ppc64e5500 into one tune file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Feb 2012 06:30:29 -0000
Content-Type: text/plain

We don't need two files for this. Also this fixes some mutlilib build
issues where we were not able to select the multilib arch to be
ppce5500 or ppc64e5500.

Changes recently made to meta-fsl-ppc layer depend on this change as
well

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/tune-ppce5500-32b.inc |   15 ---------------
 meta/conf/machine/include/tune-ppce5500-64b.inc |   15 ---------------
 meta/conf/machine/include/tune-ppce5500.inc     |   20 ++++++++++++++++++++
 3 files changed, 20 insertions(+), 30 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-ppce5500-32b.inc
 delete mode 100644 meta/conf/machine/include/tune-ppce5500-64b.inc
 create mode 100644 meta/conf/machine/include/tune-ppce5500.inc

diff --git a/meta/conf/machine/include/tune-ppce5500-32b.inc b/meta/conf/machine/include/tune-ppce5500-32b.inc
deleted file mode 100644
index 7a9e533..0000000
--- a/meta/conf/machine/include/tune-ppce5500-32b.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULTTUNE ?= "ppce5500"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[ppce5500] = "Enable ppce5500 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "-mcpu=e5500", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500", "${PPCPKGARCH}", d)}"
-
-AVAILTUNES = "ppce5500"
-TUNE_FEATURES_tune-ppce5500 = "m32 ppce5500"
-PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc ppce5500"
-BASE_LIB_tune-ppce5500 = "lib"
-
-# glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "--with-cpu=e5500", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce5500-64b.inc b/meta/conf/machine/include/tune-ppce5500-64b.inc
deleted file mode 100644
index 683d25f..0000000
--- a/meta/conf/machine/include/tune-ppce5500-64b.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-DEFAULTTUNE ?= "ppc64e5500"
-
-require conf/machine/include/powerpc/arch-powerpc64.inc
-
-TUNEVALID[ppc64e5500] = "Enable ppc64e5500 specific processor optimizations"
-TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "-mcpu=e5500", "", d)}"
-TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "ppc64e5500", "${PPCPKGARCH}", d)}"
-
-AVAILTUNES = "ppc64e5500"
-TUNE_FEATURES_tune-ppc64e5500 = "m64 ppc64e5500"
-PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "powerpc64 ppc64e5500"
-BASE_LIB_tune-ppc64e5500 = "lib64"
-
-# glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "ppc64e5500", "--with-cpu=e5500", "", d)}"
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
new file mode 100644
index 0000000..fe8d79d
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "ppce5500"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[e5500] = "Enable Freescale e5500 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "-mcpu=e5500", "", d)}"
+
+AVAILTUNES += "ppce5500 ppc64e5500"
+TUNE_FEATURES_tune-ppce5500 = "m32 fpu-hard e5500"
+PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce5500"
+BASE_LIB_tune-ppce5500 = "lib"
+TUNE_PKGARCH_tune-ppce5500 = "ppce5500"
+
+TUNE_FEATURES_tune-ppc64e5500 = "m64 fpu-hard e5500"
+PACKAGE_EXTRA_ARCHS_tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e5500"
+BASE_LIB_tune-ppc64e5500 = "lib64"
+TUNE_PKGARCH_tune-ppc64e5500 = "ppc64e5500"
+
+# glibc configure options to get e5500 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "e5500", "--with-cpu=e5500", "", d)}"
-- 
1.7.6.1




