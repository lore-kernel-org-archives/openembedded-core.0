Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA85C46CD3
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:45:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.144492.1703850296221578020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NEe9E9yd;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40d5d898162so18541425e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850294; x=1704455094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1vnw1pC9aGYfuvw5F07Nfg3jYVwx2EcxD5Vd4ylKTM=;
        b=NEe9E9yd6lIMphJ+woBih9sD5p4qAvfOyXxJ1M1QoMadIh7wY3VKkhbDWxqZfaGkVN
         TPew7IPsSi/RK/vVZcOBlztEZnGHXtO0dNcVYk84myEByeUixOtSJ4SXoZrh/MXDh9QO
         3XdZyzSRH1177oblh82vtLac2q9T7JrtZX8cRoCjfc35Js1tchTK3J8Y3bYq4Gvz1Btu
         Ty9P2Sl+zpbNL/jb2n4QwiuIuFQZ1727nLVRjNGkL4tVsDOgdVRm9+AUNaAaapE96H9p
         hsH/Dk6vag/MR4bhTTP+rUzEn5+Hp82CCmUT9rcBccs7XBaCyk+N+97oCBQfS9LeLBxx
         zUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850294; x=1704455094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1vnw1pC9aGYfuvw5F07Nfg3jYVwx2EcxD5Vd4ylKTM=;
        b=CpU732OGcW8SbQyOwq5U6jSTupSP0JJeDJX83K1Mqj6a5YcNms1zSLDQ4o5ImjDTTp
         rju5clgaV0mNmjNCVY7wyOFT5ILK7t7HF1LpoksGBcPanMhwXQxzweu7qC9kzvrWzE/q
         NFVxR0rTTVuZlnZC2EUSUCLx3A5wJW8cFYmxQZOybbAtJ0QjEO6bnE/xRa2JObYcYZFm
         AdTRE6/Zf38FVSUrfGKbaWDDqfgnMjXtzBmqnDkUOO00r40U6MEv9RWvzBf0DqbS6jk1
         +BjIHmcIKcW3nmnsLqqiuG2d5TjsVE2GEyvVW1CGxNTcE7BE3Z56rUlCf/SfIBoT0siO
         2BIg==
X-Gm-Message-State: AOJu0Yx2nGYT9DEDyZ3t+6qVubeaBlD2Lp/7fZINrGEf1e41z8B5dLlF
	s2QwJ30Qd8VeZVqQUUyblUtYQs/9ff8=
X-Google-Smtp-Source: AGHT+IE0lewkOUty1dIbLhx1KY2wTLwS9MsNDliLIXgefMF6VRBZaXxuMjiausD5P27vSU5f3HKeJw==
X-Received: by 2002:a05:600c:538f:b0:40c:78c:f2b0 with SMTP id hg15-20020a05600c538f00b0040c078cf2b0mr7693798wmb.2.1703850293906;
        Fri, 29 Dec 2023 03:44:53 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:53 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 10/10] rust: Upgrade 1.74.0 -> 1.74.1
Date: Fri, 29 Dec 2023 11:44:35 +0000
Message-Id: <20231229114435.27810-11-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193012

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


