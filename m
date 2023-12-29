Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF20EC47077
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:55 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.144934.1703850292280701013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SF00D0ks;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33678156e27so6227371f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850290; x=1704455090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWXcZi1Yhm4oBGEVf60zBZeruGnNOEk38yUflcbOkKY=;
        b=SF00D0ks0QTRrxvjz9ZqJzQNFyFDRcnBTdF6dv0PGnAEjtF5Je/q/j3XUOqXJrVfRH
         AR4TjI3JvJHbK4o1z+IbRF13OPkVxwFB436UuyxzMXTAi6DQin+tS0KxjvK3Ge5m2VNG
         8NiIk7/2xmlaeR5PR3KGJFuq070+XmGCt06pPQ1lf2kQWqyHN9e/glCS168Q5b2tFUwK
         BMWGQCHKRRoN4GtpJnJtqQhfzHDBrRl/r5fjlYmWeiHXgwtYD/ab0hsIruv798/c76UB
         FNG1Evqt1cNK5Y5T4p32GLbYyczku+F9xLi8QU1MA4IQCM3eyEfARmdFKeeUyzMTTX8j
         fJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850290; x=1704455090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWXcZi1Yhm4oBGEVf60zBZeruGnNOEk38yUflcbOkKY=;
        b=AfqkM4KhfBR7rIRNF4CdKFD05p/2RZjUwpdus7C3gpbS4o1fuUG2xhbXVR/kGJXZ99
         jP3ODoi6OR3Mu3ckvM6RVewh1ri/eqEyElCeFqkwyU0d6VfEYLAxHmIhXUYl8qA3xOIh
         JDeud5fkyyZB4r7VbFIby4Drflxx9WYoEj5zQk5lOe1rFamnlJfME87XdJ78NND/Hoau
         JdhS6LXQ/qMTS9kBjDkFwdEEqhdjdjpQj+frq6Xro+n8l6H0Cvh1LWYcVcIkanP3g0ru
         2NdypyvEJniCqFJUcXR93jNdxCDr/6CNFhcspTqJy+EQ3l99llUEf67mfb9Fis0H+6pi
         OBXQ==
X-Gm-Message-State: AOJu0YxkvbeVmJiSOeqQ929d4BW0bgq6M00g/QRak8j3/uGbu82nIMS9
	gU6St+JaZffGbt0921b6HZ3ZopABlUs=
X-Google-Smtp-Source: AGHT+IGlgbu3FgkRegyGz94LUgkOJOlSFKWcfQ+qREUnv4rX1mSuOuHGpEnC5jnB1y3XTHYGtkoUmQ==
X-Received: by 2002:a05:6000:78b:b0:336:e6f8:6393 with SMTP id bu11-20020a056000078b00b00336e6f86393mr3271199wrb.118.1703850289920;
        Fri, 29 Dec 2023 03:44:49 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:49 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 07/10] rust: Upgrade 1.72.0 -> 1.72.1
Date: Fri, 29 Dec 2023 11:44:32 +0000
Message-Id: <20231229114435.27810-8-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193009

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


