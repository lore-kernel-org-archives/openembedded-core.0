Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDCE4701CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7ksdt015098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:46:54 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:46:53 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:41 +0800
Message-ID: <c1206169f7f7b1089a224896911c9e8619353123.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7023
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
X-List-Received-Date: Tue, 22 Jul 2014 07:46:53 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The ff_combine_frame function in libavcodec/parser.c in FFmpeg before
2.1 does not properly handle certain memory-allocation errors, which
allows remote attackers to cause a denial of service (out-of-bounds
array access) or possibly have unspecified other impact via crafted
data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7023

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...c-parser-reset-indexes-on-realloc-failure.patch |   50 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch
new file mode 100644
index 0000000..5ff6583
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-parser-reset-indexes-on-realloc-failure.patch
@@ -0,0 +1,50 @@
+gst-ffmpeg: avcodec/parser: reset indexes on realloc failure
+
+Fixes Ticket2982
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit f31011e9abfb2ae75bb32bc44e2c34194c8dc40a)
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+
+Upstream-Status: Backport 
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ libavcodec/parser.c |   10 +++++++---
+ 1 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/libavcodec/parser.c b/libavcodec/parser.c
+index 2c6de6e..66eca06 100644
+--- a/gst-libs/ext/libav/libavcodec/parser.c
++++ b/gst-libs/ext/libav/libavcodec/parser.c
+@@ -241,8 +241,10 @@ int ff_combine_frame(ParseContext *pc, int next, const uint8_t **buf, int *buf_s
+     if(next == END_NOT_FOUND){
+         void* new_buffer = av_fast_realloc(pc->buffer, &pc->buffer_size, (*buf_size) + pc->index + FF_INPUT_BUFFER_PADDING_SIZE);
+ 
+-        if(!new_buffer)
++        if(!new_buffer) {
++            pc->index = 0;
+             return AVERROR(ENOMEM);
++        }
+         pc->buffer = new_buffer;
+         memcpy(&pc->buffer[pc->index], *buf, *buf_size);
+         pc->index += *buf_size;
+@@ -255,9 +257,11 @@ int ff_combine_frame(ParseContext *pc, int next, const uint8_t **buf, int *buf_s
+     /* append to buffer */
+     if(pc->index){
+         void* new_buffer = av_fast_realloc(pc->buffer, &pc->buffer_size, next + pc->index + FF_INPUT_BUFFER_PADDING_SIZE);
+-
+-        if(!new_buffer)
++        if(!new_buffer) {
++            pc->overread_index =
++            pc->index = 0;
+             return AVERROR(ENOMEM);
++        }
+         pc->buffer = new_buffer;
+         if (next > -FF_INPUT_BUFFER_PADDING_SIZE)
+             memcpy(&pc->buffer[pc->index], *buf,
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index ad4dd34..138b660 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -42,6 +42,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch \
            file://0001-vp3-Copy-all-3-frames-for-thread-updates.patch \
            file://0001-h264_sei-Fix-infinite-loop.patch \
+           file://0001-avcodec-parser-reset-indexes-on-realloc-failure.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


