Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 76822701D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7krie025140
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:46:53 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:46:52 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:40 +0800
Message-ID: <fc6a2cffb64eb5bf9e95c11996bc78b3eedc9e9a.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3946
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

The ff_h264_decode_sei function in libavcodec/h264_sei.c in FFmpeg
before 0.10 allows remote attackers to have an unspecified impact via
crafted Supplemental enhancement information (SEI) data, which triggers
an infinite loop.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3946

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-h264_sei-Fix-infinite-loop.patch          |   39 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch
new file mode 100644
index 0000000..1e62b50
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-h264_sei-Fix-infinite-loop.patch
@@ -0,0 +1,39 @@
+gst-ffmpeg: h264_sei: Fix infinite loop.
+
+Fixsot yet fixed parts of CVE-2011-3946.
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+
+Upstream-Status: Backport 
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+---
+ libavcodec/h264_sei.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+
+diff --git a/libavcodec/h264_sei.c b/libavcodec/h264_sei.c
+index 374e53d..80d70e5 100644
+--- a/gst-libs/ext/libav/libavcodec/h264_sei.c
++++ b/gst-libs/ext/libav/libavcodec/h264_sei.c
+@@ -169,11 +169,15 @@ int ff_h264_decode_sei(H264Context *h){
+ 
+         type=0;
+         do{
++            if (get_bits_left(&s->gb) < 8)
++                return -1;
+             type+= show_bits(&s->gb, 8);
+         }while(get_bits(&s->gb, 8) == 255);
+ 
+         size=0;
+         do{
++            if (get_bits_left(&s->gb) < 8)
++                return -1;
+             size+= show_bits(&s->gb, 8);
+         }while(get_bits(&s->gb, 8) == 255);
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index c014fc2..ad4dd34 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -41,6 +41,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-error_concealment-Check-that-the-picture-is-not-in-a.patch \
            file://0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch \
            file://0001-vp3-Copy-all-3-frames-for-thread-updates.patch \
+           file://0001-h264_sei-Fix-infinite-loop.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


