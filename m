Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503D4D5AE61
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:59 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2886.1765620053494639696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HikrumEV;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-298145fe27eso29363735ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620053; x=1766224853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3xkYkueb7dGLiIN2Sk9vDccfm9LIp0ealOrWr9LCDc=;
        b=HikrumEV3FPEX7I3QsZccs5yRdzJPt2KREYkCZSmAGRL16yj4nOVsuF6GpJOxvUuTp
         iP56xpknJLwqbn8J9PgcEyY+pGh+j7j1Wa1i9wWz2S7LT2ALn0Nj0tQqZ4+omdcNOYYT
         7DNGKIDMOMT2d/AaeP0LCU+SgwC0rjf5x+abfXx3ww1LOnizQwybiidL3OmGcC5aGcCk
         UCo/46TrVHxsfNdOegUU6AJhJWQy+pIgbwr89FmERTRAi0//OX4SO8iq7w2DzwWhJUlS
         qwUOLvsgH4ssfrZRYlmtC2Q/03L9rWXIIYGqOshFqBTSnZarc/ioFPkIXHsaehXVwVZO
         IvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620053; x=1766224853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F3xkYkueb7dGLiIN2Sk9vDccfm9LIp0ealOrWr9LCDc=;
        b=mRDxecmh+IX97695JU6rNHgP0qDzF7z6jbBYVwMsO9lTOybPdQJmEAmau/7kAdQA0R
         Ucl50v3a6AUZQTB5kTh7VLbYCL7gFev84mE4/+BUNhD36ilOSH57GJi/nkr70cKJzXxs
         l9L8qWgYPKzCs/gd3K6HZLRTgCpx/N2W2wjaZSz9VXCTMZCBIq52z1ud+3XoEcsyeg0J
         5Qa5M0sExWGDxfqhYtXzSqZisteQmvQe09udBoBYnEJsvlBMzeVcecICRAoxHbMCKOI2
         zrb/tn5N8fWl44ihstrW1+Ko2KAjwzz/8NqqU+mKcJQC08eAS394sasrdqwYomdnd5FV
         A2Dw==
X-Gm-Message-State: AOJu0YwG9SUaJfLSrRfPJS7PW8DPTnYO4nqLW62+cmTUWAMPjVUmD1cp
	NrbfR6e/H8DW6w1ag6AKqgN5KAkfDj6sUvTYFE/nJSORY9gK4zf3aN8pxkAFezp2
X-Gm-Gg: AY/fxX4j1qQnL8zELcexuo6Ku9zEe1AFD14UMWP+Rvk8p2A/l+t1AwmIpGKahKAiNtL
	Zm4DKGFgMa1GzoQ+cbOv6oaEeylYdzbxQskM3NfYxRpkEbSWrloQr3GxtobLcPrnKsOhQpYg1HY
	ayRS+KUxLIUNwHB6FPH7KgQ9YB6e9Om8G0i1+6PoO7eCAfOA1xrbnsu+XGmz07pKlnjM1/pRKND
	hLH7ZwjpslyjvV60qo+nSvldc480KE2SHEJjnoWIxWM2J49vl000bS7UtxO3TBMLwnNOJo/LHTm
	EWOetqDu48yXI8qRukUxr68SuyN1iYWAR2FsKXPunETIY9mGFfj/8zjzy/4gX7VI1BhWoqCSw5c
	45ueZ9RSGsPIbhGlwnCRK4g2Z6wiV+9cb8dE3h0ku+kTaU229ApaMjnZ68EDbQrXonZPLZpbRQ+
	4Sg0sjS4aKYVQPc9iuGtVvMDHP
X-Google-Smtp-Source: AGHT+IEMLUfFV+tK8CdUuEch6vL3WvXACVr9fT6i416gZlIr7ipgjEllmwadgi+wHf1A1OsePze01g==
X-Received: by 2002:a17:903:2cd:b0:29e:e925:1abb with SMTP id d9443c01a7336-29f23b6832dmr44881485ad.27.1765620052636;
        Sat, 13 Dec 2025 02:00:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 27/67] gstreamer1.0-libav: upgrade 1.26.5 -> 1.26.7
Date: Sat, 13 Dec 2025 15:28:51 +0530
Message-ID: <20251213095931.2571498-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227645

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 1535c02a7ddd9fa87e5634bcfcdbf212d7621d0f)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...streamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.5.bb => gstreamer1.0-libav_1.26.7.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
index c3ee529497..aa6c431daa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.7.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d6de05884ef42376dd8cde89940f7b50ced96f4f6f52888e764cd8233e74f052"
+SRC_URI[sha256sum] = "91d4a7a14527d97fe0ce7ccedb3554e8f692b216429ef2b1850944bbf5435c09"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 

