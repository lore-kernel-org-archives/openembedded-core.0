Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B80F3C984
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21484.1771943598183199884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2YcjICJc;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-436309f1ad7so4316903f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943596; x=1772548396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dHGHlw1sh7P9elEmAfTQjZGJqbsw1sGkoEPsVSAJUk0=;
        b=2YcjICJcFtFIXZ094n6shKqFKsaIiLCEgaLKWClYWrhWeyZIAkXKvXzTI2sETiuW54
         3XpsxFeCRXOCMHA7iv6Tmctcjb7oPDeQV1jw2BlqxaFW8Wbc6SffAuZqh2S2kClpQ+dG
         X3dLUt1f0SEKHLNIWHsr7TKXFT5m+6k3FIoh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943596; x=1772548396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dHGHlw1sh7P9elEmAfTQjZGJqbsw1sGkoEPsVSAJUk0=;
        b=NCjY2g+sw+rimAY+CqbV0B6XCH0p7s2gTbU5tvK+/MLm2YSEswLNHW1PfZVrOYgV6A
         j9VidTrF5USnJSL04uHmVnM2DmVgpYaoOivCVvmUqTSVopIA4Ljrz1qzs7kn7Cb09G5K
         WikV8ifqcMKiQmid8jBBbsBfPKV3rrevhptN6p9UREurKos5wP6ZQOTciZbUBZod1e03
         EoSllv6jWx17/bokh4i7j5yJFDcXD/ANf54nTUcuiy6S5ILucYku1yKCdqyO+li2BVXj
         d6O85vt91VIHyeW7S083OBgNEk6yaiFK8ZYzmECgSY2ydlPdtKf5eDB6upJzzjA5r/Bz
         gjEQ==
X-Gm-Message-State: AOJu0YzrzvE+PNsYIU80HlvV8gC2+XPqyXOWP8LUIf8AEtcs60pwlAZs
	flomgxOJGQcCLkthMUD/ngrSVSz4lrSUl62LGJUVZApviCi0EdhmHE/zt7sfb1LTjcVRYxJdcrJ
	NtwRR
X-Gm-Gg: AZuq6aJKJiHmZWaTra5kP5sE8jF+tzFMUgTFkHjJ0STRH4InQouv0AkncHERm8/nM0I
	Iw90EndkeVoDllt9nuly0134UU3i8FGB14nH3DFY/gqZprPqg1TmMy/VW2movjwakI30So91sku
	qpVg4A8UPit7hP9casYOFr3DgaKjyVdYKVzm0zHZhcZWswHWqpoAjFSBR6o6HQahWaDU3fbUtsF
	l7JvmgGhzuTjoKoX9g3AwX8TzIKDpTM3ehCfXs+BWCG0Pg6ifHuXQPrMm3CKDHuUMGeg1KP01d5
	6ZYEtEm76UvQeoDMPq6v7WD3mCUOyhLEFvYZWbf/YXAfCCnV7VR75qf3w+VSm849+Eebq7lu7r1
	3LjeQZzsQE0j4M/RA1nZZ99z+8m503YtZ9fpIGI+0itjZJiDuvnBGaTXot8cqjNFs3JZI3IfhRz
	T9lRx+9LLudG9Wj/LWTISYVWORygK4z6AyjeHTtuBONBRug8M9NfdO7Dujk3Uf7tqHP9xIGdBwe
	2kB1PILHZoqMjfKkGEGcbr04DaZG+h29Q==
X-Received: by 2002:a05:600c:45ce:b0:483:7813:90d8 with SMTP id 5b1f17b1804b1-483a95bd80fmr214603415e9.1.1771943596328;
        Tue, 24 Feb 2026 06:33:16 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 39/44] ffmpeg: ignore CVE-2025-1594
Date: Tue, 24 Feb 2026 15:32:07 +0100
Message-ID: <d519ff0a9d8196e741a9bf3d4ce42819a5e1fb79.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231846

From: Peter Marko <peter.marko@siemens.com>

This CVE was patched via c9a15206bae7f1e85dc3b8812eabb936a7e6d383

Patch was dropped during update to 6.1.4, however NVD DB does not have
this information so it re-appeared in CVE reports.

Set its status accordingly.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
index c1536015d98..03ec637ddfa 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb
@@ -48,7 +48,7 @@ CVE_STATUS[CVE-2023-39018] = "cpe-incorrect: This issue belongs to ffmpeg-cli-wr
 CVE_STATUS[CVE-2025-1373]  = "fixed-version: Vulnerable code not present in any release"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_FIXED_61x"
-CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585"
+CVE_STATUS_FIXED_61x = "CVE-2023-49502 CVE-2023-50007 CVE-2023-50008 CVE-2023-50009 CVE-2023-50010 CVE-2024-31578 CVE-2024-31582 CVE-2024-31585 CVE-2025-1594"
 CVE_STATUS_FIXED_61x[status] = "cpe-incorrect:these CVEs are fixed in 6.1.x"
 
 CVE_STATUS[CVE-2025-25469] = "cpe-incorrect: Current version (6.1.4) is not impacted."

