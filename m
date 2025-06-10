Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0324CC71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:38:40 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.95892.1749584318298784056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Edr7d4GV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2fa3957661so2295133a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584317; x=1750189117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyjQsQPbwsn19/0ExxyLxv4grr0i1kY4c+WUZjZF9mU=;
        b=Edr7d4GVCLh+JRjJfefZqng+6ozOcrp2VGLpHkDb9dc7TOt65ttGhlvWpaAJ+nkqoS
         p7v7Bel0BdVEHlMsPgqB70us3jg1b4zj8WxpvaOyPcu2ETZzkBbjowO3XA8kJf9Pre60
         vkVvkb1nnz/KFqDK4gBXWyhhENZ52gl/IdQG29qP94umwq8PLRFJpAnJTE+UXRExm4QK
         n2Zgqttqo3B0cCu0AE94UGtPH7IwMpZZOMWQiR1iSS8RoHkgaK7+7Rwko2SjzfJAu3X1
         h7lqnVkeXyRsS46/ucwH6t1LRrcI3Cpl0Qv2+X3epm2T+9DHQZldI7hPF0oSRg/Yu7MR
         VdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584317; x=1750189117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DyjQsQPbwsn19/0ExxyLxv4grr0i1kY4c+WUZjZF9mU=;
        b=vhaTygWAOUGwMPNlzK4lJWXSm1VrAO2WqTBe6T7HZsu6q57GylGW/fXsRYoGLUZk+j
         Cwr3rhQKvg/hWgRBdbebDexV77vno8eTIX2U2s+8w34SmRW9b/OKU51hR69h0i7FqILb
         yT9AXkhFWdLlX2xmscVUu5j/phwxzqFx6NbQo8JB8ynrRRMI9N7G32Hf493nRBf/Cd8h
         It4rrlPTvyoG2GVSrTxk+AvbfOHkT+wxWgx4xJjROjGU4UlqiXUuH4ZNvhoCZu+URPRo
         TdHsKLmbzAX/yaacM7Yh8tvCi7ZCJkxJSpPbU9FV7/CHZ3HlNzLRRgDo9Oj1x/Q5jjA3
         wDZw==
X-Gm-Message-State: AOJu0Yzc7xcEfpA6MIlGe7o5j6Fw4qkOwHUH1NkIO0KmEuvvDkgqlpXt
	2cVyihodPc2ThbD2gIShI/YlrzbxaPcTJHoXQ5Frtwjsma6deLMQc6vXnV9POsdOKWwjBUdYSxE
	/+Tnh
X-Gm-Gg: ASbGnctjrI1TurXLmlVq7/tnqom6G9aU10p4j1kziE1Xqz6DCmt0xE17a7DlYnSm5cR
	jnePX/uL8OX+zXTiGJJA7JPs+D+stZnaIhWIW6cIYrNBp6kss5K+S0rf+k2t8eS2dUc1wPNMgPh
	75/ncbkd4nbuWPvK8saof5gC2oMJYyIb+XKOgPN3GRO++3Dz6errluAk4PYwLM62s2xl4LCYPmc
	Su/vV7XWl3pzmp7x9mxTlHOAErP5dBRKjkxwfarEjwUrWwlbq03naUEN61t1YyoX9mLpNJoT9j5
	6WP7gNMXPO2nBFTCIjS17bdGk791MM6DqS8czVoYZtGSorCYY7xFHA==
X-Google-Smtp-Source: AGHT+IFLtmCeckwGBoJOSNyFxtTASRyU9DZKVJSvUZiIEQbNsRLOWeHI9tS7WtCjRBP/Mp1ca7mg1w==
X-Received: by 2002:a05:6a21:99a3:b0:1f5:9208:3ac7 with SMTP id adf61e73a8af0-21f89129c89mr15699637.41.1749584317532;
        Tue, 10 Jun 2025 12:38:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f7827c0sm7198595a12.62.2025.06.10.12.38.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:38:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/15] ffmpeg: fix CVE-2025-22919
Date: Tue, 10 Jun 2025 12:38:12 -0700
Message-ID: <2494f863a163d13967d927618a101078f6980538.1749584149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749584149.git.steve@sakoman.com>
References: <cover.1749584149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218428

From: Archana Polampalli <archana.polampalli@windriver.com>

A reachable assertion in FFmpeg git-master commit N-113007-g8d24a28d06 allows
attackers to cause a Denial of Service (DoS) via opening a crafted AAC file.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2025-22919.patch        | 41 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
new file mode 100644
index 0000000000..5e27ad9d5b
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2025-22919.patch
@@ -0,0 +1,41 @@
+From 145a3a84550a1c3a3b848c12a64b53c3c41d2888 Mon Sep 17 00:00:00 2001
+From: James Almer <jamrial@gmail.com>
+Date: Mon, 30 Dec 2024 00:25:41 -0300
+Subject: [PATCH] avfilter/buffersrc: check for valid sample rate
+
+A sample rate <= 0 is invalid.
+
+Fixes an assert in ffmpeg_enc.c that assumed a valid sample rate would be set.
+Fixes ticket #11385.
+
+Signed-off-by: James Almer <jamrial@gmail.com>
+(cherry picked from commit 1446e37d3d032e1452844778b3e6ba2c20f0c322)
+
+CVE: CVE-2025-22919
+
+Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/commit/145a3a84550a1c3a3b848c12a64b53c3c41d2888]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/buffersrc.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libavfilter/buffersrc.c b/libavfilter/buffersrc.c
+index b061187..cd2b05d 100644
+--- a/libavfilter/buffersrc.c
++++ b/libavfilter/buffersrc.c
+@@ -335,6 +335,11 @@ static av_cold int init_audio(AVFilterContext *ctx)
+                                   "channel layout specified\n");
+         return AVERROR(EINVAL);
+     }
++    
++    if (s->sample_rate <= 0) {
++        av_log(ctx, AV_LOG_ERROR, "Sample rate not set\n");
++        return AVERROR(EINVAL);
++    }
+ 
+     if (!s->time_base.num)
+         s->time_base = (AVRational){1, s->sample_rate};
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
index 127552396d..49277f9e2b 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb
@@ -46,6 +46,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2024-28661.patch \
            file://CVE-2024-35369.patch \
            file://CVE-2025-25473.patch \
+           file://CVE-2025-22919.patch \
           "
 
 SRC_URI[sha256sum] = "04c70c377de233a4b217c2fdf76b19aeb225a287daeb2348bccd978c47b1a1db"
-- 
2.43.0


