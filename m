Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A160CC4707C
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 14:59:49 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.124389.1703775589032136604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 06:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ljsalsWs;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d5aa35b60so20035785e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 06:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703775587; x=1704380387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWXcZi1Yhm4oBGEVf60zBZeruGnNOEk38yUflcbOkKY=;
        b=ljsalsWsNECvJleQP4PPbgBLFWZUNGFbdIyN/BX4ZPagcYkZgQtXh+D/H5YDaid2PG
         2vkG5RA1EtGUoZ+qO3vlfpNfb7XcWHcQImxoOlFZh4gvwtNCofXPdvPJYHMDohO5rSeJ
         kFaISSxSNgwR6coqDvS3kz2QpD363zPGjW3NRVtcVI5TxvnXtNmbBLU/7ZnbGou98HBS
         SNK2cJD8VLZx0+7gM9rghPrNxC2EqSwp8uu8FF+hzNWUOSYSw0DQo2LxvSRRNYdaUhjy
         /im6MMdZG+cupMtawbxFY5gKjHavX9E6qqx01VK4R8/wk3wnwWC2hRzGLLaHLRbbT12v
         a6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703775587; x=1704380387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWXcZi1Yhm4oBGEVf60zBZeruGnNOEk38yUflcbOkKY=;
        b=tCzNlyW+LL78oCgwQpOeuGSjveRAS5rQuUhfGe+YhZadCI1jSwt+oQNYpU3XnLbHv8
         9YCv5HDiHlgzjA1vCyaTyRTvGfhcCF2JxHanX3Y0Kk0GaJa5qcfAM7C9HlFdkjzeC2HY
         VDwI4bXsABkAtil1w/daWfj+fWTIgyVcIujdr8o0h0EmNQMrBMSfqq97d4YfAc4cJ22w
         q+WlV91F33JjO+fWjLnnVIt09pnd4ihb2HW8Sls5Bv6SjXYL0K0P9r+7o53UEQ9sNdB4
         WDSLTZZpMgkn9niCje/YueV4K5YjeCWbELDQXLbMCzgc9fbYY6G+8RPi1vX8xL5eUqEM
         G8qQ==
X-Gm-Message-State: AOJu0Yw+BS6m/YvdMP+RDAMeSB+1Iu8mLmygWOO+Xy2zvlDn2riiG3kn
	Q2oZ0tzKFvWbbQECs3enz7bTH6f3gGA=
X-Google-Smtp-Source: AGHT+IFg4B8Lf+M+JZK5MNgS1tSi/2naSPG1HML0EPXwXdlEkEkdSUMp9nNPdeY/SCsEN4v7N9CWtQ==
X-Received: by 2002:a05:600c:a3a8:b0:40d:4e28:76bd with SMTP id hn40-20020a05600ca3a800b0040d4e2876bdmr2626054wmb.216.1703775586755;
        Thu, 28 Dec 2023 06:59:46 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0a4c00b0040d6ffae526sm1461523wmq.39.2023.12.28.06.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Dec 2023 06:59:46 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v3 07/10] rust: Upgrade 1.72.0 -> 1.72.1
Date: Thu, 28 Dec 2023 14:59:14 +0000
Message-Id: <20231228145917.18147-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231228145917.18147-1-alex.kiernan@gmail.com>
References: <20231228145917.18147-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 14:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192988

https://blog.rust-lang.org/2023/09/19/Rust-1.72.1.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/recipes-devtools/rust/{cargo_1.72.0.bb => cargo_1.72.1.bb} | 0
 .../rust/{libstd-rs_1.72.0.bb => libstd-rs_1.72.1.bb}           | 0
 ...t-cross-canadian_1.72.0.bb => rust-cross-canadian_1.72.1.bb} | 0
 .../rust/{rust-llvm_1.72.0.bb => rust-llvm_1.72.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.72.0.bb => rust_1.72.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.72.0.bb => cargo_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.72.0.bb => libstd-rs_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.72.0.bb => rust-cross-canadian_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.72.0.bb => rust-llvm_1.72.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.72.0.bb => rust_1.72.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.72.0.bb b/meta/recipes-devtools/rust/cargo_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.72.0.bb
rename to meta/recipes-devtools/rust/cargo_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.72.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.72.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.72.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.72.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.72.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.72.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.72.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 253a8436d2a7..ca3fcf9e884d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "d307441f8ee78a7e94f72cb5c81383822f13027f79e67a5551bfd2c2d2db3014"
+SRC_URI[rust.sha256sum] = "aea58d962ff1c19521b9f587aad88285f0fd35b6b6738b031a7a15bb1b70a7c3"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.72.0.bb b/meta/recipes-devtools/rust/rust_1.72.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.72.0.bb
rename to meta/recipes-devtools/rust/rust_1.72.1.bb
-- 
2.39.0


