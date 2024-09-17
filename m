Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D73DC3600C
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 10:34:08 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.17980.1726569238543100397
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 03:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cvHMk5vb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so53512575e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 03:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726569237; x=1727174037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3FHF4qht546UnTwFst2de64yipmy4Zyz/BqT4N3F1ik=;
        b=cvHMk5vbZpYv5pThtAnxgBxat07BwN+HMLiPx5LzOMUWOlFz5Pd8KSYx06Xd4HFvH1
         DfB5vLTK1tayu2hgRXGjoe0O0nlaagt7LySuTl5wwVzW72BfIyWsCV01DsqRL8X2f7Jh
         Cf1h0nfftMay+tcpOQryVoFERY+KMB0DBFOWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726569237; x=1727174037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FHF4qht546UnTwFst2de64yipmy4Zyz/BqT4N3F1ik=;
        b=Gbo64ZinHp/pD91zLJvZ2l8Q2w71hOo4aCR5hJHfWkD2+rmWCnXISOw/fymb9Eudr5
         pUlmLVe+J6cGP7rHXm+I0gHeiVxA4BPAZQ9eX+NAn4rOnsqlZT6oJScZw5mBkKZ9YPmt
         Fh3fdKIZ85/ZnMrVvmZ7LZIpL7FStUh3xZWtykUsNuoUJ9L2YVR3OLvZm25yBbssGT+X
         SMWRa9xVFuMGnAgTGOibCdZTVFhI33ats0xjFFmqOXG9OnwcfcL7k0ute+JNgRgYXt8D
         syIlu/ttSwKxz5+0yUQ+c2qX7s+I2hIVSaEDtUS9UIF5LEhxM+O1ag8dcaPxOYpxeJlR
         Wmfg==
X-Gm-Message-State: AOJu0YxFiJaE2eUb0yhuAXovVsyWxvVJZqkfUBmhKuFDalKcvKSN25Vo
	qmShRx2a1gSYq67PPD4/Cekp45su8hQ7EslADhhgpqhfOwuDocr5i8xROF8fJFTv1CRwfEVua7A
	4
X-Google-Smtp-Source: AGHT+IFw4rtnXgjbP2vg/3+Tr2t1/JDYZNLTPHMb86hLzuVzqIhjFOIlDZsSHZB2vyErtu4jeFmLQQ==
X-Received: by 2002:a05:600c:4f83:b0:42c:b950:680b with SMTP id 5b1f17b1804b1-42cdb54a0c8mr111130505e9.20.1726569236344;
        Tue, 17 Sep 2024 03:33:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7c97:abb4:726a:74dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b054c4csm133812205e9.2.2024.09.17.03.33.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 03:33:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: Fix non-deterministic configure option for libsamplerate
Date: Tue, 17 Sep 2024 11:33:54 +0100
Message-ID: <20240917103354.3586621-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 10:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204620

The libsamplerate option was floating and being enabled on some systems
and not others. Fix this to be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
index f3c78a31e20..25bbe2067a3 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.7.bb
@@ -67,6 +67,7 @@ PACKAGECONFIG[directfb]   = "-DSDL_DIRECTFB=ON,-DSDL_DIRECTFB=OFF,directfb,direc
 PACKAGECONFIG[gles2]      = "-DSDL_OPENGLES=ON,-DSDL_OPENGLES=OFF,virtual/libgles2"
 PACKAGECONFIG[jack]       = "-DSDL_JACK=ON,-DSDL_JACK=OFF,jack"
 PACKAGECONFIG[kmsdrm]     = "-DSDL_KMSDRM=ON,-DSDL_KMSDRM=OFF,libdrm virtual/libgbm"
+PACKAGECONFIG[libsamplerate] = "-DSDL_LIBSAMPLERATE=ON,-DSDL_LIBSAMPLERATE=OFF,libsamplerate0"
 # The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
 #  so we'll just use libusb when it's available.
 PACKAGECONFIG[libusb] = ",,libusb1"

