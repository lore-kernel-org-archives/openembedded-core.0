Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6AA-0008AJ-Of
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:21:03 +0200
Received: from mail102-ch1-R.bigfish.com (10.43.68.249) by
	CH1EHSOBE010.bigfish.com (10.43.70.60) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:08:18 +0000
Received: from mail102-ch1 (localhost [127.0.0.1])	by
	mail102-ch1-R.bigfish.com (Postfix) with ESMTP id 86C0B80180	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1155h)
Received: from mail102-ch1 (localhost.localdomain [127.0.0.1]) by mail102-ch1
	(MessageSwitch) id 1348006095946701_26974;
	Tue, 18 Sep 2012 22:08:15 +0000 (UTC)
Received: from CH1EHSMHS005.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.226])	by mail102-ch1.bigfish.com (Postfix) with ESMTP id
	E353C1A0050	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS005.bigfish.com
	(10.43.70.5) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:08:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 18 Sep 2012 17:08:12 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8IM8BJM013889 for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:08:12 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 17:08:08 -0500
Message-ID: <1348006091-14992-4-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348006091-14992-1-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] tune-ppce6500.inc: add e6500 tune files
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
X-List-Received-Date: Tue, 18 Sep 2012 22:21:03 -0000
Content-Type: text/plain

Also supports a new altivec TUNE_FEATURE

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/conf/machine/include/tune-ppce6500.inc |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppce6500.inc

diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/tune-ppce6500.inc
new file mode 100644
index 0000000..982a7a4
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce6500.inc
@@ -0,0 +1,21 @@
+DEFAULTTUNE ?= "ppce6500"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[e6500] = "Enable Freescale e6500 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "-mcpu=e6500", "", d)}"
+
+AVAILTUNES += "ppce6500 ppc64e6500"
+TUNE_FEATURES_tune-ppce6500 = "m32 fpu-hard e6500 altivec"
+BASE_LIB_tune-ppce6500 = "lib"
+TUNE_PKGARCH_tune-ppce6500 = "ppce6500"
+PACKAGE_EXTRA_ARCHS_tune-ppce6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppce6500"
+
+TUNE_FEATURES_tune-ppc64e6500 = "m64 fpu-hard e6500 altivec"
+BASE_LIB_tune-ppc64e6500 = "lib64"
+TUNE_PKGARCH_tune-ppc64e6500 = "ppc64e6500"
+PACKAGE_EXTRA_ARCHS_tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64e6500"
+
+# glibc configure options to get e6500 specific library
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "--with-cpu=e6500", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "e6500", "--with-cpu=603e", "", d)}"
-- 
1.7.9.7




