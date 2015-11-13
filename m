Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3768677157
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:03:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD83WA7028071
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:03:32 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 13 Nov 2015 00:03:31 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Nov 2015 16:03:27 +0800
Message-ID: <82c25587d2605454e393bc8d94be99949d3c33ac.1447401669.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447401669.git.jackie.huang@windriver.com>
References: <cover.1447401669.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libav: fix CVE-2015-6820
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
X-List-Received-Date: Fri, 13 Nov 2015 08:03:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Cherry-pick patch from ffmpeg to fix CVE-2015-6820:
http://git.videolan.org/?p=ffmpeg.git;a=commit;h=79a98294da6cd85f8c86b34764c5e0c43b09eea3

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libav/libav/libav-fix-CVE-2015-6820.patch      | 66 ++++++++++++++++++++++
 meta/recipes-multimedia/libav/libav_9.18.bb        |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6820.patch

diff --git a/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6820.patch b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6820.patch
new file mode 100644
index 0000000..00b124c
--- /dev/null
+++ b/meta/recipes-multimedia/libav/libav/libav-fix-CVE-2015-6820.patch
@@ -0,0 +1,66 @@
+Upstream-Status: Pending
+
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-6820
+
+Cherry-pick from:
+http://git.videolan.org/?p=ffmpeg.git;a=commit;h=79a98294da6cd85f8c86b34764c5e0c43b09eea3
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+From 79a98294da6cd85f8c86b34764c5e0c43b09eea3 Mon Sep 17 00:00:00 2001
+From: Michael Niedermayer <michaelni@gmx.at>
+Date: Wed, 1 Jul 2015 02:05:43 +0200
+Subject: [PATCH] avcodec/aacsbr: check that the element type matches before
+ applying SBR
+
+Fixes out of array access
+Fixes: signal_sigsegv_3670fc0_2818_cov_2307326154_moon.mux
+
+Found-by: Mateusz "j00ru" Jurczyk and Gynvael Coldwind
+Signed-off-by: Michael Niedermayer <michaelni@gmx.at>
+---
+ libavcodec/aacsbr.c | 8 ++++++++
+ libavcodec/sbr.h    | 1 +
+ 2 files changed, 9 insertions(+)
+
+diff --git a/libavcodec/aacsbr.c b/libavcodec/aacsbr.c
+index 7e98834..ca6dad7 100644
+--- a/libavcodec/aacsbr.c
++++ b/libavcodec/aacsbr.c
+@@ -1019,6 +1019,8 @@ static unsigned int read_sbr_data(AACContext *ac, SpectralBandReplication *sbr,
+ {
+     unsigned int cnt = get_bits_count(gb);
+ 
++    sbr->id_aac = id_aac;
++
+     if (id_aac == TYPE_SCE || id_aac == TYPE_CCE) {
+         if (read_sbr_single_channel_element(ac, sbr, gb)) {
+             sbr_turnoff(sbr);
+@@ -1695,6 +1697,12 @@ void ff_sbr_apply(AACContext *ac, SpectralBandReplication *sbr, int id_aac,
+     int nch = (id_aac == TYPE_CPE) ? 2 : 1;
+     int err;
+ 
++    if (id_aac != sbr->id_aac) {
++        av_log(ac->avctx, AV_LOG_ERROR,
++            "element type mismatch %d != %d\n", id_aac, sbr->id_aac);
++        sbr_turnoff(sbr);
++    }
++
+     if (!sbr->kx_and_m_pushed) {
+         sbr->kx[0] = sbr->kx[1];
+         sbr->m[0] = sbr->m[1];
+diff --git a/libavcodec/sbr.h b/libavcodec/sbr.h
+index e28fccd..ff00acb 100644
+--- a/libavcodec/sbr.h
++++ b/libavcodec/sbr.h
+@@ -137,6 +137,7 @@ typedef struct AACSBRContext {
+ struct SpectralBandReplication {
+     int                sample_rate;
+     int                start;
++    int                id_aac;
+     int                reset;
+     SpectrumParameters spectrum_params;
+     int                bs_amp_res_header;
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/libav/libav_9.18.bb b/meta/recipes-multimedia/libav/libav_9.18.bb
index 4564def..7d0cc70 100644
--- a/meta/recipes-multimedia/libav/libav_9.18.bb
+++ b/meta/recipes-multimedia/libav/libav_9.18.bb
@@ -6,4 +6,5 @@ SRC_URI[sha256sum] = "0875e835da683eef1a7bac75e1884634194149d7479d1538ba9fbe1614
 SRC_URI += "file://libav-fix-CVE-2014-9676.patch \
             file://libav-fix-CVE-2015-1872.patch \
             file://libav-fix-CVE-2015-3395.patch \
+            file://libav-fix-CVE-2015-6820.patch \
            "
-- 
1.9.1


