Return-Path: <B50113@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0182.outbound.protection.outlook.com [207.46.163.182])
	by mail.openembedded.org (Postfix) with ESMTP id DA3A560167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 03:21:01 +0000 (UTC)
Received: from BN3PR0301CA0024.namprd03.prod.outlook.com (25.160.180.162) by
	BL2PR03MB276.namprd03.prod.outlook.com (10.255.231.25) with Microsoft
	SMTP Server (TLS) id 15.0.995.14; Mon, 4 Aug 2014 03:21:00 +0000
Received: from BN1BFFO11FD003.protection.gbl (2a01:111:f400:7c10::1:196) by
	BN3PR0301CA0024.outlook.office365.com (2a01:111:e400:4000::34) with
	Microsoft
	SMTP Server (TLS) id 15.0.995.14 via Frontend Transport; Mon, 4 Aug 2014
	03:21:00 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD003.mail.protection.outlook.com (10.58.144.66) with
	Microsoft SMTP Server (TLS) id 15.0.990.10 via Frontend Transport;
	Mon, 4 Aug 2014 03:21:00 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s743Kvmq007250;
	Sun, 3 Aug 2014 20:20:58 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Aug 2014 11:21:10 +0800
Message-ID: <1407122473-16439-1-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(104016003)(6806004)(44976005)(31966008)(68736004)(88136002)(2351001)(46102001)(99396002)(33646002)(50986999)(97736001)(69596002)(81542001)(95666004)(85306004)(74662001)(105606002)(80022001)(106466001)(229853001)(62966002)(89996001)(21056001)(4396001)(84676001)(92726001)(81342001)(50466002)(102836001)(79102001)(83322001)(19580405001)(81156004)(36756003)(20776003)(85852003)(575784001)(48376002)(87286001)(107046002)(86362001)(87936001)(110136001)(50226001)(93916002)(64706001)(47776003)(74502001)(77982001)(83072002)(92566001)(77156001)(76482001)(26826002)(104166001)(19580395003)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB276;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0293D40691
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B50113@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH 2/3] alsa-lib: fix hw_ptr exceed the boundary
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
X-List-Received-Date: Mon, 04 Aug 2014 03:21:02 -0000
Content-Type: text/plain

For long time test case, the hw_ptr will exceed the boundary, then cause
the avail size wrong.

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 ...1-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch |   34 ++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb  |    1 +
 2 files changed, 35 insertions(+)
 create mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch
new file mode 100755
index 0000000..8be3d75
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch
@@ -0,0 +1,34 @@
+From 035f196bcdc1e9903ed52ad1859dc23d3aa74e72 Mon Sep 17 00:00:00 2001
+From: Shengjiu Wang <shengjiu.wang@freescale.com>
+Date: Mon, 14 Jul 2014 16:55:48 +0800
+Subject: [PATCH] pcm: rate: fix hw_ptr exceed the boundary
+
+For long time test case, the hw_ptr will exceed the boundary, then cause
+the avail size wrong.
+
+Commit is 035f196bcdc1e9903ed52ad1859dc23d3aa74e72 in master branch
+
+Upstream Status: Backported
+
+Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+---
+ src/pcm/pcm_rate.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/pcm/pcm_rate.c b/src/pcm/pcm_rate.c
+index 7f667d4..2563d82 100644
+--- a/src/pcm/pcm_rate.c
++++ b/src/pcm/pcm_rate.c
+@@ -574,6 +574,8 @@ static inline void snd_pcm_rate_sync_hwptr(snd_pcm_t *pcm)
+ 	rate->hw_ptr =
+ 		(slave_hw_ptr / rate->gen.slave->period_size) * pcm->period_size +
+ 		rate->ops.input_frames(rate->obj, slave_hw_ptr % rate->gen.slave->period_size);
++
++	rate->hw_ptr %= pcm->boundary;
+ }
+ 
+ static int snd_pcm_rate_hwsync(snd_pcm_t *pcm)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
index d46f7a0..b345377 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch \
            file://Update-iatomic.h-functions-definitions-for-mips.patch \
            file://0001-pcm-route-Use-get32-for-multi-source-route-calculati.patch \
+           file://0001-pcm-rate-fix-hw_ptr-exceed-the-boundary.patch \
 "
 SRC_URI[md5sum] = "69129a7c37697f81ac092335e9fa452b"
 SRC_URI[sha256sum] = "690ed393e7efd4fc7e3a2d2cda5449298ca0c895197e5914e350882012430d19"
-- 
1.7.9.5


