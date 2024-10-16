Return-Path: <mail2szahir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52EF5D1AD42
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 10:17:26 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.19915.1729073837407939207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 03:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOkIwxJy;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: mail2szahir@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7ea8ecacf16so1789362a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 03:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729073836; x=1729678636; darn=lists.openembedded.org;
        h=message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOjv1E30VNDHYacBZvdfKHpyxaK1yKnUy4DQ1Z4XfHk=;
        b=mOkIwxJy9vWK5FqH9HZhbehsNPTJX4GO3Evw+/RnSwXML0VJlFJnvyl3i2jlQGS0G3
         lnVHBX4N1evVE+idxmsfKDec/rIV64OBDndqgRl+5QcD07NGy7vn6AEueKNf7KTR/wM+
         t7sjH+jUK+Gn9gkHyr/L3dzt8mCpOOBekxS6V47+vYLMETo/6vbISDA9NCgDLKsGfgza
         Gasi78jCRnDtAlF/EZNRgt+Qe+otm4eIy1UKLyXaKBAnV6oFlIne30fESkrIB5ignWyQ
         TvVfpD/lCE2e5opGmBLwDYATgASfVB7eklOcaT+om57wgJHrT0PntxoP1OrAPabCbxEo
         QJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073836; x=1729678636;
        h=message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOjv1E30VNDHYacBZvdfKHpyxaK1yKnUy4DQ1Z4XfHk=;
        b=PPvNhnC4duUYOx5hSZyNtg+Z9nv+oxa9kXfKappPQ9F5Bze5DFJl/sMep3C00tc7yy
         NWnWiIByOqZ8K3dFXF5oX2Os6p2/nfIAPerEexnBPXDmsCiJ0wvgBEOHSMfXE3rXMxBI
         pBTnRtPNub3c0BfVho5chjf5vdG40pvfup3CcIRuS6PlU1n+G+iScw0a5RUtGnbctlRf
         PARruutHY0dqFNF4PKOyF7f65NBaAPppA8E3bYAFfo6cf16d0FNd5ZtD/BcXGvVwLXGp
         zjQBKJtu8M7ufxPZc5DNjkuopXWAnciPC7P0zFHsXqAKF+vY9mRF4hGYL5121wc0P5Ig
         hoBg==
X-Gm-Message-State: AOJu0Yx3IvHKAvo36WyvF28el4kJNx0+57cL09bzCrbM7EdH1qmipIYH
	U0TKY7COfP43CWX9uOqEc1MQqaGCQOo4fVZBKLriALsBagFuBN9n9W6hug==
X-Google-Smtp-Source: AGHT+IEtvtUwqfjQ1LH/aZmtfnEw9/4C22L26Rr9Eh1SUAVmHPedIlldnqE1r8KbfcRUt0RoheoTBQ==
X-Received: by 2002:a05:6a20:c88d:b0:1cf:2853:bc6c with SMTP id adf61e73a8af0-1d8c9699a8dmr23945151637.33.1729073836274;
        Wed, 16 Oct 2024 03:17:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:e02e:c09b:5488:e10:6781:7d0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77371735sm2757179b3a.7.2024.10.16.03.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:17:15 -0700 (PDT)
From: aszh07 <mail2szahir@gmail.com>
To: openembedded-core@lists.openembedded.org,
	zahir.basha@kpit.com
Subject: [OE-core][kirkstone][PATCH] ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT
Date: Wed, 16 Oct 2024 15:46:44 +0530
Message-Id: <20241016101644.27269-1-mail2szahir@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 10:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205961

Currently, CVE_PRODUCT only detects vulnerabilities where the product is "ffmpeg".

However, there are also vulnerabilities where the product is "libswresample",
and "libavcodec" as shown below.
https://app.opencve.io/vendors/?vendor=ffmpeg

Therefore, add "libswresample libavcodec" to CVE_PRODUCT to detect vulnerabilities
where the product is "libswresample libavcodec" as well.

Signed-off-by: aszh07 <mail2szahir@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
index 1295d5cdf1..022220b58f 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb
@@ -186,3 +186,5 @@ INSANE_SKIP:${MLPREFIX}libavutil = "textrel"
 INSANE_SKIP:${MLPREFIX}libswscale = "textrel"
 INSANE_SKIP:${MLPREFIX}libswresample = "textrel"
 INSANE_SKIP:${MLPREFIX}libpostproc = "textrel"
+
+CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.17.1


