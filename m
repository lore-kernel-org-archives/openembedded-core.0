Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6F8C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 14:51:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.12868.1642776670242435373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jan 2022 06:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Ysgh9hPp;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642776673; x=1674312673;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SKjO06aPzbUU5RkdokaexV1Orz3+vTw6+pyNwUuEJiM=;
  b=Ysgh9hPpbHo2R5LveV1fKJCLTR3xz/5FZCj6fy7LaGZ8TmW46qaQbjyg
   08rB37FGVOl7NuK1Irc5LHwbqZWfH9bfodnlwUoFjzrsD0hYn66m1Ee5+
   kCmvk5yllJlToltqGtgpohOHRja8zb3/qYfFzdbiJeU6tzrILyXZV/MAO
   ///5HKuIs2z+uxBHNyvHQB4D9vkOAB6BpemhIBwAqIKkBUBWHbw90dPGA
   zrrmNztdXO1vwUCc6iMPynPNdWkalrW85fNWj/9JOYC5X8uvifW+2djEx
   uT+tSsWe6GMWzcGyJ0H2Bag9I9XTXCtU6Dlx5HTsv4OdB4Qydl1GfaAk0
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245886027"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="245886027"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600";
   d="scan'208";a="623336639"
Received: from gordonyx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.131.118])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2022 06:51:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/15] libsndfile1: fix CVE-2021-4156
Date: Fri, 21 Jan 2022 22:50:50 +0800
Message-Id: 
 <64d9f9ab59a00bed946bd89896263ff74f3af0e5.1642736951.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642736950.git.anuj.mittal@intel.com>
References: <cover.1642736950.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jan 2022 14:51:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160833

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsndfile1/CVE-2021-4156.patch           | 32 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
new file mode 100644
index 0000000000..b0ff1a0885
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2021-4156.patch
@@ -0,0 +1,32 @@
+From 5adbc377cd90aa40f0cd56ae325ca70065a8aa19 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 13 Jan 2022 16:45:59 +0800
+Subject: [PATCH] flac: Fix improper buffer reusing
+
+CVE: CVE-2021-4156.patch
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/issues/731]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/flac.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/flac.c b/src/flac.c
+index 0be82ac..6548bba 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -952,7 +952,11 @@ flac_read_loop (SF_PRIVATE *psf, unsigned len)
+ 	/* Decode some more. */
+ 	while (pflac->pos < pflac->len)
+ 	{	if (FLAC__stream_decoder_process_single (pflac->fsd) == 0)
++		{	psf_log_printf (psf, "FLAC__stream_decoder_process_single returned false\n") ;
++			/* Current frame is busted, so NULL the pointer. */
++			pflac->frame = NULL ;
+ 			break ;
++                }
+ 		state = FLAC__stream_decoder_get_state (pflac->fsd) ;
+ 		if (state >= FLAC__STREAM_DECODER_END_OF_STREAM)
+ 		{	psf_log_printf (psf, "FLAC__stream_decoder_get_state returned %s\n", FLAC__StreamDecoderStateString [state]) ;
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 044881a859..8eb007884e 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-12562.patch \
            file://CVE-2018-19758.patch \
            file://CVE-2019-3832.patch \
+           file://CVE-2021-4156.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.34.1


