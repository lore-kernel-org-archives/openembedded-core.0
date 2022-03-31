Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F93DC433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.7177.1648734477546698555
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=enI1eHFF;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734477; x=1680270477;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=y2mX1cjyvvt9LskF3Wjr7boZmeaCgZp3uCJzqv8v+SU=;
  b=enI1eHFFAJa6bEZciOiw1scugSVg3WO7Ppkvzs8Bi+7FsRDlQ33xBQmk
   WIE9YZ+p/7T8iVtP4k50pSNNh+01Q9VDtisHgiJXslKibUzAzmmAAOGEO
   yyQU/8Ji59leTHKrOR7nXYT1Psfby6rSejUcDKsJXJv0xCmeelzPY6z6V
   wVDwOnuXQ0ASmRm2SDjRav/fK06mNbuEB6Ax0NFmpVJ7M44DCWSp+KwV+
   ilmRyNLUAcHlkFChswvP0X5wGpoQX6w8CmBQZBmqgJF1TY+J56YTKmM1m
   N7P8o3sSnBoxdWzBNsRR/O+Xx8SFBKi9bQ+0bfswMMyVaAKo5LjgIvFtM
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551850"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551850"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542295"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:54 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/20] flac: fix CVE-2021-0561
Date: Thu, 31 Mar 2022 21:47:21 +0800
Message-Id: 
 <76d5c8d876f78d86e755c12360d41e40154eca0b.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163830

From: Li Wang <li.wang@windriver.com>

In append_to_verify_fifo_interleaved_ of stream_encoder.c, there is
a possible out of bounds write due to a missing bounds check. This
could lead to local information disclosure with no additional
execution privileges needed. User interaction is not needed for
exploitation.Product: AndroidVersions: Android-11Android ID: A-174302683

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-0561

Upstream patches:
https://github.com/xiph/flac/commit/e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../flac/flac/CVE-2021-0561.patch             | 41 +++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch

diff --git a/meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch b/meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch
new file mode 100644
index 0000000000..b48663ae42
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac/CVE-2021-0561.patch
@@ -0,0 +1,41 @@
+From e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be Mon Sep 17 00:00:00 2001
+From: Neelkamal Semwal <neelkamal.semwal@ittiam.com>
+Date: Fri, 18 Dec 2020 22:28:36 +0530
+Subject: [PATCH] libFlac: Exit at EOS in verify mode
+
+When verify mode is enabled, once decoder flags end of stream,
+encode processing is considered complete.
+
+CVE-2021-0561
+
+Signed-off-by: Ralph Giles <giles@thaumas.net>
+
+Upstream-Status: Backport
+CVE: CVE-2021-0561
+
+Reference to upstream patch:
+https://github.com/xiph/flac/commit/e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ src/libFLAC/stream_encoder.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/libFLAC/stream_encoder.c b/src/libFLAC/stream_encoder.c
+index 74387ec..8bb0ef3 100644
+--- a/src/libFLAC/stream_encoder.c
++++ b/src/libFLAC/stream_encoder.c
+@@ -2610,7 +2610,9 @@ FLAC__bool write_bitbuffer_(FLAC__StreamEncoder *encoder, uint32_t samples, FLAC
+ 			encoder->private_->verify.needs_magic_hack = true;
+ 		}
+ 		else {
+-			if(!FLAC__stream_decoder_process_single(encoder->private_->verify.decoder)) {
++			if(!FLAC__stream_decoder_process_single(encoder->private_->verify.decoder)
++			    || (!is_last_block
++				    && (FLAC__stream_encoder_get_verify_decoder_state(encoder) == FLAC__STREAM_DECODER_END_OF_STREAM))) {
+ 				FLAC__bitwriter_release_buffer(encoder->private_->frame);
+ 				FLAC__bitwriter_clear(encoder->private_->frame);
+ 				if(encoder->protected_->state != FLAC__STREAM_ENCODER_VERIFY_MISMATCH_IN_AUDIO_DATA)
+-- 
+2.23.0
+
diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index cb6692aedf..d3c352cc44 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
 DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://CVE-2021-0561.patch \
 "
 
 SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
-- 
2.35.1


