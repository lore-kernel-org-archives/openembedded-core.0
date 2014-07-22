Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABA4705C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 06:16:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M6GY2i024412
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 23:16:35 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 21 Jul 2014 23:16:34 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jul 2014 14:16:15 +0800
Message-ID: <a7be47e4e974eb603426904f5a426c36f0d03a58.1406006666.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1406006666.git.rongqing.li@windriver.com>
References: <cover.1406006666.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/16] gst-ffmpeg: Security Advisory - ffmpeg - CVE-2013-0846
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
X-List-Received-Date: Tue, 22 Jul 2014 06:16:33 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Array index error in the qdm2_decode_super_block function in
libavcodec/qdm2.c in FFmpeg before 1.1 allows remote attackers to have
an unspecified impact via crafted QDM2 data, which triggers an
out-of-bounds array access.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0846

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...array-index-before-use-fix-out-of-array-a.patch |   30 ++++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch
new file mode 100644
index 0000000..0f9e335
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch
@@ -0,0 +1,30 @@
+gst-ffmpeg: qdm2: check array index before use, fix out of array
+ accesses
+
+Upsream-Status: Pending
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/qdm2.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/libavcodec/qdm2.c b/libavcodec/qdm2.c
+index 4cf4b2f..1dfb8d5 100644
+--- a/gst-libs/ext/libav/libavcodec/qdm2.c
++++ b/gst-libs/ext/libav/libavcodec/qdm2.c
+@@ -1257,6 +1257,11 @@ static void qdm2_decode_super_block (QDM2Context *q)
+     for (i = 0; packet_bytes > 0; i++) {
+         int j;
+ 
++        if (i>=FF_ARRAY_ELEMS(q->sub_packet_list_A)) {
++            SAMPLES_NEEDED_2("too many packet bytes");
++            return;
++        }
++
+         q->sub_packet_list_A[i].next = NULL;
+ 
+         if (i > 0) {
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index dd07435..7806006 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch \
            file://0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch \
            file://0001-error-concealment-initialize-block-index.patch \
+           file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-- 
1.7.10.4


