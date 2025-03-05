Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C79C28B26
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 22:11:46 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6384.1741212704888350895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 14:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ziRPPz14;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224019ad9edso21563015ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 14:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741212704; x=1741817504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uR/KnBSodRBHSsHirt1ZcCD20ekJB/6FSjlzFyuZlQ0=;
        b=ziRPPz148oli1acKiNkLII8ihZJUbicVmd+Yxsh8y0awhvF31IP0WRsM7wIdxAyYTR
         vqkf0DOcocJkD3q550QNyNZWCRFcGZrAjjJ/AoEfGzemai8Q2W/WXcpNJ+++YUqE2/MP
         kWFlpmhGCJmfG3Phjfn+kL4ADO189ZlhTAqAFQQhokfQv0Nx/MC14FpbcKxGfK+sPFmx
         IdQIk1m2UJN6L3yVq70+ZpwT7wKyx8UO+x4GgrFqTL+b0nJyaL64Bh17uBN881mCogDN
         /tiK3TiZ4Z/YDDDXyG40Jf1wtsIQ41jDEa3gpwFsO7FWTQW8lMcu6H+7o+RFW6Y65Da5
         TT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741212704; x=1741817504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uR/KnBSodRBHSsHirt1ZcCD20ekJB/6FSjlzFyuZlQ0=;
        b=EIk787ABNuIMKcWY0ltbszEqW1qu+13q9kXKO5JHuVHeTboSUA6xEdGotUYP57P5ip
         TzSIErrnmTsdpActDJL6GOQmmGU+X83SUqNLZZ7oWBFBn0gJ6+OaJGKEY000HwFEiUiP
         oE8EBdwUI4MusV5GDFf1D08Mph483OIM5IFALqPThCgEY4YTAqnqbhbeIz2L8j+Q3xkW
         cpIQqnOU0lk0D8lOD17u4it14k6uZ/j6EBNsGHjeKLHKa9CE69aSk/tWxZQZtcmYTFYJ
         x87IA18DDtA6Ca+9xIphU4tPPwuTYDJvFdkMPTp05JJKyqr/fZt0X7TLQwcz41G6gwHl
         IPPw==
X-Gm-Message-State: AOJu0YwxS4p3YyJwh0pPmX1WRD2U+NlV0WzsMm0oAbASJLfXshlSytSm
	Xiw2jerLrgF9vtsJ25dvO9t6p/+siKd1Y5Iq1tZZqkEc3C2UvQAodHINoUxgxRIsPncl8xFS2UZ
	2
X-Gm-Gg: ASbGncvNhMHrNFuuT1v7Te/Pz/fUuKY+HhHlH+7Jt7v100rb+w87ueoQEcE4uO+jnsj
	/l1Gf3K+nO/HVKMoyra1JcPFAphqAOnjz73fUwAByKGYE0UtU/AMoYRlPVLVsEWQF7zygB50PN6
	VuFUonUNkNacSNQoVrjEi/kjrRnmKW6hQ/7YqY5bbGAQhQN1QNpHsc5hnNnPJd1xXGDbWt97hw0
	H+FYz/ZdBJCsxetba+f9gWzZwxkaqIJJ8xKL2BDi64m1wHNVIKA8Aj8ZVi8NA11g3OZD8gFeJlc
	KldBe8HemKXDgRAIc9RIRz4vCZTsA54LQRY=
X-Google-Smtp-Source: AGHT+IF9/PseTmaEskb7dupbMAOXSPN3l0RNKc5Z0wNEOKMO5uX3AYBIZK5yFWomjF8r3qlO968QeQ==
X-Received: by 2002:a05:6a00:14d5:b0:736:52d7:daca with SMTP id d2e1a72fcca58-73682c53742mr7013581b3a.18.1741212703966;
        Wed, 05 Mar 2025 14:11:43 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7362e19fd7bsm10204855b3a.43.2025.03.05.14.11.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 14:11:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/16] ffmpeg: fix CVE-2025-25473
Date: Wed,  5 Mar 2025 14:11:11 -0800
Message-ID: <abc6b3180b87c665ff04204b7163d1f074d99747.1741206348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741206348.git.steve@sakoman.com>
References: <cover.1741206348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 22:11:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212362

From: Archana Polampalli <archana.polampalli@windriver.com>

FFmpeg git master before commit c08d30 was discovered to contain a NULL pointer
dereference via the component libavformat/mov.c.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-25473.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
new file mode 100644
index 0000000000..ea619025d1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-25473.patch
@@ -0,0 +1,36 @@
+From c08d300481b8ebb846cd43a473988fdbc6793d1b Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Fri, 17 Jan 2025 00:05:31 -0300
+Subject: [PATCH] avformat/avformat: also clear FFFormatContext packet queue
+ when closing a muxer
+
+packet_buffer is used in mux.c, and if a muxing process fails at a point where
+packets remained in said queue, they will leak.
+
+Fixes ticket #11419
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+
+CVE: CVE-2025-25473
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff/c08d300481b8ebb846cd43a473988fdbc6793d1b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavformat/avformat.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libavformat/avformat.c b/libavformat/avformat.c
+index 5b8bb78..73f31cd 100644
+--- a/libavformat/avformat.c
++++ b/libavformat/avformat.c
+@@ -138,6 +138,7 @@ void avformat_free_context(AVFormatContext *s)
+     av_dict_free(&si->id3v2_meta);
+     av_packet_free(&si->pkt);
+     av_packet_free(&si->parse_pkt);
++    avpriv_packet_list_free(&si->packet_buffer);
+     av_freep(&s->streams);
+     ff_flush_packet_queue(s);
+     av_freep(&s->url);
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 91ee6c6b0d..cb6a50401b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -47,6 +47,7 @@ SRC_URI = " \
     file://CVE-2024-36618.patch \
     file://CVE-2024-36619.patch \
     file://CVE-2024-35369.patch \
+    file://CVE-2025-25473.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.43.0


