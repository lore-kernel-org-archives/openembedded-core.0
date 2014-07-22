Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4DC701C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 07:47:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6M7l1Lw015122
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 00:47:01 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 00:47:01 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 15:46:47 +0800
Message-ID: <4c5a07410a1d6f23bdb563af135d5dcd4c93ea78.1406015054.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406015054.git.rongqing.li@windriver.com>
References: <cover.1406015054.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-7010
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
X-List-Received-Date: Tue, 22 Jul 2014 07:47:00 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Multiple integer signedness errors in libavcodec/dsputil.c in FFmpeg
before 2.1 allow remote attackers to cause a denial of service
(out-of-bounds array access) or possibly have unspecified other impact
via crafted data.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7010

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...util-fix-signedness-in-sizeof-comparissio.patch |   40 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch
new file mode 100644
index 0000000..31fa51a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch
@@ -0,0 +1,40 @@
+From a99aff4e4bbef8e64b51f267cd1769214e1b4e80 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Fri, 30 Aug 2013 23:40:47 +0200
+Subject: [PATCH] avcodec/dsputil: fix signedness in sizeof() comparissions
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+(cherry picked from commit 454a11a1c9c686c78aa97954306fb63453299760)
+
+Upstream-Status: Backport
+
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/dsputil.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/dsputil.c b/libavcodec/dsputil.c
+index 53dc2eb..6264832 100644
+--- a/gst-libs/ext/libav/libavcodec/dsputil.c
++++ b/gst-libs/ext/libav/libavcodec/dsputil.c
+@@ -1912,7 +1912,7 @@ void ff_set_cmp(DSPContext* c, me_cmp_func *cmp, int type){
+ 
+ static void add_bytes_c(uint8_t *dst, uint8_t *src, int w){
+     long i;
+-    for(i=0; i<=w-sizeof(long); i+=sizeof(long)){
++    for(i=0; i<=w-(int)sizeof(long); i+=sizeof(long)){
+         long a = *(long*)(src+i);
+         long b = *(long*)(dst+i);
+         *(long*)(dst+i) = ((a&pb_7f) + (b&pb_7f)) ^ ((a^b)&pb_80);
+@@ -1937,7 +1937,7 @@ static void diff_bytes_c(uint8_t *dst, uint8_t *src1, uint8_t *src2, int w){
+         }
+     }else
+ #endif
+-    for(i=0; i<=w-sizeof(long); i+=sizeof(long)){
++    for(i=0; i<=w-(int)sizeof(long); i+=sizeof(long)){
+         long a = *(long*)(src1+i);
+         long b = *(long*)(src2+i);
+         *(long*)(dst+i) = ((a|pb_80) - (b&pb_7f)) ^ ((a^b^pb_80)&pb_80);
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index a540211..c3681b6 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-qdm2dec-fix-buffer-overflow.patch \
            file://0001-huffyuvdec-check-width-more-completely-avoid-out-of-.patch \
            file://0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch \
+           file://0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


