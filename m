Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93BC7C61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 06:19:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15914.1787638744833716759
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 23:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F79ogY5Y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso42747295e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 23:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787638743; x=1788243543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlMNVFS9qZodZUucxl5RSC+HirYlJz3OgYLHzQePCUI=;
        b=F79ogY5Yshd757s30vK3RqGopo1qf9tWAmEDeoqFfxC0JDbqTiUghd+JA84IM7sJX+
         BBlbnArqz7x+L37ZfFLVMmGQA7ddXc2lphP6Gn5BYiGAx15yAAMeJE4FL97IHjrk/Bb5
         uAXD5B0gcWwHYGTe2pRW9H7gt6INA4gDa57bQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787638743; x=1788243543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HlMNVFS9qZodZUucxl5RSC+HirYlJz3OgYLHzQePCUI=;
        b=k11h9BNLjHZSsLR6JLOBHWzzFhNlnOvxCmUEDiW0JMV0HKnXcC3xdMxcbFuHrW1a24
         GXXf64Lh9pT1e1KhnNqWe4HfForM1RZK1wCSdpiXI3dIxyRvhSQ/iWuc3uP8fKonl1Pj
         1+y82HpPnd+JALULoYLkN/ReVMGg4x826n+dn6F9QzaXn/aw59RaQpW9iXevvvUK4gpv
         2ZJYUZTb2DKX/1CH6sf4N4N4xXjEsqDmmO/MU6sSCTnWId8i9USyZRFtpIFXxdo2bLtx
         PK9uFcNQ/IfcFiAgYkOY8e/MKFfJL19g+WCJ1ZP9HchFpyTtBsArXCETbWrl4GaPLbbu
         k9gQ==
X-Gm-Message-State: AFuF++nS792Av58zXh0V2cuXU4dQvK9KOiggFRo9AC9zwONDu56UzAD/
	jlaOER9xoemqtnxP5A17UYluAyMO9z1+Ihua8HM5Y5w22KYKT82nghUowVCVYSY2qWCbU7D2E8w
	pobKJa8w=
X-Gm-Gg: AR+sD11y7EdkUNWEvtn2Elc6bIgNZ0s8awHD0Nj1Dj7Q0pJDLx2QYSC0YNVasbPM5EL
	Srb88t6hxLQ4EsgW4rutp5XbOPhb9wWuag1AWT1G/cpms9bXYy7WQqevLHvWaauiUEK1OstrePy
	+v8YAY/u1gb86YPc+p4CcLFUot47BWumM6DhED10DH9NA5xELrseT71nN1yTdPvMQ6e3DuN8B97
	v8wnUauxSINg4jhid1tR2Tlj2rSNnyXedtR/aqb891mJSA9B4fNEVDOgaqzG0uM6wj8eaPo6Tqo
	MJQCHbYgaRP0KW1hyHivTBYeEEhjdWezmvl1YgMtXa+vbDOUHwPENwgkTaUTL/09RoWKfGiJK2m
	q/nvGB6dItH60xxit8AZyoF5NTy8gt0ptfYfA0EuFPrK6HwoMbG9EIZmwMZE+/Z6EpqS0oycuYc
	R5EpvlX+nTB03wEOXbD1lnZI3Sd5aKawfZ1nn3oV9x67yqjrddolrD9uEVMZi6QmrEba+jt5J+c
	C3MRFuP7KwuSuGI4A==
X-Received: by 2002:a05:600c:4e56:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-499c19d5cf2mr286232725e9.14.1787638742809;
        Mon, 24 Aug 2026 23:19:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1d9d:dbf1:7ccf:7617])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499d6352d07sm17944955e9.7.2026.08.24.23.19.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:19:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] barebox: Upgrade 2026.07.0 -> 2026.08.0
Date: Tue, 25 Aug 2026 07:18:59 +0100
Message-ID: <20260825061859.3975665-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 06:19:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244199

Includes fix for openssl 4.0 support

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 6bc3fa07faa..a9f0593e27f 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.07.0"
+PV = "2026.08.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "8b8fb781094cd01c4c5be9d0899d629668cee2b73f1447260851715c4496bd78"
+SRC_URI[sha256sum] = "5b270cbde7f2fc6a78ff6e748eef788bbc04571682e2f2e964cd15a2e009774c"

