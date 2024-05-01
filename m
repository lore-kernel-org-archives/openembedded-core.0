Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1CAC4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 22:22:07 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web11.55.1714602123282879484
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 15:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nOLNYynt;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7da09662332so43805739f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 15:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714602121; x=1715206921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iiOSUA1x1/0fYYD03F4wRfZlGTHUpPvjwkdYpGSkGaI=;
        b=nOLNYynti4M6BTCSTdEUwVW8iaYlEj9zPK+CyqX+p+j/L8M+JYmKvnj3+sSZVw9+bJ
         JMRU3WRQjrwfLczcoXwXK4GD013E0rx3vzsjeSq0GCSY/vB0bpSWhTw/bmnlO0Z/un6F
         x7tIJpArKdz8G9jH45lGqVMTgYP9q098SGcLvpTrpkdyMDmwOKlLAb9BA2kGviEJN3fA
         Zdw1XHallq0fXzgDfjZ+GS5DYupsgZIOWJnLyR7Zj7kPR6wPeq1SlCrKfiIcl4KWVaDK
         SP5KpQUCWp3RKkaJKtiQSVK+uElAVV/P03XfF/ir7hVMX+aKaAxr7sebadU80Mg4dgcI
         z8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714602121; x=1715206921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iiOSUA1x1/0fYYD03F4wRfZlGTHUpPvjwkdYpGSkGaI=;
        b=adtBlOW42Zp8SAZjMeDiNhuH7X5TBcP1unw/lQ1lCWbMOqHLupc1W/OZee7ghn7JNj
         j2DUDUwOCJjXI4Rv17ZVTPjixtJoePWcrmfRGNRHiTYhLC96Cw3wUUtLMTUEsLx63XX3
         9hzrgaCJ65tLU7CT0YhUxj6De4eR1D0B4qSafEwL6RsyhLqzh6O1UXbvC1AG1ChsjnSm
         ZSHjtU3xbC1I9g8WIr6NnNSM43mxMUgw4wOuZk7Y3j+LYXBRdwrzxkcEGvEYC2DcqLIS
         90W+kG0csXAgPk2vbZikwYNhfY/AdjemeDALyNT+4/BPfl5bbyWH2gOjMMovU3pCnXf1
         kASA==
X-Gm-Message-State: AOJu0YxEk8XK7JVU2keH2ZJ+KtIduzjcQ/RcTsE5KTd9dWpJCYjL1rwp
	SnP7GBVf9vqqM57ZnByHLkp7YVNyk7jNIx7ReOkfrOe4C+T/r7FYTRnNsA==
X-Google-Smtp-Source: AGHT+IEQi0wtJuJpjsdbPeuKlZ9EAYNN0OsqJDijMzdM7N/vM7g48xdiK7Tj/TlDw54J+kDbfayKKQ==
X-Received: by 2002:a05:6602:14c6:b0:7da:1a22:e832 with SMTP id b6-20020a05660214c600b007da1a22e832mr1109995iow.0.1714602121328;
        Wed, 01 May 2024 15:22:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::d802])
        by smtp.gmail.com with ESMTPSA id ky4-20020a056638940400b0048805115ed7sm863061jab.79.2024.05.01.15.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 15:22:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDX Namespace Prefix
Date: Wed,  1 May 2024 16:21:58 -0600
Message-Id: <20240501222158.1038949-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 22:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198895

According to the SPDX documentation, it should be "spdxdocs" not
"spdxdoc"

[YOCTO #15398]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index bae437f48e7..7c8a0b8b0f7 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -28,7 +28,7 @@ SPDX_ARCHIVE_SOURCES ??= "0"
 SPDX_ARCHIVE_PACKAGED ??= "0"
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
-SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
+SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
 SPDX_PRETTY ??= "0"
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
-- 
2.34.1


