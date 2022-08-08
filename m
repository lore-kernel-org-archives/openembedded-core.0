Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 342F1C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:46:19 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.26549.1659969975210752061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z+7P1t6J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id j7so11194217wrh.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=omB81dfU1QX2Of/Et39vaoHNnTld2nBtfm6ZX+oYIUE=;
        b=Z+7P1t6Jrll6E84BQIRT3T4Z6zCv3GGVcoxDMTGgPpfGyUliv2zI2PIxzmjxaGJJCf
         2zoDFBuXDGHpFxaE2aR06gx08XX2CBFrrH26hh2bh/snA38JwIekncsl2Ha9Zh01uffB
         yTkPYd6uZJOoDV0qgqxWf5sj7lc2BspXSNZPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=omB81dfU1QX2Of/Et39vaoHNnTld2nBtfm6ZX+oYIUE=;
        b=dCKrM3wPpb8W/wHFnr94tXxGP64ROO3QYZqaZHU4ZbbgqEhDXE7lYHxLSxK2Z15q8K
         DGh4Vae9nAZ3E7bWraSUezZozeqHtFXdDWDXW5mZjC93Qq2rgPzQfVO4Ykn98HHcivnf
         KFnKksbteV4+KDhQfmAkTIklz/m4iJtS6tLuKjE0Zds3XklA2WtKkFEcTdrKgrWESj9J
         LdkbWf+oC0OZeGlAvz5froJRyZlgRYYBrJfYHlds52QvnXa5utXPhSZczBGahD4UZULB
         l7y4Zxp12ZF+b9HqskyNsg4FuZ+cklfsgX3YKPMkMprn5rnGfXeOQctIl07TrjzROYMT
         G5Vw==
X-Gm-Message-State: ACgBeo3qGUGevrkTXDCP/TC9/rTVvfjgQB3pFarN69PMPHojB0SljxAf
	PnOuCqnQx5/GA+fDEzX6MrBDzUuhjU8s3g==
X-Google-Smtp-Source: 
 AA6agR7XPtmk24/pg4AkE7I6azAHrM3NuSFRUL8gVvcWndN5uXpzv1yjeRQ1ZPgZrQJCm2kGEq5daQ==
X-Received: by 2002:adf:f804:0:b0:21e:de03:b64f with SMTP id
 s4-20020adff804000000b0021ede03b64fmr10976722wrp.543.1659969973513;
        Mon, 08 Aug 2022 07:46:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 p13-20020a1c544d000000b003a3211112f8sm13900255wmi.46.2022.08.08.07.46.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:46:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] cargo: Work around host system library conflicts
Date: Mon,  8 Aug 2022 15:46:11 +0100
Message-Id: <20220808144611.59125-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220808144611.59125-1-richard.purdie@linuxfoundation.org>
References: <20220808144611.59125-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 14:46:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169092

cargo ends up running target-rust-ccld with LD_LIBRARY_PATH set to libdir but not
base_libdir which breaks the SDK. You see errors like:

/bin/sh: error while loading shared libraries: libncurses.so.5: cannot open shared object file: No such file or directory

On such a system, this would fail:

LD_LIBRARY_PATH="<path>/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/lib" cargo build

but this would work:

LD_LIBRARY_PATH="<path>/testimage-sdk/sysroots/x86_64-pokysdk-linux/usr/lib:<path>/testimage-sdk/sysroots/x86_64-pokysdk-linux/lib" cargo build

so wrap cargo with both paths in LD_LIBRARY_PATH.

The error depends on the versions of the host system, it reproduced on tumbleweed-ty-3.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/cargo/cargo.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/cargo/cargo.inc b/meta/recipes-devtools/cargo/cargo.inc
index e34554a9d78..636e9c4fe51 100644
--- a/meta/recipes-devtools/cargo/cargo.inc
+++ b/meta/recipes-devtools/cargo/cargo.inc
@@ -43,6 +43,14 @@ do_install () {
 	install -m 755 "${B}/target/${CARGO_TARGET_SUBDIR}/cargo" "${D}${bindir}"
 }
 
+do_install:append:class-nativesdk() {
+	# To quote the cargo docs, "Cargo also sets the dynamic library path when compiling
+	# and running binaries with commands like `cargo run` and `cargo test`". Sadly it
+	# sets to libdir but not base_libdir leading to symbol mismatches depending on the
+	# host OS. Fully set LD_LIBRARY_PATH to contain both to avoid this.
+	create_wrapper ${D}/${bindir}/cargo LD_LIBRARY_PATH=${libdir}:${base_libdir}
+}
+
 # Disabled due to incompatibility with libgit2 0.28.x (https://github.com/rust-lang/git2-rs/issues/458, https://bugs.gentoo.org/707746#c1)
 # as shipped by Yocto Dunfell.
 # According to https://github.com/rust-lang/git2-rs/issues/458#issuecomment-522567539, there are no compatibility guarantees between
-- 
2.34.1


