Return-Path: <B50113@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0203.outbound.protection.outlook.com [207.46.163.203])
	by mail.openembedded.org (Postfix) with ESMTP id 0165565E2B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 05:53:29 +0000 (UTC)
Received: from BN3PR0301CA0004.namprd03.prod.outlook.com (25.160.180.142) by
	BL2PR03MB275.namprd03.prod.outlook.com (10.255.231.22) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Thu, 24 Jul 2014 05:53:24 +0000
Received: from BN1AFFO11FD035.protection.gbl (2a01:111:f400:7c10::106) by
	BN3PR0301CA0004.outlook.office365.com (2a01:111:e400:4000::14) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Thu, 24 Jul 2014 05:53:24 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD035.mail.protection.outlook.com (10.58.52.159) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Thu, 24 Jul 2014 05:53:24 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6O5rLEh004336; Wed, 23 Jul 2014 22:53:22 -0700
From: Zidan Wang <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 13:53:37 +0800
Message-ID: <1406181217-15706-1-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(88136002)(92566001)(50466002)(21056001)(87936001)(104016003)(15975445006)(105606002)(64706001)(68736004)(80022001)(50986999)(50226001)(31966008)(89996001)(83322001)(26826002)(19580405001)(92726001)(83072002)(19580395003)(74662001)(97736001)(74502001)(104166001)(85852003)(99396002)(44976005)(87286001)(102836001)(81542001)(86362001)(575784001)(81342001)(93916002)(76482001)(36756003)(95666004)(62966002)(6806004)(77156001)(84676001)(47776003)(2351001)(79102001)(85306003)(107046002)(229853001)(20776003)(4396001)(106466001)(110136001)(46102001)(33646002)(48376002)(77982001)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB275;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 028256169F
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.50
	as permitted sender) receiver=; client-ip=192.88.168.50;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B50113@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [PATCH] gstreamer1.0-plugins-base: get caps from src pad when query caps in gsttagdemux
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
X-List-Received-Date: Thu, 24 Jul 2014 05:53:31 -0000
Content-Type: text/plain

From: Wang Zidan <b50113@freescale.com>

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 .../get-caps-from-src-pad-when-query-caps.patch    |   44 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_1.2.4.bb   |    1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
new file mode 100644
index 0000000..0fc561c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
@@ -0,0 +1,44 @@
+From af0dac26f62aaceb4bf266720911953793e0fc5d Mon Sep 17 00:00:00 2001
+From: zhouming <b42586@freescale.com>
+Date: Wed, 14 May 2014 10:16:20 +0800
+Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
+
+https://bugzilla.gnome.org/show_bug.cgi?id=728312
+
+Upstream Status: Submitted
+
+Signed-off-by: zhouming <b42586@freescale.com>
+---
+ gst-libs/gst/tag/gsttagdemux.c |   13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+ mode change 100644 => 100755 gst-libs/gst/tag/gsttagdemux.c
+
+diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
+old mode 100644
+new mode 100755
+index 9b6c478..ae2294a
+--- a/gst-libs/gst/tag/gsttagdemux.c
++++ b/gst-libs/gst/tag/gsttagdemux.c
+@@ -1708,6 +1708,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
+       }
+       break;
+     }
++    case GST_QUERY_CAPS:
++    {
++
++      /* We can hijack caps query if we typefind already */
++      if (demux->priv->src_caps) {
++        gst_query_set_caps_result (query, demux->priv->src_caps);
++        res = TRUE;
++      } else {
++        res = gst_pad_query_default (pad, parent, query);
++      }
++      break;
++    }
++
+     default:
+       res = gst_pad_query_default (pad, parent, query);
+       break;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
index 6e3d8f9..dee0894 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.2.4.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                    "
 
 SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
+            file://get-caps-from-src-pad-when-query-caps.patch \
 "
 
 SRC_URI[md5sum] = "278e0a1872ecb981e91830b2cb7f3e98"
-- 
1.7.9.5


