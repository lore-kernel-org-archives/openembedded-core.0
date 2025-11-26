Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F945D1038A
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 07:58:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8701.1764143918805511778
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 23:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H+ozf/JU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so254689f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 23:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764143917; x=1764748717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zV0AwOw95OF3mfHNF+OcF4hyQtYeTvhTgJcCLKpRRTc=;
        b=H+ozf/JUzkTHxmeD4ZSyAs5q6I4ZiL0jwlORznmH5rFBRzADJPwncOHWpdiprRgeVK
         ltwG0lIxgXU5LteCtul8XWkA91Q+3lHfe+IBcpkSvyn5vr3p8EbepP2EF86DhphfKOUT
         C9K5JJSsFbcsReD0ZWD1ij6EFOewI5K0uIuH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764143917; x=1764748717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV0AwOw95OF3mfHNF+OcF4hyQtYeTvhTgJcCLKpRRTc=;
        b=TvuGEZLDWGnOZAFlLbJPXojI52PEiv/3LP0ZA/RBGXr9yix+iLzIOaRULtns4pqv8N
         CQj02cAyVw3tcB7R39vVmABAfAaWdrU8agQFUKRaPLXrXu/Um//L2jQnCvEwA74fuELg
         23A32BDf/gkd4A8VhOfkqsx+eHO/z4xeSstgrFTbubKOOWUbUPmwCt7XxqhUyYOcc5Z9
         aMtbLOltlZ19uxe48blRhcLIIXEYQRODjpcwbxZmYQPLmZNjVQ2HAZqU9lBEf9C3ItY6
         yPrMolbno4Yj201zNJH45Ji/zvA+RDJhXU0pLfxb0MsSe16+UdJGN5T9o9i8JA5KUPqW
         7KKQ==
X-Gm-Message-State: AOJu0Yx7W4HhFe5c+XyUo6aCaT7hblYZnBimK/DWrftloAAAJt+aW7Rw
	8qbKxrdZqTR/MzkW3Jc2nG6InPAz9VrLiPER/bzW3g6RoNfj6xwJu061dpEPLYqTizWRg3Tlnhd
	I4Gfh
X-Gm-Gg: ASbGncsQgKCOVrB1OCcZNm0TstMCVG2hsY0/WaTD04aC+YURhBqOVp0C/R3MrXHCOCT
	ZCYpClZ+f33sjR8P3LhQ8HJaaaQhL/TAHUQuC64N6gLdpJIWkHINmXGNIPWDLJN0tD5ZowHecH1
	6RgRi5QVgBiSoTReWW82VWoJAy5a7eQ3m/zxq/c5PfAAxw9NBsb9+R/P/BoffD5sDyvlgCoUK2F
	J18rlbVrHSWxZ77I+RhsdChyitcczwIIBTA6JsiBV6APbRLaQFEiSovkLMUhZOLdHBzGHjpvpg3
	y4IAHtTZiWB0/Pk4abmr7NntGap22atSjHMGh91HSTbwagjpIMmPKh+q7k1ukCdn9dTAlZrYIve
	BYHivmB+zz3wJaNp6WMJPK2rm0s6KoTdU//x32e+Zbv8mLLjJZ3ThGeAM/7atpUrLrsJUYuw6Ws
	f/74B3hnb65Dec0glsmmodlUNzkt9sZuGGvuvItx8=
X-Google-Smtp-Source: AGHT+IGF3eJFI8XXzz0J6ZSsgEfCuGpU2Giu7JVvRx46SQRx9sZKZnL6G4YH3MEDhy7xiVaC+YJ8NQ==
X-Received: by 2002:a05:6000:2f86:b0:429:8bb2:d0ce with SMTP id ffacd0b85a97d-42cba7a363cmr24507784f8f.18.1764143916660;
        Tue, 25 Nov 2025 23:58:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c495:da8d:3c7a:e345])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f363e4sm39552139f8f.12.2025.11.25.23.58.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 23:58:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] core-image-sato-sdk: Increase memory after stap test failures
Date: Wed, 26 Nov 2025 07:58:33 +0000
Message-ID: <20251126075833.519070-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 07:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226800

We're seeing intermittent stap failures which are showing OOM errors.
Increase the sato-sdk image memory sizes to help with this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/images/core-image-sato-sdk.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb b/meta/recipes-sato/images/core-image-sato-sdk.bb
index b5315a19a00..a65c20e4a60 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
@@ -12,4 +12,5 @@ IMAGE_INSTALL += "kernel-devsrc"
 
 # Compiling stuff, specifically SystemTap probes, can require lots of memory
 # See https://bugzilla.yoctoproject.org/show_bug.cgi?id=14673
-QB_MEM = "-m 768"
+# qemuarm64 was OOM with 768
+QB_MEM = "-m 1024"

