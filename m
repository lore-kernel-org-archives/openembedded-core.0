Return-Path: <B50113@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0243.outbound.protection.outlook.com [207.46.163.243])
	by mail.openembedded.org (Postfix) with ESMTP id B904170209
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:04:27 +0000 (UTC)
Received: from CH1PR03CA009.namprd03.prod.outlook.com (10.255.156.154) by
	BN1PR03MB282.namprd03.prod.outlook.com (10.255.200.21) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Tue, 22 Jul 2014 06:49:27 +0000
Received: from BN1AFFO11FD032.protection.gbl (10.255.156.132) by
	CH1PR03CA009.outlook.office365.com (10.255.156.154) with Microsoft SMTP
	Server (TLS) id 15.0.990.7 via Frontend Transport;
	Tue, 22 Jul 2014 06:49:26 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD032.mail.protection.outlook.com (10.58.52.186) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Tue, 22 Jul 2014 06:49:26 +0000
Received: from ubuntu.ap.freescale.net (ubuntu-010192241184.ap.freescale.net
	[10.192.241.184])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6M6nIY1017680;
	Mon, 21 Jul 2014 23:49:25 -0700
From: Wang Zidan <b50113@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:49:21 +0800
Message-ID: <1406011764-4955-3-git-send-email-b50113@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1406011764-4955-1-git-send-email-b50113@freescale.com>
References: <1406011764-4955-1-git-send-email-b50113@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(85852003)(76482001)(69596002)(33646002)(19580405001)(97736001)(81156004)(76176999)(50986999)(99396002)(64706001)(102836001)(50226001)(15202345003)(81342001)(47776003)(105606002)(107046002)(106466001)(44976005)(20776003)(84676001)(4396001)(83322001)(74502001)(46102001)(36756003)(92566001)(2351001)(79102001)(26826002)(80022001)(104016003)(74662001)(110136001)(575784001)(68736004)(31966008)(83072002)(77156001)(50466002)(87936001)(15975445006)(104166001)(77982001)(85306003)(88136002)(86362001)(87286001)(89996001)(95666004)(48376002)(93916002)(92726001)(81542001)(62966002)(6806004)(19580395003)(21056001)(229853001)(42262001);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR03MB282;
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
Subject: [PATCH] gstreamer1.0-libav: avoid using non-growable pool for videodec
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
X-List-Received-Date: Tue, 22 Jul 2014 07:04:28 -0000
Content-Type: text/plain

Using growable pool with at least 32 buffers for decoders.

Signed-off-by: Wang Zidan <b50113@freescale.com>
---
 .../videodec-Don-t-use-non-growable-pool.patch     |   75 ++++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.2.4.bb          |    3 +-
 2 files changed, 77 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch
new file mode 100644
index 0000000..d9b796b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/videodec-Don-t-use-non-growable-pool.patch
@@ -0,0 +1,75 @@
+From 62a4d065ed7bd117d869fd8bcb61274c2870ddf5 Mon Sep 17 00:00:00 2001
+From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
+Date: Thu, 27 Mar 2014 18:53:53 -0400
+Subject: [PATCH] videodec: Don't use non-growable pool
+
+As we don't know how many output buffers we need to operate, we need to
+avoid pool that can't grow. Otherwise the pipeline may stall, waiting
+for buffers. For now, we require it to be able to grow to at least
+32 buffers, which I think is a fair amount of buffers for decoders.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=726299
+
+Commit 2a337d926cc30cd7eaae13a4b46eea68ba89e368 in master branch
+
+Upstream Status:  Backported
+
+Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
+---
+ ext/libav/gstavviddec.c |   22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
+index 6c9c0c9..d80fd52 100644
+--- a/ext/libav/gstavviddec.c
++++ b/ext/libav/gstavviddec.c
+@@ -46,6 +46,7 @@ GST_DEBUG_CATEGORY_EXTERN (GST_CAT_PERFORMANCE);
+ #define DEFAULT_DIRECT_RENDERING	TRUE
+ #define DEFAULT_DEBUG_MV		FALSE
+ #define DEFAULT_MAX_THREADS		0
++#define REQUIRED_POOL_MAX_BUFFERS       32
+ 
+ enum
+ {
+@@ -1620,7 +1621,7 @@ gst_ffmpegviddec_decide_allocation (GstVideoDecoder * decoder, GstQuery * query)
+   GstBufferPool *pool;
+   guint size, min, max;
+   GstStructure *config;
+-  gboolean have_videometa, have_alignment;
++  gboolean have_videometa, have_alignment, update_pool;
+   GstAllocator *allocator = NULL;
+   GstAllocationParams params = { 0, 15, 0, 0, };
+ 
+@@ -1639,6 +1640,22 @@ gst_ffmpegviddec_decide_allocation (GstVideoDecoder * decoder, GstQuery * query)
+ 
+   gst_query_parse_nth_allocation_pool (query, 0, &pool, &size, &min, &max);
+ 
++  /* Don't use pool that can't grow, as we don't know how many buffer we'll
++   * need, otherwise we may stall */
++  if (max != 0 && max < REQUIRED_POOL_MAX_BUFFERS) {
++    gst_object_unref (pool);
++    pool = gst_video_buffer_pool_new ();
++    max = 0;
++    update_pool = TRUE;
++
++    /* if there is an allocator, also drop it, as it might be the reason we
++     * have this limit. Default will be used */
++    if (allocator) {
++      gst_object_unref (allocator);
++      allocator = NULL;
++    }
++  }
++
+   config = gst_buffer_pool_get_config (pool);
+   gst_buffer_pool_config_set_params (config, state->caps, size, min, max);
+   /* we are happy with the default allocator but we would like to have 16 bytes
+@@ -1726,6 +1743,9 @@ gst_ffmpegviddec_decide_allocation (GstVideoDecoder * decoder, GstQuery * query)
+   /* and store */
+   gst_buffer_pool_set_config (pool, config);
+ 
++  if (update_pool)
++    gst_query_set_nth_allocation_pool (query, 0, pool, size, min, max);
++
+   gst_object_unref (pool);
+   if (allocator)
+     gst_object_unref (allocator);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
index 350b528..9e23219 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.2.4.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
     file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-    "
+    file://videodec-Don-t-use-non-growable-pool.patch \
+"
 SRC_URI[md5sum] = "6454f9f22b3aa37694781633e0d20a9c"
 SRC_URI[sha256sum] = "2a69480d63fc2db93249d9e2e229ab3541bbc2db881b0f64de13d0bfc7d1f037"
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
-- 
1.7.9.5


