Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D47C47077
	for <webhook@archiver.kernel.org>; Wed, 27 Dec 2023 18:42:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.107174.1703702517557684286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Dec 2023 10:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WLfQ/riM;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40d5095834aso34487805e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 10:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703702515; x=1704307315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWXcZi1Yhm4oBGEVf60zBZeruGnNOEk38yUflcbOkKY=;
        b=WLfQ/riM0scoDJi/u5CmcrML2PaPwWfY8UvlcU5USuJvQo80V4qC3tdHOU8ai3ZTUD
         h+etFb+HEzOJUERHbyjVrTGsaGpADhVCoECmjB1UI8wIVq2zVznm7t79EvHIzA8WCKjl
         s/zap1hjiRvrL4CO2BHMCiDPXEyPXwcYce4/t051bazPpRa6SbYWRbaGODBWPu5aA7T9
         kDR0AEq7crx3Bstg3ZDRxEwj9hJ1ubmeHfuxBCNgsBC5oVO9+g6UAhtjsrUmJTyjjuDE
         6UsyNo/pYbbcQbd9RRY4ffJfMfynIBhpj/A6+UpnqeUhHHf9Ei6wgS8q379z4ttPluXY
         1nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703702515; x=1704307315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWXcZi1Yhm4oBGEVf60zBZeruGnNOEk38yUflcbOkKY=;
        b=ZSuMkoMx80v+lm8sEpyYpMTozn8UrQMFWvRGKNeGMck3qoZxgdEdL2L7rC9Qw4LESd
         8qcC6/p9+ot5oe/otRrBZ9WV0Z29t0E4E/Gf+4xD1fpWv+pOVlUJGRNn8buHSkNVUCyd
         RzLNivC8uX+pcFQumHg+jx9XlHa3MXc0nt6DFWhYGqm47DLU2oQy3ZXU8OeYwFdkPdFm
         XZ9vcHO2UV042dxoBpBchxkhFzAldyZWb+DpI89nJM3hOjfjNtbnLvKgPUD/TgtCYXnw
         4/uFh+D08icHtjYDOgnMF42LRg66nmC+acRQlzoxR/Xlukd+DgePhnLnAKTHZY/Vdc1g
         vpYw==
X-Gm-Message-State: AOJu0Yw2ZoMY/ntZWrJe+Ih8UpfmgD8oxg9zfKRhj8mBavUOEp/e1CeX
	pvIXAtkkKe49hHP2i7tb40Pz4SBRg+M=
X-Google-Smtp-Source: AGHT+IEBjXsDto3WQA75rRpPuWR+feP7Oq95mZzywQFjfEPSmwUv+5RB2sKWYjFRjAdhWAsGN8mUnw==
X-Received: by 2002:a05:600c:358c:b0:40d:5165:1c87 with SMTP id p12-20020a05600c358c00b0040d51651c87mr2088308wmq.4.1703702515614;
        Wed, 27 Dec 2023 10:41:55 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id je17-20020a05600c1f9100b0040d1450ca7esm32680977wmb.7.2023.12.27.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 10:41:55 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2 5/8] rust: Upgrade 1.72.0 -> 1.72.1
Date: Wed, 27 Dec 2023 18:41:45 +0000
Message-Id: <20231227184148.4374-6-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231227184148.4374-1-alex.kiernan@gmail.com>
References: <20231227184148.4374-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Dec 2023 18:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192961

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


