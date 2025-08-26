Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E971CA0FF6
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:26 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.64602.1756215681594550565
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xBSyPK3Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-24646202152so42175945ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215681; x=1756820481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OY1VYdY4XaeHxSfu3UvfOz9EW/WXF11nzFmc2P1HZ6k=;
        b=xBSyPK3Zs/cgUqZe3I+1Y8f/6T0H6LxPe/Bd/UnUUYkF3ezLMr8LWfJ8p2IqltpRmg
         nGc6taJsFSxwQoIycTbbQGAdnDnXr3vHzbARSUyw96j7P6KTWm6wxcGTxt+ilW1qhWul
         Z8mAgIbhM02A27t/50YggJ3dXnClyUh5DOFH5pm9oGfsXZBHTOHLkO8+Fu/pPrMfuSq2
         tv9QCA+cZlZJcpoxFmS7WaUI/9FS+y2R1dlhlxbY60xnNeDV3lPtXH4YltCIuiMT7PPu
         duPuJFsf/1t9QIyHMU/L9koW52ypZPBYej9WCDFaf+oh7lSK+iq6KsLEEfzeQjcykIPC
         T/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215681; x=1756820481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OY1VYdY4XaeHxSfu3UvfOz9EW/WXF11nzFmc2P1HZ6k=;
        b=mnghAgyq4XNZDIcv3K3q0xirYOj7VSfqZYhPLw3FjsKYMawdHZEfGMYpzVjNT/mh+G
         UaK/R/ZDX5kIscO/1WZIyZs4qhm9N17itgfkEMrNs7FHi0G5I+VczT5uZ/X4k+RgpMFp
         Jtll7qYRQQH81TfDSoMHM0ZANVdW8IJgPtK3ylPVSdIg6QfATU+J3TVpZpQohRAPcO7Z
         CAUofU2p1MBqBYn0P77VCMBa2BsKHJNw2R8xjgUBxsS8cA0dw1sU/ahWlIlqIrRb1Ahb
         eqgG/WyzH+l17IAyTI86dlQcKo53BrRYEJ4ejnnFedPwYtHwazHiFptt7o6w+jYsvj/l
         ltZg==
X-Gm-Message-State: AOJu0YziCwX4Vu13oIwl5zGsvoZTpPy02zXTi6cIvDMm2nlknkerv7BV
	TmJHIHf7vcGVl2/NrV7W7jEvbaECMPdDSNlXiYTelHwSr9TbypWpDeQgf+efspYgKvUugh2FhY/
	zYQGw
X-Gm-Gg: ASbGncvI6WAxHOvQn+7v77ATOkqjo86FMthngTQYx+SNINrLwjr/RGAJhGjaFkjiKWl
	nDfK04919sVZWMmwzhqH38lLj49x812FyMANrPqtgXa8mbLK0mQr74xgqoCXybtp/EJUxAX5mYb
	N6AMXtXdmB7TKTdTWZsNRhj2zIMgfhD2qD5RHk8KZVNUNLlMxQQk0Dtetzu4JU1youGJpp2cf7q
	eg950TjJzI9ZyBhEctmfE7BOlkoZmMFWdu9GKTfzm/arJ6T7FMfsFuYAFmXHQgVeox4hBPpPJ1u
	GtwenhBGnckYr+XKfP2aa+6Z16jRfTalyD6GzBR25GaIXaZ3SiU5rgvnW+vtlnXhMCPoLe7e7qq
	CahqzT2yIB8cGYg==
X-Google-Smtp-Source: AGHT+IGpJV9s9WTXb9kEB3HxqWAKNY6/khpEB+IFQTKTbZp8YqrRflaMY10OZ6Xlp+/NdW9Hs0UEwQ==
X-Received: by 2002:a17:903:11c5:b0:243:1203:404b with SMTP id d9443c01a7336-2462ef445b8mr195254195ad.28.1756215680798;
        Tue, 26 Aug 2025 06:41:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 09/19] gstreamer1.0-libav: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:43 -0700
Message-ID: <d40b0da3070dcd42bed756a47f98b09f04632cab.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222449

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...reamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.24.13.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.13.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.13.bb
index 77c10da39e..3260e1556c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.13.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ef72c1c70a17b3c0bb283d16d09aba496d3401c927dcf5392a8a7866d9336379"
+SRC_URI[sha256sum] = "150e2b70588fa32a1294f42665756f2175417ce4b5988e2c2081b683719aa6c1"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.43.0


