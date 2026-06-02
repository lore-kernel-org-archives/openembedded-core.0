Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFF0CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 11:29:56 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20575.1780390241462643669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 01:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fxPLL05l;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bec2ddee9bbso411790166b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780390240; x=1780995040; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nsKgYFcxcLpbn/qt6W93M7gHxwZpP1fnomcliogFAdo=;
        b=fxPLL05l+RryGQNlZXxbZM4M/s/epEzNryWIeel8ehib4H1Q3SoizrAv6WGU5SAHbJ
         PToSkWCJ+/JPd10g+MSNRUh3dFu2MaGYN3fb/SN9vnzyajL2ewbexrvc5FphJVq1InZk
         t06JTZCLotf9e+ceHl1MAFoh+XEU3W4d9UPQDYlwNtTMp941xF1CaG/gGgPYIl97wksr
         6kUC9phpzoN3F2KmhqV1868Vch9mfVVSGwZP1dllaJlNzwezNWkM/3NCcgqimCJxWOIT
         3oi4mWrGDyE47bvESCIBEzi0KVre8+ueIimHYpmU1guHqA9c4m6W/5VgbFPV3IsF2Ms/
         33Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780390240; x=1780995040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsKgYFcxcLpbn/qt6W93M7gHxwZpP1fnomcliogFAdo=;
        b=TLuVhnruKXWb85/GKwsADSS5JyQT/7qvt04TobPcPrPO2An+0qCgY1q+w0Wr0fm9/1
         0NfZrdg4iOvYmtfjQldF2zhFMcvhVBDj7ucLAJBhD8QhNKLkaLTT8TSEXMfRaWrp6Ezj
         j4AHqvLtnY+iT1tnPOGqSPWxsi+KfB55TC8xbnZk+LU5W+jENKozd+rN8B0u0UGiu12r
         AlOzwdJTSfPcPJRhNUXxci4vlXKq/7MJ2c2v006+OHxDY9qTsQDxuCRmTRRnfDtyXrsK
         yA7AlnGfleNJh6cPa1h/aT4fZYJ3gZjwfoVtSrGOJmXOFuY866f62ol0K4Fg5alNL2iz
         L0JA==
X-Gm-Message-State: AOJu0Yy1xrNnyTuR7NiQb2PWD7PeTdDrExDgb0EfWYVex4sAAcD83Blq
	sZLJ7wZmfJZ1TANjX6VeI2QJHDJevuLJSEbHdLzmzk78d6PPLrXp6isE0i9DiTPZ
X-Gm-Gg: Acq92OF25N7+iwDDsO2ANgqfp9Eg3fD5XmtJczdLM08R0FONx9B52TjkTdcZjpl/Pk7
	HJmeNbzbqdq6mMIH/nNXQxLwpgKwEyl2vbm0daMJIiLNxmrQ+duZbIOJYVfK73dglyM2TeaGmAw
	R+BfFH00m/9hdKe6/oMJg8djAuRGQhOwVfCoRy9ZgX0rX4+m5DSgd2OPcD4dFp45onlBibIGX9I
	nxe3DDvgNcF0d0i/1OTZHUx7GKsdPywlX5PDwCeJFXSEOjeKtT/cO6HnIezOHkflu6m5kTAlskr
	9TBRivBtWIt2BR4HN8GJiZWUQCpjjV3d6mTXLur3mHBx2egKBrBujbE6DnhQOFFvlCWWmLtWzhp
	jFD8Yn317b9ez2TqiYnEsm/BncRTuYg5IiHcV0nE+exo5JyTeLdyUe2SDzaCRivZXiIAl36TJVl
	NAGfNNOsy83Xtf4iY5SiO2X7oA0FF+117jz+xrNqDl/2a/oTPAHQyU2DSxoA==
X-Received: by 2002:a17:907:8b85:b0:bee:a665:e631 with SMTP id a640c23a62f3a-beea665ee09mr319960566b.29.1780390239328;
        Tue, 02 Jun 2026 01:50:39 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bee94d11126sm138312866b.27.2026.06.02.01.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:50:39 -0700 (PDT)
From: =?UTF-8?B?RnJlZGVyaWsgQnLDpm5kc3RydXA=?= <frederikbraendstrup@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH] u-boot-tools: include dtc yaml patch
Date: Tue,  2 Jun 2026 10:50:22 +0200
Message-ID: <20260602085022.3925257-1-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 11:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238030

This patch was recently added to u-boot itself, but u-boot-tools also
need this to avoid the need for libyaml which was dropped

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
index 7eaf721ca8..6c3ef7efd1 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.04.bb
@@ -1,2 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
+SRC_URI += "file://0001-scripts-dtc-drop-yaml-in-DT-validation.patch"
-- 
2.54.0


