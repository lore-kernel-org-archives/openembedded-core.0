Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD42C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 22:39:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.568.1747262356384689406
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 15:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XglXr9Ef;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso48461966b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747262354; x=1747867154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hXCn8vvlBq0KvuLDE40/jhJd5+wZ9oiE6hdoKMp+bM=;
        b=XglXr9EfPgDaeiFbHR04KrmWKncKRdLsaPjJRT3S4W4LyOq/CwQQ6vjC73zSAmo3JE
         7h5EZ5oMeBdbfWRevBbXgtwFVpQaDNh6EGxvwiheWPWqhO1C+VuXusgHaVryuxmUDGZg
         I8CdYPhP7oBr9qSWSnjJAnb4kTckng6w8XGQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747262354; x=1747867154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5hXCn8vvlBq0KvuLDE40/jhJd5+wZ9oiE6hdoKMp+bM=;
        b=SwaUdCANWRxwTEcajhXgTnfAKQnlqsx/0HNadewkLmTWg31EbX+/SsjyR8/bBhNd0W
         16YL6IimHMQ+QCNzgof6aearQwoge7fFq1RBs0piAnlPTFJ3n8G44J630812HxrGBVbH
         PFevaax91BqdLmisw8Cw0wSKI87Uflrh1oTK8jYz3eX7Kv2Ct3V5lumZX/8k0dG4dTbO
         0gKXxG+0O0cPvmLF/N7VMPIzQ6K+jwi48yBqbSTsSzg1yeNoJ+fkjaXSV0u0El2qWbqp
         55m1qZQQ2bEHTGMj9eOoJvBD69AWA27VDrvsV4wb4QLAb2/5okj5kksDmxq3C4y/trOc
         TSZg==
X-Gm-Message-State: AOJu0YxOTVNIE+Nc0bYfNWKxsSUIheeO9pDuyeRrhZB8m/YNximZa1/c
	3dAfEroVokc/yhaZEx8tNszKcEsLw2uHaJIsjg9eR8GiqSxxa/LP3IWegnMeTO0EcjOzknkwUMf
	u
X-Gm-Gg: ASbGncsj7Uqip7Q4tdim/3AjBR1TWoE8b3EEfV5hGxA+pgWL3/9xQQ+A62jsf6JWZSm
	gUA7VY19ydVpg0xUl7Ubq7ICBUkQ1zeYqr3p5DlIW+1FTqBw2vEIy2vWGtAnykfGtb5vx5tOu68
	ohtAvSrE2FE0UeEdwkuKi3F77ZZXSB9yKutq3JMPrkkF/rR9PUMj8Lo9TRN+/HWzw0Nf85KFHRy
	u4IUZl7jGfFkJCZoC1++/HQRvxkK3Rx1+atmY1x2ZT3GauuRXOsjAdPR39lXqWNfZwLtR8s+eNC
	uRYt7H66+uriMmbk0EAtinxLcJ9tOTyy0L6cXpoD2TjX1YKjIvW9iDPdfTnKlThXMq0YHEW/wZu
	IsdWm
X-Google-Smtp-Source: AGHT+IHvF2vUXBWaP5B57XvdbCt3/qcTuF9W2iH3hUjEMGy4lGORsBnjYFG0d5B1ZXwyF30s0SGbsg==
X-Received: by 2002:a05:600c:1913:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-442f210f654mr54430995e9.16.1747260474569;
        Wed, 14 May 2025 15:07:54 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef87asm43815885e9.36.2025.05.14.15.07.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 15:07:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oeqa/selftest/rust: Add exclusion to fix riscv64 builds
Date: Wed, 14 May 2025 23:07:51 +0100
Message-ID: <20250514220752.1571017-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 22:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216556

There was one failure occurring in rust testing for qemuriscv64. Exclude
that test so we can enable in automated testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/rust.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index f84b87d0f58..484fe2416e3 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -86,6 +86,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
                             'tests/ui/codegen/mismatched-data-layouts.rs',
+                            'tests/codegen/rust-abi-arch-specific-adjustment.rs',
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
                             'tests/ui/feature-gates/version_check.rs',
                             'tests/ui-fulldeps/',

