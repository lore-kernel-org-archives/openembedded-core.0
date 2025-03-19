Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FEDC36005
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.2957.1742372194516947506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+4DI80E;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2254e0b4b79so26485885ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372194; x=1742976994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=X+4DI80EoAeQOdZSJCQHBdJ+Kg4WeARij58m7rVj7QHdi3hrUIAMtRclpposPl1/uY
         9exoSeMZFFdfbACUUg2Gr+TJ5QseZyKvAAxaMe+u/xHfwEXufclxYo8mMMT9bzDJlgjR
         +wdhpgVQCD63iU0UVeQHsx3fp3FhLDR1AJaTg3d5SBl9tGKd3IoFFVLdJwoAzT4dUQzR
         z8G7tD0jBJNyCwHgSB21t6yFjGdTgVUCTHNG4QEAJIINhRBgKsWbg1FQoGqn2WzVBdXS
         BQ5ayhFi0LeISqDOSnyqVV+k2EjZJ+2wUVZwgYMtu4DsVY1NqsEP/SqCQxBIqANhfKIf
         ZEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372194; x=1742976994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=fLOz2c+HmemI7wGd/4YE9oEZaunqrqWatr7MZz3MyQ/2xAvd0+HZoEzwEXm6bZ7izO
         aNllMs49jeUrEYUZxoyg+pEwxU8TVtWOOsLxraePdlYxJA1zX+B+Lc9MbIZkbTRea0Bg
         mB5KWUHXvCt/r7Hwd5vwqZtlEWQRiamw83nWx/bF/TrUhrYjPT07aRDe72YHMoKmxDDn
         2it6c01DWoZEACk9rmm/mgUumqSlZYgUDaW4i290NWnF7xqcbbX5bJn+MWivy4WVSDKK
         PDik3tyHZektOBr4AXkMleztS3GMsPRh3X7dOnGQWZHGoym03zS4X7fRRWUZjrdxZ3sg
         ZfQw==
X-Gm-Message-State: AOJu0YyblXFvGhtdMct0SceI6jlOrDfZOQlJalESOs+IFEWAGCeSgG5/
	5iSOvREHMa1kf5W2B2BWG01Zq4r+RykrGb/JW9l5BsEFfA9h7KiBnzf7y8qv
X-Gm-Gg: ASbGncsrABTB1j/VO7n8IJj3ddkMo9LHeCTf/kOT6aw5ROspx4TUbK77A+G3se5FpcO
	6kSK/CR6Bq/566Nj8ig+WWV6nk7rEWTWL65FCD62W25Hc4AEqY1PpPQa0knWCUKho9nmEMDKWuf
	g+vPdgymcmWZeeFgxbbFXZDpuExyO1jopAFGjgsODBzLQMC5DHKBclmp6G1S1fMaolCYiH1rRbI
	nJKfNgaqs2AoBgDRRSu8NOYOGrMJZWSI/yPCEuNWKfnQjmBih4q/btCy8lglHbIfmJLfj6fB1C6
	yxwt4H1RZ2CYTf5+i4h7fpM+hpMAusQGflTi
X-Google-Smtp-Source: AGHT+IHAJ4z1cJ5mhljYoGKCcXyaQiOTClFJiRnRChsvuHEepB2kQhhwwonFn/77ZzJ2CkxmZZy9Dg==
X-Received: by 2002:a05:6a21:1513:b0:1f5:6e00:14c9 with SMTP id adf61e73a8af0-1fbeb6a0549mr3208233637.15.1742372193752;
        Wed, 19 Mar 2025 01:16:33 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 18/25] cpio: Pin to use C17 std
Date: Wed, 19 Mar 2025 01:15:52 -0700
Message-ID: <20250319081610.3536475-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213290

Fixes build with GCC-15 which is defaulting to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index bfaf5c31c37..b081bd53db5 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -20,6 +20,8 @@ CVE_STATUS[CVE-2023-7216] = "disputed: intended behaviour, see https://lists.gnu
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CFLAGS += "-std=gnu17"
+
 do_install () {
     autotools_do_install
     if [ "${base_bindir}" != "${bindir}" ]; then

