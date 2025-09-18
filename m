Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6A9CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 03:05:48 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.5215.1758164744310259953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 20:05:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RU6grDns;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7726c7ff7e5so478821b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758164743; x=1758769543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NtUR783M7dAwDnugclpSV9+X2Fb/kHBOyDMkF1pAsMY=;
        b=RU6grDnsQ68ugurZIbmDqwRFPfRtT2tPNBZXW9dI4apdcfq5Lfs4hxLzV0uHl2UWiH
         sImbFPc1m1B8N9uA5AtWqKl2BdKRI9kq8kmG1q5sHN2xC4P7IJ9nSxN8i3sM/b8byVzE
         uLjDNojMlI6bcjiDg/U7vNIpD8bQzev17wpv6DkR8uEiAfrTYsNtmpbQnzbym3FOXOIE
         S1GUVh0ADj1g5mVPtXoB0idpzuQQiaGduVF47ibcNQN1XoumXuSAh9fv9h0wJpL6tI7T
         QF5ze9zelGAsphRoz5bUJlwARfQiQHf9CMchWWKBAxYO1oDahaU+ZB9m+mraio5eVl4n
         GUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758164743; x=1758769543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NtUR783M7dAwDnugclpSV9+X2Fb/kHBOyDMkF1pAsMY=;
        b=kNpI+rlN7KdDjcdieymLF6CXBuPibgZcBAxRpEDrcn5JF12gvH1hkGNh0bmuzZkdET
         Gju/Qqz+V1w5iaS937Oee/BKgXsPPV1B8dzYrIl7F/Co/P1tZ/0YMlJ4HH2Gvdjytrwt
         cxl1ulPz8IH56ghbyszGJZk5NACibBf40Ogb9OxHYTOhjdl3cFyv2h87i5Pg81hzQuwP
         OVj1YIn8/EQRkSXY83kkMi3hnMZA/mL7+EILdGJp23/dm0HzzyKu5ZMasNG9RrItmzZT
         PTvsqJO1z4rGVFUrJreVL4M5zg3cYZbh3m6OZUDO4AkgMFyOPtWlBa6GqOOl/cEf3SnW
         Qrog==
X-Gm-Message-State: AOJu0YzejdKq91b/fWhpK4vGpZaohsC7Ln9qYRVUeK0oRCHUMD8jkmon
	HRaptQHIZq1wwiKsBOLFskHoyI/9ad9mJ5ChzEE1Kn7bDUwg7SpsBGgmOgtuwAxDrHE=
X-Gm-Gg: ASbGnctrRJ30iTHq8CwFXMMtgf8kpfJE4zxo03Efh45odlluVN73N9wJesRV1D74ljq
	30Wofr2Chr8nXkgPxigIP2VBj5uEY9OKcT5aXKpJP2V5aILrH5nbigy7RVU+E2H1zx9MShn2T1l
	SIj2fRrSuvMMQxthxLN1/zGs2F5RFR0sY833CeXp4coBJrnaKe9DoE1Azg3UQ6kbXpRZyeFD1Lu
	TwQt68Tc7JEpXq+DvA+s92pArH7pASRV98/dKDVFkzxp9kABQs/zR8vK36s8H+QDfpEy4g1rW2Q
	OrvozjW74BNlFyvjF5jZozPn8m2Gcn4sAtQ4A3NhVFlIJ0+F2B+bOGZQqfLDoRrJNiGH2wC8Low
	dOjSRIthmu7Uur3k8QmXxK3yS0jl3piYTfilBfIOcDw0wBgzhuHpzovrdvbjnkFxrKfdLCfd2fF
	2IoYzsyMxDMfzmShZwj19gT/bEMoacBugNcgmPRTop9kl77gue9ETfygi2ZRY=
X-Google-Smtp-Source: AGHT+IEBwm18a44lIF9v/l6h9qPPSqvEV+Lq186oB6kdYE4ECTrs3CqrFy0my+H9mQVkuxrCQ6mp6A==
X-Received: by 2002:a05:6a00:1789:b0:777:800f:9661 with SMTP id d2e1a72fcca58-77bf72caa4bmr4845425b3a.9.1758164743235;
        Wed, 17 Sep 2025 20:05:43 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::4170])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfc24614dsm825079b3a.31.2025.09.17.20.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:05:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] clang: Fix nativesdk build after recipe splits
Date: Wed, 17 Sep 2025 20:05:40 -0700
Message-ID: <20250918030540.2172994-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 03:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223625

Splitting llvm, tblgen into their own recipes means we
have to ensure nativesdk clang build can find these tools
in native sysroot, which is would previously build and use
on its own.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 9e977379325..bcc799f286b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -78,6 +78,8 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
 
 EXTRA_OECMAKE:append:class-nativesdk = "\
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
+                  -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+                  -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=${STAGING_BINDIR_NATIVE}/clang-tidy-confusable-chars-gen \
                   -DCMAKE_RANLIB=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ranlib \
                   -DCMAKE_AR=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-ar \
                   -DCMAKE_NM=${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}llvm-nm \

