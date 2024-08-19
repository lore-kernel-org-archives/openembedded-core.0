Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3F7C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 10:13:16 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.207172.1724062390483811662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 03:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EMubCzEl;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f3bfcc2727so10507261fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 03:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724062388; x=1724667188; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4TiiSISJpQcfxXGiCv2OpXl12Ah6bgGjTLvqx/lh2nU=;
        b=EMubCzElDmgx3N9XDcgRkRNlL0BsIvFUM45dt6AigRBPguVE8kudICFJAu007NNIzZ
         gBwntXTNqNSeEvRUPuppW5wRv0wihE/zb6o/TlAVdXthUVdDU65AXtAb1W7gcFcSVX39
         hNeaQCZhn4nMZFjrdJeklyLdXS67k3f+Vq1BM5FV//IBnV7LcDXXmKPDqi6rE9eiOsus
         Cn+IMG8asah70JPmiZFj+HiQhBTAz6p0DA7UST0t8RYsY3x0PswSflhv7Ff+S01UtpAW
         sXNDPvLdvQ5oZuLkL9t6SYhE8LzwK9UTRUsyhKutL4j9CFGPkyy87k7Olg3PF7aNxJaO
         Ht0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724062388; x=1724667188;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4TiiSISJpQcfxXGiCv2OpXl12Ah6bgGjTLvqx/lh2nU=;
        b=NsPNreg3mEqm0z0/Y90KP2C1ZB44lHIIt3QSHsaIv5DNCxwa9rgXQpOFjBQd+0zrWK
         +puc91Xs+ncX7NwD34aFo944nVO1rKwrmAAEsevpIeT3CiHNnFRzIUduB0LhOUXS3cBb
         kjYIiO4fZQbbyS1dKoFk0kgMcaGQb762tyZqFI5lon3RpXCYjWe6mjizTrI/vBrVs2v8
         1sLdvmueuru6ow7cmhXWbv5TNDY3J6UEY+DMYCmqNC1Vnv0gmpLQomd9fdrQWihAnACY
         TdAonAUaIjj8BwCJBWShqrRMXmjwRoJiN1QX5rCAn+tV+Jv1hxNY2ljeCpqW2C+hfM1E
         ghiA==
X-Gm-Message-State: AOJu0Yzzn09OqruvJa48tlaPKWhcHUMmLtS+OxkIoOQTNc0R0QPqbJ6K
	4vaZ10Y7XlejACZBpti7h7bNXHVjVsGZVrI7e+ElNGYyKiO+64c8hMZcBagoeRGzMGnNENOE8O5
	T4HL4VifdwTRbqMVvII1Jc/aGaao=
X-Google-Smtp-Source: AGHT+IFRrMiRbpUDqe7KWvXweZakh230hBBuQJwq1D4K58HD181LOEu3MBWfrno8++FxNY5MLvSqKaq2Ihkbxb794Mw=
X-Received: by 2002:a05:6512:684:b0:52f:cd03:a84a with SMTP id
 2adb3069b0e04-5331c6dbd0fmr8419548e87.39.1724062387491; Mon, 19 Aug 2024
 03:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240819095638.29008-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20240819095638.29008-1-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 19 Aug 2024 12:12:55 +0200
Message-ID: <CANNYZj-mmymrOWgT2c_4Jm+SuiWp=Q6TBhUXHvob0aMgGgYrkw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] rust: rustdoc reproducibility issue fix
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 10:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203500

As this is fixing reproducibility, should it also remove rust from
reproducibility exceptions at the same time?

Alex

On Mon, 19 Aug 2024 at 11:57, deepesh.varatharajan via
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
> View/Reply Online (#203498): https://lists.openembedded.org/g/openembedded-core/message/203498
> Mute This Topic: https://lists.openembedded.org/mt/107977579/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

