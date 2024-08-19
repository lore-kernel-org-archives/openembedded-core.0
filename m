Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1406C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 10:54:26 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.207890.1724064865656472446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 03:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DVQDaxVS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52f00ad303aso5431427e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 03:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724064864; x=1724669664; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aW0IDRNiLyEO9bTYZJhlEQeRqVgzG2leN2IoJMY/ut8=;
        b=DVQDaxVS6dUYeBn4Ig3qRV4YKSKqotVK/uiWrAJRdho3fI4qgSThhUAZvZ5Xv1PbtN
         AGg1sNvExUxSnSUMTwRMU519CKsR9rhb0970fe/1g9Q/w/HUF/4K5vI2IZBXoWp/h3IW
         HnA91Ltw3O22DBM1m12rNyXKRBl+XEKcnGHaa+Am91Ze1eXNRN5jhI7gXEOdxiOrQzo1
         E+Srakqgne9eqBdJ34Hl/FIQ4elG1yq8qvcOeEPdV1VctDnYr4LOZ0iaDAMq8JkF00HH
         l/y82RUGs4EesKUyKeqFT7MQcwnKY2LQ2QFrKSSNM38mB0ki+7Au3alMKW6pe2/b9fZE
         7fUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724064864; x=1724669664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aW0IDRNiLyEO9bTYZJhlEQeRqVgzG2leN2IoJMY/ut8=;
        b=T9WBfYQkiUub6NQQ7xfjQuXBbeAoNQxxXapo0jDNuGzYmhPbOXh62QSTVA4rINOTi6
         /QA7arfSDkkTlBC5jwtKjezcBB7Z0rJhqOvlBy+acerHT8XiVtSQQKN6Mbr+E/r+j7yw
         rTwGzeC9xAzkFFSBarjNzUADeyJqhhBikC2sHW8B4U9asGbAAmzilHJrCP452w2nn0Ql
         1CHd+5Be+P+3jQfEeFMIrpmlwqQv3V9VxOvEp9ClsaX5NJ3hraLFncGnBEdfggKSmwUD
         r/f6YvMPddv+YYys0o6JUd7xqbO3xlNQ44TZXRa+0ur4IGXQ7ZBwnd+SRx+seQl/hwXX
         6h0g==
X-Gm-Message-State: AOJu0YwmFahOHsp70kxQb1Ex5E7i/MNq9iVukbyb9mS/dofm0N3ftvU9
	PQi8OQMjOCxaJALWm0CcqXFuG9pMhwS+ueA2ndnOV7muy6pABUOKnqzOt6yvoulzur7uqq0kkN0
	/3RisoGzyfCu0AY7R8ncdXUTRsHoaYw==
X-Google-Smtp-Source: AGHT+IGmFc2eQ5Cy1Ad7Dj6MuJnRhZM2dVdRiu1keOmAuXmPOYUDABZjzhSzVbaKVMywwMS4MzudEKtq+0Vszm74AI8=
X-Received: by 2002:a05:6512:3b0b:b0:52c:e084:bb1e with SMTP id
 2adb3069b0e04-5331c6a16d6mr6671690e87.13.1724064862965; Mon, 19 Aug 2024
 03:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240819094701.27210-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20240819094701.27210-1-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 12:54:11 +0200
Message-ID: <CANNYZj9MxBgY-v=vDyhqMn_euNAtT7Am1EJN9Xc4s_7t=jD8qQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue fix
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:54:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203502

This is the same patch as the previous one, and doesn't address my comment.

Alex

On Mon, 19 Aug 2024 at 12:51, deepesh.varatharajan via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> The 'codegen-units' option split the crate into multiple compilation units for parallel compilation.
> Currently, this split is causing the rustdoc to generate differnt binary between the builds.
> To fix this the codegen-units & the lto options are disabled.
>
> More info about options:
> https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
> https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  ...ue-fix-cargo-config-for-codegenunits.patch | 29 +++++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |  1 +
>  meta/recipes-devtools/rust/rust_1.75.0.bb     |  1 +
>  3 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
>
> diff --git a/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
> new file mode 100644
> index 0000000000..fdb2a4a498
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch
> @@ -0,0 +1,29 @@
> +commit e2e7017350d0b5324811fef3b841f98b00273887
> +Author: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> +Date:   Fri Jul 26 06:35:59 2024 -0700
> +
> +    rust: rustdoc reproducibility issue fix
> +
> +    The 'codegen-units' option split the crate into multiple compilation units for parallel compilation.
> +    Currently, this split is causing the rustdoc to generate differnt binary between the builds.
> +    To fix this the codegen-units & the lto options are disabled.
> +
> +    More info about options:
> +    https://doc.rust-lang.org/cargo/reference/profiles.html#codegen-units
> +    https://doc.rust-lang.org/rustc/codegen-options/index.html#lto
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
> +---
> +--- a/.cargo/config.toml
> ++++ b/.cargo/config.toml
> +@@ -3,3 +3,7 @@
> +
> + [source.vendored-sources]
> + directory = "vendor"
> ++
> ++[profile.release]
> ++codegen-units = 1
> ++
> +
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index b14221b6cb..4ffc9faf18 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>              file://target-build-value.patch;patchdir=${RUSTSRC} \
>              file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
>              file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
> +           file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=${RUSTSRC} \
>  "
>  SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
>
> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-devtools/rust/rust_1.75.0.bb
> index c33f31d261..7cd34a61c3 100644
> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
> @@ -132,6 +132,7 @@ python do_configure() {
>      config.add_section("rust")
>      config.set("rust", "rpath", e(True))
>      config.set("rust", "remap-debuginfo", e(True))
> +    config.set("rust", "lto", "\"off\"")
>      config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
>
>      # Whether or not to optimize the compiler and standard library
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203501): https://lists.openembedded.org/g/openembedded-core/message/203501
> Mute This Topic: https://lists.openembedded.org/mt/107977579/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

