Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134F5C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 15:20:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.16012.1678375206331469382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 07:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bzgQIFt6;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id j2so2225365wrh.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 07:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678375218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVePOITTLupG7B15UDgcRtdsVPHDT7qrOBQvdUha030=;
        b=bzgQIFt63rv4ApszbbB4RWi9ijXcKy16+igQOE3cDgBe7SANHGUE6g4igJgd72J4Le
         Plt3zP3K2ZxAgqxO4/h9KANAoTau4ZBTSbjgEds1ucyxWMW/D8tTAsUibKkpipA9jqdj
         bn3GRv3Xq5FWAVy91wxPC7kku74JKHYh+sUwjFnA+6SD9zGJagBCMzoJ8z7Xn0RE1xYs
         ZMYPHGq23qfRgZlxQ6vbJnz7pRmLW70El2aVLSm0pVSMZn1CUcP3R/bfc4RC0dHAv0Sp
         6gu6YhQMucELzRqrBsHEbhXhqp6ALyUYuY0SOYi5OdvWSLqM03LBpXCO9DnEQ5TjMOTt
         3wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678375218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVePOITTLupG7B15UDgcRtdsVPHDT7qrOBQvdUha030=;
        b=75cnjq7rD477xHVQTfPHSP4C5Gnx0NNrvYe0FGcMtXDiXhnG1AMlWj09P4ZodTS50g
         DwG4WKe5w8Br+63+nLN7VZDbIV4BhIrxAZ13UwDllXsIKtj/W4kks9oRZNw3fGY/JFt+
         tHZ3fEJNq+9Kk3DAOLrrkHmIbyrdWzk84hWatlb1gDIM4drlkyPdPNWMSttg7Fvz86Os
         9q2GMnYsq+ezHOggfxFDLhLNMZS3b1wOGEDyR055d59MJYk5Gl5GB/UXc7egefM3dFVt
         rdzPSG99eU2g/FYclSRQU1lddSYM0+z3Tu0KCc0dQqXUmuUA16GWyuj8Pm/NceuWiGEO
         tWNQ==
X-Gm-Message-State: AO0yUKX+XUi7/1iA3srIxF/i06CsfDAsMAt96vgYc8e/EgOkzRKFWSun
	6ouVGlTFvXq0Ozx+bjyP6iDcP5LPEjI=
X-Google-Smtp-Source: AK7set+3yxfRfoIKnDLfLf8K5QFdXQ/j8VeEbP30VBqJ9yqldWOUqBTOIDL3JXr1MNaB0SgZSFUUQQ==
X-Received: by 2002:adf:ecc9:0:b0:2ce:3d1d:808a with SMTP id s9-20020adfecc9000000b002ce3d1d808amr14775816wro.62.1678375217816;
        Thu, 09 Mar 2023 07:20:17 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s10-20020adfea8a000000b002c7e1a39adcsm18314521wrm.23.2023.03.09.07.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 07:20:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/26] apt: re-enable version check
Date: Thu,  9 Mar 2023 16:19:58 +0100
Message-Id: <20230309151958.3619193-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230309151958.3619193-1-alex@linutronix.de>
References: <20230309151958.3619193-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 15:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178251

2.6.0 is out and so we can check for latest version again.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 7af9792a0d..429cf6e659 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -39,8 +39,6 @@ UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # is considered stable, e.g. 1.0, 1.4, 1.8, 2.2, 2.6, etc. As there is no way
 # to express 'divisible by 4 plus 2' in regex (that I know of), let's hardcode a few.
 UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(3\.8)|(4\.2))(\.\d+)+)\.tar"
-# needs be marked as unknown until 2.6 is out
-UPSTREAM_VERSION_UNKNOWN = "1"
 
 inherit cmake perlnative bash-completion useradd
 
-- 
2.30.2


