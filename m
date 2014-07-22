Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7C9702AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:46:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7l0DR025149
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:47:00 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:47:00 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:46 +0800
Message-ID: <51a1459b922eed6f47ac0695fc46b5f772323d73.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2011-3944
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
X-List-Received-Date: Tue, 22 Jul 2014 07:46:59 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The smacker_decode_header_tree function in libavcodec/smacker.c in
FFmpeg before 0.10 allows remote attackers to have an unspecified impact
via crafted Smacker data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-3944

           file://0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch \
Signed-off-by: Yue Tao <Yue.Tao@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...Check-that-the-last-indexes-are-within-th.patch |   32 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch
new file mode 100644
index 0000000..15b1614
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch
@@ -0,0 +1,32 @@
+gst-ffmpeg: smackerdec: Check that the last indexes are within the
+ table.
+
+Fixes CVE-2011-3944
+
+Upstream-Status: Backport 
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/smacker.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/libavcodec/smacker.c b/libavcodec/smacker.c
+index 30f99b4..2a8bae8 100644
+--- a/gst-libs/ext/libav/libavcodec/smacker.c
++++ b/gst-libs/ext/libav/libavcodec/smacker.c
+@@ -259,6 +259,11 @@ static int smacker_decode_header_tree(SmackVContext *smk, GetBitContext *gb, int
+     if(ctx.last[0] == -1) ctx.last[0] = huff.current++;
+     if(ctx.last[1] == -1) ctx.last[1] = huff.current++;
+     if(ctx.last[2] == -1) ctx.last[2] = huff.current++;
++    if(huff.current > huff.length){
++        ctx.last[0] = ctx.last[1] = ctx.last[2] = 1;
++        av_log(smk->avctx, AV_LOG_ERROR, "bigtree damaged\n");
++        return -1;
++    }
+ 
+     *recodes = huff.values;
+ 
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 7e3d7d6..a540211 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://gst-ffmpeg-CVE-2013-0855.patch \
            file://0001-qdm2dec-fix-buffer-overflow.patch \
            file://0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch \
+           file://0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


