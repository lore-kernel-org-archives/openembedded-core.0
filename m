Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2A7C54799
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.37999.1747603864569395999
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KH7HziDO;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30e9a44dbb9so2390767a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603864; x=1748208664; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptf9Pd1wAS/Hhn6E/sgUC0L8FIEDsCEt9oko0uNb1Kg=;
        b=KH7HziDOEj+8RrqQqr+KizTB7h38++cTcSujhK5Rny4d1x9VihjGqYonL/lRFWMAKL
         nJK13ZoRTjLsbdx3CnpyygtAYJmOA+/1c7pzd53I70I94u2LF9bLSEp77gmYo3rags4b
         /H9BWUPsrkkKJcnp3FRB5+L8EuBxyzTLnulSgCJ9N+5gkAtlnxmaEO3QCTTjB7g+Aqut
         DPxoCj1nh/z8nNPR/EeDBmSx6BP7B7AVzy3VCnPjQBP+1O7YN2nswvKyTCt4vJv7XpzG
         vpnXxqziR0lJU1FaTwvHG9C5PIeCcYILrqkMtLiHGuan5MedGgEDznZgyNXy3asOfvN4
         DF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603864; x=1748208664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptf9Pd1wAS/Hhn6E/sgUC0L8FIEDsCEt9oko0uNb1Kg=;
        b=KX7tOrNshoYInWVV4cf73LDKTJKcph3iz9VbaUzjOT0rXky5ujxFM//pQJnbT7Glo4
         2IgImEZ+GnxqAugiOjMMc0evMekrVa5Msyu4SDuBotEf7BrBzbR438YEVjUfTzkB3RrG
         kbAfQyRpgpuFcK9CPrTUNltQTbc+N3/NlEiI4GM25/Ponu31HThIb7kI5FeJOrvSSlEB
         C6tBE/AN3wps1o/exroB5jVB3PYmkOh67uImYfYtT/kO5jpEfLHd4iQ3GmHPrwmb8HHF
         Fg7b8LMaZvbPYa7xJuGQg4bC+lsAuz1R5cMXMAEhiDoz8CvDp6JMZ6MiYADS0JTrO3Nn
         aFLA==
X-Gm-Message-State: AOJu0YxL1uqFKdjWlyAJKVn8kgWRgjWD7/VBvvwMm+R1u6c2zPVdEEBZ
	EzoungF4tnvuPYZUvq0CnyYdy6KMoFC7PaCr69YAQxvTebrSWRQlC6ytGCanb7VR
X-Gm-Gg: ASbGncvyupihSJk9m7BGpUwGfZxHFcK2ybBiVDvWDzUxCR9HKobvH9eX8MnBKmRQYln
	Sqi9mOmeBYOjeZ3N8thtfcs/y4qPUms4Ide+uVTN8YxzGzZESlFC8sbEYTVRhbc5LNXCrnAIMw1
	HKCCM/J5IDaaq5BB8T3vhPTfOmirH5RTDZgRzXmgcSUfcB5s+a3fw3y8YSlwaDiovf+D1wOi1jO
	wykjsHCzV6ExnS3ipBonEnEHrKFQWqRQeocTzK9IA8YQP4jx+Te+NJtfOoO/cXS3IEJ2zlDpS5J
	tF+bmckR6VmrXVS06B70J5w7PGuosEzpcK5EJcYC/brbOvRUqH/mOH58Mzd9SNC5
X-Google-Smtp-Source: AGHT+IGVuk5DZMnPw3JhXfXU4+hMTBGWBXgQSF+NE0WouJZivfMIdB3OSylBEXB9c2K0mfSlJ38rHw==
X-Received: by 2002:a17:90b:3905:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-30e7d5bb646mr16387273a91.35.1747603863539;
        Sun, 18 May 2025 14:31:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:52 -0700
Subject: [PATCH 17/21] libjpeg-turbo: Fix build on mips/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-17-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216801

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
index 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e08e47d953bf5773e19 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
@@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEA
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
+# <instantiation>:13:5: error: invalid token in expression
+# .if $17 != 0
+# ^
+CFLAGS:append:toolchain-clang:mipsarch = " -no-integrated-as"
+
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION:jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."

-- 
2.49.0


