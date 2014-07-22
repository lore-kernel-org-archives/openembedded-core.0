Return-Path: <B50113@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0242.outbound.protection.outlook.com [207.46.163.242])
	by mail.openembedded.org (Postfix) with ESMTP id 3D80F6B7BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:05:08 +0000 (UTC)
Received: from BN3PR0301CA0033.namprd03.prod.outlook.com (25.160.180.171) by
	BL2PR03MB276.namprd03.prod.outlook.com (10.255.231.25) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Tue, 22 Jul 2014 06:49:22 +0000
Received: from BN1BFFO11FD053.protection.gbl (2a01:111:f400:7c10::1:187) by
	BN3PR0301CA0033.outlook.office365.com (2a01:111:e400:4000::43) with
	Microsoft
	SMTP Server (TLS) id 15.0.990.7 via Frontend Transport; Tue, 22 Jul 2014
	06:49:23 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD053.mail.protection.outlook.com (10.58.145.8) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Tue, 22 Jul 2014 06:49:22 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6M6nIXx017680;
	Mon, 21 Jul 2014 23:49:20 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:49:19 +0800
Message-ID: <1406011764-4955-1-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(68736004)(19580405001)(44976005)(6806004)(31966008)(83322001)(19580395003)(84676001)(62966002)(74662001)(74502001)(107046002)(2351001)(229853001)(69596002)(15975445006)(80022001)(50986999)(76482001)(33646002)(85306003)(95666004)(93916002)(105606002)(26826002)(106466001)(81156004)(110136001)(79102001)(86362001)(21056001)(64706001)(104016003)(77982001)(20776003)(47776003)(92726001)(89996001)(36756003)(77156001)(85852003)(83072002)(88136002)(81342001)(81542001)(50226001)(48376002)(99396002)(92566001)(87936001)(102836001)(104166001)(46102001)(97736001)(50466002)(87286001)(4396001)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB276;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 02801ACE41
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B50113@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] gst-plugins-good: fix integer overrun for mulawdec
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
X-List-Received-Date: Tue, 22 Jul 2014 07:05:09 -0000
Content-Type: text/plain

There might be more than 65535 samples in a chunk of data, so use
32 bit integer instead of 16 bit.

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 .../0407-mulawdec-fix-integer-overrun.patch        |   47 ++++++++++++++++++++
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    7 +--
 2 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
new file mode 100644
index 0000000..48b8e98
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0407-mulawdec-fix-integer-overrun.patch
@@ -0,0 +1,47 @@
+From ce94b2c2b91b6db190c121860e12a6afafce7ae1 Mon Sep 17 00:00:00 2001
+From: Roland Krikava <rkrikava@gmail.com>
+Date: Fri, 2 Nov 2012 12:38:44 -0400
+Subject: [PATCH 407/440] mulawdec: fix integer overrun
+
+There might be more than 65535 samples in a chunk of data.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=687469
+
+Commit - 3be45f70220310ec1c60d819f90b5f2ae03b5d83 in 0.10 branch
+
+Upstream Status:  Backported
+
+Signed-off-by: Roland Krikava <rkrikava@gmail.com>
+---
+ gst/law/mulaw-conversion.c |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gst/law/mulaw-conversion.c b/gst/law/mulaw-conversion.c
+index 8afae80..190a9f5 100644
+--- a/gst/law/mulaw-conversion.c
++++ b/gst/law/mulaw-conversion.c
+@@ -51,9 +51,10 @@ mulaw_encode (gint16 * in, guint8 * out, gint numsamples)
+     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7,
+     7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7
+   };
+-  gint16 sign, exponent, mantissa, i;
++  gint16 sign, exponent, mantissa;
+   gint16 sample;
+   guint8 ulawbyte;
++  gint i;
+ 
+   for (i = 0; i < numsamples; i++) {
+     sample = in[i];
+@@ -102,7 +103,8 @@ mulaw_decode (guint8 * in, gint16 * out, gint numsamples)
+   static gint16 exp_lut[8] = { 0, 132, 396, 924, 1980, 4092, 8316, 16764 };
+   gint16 sign, exponent, mantissa;
+   guint8 ulawbyte;
+-  gint16 linear, i;
++  gint16 linear;
++  gint i;
+ 
+   for (i = 0; i < numsamples; i++) {
+     ulawbyte = in[i];
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 88f90f3..4ccdec0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -26,9 +26,10 @@ DEPENDS += "gst-plugins-base gconf cairo libpng zlib libid3tag flac \
 
 inherit gettext gconf
 
-SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch"
-SRC_URI += "file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch"
-
+SRC_URI += "file://0001-v4l2-fix-build-with-recent-kernels-the-v4l2_buffer-i.patch \
+            file://0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch \
+            file://0407-mulawdec-fix-integer-overrun.patch \
+"
 EXTRA_OECONF += "--disable-aalib --disable-esd --disable-shout2 --disable-libcaca --disable-hal \
                  --disable-examples --disable-taglib"
 
-- 
1.7.9.5


