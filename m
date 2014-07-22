Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA2657021B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:16:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M6GbwP024415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:16:37 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 21 Jul 2014 23:16:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:16:17 +0800
Message-ID: <db05caed19b8bcc658f180cf1a52a9ee21f9b1d4.1406006666.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406006666.git.rongqing.li@windriver.com>
References: <cover.1406006666.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6617
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
X-List-Received-Date: Tue, 22 Jul 2014 06:16:36 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The prepare_sdp_description function in ffserver.c in FFmpeg before
1.0.2 allows remote attackers to cause a denial of service (crash) via
vectors related to the rtp format.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6617

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-ffserver-set-oformat.patch                |   36 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch
new file mode 100644
index 0000000..cc28878
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-ffserver-set-oformat.patch
@@ -0,0 +1,36 @@
+gst-ffmpeg: ffserver: set oformat
+
+Fix Ticket1986
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit cbe43e62c9ac7d4aefdc13476f6f691bd626525f)
+
+Upstream-Status: Pending
+
+---
+ ffserver.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/ffserver.c b/ffserver.c
+index 4044d0f..8740140 100644
+--- a/gst-libs/ext/libav/ffserver.c
++++ b/gst-libs/ext/libav/ffserver.c
+@@ -2937,12 +2937,14 @@ static int prepare_sdp_description(FFStream *stream, uint8_t **pbuffer,
+ {
+     AVFormatContext *avc;
+     AVStream *avs = NULL;
++    AVOutputFormat *rtp_format = av_guess_format("rtp", NULL, NULL);
+     int i;
+ 
+     avc =  avformat_alloc_context();
+-    if (avc == NULL) {
++    if (avc == NULL || !rtp_format) {
+         return -1;
+     }
++    avc->oformat = rtp_format;
+     av_dict_set(&avc->metadata, "title",
+                stream->title[0] ? stream->title : "No Title", 0);
+     avc->nb_streams = stream->nb_streams;
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 10bf36c..e26b267 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -52,6 +52,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-error-concealment-initialize-block-index.patch \
            file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
            file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
+           file://0001-ffserver-set-oformat.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


