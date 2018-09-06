Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D98087953E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 09:33:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w869XUv5013176
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Sep 2018 02:33:30 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 02:33:29 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Sep 2018 17:33:28 +0800
Message-ID: <1536226408-24922-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] ffmpeg: Fix CVE-2018-15822
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
X-List-Received-Date: Thu, 06 Sep 2018 09:33:30 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Fixes: Assertion failure
Fixes: assert_flvenc.c:941_1.swf

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../ffmpeg/ffmpeg/CVE-2018-15822.patch             | 37 ++++++++++++++++++++++
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb     |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch
new file mode 100644
index 0000000..7d5868a
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2018-15822.patch
@@ -0,0 +1,37 @@
+From 6b67d7f05918f7a1ee8fc6ff21355d7e8736aa10 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Sat, 28 Jul 2018 15:03:50 +0200
+Subject: [PATCH] avformat/flvenc: Check audio packet size
+
+Fixes: Assertion failure
+Fixes: assert_flvenc.c:941_1.swf
+
+Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/6b67d7f05918f7a1ee8fc6ff21355d7e8736aa10]
+CVE: CVE-2018-15822
+
+Found-by: #CHEN HONGXU# <HCHEN017@e.ntu.edu.sg>
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ libavformat/flvenc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavformat/flvenc.c b/libavformat/flvenc.c
+index 1c552a3e6b..e4863f1fc7 100644
+--- a/libavformat/flvenc.c
++++ b/libavformat/flvenc.c
+@@ -883,6 +883,11 @@ static int flv_write_packet(AVFormatContext *s, AVPacket *pkt)
+     int flags = -1, flags_size, ret;
+     int64_t cur_offset = avio_tell(pb);
+ 
++    if (par->codec_type == AVMEDIA_TYPE_AUDIO && !pkt->size) {
++        av_log(s, AV_LOG_WARNING, "Empty audio Packet\n");
++        return AVERROR(EINVAL);
++    }
++
+     if (par->codec_id == AV_CODEC_ID_VP6F || par->codec_id == AV_CODEC_ID_VP6A ||
+         par->codec_id == AV_CODEC_ID_VP6  || par->codec_id == AV_CODEC_ID_AAC)
+         flags_size = 2;
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
index 57731e8..74c8e66 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
@@ -25,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
+           file://CVE-2018-15822.patch \
            "
 SRC_URI[md5sum] = "ae0bfdf809306a212b4f0e6eb8d1c75e"
 SRC_URI[sha256sum] = "a95c0cc9eb990e94031d2183f2e6e444cc61c99f6f182d1575c433d62afb2f97"
-- 
2.7.4


