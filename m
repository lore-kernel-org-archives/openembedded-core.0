Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CA3C02182
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 03:03:57 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.34208.1737515029382347007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jan 2025 19:03:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=F368meCa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso637376a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Jan 2025 19:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737515029; x=1738119829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhVnxTtcuWxBw/xBQRQR9/9HrpUH+Lb97Fz4c7n27wA=;
        b=F368meCaKR01clQ2rYNDYr5tn+OSS9IgeTmVu7tYpikBo4rx5o3YTwHYiIN4LSgDwu
         Pn4RrH+EEIsMX/TfwUrAmV64wYyMBmzzrlzqVZI2Qj7KpRFX5DRf0GOBqpuUC8q29tn0
         gBvEVY9wjuZRC5PnurU+C4bTcQ5wwiz0ZOiVuW1b2B1+kVByuk/H/Q8JNsdgQOXb9wJb
         vWVOYH7qMQQ/OY3a2N7Thx/F3WizQnIwePxmx6aY6EMKKU1GWlavX8y6C8kI84Y/QKkM
         kcXMaXsYLgneSVI9fS9UKx84eVdYD83/y8YTg5UfToXCPkKqMRBhwTZ8qOtYr2omzsMS
         sTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737515029; x=1738119829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhVnxTtcuWxBw/xBQRQR9/9HrpUH+Lb97Fz4c7n27wA=;
        b=jnqZwNMlwE0izZ3i1dKJziQuFfkum6afd8ywTz4+iruFnXH3dyeQDxNevCMPX0FNlx
         VTiGgq8Jzt4C+TtfVUxpRdZrNOr1Kjg8bM+46XSKY9zWXV/GpppmYojaf8p0GXZlpTvx
         w/k6WuMvJ+Xi7S/l8B6JencaS6egXWEEldO25y+GLuUNpT6eT4Blqx0qqZyYFWeSTKMG
         Q+eP59Ntkr227ryruJb0DS6lLdGBqSKR8+tkge3lIJh+xaiGxhLgB4kgCdgXjXld8GIM
         yWYkF9YTYEACqr37kaL4pPtWkQ2SisNkh+mbgcNKAxC6CsCxKcC2KO8Yp3bgylt2Zsn2
         73ow==
X-Gm-Message-State: AOJu0Yz2B5r84MHRiamgDeosRLhVUSw8OtKodpTMekil/M4oE/MhLDcp
	5Di6XgKqNMHO8CUuY9d8AA5KtWI31v3A2/i4aiLeZJyUexfy7BbDDvfwPKA+283AvKKonZBttgV
	yDsQ=
X-Gm-Gg: ASbGncsNesdbFnzOTWocPVknLbKAgufdOYL6qqYb/OpeRyHwnMvUL/TcOWxYz3IJStW
	i3cK6QQilXbNf5SWcOkZULXuceL6PRUv5oe6xwJ0wql2XOQasCgaPUkii2NYEAzBkZlMAwB/Ct0
	mRN67cNP0CIBcKE5RKao0HYIXAfSsZEe4bagNBROXy/VsLypBxtcXE4nouzMzAVWPT3H6wEZeUm
	6HwbjkMHwBFOirwfQym8aHjTZYAJJuDaTaqY4bXxtJys5RArjCtBe/Qm1s=
X-Google-Smtp-Source: AGHT+IGjMAMSq4Py5OCiexTOH7doXZZi7AbXw7m4YZM/rCPFO91uqNIQ2w4PT4qNbLOQJl2YDlG3Zg==
X-Received: by 2002:a05:6a00:1d12:b0:728:15fd:dabb with SMTP id d2e1a72fcca58-72db1c5d820mr30682355b3a.8.1737515028629;
        Tue, 21 Jan 2025 19:03:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab8112c1sm9800337b3a.37.2025.01.21.19.03.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 19:03:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/14] pulseaudio: fix webrtc audio depdency
Date: Tue, 21 Jan 2025 19:03:09 -0800
Message-ID: <e80c3ca36f08a259e13fd94f1c87a7f5bf485a8b.1737514842.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737514842.git.steve@sakoman.com>
References: <cover.1737514842.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210127

From: Esben Haabendal <esben@geanix.com>

Since pulseaudio v16.99.1, the library needed is webrtc-audio-processing-1.
This fixes

Run-time dependency webrtc-audio-processing-1 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency webrtc-audio-processing-1

../pulseaudio-17.0/meson.build:730:15: ERROR: Automatic wrap-based subproject downloading is disabled

The library is available in meta-openembedded/meta-multimedia.

(cherry picked from commit 4661c49eb4f0ed89a3d027d9a003c40744baaf38)

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index ae16056d24..1ab3831519 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -121,7 +121,7 @@ PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
 # able to use pulseaudio autospawn for root as well.
 PACKAGECONFIG[autospawn-for-root] = ",,,"
 PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
-PACKAGECONFIG[webrtc] = "-Dwebrtc-aec=enabled,-Dwebrtc-aec=disabled,webrtc-audio-processing"
+PACKAGECONFIG[webrtc] = "-Dwebrtc-aec=enabled,-Dwebrtc-aec=disabled,webrtc-audio-processing-1"
 PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,"
 
-- 
2.43.0


