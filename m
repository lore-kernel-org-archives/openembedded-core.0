Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1THPek-0004sO-1L
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 03:46:18 +0200
Received: from mail83-am1-R.bigfish.com (10.3.201.228) by
	AM1EHSOBE009.bigfish.com (10.3.204.29) with Microsoft SMTP Server id
	14.1.225.23; Fri, 28 Sep 2012 01:33:25 +0000
Received: from mail83-am1 (localhost [127.0.0.1])	by mail83-am1-R.bigfish.com
	(Postfix) with ESMTP id 99E96600C8	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:25 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 14
X-BigFish: VS14(z52aeszzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1155h)
Received: from mail83-am1 (localhost.localdomain [127.0.0.1]) by mail83-am1
	(MessageSwitch) id 1348796003913491_12752;
	Fri, 28 Sep 2012 01:33:23 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.245])	by
	mail83-am1.bigfish.com (Postfix) with ESMTP id DAC4830026B	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 01:33:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 28 Sep 2012 01:33:22 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Thu, 27 Sep 2012 20:33:21 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8S1XJaO007331 for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 18:33:20 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 20:33:11 -0500
Message-ID: <1348795994-21695-7-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348795994-21695-1-git-send-email-msm@freescale.com>
References: <1348795994-21695-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 07/10] flac_1.2.1.bb: use TUNE_FEATURES to enable/disable altivec
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
X-List-Received-Date: Fri, 28 Sep 2012 01:46:18 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
v2: no changes

 meta/recipes-multimedia/flac/flac_1.2.1.bb |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.2.1.bb
index 157128f..6520b71 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.2.1.bb
@@ -36,10 +36,8 @@ EXTRA_OECONF = "--disable-oggtest --disable-id3libtest \
                 --without-xmms-exec-prefix \
                 --without-libiconv-prefix \
                 --without-id3lib"
-EXTRA_OECONF_prepend_e500mc = "--disable-altivec "
-EXTRA_OECONF_prepend_e5500 = "--disable-altivec "
-EXTRA_OECONF_prepend_e5500-64b = "--disable-altivec "
-EXTRA_OECONF_prepend_mpc8315e-rdb = "--disable-altivec "
+
+EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}"
 
 PACKAGES += "libflac libflac++ liboggflac liboggflac++"
 FILES_${PN} = "${bindir}/*"
-- 
1.7.9.7




