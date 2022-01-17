Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231A0C43219
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 02:11:04 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.6040.1642385441199973001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 18:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Mo93GYn5;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642385463; x=1673921463;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=yE8AuVeUurBG9grgRn34K/MglRElAYsilFTgib4qrAY=;
  b=Mo93GYn59hLt+vApqs8oMIUaP6shi0jLUGYOtszs4hQWi9gTMfCHgknr
   daWIJbstogcCVVG2NXbDtMqo07vzlvUpEaUX3Bam3wBmV+E3K7zkKtF5R
   ZtdLp4viCkANxdATgxfBPlYqXTvErcBaaaPo3vzm4dDWNaWSY1aWcCT5Y
   N8inZTN5BQlU2+wbK9kBWYMH0kwuOdG2mE2kGqi81nfLHlb18RfSUNLUJ
   J5hwm73BZ2MHCGg2We6PrxJVebG+V7yGJZWkxEeeIU2rF5YxEh5FX4fd7
   pG40hx+LqMCggfak0gYPkIaqI0WzytXt/HrGvZbrgKMcCBnejV6u+CcRc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="242094299"
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="242094299"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:11:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,294,1635231600";
   d="scan'208";a="492220759"
Received: from khershix-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.230.190])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2022 18:10:57 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 11/12] libsndfile1: fix CVE-2021-4156
Date: Mon, 17 Jan 2022 10:10:31 +0800
Message-Id: 
 <6566b64a55079aab8fa9b252e919a158bc595615.1642385249.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1642385249.git.anuj.mittal@intel.com>
References: <cover.1642385249.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 02:11:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160630

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
index 443ca95e32..884d680fbe 100644
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


