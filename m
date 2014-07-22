Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A763D701C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:47:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7l54I025155
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:47:05 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:47:04 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:50 +0800
Message-ID: <5c16946ecc2d106e7ed1ff26acd6c6e9d849e9c8.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 15/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2012-6618
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
X-List-Received-Date: Tue, 22 Jul 2014 07:47:03 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The av_probe_input_buffer function in libavformat/utils.c in FFmpeg
before 1.0.2, when running with certain -probesize values, allows remote
attackers to cause a denial of service (crash) via a crafted MP3 file,
possibly related to frame size or lack of sufficient frames to estimate
rate.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6618

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...f-compute-probe-buffer-size-more-reliably.patch |   45 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch
new file mode 100644
index 0000000..ea4aa22
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-lavf-compute-probe-buffer-size-more-reliably.patch
@@ -0,0 +1,45 @@
+gst-ffmpeg: lavf: compute probe buffer size more reliably.
+
+The previous code computes the offset by reversing the growth
+of the allocated buffer size: it is complex and did lead to
+inconsistencies when the size limit is reached.
+
+Fix trac ticket #1991.
+(cherry picked from commit 03847eb8259291b4ff1bd840bd779d0699d71f96)
+
+Conflicts:
+	libavformat/utils.c
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ libavformat/utils.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavformat/utils.c b/libavformat/utils.c
+index 7940037..be73c4a 100644
+--- a/gst-libs/ext/libav/libavformat/utils.c
++++ b/gst-libs/ext/libav/libavformat/utils.c
+@@ -459,7 +459,7 @@ int av_probe_input_buffer(AVIOContext *pb, AVInputFormat **fmt,
+ {
+     AVProbeData pd = { filename ? filename : "", NULL, -offset };
+     unsigned char *buf = NULL;
+-    int ret = 0, probe_size;
++    int ret = 0, probe_size, buf_offset = 0;
+ 
+     if (!max_probe_size) {
+         max_probe_size = PROBE_BUF_MAX;
+@@ -499,7 +499,7 @@ int av_probe_input_buffer(AVIOContext *pb, AVInputFormat **fmt,
+             score = 0;
+             ret = 0;            /* error was end of file, nothing read */
+         }
+-        pd.buf_size += ret;
++        pd.buf_size = buf_offset += ret;
+         pd.buf = &buf[offset];
+ 
+         memset(pd.buf + pd.buf_size, 0, AVPROBE_PADDING_SIZE);
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 7806006..10bf36c 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -51,6 +51,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch \
            file://0001-error-concealment-initialize-block-index.patch \
            file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
+           file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


