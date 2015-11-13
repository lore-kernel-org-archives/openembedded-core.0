Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E47A77157
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:03:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD83ZRq015630
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:03:35 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 00:03:34 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 16:03:29 +0800
Message-ID: <c095b63acbbda5dffd16cecd668a06b9be9c72ef.1447401669.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447401669.git.jackie.huang@windriver.com>
References: <cover.1447401669.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] libav: fix CVE-2015-6824
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
X-List-Received-Date: Fri, 13 Nov 2015 08:03:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jackie Huang <jackie.huang@windriver.com>

Cherry-pick patch from ffmpeg to fix CVE-2015-6824:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=a5d44d5c220e12ca0cb7a4eceb0f74759cb13111

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libav/libav/libav-fix-CVE-2015-6824.patch      | 46 ++++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_9.18.bb        |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6824.patch

diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6824.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6824.patch
new file mode 100644
index 0000000..2b19bd2
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6824.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Pending
+
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-6824
+
+Cherry-pick from:
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=a5d44d5c220e12ca0cb7a4eceb0f74759cb13111
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+From a5d44d5c220e12ca0cb7a4eceb0f74759cb13111 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Wed, 15 Jul 2015 19:20:19 +0200
+Subject: [PATCH] swscale/utils: Clear pix buffers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes use of uninitialized memory
+Fixes: a96874b9466b6edc660a519c7ad47977_signal_sigsegv_7ffff713351a_744_nc_sample.avi with memlimit 2147483648
+
+Found-by: Samuel Groß, Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+---
+ libswscale/utils.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libswscale/utils.c b/libswscale/utils.c
+index c384aa5..16f187a 100644
+--- a/libswscale/utils.c
++++ b/libswscale/utils.c
+@@ -1496,9 +1496,9 @@ av_cold int sws_init_context(SwsContext *c, SwsFilter *srcFilter,
+ 
+     /* Allocate pixbufs (we use dynamic allocation because otherwise we would
+      * need to allocate several megabytes to handle all possible cases) */
+-    FF_ALLOC_OR_GOTO(c, c->lumPixBuf,  c->vLumBufSize * 3 * sizeof(int16_t *), fail);
+-    FF_ALLOC_OR_GOTO(c, c->chrUPixBuf, c->vChrBufSize * 3 * sizeof(int16_t *), fail);
+-    FF_ALLOC_OR_GOTO(c, c->chrVPixBuf, c->vChrBufSize * 3 * sizeof(int16_t *), fail);
++    FF_ALLOCZ_OR_GOTO(c, c->lumPixBuf,  c->vLumBufSize * 3 * sizeof(int16_t *), fail);
++    FF_ALLOCZ_OR_GOTO(c, c->chrUPixBuf, c->vChrBufSize * 3 * sizeof(int16_t *), fail);
++    FF_ALLOCZ_OR_GOTO(c, c->chrVPixBuf, c->vChrBufSize * 3 * sizeof(int16_t *), fail);
+     if (CONFIG_SWSCALE_ALPHA && isALPHA(c->srcFormat) && isALPHA(c->dstFormat))
+         FF_ALLOCZ_OR_GOTO(c, c->alpPixBuf, c->vLumBufSize * 3 * sizeof(int16_t *), fail);
+     /* Note we need at least one pixel more at the end because of the MMX code
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
index 026f4df..4378dbe 100644
--- a/meta/recipes-multimedia/libav/libav_9.18.bb
+++ b/meta/recipes-multimedia/libav/libav_9.18.bb
@@ -8,4 +8,5 @@ SRC_URI += "file://libav-fix-CVE-2014-9676.patch \
             file://libav-fix-CVE-2015-3395.patch \
             file://libav-fix-CVE-2015-6820.patch \
             file://libav-fix-CVE-2015-6823.patch \
+            file://libav-fix-CVE-2015-6824.patch \
            "
-- 
1.9.1


