Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED332C47072
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 02:30:35 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.94598.1703644231673558800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Dec 2023 18:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tYv+eLg3;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3bba50cd318so2233200b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Dec 2023 18:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703644230; x=1704249030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mfq25XgLJG3raRAJEWv3s0saEG7Nl87OIz/l6WMvtc=;
        b=tYv+eLg36l1Z8YMKtyaCvcF84DWnAJZaRK7RoOMlZFDWGCYiOqjuU7OkeBHu0n0WnN
         yiasXVIXC3c1dL02KXVDtr5HTgDO03gqtdpVgi4GtkSiovguD69AgzkV9sISiPcCgPAd
         6aAelTqiJOvyIAFLUz1IeeZxa1xOIwUZF3augqxcXiL6OOuEhxlFgYml1QcYDE75wgBR
         Fb+1dmjuBv0JRIZL5WESIdJptwd/KQQsaqq95O8Qyw8ABNnhHucUWQF0BXzMeMHWxh+M
         X2vu6/tBsR5qySgaTg/S9qoa/l9Vnl69rBbGp8zbzSxZ/A17eKDk3EOWhzvwePS5nVsc
         sqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703644230; x=1704249030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2mfq25XgLJG3raRAJEWv3s0saEG7Nl87OIz/l6WMvtc=;
        b=YVxkHrxnLPOXM8NwcV1ZXGt7xqAjV6MDDW9nsKz0rxmmF3McMUbaQ28lmwClelLHz8
         2WxE6dVgQyhiXtmakt9IfffvWDxGHkO9poM2eEiff4wlRFsfVsbis9+qVtQf6tzEuDdk
         FKFRL1/LbJ49G2fifTbiv46+FBNsix93b/r+QEfdcSauvx4UW4uppqWibXyIXXsXvsgP
         K3RXZ9Om9KCztArGr50kgGULwamTAtXc+T5kCFiCe+/N0ReaOXH+rwNfo6aDT3T4I21p
         W67TsNPSIuSXKIKnluTmbQDE4faKCpvRPGpoWORNSh2Mk8DdKCwJ/JMHM5gM/qF61n9i
         8UqQ==
X-Gm-Message-State: AOJu0YwJZOI3gV7+q1I9knvMcSNkrlBgAi7NQdLEDojkKzwZgeVSMx5h
	jqI6Nl2B/FAcxbpAHL21nbAQRYfiEXbdVihE4zxaG+fjao5AoQ==
X-Google-Smtp-Source: AGHT+IGNaqulS/Pkl8EkW/PUMlQO8NE4BRvUMgcQ9aS7gbqI5RzoNVyuSFzKyhR68OHUY5x+BqbmkQ==
X-Received: by 2002:a05:6808:399b:b0:3bb:bf35:f82f with SMTP id gq27-20020a056808399b00b003bbbf35f82fmr2153425oib.104.1703644230161;
        Tue, 26 Dec 2023 18:30:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id z188-20020a6265c5000000b006d095553f2asm10982400pfb.81.2023.12.26.18.30.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Dec 2023 18:30:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] flac: Backport fix for CVE-2021-0561
Date: Tue, 26 Dec 2023 16:30:17 -1000
Message-Id: <9b2cd2d5e0dac297b3a1779e6720e0ee2a3de168.1703644078.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703644078.git.steve@sakoman.com>
References: <cover.1703644078.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 02:30:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192917

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://github.com/xiph/flac/commit/e1575e4a7c5157cbf4e4a16dbd39b74f7174c7be]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


