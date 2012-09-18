Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6A5-00089f-TP
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:20:58 +0200
Received: from mail120-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE014.bigfish.com (10.9.40.34) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:08:16 +0000
Received: from mail120-tx2 (localhost [127.0.0.1])	by
	mail120-tx2-R.bigfish.com (Postfix) with ESMTP id A03FF1A00BB	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1155h)
Received: from mail120-tx2 (localhost.localdomain [127.0.0.1]) by mail120-tx2
	(MessageSwitch) id 134800609425393_1395;
	Tue, 18 Sep 2012 22:08:14 +0000 (UTC)
Received: from TX2EHSMHS009.bigfish.com (unknown [10.9.14.250])	by
	mail120-tx2.bigfish.com (Postfix) with ESMTP id 03DEA1C00D5	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS009.bigfish.com
	(10.9.99.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:08:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 18 Sep 2012 17:08:13 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8IM8BJP013889 for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:08:12 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 17:08:11 -0500
Message-ID: <1348006091-14992-7-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348006091-14992-1-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] binutils.inc: binutils will build differently if this feature is enabled, so add a dependency
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
X-List-Received-Date: Tue, 18 Sep 2012 22:20:58 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
Not sure if we should try to fix via configure options

 meta/recipes-devtools/binutils/binutils.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index ee748a4..ff64882 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -80,6 +80,8 @@ export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
 export CPP_FOR_BUILD = "${BUILD_CPP}"
 export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
 
+MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
+do_configure[vardeps] += "MULTIARCH"
 do_configure () {
 	(cd ${S}; gnu-configize) || die "Failed to run gnu-configize"
 	oe_runconf
-- 
1.7.9.7




