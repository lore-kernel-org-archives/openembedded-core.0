Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E596AC4706F
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:42:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.107851.1703702521677172111
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ab6hCKj9;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3364c9ff8e1so3620491f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702519; x=1704307319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1C9d6OymCy9aVAd/EYrrUpKt5SqMIo4e2hv2ghlJppM=;
        b=ab6hCKj91jACJAHvbrwkCGdZQ7dF4a+aohfoxJ7B3RzU4X3oU0kBH4XlwPwDXMXDZ/
         7gOmMep+5WMMMkzflg+u9P1AKpGP7FOsNZusV1Fdhs/AyWdAIeFHUL1yHSgdO6UTLEF2
         zukICYHXNLmuwABViNwYg2T7lVVQx1IiHB2Pz6brqnUQQ6pH8cY7jIIMmfXJRmEjeGXS
         inMYLyz2AvFj5WZ/SRdt2BVSjv10UPM4z+duIqq/3rpx3AdpLXiOv4c8Rr4FB1atKOJm
         6JEwDOWrUjqsN8HrjfkMOHpzHCPeB4l/cHMpCNTR8SWIp41pr4Pn3kZqKmWcgmZyolHN
         8GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702519; x=1704307319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1C9d6OymCy9aVAd/EYrrUpKt5SqMIo4e2hv2ghlJppM=;
        b=A+oo3KVXmbCfOdGiE47f3aDIFudddB5u7RWGceVxpuH/I/R8OE4HFFUZZbgh9o+b9k
         xg0BoZhPcWh4PfNvMYaOK2TfZCo9GkIgQGlFGsjpQk3g7xn1ft//W445ccPupVKjsJW5
         9BJ3qQ91PG8ARcU/2nNKFLpKSg9S3g4qu9Rj1fOxXsNJAc6hNanV35xgQ8FHY+KWLJTJ
         3H6Ll+XfOeVavxwic/p8B3pm59Dalkq+p/1vrp4vrGRa5/0H5ClSM0LAvr0iaGhRIZdd
         DKNErRjhHS1dgEQ0TQCVdWLdh0Q3HwDcwvRc48ZhqdOfq2lgNwW+ozSItB63y1jqa6/L
         73Ag==
X-Gm-Message-State: AOJu0YzLTxliAleooK10N7QSqNwSZs9vNPTl4wTzs7fOqFGpkJijezRk
	pL2asN9k03F/JIOlB0FPP1kG8xPjdFE=
X-Google-Smtp-Source: AGHT+IH5h7o/aF4qOKteQPt97Fu4Hz8t40juZYJ6wuOMlY65ahjlEpM8ZbKA8rutaqMVBe+gQ/8mXg==
X-Received: by 2002:a05:600c:2807:b0:40c:2a82:3e04 with SMTP id m7-20020a05600c280700b0040c2a823e04mr4310421wmb.52.1703702519080;
        Wed, 27 Dec 2023 10:41:59 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm32680977wmb.7.2023.12.27.10.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 10:41:58 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 8/8] rust: Upgrade 1.74.0 -> 1.74.1
Date: Wed, 27 Dec 2023 18:41:48 +0000
Message-Id: <20231227184148.4374-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231227184148.4374-1-alex.kiernan@gmail.com>
References: <20231227184148.4374-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192964

https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- Skip zvariant based test rather than deleting it.

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


