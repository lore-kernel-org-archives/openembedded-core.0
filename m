Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0C2C46CA3
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:04:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.36289.1702044248617567745
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C0KrtK+K;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c0e7b8a9bso28240195e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 06:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702044246; x=1702649046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CPELHz3rh6kC1CtYyCllvS66Q5frhVMdzFHBewzIXc=;
        b=C0KrtK+KMl5asVGx17tlAJdtNmpPLnvu/ZdiuoBV8xR+EEONOkNbUNcOK/5QKw/AxD
         Ooit7t9bzaZVsKqqAy8SSCu2jXZDRu8Vni2XFlvatdWJtZ9gG+1TPOadAfL+Y946lqJE
         KLzvSjUG8DkmwvWvTY8a4+ffD69u39CD+AvXaJEjAqm78IPZeNsKGthIwKAtDXLRNZoU
         RZpIO7pYicVLyhJNLNPn7+D6/sYyc4jMkMxb/vwCgmh5GsEubKUwwCsGWum05cW7X3lq
         N10qPDXhd3ZNNR+mp8Z93rhjlfhGFNgpUy0R21fOkVrtRe0DOCS3Z8jC0N72VJ3Yi5OI
         J3XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702044246; x=1702649046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CPELHz3rh6kC1CtYyCllvS66Q5frhVMdzFHBewzIXc=;
        b=v4bepb0vuIjw98beQImhwboDLCQTRzBqVN+tkXegKEM0MtTy9kHW96NORGzMga99ro
         69DbB0TlvTvny3JDJLMBLq9QInzGofuMs5hm/fJvQMwbAtcWXY/NOxhFmkRPffQEsBO/
         nzfZ06vkVqUkbv5m/cWbIN6DYC+xRGw2gB0FbZodEfu9waR/rvedKzNrrTVV6p6BIq6Q
         Eg7+An/ml8DKTd01VfxsuxF+SVrBLyscXcBJkBW5qCSPWpZwAavdPS8Zab7lL+9QzvgI
         r0CkJxUip4g7jSHUPNNeHYnNRoYjt/sZS0PlNUj+Gx6INjlMH6SHYfhuWB34DvCUPFst
         jCWA==
X-Gm-Message-State: AOJu0Yw5PXKnJ+M82OEOhz9btKASUfc+XNbAvUgCertudGOkKaUqiXc4
	ZTU3+NFrCj4h8e+vSrbPpe4I8CheDQw=
X-Google-Smtp-Source: AGHT+IEwjby/nthYPeKp6dh1XIhJ6g2Ku7avxuGkO4xTT3QHUGWL4AAp7pvdFABsD9HOM+/vzYHxpQ==
X-Received: by 2002:a05:600c:3589:b0:40c:326b:ecee with SMTP id p9-20020a05600c358900b0040c326beceemr17933wmq.30.1702044246094;
        Fri, 08 Dec 2023 06:04:06 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:f8f3:2d97:de04:e800])
        by smtp.gmail.com with ESMTPSA id s12-20020a05600c45cc00b0040b3632e993sm5223722wmo.46.2023.12.08.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 06:04:05 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 5/7] rust: Upgrade 1.72.0 -> 1.72.1
Date: Fri,  8 Dec 2023 14:03:47 +0000
Message-Id: <20231208140349.3576-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231208140349.3576-1-alex.kiernan@gmail.com>
References: <20231208140349.3576-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192066

https://blog.rust-lang.org/2023/09/19/Rust-1.72.1.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

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
index 8860d116c872..61340f817446 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,7 +6,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
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


