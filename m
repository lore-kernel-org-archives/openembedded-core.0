Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596F2C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:10:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.8359.1634213430227745059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fU5PEaRQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id g25so18763608wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5qe1P9gmNYU2lufEC3FauMDcbDW/2YfbBVGCg3SID0=;
        b=fU5PEaRQhcUYpg4kRmt72bYxyUpvRrse+mxDM2TsMGVLriuX4l268vrFGDJRWhvQOQ
         2s9iEtuK/a+S3YiywjGUPD9syf2WXIkDOY1NeNOtTtezUHe2Bg7G4T9AC68tn0gCr/9L
         7j9FQfDFNrd2MgKyexm/f6xBhiklux8udibbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V5qe1P9gmNYU2lufEC3FauMDcbDW/2YfbBVGCg3SID0=;
        b=zdNISqlyC9iDnI9wRMRb8bkm6nAE/C/B5Ci01TGwXaK5+IWDq9gn0jw0PhKuTKWkud
         /teFv6Fd7VPqlPQ0lZFXrKtwA3shgqxgwgwMV8cDrkZsFv2VQUsMvFLSKDtCcG76vaDQ
         oCVXK9mYwEUag+GJ8rzv/xyYcBX3aOgxLYlbZVUgRTxmO3QnL+2UohOSypMnmuKTP+M/
         SYKt+cPCS3UPoB8cnSGoxTxP0OcEzrETjrDTPan9D7ixO3brSAtAQfCcYhjGDAR2aK60
         rJZ8iq+fGh/9TG59HxZa8CiWgFTtfxVleSPfcn7Gg7QYEetTM5BUsfrIWZUbhchqZOfv
         IYaQ==
X-Gm-Message-State: AOAM531bidYwhTbPaNzrDNy2OMKCRBHtNwEsP7I2TK6+uEBOFdKBrojy
	KNickCQer3Qrut4pkQKxdvWmtI32cUk=
X-Google-Smtp-Source: 
 ABdhPJyAMbhRuwjDvrVT+gjOzmRIexXhC8Wr91WZM/ylqdmzSKB9RcVIFqI2cQcwePo0/1cEzKWgHA==
X-Received: by 2002:adf:a455:: with SMTP id e21mr6174101wra.232.1634213426423;
        Thu, 14 Oct 2021 05:10:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 10sm4296152wme.27.2021.10.14.05.10.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 05:10:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] reproducible_build: Drop now unneeded compiler warning
Date: Thu, 14 Oct 2021 13:10:19 +0100
Message-Id: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:10:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156939

We now pass compiler options that mean the compiler will adjust these values to
SOURCE_DATE_EPOCH, the compiler warnings are now unneeded.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/reproducible_build.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 7571c116c82..fd90d771d2b 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -58,9 +58,6 @@ SDE_DIR = "${WORKDIR}/source-date-epoch"
 SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
 SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
 
-# Enable compiler warning when the __TIME__, __DATE__ and __TIMESTAMP__ macros are used.
-TARGET_CC_ARCH:append:class-target = " -Wdate-time"
-
 # A SOURCE_DATE_EPOCH of '0' might be misinterpreted as no SDE
 export SOURCE_DATE_EPOCH_FALLBACK ??= "1302044400"
 
-- 
2.32.0


