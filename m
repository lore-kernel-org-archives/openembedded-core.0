Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3B0C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 04:03:52 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.69181.1746504222132000940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 21:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MFEklpSp;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so4919071b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 21:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746504221; x=1747109021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF+y7psJ+X8JSRa1NMMCK3OPRIwTOsoQxM8ZqokSFR4=;
        b=MFEklpSpRH45KZ9572entT1ctgeOVUhxo5HNGm+YPcbdVghl5KvQ0gwcacqcSvq79G
         Mvrqf6SaPFN6VbdMnHnLuJ0wLrOW2ferBjRFtzQCmFnZmhG7cGeAHEmLqqE3Kqtebb2w
         gq0xxZybB8BdQXrdMNnBe2J0d8eVSCp9Fsf7/hDL+G96NG+ndcOGo6BCE7nPEcjjXK4D
         3xPZnACTduOwqdQUiWwEph0pEOrjWnK/55pb3CoTTPdlz2Uc8wCqQIB3/Z19lskxQb7l
         SjM2TJiA1VsYnSTp6oebreJpgyh/NU73Q1gPyDJ4HKH7w5yuuH+j6CyXbJFzWUAFYeDf
         TuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746504221; x=1747109021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RF+y7psJ+X8JSRa1NMMCK3OPRIwTOsoQxM8ZqokSFR4=;
        b=vI7vWcF/AIVlVeHXI64Auf7f6ugB6rph+ak9lQ2Gm+E4ZfDrckz4wvbyWj8S1GEZfM
         ipFZX9Vz+IS6CEHH+/hxqA9VQHX8sR6nPFP4ISilbX8njRhE/IFNrcGPYDlcQGyrCYOI
         Rjn34sTP7eefaRdPGspnT7o9v4XImyVyGk66gKeI/WjSm/geRH4Pa5NkO/ihb9pRFgYP
         wxWmPcujHZ8d8kGkpm9OVglb+e0wSMzqNExYVgm4NnYR8Amxquv5A5TLXHymSkulowMg
         JwklyA74teP2y2PcYL34AmTJEnHDywqRDMwQMxD2TOUaTTllV8EImDztA+3NagGmjV3B
         B6/w==
X-Gm-Message-State: AOJu0YxIcPFOaUWLmoGyMFMdgwZIdYs81UGbtX/+ZMGuHLaoJbr5nmfA
	+S0FR+4rCQmY3JE3v8a4Xl6PS0+wK8zECZ+MSf30ugHPVkmPzV76hSHympaF
X-Gm-Gg: ASbGncuj9uEYzT2B9/8D6vP8g/toYfqyVPyhVE6HgEWvIDMOACAmdTyfrjPFXeHlthK
	TvL0RuGti5+3jLiCmZnUo2nmMSaZj7IQSNVJOLAQ+3f8nU4EoePsUo4P4eIX4l1XdIQIJHqftNs
	PfiJiRJJbGs2iFGjjglohoTfyFRBfT67HVUPUuBgB33AwtAbSrSLvhbsUd6uyxJE/OYReMAYsPR
	77ZBV1yneQqU1oqV4V0vzNSat87Ipt8Ntnu+6j7wMwQeW8NDl2VbdmqKYNNLXaAjGUv27Fy3VuG
	HiDUAUzoT2eSHj1fcQ+0D/SfWi+Mic1M
X-Google-Smtp-Source: AGHT+IET72aXoRZ0OgtngBAKB310cE2fn4O/zvhaec26+gHin+ovEviYz6ugTbCel6Fcx0NFmd4x3g==
X-Received: by 2002:aa7:9305:0:b0:73e:359:acf4 with SMTP id d2e1a72fcca58-7406ed5677fmr13313628b3a.0.1746504221117;
        Mon, 05 May 2025 21:03:41 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020fc4sm7808962b3a.110.2025.05.05.21.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 21:03:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] compiler-rt-sanitizers: Omit the musl architecture restrictions
Date: Mon,  5 May 2025 21:03:38 -0700
Message-ID: <20250506040338.2194103-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 04:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216027

sanitizers are working fine on arm/aarch64 as well. Remove the
compatible host restriction

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index b987a5cc768..bb3c8aa20a4 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -129,9 +129,3 @@ ALLOW_EMPTY:${PN} = "1"
 ALLOW_EMPTY:${PN}-dev = "1"
 
 SYSROOT_DIRS:append:class-target = " ${nonarch_libdir}"
-
-# riscv and x86_64 Sanitizers work on musl too
-COMPATIBLE_HOST:libc-musl:x86-64 = "(.*)"
-COMPATIBLE_HOST:libc-musl:riscv64 = "(.*)"
-COMPATIBLE_HOST:libc-musl:riscv32 = "(.*)"
-COMPATIBLE_HOST:libc-musl = "null"

