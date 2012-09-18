Received: from am1ehsobe006.messaging.microsoft.com ([213.199.154.209]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TE6AA-0008AL-D7
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 00:21:02 +0200
Received: from mail27-am1-R.bigfish.com (10.3.201.250) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Sep 2012 22:08:19 +0000
Received: from mail27-am1 (localhost [127.0.0.1])	by mail27-am1-R.bigfish.com
	(Postfix) with ESMTP id ED5A43A00E2	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 14
X-BigFish: VS14(z52aeszzz1202h1d1ah1d2ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12a9h12bdh12e5h1155h)
Received: from mail27-am1 (localhost.localdomain [127.0.0.1]) by mail27-am1
	(MessageSwitch) id 1348006097224839_2439;
	Tue, 18 Sep 2012 22:08:17 +0000 (UTC)
Received: from AM1EHSMHS009.bigfish.com (unknown [10.3.201.247])	by
	mail27-am1.bigfish.com (Postfix) with ESMTP id 34DB3C005C	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 22:08:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS009.bigfish.com
	(10.3.207.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Sep 2012 22:08:15 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Tue, 18 Sep 2012 17:08:12 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8IM8BJN013889 for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 15:08:12 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 17:08:09 -0500
Message-ID: <1348006091-14992-5-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1348006091-14992-1-git-send-email-msm@freescale.com>
References: <1348006091-14992-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] flac_1.2.1.bb: use TUNE_FEATURES to enable/disable altivec
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
X-List-Received-Date: Tue, 18 Sep 2012 22:21:02 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
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




