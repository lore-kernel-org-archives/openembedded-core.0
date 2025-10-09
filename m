Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BD8CCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:49 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.9251.1760038301376982010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bs9cPGqh;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-781251eec51so1168529b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038300; x=1760643100; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qR035eAnQPMBTYYuTVgWQeYU4fstV8BEdPMKldqRabU=;
        b=bs9cPGqhJrKrYGd30QgjcSDvREQ4+q+zMmu1ImodMM5I/PVy6LzS1ed4/Hhnx7UW80
         AyKlgDJ5SVd6V9gwERVqhkk4Y3mh6eZLdG6q+rllEW7ODoDIXwFdyDR8DZ/rASniczvE
         1p1SQnB+wrAZ+95j6KSJICXSpVPz7Kr2DgzN0NLq7UaecY5RYTpJW2kktKCWKArp6jQF
         uZbweo08md9+UAjpL336wITVlghI7vAh+eRCBdprJjZMVQNP6026gkUzdYh/4ZCykJUG
         tvu0g2n4QT/sWPFAId7G06ZJhDEFFitWlaXObUIRMvKBhnc9MSQ4dGwWA3nquqRHfJ+s
         EBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038300; x=1760643100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qR035eAnQPMBTYYuTVgWQeYU4fstV8BEdPMKldqRabU=;
        b=RGnH+BVhBbf5Nk0xvVN1XbvQ25cBrnvdZVrHbuksQ6F55N7NUXjVGs+p48nbOhPO2P
         eE0l0nY04C/y8rMJg4h75T1CeJeSPdzxbkTX9NI+aa+LQVZd4sAzK0Evc/UizR/ADBGH
         QYiXY33Qu/+RKJs53ZmBmSQ5AfXjGUbJ6l+lNjFanuz9/oLLCUHYQ4z3kFttJfdkxadg
         /1pQkxAdNlu6k0bzTi1dVymT1WDxAVt3mfRHJUGe5L2mYBGOpqFV7Oc/XEolFXhoLNXs
         V20Muw/KXqZCDo7Z9tu1TJUgzXSEcSL5ndpW0TEe8rIhZeZUDcCXHmXeyCQSJhDkvTKn
         HNEA==
X-Gm-Message-State: AOJu0YwUSB3zov8/rRX7IMJGsQT0SONtBzBilZVxmaqrDcoMOXdh6XA1
	rQoS3INcAVeqpV2RZFjE6DyGJBMHiztVoYSBMppR1h6l0XWMbtCc0IyNjyz9Afww8OwvsFoQFI7
	hGwAj
X-Gm-Gg: ASbGnct+nHmFy0NvPeWIlULU68+Thet3Xw0ROcdZ22ix5Dceaj/9SHqb8d3dDeR1HxA
	PNda3gRHhsB86PB/Vt0+c0me92ismxloXa75SXI1PJyVm9eLjTP3ouOMkGYTGBSUC5szrNQpvrR
	AkGovFj58V3nro94N8a15YKSII+2qeAYEd9Ods4cP7K6WSUv9HIE9uHLd4mwjUXOn2rpj2srY+D
	2qLhDDy7bBzM4t777cprO6J27DGIbGlFMNVwpguF+hotLjFtLpZmeRxomF2mBymuV6mtMiAcLGm
	kWsqjEmSq3BC7AVew2XYcWndI7brPDC//kwmShB+AW+QUMoO7r3REHxxXMpbSP9jjrIXSLlJ/BD
	TnVvgMEaeWRBGoaViFd67k3PTwOy6kMyYw3sJEw==
X-Google-Smtp-Source: AGHT+IEbgrqpG18IZDwmE2MwWaA19uoBSkko2OIVVHenp6W8TNWLZ1R6LHHuEq8ykqtBF+jwXl6D+A==
X-Received: by 2002:a05:6a00:179a:b0:776:1c49:82f8 with SMTP id d2e1a72fcca58-79385702ebbmr10045303b3a.8.1760038300387;
        Thu, 09 Oct 2025 12:31:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/24] ffmpeg: mark CVE-2023-6601 as patched
Date: Thu,  9 Oct 2025 12:30:59 -0700
Message-ID: <b0542ad422ac1ba05dd5b8003429b8719619d892.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224634

From: Peter Marko <peter.marko@siemens.com>

Per [1] this CVE is fixed by the same commits as the other 3 CVEs.

[1] https://security-tracker.debian.org/tracker/CVE-2023-6601

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
index 1ba1006197..d90fd20160 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2023-6602-CVE-2023-6604-CVE-2023-6605-0002.patch
@@ -21,7 +21,7 @@ Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
 (cherry picked from commit 91d96dc8ddaebe0b6cb393f672085e6bfaf15a31)
 Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
 
-CVE: CVE-2023-6602 CVE-2023-6604 CVE-2023-6605
+CVE: CVE-2023-6601 CVE-2023-6602 CVE-2023-6604 CVE-2023-6605
 
 Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/9803800e0e8cd8e1e7695f77cfbf4e0db0abfe57]
 
-- 
2.43.0


