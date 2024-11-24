Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202F3E668AF
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 13:12:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.66135.1732453936268608555
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 05:12:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FX1Pu0sB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: gudni.m.g@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4316cce103dso44661865e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 05:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732453934; x=1733058734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJmVW9TPO7lrusWPN3Y+ziwcNKX+KjMuOkFVXZwbLWw=;
        b=FX1Pu0sBbKYjoDBwwfVPWiRupQt+hT2/3I8L/0YnEBlaUVmQjZNQUpOtlW4Oc4lEGp
         qs6AdUIb5nLYe6jONFNFr7tDfxivldNEXUROd4mWg1xmwz6ZMxuPLgnobaB5vA1699lt
         s+sGN1NWU2glM7idgAUmUz0Js9hTxVZiAVXeDDPnPXo+esGoX1dxQvsWwacDNO5lbyuA
         gdpZBZOhXTCBjS8o3AA/6qASRpPQF6Q8zMDDr+MfEL/lD+7t4g02Q4zfw60uTVJE8PKH
         CJh4unnTzVU2PIe062zpJmGbLu07iVy6mU3wEarHBfbjTvt3z6E6ZHlPnU/ldrdY72XU
         SGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732453934; x=1733058734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJmVW9TPO7lrusWPN3Y+ziwcNKX+KjMuOkFVXZwbLWw=;
        b=XEyjwc3orhKTu53yJVeEh3v8MtbsIugVRYvuT2CGEDNCuFzj0e2KDMdpdgxH59lOLH
         NSqsbTBdHe7M5xNiZ1reoDpXZScEDAHPRxO53kLmcfLx88tcGZSvRPBKpoVJKuC58qYW
         ldAJ18CrR5nhvS+pDhWX3YGVpkx37kHHmC32TgEJ24K3gpCxK0bLdt5ePrv/S+tBffLA
         dKhtSP5znK43mC+ArDf3NeFKt+Zi97BpeGY9/iv8wB2BQXoTwDWbtnoyfS2MPaEXUeJ1
         b43T8Lz+/MerdNpJ3j4Ssz5TKpUD9appUYz49/+X50V0TJQlg2VtctGM8X3OF4RR0XZA
         Db+A==
X-Gm-Message-State: AOJu0YxhfKeb1yjptg36iOaWfwP2o2UWewn+SbD7JGf0RyME7YXHIQ3a
	vyyMfu07XC7WYJ2y4YFB8zEi9PAw8v6BstHjp0UDcLhSAOYSlFrx24ccHw==
X-Gm-Gg: ASbGncuKW4rWZAtIh+QFS1uTv5EVHqv2LwGETUFsoXvuRd0j5nwT/o9hzftbXZEPOap
	gFdPU4jz+W1KsTjBuRvIexL136gd4lDN1ktywenDMCOL2dJ/MtxN5/Vq8dzeO9607j3XCGJub4L
	c9rMyFRgYboyA4eb6WzgQCMYeBlo8s8wR7eyxPciwdAd/+QnX4rCvwr32INV0XBFf+6uN6KizOp
	opkTEQ9TJhBrBJJP6jfl8YQSjvQCUfYMLKzo69533sgH1tWOyxRnIm/vSctGwoyW/ULP2PK5uw=
X-Google-Smtp-Source: AGHT+IG2dgj7F/tkWEVQitHzX5nBN7JUg9hLdaRFweaZohZ5pEQw9enxlnHiRVMKciQndoCqLgoRIg==
X-Received: by 2002:a05:6000:440e:b0:382:440e:4e86 with SMTP id ffacd0b85a97d-38260b8658emr7320208f8f.33.1732453933786;
        Sun, 24 Nov 2024 05:12:13 -0800 (PST)
Received: from localhost.localdomain ([81.15.100.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fad5fa2sm7937103f8f.1.2024.11.24.05.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 05:12:13 -0800 (PST)
From: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Gu=C3=B0ni=20M=C3=A1r=20Gilbert?= <gudni.m.g@gmail.com>
Subject: [PATCH 1/2] systemd: drop intltool-native from DEPENDS
Date: Sun, 24 Nov 2024 13:12:00 +0000
Message-ID: <20241124131201.708131-1-gudni.m.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 13:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207704

intltool was dropped as a dependency in v236
See commit for reference:
https://github.com/systemd/systemd/pull/7313/commits/c81217920effddc93fb780cf8f9eb699d6fe1319

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
---
 meta/recipes-core/systemd/systemd_256.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.7.bb
index 97537d09ba..c17100a636 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -4,7 +4,7 @@ PROVIDES = "udev"
 
 PE = "1"
 
-DEPENDS = "intltool-native gperf-native libcap util-linux python3-jinja2-native"
+DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
 
 SECTION = "base/shell"
 
-- 
2.43.0


