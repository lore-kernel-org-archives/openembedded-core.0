Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88C6C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 03:34:21 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.8610.1645500860728648083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21M3YIQx015147
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:34:19 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 21M3YIAn021761
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 19:34:18 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 21 Feb 2022 19:34:17 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 21 Feb 2022 19:34:17 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libsndfile1: fix CVE-2021-4156
Date: Tue, 22 Feb 2022 11:34:16 +0800
Message-ID: <20220222033416.2207862-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 03:34:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162113

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
2.25.1


