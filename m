Return-Path: <B50113@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0190.outbound.protection.outlook.com [207.46.163.190])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA3170209
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:04:13 +0000 (UTC)
Received: from CH1PR03CA012.namprd03.prod.outlook.com (10.255.156.157) by
	BLUPR03MB279.namprd03.prod.outlook.com (10.255.213.17) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Tue, 22 Jul 2014 06:49:28 +0000
Received: from BY2FFO11FD023.protection.gbl (10.255.156.132) by
	CH1PR03CA012.outlook.office365.com (10.255.156.157) with Microsoft SMTP
	Server (TLS) id 15.0.990.7 via Frontend Transport;
	Tue, 22 Jul 2014 06:49:28 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD023.mail.protection.outlook.com (10.1.15.212) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Tue, 22 Jul 2014 06:49:28 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6M6nIY2017680;
	Mon, 21 Jul 2014 23:49:26 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:49:22 +0800
Message-ID: <1406011764-4955-4-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1406011764-4955-1-git-send-email-b50113@freescale.com>
References: <1406011764-4955-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(86362001)(6806004)(102836001)(93916002)(89996001)(21056001)(87286001)(44976005)(19580405001)(110136001)(575784001)(76482001)(83322001)(19580395003)(92566001)(81542001)(92726001)(97736001)(74662001)(104166001)(50986999)(88136002)(64706001)(74502001)(85852003)(77982001)(15975445006)(87936001)(20776003)(99396002)(48376002)(31966008)(47776003)(46102001)(76176999)(83072002)(80022001)(104016003)(81342001)(84676001)(26826002)(79102001)(85306003)(95666004)(229853001)(68736004)(107046002)(15202345003)(77156001)(2351001)(36756003)(50466002)(105606002)(69596002)(106466001)(62966002)(4396001)(50226001)(81156004)(33646002)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB279;
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
Subject: [PATCH] gstreamer1.0: pass rate of input segment to output segment in gstbaseparse.
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
X-List-Received-Date: Tue, 22 Jul 2014 07:04:14 -0000
Content-Type: text/plain

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 ...s-rate-of-input-segment-to-output-segment.patch |   32 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.2.4.bb                |    4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch
new file mode 100644
index 0000000..be6c834
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-pass-rate-of-input-segment-to-output-segment.patch
@@ -0,0 +1,32 @@
+From e70334442ba3bb046a6389bb3d8549323dc1e7f0 Mon Sep 17 00:00:00 2001
+From: zhouming <zmafox@gmail.com>
+Date: Wed, 7 May 2014 18:26:38 +0800
+Subject: [PATCH] pass rate of input segment to output segment.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=729701
+
+Commit - 2793f808ee7fbebc7de2c7b733c6e94dac6a099f  in master branch
+
+Upstream Status: Backported
+
+Signed-off-by: <zmafox@gmail.com>
+---
+ libs/gst/base/gstbaseparse.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libs/gst/base/gstbaseparse.c b/libs/gst/base/gstbaseparse.c
+index 4378cad..7579b5e 100644
+--- a/libs/gst/base/gstbaseparse.c
++++ b/libs/gst/base/gstbaseparse.c
+@@ -1012,6 +1012,8 @@ gst_base_parse_sink_event_default (GstBaseParse * parse, GstEvent * event)
+ 
+       gst_event_parse_segment (event, &in_segment);
+       gst_segment_init (&out_segment, GST_FORMAT_TIME);
++      out_segment.rate = in_segment->rate;
++      out_segment.applied_rate = in_segment->applied_rate;
+ 
+       GST_DEBUG_OBJECT (parse, "segment %" GST_SEGMENT_FORMAT, in_segment);
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
index 1204dd5..535b681 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.2.4.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
-    "
+    file://0001-pass-rate-of-input-segment-to-output-segment.patch \
+"
+
 SRC_URI[md5sum] = "74d8f674187a5f0ddf38da594c3998c3"
 SRC_URI[sha256sum] = "1e7ca67a7870a82c9ed51d51d0008cdbc550c41d64cc3ff3f9a1c2fc311b4929"
 S = "${WORKDIR}/gstreamer-${PV}"
-- 
1.7.9.5


