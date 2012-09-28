Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPej-0004sJ-24
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:17 +0200
Received: from mail218-co1-R.bigfish.com (10.243.78.243) by
	CO1EHSOBE016.bigfish.com (10.243.66.79) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:23 +0000
Received: from mail218-co1 (localhost [127.0.0.1])	by
	mail218-co1-R.bigfish.com (Postfix) with ESMTP id CDEF58C0087	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail218-co1 (localhost.localdomain [127.0.0.1]) by mail218-co1
	(MessageSwitch) id 1348796002143040_2671;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from CO1EHSMHS027.bigfish.com (unknown [10.243.78.231])	by
	mail218-co1.bigfish.com (Postfix) with ESMTP id 1FF34660019	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS027.bigfish.com
	(10.243.66.37) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:21 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:20 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaN007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:20 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:10 -0500
Message-ID: <1348795994-21695-6-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348795994-21695-1-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 06/10] tune-ppce6500.inc: add e6500 tune files
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
X-List-Received-Date: Fri, 28 Sep 2012 01:46:17 -0000
Content-Type: text/plain

Also supports a new altivec TUNE_FEATURE

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: no changes

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




