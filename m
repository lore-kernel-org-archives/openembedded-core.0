Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77A5D13576
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 17:14:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.33678.1730049238250022886
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 10:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gRsUkC0d;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so2686682f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730049236; x=1730654036; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQAitgz0NZ1iUIZsScVneKwwfFgUsTIkunVvJxhWbpY=;
        b=gRsUkC0duxdVg85upotxYnkd8scFBkMYzSoX9M2HzAYeuveb5w4cOqeuYKxWKyLsRK
         I9Hii3djI/5rV6V1P5hM+cHn6yVwS+GoGQHe57PAfYRKhJCumO2aUET4TjJNG92JGyb4
         LgjVo4A0aX/mXkLQ/M9Bn/RCKWHMgUWKVYPXdC+mMYXFVZTSdjSwZqD6Qb6XCZkoegjz
         qrVodpp+lhsraWiCaYkumtwIQc6dcAYo0IWtWeKcRjmh9cogYTxa9nI6c8jCfpnv5f8G
         oLg0IxE/WSmiyR5IwUGi723Bry91Id3XFx7nmBwGzFJ970xYGvgQVq+lRdeVIheaJ2XH
         yHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730049236; x=1730654036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQAitgz0NZ1iUIZsScVneKwwfFgUsTIkunVvJxhWbpY=;
        b=dUjDFLMsEk/tBRbA6frlE0iAepKRulXbr+9QpJlagOM63OmwrkKyXWISn61xW99dhi
         cN4QRHjRxfHzKSH0Om88momrxPI0GrESTNWU6jkfbMCj0L4+IpFsFdyYfOG4ZDgezV7w
         k9Qm9Nyo/J9FF+BpZerLub3lm2zEDNej7sJBQ+lola2TXzHCdmuVRV8PcAxSkdKfJ8s8
         qDRbiK5/nT7WZWjYkNjetLaXJrS8N/CP3/C99znEg2iZ2cHpWRJUOuGE4jJqLJwQitE5
         mlN33ClJxIB9MpSlNOMQkybE77Od3expPxNG5/lyKKD75n1uUylpQI4KosvTJ6RL8GBG
         WdWA==
X-Gm-Message-State: AOJu0YwUeTjKnUFGjb41FcfsfKA90AsDLEu/pMo5XkqkTgKtmRr03wxy
	Lx+zcf7WJfRlCUPE6N1u+5ZZt9fka5dGORZaeU02cl09V9QfKhD7OT4NzA==
X-Google-Smtp-Source: AGHT+IGr7pXkAcmnNYwn1YSJEoYTVLIzeL0PHidY/bL2++BQH64seFsl3zvH26fJhsznjh4vl/uXVQ==
X-Received: by 2002:adf:fa0d:0:b0:37d:45ab:422b with SMTP id ffacd0b85a97d-38061151206mr4341892f8f.31.1730049236334;
        Sun, 27 Oct 2024 10:13:56 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b481eesm7236026f8f.57.2024.10.27.10.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 10:13:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] ffmpeg: fix packaging examples
Date: Sun, 27 Oct 2024 18:13:52 +0100
Message-ID: <20241027171352.2929672-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206410

* I've noticed that ffmpeg package isn't created in my builds, due
  to --disable-programs in EXTRA_OECONF added by our .bbappend, but
  was surprised that lib32-ffmpeg is created.

* lib32-ffmpeg was created only because it contained the examples
  which are installed in /usr/share/ffmpeg even when PN is lib32-ffmpeg
  as we pass --datadir=${datadir}/ffmpeg in EXTRA_OECONF here

* --disable-programs controls ${bindir}/ffprobe ${bindir}/ffmpeg and
  ${datadir}/ffmpeg/ffprobe.xsd ${datadir}/ffmpeg/libvpx-*.ffpreset

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
index bb6b71735c..db0aa60826 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb
@@ -182,6 +182,6 @@ FILES:libavutil = "${libdir}/libavutil${SOLIBS}"
 FILES:libpostproc = "${libdir}/libpostproc${SOLIBS}"
 FILES:libswresample = "${libdir}/libswresample${SOLIBS}"
 FILES:libswscale = "${libdir}/libswscale${SOLIBS}"
-FILES:${PN}-examples = "${datadir}/${PN}/examples"
+FILES:${PN}-examples = "${datadir}/${BPN}/examples"
 
 CVE_PRODUCT = "ffmpeg libswresample libavcodec"
-- 
2.47.0


