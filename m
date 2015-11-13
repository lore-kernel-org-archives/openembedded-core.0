Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 97B4477116
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:03:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD83TRO019235
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:03:29 -0800
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 00:03:28 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 16:03:25 +0800
Message-ID: <34c408c57d9638c0f8991d604370fcd8617320b5.1447401669.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447401669.git.jackie.huang@windriver.com>
References: <cover.1447401669.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] libav: fix CVE-2015-1872
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
X-List-Received-Date: Fri, 13 Nov 2015 08:03:29 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Cherry-pick patch and update context from ffmpeg to fix CVE-2015-1872:

http://git.videolan.org/?p=ffmpeg.git;a=commit;h=fabbfaa095660982cc0bc63242c459561fa37037

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libav/libav/libav-fix-CVE-2015-1872.patch      | 35 ++++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_9.18.bb        |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-1872.patch

diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-1872.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-1872.patch
new file mode 100644
index 0000000..058bfe7
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-1872.patch
@@ -0,0 +1,35 @@
+libav: Fix CVE-2015-1872
+
+Cherry-pick patch for fixing CVE-2015-1872 and update context from ffmpeg:
+
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=fabbfaa095660982cc0bc63242c459561fa37037
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ libavcodec/mjpegdec.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/mjpegdec.c b/libavcodec/mjpegdec.c
+index 74bbfa6..ec7d411 100644
+--- a/libavcodec/mjpegdec.c
++++ b/libavcodec/mjpegdec.c
+@@ -357,9 +357,12 @@ int ff_mjpeg_decode_sof(MJpegDecodeContext *s)
+         return AVERROR_PATCHWELCOME;
+     }
+     if (s->ls) {
+-        if (s->nb_components > 1)
++        if (s->nb_components == 3) {
+             s->avctx->pix_fmt = AV_PIX_FMT_RGB24;
+-        else if (s->bits <= 8)
++        } else if (s->nb_components != 1) {
++            av_log(s->avctx, AV_LOG_ERROR, "Unsupported number of components %d\n", s->nb_components);
++            return AVERROR_PATCHWELCOME;
++        } else if (s->bits <= 8)
+             s->avctx->pix_fmt = AV_PIX_FMT_GRAY8;
+         else
+             s->avctx->pix_fmt = AV_PIX_FMT_GRAY16;
+-- 
+2.4.1
+
diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
index 210a649..c2dd02c 100644
--- a/meta/recipes-multimedia/libav/libav_9.18.bb
+++ b/meta/recipes-multimedia/libav/libav_9.18.bb
@@ -3,4 +3,6 @@ require libav.inc
 SRC_URI[md5sum] = "75e838068a75fb88e1b4ea0546bc16f0"
 SRC_URI[sha256sum] = "0875e835da683eef1a7bac75e1884634194149d7479d1538ba9fbe1614d066d7"
 
-SRC_URI += "file://libav-fix-CVE-2014-9676.patch"
+SRC_URI += "file://libav-fix-CVE-2014-9676.patch \
+            file://libav-fix-CVE-2015-1872.patch \
+           "
-- 
1.9.1


