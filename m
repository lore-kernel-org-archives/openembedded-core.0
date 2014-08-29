Return-Path: <Yue.Tao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A4D371233
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 06:46:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7T6kKcH023241
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 23:46:20 -0700 (PDT)
Received: from pek-ytao-l1.corp.ad.wrs.com (128.224.162.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 28 Aug 2014 23:46:20 -0700
From: Yue Tao <Yue.Tao@windriver.com>
To: <yue.tao@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Aug 2014 14:46:19 +0800
Message-ID: <1409294779-11573-2-git-send-email-Yue.Tao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409294779-11573-1-git-send-email-Yue.Tao@windriver.com>
References: <1409294779-11573-1-git-send-email-Yue.Tao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.151]
Subject: [PATCH 2/2] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0869
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
X-List-Received-Date: Fri, 29 Aug 2014 06:46:19 -0000
Content-Type: text/plain

The field_end function in libavcodec/h264.c in FFmpeg before 1.1.2
allows remote attackers to have an unspecified impact via crafted H.264
data, related to an SPS and slice mismatch and an out-of-bounds array
access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0869

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
---
 ...rror-concealment-when-SPS-and-slices-are-.patch |   33 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch
new file mode 100644
index 0000000..5d45c1a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch
@@ -0,0 +1,33 @@
+gst-ffmpeg: h264: skip error concealment when SPS and slices are
+ mismatching
+
+Fixes out of array accesses
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 695af8eed642ff0104834495652d1ee784a4c14d)
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+---
+ libavcodec/h264.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/libavcodec/h264.c b/libavcodec/h264.c
+index da144db..0aab4e7 100644
+--- a/gst-libs/ext/libav/libavcodec/h264.c
++++ b/gst-libs/ext/libav/libavcodec/h264.c
+@@ -2351,7 +2351,7 @@ static int field_end(H264Context *h, int in_setup)
+      * past end by one (callers fault) and resync_mb_y != 0
+      * causes problems for the first MB line, too.
+      */
+-    if (!FIELD_PICTURE)
++    if (!FIELD_PICTURE && h->current_slice && !h->sps.new)
+         ff_er_frame_end(s);
+ 
+     ff_MPV_frame_end(s);
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 3ccb7be..395054d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -54,6 +54,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
            file://0001-ffserver-set-oformat.patch \
            file://0001-h264-set-parameters-from-SPS-whenever-it-changes.patch \
+           file://0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'libav9', 'file://libav-9.patch', '', d)} \ 
 "
 
-- 
1.7.9.5


