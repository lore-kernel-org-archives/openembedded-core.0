Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27323C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 15:07:56 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.123999.1699542469875203673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 07:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FJQPlDoM;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b7f0170d7bso1018357b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 07:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699542469; x=1700147269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2rsJs7mPKr2NcvwXcgwKcvMAqj2U5pz96+Q3v1N7soA=;
        b=FJQPlDoMf33uLq+ADRwLfBVsC3ad8Mkgn9wyd7UulCzb2bSF8Ifh/qWxPP4IDVtzT4
         HVWbk7/alRg2+CXw/gEwAnZLPI2XkH7pd16voYv4u55SzYlrPyWNx1fbEjdkpbGzxJpG
         E/BQNsYhcoyyBOmHnxG95+unYP2c5Qb9+2PJWjZpYDNJZv6TPHR0X9QZy84i3Vfa8BIi
         L5uPsmEMDks208FPeEW4MhznrjK3LsUTqjJYPJTnaFf/fahi9Tyb5/3kZoWqkmOm+DyS
         6WUotdLwQolJyZAFvt5ZiUM8oO2UQkY1A6vsLSoBh80x7YojvnaMfI5kTw/mrRhlnWnK
         sapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699542469; x=1700147269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2rsJs7mPKr2NcvwXcgwKcvMAqj2U5pz96+Q3v1N7soA=;
        b=bioCKmdvs0Bcpex2Oyi7ldJekqtw9sfUYxYcybfz1+K0fHFxrkUdzOM6R/icvZXfYi
         IUjD40ObgIHawyTS4HPQUQs8W2Ne+DyLp8122i55QeeU77lD/ic7c+UATqBnWSY+ERYt
         Fi6HMhErtC70oaGe3eEl9/ayc1GVEHKvFhy9UShrrcHysnPY2yyAPOQJGYXmUENcYbTN
         hGMX0sR1PiLfQ3YLYFPC7fSJWzUzUQstoocdIyWnr/Np0M1ev/p9sAvtDBNxSlZha6SU
         PI0vrJUxivMtF1rbd9iASZwLImg2o2WNkYZfhi5+fOGjjITjoE1+9JOHiE2jZ2e9HNfl
         bYEQ==
X-Gm-Message-State: AOJu0YyTNlfUEB/0xNr4z0PGVdPUxZJyo2SaS/Qi0Y+RZet98XWZtY5j
	Zha5PwHOzFe3xxJyHjW4gVXZbljozTckag==
X-Google-Smtp-Source: AGHT+IF+tWeEbXGPjCQfTSzRNoPObLjv4k2NldPgBaOGNOvL/ZoKgt8JXboYtf41EFMASrjI6UPGew==
X-Received: by 2002:a05:6a00:aca:b0:6b2:6835:2a7f with SMTP id c10-20020a056a000aca00b006b268352a7fmr5436854pfl.22.1699542468909;
        Thu, 09 Nov 2023 07:07:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id a19-20020aa780d3000000b006c43296c8f3sm4849133pfn.52.2023.11.09.07.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 07:07:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] librsvg: Enable 64bit atomics in crossbeam again for riscv32
Date: Thu,  9 Nov 2023 07:07:46 -0800
Message-ID: <20231109150746.213670-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 15:07:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190391

This works all fine now.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.56.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
index b1b7c8d0fc3..43d4059cf2f 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb
@@ -39,7 +39,6 @@ export RUST_TARGET = "${RUST_HOST_SYS}"
 RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
 RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
-RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
 
 do_configure[postfuncs] += "cargo_common_do_configure"
 
-- 
2.42.1


