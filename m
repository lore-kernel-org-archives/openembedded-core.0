Return-Path: <B50113@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0207.outbound.protection.outlook.com [207.46.163.207])
	by mail.openembedded.org (Postfix) with ESMTP id 4879B65E2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 05:51:40 +0000 (UTC)
Received: from BN3PR0301CA0027.namprd03.prod.outlook.com (25.160.180.165) by
	BY2PR03MB286.namprd03.prod.outlook.com (10.242.37.21) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Thu, 24 Jul 2014 05:51:39 +0000
Received: from BN1AFFO11FD055.protection.gbl (2a01:111:f400:7c10::159) by
	BN3PR0301CA0027.outlook.office365.com (2a01:111:e400:4000::37) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Thu, 24 Jul 2014 05:51:37 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD055.mail.protection.outlook.com (10.58.53.70) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Thu, 24 Jul 2014 05:51:37 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6O5pZSs027654;
	Wed, 23 Jul 2014 22:51:35 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 13:51:16 +0800
Message-ID: <1406181076-15660-1-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(26826002)(575784001)(87936001)(64706001)(4396001)(50226001)(102836001)(81342001)(99396002)(81542001)(48376002)(46102001)(77156001)(2351001)(31966008)(97736001)(6806004)(50986999)(76482001)(74502001)(92726001)(88136002)(86362001)(33646002)(36756003)(92566001)(80022001)(81156004)(77982001)(110136001)(62966002)(106466001)(50466002)(107046002)(84676001)(105606002)(93916002)(85306003)(20776003)(69596002)(68736004)(74662001)(83072002)(95666004)(15975445006)(21056001)(79102001)(104016003)(19580405001)(83322001)(44976005)(104166001)(89996001)(47776003)(229853001)(85852003)(19580395003)(87286001)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB286;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 028256169F
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B50113@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] gstreamer1.0-plugins-base: do not change eos event to gap event if no data has passed to streamsynchronizer.
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
X-List-Received-Date: Thu, 24 Jul 2014 05:51:41 -0000
Content-Type: text/plain

From: Wang Zidan <b50113@freescale.com>

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 .../do-not-change-eos-event-to-gap-event-if.patch  |   37 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.2.4.bb   |    4 +++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
new file mode 100644
index 0000000..0407a30
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/do-not-change-eos-event-to-gap-event-if.patch
@@ -0,0 +1,37 @@
+From b608d027fff6efc2d1988ebf169cbe3b2b44a61b Mon Sep 17 00:00:00 2001
+From: zhouming <b42586@freescale.com>
+Date: Thu, 8 May 2014 12:01:17 +0800
+Subject: [PATCH] ENGR00312034: do not change eos event to gap event if no
+ data has passed to streamsynchronizer.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=727074
+
+Upstream Status: Submitted
+
+Signed-off-by: zhouming <b42586@freescale.com>
+---
+ gst/playback/gststreamsynchronizer.c |    5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/gst/playback/gststreamsynchronizer.c b/gst/playback/gststreamsynchronizer.c
+index 3997d1b..3e17c55 100644
+--- a/gst/playback/gststreamsynchronizer.c
++++ b/gst/playback/gststreamsynchronizer.c
+@@ -488,12 +488,11 @@ gst_stream_synchronizer_sink_event (GstPad * pad, GstObject * parent,
+         }
+         g_slist_free (pads);
+       } else {
+-        /* if EOS, but no data has passed, then send something to replace EOS
+-         * for preroll purposes */
++        /* if EOS, but no data has passed, then send EOS event */
+         if (!seen_data) {
+           GstEvent *gap_event;
+ 
+-          gap_event = gst_event_new_gap (timestamp, GST_CLOCK_TIME_NONE);
++          gap_event = gst_event_new_eos ();
+           ret = gst_pad_push_event (srcpad, gap_event);
+         } else {
+           GstEvent *gap_event;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
index ed8babe..6e3d8f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
@@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                    "
+
+SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
+"
+
 SRC_URI[md5sum] = "278e0a1872ecb981e91830b2cb7f3e98"
 SRC_URI[sha256sum] = "4d6273dc3f5a94bcc53ccfe0711cfddd49e31371d1136bf62fa1ecc604fc6550"
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.7.9.5


