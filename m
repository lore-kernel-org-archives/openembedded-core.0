Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E7CD116F8
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:07 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10196.1764310743980458622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CSmur8a7;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29812589890so18314565ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310743; x=1764915543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohrarbJo2j2S/Z1QjCm18AYn5xEhl2XGjEITWMvUzJ8=;
        b=CSmur8a7x+MT3KiWeCusCOijOrfsHxvDFQlHz6yhfRw8aAToqlrqC+K7r0/NhUg+jB
         MwuMU7CdqaTmsZ6laifmP9s82Jpxd7qLJv137VZecUC1RIK6+2x2OmD3P1DK1iJBl5Q/
         L8o6aLNbB64u8ArLFvoDQG+K0z2AZoAG/rG8eQFq7cS3GJbsAvA+tjXk0+cUTHm733iu
         XfX4dFSi+b+lqpaKQx0lpaumcpsDdd8Wkkzm12F70cxnzLddkjCy7hEaIyv9F7diX9ms
         FD4mVN/WjxnTa/4IEoUS5zv/fo3PB2FPEM6h4w8B8/OOyHkJzv+8dxHsh2EA89WnPkpo
         C8Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310743; x=1764915543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ohrarbJo2j2S/Z1QjCm18AYn5xEhl2XGjEITWMvUzJ8=;
        b=HL9/EH8ypoDzY+YeVbKq3Xv6cZfKvssATv5UGaK8WhZhux2WnPC5cX+I6dYFU08MOM
         ed0myDLktm+M75cwYB3K6BWeLF6gocgqqcTvCbVDhBgZTV/JXQJixG204aVXwFnS2hDh
         oVALoLO2uBygdhnFTYLjnerteurw6M8xMXH3S+06RNDogj7xClFJ/dCpmi7BPz0Gog0v
         NFsmQpMfYim13+FKTEjEnplkGntKKquzNEp+fO8iY8f0A0qp5hT8/8HCNs2ZyX/ZQf+i
         y8hA/YsVIAYwlh5kgW3MzsGIrKjOVULIg6n6Q6ezjIz2/mAaCV3eHRVf5DxUU7504/pY
         tLVQ==
X-Gm-Message-State: AOJu0YzBZApLKmE2sR/hHJ/pFgZ7wJNuO0H9gQyWcr+0zFNa5bHrbsjd
	P48vTtAPxhWHUXAzKtldANUmmxywv9coxtjBiMJNm3hdgzp85vNbkg0Sa2Utgg==
X-Gm-Gg: ASbGncuoHq7dq9B6bxk96mEYiJh2AbFUh8mNVuvsBRdORh+6f+u/Sy8VyasY0jXFRYt
	VfpOW03YCTuwxw0i3+rkWpIREBpJL3eP8Dl+oFdPBjj3Ku1x2fW+PJTM162IkvNvl2TVf86xOxR
	D3ju/+TFTgYfxTpgI2YODNeFtHYlPnOG3dMhqUhk3D3FAm9KzOLgYBdMNWzSzzrrd1jTrXK+31R
	Fifw0gn+pH7vPIXkMVdCOubD3BJb+zlO9Kz+IrfpelpR9gZkxouOzrvuIQqDMGG+bxbeJNmp3I3
	kD0PL84j9bVPddBYEgHV27vumRmCyjab8esxMlBvJOX9/X/QbUqT5T1G66cnYH3Zzl9E0mKfrTX
	Oa0HtgY8EnvJ2epxrV/T5NHqWPDwbycBs7p+jQ4Qi9WDGA6fV4KogE1oaQqybGBxzuEvQmMwybN
	NH6k4K748QULWDfw/oQvJxHSbQUk261daUD6s=
X-Google-Smtp-Source: AGHT+IHMJlrfePPHOHBJgoerjPU6CC3v5GsitI3bz8MiStkyTvvhrXLwfyKT+ERl8ayHHWOg1u81jQ==
X-Received: by 2002:a17:903:17c5:b0:298:485d:556e with SMTP id d9443c01a7336-29b6be8c774mr269796245ad.11.1764310743223;
        Thu, 27 Nov 2025 22:19:03 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:02 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 04/14] mobile-broadband-provider-info: upgrade 20250613 -> 20251101
Date: Fri, 28 Nov 2025 19:18:41 +1300
Message-ID: <20251128061851.1634479-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226887

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...o_20250613.bb => mobile-broadband-provider-info_20251101.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/mobile-broadband-provider-info/{mobile-broadband-provider-info_20250613.bb => mobile-broadband-provider-info_20251101.bb} (91%)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
similarity index 91%
rename from meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
rename to meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
index 72663c7e0a..441732afe7 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20251101.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main;tag=${PV}"
-SRCREV = "2a1b409491a531aedcf3eb3ba907929d96bd181a"
+SRCREV = "18cb97517d9c831e1d2ec057e62d04fd3665e10f"
 
 inherit meson
 

