Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CE6C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 04:16:04 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.5305.1702959352682173245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 20:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XN7i4qMl;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d39afa1eecso23570515ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 20:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1702959352; x=1703564152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQCwY06yjw0gnpvMoyzIqxnd3EJcwy5XF8NvYgBUA60=;
        b=XN7i4qMlhLZ66KjLCVqB5vuqfbLsphETEnFP9VP1ctKQLcnerEr1SOO+oBL/RjfBYr
         Qyhy5dM0Us9VhJO1ZIq5KFZagMw9Mmdg8u20j8o2nQtmRPqp+hBKWXG+qJQTtQ1V+JJ8
         38FmMWO12a33V6+B32BVeE0q2+gbx/Y9pAx04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702959352; x=1703564152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQCwY06yjw0gnpvMoyzIqxnd3EJcwy5XF8NvYgBUA60=;
        b=d5sOfixZaRLa6R666FJxUV5CQjofF7ZOxy2FRupGwoYlQrzRA0pOhcNtv3VBTtJ+SD
         24BHw9czOERk4rkVoDlZXCw/3zD5JrF/EWYSj5cYkCdotLDAjMmmw9bgCFmHIhAGWIq8
         w+WeDDOBTxNDCy7UebV2v8igmIpvOry03iOyHN3YhCDGvpioUL3zxGh4vL2FUACqIU7F
         3FCAmUTvbC8mfiV8XlLcia8XpYWvF5++h2j/r7sNZNOKOd0Ecm3DH1KtEMEQRBSWxFAA
         nn+0ZvbWqU6rIPfMTZr3abZOhp7QrUafuugMGTy4+8Qh3fNW9YaXPaNWiggimiS0lpkb
         5+PA==
X-Gm-Message-State: AOJu0Yzt3EVYTYYXD923ztdkddShC+K4FU8efMc7PolEVTUn7gooxvPQ
	QcHTgv+HX/HZlPks2PJwdrU3m7TVEjbGkLrQ0J8=
X-Google-Smtp-Source: AGHT+IHH2O+A7RCznLTRQKQXGf/bSeR7M/EpSV3OweJibgYNjaiwIcm5QO3zZ3riuZBF0miWkhRfGw==
X-Received: by 2002:a17:902:b706:b0:1d0:737d:2ae5 with SMTP id d6-20020a170902b70600b001d0737d2ae5mr15832136pls.87.1702959351666;
        Mon, 18 Dec 2023 20:15:51 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1cb2:ae:699a:ac2d:486f:109b])
        by smtp.gmail.com with ESMTPSA id ix2-20020a170902f80200b001cffd42711csm4981598plb.199.2023.12.18.20.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 20:15:51 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] flac: Backport fix for CVE-2021-0561
Date: Tue, 19 Dec 2023 09:45:43 +0530
Message-Id: <20231219041543.30010-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192691

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/xiph/flac/commit/e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../flac/files/CVE-2021-0561.patch            | 34 +++++++++++++++++++
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/flac/files/CVE-2021-0561.patch

diff --git a/meta/recipes-multimedia/flac/files/CVE-2021-0561.patch b/meta/recipes-multimedia/flac/files/CVE-2021-0561.patch
new file mode 100644
index 0000000000..e19833a5ad
--- /dev/null
+++ b/meta/recipes-multimedia/flac/files/CVE-2021-0561.patch
@@ -0,0 +1,34 @@
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
+Upstream-Status: Backport [https://github.com/xiph/flac/commit/e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be]
+CVE: CVE-2021-0561
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/libFLAC/stream_encoder.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/libFLAC/stream_encoder.c b/src/libFLAC/stream_encoder.c
+index 4c91247fe8..7109802c27 100644
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
diff --git a/meta/recipes-multimedia/flac/flac_1.3.3.bb b/meta/recipes-multimedia/flac/flac_1.3.3.bb
index ca04f36d1a..e593727ac8 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.3.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.3.bb
@@ -16,6 +16,7 @@ DEPENDS = "libogg"
 
 SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
            file://CVE-2020-22219.patch \
+           file://CVE-2021-0561.patch \
 "
 
 SRC_URI[md5sum] = "26703ed2858c1fc9ffc05136d13daa69"
-- 
2.25.1


