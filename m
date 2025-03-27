Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96102C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 16:33:37 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.878.1743093211811920271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 09:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cHTGMrdw;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2239c066347so30266505ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743093211; x=1743698011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytrC8FPF9S7V5yU8F5s+qSKYO6AwVe5NO5EvSbPCgRc=;
        b=cHTGMrdwkg2R/FpY2w1CkUQXF3LbqyXge/szn/DnuNH7p/8vgUgr+erMoou6TS6O1e
         lEBFPJSQF6Wp7z9KzWLAND9YeKwDoUfxleF/bCp03ngp6mkbVWcmX0eed/WYR/ca63CG
         m34U5rAkBzquXfekDKEvrZeEEI8BkCZODNoqYxUZdHyaNsOG4hW4aK8aH/ELQpdxBcxC
         OKqXVbeHiKKsBRS5TLFmTDp+wOV0n7r/tfAZ+vzSUpj1Hjge/b8ZtzauBYOOSyqGxj37
         FcIi7T6i1fUZu3Lq1kbaL/Hc3GssLl/5uSVgZAt23TRh6gW8U3SsYE+dJxKPp3TUtXIC
         0i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743093211; x=1743698011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytrC8FPF9S7V5yU8F5s+qSKYO6AwVe5NO5EvSbPCgRc=;
        b=AvOFCB/+qOgMFOUgD5TTyWXQTGO8OwI8VkoG4JhRdo8lHCeJ5QOKGfQNu5tBmm6wTI
         5eKBuwp7yN8GSf9DjO2n7vOjxvcFFIPcIeGBHLkNyMCpijYK6XoTzruBEhZpSbA0a+8w
         IRCmxy2pfmsa5S9DVmH9hox8FVhyhjOtt10PycDWeX8jnZYPnZEX6+tyFAw/fGjhXU8j
         /x0be3roDQJT6LylaD4qNNZthIG6pmmTB5Z99IOjZLg8s+TSUvEqMTEVdQG8wrCv04UI
         7e2d0dXZK+TQaiwMR41qkW2LUxWBN2CuFFM1W825iFuYTIoDGEWcz9sWtWJXTPCmX6kc
         XClg==
X-Gm-Message-State: AOJu0Yxe6rUw1wFydH1264rLMLL1LbHj87l4VqZz/x1v+7kVKCv/+r5Y
	ypKK58KtbrNihbGaHAMikWbFY9kDRJxKFYorARPVlP4Q7TyKgCnoXTfRPwb1
X-Gm-Gg: ASbGncvk7dZH1QVaRNnzAOosgGbQrcK0+ibXy2/dkzU1WC8IWgmNDC1qj5cSxiVCsAK
	Pqi6fvxMT3T9N1U1vV3BVlFCD4v2VW8ZM1MxPgT+BwdMlwI2KNDktH8tkTM0Dtr3Zx4jCek3Db6
	JHDewASOoWlwrTC73g2rAJbsctj42vrkrCqo8eJUn8P9nR/UyakV0jF/FQIOCLdrCVyGAQYfa/W
	Su+q6GyouvTCcww2SsoXSr6McoUtby3DQpa/WZAk9KrqgG/NSu4NUns112MWeWzfJ9B76Tooh45
	gO1d5JtGZqHAM0Nm0BE2VDlreUlLc+P4qLEO
X-Google-Smtp-Source: AGHT+IESxfmG0Hgr1N5zOcIDFIEmqYOzv3285DF1Ri22JnMiFk7EBI0UmYyxP6eOSwA/hHB1/wDj2g==
X-Received: by 2002:a17:902:ccc4:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22804882f1amr47195425ad.6.1743093210821;
        Thu, 27 Mar 2025 09:33:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1df4acsm1512865ad.199.2025.03.27.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:33:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Ignore running strace ptests image on musl
Date: Thu, 27 Mar 2025 09:33:27 -0700
Message-ID: <20250327163327.553536-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 16:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213766

These ptests are hanging with latest musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index f3fdededf66..c7d5e20a484 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -134,6 +134,9 @@ PTESTS_PROBLEMS:append:riscv64 = " python3"
 PTESTS_SLOW:remove:riscv32 = "lttng-tools strace "
 PTESTS_PROBLEMS:append:riscv32 = " lttng-tools strace"
 PTESTS_SLOW:append:libc-musl = " libc-test"
+# strace hangs on qemux86-64/musl
+PTESTS_SLOW:remove:libc-musl = "strace"
+PTESTS_PROBLEMS:append:libc-musl = " strace"
 
 #    ruby \ # Timeout
 #    rt-tests \ # Needs to be checked whether it runs at all

