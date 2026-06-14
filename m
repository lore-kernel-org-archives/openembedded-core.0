Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FFCCD98D8
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105045.1781424227855533216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PQ5pco0S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b12270b3so13888955e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424226; x=1782029026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfyA3OrEWOxRkj6huV8OJT/yRFNrQBXdwyfd46bRur4=;
        b=PQ5pco0SzUs66/lutOM+8tppemanMfkX+ARA/kqN9acTvCSHs/JBl61dyJhIQ8pGBH
         q+ax3ILMp/Xr81tWoO746i1h6QAsERUFXPgqA28MBUoRdA7sugs0UCTtE+x9CoP2h36M
         ZVx7gG6RRRHUgpiLec6z5H9Ca7sv14sdk9nYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424226; x=1782029026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tfyA3OrEWOxRkj6huV8OJT/yRFNrQBXdwyfd46bRur4=;
        b=mVyrrhi+Y1WizAH/vzODHNj8DAhEeL4DmuL1T2IuH0vW/f+WRcqPFRfCtPYFdkEHMP
         EMGoc3KMRHNt5FEXnkCTlJsnmWuc5H9cNhhkA77DRZwL5S0bjvCZpxte2Gn5CxF/7Y2V
         tA+w/xzNsUcnUdYuyYt2cvXsodMhJAIaUIHU0M53KMWTn29x4xThVbQXKf4va/stEULU
         FLiZRmsZseDfrVl9dzPkcN4YUwtuTsUT1r8YCmJl/AeNnd/2Uh+BtRSrv4atGiBOxpiP
         41vBbDluBku5TTo8AgG1tnj+4uDY+oZ2MTGtzvD73U7x8a0BYF/pBId6WQSNF+YLspTk
         BjSQ==
X-Gm-Message-State: AOJu0Yxs/dtij8WmoRcU844wsoHsfoUC4PKLOWF7DZoh5Gi611hdDdGI
	ID9w91TXMH5+S7+mmX0c+HdE3S7z/19tr5WumAhf2fYq20nai2z3PkpGT4rHp6y/8tMzV/DQR/i
	KOV37
X-Gm-Gg: Acq92OEZBwC8nh2XKPIwUOCPNm/SdPvhNCCFTB1y1SFfHrVlswM2iRCSYrs6wz8hanH
	2CxQN2m0YKav67VJHZw6szzbY5y/r7rH955ydjzpIhYHdNXIy4IPgUw100OeNR3pBdlxs4nv3oK
	5bOCCSRhCFOYbb9Ep+LNLsboAa5Uk/dJgR/UUj0zbaUSTSv8iWOynuJP8qP9Gs/hXRci9O7/SCL
	2ssYOFDNBRppPeR2Gz4HiHHgVbRqntmeljpZ6llxgXk4h4TK1P0a5+vou+fcS8Ujism+TxdkjXq
	uW1EvVhBPEGU5wNpQJ3ciIWDW/DzXgmV8OjeDIncrfzhxXYqPxx+yPX+fRC18RIX7iu9YtYhUoZ
	RXbkmRgJFJ+YlyIi/lUriwZgh7r+tUDFNTmlm9EcQlncTmgBQA5QeXmwYeCGpFtIluLknjFZ5hs
	zXs/h2+31m42+EmT/9qR1McDUZIjVQLWjUPIDPjWfDiQ9UzpGwUCFw
X-Received: by 2002:a05:600c:820c:b0:490:4b89:5361 with SMTP id 5b1f17b1804b1-490ec4c5984mr120015605e9.7.1781424226148;
        Sun, 14 Jun 2026 01:03:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/56] mkfontscale: upgrade 1.2.3 -> 1.2.4
Date: Sun, 14 Jun 2026 09:02:34 +0100
Message-ID: <20260614080307.4017177-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238707

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-app/{mkfontscale_1.2.3.bb => mkfontscale_1.2.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.2.3.bb => mkfontscale_1.2.4.bb} (88%)

diff --git a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
similarity index 88%
rename from meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
rename to meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
index aa79902a348..42867db65d6 100644
--- a/meta/recipes-graphics/xorg-app/mkfontscale_1.2.3.bb
+++ b/meta/recipes-graphics/xorg-app/mkfontscale_1.2.4.bb
@@ -18,4 +18,4 @@ BBCLASSEXTEND = "native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5a60c596d1b5f3dee9f005b703b3180d"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "2921cdc344f1acee04bcd6ea1e29565c1308263006e134a9ee38cf9c9d6fe75e"
+SRC_URI[sha256sum] = "a01492a17a9b6c0ee3f92ee578850e305315b9f298da5f006a1cd4b51db01a5e"

