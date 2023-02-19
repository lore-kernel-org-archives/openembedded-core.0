Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CBDC6FD1A
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.3924.1676835070392210202
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JtNnB0sT;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id j41-20020a05600c1c2900b003e1e754657aso867599wms.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVahjtHH6Za2b8moF4vQwBVToli+Vm0SkwzoZuzjCmY=;
        b=JtNnB0sTAD15zAiyHUh+NLMjW4tnD/aRVnx4FRQqror5MPu5YpAcs1orqj1pS5xwRz
         3DqRXglY2aFawfFUJ/wnaS63LKh7j2z3QvK0MzTV9hZQrabpQYZri4EWr2cEu0xiqJPX
         sy87zLseNY/gQNHzhDUcrOCteU9+kBLOmJ0qFYk/fKH3CMeTe8t95TRrWTI9RSlR0ufM
         bMbHycGkRk5ZUC2ggXWawAx5dHlFhUqjwcfiM75biUyzDX3qadD5nWgelZOBQ7U66ZMi
         Ee8ipcJ1IVRUWdyhTp0fx2vywt9+rwB4CRbu7HQJd2+T3C/OrSkPF3YAl1uAkHHTLI8q
         ieSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVahjtHH6Za2b8moF4vQwBVToli+Vm0SkwzoZuzjCmY=;
        b=gGsZrGAGgkdTBXPnmlbYftmQuOR13ISlVzm+9JeVyStMTUdQd/kVO8cYUj6dtKqkH3
         k09FINtwWVJKsMz5Xi30T8YJkO1S1Qiy2TR+rPCK0KHKYP5AlLHMYi/cNtnPDjaK83qU
         bV4XWLtIulfNZc1juGS473iUuD0rGfyvX/VX3SVJz8R0ORy36PZzT7SOoVlgUiPbFuGy
         w9DqcASChscwLpeRFot3fMCtTMr44YgMsgNC+IX5FAT8symtwphxX0uz327kGiqiX2Ua
         OKXsRc0d0e6AQuwNDPWtF5oEuWLGPDv3NOOHBrN6Qzm6+2taFDMGW2t0KsVYF9zMOsbj
         MQAg==
X-Gm-Message-State: AO0yUKWvfQTOFkRmD/tdKGqyXQhf9Yv4YUT9MyhFAx2iJLmThz7s1tLH
	jI1WFhWbyIFy4OESu/0YQ8Roj9y07UY=
X-Google-Smtp-Source: AK7set/QJlF0ueiCEa8XMJkmUhmq3vgCV4dMTeK/5oRfWJrn86jH7q0m+AwzfS39ycx50H8cAtx9sA==
X-Received: by 2002:a05:600c:331c:b0:3dc:4548:abe6 with SMTP id q28-20020a05600c331c00b003dc4548abe6mr5313548wmp.12.1676835068765;
        Sun, 19 Feb 2023 11:31:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/39] rust: update 1.67.0 -> 1.67.1
Date: Sun, 19 Feb 2023 20:30:29 +0100
Message-Id: <20230219193101.338397-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177350

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/rust/{cargo_1.67.0.bb => cargo_1.67.1.bb} | 0
 .../rust/{libstd-rs_1.67.0.bb => libstd-rs_1.67.1.bb}           | 0
 ...t-cross-canadian_1.67.0.bb => rust-cross-canadian_1.67.1.bb} | 0
 .../rust/{rust-llvm_1.67.0.bb => rust-llvm_1.67.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.67.0.bb => rust_1.67.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.67.0.bb => cargo_1.67.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.67.0.bb => libstd-rs_1.67.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.67.0.bb => rust-cross-canadian_1.67.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.67.0.bb => rust-llvm_1.67.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.67.0.bb => rust_1.67.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.67.0.bb b/meta/recipes-devtools/rust/cargo_1.67.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.67.0.bb
rename to meta/recipes-devtools/rust/cargo_1.67.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.67.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.67.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.67.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.67.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.67.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.67.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.67.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.67.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.67.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.67.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.67.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 268e17bcf8..942978e6bf 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "9ef8cf88a1d35d319808daf2f193aadca9ed9bcae1d4d5db8946a448c9432c6d"
+SRC_URI[rust.sha256sum] = "77e0615011f887d9533d5374bf9c15c590c3caf32bbb035b392d1c2ae502a682"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.67.0.bb b/meta/recipes-devtools/rust/rust_1.67.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.67.0.bb
rename to meta/recipes-devtools/rust/rust_1.67.1.bb
-- 
2.30.2


