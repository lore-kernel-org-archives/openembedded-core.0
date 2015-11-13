Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4C77716A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:03:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAD83YqD019243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:03:34 -0800
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 00:03:33 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 16:03:28 +0800
Message-ID: <d048302af2e51dfaf60c8bc12cc51cdc172f81ce.1447401669.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447401669.git.jackie.huang@windriver.com>
References: <cover.1447401669.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] libav: fix CVE-2015-6823
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
X-List-Received-Date: Fri, 13 Nov 2015 08:03:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jackie Huang <jackie.huang@windriver.com>

Cherry-pick patch from ffmpeg to fix CVE-2015-6823:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=f7068bf277a37479aecde2832208d820682b35e6

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libav/libav/libav-fix-CVE-2015-6823.patch      | 45 ++++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_9.18.bb        |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6823.patch

diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6823.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6823.patch
new file mode 100644
index 0000000..198353b
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6823.patch
@@ -0,0 +1,45 @@
+Upstream-Status: Pending
+
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-6823
+
+Cherry-pick from:
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=f7068bf277a37479aecde2832208d820682b35e6
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+From f7068bf277a37479aecde2832208d820682b35e6 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michael@niedermayer.cc>
+Date: Mon, 13 Jul 2015 15:46:10 +0200
+Subject: [PATCH] avcodec/alac: Clear pointers in allocate_buffers()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes: 06a4edb39ad8a9883175f9bd428334a2_signal_sigsegv_7ffff713351a_706_mov__alac__ALAC_6ch.mov
+
+Found-by: Samuel Groß, Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+---
+ libavcodec/alac.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libavcodec/alac.c b/libavcodec/alac.c
+index b0527f1..a5948bb 100644
+--- a/libavcodec/alac.c
++++ b/libavcodec/alac.c
+@@ -534,6 +534,12 @@ static int allocate_buffers(ALACContext *alac)
+     int ch;
+     int buf_size = alac->max_samples_per_frame * sizeof(int32_t);
+ 
++    for (ch = 0; ch < 2; ch++) {
++        alac->predict_error_buffer[ch]  = NULL;
++        alac->output_samples_buffer[ch] = NULL;
++        alac->extra_bits_buffer[ch]     = NULL;
++    }
++
+     for (ch = 0; ch < FFMIN(alac->channels, 2); ch++) {
+         FF_ALLOC_OR_GOTO(alac->avctx, alac->predict_error_buffer[ch],
+                          buf_size, buf_alloc_fail);
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
index 7d0cc70..026f4df 100644
--- a/meta/recipes-multimedia/libav/libav_9.18.bb
+++ b/meta/recipes-multimedia/libav/libav_9.18.bb
@@ -7,4 +7,5 @@ SRC_URI += "file://libav-fix-CVE-2014-9676.patch \
             file://libav-fix-CVE-2015-1872.patch \
             file://libav-fix-CVE-2015-3395.patch \
             file://libav-fix-CVE-2015-6820.patch \
+            file://libav-fix-CVE-2015-6823.patch \
            "
-- 
1.9.1


