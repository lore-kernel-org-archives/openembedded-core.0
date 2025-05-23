Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6101C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:56 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.41006.1747972371336199323
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VwexMCZv;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231f6af929eso72125155ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972371; x=1748577171; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6BD0804prU/ogvhdUFE4LZNWLps+rcl77/1l18y1aI=;
        b=VwexMCZvILdCejJmRoAV+RTy8/QektoO7RVvMgz1uoQQ6R9r5kfPDLPUNcUZ/qZJdW
         KqbJLwn3cqu5EllgZG892q3XnjB4QVDExj7uG4rH/lKAZw3mdpxCabcqwKnlxKcr/dwA
         XjrdSfVkPuQNBJt1CMXQoszjYA9t9TzzzXIt6Zi/aut1WW2kVUSSfehyzKdIHkneasEk
         22JGL/MjTdqqBTSfkh8swx9EhEsX94Q9ns/HdyJJwZ74HFTgkoD6fj7LWnXW8mMhd4GI
         +vA9q79tHKnFYWuOvsPtzACFJS9pOqPzTrXkv/3hfw7DusbG4D6n1MYvLhw/+xAarG1Q
         iJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972371; x=1748577171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6BD0804prU/ogvhdUFE4LZNWLps+rcl77/1l18y1aI=;
        b=j4+3fXkpi4XQUPzPwfwgOZrG/gkICCx9Ug90gtlWpEuyNBum9olMs0MUv6lfPdUrmx
         Y2TI2zGPkKo2rLzi3lnSoz8LtUw83UN5fd3A0o2ng4RFhoPEQoW3LI28AQcZ4fg+Hsz8
         RyXeycnIXzlZq/SKUXFiAmCk/npp2p/bMTYgz1crxQ18x8ZRg/8Ad8hpF7/UwzWWsX66
         a0ltFqomDEcLz/O31CxTWDHjoqS+a75p++zgp2wIklLIMgvLlncbRZDptEdkbo2OY0iQ
         fr1bQeHItXUW9/Gyto5xBFot2i10mx3PnAUk/djXcdJ5coEvaChHGYcZLDY8ayhJejRz
         MyhQ==
X-Gm-Message-State: AOJu0YztJPb8rdaQmXpBn9XI1xxbzNlYwN3ub+KmnFQDdPxtxROIlZDh
	vxtxjH41ZBEP7S55o6wll6RjR4r+YFcXex03poBbrw4j4r2larGxEcMPnZrfGMAv
X-Gm-Gg: ASbGncshnCiYx1xGl7Wce8r5lBkc42djMRu2+S+i1QLJP7mi/M7Hk933ebOLw5VU7tb
	brRa3iRc6HoInu78EzmwSbwsANjj5TsKde/UBs5dMZRxhMX6QlhCnTefeXQbeAj818HwRHWA6Df
	vTq/lAEvelauf4pGGwhp4R7e+iV+Riletg2jW669uwWxCpJH2vooVi7hp8IZ6J8ym/H4J4+9x+k
	cbn5P0PQdUanHLUbWD/V6yDCSX35atR0KbsOoVIF6IN8Yf489ZOjH92EY2iuU5RV17eiu9ZUfvI
	rAlsyuqKQ7F+WmkogcG7Ifo45VLVyIEW8fZxVP7vOL4=
X-Google-Smtp-Source: AGHT+IErzBvVec0dHW7FDUemw9NgSF2zEqyI1Rk6OwZNfjdDk9COsyTyAfaCwlpVB35PZJHw/XRD1Q==
X-Received: by 2002:a17:903:124b:b0:231:e331:b7db with SMTP id d9443c01a7336-233f23c9a8cmr24651575ad.38.1747972370743;
        Thu, 22 May 2025 20:52:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:42 -0700
Subject: [PATCH v3 08/13] vulkan-samples: Disable overriding-option as
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-8-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217168

Clang complains/warns about mixing -ffp-contract=fast and -ffp-model=precise
lower this to warning only, this does not impact code generation, we still
get the diagnostic messge but wont break the build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 554e6eb29022e763de755dd550464cbd986de61e..505b6ab2f2865fec26339c9f1c4aa10c6735355b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -33,4 +33,8 @@ EXTRA_OECMAKE += "-DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON"
 # This needs to be specified explicitly to avoid xcb/xlib dependencies
 EXTRA_OECMAKE += "-DVKB_WSI_SELECTION=D2D"
 
+# Clang is fussy about incompatible options on aarch64/x86_64
+# x86_64-poky-linux-clang++: error: overriding '-ffp-model=precise' option with '-ffp-contract=fast' [-Werror,-Woverriding-option]
+CXXFLAGS:append:toolchain-clang = " -Wno-error=overriding-option"
+
 COMPATIBLE_HOST = "(aarch64|x86_64).*-linux"

-- 
2.49.0


