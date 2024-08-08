Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19415C52D7C
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:04 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.51042.1723084140192916790
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:29:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Dq2uz8QY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so365018a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084139; x=1723688939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqh2YHH+M+i60ckx/0c1ws7dG4aph/iQ296BjUvyMUg=;
        b=Dq2uz8QYkx6TC5XjQVpU8fOvA1/BlOfjTZ6a3hw2qLsz4jsiExvDFY+kSzetzcQp9W
         Zc3USwLFj8IDfJA/6Ud8b1AjKxVJaE5c+Qqraf110wDrCXkmhQmrJvHPdEAHtoo7tU9T
         4XISA4WVMnJYgc298OroCfQM1cguKWtm/CEblX0HEqYHk9wyguHwHF2vE3fOkbxFBt2A
         giiC22NqM3qMowgN7x/v7mD1tVV2wbZX4f/ahUAwxqzBIcRy+Qz2rHlt0kaxL/1LUv8K
         VaBEfU8w54BvMiSVmToO/hn40l2Hh8ajEHhBo6K9ue1RdfuXxCSsTMi0+S7EnpaO0C8u
         ppIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084139; x=1723688939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqh2YHH+M+i60ckx/0c1ws7dG4aph/iQ296BjUvyMUg=;
        b=BbfHUKFr3Ij8xfxOj24Oh1Br1AoEpDcDOT6i+3alB0m4lotK8LYai+SLFi2qY0fXqD
         gbgdKD4NR4/q200H7nqqLpq4TmnLN5m7eHbneycpmEUX671xujW7MK3Q5hvApeW0BzkQ
         f6ivFnMshF6JpdPYkArtUJxH5CCDXEs7tChGG6VALIIXMFgk7lwnDS3V9UTsmIMKnXGP
         CDttmgTBYBXG1VadzIVNviy+4YdWGIVrqXwPpm1PEWmcfg0Kv7jurDYEwvidpZKRHT8M
         7S4uO16JbTmXy0u3Je0hkAHmIP90G/KyjeyJSKsfYmX7lLb16F7me7DKjP1ER/YDTGr0
         ABMA==
X-Gm-Message-State: AOJu0YzovyZm/tDBdkfUUlA2lecINvAo9DnNajUaVj6lTHwjXfN/8087
	Ng9WolB9wBm8uSmuqTbsqdLj4zQB+IcsZJQIUjDI17YBE/fg411Jgokp7T9aTwDh2X3BXHzM3JD
	f/Ac=
X-Google-Smtp-Source: AGHT+IHPI/43zTjPgg/znsO9w7IbYfJ727vfeqFdQt//YV4QTADtCzhZ4HGBfqO818GISTzLxmDisg==
X-Received: by 2002:a05:6a20:7f99:b0:1be:d1bf:a371 with SMTP id adf61e73a8af0-1c6fcf86502mr422427637.33.1723084139343;
        Wed, 07 Aug 2024 19:28:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.28.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:28:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/10] ffmpeg: fix CVE-2024-31582
Date: Wed,  7 Aug 2024 19:28:40 -0700
Message-Id: <617a9cdba6e2f0bd3ccc24e7bb2fe84e9573fecd.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203104

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/ffmpeg/CVE-2024-31582.patch        | 34 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
new file mode 100644
index 0000000000..2ade3ab6b1
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2024-31582.patch
@@ -0,0 +1,34 @@
+From 1d1a05b393ece9fa3df825bfef3724b7370aefdc Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <zhilizhao@tencent.com>
+Date: Fri, 29 Dec 2023 05:56:43 +0800
+Subject: [PATCH] avfilter/vf_codecview: fix heap buffer overflow
+
+And improve the performance by a little bit.
+
+Signed-off-by: Zhao Zhili <zhilizhao@tencent.com>
+
+CVE: CVE-2024-31582
+
+Upstream-Status: Backport [https://github.com/ffmpeg/ffmpeg/commit/99debe5f823f45a482e1dc08de35879aa9c74bd2]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ libavfilter/vf_codecview.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/libavfilter/vf_codecview.c b/libavfilter/vf_codecview.c
+index 55d9c8c..f65ccbd 100644
+--- a/libavfilter/vf_codecview.c
++++ b/libavfilter/vf_codecview.c
+@@ -216,9 +216,6 @@ static void draw_block_rectangle(uint8_t *buf, int sx, int sy, int w, int h, ptr
+         buf[sx + w - 1] = color;
+         buf += stride;
+     }
+-
+-    for (int x = sx; x < sx + w; x++)
+-        buf[x] = color;
+ }
+
+ static int filter_frame(AVFilterLink *inlink, AVFrame *frame)
+--
+2.40.0
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
index 06bd36e2e2..05919e6ffd 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.1.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://vulkan_fix_gcc14.patch \
     file://CVE-2023-49502.patch \
     file://CVE-2024-31578.patch \
+    file://CVE-2024-31582.patch \
 "
 
 SRC_URI[sha256sum] = "8684f4b00f94b85461884c3719382f1261f0d9eb3d59640a1f4ac0873616f968"
-- 
2.34.1


