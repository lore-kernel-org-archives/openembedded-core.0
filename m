Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 31403724DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 09:10:02 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so102541733wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Apr 2015 02:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Sp8mfbT1psk6fft+NsvnG2+qFO7OH7nHyf7qzVTufgM=;
	b=hPCpAOjwx//pKCYHnBi5evcX7TdcfGwOi160sM15nS3QTp7fBJXPcCSdrijv0h22wx
	ZKffA6GXN6IWvXCi/TqfTQ8FoGxWtPfI0DhJWvHoX6Y3EOmYBjCn5vk7d5QnMdfefuND
	JUo96YElzZWQNc4kblkwGC9HSPdkwrIAI0sx1AAFKskzF/coD6MPwluaThb0OenEmW6B
	zQhZ80G5ZXD1UwphovpD8U3Xc6qK2rr8PcjdXFekY5OWFJLwXSivDISgllG+1qSnWVhU
	P8vZKEUOEBQ4QkXrDouvAeULSA5tHWhfD81TwFb6A508b7KP6EqyebWAcWaGhAZybGya
	AMCw==
X-Gm-Message-State: ALoCoQlztVW1SPI53/jAIrKbMF2En/F5FG7hn89zvbhcw71CGwhvCEIYOr5hZYOrJOWCEO6iDQyG
X-Received: by 10.194.61.244 with SMTP id t20mr55599612wjr.83.1428570602792;
	Thu, 09 Apr 2015 02:10:02 -0700 (PDT)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id
	hw7sm19181797wjb.24.2015.04.09.02.10.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 09 Apr 2015 02:10:01 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:09:52 +0200
Message-Id: <1428570593-10940-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1428570593-10940-1-git-send-email-koen@dominion.thruhere.net>
References: <1428570593-10940-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 2/3] gst-ffmpeg: remove bogus patch that leads to build failures
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
X-List-Received-Date: Thu, 09 Apr 2015 09:10:02 -0000

'0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch'
patches the internal copy of ffmpeg with a hunk that generates a compile
failure because AV_PIX_FMT_YUV422P is undefined.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...check-width-more-completely-avoid-out-of-.patch | 30 ----------------------
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |  1 -
 2 files changed, 31 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch
deleted file mode 100644
index 6b60d16..0000000
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-gst-ffmpeg: huffyuvdec: check width more completely, avoid out of array
- accesses
-
-Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
-
-Upstream-Status: Backport 
-
-Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
----
- libavcodec/huffyuv.c |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
-
-diff --git a/libavcodec/huffyuv.c b/libavcodec/huffyuv.c
-index 6e88114..ca5bcd8 100644
---- a/gst-libs/ext/libav/libavcodec/huffyuv.c
-+++ b/gst-libs/ext/libav/libavcodec/huffyuv.c
-@@ -526,6 +526,10 @@ s->bgr32=1;
-         assert(0);
-     }
- 
-+    if (s->predictor == MEDIAN && avctx->pix_fmt == AV_PIX_FMT_YUV422P && avctx->width%4) {
-+        av_log(avctx, AV_LOG_ERROR, "width must be a multiple of 4 this colorspace and predictor\n");
-+        return AVERROR_INVALIDDATA;
-+    }
-     alloc_temp(s);
- 
- //    av_log(NULL, AV_LOG_DEBUG, "pred:%d bpp:%d hbpp:%d il:%d\n", s->predictor, s->bitstream_bpp, avctx->bits_per_coded_sample, s->interlaced);
--- 
-1.7.5.4
-
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 219feaa..e1a13c4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -46,7 +46,6 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch \
            file://gst-ffmpeg-CVE-2013-0855.patch \
            file://0001-qdm2dec-fix-buffer-overflow.patch \
-           file://0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch \
            file://0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch \
            file://0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch \
            file://0001-error-concealment-initialize-block-index.patch \
-- 
1.9.0


