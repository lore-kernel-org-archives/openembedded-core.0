Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E545CD1F9C0
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:51:30 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.4802.1729018288370607492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z47vV6A0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2e88cb0bbso3233012a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018287; x=1729623087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgBt8MWXu7nn18oyoHZzsYZZNRypkDPQYMmFhZSS164=;
        b=Z47vV6A0vBdOuNFjkwPvVAYxjTUgSpWSwnGuQnpi9eYozTqtIbhEZ6YLl0Xgj2Y7MF
         6CL7jQa1gKxAjoauBJWW7dEkvO2SvAoIUHrxeMaXscS5RXsyaCG6/V7QMCMbxM+j1qAF
         Gsi2coOx6C+d9jk+PcjGe/XT9EF13cacxOfco9wS4h5YBeriI0738iAgbjA9PmuZx5UW
         6wbW9NSDKSmz8PVf4vHuV+TWCVPsr9uckH2Uy/pqLAB0Q9YQC4tu4LRRhH2VwVqnKDgr
         znDMqZ/qjxF57hakGhwcHuq82ZIzW9itfemw/a26dqENSfVZCyYW6dv4cIrpH8HVkqRL
         Gg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018287; x=1729623087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgBt8MWXu7nn18oyoHZzsYZZNRypkDPQYMmFhZSS164=;
        b=Sf6fGESZFGf2Giooy4aovgkAHFIsrBnKYNkHVB0grBbJ1Wb6GpsvYB3ydQvsYXg6BY
         PISENEYtFnituIviYHMk4AldB5MIAz2X5qwTFvDYGozYtzwvdY8x/RNnvdEhElp5TCZ3
         wqQf+unEU2iRymLWy/4gIGM+9TabEb93C2kheIa+pTp/sf670TfpO0QN6zOaulkG9hCx
         xW5NYK6cM3K9yy8IL1rBE9/3WQLL+vF2JAS4rqcHYDMxmrEH6xnAChOXr35YDdrbWF8r
         gcTn+nGMcqst0JCORCriICJUFD5tiWFfOV29hf3q7BT+/6b/yjtODkUYx4/k96wamveq
         CMug==
X-Gm-Message-State: AOJu0YxPOuP2zeMgudU9Rz169+Vt2FOJZcI+knkoJxXWWjqGL+UDPOJk
	zH4cK1xQvTJjdseXpZvAXK/v1FLZiSVycW/0xhLVeve671xBpeYKdcXBgcneUp9B6mvC5IEe80g
	G
X-Google-Smtp-Source: AGHT+IEODpBbpLT35r6cH2ul+opptE731CTYcdY3vrzOFAPyCeyOR3KZm1RuFL1wgl7nUQbiVaLlDg==
X-Received: by 2002:a05:6a20:d806:b0:1d8:f418:3323 with SMTP id adf61e73a8af0-1d905ea0c9fmr1672432637.2.1729018287468;
        Tue, 15 Oct 2024 11:51:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773717b9sm1616187b3a.9.2024.10.15.11.51.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:51:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/18] libsdl2: Fix non-deterministic configure option for libsamplerate
Date: Tue, 15 Oct 2024 11:50:52 -0700
Message-Id: <7ee654579ccf818708989251a97662ea11218d14.1729018153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729018153.git.steve@sakoman.com>
References: <cover.1729018153.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205939

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The libsamplerate option was floating and being enabled on some systems
and not others. Fix this to be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61455a839e568a3ae7e059ea95c02a1c88d39e1a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
index 891e91190a..7a14104671 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.1.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG[directfb]   = "-DSDL_DIRECTFB=ON,-DSDL_DIRECTFB=OFF,directfb,direc
 PACKAGECONFIG[gles2]      = "-DSDL_OPENGLES=ON,-DSDL_OPENGLES=OFF,virtual/libgles2"
 PACKAGECONFIG[jack]       = "-DSDL_JACK=ON,-DSDL_JACK=OFF,jack"
 PACKAGECONFIG[kmsdrm]     = "-DSDL_KMSDRM=ON,-DSDL_KMSDRM=OFF,libdrm virtual/libgbm"
+PACKAGECONFIG[libsamplerate] = "-DSDL_LIBSAMPLERATE=ON,-DSDL_LIBSAMPLERATE=OFF,libsamplerate0"
 # The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
 #  so we'll just use libusb when it's available.
 PACKAGECONFIG[libusb] = ",,libusb1"
-- 
2.34.1


