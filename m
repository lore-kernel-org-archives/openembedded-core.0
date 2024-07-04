Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43C82C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.8906.1720096076137628574
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JZujQryL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f64ecb1766so3482635ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096075; x=1720700875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzxGkpBuE879S+4vDBHyuwhKyQFkwa2DmJqUXOmnQ2Y=;
        b=JZujQryLdLUFpzVE0W+RZFXjOoMlbmb0R1n5t2UwJy+lmYB+urDWNTx76sZXIoftYw
         yyAGWYqqhSsoSNgFI8UHC7iabBksZgasxruGH0aiy8pmEkVU+gRRNpxDLBkm0RtADjoW
         midKZ1q5jvcQsVZ5sbOpDriX7uv9E8FhCv9Vf7KBA0Df1Cv/wfDacHt/ALUiKzNlxJe6
         ofcp7A/WAFZWH/f7kM6qtOmMsExcwUuzUtxcy/a+QQv3gecspZntl8PgREpsKSFT9ubF
         Z7mBJ43dr1pP0OGYmF4C3AFScV7+Gd7UhEPjifaATD4tee8ezxzFXcDTXjVFVz7XHTV8
         dp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096075; x=1720700875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzxGkpBuE879S+4vDBHyuwhKyQFkwa2DmJqUXOmnQ2Y=;
        b=bGMWzhY89L14L6l78UZPJdPm5QTS/L4TJrwxan1e0aGxJYzyH5NJmm9XLs/Ok9oIHS
         a+yD4CWzBPOO3eNAEq1Nc75H1oMbc2MYZUa1gbnDz8G4sIUVhIVfqgL6D+ZQA5hlNlI8
         RmnfxMouAJxuQeb2lgXIrjUDdtt9ApbiGOBT8hKNQQJgVC0NImoqpPSA0gZ4vgB7i2zQ
         Ujffuma4BucOPATWSgVI8sYzknUYgjycUgQUN+yKfX31upz6OzbouX0ZwMHNsvbSe/Zh
         suF+TtT5AZZqwcW97yAOFIYaQUfjEuAmxXLba7zwV3COK5F9RZt1dMoQKHWz+PZCgkDd
         yNuA==
X-Gm-Message-State: AOJu0YyMea9Imy7SX91WSgUtcIdqsDXgVz9m+SiwoJVgZJ/nv240uGvh
	XyM89VPIF4dXJYzi5vfO1df7WkfTfu3jJ8xHC/crDQontXMhYwYi/TCAVtz6wRNnnPd+WdJkp06
	y
X-Google-Smtp-Source: AGHT+IEQ56ulPAXUMrmbVJXLxA6btEmtwd4WVFLwkMiwzTvJl0tkW1jVPxVHIJShYnszuO513Ex00A==
X-Received: by 2002:a17:903:186:b0:1f9:9e92:c070 with SMTP id d9443c01a7336-1fb33f0547fmr13243435ad.58.1720096075394;
        Thu, 04 Jul 2024 05:27:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/21] python3-bcrypt: drop python3-six from RDEPENDS
Date: Thu,  4 Jul 2024 05:27:11 -0700
Message-Id: <214d41b73d235176123fd78143747845aa9c951e.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201562

From: Guðni Már Gilbert <gudnimar@noxmedical.com>

Python 2.7 support was dropped in version 3.2.0 and
python3-six dependency was subsequently dropped in version 3.2.1

Signed-off-by: Guðni Már Gilbert <gudnimar@noxmedical.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50757cc95b3062f11a7455af33e7a7e74ea1d0f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
index 93fa645f33..57b08b3700 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
@@ -33,5 +33,4 @@ RDEPENDS:${PN}:class-target += "\
     python3-cffi \
     python3-ctypes \
     python3-shell \
-    python3-six \
 "
-- 
2.34.1


