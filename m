Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA454C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:59 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.124157.1703775593294771242
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hCu6iNAr;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d5b159497so22460495e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775591; x=1704380391; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vnw1pC9aGYfuvw5F07Nfg3jYVwx2EcxD5Vd4ylKTM=;
        b=hCu6iNArT8Ab9Yk3m+/8Stx7nAX7n8UTPC0R7NECTngbe/vajGJMyD0LajOD+XxZId
         U04mxYcSRvoW8EEzAoLJxoz5C+cjPWyS0CYWBvkjmYITXioguiZYEyEfYLw4w3RAnBS+
         ixTS1N9x2q+4EmMnkzxftu5rUtk2JTzp7vBbe811thG5ngWybSroM2myPuORb1wQAbHi
         eKFti9SVku5MlTVG6/TEe3YYJM5ixEGVPsNu/5+690mB3tf0oB0IT+jtcijlAAUc1+7Q
         /CYyP7QJibBQYtf1PNGou8wsuTl7REUJuNXO14KrE0wtnNCmEM/+KPhwPdDEPgCdZFRk
         r0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775591; x=1704380391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1vnw1pC9aGYfuvw5F07Nfg3jYVwx2EcxD5Vd4ylKTM=;
        b=I/zGBWOov3fW7AesCgWJk+dZCTyVDOF2gicjaqIGgst+gLrrCSXCTEuZ/YDL2Rkqxu
         D7L/2LXpcx+2e9NuMKrW6HP19gpfOYQHaNteHVX65VS0Sgd1QjjL7dOw8AIeIiN88bJ7
         HYgzWh6BBBRNc9l2pFoomLUBGUt0x8PV0UKKJs0ygYDXV6VPSI8kntm2OUcdKkvS/S8/
         4nAlO3+059Sdg3bEaNdsr+RM3gNDibT7PdjO7dkKGwHxiddt8im3lM2FNxQDz5RW0M1T
         ls82O0x8k0dUkfKM0qQO66YbWRHxmRyGzkdmmGbb8idyTHW9XA1k54P2n6eTsBmo9LMS
         4oAA==
X-Gm-Message-State: AOJu0YxWSVSMFN9PCmcYtPBkWCAmficjZA/oSkdeLuCRU8J2OnithKJt
	clrGCQqj5jj6LQ2MzCvbVBB1TKOAMm0=
X-Google-Smtp-Source: AGHT+IHm4YlIjLxr2qaBGRpbiXY7uiuOn9pnK0JrihZZXxUmv0NXlcfdYcU4TQ3fJAlHNWH7zE6unw==
X-Received: by 2002:a05:600c:198b:b0:40d:5f53:c547 with SMTP id t11-20020a05600c198b00b0040d5f53c547mr911945wmq.45.1703775590966;
        Thu, 28 Dec 2023 06:59:50 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040d6ffae526sm1461523wmq.39.2023.12.28.06.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:59:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 10/10] rust: Upgrade 1.74.0 -> 1.74.1
Date: Thu, 28 Dec 2023 14:59:17 +0000
Message-Id: <20231228145917.18147-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228145917.18147-1-alex.kiernan@gmail.com>
References: <20231228145917.18147-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192991

https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/{cargo_1.74.0.bb => cargo_1.74.1.bb} | 0
 .../rust/{libstd-rs_1.74.0.bb => libstd-rs_1.74.1.bb}           | 0
 ...t-cross-canadian_1.74.0.bb => rust-cross-canadian_1.74.1.bb} | 0
 .../rust/{rust-llvm_1.74.0.bb => rust-llvm_1.74.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.74.0.bb => rust_1.74.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.74.0.bb => cargo_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.74.0.bb => libstd-rs_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.74.0.bb => rust-cross-canadian_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.74.0.bb => rust-llvm_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.74.0.bb => rust_1.74.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.74.0.bb b/meta/recipes-devtools/rust/cargo_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.74.0.bb
rename to meta/recipes-devtools/rust/cargo_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.74.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.74.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.74.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.74.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.74.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.74.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index e8dafe59c9b0..83a0dbc15fae 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "23705e38c1a37acfd7fbb921c5dd8772619476e80d0b3b39ac8eb45bc0c33187"
+SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.74.0.bb b/meta/recipes-devtools/rust/rust_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.74.0.bb
rename to meta/recipes-devtools/rust/rust_1.74.1.bb
-- 
2.39.0


