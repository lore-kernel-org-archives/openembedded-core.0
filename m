Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2698CCF9F8
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:55:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8632.1762512952918669724
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gRrMiOOk;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: nmjain23@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b9ab6cdf64bso274214a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762512952; x=1763117752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqbswwM5mBJeFO8vPGEEehNIWO/sQOo6l6IBLKnd7qc=;
        b=gRrMiOOkWLtvU7AktJ5kULVEWH1+1nVFv4C7yyBVxxuTUzSIvkrnQwxDNMafN5S8aN
         pszpsFAmwZYTYj78NEsNsHBnniqRvnrIllBK4s1z2/WDHktkxQvAIUFdM+uMQCtw+Tml
         1ybTrH9N84cdkczzW57PwVpwmRR+S3GKtpAF2RNINUlIVH+tlskHea8YfZ+eUHlPMhPW
         y8WPrBUnrH8zFrpTym7C11rXaNIGGrD6YYAGxatv6hb6V3EZAzr7xLy+2YjCteoTyP0P
         qY5R6SGOjkW0/KxU+SgW2JbRFdh+GC42C06LwTM4Z5I4ZA4vbNKm6FtMCpalHOoBhb04
         i6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512952; x=1763117752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqbswwM5mBJeFO8vPGEEehNIWO/sQOo6l6IBLKnd7qc=;
        b=OTyeP54pBoLpT9/UxrLDzQjKIuj7x0Oyi2fVpZ/8Re6WPVxBwYicC020hzfXjtmE4N
         xfa7yEMAQ6kQ3eHhO0nFWAVqZk6erke22J5RJ2Bg4bRw4kYIKzGbSr1eESZFvZ2DjGu2
         U6SdXpvM29lVtrkvkGwZpzTZVoU046y8wkUfcKItzLWAZj0HhfMM/pbImqeJX9ENgsSK
         20ch8XA9cOuSWrGSa217xUhL5fG35E7SnHcrJfXlH+hFWluAK0RmuvSau/aqhnZWHkA1
         ydMLp8ZKsBk9QFbQmlsHhSuIQvM1XvbX7Dya9Y37YKjyscrWBl2U+GbRAgekXJhR2O0m
         0Ylw==
X-Gm-Message-State: AOJu0YwiaeM1wqFKw4qZIHfs2FYvNwSiwaXqX23Ozeou6ofa2l8cTnJc
	EsOWlTeOtxkMUKTorIf11FHfkPEJS59IMrwxxCTeE0LnRiZAcd0BPChPQNLaTkIw
X-Gm-Gg: ASbGncuTuvyEu3/MxF4SGKSLFSQ38INS9nflQjHA8VJhbpy4V5WJFwinX54579IrE5F
	S054wTknFzePggoU1y1FtDHXUhIYNb/iOpYeHYcIJNfORAp3l7ZDonjGwPVEFAy0dlm5f86e5ga
	OtzlzTM1mpnks6Onvj2faofrommA/GyH19i7OyngWAuDYxueP1W6BqyBIfpOTt/RSGGRl65hL9q
	Vl32CW+Y10D3nTgDPXNJ3aCuFH76BPydJ766sFNEgAUwh2pcRW5cTqT4UfuMRB3Mj/+i71us5Yv
	OzYcKfSZvN/Gbn8Ci+NN/2PiSzgrE0zOuJzf1sd9wqy36aMlG8mXBx+stbPcDMA93MFc1l2n7AM
	Zerxl1hbG+nq94l2ZqS/rbmPR+njWQ+ZzJFwA17O0GeplYadgj5m60AsjqSIZKVoINMJbWE+3vA
	XeQZWy2MzCKaj4GB1w
X-Google-Smtp-Source: AGHT+IGixjUR8OD4CBr7mdi1kkig6ZicWAouKg9q7YGUibBZDhRC6Hb+ayrnE1rwR7/nDBUedOE9Mg==
X-Received: by 2002:a17:903:48f:b0:267:8b4f:df36 with SMTP id d9443c01a7336-297c97dea7bmr11549455ad.29.1762512951741;
        Fri, 07 Nov 2025 02:55:51 -0800 (PST)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953e791sm2653259b3a.7.2025.11.07.02.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:55:51 -0800 (PST)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Saquib Iltaf <saquib.iltaf@kpit.com>
Subject: [PATCH] rust-cross-canadian: Ignore CVE-2024-43402
Date: Fri,  7 Nov 2025 16:25:21 +0530
Message-Id: <20251107105521.89956-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226032

From: Saquib Iltaf <saquib.iltaf@kpit.com>

Ignore CVE-2024-43402 as its not applicable.

CVEs are specific to Microsoft Windows.

Signed-off-by: Saquib Iltaf <saquib.iltaf@kpit.com>
---
 recipes-devtools/rust/rust-cross-canadian.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-devtools/rust/rust-cross-canadian.inc b/recipes-devtools/rust/rust-cross-canadian.inc
index 4478a7e..8e728ef 100644
--- a/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/recipes-devtools/rust/rust-cross-canadian.inc
@@ -15,6 +15,9 @@ SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
 S = "${WORKDIR}"
 
+# These CVEs are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-43402"
+
 # Need to use our SDK's sh here, see #14878
 create_sdk_wrapper () {
         file="$1"
-- 
2.34.1


