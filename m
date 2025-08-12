Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45175CA0EE0
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 22:21:57 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.87306.1755037309340549028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 15:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=rj9cAHLC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso58946996d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755037308; x=1755642108; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I29KAoTT2LetotsZVK2jS/99eThd+rxZzIwunOQiGqQ=;
        b=rj9cAHLCHb3wEygvuFc/ez51J/RfMFIqeV3aS1LvFeMX5BFw3EfeuSrcy4ljB85+XC
         HxmeV116tVTTQlWQMFhVLaPOegxZpyygGBjTfxDrN3N3aZ1y/OY+4cudn/MlUqKCK8rV
         NsX0m7rAX3Muu9cO9Zz0BpsOJTViQzB5URfCa6R38LIyIQt8+AIbmhVAcPDpUjouvVno
         XUMUmqXv0+xMBGLclmMG0hCWDIkjKqAr0/92blibvzVfNwhBkcCF37auiQ97H1XAuEBP
         kL/Cw/6Uy0RAILojTm59cAO21dPr/nRTlKTXL7gW13f7S7nziMNJwUZ+5SttKV6R7l8C
         HKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755037308; x=1755642108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I29KAoTT2LetotsZVK2jS/99eThd+rxZzIwunOQiGqQ=;
        b=n1RIapzl2tRzOgU592cTZhIZCFbSRA8oSh3Trlr72nrQl01oLEZHCtV2W/PnT8CAMN
         2+In8TexM/JZq6PoQ9EkIcY5pGawY/jBmFcLb1XMdtmSEECH75xPiFJolOX4DOWZmW3I
         lWWHF8pnMcs6kwuYeXW4ZUHr6QzcIQrMrx6It58ROTssnS5nC1Qflyp2oSS67RYCzlgF
         H3P2Njf7T0RRstZ4ZU5JXrxDeJsPojag7+khqT3uR/GS83qGW7w8qnTXTqQc3VCcvVX6
         3lqFjTAY//XJMPzd6gsJsjlvq5El40qb1ZsRaCy1LHjSX8sJSHk+3tGjpfBoREBy+ZNj
         QmDw==
X-Gm-Message-State: AOJu0YyjnbgjbkALzjDRaUzx1wdWpZAABtL+ftT5D+9ZpSHIwEX9leka
	XaYZO6hk9Untfq3odNTw/YaK/rhHYD2n3vSp6IQvmThSdOIUxApl3GI2WrLqDBIzjuGtHm6VUAW
	1sG8=
X-Gm-Gg: ASbGncuT8SN11/QDAw8GG6KFxMuXuWgyTX2xd4WvKqfBpClQSu3jbGJ4rLlU1HHIsHN
	hAT88HgPh/o8qHZtOvT2JG3NE2pnSHbDkHQlvAwI688CBi+LbLm7XhNvXKw1fe3YA5xzHyuxnQf
	2tOQt0WmGxf6J2uDkFF7HlTvon6L8/biH/nqMLH1Dn9bJmetvZwM7TcaMIrWVrsSYOzoCsm2xyY
	4izgYnznRvsmHkNqB8v6v05LBkR6GrziWJTq8D/FQ/4ptXo48SkER8lJHmeegYizSAFc2LkU/EW
	Pqbt6AaA/QSbnEKi3OA/TNReBhfuQ+jf+DRA9M1O2BwMlwflkRoCjyKbDn+C99vEBCh7tNO/Tao
	egeb4McsDcU/uWw==
X-Google-Smtp-Source: AGHT+IFV8dK2/lKYRo/ZEikGW1TSP5fNED5KCJzwOACSr94uTWHmwd5hArKXEKhF94yakkdVHd0hVQ==
X-Received: by 2002:a05:6214:2388:b0:709:64fd:8743 with SMTP id 6a1803df08f44-709e87a7fcbmr12562916d6.3.1755037308186;
        Tue, 12 Aug 2025 15:21:48 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdf11b9sm185031776d6.74.2025.08.12.15.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 15:21:47 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ryan Eatmon <reatmon@ti.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] arm: add nocrypto TUNE_FEATURE to complement crypto
Date: Tue, 12 Aug 2025 18:21:42 -0400
Message-Id: <20250812222142.1761197-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250812222142.1761197-1-jon.mason@arm.com>
References: <20250812222142.1761197-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 22:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221782

Add a `nocrypto` TUNE_FEATURE option to `feature-arm-crypto.inc`
to explicitly disable ARM crypto extensions via GCC flags. This
provides an opposing state to the existing `crypto` feature,
enabling more explicit control over crypto-related tuning.

Some vendors ship cores without crypto support, and this change
allows disabling it without requiring extensive audits of
dependent code paths. This approach avoids the knock-on effects
caused when `nocrypto` is applied implicitly in the absence of
`crypto` in TUNE_FEATURES.

TUNECONFLICTS was added to prevent both features from being
enabled simultaneously. When both are added, the following error
is seen during build:

  Feature 'nocrypto' conflicts with 'crypto'.
  Feature 'crypto' conflicts with 'nocrypto'.

Signed-off-by: Jon Mason <jon.mason@arm.com>
Cc: Ryan Eatmon <reatmon@ti.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/arm/feature-arm-crypto.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/machine/include/arm/feature-arm-crypto.inc b/meta/conf/machine/include/arm/feature-arm-crypto.inc
index aade6ce08d5e..c1f5b1225dfd 100644
--- a/meta/conf/machine/include/arm/feature-arm-crypto.inc
+++ b/meta/conf/machine/include/arm/feature-arm-crypto.inc
@@ -3,3 +3,8 @@
 
 TUNEVALID[crypto] = "Enable cryptographic instructions for ARMv8"
 TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'crypto', '+crypto', '', d)}"
+TUNECONFLICTS[crypto] = "nocrypto"
+
+TUNEVALID[nocrypto] = "Disable cryptographic instructions for ARMv8"
+TUNE_CCARGS_MARCH_OPTS .= "${@bb.utils.contains('TUNE_FEATURES', 'nocrypto', '+nocrypto', '', d)}"
+TUNECONFLICTS[nocrypto] = "crypto"
-- 
2.39.5


