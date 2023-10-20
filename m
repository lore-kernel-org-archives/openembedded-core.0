Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A39C00A98
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.58030.1697817106379760514
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wMIHy3hV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c434c33ec0so7176805ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817105; x=1698421905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f15XwvlS6rb0etmCQ9b4gcV41mTlE80C88M4vurQtc=;
        b=wMIHy3hVvGHQ8uFUMVle2Q2wWCB0nNRbbltzKfnWiUxuoGWoiFo1q8n07iJ4Km55RH
         TrUSesOofkUwTKva3ZYojq7wNutsDLPNwkE5sZDK/GfHgZ4xkV0qhb1tHLJihd6axuV8
         2lbiLoODXzeFoCO+8sQrPXYGC41mHfz6+uaoasrx8tep1hyYHy0AXE/F85JRXBY+pYuy
         ClzEz90tpaDOr1JSkKiNwuh/Cw1/wTtsajurslvtPLNbEYDVKIXGhf9BoObuhYvZCA8Q
         lmRGYtVPYz+ZLC/7qphD5DmStLUkwudZcBayOOXivdnZEcEb92pWpnQRl0E7M1r6yFnM
         rQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817105; x=1698421905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4f15XwvlS6rb0etmCQ9b4gcV41mTlE80C88M4vurQtc=;
        b=OBD2zQk0shskSWTMEu/FlIra1DXM7UFxAruusG716b0ouhlQPfyjY+sGkNhkq5aTn8
         5TNqtWIALZtbQf6qMUykAYsO2nzvN3H208NBQJP2ZUXCIWnowwjBmlygwpzA+ytWczIw
         Tj/aJUwrgirqaLdCRAnVhQHfFCNtgDDi4sPSajoBM2Wy8NI9iRMmh4Og8YPNXm18Y/An
         YX/HCZ84XKZG9Uk/X9jIOWHlGMKhqoUbh7lRGV6Bk4TIA8pzcXNsuwsp1j7fXnf5avCS
         BQBhv3Wtxm9g9WBg5MJEfKamGCDZX66p9FT3r9bNwl1o5mA6hHxeWHwMquh8uf4UeWFc
         CVgg==
X-Gm-Message-State: AOJu0YxevS3fDItiX6CZVjeOZ6zTfuUilxgfhHIgnR6on49Jwa88snio
	OFPYsi8pxcZXPX/Ki6lvlY9d0Z9p/+vUHcrhj3c=
X-Google-Smtp-Source: AGHT+IFXDpBWv8AaoQHedlsedGdZIfjsynUdAzMYxrxtqLjC5r4fWjLN+hO2DSn0vrrQwU7WhNe8dg==
X-Received: by 2002:a17:902:e74a:b0:1c7:5a63:43bb with SMTP id p10-20020a170902e74a00b001c75a6343bbmr2251853plf.8.1697817105121;
        Fri, 20 Oct 2023 08:51:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/24] libxpm: upgrade to 3.5.17
Date: Fri, 20 Oct 2023 05:51:09 -1000
Message-Id: <b4596281de1f96fdf6533ab4caa957f1eaeff756.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189552

From: Ross Burton <ross.burton@arm.com>

This release fixes the following CVEs:

- CVE-2023-43788
- CVE-2023-43789

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46dd8ce41756dbc2aa0f9001416f208cced1c8d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.16.bb => libxpm_3.5.17.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index c3d01f1bb3..8e15ecc0d4 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -22,6 +22,6 @@ PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[sha256sum] = "e6bc5da7a69dbd9bcc67e87c93d4904fe2f5177a0711c56e71fa2f6eff649f51"
+SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


