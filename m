Return-Path: <alex.kanavin@gmail.com>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28ED4CD5BB1
	for <webhook@archiver.kernel.org>; Sun, 24 May 2026 10:12:24 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5841.1779617542931323112
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2026 03:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m8z5xYLX;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8b3fe2f19a4so94231296d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2026 03:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779617542; cv=none;
        d=google.com; s=arc-20240605;
        b=c1ALk0yUL/l6fkCLCqJXu4l3eiBKAI8gg9NIZCqcoBixvL6UT91rZ0StlCN1LjUJ4e
         oGzRlt6xPE+kzou3sHz1Y3AMCbkSlPvvEHL0CS+1ZmXrDWpgFhMcnSI4JecomgXx09mW
         W9xlit+0JMG5TxkxtVLpQBss9SJDsbC7eBmBpa2lFWEtF/bA4Td3y04PzmZmazpteqBA
         aFY4w7bP32I29naFDTX1X27L9r8+lxqKelB5YaSJh37IYXyTvyoCM8DyuI1WCMFaw18F
         cuibuKyR3GifDhN8yPiyWCSNoMCQZ2YU0eZEUtof5HYWGww2eCx3yIqX2jxEOET4iGpM
         4UyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gpx5AqPJU+kREp6jh3u0ic5KMXNmzsCTl9EsMc8djH4=;
        fh=zKz6N5nlw6uV0qJjkrzhx898ldqCrBJnbC3xvUl9vao=;
        b=iaRIGt6O9HqfTAVprkRxNsylWmk6Ts4ZwMGhdbrmsqAqXWeUSbOMAGGXxk6h8st/kY
         X97rxy/6bF0HL+JaL4617Y1P9Zoe6qS4aTrJAc4/nxi+PH9gZooulwFKj+YbQ4PZ7NF2
         a9YSWgy8yZ0O/OpqP6mtdnXuem4txpdSy5mJ6Ia3GIl19sou8DvjTTWIt2doez4yi+df
         RwGfJ+ImTy50Kqm2+gmVibIwIfkOl+lVZxXRCA5gvB3FNTZ5W6zZ1F8VPvEiCGW9oCE4
         EtQ+6auRKvDR7AUCoM5Fga2kJXLW3jX0QpRPqMqw1XJRneLQGZTz5t2RskJR82GC1AIQ
         i8XA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779617542; x=1780222342; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gpx5AqPJU+kREp6jh3u0ic5KMXNmzsCTl9EsMc8djH4=;
        b=m8z5xYLXI+z1oD8PYEID9wC8AavxOFtYAzAjxH3Wq4+uzG/YTS+mTytwkSo7TKT7I4
         VUd6PfnVBBZH4UYFnogFr7acShOKXKNusfq/sbofxEj9FhFRgBI6rVnbFydMRC5jpJti
         3mXp/RsVOgbcgKXBe7/xhisiIE9oUZFwMp7FLIsun5pYBWeIsNWIwjZrCGaC9lPlm9bt
         JUICFaaRq5zpdY6gVe/dUe6ocAr2NnU/bOW30APPz6jQ30EQnzoMv+PDqZ5GJrCiDUCl
         ApsWNapJ7z5tGW9wgJRmW7jBV4TlqPtT/88vX6Bl92+I0n+4stJOm6r/oVdwqIyuMbIo
         sAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779617542; x=1780222342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpx5AqPJU+kREp6jh3u0ic5KMXNmzsCTl9EsMc8djH4=;
        b=YjJUa3IHjS4krqp3VR0noE79a8V4ajwB7wPe2eOFb1yUxxhp4yIDgxKy29RdCDQIUr
         +TiUga3p5uvGiQcTNQr/itWNumwE+fl9pHdqIEntIlQoGhtJNvGT/yt3rcQAluZ0Zehy
         vMdRO8YfvQ+EighfMVPWwrV6vi0dLrE9Hq4bLQ1Z/dTSjR3ni4/7ci5dOIC6xhP8aEFu
         JPDwL6DYnicWneZIX1Garmw8TDrUMfl+Nd4pTqMQVX2a7eJZT8m62cCS9t8y9Ifvgi5U
         jCVbRoxz8+3D5nOIFphHVV3q744lJ8tJBsyCOKjrugxjD+xZt0AcU/sT6KX+esaiXkF+
         aa3g==
X-Gm-Message-State: AOJu0YxabmUIh2qjCh/mSRPA0sph4nQplv9faOFiQNQ7hbWbb2cMNn1+
	CP42x/Ui+Vf0UT85218kz78J2+oHVXK+S3BW7obYGOK+pUppYDS7Sf3/rHCaLpPWxAGel4v5/jy
	gli3d0XSIg9CjaNoTcKqYFIo2p1/iLCQ=
X-Gm-Gg: Acq92OGf4EmTG8m/g4MOEHv9HE/xYC07ouXemY15p65Ur4TXKFbizzQbbyJT+0CLfp/
	uVqPPufl7GxMaoyIOp4tUujkGWmLLbluQX5/kawRsVxTYTG4j+doTwLsSt/q9khwUgIidnO1fwB
	5BtE7N1zgpyvdVUgBn1e0O1NnoZUQmBOZJdPXto6uDDr/wGYd/Ui0baHzKZM/qJnol3szWgUSGA
	8POz51++JmbHkhx1tTlqerLzx2ToJikLKEvoKazdJVGfirwvUEaifH+VglhKeXkt0L9WtH59L6V
	LnunYTH4ChOLCLRKpZJoFbvYqXxlH3OEpALxXSG2Pw==
X-Received: by 2002:a05:6214:2e48:b0:8ca:1cee:7c4b with SMTP id
 6a1803df08f44-8cc7b67e09cmr184929976d6.39.1779617540899; Sun, 24 May 2026
 03:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260513071155.1215141-1-tarun@centricular.com> <20260524012357.3178877-1-tarun@centricular.com>
In-Reply-To: <20260524012357.3178877-1-tarun@centricular.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 24 May 2026 12:12:06 +0200
X-Gm-Features: AVHnY4IrRYLjfs9ea-XiF74MB3gZru_w1xt7nBWmkbEtOiWS2iYmocqVD6aJMc8
Message-ID: <CANNYZj-yJ_CMvCq6bXu8RHiDDCNUbQcOTrJANZoKfZ5SMhoNkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gstreamer1.0-plugins-rs: add new package
To: tarun@centricular.com
Cc: openembedded-core@lists.openembedded.org, sebastian@centricular.com, 
	nirbheek@centricular.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 May 2026 10:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237565

Sorry, no. Carrying and maintaining this gigantic Cargo.lock in
oe-core isn't right. You need to place and maintain it upstream.

Or, perhaps a better approach is to maintain individual recipes for
each of the plugins, and fetch them using crate://crates.io/...

I think they're all available there?
https://crates.io/search?q=gst-plugin

The recipes themselves will likely be very short, and share most of
the metadata through a common .inc file.

Alex

On Sun, 24 May 2026 at 10:35, Taruntej Kanakamalla via
lists.openembedded.org <tarun=centricular.com@lists.openembedded.org>
wrote:
>
> Adapted from an existing patch:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.60232-5-brgl@bgdev.pl
>
> Update the recipe to track the latest upstream release of the official
> GStreamer Rust plugins.
>
> Extend update_crates to capture the packages which are git source based
> and packages which start with gst-plugin-. Get the crates-io url of those
> and add them the SRC_URI along other packages in the -crates.inc
>
> Prepend do_configure to create a local Cargo.toml manifest with workspace
> members pointing to the vendored local paths of all the gst-plugin-
> directories and patch the crates-io with local vendored path for the
> gst-plugin packages which are dependencies of other plugins.
>
> Unlike the other GStreamer submodules, the Rust plugins follow a
> separate release cycle and versioning scheme. These plugins are fully
> stable and required for a fully-featured GStreamer installation, as most
> new features and plugins are being written in Rust. They are also shipped
> by multiple Linux distributions such as Fedora.
>
> Based on patch by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> Signed-off-by: Taruntej Kanakamalla <tarun@centricular.com>
> ---
> Changes in V3:
>     - removed the git urls of all the sources in the SRC_URI
>     - we need only the LICENSE files and Cargo.lock, so ship them along with .bb recipe
>     - update_crates:append:
>       - get the crates.io url of all the git sourced deps and gst-plugin- packages from the Cargo.lock
>       - add them to the SRC_URI in -crates.inc along with other crates.io dependencies
>     - configure:prepend:
>       - create a custom manifest file Cargo.toml, to add to each of the gst-plugin-xxx plugins as workspace
>         members that fetched to the cargo vendoring directory
>       - add dependency overrides of few plugins which are dependencies of other
>         plugins
>     - declare one PACKAGE per plugin and added them to PACKAGES and their
>       corresponding .so to FILES
>
>
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs-crates.inc      |  2325 +++++++
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/Cargo.lock      | 13062 ++++++++++++++++++++++++++++++++++++
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-APACHE  |   201 +
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-MPL-2.0 |   373 +
>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.2.bb       |   520 ++
>  5 files changed, 16481 insertions(+)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs-crates.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs-crates.inc
> new file mode 100644
> index 0000000000..2c0e137547
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs-crates.inc
> @@ -0,0 +1,2325 @@
> +# Autogenerated with 'bitbake -c update_crates gstreamer1.0-plugins-rs'
> +
> +# from Cargo.lock
> +SRC_URI += " \
> +    crate://crates.io/addr2line/0.25.1 \
> +    crate://crates.io/adler2/2.0.1 \
> +    crate://crates.io/aes/0.8.4 \
> +    crate://crates.io/ahash/0.8.12 \
> +    crate://crates.io/aho-corasick/1.1.4 \
> +    crate://crates.io/aligned/0.4.3 \
> +    crate://crates.io/aligned-vec/0.6.4 \
> +    crate://crates.io/allocator-api2/0.2.21 \
> +    crate://crates.io/android_system_properties/0.1.5 \
> +    crate://crates.io/anstream/1.0.0 \
> +    crate://crates.io/anstyle/1.0.14 \
> +    crate://crates.io/anstyle-parse/1.0.0 \
> +    crate://crates.io/anstyle-query/1.1.5 \
> +    crate://crates.io/anstyle-wincon/3.0.11 \
> +    crate://crates.io/anyhow/1.0.102 \
> +    crate://crates.io/anymap3/1.0.1 \
> +    crate://crates.io/arbitrary/1.4.2 \
> +    crate://crates.io/arg_enum_proc_macro/0.3.4 \
> +    crate://crates.io/array-init/2.1.0 \
> +    crate://crates.io/arrayvec/0.7.6 \
> +    crate://crates.io/as-slice/0.2.1 \
> +    crate://crates.io/ash/0.38.0+1.3.281 \
> +    crate://crates.io/asn1-rs/0.7.1 \
> +    crate://crates.io/asn1-rs-derive/0.6.0 \
> +    crate://crates.io/asn1-rs-impl/0.2.0 \
> +    crate://crates.io/async-channel/2.5.0 \
> +    crate://crates.io/async-compression/0.4.42 \
> +    crate://crates.io/async-lock/3.4.2 \
> +    crate://crates.io/async-recursion/1.1.1 \
> +    crate://crates.io/async-stream/0.3.6 \
> +    crate://crates.io/async-stream-impl/0.3.6 \
> +    crate://crates.io/async-task/4.7.1 \
> +    crate://crates.io/async-trait/0.1.89 \
> +    crate://crates.io/async-tungstenite/0.34.1 \
> +    crate://crates.io/atomic-waker/1.1.2 \
> +    crate://crates.io/atomic_float/1.1.0 \
> +    crate://crates.io/atomic_refcell/0.1.14 \
> +    crate://crates.io/autocfg/1.5.0 \
> +    crate://crates.io/av-data/0.4.4 \
> +    crate://crates.io/av-scenechange/0.14.1 \
> +    crate://crates.io/av1-grain/0.2.5 \
> +    crate://crates.io/aws-config/1.8.16 \
> +    crate://crates.io/aws-credential-types/1.2.14 \
> +    crate://crates.io/aws-runtime/1.7.3 \
> +    crate://crates.io/aws-sdk-kinesisvideo/1.100.0 \
> +    crate://crates.io/aws-sdk-kinesisvideosignaling/1.98.0 \
> +    crate://crates.io/aws-sdk-polly/1.106.0 \
> +    crate://crates.io/aws-sdk-s3/1.132.0 \
> +    crate://crates.io/aws-sdk-sso/1.98.0 \
> +    crate://crates.io/aws-sdk-sts/1.103.0 \
> +    crate://crates.io/aws-sdk-transcribestreaming/1.103.0 \
> +    crate://crates.io/aws-sdk-translate/1.98.0 \
> +    crate://crates.io/aws-sigv4/1.4.3 \
> +    crate://crates.io/aws-smithy-async/1.2.14 \
> +    crate://crates.io/aws-smithy-checksums/0.64.7 \
> +    crate://crates.io/aws-smithy-eventstream/0.60.20 \
> +    crate://crates.io/aws-smithy-http/0.63.6 \
> +    crate://crates.io/aws-smithy-http-client/1.1.12 \
> +    crate://crates.io/aws-smithy-json/0.62.5 \
> +    crate://crates.io/aws-smithy-observability/0.2.6 \
> +    crate://crates.io/aws-smithy-query/0.60.15 \
> +    crate://crates.io/aws-smithy-runtime/1.11.1 \
> +    crate://crates.io/aws-smithy-runtime-api/1.12.0 \
> +    crate://crates.io/aws-smithy-runtime-api-macros/1.0.0 \
> +    crate://crates.io/aws-smithy-types/1.4.7 \
> +    crate://crates.io/aws-smithy-xml/0.60.15 \
> +    crate://crates.io/aws-types/1.3.15 \
> +    crate://crates.io/backtrace/0.3.76 \
> +    crate://crates.io/base16ct/0.1.1 \
> +    crate://crates.io/base16ct/0.2.0 \
> +    crate://crates.io/base32/0.5.1 \
> +    crate://crates.io/base64/0.21.7 \
> +    crate://crates.io/base64/0.22.1 \
> +    crate://crates.io/base64-serde/0.8.0 \
> +    crate://crates.io/base64-simd/0.8.0 \
> +    crate://crates.io/base64ct/1.8.3 \
> +    crate://crates.io/bincode/1.3.3 \
> +    crate://crates.io/bincode/2.0.1 \
> +    crate://crates.io/bindgen/0.70.1 \
> +    crate://crates.io/bindgen/0.71.1 \
> +    crate://crates.io/bindgen/0.72.1 \
> +    crate://crates.io/bit-set/0.8.0 \
> +    crate://crates.io/bit-vec/0.8.0 \
> +    crate://crates.io/bit-vec/0.9.1 \
> +    crate://crates.io/bitflags/1.3.2 \
> +    crate://crates.io/bitflags/2.11.1 \
> +    crate://crates.io/bitreader/0.3.11 \
> +    crate://crates.io/bitstream-io/4.10.0 \
> +    crate://crates.io/block/0.1.6 \
> +    crate://crates.io/block-buffer/0.10.4 \
> +    crate://crates.io/block-buffer/0.12.0 \
> +    crate://crates.io/block2/0.6.2 \
> +    crate://crates.io/bs58/0.5.1 \
> +    crate://crates.io/bstr/1.12.1 \
> +    crate://crates.io/built/0.8.0 \
> +    crate://crates.io/bumpalo/3.20.2 \
> +    crate://crates.io/burn/0.20.1 \
> +    crate://crates.io/burn-backend/0.20.1 \
> +    crate://crates.io/burn-core/0.20.1 \
> +    crate://crates.io/burn-cpu/0.20.1 \
> +    crate://crates.io/burn-cubecl/0.20.1 \
> +    crate://crates.io/burn-derive/0.20.1 \
> +    crate://crates.io/burn-ir/0.20.1 \
> +    crate://crates.io/burn-ndarray/0.20.1 \
> +    crate://crates.io/burn-nn/0.20.1 \
> +    crate://crates.io/burn-optim/0.20.1 \
> +    crate://crates.io/burn-std/0.20.1 \
> +    crate://crates.io/burn-store/0.20.1 \
> +    crate://crates.io/burn-tensor/0.20.1 \
> +    crate://crates.io/burn-wgpu/0.20.1 \
> +    crate://crates.io/byte-slice-cast/1.2.3 \
> +    crate://crates.io/bytemuck/1.25.0 \
> +    crate://crates.io/bytemuck_derive/1.10.2 \
> +    crate://crates.io/byteorder/1.5.0 \
> +    crate://crates.io/byteorder-lite/0.1.0 \
> +    crate://crates.io/byteorder_slice/3.0.0 \
> +    crate://crates.io/bytes/1.11.1 \
> +    crate://crates.io/bytes-utils/0.1.4 \
> +    crate://crates.io/bzip2/0.6.1 \
> +    crate://crates.io/c2rust-bitfields/0.20.0 \
> +    crate://crates.io/c2rust-bitfields-derive/0.20.0 \
> +    crate://crates.io/caseless/0.2.2 \
> +    crate://crates.io/cc/1.2.62 \
> +    crate://crates.io/cdg/0.1.0 \
> +    crate://crates.io/cdg_renderer/0.8.0 \
> +    crate://crates.io/cdp-types/0.3.0 \
> +    crate://crates.io/cea608-types/0.1.4 \
> +    crate://crates.io/cea708-types/0.4.1 \
> +    crate://crates.io/cesu8/1.1.0 \
> +    crate://crates.io/cexpr/0.6.0 \
> +    crate://crates.io/cfg-expr/0.17.2 \
> +    crate://crates.io/cfg-if/1.0.4 \
> +    crate://crates.io/cfg_aliases/0.2.1 \
> +    crate://crates.io/chacha20/0.10.0 \
> +    crate://crates.io/chrono/0.4.44 \
> +    crate://crates.io/cipher/0.4.4 \
> +    crate://crates.io/clang-sys/1.8.1 \
> +    crate://crates.io/clap/4.6.1 \
> +    crate://crates.io/clap_builder/4.6.0 \
> +    crate://crates.io/clap_derive/4.6.1 \
> +    crate://crates.io/clap_lex/1.1.0 \
> +    crate://crates.io/claxon/0.4.3 \
> +    crate://crates.io/cmake/0.1.58 \
> +    crate://crates.io/cmov/0.5.3 \
> +    crate://crates.io/codespan-reporting/0.12.0 \
> +    crate://crates.io/color-name/1.2.0 \
> +    crate://crates.io/color-thief/0.2.2 \
> +    crate://crates.io/color_quant/1.1.0 \
> +    crate://crates.io/colorchoice/1.0.5 \
> +    crate://crates.io/colored/3.1.1 \
> +    crate://crates.io/combine/4.6.7 \
> +    crate://crates.io/compression-codecs/0.4.38 \
> +    crate://crates.io/compression-core/0.4.32 \
> +    crate://crates.io/comrak/0.39.1 \
> +    crate://crates.io/concurrent-queue/2.5.0 \
> +    crate://crates.io/console/0.16.3 \
> +    crate://crates.io/const-oid/0.9.6 \
> +    crate://crates.io/const-oid/0.10.2 \
> +    crate://crates.io/const-random/0.1.18 \
> +    crate://crates.io/const-random-macro/0.1.16 \
> +    crate://crates.io/constant_time_eq/0.3.1 \
> +    crate://crates.io/constcat/0.6.1 \
> +    crate://crates.io/convert_case/0.8.0 \
> +    crate://crates.io/convert_case/0.10.0 \
> +    crate://crates.io/cookie/0.18.1 \
> +    crate://crates.io/cookie-factory/0.3.3 \
> +    crate://crates.io/cookie_store/0.22.1 \
> +    crate://crates.io/core-foundation/0.9.4 \
> +    crate://crates.io/core-foundation/0.10.1 \
> +    crate://crates.io/core-foundation-sys/0.8.7 \
> +    crate://crates.io/core-graphics-types/0.2.0 \
> +    crate://crates.io/cpufeatures/0.2.17 \
> +    crate://crates.io/cpufeatures/0.3.0 \
> +    crate://crates.io/crc/3.3.0 \
> +    crate://crates.io/crc-catalog/2.5.0 \
> +    crate://crates.io/crc-fast/1.9.0 \
> +    crate://crates.io/crc32fast/1.5.0 \
> +    crate://crates.io/critical-section/1.2.0 \
> +    crate://crates.io/crossbeam-deque/0.8.6 \
> +    crate://crates.io/crossbeam-epoch/0.9.18 \
> +    crate://crates.io/crossbeam-utils/0.8.21 \
> +    crate://crates.io/crunchy/0.2.4 \
> +    crate://crates.io/crypto-bigint/0.4.9 \
> +    crate://crates.io/crypto-bigint/0.5.5 \
> +    crate://crates.io/crypto-common/0.1.7 \
> +    crate://crates.io/crypto-common/0.2.1 \
> +    crate://crates.io/csound/0.1.8 \
> +    crate://crates.io/csound-sys/0.1.2 \
> +    crate://crates.io/ctr/0.9.2 \
> +    crate://crates.io/ctrlc/3.5.2 \
> +    crate://crates.io/ctutils/0.4.2 \
> +    crate://crates.io/cubecl/0.9.0 \
> +    crate://crates.io/cubecl-common/0.9.0 \
> +    crate://crates.io/cubecl-core/0.9.0 \
> +    crate://crates.io/cubecl-cpp/0.9.0 \
> +    crate://crates.io/cubecl-cpu/0.9.0 \
> +    crate://crates.io/cubecl-cuda/0.9.0 \
> +    crate://crates.io/cubecl-ir/0.9.0 \
> +    crate://crates.io/cubecl-macros/0.9.0 \
> +    crate://crates.io/cubecl-macros-internal/0.9.0 \
> +    crate://crates.io/cubecl-opt/0.9.0 \
> +    crate://crates.io/cubecl-runtime/0.9.0 \
> +    crate://crates.io/cubecl-spirv/0.9.0 \
> +    crate://crates.io/cubecl-std/0.9.0 \
> +    crate://crates.io/cubecl-wgpu/0.9.0 \
> +    crate://crates.io/cubecl-zspace/0.9.0 \
> +    crate://crates.io/cubek/0.1.1 \
> +    crate://crates.io/cubek-attention/0.1.1 \
> +    crate://crates.io/cubek-convolution/0.1.1 \
> +    crate://crates.io/cubek-matmul/0.1.1 \
> +    crate://crates.io/cubek-quant/0.1.1 \
> +    crate://crates.io/cubek-random/0.1.1 \
> +    crate://crates.io/cubek-reduce/0.1.1 \
> +    crate://crates.io/cudarc/0.18.2 \
> +    crate://crates.io/curve25519-dalek/4.1.3 \
> +    crate://crates.io/curve25519-dalek-derive/0.1.1 \
> +    crate://crates.io/darling/0.20.11 \
> +    crate://crates.io/darling/0.21.3 \
> +    crate://crates.io/darling/0.23.0 \
> +    crate://crates.io/darling_core/0.20.11 \
> +    crate://crates.io/darling_core/0.21.3 \
> +    crate://crates.io/darling_core/0.23.0 \
> +    crate://crates.io/darling_macro/0.20.11 \
> +    crate://crates.io/darling_macro/0.21.3 \
> +    crate://crates.io/darling_macro/0.23.0 \
> +    crate://crates.io/dash-mpd/0.20.2 \
> +    crate://crates.io/dasp/0.11.0 \
> +    crate://crates.io/dasp_envelope/0.11.0 \
> +    crate://crates.io/dasp_frame/0.11.0 \
> +    crate://crates.io/dasp_interpolate/0.11.0 \
> +    crate://crates.io/dasp_peak/0.11.0 \
> +    crate://crates.io/dasp_ring_buffer/0.11.0 \
> +    crate://crates.io/dasp_rms/0.11.0 \
> +    crate://crates.io/dasp_sample/0.11.0 \
> +    crate://crates.io/dasp_signal/0.11.0 \
> +    crate://crates.io/dasp_slice/0.11.0 \
> +    crate://crates.io/dasp_window/0.11.1 \
> +    crate://crates.io/data-encoding/2.11.0 \
> +    crate://crates.io/dav1d/0.11.1 \
> +    crate://crates.io/dav1d-sys/0.8.3 \
> +    crate://crates.io/deepgram/0.7.0 \
> +    crate://crates.io/deflate64/0.1.12 \
> +    crate://crates.io/der/0.6.1 \
> +    crate://crates.io/der/0.7.10 \
> +    crate://crates.io/der-parser/10.0.0 \
> +    crate://crates.io/deranged/0.5.8 \
> +    crate://crates.io/derive-into-owned/0.2.0 \
> +    crate://crates.io/derive-new/0.7.0 \
> +    crate://crates.io/derive_builder/0.20.2 \
> +    crate://crates.io/derive_builder_core/0.20.2 \
> +    crate://crates.io/derive_builder_macro/0.20.2 \
> +    crate://crates.io/derive_more/2.1.1 \
> +    crate://crates.io/derive_more-impl/2.1.1 \
> +    crate://crates.io/deunicode/1.6.2 \
> +    crate://crates.io/device-info/0.1.1 \
> +    crate://crates.io/diff/0.1.13 \
> +    crate://crates.io/digest/0.10.7 \
> +    crate://crates.io/digest/0.11.3 \
> +    crate://crates.io/dirs/6.0.0 \
> +    crate://crates.io/dirs-sys/0.5.0 \
> +    crate://crates.io/dispatch2/0.3.1 \
> +    crate://crates.io/displaydoc/0.2.5 \
> +    crate://crates.io/document-features/0.2.12 \
> +    crate://crates.io/dssim-core/3.4.0 \
> +    crate://crates.io/dyn-clone/1.0.20 \
> +    crate://crates.io/easyfft/0.4.2 \
> +    crate://crates.io/ebml-iterable/0.6.3 \
> +    crate://crates.io/ebml-iterable-specification/0.4.0 \
> +    crate://crates.io/ebml-iterable-specification-derive/0.4.0 \
> +    crate://crates.io/ebur128/0.1.10 \
> +    crate://crates.io/ecdsa/0.14.8 \
> +    crate://crates.io/ecdsa/0.16.9 \
> +    crate://crates.io/ed25519/1.5.3 \
> +    crate://crates.io/ed25519/2.2.3 \
> +    crate://crates.io/ed25519-dalek/2.2.0 \
> +    crate://crates.io/edit-distance/2.2.2 \
> +    crate://crates.io/either/1.15.0 \
> +    crate://crates.io/elliptic-curve/0.12.3 \
> +    crate://crates.io/elliptic-curve/0.13.8 \
> +    crate://crates.io/embassy-futures/0.1.2 \
> +    crate://crates.io/embassy-time/0.4.0 \
> +    crate://crates.io/embassy-time-driver/0.2.2 \
> +    crate://crates.io/embedded-hal/0.2.7 \
> +    crate://crates.io/embedded-hal/1.0.0 \
> +    crate://crates.io/embedded-hal-async/1.0.0 \
> +    crate://crates.io/encode_unicode/1.0.0 \
> +    crate://crates.io/encoding_rs/0.8.35 \
> +    crate://crates.io/entities/1.0.1 \
> +    crate://crates.io/enumn/0.1.14 \
> +    crate://crates.io/enumset/1.1.12 \
> +    crate://crates.io/enumset_derive/0.15.0 \
> +    crate://crates.io/env_filter/1.0.1 \
> +    crate://crates.io/env_logger/0.11.10 \
> +    crate://crates.io/equator/0.4.2 \
> +    crate://crates.io/equator-macro/0.4.2 \
> +    crate://crates.io/equivalent/1.0.2 \
> +    crate://crates.io/errno/0.3.14 \
> +    crate://crates.io/etherparse/0.19.0 \
> +    crate://crates.io/event-listener/5.4.1 \
> +    crate://crates.io/event-listener-strategy/0.5.4 \
> +    crate://crates.io/fallible-iterator/0.3.0 \
> +    crate://crates.io/fastbloom/0.14.1 \
> +    crate://crates.io/fastrand/2.4.1 \
> +    crate://crates.io/fdeflate/0.3.7 \
> +    crate://crates.io/ff/0.12.1 \
> +    crate://crates.io/ff/0.13.1 \
> +    crate://crates.io/fiat-crypto/0.2.9 \
> +    crate://crates.io/field-offset/0.3.6 \
> +    crate://crates.io/filetime/0.2.28 \
> +    crate://crates.io/find-msvc-tools/0.1.9 \
> +    crate://crates.io/fixedbitset/0.4.2 \
> +    crate://crates.io/flate2/1.1.9 \
> +    crate://crates.io/float-ord/0.3.2 \
> +    crate://crates.io/float4/0.1.0 \
> +    crate://crates.io/float8/0.4.2 \
> +    crate://crates.io/flume/0.12.0 \
> +    crate://crates.io/fnv/1.0.7 \
> +    crate://crates.io/foldhash/0.1.5 \
> +    crate://crates.io/foldhash/0.2.0 \
> +    crate://crates.io/foreign-types/0.5.0 \
> +    crate://crates.io/foreign-types-macros/0.2.3 \
> +    crate://crates.io/foreign-types-shared/0.3.1 \
> +    crate://crates.io/form_urlencoded/1.2.2 \
> +    crate://crates.io/fs_extra/1.3.0 \
> +    crate://crates.io/fslock/0.2.1 \
> +    crate://crates.io/fst/0.4.7 \
> +    crate://crates.io/futures/0.3.32 \
> +    crate://crates.io/futures-channel/0.3.32 \
> +    crate://crates.io/futures-core/0.3.32 \
> +    crate://crates.io/futures-executor/0.3.32 \
> +    crate://crates.io/futures-io/0.3.32 \
> +    crate://crates.io/futures-lite/2.6.1 \
> +    crate://crates.io/futures-macro/0.3.32 \
> +    crate://crates.io/futures-sink/0.3.32 \
> +    crate://crates.io/futures-task/0.3.32 \
> +    crate://crates.io/futures-timer/3.0.3 \
> +    crate://crates.io/futures-util/0.3.32 \
> +    crate://crates.io/g2gen/1.2.2 \
> +    crate://crates.io/g2p/1.2.2 \
> +    crate://crates.io/g2poly/1.2.2 \
> +    crate://crates.io/generic-array/0.14.7 \
> +    crate://crates.io/generic_singleton/0.5.3 \
> +    crate://crates.io/getifaddrs/0.6.2 \
> +    crate://crates.io/getrandom/0.2.17 \
> +    crate://crates.io/getrandom/0.3.4 \
> +    crate://crates.io/getrandom/0.4.2 \
> +    crate://crates.io/gif/0.14.2 \
> +    crate://crates.io/gimli/0.32.3 \
> +    crate://crates.io/gl_generator/0.14.0 \
> +    crate://crates.io/glob/0.3.3 \
> +    crate://crates.io/glow/0.16.0 \
> +    crate://crates.io/glutin_wgl_sys/0.6.1 \
> +    crate://crates.io/governor/0.10.4 \
> +    crate://crates.io/gpu-alloc/0.6.0 \
> +    crate://crates.io/gpu-alloc-types/0.3.0 \
> +    crate://crates.io/gpu-allocator/0.27.0 \
> +    crate://crates.io/gpu-descriptor/0.3.2 \
> +    crate://crates.io/gpu-descriptor-types/0.2.0 \
> +    crate://crates.io/group/0.12.1 \
> +    crate://crates.io/group/0.13.0 \
> +    crate://crates.io/h2/0.3.27 \
> +    crate://crates.io/h2/0.4.14 \
> +    crate://crates.io/half/2.7.1 \
> +    crate://crates.io/hashbrown/0.12.3 \
> +    crate://crates.io/hashbrown/0.13.2 \
> +    crate://crates.io/hashbrown/0.15.5 \
> +    crate://crates.io/hashbrown/0.16.1 \
> +    crate://crates.io/hashbrown/0.17.1 \
> +    crate://crates.io/headers/0.4.1 \
> +    crate://crates.io/headers-core/0.3.0 \
> +    crate://crates.io/heck/0.4.1 \
> +    crate://crates.io/heck/0.5.0 \
> +    crate://crates.io/hermit-abi/0.5.2 \
> +    crate://crates.io/hex/0.4.3 \
> +    crate://crates.io/hexf-parse/0.2.1 \
> +    crate://crates.io/hkdf/0.12.4 \
> +    crate://crates.io/hmac/0.12.1 \
> +    crate://crates.io/hmac/0.13.0 \
> +    crate://crates.io/home/0.5.12 \
> +    crate://crates.io/hound/3.5.1 \
> +    crate://crates.io/hrtf/0.8.1 \
> +    crate://crates.io/http/0.2.12 \
> +    crate://crates.io/http/1.4.0 \
> +    crate://crates.io/http-body/0.4.6 \
> +    crate://crates.io/http-body/1.0.1 \
> +    crate://crates.io/http-body-util/0.1.3 \
> +    crate://crates.io/httparse/1.10.1 \
> +    crate://crates.io/httpdate/1.0.3 \
> +    crate://crates.io/human_bytes/0.4.3 \
> +    crate://crates.io/hxdmp/0.2.1 \
> +    crate://crates.io/hybrid-array/0.4.12 \
> +    crate://crates.io/hyper/0.14.32 \
> +    crate://crates.io/hyper/1.9.0 \
> +    crate://crates.io/hyper-proxy2/0.1.0 \
> +    crate://crates.io/hyper-rustls/0.24.2 \
> +    crate://crates.io/hyper-rustls/0.26.0 \
> +    crate://crates.io/hyper-rustls/0.27.9 \
> +    crate://crates.io/hyper-util/0.1.20 \
> +    crate://crates.io/hyphenation/0.8.4 \
> +    crate://crates.io/hyphenation_commons/0.8.4 \
> +    crate://crates.io/iana-time-zone/0.1.65 \
> +    crate://crates.io/iana-time-zone-haiku/0.1.2 \
> +    crate://crates.io/icu_collections/2.2.0 \
> +    crate://crates.io/icu_locale/2.2.0 \
> +    crate://crates.io/icu_locale_core/2.2.0 \
> +    crate://crates.io/icu_locale_data/2.2.0 \
> +    crate://crates.io/icu_normalizer/2.2.0 \
> +    crate://crates.io/icu_normalizer_data/2.2.0 \
> +    crate://crates.io/icu_properties/2.2.0 \
> +    crate://crates.io/icu_properties_data/2.2.0 \
> +    crate://crates.io/icu_provider/2.2.0 \
> +    crate://crates.io/icu_segmenter/2.2.0 \
> +    crate://crates.io/icu_segmenter_data/2.2.0 \
> +    crate://crates.io/id-arena/2.3.0 \
> +    crate://crates.io/ident_case/1.0.1 \
> +    crate://crates.io/idna/1.1.0 \
> +    crate://crates.io/idna_adapter/1.2.2 \
> +    crate://crates.io/image/0.25.10 \
> +    crate://crates.io/image_hasher/3.1.1 \
> +    crate://crates.io/imgref/1.12.1 \
> +    crate://crates.io/indexmap/1.9.3 \
> +    crate://crates.io/indexmap/2.14.0 \
> +    crate://crates.io/indicatif/0.18.4 \
> +    crate://crates.io/inout/0.1.4 \
> +    crate://crates.io/interpolate_name/0.2.4 \
> +    crate://crates.io/ipnet/2.12.0 \
> +    crate://crates.io/is-docker/0.2.0 \
> +    crate://crates.io/is-wsl/0.4.0 \
> +    crate://crates.io/is_terminal_polyfill/1.70.2 \
> +    crate://crates.io/iso8601/0.6.3 \
> +    crate://crates.io/itertools/0.11.0 \
> +    crate://crates.io/itertools/0.12.1 \
> +    crate://crates.io/itertools/0.13.0 \
> +    crate://crates.io/itertools/0.14.0 \
> +    crate://crates.io/itoa/1.0.18 \
> +    crate://crates.io/jiff/0.2.24 \
> +    crate://crates.io/jiff-static/0.2.24 \
> +    crate://crates.io/jni/0.21.1 \
> +    crate://crates.io/jni/0.22.4 \
> +    crate://crates.io/jni-macros/0.22.4 \
> +    crate://crates.io/jni-sys/0.3.1 \
> +    crate://crates.io/jni-sys/0.4.1 \
> +    crate://crates.io/jni-sys-macros/0.4.1 \
> +    crate://crates.io/jobserver/0.1.34 \
> +    crate://crates.io/js-sys/0.3.98 \
> +    crate://crates.io/jsonwebtoken/10.4.0 \
> +    crate://crates.io/khronos-egl/6.0.0 \
> +    crate://crates.io/khronos_api/3.1.0 \
> +    crate://crates.io/kstring/2.0.2 \
> +    crate://crates.io/lazy_static/1.5.0 \
> +    crate://crates.io/leb128fmt/0.1.0 \
> +    crate://crates.io/lewton/0.10.2 \
> +    crate://crates.io/libbz2-rs-sys/0.2.3 \
> +    crate://crates.io/libc/0.2.186 \
> +    crate://crates.io/libfuzzer-sys/0.4.12 \
> +    crate://crates.io/libloading/0.8.9 \
> +    crate://crates.io/libloading/0.9.0 \
> +    crate://crates.io/liblzma/0.4.6 \
> +    crate://crates.io/liblzma-sys/0.4.6 \
> +    crate://crates.io/libm/0.2.16 \
> +    crate://crates.io/libredox/0.1.16 \
> +    crate://crates.io/librespot-audio/0.8.0 \
> +    crate://crates.io/librespot-core/0.8.0 \
> +    crate://crates.io/librespot-metadata/0.8.0 \
> +    crate://crates.io/librespot-oauth/0.8.0 \
> +    crate://crates.io/librespot-playback/0.8.0 \
> +    crate://crates.io/librespot-protocol/0.8.0 \
> +    crate://crates.io/libsodium-sys/0.2.7 \
> +    crate://crates.io/libwebp-sys2/0.1.11 \
> +    crate://crates.io/libwebp-sys2/0.2.0 \
> +    crate://crates.io/linux-raw-sys/0.4.15 \
> +    crate://crates.io/linux-raw-sys/0.12.1 \
> +    crate://crates.io/litemap/0.8.2 \
> +    crate://crates.io/litrs/1.0.0 \
> +    crate://crates.io/livekit-api/0.4.19 \
> +    crate://crates.io/livekit-protocol/0.7.5 \
> +    crate://crates.io/livekit-runtime/0.4.0 \
> +    crate://crates.io/lock_api/0.4.14 \
> +    crate://crates.io/log/0.4.29 \
> +    crate://crates.io/lru/0.16.4 \
> +    crate://crates.io/lru-slab/0.1.2 \
> +    crate://crates.io/lzma-rust2/0.15.7 \
> +    crate://crates.io/m3u8-rs/6.0.0 \
> +    crate://crates.io/malloc_buf/0.0.6 \
> +    crate://crates.io/matchers/0.2.0 \
> +    crate://crates.io/matrixmultiply/0.3.10 \
> +    crate://crates.io/maybe-rayon/0.1.1 \
> +    crate://crates.io/md-5/0.11.0 \
> +    crate://crates.io/md5/0.8.0 \
> +    crate://crates.io/memchr/2.8.0 \
> +    crate://crates.io/memmap2/0.9.10 \
> +    crate://crates.io/memoffset/0.9.1 \
> +    crate://crates.io/metal/0.32.0 \
> +    crate://crates.io/mime/0.3.17 \
> +    crate://crates.io/mime_guess/2.0.5 \
> +    crate://crates.io/minimal-lexical/0.2.1 \
> +    crate://crates.io/miniz_oxide/0.8.9 \
> +    crate://crates.io/mio/1.2.0 \
> +    crate://crates.io/more-asserts/0.3.1 \
> +    crate://crates.io/moxcms/0.8.1 \
> +    crate://crates.io/mp4-atom/0.10.1 \
> +    crate://crates.io/muldiv/1.0.1 \
> +    crate://crates.io/multimap/0.10.1 \
> +    crate://crates.io/naga/26.0.0 \
> +    crate://crates.io/nasm-rs/0.3.2 \
> +    crate://crates.io/nb/0.1.3 \
> +    crate://crates.io/nb/1.1.0 \
> +    crate://crates.io/ndarray/0.17.2 \
> +    crate://crates.io/ndk-sys/0.6.0+11769913 \
> +    crate://crates.io/new_debug_unreachable/1.0.6 \
> +    crate://crates.io/nix/0.30.1 \
> +    crate://crates.io/nix/0.31.3 \
> +    crate://crates.io/nnnoiseless/0.5.2 \
> +    crate://crates.io/no_std_io2/0.9.4 \
> +    crate://crates.io/nom/7.1.3 \
> +    crate://crates.io/nom/8.0.0 \
> +    crate://crates.io/nonzero_ext/0.3.0 \
> +    crate://crates.io/noop_proc_macro/0.3.0 \
> +    crate://crates.io/ntapi/0.4.3 \
> +    crate://crates.io/nu-ansi-term/0.50.3 \
> +    crate://crates.io/num/0.4.3 \
> +    crate://crates.io/num-bigint/0.4.6 \
> +    crate://crates.io/num-bigint-dig/0.8.6 \
> +    crate://crates.io/num-complex/0.4.6 \
> +    crate://crates.io/num-conv/0.2.1 \
> +    crate://crates.io/num-derive/0.4.2 \
> +    crate://crates.io/num-integer/0.1.46 \
> +    crate://crates.io/num-iter/0.1.45 \
> +    crate://crates.io/num-rational/0.4.2 \
> +    crate://crates.io/num-traits/0.2.19 \
> +    crate://crates.io/num_cpus/1.17.0 \
> +    crate://crates.io/num_threads/0.1.7 \
> +    crate://crates.io/oauth2/5.0.0 \
> +    crate://crates.io/objc/0.2.7 \
> +    crate://crates.io/objc2/0.6.4 \
> +    crate://crates.io/objc2-cloud-kit/0.3.2 \
> +    crate://crates.io/objc2-core-data/0.3.2 \
> +    crate://crates.io/objc2-core-foundation/0.3.2 \
> +    crate://crates.io/objc2-core-graphics/0.3.2 \
> +    crate://crates.io/objc2-core-image/0.3.2 \
> +    crate://crates.io/objc2-core-location/0.3.2 \
> +    crate://crates.io/objc2-core-text/0.3.2 \
> +    crate://crates.io/objc2-encode/4.1.0 \
> +    crate://crates.io/objc2-foundation/0.3.2 \
> +    crate://crates.io/objc2-io-kit/0.3.2 \
> +    crate://crates.io/objc2-io-surface/0.3.2 \
> +    crate://crates.io/objc2-quartz-core/0.3.2 \
> +    crate://crates.io/objc2-ui-kit/0.3.2 \
> +    crate://crates.io/objc2-user-notifications/0.3.2 \
> +    crate://crates.io/object/0.37.3 \
> +    crate://crates.io/ogg/0.9.2 \
> +    crate://crates.io/oid-registry/0.8.1 \
> +    crate://crates.io/once_cell/1.21.4 \
> +    crate://crates.io/once_cell_polyfill/1.70.2 \
> +    crate://crates.io/open/5.3.4 \
> +    crate://crates.io/openssl-probe/0.1.6 \
> +    crate://crates.io/openssl-probe/0.2.1 \
> +    crate://crates.io/option-ext/0.2.0 \
> +    crate://crates.io/option-operations/0.6.1 \
> +    crate://crates.io/ordered-float/5.0.0 \
> +    crate://crates.io/os_info/3.14.0 \
> +    crate://crates.io/outref/0.5.2 \
> +    crate://crates.io/p256/0.11.1 \
> +    crate://crates.io/p256/0.13.2 \
> +    crate://crates.io/p384/0.13.1 \
> +    crate://crates.io/parking/2.2.1 \
> +    crate://crates.io/parking_lot/0.12.5 \
> +    crate://crates.io/parking_lot_core/0.9.12 \
> +    crate://crates.io/parse_link_header/0.4.1 \
> +    crate://crates.io/paste/1.0.15 \
> +    crate://crates.io/pastey/0.1.1 \
> +    crate://crates.io/pastey/0.2.2 \
> +    crate://crates.io/pathdiff/0.2.3 \
> +    crate://crates.io/pbjson/0.6.0 \
> +    crate://crates.io/pbjson-build/0.6.2 \
> +    crate://crates.io/pbjson-types/0.6.0 \
> +    crate://crates.io/pbkdf2/0.12.2 \
> +    crate://crates.io/pcap-file/2.0.0 \
> +    crate://crates.io/pem/3.0.6 \
> +    crate://crates.io/pem-rfc7468/0.7.0 \
> +    crate://crates.io/percent-encoding/2.3.2 \
> +    crate://crates.io/petgraph/0.6.5 \
> +    crate://crates.io/pin-project/1.1.12 \
> +    crate://crates.io/pin-project-internal/1.1.12 \
> +    crate://crates.io/pin-project-lite/0.2.17 \
> +    crate://crates.io/pin-utils/0.1.0 \
> +    crate://crates.io/pkcs1/0.7.5 \
> +    crate://crates.io/pkcs8/0.9.0 \
> +    crate://crates.io/pkcs8/0.10.2 \
> +    crate://crates.io/pkg-config/0.3.33 \
> +    crate://crates.io/png/0.18.1 \
> +    crate://crates.io/pocket-resources/0.3.2 \
> +    crate://crates.io/polling/3.11.0 \
> +    crate://crates.io/portable-atomic/1.13.1 \
> +    crate://crates.io/portable-atomic-util/0.2.7 \
> +    crate://crates.io/potential_utf/0.1.5 \
> +    crate://crates.io/powerfmt/0.2.0 \
> +    crate://crates.io/ppmd-rust/1.4.0 \
> +    crate://crates.io/ppv-lite86/0.2.21 \
> +    crate://crates.io/presser/0.3.1 \
> +    crate://crates.io/pretty_assertions/1.4.1 \
> +    crate://crates.io/prettyplease/0.2.37 \
> +    crate://crates.io/primal-check/0.3.4 \
> +    crate://crates.io/primeorder/0.13.6 \
> +    crate://crates.io/priority-queue/2.7.0 \
> +    crate://crates.io/proc-macro-crate/3.5.0 \
> +    crate://crates.io/proc-macro-error-attr2/2.0.0 \
> +    crate://crates.io/proc-macro-error2/2.0.1 \
> +    crate://crates.io/proc-macro2/1.0.106 \
> +    crate://crates.io/profiling/1.0.18 \
> +    crate://crates.io/profiling-procmacros/1.0.18 \
> +    crate://crates.io/prost/0.12.6 \
> +    crate://crates.io/prost-build/0.12.6 \
> +    crate://crates.io/prost-derive/0.12.6 \
> +    crate://crates.io/prost-types/0.12.6 \
> +    crate://crates.io/protobuf/3.7.2 \
> +    crate://crates.io/protobuf-codegen/3.7.2 \
> +    crate://crates.io/protobuf-json-mapping/3.7.2 \
> +    crate://crates.io/protobuf-parse/3.7.2 \
> +    crate://crates.io/protobuf-support/3.7.2 \
> +    crate://crates.io/psl-types/2.0.11 \
> +    crate://crates.io/publicsuffix/2.3.0 \
> +    crate://crates.io/pxfm/0.1.29 \
> +    crate://crates.io/pyo3/0.28.3 \
> +    crate://crates.io/pyo3-build-config/0.28.3 \
> +    crate://crates.io/pyo3-ffi/0.28.3 \
> +    crate://crates.io/pyo3-macros/0.28.3 \
> +    crate://crates.io/pyo3-macros-backend/0.28.3 \
> +    crate://crates.io/quick-xml/0.38.4 \
> +    crate://crates.io/quick-xml/0.39.4 \
> +    crate://crates.io/quinn/0.11.9 \
> +    crate://crates.io/quinn-proto/0.11.14 \
> +    crate://crates.io/quinn-udp/0.5.14 \
> +    crate://crates.io/quote/1.0.45 \
> +    crate://crates.io/r-efi/5.3.0 \
> +    crate://crates.io/r-efi/6.0.0 \
> +    crate://crates.io/rand/0.8.6 \
> +    crate://crates.io/rand/0.9.4 \
> +    crate://crates.io/rand/0.10.1 \
> +    crate://crates.io/rand_chacha/0.3.1 \
> +    crate://crates.io/rand_chacha/0.9.0 \
> +    crate://crates.io/rand_core/0.6.4 \
> +    crate://crates.io/rand_core/0.9.5 \
> +    crate://crates.io/rand_core/0.10.1 \
> +    crate://crates.io/rand_distr/0.5.1 \
> +    crate://crates.io/range-alloc/0.1.5 \
> +    crate://crates.io/raptorq/2.0.0 \
> +    crate://crates.io/rav1e/0.8.1 \
> +    crate://crates.io/raw-window-handle/0.6.2 \
> +    crate://crates.io/rawpointer/0.2.1 \
> +    crate://crates.io/rayon/1.12.0 \
> +    crate://crates.io/rayon-core/1.13.0 \
> +    crate://crates.io/rcgen/0.14.8 \
> +    crate://crates.io/realfft/3.5.0 \
> +    crate://crates.io/redox_syscall/0.5.18 \
> +    crate://crates.io/redox_users/0.5.2 \
> +    crate://crates.io/ref-cast/1.0.25 \
> +    crate://crates.io/ref-cast-impl/1.0.25 \
> +    crate://crates.io/regex/1.12.3 \
> +    crate://crates.io/regex-automata/0.4.14 \
> +    crate://crates.io/regex-lite/0.1.9 \
> +    crate://crates.io/regex-syntax/0.8.10 \
> +    crate://crates.io/renderdoc-sys/1.1.0 \
> +    crate://crates.io/reqwest/0.12.28 \
> +    crate://crates.io/rfc6979/0.3.1 \
> +    crate://crates.io/rfc6979/0.4.0 \
> +    crate://crates.io/rgb/0.8.53 \
> +    crate://crates.io/ring/0.17.14 \
> +    crate://crates.io/rmp/0.8.15 \
> +    crate://crates.io/rmp-serde/1.3.1 \
> +    crate://crates.io/rqrr/0.10.1 \
> +    crate://crates.io/rsa/0.9.10 \
> +    crate://crates.io/rtcp-types/0.3.0 \
> +    crate://crates.io/rtp-types/0.1.2 \
> +    crate://crates.io/rtsp-types/0.1.3 \
> +    crate://crates.io/rubato/0.14.1 \
> +    crate://crates.io/rustc-demangle/0.1.27 \
> +    crate://crates.io/rustc-hash/1.1.0 \
> +    crate://crates.io/rustc-hash/2.1.2 \
> +    crate://crates.io/rustc_version/0.4.1 \
> +    crate://crates.io/rustdct/0.7.1 \
> +    crate://crates.io/rustfft/6.4.1 \
> +    crate://crates.io/rusticata-macros/4.1.0 \
> +    crate://crates.io/rustix/0.38.44 \
> +    crate://crates.io/rustix/1.1.4 \
> +    crate://crates.io/rustls/0.21.12 \
> +    crate://crates.io/rustls/0.22.4 \
> +    crate://crates.io/rustls/0.23.40 \
> +    crate://crates.io/rustls-native-certs/0.6.3 \
> +    crate://crates.io/rustls-native-certs/0.7.3 \
> +    crate://crates.io/rustls-native-certs/0.8.3 \
> +    crate://crates.io/rustls-pemfile/1.0.4 \
> +    crate://crates.io/rustls-pemfile/2.2.0 \
> +    crate://crates.io/rustls-pki-types/1.14.1 \
> +    crate://crates.io/rustls-platform-verifier/0.6.2 \
> +    crate://crates.io/rustls-platform-verifier/0.7.0 \
> +    crate://crates.io/rustls-platform-verifier-android/0.1.1 \
> +    crate://crates.io/rustls-webpki/0.101.7 \
> +    crate://crates.io/rustls-webpki/0.102.8 \
> +    crate://crates.io/rustls-webpki/0.103.13 \
> +    crate://crates.io/rustversion/1.0.22 \
> +    crate://crates.io/ryu/1.0.23 \
> +    crate://crates.io/safetensors/0.7.0 \
> +    crate://crates.io/same-file/1.0.6 \
> +    crate://crates.io/sanitize-filename/0.6.0 \
> +    crate://crates.io/scc/2.4.0 \
> +    crate://crates.io/schannel/0.1.29 \
> +    crate://crates.io/schemars/0.9.0 \
> +    crate://crates.io/schemars/1.2.1 \
> +    crate://crates.io/scoped-tls/1.0.1 \
> +    crate://crates.io/scopeguard/1.2.0 \
> +    crate://crates.io/sct/0.7.1 \
> +    crate://crates.io/sdd/3.0.10 \
> +    crate://crates.io/sdp-types/0.1.8 \
> +    crate://crates.io/sec1/0.3.0 \
> +    crate://crates.io/sec1/0.7.3 \
> +    crate://crates.io/security-framework/2.11.1 \
> +    crate://crates.io/security-framework/3.7.0 \
> +    crate://crates.io/security-framework-sys/2.17.0 \
> +    crate://crates.io/semver/1.0.28 \
> +    crate://crates.io/serde/1.0.228 \
> +    crate://crates.io/serde_bytes/0.11.19 \
> +    crate://crates.io/serde_core/1.0.228 \
> +    crate://crates.io/serde_derive/1.0.228 \
> +    crate://crates.io/serde_json/1.0.149 \
> +    crate://crates.io/serde_path_to_error/0.1.20 \
> +    crate://crates.io/serde_spanned/1.1.1 \
> +    crate://crates.io/serde_urlencoded/0.7.1 \
> +    crate://crates.io/serde_with/3.20.0 \
> +    crate://crates.io/serde_with_macros/3.20.0 \
> +    crate://crates.io/serial_test/3.4.0 \
> +    crate://crates.io/serial_test_derive/3.4.0 \
> +    crate://crates.io/sfv/0.14.0 \
> +    crate://crates.io/sha1/0.10.6 \
> +    crate://crates.io/sha1/0.11.0 \
> +    crate://crates.io/sha2/0.10.9 \
> +    crate://crates.io/sha2/0.11.0 \
> +    crate://crates.io/sha256/1.6.0 \
> +    crate://crates.io/shannon/0.2.0 \
> +    crate://crates.io/sharded-slab/0.1.7 \
> +    crate://crates.io/shell-words/1.1.1 \
> +    crate://crates.io/shlex/1.3.0 \
> +    crate://crates.io/signal-hook/0.4.4 \
> +    crate://crates.io/signal-hook-registry/1.4.8 \
> +    crate://crates.io/signalsmith-stretch/0.1.3 \
> +    crate://crates.io/signature/1.6.4 \
> +    crate://crates.io/signature/2.2.0 \
> +    crate://crates.io/simd-adler32/0.3.9 \
> +    crate://crates.io/simd_cesu8/1.1.1 \
> +    crate://crates.io/simd_helpers/0.1.0 \
> +    crate://crates.io/simdutf8/0.1.5 \
> +    crate://crates.io/siphasher/1.0.3 \
> +    crate://crates.io/skia-bindings/0.93.1 \
> +    crate://crates.io/skia-safe/0.93.1 \
> +    crate://crates.io/slab/0.4.12 \
> +    crate://crates.io/slotmap/1.1.1 \
> +    crate://crates.io/slug/0.1.6 \
> +    crate://crates.io/smallvec/1.15.1 \
> +    crate://crates.io/smawk/0.3.2 \
> +    crate://crates.io/socket2/0.5.10 \
> +    crate://crates.io/socket2/0.6.3 \
> +    crate://crates.io/sodiumoxide/0.2.7 \
> +    crate://crates.io/spin/0.9.8 \
> +    crate://crates.io/spin/0.10.0 \
> +    crate://crates.io/spinning_top/0.3.0 \
> +    crate://crates.io/spirv/0.3.0+sdk-1.3.268.0 \
> +    crate://crates.io/spki/0.6.0 \
> +    crate://crates.io/spki/0.7.3 \
> +    crate://crates.io/sprintf/0.4.3 \
> +    crate://crates.io/stable-vec/0.4.2 \
> +    crate://crates.io/stable_deref_trait/1.2.1 \
> +    crate://crates.io/static_assertions/1.1.0 \
> +    crate://crates.io/strength_reduce/0.2.4 \
> +    crate://crates.io/strsim/0.11.1 \
> +    crate://crates.io/subtle/2.6.1 \
> +    crate://crates.io/symphonia/0.5.5 \
> +    crate://crates.io/symphonia-bundle-flac/0.5.5 \
> +    crate://crates.io/symphonia-bundle-mp3/0.5.5 \
> +    crate://crates.io/symphonia-codec-vorbis/0.5.5 \
> +    crate://crates.io/symphonia-core/0.5.5 \
> +    crate://crates.io/symphonia-format-ogg/0.5.5 \
> +    crate://crates.io/symphonia-metadata/0.5.5 \
> +    crate://crates.io/symphonia-utils-xiph/0.5.5 \
> +    crate://crates.io/syn/1.0.109 \
> +    crate://crates.io/syn/2.0.117 \
> +    crate://crates.io/sync_wrapper/1.0.2 \
> +    crate://crates.io/synstructure/0.13.2 \
> +    crate://crates.io/sysinfo/0.36.1 \
> +    crate://crates.io/system-configuration/0.7.0 \
> +    crate://crates.io/system-configuration-sys/0.6.0 \
> +    crate://crates.io/system-deps/7.0.8 \
> +    crate://crates.io/tar/0.4.45 \
> +    crate://crates.io/target-lexicon/0.12.16 \
> +    crate://crates.io/target-lexicon/0.13.5 \
> +    crate://crates.io/tempfile/3.27.0 \
> +    crate://crates.io/termcolor/1.4.1 \
> +    crate://crates.io/test-log/0.2.20 \
> +    crate://crates.io/test-log-core/0.2.20 \
> +    crate://crates.io/test-log-macros/0.2.20 \
> +    crate://crates.io/test-with/0.16.1 \
> +    crate://crates.io/test-with-derive/0.16.1 \
> +    crate://crates.io/text_placeholder/0.5.1 \
> +    crate://crates.io/textdistance/1.1.1 \
> +    crate://crates.io/textwrap/0.16.2 \
> +    crate://crates.io/thiserror/1.0.69 \
> +    crate://crates.io/thiserror/2.0.18 \
> +    crate://crates.io/thiserror-impl/1.0.69 \
> +    crate://crates.io/thiserror-impl/2.0.18 \
> +    crate://crates.io/thread_local/1.1.9 \
> +    crate://crates.io/time/0.3.47 \
> +    crate://crates.io/time-core/0.1.8 \
> +    crate://crates.io/time-macros/0.2.27 \
> +    crate://crates.io/tiny-keccak/2.0.2 \
> +    crate://crates.io/tinystr/0.8.3 \
> +    crate://crates.io/tinyvec/1.11.0 \
> +    crate://crates.io/tinyvec_macros/0.1.1 \
> +    crate://crates.io/tokio/1.52.3 \
> +    crate://crates.io/tokio-macros/2.7.0 \
> +    crate://crates.io/tokio-rustls/0.24.1 \
> +    crate://crates.io/tokio-rustls/0.25.0 \
> +    crate://crates.io/tokio-rustls/0.26.4 \
> +    crate://crates.io/tokio-stream/0.1.18 \
> +    crate://crates.io/tokio-tungstenite/0.20.1 \
> +    crate://crates.io/tokio-tungstenite/0.27.0 \
> +    crate://crates.io/tokio-tungstenite/0.28.0 \
> +    crate://crates.io/tokio-util/0.7.18 \
> +    crate://crates.io/toml/0.9.12+spec-1.1.0 \
> +    crate://crates.io/toml/1.1.2+spec-1.1.0 \
> +    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
> +    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
> +    crate://crates.io/toml_edit/0.25.11+spec-1.1.0 \
> +    crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
> +    crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
> +    crate://crates.io/tower/0.5.3 \
> +    crate://crates.io/tower-http/0.6.10 \
> +    crate://crates.io/tower-layer/0.3.3 \
> +    crate://crates.io/tower-service/0.3.3 \
> +    crate://crates.io/tracel-ash/0.38.0+1.3.296 \
> +    crate://crates.io/tracel-llvm/20.1.4-7 \
> +    crate://crates.io/tracel-llvm-bundler/20.1.4-7 \
> +    crate://crates.io/tracel-mlir-rs/20.1.4-7 \
> +    crate://crates.io/tracel-mlir-rs-macros/20.1.4-7 \
> +    crate://crates.io/tracel-mlir-sys/20.1.4-7 \
> +    crate://crates.io/tracel-rspirv/0.12.1+sdk-1.4.341.0 \
> +    crate://crates.io/tracel-tblgen-rs/20.1.4-7 \
> +    crate://crates.io/tracing/0.1.44 \
> +    crate://crates.io/tracing-attributes/0.1.31 \
> +    crate://crates.io/tracing-core/0.1.36 \
> +    crate://crates.io/tracing-log/0.2.0 \
> +    crate://crates.io/tracing-subscriber/0.3.23 \
> +    crate://crates.io/transpose/0.2.3 \
> +    crate://crates.io/try-lock/0.2.5 \
> +    crate://crates.io/tungstenite/0.20.1 \
> +    crate://crates.io/tungstenite/0.27.0 \
> +    crate://crates.io/tungstenite/0.28.0 \
> +    crate://crates.io/tungstenite/0.29.0 \
> +    crate://crates.io/type-map/0.5.1 \
> +    crate://crates.io/typed-arena/2.0.2 \
> +    crate://crates.io/typed-path/0.12.3 \
> +    crate://crates.io/typenum/1.20.0 \
> +    crate://crates.io/unicase/2.9.0 \
> +    crate://crates.io/unicode-ident/1.0.24 \
> +    crate://crates.io/unicode-linebreak/0.1.5 \
> +    crate://crates.io/unicode-normalization/0.1.25 \
> +    crate://crates.io/unicode-segmentation/1.13.2 \
> +    crate://crates.io/unicode-width/0.2.2 \
> +    crate://crates.io/unicode-xid/0.2.6 \
> +    crate://crates.io/unicode_categories/0.1.1 \
> +    crate://crates.io/unindent/0.2.4 \
> +    crate://crates.io/unit-prefix/0.5.2 \
> +    crate://crates.io/untrusted/0.9.0 \
> +    crate://crates.io/unty/0.0.4 \
> +    crate://crates.io/url/2.5.8 \
> +    crate://crates.io/url-escape/0.1.1 \
> +    crate://crates.io/urlencoding/2.1.3 \
> +    crate://crates.io/utf-8/0.7.6 \
> +    crate://crates.io/utf8_iter/1.0.4 \
> +    crate://crates.io/utf8parse/0.2.2 \
> +    crate://crates.io/uuid/1.23.1 \
> +    crate://crates.io/v_frame/0.3.9 \
> +    crate://crates.io/va_list/0.1.4 \
> +    crate://crates.io/valuable/0.1.1 \
> +    crate://crates.io/variadics_please/1.1.0 \
> +    crate://crates.io/vcpkg/0.2.15 \
> +    crate://crates.io/vergen/9.0.6 \
> +    crate://crates.io/vergen-gitcl/1.0.8 \
> +    crate://crates.io/vergen-lib/0.1.6 \
> +    crate://crates.io/version-compare/0.2.1 \
> +    crate://crates.io/version_check/0.9.5 \
> +    crate://crates.io/void/1.0.2 \
> +    crate://crates.io/vsimd/0.8.0 \
> +    crate://crates.io/vvdec/0.6.11 \
> +    crate://crates.io/vvdec-sys/0.7.0 \
> +    crate://crates.io/waker-fn/1.2.0 \
> +    crate://crates.io/walkdir/2.5.0 \
> +    crate://crates.io/want/0.3.1 \
> +    crate://crates.io/warp/0.4.3 \
> +    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
> +    crate://crates.io/wasip2/1.0.3+wasi-0.2.9 \
> +    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
> +    crate://crates.io/wasm-bindgen/0.2.121 \
> +    crate://crates.io/wasm-bindgen-futures/0.4.71 \
> +    crate://crates.io/wasm-bindgen-macro/0.2.121 \
> +    crate://crates.io/wasm-bindgen-macro-support/0.2.121 \
> +    crate://crates.io/wasm-bindgen-shared/0.2.121 \
> +    crate://crates.io/wasm-encoder/0.244.0 \
> +    crate://crates.io/wasm-metadata/0.244.0 \
> +    crate://crates.io/wasm-streams/0.4.2 \
> +    crate://crates.io/wasmparser/0.244.0 \
> +    crate://crates.io/web-sys/0.3.98 \
> +    crate://crates.io/web-time/1.1.0 \
> +    crate://crates.io/web-transport-proto/0.6.0 \
> +    crate://crates.io/web-transport-quinn/0.11.9 \
> +    crate://crates.io/web-transport-trait/0.3.4 \
> +    crate://crates.io/webm-iterable/0.6.4 \
> +    crate://crates.io/webpki/0.22.4 \
> +    crate://crates.io/webpki-root-certs/1.0.7 \
> +    crate://crates.io/webpki-roots/0.26.11 \
> +    crate://crates.io/webpki-roots/1.0.7 \
> +    crate://crates.io/weezl/0.1.12 \
> +    crate://crates.io/wgpu/26.0.1 \
> +    crate://crates.io/wgpu-core/26.0.1 \
> +    crate://crates.io/wgpu-core-deps-apple/26.0.0 \
> +    crate://crates.io/wgpu-core-deps-emscripten/26.0.0 \
> +    crate://crates.io/wgpu-core-deps-windows-linux-android/26.0.0 \
> +    crate://crates.io/wgpu-hal/26.0.6 \
> +    crate://crates.io/wgpu-types/26.0.0 \
> +    crate://crates.io/which/4.4.2 \
> +    crate://crates.io/whisper-rs/0.16.0 \
> +    crate://crates.io/whisper-rs-sys/0.15.0 \
> +    crate://crates.io/winapi/0.3.9 \
> +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/winapi-util/0.1.11 \
> +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> +    crate://crates.io/windows/0.58.0 \
> +    crate://crates.io/windows/0.61.3 \
> +    crate://crates.io/windows-collections/0.2.0 \
> +    crate://crates.io/windows-core/0.58.0 \
> +    crate://crates.io/windows-core/0.61.2 \
> +    crate://crates.io/windows-core/0.62.2 \
> +    crate://crates.io/windows-future/0.2.1 \
> +    crate://crates.io/windows-implement/0.58.0 \
> +    crate://crates.io/windows-implement/0.60.2 \
> +    crate://crates.io/windows-interface/0.58.0 \
> +    crate://crates.io/windows-interface/0.59.3 \
> +    crate://crates.io/windows-link/0.1.3 \
> +    crate://crates.io/windows-link/0.2.1 \
> +    crate://crates.io/windows-numerics/0.2.0 \
> +    crate://crates.io/windows-registry/0.6.1 \
> +    crate://crates.io/windows-result/0.2.0 \
> +    crate://crates.io/windows-result/0.3.4 \
> +    crate://crates.io/windows-result/0.4.1 \
> +    crate://crates.io/windows-strings/0.1.0 \
> +    crate://crates.io/windows-strings/0.4.2 \
> +    crate://crates.io/windows-strings/0.5.1 \
> +    crate://crates.io/windows-sys/0.45.0 \
> +    crate://crates.io/windows-sys/0.52.0 \
> +    crate://crates.io/windows-sys/0.59.0 \
> +    crate://crates.io/windows-sys/0.60.2 \
> +    crate://crates.io/windows-sys/0.61.2 \
> +    crate://crates.io/windows-targets/0.42.2 \
> +    crate://crates.io/windows-targets/0.52.6 \
> +    crate://crates.io/windows-targets/0.53.5 \
> +    crate://crates.io/windows-threading/0.1.0 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
> +    crate://crates.io/windows_aarch64_msvc/0.42.2 \
> +    crate://crates.io/windows_aarch64_msvc/0.52.6 \
> +    crate://crates.io/windows_aarch64_msvc/0.53.1 \
> +    crate://crates.io/windows_i686_gnu/0.42.2 \
> +    crate://crates.io/windows_i686_gnu/0.52.6 \
> +    crate://crates.io/windows_i686_gnu/0.53.1 \
> +    crate://crates.io/windows_i686_gnullvm/0.52.6 \
> +    crate://crates.io/windows_i686_gnullvm/0.53.1 \
> +    crate://crates.io/windows_i686_msvc/0.42.2 \
> +    crate://crates.io/windows_i686_msvc/0.52.6 \
> +    crate://crates.io/windows_i686_msvc/0.53.1 \
> +    crate://crates.io/windows_x86_64_gnu/0.42.2 \
> +    crate://crates.io/windows_x86_64_gnu/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnu/0.53.1 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
> +    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
> +    crate://crates.io/windows_x86_64_msvc/0.42.2 \
> +    crate://crates.io/windows_x86_64_msvc/0.52.6 \
> +    crate://crates.io/windows_x86_64_msvc/0.53.1 \
> +    crate://crates.io/winnow/0.7.15 \
> +    crate://crates.io/winnow/1.0.2 \
> +    crate://crates.io/wit-bindgen/0.51.0 \
> +    crate://crates.io/wit-bindgen/0.57.1 \
> +    crate://crates.io/wit-bindgen-core/0.51.0 \
> +    crate://crates.io/wit-bindgen-rust/0.51.0 \
> +    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
> +    crate://crates.io/wit-component/0.244.0 \
> +    crate://crates.io/wit-parser/0.244.0 \
> +    crate://crates.io/writeable/0.6.3 \
> +    crate://crates.io/x509-parser/0.18.1 \
> +    crate://crates.io/xattr/1.6.1 \
> +    crate://crates.io/xml/1.3.0 \
> +    crate://crates.io/xml-rs/0.8.28 \
> +    crate://crates.io/xmlparser/0.13.6 \
> +    crate://crates.io/xmltree/0.12.0 \
> +    crate://crates.io/y4m/0.8.0 \
> +    crate://crates.io/yansi/1.0.1 \
> +    crate://crates.io/yasna/0.6.0 \
> +    crate://crates.io/yoke/0.8.2 \
> +    crate://crates.io/yoke-derive/0.8.2 \
> +    crate://crates.io/zerocopy/0.8.48 \
> +    crate://crates.io/zerocopy-derive/0.8.48 \
> +    crate://crates.io/zerofrom/0.1.7 \
> +    crate://crates.io/zerofrom-derive/0.1.7 \
> +    crate://crates.io/zeroize/1.8.2 \
> +    crate://crates.io/zeroize_derive/1.4.3 \
> +    crate://crates.io/zerotrie/0.2.4 \
> +    crate://crates.io/zerovec/0.11.6 \
> +    crate://crates.io/zerovec-derive/0.11.3 \
> +    crate://crates.io/zip/7.2.0 \
> +    crate://crates.io/zlib-rs/0.6.3 \
> +    crate://crates.io/zmij/1.0.21 \
> +    crate://crates.io/zopfli/0.8.3 \
> +    crate://crates.io/zstd/0.13.3 \
> +    crate://crates.io/zstd-safe/7.2.4 \
> +    crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
> +"
> +
> +SRC_URI[addr2line-0.25.1.sha256sum] = "1b5d307320b3181d6d7954e663bd7c774a838b8220fe0593c86d9fb09f498b4b"
> +SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
> +SRC_URI[aes-0.8.4.sha256sum] = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
> +SRC_URI[ahash-0.8.12.sha256sum] = "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
> +SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
> +SRC_URI[aligned-0.4.3.sha256sum] = "ee4508988c62edf04abd8d92897fca0c2995d907ce1dfeaf369dac3716a40685"
> +SRC_URI[aligned-vec-0.6.4.sha256sum] = "dc890384c8602f339876ded803c97ad529f3842aba97f6392b3dba0dd171769b"
> +SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
> +SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
> +SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
> +SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
> +SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
> +SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
> +SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
> +SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
> +SRC_URI[anymap3-1.0.1.sha256sum] = "170433209e817da6aae2c51aa0dd443009a613425dd041ebfb2492d1c4c11a25"
> +SRC_URI[arbitrary-1.4.2.sha256sum] = "c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1"
> +SRC_URI[arg_enum_proc_macro-0.3.4.sha256sum] = "0ae92a5119aa49cdbcf6b9f893fe4e1d98b04ccbf82ee0584ad948a44a734dea"
> +SRC_URI[array-init-2.1.0.sha256sum] = "3d62b7694a562cdf5a74227903507c56ab2cc8bdd1f781ed5cb4cf9c9f810bfc"
> +SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
> +SRC_URI[as-slice-0.2.1.sha256sum] = "516b6b4f0e40d50dcda9365d53964ec74560ad4284da2e7fc97122cd83174516"
> +SRC_URI[ash-0.38.0+1.3.281.sha256sum] = "0bb44936d800fea8f016d7f2311c6a4f97aebd5dc86f09906139ec848cf3a46f"
> +SRC_URI[asn1-rs-0.7.1.sha256sum] = "56624a96882bb8c26d61312ae18cb45868e5a9992ea73c58e45c3101e56a1e60"
> +SRC_URI[asn1-rs-derive-0.6.0.sha256sum] = "3109e49b1e4909e9db6515a30c633684d68cdeaa252f215214cb4fa1a5bfee2c"
> +SRC_URI[asn1-rs-impl-0.2.0.sha256sum] = "7b18050c2cd6fe86c3a76584ef5e0baf286d038cda203eb6223df2cc413565f7"
> +SRC_URI[async-channel-2.5.0.sha256sum] = "924ed96dd52d1b75e9c1a3e6275715fd320f5f9439fb5a4a11fa51f4221158d2"
> +SRC_URI[async-compression-0.4.42.sha256sum] = "e79b3f8a79cccc2898f31920fc69f304859b3bd567490f75ebf51ae1c792a9ac"
> +SRC_URI[async-lock-3.4.2.sha256sum] = "290f7f2596bd5b78a9fec8088ccd89180d7f9f55b94b0576823bbbdc72ee8311"
> +SRC_URI[async-recursion-1.1.1.sha256sum] = "3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11"
> +SRC_URI[async-stream-0.3.6.sha256sum] = "0b5a71a6f37880a80d1d7f19efd781e4b5de42c88f0722cc13bcb6cc2cfe8476"
> +SRC_URI[async-stream-impl-0.3.6.sha256sum] = "c7c24de15d275a1ecfd47a380fb4d5ec9bfe0933f309ed5e705b775596a3574d"
> +SRC_URI[async-task-4.7.1.sha256sum] = "8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de"
> +SRC_URI[async-trait-0.1.89.sha256sum] = "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
> +SRC_URI[async-tungstenite-0.34.1.sha256sum] = "8447f02eaa65412035e2d3eeaa3fc82bbb8d7137c84c5976b4af685136012ee9"
> +SRC_URI[atomic-waker-1.1.2.sha256sum] = "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
> +SRC_URI[atomic_float-1.1.0.sha256sum] = "628d228f918ac3b82fe590352cc719d30664a0c13ca3a60266fe02c7132d480a"
> +SRC_URI[atomic_refcell-0.1.14.sha256sum] = "21e4227379beff4205943696e6c3e0cd809bacdf3f0edd6e3dd153e2269571a4"
> +SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
> +SRC_URI[av-data-0.4.4.sha256sum] = "fca67ba5d317924c02180c576157afd54babe48a76ebc66ce6d34bb8ba08308e"
> +SRC_URI[av-scenechange-0.14.1.sha256sum] = "0f321d77c20e19b92c39e7471cf986812cbb46659d2af674adc4331ef3f18394"
> +SRC_URI[av1-grain-0.2.5.sha256sum] = "8cfddb07216410377231960af4fcab838eaa12e013417781b78bd95ee22077f8"
> +SRC_URI[aws-config-1.8.16.sha256sum] = "50f156acdd2cf55f5aa53ee416c4ac851cf1222694506c0b1f78c85695e9ca9d"
> +SRC_URI[aws-credential-types-1.2.14.sha256sum] = "8f20799b373a1be121fe3005fba0c2090af9411573878f224df44b42727fcaf7"
> +SRC_URI[aws-runtime-1.7.3.sha256sum] = "5dcd93c82209ac7413532388067dce79be5a8780c1786e5fae3df22e4dee2864"
> +SRC_URI[aws-sdk-kinesisvideo-1.100.0.sha256sum] = "423ac3b091283a64e28c0d89bb8d285502c635c8d85a87f74c618ebe84a6a0af"
> +SRC_URI[aws-sdk-kinesisvideosignaling-1.98.0.sha256sum] = "02e60f628d8e7d9a4764857341e4a82604ce4bc3bfb72a021e71f70e594f02fe"
> +SRC_URI[aws-sdk-polly-1.106.0.sha256sum] = "aedf8415d6909f5cd0ffd6669313eafd5b10a110b7306de2f3df2d3ebdb8844b"
> +SRC_URI[aws-sdk-s3-1.132.0.sha256sum] = "5575840a3a6b11f6011463ebe359320dfe5b67babb5e9b06fed6ddf809a9ab40"
> +SRC_URI[aws-sdk-sso-1.98.0.sha256sum] = "d69c77aafa20460c68b6b3213c84f6423b6e76dbf89accd3e1789a686ffd9489"
> +SRC_URI[aws-sdk-sts-1.103.0.sha256sum] = "c2249b81a2e73a8027c41c378463a81ec39b8510f184f2caab87de912af0f49b"
> +SRC_URI[aws-sdk-transcribestreaming-1.103.0.sha256sum] = "9e3025be53b063917cc86846bbe0c235542fb44ad38163b85de400ced3cda234"
> +SRC_URI[aws-sdk-translate-1.98.0.sha256sum] = "7eb0e2f6b3f4dbaedc768eb6cd9b20c11ace5db6b64094ec7ddb6450c8577d56"
> +SRC_URI[aws-sigv4-1.4.3.sha256sum] = "68dc0b907359b120170613b5c09ccc61304eac3998ff6274b97d93ee6490115a"
> +SRC_URI[aws-smithy-async-1.2.14.sha256sum] = "2ffcaf626bdda484571968400c326a244598634dc75fd451325a54ad1a59acfc"
> +SRC_URI[aws-smithy-checksums-0.64.7.sha256sum] = "10efbbcec1e044b81600e2fc562a391951d291152d95b482d5b7e7132299d762"
> +SRC_URI[aws-smithy-eventstream-0.60.20.sha256sum] = "faf09d74e5e32f76b8762da505a3cd59303e367a664ca67295387baa8c1d7548"
> +SRC_URI[aws-smithy-http-0.63.6.sha256sum] = "ba1ab2dc1c2c3749ead27180d333c42f11be8b0e934058fb4b2258ee8dbe5231"
> +SRC_URI[aws-smithy-http-client-1.1.12.sha256sum] = "6a2f165a7feee6f263028b899d0a181987f4fa7179a6411a32a439fba7c5f769"
> +SRC_URI[aws-smithy-json-0.62.5.sha256sum] = "9648b0bb82a2eedd844052c6ad2a1a822d1f8e3adee5fbf668366717e428856a"
> +SRC_URI[aws-smithy-observability-0.2.6.sha256sum] = "a06c2315d173edbf1920da8ba3a7189695827002e4c0fc961973ab1c54abca9c"
> +SRC_URI[aws-smithy-query-0.60.15.sha256sum] = "1a56d79744fb3edb5d722ef79d86081e121d3b9422cb209eb03aea6aa4f21ebd"
> +SRC_URI[aws-smithy-runtime-1.11.1.sha256sum] = "0504b1ab12debb5959e5165ee5fe97dd387e7aa7ea6a477bfd7635dfe769a4f5"
> +SRC_URI[aws-smithy-runtime-api-1.12.0.sha256sum] = "b71a13df6ada0aafbf21a73bdfcdf9324cfa9df77d96b8446045be3cde61b42e"
> +SRC_URI[aws-smithy-runtime-api-macros-1.0.0.sha256sum] = "8d7396fd9500589e62e460e987ecb671bad374934e55ec3b5f498cc7a8a8a7b7"
> +SRC_URI[aws-smithy-types-1.4.7.sha256sum] = "9d73dbfbaa8e4bc57b9045137680b958d274823509a360abfd8e1d514d40c95c"
> +SRC_URI[aws-smithy-xml-0.60.15.sha256sum] = "0ce02add1aa3677d022f8adf81dcbe3046a95f17a1b1e8979c145cd21d3d22b3"
> +SRC_URI[aws-types-1.3.15.sha256sum] = "2f4bbcaa9304ea40902d3d5f42a0428d1bd895a2b0f6999436fb279ffddc58ac"
> +SRC_URI[backtrace-0.3.76.sha256sum] = "bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6"
> +SRC_URI[base16ct-0.1.1.sha256sum] = "349a06037c7bf932dd7e7d1f653678b2038b9ad46a74102f1fc7bd7872678cce"
> +SRC_URI[base16ct-0.2.0.sha256sum] = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
> +SRC_URI[base32-0.5.1.sha256sum] = "022dfe9eb35f19ebbcb51e0b40a5ab759f46ad60cadf7297e0bd085afb50e076"
> +SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> +SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> +SRC_URI[base64-serde-0.8.0.sha256sum] = "77c6d128af408d8ebd08331f0331cf2cf20d19e6c44a7aec58791641ecc8c0b5"
> +SRC_URI[base64-simd-0.8.0.sha256sum] = "339abbe78e73178762e23bea9dfd08e697eb3f3301cd4be981c0f78ba5859195"
> +SRC_URI[base64ct-1.8.3.sha256sum] = "2af50177e190e07a26ab74f8b1efbfe2ef87da2116221318cb1c2e82baf7de06"
> +SRC_URI[bincode-1.3.3.sha256sum] = "b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad"
> +SRC_URI[bincode-2.0.1.sha256sum] = "36eaf5d7b090263e8150820482d5d93cd964a81e4019913c972f4edcc6edb740"
> +SRC_URI[bindgen-0.70.1.sha256sum] = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
> +SRC_URI[bindgen-0.71.1.sha256sum] = "5f58bf3d7db68cfbac37cfc485a8d711e87e064c3d0fe0435b92f7a407f9d6b3"
> +SRC_URI[bindgen-0.72.1.sha256sum] = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
> +SRC_URI[bit-set-0.8.0.sha256sum] = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
> +SRC_URI[bit-vec-0.8.0.sha256sum] = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
> +SRC_URI[bit-vec-0.9.1.sha256sum] = "b71798fca2c1fe1086445a7258a4bc81e6e49dcd24c8d0dd9a1e57395b603f51"
> +SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> +SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
> +SRC_URI[bitreader-0.3.11.sha256sum] = "886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066"
> +SRC_URI[bitstream-io-4.10.0.sha256sum] = "7eff00be299a18769011411c9def0d827e8f2d7bf0c3dbf53633147a8867fd1f"
> +SRC_URI[block-0.1.6.sha256sum] = "0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a"
> +SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
> +SRC_URI[block-buffer-0.12.0.sha256sum] = "cdd35008169921d80bc60d3d0ab416eecb028c4cd653352907921d95084790be"
> +SRC_URI[block2-0.6.2.sha256sum] = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
> +SRC_URI[bs58-0.5.1.sha256sum] = "bf88ba1141d185c399bee5288d850d63b8369520c1eafc32a0430b5b6c287bf4"
> +SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
> +SRC_URI[built-0.8.0.sha256sum] = "f4ad8f11f288f48ca24471bbd51ac257aaeaaa07adae295591266b792902ae64"
> +SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
> +SRC_URI[burn-0.20.1.sha256sum] = "b78ff10ed98b73e1d477ea6e6e1ec1b9cf9f71a17afc3fea9f4dca482d43dcd4"
> +SRC_URI[burn-backend-0.20.1.sha256sum] = "a724a5d8d5865a1f6b304f629eb19f51489760689501c583b3e1f4209f067357"
> +SRC_URI[burn-core-0.20.1.sha256sum] = "9c3634c3ba84397bcf2977ce746954d7e0a40e2d862e92362dd694c29e18df62"
> +SRC_URI[burn-cpu-0.20.1.sha256sum] = "60aa53c4536719f1c91c250d4b4348daca473c44cf0c45b81096785f5510c192"
> +SRC_URI[burn-cubecl-0.20.1.sha256sum] = "8d6d13aff03fec966da4300459688883f8a1d741dddbf19d1bfc2562656a9a9b"
> +SRC_URI[burn-derive-0.20.1.sha256sum] = "102d7e2f705b0cda2f89dd0e55e9bbfc6184029929d53487beb606c3303b29a5"
> +SRC_URI[burn-ir-0.20.1.sha256sum] = "fd2b1b37a7289bd85438800deaaebde50507336429b80f96a71730794db5bc31"
> +SRC_URI[burn-ndarray-0.20.1.sha256sum] = "96be578991cecef163e41a73bf985d8d7eb7fb8ef7bececf8d48523c481ecddf"
> +SRC_URI[burn-nn-0.20.1.sha256sum] = "14b8c6c14b94e5b1dddd68f8e6d669f20bac8f99fcb2e4f1a480212d1b598133"
> +SRC_URI[burn-optim-0.20.1.sha256sum] = "5a8c376d835d92ea363c05c6f48ac19bb687b683c7958c310a716ef8d5d77ba3"
> +SRC_URI[burn-std-0.20.1.sha256sum] = "25a9ed8e34a4a49d3754586f306075d6b55a5e08343ac75c06f47e7d9f825271"
> +SRC_URI[burn-store-0.20.1.sha256sum] = "4be80a7b084a19901dc1d0a2e9b77e226c5c575879fe66de891c67062db41a6d"
> +SRC_URI[burn-tensor-0.20.1.sha256sum] = "3720e52e00ed0155ced4f8681d0e8a362e699cee36494ec5b97ad44fcc5194c0"
> +SRC_URI[burn-wgpu-0.20.1.sha256sum] = "df78d62afc9b9fbb8ee4e49b72006485bb64f778a790e185a2d919479bcfc008"
> +SRC_URI[byte-slice-cast-1.2.3.sha256sum] = "7575182f7272186991736b70173b0ea045398f984bf5ebbb3804736ce1330c9d"
> +SRC_URI[bytemuck-1.25.0.sha256sum] = "c8efb64bd706a16a1bdde310ae86b351e4d21550d98d056f22f8a7f7a2183fec"
> +SRC_URI[bytemuck_derive-1.10.2.sha256sum] = "f9abbd1bc6865053c427f7198e6af43bfdedc55ab791faed4fbd361d789575ff"
> +SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
> +SRC_URI[byteorder-lite-0.1.0.sha256sum] = "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
> +SRC_URI[byteorder_slice-3.0.0.sha256sum] = "0b294e30387378958e8bf8f4242131b930ea615ff81e8cac2440cea0a6013190"
> +SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
> +SRC_URI[bytes-utils-0.1.4.sha256sum] = "7dafe3a8757b027e2be6e4e5601ed563c55989fcf1546e933c66c8eb3a058d35"
> +SRC_URI[bzip2-0.6.1.sha256sum] = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c"
> +SRC_URI[c2rust-bitfields-0.20.0.sha256sum] = "46dc7d2bffa0d0b3d47eb2dc69973466858281446c2ac9f6d8a10e92ab1017df"
> +SRC_URI[c2rust-bitfields-derive-0.20.0.sha256sum] = "ebe1117afa5937ce280034e31fa1e84ed1824a252f75380327eed438535333f8"
> +SRC_URI[caseless-0.2.2.sha256sum] = "8b6fd507454086c8edfd769ca6ada439193cdb209c7681712ef6275cccbfe5d8"
> +SRC_URI[cc-1.2.62.sha256sum] = "a1dce859f0832a7d088c4f1119888ab94ef4b5d6795d1ce05afb7fe159d79f98"
> +SRC_URI[cdg-0.1.0.sha256sum] = "d254b2c9fc971518da5d652aee7edc6b9bb96fa32de28f166895faf69d9926e6"
> +SRC_URI[cdg_renderer-0.8.0.sha256sum] = "0070ec0e6be4ed55d28bcfc499ecd479cb3764181eee2018dc661d8efd4e3f71"
> +SRC_URI[cdp-types-0.3.0.sha256sum] = "332ca05a88e143d80a245f9aa6c65b6e6383ee3e332017005647c27c6a62f902"
> +SRC_URI[cea608-types-0.1.4.sha256sum] = "5dfc9d3f5161702cf339e6337203ac26b64279383468247e45b36e221cb06cae"
> +SRC_URI[cea708-types-0.4.1.sha256sum] = "de28b1d549e7f8f53a746fb36ae4c10c776a8e004950b527be1669a58667ae0b"
> +SRC_URI[cesu8-1.1.0.sha256sum] = "6d43a04d8753f35258c91f8ec639f792891f748a1edbd759cf1dcea3382ad83c"
> +SRC_URI[cexpr-0.6.0.sha256sum] = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
> +SRC_URI[cfg-expr-0.17.2.sha256sum] = "8d4ba6e40bd1184518716a6e1a781bf9160e286d219ccdb8ab2612e74cfe4789"
> +SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> +SRC_URI[cfg_aliases-0.2.1.sha256sum] = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> +SRC_URI[chacha20-0.10.0.sha256sum] = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
> +SRC_URI[chrono-0.4.44.sha256sum] = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
> +SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
> +SRC_URI[clang-sys-1.8.1.sha256sum] = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
> +SRC_URI[clap-4.6.1.sha256sum] = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
> +SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
> +SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
> +SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
> +SRC_URI[claxon-0.4.3.sha256sum] = "4bfbf56724aa9eca8afa4fcfadeb479e722935bb2a0900c2d37e0cc477af0688"
> +SRC_URI[cmake-0.1.58.sha256sum] = "c0f78a02292a74a88ac736019ab962ece0bc380e3f977bf72e376c5d78ff0678"
> +SRC_URI[cmov-0.5.3.sha256sum] = "3f88a43d011fc4a6876cb7344703e297c71dda42494fee094d5f7c76bf13f746"
> +SRC_URI[codespan-reporting-0.12.0.sha256sum] = "fe6d2e5af09e8c8ad56c969f2157a3d4238cebc7c55f0a517728c38f7b200f81"
> +SRC_URI[color-name-1.2.0.sha256sum] = "2980f82525cf4a0eb43a7dcc1396bbea824897a98ef4948bd150310469acb432"
> +SRC_URI[color-thief-0.2.2.sha256sum] = "e6460d760cf38ce67c9e0318f896538820acc54f2d0a3bfc5b2c557211066c98"
> +SRC_URI[color_quant-1.1.0.sha256sum] = "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"
> +SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
> +SRC_URI[colored-3.1.1.sha256sum] = "faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34"
> +SRC_URI[combine-4.6.7.sha256sum] = "ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd"
> +SRC_URI[compression-codecs-0.4.38.sha256sum] = "ce2548391e9c1929c21bf6aa2680af86fe4c1b33e6cea9ac1cfeec0bd11218cf"
> +SRC_URI[compression-core-0.4.32.sha256sum] = "cc14f565cf027a105f7a44ccf9e5b424348421a1d8952a8fc9d499d313107789"
> +SRC_URI[comrak-0.39.1.sha256sum] = "2fefab951771fc3beeed0773ce66a4f7b706273fc6c4c95b08dd1615744abcf5"
> +SRC_URI[concurrent-queue-2.5.0.sha256sum] = "4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973"
> +SRC_URI[console-0.16.3.sha256sum] = "d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87"
> +SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
> +SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
> +SRC_URI[const-random-0.1.18.sha256sum] = "87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359"
> +SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
> +SRC_URI[constant_time_eq-0.3.1.sha256sum] = "7c74b8349d32d297c9134b8c88677813a227df8f779daa29bfc29c183fe3dca6"
> +SRC_URI[constcat-0.6.1.sha256sum] = "136d3e02915a2cea4d74caa8681e2d44b1c3254bdbf17d11d41d587ff858832c"
> +SRC_URI[convert_case-0.8.0.sha256sum] = "baaaa0ecca5b51987b9423ccdc971514dd8b0bb7b4060b983d3664dad3f1f89f"
> +SRC_URI[convert_case-0.10.0.sha256sum] = "633458d4ef8c78b72454de2d54fd6ab2e60f9e02be22f3c6104cdc8a4e0fceb9"
> +SRC_URI[cookie-0.18.1.sha256sum] = "4ddef33a339a91ea89fb53151bd0a4689cfce27055c291dfa69945475d22c747"
> +SRC_URI[cookie-factory-0.3.3.sha256sum] = "9885fa71e26b8ab7855e2ec7cae6e9b380edff76cd052e07c683a0319d51b3a2"
> +SRC_URI[cookie_store-0.22.1.sha256sum] = "15b2c103cf610ec6cae3da84a766285b42fd16aad564758459e6ecf128c75206"
> +SRC_URI[core-foundation-0.9.4.sha256sum] = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
> +SRC_URI[core-foundation-0.10.1.sha256sum] = "b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6"
> +SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
> +SRC_URI[core-graphics-types-0.2.0.sha256sum] = "3d44a101f213f6c4cdc1853d4b78aef6db6bdfa3468798cc1d9912f4735013eb"
> +SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
> +SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
> +SRC_URI[crc-3.3.0.sha256sum] = "9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675"
> +SRC_URI[crc-catalog-2.5.0.sha256sum] = "217698eaf96b4a3f0bc4f3662aaa55bdf913cd54d7204591faa790070c6d0853"
> +SRC_URI[crc-fast-1.9.0.sha256sum] = "2fd92aca2c6001b1bf5ba0ff84ee74ec8501b52bbef0cac80bf25a6c1d87a83d"
> +SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
> +SRC_URI[critical-section-1.2.0.sha256sum] = "790eea4361631c5e7d22598ecd5723ff611904e3344ce8720784c93e3d83d40b"
> +SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
> +SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
> +SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
> +SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
> +SRC_URI[crypto-bigint-0.4.9.sha256sum] = "ef2b4b23cddf68b89b8f8069890e8c270d54e2d5fe1b143820234805e4cb17ef"
> +SRC_URI[crypto-bigint-0.5.5.sha256sum] = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
> +SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
> +SRC_URI[crypto-common-0.2.1.sha256sum] = "77727bb15fa921304124b128af125e7e3b968275d1b108b379190264f4423710"
> +SRC_URI[csound-0.1.8.sha256sum] = "8d49045d7365f5c2cadb1f20932189a0da101ac86c8dbe891975814b2348d57d"
> +SRC_URI[csound-sys-0.1.2.sha256sum] = "86b11869eaed111b64d29e66cc5c7de9f172d5b623b716eb74c5dd841dbcfe39"
> +SRC_URI[ctr-0.9.2.sha256sum] = "0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835"
> +SRC_URI[ctrlc-3.5.2.sha256sum] = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
> +SRC_URI[ctutils-0.4.2.sha256sum] = "7d5515a3834141de9eafb9717ad39eea8247b5674e6066c404e8c4b365d2a29e"
> +SRC_URI[cubecl-0.9.0.sha256sum] = "053856efd5436224775b9423d43d86f53d5b1d3af9a6b9983d9a313a0922638f"
> +SRC_URI[cubecl-common-0.9.0.sha256sum] = "60bf8aaeb572c8cf2f2ffd07fa9bb1a2cf9336d1aa11ecd4d9a2f2e30c4be706"
> +SRC_URI[cubecl-core-0.9.0.sha256sum] = "98374a31d2b68b55709891169832ccf205408c201c5e023964482441f213d0b9"
> +SRC_URI[cubecl-cpp-0.9.0.sha256sum] = "fb24d96c1ff84ab4def0a529e384311a15cb771310aaf2b640c312384c3bca23"
> +SRC_URI[cubecl-cpu-0.9.0.sha256sum] = "152588a6e16b6bda5e8216af7a6fad3d7de4697294b6ce0f6acbe3a9029ff674"
> +SRC_URI[cubecl-cuda-0.9.0.sha256sum] = "6f74a5750c45090d1fc5ddf6a19fea9a099aa1f6800b78f1167a2d60182d1d96"
> +SRC_URI[cubecl-ir-0.9.0.sha256sum] = "361b608ff9f05024c7a7e381852689acd95b6af5af956d68734692b27d5f75ef"
> +SRC_URI[cubecl-macros-0.9.0.sha256sum] = "7c9a872d16207c6a27ed45942fd311a281394dd384b14a21f72131db1556a977"
> +SRC_URI[cubecl-macros-internal-0.9.0.sha256sum] = "aa3fa0626cdf28b9c49084c2bb51493bfde44378e22d90624aacaafb81da3588"
> +SRC_URI[cubecl-opt-0.9.0.sha256sum] = "bdcff25fdcbd82ea4277c30a81e162722859f57c6ae105c0a3c53f8bb91154f6"
> +SRC_URI[cubecl-runtime-0.9.0.sha256sum] = "b02e28997a8d75311afae4d2cea7b593eb125312f845874118a59d78c7a6b34c"
> +SRC_URI[cubecl-spirv-0.9.0.sha256sum] = "d7d7d68a3e09d4782098f82b0b7347f3a9e54a9977b3b5a23145464a84cf14dc"
> +SRC_URI[cubecl-std-0.9.0.sha256sum] = "e8ff5741c98b7a7a5944b4afb0b67dd7f5e0be41ce7f303b587f8b0d6430b29b"
> +SRC_URI[cubecl-wgpu-0.9.0.sha256sum] = "29787364632fc7ec6a11cf3d95187f82f6fcce17d6bb4f0fb0dde580b837631d"
> +SRC_URI[cubecl-zspace-0.9.0.sha256sum] = "7a0f819071413b19a00b7105497e0f6d2cf3e7e9d65cbb8d4ecf1ddb29c61dc2"
> +SRC_URI[cubek-0.1.1.sha256sum] = "1bb1cce47db02017925301bedec92ae84628493df3f9761ea7ac42a60c6146f8"
> +SRC_URI[cubek-attention-0.1.1.sha256sum] = "7278bd122b2428af479f9af05285160613733c33c93b63ab3c6d25cd0460c18b"
> +SRC_URI[cubek-convolution-0.1.1.sha256sum] = "18eb04bca4ae104d62a56def04b04f3d079c42fe49aac62202c96876f90fa28b"
> +SRC_URI[cubek-matmul-0.1.1.sha256sum] = "a28f3b04b113760e97c65a8a4dca9afc220744031eeecd5ad6cd0e3be91ba3a9"
> +SRC_URI[cubek-quant-0.1.1.sha256sum] = "96ec3ae04af324df2d615c2b394e270d58d6f08cb833d67633e2ba794de75916"
> +SRC_URI[cubek-random-0.1.1.sha256sum] = "65a34844d8b7f739185c1d24896137dcb73f458830444103b45f678585ad983e"
> +SRC_URI[cubek-reduce-0.1.1.sha256sum] = "42397d9ed85bb3084dfb56ed26de75690b5b07caf42a32f4006b57eb23d5b6d6"
> +SRC_URI[cudarc-0.18.2.sha256sum] = "3aa12038120eb13347a6ae2ffab1d34efe78150125108627fd85044dd4d6ff1e"
> +SRC_URI[curve25519-dalek-4.1.3.sha256sum] = "97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be"
> +SRC_URI[curve25519-dalek-derive-0.1.1.sha256sum] = "f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
> +SRC_URI[darling-0.20.11.sha256sum] = "fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee"
> +SRC_URI[darling-0.21.3.sha256sum] = "9cdf337090841a411e2a7f3deb9187445851f91b309c0c0a29e05f74a00a48c0"
> +SRC_URI[darling-0.23.0.sha256sum] = "25ae13da2f202d56bd7f91c25fba009e7717a1e4a1cc98a76d844b65ae912e9d"
> +SRC_URI[darling_core-0.20.11.sha256sum] = "0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e"
> +SRC_URI[darling_core-0.21.3.sha256sum] = "1247195ecd7e3c85f83c8d2a366e4210d588e802133e1e355180a9870b517ea4"
> +SRC_URI[darling_core-0.23.0.sha256sum] = "9865a50f7c335f53564bb694ef660825eb8610e0a53d3e11bf1b0d3df31e03b0"
> +SRC_URI[darling_macro-0.20.11.sha256sum] = "fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead"
> +SRC_URI[darling_macro-0.21.3.sha256sum] = "d38308df82d1080de0afee5d069fa14b0326a88c14f15c5ccda35b4a6c414c81"
> +SRC_URI[darling_macro-0.23.0.sha256sum] = "ac3984ec7bd6cfa798e62b4a642426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d"
> +SRC_URI[dash-mpd-0.20.2.sha256sum] = "99aa4f01bf47635af7d137707d14665af5603d65fb410a64da42ad949527069c"
> +SRC_URI[dasp-0.11.0.sha256sum] = "7381b67da416b639690ac77c73b86a7b5e64a29e31d1f75fb3b1102301ef355a"
> +SRC_URI[dasp_envelope-0.11.0.sha256sum] = "8ec617ce7016f101a87fe85ed44180839744265fae73bb4aa43e7ece1b7668b6"
> +SRC_URI[dasp_frame-0.11.0.sha256sum] = "b2a3937f5fe2135702897535c8d4a5553f8b116f76c1529088797f2eee7c5cd6"
> +SRC_URI[dasp_interpolate-0.11.0.sha256sum] = "7fc975a6563bb7ca7ec0a6c784ead49983a21c24835b0bc96eea11ee407c7486"
> +SRC_URI[dasp_peak-0.11.0.sha256sum] = "5cf88559d79c21f3d8523d91250c397f9a15b5fc72fbb3f87fdb0a37b79915bf"
> +SRC_URI[dasp_ring_buffer-0.11.0.sha256sum] = "07d79e19b89618a543c4adec9c5a347fe378a19041699b3278e616e387511ea1"
> +SRC_URI[dasp_rms-0.11.0.sha256sum] = "a6c5dcb30b7e5014486e2822537ea2beae50b19722ffe2ed7549ab03774575aa"
> +SRC_URI[dasp_sample-0.11.0.sha256sum] = "0c87e182de0887fd5361989c677c4e8f5000cd9491d6d563161a8f3a5519fc7f"
> +SRC_URI[dasp_signal-0.11.0.sha256sum] = "aa1ab7d01689c6ed4eae3d38fe1cea08cba761573fbd2d592528d55b421077e7"
> +SRC_URI[dasp_slice-0.11.0.sha256sum] = "4e1c7335d58e7baedafa516cb361360ff38d6f4d3f9d9d5ee2a2fc8e27178fa1"
> +SRC_URI[dasp_window-0.11.1.sha256sum] = "99ded7b88821d2ce4e8b842c9f1c86ac911891ab89443cc1de750cae764c5076"
> +SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
> +SRC_URI[dav1d-0.11.1.sha256sum] = "3ee89cb860616069c67520dcd66cacdb900b57c799f634a0eb6d91f6e2a82b61"
> +SRC_URI[dav1d-sys-0.8.3.sha256sum] = "c3c91aea6668645415331133ed6f8ddf0e7f40160cd97a12d59e68716a58704b"
> +SRC_URI[deepgram-0.7.0.sha256sum] = "49bf11c4dc8fc1e7c94fc4198f82f64536fdb9eded7b5a076d9597d8b67e1fd1"
> +SRC_URI[deflate64-0.1.12.sha256sum] = "ac6b926516df9c60bfa16e107b21086399f8285a44ca9711344b9e553c5146e2"
> +SRC_URI[der-0.6.1.sha256sum] = "f1a467a65c5e759bce6e65eaf91cc29f466cdc57cb65777bd646872a8a1fd4de"
> +SRC_URI[der-0.7.10.sha256sum] = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
> +SRC_URI[der-parser-10.0.0.sha256sum] = "07da5016415d5a3c4dd39b11ed26f915f52fc4e0dc197d87908bc916e51bc1a6"
> +SRC_URI[deranged-0.5.8.sha256sum] = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
> +SRC_URI[derive-into-owned-0.2.0.sha256sum] = "2c9d94d81e3819a7b06a8638f448bc6339371ca9b6076a99d4a43eece3c4c923"
> +SRC_URI[derive-new-0.7.0.sha256sum] = "2cdc8d50f426189eef89dac62fabfa0abb27d5cc008f25bf4156a0203325becc"
> +SRC_URI[derive_builder-0.20.2.sha256sum] = "507dfb09ea8b7fa618fcf76e953f4f5e192547945816d5358edffe39f6f94947"
> +SRC_URI[derive_builder_core-0.20.2.sha256sum] = "2d5bcf7b024d6835cfb3d473887cd966994907effbe9227e8c8219824d06c4e8"
> +SRC_URI[derive_builder_macro-0.20.2.sha256sum] = "ab63b0e2bf4d5928aff72e83a7dace85d7bba5fe12dcc3c5a572d78caffd3f3c"
> +SRC_URI[derive_more-2.1.1.sha256sum] = "d751e9e49156b02b44f9c1815bcb94b984cdcc4396ecc32521c739452808b134"
> +SRC_URI[derive_more-impl-2.1.1.sha256sum] = "799a97264921d8623a957f6c3b9011f3b5492f557bbb7a5a19b7fa6d06ba8dcb"
> +SRC_URI[deunicode-1.6.2.sha256sum] = "abd57806937c9cc163efc8ea3910e00a62e2aeb0b8119f1793a978088f8f6b04"
> +SRC_URI[device-info-0.1.1.sha256sum] = "a2ca8e71544c1b67dcdbc2699ab258828aff985e5bc8d5f6b486d90d7df2f848"
> +SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
> +SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
> +SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2"
> +SRC_URI[dirs-6.0.0.sha256sum] = "c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e"
> +SRC_URI[dirs-sys-0.5.0.sha256sum] = "e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab"
> +SRC_URI[dispatch2-0.3.1.sha256sum] = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
> +SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
> +SRC_URI[document-features-0.2.12.sha256sum] = "d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61"
> +SRC_URI[dssim-core-3.4.0.sha256sum] = "e3c601412450ff29a9258b2f85b18b38f658caf70fad1692f40ca863d86cb753"
> +SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
> +SRC_URI[easyfft-0.4.2.sha256sum] = "767e39eef2ad8a3b6f1d733be3ec70364d21d437d06d4f18ea76ce08df20b75f"
> +SRC_URI[ebml-iterable-0.6.3.sha256sum] = "7b5173ac3752f08b526a6991509615e1a345b221ec3c58c7633433e8c9582312"
> +SRC_URI[ebml-iterable-specification-0.4.0.sha256sum] = "f56467af159a98735d44231f53eaa505e919e6003266f103b99649a93f106784"
> +SRC_URI[ebml-iterable-specification-derive-0.4.0.sha256sum] = "b066b81018300fdce40f71c4db355a102699324af96fad28f25ab1b5f87de066"
> +SRC_URI[ebur128-0.1.10.sha256sum] = "e227cc62d64d6fe01abbef48134b9c1f17d470cef1e7a56337ad05b1f81df7f9"
> +SRC_URI[ecdsa-0.14.8.sha256sum] = "413301934810f597c1d19ca71c8710e99a3f1ba28a0d2ebc01551a2daeea3c5c"
> +SRC_URI[ecdsa-0.16.9.sha256sum] = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
> +SRC_URI[ed25519-1.5.3.sha256sum] = "91cff35c70bba8a626e3185d8cd48cc11b5437e1a5bcd15b9b5fa3c64b6dfee7"
> +SRC_URI[ed25519-2.2.3.sha256sum] = "115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53"
> +SRC_URI[ed25519-dalek-2.2.0.sha256sum] = "70e796c081cee67dc755e1a36a0a172b897fab85fc3f6bc48307991f64e4eca9"
> +SRC_URI[edit-distance-2.2.2.sha256sum] = "324d428080b707bac399325341bd61af5ded1b30f33b7c949792ca464733c2d5"
> +SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
> +SRC_URI[elliptic-curve-0.12.3.sha256sum] = "e7bb888ab5300a19b8e5bceef25ac745ad065f3c9f7efc6de1b91958110891d3"
> +SRC_URI[elliptic-curve-0.13.8.sha256sum] = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
> +SRC_URI[embassy-futures-0.1.2.sha256sum] = "dc2d050bdc5c21e0862a89256ed8029ae6c290a93aecefc73084b3002cdebb01"
> +SRC_URI[embassy-time-0.4.0.sha256sum] = "f820157f198ada183ad62e0a66f554c610cdcd1a9f27d4b316358103ced7a1f8"
> +SRC_URI[embassy-time-driver-0.2.2.sha256sum] = "6ee71af1b3a0deaa53eaf2d39252f83504c853646e472400b763060389b9fcc9"
> +SRC_URI[embedded-hal-0.2.7.sha256sum] = "35949884794ad573cf46071e41c9b60efb0cb311e3ca01f7af807af1debc66ff"
> +SRC_URI[embedded-hal-1.0.0.sha256sum] = "361a90feb7004eca4019fb28352a9465666b24f840f5c3cddf0ff13920590b89"
> +SRC_URI[embedded-hal-async-1.0.0.sha256sum] = "0c4c685bbef7fe13c3c6dd4da26841ed3980ef33e841cddfa15ce8a8fb3f1884"
> +SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
> +SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
> +SRC_URI[entities-1.0.1.sha256sum] = "b5320ae4c3782150d900b79807611a59a99fc9a1d61d686faafc24b93fc8d7ca"
> +SRC_URI[enumn-0.1.14.sha256sum] = "2f9ed6b3789237c8a0c1c505af1c7eb2c560df6186f01b098c3a1064ea532f38"
> +SRC_URI[enumset-1.1.12.sha256sum] = "7f96a4a12fe60ac746ae295a1a4ecb5bb02debc20856506c8635288065f142de"
> +SRC_URI[enumset_derive-0.15.0.sha256sum] = "4bd536557b58c682b217b8fb199afdff47cd3eff260623f19e77074eb073d63a"
> +SRC_URI[env_filter-1.0.1.sha256sum] = "32e90c2accc4b07a8456ea0debdc2e7587bdd890680d71173a15d4ae604f6eef"
> +SRC_URI[env_logger-0.11.10.sha256sum] = "0621c04f2196ac3f488dd583365b9c09be011a4ab8b9f37248ffcc8f6198b56a"
> +SRC_URI[equator-0.4.2.sha256sum] = "4711b213838dfee0117e3be6ac926007d7f433d7bbe33595975d4190cb07e6fc"
> +SRC_URI[equator-macro-0.4.2.sha256sum] = "44f23cf4b44bfce11a86ace86f8a73ffdec849c9fd00a386a53d278bd9e81fb3"
> +SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
> +SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
> +SRC_URI[etherparse-0.19.0.sha256sum] = "b119b9796ff800751a220394b8b3613f26dd30c48f254f6837e64c464872d1c7"
> +SRC_URI[event-listener-5.4.1.sha256sum] = "e13b66accf52311f30a0db42147dadea9850cb48cd070028831ae5f5d4b856ab"
> +SRC_URI[event-listener-strategy-0.5.4.sha256sum] = "8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93"
> +SRC_URI[fallible-iterator-0.3.0.sha256sum] = "2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649"
> +SRC_URI[fastbloom-0.14.1.sha256sum] = "4e7f34442dbe69c60fe8eaf58a8cafff81a1f278816d8ab4db255b3bef4ac3c4"
> +SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
> +SRC_URI[fdeflate-0.3.7.sha256sum] = "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
> +SRC_URI[ff-0.12.1.sha256sum] = "d013fc25338cc558c5c2cfbad646908fb23591e2404481826742b651c9af7160"
> +SRC_URI[ff-0.13.1.sha256sum] = "c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393"
> +SRC_URI[fiat-crypto-0.2.9.sha256sum] = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
> +SRC_URI[field-offset-0.3.6.sha256sum] = "38e2275cc4e4fc009b0669731a1e5ab7ebf11f469eaede2bab9309a5b4d6057f"
> +SRC_URI[filetime-0.2.28.sha256sum] = "2d5b2eef6fafbf69f877e55509ce5b11a760690ac9700a2921be067aa6afaef6"
> +SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
> +SRC_URI[fixedbitset-0.4.2.sha256sum] = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
> +SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
> +SRC_URI[float-ord-0.3.2.sha256sum] = "8ce81f49ae8a0482e4c55ea62ebbd7e5a686af544c00b9d090bba3ff9be97b3d"
> +SRC_URI[float4-0.1.0.sha256sum] = "5939bac0ef2ad7c83a53e4fb889c1d81f007b07061d648cd271071984d86f257"
> +SRC_URI[float8-0.4.2.sha256sum] = "4203231de188ebbdfb85c11f3c20ca2b063945710de04e7b59268731e728b462"
> +SRC_URI[flume-0.12.0.sha256sum] = "5e139bc46ca777eb5efaf62df0ab8cc5fd400866427e56c68b22e414e53bd3be"
> +SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
> +SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
> +SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
> +SRC_URI[foreign-types-0.5.0.sha256sum] = "d737d9aa519fb7b749cbc3b962edcf310a8dd1f4b67c91c4f83975dbdd17d965"
> +SRC_URI[foreign-types-macros-0.2.3.sha256sum] = "1a5c6c585bc94aaf2c7b51dd4c2ba22680844aba4c687be581871a6f518c5742"
> +SRC_URI[foreign-types-shared-0.3.1.sha256sum] = "aa9a19cbb55df58761df49b23516a86d432839add4af60fc256da840f66ed35b"
> +SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
> +SRC_URI[fs_extra-1.3.0.sha256sum] = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
> +SRC_URI[fslock-0.2.1.sha256sum] = "04412b8935272e3a9bae6f48c7bfff74c2911f60525404edfdd28e49884c3bfb"
> +SRC_URI[fst-0.4.7.sha256sum] = "7ab85b9b05e3978cc9a9cf8fea7f01b494e1a09ed3037e16ba39edc7a29eb61a"
> +SRC_URI[futures-0.3.32.sha256sum] = "8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d"
> +SRC_URI[futures-channel-0.3.32.sha256sum] = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
> +SRC_URI[futures-core-0.3.32.sha256sum] = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
> +SRC_URI[futures-executor-0.3.32.sha256sum] = "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
> +SRC_URI[futures-io-0.3.32.sha256sum] = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
> +SRC_URI[futures-lite-2.6.1.sha256sum] = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
> +SRC_URI[futures-macro-0.3.32.sha256sum] = "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
> +SRC_URI[futures-sink-0.3.32.sha256sum] = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
> +SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
> +SRC_URI[futures-timer-3.0.3.sha256sum] = "f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24"
> +SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
> +SRC_URI[g2gen-1.2.2.sha256sum] = "c5a7e0eb46f83a20260b850117d204366674e85d3a908d90865c78df9a6b1dfc"
> +SRC_URI[g2p-1.2.2.sha256sum] = "539e2644c030d3bf4cd208cb842d2ce2f80e82e6e8472390bcef83ceba0d80ad"
> +SRC_URI[g2poly-1.2.2.sha256sum] = "312d2295c7302019c395cfb90dacd00a82a2eabd700429bba9c7a3f38dbbe11b"
> +SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
> +SRC_URI[generic_singleton-0.5.3.sha256sum] = "ab6e923c8e978e57cf63e2e200ca967d1d20f0ea2662b28f6d4e11c44aa6ab16"
> +SRC_URI[getifaddrs-0.6.2.sha256sum] = "a542e1b7ac1f3d62c5777d430d66eca9cb59e813c46b86e29fa9ce94ff9a4810"
> +SRC_URI[getrandom-0.2.17.sha256sum] = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
> +SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
> +SRC_URI[getrandom-0.4.2.sha256sum] = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
> +SRC_URI[gif-0.14.2.sha256sum] = "ee8cfcc411d9adbbaba82fb72661cc1bcca13e8bba98b364e62b2dba8f960159"
> +SRC_URI[gimli-0.32.3.sha256sum] = "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
> +SRC_URI[gl_generator-0.14.0.sha256sum] = "1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d"
> +SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
> +SRC_URI[glow-0.16.0.sha256sum] = "c5e5ea60d70410161c8bf5da3fdfeaa1c72ed2c15f8bbb9d19fe3a4fad085f08"
> +SRC_URI[glutin_wgl_sys-0.6.1.sha256sum] = "2c4ee00b289aba7a9e5306d57c2d05499b2e5dc427f84ac708bd2c090212cf3e"
> +SRC_URI[governor-0.10.4.sha256sum] = "9efcab3c1958580ff1f25a2a41be1668f7603d849bb63af523b208a3cc1223b8"
> +SRC_URI[gpu-alloc-0.6.0.sha256sum] = "fbcd2dba93594b227a1f57ee09b8b9da8892c34d55aa332e034a228d0fe6a171"
> +SRC_URI[gpu-alloc-types-0.3.0.sha256sum] = "98ff03b468aa837d70984d55f5d3f846f6ec31fe34bbb97c4f85219caeee1ca4"
> +SRC_URI[gpu-allocator-0.27.0.sha256sum] = "c151a2a5ef800297b4e79efa4f4bec035c5f51d5ae587287c9b952bdf734cacd"
> +SRC_URI[gpu-descriptor-0.3.2.sha256sum] = "b89c83349105e3732062a895becfc71a8f921bb71ecbbdd8ff99263e3b53a0ca"
> +SRC_URI[gpu-descriptor-types-0.2.0.sha256sum] = "fdf242682df893b86f33a73828fb09ca4b2d3bb6cc95249707fc684d27484b91"
> +SRC_URI[group-0.12.1.sha256sum] = "5dfbfb3a6cfbd390d5c9564ab283a0349b9b9fcd46a706c1eb10e0db70bfbac7"
> +SRC_URI[group-0.13.0.sha256sum] = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
> +SRC_URI[h2-0.3.27.sha256sum] = "0beca50380b1fc32983fc1cb4587bfa4bb9e78fc259aad4a0032d2080309222d"
> +SRC_URI[h2-0.4.14.sha256sum] = "171fefbc92fe4a4de27e0698d6a5b392d6a0e333506bc49133760b3bcf948733"
> +SRC_URI[half-2.7.1.sha256sum] = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
> +SRC_URI[hashbrown-0.12.3.sha256sum] = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
> +SRC_URI[hashbrown-0.13.2.sha256sum] = "43a3c133739dddd0d2990f9a4bdf8eb4b21ef50e4851ca85ab661199821d510e"
> +SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
> +SRC_URI[hashbrown-0.16.1.sha256sum] = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
> +SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
> +SRC_URI[headers-0.4.1.sha256sum] = "b3314d5adb5d94bcdf56771f2e50dbbc80bb4bdf88967526706205ac9eff24eb"
> +SRC_URI[headers-core-0.3.0.sha256sum] = "54b4a22553d4242c49fddb9ba998a99962b5cc6f22cb5a3482bec22522403ce4"
> +SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> +SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +SRC_URI[hermit-abi-0.5.2.sha256sum] = "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
> +SRC_URI[hex-0.4.3.sha256sum] = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
> +SRC_URI[hexf-parse-0.2.1.sha256sum] = "dfa686283ad6dd069f105e5ab091b04c62850d3e4cf5d67debad1933f55023df"
> +SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
> +SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
> +SRC_URI[hmac-0.13.0.sha256sum] = "6303bc9732ae41b04cb554b844a762b4115a61bfaa81e3e83050991eeb56863f"
> +SRC_URI[home-0.5.12.sha256sum] = "cc627f471c528ff0c4a49e1d5e60450c8f6461dd6d10ba9dcd3a61d3dff7728d"
> +SRC_URI[hound-3.5.1.sha256sum] = "62adaabb884c94955b19907d60019f4e145d091c75345379e70d1ee696f7854f"
> +SRC_URI[hrtf-0.8.1.sha256sum] = "0f4de47a84fd55fa33aa5ef337016814fdc869fdad23e7898b5322fa290248e6"
> +SRC_URI[http-0.2.12.sha256sum] = "601cbb57e577e2f5ef5be8e7b83f0f63994f25aa94d673e54a92d5c516d101f1"
> +SRC_URI[http-1.4.0.sha256sum] = "e3ba2a386d7f85a81f119ad7498ebe444d2e22c2af0b86b069416ace48b3311a"
> +SRC_URI[http-body-0.4.6.sha256sum] = "7ceab25649e9960c0311ea418d17bee82c0dcec1bd053b5f9a66e265a693bed2"
> +SRC_URI[http-body-1.0.1.sha256sum] = "1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62566c93184"
> +SRC_URI[http-body-util-0.1.3.sha256sum] = "b021d93e26becf5dc7e1b75b1bed1fd93124b374ceb73f43d4d4eafec896a64a"
> +SRC_URI[httparse-1.10.1.sha256sum] = "6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87"
> +SRC_URI[httpdate-1.0.3.sha256sum] = "df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9"
> +SRC_URI[human_bytes-0.4.3.sha256sum] = "91f255a4535024abf7640cb288260811fc14794f62b063652ed349f9a6c2348e"
> +SRC_URI[hxdmp-0.2.1.sha256sum] = "a17b27f28a7466846baca75f0a5244e546e44178eb7f1c07a3820f413e91c6b0"
> +SRC_URI[hybrid-array-0.4.12.sha256sum] = "9155a582abd142abc056962c29e3ce5ff2ad5469f4246b537ed42c5deba857da"
> +SRC_URI[hyper-0.14.32.sha256sum] = "41dfc780fdec9373c01bae43289ea34c972e40ee3c9f6b3c8801a35f35586ce7"
> +SRC_URI[hyper-1.9.0.sha256sum] = "6299f016b246a94207e63da54dbe807655bf9e00044f73ded42c3ac5305fbcca"
> +SRC_URI[hyper-proxy2-0.1.0.sha256sum] = "9043b7b23fb0bc4a1c7014c27b50a4fc42cc76206f71d34fc0dfe5b28ddc3faf"
> +SRC_URI[hyper-rustls-0.24.2.sha256sum] = "ec3efd23720e2049821a693cbc7e65ea87c72f1c58ff2f9522ff332b1491e590"
> +SRC_URI[hyper-rustls-0.26.0.sha256sum] = "a0bea761b46ae2b24eb4aef630d8d1c398157b6fc29e6350ecf090a0b70c952c"
> +SRC_URI[hyper-rustls-0.27.9.sha256sum] = "33ca68d021ef39cf6463ab54c1d0f5daf03377b70561305bb89a8f83aab66e0f"
> +SRC_URI[hyper-util-0.1.20.sha256sum] = "96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0"
> +SRC_URI[hyphenation-0.8.4.sha256sum] = "bcf4dd4c44ae85155502a52c48739c8a48185d1449fff1963cffee63c28a50f0"
> +SRC_URI[hyphenation_commons-0.8.4.sha256sum] = "5febe7a2ade5c7d98eb8b75f946c046b335324b06a14ea0998271504134c05bf"
> +SRC_URI[iana-time-zone-0.1.65.sha256sum] = "e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
> +SRC_URI[iana-time-zone-haiku-0.1.2.sha256sum] = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
> +SRC_URI[icu_collections-2.2.0.sha256sum] = "2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c"
> +SRC_URI[icu_locale-2.2.0.sha256sum] = "d5a396343c7208121dc86e35623d3dfe19814a7613cfd14964994cdc9c9a2e26"
> +SRC_URI[icu_locale_core-2.2.0.sha256sum] = "92219b62b3e2b4d88ac5119f8904c10f8f61bf7e95b640d25ba3075e6cac2c29"
> +SRC_URI[icu_locale_data-2.2.0.sha256sum] = "d5fdcc9ac77c6d74ff5cf6e65ef3181d6af32003b16fce3a77fb451d2f695993"
> +SRC_URI[icu_normalizer-2.2.0.sha256sum] = "c56e5ee99d6e3d33bd91c5d85458b6005a22140021cc324cea84dd0e72cff3b4"
> +SRC_URI[icu_normalizer_data-2.2.0.sha256sum] = "da3be0ae77ea334f4da67c12f149704f19f81d1adf7c51cf482943e84a2bad38"
> +SRC_URI[icu_properties-2.2.0.sha256sum] = "bee3b67d0ea5c2cca5003417989af8996f8604e34fb9ddf96208a033901e70de"
> +SRC_URI[icu_properties_data-2.2.0.sha256sum] = "8e2bbb201e0c04f7b4b3e14382af113e17ba4f63e2c9d2ee626b720cbce54a14"
> +SRC_URI[icu_provider-2.2.0.sha256sum] = "139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421"
> +SRC_URI[icu_segmenter-2.2.0.sha256sum] = "5c0794db0b1a86193ac9c48768d0e6c52c54448e0870ad87907d456ee0dac964"
> +SRC_URI[icu_segmenter_data-2.2.0.sha256sum] = "e4a2c462a4d927d512f5f882a033ddd62f33a05bb9f230d98f736ac3dc85938f"
> +SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
> +SRC_URI[ident_case-1.0.1.sha256sum] = "b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39"
> +SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
> +SRC_URI[idna_adapter-1.2.2.sha256sum] = "cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714"
> +SRC_URI[image-0.25.10.sha256sum] = "85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104"
> +SRC_URI[image_hasher-3.1.1.sha256sum] = "dd266c66b0a0e2d4c6db8e710663fc163a2d33595ce997b6fbda407c8759d344"
> +SRC_URI[imgref-1.12.1.sha256sum] = "40fac9d56ed6437b198fddba683305e8e2d651aa42647f00f5ae542e7f5c94a2"
> +SRC_URI[indexmap-1.9.3.sha256sum] = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
> +SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
> +SRC_URI[indicatif-0.18.4.sha256sum] = "25470f23803092da7d239834776d653104d551bc4d7eacaf31e6837854b8e9eb"
> +SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
> +SRC_URI[interpolate_name-0.2.4.sha256sum] = "c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60"
> +SRC_URI[ipnet-2.12.0.sha256sum] = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2"
> +SRC_URI[is-docker-0.2.0.sha256sum] = "928bae27f42bc99b60d9ac7334e3a21d10ad8f1835a4e12ec3ec0464765ed1b3"
> +SRC_URI[is-wsl-0.4.0.sha256sum] = "173609498df190136aa7dea1a91db051746d339e18476eed5ca40521f02d7aa5"
> +SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
> +SRC_URI[iso8601-0.6.3.sha256sum] = "e1082f0c48f143442a1ac6122f67e360ceee130b967af4d50996e5154a45df46"
> +SRC_URI[itertools-0.11.0.sha256sum] = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
> +SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
> +SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
> +SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
> +SRC_URI[itoa-1.0.18.sha256sum] = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
> +SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
> +SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
> +SRC_URI[jni-0.21.1.sha256sum] = "1a87aa2bb7d2af34197c04845522473242e1aa17c12f4935d5856491a7fb8c97"
> +SRC_URI[jni-0.22.4.sha256sum] = "5efd9a482cf3a427f00d6b35f14332adc7902ce91efb778580e180ff90fa3498"
> +SRC_URI[jni-macros-0.22.4.sha256sum] = "a00109accc170f0bdb141fed3e393c565b6f5e072365c3bd58f5b062591560a3"
> +SRC_URI[jni-sys-0.3.1.sha256sum] = "41a652e1f9b6e0275df1f15b32661cf0d4b78d4d87ddec5e0c3c20f097433258"
> +SRC_URI[jni-sys-0.4.1.sha256sum] = "c6377a88cb3910bee9b0fa88d4f42e1d2da8e79915598f65fb0c7ee14c878af2"
> +SRC_URI[jni-sys-macros-0.4.1.sha256sum] = "38c0b942f458fe50cdac086d2f946512305e5631e720728f2a61aabcd47a6264"
> +SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
> +SRC_URI[js-sys-0.3.98.sha256sum] = "67df7112613f8bfd9150013a0314e196f4800d3201ae742489d999db2f979f08"
> +SRC_URI[jsonwebtoken-10.4.0.sha256sum] = "eba32bfb4ffdeaca3e34431072faf01745c9b26d25504aa7a6cf5684334fc4fc"
> +SRC_URI[khronos-egl-6.0.0.sha256sum] = "6aae1df220ece3c0ada96b8153459b67eebe9ae9212258bb0134ae60416fdf76"
> +SRC_URI[khronos_api-3.1.0.sha256sum] = "e2db585e1d738fc771bf08a151420d3ed193d9d895a36df7f6f8a9456b911ddc"
> +SRC_URI[kstring-2.0.2.sha256sum] = "558bf9508a558512042d3095138b1f7b8fe90c5467d94f9f1da28b3731c5dbd1"
> +SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
> +SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
> +SRC_URI[lewton-0.10.2.sha256sum] = "777b48df9aaab155475a83a7df3070395ea1ac6902f5cd062b8f2b028075c030"
> +SRC_URI[libbz2-rs-sys-0.2.3.sha256sum] = "b3a6a8c165077efc8f3a971534c50ea6a1a18b329ef4a66e897a7e3a1494565f"
> +SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
> +SRC_URI[libfuzzer-sys-0.4.12.sha256sum] = "f12a681b7dd8ce12bff52488013ba614b869148d54dd79836ab85aafdd53f08d"
> +SRC_URI[libloading-0.8.9.sha256sum] = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
> +SRC_URI[libloading-0.9.0.sha256sum] = "754ca22de805bb5744484a5b151a9e1a8e837d5dc232c2d7d8c2e3492edc8b60"
> +SRC_URI[liblzma-0.4.6.sha256sum] = "b6033b77c21d1f56deeae8014eb9fbe7bdf1765185a6c508b5ca82eeaed7f899"
> +SRC_URI[liblzma-sys-0.4.6.sha256sum] = "1a60851d15cd8c5346eca4ab8babff585be2ae4bc8097c067291d3ffe2add3b6"
> +SRC_URI[libm-0.2.16.sha256sum] = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
> +SRC_URI[libredox-0.1.16.sha256sum] = "e02f3bb43d335493c96bf3fd3a321600bf6bd07ed34bc64118e9293bdffea46c"
> +SRC_URI[librespot-audio-0.8.0.sha256sum] = "b3fe76acb49f58165484303edf0e7bd778f0e6d96f5c59e9d6b6fde1a90d36ff"
> +SRC_URI[librespot-core-0.8.0.sha256sum] = "168bbe1c416980ddd9a969ebd6b50fb6c924eb1a3ded194285fa8ec0e2b1c68b"
> +SRC_URI[librespot-metadata-0.8.0.sha256sum] = "9a9c688aa2acd3ed2498e31a95d6f2be49c0f18128db8958450ffd628aa88532"
> +SRC_URI[librespot-oauth-0.8.0.sha256sum] = "d686417d49c9d2c363392ffe28d6e469daca20a82dc414740930e078f5829661"
> +SRC_URI[librespot-playback-0.8.0.sha256sum] = "88258620bf3e6808ea1fadd11639648d77c06280b9f5a4c9d14ea79f6f998af6"
> +SRC_URI[librespot-protocol-0.8.0.sha256sum] = "3e01f0b2d39f83fa162eb91d4a16313bcf99e77daf258abe8f7b7bcb1160b084"
> +SRC_URI[libsodium-sys-0.2.7.sha256sum] = "6b779387cd56adfbc02ea4a668e704f729be8d6a6abd2c27ca5ee537849a92fd"
> +SRC_URI[libwebp-sys2-0.1.11.sha256sum] = "4790186411a6843ecc0a141c8948c8e623a0bb5e886834b1b6c90f3dfa85bb99"
> +SRC_URI[libwebp-sys2-0.2.0.sha256sum] = "6dc3d00aeaa1d6bf4f35f3003bc1835135e0fb41f2fc19082a3f98d619792505"
> +SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
> +SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
> +SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
> +SRC_URI[litrs-1.0.0.sha256sum] = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
> +SRC_URI[livekit-api-0.4.19.sha256sum] = "900451a686a1ce8488c420e81a2135831383b03aade6bc3075cf80463d3dd6a4"
> +SRC_URI[livekit-protocol-0.7.5.sha256sum] = "6cf1cc4ab39d7857fb31be648f43aa7068acb54a6960270dccd300dd5c8d0a98"
> +SRC_URI[livekit-runtime-0.4.0.sha256sum] = "532e84c6cdc5fe774f2b5d9912597b5f3bea561927a48296d03e24549d21c3f6"
> +SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
> +SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
> +SRC_URI[lru-0.16.4.sha256sum] = "7f66e8d5d03f609abc3a39e6f08e4164ebf1447a732906d39eb9b99b7919ef39"
> +SRC_URI[lru-slab-0.1.2.sha256sum] = "112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154"
> +SRC_URI[lzma-rust2-0.15.7.sha256sum] = "1670343e58806300d87950e3401e820b519b9384281bbabfb15e3636689ffd69"
> +SRC_URI[m3u8-rs-6.0.0.sha256sum] = "f03cd3335fb5f2447755d45cda9c70f76013626a9db44374973791b0926a86c3"
> +SRC_URI[malloc_buf-0.0.6.sha256sum] = "62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb"
> +SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
> +SRC_URI[matrixmultiply-0.3.10.sha256sum] = "a06de3016e9fae57a36fd14dba131fccf49f74b40b7fbdb472f96e361ec71a08"
> +SRC_URI[maybe-rayon-0.1.1.sha256sum] = "8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519"
> +SRC_URI[md-5-0.11.0.sha256sum] = "69b6441f590336821bb897fb28fc622898ccceb1d6cea3fde5ea86b090c4de98"
> +SRC_URI[md5-0.8.0.sha256sum] = "ae960838283323069879657ca3de837e9f7bbb4c7bf6ea7f1b290d5e9476d2e0"
> +SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
> +SRC_URI[memmap2-0.9.10.sha256sum] = "714098028fe011992e1c3962653c96b2d578c4b4bce9036e15ff220319b1e0e3"
> +SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> +SRC_URI[metal-0.32.0.sha256sum] = "00c15a6f673ff72ddcc22394663290f870fb224c1bfce55734a75c414150e605"
> +SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
> +SRC_URI[mime_guess-2.0.5.sha256sum] = "f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e"
> +SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
> +SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
> +SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
> +SRC_URI[more-asserts-0.3.1.sha256sum] = "1fafa6961cabd9c63bcd77a45d7e3b7f3b552b70417831fb0f56db717e72407e"
> +SRC_URI[moxcms-0.8.1.sha256sum] = "bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b"
> +SRC_URI[mp4-atom-0.10.1.sha256sum] = "5e8e949244bbd26ea7eb6d936af3a6a0202be68bcfc9afce700f3c9026860ff7"
> +SRC_URI[muldiv-1.0.1.sha256sum] = "956787520e75e9bd233246045d19f42fb73242759cc57fba9611d940ae96d4b0"
> +SRC_URI[multimap-0.10.1.sha256sum] = "1d87ecb2933e8aeadb3e3a02b828fed80a7528047e68b4f424523a0981a3a084"
> +SRC_URI[naga-26.0.0.sha256sum] = "916cbc7cb27db60be930a4e2da243cf4bc39569195f22fd8ee419cd31d5b662c"
> +SRC_URI[nasm-rs-0.3.2.sha256sum] = "706bf8a5e8c8ddb99128c3291d31bd21f4bcde17f0f4c20ec678d85c74faa149"
> +SRC_URI[nb-0.1.3.sha256sum] = "801d31da0513b6ec5214e9bf433a77966320625a37860f910be265be6e18d06f"
> +SRC_URI[nb-1.1.0.sha256sum] = "8d5439c4ad607c3c23abf66de8c8bf57ba8adcd1f129e699851a6e43935d339d"
> +SRC_URI[ndarray-0.17.2.sha256sum] = "520080814a7a6b4a6e9070823bb24b4531daac8c4627e08ba5de8c5ef2f2752d"
> +SRC_URI[ndk-sys-0.6.0+11769913.sha256sum] = "ee6cda3051665f1fb8d9e08fc35c96d5a244fb1be711a03b71118828afc9a873"
> +SRC_URI[new_debug_unreachable-1.0.6.sha256sum] = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
> +SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
> +SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
> +SRC_URI[nnnoiseless-0.5.2.sha256sum] = "805d5964d1e7a0006a7fdced7dae75084d66d18b35f1dfe81bd76929b1f8da0c"
> +SRC_URI[no_std_io2-0.9.4.sha256sum] = "418abd1b6d34fbf6cae440dc874771b0525a604428704c76e48b29a5e67b8003"
> +SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
> +SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
> +SRC_URI[nonzero_ext-0.3.0.sha256sum] = "38bf9645c8b145698bb0b18a4637dcacbc421ea49bef2317e4fd8065a387cf21"
> +SRC_URI[noop_proc_macro-0.3.0.sha256sum] = "0676bb32a98c1a483ce53e500a81ad9c3d5b3f7c920c28c24e9cb0980d0b5bc8"
> +SRC_URI[ntapi-0.4.3.sha256sum] = "c3b335231dfd352ffb0f8017f3b6027a4917f7df785ea2143d8af2adc66980ae"
> +SRC_URI[nu-ansi-term-0.50.3.sha256sum] = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
> +SRC_URI[num-0.4.3.sha256sum] = "35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e73d2fea1b9813cb23"
> +SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
> +SRC_URI[num-bigint-dig-0.8.6.sha256sum] = "e661dda6640fad38e827a6d4a310ff4763082116fe217f279885c97f511bb0b7"
> +SRC_URI[num-complex-0.4.6.sha256sum] = "73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495"
> +SRC_URI[num-conv-0.2.1.sha256sum] = "c6673768db2d862beb9b39a78fdcb1a69439615d5794a1be50caa9bc92c81967"
> +SRC_URI[num-derive-0.4.2.sha256sum] = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
> +SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
> +SRC_URI[num-iter-0.1.45.sha256sum] = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
> +SRC_URI[num-rational-0.4.2.sha256sum] = "f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824"
> +SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
> +SRC_URI[num_cpus-1.17.0.sha256sum] = "91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b"
> +SRC_URI[num_threads-0.1.7.sha256sum] = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
> +SRC_URI[oauth2-5.0.0.sha256sum] = "51e219e79014df21a225b1860a479e2dcd7cbd9130f4defd4bd0e191ea31d67d"
> +SRC_URI[objc-0.2.7.sha256sum] = "915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1"
> +SRC_URI[objc2-0.6.4.sha256sum] = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
> +SRC_URI[objc2-cloud-kit-0.3.2.sha256sum] = "73ad74d880bb43877038da939b7427bba67e9dd42004a18b809ba7d87cee241c"
> +SRC_URI[objc2-core-data-0.3.2.sha256sum] = "0b402a653efbb5e82ce4df10683b6b28027616a2715e90009947d50b8dd298fa"
> +SRC_URI[objc2-core-foundation-0.3.2.sha256sum] = "2a180dd8642fa45cdb7dd721cd4c11b1cadd4929ce112ebd8b9f5803cc79d536"
> +SRC_URI[objc2-core-graphics-0.3.2.sha256sum] = "e022c9d066895efa1345f8e33e584b9f958da2fd4cd116792e15e07e4720a807"
> +SRC_URI[objc2-core-image-0.3.2.sha256sum] = "e5d563b38d2b97209f8e861173de434bd0214cf020e3423a52624cd1d989f006"
> +SRC_URI[objc2-core-location-0.3.2.sha256sum] = "ca347214e24bc973fc025fd0d36ebb179ff30536ed1f80252706db19ee452009"
> +SRC_URI[objc2-core-text-0.3.2.sha256sum] = "0cde0dfb48d25d2b4862161a4d5fcc0e3c24367869ad306b0c9ec0073bfed92d"
> +SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
> +SRC_URI[objc2-foundation-0.3.2.sha256sum] = "e3e0adef53c21f888deb4fa59fc59f7eb17404926ee8a6f59f5df0fd7f9f3272"
> +SRC_URI[objc2-io-kit-0.3.2.sha256sum] = "33fafba39597d6dc1fb709123dfa8289d39406734be322956a69f0931c73bb15"
> +SRC_URI[objc2-io-surface-0.3.2.sha256sum] = "180788110936d59bab6bd83b6060ffdfffb3b922ba1396b312ae795e1de9d81d"
> +SRC_URI[objc2-quartz-core-0.3.2.sha256sum] = "96c1358452b371bf9f104e21ec536d37a650eb10f7ee379fff67d2e08d537f1f"
> +SRC_URI[objc2-ui-kit-0.3.2.sha256sum] = "d87d638e33c06f577498cbcc50491496a3ed4246998a7fbba7ccb98b1e7eab22"
> +SRC_URI[objc2-user-notifications-0.3.2.sha256sum] = "9df9128cbbfef73cda168416ccf7f837b62737d748333bfe9ab71c245d76613e"
> +SRC_URI[object-0.37.3.sha256sum] = "ff76201f031d8863c38aa7f905eca4f53abbfa15f609db4277d44cd8938f33fe"
> +SRC_URI[ogg-0.9.2.sha256sum] = "fdab8dcd8d4052eaacaf8fb07a3ccd9a6e26efadb42878a413c68fc4af1dee2b"
> +SRC_URI[oid-registry-0.8.1.sha256sum] = "12f40cff3dde1b6087cc5d5f5d4d65712f34016a03ed60e9c08dcc392736b5b7"
> +SRC_URI[once_cell-1.21.4.sha256sum] = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
> +SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
> +SRC_URI[open-5.3.4.sha256sum] = "9f3bab717c29a857abf75fcef718d441ec7cb2725f937343c734740a985d37fd"
> +SRC_URI[openssl-probe-0.1.6.sha256sum] = "d05e27ee213611ffe7d6348b942e8f942b37114c00cc03cec254295a4a17852e"
> +SRC_URI[openssl-probe-0.2.1.sha256sum] = "7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe"
> +SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
> +SRC_URI[option-operations-0.6.1.sha256sum] = "aca39cf52b03268400c16eeb9b56382ea3c3353409309b63f5c8f0b1faf42754"
> +SRC_URI[ordered-float-5.0.0.sha256sum] = "e2c1f9f56e534ac6a9b8a4600bdf0f530fb393b5f393e7b4d03489c3cf0c3f01"
> +SRC_URI[os_info-3.14.0.sha256sum] = "e4022a17595a00d6a369236fdae483f0de7f0a339960a53118b818238e132224"
> +SRC_URI[outref-0.5.2.sha256sum] = "1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e"
> +SRC_URI[p256-0.11.1.sha256sum] = "51f44edd08f51e2ade572f141051021c5af22677e42b7dd28a88155151c33594"
> +SRC_URI[p256-0.13.2.sha256sum] = "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
> +SRC_URI[p384-0.13.1.sha256sum] = "fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6"
> +SRC_URI[parking-2.2.1.sha256sum] = "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
> +SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
> +SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
> +SRC_URI[parse_link_header-0.4.1.sha256sum] = "4eb9c7a76731a2792f9b97fb34c1e774fff008badcd449d61fcdacb7a912392b"
> +SRC_URI[paste-1.0.15.sha256sum] = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
> +SRC_URI[pastey-0.1.1.sha256sum] = "35fb2e5f958ec131621fdd531e9fc186ed768cbe395337403ae56c17a74c68ec"
> +SRC_URI[pastey-0.2.2.sha256sum] = "c5a797f0e07bdf071d15742978fc3128ec6c22891c31a3a931513263904c982a"
> +SRC_URI[pathdiff-0.2.3.sha256sum] = "df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3"
> +SRC_URI[pbjson-0.6.0.sha256sum] = "1030c719b0ec2a2d25a5df729d6cff1acf3cc230bf766f4f97833591f7577b90"
> +SRC_URI[pbjson-build-0.6.2.sha256sum] = "2580e33f2292d34be285c5bc3dba5259542b083cfad6037b6d70345f24dcb735"
> +SRC_URI[pbjson-types-0.6.0.sha256sum] = "18f596653ba4ac51bdecbb4ef6773bc7f56042dc13927910de1684ad3d32aa12"
> +SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
> +SRC_URI[pcap-file-2.0.0.sha256sum] = "1fc1f139757b058f9f37b76c48501799d12c9aa0aa4c0d4c980b062ee925d1b2"
> +SRC_URI[pem-3.0.6.sha256sum] = "1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be"
> +SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
> +SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
> +SRC_URI[petgraph-0.6.5.sha256sum] = "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
> +SRC_URI[pin-project-1.1.12.sha256sum] = "cbf0d9e68100b3a7989b4901972f265cd542e560a3a8a724e1e20322f4d06ce9"
> +SRC_URI[pin-project-internal-1.1.12.sha256sum] = "a990e22f43e84855daf260dded30524ef4a9021cc7541c26540500a50b624389"
> +SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
> +SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> +SRC_URI[pkcs1-0.7.5.sha256sum] = "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
> +SRC_URI[pkcs8-0.9.0.sha256sum] = "9eca2c590a5f85da82668fa685c09ce2888b9430e83299debf1f34b65fd4a4ba"
> +SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
> +SRC_URI[pkg-config-0.3.33.sha256sum] = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
> +SRC_URI[png-0.18.1.sha256sum] = "60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61"
> +SRC_URI[pocket-resources-0.3.2.sha256sum] = "c135f38778ad324d9e9ee68690bac2c1a51f340fdf96ca13e2ab3914eb2e51d8"
> +SRC_URI[polling-3.11.0.sha256sum] = "5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218"
> +SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
> +SRC_URI[portable-atomic-util-0.2.7.sha256sum] = "c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
> +SRC_URI[potential_utf-0.1.5.sha256sum] = "0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564"
> +SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
> +SRC_URI[ppmd-rust-1.4.0.sha256sum] = "efca4c95a19a79d1c98f791f10aebd5c1363b473244630bb7dbde1dc98455a24"
> +SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
> +SRC_URI[presser-0.3.1.sha256sum] = "e8cf8e6a8aa66ce33f63993ffc4ea4271eb5b0530a9002db8455ea6050c77bfa"
> +SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
> +SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
> +SRC_URI[primal-check-0.3.4.sha256sum] = "dc0d895b311e3af9902528fbb8f928688abbd95872819320517cc24ca6b2bd08"
> +SRC_URI[primeorder-0.13.6.sha256sum] = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
> +SRC_URI[priority-queue-2.7.0.sha256sum] = "93980406f12d9f8140ed5abe7155acb10bb1e69ea55c88960b9c2f117445ef96"
> +SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f"
> +SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
> +SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
> +SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> +SRC_URI[profiling-1.0.18.sha256sum] = "3d595e54a326bc53c1c197b32d295e14b169e3cfeaa8dc82b529f947fba6bcf5"
> +SRC_URI[profiling-procmacros-1.0.18.sha256sum] = "4488a4a36b9a4ba6b9334a32a39971f77c1436ec82c38707bce707699cc3bbcb"
> +SRC_URI[prost-0.12.6.sha256sum] = "deb1435c188b76130da55f17a466d252ff7b1418b2ad3e037d127b94e3411f29"
> +SRC_URI[prost-build-0.12.6.sha256sum] = "22505a5c94da8e3b7c2996394d1c933236c4d743e81a410bcca4e6989fc066a4"
> +SRC_URI[prost-derive-0.12.6.sha256sum] = "81bddcdb20abf9501610992b6759a4c888aef7d1a7247ef75e2404275ac24af1"
> +SRC_URI[prost-types-0.12.6.sha256sum] = "9091c90b0a32608e984ff2fa4091273cbdd755d54935c51d520887f4a1dbd5b0"
> +SRC_URI[protobuf-3.7.2.sha256sum] = "d65a1d4ddae7d8b5de68153b48f6aa3bba8cb002b243dbdbc55a5afbc98f99f4"
> +SRC_URI[protobuf-codegen-3.7.2.sha256sum] = "5d3976825c0014bbd2f3b34f0001876604fe87e0c86cd8fa54251530f1544ace"
> +SRC_URI[protobuf-json-mapping-3.7.2.sha256sum] = "e0d6e4be637b310d8a5c02fa195243328e2d97fa7df1127a27281ef1187fcb1d"
> +SRC_URI[protobuf-parse-3.7.2.sha256sum] = "b4aeaa1f2460f1d348eeaeed86aea999ce98c1bded6f089ff8514c9d9dbdc973"
> +SRC_URI[protobuf-support-3.7.2.sha256sum] = "3e36c2f31e0a47f9280fb347ef5e461ffcd2c52dd520d8e216b52f93b0b0d7d6"
> +SRC_URI[psl-types-2.0.11.sha256sum] = "33cb294fe86a74cbcf50d4445b37da762029549ebeea341421c7c70370f86cac"
> +SRC_URI[publicsuffix-2.3.0.sha256sum] = "6f42ea446cab60335f76979ec15e12619a2165b5ae2c12166bef27d283a9fadf"
> +SRC_URI[pxfm-0.1.29.sha256sum] = "e0c5ccf5294c6ccd63a74f1565028353830a9c2f5eb0c682c355c471726a6e3f"
> +SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
> +SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
> +SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
> +SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
> +SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
> +SRC_URI[quick-xml-0.38.4.sha256sum] = "b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c"
> +SRC_URI[quick-xml-0.39.4.sha256sum] = "cdcc8dd4e2f670d309a5f0e83fe36dfdc05af317008fea29144da1a2ac858e5e"
> +SRC_URI[quinn-0.11.9.sha256sum] = "b9e20a958963c291dc322d98411f541009df2ced7b5a4f2bd52337638cfccf20"
> +SRC_URI[quinn-proto-0.11.14.sha256sum] = "434b42fec591c96ef50e21e886936e66d3cc3f737104fdb9b737c40ffb94c098"
> +SRC_URI[quinn-udp-0.5.14.sha256sum] = "addec6a0dcad8a8d96a771f815f0eaf55f9d1805756410b39f5fa81332574cbd"
> +SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
> +SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
> +SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
> +SRC_URI[rand-0.8.6.sha256sum] = "5ca0ecfa931c29007047d1bc58e623ab12e5590e8c7cc53200d5202b69266d8a"
> +SRC_URI[rand-0.9.4.sha256sum] = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
> +SRC_URI[rand-0.10.1.sha256sum] = "d2e8e8bcc7961af1fdac401278c6a831614941f6164ee3bf4ce61b7edb162207"
> +SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> +SRC_URI[rand_chacha-0.9.0.sha256sum] = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
> +SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> +SRC_URI[rand_core-0.9.5.sha256sum] = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
> +SRC_URI[rand_core-0.10.1.sha256sum] = "63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69"
> +SRC_URI[rand_distr-0.5.1.sha256sum] = "6a8615d50dcf34fa31f7ab52692afec947c4dd0ab803cc87cb3b0b4570ff7463"
> +SRC_URI[range-alloc-0.1.5.sha256sum] = "ca45419789ae5a7899559e9512e58ca889e41f04f1f2445e9f4b290ceccd1d08"
> +SRC_URI[raptorq-2.0.0.sha256sum] = "90b1b1fad69672f0b901b5004863ea4307f03d168a3db5f2bcba4d3dfed88e97"
> +SRC_URI[rav1e-0.8.1.sha256sum] = "43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b"
> +SRC_URI[raw-window-handle-0.6.2.sha256sum] = "20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539"
> +SRC_URI[rawpointer-0.2.1.sha256sum] = "60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3"
> +SRC_URI[rayon-1.12.0.sha256sum] = "fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d"
> +SRC_URI[rayon-core-1.13.0.sha256sum] = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
> +SRC_URI[rcgen-0.14.8.sha256sum] = "57f6d249aad744e274e682777a50283a225a32705394ee6d5fcc01efa25e4055"
> +SRC_URI[realfft-3.5.0.sha256sum] = "f821338fddb99d089116342c46e9f1fbf3828dba077674613e734e01d6ea8677"
> +SRC_URI[redox_syscall-0.5.18.sha256sum] = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
> +SRC_URI[redox_users-0.5.2.sha256sum] = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
> +SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
> +SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
> +SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
> +SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
> +SRC_URI[regex-lite-0.1.9.sha256sum] = "cab834c73d247e67f4fae452806d17d3c7501756d98c8808d7c9c7aa7d18f973"
> +SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
> +SRC_URI[renderdoc-sys-1.1.0.sha256sum] = "19b30a45b0cd0bcca8037f3d0dc3421eaf95327a17cad11964fb8179b4fc4832"
> +SRC_URI[reqwest-0.12.28.sha256sum] = "eddd3ca559203180a307f12d114c268abf583f59b03cb906fd0b3ff8646c1147"
> +SRC_URI[rfc6979-0.3.1.sha256sum] = "7743f17af12fa0b03b803ba12cd6a8d9483a587e89c69445e3909655c0b9fabb"
> +SRC_URI[rfc6979-0.4.0.sha256sum] = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
> +SRC_URI[rgb-0.8.53.sha256sum] = "47b34b781b31e5d73e9fbc8689c70551fd1ade9a19e3e28cfec8580a79290cc4"
> +SRC_URI[ring-0.17.14.sha256sum] = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
> +SRC_URI[rmp-0.8.15.sha256sum] = "4ba8be72d372b2c9b35542551678538b562e7cf86c3315773cae48dfbfe7790c"
> +SRC_URI[rmp-serde-1.3.1.sha256sum] = "72f81bee8c8ef9b577d1681a70ebbc962c232461e397b22c208c43c04b67a155"
> +SRC_URI[rqrr-0.10.1.sha256sum] = "ffbe87d9e8db95652c25ded2418150e00b08c2fde09e23ec15896d2c470c6631"
> +SRC_URI[rsa-0.9.10.sha256sum] = "b8573f03f5883dcaebdfcf4725caa1ecb9c15b2ef50c43a07b816e06799bb12d"
> +SRC_URI[rtcp-types-0.3.0.sha256sum] = "c081c846edea632bb47332fada9d4ac2fdf54d84beaf547fc947b58489e5f619"
> +SRC_URI[rtp-types-0.1.2.sha256sum] = "7bb90df8268abfe08452ef2dae9e867a54edfdaa71b3127ef47d8b031f77ac73"
> +SRC_URI[rtsp-types-0.1.3.sha256sum] = "f47bf238c3da7994ef66a71724f385cb1ee25dcf04a156402d2727ad84dc1433"
> +SRC_URI[rubato-0.14.1.sha256sum] = "e6dd52e80cfc21894deadf554a5673002938ae4625f7a283e536f9cf7c17b0d5"
> +SRC_URI[rustc-demangle-0.1.27.sha256sum] = "b50b8869d9fc858ce7266cce0194bd74df58b9d0e3f6df3a9fc8eb470d95c09d"
> +SRC_URI[rustc-hash-1.1.0.sha256sum] = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
> +SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
> +SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
> +SRC_URI[rustdct-0.7.1.sha256sum] = "8b61555105d6a9bf98797c063c362a1d24ed8ab0431655e38f1cf51e52089551"
> +SRC_URI[rustfft-6.4.1.sha256sum] = "21db5f9893e91f41798c88680037dba611ca6674703c1a18601b01a72c8adb89"
> +SRC_URI[rusticata-macros-4.1.0.sha256sum] = "faf0c4a6ece9950b9abdb62b1cfcf2a68b3b67a10ba445b3bb85be2a293d0632"
> +SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
> +SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
> +SRC_URI[rustls-0.21.12.sha256sum] = "3f56a14d1f48b391359b22f731fd4bd7e43c97f3c50eee276f3aa09c94784d3e"
> +SRC_URI[rustls-0.22.4.sha256sum] = "bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432"
> +SRC_URI[rustls-0.23.40.sha256sum] = "ef86cd5876211988985292b91c96a8f2d298df24e75989a43a3c73f2d4d8168b"
> +SRC_URI[rustls-native-certs-0.6.3.sha256sum] = "a9aace74cb666635c918e9c12bc0d348266037aa8eb599b5cba565709a8dff00"
> +SRC_URI[rustls-native-certs-0.7.3.sha256sum] = "e5bfb394eeed242e909609f56089eecfe5fda225042e8b171791b9c95f5931e5"
> +SRC_URI[rustls-native-certs-0.8.3.sha256sum] = "612460d5f7bea540c490b2b6395d8e34a953e52b491accd6c86c8164c5932a63"
> +SRC_URI[rustls-pemfile-1.0.4.sha256sum] = "1c74cae0a4cf6ccbbf5f359f08efdf8ee7e1dc532573bf0db71968cb56b1448c"
> +SRC_URI[rustls-pemfile-2.2.0.sha256sum] = "dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50"
> +SRC_URI[rustls-pki-types-1.14.1.sha256sum] = "30a7197ae7eb376e574fe940d068c30fe0462554a3ddbe4eca7838e049c937a9"
> +SRC_URI[rustls-platform-verifier-0.6.2.sha256sum] = "1d99feebc72bae7ab76ba994bb5e121b8d83d910ca40b36e0921f53becc41784"
> +SRC_URI[rustls-platform-verifier-0.7.0.sha256sum] = "26d1e2536ce4f35f4846aa13bff16bd0ff40157cdb14cc056c7b14ba41233ba0"
> +SRC_URI[rustls-platform-verifier-android-0.1.1.sha256sum] = "f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f"
> +SRC_URI[rustls-webpki-0.101.7.sha256sum] = "8b6275d1ee7a1cd780b64aca7726599a1dbc893b1e64144529e55c3c2f745765"
> +SRC_URI[rustls-webpki-0.102.8.sha256sum] = "64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9"
> +SRC_URI[rustls-webpki-0.103.13.sha256sum] = "61c429a8649f110dddef65e2a5ad240f747e85f7758a6bccc7e5777bd33f756e"
> +SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
> +SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
> +SRC_URI[safetensors-0.7.0.sha256sum] = "675656c1eabb620b921efea4f9199f97fc86e36dd6ffd1fbbe48d0f59a4987f5"
> +SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> +SRC_URI[sanitize-filename-0.6.0.sha256sum] = "bc984f4f9ceb736a7bb755c3e3bd17dc56370af2600c9780dcc48c66453da34d"
> +SRC_URI[scc-2.4.0.sha256sum] = "46e6f046b7fef48e2660c57ed794263155d713de679057f2d0c169bfc6e756cc"
> +SRC_URI[schannel-0.1.29.sha256sum] = "91c1b7e4904c873ef0710c1f407dde2e6287de2bebc1bbbf7d430bb7cbffd939"
> +SRC_URI[schemars-0.9.0.sha256sum] = "4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f"
> +SRC_URI[schemars-1.2.1.sha256sum] = "a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc"
> +SRC_URI[scoped-tls-1.0.1.sha256sum] = "e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294"
> +SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> +SRC_URI[sct-0.7.1.sha256sum] = "da046153aa2352493d6cb7da4b6e5c0c057d8a1d0a9aa8560baffdd945acd414"
> +SRC_URI[sdd-3.0.10.sha256sum] = "490dcfcbfef26be6800d11870ff2df8774fa6e86d047e3e8c8a76b25655e41ca"
> +SRC_URI[sdp-types-0.1.8.sha256sum] = "9bb6c636ace20de73fb9536017f9ef069b258308a6c341a4aaf3d2fd11afc570"
> +SRC_URI[sec1-0.3.0.sha256sum] = "3be24c1842290c45df0a7bf069e0c268a747ad05a192f2fd7dcfdbc1cba40928"
> +SRC_URI[sec1-0.7.3.sha256sum] = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
> +SRC_URI[security-framework-2.11.1.sha256sum] = "897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02"
> +SRC_URI[security-framework-3.7.0.sha256sum] = "b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d"
> +SRC_URI[security-framework-sys-2.17.0.sha256sum] = "6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3"
> +SRC_URI[semver-1.0.28.sha256sum] = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
> +SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
> +SRC_URI[serde_bytes-0.11.19.sha256sum] = "a5d440709e79d88e51ac01c4b72fc6cb7314017bb7da9eeff678aa94c10e3ea8"
> +SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
> +SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
> +SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
> +SRC_URI[serde_path_to_error-0.1.20.sha256sum] = "10a9ff822e371bb5403e391ecd83e182e0e77ba7f6fe0160b795797109d1b457"
> +SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
> +SRC_URI[serde_urlencoded-0.7.1.sha256sum] = "d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd"
> +SRC_URI[serde_with-3.20.0.sha256sum] = "e72c1c2cb7b223fafb600a619537a871c2818583d619401b785e7c0b746ccde2"
> +SRC_URI[serde_with_macros-3.20.0.sha256sum] = "b90c488738ecb4fb0262f41f43bc40efc5868d9fb744319ddf5f5317f417bfac"
> +SRC_URI[serial_test-3.4.0.sha256sum] = "911bd979bf1070a3f3aa7b691a3b3e9968f339ceeec89e08c280a8a22207a32f"
> +SRC_URI[serial_test_derive-3.4.0.sha256sum] = "0a7d91949b85b0d2fb687445e448b40d322b6b3e4af6b44a29b21d9a5f33e6d9"
> +SRC_URI[sfv-0.14.0.sha256sum] = "0d471eaefb14f4b30032525bdb124b36e55ba9cb1292080e06f1a236cd10fe87"
> +SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
> +SRC_URI[sha1-0.11.0.sha256sum] = "aacc4cc499359472b4abe1bf11d0b12e688af9a805fa5e3016f9a386dc2d0214"
> +SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
> +SRC_URI[sha2-0.11.0.sha256sum] = "446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4"
> +SRC_URI[sha256-1.6.0.sha256sum] = "f880fc8562bdeb709793f00eb42a2ad0e672c4f883bbe59122b926eca935c8f6"
> +SRC_URI[shannon-0.2.0.sha256sum] = "7ea5b41c9427b56caa7b808cb548a04fb50bb5b9e98590b53f28064ff4174561"
> +SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
> +SRC_URI[shell-words-1.1.1.sha256sum] = "dc6fe69c597f9c37bfeeeeeb33da3530379845f10be461a66d16d03eca2ded77"
> +SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +SRC_URI[signal-hook-0.4.4.sha256sum] = "b2a0c28ca5908dbdbcd52e6fdaa00358ab88637f8ab33e1f188dd510eb44b53d"
> +SRC_URI[signal-hook-registry-1.4.8.sha256sum] = "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
> +SRC_URI[signalsmith-stretch-0.1.3.sha256sum] = "51dae6f10b5532510f65c309c4d868babe3aecf6ce0782678081338311f176fd"
> +SRC_URI[signature-1.6.4.sha256sum] = "74233d3b3b2f6d4b006dc19dee745e73e2a6bfb6f93607cd3b02bd5b00797d7c"
> +SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
> +SRC_URI[simd-adler32-0.3.9.sha256sum] = "703d5c7ef118737c72f1af64ad2f6f8c5e1921f818cdcb97b8fe6fc69bf66214"
> +SRC_URI[simd_cesu8-1.1.1.sha256sum] = "94f90157bb87cddf702797c5dadfa0be7d266cdf49e22da2fcaa32eff75b2c33"
> +SRC_URI[simd_helpers-0.1.0.sha256sum] = "95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6"
> +SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
> +SRC_URI[siphasher-1.0.3.sha256sum] = "8ee5873ec9cce0195efcb7a4e9507a04cd49aec9c83d0389df45b1ef7ba2e649"
> +SRC_URI[skia-bindings-0.93.1.sha256sum] = "2359f7e30c9da3f322f8ca3d4ec0abbc12a40035ce758309db0cdab07b5d4476"
> +SRC_URI[skia-safe-0.93.1.sha256sum] = "7f9e837ea9d531c9efee8f980bfcdb7226b21db0285b0c3171d8be745829f940"
> +SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
> +SRC_URI[slotmap-1.1.1.sha256sum] = "bdd58c3c93c3d278ca835519292445cb4b0d4dc59ccfdf7ceadaab3f8aeb4038"
> +SRC_URI[slug-0.1.6.sha256sum] = "882a80f72ee45de3cc9a5afeb2da0331d58df69e4e7d8eeb5d3c7784ae67e724"
> +SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
> +SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
> +SRC_URI[socket2-0.5.10.sha256sum] = "e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678"
> +SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
> +SRC_URI[sodiumoxide-0.2.7.sha256sum] = "e26be3acb6c2d9a7aac28482586a7856436af4cfe7100031d219de2d2ecb0028"
> +SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
> +SRC_URI[spin-0.10.0.sha256sum] = "d5fe4ccb98d9c292d56fec89a5e07da7fc4cf0dc11e156b41793132775d3e591"
> +SRC_URI[spinning_top-0.3.0.sha256sum] = "d96d2d1d716fb500937168cc09353ffdc7a012be8475ac7308e1bdf0e3923300"
> +SRC_URI[spirv-0.3.0+sdk-1.3.268.0.sha256sum] = "eda41003dc44290527a59b13432d4a0379379fa074b70174882adfbdfd917844"
> +SRC_URI[spki-0.6.0.sha256sum] = "67cf02bbac7a337dc36e4f5a693db6c21e7863f45070f7064577eb4367a3212b"
> +SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
> +SRC_URI[sprintf-0.4.3.sha256sum] = "b0e59842c3aac5c7901ea11bbb02e60e5d67263b43d4361dec9303cca8e764eb"
> +SRC_URI[stable-vec-0.4.2.sha256sum] = "6dac7bc0f7d0d44329b200020effbc25a534d89fa142af95e3ddf76113412a5e"
> +SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
> +SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> +SRC_URI[strength_reduce-0.2.4.sha256sum] = "fe895eb47f22e2ddd4dabc02bce419d2e643c8e3b585c78158b349195bc24d82"
> +SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
> +SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
> +SRC_URI[symphonia-0.5.5.sha256sum] = "5773a4c030a19d9bfaa090f49746ff35c75dfddfa700df7a5939d5e076a57039"
> +SRC_URI[symphonia-bundle-flac-0.5.5.sha256sum] = "c91565e180aea25d9b80a910c546802526ffd0072d0b8974e3ebe59b686c9976"
> +SRC_URI[symphonia-bundle-mp3-0.5.5.sha256sum] = "4872dd6bb56bf5eac799e3e957aa1981086c3e613b27e0ac23b176054f7c57ed"
> +SRC_URI[symphonia-codec-vorbis-0.5.5.sha256sum] = "f025837c309cd69ffef572750b4a2257b59552c5399a5e49707cc5b1b85d1c73"
> +SRC_URI[symphonia-core-0.5.5.sha256sum] = "ea00cc4f79b7f6bb7ff87eddc065a1066f3a43fe1875979056672c9ef948c2af"
> +SRC_URI[symphonia-format-ogg-0.5.5.sha256sum] = "2b4955c67c1ed3aa8ae8428d04ca8397fbef6a19b2b051e73b5da8b1435639cb"
> +SRC_URI[symphonia-metadata-0.5.5.sha256sum] = "36306ff42b9ffe6e5afc99d49e121e0bd62fe79b9db7b9681d48e29fa19e6b16"
> +SRC_URI[symphonia-utils-xiph-0.5.5.sha256sum] = "ee27c85ab799a338446b68eec77abf42e1a6f1bb490656e121c6e27bfbab9f16"
> +SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
> +SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
> +SRC_URI[sync_wrapper-1.0.2.sha256sum] = "0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263"
> +SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
> +SRC_URI[sysinfo-0.36.1.sha256sum] = "252800745060e7b9ffb7b2badbd8b31cfa4aa2e61af879d0a3bf2a317c20217d"
> +SRC_URI[system-configuration-0.7.0.sha256sum] = "a13f3d0daba03132c0aa9767f98351b3488edc2c100cda2d2ec2b04f3d8d3c8b"
> +SRC_URI[system-configuration-sys-0.6.0.sha256sum] = "8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4"
> +SRC_URI[system-deps-7.0.8.sha256sum] = "396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7"
> +SRC_URI[tar-0.4.45.sha256sum] = "22692a6476a21fa75fdfc11d452fda482af402c008cdbaf3476414e122040973"
> +SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
> +SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
> +SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
> +SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
> +SRC_URI[test-log-0.2.20.sha256sum] = "2f46bf474f0a4afebf92f076d54fd5e63423d9438b8c278a3d2ccb0f47f7cdb3"
> +SRC_URI[test-log-core-0.2.20.sha256sum] = "37d4d41320b48bc4a211a9021678fcc0c99569b594ea31c93735b8e517102b4c"
> +SRC_URI[test-log-macros-0.2.20.sha256sum] = "9beb9249a81e430dffd42400a49019bcf548444f1968ff23080a625de0d4d320"
> +SRC_URI[test-with-0.16.1.sha256sum] = "3c292571fb159e65c78c7c88a96e5ddfc326d6819e49b3a040d7b0aa3497925b"
> +SRC_URI[test-with-derive-0.16.1.sha256sum] = "01b95b557b54c0d50b04688ab86aaeaf16f201a0341936f3bfa19497dee081bd"
> +SRC_URI[text_placeholder-0.5.1.sha256sum] = "dd5008f74a09742486ef0047596cf35df2b914e2a8dca5727fcb6ba6842a766b"
> +SRC_URI[textdistance-1.1.1.sha256sum] = "aa672c55ab69f787dbc9126cc387dbe57fdd595f585e4524cf89018fa44ab819"
> +SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
> +SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
> +SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
> +SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
> +SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
> +SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
> +SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
> +SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
> +SRC_URI[time-macros-0.2.27.sha256sum] = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
> +SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
> +SRC_URI[tinystr-0.8.3.sha256sum] = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
> +SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
> +SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> +SRC_URI[tokio-1.52.3.sha256sum] = "8fc7f01b389ac15039e4dc9531aa973a135d7a4135281b12d7c1bc79fd57fffe"
> +SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
> +SRC_URI[tokio-rustls-0.24.1.sha256sum] = "c28327cf380ac148141087fbfb9de9d7bd4e84ab5d2c28fbc911d753de8a7081"
> +SRC_URI[tokio-rustls-0.25.0.sha256sum] = "775e0c0f0adb3a2f22a00c4745d728b479985fc15ee7ca6a2608388c5569860f"
> +SRC_URI[tokio-rustls-0.26.4.sha256sum] = "1729aa945f29d91ba541258c8df89027d5792d85a8841fb65e8bf0f4ede4ef61"
> +SRC_URI[tokio-stream-0.1.18.sha256sum] = "32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70"
> +SRC_URI[tokio-tungstenite-0.20.1.sha256sum] = "212d5dcb2a1ce06d81107c3d0ffa3121fe974b73f068c8282cb1c32328113b6c"
> +SRC_URI[tokio-tungstenite-0.27.0.sha256sum] = "489a59b6730eda1b0171fcfda8b121f4bee2b35cba8645ca35c5f7ba3eb736c1"
> +SRC_URI[tokio-tungstenite-0.28.0.sha256sum] = "d25a406cddcc431a75d3d9afc6a7c0f7428d4891dd973e4d54c56b46127bf857"
> +SRC_URI[tokio-util-0.7.18.sha256sum] = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
> +SRC_URI[toml-0.9.12+spec-1.1.0.sha256sum] = "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
> +SRC_URI[toml-1.1.2+spec-1.1.0.sha256sum] = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
> +SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
> +SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
> +SRC_URI[toml_edit-0.25.11+spec-1.1.0.sha256sum] = "0b59c4d22ed448339746c59b905d24568fcbb3ab65a500494f7b8c3e97739f2b"
> +SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
> +SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
> +SRC_URI[tower-0.5.3.sha256sum] = "ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4"
> +SRC_URI[tower-http-0.6.10.sha256sum] = "68d6fdd9f81c2819c9a8b0e0cd91660e7746a8e6ea2ba7c6b2b057985f6bcb51"
> +SRC_URI[tower-layer-0.3.3.sha256sum] = "121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e"
> +SRC_URI[tower-service-0.3.3.sha256sum] = "8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3"
> +SRC_URI[tracel-ash-0.38.0+1.3.296.sha256sum] = "7318626319ea7b43d20b9c374f273b1b25600b8d8ddd103e209751f67fee67ad"
> +SRC_URI[tracel-llvm-20.1.4-7.sha256sum] = "982535db9eb1a30ac0f2c50239a0eec3e5cf50993a88e92b04747bd2f4d365b2"
> +SRC_URI[tracel-llvm-bundler-20.1.4-7.sha256sum] = "3c75b8e477cb8d49d907afab029ca74d48459f5b88c27bdb4c6cd6acb5e61977"
> +SRC_URI[tracel-mlir-rs-20.1.4-7.sha256sum] = "77a478a35efd68d0ba73f747adfb7923b121c64e7f5be9cd8364ca1dcb772d5c"
> +SRC_URI[tracel-mlir-rs-macros-20.1.4-7.sha256sum] = "7a94f36868c3b10b1825945223d99d106c73f4d249f063caa4651deeb9379344"
> +SRC_URI[tracel-mlir-sys-20.1.4-7.sha256sum] = "02f26d31af0c225a6d2e3d65d012fd6de848c9fc776897b152ee83b7d1bd15c4"
> +SRC_URI[tracel-rspirv-0.12.1+sdk-1.4.341.0.sha256sum] = "1653aa21b867351f48c51f1063a2f872f8e82931951cae469d8a53aa4d7d72e8"
> +SRC_URI[tracel-tblgen-rs-20.1.4-7.sha256sum] = "00d2581070380418ccc33b500f3739e4d4869421fdb477fcea51ff97c6253a52"
> +SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
> +SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
> +SRC_URI[tracing-core-0.1.36.sha256sum] = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
> +SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
> +SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319"
> +SRC_URI[transpose-0.2.3.sha256sum] = "1ad61aed86bc3faea4300c7aee358b4c6d0c8d6ccc36524c96e4c92ccf26e77e"
> +SRC_URI[try-lock-0.2.5.sha256sum] = "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
> +SRC_URI[tungstenite-0.20.1.sha256sum] = "9e3dac10fd62eaf6617d3a904ae222845979aec67c615d1c842b4002c7666fb9"
> +SRC_URI[tungstenite-0.27.0.sha256sum] = "eadc29d668c91fcc564941132e17b28a7ceb2f3ebf0b9dae3e03fd7a6748eb0d"
> +SRC_URI[tungstenite-0.28.0.sha256sum] = "8628dcc84e5a09eb3d8423d6cb682965dea9133204e8fb3efee74c2a0c259442"
> +SRC_URI[tungstenite-0.29.0.sha256sum] = "6c01152af293afb9c7c2a57e4b559c5620b421f6d133261c60dd2d0cdb38e6b8"
> +SRC_URI[type-map-0.5.1.sha256sum] = "cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90"
> +SRC_URI[typed-arena-2.0.2.sha256sum] = "6af6ae20167a9ece4bcb41af5b80f8a1f1df981f6391189ce00fd257af04126a"
> +SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
> +SRC_URI[typenum-1.20.0.sha256sum] = "40ce102ab67701b8526c123c1bab5cbe42d7040ccfd0f64af1a385808d2f43de"
> +SRC_URI[unicase-2.9.0.sha256sum] = "dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142"
> +SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
> +SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
> +SRC_URI[unicode-normalization-0.1.25.sha256sum] = "5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8"
> +SRC_URI[unicode-segmentation-1.13.2.sha256sum] = "9629274872b2bfaf8d66f5f15725007f635594914870f65218920345aa11aa8c"
> +SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
> +SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
> +SRC_URI[unicode_categories-0.1.1.sha256sum] = "39ec24b3121d976906ece63c9daad25b85969647682eee313cb5779fdd69e14e"
> +SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
> +SRC_URI[unit-prefix-0.5.2.sha256sum] = "81e544489bf3d8ef66c953931f56617f423cd4b5494be343d9b9d3dda037b9a3"
> +SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
> +SRC_URI[unty-0.0.4.sha256sum] = "6d49784317cd0d1ee7ec5c716dd598ec5b4483ea832a2dced265471cc0f690ae"
> +SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
> +SRC_URI[url-escape-0.1.1.sha256sum] = "44e0ce4d1246d075ca5abec4b41d33e87a6054d08e2366b63205665e950db218"
> +SRC_URI[urlencoding-2.1.3.sha256sum] = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da"
> +SRC_URI[utf-8-0.7.6.sha256sum] = "09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429ad062dc7b7ddd036a9"
> +SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
> +SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
> +SRC_URI[uuid-1.23.1.sha256sum] = "ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76"
> +SRC_URI[v_frame-0.3.9.sha256sum] = "666b7727c8875d6ab5db9533418d7c764233ac9c0cff1d469aec8fa127597be2"
> +SRC_URI[va_list-0.1.4.sha256sum] = "350bd5ef744f978a387cd08ce514be4e3766746496f355d59d68af36f52d36da"
> +SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
> +SRC_URI[variadics_please-1.1.0.sha256sum] = "41b6d82be61465f97d42bd1d15bf20f3b0a3a0905018f38f9d6f6962055b0b5c"
> +SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> +SRC_URI[vergen-9.0.6.sha256sum] = "6b2bf58be11fc9414104c6d3a2e464163db5ef74b12296bda593cac37b6e4777"
> +SRC_URI[vergen-gitcl-1.0.8.sha256sum] = "b9dfc1de6eb2e08a4ddf152f1b179529638bedc0ea95e6d667c014506377aefe"
> +SRC_URI[vergen-lib-0.1.6.sha256sum] = "9b07e6010c0f3e59fcb164e0163834597da68d1f864e2b8ca49f74de01e9c166"
> +SRC_URI[version-compare-0.2.1.sha256sum] = "03c2856837ef78f57382f06b2b8563a2f512f7185d732608fd9176cb3b8edf0e"
> +SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
> +SRC_URI[void-1.0.2.sha256sum] = "6a02e4885ed3bc0f2de90ea6dd45ebcbb66dacffe03547fadbb0eeae2770887d"
> +SRC_URI[vsimd-0.8.0.sha256sum] = "5c3082ca00d5a5ef149bb8b555a72ae84c9c59f7250f013ac822ac2e49b19c64"
> +SRC_URI[vvdec-0.6.11.sha256sum] = "689743f6dc5c608197123319f088d73d3048a9e5d93682b95b8a347243975cb0"
> +SRC_URI[vvdec-sys-0.7.0.sha256sum] = "18df9e7fd48eb13204c547ccd570774b701981878489779c9a427ee97579f24d"
> +SRC_URI[waker-fn-1.2.0.sha256sum] = "317211a0dc0ceedd78fb2ca9a44aed3d7b9b26f81870d485c07122b4350673b7"
> +SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
> +SRC_URI[want-0.3.1.sha256sum] = "bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e"
> +SRC_URI[warp-0.4.3.sha256sum] = "c0a808122a8a77eecdabaefd88ddb1913c4be5ea1465399f63ba64c7aa705fea"
> +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> +SRC_URI[wasip2-1.0.3+wasi-0.2.9.sha256sum] = "20064672db26d7cdc89c7798c48a0fdfac8213434a1186e5ef29fd560ae223d6"
> +SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
> +SRC_URI[wasm-bindgen-0.2.121.sha256sum] = "49ace1d07c165b0864824eee619580c4689389afa9dc9ed3a4c75040d82e6790"
> +SRC_URI[wasm-bindgen-futures-0.4.71.sha256sum] = "96492d0d3ffba25305a7dc88720d250b1401d7edca02cc3bcd50633b424673b8"
> +SRC_URI[wasm-bindgen-macro-0.2.121.sha256sum] = "8e68e6f4afd367a562002c05637acb8578ff2dea1943df76afb9e83d177c8578"
> +SRC_URI[wasm-bindgen-macro-support-0.2.121.sha256sum] = "d95a9ec35c64b2a7cb35d3fead40c4238d0940c86d107136999567a4703259f2"
> +SRC_URI[wasm-bindgen-shared-0.2.121.sha256sum] = "c4e0100b01e9f0d03189a92b96772a1fb998639d981193d7dbab487302513441"
> +SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
> +SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
> +SRC_URI[wasm-streams-0.4.2.sha256sum] = "15053d8d85c7eccdbefef60f06769760a563c7f0a9d6902a13d35c7800b0ad65"
> +SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
> +SRC_URI[web-sys-0.3.98.sha256sum] = "4b572dff8bcf38bad0fa19729c89bb5748b2b9b1d8be70cf90df697e3a8f32aa"
> +SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
> +SRC_URI[web-transport-proto-0.6.0.sha256sum] = "0225d295c8ac00a2e9a498aefeaf3f3c6186da12a251c938189b15b82ea22808"
> +SRC_URI[web-transport-quinn-0.11.9.sha256sum] = "cac11b6caf163be7f980442a26fcba15e8074a5f22e85fbb71f0f77d11cecf60"
> +SRC_URI[web-transport-trait-0.3.4.sha256sum] = "cb67841c4a481ca3c1412ee4c9f463987401991e1ddc000903df2124f3dc85e9"
> +SRC_URI[webm-iterable-0.6.4.sha256sum] = "cd9fbf173b4b38f2f8bbb0082a0d4cb21f263a70811f5fccb1663c421c66d9f9"
> +SRC_URI[webpki-0.22.4.sha256sum] = "ed63aea5ce73d0ff405984102c42de94fc55a6b75765d621c65262469b3c9b53"
> +SRC_URI[webpki-root-certs-1.0.7.sha256sum] = "f31141ce3fc3e300ae89b78c0dd67f9708061d1d2eda54b8209346fd6be9a92c"
> +SRC_URI[webpki-roots-0.26.11.sha256sum] = "521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9"
> +SRC_URI[webpki-roots-1.0.7.sha256sum] = "52f5ee44c96cf55f1b349600768e3ece3a8f26010c05265ab73f945bb1a2eb9d"
> +SRC_URI[weezl-0.1.12.sha256sum] = "a28ac98ddc8b9274cb41bb4d9d4d5c425b6020c50c46f25559911905610b4a88"
> +SRC_URI[wgpu-26.0.1.sha256sum] = "70b6ff82bbf6e9206828e1a3178e851f8c20f1c9028e74dd3a8090741ccd5798"
> +SRC_URI[wgpu-core-26.0.1.sha256sum] = "d5f62f1053bd28c2268f42916f31588f81f64796e2ff91b81293515017ca8bd9"
> +SRC_URI[wgpu-core-deps-apple-26.0.0.sha256sum] = "18ae5fbde6a4cbebae38358aa73fcd6e0f15c6144b67ef5dc91ded0db125dbdf"
> +SRC_URI[wgpu-core-deps-emscripten-26.0.0.sha256sum] = "d7670e390f416006f746b4600fdd9136455e3627f5bd763abf9a65daa216dd2d"
> +SRC_URI[wgpu-core-deps-windows-linux-android-26.0.0.sha256sum] = "720a5cb9d12b3d337c15ff0e24d3e97ed11490ff3f7506e7f3d98c68fa5d6f14"
> +SRC_URI[wgpu-hal-26.0.6.sha256sum] = "a8d0e67224cc7305b3b4eb2cc57ca4c4c3afc665c1d1bee162ea806e19c47bdd"
> +SRC_URI[wgpu-types-26.0.0.sha256sum] = "eca7a8d8af57c18f57d393601a1fb159ace8b2328f1b6b5f80893f7d672c9ae2"
> +SRC_URI[which-4.4.2.sha256sum] = "87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7"
> +SRC_URI[whisper-rs-0.16.0.sha256sum] = "2088172d00f936c348d6a72f488dc2660ab3f507263a195df308a3c2383229f6"
> +SRC_URI[whisper-rs-sys-0.15.0.sha256sum] = "6986c0fe081241d391f09b9a071fbcbb59720c3563628c3c829057cf69f2a56f"
> +SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> +SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
> +SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +SRC_URI[windows-0.58.0.sha256sum] = "dd04d41d93c4992d421894c18c8b43496aa748dd4c081bac0dc93eb0489272b6"
> +SRC_URI[windows-0.61.3.sha256sum] = "9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893"
> +SRC_URI[windows-collections-0.2.0.sha256sum] = "3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8"
> +SRC_URI[windows-core-0.58.0.sha256sum] = "6ba6d44ec8c2591c134257ce647b7ea6b20335bf6379a27dac5f1641fcf59f99"
> +SRC_URI[windows-core-0.61.2.sha256sum] = "c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3"
> +SRC_URI[windows-core-0.62.2.sha256sum] = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
> +SRC_URI[windows-future-0.2.1.sha256sum] = "fc6a41e98427b19fe4b73c550f060b59fa592d7d686537eebf9385621bfbad8e"
> +SRC_URI[windows-implement-0.58.0.sha256sum] = "2bbd5b46c938e506ecbce286b6628a02171d56153ba733b6c741fc627ec9579b"
> +SRC_URI[windows-implement-0.60.2.sha256sum] = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
> +SRC_URI[windows-interface-0.58.0.sha256sum] = "053c4c462dc91d3b1504c6fe5a726dd15e216ba718e84a0e46a88fbe5ded3515"
> +SRC_URI[windows-interface-0.59.3.sha256sum] = "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
> +SRC_URI[windows-link-0.1.3.sha256sum] = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
> +SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
> +SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
> +SRC_URI[windows-registry-0.6.1.sha256sum] = "02752bf7fbdcce7f2a27a742f798510f3e5ad88dbe84871e5168e2120c3d5720"
> +SRC_URI[windows-result-0.2.0.sha256sum] = "1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae0e"
> +SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
> +SRC_URI[windows-result-0.4.1.sha256sum] = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
> +SRC_URI[windows-strings-0.1.0.sha256sum] = "4cd9b125c486025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10"
> +SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
> +SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
> +SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
> +SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
> +SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
> +SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
> +SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
> +SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
> +SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
> +SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
> +SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
> +SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
> +SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> +SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
> +SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
> +SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
> +SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
> +SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
> +SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
> +SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
> +SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> +SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
> +SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
> +SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> +SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
> +SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
> +SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> +SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
> +SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
> +SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> +SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
> +SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
> +SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
> +SRC_URI[winnow-0.7.15.sha256sum] = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
> +SRC_URI[winnow-1.0.2.sha256sum] = "2ee1708bef14716a11bae175f579062d4554d95be2c6829f518df847b7b3fdd0"
> +SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
> +SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
> +SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
> +SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
> +SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
> +SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
> +SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
> +SRC_URI[writeable-0.6.3.sha256sum] = "1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4"
> +SRC_URI[x509-parser-0.18.1.sha256sum] = "d43b0f71ce057da06bc0851b23ee24f3f86190b07203dd8f567d0b706a185202"
> +SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
> +SRC_URI[xml-1.3.0.sha256sum] = "636f85e5ca6488e96401b61eb7de54f4e44755c988af0f52cf90230c312a1a89"
> +SRC_URI[xml-rs-0.8.28.sha256sum] = "3ae8337f8a065cfc972643663ea4279e04e7256de865aa66fe25cec5fb912d3f"
> +SRC_URI[xmlparser-0.13.6.sha256sum] = "66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4"
> +SRC_URI[xmltree-0.12.0.sha256sum] = "cbc04313cab124e498ab1724e739720807b6dc405b9ed0edc5860164d2e4ff70"
> +SRC_URI[y4m-0.8.0.sha256sum] = "7a5a4b21e1a62b67a2970e6831bc091d7b87e119e7f9791aef9702e3bef04448"
> +SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
> +SRC_URI[yasna-0.6.0.sha256sum] = "b5f6765e852b9b4dc8e2a76843e4d64d1cea8e79bcde0b6901aea8e7c7f08282"
> +SRC_URI[yoke-0.8.2.sha256sum] = "abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed36e445a1a48e66f9ca"
> +SRC_URI[yoke-derive-0.8.2.sha256sum] = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
> +SRC_URI[zerocopy-0.8.48.sha256sum] = "eed437bf9d6692032087e337407a86f04cd8d6a16a37199ed57949d415bd68e9"
> +SRC_URI[zerocopy-derive-0.8.48.sha256sum] = "70e3cd084b1788766f53af483dd21f93881ff30d7320490ec3ef7526d203bad4"
> +SRC_URI[zerofrom-0.1.7.sha256sum] = "69faa1f2a1ea75661980b013019ed6687ed0e83d069bc1114e2cc74c6c04c4df"
> +SRC_URI[zerofrom-derive-0.1.7.sha256sum] = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
> +SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0"
> +SRC_URI[zeroize_derive-1.4.3.sha256sum] = "85a5b4158499876c763cb03bc4e49185d3cccbabb15b33c627f7884f43db852e"
> +SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
> +SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
> +SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
> +SRC_URI[zip-7.2.0.sha256sum] = "c42e33efc22a0650c311c2ef19115ce232583abbe80850bc8b66509ebef02de0"
> +SRC_URI[zlib-rs-0.6.3.sha256sum] = "3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513"
> +SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
> +SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
> +SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
> +SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
> +SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
> +
> +# Git sourced dependencies and gst-plugin- crates
> +SRC_URI += " \
> +    crate://crates.io/cairo-rs/0.22.0 \
> +    crate://crates.io/cairo-sys-rs/0.22.0 \
> +    crate://crates.io/ffv1/0.0.0 \
> +    crate://crates.io/gdk-pixbuf/0.22.0 \
> +    crate://crates.io/gdk-pixbuf-sys/0.22.0 \
> +    crate://crates.io/gdk4/0.11.2 \
> +    crate://crates.io/gdk4-sys/0.11.2 \
> +    crate://crates.io/gdk4-wayland/0.11.0 \
> +    crate://crates.io/gdk4-wayland-sys/0.11.0 \
> +    crate://crates.io/gdk4-win32/0.11.0 \
> +    crate://crates.io/gdk4-win32-sys/0.11.0 \
> +    crate://crates.io/gdk4-x11/0.11.0 \
> +    crate://crates.io/gdk4-x11-sys/0.11.0 \
> +    crate://crates.io/gio/0.22.6 \
> +    crate://crates.io/gio-sys/0.22.0 \
> +    crate://crates.io/glib/0.22.7 \
> +    crate://crates.io/glib-macros/0.22.6 \
> +    crate://crates.io/glib-sys/0.22.6 \
> +    crate://crates.io/gobject-sys/0.22.6 \
> +    crate://crates.io/graphene-rs/0.22.0 \
> +    crate://crates.io/graphene-sys/0.22.0 \
> +    crate://crates.io/gsk4/0.11.1 \
> +    crate://crates.io/gsk4-sys/0.11.1 \
> +    crate://crates.io/gst-plugin-analytics/0.15.2 \
> +    crate://crates.io/gst-plugin-audiofx/0.15.2 \
> +    crate://crates.io/gst-plugin-audioparsers/0.15.0 \
> +    crate://crates.io/gst-plugin-aws/0.15.2 \
> +    crate://crates.io/gst-plugin-burn/0.15.2 \
> +    crate://crates.io/gst-plugin-cdg/0.15.0 \
> +    crate://crates.io/gst-plugin-claxon/0.15.0 \
> +    crate://crates.io/gst-plugin-closedcaption/0.15.2 \
> +    crate://crates.io/gst-plugin-csound/0.15.0 \
> +    crate://crates.io/gst-plugin-dav1d/0.15.0 \
> +    crate://crates.io/gst-plugin-debugseimetainserter/0.15.0 \
> +    crate://crates.io/gst-plugin-deepgram/0.15.2 \
> +    crate://crates.io/gst-plugin-demucs/0.15.2 \
> +    crate://crates.io/gst-plugin-elevenlabs/0.15.0 \
> +    crate://crates.io/gst-plugin-fallbackswitch/0.15.2 \
> +    crate://crates.io/gst-plugin-ffv1/0.0.0 \
> +    crate://crates.io/gst-plugin-file/0.15.0 \
> +    crate://crates.io/gst-plugin-flavors/0.0.0 \
> +    crate://crates.io/gst-plugin-gif/0.15.0 \
> +    crate://crates.io/gst-plugin-gopbuffer/0.15.2 \
> +    crate://crates.io/gst-plugin-gtk4/0.15.2 \
> +    crate://crates.io/gst-plugin-hlsmultivariantsink/0.15.0 \
> +    crate://crates.io/gst-plugin-hlssink3/0.15.0 \
> +    crate://crates.io/gst-plugin-hsv/0.15.0 \
> +    crate://crates.io/gst-plugin-icecast/0.15.2 \
> +    crate://crates.io/gst-plugin-inter/0.15.2 \
> +    crate://crates.io/gst-plugin-isobmff/0.15.2 \
> +    crate://crates.io/gst-plugin-json/0.15.0 \
> +    crate://crates.io/gst-plugin-lewton/0.15.0 \
> +    crate://crates.io/gst-plugin-livesync/0.15.0 \
> +    crate://crates.io/gst-plugin-mpegtslive/0.15.0 \
> +    crate://crates.io/gst-plugin-ndi/0.15.2 \
> +    crate://crates.io/gst-plugin-onvif/0.15.1 \
> +    crate://crates.io/gst-plugin-originalbuffer/0.15.2 \
> +    crate://crates.io/gst-plugin-png/0.15.2 \
> +    crate://crates.io/gst-plugin-quinn/0.15.2 \
> +    crate://crates.io/gst-plugin-raptorq/0.15.0 \
> +    crate://crates.io/gst-plugin-rav1e/0.15.0 \
> +    crate://crates.io/gst-plugin-regex/0.15.0 \
> +    crate://crates.io/gst-plugin-reqwest/0.15.0 \
> +    crate://crates.io/gst-plugin-rtp/0.15.2 \
> +    crate://crates.io/gst-plugin-rtsp/0.15.2 \
> +    crate://crates.io/gst-plugin-skia/0.15.0 \
> +    crate://crates.io/gst-plugin-sodium/0.15.0 \
> +    crate://crates.io/gst-plugin-speechmatics/0.15.2 \
> +    crate://crates.io/gst-plugin-spotify/0.15.0 \
> +    crate://crates.io/gst-plugin-streamgrouper/0.15.0 \
> +    crate://crates.io/gst-plugin-textaccumulate/0.15.2 \
> +    crate://crates.io/gst-plugin-textahead/0.15.0 \
> +    crate://crates.io/gst-plugin-textwrap/0.15.0 \
> +    crate://crates.io/gst-plugin-threadshare/0.15.2 \
> +    crate://crates.io/gst-plugin-togglerecord/0.15.0 \
> +    crate://crates.io/gst-plugin-tracers/0.15.2 \
> +    crate://crates.io/gst-plugin-uriplaylistbin/0.15.0 \
> +    crate://crates.io/gst-plugin-validate/0.15.0 \
> +    crate://crates.io/gst-plugin-version-helper/0.8.4 \
> +    crate://crates.io/gst-plugin-videofx/0.15.0 \
> +    crate://crates.io/gst-plugin-vvdec/0.15.0 \
> +    crate://crates.io/gst-plugin-webp/0.15.0 \
> +    crate://crates.io/gst-plugin-webrtc/0.15.2 \
> +    crate://crates.io/gst-plugin-webrtc-signalling/0.15.2 \
> +    crate://crates.io/gst-plugin-webrtc-signalling-protocol/0.15.0 \
> +    crate://crates.io/gst-plugin-webrtchttp/0.15.0 \
> +    crate://crates.io/gst-plugin-whisper/0.15.2 \
> +    crate://crates.io/gstreamer/0.25.2 \
> +    crate://crates.io/gstreamer-allocators/0.25.2 \
> +    crate://crates.io/gstreamer-allocators-sys/0.25.0 \
> +    crate://crates.io/gstreamer-analytics/0.25.2 \
> +    crate://crates.io/gstreamer-analytics-sys/0.25.2 \
> +    crate://crates.io/gstreamer-app/0.25.2 \
> +    crate://crates.io/gstreamer-app-sys/0.25.0 \
> +    crate://crates.io/gstreamer-audio/0.25.2 \
> +    crate://crates.io/gstreamer-audio-sys/0.25.2 \
> +    crate://crates.io/gstreamer-base/0.25.2 \
> +    crate://crates.io/gstreamer-base-sys/0.25.0 \
> +    crate://crates.io/gstreamer-check/0.25.0 \
> +    crate://crates.io/gstreamer-check-sys/0.25.0 \
> +    crate://crates.io/gstreamer-gl/0.25.2 \
> +    crate://crates.io/gstreamer-gl-egl/0.25.0 \
> +    crate://crates.io/gstreamer-gl-egl-sys/0.25.0 \
> +    crate://crates.io/gstreamer-gl-sys/0.25.0 \
> +    crate://crates.io/gstreamer-gl-wayland/0.25.0 \
> +    crate://crates.io/gstreamer-gl-wayland-sys/0.25.0 \
> +    crate://crates.io/gstreamer-gl-x11/0.25.0 \
> +    crate://crates.io/gstreamer-gl-x11-sys/0.25.0 \
> +    crate://crates.io/gstreamer-net/0.25.0 \
> +    crate://crates.io/gstreamer-net-sys/0.25.0 \
> +    crate://crates.io/gstreamer-pbutils/0.25.2 \
> +    crate://crates.io/gstreamer-pbutils-sys/0.25.2 \
> +    crate://crates.io/gstreamer-rtp/0.25.0 \
> +    crate://crates.io/gstreamer-rtp-sys/0.25.0 \
> +    crate://crates.io/gstreamer-sdp/0.25.2 \
> +    crate://crates.io/gstreamer-sdp-sys/0.25.0 \
> +    crate://crates.io/gstreamer-sys/0.25.2 \
> +    crate://crates.io/gstreamer-tag/0.25.2 \
> +    crate://crates.io/gstreamer-tag-sys/0.25.0 \
> +    crate://crates.io/gstreamer-utils/0.25.0 \
> +    crate://crates.io/gstreamer-validate/0.25.0 \
> +    crate://crates.io/gstreamer-validate-sys/0.25.0 \
> +    crate://crates.io/gstreamer-video/0.25.2 \
> +    crate://crates.io/gstreamer-video-sys/0.25.2 \
> +    crate://crates.io/gstreamer-webrtc/0.25.2 \
> +    crate://crates.io/gstreamer-webrtc-sys/0.25.0 \
> +    crate://crates.io/gtk4/0.11.3 \
> +    crate://crates.io/gtk4-macros/0.11.0 \
> +    crate://crates.io/gtk4-sys/0.11.3 \
> +    crate://crates.io/pango/0.22.6 \
> +    crate://crates.io/pango-sys/0.22.0 \
> +    crate://crates.io/pangocairo/0.22.0 \
> +    crate://crates.io/pangocairo-sys/0.22.0 \
> +"
> +
> +SRC_URI[cairo-rs-0.22.0.sha256sum] = "5cc8d9aa793480744cd9a0524fef1a2e197d9eaa0f739cde19d16aba530dcb95"
> +SRC_URI[cairo-sys-rs-0.22.0.sha256sum] = "f8b4985713047f5faee02b8db6a6ef32bbb50269ff53c1aee716d1d195b76d54"
> +SRC_URI[ffv1-0.0.0.sha256sum] = "02915cab396b4e0f8baa2503c9e2bf6e1104fe9a7986ebe101bc702fd2ec53eb"
> +SRC_URI[gdk-pixbuf-0.22.0.sha256sum] = "25f420376dbee041b2db374ce4573892a36222bb3f6c0c43e24f0d67eae9b646"
> +SRC_URI[gdk-pixbuf-sys-0.22.0.sha256sum] = "48f31b37b1fc4b48b54f6b91b7ef04c18e00b4585d98359dd7b998774bbd91fb"
> +SRC_URI[gdk4-0.11.2.sha256sum] = "fd42fdbbf48612c6e8f47c65fb92d2e8f39c25aecd6af047e83897c1a22d2a4e"
> +SRC_URI[gdk4-sys-0.11.2.sha256sum] = "9d974ac4f15e67472c3a9728daf612590b4a5762a4b33f0edd298df0b80d043c"
> +SRC_URI[gdk4-wayland-0.11.0.sha256sum] = "7027433b8f19075ab22f01d0e0ba4373e303ffdb4ce4f846a2763cb020ea9bdc"
> +SRC_URI[gdk4-wayland-sys-0.11.0.sha256sum] = "653cafb8715f2ac1c56edaf8060d9360ae3acbe3c6fb61b676a2917d42b668cf"
> +SRC_URI[gdk4-win32-0.11.0.sha256sum] = "990cda250ffeb4bac35c4c5716a3a0d1a17d524fca6243bb2c0b5c3ff3baeca0"
> +SRC_URI[gdk4-win32-sys-0.11.0.sha256sum] = "f2ca92d792abe5433bad3fd8fc2e234864d5e37268f6600a29350d174a30a942"
> +SRC_URI[gdk4-x11-0.11.0.sha256sum] = "13a00e4c617d6570633e44ba3ff221350669edf6cf3447a40f882dfb6f1dfdc3"
> +SRC_URI[gdk4-x11-sys-0.11.0.sha256sum] = "24d41f2e28f62378b081288914325d73bddbb6ccbbadb41aa6392afc71d27002"
> +SRC_URI[gio-0.22.6.sha256sum] = "e3848bcba3a35cc0a71df8ba8ecfd799d6bfb862342a53a4a915fb62213aa4e6"
> +SRC_URI[gio-sys-0.22.0.sha256sum] = "64729ba2772c080448f9f966dba8f4456beeb100d8c28a865ef8a0f2ef4987e1"
> +SRC_URI[glib-0.22.7.sha256sum] = "c207e04e51605dcf7b2924c41591b3a10e1438eaac5bcf448fb91f325381104a"
> +SRC_URI[glib-macros-0.22.6.sha256sum] = "506d23499707c7142898429757e8d9a3871d965239a2cb66dfa05052be6d6f19"
> +SRC_URI[glib-sys-0.22.6.sha256sum] = "5f7fbac234ed5bc2a28359b7bde8e1b9cdf1441cc2d7f068e4824672d7db9445"
> +SRC_URI[gobject-sys-0.22.6.sha256sum] = "22a861859b887a79cf461359c192c97a57d8fb0229dd291232e57aa11f6fa72c"
> +SRC_URI[graphene-rs-0.22.0.sha256sum] = "c7d1b7881f96869f49808b6adfe906a93a57a34204952253444d68c3208d71f1"
> +SRC_URI[graphene-sys-0.22.0.sha256sum] = "517f062f3fd6b7fd3e57a3f038a74b3c23ca32f51199ff028aa704609943f79c"
> +SRC_URI[gsk4-0.11.1.sha256sum] = "53c912dfcbd28acace5fc99c40bb9f25e1dcb73efb1f2608327f66a99acdcb62"
> +SRC_URI[gsk4-sys-0.11.1.sha256sum] = "d7d54bbc7a9d8b6ffe4f0c95eede15ccfb365c8bf521275abe6bcfb57b18fb8a"
> +SRC_URI[gst-plugin-analytics-0.15.2.sha256sum] = "669ea4d0589ec88c088853412eda981454580cc088299969699c4c89a8cb3631"
> +SRC_URI[gst-plugin-audiofx-0.15.2.sha256sum] = "355f0eb1e52f7069d62382b131334a8042d19c81e3e8c0198cce31ef33f38a40"
> +SRC_URI[gst-plugin-audioparsers-0.15.0.sha256sum] = "5df42337976282a3fd0f7580d766130e95b5a581257876b2a00a6c945694913f"
> +SRC_URI[gst-plugin-aws-0.15.2.sha256sum] = "8758e372ab1e306f8a3fadc2acef14c57a15032c1e0b171575b933ec008929f1"
> +SRC_URI[gst-plugin-burn-0.15.2.sha256sum] = "f011b27d495afb29982fb65386f0c70ff922356d7c7a9629d739fded1a81b658"
> +SRC_URI[gst-plugin-cdg-0.15.0.sha256sum] = "af6cc2c2d309e0b6254d499c2f14c134bc279be0dfca96821829567a13e2c2da"
> +SRC_URI[gst-plugin-claxon-0.15.0.sha256sum] = "f3133c753ff433971fdb3d98456ffc42314bc398197f24294adabf4fd6f5a0f3"
> +SRC_URI[gst-plugin-closedcaption-0.15.2.sha256sum] = "95af8d6878c6bfc07c01876b19a1b29295e1fca12841080f939c8c0721a6e2d3"
> +SRC_URI[gst-plugin-csound-0.15.0.sha256sum] = "696c64ab9bc0753f8098eb77b5f867498795d56d6a60c775875712efc955d669"
> +SRC_URI[gst-plugin-dav1d-0.15.0.sha256sum] = "1af679769a9e89f97c224ea4c5b3663b40dfae2d265c4d2953c8b9413aefa273"
> +SRC_URI[gst-plugin-debugseimetainserter-0.15.0.sha256sum] = "cc09a563d894c961414607a55777e185b13a6efb20d5ef8e4a23a8e7bcdff282"
> +SRC_URI[gst-plugin-deepgram-0.15.2.sha256sum] = "b06fd5bbc422abcc9ab8a3f3510977e4af4ecb7cfb5b29bd05de4ada9b545487"
> +SRC_URI[gst-plugin-demucs-0.15.2.sha256sum] = "022dbc208b5e3e52fdf35df3beaaf34d2a9f9e8b0b70fe28f82172272d0d9645"
> +SRC_URI[gst-plugin-elevenlabs-0.15.0.sha256sum] = "1da00b70fcdbb2702757cb14628550a884c878a1b72f04e5f7515ade1477d8c9"
> +SRC_URI[gst-plugin-fallbackswitch-0.15.2.sha256sum] = "d11ad4613ab1a356848ec41c959012ecaa628c86917f73eb3c2a9529c6b7471d"
> +SRC_URI[gst-plugin-ffv1-0.0.0.sha256sum] = "4e616e4d7f769e72d6d00dc5cbfdd5b099b90b95c6d4f91f3ce57e113454f33c"
> +SRC_URI[gst-plugin-file-0.15.0.sha256sum] = "30cb71a26ac4d370c0522ca602e758600ccf0bba1d9f972c83f91e2a5f8f7c28"
> +SRC_URI[gst-plugin-flavors-0.0.0.sha256sum] = "15a296a6d3fd30d4aaf2061b3981d6c4006bf8d51012f42214a36603c16c3c9d"
> +SRC_URI[gst-plugin-gif-0.15.0.sha256sum] = "0b86f9391e55b43c6c03d18d626d725c9c72d9d88aea4b1e0751ea23978e4bc2"
> +SRC_URI[gst-plugin-gopbuffer-0.15.2.sha256sum] = "354bae3228dd02a68314a1cb3820f7e5afeeec8dd9eabcb3bd18d06e0a7effea"
> +SRC_URI[gst-plugin-gtk4-0.15.2.sha256sum] = "9d22a27972c25e706b428e78356458446314c70eb31aef07d4a32b843a6dea94"
> +SRC_URI[gst-plugin-hlsmultivariantsink-0.15.0.sha256sum] = "18be883a2613c789632634c016f0fa355864880fb349d45f920a8f1d3f31693d"
> +SRC_URI[gst-plugin-hlssink3-0.15.0.sha256sum] = "d74c05a62c6ee82daaa9be8af4dc8fbc46cdc95e203a54af84843520a26bf91d"
> +SRC_URI[gst-plugin-hsv-0.15.0.sha256sum] = "138afa2bdcee5df89b5f9db6abe89a3eff71dc8813e1eae00754a9e3cbd16bee"
> +SRC_URI[gst-plugin-icecast-0.15.2.sha256sum] = "f230cd84bd2b8b2434933f825baf759743570906beca9163aaf4dd266e45e194"
> +SRC_URI[gst-plugin-inter-0.15.2.sha256sum] = "54fc01cdd32edc34faf182c277b3dbe2367e83645006c6265c0447e96017407a"
> +SRC_URI[gst-plugin-isobmff-0.15.2.sha256sum] = "960c8152a34a25b491815a5bdac4fbb18e621e62136fac71bcd05b96d7cd309d"
> +SRC_URI[gst-plugin-json-0.15.0.sha256sum] = "251c867f762f136393a8f5b838b0a953ef161e702ef6137eb1fa3906521a46de"
> +SRC_URI[gst-plugin-lewton-0.15.0.sha256sum] = "a8586dff659e6c317d85e88a8315da1c569dde5b24a19966b2bdb37a3865c027"
> +SRC_URI[gst-plugin-livesync-0.15.0.sha256sum] = "b71e2363c7d5099b1d2d56cd77d6b7a97b2f29dca29c78316a7333c048559109"
> +SRC_URI[gst-plugin-mpegtslive-0.15.0.sha256sum] = "27ca9c2de448df4d0e29bd812f811b62965df235f4c6d2cf31417ecefe10c087"
> +SRC_URI[gst-plugin-ndi-0.15.2.sha256sum] = "ee870b06fd3a341c916082893327ddaf617b3db0a5ba207a7a6d71d6e254e3c5"
> +SRC_URI[gst-plugin-onvif-0.15.1.sha256sum] = "9b3d67300ccc24a478b0ba66edccc67749fa01455a5e76ca4bf1c0571165534a"
> +SRC_URI[gst-plugin-originalbuffer-0.15.2.sha256sum] = "dc03b9c1157a9708f5f23e523b85ba655041fa36376cd507c3d8ce48ad35d1d1"
> +SRC_URI[gst-plugin-png-0.15.2.sha256sum] = "9f9dbd9d76abb40451ccd4889b25287a02be9e3855eaa2c99c2a532f360acbf3"
> +SRC_URI[gst-plugin-quinn-0.15.2.sha256sum] = "08a661d24c33267e67c34df570d4487687c3cdbcbe9aee7e047a4124a57793a7"
> +SRC_URI[gst-plugin-raptorq-0.15.0.sha256sum] = "266ab4d91e3f4c9311b02079ac3af8080a8c9e79012bc423f4bf730a0ba1a69b"
> +SRC_URI[gst-plugin-rav1e-0.15.0.sha256sum] = "4b4b9ca6182c7704ec02803f3159b5a0929e39572924a4d431a88e08cc112ef1"
> +SRC_URI[gst-plugin-regex-0.15.0.sha256sum] = "a50c3c50e363198cfe790148f5bf4d05c0c3847bd80c54998628306193b8c1b1"
> +SRC_URI[gst-plugin-reqwest-0.15.0.sha256sum] = "cf6687eda447b99865bb466da3b1a9ab501cb1d02db952162bc9f5d5fd87da31"
> +SRC_URI[gst-plugin-rtp-0.15.2.sha256sum] = "fbd08f982932c6795233837ed687fada93ac4b02e305ec646f5ce864e8b62eea"
> +SRC_URI[gst-plugin-rtsp-0.15.2.sha256sum] = "1ae2111686321e7b0a6abe2d46e3cbc8150626799f19d3e4cfe1f018bb4c5748"
> +SRC_URI[gst-plugin-skia-0.15.0.sha256sum] = "dc993f58fe72e3fd5924d2c5f8df12e91ecfe71aee5437003fa80ea99bd3bd63"
> +SRC_URI[gst-plugin-sodium-0.15.0.sha256sum] = "794426d07a39f6595ce0ad232da009d1f8de52824b4f012e5df47f72e43ee67c"
> +SRC_URI[gst-plugin-speechmatics-0.15.2.sha256sum] = "6fd497568de241f0c3edfd95ee76ce4ea7c04f2c65179d04bdbef14e0b1babe3"
> +SRC_URI[gst-plugin-spotify-0.15.0.sha256sum] = "d947c124edc93fa19e36d3b6b33ce63134c1450f621de6cfd9ea71f1ccaf77f0"
> +SRC_URI[gst-plugin-streamgrouper-0.15.0.sha256sum] = "d9146801268af7dca34f521ffbd38ed3cfe67b4c6d5a49954777b67669ab68df"
> +SRC_URI[gst-plugin-textaccumulate-0.15.2.sha256sum] = "5ce6f2495f49f09bcb7819af90d2be59b392a392b04bbc8e75d4073e39b93160"
> +SRC_URI[gst-plugin-textahead-0.15.0.sha256sum] = "e64fe8df571928625616f3471af5589fa3a90b3e04479873dfa3c1eda97c8d91"
> +SRC_URI[gst-plugin-textwrap-0.15.0.sha256sum] = "cc6c24ab545d79c5bad6db2b08b41f050b805571fa5567796420e8b89d665ead"
> +SRC_URI[gst-plugin-threadshare-0.15.2.sha256sum] = "b083487fc3a508619b111737288eb9adfb2b87fe7e134ca5742753c08623f721"
> +SRC_URI[gst-plugin-togglerecord-0.15.0.sha256sum] = "f93aa244e41dbebf12162153d2cbc611c5c8e2d4c23ac031e7b7184ebf79c6a6"
> +SRC_URI[gst-plugin-tracers-0.15.2.sha256sum] = "bd459e49316eca979294566fb73b596073992f6f633a0db4a39df9d7720e144a"
> +SRC_URI[gst-plugin-uriplaylistbin-0.15.0.sha256sum] = "bc3cd3b54c092810872040ad8cd76c7555b2ed1124d4eefb32dac70b176973be"
> +SRC_URI[gst-plugin-validate-0.15.0.sha256sum] = "b1e30c4f4c74f93056df16ac22c7ea2e527cd59ef96e0158f906e704ed49148a"
> +SRC_URI[gst-plugin-version-helper-0.8.4.sha256sum] = "94668bc2592732b8c2b653668ae41211d45988fb61264888b9c2d545d4bd826d"
> +SRC_URI[gst-plugin-videofx-0.15.0.sha256sum] = "ee78875953119a75937b42d731161b978767e138cdcc0915267456376b92f3ce"
> +SRC_URI[gst-plugin-vvdec-0.15.0.sha256sum] = "87cc20e2e06ae67db28e8a25a9020616ab398bfc987431264d143375c43d7038"
> +SRC_URI[gst-plugin-webp-0.15.0.sha256sum] = "9b06f005f41b2bed30bf82a65ca8994b8ace318c1f642e2c296730665c4e4a04"
> +SRC_URI[gst-plugin-webrtc-0.15.2.sha256sum] = "58b0f7af06bd2e98c71e8ad76a27a4045727b88af769a89d6a7f0fd5903047b0"
> +SRC_URI[gst-plugin-webrtc-signalling-0.15.2.sha256sum] = "e4ad57318b5b0046e25da3d424cad69b3918acdc95b79a655d5f1216f0a43dc6"
> +SRC_URI[gst-plugin-webrtc-signalling-protocol-0.15.0.sha256sum] = "4a65a57d00a57ff98b4f5d51375ee90295865bb76e6a8c5cec8d36aabf396e4b"
> +SRC_URI[gst-plugin-webrtchttp-0.15.0.sha256sum] = "9059b4836d2f3a98e34b62b11058e917d1f4743c968623636b755e74a06056e3"
> +SRC_URI[gst-plugin-whisper-0.15.2.sha256sum] = "37c641a33d58493c83b1c23d19978d476b3a8937e7a308c3ca1e958c58a1fcfd"
> +SRC_URI[gstreamer-0.25.2.sha256sum] = "28ca0c594cac4e86f5444aaa767c7bb810340c0710667a6467d3ead248e35e84"
> +SRC_URI[gstreamer-allocators-0.25.2.sha256sum] = "3d8b56a6b63b166823b6a718e2f22fb71d35b3e92748e244c4d9dc3be9993f20"
> +SRC_URI[gstreamer-allocators-sys-0.25.0.sha256sum] = "ea44ee4a86b39bcdcfd260179b7dbfdd5f81955d6fee35f11264934caf65230c"
> +SRC_URI[gstreamer-analytics-0.25.2.sha256sum] = "1394cc55935922dcd79a2767d7ac986aef651939cde10f34624b3c705bbd4bfc"
> +SRC_URI[gstreamer-analytics-sys-0.25.2.sha256sum] = "8a13cfa85043968bb1d624399b136b3f0b9e8e7bd4e71a7f8f45ace08df25aff"
> +SRC_URI[gstreamer-app-0.25.2.sha256sum] = "97f8ae9238c2352398dcc084de28df3f7099af216ac6c160b52318d23f25c010"
> +SRC_URI[gstreamer-app-sys-0.25.0.sha256sum] = "7a74a8211e5d7df2f45b612c284ddf56b92bdf4e879e8ed72e7c46dd0842e158"
> +SRC_URI[gstreamer-audio-0.25.2.sha256sum] = "2cdd06eb9c901b05902c55d106034319e2d730179744867564198d17c8486ed2"
> +SRC_URI[gstreamer-audio-sys-0.25.2.sha256sum] = "3d25892ad6fdd898936ca338d46d8632b298470ecc3eb82098e330ed2cdaec5d"
> +SRC_URI[gstreamer-base-0.25.2.sha256sum] = "c279df2918be97fb9570e589a32ade33598f643b0c4f0c92c17f06be6940574e"
> +SRC_URI[gstreamer-base-sys-0.25.0.sha256sum] = "6569606feeb89cfcf95a6476a64a0f0aec83fadcef0e91c24e576f7851ceac3a"
> +SRC_URI[gstreamer-check-0.25.0.sha256sum] = "bca00e318412c20405c6e0817cb330b706d128c779c9ec613fa2b53e4daf55c7"
> +SRC_URI[gstreamer-check-sys-0.25.0.sha256sum] = "7a15eb052477932b64993509db62a2b5fbfd88a1203d249e871ad5d7bc052508"
> +SRC_URI[gstreamer-gl-0.25.2.sha256sum] = "91d452d542cee699b747f3b5ab54096fcdf1d9b6f22b890d9d86a9d9f9258f49"
> +SRC_URI[gstreamer-gl-egl-0.25.0.sha256sum] = "ff3c29e6d4b92ef22b0bacc2cff02902d40516942fead63c656d7fccc75221e8"
> +SRC_URI[gstreamer-gl-egl-sys-0.25.0.sha256sum] = "e7294007aa6c0c6082d4835c391ab4094ef09ef581cde4c67edad2c1befcfd84"
> +SRC_URI[gstreamer-gl-sys-0.25.0.sha256sum] = "9c57ba9f4e0f2d852d480049b9eae4f69f0abe450eece4d96494da0b4857b04e"
> +SRC_URI[gstreamer-gl-wayland-0.25.0.sha256sum] = "9a83ca3d2030846f01be738b8b867ecb4b95269497bcfa459b8fc1ce897ad9f4"
> +SRC_URI[gstreamer-gl-wayland-sys-0.25.0.sha256sum] = "6ccd79a57650954ced0a0c8fcb38c561a83c1cb6515f1e318bbb6631ce287590"
> +SRC_URI[gstreamer-gl-x11-0.25.0.sha256sum] = "642d86fed827466e2d1ff4f430313fdab5d113bc2bf1e9c9736a873e8832c6ca"
> +SRC_URI[gstreamer-gl-x11-sys-0.25.0.sha256sum] = "1391e727c873085ce4f8b2deb7fc4dcb15098ef75433777510860b0d983ff39f"
> +SRC_URI[gstreamer-net-0.25.0.sha256sum] = "abcad04d471a4f2c859ef1287f22581b07064e357cc89dfa415ffc99b2a3193d"
> +SRC_URI[gstreamer-net-sys-0.25.0.sha256sum] = "bcefb342a98ffca0b106bc9fea13d5df15879e1613b4dc652a6ec1960c32584c"
> +SRC_URI[gstreamer-pbutils-0.25.2.sha256sum] = "2230395c2bf062b2538350e6a962b1ff5888f1b29cd65cd1d96dfd5ff74dfb66"
> +SRC_URI[gstreamer-pbutils-sys-0.25.2.sha256sum] = "eefc07f8f23ca04fae932accefcf22059060b4e3fd41c6445a502cd31c1350b6"
> +SRC_URI[gstreamer-rtp-0.25.0.sha256sum] = "0ea01e76ad8fd2e688a4f8a166060c9f9ba13dd6355ad7e22dbb793325d14411"
> +SRC_URI[gstreamer-rtp-sys-0.25.0.sha256sum] = "adf8df32469d863ce4375a978233a40efec206c5256bf0c14ee42bb745d8a793"
> +SRC_URI[gstreamer-sdp-0.25.2.sha256sum] = "f63c5dba39f65d0ed2cadcaa277fc905c30c9c7db37e024ad3bed7b0492042ad"
> +SRC_URI[gstreamer-sdp-sys-0.25.0.sha256sum] = "c20f0eb41ecfbacbf6a29d9457e6de0f59e2638f47fbdb6a6c1bcfb720c2b9ee"
> +SRC_URI[gstreamer-sys-0.25.2.sha256sum] = "533fa8d28fc830eafccbcfcfddb390563ea5d3a351af2c3aab99e197e5f5b1ba"
> +SRC_URI[gstreamer-tag-0.25.2.sha256sum] = "790d1c673da71c87e9648d98e96cdd785784ae948a9728b95b2c7c10f6f4ee61"
> +SRC_URI[gstreamer-tag-sys-0.25.0.sha256sum] = "e6bfa5a12fdd4489a50d0022ebd40439e3c4c29e3df96e2ab77fcc354f0d64b4"
> +SRC_URI[gstreamer-utils-0.25.0.sha256sum] = "7e81a18c2f314d567e11e4187ca60c6feb116fe85f23553e92a6d8f38c205998"
> +SRC_URI[gstreamer-validate-0.25.0.sha256sum] = "4122d38d435cfe0a0c1ec534291527f75006df01417427a6b39a1a8d67e76ac0"
> +SRC_URI[gstreamer-validate-sys-0.25.0.sha256sum] = "e4b20cd22a2ea40562630402c9b0ea6d82311506fd928b0b5e08c789210cc3e1"
> +SRC_URI[gstreamer-video-0.25.2.sha256sum] = "2bf728cb21499561ea0d6ce584e550bf2b98b279cc7741067ee42f41f98b486e"
> +SRC_URI[gstreamer-video-sys-0.25.2.sha256sum] = "109c2c997a90a5806a8d7fcb416755e3047d6bab8f580d2ededc9ab7ad553caf"
> +SRC_URI[gstreamer-webrtc-0.25.2.sha256sum] = "0eb47b71d463547b50ec8d0c69e175cb3f5cfc28f55c4cfd6735c9d368202a74"
> +SRC_URI[gstreamer-webrtc-sys-0.25.0.sha256sum] = "405721d1f15bbda47a46f9645077859215a947cdd6af6c7f18e4f4d0cbe63bd7"
> +SRC_URI[gtk4-0.11.3.sha256sum] = "7181b837f04cbe93f79441475f7a00560a92cba7a72e38cc1a68b6f8b78eaae2"
> +SRC_URI[gtk4-macros-0.11.0.sha256sum] = "3581b242ba62fdff122ebb626ea641582ec326031622bd19d60f85029c804a87"
> +SRC_URI[gtk4-sys-0.11.3.sha256sum] = "20ba8e695e2640455561274e65e45f0a151619e450746007667f4b23ceae4e1b"
> +SRC_URI[pango-0.22.6.sha256sum] = "251bdc6e6487b811be0e406a21e301e07e45c0aa8fa39e00c0c8e12a91752438"
> +SRC_URI[pango-sys-0.22.0.sha256sum] = "bbd111a20ca90fedf03e09c59783c679c00900f1d8491cca5399f5e33609d5d6"
> +SRC_URI[pangocairo-0.22.0.sha256sum] = "d9f15369c787b1cc59a5b86eff6afffd5a9716c5beb4969d20b307cebfe7e407"
> +SRC_URI[pangocairo-sys-0.22.0.sha256sum] = "d95cb73468373b9e568abb1afbaf5b42fe6ab9128fc41b5f2adbf69451c3c77f"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/Cargo.lock b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/Cargo.lock
> new file mode 100644
> index 0000000000..43228d70a0
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/Cargo.lock
> @@ -0,0 +1,13062 @@
> +# This file is automatically @generated by Cargo.
> +# It is not intended for manual editing.
> +version = 4
> +
> +[[package]]
> +name = "addr2line"
> +version = "0.25.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1b5d307320b3181d6d7954e663bd7c774a838b8220fe0593c86d9fb09f498b4b"
> +dependencies = [
> + "gimli",
> +]
> +
> +[[package]]
> +name = "adler2"
> +version = "2.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
> +
> +[[package]]
> +name = "aes"
> +version = "0.8.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
> +dependencies = [
> + "cfg-if",
> + "cipher",
> + "cpufeatures 0.2.17",
> +]
> +
> +[[package]]
> +name = "ahash"
> +version = "0.8.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5a15f179cd60c4584b8a8c596927aadc462e27f2ca70c04e0071964a73ba7a75"
> +dependencies = [
> + "cfg-if",
> + "once_cell",
> + "version_check",
> + "zerocopy",
> +]
> +
> +[[package]]
> +name = "aho-corasick"
> +version = "1.1.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
> +dependencies = [
> + "memchr",
> +]
> +
> +[[package]]
> +name = "aligned"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ee4508988c62edf04abd8d92897fca0c2995d907ce1dfeaf369dac3716a40685"
> +dependencies = [
> + "as-slice",
> +]
> +
> +[[package]]
> +name = "aligned-vec"
> +version = "0.6.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dc890384c8602f339876ded803c97ad529f3842aba97f6392b3dba0dd171769b"
> +dependencies = [
> + "equator",
> +]
> +
> +[[package]]
> +name = "allocator-api2"
> +version = "0.2.21"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
> +
> +[[package]]
> +name = "android_system_properties"
> +version = "0.1.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
> +dependencies = [
> + "libc",
> +]
> +
> +[[package]]
> +name = "anstream"
> +version = "1.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
> +dependencies = [
> + "anstyle",
> + "anstyle-parse",
> + "anstyle-query",
> + "anstyle-wincon",
> + "colorchoice",
> + "is_terminal_polyfill",
> + "utf8parse",
> +]
> +
> +[[package]]
> +name = "anstyle"
> +version = "1.0.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
> +
> +[[package]]
> +name = "anstyle-parse"
> +version = "1.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
> +dependencies = [
> + "utf8parse",
> +]
> +
> +[[package]]
> +name = "anstyle-query"
> +version = "1.1.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
> +dependencies = [
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "anstyle-wincon"
> +version = "3.0.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
> +dependencies = [
> + "anstyle",
> + "once_cell_polyfill",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "anyhow"
> +version = "1.0.102"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
> +
> +[[package]]
> +name = "anymap3"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "170433209e817da6aae2c51aa0dd443009a613425dd041ebfb2492d1c4c11a25"
> +
> +[[package]]
> +name = "arbitrary"
> +version = "1.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1"
> +
> +[[package]]
> +name = "arg_enum_proc_macro"
> +version = "0.3.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0ae92a5119aa49cdbcf6b9f893fe4e1d98b04ccbf82ee0584ad948a44a734dea"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "array-init"
> +version = "2.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3d62b7694a562cdf5a74227903507c56ab2cc8bdd1f781ed5cb4cf9c9f810bfc"
> +
> +[[package]]
> +name = "arrayvec"
> +version = "0.7.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
> +
> +[[package]]
> +name = "as-slice"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "516b6b4f0e40d50dcda9365d53964ec74560ad4284da2e7fc97122cd83174516"
> +dependencies = [
> + "stable_deref_trait",
> +]
> +
> +[[package]]
> +name = "ash"
> +version = "0.38.0+1.3.281"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0bb44936d800fea8f016d7f2311c6a4f97aebd5dc86f09906139ec848cf3a46f"
> +dependencies = [
> + "libloading 0.8.9",
> +]
> +
> +[[package]]
> +name = "asn1-rs"
> +version = "0.7.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "56624a96882bb8c26d61312ae18cb45868e5a9992ea73c58e45c3101e56a1e60"
> +dependencies = [
> + "asn1-rs-derive",
> + "asn1-rs-impl",
> + "displaydoc",
> + "nom 7.1.3",
> + "num-traits",
> + "rusticata-macros",
> + "thiserror 2.0.18",
> + "time",
> +]
> +
> +[[package]]
> +name = "asn1-rs-derive"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3109e49b1e4909e9db6515a30c633684d68cdeaa252f215214cb4fa1a5bfee2c"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> + "synstructure",
> +]
> +
> +[[package]]
> +name = "asn1-rs-impl"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7b18050c2cd6fe86c3a76584ef5e0baf286d038cda203eb6223df2cc413565f7"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "async-channel"
> +version = "2.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "924ed96dd52d1b75e9c1a3e6275715fd320f5f9439fb5a4a11fa51f4221158d2"
> +dependencies = [
> + "concurrent-queue",
> + "event-listener-strategy",
> + "futures-core",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "async-compression"
> +version = "0.4.42"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e79b3f8a79cccc2898f31920fc69f304859b3bd567490f75ebf51ae1c792a9ac"
> +dependencies = [
> + "compression-codecs",
> + "compression-core",
> + "pin-project-lite",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "async-lock"
> +version = "3.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "290f7f2596bd5b78a9fec8088ccd89180d7f9f55b94b0576823bbbdc72ee8311"
> +dependencies = [
> + "event-listener",
> + "event-listener-strategy",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "async-recursion"
> +version = "1.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3b43422f69d8ff38f95f1b2bb76517c91589a924d1559a0e935d7c8ce0274c11"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "async-stream"
> +version = "0.3.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0b5a71a6f37880a80d1d7f19efd781e4b5de42c88f0722cc13bcb6cc2cfe8476"
> +dependencies = [
> + "async-stream-impl",
> + "futures-core",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "async-stream-impl"
> +version = "0.3.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c7c24de15d275a1ecfd47a380fb4d5ec9bfe0933f309ed5e705b775596a3574d"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "async-task"
> +version = "4.7.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8b75356056920673b02621b35afd0f7dda9306d03c79a30f5c56c44cf256e3de"
> +
> +[[package]]
> +name = "async-trait"
> +version = "0.1.89"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9035ad2d096bed7955a320ee7e2230574d28fd3c3a0f186cbea1ff3c7eed5dbb"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "async-tungstenite"
> +version = "0.34.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8447f02eaa65412035e2d3eeaa3fc82bbb8d7137c84c5976b4af685136012ee9"
> +dependencies = [
> + "atomic-waker",
> + "futures-core",
> + "futures-io",
> + "futures-task",
> + "futures-util",
> + "log",
> + "pin-project-lite",
> + "rustls-native-certs 0.8.3",
> + "rustls-pki-types",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tungstenite 0.29.0",
> +]
> +
> +[[package]]
> +name = "atomic-waker"
> +version = "1.1.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1505bd5d3d116872e7271a6d4e16d81d0c8570876c8de68093a09ac269d8aac0"
> +
> +[[package]]
> +name = "atomic_float"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "628d228f918ac3b82fe590352cc719d30664a0c13ca3a60266fe02c7132d480a"
> +
> +[[package]]
> +name = "atomic_refcell"
> +version = "0.1.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "21e4227379beff4205943696e6c3e0cd809bacdf3f0edd6e3dd153e2269571a4"
> +
> +[[package]]
> +name = "autocfg"
> +version = "1.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
> +
> +[[package]]
> +name = "av-data"
> +version = "0.4.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fca67ba5d317924c02180c576157afd54babe48a76ebc66ce6d34bb8ba08308e"
> +dependencies = [
> + "byte-slice-cast",
> + "bytes",
> + "num-derive",
> + "num-rational",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "av-scenechange"
> +version = "0.14.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0f321d77c20e19b92c39e7471cf986812cbb46659d2af674adc4331ef3f18394"
> +dependencies = [
> + "aligned",
> + "anyhow",
> + "arg_enum_proc_macro",
> + "arrayvec",
> + "log",
> + "num-rational",
> + "num-traits",
> + "pastey 0.1.1",
> + "rayon",
> + "thiserror 2.0.18",
> + "v_frame",
> + "y4m",
> +]
> +
> +[[package]]
> +name = "av1-grain"
> +version = "0.2.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8cfddb07216410377231960af4fcab838eaa12e013417781b78bd95ee22077f8"
> +dependencies = [
> + "anyhow",
> + "arrayvec",
> + "log",
> + "nom 8.0.0",
> + "num-rational",
> + "v_frame",
> +]
> +
> +[[package]]
> +name = "aws-config"
> +version = "1.8.16"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "50f156acdd2cf55f5aa53ee416c4ac851cf1222694506c0b1f78c85695e9ca9d"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-sdk-sts",
> + "aws-smithy-async",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "http 1.4.0",
> + "time",
> + "tokio",
> + "tracing",
> + "url",
> +]
> +
> +[[package]]
> +name = "aws-credential-types"
> +version = "1.2.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8f20799b373a1be121fe3005fba0c2090af9411573878f224df44b42727fcaf7"
> +dependencies = [
> + "aws-smithy-async",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "aws-runtime"
> +version = "1.7.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5dcd93c82209ac7413532388067dce79be5a8780c1786e5fae3df22e4dee2864"
> +dependencies = [
> + "aws-credential-types",
> + "aws-sigv4",
> + "aws-smithy-async",
> + "aws-smithy-eventstream",
> + "aws-smithy-http",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "bytes-utils",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "http-body 0.4.6",
> + "http-body 1.0.1",
> + "percent-encoding",
> + "pin-project-lite",
> + "tracing",
> + "uuid",
> +]
> +
> +[[package]]
> +name = "aws-sdk-kinesisvideo"
> +version = "1.100.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "423ac3b091283a64e28c0d89bb8d285502c635c8d85a87f74c618ebe84a6a0af"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-smithy-async",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "regex-lite",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-sdk-kinesisvideosignaling"
> +version = "1.98.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "02e60f628d8e7d9a4764857341e4a82604ce4bc3bfb72a021e71f70e594f02fe"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-smithy-async",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "regex-lite",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-sdk-polly"
> +version = "1.106.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "aedf8415d6909f5cd0ffd6669313eafd5b10a110b7306de2f3df2d3ebdb8844b"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-sigv4",
> + "aws-smithy-async",
> + "aws-smithy-eventstream",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "http-body-util",
> + "regex-lite",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-sdk-s3"
> +version = "1.132.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5575840a3a6b11f6011463ebe359320dfe5b67babb5e9b06fed6ddf809a9ab40"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-sigv4",
> + "aws-smithy-async",
> + "aws-smithy-checksums",
> + "aws-smithy-eventstream",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-smithy-xml",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "hex",
> + "hmac 0.13.0",
> + "http 0.2.12",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "lru",
> + "percent-encoding",
> + "regex-lite",
> + "sha2 0.11.0",
> + "tracing",
> + "url",
> +]
> +
> +[[package]]
> +name = "aws-sdk-sso"
> +version = "1.98.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d69c77aafa20460c68b6b3213c84f6423b6e76dbf89accd3e1789a686ffd9489"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-smithy-async",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "regex-lite",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-sdk-sts"
> +version = "1.103.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c2249b81a2e73a8027c41c378463a81ec39b8510f184f2caab87de912af0f49b"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-smithy-async",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-query",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-smithy-xml",
> + "aws-types",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "regex-lite",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-sdk-transcribestreaming"
> +version = "1.103.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9e3025be53b063917cc86846bbe0c235542fb44ad38163b85de400ced3cda234"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-sigv4",
> + "aws-smithy-async",
> + "aws-smithy-eventstream",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "http-body-util",
> + "regex-lite",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-sdk-translate"
> +version = "1.98.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7eb0e2f6b3f4dbaedc768eb6cd9b20c11ace5db6b64094ec7ddb6450c8577d56"
> +dependencies = [
> + "aws-credential-types",
> + "aws-runtime",
> + "aws-smithy-async",
> + "aws-smithy-http",
> + "aws-smithy-json",
> + "aws-smithy-observability",
> + "aws-smithy-runtime",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "regex-lite",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-sigv4"
> +version = "1.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "68dc0b907359b120170613b5c09ccc61304eac3998ff6274b97d93ee6490115a"
> +dependencies = [
> + "aws-credential-types",
> + "aws-smithy-eventstream",
> + "aws-smithy-http",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "bytes",
> + "crypto-bigint 0.5.5",
> + "form_urlencoded",
> + "hex",
> + "hmac 0.13.0",
> + "http 0.2.12",
> + "http 1.4.0",
> + "p256 0.11.1",
> + "percent-encoding",
> + "ring",
> + "sha2 0.11.0",
> + "subtle",
> + "time",
> + "tracing",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "aws-smithy-async"
> +version = "1.2.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2ffcaf626bdda484571968400c326a244598634dc75fd451325a54ad1a59acfc"
> +dependencies = [
> + "futures-util",
> + "pin-project-lite",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "aws-smithy-checksums"
> +version = "0.64.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "10efbbcec1e044b81600e2fc562a391951d291152d95b482d5b7e7132299d762"
> +dependencies = [
> + "aws-smithy-http",
> + "aws-smithy-types",
> + "bytes",
> + "crc-fast",
> + "hex",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "http-body-util",
> + "md-5",
> + "pin-project-lite",
> + "sha1 0.11.0",
> + "sha2 0.11.0",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-smithy-eventstream"
> +version = "0.60.20"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "faf09d74e5e32f76b8762da505a3cd59303e367a664ca67295387baa8c1d7548"
> +dependencies = [
> + "aws-smithy-types",
> + "bytes",
> + "crc32fast",
> +]
> +
> +[[package]]
> +name = "aws-smithy-http"
> +version = "0.63.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ba1ab2dc1c2c3749ead27180d333c42f11be8b0e934058fb4b2258ee8dbe5231"
> +dependencies = [
> + "aws-smithy-eventstream",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "bytes",
> + "bytes-utils",
> + "futures-core",
> + "futures-util",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "http-body-util",
> + "percent-encoding",
> + "pin-project-lite",
> + "pin-utils",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-smithy-http-client"
> +version = "1.1.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6a2f165a7feee6f263028b899d0a181987f4fa7179a6411a32a439fba7c5f769"
> +dependencies = [
> + "aws-smithy-async",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "h2 0.3.27",
> + "h2 0.4.14",
> + "http 0.2.12",
> + "http-body 0.4.6",
> + "hyper 0.14.32",
> + "hyper-rustls 0.24.2",
> + "pin-project-lite",
> + "rustls 0.21.12",
> + "rustls-native-certs 0.8.3",
> + "tokio",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-smithy-json"
> +version = "0.62.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9648b0bb82a2eedd844052c6ad2a1a822d1f8e3adee5fbf668366717e428856a"
> +dependencies = [
> + "aws-smithy-types",
> +]
> +
> +[[package]]
> +name = "aws-smithy-observability"
> +version = "0.2.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a06c2315d173edbf1920da8ba3a7189695827002e4c0fc961973ab1c54abca9c"
> +dependencies = [
> + "aws-smithy-runtime-api",
> +]
> +
> +[[package]]
> +name = "aws-smithy-query"
> +version = "0.60.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1a56d79744fb3edb5d722ef79d86081e121d3b9422cb209eb03aea6aa4f21ebd"
> +dependencies = [
> + "aws-smithy-types",
> + "urlencoding",
> +]
> +
> +[[package]]
> +name = "aws-smithy-runtime"
> +version = "1.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0504b1ab12debb5959e5165ee5fe97dd387e7aa7ea6a477bfd7635dfe769a4f5"
> +dependencies = [
> + "aws-smithy-async",
> + "aws-smithy-http",
> + "aws-smithy-http-client",
> + "aws-smithy-observability",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "bytes",
> + "fastrand",
> + "http 0.2.12",
> + "http 1.4.0",
> + "http-body 0.4.6",
> + "http-body 1.0.1",
> + "http-body-util",
> + "pin-project-lite",
> + "pin-utils",
> + "tokio",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "aws-smithy-runtime-api"
> +version = "1.12.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b71a13df6ada0aafbf21a73bdfcdf9324cfa9df77d96b8446045be3cde61b42e"
> +dependencies = [
> + "aws-smithy-async",
> + "aws-smithy-runtime-api-macros",
> + "aws-smithy-types",
> + "bytes",
> + "http 0.2.12",
> + "http 1.4.0",
> + "pin-project-lite",
> + "tokio",
> + "tracing",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "aws-smithy-runtime-api-macros"
> +version = "1.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8d7396fd9500589e62e460e987ecb671bad374934e55ec3b5f498cc7a8a8a7b7"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "aws-smithy-types"
> +version = "1.4.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9d73dbfbaa8e4bc57b9045137680b958d274823509a360abfd8e1d514d40c95c"
> +dependencies = [
> + "base64-simd",
> + "bytes",
> + "bytes-utils",
> + "futures-core",
> + "http 0.2.12",
> + "http 1.4.0",
> + "http-body 0.4.6",
> + "http-body 1.0.1",
> + "http-body-util",
> + "itoa",
> + "num-integer",
> + "pin-project-lite",
> + "pin-utils",
> + "ryu",
> + "serde",
> + "time",
> + "tokio",
> + "tokio-util",
> +]
> +
> +[[package]]
> +name = "aws-smithy-xml"
> +version = "0.60.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0ce02add1aa3677d022f8adf81dcbe3046a95f17a1b1e8979c145cd21d3d22b3"
> +dependencies = [
> + "xmlparser",
> +]
> +
> +[[package]]
> +name = "aws-types"
> +version = "1.3.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2f4bbcaa9304ea40902d3d5f42a0428d1bd895a2b0f6999436fb279ffddc58ac"
> +dependencies = [
> + "aws-credential-types",
> + "aws-smithy-async",
> + "aws-smithy-runtime-api",
> + "aws-smithy-types",
> + "rustc_version",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "backtrace"
> +version = "0.3.76"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bb531853791a215d7c62a30daf0dde835f381ab5de4589cfe7c649d2cbe92bd6"
> +dependencies = [
> + "addr2line",
> + "cfg-if",
> + "libc",
> + "miniz_oxide",
> + "object",
> + "rustc-demangle",
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "base16ct"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "349a06037c7bf932dd7e7d1f653678b2038b9ad46a74102f1fc7bd7872678cce"
> +
> +[[package]]
> +name = "base16ct"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4c7f02d4ea65f2c1853089ffd8d2787bdbc63de2f0d29dedbcf8ccdfa0ccd4cf"
> +
> +[[package]]
> +name = "base32"
> +version = "0.5.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "022dfe9eb35f19ebbcb51e0b40a5ab759f46ad60cadf7297e0bd085afb50e076"
> +
> +[[package]]
> +name = "base64"
> +version = "0.21.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
> +
> +[[package]]
> +name = "base64"
> +version = "0.22.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
> +
> +[[package]]
> +name = "base64-serde"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "77c6d128af408d8ebd08331f0331cf2cf20d19e6c44a7aec58791641ecc8c0b5"
> +
> +[[package]]
> +name = "base64-simd"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "339abbe78e73178762e23bea9dfd08e697eb3f3301cd4be981c0f78ba5859195"
> +dependencies = [
> + "outref",
> + "vsimd",
> +]
> +
> +[[package]]
> +name = "base64ct"
> +version = "1.8.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2af50177e190e07a26ab74f8b1efbfe2ef87da2116221318cb1c2e82baf7de06"
> +
> +[[package]]
> +name = "bincode"
> +version = "1.3.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b1f45e9417d87227c7a56d22e471c6206462cba514c7590c09aff4cf6d1ddcad"
> +dependencies = [
> + "serde",
> +]
> +
> +[[package]]
> +name = "bincode"
> +version = "2.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "36eaf5d7b090263e8150820482d5d93cd964a81e4019913c972f4edcc6edb740"
> +dependencies = [
> + "serde",
> + "unty",
> +]
> +
> +[[package]]
> +name = "bindgen"
> +version = "0.70.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f49d8fed880d473ea71efb9bf597651e77201bdd4893efe54c9e5d65ae04ce6f"
> +dependencies = [
> + "bitflags 2.11.1",
> + "cexpr",
> + "clang-sys",
> + "itertools 0.13.0",
> + "log",
> + "prettyplease",
> + "proc-macro2",
> + "quote",
> + "regex",
> + "rustc-hash 1.1.0",
> + "shlex",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "bindgen"
> +version = "0.71.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5f58bf3d7db68cfbac37cfc485a8d711e87e064c3d0fe0435b92f7a407f9d6b3"
> +dependencies = [
> + "bitflags 2.11.1",
> + "cexpr",
> + "clang-sys",
> + "itertools 0.13.0",
> + "log",
> + "prettyplease",
> + "proc-macro2",
> + "quote",
> + "regex",
> + "rustc-hash 2.1.2",
> + "shlex",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "bindgen"
> +version = "0.72.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "993776b509cfb49c750f11b8f07a46fa23e0a1386ffc01fb1e7d343efc387895"
> +dependencies = [
> + "bitflags 2.11.1",
> + "cexpr",
> + "clang-sys",
> + "itertools 0.13.0",
> + "log",
> + "prettyplease",
> + "proc-macro2",
> + "quote",
> + "regex",
> + "rustc-hash 2.1.2",
> + "shlex",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "bit-set"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "08807e080ed7f9d5433fa9b275196cfc35414f66a0c79d864dc51a0d825231a3"
> +dependencies = [
> + "bit-vec 0.8.0",
> +]
> +
> +[[package]]
> +name = "bit-vec"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5e764a1d40d510daf35e07be9eb06e75770908c27d411ee6c92109c9840eaaf7"
> +
> +[[package]]
> +name = "bit-vec"
> +version = "0.9.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b71798fca2c1fe1086445a7258a4bc81e6e49dcd24c8d0dd9a1e57395b603f51"
> +dependencies = [
> + "serde",
> +]
> +
> +[[package]]
> +name = "bitflags"
> +version = "1.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> +
> +[[package]]
> +name = "bitflags"
> +version = "2.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
> +dependencies = [
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "bitreader"
> +version = "0.3.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "886559b1e163d56c765bc3a985febb4eee8009f625244511d8ee3c432e08c066"
> +dependencies = [
> + "cfg-if",
> +]
> +
> +[[package]]
> +name = "bitstream-io"
> +version = "4.10.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7eff00be299a18769011411c9def0d827e8f2d7bf0c3dbf53633147a8867fd1f"
> +dependencies = [
> + "no_std_io2",
> +]
> +
> +[[package]]
> +name = "block"
> +version = "0.1.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0d8c1fef690941d3e7788d328517591fecc684c084084702d6ff1641e993699a"
> +
> +[[package]]
> +name = "block-buffer"
> +version = "0.10.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
> +dependencies = [
> + "generic-array",
> +]
> +
> +[[package]]
> +name = "block-buffer"
> +version = "0.12.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cdd35008169921d80bc60d3d0ab416eecb028c4cd653352907921d95084790be"
> +dependencies = [
> + "hybrid-array",
> +]
> +
> +[[package]]
> +name = "block2"
> +version = "0.6.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cdeb9d870516001442e364c5220d3574d2da8dc765554b4a617230d33fa58ef5"
> +dependencies = [
> + "objc2",
> +]
> +
> +[[package]]
> +name = "bs58"
> +version = "0.5.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bf88ba1141d185c399bee5288d850d63b8369520c1eafc32a0430b5b6c287bf4"
> +dependencies = [
> + "tinyvec",
> +]
> +
> +[[package]]
> +name = "bstr"
> +version = "1.12.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
> +dependencies = [
> + "memchr",
> +]
> +
> +[[package]]
> +name = "built"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f4ad8f11f288f48ca24471bbd51ac257aaeaaa07adae295591266b792902ae64"
> +
> +[[package]]
> +name = "bumpalo"
> +version = "3.20.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
> +
> +[[package]]
> +name = "burn"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b78ff10ed98b73e1d477ea6e6e1ec1b9cf9f71a17afc3fea9f4dca482d43dcd4"
> +dependencies = [
> + "burn-core",
> + "burn-cpu",
> + "burn-ndarray",
> + "burn-nn",
> + "burn-optim",
> + "burn-wgpu",
> +]
> +
> +[[package]]
> +name = "burn-backend"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a724a5d8d5865a1f6b304f629eb19f51489760689501c583b3e1f4209f067357"
> +dependencies = [
> + "burn-std",
> + "bytemuck",
> + "cubecl",
> + "derive-new",
> + "hashbrown 0.16.1",
> + "num-traits",
> + "rand 0.9.4",
> + "rand_distr",
> + "serde",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "burn-core"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9c3634c3ba84397bcf2977ce746954d7e0a40e2d862e92362dd694c29e18df62"
> +dependencies = [
> + "ahash",
> + "bincode 2.0.1",
> + "burn-derive",
> + "burn-std",
> + "burn-tensor",
> + "data-encoding",
> + "derive-new",
> + "flate2",
> + "half",
> + "hashbrown 0.16.1",
> + "log",
> + "num-traits",
> + "portable-atomic",
> + "portable-atomic-util",
> + "rand 0.9.4",
> + "regex",
> + "rmp-serde",
> + "serde",
> + "serde_json",
> + "spin 0.10.0",
> + "thiserror 2.0.18",
> + "uuid",
> +]
> +
> +[[package]]
> +name = "burn-cpu"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "60aa53c4536719f1c91c250d4b4348daca473c44cf0c45b81096785f5510c192"
> +dependencies = [
> + "burn-backend",
> + "burn-cubecl",
> + "cubecl",
> +]
> +
> +[[package]]
> +name = "burn-cubecl"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8d6d13aff03fec966da4300459688883f8a1d741dddbf19d1bfc2562656a9a9b"
> +dependencies = [
> + "burn-backend",
> + "burn-ir",
> + "burn-std",
> + "cubecl",
> + "cubek",
> + "derive-new",
> + "futures-lite",
> + "log",
> + "serde",
> + "text_placeholder",
> +]
> +
> +[[package]]
> +name = "burn-derive"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "102d7e2f705b0cda2f89dd0e55e9bbfc6184029929d53487beb606c3303b29a5"
> +dependencies = [
> + "derive-new",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "burn-ir"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fd2b1b37a7289bd85438800deaaebde50507336429b80f96a71730794db5bc31"
> +dependencies = [
> + "burn-backend",
> + "hashbrown 0.16.1",
> + "serde",
> +]
> +
> +[[package]]
> +name = "burn-ndarray"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "96be578991cecef163e41a73bf985d8d7eb7fb8ef7bececf8d48523c481ecddf"
> +dependencies = [
> + "atomic_float",
> + "burn-backend",
> + "burn-ir",
> + "burn-std",
> + "const-random",
> + "libm",
> + "matrixmultiply",
> + "ndarray",
> + "num-traits",
> + "paste",
> + "portable-atomic",
> + "portable-atomic-util",
> + "rand 0.9.4",
> +]
> +
> +[[package]]
> +name = "burn-nn"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "14b8c6c14b94e5b1dddd68f8e6d669f20bac8f99fcb2e4f1a480212d1b598133"
> +dependencies = [
> + "burn-core",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "burn-optim"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5a8c376d835d92ea363c05c6f48ac19bb687b683c7958c310a716ef8d5d77ba3"
> +dependencies = [
> + "burn-core",
> + "derive-new",
> + "hashbrown 0.16.1",
> + "num-traits",
> + "serde",
> +]
> +
> +[[package]]
> +name = "burn-std"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "25a9ed8e34a4a49d3754586f306075d6b55a5e08343ac75c06f47e7d9f825271"
> +dependencies = [
> + "bytemuck",
> + "bytes",
> + "cubecl",
> + "cubecl-common",
> + "half",
> + "indicatif",
> + "num-traits",
> + "reqwest",
> + "serde",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "burn-store"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4be80a7b084a19901dc1d0a2e9b77e226c5c575879fe66de891c67062db41a6d"
> +dependencies = [
> + "burn-core",
> + "burn-nn",
> + "burn-tensor",
> + "byteorder",
> + "bytes",
> + "half",
> + "hashbrown 0.16.1",
> + "memmap2",
> + "regex",
> + "safetensors",
> + "serde",
> + "textdistance",
> + "zip",
> +]
> +
> +[[package]]
> +name = "burn-tensor"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3720e52e00ed0155ced4f8681d0e8a362e699cee36494ec5b97ad44fcc5194c0"
> +dependencies = [
> + "burn-backend",
> + "burn-std",
> + "colored",
> + "derive-new",
> + "num-traits",
> + "serde",
> +]
> +
> +[[package]]
> +name = "burn-wgpu"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "df78d62afc9b9fbb8ee4e49b72006485bb64f778a790e185a2d919479bcfc008"
> +dependencies = [
> + "burn-backend",
> + "burn-cubecl",
> + "cubecl",
> +]
> +
> +[[package]]
> +name = "byte-slice-cast"
> +version = "1.2.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7575182f7272186991736b70173b0ea045398f984bf5ebbb3804736ce1330c9d"
> +
> +[[package]]
> +name = "bytemuck"
> +version = "1.25.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c8efb64bd706a16a1bdde310ae86b351e4d21550d98d056f22f8a7f7a2183fec"
> +dependencies = [
> + "bytemuck_derive",
> +]
> +
> +[[package]]
> +name = "bytemuck_derive"
> +version = "1.10.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f9abbd1bc6865053c427f7198e6af43bfdedc55ab791faed4fbd361d789575ff"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "byteorder"
> +version = "1.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
> +
> +[[package]]
> +name = "byteorder-lite"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
> +
> +[[package]]
> +name = "byteorder_slice"
> +version = "3.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0b294e30387378958e8bf8f4242131b930ea615ff81e8cac2440cea0a6013190"
> +dependencies = [
> + "byteorder",
> +]
> +
> +[[package]]
> +name = "bytes"
> +version = "1.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
> +dependencies = [
> + "portable-atomic",
> +]
> +
> +[[package]]
> +name = "bytes-utils"
> +version = "0.1.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7dafe3a8757b027e2be6e4e5601ed563c55989fcf1546e933c66c8eb3a058d35"
> +dependencies = [
> + "bytes",
> + "either",
> +]
> +
> +[[package]]
> +name = "bzip2"
> +version = "0.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44f56e8e90e4bb7c346c"
> +dependencies = [
> + "libbz2-rs-sys",
> +]
> +
> +[[package]]
> +name = "c2rust-bitfields"
> +version = "0.20.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "46dc7d2bffa0d0b3d47eb2dc69973466858281446c2ac9f6d8a10e92ab1017df"
> +dependencies = [
> + "c2rust-bitfields-derive",
> +]
> +
> +[[package]]
> +name = "c2rust-bitfields-derive"
> +version = "0.20.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ebe1117afa5937ce280034e31fa1e84ed1824a252f75380327eed438535333f8"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 1.0.109",
> +]
> +
> +[[package]]
> +name = "cairo-rs"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "bitflags 2.11.1",
> + "cairo-sys-rs",
> + "glib",
> + "libc",
> +]
> +
> +[[package]]
> +name = "cairo-sys-rs"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "glib-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "caseless"
> +version = "0.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8b6fd507454086c8edfd769ca6ada439193cdb209c7681712ef6275cccbfe5d8"
> +dependencies = [
> + "unicode-normalization",
> +]
> +
> +[[package]]
> +name = "cc"
> +version = "1.2.62"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a1dce859f0832a7d088c4f1119888ab94ef4b5d6795d1ce05afb7fe159d79f98"
> +dependencies = [
> + "find-msvc-tools",
> + "jobserver",
> + "libc",
> + "shlex",
> +]
> +
> +[[package]]
> +name = "cdg"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d254b2c9fc971518da5d652aee7edc6b9bb96fa32de28f166895faf69d9926e6"
> +
> +[[package]]
> +name = "cdg_renderer"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0070ec0e6be4ed55d28bcfc499ecd479cb3764181eee2018dc661d8efd4e3f71"
> +dependencies = [
> + "cdg",
> + "image",
> +]
> +
> +[[package]]
> +name = "cdp-types"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "332ca05a88e143d80a245f9aa6c65b6e6383ee3e332017005647c27c6a62f902"
> +dependencies = [
> + "cea708-types",
> + "log",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "cea608-types"
> +version = "0.1.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5dfc9d3f5161702cf339e6337203ac26b64279383468247e45b36e221cb06cae"
> +dependencies = [
> + "log",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "cea708-types"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "de28b1d549e7f8f53a746fb36ae4c10c776a8e004950b527be1669a58667ae0b"
> +dependencies = [
> + "log",
> + "muldiv",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "cesu8"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6d43a04d8753f35258c91f8ec639f792891f748a1edbd759cf1dcea3382ad83c"
> +
> +[[package]]
> +name = "cexpr"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6fac387a98bb7c37292057cffc56d62ecb629900026402633ae9160df93a8766"
> +dependencies = [
> + "nom 7.1.3",
> +]
> +
> +[[package]]
> +name = "cfg-expr"
> +version = "0.17.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8d4ba6e40bd1184518716a6e1a781bf9160e286d219ccdb8ab2612e74cfe4789"
> +dependencies = [
> + "smallvec",
> + "target-lexicon 0.12.16",
> +]
> +
> +[[package]]
> +name = "cfg-if"
> +version = "1.0.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
> +
> +[[package]]
> +name = "cfg_aliases"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "613afe47fcd5fac7ccf1db93babcb082c5994d996f20b8b159f2ad1658eb5724"
> +
> +[[package]]
> +name = "chacha20"
> +version = "0.10.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6f8d983286843e49675a4b7a2d174efe136dc93a18d69130dd18198a6c167601"
> +dependencies = [
> + "cfg-if",
> + "cpufeatures 0.3.0",
> + "rand_core 0.10.1",
> +]
> +
> +[[package]]
> +name = "chrono"
> +version = "0.4.44"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c673075a2e0e5f4a1dde27ce9dee1ea4558c7ffe648f576438a20ca1d2acc4b0"
> +dependencies = [
> + "iana-time-zone",
> + "js-sys",
> + "num-traits",
> + "serde",
> + "wasm-bindgen",
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "cipher"
> +version = "0.4.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
> +dependencies = [
> + "crypto-common 0.1.7",
> + "inout",
> +]
> +
> +[[package]]
> +name = "clang-sys"
> +version = "1.8.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0b023947811758c97c59bf9d1c188fd619ad4718dcaa767947df1cadb14f39f4"
> +dependencies = [
> + "glob",
> + "libc",
> + "libloading 0.8.9",
> +]
> +
> +[[package]]
> +name = "clap"
> +version = "4.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1ddb117e43bbf7dacf0a4190fef4d345b9bad68dfc649cb349e7d17d28428e51"
> +dependencies = [
> + "clap_builder",
> + "clap_derive",
> +]
> +
> +[[package]]
> +name = "clap_builder"
> +version = "4.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "714a53001bf66416adb0e2ef5ac857140e7dc3a0c48fb28b2f10762fc4b5069f"
> +dependencies = [
> + "anstream",
> + "anstyle",
> + "clap_lex",
> + "strsim",
> +]
> +
> +[[package]]
> +name = "clap_derive"
> +version = "4.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
> +dependencies = [
> + "heck 0.5.0",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "clap_lex"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
> +
> +[[package]]
> +name = "claxon"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4bfbf56724aa9eca8afa4fcfadeb479e722935bb2a0900c2d37e0cc477af0688"
> +
> +[[package]]
> +name = "cmake"
> +version = "0.1.58"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c0f78a02292a74a88ac736019ab962ece0bc380e3f977bf72e376c5d78ff0678"
> +dependencies = [
> + "cc",
> +]
> +
> +[[package]]
> +name = "cmov"
> +version = "0.5.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3f88a43d011fc4a6876cb7344703e297c71dda42494fee094d5f7c76bf13f746"
> +
> +[[package]]
> +name = "codespan-reporting"
> +version = "0.12.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fe6d2e5af09e8c8ad56c969f2157a3d4238cebc7c55f0a517728c38f7b200f81"
> +dependencies = [
> + "serde",
> + "termcolor",
> + "unicode-width",
> +]
> +
> +[[package]]
> +name = "color-name"
> +version = "1.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2980f82525cf4a0eb43a7dcc1396bbea824897a98ef4948bd150310469acb432"
> +
> +[[package]]
> +name = "color-thief"
> +version = "0.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e6460d760cf38ce67c9e0318f896538820acc54f2d0a3bfc5b2c557211066c98"
> +dependencies = [
> + "rgb",
> +]
> +
> +[[package]]
> +name = "color_quant"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"
> +
> +[[package]]
> +name = "colorchoice"
> +version = "1.0.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
> +
> +[[package]]
> +name = "colored"
> +version = "3.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "faf9468729b8cbcea668e36183cb69d317348c2e08e994829fb56ebfdfbaac34"
> +dependencies = [
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "combine"
> +version = "4.6.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ba5a308b75df32fe02788e748662718f03fde005016435c444eea572398219fd"
> +dependencies = [
> + "bytes",
> + "memchr",
> +]
> +
> +[[package]]
> +name = "compression-codecs"
> +version = "0.4.38"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ce2548391e9c1929c21bf6aa2680af86fe4c1b33e6cea9ac1cfeec0bd11218cf"
> +dependencies = [
> + "compression-core",
> + "flate2",
> + "memchr",
> +]
> +
> +[[package]]
> +name = "compression-core"
> +version = "0.4.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cc14f565cf027a105f7a44ccf9e5b424348421a1d8952a8fc9d499d313107789"
> +
> +[[package]]
> +name = "comrak"
> +version = "0.39.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2fefab951771fc3beeed0773ce66a4f7b706273fc6c4c95b08dd1615744abcf5"
> +dependencies = [
> + "caseless",
> + "entities",
> + "memchr",
> + "slug",
> + "typed-arena",
> + "unicode_categories",
> +]
> +
> +[[package]]
> +name = "concurrent-queue"
> +version = "2.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973"
> +dependencies = [
> + "crossbeam-utils",
> +]
> +
> +[[package]]
> +name = "console"
> +version = "0.16.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87"
> +dependencies = [
> + "encode_unicode",
> + "libc",
> + "unicode-width",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "const-oid"
> +version = "0.9.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
> +
> +[[package]]
> +name = "const-oid"
> +version = "0.10.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
> +
> +[[package]]
> +name = "const-random"
> +version = "0.1.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359"
> +dependencies = [
> + "const-random-macro",
> +]
> +
> +[[package]]
> +name = "const-random-macro"
> +version = "0.1.16"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
> +dependencies = [
> + "getrandom 0.2.17",
> + "once_cell",
> + "tiny-keccak",
> +]
> +
> +[[package]]
> +name = "constant_time_eq"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7c74b8349d32d297c9134b8c88677813a227df8f779daa29bfc29c183fe3dca6"
> +
> +[[package]]
> +name = "constcat"
> +version = "0.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "136d3e02915a2cea4d74caa8681e2d44b1c3254bdbf17d11d41d587ff858832c"
> +
> +[[package]]
> +name = "convert_case"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "baaaa0ecca5b51987b9423ccdc971514dd8b0bb7b4060b983d3664dad3f1f89f"
> +dependencies = [
> + "unicode-segmentation",
> +]
> +
> +[[package]]
> +name = "convert_case"
> +version = "0.10.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "633458d4ef8c78b72454de2d54fd6ab2e60f9e02be22f3c6104cdc8a4e0fceb9"
> +dependencies = [
> + "unicode-segmentation",
> +]
> +
> +[[package]]
> +name = "cookie"
> +version = "0.18.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4ddef33a339a91ea89fb53151bd0a4689cfce27055c291dfa69945475d22c747"
> +dependencies = [
> + "percent-encoding",
> + "time",
> + "version_check",
> +]
> +
> +[[package]]
> +name = "cookie-factory"
> +version = "0.3.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9885fa71e26b8ab7855e2ec7cae6e9b380edff76cd052e07c683a0319d51b3a2"
> +dependencies = [
> + "futures",
> +]
> +
> +[[package]]
> +name = "cookie_store"
> +version = "0.22.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "15b2c103cf610ec6cae3da84a766285b42fd16aad564758459e6ecf128c75206"
> +dependencies = [
> + "cookie",
> + "document-features",
> + "idna",
> + "log",
> + "publicsuffix",
> + "serde",
> + "serde_derive",
> + "serde_json",
> + "time",
> + "url",
> +]
> +
> +[[package]]
> +name = "core-foundation"
> +version = "0.9.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
> +dependencies = [
> + "core-foundation-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "core-foundation"
> +version = "0.10.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6"
> +dependencies = [
> + "core-foundation-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "core-foundation-sys"
> +version = "0.8.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
> +
> +[[package]]
> +name = "core-graphics-types"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3d44a101f213f6c4cdc1853d4b78aef6db6bdfa3468798cc1d9912f4735013eb"
> +dependencies = [
> + "bitflags 2.11.1",
> + "core-foundation 0.10.1",
> + "libc",
> +]
> +
> +[[package]]
> +name = "cpufeatures"
> +version = "0.2.17"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
> +dependencies = [
> + "libc",
> +]
> +
> +[[package]]
> +name = "cpufeatures"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
> +dependencies = [
> + "libc",
> +]
> +
> +[[package]]
> +name = "crc"
> +version = "3.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675"
> +dependencies = [
> + "crc-catalog",
> +]
> +
> +[[package]]
> +name = "crc-catalog"
> +version = "2.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "217698eaf96b4a3f0bc4f3662aaa55bdf913cd54d7204591faa790070c6d0853"
> +
> +[[package]]
> +name = "crc-fast"
> +version = "1.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2fd92aca2c6001b1bf5ba0ff84ee74ec8501b52bbef0cac80bf25a6c1d87a83d"
> +dependencies = [
> + "crc",
> + "digest 0.10.7",
> + "rustversion",
> + "spin 0.10.0",
> +]
> +
> +[[package]]
> +name = "crc32fast"
> +version = "1.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
> +dependencies = [
> + "cfg-if",
> +]
> +
> +[[package]]
> +name = "critical-section"
> +version = "1.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "790eea4361631c5e7d22598ecd5723ff611904e3344ce8720784c93e3d83d40b"
> +
> +[[package]]
> +name = "crossbeam-deque"
> +version = "0.8.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9dd111b7b7f7d55b72c0a6ae361660ee5853c9af73f70c3c2ef6858b950e2e51"
> +dependencies = [
> + "crossbeam-epoch",
> + "crossbeam-utils",
> +]
> +
> +[[package]]
> +name = "crossbeam-epoch"
> +version = "0.9.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
> +dependencies = [
> + "crossbeam-utils",
> +]
> +
> +[[package]]
> +name = "crossbeam-utils"
> +version = "0.8.21"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
> +
> +[[package]]
> +name = "crunchy"
> +version = "0.2.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
> +
> +[[package]]
> +name = "crypto-bigint"
> +version = "0.4.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ef2b4b23cddf68b89b8f8069890e8c270d54e2d5fe1b143820234805e4cb17ef"
> +dependencies = [
> + "generic-array",
> + "rand_core 0.6.4",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "crypto-bigint"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0dc92fb57ca44df6db8059111ab3af99a63d5d0f8375d9972e319a379c6bab76"
> +dependencies = [
> + "generic-array",
> + "rand_core 0.6.4",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "crypto-common"
> +version = "0.1.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
> +dependencies = [
> + "generic-array",
> + "typenum",
> +]
> +
> +[[package]]
> +name = "crypto-common"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "77727bb15fa921304124b128af125e7e3b968275d1b108b379190264f4423710"
> +dependencies = [
> + "hybrid-array",
> +]
> +
> +[[package]]
> +name = "csound"
> +version = "0.1.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8d49045d7365f5c2cadb1f20932189a0da101ac86c8dbe891975814b2348d57d"
> +dependencies = [
> + "bitflags 1.3.2",
> + "csound-sys",
> + "libc",
> + "va_list",
> +]
> +
> +[[package]]
> +name = "csound-sys"
> +version = "0.1.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "86b11869eaed111b64d29e66cc5c7de9f172d5b623b716eb74c5dd841dbcfe39"
> +dependencies = [
> + "libc",
> + "va_list",
> +]
> +
> +[[package]]
> +name = "ctr"
> +version = "0.9.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0369ee1ad671834580515889b80f2ea915f23b8be8d0daa4bbaf2ac5c7590835"
> +dependencies = [
> + "cipher",
> +]
> +
> +[[package]]
> +name = "ctrlc"
> +version = "3.5.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
> +dependencies = [
> + "dispatch2",
> + "nix 0.31.3",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "ctutils"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7d5515a3834141de9eafb9717ad39eea8247b5674e6066c404e8c4b365d2a29e"
> +dependencies = [
> + "cmov",
> +]
> +
> +[[package]]
> +name = "cubecl"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "053856efd5436224775b9423d43d86f53d5b1d3af9a6b9983d9a313a0922638f"
> +dependencies = [
> + "cubecl-core",
> + "cubecl-cpu",
> + "cubecl-cuda",
> + "cubecl-ir",
> + "cubecl-runtime",
> + "cubecl-std",
> + "cubecl-wgpu",
> + "half",
> +]
> +
> +[[package]]
> +name = "cubecl-common"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "60bf8aaeb572c8cf2f2ffd07fa9bb1a2cf9336d1aa11ecd4d9a2f2e30c4be706"
> +dependencies = [
> + "backtrace",
> + "bytemuck",
> + "bytes",
> + "cfg-if",
> + "cfg_aliases",
> + "derive-new",
> + "derive_more",
> + "dirs",
> + "embassy-futures",
> + "embassy-time",
> + "float4",
> + "float8",
> + "futures-lite",
> + "half",
> + "hashbrown 0.15.5",
> + "log",
> + "num-traits",
> + "parking_lot",
> + "portable-atomic",
> + "portable-atomic-util",
> + "rand 0.9.4",
> + "sanitize-filename",
> + "serde",
> + "serde_bytes",
> + "serde_json",
> + "spin 0.10.0",
> + "wasm-bindgen-futures",
> + "web-time",
> +]
> +
> +[[package]]
> +name = "cubecl-core"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "98374a31d2b68b55709891169832ccf205408c201c5e023964482441f213d0b9"
> +dependencies = [
> + "bitflags 2.11.1",
> + "bytemuck",
> + "cubecl-common",
> + "cubecl-ir",
> + "cubecl-macros",
> + "cubecl-runtime",
> + "derive-new",
> + "derive_more",
> + "enumset",
> + "float-ord",
> + "half",
> + "hashbrown 0.15.5",
> + "log",
> + "num-traits",
> + "paste",
> + "serde",
> + "serde_json",
> + "variadics_please",
> +]
> +
> +[[package]]
> +name = "cubecl-cpp"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fb24d96c1ff84ab4def0a529e384311a15cb771310aaf2b640c312384c3bca23"
> +dependencies = [
> + "bytemuck",
> + "cubecl-common",
> + "cubecl-core",
> + "cubecl-opt",
> + "cubecl-runtime",
> + "derive-new",
> + "half",
> + "itertools 0.14.0",
> + "log",
> +]
> +
> +[[package]]
> +name = "cubecl-cpu"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "152588a6e16b6bda5e8216af7a6fad3d7de4697294b6ce0f6acbe3a9029ff674"
> +dependencies = [
> + "bytemuck",
> + "cubecl-common",
> + "cubecl-core",
> + "cubecl-opt",
> + "cubecl-runtime",
> + "cubecl-std",
> + "derive-new",
> + "half",
> + "log",
> + "paste",
> + "serde",
> + "sysinfo",
> + "tracel-llvm",
> + "tracel-llvm-bundler",
> +]
> +
> +[[package]]
> +name = "cubecl-cuda"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6f74a5750c45090d1fc5ddf6a19fea9a099aa1f6800b78f1167a2d60182d1d96"
> +dependencies = [
> + "bytemuck",
> + "cubecl-common",
> + "cubecl-core",
> + "cubecl-cpp",
> + "cubecl-runtime",
> + "cubecl-zspace",
> + "cudarc",
> + "derive-new",
> + "half",
> + "log",
> + "serde",
> +]
> +
> +[[package]]
> +name = "cubecl-ir"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "361b608ff9f05024c7a7e381852689acd95b6af5af956d68734692b27d5f75ef"
> +dependencies = [
> + "cubecl-common",
> + "cubecl-macros-internal",
> + "derive-new",
> + "derive_more",
> + "enumset",
> + "float-ord",
> + "fnv",
> + "half",
> + "hashbrown 0.15.5",
> + "num-traits",
> + "portable-atomic",
> + "serde",
> + "variadics_please",
> +]
> +
> +[[package]]
> +name = "cubecl-macros"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7c9a872d16207c6a27ed45942fd311a281394dd384b14a21f72131db1556a977"
> +dependencies = [
> + "cubecl-common",
> + "darling 0.21.3",
> + "derive-new",
> + "ident_case",
> + "prettyplease",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "cubecl-macros-internal"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "aa3fa0626cdf28b9c49084c2bb51493bfde44378e22d90624aacaafb81da3588"
> +dependencies = [
> + "darling 0.21.3",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "cubecl-opt"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bdcff25fdcbd82ea4277c30a81e162722859f57c6ae105c0a3c53f8bb91154f6"
> +dependencies = [
> + "cubecl-common",
> + "cubecl-core",
> + "cubecl-ir",
> + "float-ord",
> + "log",
> + "num",
> + "petgraph",
> + "smallvec",
> + "stable-vec",
> + "type-map",
> +]
> +
> +[[package]]
> +name = "cubecl-runtime"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b02e28997a8d75311afae4d2cea7b593eb125312f845874118a59d78c7a6b34c"
> +dependencies = [
> + "async-channel",
> + "bytemuck",
> + "cfg-if",
> + "cfg_aliases",
> + "cubecl-common",
> + "cubecl-ir",
> + "derive-new",
> + "derive_more",
> + "dirs",
> + "enumset",
> + "foldhash 0.1.5",
> + "hashbrown 0.15.5",
> + "log",
> + "md5",
> + "serde",
> + "serde_json",
> + "spin 0.10.0",
> + "thiserror 2.0.18",
> + "toml 0.9.12+spec-1.1.0",
> + "variadics_please",
> + "wasm-bindgen-futures",
> + "web-time",
> +]
> +
> +[[package]]
> +name = "cubecl-spirv"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d7d7d68a3e09d4782098f82b0b7347f3a9e54a9977b3b5a23145464a84cf14dc"
> +dependencies = [
> + "bitflags 2.11.1",
> + "cubecl-common",
> + "cubecl-core",
> + "cubecl-opt",
> + "cubecl-runtime",
> + "half",
> + "hashbrown 0.15.5",
> + "tracel-rspirv",
> +]
> +
> +[[package]]
> +name = "cubecl-std"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e8ff5741c98b7a7a5944b4afb0b67dd7f5e0be41ce7f303b587f8b0d6430b29b"
> +dependencies = [
> + "cubecl-common",
> + "cubecl-core",
> + "cubecl-runtime",
> + "foldhash 0.1.5",
> + "half",
> + "num-traits",
> + "paste",
> + "serde",
> + "spin 0.10.0",
> + "variadics_please",
> +]
> +
> +[[package]]
> +name = "cubecl-wgpu"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "29787364632fc7ec6a11cf3d95187f82f6fcce17d6bb4f0fb0dde580b837631d"
> +dependencies = [
> + "ash",
> + "async-channel",
> + "bytemuck",
> + "cfg-if",
> + "cfg_aliases",
> + "cubecl-common",
> + "cubecl-core",
> + "cubecl-ir",
> + "cubecl-runtime",
> + "cubecl-spirv",
> + "derive-new",
> + "derive_more",
> + "half",
> + "hashbrown 0.15.5",
> + "log",
> + "sanitize-filename",
> + "tracel-ash",
> + "wgpu",
> +]
> +
> +[[package]]
> +name = "cubecl-zspace"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7a0f819071413b19a00b7105497e0f6d2cf3e7e9d65cbb8d4ecf1ddb29c61dc2"
> +
> +[[package]]
> +name = "cubek"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1bb1cce47db02017925301bedec92ae84628493df3f9761ea7ac42a60c6146f8"
> +dependencies = [
> + "cubecl",
> + "cubek-attention",
> + "cubek-convolution",
> + "cubek-matmul",
> + "cubek-quant",
> + "cubek-random",
> + "cubek-reduce",
> +]
> +
> +[[package]]
> +name = "cubek-attention"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7278bd122b2428af479f9af05285160613733c33c93b63ab3c6d25cd0460c18b"
> +dependencies = [
> + "bytemuck",
> + "cubecl",
> + "cubecl-common",
> + "cubek-matmul",
> + "cubek-random",
> + "half",
> + "serde",
> +]
> +
> +[[package]]
> +name = "cubek-convolution"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "18eb04bca4ae104d62a56def04b04f3d079c42fe49aac62202c96876f90fa28b"
> +dependencies = [
> + "bytemuck",
> + "cubecl",
> + "cubecl-common",
> + "cubek-matmul",
> + "derive-new",
> + "enumset",
> + "half",
> + "serde",
> +]
> +
> +[[package]]
> +name = "cubek-matmul"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a28f3b04b113760e97c65a8a4dca9afc220744031eeecd5ad6cd0e3be91ba3a9"
> +dependencies = [
> + "bytemuck",
> + "cubecl",
> + "cubecl-common",
> + "half",
> + "serde",
> +]
> +
> +[[package]]
> +name = "cubek-quant"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "96ec3ae04af324df2d615c2b394e270d58d6f08cb833d67633e2ba794de75916"
> +dependencies = [
> + "cubecl",
> + "cubecl-common",
> + "half",
> + "serde",
> +]
> +
> +[[package]]
> +name = "cubek-random"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "65a34844d8b7f739185c1d24896137dcb73f458830444103b45f678585ad983e"
> +dependencies = [
> + "cubecl",
> + "cubecl-common",
> + "half",
> + "num-traits",
> + "rand 0.9.4",
> + "serde",
> +]
> +
> +[[package]]
> +name = "cubek-reduce"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "42397d9ed85bb3084dfb56ed26de75690b5b07caf42a32f4006b57eb23d5b6d6"
> +dependencies = [
> + "cubecl",
> + "half",
> + "num-traits",
> + "serde",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "cudarc"
> +version = "0.18.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3aa12038120eb13347a6ae2ffab1d34efe78150125108627fd85044dd4d6ff1e"
> +dependencies = [
> + "libloading 0.8.9",
> +]
> +
> +[[package]]
> +name = "curve25519-dalek"
> +version = "4.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "97fb8b7c4503de7d6ae7b42ab72a5a59857b4c937ec27a3d4539dba95b5ab2be"
> +dependencies = [
> + "cfg-if",
> + "cpufeatures 0.2.17",
> + "curve25519-dalek-derive",
> + "digest 0.10.7",
> + "fiat-crypto",
> + "rustc_version",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "curve25519-dalek-derive"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f46882e17999c6cc590af592290432be3bce0428cb0d5f8b6715e4dc7b383eb3"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "darling"
> +version = "0.20.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fc7f46116c46ff9ab3eb1597a45688b6715c6e628b5c133e288e709a29bcb4ee"
> +dependencies = [
> + "darling_core 0.20.11",
> + "darling_macro 0.20.11",
> +]
> +
> +[[package]]
> +name = "darling"
> +version = "0.21.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9cdf337090841a411e2a7f3deb9187445851f91b309c0c0a29e05f74a00a48c0"
> +dependencies = [
> + "darling_core 0.21.3",
> + "darling_macro 0.21.3",
> +]
> +
> +[[package]]
> +name = "darling"
> +version = "0.23.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "25ae13da2f202d56bd7f91c25fba009e7717a1e4a1cc98a76d844b65ae912e9d"
> +dependencies = [
> + "darling_core 0.23.0",
> + "darling_macro 0.23.0",
> +]
> +
> +[[package]]
> +name = "darling_core"
> +version = "0.20.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0d00b9596d185e565c2207a0b01f8bd1a135483d02d9b7b0a54b11da8d53412e"
> +dependencies = [
> + "fnv",
> + "ident_case",
> + "proc-macro2",
> + "quote",
> + "strsim",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "darling_core"
> +version = "0.21.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1247195ecd7e3c85f83c8d2a366e4210d588e802133e1e355180a9870b517ea4"
> +dependencies = [
> + "fnv",
> + "ident_case",
> + "proc-macro2",
> + "quote",
> + "strsim",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "darling_core"
> +version = "0.23.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9865a50f7c335f53564bb694ef660825eb8610e0a53d3e11bf1b0d3df31e03b0"
> +dependencies = [
> + "ident_case",
> + "proc-macro2",
> + "quote",
> + "strsim",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "darling_macro"
> +version = "0.20.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fc34b93ccb385b40dc71c6fceac4b2ad23662c7eeb248cf10d529b7e055b6ead"
> +dependencies = [
> + "darling_core 0.20.11",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "darling_macro"
> +version = "0.21.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d38308df82d1080de0afee5d069fa14b0326a88c14f15c5ccda35b4a6c414c81"
> +dependencies = [
> + "darling_core 0.21.3",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "darling_macro"
> +version = "0.23.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ac3984ec7bd6cfa798e62b4a642426a5be0e68f9401cfc2a01e3fa9ea2fcdb8d"
> +dependencies = [
> + "darling_core 0.23.0",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "dash-mpd"
> +version = "0.20.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "99aa4f01bf47635af7d137707d14665af5603d65fb410a64da42ad949527069c"
> +dependencies = [
> + "base64 0.22.1",
> + "base64-serde",
> + "byteorder",
> + "bytes",
> + "chrono",
> + "edit-distance",
> + "futures-util",
> + "hxdmp",
> + "iso8601",
> + "lazy_static",
> + "num-traits",
> + "quick-xml 0.39.4",
> + "regex",
> + "serde",
> + "serde_path_to_error",
> + "serde_with",
> + "thiserror 2.0.18",
> + "tracing",
> + "url",
> + "webm-iterable",
> + "xattr",
> +]
> +
> +[[package]]
> +name = "dasp"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7381b67da416b639690ac77c73b86a7b5e64a29e31d1f75fb3b1102301ef355a"
> +dependencies = [
> + "dasp_envelope",
> + "dasp_frame",
> + "dasp_interpolate",
> + "dasp_peak",
> + "dasp_ring_buffer",
> + "dasp_rms",
> + "dasp_sample",
> + "dasp_signal",
> + "dasp_slice",
> + "dasp_window",
> +]
> +
> +[[package]]
> +name = "dasp_envelope"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8ec617ce7016f101a87fe85ed44180839744265fae73bb4aa43e7ece1b7668b6"
> +dependencies = [
> + "dasp_frame",
> + "dasp_peak",
> + "dasp_ring_buffer",
> + "dasp_rms",
> + "dasp_sample",
> +]
> +
> +[[package]]
> +name = "dasp_frame"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b2a3937f5fe2135702897535c8d4a5553f8b116f76c1529088797f2eee7c5cd6"
> +dependencies = [
> + "dasp_sample",
> +]
> +
> +[[package]]
> +name = "dasp_interpolate"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7fc975a6563bb7ca7ec0a6c784ead49983a21c24835b0bc96eea11ee407c7486"
> +dependencies = [
> + "dasp_frame",
> + "dasp_ring_buffer",
> + "dasp_sample",
> +]
> +
> +[[package]]
> +name = "dasp_peak"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5cf88559d79c21f3d8523d91250c397f9a15b5fc72fbb3f87fdb0a37b79915bf"
> +dependencies = [
> + "dasp_frame",
> + "dasp_sample",
> +]
> +
> +[[package]]
> +name = "dasp_ring_buffer"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "07d79e19b89618a543c4adec9c5a347fe378a19041699b3278e616e387511ea1"
> +
> +[[package]]
> +name = "dasp_rms"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a6c5dcb30b7e5014486e2822537ea2beae50b19722ffe2ed7549ab03774575aa"
> +dependencies = [
> + "dasp_frame",
> + "dasp_ring_buffer",
> + "dasp_sample",
> +]
> +
> +[[package]]
> +name = "dasp_sample"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0c87e182de0887fd5361989c677c4e8f5000cd9491d6d563161a8f3a5519fc7f"
> +
> +[[package]]
> +name = "dasp_signal"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "aa1ab7d01689c6ed4eae3d38fe1cea08cba761573fbd2d592528d55b421077e7"
> +dependencies = [
> + "dasp_envelope",
> + "dasp_frame",
> + "dasp_interpolate",
> + "dasp_peak",
> + "dasp_ring_buffer",
> + "dasp_rms",
> + "dasp_sample",
> + "dasp_window",
> +]
> +
> +[[package]]
> +name = "dasp_slice"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4e1c7335d58e7baedafa516cb361360ff38d6f4d3f9d9d5ee2a2fc8e27178fa1"
> +dependencies = [
> + "dasp_frame",
> + "dasp_sample",
> +]
> +
> +[[package]]
> +name = "dasp_window"
> +version = "0.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "99ded7b88821d2ce4e8b842c9f1c86ac911891ab89443cc1de750cae764c5076"
> +dependencies = [
> + "dasp_sample",
> +]
> +
> +[[package]]
> +name = "data-encoding"
> +version = "2.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
> +
> +[[package]]
> +name = "dav1d"
> +version = "0.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3ee89cb860616069c67520dcd66cacdb900b57c799f634a0eb6d91f6e2a82b61"
> +dependencies = [
> + "av-data",
> + "bitflags 2.11.1",
> + "dav1d-sys",
> + "static_assertions",
> +]
> +
> +[[package]]
> +name = "dav1d-sys"
> +version = "0.8.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c3c91aea6668645415331133ed6f8ddf0e7f40160cd97a12d59e68716a58704b"
> +dependencies = [
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "deepgram"
> +version = "0.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "49bf11c4dc8fc1e7c94fc4198f82f64536fdb9eded7b5a076d9597d8b67e1fd1"
> +dependencies = [
> + "anyhow",
> + "bytes",
> + "futures",
> + "http 1.4.0",
> + "pin-project",
> + "reqwest",
> + "serde",
> + "serde_json",
> + "serde_urlencoded",
> + "sha256",
> + "thiserror 2.0.18",
> + "tokio",
> + "tokio-stream",
> + "tokio-tungstenite 0.27.0",
> + "tokio-util",
> + "tracing",
> + "tungstenite 0.27.0",
> + "url",
> + "uuid",
> +]
> +
> +[[package]]
> +name = "deflate64"
> +version = "0.1.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ac6b926516df9c60bfa16e107b21086399f8285a44ca9711344b9e553c5146e2"
> +
> +[[package]]
> +name = "der"
> +version = "0.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f1a467a65c5e759bce6e65eaf91cc29f466cdc57cb65777bd646872a8a1fd4de"
> +dependencies = [
> + "const-oid 0.9.6",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "der"
> +version = "0.7.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
> +dependencies = [
> + "const-oid 0.9.6",
> + "pem-rfc7468",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "der-parser"
> +version = "10.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "07da5016415d5a3c4dd39b11ed26f915f52fc4e0dc197d87908bc916e51bc1a6"
> +dependencies = [
> + "asn1-rs",
> + "displaydoc",
> + "nom 7.1.3",
> + "num-bigint",
> + "num-traits",
> + "rusticata-macros",
> +]
> +
> +[[package]]
> +name = "deranged"
> +version = "0.5.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
> +dependencies = [
> + "powerfmt",
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "derive-into-owned"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2c9d94d81e3819a7b06a8638f448bc6339371ca9b6076a99d4a43eece3c4c923"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 1.0.109",
> +]
> +
> +[[package]]
> +name = "derive-new"
> +version = "0.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2cdc8d50f426189eef89dac62fabfa0abb27d5cc008f25bf4156a0203325becc"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "derive_builder"
> +version = "0.20.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "507dfb09ea8b7fa618fcf76e953f4f5e192547945816d5358edffe39f6f94947"
> +dependencies = [
> + "derive_builder_macro",
> +]
> +
> +[[package]]
> +name = "derive_builder_core"
> +version = "0.20.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2d5bcf7b024d6835cfb3d473887cd966994907effbe9227e8c8219824d06c4e8"
> +dependencies = [
> + "darling 0.20.11",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "derive_builder_macro"
> +version = "0.20.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ab63b0e2bf4d5928aff72e83a7dace85d7bba5fe12dcc3c5a572d78caffd3f3c"
> +dependencies = [
> + "derive_builder_core",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "derive_more"
> +version = "2.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d751e9e49156b02b44f9c1815bcb94b984cdcc4396ecc32521c739452808b134"
> +dependencies = [
> + "derive_more-impl",
> +]
> +
> +[[package]]
> +name = "derive_more-impl"
> +version = "2.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "799a97264921d8623a957f6c3b9011f3b5492f557bbb7a5a19b7fa6d06ba8dcb"
> +dependencies = [
> + "convert_case 0.10.0",
> + "proc-macro2",
> + "quote",
> + "rustc_version",
> + "syn 2.0.117",
> + "unicode-xid",
> +]
> +
> +[[package]]
> +name = "deunicode"
> +version = "1.6.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "abd57806937c9cc163efc8ea3910e00a62e2aeb0b8119f1793a978088f8f6b04"
> +
> +[[package]]
> +name = "device-info"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a2ca8e71544c1b67dcdbc2699ab258828aff985e5bc8d5f6b486d90d7df2f848"
> +dependencies = [
> + "core-foundation 0.10.1",
> + "jni 0.21.1",
> + "libc",
> + "thiserror 2.0.18",
> + "wasm-bindgen",
> + "web-sys",
> + "windows-sys 0.59.0",
> +]
> +
> +[[package]]
> +name = "diff"
> +version = "0.1.13"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
> +
> +[[package]]
> +name = "digest"
> +version = "0.10.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
> +dependencies = [
> + "block-buffer 0.10.4",
> + "const-oid 0.9.6",
> + "crypto-common 0.1.7",
> + "subtle",
> +]
> +
> +[[package]]
> +name = "digest"
> +version = "0.11.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf827091440879f9994983d5c2"
> +dependencies = [
> + "block-buffer 0.12.0",
> + "const-oid 0.10.2",
> + "crypto-common 0.2.1",
> + "ctutils",
> +]
> +
> +[[package]]
> +name = "dirs"
> +version = "6.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c3e8aa94d75141228480295a7d0e7feb620b1a5ad9f12bc40be62411e38cce4e"
> +dependencies = [
> + "dirs-sys",
> +]
> +
> +[[package]]
> +name = "dirs-sys"
> +version = "0.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e01a3366d27ee9890022452ee61b2b63a67e6f13f58900b651ff5665f0bb1fab"
> +dependencies = [
> + "libc",
> + "option-ext",
> + "redox_users",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "dispatch2"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1e0e367e4e7da84520dedcac1901e4da967309406d1e51017ae1abfb97adbd38"
> +dependencies = [
> + "bitflags 2.11.1",
> + "block2",
> + "libc",
> + "objc2",
> +]
> +
> +[[package]]
> +name = "displaydoc"
> +version = "0.2.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "document-features"
> +version = "0.2.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d4b8a88685455ed29a21542a33abd9cb6510b6b129abadabdcef0f4c55bc8f61"
> +dependencies = [
> + "litrs",
> +]
> +
> +[[package]]
> +name = "dssim-core"
> +version = "3.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e3c601412450ff29a9258b2f85b18b38f658caf70fad1692f40ca863d86cb753"
> +dependencies = [
> + "imgref",
> + "itertools 0.14.0",
> + "rayon",
> + "rgb",
> +]
> +
> +[[package]]
> +name = "dyn-clone"
> +version = "1.0.20"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
> +
> +[[package]]
> +name = "easyfft"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "767e39eef2ad8a3b6f1d733be3ec70364d21d437d06d4f18ea76ce08df20b75f"
> +dependencies = [
> + "array-init",
> + "generic_singleton",
> + "num-complex",
> + "realfft",
> + "rustfft",
> +]
> +
> +[[package]]
> +name = "ebml-iterable"
> +version = "0.6.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7b5173ac3752f08b526a6991509615e1a345b221ec3c58c7633433e8c9582312"
> +dependencies = [
> + "ebml-iterable-specification",
> + "ebml-iterable-specification-derive",
> + "futures",
> +]
> +
> +[[package]]
> +name = "ebml-iterable-specification"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f56467af159a98735d44231f53eaa505e919e6003266f103b99649a93f106784"
> +
> +[[package]]
> +name = "ebml-iterable-specification-derive"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b066b81018300fdce40f71c4db355a102699324af96fad28f25ab1b5f87de066"
> +dependencies = [
> + "ebml-iterable-specification",
> + "proc-macro2",
> + "quote",
> + "syn 1.0.109",
> +]
> +
> +[[package]]
> +name = "ebur128"
> +version = "0.1.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e227cc62d64d6fe01abbef48134b9c1f17d470cef1e7a56337ad05b1f81df7f9"
> +dependencies = [
> + "bitflags 1.3.2",
> + "dasp_frame",
> + "dasp_sample",
> + "smallvec",
> +]
> +
> +[[package]]
> +name = "ecdsa"
> +version = "0.14.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "413301934810f597c1d19ca71c8710e99a3f1ba28a0d2ebc01551a2daeea3c5c"
> +dependencies = [
> + "der 0.6.1",
> + "elliptic-curve 0.12.3",
> + "rfc6979 0.3.1",
> + "signature 1.6.4",
> +]
> +
> +[[package]]
> +name = "ecdsa"
> +version = "0.16.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ee27f32b5c5292967d2d4a9d7f1e0b0aed2c15daded5a60300e4abb9d8020bca"
> +dependencies = [
> + "der 0.7.10",
> + "digest 0.10.7",
> + "elliptic-curve 0.13.8",
> + "rfc6979 0.4.0",
> + "signature 2.2.0",
> + "spki 0.7.3",
> +]
> +
> +[[package]]
> +name = "ed25519"
> +version = "1.5.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "91cff35c70bba8a626e3185d8cd48cc11b5437e1a5bcd15b9b5fa3c64b6dfee7"
> +dependencies = [
> + "signature 1.6.4",
> +]
> +
> +[[package]]
> +name = "ed25519"
> +version = "2.2.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "115531babc129696a58c64a4fef0a8bf9e9698629fb97e9e40767d235cfbcd53"
> +dependencies = [
> + "pkcs8 0.10.2",
> + "signature 2.2.0",
> +]
> +
> +[[package]]
> +name = "ed25519-dalek"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "70e796c081cee67dc755e1a36a0a172b897fab85fc3f6bc48307991f64e4eca9"
> +dependencies = [
> + "curve25519-dalek",
> + "ed25519 2.2.3",
> + "serde",
> + "sha2 0.10.9",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "edit-distance"
> +version = "2.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "324d428080b707bac399325341bd61af5ded1b30f33b7c949792ca464733c2d5"
> +
> +[[package]]
> +name = "either"
> +version = "1.15.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
> +
> +[[package]]
> +name = "elliptic-curve"
> +version = "0.12.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e7bb888ab5300a19b8e5bceef25ac745ad065f3c9f7efc6de1b91958110891d3"
> +dependencies = [
> + "base16ct 0.1.1",
> + "crypto-bigint 0.4.9",
> + "der 0.6.1",
> + "digest 0.10.7",
> + "ff 0.12.1",
> + "generic-array",
> + "group 0.12.1",
> + "pkcs8 0.9.0",
> + "rand_core 0.6.4",
> + "sec1 0.3.0",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "elliptic-curve"
> +version = "0.13.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b5e6043086bf7973472e0c7dff2142ea0b680d30e18d9cc40f267efbf222bd47"
> +dependencies = [
> + "base16ct 0.2.0",
> + "crypto-bigint 0.5.5",
> + "digest 0.10.7",
> + "ff 0.13.1",
> + "generic-array",
> + "group 0.13.0",
> + "hkdf",
> + "pem-rfc7468",
> + "pkcs8 0.10.2",
> + "rand_core 0.6.4",
> + "sec1 0.7.3",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "embassy-futures"
> +version = "0.1.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dc2d050bdc5c21e0862a89256ed8029ae6c290a93aecefc73084b3002cdebb01"
> +
> +[[package]]
> +name = "embassy-time"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f820157f198ada183ad62e0a66f554c610cdcd1a9f27d4b316358103ced7a1f8"
> +dependencies = [
> + "cfg-if",
> + "critical-section",
> + "document-features",
> + "embassy-time-driver",
> + "embedded-hal 0.2.7",
> + "embedded-hal 1.0.0",
> + "embedded-hal-async",
> + "futures-util",
> +]
> +
> +[[package]]
> +name = "embassy-time-driver"
> +version = "0.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6ee71af1b3a0deaa53eaf2d39252f83504c853646e472400b763060389b9fcc9"
> +dependencies = [
> + "document-features",
> +]
> +
> +[[package]]
> +name = "embedded-hal"
> +version = "0.2.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "35949884794ad573cf46071e41c9b60efb0cb311e3ca01f7af807af1debc66ff"
> +dependencies = [
> + "nb 0.1.3",
> + "void",
> +]
> +
> +[[package]]
> +name = "embedded-hal"
> +version = "1.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "361a90feb7004eca4019fb28352a9465666b24f840f5c3cddf0ff13920590b89"
> +
> +[[package]]
> +name = "embedded-hal-async"
> +version = "1.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0c4c685bbef7fe13c3c6dd4da26841ed3980ef33e841cddfa15ce8a8fb3f1884"
> +dependencies = [
> + "embedded-hal 1.0.0",
> +]
> +
> +[[package]]
> +name = "encode_unicode"
> +version = "1.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
> +
> +[[package]]
> +name = "encoding_rs"
> +version = "0.8.35"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
> +dependencies = [
> + "cfg-if",
> +]
> +
> +[[package]]
> +name = "entities"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b5320ae4c3782150d900b79807611a59a99fc9a1d61d686faafc24b93fc8d7ca"
> +
> +[[package]]
> +name = "enumn"
> +version = "0.1.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2f9ed6b3789237c8a0c1c505af1c7eb2c560df6186f01b098c3a1064ea532f38"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "enumset"
> +version = "1.1.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7f96a4a12fe60ac746ae295a1a4ecb5bb02debc20856506c8635288065f142de"
> +dependencies = [
> + "enumset_derive",
> + "serde",
> +]
> +
> +[[package]]
> +name = "enumset_derive"
> +version = "0.15.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4bd536557b58c682b217b8fb199afdff47cd3eff260623f19e77074eb073d63a"
> +dependencies = [
> + "darling 0.21.3",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "env_filter"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "32e90c2accc4b07a8456ea0debdc2e7587bdd890680d71173a15d4ae604f6eef"
> +dependencies = [
> + "log",
> + "regex",
> +]
> +
> +[[package]]
> +name = "env_logger"
> +version = "0.11.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0621c04f2196ac3f488dd583365b9c09be011a4ab8b9f37248ffcc8f6198b56a"
> +dependencies = [
> + "anstream",
> + "anstyle",
> + "env_filter",
> + "jiff",
> + "log",
> +]
> +
> +[[package]]
> +name = "equator"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4711b213838dfee0117e3be6ac926007d7f433d7bbe33595975d4190cb07e6fc"
> +dependencies = [
> + "equator-macro",
> +]
> +
> +[[package]]
> +name = "equator-macro"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "44f23cf4b44bfce11a86ace86f8a73ffdec849c9fd00a386a53d278bd9e81fb3"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "equivalent"
> +version = "1.0.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
> +
> +[[package]]
> +name = "errno"
> +version = "0.3.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
> +dependencies = [
> + "libc",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "etherparse"
> +version = "0.19.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b119b9796ff800751a220394b8b3613f26dd30c48f254f6837e64c464872d1c7"
> +dependencies = [
> + "arrayvec",
> +]
> +
> +[[package]]
> +name = "event-listener"
> +version = "5.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e13b66accf52311f30a0db42147dadea9850cb48cd070028831ae5f5d4b856ab"
> +dependencies = [
> + "concurrent-queue",
> + "parking",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "event-listener-strategy"
> +version = "0.5.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93"
> +dependencies = [
> + "event-listener",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "fallible-iterator"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2acce4a10f12dc2fb14a218589d4f1f62ef011b2d0cc4b3cb1bba8e94da14649"
> +
> +[[package]]
> +name = "fastbloom"
> +version = "0.14.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4e7f34442dbe69c60fe8eaf58a8cafff81a1f278816d8ab4db255b3bef4ac3c4"
> +dependencies = [
> + "getrandom 0.3.4",
> + "libm",
> + "rand 0.9.4",
> + "siphasher",
> +]
> +
> +[[package]]
> +name = "fastrand"
> +version = "2.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
> +dependencies = [
> + "getrandom 0.3.4",
> +]
> +
> +[[package]]
> +name = "fdeflate"
> +version = "0.3.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
> +dependencies = [
> + "simd-adler32",
> +]
> +
> +[[package]]
> +name = "ff"
> +version = "0.12.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d013fc25338cc558c5c2cfbad646908fb23591e2404481826742b651c9af7160"
> +dependencies = [
> + "rand_core 0.6.4",
> + "subtle",
> +]
> +
> +[[package]]
> +name = "ff"
> +version = "0.13.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c0b50bfb653653f9ca9095b427bed08ab8d75a137839d9ad64eb11810d5b6393"
> +dependencies = [
> + "rand_core 0.6.4",
> + "subtle",
> +]
> +
> +[[package]]
> +name = "ffv1"
> +version = "0.0.0"
> +source = "git+https://github.com/rust-av/ffv1.git?rev=bd9eabfc14c9ad53c37b32279e276619f4390ab8#bd9eabfc14c9ad53c37b32279e276619f4390ab8"
> +dependencies = [
> + "num-traits",
> + "thiserror 1.0.69",
> +]
> +
> +[[package]]
> +name = "fiat-crypto"
> +version = "0.2.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "28dea519a9695b9977216879a3ebfddf92f1c08c05d984f8996aecd6ecdc811d"
> +
> +[[package]]
> +name = "field-offset"
> +version = "0.3.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "38e2275cc4e4fc009b0669731a1e5ab7ebf11f469eaede2bab9309a5b4d6057f"
> +dependencies = [
> + "memoffset",
> + "rustc_version",
> +]
> +
> +[[package]]
> +name = "filetime"
> +version = "0.2.28"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2d5b2eef6fafbf69f877e55509ce5b11a760690ac9700a2921be067aa6afaef6"
> +dependencies = [
> + "cfg-if",
> + "libc",
> +]
> +
> +[[package]]
> +name = "find-msvc-tools"
> +version = "0.1.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
> +
> +[[package]]
> +name = "fixedbitset"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80"
> +
> +[[package]]
> +name = "flate2"
> +version = "1.1.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
> +dependencies = [
> + "crc32fast",
> + "miniz_oxide",
> + "zlib-rs",
> +]
> +
> +[[package]]
> +name = "flavors"
> +version = "0.2.0"
> +source = "git+https://github.com/rust-av/flavors#833508af656d298c269f2397c8541a084264d992"
> +dependencies = [
> + "nom 7.1.3",
> +]
> +
> +[[package]]
> +name = "float-ord"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8ce81f49ae8a0482e4c55ea62ebbd7e5a686af544c00b9d090bba3ff9be97b3d"
> +
> +[[package]]
> +name = "float4"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5939bac0ef2ad7c83a53e4fb889c1d81f007b07061d648cd271071984d86f257"
> +
> +[[package]]
> +name = "float8"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4203231de188ebbdfb85c11f3c20ca2b063945710de04e7b59268731e728b462"
> +dependencies = [
> + "half",
> +]
> +
> +[[package]]
> +name = "flume"
> +version = "0.12.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5e139bc46ca777eb5efaf62df0ab8cc5fd400866427e56c68b22e414e53bd3be"
> +dependencies = [
> + "fastrand",
> + "futures-core",
> + "futures-sink",
> + "spin 0.9.8",
> +]
> +
> +[[package]]
> +name = "fnv"
> +version = "1.0.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
> +
> +[[package]]
> +name = "foldhash"
> +version = "0.1.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
> +
> +[[package]]
> +name = "foldhash"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
> +
> +[[package]]
> +name = "foreign-types"
> +version = "0.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d737d9aa519fb7b749cbc3b962edcf310a8dd1f4b67c91c4f83975dbdd17d965"
> +dependencies = [
> + "foreign-types-macros",
> + "foreign-types-shared",
> +]
> +
> +[[package]]
> +name = "foreign-types-macros"
> +version = "0.2.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1a5c6c585bc94aaf2c7b51dd4c2ba22680844aba4c687be581871a6f518c5742"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "foreign-types-shared"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "aa9a19cbb55df58761df49b23516a86d432839add4af60fc256da840f66ed35b"
> +
> +[[package]]
> +name = "form_urlencoded"
> +version = "1.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
> +dependencies = [
> + "percent-encoding",
> +]
> +
> +[[package]]
> +name = "fs_extra"
> +version = "1.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "42703706b716c37f96a77aea830392ad231f44c9e9a67872fa5548707e11b11c"
> +
> +[[package]]
> +name = "fslock"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "04412b8935272e3a9bae6f48c7bfff74c2911f60525404edfdd28e49884c3bfb"
> +dependencies = [
> + "libc",
> + "winapi",
> +]
> +
> +[[package]]
> +name = "fst"
> +version = "0.4.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7ab85b9b05e3978cc9a9cf8fea7f01b494e1a09ed3037e16ba39edc7a29eb61a"
> +
> +[[package]]
> +name = "futures"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d"
> +dependencies = [
> + "futures-channel",
> + "futures-core",
> + "futures-executor",
> + "futures-io",
> + "futures-sink",
> + "futures-task",
> + "futures-util",
> +]
> +
> +[[package]]
> +name = "futures-channel"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
> +dependencies = [
> + "futures-core",
> + "futures-sink",
> +]
> +
> +[[package]]
> +name = "futures-core"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
> +
> +[[package]]
> +name = "futures-executor"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
> +dependencies = [
> + "futures-core",
> + "futures-task",
> + "futures-util",
> +]
> +
> +[[package]]
> +name = "futures-io"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
> +
> +[[package]]
> +name = "futures-lite"
> +version = "2.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
> +dependencies = [
> + "fastrand",
> + "futures-core",
> + "futures-io",
> + "parking",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "futures-macro"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "futures-sink"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
> +
> +[[package]]
> +name = "futures-task"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
> +
> +[[package]]
> +name = "futures-timer"
> +version = "3.0.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f288b0a4f20f9a56b5d1da57e2227c661b7b16168e2f72365f57b63326e29b24"
> +
> +[[package]]
> +name = "futures-util"
> +version = "0.3.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
> +dependencies = [
> + "futures-channel",
> + "futures-core",
> + "futures-io",
> + "futures-macro",
> + "futures-sink",
> + "futures-task",
> + "memchr",
> + "pin-project-lite",
> + "slab",
> +]
> +
> +[[package]]
> +name = "g2gen"
> +version = "1.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c5a7e0eb46f83a20260b850117d204366674e85d3a908d90865c78df9a6b1dfc"
> +dependencies = [
> + "g2poly",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "g2p"
> +version = "1.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "539e2644c030d3bf4cd208cb842d2ce2f80e82e6e8472390bcef83ceba0d80ad"
> +dependencies = [
> + "g2gen",
> + "g2poly",
> +]
> +
> +[[package]]
> +name = "g2poly"
> +version = "1.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "312d2295c7302019c395cfb90dacd00a82a2eabd700429bba9c7a3f38dbbe11b"
> +
> +[[package]]
> +name = "gdk-pixbuf"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "gdk-pixbuf-sys",
> + "gio",
> + "glib",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gdk-pixbuf-sys"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "gio-sys",
> + "glib-sys",
> + "gobject-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gdk4"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-rs",
> + "gdk-pixbuf",
> + "gdk4-sys",
> + "gio",
> + "glib",
> + "libc",
> + "pango",
> +]
> +
> +[[package]]
> +name = "gdk4-sys"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-sys-rs",
> + "gdk-pixbuf-sys",
> + "gio-sys",
> + "glib-sys",
> + "gobject-sys",
> + "libc",
> + "pango-sys",
> + "pkg-config",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gdk4-wayland"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "gdk4",
> + "gdk4-wayland-sys",
> + "gio",
> + "glib",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gdk4-wayland-sys"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "glib-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gdk4-win32"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-rs",
> + "gdk4",
> + "gdk4-win32-sys",
> + "gio",
> + "glib",
> + "khronos-egl",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gdk4-win32-sys"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-sys-rs",
> + "gdk4-sys",
> + "glib-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gdk4-x11"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "gdk4",
> + "gdk4-x11-sys",
> + "gio",
> + "glib",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gdk4-x11-sys"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "gdk4-sys",
> + "glib-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "generic-array"
> +version = "0.14.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
> +dependencies = [
> + "typenum",
> + "version_check",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "generic_singleton"
> +version = "0.5.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ab6e923c8e978e57cf63e2e200ca967d1d20f0ea2662b28f6d4e11c44aa6ab16"
> +dependencies = [
> + "anymap3",
> + "parking_lot",
> +]
> +
> +[[package]]
> +name = "getifaddrs"
> +version = "0.6.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a542e1b7ac1f3d62c5777d430d66eca9cb59e813c46b86e29fa9ce94ff9a4810"
> +dependencies = [
> + "bitflags 2.11.1",
> + "libc",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "getrandom"
> +version = "0.2.17"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ff2abc00be7fca6ebc474524697ae276ad847ad0a6b3faa4bcb027e9a4614ad0"
> +dependencies = [
> + "cfg-if",
> + "js-sys",
> + "libc",
> + "wasi",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "getrandom"
> +version = "0.3.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
> +dependencies = [
> + "cfg-if",
> + "js-sys",
> + "libc",
> + "r-efi 5.3.0",
> + "wasip2",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "getrandom"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0de51e6874e94e7bf76d726fc5d13ba782deca734ff60d5bb2fb2607c7406555"
> +dependencies = [
> + "cfg-if",
> + "libc",
> + "r-efi 6.0.0",
> + "rand_core 0.10.1",
> + "wasip2",
> + "wasip3",
> +]
> +
> +[[package]]
> +name = "gif"
> +version = "0.14.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ee8cfcc411d9adbbaba82fb72661cc1bcca13e8bba98b364e62b2dba8f960159"
> +dependencies = [
> + "color_quant",
> + "weezl",
> +]
> +
> +[[package]]
> +name = "gimli"
> +version = "0.32.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e629b9b98ef3dd8afe6ca2bd0f89306cec16d43d907889945bc5d6687f2f13c7"
> +
> +[[package]]
> +name = "gio"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "futures-channel",
> + "futures-core",
> + "futures-io",
> + "futures-util",
> + "gio-sys",
> + "glib",
> + "libc",
> + "pin-project-lite",
> + "smallvec",
> +]
> +
> +[[package]]
> +name = "gio-sys"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "libc",
> + "system-deps",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "gl_generator"
> +version = "0.14.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1a95dfc23a2b4a9a2f5ab41d194f8bfda3cabec42af4e39f08c339eb2a0c124d"
> +dependencies = [
> + "khronos_api",
> + "log",
> + "xml-rs",
> +]
> +
> +[[package]]
> +name = "glib"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "bitflags 2.11.1",
> + "futures-channel",
> + "futures-core",
> + "futures-executor",
> + "futures-task",
> + "futures-util",
> + "gio-sys",
> + "glib-macros",
> + "glib-sys",
> + "gobject-sys",
> + "libc",
> + "memchr",
> + "smallvec",
> +]
> +
> +[[package]]
> +name = "glib-macros"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "heck 0.5.0",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "glib-sys"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "glob"
> +version = "0.3.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
> +
> +[[package]]
> +name = "glow"
> +version = "0.16.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c5e5ea60d70410161c8bf5da3fdfeaa1c72ed2c15f8bbb9d19fe3a4fad085f08"
> +dependencies = [
> + "js-sys",
> + "slotmap",
> + "wasm-bindgen",
> + "web-sys",
> +]
> +
> +[[package]]
> +name = "glutin_wgl_sys"
> +version = "0.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2c4ee00b289aba7a9e5306d57c2d05499b2e5dc427f84ac708bd2c090212cf3e"
> +dependencies = [
> + "gl_generator",
> +]
> +
> +[[package]]
> +name = "gobject-sys"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "glib-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "governor"
> +version = "0.10.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9efcab3c1958580ff1f25a2a41be1668f7603d849bb63af523b208a3cc1223b8"
> +dependencies = [
> + "cfg-if",
> + "futures-sink",
> + "futures-timer",
> + "futures-util",
> + "hashbrown 0.16.1",
> + "nonzero_ext",
> + "parking_lot",
> + "portable-atomic",
> + "smallvec",
> + "spinning_top",
> + "web-time",
> +]
> +
> +[[package]]
> +name = "gpu-alloc"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fbcd2dba93594b227a1f57ee09b8b9da8892c34d55aa332e034a228d0fe6a171"
> +dependencies = [
> + "bitflags 2.11.1",
> + "gpu-alloc-types",
> +]
> +
> +[[package]]
> +name = "gpu-alloc-types"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "98ff03b468aa837d70984d55f5d3f846f6ec31fe34bbb97c4f85219caeee1ca4"
> +dependencies = [
> + "bitflags 2.11.1",
> +]
> +
> +[[package]]
> +name = "gpu-allocator"
> +version = "0.27.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c151a2a5ef800297b4e79efa4f4bec035c5f51d5ae587287c9b952bdf734cacd"
> +dependencies = [
> + "log",
> + "presser",
> + "thiserror 1.0.69",
> + "windows 0.58.0",
> +]
> +
> +[[package]]
> +name = "gpu-descriptor"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b89c83349105e3732062a895becfc71a8f921bb71ecbbdd8ff99263e3b53a0ca"
> +dependencies = [
> + "bitflags 2.11.1",
> + "gpu-descriptor-types",
> + "hashbrown 0.15.5",
> +]
> +
> +[[package]]
> +name = "gpu-descriptor-types"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fdf242682df893b86f33a73828fb09ca4b2d3bb6cc95249707fc684d27484b91"
> +dependencies = [
> + "bitflags 2.11.1",
> +]
> +
> +[[package]]
> +name = "graphene-rs"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "glib",
> + "graphene-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "graphene-sys"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "glib-sys",
> + "libc",
> + "pkg-config",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "group"
> +version = "0.12.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5dfbfb3a6cfbd390d5c9564ab283a0349b9b9fcd46a706c1eb10e0db70bfbac7"
> +dependencies = [
> + "ff 0.12.1",
> + "rand_core 0.6.4",
> + "subtle",
> +]
> +
> +[[package]]
> +name = "group"
> +version = "0.13.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f0f9ef7462f7c099f518d754361858f86d8a07af53ba9af0fe635bbccb151a63"
> +dependencies = [
> + "ff 0.13.1",
> + "rand_core 0.6.4",
> + "subtle",
> +]
> +
> +[[package]]
> +name = "gsk4"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-rs",
> + "gdk4",
> + "glib",
> + "graphene-rs",
> + "gsk4-sys",
> + "libc",
> + "pango",
> +]
> +
> +[[package]]
> +name = "gsk4-sys"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-sys-rs",
> + "gdk4-sys",
> + "glib-sys",
> + "gobject-sys",
> + "graphene-sys",
> + "libc",
> + "pango-sys",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gst-plugin-analytics"
> +version = "0.15.2"
> +dependencies = [
> + "byte-slice-cast",
> + "chrono",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-analytics",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-rtp",
> + "gstreamer-video",
> + "xmltree",
> +]
> +
> +[[package]]
> +name = "gst-plugin-audiofx"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "atomic_refcell",
> + "byte-slice-cast",
> + "ebur128",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-check",
> + "hrtf",
> + "nnnoiseless",
> + "num-traits",
> + "rayon",
> + "smallvec",
> +]
> +
> +[[package]]
> +name = "gst-plugin-audioparsers"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> +]
> +
> +[[package]]
> +name = "gst-plugin-aws"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "async-stream",
> + "aws-config",
> + "aws-credential-types",
> + "aws-sdk-polly",
> + "aws-sdk-s3",
> + "aws-sdk-sso",
> + "aws-sdk-sts",
> + "aws-sdk-transcribestreaming",
> + "aws-sdk-translate",
> + "aws-types",
> + "base32",
> + "bytes",
> + "chrono",
> + "env_logger",
> + "futures",
> + "gio",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-video",
> + "percent-encoding",
> + "rand 0.10.1",
> + "serde",
> + "serde_derive",
> + "serde_json",
> + "serde_with",
> + "signalsmith-stretch",
> + "sprintf",
> + "test-with",
> + "tokio",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-burn"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "burn",
> + "burn-store",
> + "byte-slice-cast",
> + "dirs",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-analytics",
> + "gstreamer-base",
> + "gstreamer-video",
> + "itertools 0.14.0",
> + "serde",
> +]
> +
> +[[package]]
> +name = "gst-plugin-cdg"
> +version = "0.15.2"
> +dependencies = [
> + "cdg",
> + "cdg_renderer",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-base",
> + "gstreamer-video",
> + "image",
> +]
> +
> +[[package]]
> +name = "gst-plugin-claxon"
> +version = "0.15.2"
> +dependencies = [
> + "atomic_refcell",
> + "byte-slice-cast",
> + "claxon",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-check",
> +]
> +
> +[[package]]
> +name = "gst-plugin-closedcaption"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "atomic_refcell",
> + "bitstream-io",
> + "byteorder",
> + "cairo-rs",
> + "cdp-types",
> + "cea608-types",
> + "cea708-types",
> + "chrono",
> + "clap",
> + "either",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-video",
> + "itertools 0.14.0",
> + "pango",
> + "pangocairo",
> + "pretty_assertions",
> + "rand 0.10.1",
> + "serde",
> + "serde_json",
> + "smallvec",
> + "uuid",
> + "winnow 0.7.15",
> +]
> +
> +[[package]]
> +name = "gst-plugin-csound"
> +version = "0.15.2"
> +dependencies = [
> + "byte-slice-cast",
> + "csound",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-check",
> +]
> +
> +[[package]]
> +name = "gst-plugin-dav1d"
> +version = "0.15.2"
> +dependencies = [
> + "dav1d",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-video",
> + "num_cpus",
> +]
> +
> +[[package]]
> +name = "gst-plugin-debugseimetainserter"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-video",
> + "uuid",
> +]
> +
> +[[package]]
> +name = "gst-plugin-deepgram"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "async-stream",
> + "bytes",
> + "deepgram",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "gst-plugin-demucs"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "async-channel",
> + "async-tungstenite",
> + "futures",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "http 1.4.0",
> + "libc",
> + "pyo3",
> + "rustls 0.23.40",
> + "serde",
> + "serde_json",
> + "tokio",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-elevenlabs"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "bytes",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "hound",
> + "reqwest",
> + "rustls 0.23.40",
> + "serde",
> + "serde_json",
> + "signalsmith-stretch",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "gst-plugin-fallbackswitch"
> +version = "0.15.2"
> +dependencies = [
> + "clap",
> + "futures",
> + "gio",
> + "gst-plugin-gtk4",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-video",
> + "gtk4",
> + "parking_lot",
> + "rand 0.10.1",
> +]
> +
> +[[package]]
> +name = "gst-plugin-ffv1"
> +version = "0.15.2"
> +dependencies = [
> + "byte-slice-cast",
> + "ffv1",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "gstreamer-video",
> +]
> +
> +[[package]]
> +name = "gst-plugin-file"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-flavors"
> +version = "0.15.2"
> +dependencies = [
> + "byteorder",
> + "flavors",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "nom 7.1.3",
> + "num-rational",
> + "smallvec",
> +]
> +
> +[[package]]
> +name = "gst-plugin-gif"
> +version = "0.15.2"
> +dependencies = [
> + "atomic_refcell",
> + "gif",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "gstreamer-video",
> +]
> +
> +[[package]]
> +name = "gst-plugin-gopbuffer"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-check",
> + "gstreamer-video",
> +]
> +
> +[[package]]
> +name = "gst-plugin-gtk4"
> +version = "0.15.2"
> +dependencies = [
> + "async-channel",
> + "gdk4-wayland",
> + "gdk4-win32",
> + "gdk4-x11",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-allocators",
> + "gstreamer-base",
> + "gstreamer-gl",
> + "gstreamer-gl-egl",
> + "gstreamer-gl-wayland",
> + "gstreamer-gl-x11",
> + "gstreamer-video",
> + "gtk4",
> + "windows-sys 0.52.0",
> +]
> +
> +[[package]]
> +name = "gst-plugin-hlsmultivariantsink"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "bitreader",
> + "byteorder",
> + "bytes",
> + "chrono",
> + "enumn",
> + "gio",
> + "gst-plugin-hlssink3",
> + "gst-plugin-isobmff",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-check",
> + "gstreamer-pbutils",
> + "gstreamer-video",
> + "m3u8-rs",
> + "serial_test",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "gst-plugin-hlssink3"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "chrono",
> + "gio",
> + "glib",
> + "gst-plugin-isobmff",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-check",
> + "gstreamer-pbutils",
> + "gstreamer-video",
> + "m3u8-rs",
> + "mp4-atom",
> + "sprintf",
> +]
> +
> +[[package]]
> +name = "gst-plugin-hsv"
> +version = "0.15.2"
> +dependencies = [
> + "byte-slice-cast",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-video",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "gst-plugin-icecast"
> +version = "0.15.2"
> +dependencies = [
> + "atomic_refcell",
> + "data-encoding",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "httparse",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "rustls-platform-verifier 0.7.0",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-inter"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "futures",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-check",
> + "gstreamer-gl",
> + "gstreamer-utils",
> + "pretty_assertions",
> + "serial_test",
> + "tokio",
> + "tokio-stream",
> +]
> +
> +[[package]]
> +name = "gst-plugin-isobmff"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "bitstream-io",
> + "chrono",
> + "dash-mpd",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-pbutils",
> + "gstreamer-tag",
> + "gstreamer-video",
> + "m3u8-rs",
> + "mp4-atom",
> + "num-integer",
> + "quick-xml 0.39.4",
> + "serde",
> + "tempfile",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-json"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "serde",
> + "serde_json",
> +]
> +
> +[[package]]
> +name = "gst-plugin-lewton"
> +version = "0.15.2"
> +dependencies = [
> + "atomic_refcell",
> + "byte-slice-cast",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-check",
> + "lewton",
> +]
> +
> +[[package]]
> +name = "gst-plugin-livesync"
> +version = "0.15.2"
> +dependencies = [
> + "gio",
> + "gst-plugin-gtk4",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-check",
> + "gtk4",
> + "num-rational",
> + "parking_lot",
> +]
> +
> +[[package]]
> +name = "gst-plugin-mpegtslive"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "bitstream-io",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "smallvec",
> +]
> +
> +[[package]]
> +name = "gst-plugin-ndi"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "byte-slice-cast",
> + "byteorder",
> + "data-encoding",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-video",
> + "libloading 0.9.0",
> + "quick-xml 0.39.4",
> + "smallvec",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "gst-plugin-onvif"
> +version = "0.15.2"
> +dependencies = [
> + "cairo-rs",
> + "chrono",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-rtp",
> + "gstreamer-video",
> + "pango",
> + "pangocairo",
> + "xmlparser",
> + "xmltree",
> +]
> +
> +[[package]]
> +name = "gst-plugin-originalbuffer"
> +version = "0.15.2"
> +dependencies = [
> + "atomic_refcell",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-video",
> +]
> +
> +[[package]]
> +name = "gst-plugin-png"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "gstreamer-video",
> + "parking_lot",
> + "png",
> +]
> +
> +[[package]]
> +name = "gst-plugin-quinn"
> +version = "0.15.2"
> +dependencies = [
> + "async-channel",
> + "bytes",
> + "clap",
> + "ctrlc",
> + "env_logger",
> + "futures",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-check",
> + "http 1.4.0",
> + "itertools 0.14.0",
> + "quinn",
> + "quinn-proto",
> + "rcgen",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "rustls-platform-verifier 0.7.0",
> + "thiserror 2.0.18",
> + "tokio",
> + "url",
> + "web-transport-quinn",
> +]
> +
> +[[package]]
> +name = "gst-plugin-raptorq"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-rtp",
> + "rand 0.10.1",
> + "raptorq",
> +]
> +
> +[[package]]
> +name = "gst-plugin-rav1e"
> +version = "0.15.2"
> +dependencies = [
> + "atomic_refcell",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "gstreamer-video",
> + "rav1e",
> +]
> +
> +[[package]]
> +name = "gst-plugin-regex"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "regex",
> +]
> +
> +[[package]]
> +name = "gst-plugin-reqwest"
> +version = "0.15.2"
> +dependencies = [
> + "bytes",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "headers",
> + "http-body-util",
> + "hyper 1.9.0",
> + "mime",
> + "pin-project-lite",
> + "reqwest",
> + "rustls 0.23.40",
> + "tokio",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-rtp"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "atomic_refcell",
> + "bitstream-io",
> + "byte-slice-cast",
> + "chrono",
> + "clap",
> + "env_logger",
> + "futures",
> + "gio",
> + "glib",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-net",
> + "gstreamer-rtp",
> + "gstreamer-video",
> + "hex",
> + "itertools 0.14.0",
> + "log",
> + "rand 0.10.1",
> + "rtcp-types",
> + "rtp-types",
> + "slab",
> + "smallvec",
> + "thiserror 2.0.18",
> + "time",
> + "tokio",
> + "tokio-util",
> +]
> +
> +[[package]]
> +name = "gst-plugin-rtsp"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "atomic_refcell",
> + "data-encoding",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-net",
> + "gstreamer-pbutils",
> + "lru",
> + "rtsp-types",
> + "rustls-pki-types",
> + "rustls-platform-verifier 0.7.0",
> + "sdp-types",
> + "socket2 0.6.3",
> + "thiserror 2.0.18",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tokio-stream",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-skia"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-video",
> + "skia-safe",
> +]
> +
> +[[package]]
> +name = "gst-plugin-sodium"
> +version = "0.15.2"
> +dependencies = [
> + "clap",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-base",
> + "gstreamer-check",
> + "hex",
> + "pretty_assertions",
> + "rand 0.10.1",
> + "serde",
> + "serde_json",
> + "smallvec",
> + "sodiumoxide",
> +]
> +
> +[[package]]
> +name = "gst-plugin-speechmatics"
> +version = "0.15.2"
> +dependencies = [
> + "async-tungstenite",
> + "atomic_refcell",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "http 1.4.0",
> + "rustls 0.23.40",
> + "serde",
> + "serde_json",
> + "tokio",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-spotify"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "librespot-core",
> + "librespot-metadata",
> + "librespot-playback",
> + "tokio",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-streamgrouper"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> +]
> +
> +[[package]]
> +name = "gst-plugin-textaccumulate"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "icu_locale",
> + "icu_provider",
> + "icu_segmenter",
> + "itertools 0.14.0",
> + "regex",
> +]
> +
> +[[package]]
> +name = "gst-plugin-textahead"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> +]
> +
> +[[package]]
> +name = "gst-plugin-textwrap"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "hyphenation",
> + "textwrap",
> +]
> +
> +[[package]]
> +name = "gst-plugin-threadshare"
> +version = "0.15.2"
> +dependencies = [
> + "async-lock",
> + "async-task",
> + "byte-slice-cast",
> + "cfg-if",
> + "clap",
> + "concurrent-queue",
> + "flume",
> + "futures",
> + "getifaddrs",
> + "gio",
> + "gst-plugin-rtp",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-check",
> + "gstreamer-net",
> + "gstreamer-rtp",
> + "libc",
> + "num-traits",
> + "pin-project-lite",
> + "polling",
> + "rand 0.10.1",
> + "rtp-types",
> + "rustix 1.1.4",
> + "slab",
> + "smallvec",
> + "socket2 0.6.3",
> + "thiserror 2.0.18",
> + "waker-fn",
> + "windows-sys 0.52.0",
> +]
> +
> +[[package]]
> +name = "gst-plugin-togglerecord"
> +version = "0.15.2"
> +dependencies = [
> + "either",
> + "gio",
> + "gst-plugin-gtk4",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-check",
> + "gstreamer-video",
> + "gtk4",
> + "parking_lot",
> +]
> +
> +[[package]]
> +name = "gst-plugin-tracers"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "async-tungstenite",
> + "atomic_refcell",
> + "chrono",
> + "etherparse",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "pcap-file",
> + "regex",
> + "serde",
> + "serde_json",
> + "signal-hook",
> + "tokio",
> + "tokio-stream",
> + "url",
> + "walkdir",
> +]
> +
> +[[package]]
> +name = "gst-plugin-tutorial"
> +version = "0.15.2"
> +dependencies = [
> + "byte-slice-cast",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-video",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "gst-plugin-uriplaylistbin"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "clap",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-app",
> + "more-asserts",
> + "reqwest",
> + "tempfile",
> + "thiserror 2.0.18",
> + "url",
> +]
> +
> +[[package]]
> +name = "gst-plugin-validate"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-validate",
> + "gstreamer-video",
> + "image",
> + "rqrr",
> + "serde_json",
> +]
> +
> +[[package]]
> +name = "gst-plugin-version-helper"
> +version = "0.8.4"
> +dependencies = [
> + "chrono",
> + "toml_edit",
> +]
> +
> +[[package]]
> +name = "gst-plugin-videofx"
> +version = "0.15.2"
> +dependencies = [
> + "atomic_refcell",
> + "cairo-rs",
> + "color-name",
> + "color-thief",
> + "dssim-core",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-check",
> + "gstreamer-video",
> + "image",
> + "image_hasher",
> + "rgb",
> +]
> +
> +[[package]]
> +name = "gst-plugin-vvdec"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-check",
> + "gstreamer-video",
> + "vvdec",
> +]
> +
> +[[package]]
> +name = "gst-plugin-webp"
> +version = "0.15.2"
> +dependencies = [
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-check",
> + "gstreamer-video",
> + "libwebp-sys2 0.2.0",
> + "pretty_assertions",
> +]
> +
> +[[package]]
> +name = "gst-plugin-webrtc"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "async-tungstenite",
> + "aws-config",
> + "aws-credential-types",
> + "aws-sdk-kinesisvideo",
> + "aws-sdk-kinesisvideosignaling",
> + "aws-sdk-sso",
> + "aws-sdk-sts",
> + "aws-sigv4",
> + "aws-smithy-http",
> + "aws-smithy-http-client",
> + "aws-smithy-types",
> + "aws-types",
> + "bytes",
> + "chrono",
> + "clap",
> + "ctrlc",
> + "data-encoding",
> + "fastrand",
> + "futures",
> + "gst-plugin-rtp",
> + "gst-plugin-version-helper",
> + "gst-plugin-webrtc-signalling",
> + "gst-plugin-webrtc-signalling-protocol",
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "gstreamer-net",
> + "gstreamer-pbutils",
> + "gstreamer-rtp",
> + "gstreamer-sdp",
> + "gstreamer-utils",
> + "gstreamer-video",
> + "gstreamer-webrtc",
> + "http 1.4.0",
> + "human_bytes",
> + "hyper-util",
> + "indexmap 2.14.0",
> + "itertools 0.14.0",
> + "livekit-api",
> + "livekit-protocol",
> + "parse_link_header",
> + "rand 0.10.1",
> + "regex",
> + "reqwest",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "serde",
> + "serde_json",
> + "serial_test",
> + "thiserror 2.0.18",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tokio-stream",
> + "tracing",
> + "tracing-log",
> + "tracing-subscriber",
> + "url",
> + "url-escape",
> + "uuid",
> + "warp",
> +]
> +
> +[[package]]
> +name = "gst-plugin-webrtc-signalling"
> +version = "0.15.2"
> +dependencies = [
> + "anyhow",
> + "async-tungstenite",
> + "clap",
> + "futures",
> + "gst-plugin-webrtc-signalling-protocol",
> + "pin-project-lite",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "serde",
> + "serde_json",
> + "test-log",
> + "thiserror 2.0.18",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tracing",
> + "tracing-log",
> + "tracing-subscriber",
> + "uuid",
> +]
> +
> +[[package]]
> +name = "gst-plugin-webrtc-signalling-protocol"
> +version = "0.15.2"
> +dependencies = [
> + "serde",
> + "serde_json",
> +]
> +
> +[[package]]
> +name = "gst-plugin-webrtchttp"
> +version = "0.15.2"
> +dependencies = [
> + "async-recursion",
> + "bytes",
> + "futures",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-sdp",
> + "gstreamer-webrtc",
> + "parse_link_header",
> + "reqwest",
> + "rustls 0.23.40",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "gst-plugin-whisper"
> +version = "0.15.2"
> +dependencies = [
> + "byte-slice-cast",
> + "gst-plugin-version-helper",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-base",
> + "whisper-rs",
> +]
> +
> +[[package]]
> +name = "gstreamer"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "cfg-if",
> + "futures-channel",
> + "futures-core",
> + "futures-util",
> + "glib",
> + "gstreamer-sys",
> + "itertools 0.14.0",
> + "kstring",
> + "libc",
> + "muldiv",
> + "num-integer",
> + "num-rational",
> + "option-operations",
> + "pastey 0.2.2",
> + "pin-project-lite",
> + "serde",
> + "serde_bytes",
> + "smallvec",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "gstreamer-allocators"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-allocators-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-allocators-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-analytics"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-analytics-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-analytics-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-app"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "futures-core",
> + "futures-sink",
> + "glib",
> + "gstreamer",
> + "gstreamer-app-sys",
> + "gstreamer-base",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-app-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-base-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-audio"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "cfg-if",
> + "glib",
> + "gstreamer",
> + "gstreamer-audio-sys",
> + "gstreamer-base",
> + "libc",
> + "serde",
> + "smallvec",
> +]
> +
> +[[package]]
> +name = "gstreamer-audio-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-base-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-base"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "atomic_refcell",
> + "cfg-if",
> + "glib",
> + "gstreamer",
> + "gstreamer-base-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-base-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-check"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-check-sys",
> +]
> +
> +[[package]]
> +name = "gstreamer-check-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-gl-sys",
> + "gstreamer-video",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl-egl"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-gl",
> + "gstreamer-gl-egl-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl-egl-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-gl-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-base-sys",
> + "gstreamer-sys",
> + "gstreamer-video-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl-wayland"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-gl",
> + "gstreamer-gl-wayland-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl-wayland-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-gl-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl-x11"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-gl",
> + "gstreamer-gl-x11-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-gl-x11-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-gl-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-net"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "gio",
> + "glib",
> + "gstreamer",
> + "gstreamer-net-sys",
> +]
> +
> +[[package]]
> +name = "gstreamer-net-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "gio-sys",
> + "glib-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-pbutils"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-audio",
> + "gstreamer-pbutils-sys",
> + "gstreamer-video",
> + "libc",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "gstreamer-pbutils-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-audio-sys",
> + "gstreamer-sys",
> + "gstreamer-video-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-rtp"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-rtp-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-rtp-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-base-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-sdp"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-sdp-sys",
> +]
> +
> +[[package]]
> +name = "gstreamer-sdp-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "cfg-if",
> + "glib-sys",
> + "gobject-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-tag"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-tag-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-tag-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-utils"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "gstreamer",
> + "gstreamer-app",
> + "gstreamer-video",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "gstreamer-validate"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-validate-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-validate-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "gio-sys",
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-video"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "cfg-if",
> + "futures-channel",
> + "glib",
> + "gstreamer",
> + "gstreamer-base",
> + "gstreamer-video-sys",
> + "libc",
> + "serde",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "gstreamer-video-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "gstreamer-base-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gstreamer-webrtc"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib",
> + "gstreamer",
> + "gstreamer-sdp",
> + "gstreamer-webrtc-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "gstreamer-webrtc-sys"
> +version = "0.25.2"
> +source = "git+https://gitlab.freedesktop.org/gstreamer/gstreamer-rs?branch=0.25#c1f88371d75cbd69e7b84567cd705d1ba3bd22db"
> +dependencies = [
> + "glib-sys",
> + "gstreamer-sdp-sys",
> + "gstreamer-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "gtk4"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-rs",
> + "field-offset",
> + "futures-channel",
> + "gdk-pixbuf",
> + "gdk4",
> + "gio",
> + "glib",
> + "graphene-rs",
> + "gsk4",
> + "gtk4-macros",
> + "gtk4-sys",
> + "libc",
> + "pango",
> +]
> +
> +[[package]]
> +name = "gtk4-macros"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "proc-macro-crate",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "gtk4-sys"
> +version = "0.11.3"
> +source = "git+https://github.com/gtk-rs/gtk4-rs?branch=0.11#867a6737f36c735865119cff649b059ce337dcb2"
> +dependencies = [
> + "cairo-sys-rs",
> + "gdk-pixbuf-sys",
> + "gdk4-sys",
> + "gio-sys",
> + "glib-sys",
> + "gobject-sys",
> + "graphene-sys",
> + "gsk4-sys",
> + "libc",
> + "pango-sys",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "h2"
> +version = "0.3.27"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0beca50380b1fc32983fc1cb4587bfa4bb9e78fc259aad4a0032d2080309222d"
> +dependencies = [
> + "bytes",
> + "fnv",
> + "futures-core",
> + "futures-sink",
> + "futures-util",
> + "http 0.2.12",
> + "indexmap 2.14.0",
> + "slab",
> + "tokio",
> + "tokio-util",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "h2"
> +version = "0.4.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "171fefbc92fe4a4de27e0698d6a5b392d6a0e333506bc49133760b3bcf948733"
> +dependencies = [
> + "atomic-waker",
> + "bytes",
> + "fnv",
> + "futures-core",
> + "futures-sink",
> + "http 1.4.0",
> + "indexmap 2.14.0",
> + "slab",
> + "tokio",
> + "tokio-util",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "half"
> +version = "2.7.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6ea2d84b969582b4b1864a92dc5d27cd2b77b622a8d79306834f1be5ba20d84b"
> +dependencies = [
> + "bytemuck",
> + "cfg-if",
> + "crunchy",
> + "num-traits",
> + "serde",
> + "zerocopy",
> +]
> +
> +[[package]]
> +name = "hashbrown"
> +version = "0.12.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
> +
> +[[package]]
> +name = "hashbrown"
> +version = "0.13.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "43a3c133739dddd0d2990f9a4bdf8eb4b21ef50e4851ca85ab661199821d510e"
> +dependencies = [
> + "ahash",
> +]
> +
> +[[package]]
> +name = "hashbrown"
> +version = "0.15.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
> +dependencies = [
> + "allocator-api2",
> + "equivalent",
> + "foldhash 0.1.5",
> + "serde",
> +]
> +
> +[[package]]
> +name = "hashbrown"
> +version = "0.16.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "841d1cc9bed7f9236f321df977030373f4a4163ae1a7dbfe1a51a2c1a51d9100"
> +dependencies = [
> + "allocator-api2",
> + "equivalent",
> + "foldhash 0.2.0",
> + "serde",
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "hashbrown"
> +version = "0.17.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
> +
> +[[package]]
> +name = "headers"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b3314d5adb5d94bcdf56771f2e50dbbc80bb4bdf88967526706205ac9eff24eb"
> +dependencies = [
> + "base64 0.22.1",
> + "bytes",
> + "headers-core",
> + "http 1.4.0",
> + "httpdate",
> + "mime",
> + "sha1 0.10.6",
> +]
> +
> +[[package]]
> +name = "headers-core"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "54b4a22553d4242c49fddb9ba998a99962b5cc6f22cb5a3482bec22522403ce4"
> +dependencies = [
> + "http 1.4.0",
> +]
> +
> +[[package]]
> +name = "heck"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
> +
> +[[package]]
> +name = "heck"
> +version = "0.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
> +
> +[[package]]
> +name = "hermit-abi"
> +version = "0.5.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fc0fef456e4baa96da950455cd02c081ca953b141298e41db3fc7e36b1da849c"
> +
> +[[package]]
> +name = "hex"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e486a595ed5fd8f86ba55232a70"
> +
> +[[package]]
> +name = "hexf-parse"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dfa686283ad6dd069f105e5ab091b04c62850d3e4cf5d67debad1933f55023df"
> +
> +[[package]]
> +name = "hkdf"
> +version = "0.12.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a38256b8a1849f15fbbdf7"
> +dependencies = [
> + "hmac 0.12.1",
> +]
> +
> +[[package]]
> +name = "hmac"
> +version = "0.12.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
> +dependencies = [
> + "digest 0.10.7",
> +]
> +
> +[[package]]
> +name = "hmac"
> +version = "0.13.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6303bc9732ae41b04cb554b844a762b4115a61bfaa81e3e83050991eeb56863f"
> +dependencies = [
> + "digest 0.11.3",
> +]
> +
> +[[package]]
> +name = "home"
> +version = "0.5.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cc627f471c528ff0c4a49e1d5e60450c8f6461dd6d10ba9dcd3a61d3dff7728d"
> +dependencies = [
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "hound"
> +version = "3.5.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "62adaabb884c94955b19907d60019f4e145d091c75345379e70d1ee696f7854f"
> +
> +[[package]]
> +name = "hrtf"
> +version = "0.8.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0f4de47a84fd55fa33aa5ef337016814fdc869fdad23e7898b5322fa290248e6"
> +dependencies = [
> + "byteorder",
> + "rubato",
> + "rustfft",
> +]
> +
> +[[package]]
> +name = "http"
> +version = "0.2.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "601cbb57e577e2f5ef5be8e7b83f0f63994f25aa94d673e54a92d5c516d101f1"
> +dependencies = [
> + "bytes",
> + "fnv",
> + "itoa",
> +]
> +
> +[[package]]
> +name = "http"
> +version = "1.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e3ba2a386d7f85a81f119ad7498ebe444d2e22c2af0b86b069416ace48b3311a"
> +dependencies = [
> + "bytes",
> + "itoa",
> +]
> +
> +[[package]]
> +name = "http-body"
> +version = "0.4.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7ceab25649e9960c0311ea418d17bee82c0dcec1bd053b5f9a66e265a693bed2"
> +dependencies = [
> + "bytes",
> + "http 0.2.12",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "http-body"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62566c93184"
> +dependencies = [
> + "bytes",
> + "http 1.4.0",
> +]
> +
> +[[package]]
> +name = "http-body-util"
> +version = "0.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b021d93e26becf5dc7e1b75b1bed1fd93124b374ceb73f43d4d4eafec896a64a"
> +dependencies = [
> + "bytes",
> + "futures-core",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "pin-project-lite",
> +]
> +
> +[[package]]
> +name = "httparse"
> +version = "1.10.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87"
> +
> +[[package]]
> +name = "httpdate"
> +version = "1.0.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9"
> +
> +[[package]]
> +name = "human_bytes"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "91f255a4535024abf7640cb288260811fc14794f62b063652ed349f9a6c2348e"
> +
> +[[package]]
> +name = "hxdmp"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a17b27f28a7466846baca75f0a5244e546e44178eb7f1c07a3820f413e91c6b0"
> +
> +[[package]]
> +name = "hybrid-array"
> +version = "0.4.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9155a582abd142abc056962c29e3ce5ff2ad5469f4246b537ed42c5deba857da"
> +dependencies = [
> + "typenum",
> +]
> +
> +[[package]]
> +name = "hyper"
> +version = "0.14.32"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "41dfc780fdec9373c01bae43289ea34c972e40ee3c9f6b3c8801a35f35586ce7"
> +dependencies = [
> + "bytes",
> + "futures-channel",
> + "futures-core",
> + "futures-util",
> + "h2 0.3.27",
> + "http 0.2.12",
> + "http-body 0.4.6",
> + "httparse",
> + "httpdate",
> + "itoa",
> + "pin-project-lite",
> + "socket2 0.5.10",
> + "tokio",
> + "tower-service",
> + "tracing",
> + "want",
> +]
> +
> +[[package]]
> +name = "hyper"
> +version = "1.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6299f016b246a94207e63da54dbe807655bf9e00044f73ded42c3ac5305fbcca"
> +dependencies = [
> + "atomic-waker",
> + "bytes",
> + "futures-channel",
> + "futures-core",
> + "h2 0.4.14",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "httparse",
> + "httpdate",
> + "itoa",
> + "pin-project-lite",
> + "smallvec",
> + "tokio",
> + "want",
> +]
> +
> +[[package]]
> +name = "hyper-proxy2"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9043b7b23fb0bc4a1c7014c27b50a4fc42cc76206f71d34fc0dfe5b28ddc3faf"
> +dependencies = [
> + "bytes",
> + "futures-util",
> + "headers",
> + "http 1.4.0",
> + "hyper 1.9.0",
> + "hyper-rustls 0.26.0",
> + "hyper-util",
> + "pin-project-lite",
> + "rustls-native-certs 0.7.3",
> + "tokio",
> + "tokio-rustls 0.25.0",
> + "tower-service",
> + "webpki",
> +]
> +
> +[[package]]
> +name = "hyper-rustls"
> +version = "0.24.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ec3efd23720e2049821a693cbc7e65ea87c72f1c58ff2f9522ff332b1491e590"
> +dependencies = [
> + "futures-util",
> + "http 0.2.12",
> + "hyper 0.14.32",
> + "log",
> + "rustls 0.21.12",
> + "tokio",
> + "tokio-rustls 0.24.1",
> +]
> +
> +[[package]]
> +name = "hyper-rustls"
> +version = "0.26.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a0bea761b46ae2b24eb4aef630d8d1c398157b6fc29e6350ecf090a0b70c952c"
> +dependencies = [
> + "futures-util",
> + "http 1.4.0",
> + "hyper 1.9.0",
> + "hyper-util",
> + "log",
> + "rustls 0.22.4",
> + "rustls-native-certs 0.7.3",
> + "rustls-pki-types",
> + "tokio",
> + "tokio-rustls 0.25.0",
> + "tower-service",
> +]
> +
> +[[package]]
> +name = "hyper-rustls"
> +version = "0.27.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "33ca68d021ef39cf6463ab54c1d0f5daf03377b70561305bb89a8f83aab66e0f"
> +dependencies = [
> + "http 1.4.0",
> + "hyper 1.9.0",
> + "hyper-util",
> + "rustls 0.23.40",
> + "rustls-native-certs 0.8.3",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tower-service",
> + "webpki-roots 1.0.7",
> +]
> +
> +[[package]]
> +name = "hyper-util"
> +version = "0.1.20"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "96547c2556ec9d12fb1578c4eaf448b04993e7fb79cbaad930a656880a6bdfa0"
> +dependencies = [
> + "base64 0.22.1",
> + "bytes",
> + "futures-channel",
> + "futures-util",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "hyper 1.9.0",
> + "ipnet",
> + "libc",
> + "percent-encoding",
> + "pin-project-lite",
> + "socket2 0.6.3",
> + "system-configuration",
> + "tokio",
> + "tower-service",
> + "tracing",
> + "windows-registry",
> +]
> +
> +[[package]]
> +name = "hyphenation"
> +version = "0.8.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bcf4dd4c44ae85155502a52c48739c8a48185d1449fff1963cffee63c28a50f0"
> +dependencies = [
> + "bincode 1.3.3",
> + "fst",
> + "hyphenation_commons",
> + "pocket-resources",
> + "serde",
> +]
> +
> +[[package]]
> +name = "hyphenation_commons"
> +version = "0.8.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5febe7a2ade5c7d98eb8b75f946c046b335324b06a14ea0998271504134c05bf"
> +dependencies = [
> + "fst",
> + "serde",
> +]
> +
> +[[package]]
> +name = "iana-time-zone"
> +version = "0.1.65"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e31bc9ad994ba00e440a8aa5c9ef0ec67d5cb5e5cb0cc7f8b744a35b389cc470"
> +dependencies = [
> + "android_system_properties",
> + "core-foundation-sys",
> + "iana-time-zone-haiku",
> + "js-sys",
> + "log",
> + "wasm-bindgen",
> + "windows-core 0.62.2",
> +]
> +
> +[[package]]
> +name = "iana-time-zone-haiku"
> +version = "0.1.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f31827a206f56af32e590ba56d5d2d085f558508192593743f16b2306495269f"
> +dependencies = [
> + "cc",
> +]
> +
> +[[package]]
> +name = "icu_collections"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2984d1cd16c883d7935b9e07e44071dca8d917fd52ecc02c04d5fa0b5a3f191c"
> +dependencies = [
> + "displaydoc",
> + "potential_utf",
> + "utf8_iter",
> + "yoke",
> + "zerofrom",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "icu_locale"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d5a396343c7208121dc86e35623d3dfe19814a7613cfd14964994cdc9c9a2e26"
> +dependencies = [
> + "icu_collections",
> + "icu_locale_core",
> + "icu_locale_data",
> + "icu_provider",
> + "potential_utf",
> + "tinystr",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "icu_locale_core"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "92219b62b3e2b4d88ac5119f8904c10f8f61bf7e95b640d25ba3075e6cac2c29"
> +dependencies = [
> + "displaydoc",
> + "litemap",
> + "serde",
> + "tinystr",
> + "writeable",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "icu_locale_data"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d5fdcc9ac77c6d74ff5cf6e65ef3181d6af32003b16fce3a77fb451d2f695993"
> +
> +[[package]]
> +name = "icu_normalizer"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c56e5ee99d6e3d33bd91c5d85458b6005a22140021cc324cea84dd0e72cff3b4"
> +dependencies = [
> + "icu_collections",
> + "icu_normalizer_data",
> + "icu_properties",
> + "icu_provider",
> + "smallvec",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "icu_normalizer_data"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "da3be0ae77ea334f4da67c12f149704f19f81d1adf7c51cf482943e84a2bad38"
> +
> +[[package]]
> +name = "icu_properties"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bee3b67d0ea5c2cca5003417989af8996f8604e34fb9ddf96208a033901e70de"
> +dependencies = [
> + "icu_collections",
> + "icu_locale_core",
> + "icu_properties_data",
> + "icu_provider",
> + "zerotrie",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "icu_properties_data"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8e2bbb201e0c04f7b4b3e14382af113e17ba4f63e2c9d2ee626b720cbce54a14"
> +
> +[[package]]
> +name = "icu_provider"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "139c4cf31c8b5f33d7e199446eff9c1e02decfc2f0eec2c8d71f65befa45b421"
> +dependencies = [
> + "displaydoc",
> + "icu_locale_core",
> + "serde",
> + "stable_deref_trait",
> + "writeable",
> + "yoke",
> + "zerofrom",
> + "zerotrie",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "icu_segmenter"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5c0794db0b1a86193ac9c48768d0e6c52c54448e0870ad87907d456ee0dac964"
> +dependencies = [
> + "icu_collections",
> + "icu_locale",
> + "icu_provider",
> + "icu_segmenter_data",
> + "potential_utf",
> + "utf8_iter",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "icu_segmenter_data"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e4a2c462a4d927d512f5f882a033ddd62f33a05bb9f230d98f736ac3dc85938f"
> +
> +[[package]]
> +name = "id-arena"
> +version = "2.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
> +
> +[[package]]
> +name = "ident_case"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b9e0384b61958566e926dc50660321d12159025e767c18e043daf26b70104c39"
> +
> +[[package]]
> +name = "idna"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
> +dependencies = [
> + "idna_adapter",
> + "smallvec",
> + "utf8_iter",
> +]
> +
> +[[package]]
> +name = "idna_adapter"
> +version = "1.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cb68373c0d6620ef8105e855e7745e18b0d00d3bdb07fb532e434244cdb9a714"
> +dependencies = [
> + "icu_normalizer",
> + "icu_properties",
> +]
> +
> +[[package]]
> +name = "image"
> +version = "0.25.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "85ab80394333c02fe689eaf900ab500fbd0c2213da414687ebf995a65d5a6104"
> +dependencies = [
> + "bytemuck",
> + "byteorder-lite",
> + "moxcms",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "image_hasher"
> +version = "3.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dd266c66b0a0e2d4c6db8e710663fc163a2d33595ce997b6fbda407c8759d344"
> +dependencies = [
> + "base64 0.22.1",
> + "image",
> + "rustdct",
> + "serde",
> + "transpose",
> +]
> +
> +[[package]]
> +name = "imgref"
> +version = "1.12.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "40fac9d56ed6437b198fddba683305e8e2d651aa42647f00f5ae542e7f5c94a2"
> +
> +[[package]]
> +name = "indexmap"
> +version = "1.9.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99"
> +dependencies = [
> + "autocfg",
> + "hashbrown 0.12.3",
> + "serde",
> +]
> +
> +[[package]]
> +name = "indexmap"
> +version = "2.14.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
> +dependencies = [
> + "equivalent",
> + "hashbrown 0.17.1",
> + "serde",
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "indicatif"
> +version = "0.18.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "25470f23803092da7d239834776d653104d551bc4d7eacaf31e6837854b8e9eb"
> +dependencies = [
> + "console",
> + "portable-atomic",
> + "unicode-width",
> + "unit-prefix",
> + "web-time",
> +]
> +
> +[[package]]
> +name = "inout"
> +version = "0.1.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
> +dependencies = [
> + "generic-array",
> +]
> +
> +[[package]]
> +name = "interpolate_name"
> +version = "0.2.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c34819042dc3d3971c46c2190835914dfbe0c3c13f61449b2997f4e9722dfa60"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "ipnet"
> +version = "2.12.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d98f6fed1fde3f8c21bc40a1abb88dd75e67924f9cffc3ef95607bad8017f8e2"
> +
> +[[package]]
> +name = "is-docker"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "928bae27f42bc99b60d9ac7334e3a21d10ad8f1835a4e12ec3ec0464765ed1b3"
> +dependencies = [
> + "once_cell",
> +]
> +
> +[[package]]
> +name = "is-wsl"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "173609498df190136aa7dea1a91db051746d339e18476eed5ca40521f02d7aa5"
> +dependencies = [
> + "is-docker",
> + "once_cell",
> +]
> +
> +[[package]]
> +name = "is_terminal_polyfill"
> +version = "1.70.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
> +
> +[[package]]
> +name = "iso8601"
> +version = "0.6.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e1082f0c48f143442a1ac6122f67e360ceee130b967af4d50996e5154a45df46"
> +dependencies = [
> + "nom 8.0.0",
> +]
> +
> +[[package]]
> +name = "itertools"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b1c173a5686ce8bfa551b3563d0c2170bf24ca44da99c7ca4bfdab5418c3fe57"
> +dependencies = [
> + "either",
> +]
> +
> +[[package]]
> +name = "itertools"
> +version = "0.12.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
> +dependencies = [
> + "either",
> +]
> +
> +[[package]]
> +name = "itertools"
> +version = "0.13.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
> +dependencies = [
> + "either",
> +]
> +
> +[[package]]
> +name = "itertools"
> +version = "0.14.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
> +dependencies = [
> + "either",
> +]
> +
> +[[package]]
> +name = "itoa"
> +version = "1.0.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8f42a60cbdf9a97f5d2305f08a87dc4e09308d1276d28c869c684d7777685682"
> +
> +[[package]]
> +name = "jiff"
> +version = "0.2.24"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
> +dependencies = [
> + "jiff-static",
> + "log",
> + "portable-atomic",
> + "portable-atomic-util",
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "jiff-static"
> +version = "0.2.24"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "jni"
> +version = "0.21.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1a87aa2bb7d2af34197c04845522473242e1aa17c12f4935d5856491a7fb8c97"
> +dependencies = [
> + "cesu8",
> + "cfg-if",
> + "combine",
> + "jni-sys 0.3.1",
> + "log",
> + "thiserror 1.0.69",
> + "walkdir",
> + "windows-sys 0.45.0",
> +]
> +
> +[[package]]
> +name = "jni"
> +version = "0.22.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5efd9a482cf3a427f00d6b35f14332adc7902ce91efb778580e180ff90fa3498"
> +dependencies = [
> + "cfg-if",
> + "combine",
> + "jni-macros",
> + "jni-sys 0.4.1",
> + "log",
> + "simd_cesu8",
> + "thiserror 2.0.18",
> + "walkdir",
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "jni-macros"
> +version = "0.22.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a00109accc170f0bdb141fed3e393c565b6f5e072365c3bd58f5b062591560a3"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "rustc_version",
> + "simd_cesu8",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "jni-sys"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "41a652e1f9b6e0275df1f15b32661cf0d4b78d4d87ddec5e0c3c20f097433258"
> +dependencies = [
> + "jni-sys 0.4.1",
> +]
> +
> +[[package]]
> +name = "jni-sys"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c6377a88cb3910bee9b0fa88d4f42e1d2da8e79915598f65fb0c7ee14c878af2"
> +dependencies = [
> + "jni-sys-macros",
> +]
> +
> +[[package]]
> +name = "jni-sys-macros"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "38c0b942f458fe50cdac086d2f946512305e5631e720728f2a61aabcd47a6264"
> +dependencies = [
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "jobserver"
> +version = "0.1.34"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
> +dependencies = [
> + "getrandom 0.3.4",
> + "libc",
> +]
> +
> +[[package]]
> +name = "js-sys"
> +version = "0.3.98"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "67df7112613f8bfd9150013a0314e196f4800d3201ae742489d999db2f979f08"
> +dependencies = [
> + "cfg-if",
> + "futures-util",
> + "once_cell",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "jsonwebtoken"
> +version = "10.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "eba32bfb4ffdeaca3e34431072faf01745c9b26d25504aa7a6cf5684334fc4fc"
> +dependencies = [
> + "base64 0.22.1",
> + "ed25519-dalek",
> + "getrandom 0.2.17",
> + "hmac 0.12.1",
> + "js-sys",
> + "p256 0.13.2",
> + "p384",
> + "rand 0.8.6",
> + "rsa",
> + "serde",
> + "serde_json",
> + "sha2 0.10.9",
> + "signature 2.2.0",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "khronos-egl"
> +version = "6.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6aae1df220ece3c0ada96b8153459b67eebe9ae9212258bb0134ae60416fdf76"
> +dependencies = [
> + "libc",
> + "libloading 0.8.9",
> + "pkg-config",
> +]
> +
> +[[package]]
> +name = "khronos_api"
> +version = "3.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e2db585e1d738fc771bf08a151420d3ed193d9d895a36df7f6f8a9456b911ddc"
> +
> +[[package]]
> +name = "kstring"
> +version = "2.0.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "558bf9508a558512042d3095138b1f7b8fe90c5467d94f9f1da28b3731c5dbd1"
> +dependencies = [
> + "static_assertions",
> +]
> +
> +[[package]]
> +name = "lazy_static"
> +version = "1.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
> +dependencies = [
> + "spin 0.9.8",
> +]
> +
> +[[package]]
> +name = "leb128fmt"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
> +
> +[[package]]
> +name = "lewton"
> +version = "0.10.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "777b48df9aaab155475a83a7df3070395ea1ac6902f5cd062b8f2b028075c030"
> +dependencies = [
> + "byteorder",
> + "tinyvec",
> +]
> +
> +[[package]]
> +name = "libbz2-rs-sys"
> +version = "0.2.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b3a6a8c165077efc8f3a971534c50ea6a1a18b329ef4a66e897a7e3a1494565f"
> +
> +[[package]]
> +name = "libc"
> +version = "0.2.186"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
> +
> +[[package]]
> +name = "libfuzzer-sys"
> +version = "0.4.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f12a681b7dd8ce12bff52488013ba614b869148d54dd79836ab85aafdd53f08d"
> +dependencies = [
> + "arbitrary",
> + "cc",
> +]
> +
> +[[package]]
> +name = "libloading"
> +version = "0.8.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d7c4b02199fee7c5d21a5ae7d8cfa79a6ef5bb2fc834d6e9058e89c825efdc55"
> +dependencies = [
> + "cfg-if",
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "libloading"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "754ca22de805bb5744484a5b151a9e1a8e837d5dc232c2d7d8c2e3492edc8b60"
> +dependencies = [
> + "cfg-if",
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "liblzma"
> +version = "0.4.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b6033b77c21d1f56deeae8014eb9fbe7bdf1765185a6c508b5ca82eeaed7f899"
> +dependencies = [
> + "liblzma-sys",
> + "num_cpus",
> +]
> +
> +[[package]]
> +name = "liblzma-sys"
> +version = "0.4.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1a60851d15cd8c5346eca4ab8babff585be2ae4bc8097c067291d3ffe2add3b6"
> +dependencies = [
> + "cc",
> + "libc",
> + "pkg-config",
> +]
> +
> +[[package]]
> +name = "libm"
> +version = "0.2.16"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b6d2cec3eae94f9f509c767b45932f1ada8350c4bdb85af2fcab4a3c14807981"
> +
> +[[package]]
> +name = "libredox"
> +version = "0.1.16"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e02f3bb43d335493c96bf3fd3a321600bf6bd07ed34bc64118e9293bdffea46c"
> +dependencies = [
> + "libc",
> +]
> +
> +[[package]]
> +name = "librespot-audio"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b3fe76acb49f58165484303edf0e7bd778f0e6d96f5c59e9d6b6fde1a90d36ff"
> +dependencies = [
> + "aes",
> + "bytes",
> + "ctr",
> + "futures-util",
> + "http-body-util",
> + "hyper 1.9.0",
> + "hyper-util",
> + "librespot-core",
> + "log",
> + "tempfile",
> + "thiserror 2.0.18",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "librespot-core"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "168bbe1c416980ddd9a969ebd6b50fb6c924eb1a3ded194285fa8ec0e2b1c68b"
> +dependencies = [
> + "aes",
> + "base64 0.22.1",
> + "byteorder",
> + "bytes",
> + "data-encoding",
> + "flate2",
> + "form_urlencoded",
> + "futures-core",
> + "futures-util",
> + "governor",
> + "hmac 0.12.1",
> + "http 1.4.0",
> + "http-body-util",
> + "httparse",
> + "hyper 1.9.0",
> + "hyper-proxy2",
> + "hyper-rustls 0.27.9",
> + "hyper-util",
> + "librespot-oauth",
> + "librespot-protocol",
> + "log",
> + "nonzero_ext",
> + "num-bigint",
> + "num-derive",
> + "num-integer",
> + "num-traits",
> + "pbkdf2",
> + "pin-project-lite",
> + "priority-queue",
> + "protobuf",
> + "protobuf-json-mapping",
> + "quick-xml 0.38.4",
> + "rand 0.9.4",
> + "rand_distr",
> + "rsa",
> + "serde",
> + "serde_json",
> + "sha1 0.10.6",
> + "shannon",
> + "sysinfo",
> + "thiserror 2.0.18",
> + "time",
> + "tokio",
> + "tokio-stream",
> + "tokio-tungstenite 0.28.0",
> + "tokio-util",
> + "url",
> + "uuid",
> + "vergen-gitcl",
> +]
> +
> +[[package]]
> +name = "librespot-metadata"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9a9c688aa2acd3ed2498e31a95d6f2be49c0f18128db8958450ffd628aa88532"
> +dependencies = [
> + "async-trait",
> + "bytes",
> + "librespot-core",
> + "librespot-protocol",
> + "log",
> + "protobuf",
> + "serde",
> + "serde_json",
> + "thiserror 2.0.18",
> + "uuid",
> +]
> +
> +[[package]]
> +name = "librespot-oauth"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d686417d49c9d2c363392ffe28d6e469daca20a82dc414740930e078f5829661"
> +dependencies = [
> + "log",
> + "oauth2",
> + "open",
> + "reqwest",
> + "thiserror 2.0.18",
> + "url",
> +]
> +
> +[[package]]
> +name = "librespot-playback"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "88258620bf3e6808ea1fadd11639648d77c06280b9f5a4c9d14ea79f6f998af6"
> +dependencies = [
> + "form_urlencoded",
> + "futures-util",
> + "librespot-audio",
> + "librespot-core",
> + "librespot-metadata",
> + "log",
> + "ogg",
> + "portable-atomic",
> + "rand 0.9.4",
> + "rand_distr",
> + "shell-words",
> + "symphonia",
> + "thiserror 2.0.18",
> + "tokio",
> + "zerocopy",
> +]
> +
> +[[package]]
> +name = "librespot-protocol"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3e01f0b2d39f83fa162eb91d4a16313bcf99e77daf258abe8f7b7bcb1160b084"
> +dependencies = [
> + "protobuf",
> + "protobuf-codegen",
> +]
> +
> +[[package]]
> +name = "libsodium-sys"
> +version = "0.2.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6b779387cd56adfbc02ea4a668e704f729be8d6a6abd2c27ca5ee537849a92fd"
> +dependencies = [
> + "cc",
> + "libc",
> + "pkg-config",
> + "walkdir",
> +]
> +
> +[[package]]
> +name = "libwebp-sys2"
> +version = "0.1.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4790186411a6843ecc0a141c8948c8e623a0bb5e886834b1b6c90f3dfa85bb99"
> +dependencies = [
> + "cc",
> + "cfg-if",
> + "libc",
> + "pkg-config",
> + "vcpkg",
> +]
> +
> +[[package]]
> +name = "libwebp-sys2"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6dc3d00aeaa1d6bf4f35f3003bc1835135e0fb41f2fc19082a3f98d619792505"
> +dependencies = [
> + "cc",
> + "cfg-if",
> + "libc",
> + "libwebp-sys2 0.1.11",
> + "pkg-config",
> + "vcpkg",
> +]
> +
> +[[package]]
> +name = "linux-raw-sys"
> +version = "0.4.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
> +
> +[[package]]
> +name = "linux-raw-sys"
> +version = "0.12.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
> +
> +[[package]]
> +name = "litemap"
> +version = "0.8.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "92daf443525c4cce67b150400bc2316076100ce0b3686209eb8cf3c31612e6f0"
> +
> +[[package]]
> +name = "litrs"
> +version = "1.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
> +
> +[[package]]
> +name = "livekit-api"
> +version = "0.4.19"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "900451a686a1ce8488c420e81a2135831383b03aade6bc3075cf80463d3dd6a4"
> +dependencies = [
> + "base64 0.21.7",
> + "device-info",
> + "futures-util",
> + "http 1.4.0",
> + "jsonwebtoken",
> + "livekit-protocol",
> + "livekit-runtime",
> + "log",
> + "os_info",
> + "parking_lot",
> + "pbjson-types",
> + "prost",
> + "rand 0.9.4",
> + "reqwest",
> + "rustls-native-certs 0.6.3",
> + "scopeguard",
> + "serde",
> + "sha2 0.10.9",
> + "thiserror 2.0.18",
> + "tokio",
> + "tokio-rustls 0.24.1",
> + "tokio-tungstenite 0.20.1",
> + "url",
> +]
> +
> +[[package]]
> +name = "livekit-protocol"
> +version = "0.7.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6cf1cc4ab39d7857fb31be648f43aa7068acb54a6960270dccd300dd5c8d0a98"
> +dependencies = [
> + "futures-util",
> + "livekit-runtime",
> + "parking_lot",
> + "pbjson",
> + "pbjson-types",
> + "prost",
> + "serde",
> + "thiserror 2.0.18",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "livekit-runtime"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "532e84c6cdc5fe774f2b5d9912597b5f3bea561927a48296d03e24549d21c3f6"
> +dependencies = [
> + "tokio",
> + "tokio-stream",
> +]
> +
> +[[package]]
> +name = "lock_api"
> +version = "0.4.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
> +dependencies = [
> + "scopeguard",
> +]
> +
> +[[package]]
> +name = "log"
> +version = "0.4.29"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
> +
> +[[package]]
> +name = "lru"
> +version = "0.16.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7f66e8d5d03f609abc3a39e6f08e4164ebf1447a732906d39eb9b99b7919ef39"
> +dependencies = [
> + "hashbrown 0.16.1",
> +]
> +
> +[[package]]
> +name = "lru-slab"
> +version = "0.1.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154"
> +
> +[[package]]
> +name = "lzma-rust2"
> +version = "0.15.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1670343e58806300d87950e3401e820b519b9384281bbabfb15e3636689ffd69"
> +dependencies = [
> + "crc",
> + "sha2 0.10.9",
> +]
> +
> +[[package]]
> +name = "m3u8-rs"
> +version = "6.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f03cd3335fb5f2447755d45cda9c70f76013626a9db44374973791b0926a86c3"
> +dependencies = [
> + "chrono",
> + "nom 7.1.3",
> +]
> +
> +[[package]]
> +name = "malloc_buf"
> +version = "0.0.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "62bb907fe88d54d8d9ce32a3cceab4218ed2f6b7d35617cafe9adf84e43919cb"
> +dependencies = [
> + "libc",
> +]
> +
> +[[package]]
> +name = "matchers"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
> +dependencies = [
> + "regex-automata",
> +]
> +
> +[[package]]
> +name = "matrixmultiply"
> +version = "0.3.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a06de3016e9fae57a36fd14dba131fccf49f74b40b7fbdb472f96e361ec71a08"
> +dependencies = [
> + "autocfg",
> + "rawpointer",
> +]
> +
> +[[package]]
> +name = "maybe-rayon"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8ea1f30cedd69f0a2954655f7188c6a834246d2bcf1e315e2ac40c4b24dc9519"
> +dependencies = [
> + "cfg-if",
> + "rayon",
> +]
> +
> +[[package]]
> +name = "md-5"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "69b6441f590336821bb897fb28fc622898ccceb1d6cea3fde5ea86b090c4de98"
> +dependencies = [
> + "cfg-if",
> + "digest 0.11.3",
> +]
> +
> +[[package]]
> +name = "md5"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ae960838283323069879657ca3de837e9f7bbb4c7bf6ea7f1b290d5e9476d2e0"
> +
> +[[package]]
> +name = "memchr"
> +version = "2.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
> +
> +[[package]]
> +name = "memmap2"
> +version = "0.9.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "714098028fe011992e1c3962653c96b2d578c4b4bce9036e15ff220319b1e0e3"
> +dependencies = [
> + "libc",
> +]
> +
> +[[package]]
> +name = "memoffset"
> +version = "0.9.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
> +dependencies = [
> + "autocfg",
> +]
> +
> +[[package]]
> +name = "metal"
> +version = "0.32.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "00c15a6f673ff72ddcc22394663290f870fb224c1bfce55734a75c414150e605"
> +dependencies = [
> + "bitflags 2.11.1",
> + "block",
> + "core-graphics-types",
> + "foreign-types",
> + "log",
> + "objc",
> + "paste",
> +]
> +
> +[[package]]
> +name = "mime"
> +version = "0.3.17"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
> +
> +[[package]]
> +name = "mime_guess"
> +version = "2.0.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e"
> +dependencies = [
> + "mime",
> + "unicase",
> +]
> +
> +[[package]]
> +name = "minimal-lexical"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
> +
> +[[package]]
> +name = "miniz_oxide"
> +version = "0.8.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
> +dependencies = [
> + "adler2",
> + "simd-adler32",
> +]
> +
> +[[package]]
> +name = "mio"
> +version = "1.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
> +dependencies = [
> + "libc",
> + "wasi",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "more-asserts"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1fafa6961cabd9c63bcd77a45d7e3b7f3b552b70417831fb0f56db717e72407e"
> +
> +[[package]]
> +name = "moxcms"
> +version = "0.8.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bb85c154ba489f01b25c0d36ae69a87e4a1c73a72631fc6c0eb6dde34a73e44b"
> +dependencies = [
> + "num-traits",
> + "pxfm",
> +]
> +
> +[[package]]
> +name = "mp4-atom"
> +version = "0.10.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5e8e949244bbd26ea7eb6d936af3a6a0202be68bcfc9afce700f3c9026860ff7"
> +dependencies = [
> + "derive_more",
> + "num",
> + "paste",
> + "thiserror 1.0.69",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "muldiv"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "956787520e75e9bd233246045d19f42fb73242759cc57fba9611d940ae96d4b0"
> +
> +[[package]]
> +name = "multimap"
> +version = "0.10.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1d87ecb2933e8aeadb3e3a02b828fed80a7528047e68b4f424523a0981a3a084"
> +
> +[[package]]
> +name = "naga"
> +version = "26.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "916cbc7cb27db60be930a4e2da243cf4bc39569195f22fd8ee419cd31d5b662c"
> +dependencies = [
> + "arrayvec",
> + "bit-set",
> + "bitflags 2.11.1",
> + "cfg-if",
> + "cfg_aliases",
> + "codespan-reporting",
> + "half",
> + "hashbrown 0.15.5",
> + "hexf-parse",
> + "indexmap 2.14.0",
> + "libm",
> + "log",
> + "num-traits",
> + "once_cell",
> + "rustc-hash 1.1.0",
> + "spirv",
> + "thiserror 2.0.18",
> + "unicode-ident",
> +]
> +
> +[[package]]
> +name = "nasm-rs"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "706bf8a5e8c8ddb99128c3291d31bd21f4bcde17f0f4c20ec678d85c74faa149"
> +dependencies = [
> + "jobserver",
> + "log",
> +]
> +
> +[[package]]
> +name = "nb"
> +version = "0.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "801d31da0513b6ec5214e9bf433a77966320625a37860f910be265be6e18d06f"
> +dependencies = [
> + "nb 1.1.0",
> +]
> +
> +[[package]]
> +name = "nb"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8d5439c4ad607c3c23abf66de8c8bf57ba8adcd1f129e699851a6e43935d339d"
> +
> +[[package]]
> +name = "ndarray"
> +version = "0.17.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "520080814a7a6b4a6e9070823bb24b4531daac8c4627e08ba5de8c5ef2f2752d"
> +dependencies = [
> + "matrixmultiply",
> + "num-complex",
> + "num-integer",
> + "num-traits",
> + "portable-atomic",
> + "portable-atomic-util",
> + "rawpointer",
> +]
> +
> +[[package]]
> +name = "ndk-sys"
> +version = "0.6.0+11769913"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ee6cda3051665f1fb8d9e08fc35c96d5a244fb1be711a03b71118828afc9a873"
> +dependencies = [
> + "jni-sys 0.3.1",
> +]
> +
> +[[package]]
> +name = "new_debug_unreachable"
> +version = "1.0.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "650eef8c711430f1a879fdd01d4745a7deea475becfb90269c06775983bbf086"
> +
> +[[package]]
> +name = "nix"
> +version = "0.30.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
> +dependencies = [
> + "bitflags 2.11.1",
> + "cfg-if",
> + "cfg_aliases",
> + "libc",
> +]
> +
> +[[package]]
> +name = "nix"
> +version = "0.31.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
> +dependencies = [
> + "bitflags 2.11.1",
> + "cfg-if",
> + "cfg_aliases",
> + "libc",
> +]
> +
> +[[package]]
> +name = "nnnoiseless"
> +version = "0.5.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "805d5964d1e7a0006a7fdced7dae75084d66d18b35f1dfe81bd76929b1f8da0c"
> +dependencies = [
> + "easyfft",
> + "once_cell",
> +]
> +
> +[[package]]
> +name = "no_std_io2"
> +version = "0.9.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "418abd1b6d34fbf6cae440dc874771b0525a604428704c76e48b29a5e67b8003"
> +dependencies = [
> + "memchr",
> +]
> +
> +[[package]]
> +name = "nom"
> +version = "7.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
> +dependencies = [
> + "memchr",
> + "minimal-lexical",
> +]
> +
> +[[package]]
> +name = "nom"
> +version = "8.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
> +dependencies = [
> + "memchr",
> +]
> +
> +[[package]]
> +name = "nonzero_ext"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "38bf9645c8b145698bb0b18a4637dcacbc421ea49bef2317e4fd8065a387cf21"
> +
> +[[package]]
> +name = "noop_proc_macro"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0676bb32a98c1a483ce53e500a81ad9c3d5b3f7c920c28c24e9cb0980d0b5bc8"
> +
> +[[package]]
> +name = "ntapi"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c3b335231dfd352ffb0f8017f3b6027a4917f7df785ea2143d8af2adc66980ae"
> +dependencies = [
> + "winapi",
> +]
> +
> +[[package]]
> +name = "nu-ansi-term"
> +version = "0.50.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
> +dependencies = [
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "num"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e73d2fea1b9813cb23"
> +dependencies = [
> + "num-bigint",
> + "num-complex",
> + "num-integer",
> + "num-iter",
> + "num-rational",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "num-bigint"
> +version = "0.4.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
> +dependencies = [
> + "num-integer",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "num-bigint-dig"
> +version = "0.8.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e661dda6640fad38e827a6d4a310ff4763082116fe217f279885c97f511bb0b7"
> +dependencies = [
> + "lazy_static",
> + "libm",
> + "num-integer",
> + "num-iter",
> + "num-traits",
> + "rand 0.8.6",
> + "smallvec",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "num-complex"
> +version = "0.4.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495"
> +dependencies = [
> + "num-traits",
> + "serde",
> +]
> +
> +[[package]]
> +name = "num-conv"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c6673768db2d862beb9b39a78fdcb1a69439615d5794a1be50caa9bc92c81967"
> +
> +[[package]]
> +name = "num-derive"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ed3955f1a9c7c0c15e092f9c887db08b1fc683305fdf6eb6684f22555355e202"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "num-integer"
> +version = "0.1.46"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
> +dependencies = [
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "num-iter"
> +version = "0.1.45"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
> +dependencies = [
> + "autocfg",
> + "num-integer",
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "num-rational"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824"
> +dependencies = [
> + "num-bigint",
> + "num-integer",
> + "num-traits",
> + "serde",
> +]
> +
> +[[package]]
> +name = "num-traits"
> +version = "0.2.19"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
> +dependencies = [
> + "autocfg",
> + "libm",
> +]
> +
> +[[package]]
> +name = "num_cpus"
> +version = "1.17.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b"
> +dependencies = [
> + "hermit-abi",
> + "libc",
> +]
> +
> +[[package]]
> +name = "num_threads"
> +version = "0.1.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5c7398b9c8b70908f6371f47ed36737907c87c52af34c268fed0bf0ceb92ead9"
> +dependencies = [
> + "libc",
> +]
> +
> +[[package]]
> +name = "oauth2"
> +version = "5.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "51e219e79014df21a225b1860a479e2dcd7cbd9130f4defd4bd0e191ea31d67d"
> +dependencies = [
> + "base64 0.22.1",
> + "chrono",
> + "getrandom 0.2.17",
> + "http 1.4.0",
> + "rand 0.8.6",
> + "reqwest",
> + "serde",
> + "serde_json",
> + "serde_path_to_error",
> + "sha2 0.10.9",
> + "thiserror 1.0.69",
> + "url",
> +]
> +
> +[[package]]
> +name = "objc"
> +version = "0.2.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "915b1b472bc21c53464d6c8461c9d3af805ba1ef837e1cac254428f4a77177b1"
> +dependencies = [
> + "malloc_buf",
> +]
> +
> +[[package]]
> +name = "objc2"
> +version = "0.6.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3a12a8ed07aefc768292f076dc3ac8c48f3781c8f2d5851dd3d98950e8c5a89f"
> +dependencies = [
> + "objc2-encode",
> +]
> +
> +[[package]]
> +name = "objc2-cloud-kit"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "73ad74d880bb43877038da939b7427bba67e9dd42004a18b809ba7d87cee241c"
> +dependencies = [
> + "bitflags 2.11.1",
> + "objc2",
> + "objc2-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-core-data"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0b402a653efbb5e82ce4df10683b6b28027616a2715e90009947d50b8dd298fa"
> +dependencies = [
> + "objc2",
> + "objc2-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-core-foundation"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2a180dd8642fa45cdb7dd721cd4c11b1cadd4929ce112ebd8b9f5803cc79d536"
> +dependencies = [
> + "bitflags 2.11.1",
> + "dispatch2",
> + "objc2",
> +]
> +
> +[[package]]
> +name = "objc2-core-graphics"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e022c9d066895efa1345f8e33e584b9f958da2fd4cd116792e15e07e4720a807"
> +dependencies = [
> + "bitflags 2.11.1",
> + "dispatch2",
> + "objc2",
> + "objc2-core-foundation",
> + "objc2-io-surface",
> +]
> +
> +[[package]]
> +name = "objc2-core-image"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e5d563b38d2b97209f8e861173de434bd0214cf020e3423a52624cd1d989f006"
> +dependencies = [
> + "objc2",
> + "objc2-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-core-location"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ca347214e24bc973fc025fd0d36ebb179ff30536ed1f80252706db19ee452009"
> +dependencies = [
> + "objc2",
> + "objc2-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-core-text"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0cde0dfb48d25d2b4862161a4d5fcc0e3c24367869ad306b0c9ec0073bfed92d"
> +dependencies = [
> + "bitflags 2.11.1",
> + "objc2",
> + "objc2-core-foundation",
> + "objc2-core-graphics",
> +]
> +
> +[[package]]
> +name = "objc2-encode"
> +version = "4.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
> +
> +[[package]]
> +name = "objc2-foundation"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e3e0adef53c21f888deb4fa59fc59f7eb17404926ee8a6f59f5df0fd7f9f3272"
> +dependencies = [
> + "bitflags 2.11.1",
> + "block2",
> + "libc",
> + "objc2",
> + "objc2-core-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-io-kit"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "33fafba39597d6dc1fb709123dfa8289d39406734be322956a69f0931c73bb15"
> +dependencies = [
> + "libc",
> + "objc2-core-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-io-surface"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "180788110936d59bab6bd83b6060ffdfffb3b922ba1396b312ae795e1de9d81d"
> +dependencies = [
> + "bitflags 2.11.1",
> + "objc2",
> + "objc2-core-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-quartz-core"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "96c1358452b371bf9f104e21ec536d37a650eb10f7ee379fff67d2e08d537f1f"
> +dependencies = [
> + "bitflags 2.11.1",
> + "objc2",
> + "objc2-core-foundation",
> + "objc2-foundation",
> +]
> +
> +[[package]]
> +name = "objc2-ui-kit"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d87d638e33c06f577498cbcc50491496a3ed4246998a7fbba7ccb98b1e7eab22"
> +dependencies = [
> + "bitflags 2.11.1",
> + "block2",
> + "objc2",
> + "objc2-cloud-kit",
> + "objc2-core-data",
> + "objc2-core-foundation",
> + "objc2-core-graphics",
> + "objc2-core-image",
> + "objc2-core-location",
> + "objc2-core-text",
> + "objc2-foundation",
> + "objc2-quartz-core",
> + "objc2-user-notifications",
> +]
> +
> +[[package]]
> +name = "objc2-user-notifications"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9df9128cbbfef73cda168416ccf7f837b62737d748333bfe9ab71c245d76613e"
> +dependencies = [
> + "objc2",
> + "objc2-foundation",
> +]
> +
> +[[package]]
> +name = "object"
> +version = "0.37.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ff76201f031d8863c38aa7f905eca4f53abbfa15f609db4277d44cd8938f33fe"
> +dependencies = [
> + "memchr",
> +]
> +
> +[[package]]
> +name = "ogg"
> +version = "0.9.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fdab8dcd8d4052eaacaf8fb07a3ccd9a6e26efadb42878a413c68fc4af1dee2b"
> +dependencies = [
> + "byteorder",
> +]
> +
> +[[package]]
> +name = "oid-registry"
> +version = "0.8.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "12f40cff3dde1b6087cc5d5f5d4d65712f34016a03ed60e9c08dcc392736b5b7"
> +dependencies = [
> + "asn1-rs",
> +]
> +
> +[[package]]
> +name = "once_cell"
> +version = "1.21.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9f7c3e4beb33f85d45ae3e3a1792185706c8e16d043238c593331cc7cd313b50"
> +
> +[[package]]
> +name = "once_cell_polyfill"
> +version = "1.70.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
> +
> +[[package]]
> +name = "open"
> +version = "5.3.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9f3bab717c29a857abf75fcef718d441ec7cb2725f937343c734740a985d37fd"
> +dependencies = [
> + "is-wsl",
> + "libc",
> + "pathdiff",
> +]
> +
> +[[package]]
> +name = "openssl-probe"
> +version = "0.1.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d05e27ee213611ffe7d6348b942e8f942b37114c00cc03cec254295a4a17852e"
> +
> +[[package]]
> +name = "openssl-probe"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe"
> +
> +[[package]]
> +name = "option-ext"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
> +
> +[[package]]
> +name = "option-operations"
> +version = "0.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "aca39cf52b03268400c16eeb9b56382ea3c3353409309b63f5c8f0b1faf42754"
> +dependencies = [
> + "pastey 0.2.2",
> +]
> +
> +[[package]]
> +name = "ordered-float"
> +version = "5.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e2c1f9f56e534ac6a9b8a4600bdf0f530fb393b5f393e7b4d03489c3cf0c3f01"
> +dependencies = [
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "os_info"
> +version = "3.14.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e4022a17595a00d6a369236fdae483f0de7f0a339960a53118b818238e132224"
> +dependencies = [
> + "android_system_properties",
> + "log",
> + "nix 0.30.1",
> + "objc2",
> + "objc2-foundation",
> + "objc2-ui-kit",
> + "serde",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "outref"
> +version = "0.5.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1a80800c0488c3a21695ea981a54918fbb37abf04f4d0720c453632255e2ff0e"
> +
> +[[package]]
> +name = "p256"
> +version = "0.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "51f44edd08f51e2ade572f141051021c5af22677e42b7dd28a88155151c33594"
> +dependencies = [
> + "ecdsa 0.14.8",
> + "elliptic-curve 0.12.3",
> + "sha2 0.10.9",
> +]
> +
> +[[package]]
> +name = "p256"
> +version = "0.13.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c9863ad85fa8f4460f9c48cb909d38a0d689dba1f6f6988a5e3e0d31071bcd4b"
> +dependencies = [
> + "ecdsa 0.16.9",
> + "elliptic-curve 0.13.8",
> + "primeorder",
> + "sha2 0.10.9",
> +]
> +
> +[[package]]
> +name = "p384"
> +version = "0.13.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fe42f1670a52a47d448f14b6a5c61dd78fce51856e68edaa38f7ae3a46b8d6b6"
> +dependencies = [
> + "ecdsa 0.16.9",
> + "elliptic-curve 0.13.8",
> + "primeorder",
> + "sha2 0.10.9",
> +]
> +
> +[[package]]
> +name = "pango"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "gio",
> + "glib",
> + "libc",
> + "pango-sys",
> +]
> +
> +[[package]]
> +name = "pango-sys"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "glib-sys",
> + "gobject-sys",
> + "libc",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "pangocairo"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "cairo-rs",
> + "glib",
> + "libc",
> + "pango",
> + "pangocairo-sys",
> +]
> +
> +[[package]]
> +name = "pangocairo-sys"
> +version = "0.22.7"
> +source = "git+https://github.com/gtk-rs/gtk-rs-core?branch=0.22#ba575eeaf5c7cf043e55454620e5926593756c67"
> +dependencies = [
> + "cairo-sys-rs",
> + "glib-sys",
> + "libc",
> + "pango-sys",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "parking"
> +version = "2.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
> +
> +[[package]]
> +name = "parking_lot"
> +version = "0.12.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
> +dependencies = [
> + "lock_api",
> + "parking_lot_core",
> +]
> +
> +[[package]]
> +name = "parking_lot_core"
> +version = "0.9.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
> +dependencies = [
> + "cfg-if",
> + "libc",
> + "redox_syscall",
> + "smallvec",
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "parse_link_header"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4eb9c7a76731a2792f9b97fb34c1e774fff008badcd449d61fcdacb7a912392b"
> +dependencies = [
> + "http 1.4.0",
> + "lazy_static",
> + "regex",
> + "url",
> +]
> +
> +[[package]]
> +name = "paste"
> +version = "1.0.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
> +
> +[[package]]
> +name = "pastey"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "35fb2e5f958ec131621fdd531e9fc186ed768cbe395337403ae56c17a74c68ec"
> +
> +[[package]]
> +name = "pastey"
> +version = "0.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c5a797f0e07bdf071d15742978fc3128ec6c22891c31a3a931513263904c982a"
> +
> +[[package]]
> +name = "pathdiff"
> +version = "0.2.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3"
> +
> +[[package]]
> +name = "pbjson"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1030c719b0ec2a2d25a5df729d6cff1acf3cc230bf766f4f97833591f7577b90"
> +dependencies = [
> + "base64 0.21.7",
> + "serde",
> +]
> +
> +[[package]]
> +name = "pbjson-build"
> +version = "0.6.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2580e33f2292d34be285c5bc3dba5259542b083cfad6037b6d70345f24dcb735"
> +dependencies = [
> + "heck 0.4.1",
> + "itertools 0.11.0",
> + "prost",
> + "prost-types",
> +]
> +
> +[[package]]
> +name = "pbjson-types"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "18f596653ba4ac51bdecbb4ef6773bc7f56042dc13927910de1684ad3d32aa12"
> +dependencies = [
> + "bytes",
> + "chrono",
> + "pbjson",
> + "pbjson-build",
> + "prost",
> + "prost-build",
> + "serde",
> +]
> +
> +[[package]]
> +name = "pbkdf2"
> +version = "0.12.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
> +dependencies = [
> + "digest 0.10.7",
> + "hmac 0.12.1",
> +]
> +
> +[[package]]
> +name = "pcap-file"
> +version = "2.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1fc1f139757b058f9f37b76c48501799d12c9aa0aa4c0d4c980b062ee925d1b2"
> +dependencies = [
> + "byteorder_slice",
> + "derive-into-owned",
> + "thiserror 1.0.69",
> +]
> +
> +[[package]]
> +name = "pem"
> +version = "3.0.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be"
> +dependencies = [
> + "base64 0.22.1",
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "pem-rfc7468"
> +version = "0.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
> +dependencies = [
> + "base64ct",
> +]
> +
> +[[package]]
> +name = "percent-encoding"
> +version = "2.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
> +
> +[[package]]
> +name = "petgraph"
> +version = "0.6.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b4c5cc86750666a3ed20bdaf5ca2a0344f9c67674cae0515bec2da16fbaa47db"
> +dependencies = [
> + "fixedbitset",
> + "indexmap 2.14.0",
> +]
> +
> +[[package]]
> +name = "pin-project"
> +version = "1.1.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cbf0d9e68100b3a7989b4901972f265cd542e560a3a8a724e1e20322f4d06ce9"
> +dependencies = [
> + "pin-project-internal",
> +]
> +
> +[[package]]
> +name = "pin-project-internal"
> +version = "1.1.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a990e22f43e84855daf260dded30524ef4a9021cc7541c26540500a50b624389"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "pin-project-lite"
> +version = "0.2.17"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
> +
> +[[package]]
> +name = "pin-utils"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> +
> +[[package]]
> +name = "pkcs1"
> +version = "0.7.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
> +dependencies = [
> + "der 0.7.10",
> + "pkcs8 0.10.2",
> + "spki 0.7.3",
> +]
> +
> +[[package]]
> +name = "pkcs8"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9eca2c590a5f85da82668fa685c09ce2888b9430e83299debf1f34b65fd4a4ba"
> +dependencies = [
> + "der 0.6.1",
> + "spki 0.6.0",
> +]
> +
> +[[package]]
> +name = "pkcs8"
> +version = "0.10.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
> +dependencies = [
> + "der 0.7.10",
> + "spki 0.7.3",
> +]
> +
> +[[package]]
> +name = "pkg-config"
> +version = "0.3.33"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "19f132c84eca552bf34cab8ec81f1c1dcc229b811638f9d283dceabe58c5569e"
> +
> +[[package]]
> +name = "png"
> +version = "0.18.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61"
> +dependencies = [
> + "bitflags 2.11.1",
> + "crc32fast",
> + "fdeflate",
> + "flate2",
> + "miniz_oxide",
> +]
> +
> +[[package]]
> +name = "pocket-resources"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c135f38778ad324d9e9ee68690bac2c1a51f340fdf96ca13e2ab3914eb2e51d8"
> +
> +[[package]]
> +name = "polling"
> +version = "3.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5d0e4f59085d47d8241c88ead0f274e8a0cb551f3625263c05eb8dd897c34218"
> +dependencies = [
> + "cfg-if",
> + "concurrent-queue",
> + "hermit-abi",
> + "pin-project-lite",
> + "rustix 1.1.4",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "portable-atomic"
> +version = "1.13.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
> +dependencies = [
> + "serde",
> +]
> +
> +[[package]]
> +name = "portable-atomic-util"
> +version = "0.2.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c2a106d1259c23fac8e543272398ae0e3c0b8d33c88ed73d0cc71b0f1d902618"
> +dependencies = [
> + "portable-atomic",
> +]
> +
> +[[package]]
> +name = "potential_utf"
> +version = "0.1.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0103b1cef7ec0cf76490e969665504990193874ea05c85ff9bab8b911d0a0564"
> +dependencies = [
> + "serde_core",
> + "writeable",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "powerfmt"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
> +
> +[[package]]
> +name = "ppmd-rust"
> +version = "1.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "efca4c95a19a79d1c98f791f10aebd5c1363b473244630bb7dbde1dc98455a24"
> +
> +[[package]]
> +name = "ppv-lite86"
> +version = "0.2.21"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
> +dependencies = [
> + "zerocopy",
> +]
> +
> +[[package]]
> +name = "presser"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e8cf8e6a8aa66ce33f63993ffc4ea4271eb5b0530a9002db8455ea6050c77bfa"
> +
> +[[package]]
> +name = "pretty_assertions"
> +version = "1.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
> +dependencies = [
> + "diff",
> + "yansi",
> +]
> +
> +[[package]]
> +name = "prettyplease"
> +version = "0.2.37"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
> +dependencies = [
> + "proc-macro2",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "primal-check"
> +version = "0.3.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dc0d895b311e3af9902528fbb8f928688abbd95872819320517cc24ca6b2bd08"
> +dependencies = [
> + "num-integer",
> +]
> +
> +[[package]]
> +name = "primeorder"
> +version = "0.13.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "353e1ca18966c16d9deb1c69278edbc5f194139612772bd9537af60ac231e1e6"
> +dependencies = [
> + "elliptic-curve 0.13.8",
> +]
> +
> +[[package]]
> +name = "priority-queue"
> +version = "2.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "93980406f12d9f8140ed5abe7155acb10bb1e69ea55c88960b9c2f117445ef96"
> +dependencies = [
> + "equivalent",
> + "indexmap 2.14.0",
> + "serde",
> +]
> +
> +[[package]]
> +name = "proc-macro-crate"
> +version = "3.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e67ba7e9b2b56446f1d419b1d807906278ffa1a658a8a5d8a39dcb1f5a78614f"
> +dependencies = [
> + "toml_edit",
> +]
> +
> +[[package]]
> +name = "proc-macro-error-attr2"
> +version = "2.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> +]
> +
> +[[package]]
> +name = "proc-macro-error2"
> +version = "2.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
> +dependencies = [
> + "proc-macro-error-attr2",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "proc-macro2"
> +version = "1.0.106"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
> +dependencies = [
> + "unicode-ident",
> +]
> +
> +[[package]]
> +name = "profiling"
> +version = "1.0.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3d595e54a326bc53c1c197b32d295e14b169e3cfeaa8dc82b529f947fba6bcf5"
> +dependencies = [
> + "profiling-procmacros",
> +]
> +
> +[[package]]
> +name = "profiling-procmacros"
> +version = "1.0.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4488a4a36b9a4ba6b9334a32a39971f77c1436ec82c38707bce707699cc3bbcb"
> +dependencies = [
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "prost"
> +version = "0.12.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "deb1435c188b76130da55f17a466d252ff7b1418b2ad3e037d127b94e3411f29"
> +dependencies = [
> + "bytes",
> + "prost-derive",
> +]
> +
> +[[package]]
> +name = "prost-build"
> +version = "0.12.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "22505a5c94da8e3b7c2996394d1c933236c4d743e81a410bcca4e6989fc066a4"
> +dependencies = [
> + "bytes",
> + "heck 0.5.0",
> + "itertools 0.12.1",
> + "log",
> + "multimap",
> + "once_cell",
> + "petgraph",
> + "prettyplease",
> + "prost",
> + "prost-types",
> + "regex",
> + "syn 2.0.117",
> + "tempfile",
> +]
> +
> +[[package]]
> +name = "prost-derive"
> +version = "0.12.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "81bddcdb20abf9501610992b6759a4c888aef7d1a7247ef75e2404275ac24af1"
> +dependencies = [
> + "anyhow",
> + "itertools 0.12.1",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "prost-types"
> +version = "0.12.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9091c90b0a32608e984ff2fa4091273cbdd755d54935c51d520887f4a1dbd5b0"
> +dependencies = [
> + "prost",
> +]
> +
> +[[package]]
> +name = "protobuf"
> +version = "3.7.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d65a1d4ddae7d8b5de68153b48f6aa3bba8cb002b243dbdbc55a5afbc98f99f4"
> +dependencies = [
> + "once_cell",
> + "protobuf-support",
> + "thiserror 1.0.69",
> +]
> +
> +[[package]]
> +name = "protobuf-codegen"
> +version = "3.7.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5d3976825c0014bbd2f3b34f0001876604fe87e0c86cd8fa54251530f1544ace"
> +dependencies = [
> + "anyhow",
> + "once_cell",
> + "protobuf",
> + "protobuf-parse",
> + "regex",
> + "tempfile",
> + "thiserror 1.0.69",
> +]
> +
> +[[package]]
> +name = "protobuf-json-mapping"
> +version = "3.7.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e0d6e4be637b310d8a5c02fa195243328e2d97fa7df1127a27281ef1187fcb1d"
> +dependencies = [
> + "protobuf",
> + "protobuf-support",
> + "thiserror 1.0.69",
> +]
> +
> +[[package]]
> +name = "protobuf-parse"
> +version = "3.7.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b4aeaa1f2460f1d348eeaeed86aea999ce98c1bded6f089ff8514c9d9dbdc973"
> +dependencies = [
> + "anyhow",
> + "indexmap 2.14.0",
> + "log",
> + "protobuf",
> + "protobuf-support",
> + "tempfile",
> + "thiserror 1.0.69",
> + "which",
> +]
> +
> +[[package]]
> +name = "protobuf-support"
> +version = "3.7.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3e36c2f31e0a47f9280fb347ef5e461ffcd2c52dd520d8e216b52f93b0b0d7d6"
> +dependencies = [
> + "thiserror 1.0.69",
> +]
> +
> +[[package]]
> +name = "psl-types"
> +version = "2.0.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "33cb294fe86a74cbcf50d4445b37da762029549ebeea341421c7c70370f86cac"
> +
> +[[package]]
> +name = "publicsuffix"
> +version = "2.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6f42ea446cab60335f76979ec15e12619a2165b5ae2c12166bef27d283a9fadf"
> +dependencies = [
> + "idna",
> + "psl-types",
> +]
> +
> +[[package]]
> +name = "pxfm"
> +version = "0.1.29"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e0c5ccf5294c6ccd63a74f1565028353830a9c2f5eb0c682c355c471726a6e3f"
> +
> +[[package]]
> +name = "pyo3"
> +version = "0.28.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
> +dependencies = [
> + "libc",
> + "once_cell",
> + "portable-atomic",
> + "pyo3-build-config",
> + "pyo3-ffi",
> + "pyo3-macros",
> +]
> +
> +[[package]]
> +name = "pyo3-build-config"
> +version = "0.28.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
> +dependencies = [
> + "target-lexicon 0.13.5",
> +]
> +
> +[[package]]
> +name = "pyo3-ffi"
> +version = "0.28.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
> +dependencies = [
> + "libc",
> + "pyo3-build-config",
> +]
> +
> +[[package]]
> +name = "pyo3-macros"
> +version = "0.28.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
> +dependencies = [
> + "proc-macro2",
> + "pyo3-macros-backend",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "pyo3-macros-backend"
> +version = "0.28.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
> +dependencies = [
> + "heck 0.5.0",
> + "proc-macro2",
> + "pyo3-build-config",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "quick-xml"
> +version = "0.38.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b66c2058c55a409d601666cffe35f04333cf1013010882cec174a7467cd4e21c"
> +dependencies = [
> + "memchr",
> + "serde",
> +]
> +
> +[[package]]
> +name = "quick-xml"
> +version = "0.39.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cdcc8dd4e2f670d309a5f0e83fe36dfdc05af317008fea29144da1a2ac858e5e"
> +dependencies = [
> + "memchr",
> + "serde",
> +]
> +
> +[[package]]
> +name = "quinn"
> +version = "0.11.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b9e20a958963c291dc322d98411f541009df2ced7b5a4f2bd52337638cfccf20"
> +dependencies = [
> + "bytes",
> + "cfg_aliases",
> + "pin-project-lite",
> + "quinn-proto",
> + "quinn-udp",
> + "rustc-hash 2.1.2",
> + "rustls 0.23.40",
> + "socket2 0.6.3",
> + "thiserror 2.0.18",
> + "tokio",
> + "tracing",
> + "web-time",
> +]
> +
> +[[package]]
> +name = "quinn-proto"
> +version = "0.11.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "434b42fec591c96ef50e21e886936e66d3cc3f737104fdb9b737c40ffb94c098"
> +dependencies = [
> + "bytes",
> + "fastbloom",
> + "getrandom 0.3.4",
> + "lru-slab",
> + "rand 0.9.4",
> + "ring",
> + "rustc-hash 2.1.2",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "rustls-platform-verifier 0.6.2",
> + "slab",
> + "thiserror 2.0.18",
> + "tinyvec",
> + "tracing",
> + "web-time",
> +]
> +
> +[[package]]
> +name = "quinn-udp"
> +version = "0.5.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "addec6a0dcad8a8d96a771f815f0eaf55f9d1805756410b39f5fa81332574cbd"
> +dependencies = [
> + "cfg_aliases",
> + "libc",
> + "once_cell",
> + "socket2 0.6.3",
> + "tracing",
> + "windows-sys 0.60.2",
> +]
> +
> +[[package]]
> +name = "quote"
> +version = "1.0.45"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
> +dependencies = [
> + "proc-macro2",
> +]
> +
> +[[package]]
> +name = "r-efi"
> +version = "5.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
> +
> +[[package]]
> +name = "r-efi"
> +version = "6.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
> +
> +[[package]]
> +name = "rand"
> +version = "0.8.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5ca0ecfa931c29007047d1bc58e623ab12e5590e8c7cc53200d5202b69266d8a"
> +dependencies = [
> + "libc",
> + "rand_chacha 0.3.1",
> + "rand_core 0.6.4",
> +]
> +
> +[[package]]
> +name = "rand"
> +version = "0.9.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "44c5af06bb1b7d3216d91932aed5265164bf384dc89cd6ba05cf59a35f5f76ea"
> +dependencies = [
> + "rand_chacha 0.9.0",
> + "rand_core 0.9.5",
> +]
> +
> +[[package]]
> +name = "rand"
> +version = "0.10.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d2e8e8bcc7961af1fdac401278c6a831614941f6164ee3bf4ce61b7edb162207"
> +dependencies = [
> + "chacha20",
> + "getrandom 0.4.2",
> + "rand_core 0.10.1",
> +]
> +
> +[[package]]
> +name = "rand_chacha"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> +dependencies = [
> + "ppv-lite86",
> + "rand_core 0.6.4",
> +]
> +
> +[[package]]
> +name = "rand_chacha"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d3022b5f1df60f26e1ffddd6c66e8aa15de382ae63b3a0c1bfc0e4d3e3f325cb"
> +dependencies = [
> + "ppv-lite86",
> + "rand_core 0.9.5",
> +]
> +
> +[[package]]
> +name = "rand_core"
> +version = "0.6.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> +dependencies = [
> + "getrandom 0.2.17",
> +]
> +
> +[[package]]
> +name = "rand_core"
> +version = "0.9.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "76afc826de14238e6e8c374ddcc1fa19e374fd8dd986b0d2af0d02377261d83c"
> +dependencies = [
> + "getrandom 0.3.4",
> +]
> +
> +[[package]]
> +name = "rand_core"
> +version = "0.10.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "63b8176103e19a2643978565ca18b50549f6101881c443590420e4dc998a3c69"
> +
> +[[package]]
> +name = "rand_distr"
> +version = "0.5.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6a8615d50dcf34fa31f7ab52692afec947c4dd0ab803cc87cb3b0b4570ff7463"
> +dependencies = [
> + "num-traits",
> + "rand 0.9.4",
> +]
> +
> +[[package]]
> +name = "range-alloc"
> +version = "0.1.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ca45419789ae5a7899559e9512e58ca889e41f04f1f2445e9f4b290ceccd1d08"
> +
> +[[package]]
> +name = "raptorq"
> +version = "2.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "90b1b1fad69672f0b901b5004863ea4307f03d168a3db5f2bcba4d3dfed88e97"
> +
> +[[package]]
> +name = "rav1e"
> +version = "0.8.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "43b6dd56e85d9483277cde964fd1bdb0428de4fec5ebba7540995639a21cb32b"
> +dependencies = [
> + "aligned-vec",
> + "arbitrary",
> + "arg_enum_proc_macro",
> + "arrayvec",
> + "av-scenechange",
> + "av1-grain",
> + "bitstream-io",
> + "built",
> + "cc",
> + "cfg-if",
> + "interpolate_name",
> + "itertools 0.14.0",
> + "libc",
> + "libfuzzer-sys",
> + "log",
> + "maybe-rayon",
> + "nasm-rs",
> + "new_debug_unreachable",
> + "noop_proc_macro",
> + "num-derive",
> + "num-traits",
> + "paste",
> + "profiling",
> + "rand 0.9.4",
> + "rand_chacha 0.9.0",
> + "simd_helpers",
> + "thiserror 2.0.18",
> + "v_frame",
> +]
> +
> +[[package]]
> +name = "raw-window-handle"
> +version = "0.6.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "20675572f6f24e9e76ef639bc5552774ed45f1c30e2951e1e99c59888861c539"
> +
> +[[package]]
> +name = "rawpointer"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "60a357793950651c4ed0f3f52338f53b2f809f32d83a07f72909fa13e4c6c1e3"
> +
> +[[package]]
> +name = "rayon"
> +version = "1.12.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fb39b166781f92d482534ef4b4b1b2568f42613b53e5b6c160e24cfbfa30926d"
> +dependencies = [
> + "either",
> + "rayon-core",
> +]
> +
> +[[package]]
> +name = "rayon-core"
> +version = "1.13.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
> +dependencies = [
> + "crossbeam-deque",
> + "crossbeam-utils",
> +]
> +
> +[[package]]
> +name = "rcgen"
> +version = "0.14.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "57f6d249aad744e274e682777a50283a225a32705394ee6d5fcc01efa25e4055"
> +dependencies = [
> + "pem",
> + "ring",
> + "rustls-pki-types",
> + "time",
> + "x509-parser",
> + "yasna",
> +]
> +
> +[[package]]
> +name = "realfft"
> +version = "3.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f821338fddb99d089116342c46e9f1fbf3828dba077674613e734e01d6ea8677"
> +dependencies = [
> + "rustfft",
> +]
> +
> +[[package]]
> +name = "redox_syscall"
> +version = "0.5.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ed2bf2547551a7053d6fdfafda3f938979645c44812fbfcda098faae3f1a362d"
> +dependencies = [
> + "bitflags 2.11.1",
> +]
> +
> +[[package]]
> +name = "redox_users"
> +version = "0.5.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
> +dependencies = [
> + "getrandom 0.2.17",
> + "libredox",
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "ref-cast"
> +version = "1.0.25"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
> +dependencies = [
> + "ref-cast-impl",
> +]
> +
> +[[package]]
> +name = "ref-cast-impl"
> +version = "1.0.25"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "regex"
> +version = "1.12.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
> +dependencies = [
> + "aho-corasick",
> + "memchr",
> + "regex-automata",
> + "regex-syntax",
> +]
> +
> +[[package]]
> +name = "regex-automata"
> +version = "0.4.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
> +dependencies = [
> + "aho-corasick",
> + "memchr",
> + "regex-syntax",
> +]
> +
> +[[package]]
> +name = "regex-lite"
> +version = "0.1.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cab834c73d247e67f4fae452806d17d3c7501756d98c8808d7c9c7aa7d18f973"
> +
> +[[package]]
> +name = "regex-syntax"
> +version = "0.8.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
> +
> +[[package]]
> +name = "renderdoc-sys"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "19b30a45b0cd0bcca8037f3d0dc3421eaf95327a17cad11964fb8179b4fc4832"
> +
> +[[package]]
> +name = "reqwest"
> +version = "0.12.28"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "eddd3ca559203180a307f12d114c268abf583f59b03cb906fd0b3ff8646c1147"
> +dependencies = [
> + "base64 0.22.1",
> + "bytes",
> + "cookie",
> + "cookie_store",
> + "encoding_rs",
> + "futures-channel",
> + "futures-core",
> + "futures-util",
> + "h2 0.4.14",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "http-body-util",
> + "hyper 1.9.0",
> + "hyper-rustls 0.27.9",
> + "hyper-util",
> + "js-sys",
> + "log",
> + "mime",
> + "mime_guess",
> + "percent-encoding",
> + "pin-project-lite",
> + "quinn",
> + "rustls 0.23.40",
> + "rustls-native-certs 0.8.3",
> + "rustls-pki-types",
> + "serde",
> + "serde_json",
> + "serde_urlencoded",
> + "sync_wrapper",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tokio-util",
> + "tower",
> + "tower-http",
> + "tower-service",
> + "url",
> + "wasm-bindgen",
> + "wasm-bindgen-futures",
> + "wasm-streams",
> + "web-sys",
> + "webpki-roots 1.0.7",
> +]
> +
> +[[package]]
> +name = "rfc6979"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7743f17af12fa0b03b803ba12cd6a8d9483a587e89c69445e3909655c0b9fabb"
> +dependencies = [
> + "crypto-bigint 0.4.9",
> + "hmac 0.12.1",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "rfc6979"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f8dd2a808d456c4a54e300a23e9f5a67e122c3024119acbfd73e3bf664491cb2"
> +dependencies = [
> + "hmac 0.12.1",
> + "subtle",
> +]
> +
> +[[package]]
> +name = "rgb"
> +version = "0.8.53"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "47b34b781b31e5d73e9fbc8689c70551fd1ade9a19e3e28cfec8580a79290cc4"
> +dependencies = [
> + "bytemuck",
> +]
> +
> +[[package]]
> +name = "ring"
> +version = "0.17.14"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
> +dependencies = [
> + "cc",
> + "cfg-if",
> + "getrandom 0.2.17",
> + "libc",
> + "untrusted",
> + "windows-sys 0.52.0",
> +]
> +
> +[[package]]
> +name = "rmp"
> +version = "0.8.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4ba8be72d372b2c9b35542551678538b562e7cf86c3315773cae48dfbfe7790c"
> +dependencies = [
> + "num-traits",
> +]
> +
> +[[package]]
> +name = "rmp-serde"
> +version = "1.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "72f81bee8c8ef9b577d1681a70ebbc962c232461e397b22c208c43c04b67a155"
> +dependencies = [
> + "rmp",
> + "serde",
> +]
> +
> +[[package]]
> +name = "rqrr"
> +version = "0.10.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ffbe87d9e8db95652c25ded2418150e00b08c2fde09e23ec15896d2c470c6631"
> +dependencies = [
> + "g2p",
> + "image",
> + "lru",
> +]
> +
> +[[package]]
> +name = "rsa"
> +version = "0.9.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b8573f03f5883dcaebdfcf4725caa1ecb9c15b2ef50c43a07b816e06799bb12d"
> +dependencies = [
> + "const-oid 0.9.6",
> + "digest 0.10.7",
> + "num-bigint-dig",
> + "num-integer",
> + "num-traits",
> + "pkcs1",
> + "pkcs8 0.10.2",
> + "rand_core 0.6.4",
> + "signature 2.2.0",
> + "spki 0.7.3",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "rtcp-types"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c081c846edea632bb47332fada9d4ac2fdf54d84beaf547fc947b58489e5f619"
> +dependencies = [
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "rtp-types"
> +version = "0.1.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7bb90df8268abfe08452ef2dae9e867a54edfdaa71b3127ef47d8b031f77ac73"
> +dependencies = [
> + "smallvec",
> + "thiserror 1.0.69",
> +]
> +
> +[[package]]
> +name = "rtsp-types"
> +version = "0.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f47bf238c3da7994ef66a71724f385cb1ee25dcf04a156402d2727ad84dc1433"
> +dependencies = [
> + "cookie-factory",
> + "nom 7.1.3",
> + "tinyvec",
> + "url",
> +]
> +
> +[[package]]
> +name = "rubato"
> +version = "0.14.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e6dd52e80cfc21894deadf554a5673002938ae4625f7a283e536f9cf7c17b0d5"
> +dependencies = [
> + "num-complex",
> + "num-integer",
> + "num-traits",
> + "realfft",
> +]
> +
> +[[package]]
> +name = "rustc-demangle"
> +version = "0.1.27"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b50b8869d9fc858ce7266cce0194bd74df58b9d0e3f6df3a9fc8eb470d95c09d"
> +
> +[[package]]
> +name = "rustc-hash"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "08d43f7aa6b08d49f382cde6a7982047c3426db949b1424bc4b7ec9ae12c6ce2"
> +
> +[[package]]
> +name = "rustc-hash"
> +version = "2.1.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
> +
> +[[package]]
> +name = "rustc_version"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
> +dependencies = [
> + "semver",
> +]
> +
> +[[package]]
> +name = "rustdct"
> +version = "0.7.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8b61555105d6a9bf98797c063c362a1d24ed8ab0431655e38f1cf51e52089551"
> +dependencies = [
> + "rustfft",
> +]
> +
> +[[package]]
> +name = "rustfft"
> +version = "6.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "21db5f9893e91f41798c88680037dba611ca6674703c1a18601b01a72c8adb89"
> +dependencies = [
> + "num-complex",
> + "num-integer",
> + "num-traits",
> + "primal-check",
> + "strength_reduce",
> + "transpose",
> +]
> +
> +[[package]]
> +name = "rusticata-macros"
> +version = "4.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "faf0c4a6ece9950b9abdb62b1cfcf2a68b3b67a10ba445b3bb85be2a293d0632"
> +dependencies = [
> + "nom 7.1.3",
> +]
> +
> +[[package]]
> +name = "rustix"
> +version = "0.38.44"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
> +dependencies = [
> + "bitflags 2.11.1",
> + "errno",
> + "libc",
> + "linux-raw-sys 0.4.15",
> + "windows-sys 0.59.0",
> +]
> +
> +[[package]]
> +name = "rustix"
> +version = "1.1.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
> +dependencies = [
> + "bitflags 2.11.1",
> + "errno",
> + "libc",
> + "linux-raw-sys 0.12.1",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "rustls"
> +version = "0.21.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3f56a14d1f48b391359b22f731fd4bd7e43c97f3c50eee276f3aa09c94784d3e"
> +dependencies = [
> + "log",
> + "ring",
> + "rustls-webpki 0.101.7",
> + "sct",
> +]
> +
> +[[package]]
> +name = "rustls"
> +version = "0.22.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bf4ef73721ac7bcd79b2b315da7779d8fc09718c6b3d2d1b2d94850eb8c18432"
> +dependencies = [
> + "log",
> + "ring",
> + "rustls-pki-types",
> + "rustls-webpki 0.102.8",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "rustls"
> +version = "0.23.40"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ef86cd5876211988985292b91c96a8f2d298df24e75989a43a3c73f2d4d8168b"
> +dependencies = [
> + "log",
> + "once_cell",
> + "ring",
> + "rustls-pki-types",
> + "rustls-webpki 0.103.13",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "rustls-native-certs"
> +version = "0.6.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a9aace74cb666635c918e9c12bc0d348266037aa8eb599b5cba565709a8dff00"
> +dependencies = [
> + "openssl-probe 0.1.6",
> + "rustls-pemfile 1.0.4",
> + "schannel",
> + "security-framework 2.11.1",
> +]
> +
> +[[package]]
> +name = "rustls-native-certs"
> +version = "0.7.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e5bfb394eeed242e909609f56089eecfe5fda225042e8b171791b9c95f5931e5"
> +dependencies = [
> + "openssl-probe 0.1.6",
> + "rustls-pemfile 2.2.0",
> + "rustls-pki-types",
> + "schannel",
> + "security-framework 2.11.1",
> +]
> +
> +[[package]]
> +name = "rustls-native-certs"
> +version = "0.8.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "612460d5f7bea540c490b2b6395d8e34a953e52b491accd6c86c8164c5932a63"
> +dependencies = [
> + "openssl-probe 0.2.1",
> + "rustls-pki-types",
> + "schannel",
> + "security-framework 3.7.0",
> +]
> +
> +[[package]]
> +name = "rustls-pemfile"
> +version = "1.0.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1c74cae0a4cf6ccbbf5f359f08efdf8ee7e1dc532573bf0db71968cb56b1448c"
> +dependencies = [
> + "base64 0.21.7",
> +]
> +
> +[[package]]
> +name = "rustls-pemfile"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dce314e5fee3f39953d46bb63bb8a46d40c2f8fb7cc5a3b6cab2bde9721d6e50"
> +dependencies = [
> + "rustls-pki-types",
> +]
> +
> +[[package]]
> +name = "rustls-pki-types"
> +version = "1.14.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "30a7197ae7eb376e574fe940d068c30fe0462554a3ddbe4eca7838e049c937a9"
> +dependencies = [
> + "web-time",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "rustls-platform-verifier"
> +version = "0.6.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1d99feebc72bae7ab76ba994bb5e121b8d83d910ca40b36e0921f53becc41784"
> +dependencies = [
> + "core-foundation 0.10.1",
> + "core-foundation-sys",
> + "jni 0.21.1",
> + "log",
> + "once_cell",
> + "rustls 0.23.40",
> + "rustls-native-certs 0.8.3",
> + "rustls-platform-verifier-android",
> + "rustls-webpki 0.103.13",
> + "security-framework 3.7.0",
> + "security-framework-sys",
> + "webpki-root-certs",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "rustls-platform-verifier"
> +version = "0.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "26d1e2536ce4f35f4846aa13bff16bd0ff40157cdb14cc056c7b14ba41233ba0"
> +dependencies = [
> + "core-foundation 0.10.1",
> + "core-foundation-sys",
> + "jni 0.22.4",
> + "log",
> + "once_cell",
> + "rustls 0.23.40",
> + "rustls-native-certs 0.8.3",
> + "rustls-platform-verifier-android",
> + "rustls-webpki 0.103.13",
> + "security-framework 3.7.0",
> + "security-framework-sys",
> + "webpki-root-certs",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "rustls-platform-verifier-android"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f"
> +
> +[[package]]
> +name = "rustls-webpki"
> +version = "0.101.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8b6275d1ee7a1cd780b64aca7726599a1dbc893b1e64144529e55c3c2f745765"
> +dependencies = [
> + "ring",
> + "untrusted",
> +]
> +
> +[[package]]
> +name = "rustls-webpki"
> +version = "0.102.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "64ca1bc8749bd4cf37b5ce386cc146580777b4e8572c7b97baf22c83f444bee9"
> +dependencies = [
> + "ring",
> + "rustls-pki-types",
> + "untrusted",
> +]
> +
> +[[package]]
> +name = "rustls-webpki"
> +version = "0.103.13"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "61c429a8649f110dddef65e2a5ad240f747e85f7758a6bccc7e5777bd33f756e"
> +dependencies = [
> + "ring",
> + "rustls-pki-types",
> + "untrusted",
> +]
> +
> +[[package]]
> +name = "rustversion"
> +version = "1.0.22"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
> +
> +[[package]]
> +name = "ryu"
> +version = "1.0.23"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
> +
> +[[package]]
> +name = "safetensors"
> +version = "0.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "675656c1eabb620b921efea4f9199f97fc86e36dd6ffd1fbbe48d0f59a4987f5"
> +dependencies = [
> + "hashbrown 0.16.1",
> + "serde",
> + "serde_json",
> +]
> +
> +[[package]]
> +name = "same-file"
> +version = "1.0.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> +dependencies = [
> + "winapi-util",
> +]
> +
> +[[package]]
> +name = "sanitize-filename"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bc984f4f9ceb736a7bb755c3e3bd17dc56370af2600c9780dcc48c66453da34d"
> +dependencies = [
> + "regex",
> +]
> +
> +[[package]]
> +name = "scc"
> +version = "2.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "46e6f046b7fef48e2660c57ed794263155d713de679057f2d0c169bfc6e756cc"
> +dependencies = [
> + "sdd",
> +]
> +
> +[[package]]
> +name = "schannel"
> +version = "0.1.29"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "91c1b7e4904c873ef0710c1f407dde2e6287de2bebc1bbbf7d430bb7cbffd939"
> +dependencies = [
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "schemars"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4cd191f9397d57d581cddd31014772520aa448f65ef991055d7f61582c65165f"
> +dependencies = [
> + "dyn-clone",
> + "ref-cast",
> + "serde",
> + "serde_json",
> +]
> +
> +[[package]]
> +name = "schemars"
> +version = "1.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a2b42f36aa1cd011945615b92222f6bf73c599a102a300334cd7f8dbeec726cc"
> +dependencies = [
> + "dyn-clone",
> + "ref-cast",
> + "serde",
> + "serde_json",
> +]
> +
> +[[package]]
> +name = "scoped-tls"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e1cf6437eb19a8f4a6cc0f7dca544973b0b78843adbfeb3683d1a94a0024a294"
> +
> +[[package]]
> +name = "scopeguard"
> +version = "1.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
> +
> +[[package]]
> +name = "sct"
> +version = "0.7.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "da046153aa2352493d6cb7da4b6e5c0c057d8a1d0a9aa8560baffdd945acd414"
> +dependencies = [
> + "ring",
> + "untrusted",
> +]
> +
> +[[package]]
> +name = "sdd"
> +version = "3.0.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "490dcfcbfef26be6800d11870ff2df8774fa6e86d047e3e8c8a76b25655e41ca"
> +
> +[[package]]
> +name = "sdp-types"
> +version = "0.1.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9bb6c636ace20de73fb9536017f9ef069b258308a6c341a4aaf3d2fd11afc570"
> +dependencies = [
> + "bstr",
> + "fallible-iterator",
> +]
> +
> +[[package]]
> +name = "sec1"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3be24c1842290c45df0a7bf069e0c268a747ad05a192f2fd7dcfdbc1cba40928"
> +dependencies = [
> + "base16ct 0.1.1",
> + "der 0.6.1",
> + "generic-array",
> + "pkcs8 0.9.0",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "sec1"
> +version = "0.7.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d3e97a565f76233a6003f9f5c54be1d9c5bdfa3eccfb189469f11ec4901c47dc"
> +dependencies = [
> + "base16ct 0.2.0",
> + "der 0.7.10",
> + "generic-array",
> + "pkcs8 0.10.2",
> + "subtle",
> + "zeroize",
> +]
> +
> +[[package]]
> +name = "security-framework"
> +version = "2.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "897b2245f0b511c87893af39b033e5ca9cce68824c4d7e7630b5a1d339658d02"
> +dependencies = [
> + "bitflags 2.11.1",
> + "core-foundation 0.9.4",
> + "core-foundation-sys",
> + "libc",
> + "security-framework-sys",
> +]
> +
> +[[package]]
> +name = "security-framework"
> +version = "3.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d"
> +dependencies = [
> + "bitflags 2.11.1",
> + "core-foundation 0.10.1",
> + "core-foundation-sys",
> + "libc",
> + "security-framework-sys",
> +]
> +
> +[[package]]
> +name = "security-framework-sys"
> +version = "2.17.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3"
> +dependencies = [
> + "core-foundation-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "semver"
> +version = "1.0.28"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8a7852d02fc848982e0c167ef163aaff9cd91dc640ba85e263cb1ce46fae51cd"
> +
> +[[package]]
> +name = "serde"
> +version = "1.0.228"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
> +dependencies = [
> + "serde_core",
> + "serde_derive",
> +]
> +
> +[[package]]
> +name = "serde_bytes"
> +version = "0.11.19"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a5d440709e79d88e51ac01c4b72fc6cb7314017bb7da9eeff678aa94c10e3ea8"
> +dependencies = [
> + "serde",
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "serde_core"
> +version = "1.0.228"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
> +dependencies = [
> + "serde_derive",
> +]
> +
> +[[package]]
> +name = "serde_derive"
> +version = "1.0.228"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "serde_json"
> +version = "1.0.149"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
> +dependencies = [
> + "itoa",
> + "memchr",
> + "serde",
> + "serde_core",
> + "zmij",
> +]
> +
> +[[package]]
> +name = "serde_path_to_error"
> +version = "0.1.20"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "10a9ff822e371bb5403e391ecd83e182e0e77ba7f6fe0160b795797109d1b457"
> +dependencies = [
> + "itoa",
> + "serde",
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "serde_spanned"
> +version = "1.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
> +dependencies = [
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "serde_urlencoded"
> +version = "0.7.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd"
> +dependencies = [
> + "form_urlencoded",
> + "itoa",
> + "ryu",
> + "serde",
> +]
> +
> +[[package]]
> +name = "serde_with"
> +version = "3.20.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e72c1c2cb7b223fafb600a619537a871c2818583d619401b785e7c0b746ccde2"
> +dependencies = [
> + "base64 0.22.1",
> + "bs58",
> + "chrono",
> + "hex",
> + "indexmap 1.9.3",
> + "indexmap 2.14.0",
> + "schemars 0.9.0",
> + "schemars 1.2.1",
> + "serde_core",
> + "serde_json",
> + "serde_with_macros",
> + "time",
> +]
> +
> +[[package]]
> +name = "serde_with_macros"
> +version = "3.20.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b90c488738ecb4fb0262f41f43bc40efc5868d9fb744319ddf5f5317f417bfac"
> +dependencies = [
> + "darling 0.23.0",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "serial_test"
> +version = "3.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "911bd979bf1070a3f3aa7b691a3b3e9968f339ceeec89e08c280a8a22207a32f"
> +dependencies = [
> + "fslock",
> + "futures-executor",
> + "futures-util",
> + "log",
> + "once_cell",
> + "parking_lot",
> + "scc",
> + "serial_test_derive",
> +]
> +
> +[[package]]
> +name = "serial_test_derive"
> +version = "3.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0a7d91949b85b0d2fb687445e448b40d322b6b3e4af6b44a29b21d9a5f33e6d9"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "sfv"
> +version = "0.14.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0d471eaefb14f4b30032525bdb124b36e55ba9cb1292080e06f1a236cd10fe87"
> +dependencies = [
> + "base64 0.22.1",
> + "indexmap 2.14.0",
> + "ref-cast",
> +]
> +
> +[[package]]
> +name = "sha1"
> +version = "0.10.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
> +dependencies = [
> + "cfg-if",
> + "cpufeatures 0.2.17",
> + "digest 0.10.7",
> +]
> +
> +[[package]]
> +name = "sha1"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "aacc4cc499359472b4abe1bf11d0b12e688af9a805fa5e3016f9a386dc2d0214"
> +dependencies = [
> + "cfg-if",
> + "cpufeatures 0.3.0",
> + "digest 0.11.3",
> +]
> +
> +[[package]]
> +name = "sha2"
> +version = "0.10.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
> +dependencies = [
> + "cfg-if",
> + "cpufeatures 0.2.17",
> + "digest 0.10.7",
> +]
> +
> +[[package]]
> +name = "sha2"
> +version = "0.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4"
> +dependencies = [
> + "cfg-if",
> + "cpufeatures 0.3.0",
> + "digest 0.11.3",
> +]
> +
> +[[package]]
> +name = "sha256"
> +version = "1.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f880fc8562bdeb709793f00eb42a2ad0e672c4f883bbe59122b926eca935c8f6"
> +dependencies = [
> + "async-trait",
> + "bytes",
> + "hex",
> + "sha2 0.10.9",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "shannon"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7ea5b41c9427b56caa7b808cb548a04fb50bb5b9e98590b53f28064ff4174561"
> +dependencies = [
> + "byteorder",
> +]
> +
> +[[package]]
> +name = "sharded-slab"
> +version = "0.1.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
> +dependencies = [
> + "lazy_static",
> +]
> +
> +[[package]]
> +name = "shell-words"
> +version = "1.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dc6fe69c597f9c37bfeeeeeb33da3530379845f10be461a66d16d03eca2ded77"
> +
> +[[package]]
> +name = "shlex"
> +version = "1.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
> +
> +[[package]]
> +name = "signal-hook"
> +version = "0.4.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b2a0c28ca5908dbdbcd52e6fdaa00358ab88637f8ab33e1f188dd510eb44b53d"
> +dependencies = [
> + "libc",
> + "signal-hook-registry",
> +]
> +
> +[[package]]
> +name = "signal-hook-registry"
> +version = "1.4.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
> +dependencies = [
> + "errno",
> + "libc",
> +]
> +
> +[[package]]
> +name = "signalsmith-stretch"
> +version = "0.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "51dae6f10b5532510f65c309c4d868babe3aecf6ce0782678081338311f176fd"
> +dependencies = [
> + "bindgen 0.70.1",
> + "cc",
> + "dasp",
> +]
> +
> +[[package]]
> +name = "signature"
> +version = "1.6.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "74233d3b3b2f6d4b006dc19dee745e73e2a6bfb6f93607cd3b02bd5b00797d7c"
> +dependencies = [
> + "digest 0.10.7",
> + "rand_core 0.6.4",
> +]
> +
> +[[package]]
> +name = "signature"
> +version = "2.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
> +dependencies = [
> + "digest 0.10.7",
> + "rand_core 0.6.4",
> +]
> +
> +[[package]]
> +name = "simd-adler32"
> +version = "0.3.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "703d5c7ef118737c72f1af64ad2f6f8c5e1921f818cdcb97b8fe6fc69bf66214"
> +
> +[[package]]
> +name = "simd_cesu8"
> +version = "1.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "94f90157bb87cddf702797c5dadfa0be7d266cdf49e22da2fcaa32eff75b2c33"
> +dependencies = [
> + "rustc_version",
> + "simdutf8",
> +]
> +
> +[[package]]
> +name = "simd_helpers"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "95890f873bec569a0362c235787f3aca6e1e887302ba4840839bcc6459c42da6"
> +dependencies = [
> + "quote",
> +]
> +
> +[[package]]
> +name = "simdutf8"
> +version = "0.1.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
> +
> +[[package]]
> +name = "siphasher"
> +version = "1.0.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8ee5873ec9cce0195efcb7a4e9507a04cd49aec9c83d0389df45b1ef7ba2e649"
> +
> +[[package]]
> +name = "skia-bindings"
> +version = "0.93.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2359f7e30c9da3f322f8ca3d4ec0abbc12a40035ce758309db0cdab07b5d4476"
> +dependencies = [
> + "bindgen 0.72.1",
> + "cc",
> + "flate2",
> + "heck 0.5.0",
> + "pkg-config",
> + "regex",
> + "serde_json",
> + "tar",
> + "toml 1.1.2+spec-1.1.0",
> +]
> +
> +[[package]]
> +name = "skia-safe"
> +version = "0.93.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7f9e837ea9d531c9efee8f980bfcdb7226b21db0285b0c3171d8be745829f940"
> +dependencies = [
> + "bitflags 2.11.1",
> + "skia-bindings",
> +]
> +
> +[[package]]
> +name = "slab"
> +version = "0.4.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
> +
> +[[package]]
> +name = "slotmap"
> +version = "1.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bdd58c3c93c3d278ca835519292445cb4b0d4dc59ccfdf7ceadaab3f8aeb4038"
> +dependencies = [
> + "version_check",
> +]
> +
> +[[package]]
> +name = "slug"
> +version = "0.1.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "882a80f72ee45de3cc9a5afeb2da0331d58df69e4e7d8eeb5d3c7784ae67e724"
> +dependencies = [
> + "deunicode",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "smallvec"
> +version = "1.15.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
> +
> +[[package]]
> +name = "smawk"
> +version = "0.3.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
> +
> +[[package]]
> +name = "socket2"
> +version = "0.5.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678"
> +dependencies = [
> + "libc",
> + "windows-sys 0.52.0",
> +]
> +
> +[[package]]
> +name = "socket2"
> +version = "0.6.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
> +dependencies = [
> + "libc",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "sodiumoxide"
> +version = "0.2.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e26be3acb6c2d9a7aac28482586a7856436af4cfe7100031d219de2d2ecb0028"
> +dependencies = [
> + "ed25519 1.5.3",
> + "libc",
> + "libsodium-sys",
> + "serde",
> +]
> +
> +[[package]]
> +name = "spin"
> +version = "0.9.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
> +dependencies = [
> + "lock_api",
> +]
> +
> +[[package]]
> +name = "spin"
> +version = "0.10.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d5fe4ccb98d9c292d56fec89a5e07da7fc4cf0dc11e156b41793132775d3e591"
> +dependencies = [
> + "lock_api",
> + "portable-atomic",
> +]
> +
> +[[package]]
> +name = "spinning_top"
> +version = "0.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d96d2d1d716fb500937168cc09353ffdc7a012be8475ac7308e1bdf0e3923300"
> +dependencies = [
> + "lock_api",
> +]
> +
> +[[package]]
> +name = "spirv"
> +version = "0.3.0+sdk-1.3.268.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "eda41003dc44290527a59b13432d4a0379379fa074b70174882adfbdfd917844"
> +dependencies = [
> + "bitflags 2.11.1",
> +]
> +
> +[[package]]
> +name = "spki"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "67cf02bbac7a337dc36e4f5a693db6c21e7863f45070f7064577eb4367a3212b"
> +dependencies = [
> + "base64ct",
> + "der 0.6.1",
> +]
> +
> +[[package]]
> +name = "spki"
> +version = "0.7.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
> +dependencies = [
> + "base64ct",
> + "der 0.7.10",
> +]
> +
> +[[package]]
> +name = "sprintf"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b0e59842c3aac5c7901ea11bbb02e60e5d67263b43d4361dec9303cca8e764eb"
> +dependencies = [
> + "thiserror 2.0.18",
> +]
> +
> +[[package]]
> +name = "stable-vec"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6dac7bc0f7d0d44329b200020effbc25a534d89fa142af95e3ddf76113412a5e"
> +
> +[[package]]
> +name = "stable_deref_trait"
> +version = "1.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
> +
> +[[package]]
> +name = "static_assertions"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> +
> +[[package]]
> +name = "strength_reduce"
> +version = "0.2.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fe895eb47f22e2ddd4dabc02bce419d2e643c8e3b585c78158b349195bc24d82"
> +
> +[[package]]
> +name = "strsim"
> +version = "0.11.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
> +
> +[[package]]
> +name = "subtle"
> +version = "2.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
> +
> +[[package]]
> +name = "symphonia"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5773a4c030a19d9bfaa090f49746ff35c75dfddfa700df7a5939d5e076a57039"
> +dependencies = [
> + "lazy_static",
> + "symphonia-bundle-flac",
> + "symphonia-bundle-mp3",
> + "symphonia-codec-vorbis",
> + "symphonia-core",
> + "symphonia-format-ogg",
> + "symphonia-metadata",
> +]
> +
> +[[package]]
> +name = "symphonia-bundle-flac"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c91565e180aea25d9b80a910c546802526ffd0072d0b8974e3ebe59b686c9976"
> +dependencies = [
> + "log",
> + "symphonia-core",
> + "symphonia-metadata",
> + "symphonia-utils-xiph",
> +]
> +
> +[[package]]
> +name = "symphonia-bundle-mp3"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4872dd6bb56bf5eac799e3e957aa1981086c3e613b27e0ac23b176054f7c57ed"
> +dependencies = [
> + "lazy_static",
> + "log",
> + "symphonia-core",
> + "symphonia-metadata",
> +]
> +
> +[[package]]
> +name = "symphonia-codec-vorbis"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f025837c309cd69ffef572750b4a2257b59552c5399a5e49707cc5b1b85d1c73"
> +dependencies = [
> + "log",
> + "symphonia-core",
> + "symphonia-utils-xiph",
> +]
> +
> +[[package]]
> +name = "symphonia-core"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ea00cc4f79b7f6bb7ff87eddc065a1066f3a43fe1875979056672c9ef948c2af"
> +dependencies = [
> + "arrayvec",
> + "bitflags 1.3.2",
> + "bytemuck",
> + "lazy_static",
> + "log",
> +]
> +
> +[[package]]
> +name = "symphonia-format-ogg"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2b4955c67c1ed3aa8ae8428d04ca8397fbef6a19b2b051e73b5da8b1435639cb"
> +dependencies = [
> + "log",
> + "symphonia-core",
> + "symphonia-metadata",
> + "symphonia-utils-xiph",
> +]
> +
> +[[package]]
> +name = "symphonia-metadata"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "36306ff42b9ffe6e5afc99d49e121e0bd62fe79b9db7b9681d48e29fa19e6b16"
> +dependencies = [
> + "encoding_rs",
> + "lazy_static",
> + "log",
> + "symphonia-core",
> +]
> +
> +[[package]]
> +name = "symphonia-utils-xiph"
> +version = "0.5.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ee27c85ab799a338446b68eec77abf42e1a6f1bb490656e121c6e27bfbab9f16"
> +dependencies = [
> + "symphonia-core",
> + "symphonia-metadata",
> +]
> +
> +[[package]]
> +name = "syn"
> +version = "1.0.109"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "unicode-ident",
> +]
> +
> +[[package]]
> +name = "syn"
> +version = "2.0.117"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "unicode-ident",
> +]
> +
> +[[package]]
> +name = "sync_wrapper"
> +version = "1.0.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263"
> +dependencies = [
> + "futures-core",
> +]
> +
> +[[package]]
> +name = "synstructure"
> +version = "0.13.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "sysinfo"
> +version = "0.36.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "252800745060e7b9ffb7b2badbd8b31cfa4aa2e61af879d0a3bf2a317c20217d"
> +dependencies = [
> + "libc",
> + "memchr",
> + "ntapi",
> + "objc2-core-foundation",
> + "objc2-io-kit",
> + "windows 0.61.3",
> +]
> +
> +[[package]]
> +name = "system-configuration"
> +version = "0.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a13f3d0daba03132c0aa9767f98351b3488edc2c100cda2d2ec2b04f3d8d3c8b"
> +dependencies = [
> + "bitflags 2.11.1",
> + "core-foundation 0.9.4",
> + "system-configuration-sys",
> +]
> +
> +[[package]]
> +name = "system-configuration-sys"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4"
> +dependencies = [
> + "core-foundation-sys",
> + "libc",
> +]
> +
> +[[package]]
> +name = "system-deps"
> +version = "7.0.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "396a35feb67335377e0251fcbc1092fc85c484bd4e3a7a54319399da127796e7"
> +dependencies = [
> + "cfg-expr",
> + "heck 0.5.0",
> + "pkg-config",
> + "toml 1.1.2+spec-1.1.0",
> + "version-compare",
> +]
> +
> +[[package]]
> +name = "tar"
> +version = "0.4.45"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "22692a6476a21fa75fdfc11d452fda482af402c008cdbaf3476414e122040973"
> +dependencies = [
> + "filetime",
> + "libc",
> + "xattr",
> +]
> +
> +[[package]]
> +name = "target-lexicon"
> +version = "0.12.16"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
> +
> +[[package]]
> +name = "target-lexicon"
> +version = "0.13.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
> +
> +[[package]]
> +name = "tempfile"
> +version = "3.27.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
> +dependencies = [
> + "fastrand",
> + "getrandom 0.4.2",
> + "once_cell",
> + "rustix 1.1.4",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "termcolor"
> +version = "1.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
> +dependencies = [
> + "winapi-util",
> +]
> +
> +[[package]]
> +name = "test-log"
> +version = "0.2.20"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2f46bf474f0a4afebf92f076d54fd5e63423d9438b8c278a3d2ccb0f47f7cdb3"
> +dependencies = [
> + "test-log-macros",
> + "tracing-subscriber",
> +]
> +
> +[[package]]
> +name = "test-log-core"
> +version = "0.2.20"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "37d4d41320b48bc4a211a9021678fcc0c99569b594ea31c93735b8e517102b4c"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "test-log-macros"
> +version = "0.2.20"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9beb9249a81e430dffd42400a49019bcf548444f1968ff23080a625de0d4d320"
> +dependencies = [
> + "syn 2.0.117",
> + "test-log-core",
> +]
> +
> +[[package]]
> +name = "test-with"
> +version = "0.16.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3c292571fb159e65c78c7c88a96e5ddfc326d6819e49b3a040d7b0aa3497925b"
> +dependencies = [
> + "test-with-derive",
> +]
> +
> +[[package]]
> +name = "test-with-derive"
> +version = "0.16.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "01b95b557b54c0d50b04688ab86aaeaf16f201a0341936f3bfa19497dee081bd"
> +dependencies = [
> + "proc-macro-error2",
> + "proc-macro2",
> + "quote",
> + "regex",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "text_placeholder"
> +version = "0.5.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dd5008f74a09742486ef0047596cf35df2b914e2a8dca5727fcb6ba6842a766b"
> +dependencies = [
> + "hashbrown 0.13.2",
> + "serde",
> + "serde_json",
> +]
> +
> +[[package]]
> +name = "textdistance"
> +version = "1.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "aa672c55ab69f787dbc9126cc387dbe57fdd595f585e4524cf89018fa44ab819"
> +
> +[[package]]
> +name = "textwrap"
> +version = "0.16.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
> +dependencies = [
> + "hyphenation",
> + "smawk",
> + "unicode-linebreak",
> + "unicode-width",
> +]
> +
> +[[package]]
> +name = "thiserror"
> +version = "1.0.69"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
> +dependencies = [
> + "thiserror-impl 1.0.69",
> +]
> +
> +[[package]]
> +name = "thiserror"
> +version = "2.0.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
> +dependencies = [
> + "thiserror-impl 2.0.18",
> +]
> +
> +[[package]]
> +name = "thiserror-impl"
> +version = "1.0.69"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "thiserror-impl"
> +version = "2.0.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "thread_local"
> +version = "1.1.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
> +dependencies = [
> + "cfg-if",
> +]
> +
> +[[package]]
> +name = "time"
> +version = "0.3.47"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
> +dependencies = [
> + "deranged",
> + "itoa",
> + "js-sys",
> + "libc",
> + "num-conv",
> + "num_threads",
> + "powerfmt",
> + "serde_core",
> + "time-core",
> + "time-macros",
> +]
> +
> +[[package]]
> +name = "time-core"
> +version = "0.1.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
> +
> +[[package]]
> +name = "time-macros"
> +version = "0.2.27"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
> +dependencies = [
> + "num-conv",
> + "time-core",
> +]
> +
> +[[package]]
> +name = "tiny-keccak"
> +version = "2.0.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
> +dependencies = [
> + "crunchy",
> +]
> +
> +[[package]]
> +name = "tinystr"
> +version = "0.8.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c8323304221c2a851516f22236c5722a72eaa19749016521d6dff0824447d96d"
> +dependencies = [
> + "displaydoc",
> + "serde_core",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "tinyvec"
> +version = "1.11.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
> +dependencies = [
> + "tinyvec_macros",
> +]
> +
> +[[package]]
> +name = "tinyvec_macros"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> +
> +[[package]]
> +name = "tokio"
> +version = "1.52.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8fc7f01b389ac15039e4dc9531aa973a135d7a4135281b12d7c1bc79fd57fffe"
> +dependencies = [
> + "bytes",
> + "libc",
> + "mio",
> + "parking_lot",
> + "pin-project-lite",
> + "signal-hook-registry",
> + "socket2 0.6.3",
> + "tokio-macros",
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "tokio-macros"
> +version = "2.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "tokio-rustls"
> +version = "0.24.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c28327cf380ac148141087fbfb9de9d7bd4e84ab5d2c28fbc911d753de8a7081"
> +dependencies = [
> + "rustls 0.21.12",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "tokio-rustls"
> +version = "0.25.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "775e0c0f0adb3a2f22a00c4745d728b479985fc15ee7ca6a2608388c5569860f"
> +dependencies = [
> + "rustls 0.22.4",
> + "rustls-pki-types",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "tokio-rustls"
> +version = "0.26.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1729aa945f29d91ba541258c8df89027d5792d85a8841fb65e8bf0f4ede4ef61"
> +dependencies = [
> + "rustls 0.23.40",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "tokio-stream"
> +version = "0.1.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70"
> +dependencies = [
> + "futures-core",
> + "pin-project-lite",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "tokio-tungstenite"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "212d5dcb2a1ce06d81107c3d0ffa3121fe974b73f068c8282cb1c32328113b6c"
> +dependencies = [
> + "futures-util",
> + "log",
> + "rustls 0.21.12",
> + "rustls-native-certs 0.6.3",
> + "tokio",
> + "tokio-rustls 0.24.1",
> + "tungstenite 0.20.1",
> +]
> +
> +[[package]]
> +name = "tokio-tungstenite"
> +version = "0.27.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "489a59b6730eda1b0171fcfda8b121f4bee2b35cba8645ca35c5f7ba3eb736c1"
> +dependencies = [
> + "futures-util",
> + "log",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tungstenite 0.27.0",
> + "webpki-roots 0.26.11",
> +]
> +
> +[[package]]
> +name = "tokio-tungstenite"
> +version = "0.28.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d25a406cddcc431a75d3d9afc6a7c0f7428d4891dd973e4d54c56b46127bf857"
> +dependencies = [
> + "futures-util",
> + "log",
> + "rustls 0.23.40",
> + "rustls-native-certs 0.8.3",
> + "rustls-pki-types",
> + "tokio",
> + "tokio-rustls 0.26.4",
> + "tungstenite 0.28.0",
> +]
> +
> +[[package]]
> +name = "tokio-util"
> +version = "0.7.18"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
> +dependencies = [
> + "bytes",
> + "futures-core",
> + "futures-sink",
> + "pin-project-lite",
> + "tokio",
> +]
> +
> +[[package]]
> +name = "toml"
> +version = "0.9.12+spec-1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cf92845e79fc2e2def6a5d828f0801e29a2f8acc037becc5ab08595c7d5e9863"
> +dependencies = [
> + "indexmap 2.14.0",
> + "serde_core",
> + "serde_spanned",
> + "toml_datetime 0.7.5+spec-1.1.0",
> + "toml_parser",
> + "toml_writer",
> + "winnow 0.7.15",
> +]
> +
> +[[package]]
> +name = "toml"
> +version = "1.1.2+spec-1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
> +dependencies = [
> + "indexmap 2.14.0",
> + "serde_core",
> + "serde_spanned",
> + "toml_datetime 1.1.1+spec-1.1.0",
> + "toml_parser",
> + "toml_writer",
> + "winnow 1.0.2",
> +]
> +
> +[[package]]
> +name = "toml_datetime"
> +version = "0.7.5+spec-1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
> +dependencies = [
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "toml_datetime"
> +version = "1.1.1+spec-1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
> +dependencies = [
> + "serde_core",
> +]
> +
> +[[package]]
> +name = "toml_edit"
> +version = "0.25.11+spec-1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0b59c4d22ed448339746c59b905d24568fcbb3ab65a500494f7b8c3e97739f2b"
> +dependencies = [
> + "indexmap 2.14.0",
> + "toml_datetime 1.1.1+spec-1.1.0",
> + "toml_parser",
> + "winnow 1.0.2",
> +]
> +
> +[[package]]
> +name = "toml_parser"
> +version = "1.1.2+spec-1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
> +dependencies = [
> + "winnow 1.0.2",
> +]
> +
> +[[package]]
> +name = "toml_writer"
> +version = "1.1.1+spec-1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
> +
> +[[package]]
> +name = "tower"
> +version = "0.5.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ebe5ef63511595f1344e2d5cfa636d973292adc0eec1f0ad45fae9f0851ab1d4"
> +dependencies = [
> + "futures-core",
> + "futures-util",
> + "pin-project-lite",
> + "sync_wrapper",
> + "tokio",
> + "tower-layer",
> + "tower-service",
> +]
> +
> +[[package]]
> +name = "tower-http"
> +version = "0.6.10"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "68d6fdd9f81c2819c9a8b0e0cd91660e7746a8e6ea2ba7c6b2b057985f6bcb51"
> +dependencies = [
> + "async-compression",
> + "bitflags 2.11.1",
> + "bytes",
> + "futures-core",
> + "futures-util",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "http-body-util",
> + "pin-project-lite",
> + "tokio",
> + "tokio-util",
> + "tower",
> + "tower-layer",
> + "tower-service",
> + "url",
> +]
> +
> +[[package]]
> +name = "tower-layer"
> +version = "0.3.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e"
> +
> +[[package]]
> +name = "tower-service"
> +version = "0.3.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3"
> +
> +[[package]]
> +name = "tracel-ash"
> +version = "0.38.0+1.3.296"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7318626319ea7b43d20b9c374f273b1b25600b8d8ddd103e209751f67fee67ad"
> +dependencies = [
> + "ash",
> + "c2rust-bitfields",
> +]
> +
> +[[package]]
> +name = "tracel-llvm"
> +version = "20.1.4-7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "982535db9eb1a30ac0f2c50239a0eec3e5cf50993a88e92b04747bd2f4d365b2"
> +dependencies = [
> + "tracel-mlir-rs",
> + "tracel-mlir-sys",
> +]
> +
> +[[package]]
> +name = "tracel-llvm-bundler"
> +version = "20.1.4-7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3c75b8e477cb8d49d907afab029ca74d48459f5b88c27bdb4c6cd6acb5e61977"
> +dependencies = [
> + "anyhow",
> + "bytes",
> + "constcat",
> + "dirs",
> + "liblzma",
> + "regex",
> + "reqwest",
> + "serde",
> + "serde_json",
> + "sha2 0.10.9",
> + "tar",
> + "walkdir",
> +]
> +
> +[[package]]
> +name = "tracel-mlir-rs"
> +version = "20.1.4-7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "77a478a35efd68d0ba73f747adfb7923b121c64e7f5be9cd8364ca1dcb772d5c"
> +dependencies = [
> + "tracel-mlir-rs-macros",
> + "tracel-mlir-sys",
> +]
> +
> +[[package]]
> +name = "tracel-mlir-rs-macros"
> +version = "20.1.4-7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7a94f36868c3b10b1825945223d99d106c73f4d249f063caa4651deeb9379344"
> +dependencies = [
> + "comrak",
> + "convert_case 0.8.0",
> + "proc-macro2",
> + "quote",
> + "regex",
> + "syn 2.0.117",
> + "tracel-llvm-bundler",
> + "tracel-tblgen-rs",
> + "unindent",
> +]
> +
> +[[package]]
> +name = "tracel-mlir-sys"
> +version = "20.1.4-7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "02f26d31af0c225a6d2e3d65d012fd6de848c9fc776897b152ee83b7d1bd15c4"
> +dependencies = [
> + "tracel-llvm-bundler",
> +]
> +
> +[[package]]
> +name = "tracel-rspirv"
> +version = "0.12.1+sdk-1.4.341.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1653aa21b867351f48c51f1063a2f872f8e82931951cae469d8a53aa4d7d72e8"
> +dependencies = [
> + "bitflags 2.11.1",
> + "rustc-hash 2.1.2",
> +]
> +
> +[[package]]
> +name = "tracel-tblgen-rs"
> +version = "20.1.4-7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "00d2581070380418ccc33b500f3739e4d4869421fdb477fcea51ff97c6253a52"
> +dependencies = [
> + "bindgen 0.71.1",
> + "cc",
> + "paste",
> + "thiserror 2.0.18",
> + "tracel-llvm-bundler",
> +]
> +
> +[[package]]
> +name = "tracing"
> +version = "0.1.44"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
> +dependencies = [
> + "log",
> + "pin-project-lite",
> + "tracing-attributes",
> + "tracing-core",
> +]
> +
> +[[package]]
> +name = "tracing-attributes"
> +version = "0.1.31"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "tracing-core"
> +version = "0.1.36"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
> +dependencies = [
> + "once_cell",
> + "valuable",
> +]
> +
> +[[package]]
> +name = "tracing-log"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
> +dependencies = [
> + "log",
> + "once_cell",
> + "tracing-core",
> +]
> +
> +[[package]]
> +name = "tracing-subscriber"
> +version = "0.3.23"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cb7f578e5945fb242538965c2d0b04418d38ec25c79d160cd279bf0731c8d319"
> +dependencies = [
> + "matchers",
> + "nu-ansi-term",
> + "once_cell",
> + "regex-automata",
> + "sharded-slab",
> + "smallvec",
> + "thread_local",
> + "tracing",
> + "tracing-core",
> + "tracing-log",
> +]
> +
> +[[package]]
> +name = "transpose"
> +version = "0.2.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1ad61aed86bc3faea4300c7aee358b4c6d0c8d6ccc36524c96e4c92ccf26e77e"
> +dependencies = [
> + "num-integer",
> + "strength_reduce",
> +]
> +
> +[[package]]
> +name = "try-lock"
> +version = "0.2.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
> +
> +[[package]]
> +name = "tungstenite"
> +version = "0.20.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9e3dac10fd62eaf6617d3a904ae222845979aec67c615d1c842b4002c7666fb9"
> +dependencies = [
> + "byteorder",
> + "bytes",
> + "data-encoding",
> + "http 0.2.12",
> + "httparse",
> + "log",
> + "rand 0.8.6",
> + "rustls 0.21.12",
> + "sha1 0.10.6",
> + "thiserror 1.0.69",
> + "url",
> + "utf-8",
> +]
> +
> +[[package]]
> +name = "tungstenite"
> +version = "0.27.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "eadc29d668c91fcc564941132e17b28a7ceb2f3ebf0b9dae3e03fd7a6748eb0d"
> +dependencies = [
> + "bytes",
> + "data-encoding",
> + "http 1.4.0",
> + "httparse",
> + "log",
> + "rand 0.9.4",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "sha1 0.10.6",
> + "thiserror 2.0.18",
> + "utf-8",
> +]
> +
> +[[package]]
> +name = "tungstenite"
> +version = "0.28.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8628dcc84e5a09eb3d8423d6cb682965dea9133204e8fb3efee74c2a0c259442"
> +dependencies = [
> + "bytes",
> + "data-encoding",
> + "http 1.4.0",
> + "httparse",
> + "log",
> + "rand 0.9.4",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "sha1 0.10.6",
> + "thiserror 2.0.18",
> + "utf-8",
> +]
> +
> +[[package]]
> +name = "tungstenite"
> +version = "0.29.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6c01152af293afb9c7c2a57e4b559c5620b421f6d133261c60dd2d0cdb38e6b8"
> +dependencies = [
> + "bytes",
> + "data-encoding",
> + "http 1.4.0",
> + "httparse",
> + "log",
> + "rand 0.9.4",
> + "rustls 0.23.40",
> + "rustls-pki-types",
> + "sha1 0.10.6",
> + "thiserror 2.0.18",
> + "url",
> +]
> +
> +[[package]]
> +name = "type-map"
> +version = "0.5.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cb30dbbd9036155e74adad6812e9898d03ec374946234fbcebd5dfc7b9187b90"
> +dependencies = [
> + "rustc-hash 2.1.2",
> +]
> +
> +[[package]]
> +name = "typed-arena"
> +version = "2.0.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6af6ae20167a9ece4bcb41af5b80f8a1f1df981f6391189ce00fd257af04126a"
> +
> +[[package]]
> +name = "typed-path"
> +version = "0.12.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
> +
> +[[package]]
> +name = "typenum"
> +version = "1.20.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "40ce102ab67701b8526c123c1bab5cbe42d7040ccfd0f64af1a385808d2f43de"
> +
> +[[package]]
> +name = "unicase"
> +version = "2.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142"
> +
> +[[package]]
> +name = "unicode-ident"
> +version = "1.0.24"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
> +
> +[[package]]
> +name = "unicode-linebreak"
> +version = "0.1.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
> +
> +[[package]]
> +name = "unicode-normalization"
> +version = "0.1.25"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8"
> +dependencies = [
> + "tinyvec",
> +]
> +
> +[[package]]
> +name = "unicode-segmentation"
> +version = "1.13.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9629274872b2bfaf8d66f5f15725007f635594914870f65218920345aa11aa8c"
> +
> +[[package]]
> +name = "unicode-width"
> +version = "0.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
> +
> +[[package]]
> +name = "unicode-xid"
> +version = "0.2.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
> +
> +[[package]]
> +name = "unicode_categories"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "39ec24b3121d976906ece63c9daad25b85969647682eee313cb5779fdd69e14e"
> +
> +[[package]]
> +name = "unindent"
> +version = "0.2.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
> +
> +[[package]]
> +name = "unit-prefix"
> +version = "0.5.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "81e544489bf3d8ef66c953931f56617f423cd4b5494be343d9b9d3dda037b9a3"
> +
> +[[package]]
> +name = "untrusted"
> +version = "0.9.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
> +
> +[[package]]
> +name = "unty"
> +version = "0.0.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6d49784317cd0d1ee7ec5c716dd598ec5b4483ea832a2dced265471cc0f690ae"
> +
> +[[package]]
> +name = "url"
> +version = "2.5.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
> +dependencies = [
> + "form_urlencoded",
> + "idna",
> + "percent-encoding",
> + "serde",
> + "serde_derive",
> +]
> +
> +[[package]]
> +name = "url-escape"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "44e0ce4d1246d075ca5abec4b41d33e87a6054d08e2366b63205665e950db218"
> +dependencies = [
> + "percent-encoding",
> +]
> +
> +[[package]]
> +name = "urlencoding"
> +version = "2.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "daf8dba3b7eb870caf1ddeed7bc9d2a049f3cfdfae7cb521b087cc33ae4c49da"
> +
> +[[package]]
> +name = "utf-8"
> +version = "0.7.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429ad062dc7b7ddd036a9"
> +
> +[[package]]
> +name = "utf8_iter"
> +version = "1.0.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
> +
> +[[package]]
> +name = "utf8parse"
> +version = "0.2.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
> +
> +[[package]]
> +name = "uuid"
> +version = "1.23.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76"
> +dependencies = [
> + "getrandom 0.4.2",
> + "js-sys",
> + "serde_core",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "v_frame"
> +version = "0.3.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "666b7727c8875d6ab5db9533418d7c764233ac9c0cff1d469aec8fa127597be2"
> +dependencies = [
> + "aligned-vec",
> + "num-traits",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "va_list"
> +version = "0.1.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "350bd5ef744f978a387cd08ce514be4e3766746496f355d59d68af36f52d36da"
> +
> +[[package]]
> +name = "valuable"
> +version = "0.1.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
> +
> +[[package]]
> +name = "variadics_please"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "41b6d82be61465f97d42bd1d15bf20f3b0a3a0905018f38f9d6f6962055b0b5c"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "vcpkg"
> +version = "0.2.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
> +
> +[[package]]
> +name = "vergen"
> +version = "9.0.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6b2bf58be11fc9414104c6d3a2e464163db5ef74b12296bda593cac37b6e4777"
> +dependencies = [
> + "anyhow",
> + "derive_builder",
> + "rustversion",
> + "time",
> + "vergen-lib",
> +]
> +
> +[[package]]
> +name = "vergen-gitcl"
> +version = "1.0.8"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b9dfc1de6eb2e08a4ddf152f1b179529638bedc0ea95e6d667c014506377aefe"
> +dependencies = [
> + "anyhow",
> + "derive_builder",
> + "rustversion",
> + "time",
> + "vergen",
> + "vergen-lib",
> +]
> +
> +[[package]]
> +name = "vergen-lib"
> +version = "0.1.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9b07e6010c0f3e59fcb164e0163834597da68d1f864e2b8ca49f74de01e9c166"
> +dependencies = [
> + "anyhow",
> + "derive_builder",
> + "rustversion",
> +]
> +
> +[[package]]
> +name = "version-compare"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "03c2856837ef78f57382f06b2b8563a2f512f7185d732608fd9176cb3b8edf0e"
> +
> +[[package]]
> +name = "version_check"
> +version = "0.9.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
> +
> +[[package]]
> +name = "void"
> +version = "1.0.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6a02e4885ed3bc0f2de90ea6dd45ebcbb66dacffe03547fadbb0eeae2770887d"
> +
> +[[package]]
> +name = "vsimd"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5c3082ca00d5a5ef149bb8b555a72ae84c9c59f7250f013ac822ac2e49b19c64"
> +
> +[[package]]
> +name = "vvdec"
> +version = "0.6.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "689743f6dc5c608197123319f088d73d3048a9e5d93682b95b8a347243975cb0"
> +dependencies = [
> + "thiserror 2.0.18",
> + "vvdec-sys",
> +]
> +
> +[[package]]
> +name = "vvdec-sys"
> +version = "0.7.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "18df9e7fd48eb13204c547ccd570774b701981878489779c9a427ee97579f24d"
> +dependencies = [
> + "bindgen 0.71.1",
> + "cmake",
> + "system-deps",
> +]
> +
> +[[package]]
> +name = "waker-fn"
> +version = "1.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "317211a0dc0ceedd78fb2ca9a44aed3d7b9b26f81870d485c07122b4350673b7"
> +
> +[[package]]
> +name = "walkdir"
> +version = "2.5.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
> +dependencies = [
> + "same-file",
> + "winapi-util",
> +]
> +
> +[[package]]
> +name = "want"
> +version = "0.3.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e"
> +dependencies = [
> + "try-lock",
> +]
> +
> +[[package]]
> +name = "warp"
> +version = "0.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c0a808122a8a77eecdabaefd88ddb1913c4be5ea1465399f63ba64c7aa705fea"
> +dependencies = [
> + "bytes",
> + "futures-util",
> + "headers",
> + "http 1.4.0",
> + "http-body 1.0.1",
> + "http-body-util",
> + "hyper 1.9.0",
> + "hyper-util",
> + "log",
> + "mime",
> + "mime_guess",
> + "percent-encoding",
> + "pin-project",
> + "scoped-tls",
> + "serde",
> + "serde_json",
> + "serde_urlencoded",
> + "tokio",
> + "tokio-util",
> + "tower-service",
> + "tracing",
> +]
> +
> +[[package]]
> +name = "wasi"
> +version = "0.11.1+wasi-snapshot-preview1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
> +
> +[[package]]
> +name = "wasip2"
> +version = "1.0.3+wasi-0.2.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "20064672db26d7cdc89c7798c48a0fdfac8213434a1186e5ef29fd560ae223d6"
> +dependencies = [
> + "wit-bindgen 0.57.1",
> +]
> +
> +[[package]]
> +name = "wasip3"
> +version = "0.4.0+wasi-0.3.0-rc-2026-01-06"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
> +dependencies = [
> + "wit-bindgen 0.51.0",
> +]
> +
> +[[package]]
> +name = "wasm-bindgen"
> +version = "0.2.121"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "49ace1d07c165b0864824eee619580c4689389afa9dc9ed3a4c75040d82e6790"
> +dependencies = [
> + "cfg-if",
> + "once_cell",
> + "rustversion",
> + "wasm-bindgen-macro",
> + "wasm-bindgen-shared",
> +]
> +
> +[[package]]
> +name = "wasm-bindgen-futures"
> +version = "0.4.71"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "96492d0d3ffba25305a7dc88720d250b1401d7edca02cc3bcd50633b424673b8"
> +dependencies = [
> + "js-sys",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "wasm-bindgen-macro"
> +version = "0.2.121"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8e68e6f4afd367a562002c05637acb8578ff2dea1943df76afb9e83d177c8578"
> +dependencies = [
> + "quote",
> + "wasm-bindgen-macro-support",
> +]
> +
> +[[package]]
> +name = "wasm-bindgen-macro-support"
> +version = "0.2.121"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d95a9ec35c64b2a7cb35d3fead40c4238d0940c86d107136999567a4703259f2"
> +dependencies = [
> + "bumpalo",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> + "wasm-bindgen-shared",
> +]
> +
> +[[package]]
> +name = "wasm-bindgen-shared"
> +version = "0.2.121"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c4e0100b01e9f0d03189a92b96772a1fb998639d981193d7dbab487302513441"
> +dependencies = [
> + "unicode-ident",
> +]
> +
> +[[package]]
> +name = "wasm-encoder"
> +version = "0.244.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
> +dependencies = [
> + "leb128fmt",
> + "wasmparser",
> +]
> +
> +[[package]]
> +name = "wasm-metadata"
> +version = "0.244.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
> +dependencies = [
> + "anyhow",
> + "indexmap 2.14.0",
> + "wasm-encoder",
> + "wasmparser",
> +]
> +
> +[[package]]
> +name = "wasm-streams"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "15053d8d85c7eccdbefef60f06769760a563c7f0a9d6902a13d35c7800b0ad65"
> +dependencies = [
> + "futures-util",
> + "js-sys",
> + "wasm-bindgen",
> + "wasm-bindgen-futures",
> + "web-sys",
> +]
> +
> +[[package]]
> +name = "wasmparser"
> +version = "0.244.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
> +dependencies = [
> + "bitflags 2.11.1",
> + "hashbrown 0.15.5",
> + "indexmap 2.14.0",
> + "semver",
> +]
> +
> +[[package]]
> +name = "web-sys"
> +version = "0.3.98"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4b572dff8bcf38bad0fa19729c89bb5748b2b9b1d8be70cf90df697e3a8f32aa"
> +dependencies = [
> + "js-sys",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "web-time"
> +version = "1.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
> +dependencies = [
> + "js-sys",
> + "wasm-bindgen",
> +]
> +
> +[[package]]
> +name = "web-transport-proto"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0225d295c8ac00a2e9a498aefeaf3f3c6186da12a251c938189b15b82ea22808"
> +dependencies = [
> + "bytes",
> + "http 1.4.0",
> + "sfv",
> + "thiserror 2.0.18",
> + "tokio",
> + "url",
> +]
> +
> +[[package]]
> +name = "web-transport-quinn"
> +version = "0.11.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cac11b6caf163be7f980442a26fcba15e8074a5f22e85fbb71f0f77d11cecf60"
> +dependencies = [
> + "bytes",
> + "futures",
> + "http 1.4.0",
> + "quinn",
> + "rustls 0.23.40",
> + "rustls-native-certs 0.8.3",
> + "thiserror 2.0.18",
> + "tokio",
> + "tracing",
> + "url",
> + "web-transport-proto",
> + "web-transport-trait",
> +]
> +
> +[[package]]
> +name = "web-transport-trait"
> +version = "0.3.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cb67841c4a481ca3c1412ee4c9f463987401991e1ddc000903df2124f3dc85e9"
> +dependencies = [
> + "bytes",
> +]
> +
> +[[package]]
> +name = "webm-iterable"
> +version = "0.6.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cd9fbf173b4b38f2f8bbb0082a0d4cb21f263a70811f5fccb1663c421c66d9f9"
> +dependencies = [
> + "ebml-iterable",
> +]
> +
> +[[package]]
> +name = "webpki"
> +version = "0.22.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ed63aea5ce73d0ff405984102c42de94fc55a6b75765d621c65262469b3c9b53"
> +dependencies = [
> + "ring",
> + "untrusted",
> +]
> +
> +[[package]]
> +name = "webpki-root-certs"
> +version = "1.0.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f31141ce3fc3e300ae89b78c0dd67f9708061d1d2eda54b8209346fd6be9a92c"
> +dependencies = [
> + "rustls-pki-types",
> +]
> +
> +[[package]]
> +name = "webpki-roots"
> +version = "0.26.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "521bc38abb08001b01866da9f51eb7c5d647a19260e00054a8c7fd5f9e57f7a9"
> +dependencies = [
> + "webpki-roots 1.0.7",
> +]
> +
> +[[package]]
> +name = "webpki-roots"
> +version = "1.0.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "52f5ee44c96cf55f1b349600768e3ece3a8f26010c05265ab73f945bb1a2eb9d"
> +dependencies = [
> + "rustls-pki-types",
> +]
> +
> +[[package]]
> +name = "weezl"
> +version = "0.1.12"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a28ac98ddc8b9274cb41bb4d9d4d5c425b6020c50c46f25559911905610b4a88"
> +
> +[[package]]
> +name = "wgpu"
> +version = "26.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "70b6ff82bbf6e9206828e1a3178e851f8c20f1c9028e74dd3a8090741ccd5798"
> +dependencies = [
> + "arrayvec",
> + "bitflags 2.11.1",
> + "cfg-if",
> + "cfg_aliases",
> + "document-features",
> + "hashbrown 0.15.5",
> + "js-sys",
> + "log",
> + "naga",
> + "parking_lot",
> + "portable-atomic",
> + "profiling",
> + "raw-window-handle",
> + "smallvec",
> + "static_assertions",
> + "wasm-bindgen",
> + "wasm-bindgen-futures",
> + "web-sys",
> + "wgpu-core",
> + "wgpu-hal",
> + "wgpu-types",
> +]
> +
> +[[package]]
> +name = "wgpu-core"
> +version = "26.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d5f62f1053bd28c2268f42916f31588f81f64796e2ff91b81293515017ca8bd9"
> +dependencies = [
> + "arrayvec",
> + "bit-set",
> + "bit-vec 0.8.0",
> + "bitflags 2.11.1",
> + "cfg_aliases",
> + "document-features",
> + "hashbrown 0.15.5",
> + "indexmap 2.14.0",
> + "log",
> + "naga",
> + "once_cell",
> + "parking_lot",
> + "portable-atomic",
> + "profiling",
> + "raw-window-handle",
> + "rustc-hash 1.1.0",
> + "smallvec",
> + "thiserror 2.0.18",
> + "wgpu-core-deps-apple",
> + "wgpu-core-deps-emscripten",
> + "wgpu-core-deps-windows-linux-android",
> + "wgpu-hal",
> + "wgpu-types",
> +]
> +
> +[[package]]
> +name = "wgpu-core-deps-apple"
> +version = "26.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "18ae5fbde6a4cbebae38358aa73fcd6e0f15c6144b67ef5dc91ded0db125dbdf"
> +dependencies = [
> + "wgpu-hal",
> +]
> +
> +[[package]]
> +name = "wgpu-core-deps-emscripten"
> +version = "26.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d7670e390f416006f746b4600fdd9136455e3627f5bd763abf9a65daa216dd2d"
> +dependencies = [
> + "wgpu-hal",
> +]
> +
> +[[package]]
> +name = "wgpu-core-deps-windows-linux-android"
> +version = "26.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "720a5cb9d12b3d337c15ff0e24d3e97ed11490ff3f7506e7f3d98c68fa5d6f14"
> +dependencies = [
> + "wgpu-hal",
> +]
> +
> +[[package]]
> +name = "wgpu-hal"
> +version = "26.0.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a8d0e67224cc7305b3b4eb2cc57ca4c4c3afc665c1d1bee162ea806e19c47bdd"
> +dependencies = [
> + "android_system_properties",
> + "arrayvec",
> + "ash",
> + "bit-set",
> + "bitflags 2.11.1",
> + "block",
> + "bytemuck",
> + "cfg-if",
> + "cfg_aliases",
> + "core-graphics-types",
> + "glow",
> + "glutin_wgl_sys",
> + "gpu-alloc",
> + "gpu-allocator",
> + "gpu-descriptor",
> + "hashbrown 0.15.5",
> + "js-sys",
> + "khronos-egl",
> + "libc",
> + "libloading 0.8.9",
> + "log",
> + "metal",
> + "naga",
> + "ndk-sys",
> + "objc",
> + "ordered-float",
> + "parking_lot",
> + "portable-atomic",
> + "portable-atomic-util",
> + "profiling",
> + "range-alloc",
> + "raw-window-handle",
> + "renderdoc-sys",
> + "smallvec",
> + "thiserror 2.0.18",
> + "wasm-bindgen",
> + "web-sys",
> + "wgpu-types",
> + "windows 0.58.0",
> + "windows-core 0.58.0",
> +]
> +
> +[[package]]
> +name = "wgpu-types"
> +version = "26.0.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "eca7a8d8af57c18f57d393601a1fb159ace8b2328f1b6b5f80893f7d672c9ae2"
> +dependencies = [
> + "bitflags 2.11.1",
> + "bytemuck",
> + "js-sys",
> + "log",
> + "thiserror 2.0.18",
> + "web-sys",
> +]
> +
> +[[package]]
> +name = "which"
> +version = "4.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "87ba24419a2078cd2b0f2ede2691b6c66d8e47836da3b6db8265ebad47afbfc7"
> +dependencies = [
> + "either",
> + "home",
> + "once_cell",
> + "rustix 0.38.44",
> +]
> +
> +[[package]]
> +name = "whisper-rs"
> +version = "0.16.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2088172d00f936c348d6a72f488dc2660ab3f507263a195df308a3c2383229f6"
> +dependencies = [
> + "libc",
> + "whisper-rs-sys",
> +]
> +
> +[[package]]
> +name = "whisper-rs-sys"
> +version = "0.15.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6986c0fe081241d391f09b9a071fbcbb59720c3563628c3c829057cf69f2a56f"
> +dependencies = [
> + "bindgen 0.72.1",
> + "cfg-if",
> + "cmake",
> + "fs_extra",
> + "semver",
> +]
> +
> +[[package]]
> +name = "winapi"
> +version = "0.3.9"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> +dependencies = [
> + "winapi-i686-pc-windows-gnu",
> + "winapi-x86_64-pc-windows-gnu",
> +]
> +
> +[[package]]
> +name = "winapi-i686-pc-windows-gnu"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> +
> +[[package]]
> +name = "winapi-util"
> +version = "0.1.11"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
> +dependencies = [
> + "windows-sys 0.61.2",
> +]
> +
> +[[package]]
> +name = "winapi-x86_64-pc-windows-gnu"
> +version = "0.4.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> +
> +[[package]]
> +name = "windows"
> +version = "0.58.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "dd04d41d93c4992d421894c18c8b43496aa748dd4c081bac0dc93eb0489272b6"
> +dependencies = [
> + "windows-core 0.58.0",
> + "windows-targets 0.52.6",
> +]
> +
> +[[package]]
> +name = "windows"
> +version = "0.61.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893"
> +dependencies = [
> + "windows-collections",
> + "windows-core 0.61.2",
> + "windows-future",
> + "windows-link 0.1.3",
> + "windows-numerics",
> +]
> +
> +[[package]]
> +name = "windows-collections"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8"
> +dependencies = [
> + "windows-core 0.61.2",
> +]
> +
> +[[package]]
> +name = "windows-core"
> +version = "0.58.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "6ba6d44ec8c2591c134257ce647b7ea6b20335bf6379a27dac5f1641fcf59f99"
> +dependencies = [
> + "windows-implement 0.58.0",
> + "windows-interface 0.58.0",
> + "windows-result 0.2.0",
> + "windows-strings 0.1.0",
> + "windows-targets 0.52.6",
> +]
> +
> +[[package]]
> +name = "windows-core"
> +version = "0.61.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3"
> +dependencies = [
> + "windows-implement 0.60.2",
> + "windows-interface 0.59.3",
> + "windows-link 0.1.3",
> + "windows-result 0.3.4",
> + "windows-strings 0.4.2",
> +]
> +
> +[[package]]
> +name = "windows-core"
> +version = "0.62.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
> +dependencies = [
> + "windows-implement 0.60.2",
> + "windows-interface 0.59.3",
> + "windows-link 0.2.1",
> + "windows-result 0.4.1",
> + "windows-strings 0.5.1",
> +]
> +
> +[[package]]
> +name = "windows-future"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fc6a41e98427b19fe4b73c550f060b59fa592d7d686537eebf9385621bfbad8e"
> +dependencies = [
> + "windows-core 0.61.2",
> + "windows-link 0.1.3",
> + "windows-threading",
> +]
> +
> +[[package]]
> +name = "windows-implement"
> +version = "0.58.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2bbd5b46c938e506ecbce286b6628a02171d56153ba733b6c741fc627ec9579b"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "windows-implement"
> +version = "0.60.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "windows-interface"
> +version = "0.58.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "053c4c462dc91d3b1504c6fe5a726dd15e216ba718e84a0e46a88fbe5ded3515"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "windows-interface"
> +version = "0.59.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "windows-link"
> +version = "0.1.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
> +
> +[[package]]
> +name = "windows-link"
> +version = "0.2.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
> +
> +[[package]]
> +name = "windows-numerics"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
> +dependencies = [
> + "windows-core 0.61.2",
> + "windows-link 0.1.3",
> +]
> +
> +[[package]]
> +name = "windows-registry"
> +version = "0.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "02752bf7fbdcce7f2a27a742f798510f3e5ad88dbe84871e5168e2120c3d5720"
> +dependencies = [
> + "windows-link 0.2.1",
> + "windows-result 0.4.1",
> + "windows-strings 0.5.1",
> +]
> +
> +[[package]]
> +name = "windows-result"
> +version = "0.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1d1043d8214f791817bab27572aaa8af63732e11bf84aa21a45a78d6c317ae0e"
> +dependencies = [
> + "windows-targets 0.52.6",
> +]
> +
> +[[package]]
> +name = "windows-result"
> +version = "0.3.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
> +dependencies = [
> + "windows-link 0.1.3",
> +]
> +
> +[[package]]
> +name = "windows-result"
> +version = "0.4.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
> +dependencies = [
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "windows-strings"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4cd9b125c486025df0eabcb585e62173c6c9eddcec5d117d3b6e8c30e2ee4d10"
> +dependencies = [
> + "windows-result 0.2.0",
> + "windows-targets 0.52.6",
> +]
> +
> +[[package]]
> +name = "windows-strings"
> +version = "0.4.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
> +dependencies = [
> + "windows-link 0.1.3",
> +]
> +
> +[[package]]
> +name = "windows-strings"
> +version = "0.5.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
> +dependencies = [
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "windows-sys"
> +version = "0.45.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
> +dependencies = [
> + "windows-targets 0.42.2",
> +]
> +
> +[[package]]
> +name = "windows-sys"
> +version = "0.52.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
> +dependencies = [
> + "windows-targets 0.52.6",
> +]
> +
> +[[package]]
> +name = "windows-sys"
> +version = "0.59.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
> +dependencies = [
> + "windows-targets 0.52.6",
> +]
> +
> +[[package]]
> +name = "windows-sys"
> +version = "0.60.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
> +dependencies = [
> + "windows-targets 0.53.5",
> +]
> +
> +[[package]]
> +name = "windows-sys"
> +version = "0.61.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
> +dependencies = [
> + "windows-link 0.2.1",
> +]
> +
> +[[package]]
> +name = "windows-targets"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
> +dependencies = [
> + "windows_aarch64_gnullvm 0.42.2",
> + "windows_aarch64_msvc 0.42.2",
> + "windows_i686_gnu 0.42.2",
> + "windows_i686_msvc 0.42.2",
> + "windows_x86_64_gnu 0.42.2",
> + "windows_x86_64_gnullvm 0.42.2",
> + "windows_x86_64_msvc 0.42.2",
> +]
> +
> +[[package]]
> +name = "windows-targets"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
> +dependencies = [
> + "windows_aarch64_gnullvm 0.52.6",
> + "windows_aarch64_msvc 0.52.6",
> + "windows_i686_gnu 0.52.6",
> + "windows_i686_gnullvm 0.52.6",
> + "windows_i686_msvc 0.52.6",
> + "windows_x86_64_gnu 0.52.6",
> + "windows_x86_64_gnullvm 0.52.6",
> + "windows_x86_64_msvc 0.52.6",
> +]
> +
> +[[package]]
> +name = "windows-targets"
> +version = "0.53.5"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
> +dependencies = [
> + "windows-link 0.2.1",
> + "windows_aarch64_gnullvm 0.53.1",
> + "windows_aarch64_msvc 0.53.1",
> + "windows_i686_gnu 0.53.1",
> + "windows_i686_gnullvm 0.53.1",
> + "windows_i686_msvc 0.53.1",
> + "windows_x86_64_gnu 0.53.1",
> + "windows_x86_64_gnullvm 0.53.1",
> + "windows_x86_64_msvc 0.53.1",
> +]
> +
> +[[package]]
> +name = "windows-threading"
> +version = "0.1.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
> +dependencies = [
> + "windows-link 0.1.3",
> +]
> +
> +[[package]]
> +name = "windows_aarch64_gnullvm"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
> +
> +[[package]]
> +name = "windows_aarch64_gnullvm"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
> +
> +[[package]]
> +name = "windows_aarch64_gnullvm"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
> +
> +[[package]]
> +name = "windows_aarch64_msvc"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
> +
> +[[package]]
> +name = "windows_aarch64_msvc"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
> +
> +[[package]]
> +name = "windows_aarch64_msvc"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
> +
> +[[package]]
> +name = "windows_i686_gnu"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
> +
> +[[package]]
> +name = "windows_i686_gnu"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
> +
> +[[package]]
> +name = "windows_i686_gnu"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
> +
> +[[package]]
> +name = "windows_i686_gnullvm"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
> +
> +[[package]]
> +name = "windows_i686_gnullvm"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
> +
> +[[package]]
> +name = "windows_i686_msvc"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
> +
> +[[package]]
> +name = "windows_i686_msvc"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
> +
> +[[package]]
> +name = "windows_i686_msvc"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
> +
> +[[package]]
> +name = "windows_x86_64_gnu"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
> +
> +[[package]]
> +name = "windows_x86_64_gnu"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
> +
> +[[package]]
> +name = "windows_x86_64_gnu"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
> +
> +[[package]]
> +name = "windows_x86_64_gnullvm"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
> +
> +[[package]]
> +name = "windows_x86_64_gnullvm"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
> +
> +[[package]]
> +name = "windows_x86_64_gnullvm"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
> +
> +[[package]]
> +name = "windows_x86_64_msvc"
> +version = "0.42.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
> +
> +[[package]]
> +name = "windows_x86_64_msvc"
> +version = "0.52.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
> +
> +[[package]]
> +name = "windows_x86_64_msvc"
> +version = "0.53.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
> +
> +[[package]]
> +name = "winnow"
> +version = "0.7.15"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "df79d97927682d2fd8adb29682d1140b343be4ac0f08fd68b7765d9c059d3945"
> +dependencies = [
> + "memchr",
> +]
> +
> +[[package]]
> +name = "winnow"
> +version = "1.0.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "2ee1708bef14716a11bae175f579062d4554d95be2c6829f518df847b7b3fdd0"
> +dependencies = [
> + "memchr",
> +]
> +
> +[[package]]
> +name = "wit-bindgen"
> +version = "0.51.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
> +dependencies = [
> + "wit-bindgen-rust-macro",
> +]
> +
> +[[package]]
> +name = "wit-bindgen"
> +version = "0.57.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
> +
> +[[package]]
> +name = "wit-bindgen-core"
> +version = "0.51.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
> +dependencies = [
> + "anyhow",
> + "heck 0.5.0",
> + "wit-parser",
> +]
> +
> +[[package]]
> +name = "wit-bindgen-rust"
> +version = "0.51.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
> +dependencies = [
> + "anyhow",
> + "heck 0.5.0",
> + "indexmap 2.14.0",
> + "prettyplease",
> + "syn 2.0.117",
> + "wasm-metadata",
> + "wit-bindgen-core",
> + "wit-component",
> +]
> +
> +[[package]]
> +name = "wit-bindgen-rust-macro"
> +version = "0.51.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
> +dependencies = [
> + "anyhow",
> + "prettyplease",
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> + "wit-bindgen-core",
> + "wit-bindgen-rust",
> +]
> +
> +[[package]]
> +name = "wit-component"
> +version = "0.244.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
> +dependencies = [
> + "anyhow",
> + "bitflags 2.11.1",
> + "indexmap 2.14.0",
> + "log",
> + "serde",
> + "serde_derive",
> + "serde_json",
> + "wasm-encoder",
> + "wasm-metadata",
> + "wasmparser",
> + "wit-parser",
> +]
> +
> +[[package]]
> +name = "wit-parser"
> +version = "0.244.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
> +dependencies = [
> + "anyhow",
> + "id-arena",
> + "indexmap 2.14.0",
> + "log",
> + "semver",
> + "serde",
> + "serde_derive",
> + "serde_json",
> + "unicode-xid",
> + "wasmparser",
> +]
> +
> +[[package]]
> +name = "writeable"
> +version = "0.6.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "1ffae5123b2d3fc086436f8834ae3ab053a283cfac8fe0a0b8eaae044768a4c4"
> +
> +[[package]]
> +name = "x509-parser"
> +version = "0.18.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "d43b0f71ce057da06bc0851b23ee24f3f86190b07203dd8f567d0b706a185202"
> +dependencies = [
> + "asn1-rs",
> + "data-encoding",
> + "der-parser",
> + "lazy_static",
> + "nom 7.1.3",
> + "oid-registry",
> + "ring",
> + "rusticata-macros",
> + "thiserror 2.0.18",
> + "time",
> +]
> +
> +[[package]]
> +name = "xattr"
> +version = "1.6.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
> +dependencies = [
> + "libc",
> + "rustix 1.1.4",
> +]
> +
> +[[package]]
> +name = "xml"
> +version = "1.3.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "636f85e5ca6488e96401b61eb7de54f4e44755c988af0f52cf90230c312a1a89"
> +
> +[[package]]
> +name = "xml-rs"
> +version = "0.8.28"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3ae8337f8a065cfc972643663ea4279e04e7256de865aa66fe25cec5fb912d3f"
> +
> +[[package]]
> +name = "xmlparser"
> +version = "0.13.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4"
> +
> +[[package]]
> +name = "xmltree"
> +version = "0.12.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cbc04313cab124e498ab1724e739720807b6dc405b9ed0edc5860164d2e4ff70"
> +dependencies = [
> + "xml",
> +]
> +
> +[[package]]
> +name = "y4m"
> +version = "0.8.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "7a5a4b21e1a62b67a2970e6831bc091d7b87e119e7f9791aef9702e3bef04448"
> +
> +[[package]]
> +name = "yansi"
> +version = "1.0.1"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
> +
> +[[package]]
> +name = "yasna"
> +version = "0.6.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b5f6765e852b9b4dc8e2a76843e4d64d1cea8e79bcde0b6901aea8e7c7f08282"
> +dependencies = [
> + "bit-vec 0.9.1",
> + "time",
> +]
> +
> +[[package]]
> +name = "yoke"
> +version = "0.8.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "abe8c5fda708d9ca3df187cae8bfb9ceda00dd96231bed36e445a1a48e66f9ca"
> +dependencies = [
> + "stable_deref_trait",
> + "yoke-derive",
> + "zerofrom",
> +]
> +
> +[[package]]
> +name = "yoke-derive"
> +version = "0.8.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "de844c262c8848816172cef550288e7dc6c7b7814b4ee56b3e1553f275f1858e"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> + "synstructure",
> +]
> +
> +[[package]]
> +name = "zerocopy"
> +version = "0.8.48"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "eed437bf9d6692032087e337407a86f04cd8d6a16a37199ed57949d415bd68e9"
> +dependencies = [
> + "zerocopy-derive",
> +]
> +
> +[[package]]
> +name = "zerocopy-derive"
> +version = "0.8.48"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "70e3cd084b1788766f53af483dd21f93881ff30d7320490ec3ef7526d203bad4"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "zerofrom"
> +version = "0.1.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "69faa1f2a1ea75661980b013019ed6687ed0e83d069bc1114e2cc74c6c04c4df"
> +dependencies = [
> + "zerofrom-derive",
> +]
> +
> +[[package]]
> +name = "zerofrom-derive"
> +version = "0.1.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "11532158c46691caf0f2593ea8358fed6bbf68a0315e80aae9bd41fbade684a1"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> + "synstructure",
> +]
> +
> +[[package]]
> +name = "zeroize"
> +version = "1.8.2"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4a9e53c8d8ccd5eff88d0"
> +dependencies = [
> + "zeroize_derive",
> +]
> +
> +[[package]]
> +name = "zeroize_derive"
> +version = "1.4.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "85a5b4158499876c763cb03bc4e49185d3cccbabb15b33c627f7884f43db852e"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "zerotrie"
> +version = "0.2.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
> +dependencies = [
> + "displaydoc",
> + "yoke",
> + "zerofrom",
> + "zerovec",
> +]
> +
> +[[package]]
> +name = "zerovec"
> +version = "0.11.6"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
> +dependencies = [
> + "serde",
> + "yoke",
> + "zerofrom",
> + "zerovec-derive",
> +]
> +
> +[[package]]
> +name = "zerovec-derive"
> +version = "0.11.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
> +dependencies = [
> + "proc-macro2",
> + "quote",
> + "syn 2.0.117",
> +]
> +
> +[[package]]
> +name = "zip"
> +version = "7.2.0"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "c42e33efc22a0650c311c2ef19115ce232583abbe80850bc8b66509ebef02de0"
> +dependencies = [
> + "aes",
> + "bzip2",
> + "constant_time_eq",
> + "crc32fast",
> + "deflate64",
> + "flate2",
> + "generic-array",
> + "getrandom 0.3.4",
> + "hmac 0.12.1",
> + "indexmap 2.14.0",
> + "lzma-rust2",
> + "memchr",
> + "pbkdf2",
> + "ppmd-rust",
> + "sha1 0.10.6",
> + "time",
> + "typed-path",
> + "zeroize",
> + "zopfli",
> + "zstd",
> +]
> +
> +[[package]]
> +name = "zlib-rs"
> +version = "0.6.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513"
> +
> +[[package]]
> +name = "zmij"
> +version = "1.0.21"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
> +
> +[[package]]
> +name = "zopfli"
> +version = "0.8.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
> +dependencies = [
> + "bumpalo",
> + "crc32fast",
> + "log",
> + "simd-adler32",
> +]
> +
> +[[package]]
> +name = "zstd"
> +version = "0.13.3"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
> +dependencies = [
> + "zstd-safe",
> +]
> +
> +[[package]]
> +name = "zstd-safe"
> +version = "7.2.4"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
> +dependencies = [
> + "zstd-sys",
> +]
> +
> +[[package]]
> +name = "zstd-sys"
> +version = "2.0.16+zstd.1.5.7"
> +source = "registry+https://github.com/rust-lang/crates.io-index"
> +checksum = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
> +dependencies = [
> + "cc",
> + "pkg-config",
> +]
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-APACHE b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-APACHE
> new file mode 100644
> index 0000000000..16fe87b06e
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-APACHE
> @@ -0,0 +1,201 @@
> +                              Apache License
> +                        Version 2.0, January 2004
> +                     http://www.apache.org/licenses/
> +
> +TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION
> +
> +1. Definitions.
> +
> +   "License" shall mean the terms and conditions for use, reproduction,
> +   and distribution as defined by Sections 1 through 9 of this document.
> +
> +   "Licensor" shall mean the copyright owner or entity authorized by
> +   the copyright owner that is granting the License.
> +
> +   "Legal Entity" shall mean the union of the acting entity and all
> +   other entities that control, are controlled by, or are under common
> +   control with that entity. For the purposes of this definition,
> +   "control" means (i) the power, direct or indirect, to cause the
> +   direction or management of such entity, whether by contract or
> +   otherwise, or (ii) ownership of fifty percent (50%) or more of the
> +   outstanding shares, or (iii) beneficial ownership of such entity.
> +
> +   "You" (or "Your") shall mean an individual or Legal Entity
> +   exercising permissions granted by this License.
> +
> +   "Source" form shall mean the preferred form for making modifications,
> +   including but not limited to software source code, documentation
> +   source, and configuration files.
> +
> +   "Object" form shall mean any form resulting from mechanical
> +   transformation or translation of a Source form, including but
> +   not limited to compiled object code, generated documentation,
> +   and conversions to other media types.
> +
> +   "Work" shall mean the work of authorship, whether in Source or
> +   Object form, made available under the License, as indicated by a
> +   copyright notice that is included in or attached to the work
> +   (an example is provided in the Appendix below).
> +
> +   "Derivative Works" shall mean any work, whether in Source or Object
> +   form, that is based on (or derived from) the Work and for which the
> +   editorial revisions, annotations, elaborations, or other modifications
> +   represent, as a whole, an original work of authorship. For the purposes
> +   of this License, Derivative Works shall not include works that remain
> +   separable from, or merely link (or bind by name) to the interfaces of,
> +   the Work and Derivative Works thereof.
> +
> +   "Contribution" shall mean any work of authorship, including
> +   the original version of the Work and any modifications or additions
> +   to that Work or Derivative Works thereof, that is intentionally
> +   submitted to Licensor for inclusion in the Work by the copyright owner
> +   or by an individual or Legal Entity authorized to submit on behalf of
> +   the copyright owner. For the purposes of this definition, "submitted"
> +   means any form of electronic, verbal, or written communication sent
> +   to the Licensor or its representatives, including but not limited to
> +   communication on electronic mailing lists, source code control systems,
> +   and issue tracking systems that are managed by, or on behalf of, the
> +   Licensor for the purpose of discussing and improving the Work, but
> +   excluding communication that is conspicuously marked or otherwise
> +   designated in writing by the copyright owner as "Not a Contribution."
> +
> +   "Contributor" shall mean Licensor and any individual or Legal Entity
> +   on behalf of whom a Contribution has been received by Licensor and
> +   subsequently incorporated within the Work.
> +
> +2. Grant of Copyright License. Subject to the terms and conditions of
> +   this License, each Contributor hereby grants to You a perpetual,
> +   worldwide, non-exclusive, no-charge, royalty-free, irrevocable
> +   copyright license to reproduce, prepare Derivative Works of,
> +   publicly display, publicly perform, sublicense, and distribute the
> +   Work and such Derivative Works in Source or Object form.
> +
> +3. Grant of Patent License. Subject to the terms and conditions of
> +   this License, each Contributor hereby grants to You a perpetual,
> +   worldwide, non-exclusive, no-charge, royalty-free, irrevocable
> +   (except as stated in this section) patent license to make, have made,
> +   use, offer to sell, sell, import, and otherwise transfer the Work,
> +   where such license applies only to those patent claims licensable
> +   by such Contributor that are necessarily infringed by their
> +   Contribution(s) alone or by combination of their Contribution(s)
> +   with the Work to which such Contribution(s) was submitted. If You
> +   institute patent litigation against any entity (including a
> +   cross-claim or counterclaim in a lawsuit) alleging that the Work
> +   or a Contribution incorporated within the Work constitutes direct
> +   or contributory patent infringement, then any patent licenses
> +   granted to You under this License for that Work shall terminate
> +   as of the date such litigation is filed.
> +
> +4. Redistribution. You may reproduce and distribute copies of the
> +   Work or Derivative Works thereof in any medium, with or without
> +   modifications, and in Source or Object form, provided that You
> +   meet the following conditions:
> +
> +   (a) You must give any other recipients of the Work or
> +       Derivative Works a copy of this License; and
> +
> +   (b) You must cause any modified files to carry prominent notices
> +       stating that You changed the files; and
> +
> +   (c) You must retain, in the Source form of any Derivative Works
> +       that You distribute, all copyright, patent, trademark, and
> +       attribution notices from the Source form of the Work,
> +       excluding those notices that do not pertain to any part of
> +       the Derivative Works; and
> +
> +   (d) If the Work includes a "NOTICE" text file as part of its
> +       distribution, then any Derivative Works that You distribute must
> +       include a readable copy of the attribution notices contained
> +       within such NOTICE file, excluding those notices that do not
> +       pertain to any part of the Derivative Works, in at least one
> +       of the following places: within a NOTICE text file distributed
> +       as part of the Derivative Works; within the Source form or
> +       documentation, if provided along with the Derivative Works; or,
> +       within a display generated by the Derivative Works, if and
> +       wherever such third-party notices normally appear. The contents
> +       of the NOTICE file are for informational purposes only and
> +       do not modify the License. You may add Your own attribution
> +       notices within Derivative Works that You distribute, alongside
> +       or as an addendum to the NOTICE text from the Work, provided
> +       that such additional attribution notices cannot be construed
> +       as modifying the License.
> +
> +   You may add Your own copyright statement to Your modifications and
> +   may provide additional or different license terms and conditions
> +   for use, reproduction, or distribution of Your modifications, or
> +   for any such Derivative Works as a whole, provided Your use,
> +   reproduction, and distribution of the Work otherwise complies with
> +   the conditions stated in this License.
> +
> +5. Submission of Contributions. Unless You explicitly state otherwise,
> +   any Contribution intentionally submitted for inclusion in the Work
> +   by You to the Licensor shall be under the terms and conditions of
> +   this License, without any additional terms or conditions.
> +   Notwithstanding the above, nothing herein shall supersede or modify
> +   the terms of any separate license agreement you may have executed
> +   with Licensor regarding such Contributions.
> +
> +6. Trademarks. This License does not grant permission to use the trade
> +   names, trademarks, service marks, or product names of the Licensor,
> +   except as required for reasonable and customary use in describing the
> +   origin of the Work and reproducing the content of the NOTICE file.
> +
> +7. Disclaimer of Warranty. Unless required by applicable law or
> +   agreed to in writing, Licensor provides the Work (and each
> +   Contributor provides its Contributions) on an "AS IS" BASIS,
> +   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
> +   implied, including, without limitation, any warranties or conditions
> +   of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
> +   PARTICULAR PURPOSE. You are solely responsible for determining the
> +   appropriateness of using or redistributing the Work and assume any
> +   risks associated with Your exercise of permissions under this License.
> +
> +8. Limitation of Liability. In no event and under no legal theory,
> +   whether in tort (including negligence), contract, or otherwise,
> +   unless required by applicable law (such as deliberate and grossly
> +   negligent acts) or agreed to in writing, shall any Contributor be
> +   liable to You for damages, including any direct, indirect, special,
> +   incidental, or consequential damages of any character arising as a
> +   result of this License or out of the use or inability to use the
> +   Work (including but not limited to damages for loss of goodwill,
> +   work stoppage, computer failure or malfunction, or any and all
> +   other commercial damages or losses), even if such Contributor
> +   has been advised of the possibility of such damages.
> +
> +9. Accepting Warranty or Additional Liability. While redistributing
> +   the Work or Derivative Works thereof, You may choose to offer,
> +   and charge a fee for, acceptance of support, warranty, indemnity,
> +   or other liability obligations and/or rights consistent with this
> +   License. However, in accepting such obligations, You may act only
> +   on Your own behalf and on Your sole responsibility, not on behalf
> +   of any other Contributor, and only if You agree to indemnify,
> +   defend, and hold each Contributor harmless for any liability
> +   incurred by, or claims asserted against, such Contributor by reason
> +   of your accepting any such warranty or additional liability.
> +
> +END OF TERMS AND CONDITIONS
> +
> +APPENDIX: How to apply the Apache License to your work.
> +
> +   To apply the Apache License to your work, attach the following
> +   boilerplate notice, with the fields enclosed by brackets "[]"
> +   replaced with your own identifying information. (Don't include
> +   the brackets!)  The text should be enclosed in the appropriate
> +   comment syntax for the file format. We also recommend that a
> +   file or class name and description of purpose be included on the
> +   same "printed page" as the copyright notice for easier
> +   identification within third-party archives.
> +
> +Copyright [yyyy] [name of copyright owner]
> +
> +Licensed under the Apache License, Version 2.0 (the "License");
> +you may not use this file except in compliance with the License.
> +You may obtain a copy of the License at
> +
> +       http://www.apache.org/licenses/LICENSE-2.0
> +
> +Unless required by applicable law or agreed to in writing, software
> +distributed under the License is distributed on an "AS IS" BASIS,
> +WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
> +See the License for the specific language governing permissions and
> +limitations under the License.
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-MPL-2.0 b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-MPL-2.0
> new file mode 100644
> index 0000000000..14e2f777f6
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs/LICENSE-MPL-2.0
> @@ -0,0 +1,373 @@
> +Mozilla Public License Version 2.0
> +==================================
> +
> +1. Definitions
> +--------------
> +
> +1.1. "Contributor"
> +    means each individual or legal entity that creates, contributes to
> +    the creation of, or owns Covered Software.
> +
> +1.2. "Contributor Version"
> +    means the combination of the Contributions of others (if any) used
> +    by a Contributor and that particular Contributor's Contribution.
> +
> +1.3. "Contribution"
> +    means Covered Software of a particular Contributor.
> +
> +1.4. "Covered Software"
> +    means Source Code Form to which the initial Contributor has attached
> +    the notice in Exhibit A, the Executable Form of such Source Code
> +    Form, and Modifications of such Source Code Form, in each case
> +    including portions thereof.
> +
> +1.5. "Incompatible With Secondary Licenses"
> +    means
> +
> +    (a) that the initial Contributor has attached the notice described
> +        in Exhibit B to the Covered Software; or
> +
> +    (b) that the Covered Software was made available under the terms of
> +        version 1.1 or earlier of the License, but not also under the
> +        terms of a Secondary License.
> +
> +1.6. "Executable Form"
> +    means any form of the work other than Source Code Form.
> +
> +1.7. "Larger Work"
> +    means a work that combines Covered Software with other material, in
> +    a separate file or files, that is not Covered Software.
> +
> +1.8. "License"
> +    means this document.
> +
> +1.9. "Licensable"
> +    means having the right to grant, to the maximum extent possible,
> +    whether at the time of the initial grant or subsequently, any and
> +    all of the rights conveyed by this License.
> +
> +1.10. "Modifications"
> +    means any of the following:
> +
> +    (a) any file in Source Code Form that results from an addition to,
> +        deletion from, or modification of the contents of Covered
> +        Software; or
> +
> +    (b) any new file in Source Code Form that contains any Covered
> +        Software.
> +
> +1.11. "Patent Claims" of a Contributor
> +    means any patent claim(s), including without limitation, method,
> +    process, and apparatus claims, in any patent Licensable by such
> +    Contributor that would be infringed, but for the grant of the
> +    License, by the making, using, selling, offering for sale, having
> +    made, import, or transfer of either its Contributions or its
> +    Contributor Version.
> +
> +1.12. "Secondary License"
> +    means either the GNU General Public License, Version 2.0, the GNU
> +    Lesser General Public License, Version 2.1, the GNU Affero General
> +    Public License, Version 3.0, or any later versions of those
> +    licenses.
> +
> +1.13. "Source Code Form"
> +    means the form of the work preferred for making modifications.
> +
> +1.14. "You" (or "Your")
> +    means an individual or a legal entity exercising rights under this
> +    License. For legal entities, "You" includes any entity that
> +    controls, is controlled by, or is under common control with You. For
> +    purposes of this definition, "control" means (a) the power, direct
> +    or indirect, to cause the direction or management of such entity,
> +    whether by contract or otherwise, or (b) ownership of more than
> +    fifty percent (50%) of the outstanding shares or beneficial
> +    ownership of such entity.
> +
> +2. License Grants and Conditions
> +--------------------------------
> +
> +2.1. Grants
> +
> +Each Contributor hereby grants You a world-wide, royalty-free,
> +non-exclusive license:
> +
> +(a) under intellectual property rights (other than patent or trademark)
> +    Licensable by such Contributor to use, reproduce, make available,
> +    modify, display, perform, distribute, and otherwise exploit its
> +    Contributions, either on an unmodified basis, with Modifications, or
> +    as part of a Larger Work; and
> +
> +(b) under Patent Claims of such Contributor to make, use, sell, offer
> +    for sale, have made, import, and otherwise transfer either its
> +    Contributions or its Contributor Version.
> +
> +2.2. Effective Date
> +
> +The licenses granted in Section 2.1 with respect to any Contribution
> +become effective for each Contribution on the date the Contributor first
> +distributes such Contribution.
> +
> +2.3. Limitations on Grant Scope
> +
> +The licenses granted in this Section 2 are the only rights granted under
> +this License. No additional rights or licenses will be implied from the
> +distribution or licensing of Covered Software under this License.
> +Notwithstanding Section 2.1(b) above, no patent license is granted by a
> +Contributor:
> +
> +(a) for any code that a Contributor has removed from Covered Software;
> +    or
> +
> +(b) for infringements caused by: (i) Your and any other third party's
> +    modifications of Covered Software, or (ii) the combination of its
> +    Contributions with other software (except as part of its Contributor
> +    Version); or
> +
> +(c) under Patent Claims infringed by Covered Software in the absence of
> +    its Contributions.
> +
> +This License does not grant any rights in the trademarks, service marks,
> +or logos of any Contributor (except as may be necessary to comply with
> +the notice requirements in Section 3.4).
> +
> +2.4. Subsequent Licenses
> +
> +No Contributor makes additional grants as a result of Your choice to
> +distribute the Covered Software under a subsequent version of this
> +License (see Section 10.2) or under the terms of a Secondary License (if
> +permitted under the terms of Section 3.3).
> +
> +2.5. Representation
> +
> +Each Contributor represents that the Contributor believes its
> +Contributions are its original creation(s) or it has sufficient rights
> +to grant the rights to its Contributions conveyed by this License.
> +
> +2.6. Fair Use
> +
> +This License is not intended to limit any rights You have under
> +applicable copyright doctrines of fair use, fair dealing, or other
> +equivalents.
> +
> +2.7. Conditions
> +
> +Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses granted
> +in Section 2.1.
> +
> +3. Responsibilities
> +-------------------
> +
> +3.1. Distribution of Source Form
> +
> +All distribution of Covered Software in Source Code Form, including any
> +Modifications that You create or to which You contribute, must be under
> +the terms of this License. You must inform recipients that the Source
> +Code Form of the Covered Software is governed by the terms of this
> +License, and how they can obtain a copy of this License. You may not
> +attempt to alter or restrict the recipients' rights in the Source Code
> +Form.
> +
> +3.2. Distribution of Executable Form
> +
> +If You distribute Covered Software in Executable Form then:
> +
> +(a) such Covered Software must also be made available in Source Code
> +    Form, as described in Section 3.1, and You must inform recipients of
> +    the Executable Form how they can obtain a copy of such Source Code
> +    Form by reasonable means in a timely manner, at a charge no more
> +    than the cost of distribution to the recipient; and
> +
> +(b) You may distribute such Executable Form under the terms of this
> +    License, or sublicense it under different terms, provided that the
> +    license for the Executable Form does not attempt to limit or alter
> +    the recipients' rights in the Source Code Form under this License.
> +
> +3.3. Distribution of a Larger Work
> +
> +You may create and distribute a Larger Work under terms of Your choice,
> +provided that You also comply with the requirements of this License for
> +the Covered Software. If the Larger Work is a combination of Covered
> +Software with a work governed by one or more Secondary Licenses, and the
> +Covered Software is not Incompatible With Secondary Licenses, this
> +License permits You to additionally distribute such Covered Software
> +under the terms of such Secondary License(s), so that the recipient of
> +the Larger Work may, at their option, further distribute the Covered
> +Software under the terms of either this License or such Secondary
> +License(s).
> +
> +3.4. Notices
> +
> +You may not remove or alter the substance of any license notices
> +(including copyright notices, patent notices, disclaimers of warranty,
> +or limitations of liability) contained within the Source Code Form of
> +the Covered Software, except that You may alter any license notices to
> +the extent required to remedy known factual inaccuracies.
> +
> +3.5. Application of Additional Terms
> +
> +You may choose to offer, and to charge a fee for, warranty, support,
> +indemnity or liability obligations to one or more recipients of Covered
> +Software. However, You may do so only on Your own behalf, and not on
> +behalf of any Contributor. You must make it absolutely clear that any
> +such warranty, support, indemnity, or liability obligation is offered by
> +You alone, and You hereby agree to indemnify every Contributor for any
> +liability incurred by such Contributor as a result of warranty, support,
> +indemnity or liability terms You offer. You may include additional
> +disclaimers of warranty and limitations of liability specific to any
> +jurisdiction.
> +
> +4. Inability to Comply Due to Statute or Regulation
> +---------------------------------------------------
> +
> +If it is impossible for You to comply with any of the terms of this
> +License with respect to some or all of the Covered Software due to
> +statute, judicial order, or regulation then You must: (a) comply with
> +the terms of this License to the maximum extent possible; and (b)
> +describe the limitations and the code they affect. Such description must
> +be placed in a text file included with all distributions of the Covered
> +Software under this License. Except to the extent prohibited by statute
> +or regulation, such description must be sufficiently detailed for a
> +recipient of ordinary skill to be able to understand it.
> +
> +5. Termination
> +--------------
> +
> +5.1. The rights granted under this License will terminate automatically
> +if You fail to comply with any of its terms. However, if You become
> +compliant, then the rights granted under this License from a particular
> +Contributor are reinstated (a) provisionally, unless and until such
> +Contributor explicitly and finally terminates Your grants, and (b) on an
> +ongoing basis, if such Contributor fails to notify You of the
> +non-compliance by some reasonable means prior to 60 days after You have
> +come back into compliance. Moreover, Your grants from a particular
> +Contributor are reinstated on an ongoing basis if such Contributor
> +notifies You of the non-compliance by some reasonable means, this is the
> +first time You have received notice of non-compliance with this License
> +from such Contributor, and You become compliant prior to 30 days after
> +Your receipt of the notice.
> +
> +5.2. If You initiate litigation against any entity by asserting a patent
> +infringement claim (excluding declaratory judgment actions,
> +counter-claims, and cross-claims) alleging that a Contributor Version
> +directly or indirectly infringes any patent, then the rights granted to
> +You by any and all Contributors for the Covered Software under Section
> +2.1 of this License shall terminate.
> +
> +5.3. In the event of termination under Sections 5.1 or 5.2 above, all
> +end user license agreements (excluding distributors and resellers) which
> +have been validly granted by You or Your distributors under this License
> +prior to termination shall survive termination.
> +
> +************************************************************************
> +*                                                                      *
> +*  6. Disclaimer of Warranty                                           *
> +*  -------------------------                                           *
> +*                                                                      *
> +*  Covered Software is provided under this License on an "as is"       *
> +*  basis, without warranty of any kind, either expressed, implied, or  *
> +*  statutory, including, without limitation, warranties that the       *
> +*  Covered Software is free of defects, merchantable, fit for a        *
> +*  particular purpose or non-infringing. The entire risk as to the     *
> +*  quality and performance of the Covered Software is with You.        *
> +*  Should any Covered Software prove defective in any respect, You     *
> +*  (not any Contributor) assume the cost of any necessary servicing,   *
> +*  repair, or correction. This disclaimer of warranty constitutes an   *
> +*  essential part of this License. No use of any Covered Software is   *
> +*  authorized under this License except under this disclaimer.         *
> +*                                                                      *
> +************************************************************************
> +
> +************************************************************************
> +*                                                                      *
> +*  7. Limitation of Liability                                          *
> +*  --------------------------                                          *
> +*                                                                      *
> +*  Under no circumstances and under no legal theory, whether tort      *
> +*  (including negligence), contract, or otherwise, shall any           *
> +*  Contributor, or anyone who distributes Covered Software as          *
> +*  permitted above, be liable to You for any direct, indirect,         *
> +*  special, incidental, or consequential damages of any character      *
> +*  including, without limitation, damages for lost profits, loss of    *
> +*  goodwill, work stoppage, computer failure or malfunction, or any    *
> +*  and all other commercial damages or losses, even if such party      *
> +*  shall have been informed of the possibility of such damages. This   *
> +*  limitation of liability shall not apply to liability for death or   *
> +*  personal injury resulting from such party's negligence to the       *
> +*  extent applicable law prohibits such limitation. Some               *
> +*  jurisdictions do not allow the exclusion or limitation of           *
> +*  incidental or consequential damages, so this exclusion and          *
> +*  limitation may not apply to You.                                    *
> +*                                                                      *
> +************************************************************************
> +
> +8. Litigation
> +-------------
> +
> +Any litigation relating to this License may be brought only in the
> +courts of a jurisdiction where the defendant maintains its principal
> +place of business and such litigation shall be governed by laws of that
> +jurisdiction, without reference to its conflict-of-law provisions.
> +Nothing in this Section shall prevent a party's ability to bring
> +cross-claims or counter-claims.
> +
> +9. Miscellaneous
> +----------------
> +
> +This License represents the complete agreement concerning the subject
> +matter hereof. If any provision of this License is held to be
> +unenforceable, such provision shall be reformed only to the extent
> +necessary to make it enforceable. Any law or regulation which provides
> +that the language of a contract shall be construed against the drafter
> +shall not be used to construe this License against a Contributor.
> +
> +10. Versions of the License
> +---------------------------
> +
> +10.1. New Versions
> +
> +Mozilla Foundation is the license steward. Except as provided in Section
> +10.3, no one other than the license steward has the right to modify or
> +publish new versions of this License. Each version will be given a
> +distinguishing version number.
> +
> +10.2. Effect of New Versions
> +
> +You may distribute the Covered Software under the terms of the version
> +of the License under which You originally received the Covered Software,
> +or under the terms of any subsequent version published by the license
> +steward.
> +
> +10.3. Modified Versions
> +
> +If you create software not governed by this License, and you want to
> +create a new license for such software, you may create and use a
> +modified version of this License if you rename the license and remove
> +any references to the name of the license steward (except to note that
> +such modified license differs from this License).
> +
> +10.4. Distributing Source Code Form that is Incompatible With Secondary
> +Licenses
> +
> +If You choose to distribute Source Code Form that is Incompatible With
> +Secondary Licenses under the terms of this version of the License, the
> +notice described in Exhibit B of this License must be attached.
> +
> +Exhibit A - Source Code Form License Notice
> +-------------------------------------------
> +
> +  This Source Code Form is subject to the terms of the Mozilla Public
> +  License, v. 2.0. If a copy of the MPL was not distributed with this
> +  file, You can obtain one at http://mozilla.org/MPL/2.0/.
> +
> +If it is not possible or desirable to put the notice in a particular
> +file, then You may include the notice in a location (such as a LICENSE
> +file in a relevant directory) where a recipient would be likely to look
> +for such a notice.
> +
> +You may add additional accurate notices of copyright ownership.
> +
> +Exhibit B - "Incompatible With Secondary Licenses" Notice
> +---------------------------------------------------------
> +
> +  This Source Code Form is "Incompatible With Secondary Licenses", as
> +  defined by the Mozilla Public License, v. 2.0.
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.2.bb
> new file mode 100644
> index 0000000000..eef2d143dd
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.2.bb
> @@ -0,0 +1,520 @@
> +SUMMARY = "GStreamer Rust Plugins"
> +HOMEPAGE = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
> +
> +LICENSE = "MPL-2.0 & Apache-2.0"
> +
> +# Cargo.lock is needed only for the `update_crates` task, which is executed
> +# manually as a standalone task whenever we need to update the version of the recipe.
> +# It is not executed in a normal build process. Keeping the lock file along with
> +# the recipe unpacks it to default sources directory which is also the default
> +# CARGO_LOCK_SRC_DIR.
> +#
> +# We only need Cargo.lock and the LICENSE files from the gst-plugins-rs git repository,
> +# all the plugins and the dependent packages can be fetched from crates.io. So we just
> +# ship these along with the recipe instead of fetching the complete repository everytime
> +# from git.
> +SRC_URI += "\
> +file://LICENSE-MPL-2.0 \
> +file://LICENSE-APACHE \
> +file://Cargo.lock \
> +"
> +
> +LIC_FILES_CHKSUM =  " \
> +    file://LICENSE-MPL-2.0;md5=815ca599c9df247a0c7f619bab123dad \
> +    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
> +"
> +
> +inherit cargo cargo-update-recipe-crates pkgconfig
> +require ${BPN}-crates.inc
> +
> +DEPENDS = " \
> +    glib-2.0 \
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-good \
> +    gstreamer1.0-plugins-bad \
> +    gstreamer1.0-plugins-base \
> +    gst-devtools \
> +    gtk4 \
> +"
> +
> +S = "${UNPACKDIR}"
> +
> +# For the purpose of reproducibility, modification of Cargo.lock is disabled
> +# by default by the cargo_common class using the --frozen flag.
> +#
> +# For some dependencies (for example, cairo-rs), the version recorded in the
> +# released Cargo.lock (0.22.7) may not match the actual version we fetch
> +# (0.22.0); the lockfile entry is based on the gtk-rs-core git release while
> +# we retrieve 0.22.0.
> +#
> +# Few other dependencies which specify a version range, the version fetched by cargo
> +# can differ from the one in the original Cargo.lock even though both satisfy
> +# the range.
> +#
> +# As a result, Cargo.lock may be updated with different dependency versions for
> +# a few packages. To allow this exception, disable the --frozen flag so Cargo.lock
> +# can be modified, but still prevent network access by using the --offline flag
> +# in CARGO_BUILD_FLAGS.
> +CARGO_BUILD_FLAGS:remove = "--frozen"
> +CARGO_BUILD_FLAGS:append = " --offline"
> +
> +# Need the network enabled for do_update_crates:append to access crates.io
> +# It fetches the checksum and version of few crates. See below for more details
> +do_update_crates[network] = "1"
> +
> +# The `update_crates` in base class by default only parses packages whose source is
> +# crates.io in the Cargo.lock file. But we need the other packages and
> +# dependencies whose source is a git repository (for example gstreamer-rs, gtk-rs-core etc.)
> +# or the individual plugins (for example gst-plugin-audiofx) which are listed in Cargo.lock
> +# but do not have any source specified since they are members of the gst-plugins-rs workspace.
> +#
> +# This append checks for those additional packages and generates the crates.io URIs to those
> +# and appends them to SRC_URI packages in the ${BPN}-crates.inc file.
> +#
> +do_update_crates:append() {
> +    nativepython3 -m ensurepip --upgrade
> +
> +    nativepython3 -m pip install packaging --target=${WORKDIR}/pydeps -q
> +
> +    export PYTHONPATH="${WORKDIR}/pydeps:$PYTHONPATH"
> +    TARGET_FILE="${THISDIR}/${BPN}-crates.inc"
> +    nativepython3 - <<EOF
> +
> +import os
> +import re
> +import urllib.request
> +import json
> +import ssl
> +import sys
> +try:
> +    import tomllib
> +except ImportError:
> +    try:
> +        import tomli as tomllib
> +    except ImportError:
> +        print(f"Requires python>=3.11 for tomllib module or install tomli module")
> +        sys.exit(1)
> +
> +from packaging.version import Version
> +
> +CA_BUNDLE = "${COMPONENTS_DIR}/${BUILD_ARCH}/ca-certificates-native/etc/ssl/certs/ca-certificates.crt"
> +if not os.path.exists(CA_BUNDLE):
> +    raise RuntimeError(f"CA bundle not found at {CA_BUNDLE}")
> +
> +ctx = ssl.create_default_context(cafile=CA_BUNDLE)
> +
> +def fetch_json(url):
> +    try:
> +        req = urllib.request.Request(url, )
> +        with urllib.request.urlopen(req, timeout=10, context=ctx) as r:
> +            return json.loads(r.read())
> +    except Exception as e:
> +        print(f"  ERROR fetching {url}: {e}")
> +        return None
> +
> +def check_crates_io(name, max_version):
> +    """Check if crate exists on crates.io and get its default version or max_version
> +    if it is older than the latest version. Return the version and checksum or None"""
> +    # Strip alpha/pre-release as crates.io may not have it
> +    data = fetch_json(f"https://crates.io/api/v1/crates/{name}")
> +    if not data:
> +        return None, None
> +
> +    latest_version = data.get("crate", {}).get("default_version")
> +
> +    if Version(latest_version) > Version(max_version):
> +        # Make sure we use the version no later than max_version that is mentioned
> +        # in Cargo.lock to be in sync with the ${PV} of the gst-plugins-rs
> +        use_version = max_version
> +        print(f"using max version {max_version}")
> +    else:
> +        # As mentioned above, for some packages, the version captured in the released
> +        # Cargo.lock could be different than the actual version we fetch. So, if the max
> +        # version does not actually exist in the crates.io, use the latest version
> +        use_version = latest_version
> +        print(f"using latest version {latest_version}")
> +    for v in data.get("versions", []):
> +        if v["num"] == use_version:
> +            return v["num"], v.get("checksum")
> +    return None, None
> +
> +# Read Cargo.lock
> +lockfile = None
> +for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
> +    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
> +        continue
> +    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
> +        continue
> +    for f in files:
> +        if f == 'Cargo.lock':
> +            lockfile = os.path.join(root, f)
> +            break
> +
> +if not lockfile:
> +    raise ValueError("No Cargo.lock found")
> +
> +print(f" cargo lock: {lockfile}")
> +with open(lockfile, 'rb') as f:
> +    lock = tomllib.load(f)
> +
> +packages = lock.get('package', [])
> +
> +print(f"Total packages: {len(packages)}")
> +print(f"gst-plugin packages: {[p['name'] for p in packages if p['name'].startswith('gst-plugin-')]}")
> +print(f"git sourced packages: {[p['name'] for p in packages if p.get('source', '').startswith('git+')]}")
> +
> +# Handle git sourced and gst-plugin dependencies
> +git_src_uri = '\n# Git sourced dependencies and gst-plugin- crates'
> +git_src_uri += '\nSRC_URI += " \\\\\n'
> +git_checksums = ''
> +git_entries = []
> +
> +for pkg in packages:
> +    source = pkg.get('source', '')
> +    name = pkg['name']
> +    max_version = pkg['version']
> +    if not source.startswith('git+') and  not name.startswith('gst-plugin-'):
> +        continue
> +
> +    print(f"package: {pkg}")
> +    # Try crates.io first
> +    print(f"Checking for crate {name} with max version {max_version}")
> +    cio_version, checksum = check_crates_io(name, max_version)
> +    if checksum:
> +        git_entries.append('    crate://crates.io/' + name + '/' + cio_version + ' \\\\\n')
> +        git_checksums += f'\nSRC_URI[{name}-{cio_version}.sha256sum] = "{checksum}"'
> +        print(f"  Using crates.io for git dep: {name} {cio_version}")
> +
> +git_src_uri += ''.join(git_entries)
> +git_src_uri += '"\n'
> +git_src_uri += git_checksums
> +git_src_uri += '\n'
> +
> +with open("${TARGET_FILE}", 'a') as f:
> +    f.write(git_src_uri)
> +
> +print("Successfully updated git deps' ${TARGET_FILE}'")
> +EOF
> +}
> +
> +# Since the default top-level manifest in the gst-plugins-rs repository
> +# points to the members from its subdirectories, we want to create a custom
> +# Cargo.toml to build all the plugins in a single workspace, which are located
> +# in the vendoring directory as individual crates/packages
> +#
> +# We also need to override the crates-io path of few gst-plugin- packages which are
> +# dependencies of the other plugins and point them with their path in the vendoring directory
> +# so that there won't be multiple listings of same package in the project
> +#
> +do_configure:prepend() {
> +    nativepython3 -m ensurepip --upgrade
> +    export PYTHONPATH="${WORKDIR}/pydeps:$PYTHONPATH"
> +    nativepython3 << 'EOF'
> +import os
> +import glob
> +import sys
> +
> +try:
> +    import tomllib
> +except ImportError:
> +    try:
> +        import tomli as tomllib
> +    except ImportError:
> +        print(f"Requires python>=3.11 for tomllib module or install tomli module")
> +        sys.exit(1)
> +
> +vendors = "${CARGO_VENDORING_DIRECTORY}"
> +unpackdir = "${UNPACKDIR}"
> +
> +print(f"Generating Cargo.toml with {vendors} and {unpackdir} ")
> +members = []
> +patches = {}
> +
> +# Find all gst-plugin-* dirs and their transitive gst-plugin-* deps
> +# to add their path as workspace members in the top-level manifest
> +for pkg_dir in glob.glob(os.path.join(vendors, 'gst-plugin-*')):
> +    cargo_toml = os.path.join(pkg_dir, 'Cargo.toml')
> +    if not os.path.exists(cargo_toml):
> +        continue
> +    print(f"{pkg_dir}")
> +    members.append(pkg_dir)
> +
> +    with open(cargo_toml, 'rb') as f:
> +        data = tomllib.load(f)
> +
> +    for section in ['dependencies', 'dev-dependencies', 'build-dependencies']:
> +        for dep_name, dep_spec in data.get(section, {}).items():
> +            # Get actual package name (may differ from dep_name via 'package' field)
> +            if isinstance(dep_spec, dict):
> +                pkg_name = dep_spec.get('package', dep_name)
> +                version = dep_spec.get('version', '')
> +            else:
> +                pkg_name = dep_name
> +                version = dep_spec if isinstance(dep_spec, str) else ''
> +
> +            if pkg_name.startswith('gst-plugin-') and pkg_name not in patches:
> +                # Try exact version match first, fallback to glob
> +                if version:
> +                    dep_dirs = glob.glob(os.path.join(vendors, pkg_name + '-' + version))
> +                if not version or not dep_dirs:
> +                    dep_dirs = glob.glob(os.path.join(vendors, pkg_name + '-*'))
> +                if dep_dirs:
> +                    patches[pkg_name] = dep_dirs[0]
> +
> +# Write Cargo.toml
> +with open(os.path.join(unpackdir, 'Cargo.toml'), 'w') as f:
> +    f.write('[workspace]\n')
> +    f.write('members = [\n')
> +    for member in sorted(members):
> +        f.write(f'    "{member}",\n')
> +    f.write(']\n')
> +    f.write('resolver = "2"\n')
> +    f.write('\n')
> +    if patches:
> +        f.write('[patch.crates-io]\n')
> +        for pkg, path in sorted(patches.items()):
> +            f.write(f'{pkg} = {{ path = "{path}" }}\n')
> +
> +print(f"Generated Cargo.toml with {len(members)} members and {len(patches)} patches")
> +EOF
> +}
> +
> +# Analytics
> +PACKAGECONFIG[analytics] = "-p gst-plugin-analytics"
> +PACKAGECONFIG[burn] = "-p gst-plugin-burn"
> +
> +# Audio
> +PACKAGECONFIG[audioparsers] = "-p gst-plugin-audioparsers"
> +PACKAGECONFIG[audiofx] = "-p gst-plugin-audiofx"
> +PACKAGECONFIG[claxon] = "-p gst-plugin-claxon"
> +# FIXME build errors
> +# PACKAGECONFIG[csound] = "-p gst-plugin-csound"
> +PACKAGECONFIG[demucs] = "-p gst-plugin-demucs"
> +PACKAGECONFIG[elevenlabs] = "-p gst-plugin-elevenlabs"
> +PACKAGECONFIG[lewton] = "-p gst-plugin-lewton"
> +PACKAGECONFIG[spotify] = "-p gst-plugin-spotify"
> +PACKAGECONFIG[speechmatics] = "-p gst-plugin-speechmatics"
> +# FIXME build errors
> +# PACKAGECONFIG[whisper] = "-p gst-plugin-whisper"
> +
> +# Generic
> +PACKAGECONFIG[file] = "-p gst-plugin-file"
> +PACKAGECONFIG[originalbuffer] = "-p gst-plugin-originalbuffer"
> +PACKAGECONFIG[gopbuffer] = "-p gst-plugin-gopbuffer"
> +PACKAGECONFIG[sodium] = "-p gst-plugin-sodium"
> +PACKAGECONFIG[threadshare] = "-p gst-plugin-threadshare"
> +PACKAGECONFIG[inter] = "-p gst-plugin-inter"
> +PACKAGECONFIG[streamgrouper] = "-p gst-plugin-streamgrouper"
> +
> +# Mux
> +PACKAGECONFIG[flavors] = "-p gst-plugin-flavors"
> +PACKAGECONFIG[isobmff] = "-p gst-plugin-isobmff"
> +
> +# Net
> +PACKAGECONFIG[aws] = "-p gst-plugin-aws"
> +PACKAGECONFIG[deepgram] = "-p gst-plugin-deepgram"
> +PACKAGECONFIG[hlsmultivariantsink] = "-p gst-plugin-hlsmultivariantsink"
> +PACKAGECONFIG[hlssink3] = "-p gst-plugin-hlssink3"
> +PACKAGECONFIG[icecast] = "-p gst-plugin-icecast"
> +PACKAGECONFIG[mpegtslive] = "-p gst-plugin-mpegtslive"
> +PACKAGECONFIG[ndi] = "-p gst-plugin-ndi"
> +PACKAGECONFIG[onvif] = "-p gst-plugin-onvif"
> +PACKAGECONFIG[raptorq] = "-p gst-plugin-raptorq"
> +PACKAGECONFIG[reqwest] = "-p gst-plugin-reqwest"
> +PACKAGECONFIG[rtsp] = "-p gst-plugin-rtsp"
> +PACKAGECONFIG[rtp] = "-p gst-plugin-rtp"
> +PACKAGECONFIG[webrtc] = "-p gst-plugin-webrtc"
> +PACKAGECONFIG[webrtc-signalling] = "-p gst-plugin-webrtc-signalling"
> +PACKAGECONFIG[webrtc-signalling-protocol] = "-p gst-plugin-webrtc-signalling-protocol"
> +PACKAGECONFIG[webrtchttp] = "-p gst-plugin-webrtchttp"
> +PACKAGECONFIG[quinn] = "-p gst-plugin-quinn"
> +
> +# Text
> +PACKAGECONFIG[textaccumulate] = "-p gst-plugin-textaccumulate"
> +PACKAGECONFIG[textahead] = "-p gst-plugin-textahead"
> +PACKAGECONFIG[json] = "-p gst-plugin-json"
> +PACKAGECONFIG[regex] = "-p gst-plugin-regex"
> +PACKAGECONFIG[textwrap] = "-p gst-plugin-textwrap"
> +
> +# Utils
> +PACKAGECONFIG[fallbackswitch] = "-p gst-plugin-fallbackswitch"
> +PACKAGECONFIG[livesync] = "-p gst-plugin-livesync"
> +PACKAGECONFIG[debugseimetainserter] = "-p gst-plugin-debugseimetainserter"
> +PACKAGECONFIG[togglerecord] = "-p gst-plugin-togglerecord"
> +PACKAGECONFIG[tracers] = "-p gst-plugin-tracers"
> +PACKAGECONFIG[uriplaylistbin] = "-p gst-plugin-uriplaylistbin"
> +PACKAGECONFIG[validate] = "-p gst-plugin-validate"
> +
> +# Video
> +PACKAGECONFIG[cdg] = "-p gst-plugin-cdg"
> +PACKAGECONFIG[closedcaption] = "-p gst-plugin-closedcaption"
> +# need dav1d recipe meta-openembedded/meta-multimedia
> +PACKAGECONFIG[dav1d] = "-p gst-plugin-dav1d,,dav1d, dav1d"
> +PACKAGECONFIG[ffv1] = "-p gst-plugin-ffv1"
> +PACKAGECONFIG[gif] = "-p gst-plugin-gif"
> +PACKAGECONFIG[gtk4] = "-p gst-plugin-gtk4"
> +PACKAGECONFIG[hsv] = "-p gst-plugin-hsv"
> +PACKAGECONFIG[png] = "-p gst-plugin-png"
> +PACKAGECONFIG[rav1e] = "-p gst-plugin-rav1e"
> +# FIXME failing to download skia from
> +# https://codeload.github.com/rust-skia/skia/tar.gz/m145-0.92.0
> +# PACKAGECONFIG[skia] = "-p gst-plugin-skia"
> +PACKAGECONFIG[videofx] = "-p gst-plugin-videofx"
> +# TODO no vvdec recipe
> +# PACKAGECONFIG[vvdec] = "-p gst-plugin-vvdec"
> +PACKAGECONFIG[webp] = "-p gst-plugin-webp"
> +
> +# Default members
> +PACKAGECONFIG ??= " \
> +    audiofx \
> +    closedcaption \
> +    file \
> +    fallbackswitch \
> +    tracers \
> +    isobmff \
> +    threadshare \
> +    rtp \
> +    inter \
> +    isobmff \
> +    hlssink3 \
> +    mpegtslive \
> +    reqwest \
> +    rtsp \
> +    webrtc \
> +    webrtc-signalling \
> +    videofx \
> +    webp \
> +"
> +
> +do_install:append() {
> +     install -d ${D}${libdir}/gstreamer-1.0/
> +     install -m 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/*.so ${D}${libdir}/gstreamer-1.0/
> +}
> +
> +PACKAGES =+ " \
> +    gstreamer1.0-plugins-rs-tutorial \
> +    gstreamer1.0-plugins-rs-analytics \
> +    gstreamer1.0-plugins-rs-burn \
> +    gstreamer1.0-plugins-rs-audiofx \
> +    gstreamer1.0-plugins-rs-audioparsers \
> +    gstreamer1.0-plugins-rs-claxon \
> +    gstreamer1.0-plugins-rs-csound \
> +    gstreamer1.0-plugins-rs-demucs \
> +    gstreamer1.0-plugins-rs-elevenlabs \
> +    gstreamer1.0-plugins-rs-lewton \
> +    gstreamer1.0-plugins-rs-speechmatics \
> +    gstreamer1.0-plugins-rs-spotify \
> +    gstreamer1.0-plugins-rs-whisper \
> +    gstreamer1.0-plugins-rs-file \
> +    gstreamer1.0-plugins-rs-originalbuffer \
> +    gstreamer1.0-plugins-rs-sodium \
> +    gstreamer1.0-plugins-rs-threadshare \
> +    gstreamer1.0-plugins-rs-inter \
> +    gstreamer1.0-plugins-rs-streamgrouper \
> +    gstreamer1.0-plugins-rs-gopbuffer \
> +    gstreamer1.0-plugins-rs-flavors \
> +    gstreamer1.0-plugins-rs-isobmff \
> +    gstreamer1.0-plugins-rs-aws \
> +    gstreamer1.0-plugins-rs-deepgram \
> +    gstreamer1.0-plugins-rs-hlsmultivariantsink \
> +    gstreamer1.0-plugins-rs-hlssink3 \
> +    gstreamer1.0-plugins-rs-icecast \
> +    gstreamer1.0-plugins-rs-mpegtslive \
> +    gstreamer1.0-plugins-rs-ndi \
> +    gstreamer1.0-plugins-rs-onvif \
> +    gstreamer1.0-plugins-rs-raptorq \
> +    gstreamer1.0-plugins-rs-reqwest \
> +    gstreamer1.0-plugins-rs-rtp \
> +    gstreamer1.0-plugins-rs-rtsp \
> +    gstreamer1.0-plugins-rs-webrtchttp \
> +    gstreamer1.0-plugins-rs-webrtc \
> +    gstreamer1.0-plugins-rs-quinn \
> +    gstreamer1.0-plugins-rs-textaccumulate \
> +    gstreamer1.0-plugins-rs-textahead \
> +    gstreamer1.0-plugins-rs-json \
> +    gstreamer1.0-plugins-rs-regex \
> +    gstreamer1.0-plugins-rs-textwrap \
> +    gstreamer1.0-plugins-rs-fallbackswitch \
> +    gstreamer1.0-plugins-rs-livesync \
> +    gstreamer1.0-plugins-rs-debugseimetainserter \
> +    gstreamer1.0-plugins-rs-togglerecord \
> +    gstreamer1.0-plugins-rs-tracers \
> +    gstreamer1.0-plugins-rs-uriplaylistbin \
> +    gstreamer1.0-plugins-rs-validate \
> +    gstreamer1.0-plugins-rs-cdg \
> +    gstreamer1.0-plugins-rs-closedcaption \
> +    gstreamer1.0-plugins-rs-dav1d \
> +    gstreamer1.0-plugins-rs-ffv1 \
> +    gstreamer1.0-plugins-rs-gif \
> +    gstreamer1.0-plugins-rs-gtk4 \
> +    gstreamer1.0-plugins-rs-hsv \
> +    gstreamer1.0-plugins-rs-png \
> +    gstreamer1.0-plugins-rs-rav1e \
> +    gstreamer1.0-plugins-rs-skia \
> +    gstreamer1.0-plugins-rs-videofx \
> +    gstreamer1.0-plugins-rs-vvdec \
> +    gstreamer1.0-plugins-rs-webp \
> +"
> +
> +FILES:gstreamer1.0-plugins-rs-tutorial = "/usr/lib/gstreamer-1.0/libgstrstutorial.so"
> +FILES:gstreamer1.0-plugins-rs-analytics = "/usr/lib/gstreamer-1.0/libgstrsanalytics.so"
> +FILES:gstreamer1.0-plugins-rs-burn = "/usr/lib/gstreamer-1.0/libgstburn.so"
> +FILES:gstreamer1.0-plugins-rs-audiofx = "/usr/lib/gstreamer-1.0/libgstrsaudiofx.so"
> +FILES:gstreamer1.0-plugins-rs-audioparsers = "/usr/lib/gstreamer-1.0/libgstrsaudioparsers.so"
> +FILES:gstreamer1.0-plugins-rs-claxon = "/usr/lib/gstreamer-1.0/libgstclaxon.so"
> +FILES:gstreamer1.0-plugins-rs-csound = "/usr/lib/gstreamer-1.0/libgstcsound.so"
> +FILES:gstreamer1.0-plugins-rs-demucs = "/usr/lib/gstreamer-1.0/libgstdemucs.so"
> +FILES:gstreamer1.0-plugins-rs-elevenlabs = "/usr/lib/gstreamer-1.0/libgstelevenlabs.so"
> +FILES:gstreamer1.0-plugins-rs-lewton = "/usr/lib/gstreamer-1.0/libgstlewton.so"
> +FILES:gstreamer1.0-plugins-rs-speechmatics = "/usr/lib/gstreamer-1.0/libgstspeechmatics.so"
> +FILES:gstreamer1.0-plugins-rs-spotify = "/usr/lib/gstreamer-1.0/libgstspotify.so"
> +FILES:gstreamer1.0-plugins-rs-whisper = "/usr/lib/gstreamer-1.0/libgstwhisper.so"
> +FILES:gstreamer1.0-plugins-rs-file = "/usr/lib/gstreamer-1.0/libgstrsfile.so"
> +FILES:gstreamer1.0-plugins-rs-originalbuffer = "/usr/lib/gstreamer-1.0/libgstoriginalbuffer.so"
> +FILES:gstreamer1.0-plugins-rs-sodium = "/usr/lib/gstreamer-1.0/libgstsodium.so"
> +FILES:gstreamer1.0-plugins-rs-threadshare = "/usr/lib/gstreamer-1.0/libgstthreadshare.so"
> +FILES:gstreamer1.0-plugins-rs-inter = "/usr/lib/gstreamer-1.0/libgstrsinter.so"
> +FILES:gstreamer1.0-plugins-rs-streamgrouper = "/usr/lib/gstreamer-1.0/libgststreamgrouper.so"
> +FILES:gstreamer1.0-plugins-rs-gopbuffer = "/usr/lib/gstreamer-1.0/libgstgopbuffer.so"
> +FILES:gstreamer1.0-plugins-rs-flavors = "/usr/lib/gstreamer-1.0/libgstrsflv.so"
> +FILES:gstreamer1.0-plugins-rs-isobmff = "/usr/lib/gstreamer-1.0/libgstisobmff.so"
> +FILES:gstreamer1.0-plugins-rs-aws = "/usr/lib/gstreamer-1.0/libgstaws.so"
> +FILES:gstreamer1.0-plugins-rs-deepgram = "/usr/lib/gstreamer-1.0/libgstdeepgram.so"
> +FILES:gstreamer1.0-plugins-rs-hlsmultivariantsink = "/usr/lib/gstreamer-1.0/libgsthlsmultivariantsink.so"
> +FILES:gstreamer1.0-plugins-rs-hlssink3 = "/usr/lib/gstreamer-1.0/libgsthlssink3.so"
> +FILES:gstreamer1.0-plugins-rs-icecast = "/usr/lib/gstreamer-1.0/libgsticecast.so"
> +FILES:gstreamer1.0-plugins-rs-mpegtslive = "/usr/lib/gstreamer-1.0/libgstmpegtslive.so"
> +FILES:gstreamer1.0-plugins-rs-ndi = "/usr/lib/gstreamer-1.0/libgstndi.so"
> +FILES:gstreamer1.0-plugins-rs-onvif = "/usr/lib/gstreamer-1.0/libgstrsonvif.so"
> +FILES:gstreamer1.0-plugins-rs-raptorq = "/usr/lib/gstreamer-1.0/libgstraptorq.so"
> +FILES:gstreamer1.0-plugins-rs-reqwest = "/usr/lib/gstreamer-1.0/libgstreqwest.so"
> +FILES:gstreamer1.0-plugins-rs-rtp = "/usr/lib/gstreamer-1.0/libgstrsrtp.so"
> +FILES:gstreamer1.0-plugins-rs-rtsp = "/usr/lib/gstreamer-1.0/libgstrsrtsp.so"
> +FILES:gstreamer1.0-plugins-rs-webrtchttp = "/usr/lib/gstreamer-1.0/libgstwebrtchttp.so"
> +FILES:gstreamer1.0-plugins-rs-webrtc = "/usr/lib/gstreamer-1.0/libgstrswebrtc.so"
> +FILES:gstreamer1.0-plugins-rs-quinn = "/usr/lib/gstreamer-1.0/libgstquinn.so"
> +FILES:gstreamer1.0-plugins-rs-textaccumulate = "/usr/lib/gstreamer-1.0/libgsttextaccumulate.so"
> +FILES:gstreamer1.0-plugins-rs-textahead = "/usr/lib/gstreamer-1.0/libgsttextahead.so"
> +FILES:gstreamer1.0-plugins-rs-json = "/usr/lib/gstreamer-1.0/libgstjson.so"
> +FILES:gstreamer1.0-plugins-rs-regex = "/usr/lib/gstreamer-1.0/libgstregex.so"
> +FILES:gstreamer1.0-plugins-rs-textwrap = "/usr/lib/gstreamer-1.0/libgsttextwrap.so"
> +FILES:gstreamer1.0-plugins-rs-fallbackswitch = "/usr/lib/gstreamer-1.0/libgstfallbackswitch.so"
> +FILES:gstreamer1.0-plugins-rs-livesync = "/usr/lib/gstreamer-1.0/libgstlivesync.so"
> +FILES:gstreamer1.0-plugins-rs-debugseimetainserter = "/usr/lib/gstreamer-1.0/libgstdebugseimetainserter.so"
> +FILES:gstreamer1.0-plugins-rs-togglerecord = "/usr/lib/gstreamer-1.0/libgsttogglerecord.so"
> +FILES:gstreamer1.0-plugins-rs-tracers = "/usr/lib/gstreamer-1.0/libgstrstracers.so"
> +FILES:gstreamer1.0-plugins-rs-uriplaylistbin = "/usr/lib/gstreamer-1.0/libgsturiplaylistbin.so"
> +FILES:gstreamer1.0-plugins-rs-validate = "/usr/lib/gstreamer-1.0/libgstrsvalidate.so"
> +FILES:gstreamer1.0-plugins-rs-cdg = "/usr/lib/gstreamer-1.0/libgstcdg.so"
> +FILES:gstreamer1.0-plugins-rs-closedcaption = "/usr/lib/gstreamer-1.0/libgstrsclosedcaption.so"
> +FILES:gstreamer1.0-plugins-rs-dav1d = "/usr/lib/gstreamer-1.0/libgstdav1d.so"
> +FILES:gstreamer1.0-plugins-rs-ffv1 = "/usr/lib/gstreamer-1.0/libgstffv1.so"
> +FILES:gstreamer1.0-plugins-rs-gif = "/usr/lib/gstreamer-1.0/libgstgif.so"
> +FILES:gstreamer1.0-plugins-rs-gtk4 = "/usr/lib/gstreamer-1.0/libgstgtk4.so"
> +FILES:gstreamer1.0-plugins-rs-hsv = "/usr/lib/gstreamer-1.0/libgsthsv.so"
> +FILES:gstreamer1.0-plugins-rs-png = "/usr/lib/gstreamer-1.0/libgstrspng.so"
> +FILES:gstreamer1.0-plugins-rs-rav1e = "/usr/lib/gstreamer-1.0/libgstrav1e.so"
> +FILES:gstreamer1.0-plugins-rs-skia = "/usr/lib/gstreamer-1.0/libgstskia.so"
> +FILES:gstreamer1.0-plugins-rs-videofx = "/usr/lib/gstreamer-1.0/libgstrsvideofx.so"
> +FILES:gstreamer1.0-plugins-rs-vvdec = "/usr/lib/gstreamer-1.0/libgstvvdec.so"
> +FILES:gstreamer1.0-plugins-rs-webp = "/usr/lib/gstreamer-1.0/libgstrswebp.so"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237562): https://lists.openembedded.org/g/openembedded-core/message/237562
> Mute This Topic: https://lists.openembedded.org/mt/119464494/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

