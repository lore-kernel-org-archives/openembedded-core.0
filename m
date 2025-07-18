Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D082C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 05:43:20 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.14140.1752817392300904270
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 22:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYcyF6FK;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747e41d5469so2072466b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 22:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752817391; x=1753422191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAX22kHw5xx/msXmb3anF+m8RWuRoPuVWhm9E+chOok=;
        b=jYcyF6FKUwwvtpoIKpsisAn5ek6DKRrObMd0XHS+BrX8BbSveFSTpT7rHYMNypZOIw
         cd8HebpBQjvhxrOC02HqAhQuIEHZRlEmEdSjat8maCRa3g1iJUYt3UkSTZdgKRuFe/B5
         NV4SGBPLNfccF1gIeapWx63vp9ondI37CvQsciLTe2sgQPlFjLjyayVhmCY5t41oaFsn
         BkPBXc8K1fKbMyDel2DWhjjRfeafsxQG6bZIaitcGf2/mBlD3Kuxm0mED6s43DxONl3/
         YYuiscr6gvr1+ExvHJ3TLhpOEF0V11Na2VjPiYI6zRijGB9o34W9s5+ARXtsPLF/hp8C
         n3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817391; x=1753422191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAX22kHw5xx/msXmb3anF+m8RWuRoPuVWhm9E+chOok=;
        b=G1CKt7t9Yiqg1bntlUcgJkfwCk3t4Sd1xYH1STb2DCsAS1z3uSB8tPJ+QhzhEQwIi5
         knUrdygIc3xn+e87NF+kx35a/JIzxjQfJ1PiB/rdcHQKGUAF5jy9mAzzuXUE2k4rzqsd
         TluAibjzRn0JeLKf7Aks6D9adqxjN/HCrPrKIAQCsLIrSeZUyWJs07REfVySrl1lfYmf
         tjKeXoHv3GyOez09vripzRQ/IEZ9S4az52ureDQSDw4FfN8em/YxSs1EC4SzO8WYknGw
         POXQhInwVaalLv2G8Qmng3w2wzZfsTXS4I2DzEU4/gRsCb3bfiU7hPhDRYo21zfZN0rG
         obZQ==
X-Gm-Message-State: AOJu0YwX3VDvbxNc0+Rsl6vTIwuImzNZCAB9V/hFJ1/pQi6OxiXCycDJ
	eBJQvHabJ4SAT6V1y8QLpIJXPwNG25q0g/S2fZWej/gfnbrLF4UZjrGtq7GRdiOwIcg=
X-Gm-Gg: ASbGncv6xt9oK4JfK1R7snRr+tVPJb4/BMxOrWWzSWh7pMQKR/NxO2LZvl+VN4xNx2m
	iw4UNE0nPF7tNpRATMG+/W04Ty6aMP0rlVI2CWLjc0o2Hz66DOFvfnHb3gFcQeVoo74FtBShFAc
	Mb4LqtP3oY813hfUYcrKFpZuPve22LSKc4VadYsfv+vT/GhquYza8Wd+M/Ztonpf7NeUNrqG/4/
	0zvPP8gyVOwob1uBzlKNKh/cZm6JdkxAJ/05wQ1+EAIWqVVu6OO9kpxU2XUFeWuL4Md+n2+yZgb
	WuWGMHyM+MydjVz2s/5HlPneTJn/BKsebx5UPqLax5/zkwFo63PMQ+9nkB3oBj3Xgv5zcOAeWRE
	ePDJuxTKgOioA4g==
X-Google-Smtp-Source: AGHT+IG/nR8tHLV9FYtgjfg9rpB8ZCZ0V4h9Ab6xc3SzQKDKnpjXIDg1TwW4rtS/x8Qlsc1UJRSlfg==
X-Received: by 2002:a05:6a00:cd5:b0:748:f365:bedd with SMTP id d2e1a72fcca58-7572568099fmr10971943b3a.17.1752817391268;
        Thu, 17 Jul 2025 22:43:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2444sm496817b3a.25.2025.07.17.22.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 22:43:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/4] clang: Default to use lld if ld-is-lld is in DISTRO_FEATURES
Date: Thu, 17 Jul 2025 22:43:05 -0700
Message-ID: <20250718054306.1997726-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718054306.1997726-1-raj.khem@gmail.com>
References: <20250718054306.1997726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 05:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220574

This ensures that default system linker is used correctly based upon
distro features, current default remain same i.e. uses BFD linker

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index ed6e2d7da7f..1210ca92de1 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -54,6 +54,7 @@ def get_clang_target_arch(bb, d):
     return get_clang_arch(bb, d, 'TARGET_ARCH')
 
 PACKAGECONFIG_CLANG_COMMON = "build-id eh libedit rtti shared-libs libclang-python \
+                              ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'lld', '', d)} \
                               ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
                               "
 

