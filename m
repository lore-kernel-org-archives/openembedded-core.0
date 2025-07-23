Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1E9C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 23:02:29 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.75.1753311744679347389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 16:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fOp+rk+F;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-718389fb988so4310277b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 16:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753311743; x=1753916543; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgnopS+I4F7WiGbUqRM7l0zNeTHUnbO2WCrY+WMmYSc=;
        b=fOp+rk+FQMjcaTv8izd46pVxeOnhG5jPATdCpueRB3kOvg8KNYJZa0OQYEny57b5ly
         CND1+8QP1Aj+BSKyTtWCF0VV4vI71XhXLpR/AOVKvjHbEr3ndyAINodmcMUBYYxC7aBV
         7lTsHaZ8tKUOkce/yp5wpW6WxHiMNFtAFMZG2rGFDl12amYq0rP3BOnL/zdE4MUf3Xea
         LH7OO/fNhajuzR99ALtBE2jVZ+bYeMOELQdXazaKQoVB7vbblE56b+SB0xDH4NBAkxwB
         BoAlDDXc1dGujxsBjKVIJx97CbweAQUTytXoqZ5bUWDVhHps1MNifCDf2EHznJKSao48
         BhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753311743; x=1753916543;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgnopS+I4F7WiGbUqRM7l0zNeTHUnbO2WCrY+WMmYSc=;
        b=UYQf46JJyiYk/u9wj+F1UUadtEUIEVdWqHNW4DQgxVfxRWBLZBMmHCoik83WUp8i1c
         eQXrDBLPPMWLyqCnn5WmUbDb88xXKfo0q4bGEjOKpEIlAO5OH+h99LoCkz1ot321mqEa
         CvgbbzpivuWN5V0frNJnpT16IxDTM+QEDgM3l4pd7ZSengIsnArxl/uVnwXNYKG5Y760
         AX77Xuuyx+al2aOWRxXqMY+3f3l3EiYFvIH1gMfWUp1WIqcbpllWhrLOPczXpnwE9wBf
         JhLBMgvg3ENw32CwCW1QZYjXJBqQI3RztwpihFgL2F+cneI6YX1lkSET94gqRR6zmuAX
         ta9w==
X-Gm-Message-State: AOJu0YwempRsyfWpUn9dheOSpksfnSLkCymPMtRlC7ilVBL9YHD4rM+u
	VgcVc8p0gZTroSKwou0MHEmhGPEW3VE5dPsMDsO/KIf2avN7sWsLt7u4PPpU+swnUM+x74D+3pc
	I6BRlLiA52V3lvQv432OW+scFz/vKGbhBv//+
X-Gm-Gg: ASbGncsvZMPqS0Y+yWaTEoAgneNTN5pkQpnsIfmBwNQZ/ohvcyzXqbatGiQJo/mEYni
	83pKJQtpNXm9ZczxVCJJc2ypgvt5d3RjhMIteRyvb9wdIHyZwShzjCpSCErcUWXwXp7KVawAOCN
	8a/7g8+3GvuVTRS2XbiqXAYi5yZQJiAi+nFL7EW1KHrYpZyYfJk81qyTiIRUO1RRUFu3ToHis49
	VSjBd7E/p7siROHK4a20cVIXoWW0KaouGo1BIOq
X-Google-Smtp-Source: AGHT+IFqcLyi/12uqyTPowO851TF46W/NZ1WvKshwG4uNw6vec4I8K7RBj5ey/8T+9VTP7QVMHC2S6nxJhWgH/YcLZw=
X-Received: by 2002:a05:690c:6011:b0:718:38bd:bb47 with SMTP id
 00721157ae682-719b4372619mr55857837b3.42.1753311742380; Wed, 23 Jul 2025
 16:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250722183306.2236840-1-raj.khem@gmail.com> <20250722183306.2236840-2-raj.khem@gmail.com>
In-Reply-To: <20250722183306.2236840-2-raj.khem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Jul 2025 16:01:55 -0700
X-Gm-Features: Ac12FXyc7nSzpy8LkuryLzKgCvHZKdzbfMO3FCV-jtdMXenBuWq93-AlFeC1Foo
Message-ID: <CAMKF1soK6rRiw49+_rSpEexg9c2ShH7yD+3DPEv=MV0QwV1x7w@mail.gmail.com>
Subject: Re: [PATCH 2/2] cargo-c: Upgrade to 0.10.14+cargo-0.89.0
To: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 23:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220814

Please hold on to this patch. I will send a v2 with a different fix fo
rv32 case.

On Tue, Jul 22, 2025 at 11:33=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> Fix build on riscv32 while here.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/cargo-c-crates.inc | 498 +++++++++---------
>  ...Use-libc-SYS_futex_time64-on-riscv32.patch |  53 ++
>  ...Use-libc-SYS_futex_time64-on-riscv32.patch |  66 +++
>  ...8.0.bb =3D> cargo-c_0.10.14+cargo-0.89.0.bb} |   7 +-
>  4 files changed, 386 insertions(+), 238 deletions(-)
>  create mode 100644 meta/recipes-devtools/rust/cargo-c/0001-getrandom-Use=
-libc-SYS_futex_time64-on-riscv32.patch
>  create mode 100644 meta/recipes-devtools/rust/cargo-c/0001-parking-lot-U=
se-libc-SYS_futex_time64-on-riscv32.patch
>  rename meta/recipes-devtools/rust/{cargo-c_0.10.13+cargo-0.88.0.bb =3D> =
cargo-c_0.10.14+cargo-0.89.0.bb} (52%)
>
> diff --git a/meta/recipes-devtools/rust/cargo-c-crates.inc b/meta/recipes=
-devtools/rust/cargo-c-crates.inc
> index ab0b0d09e1e..c7d333ce6ed 100644
> --- a/meta/recipes-devtools/rust/cargo-c-crates.inc
> +++ b/meta/recipes-devtools/rust/cargo-c-crates.inc
> @@ -2,57 +2,58 @@
>
>  # from Cargo.lock
>  SRC_URI +=3D " \
> -    crate://crates.io/adler2/2.0.0 \
> +    crate://crates.io/adler2/2.0.1 \
>      crate://crates.io/ahash/0.8.12 \
>      crate://crates.io/aho-corasick/1.1.3 \
>      crate://crates.io/allocator-api2/0.2.21 \
>      crate://crates.io/annotate-snippets/0.11.5 \
> -    crate://crates.io/anstream/0.6.18 \
> -    crate://crates.io/anstyle/1.0.10 \
> -    crate://crates.io/anstyle-parse/0.2.6 \
> -    crate://crates.io/anstyle-query/1.1.2 \
> -    crate://crates.io/anstyle-wincon/3.0.7 \
> +    crate://crates.io/anstream/0.6.19 \
> +    crate://crates.io/anstyle/1.0.11 \
> +    crate://crates.io/anstyle-parse/0.2.7 \
> +    crate://crates.io/anstyle-query/1.1.3 \
> +    crate://crates.io/anstyle-wincon/3.0.9 \
>      crate://crates.io/anyhow/1.0.98 \
>      crate://crates.io/arc-swap/1.7.1 \
>      crate://crates.io/arrayref/0.3.9 \
>      crate://crates.io/arrayvec/0.7.6 \
> -    crate://crates.io/autocfg/1.4.0 \
> +    crate://crates.io/autocfg/1.5.0 \
>      crate://crates.io/base16ct/0.2.0 \
>      crate://crates.io/base64/0.22.1 \
> -    crate://crates.io/base64ct/1.7.3 \
> +    crate://crates.io/base64ct/1.8.0 \
>      crate://crates.io/bitflags/2.9.1 \
>      crate://crates.io/bitmaps/2.1.0 \
>      crate://crates.io/blake3/1.8.2 \
>      crate://crates.io/block-buffer/0.10.4 \
>      crate://crates.io/bstr/1.12.0 \
> -    crate://crates.io/bumpalo/3.17.0 \
> +    crate://crates.io/bumpalo/3.19.0 \
> +    crate://crates.io/byteorder/1.5.0 \
>      crate://crates.io/bytes/1.10.1 \
> -    crate://crates.io/cargo/0.88.0 \
> +    crate://crates.io/cargo/0.89.0 \
>      crate://crates.io/cargo-credential/0.4.8 \
> -    crate://crates.io/cargo-credential-libsecret/0.4.13 \
> -    crate://crates.io/cargo-credential-macos-keychain/0.4.13 \
> -    crate://crates.io/cargo-credential-wincred/0.4.13 \
> -    crate://crates.io/cargo-platform/0.2.0 \
> -    crate://crates.io/cargo-util/0.2.20 \
> -    crate://crates.io/cargo-util-schemas/0.8.1 \
> -    crate://crates.io/cbindgen/0.28.0 \
> -    crate://crates.io/cc/1.2.22 \
> -    crate://crates.io/cfg-if/1.0.0 \
> -    crate://crates.io/clap/4.5.38 \
> -    crate://crates.io/clap_builder/4.5.38 \
> -    crate://crates.io/clap_complete/4.5.50 \
> -    crate://crates.io/clap_derive/4.5.32 \
> -    crate://crates.io/clap_lex/0.7.4 \
> +    crate://crates.io/cargo-credential-libsecret/0.4.14 \
> +    crate://crates.io/cargo-credential-macos-keychain/0.4.14 \
> +    crate://crates.io/cargo-credential-wincred/0.4.14 \
> +    crate://crates.io/cargo-platform/0.3.0 \
> +    crate://crates.io/cargo-util/0.2.21 \
> +    crate://crates.io/cargo-util-schemas/0.8.2 \
> +    crate://crates.io/cbindgen/0.29.0 \
> +    crate://crates.io/cc/1.2.27 \
> +    crate://crates.io/cfg-if/1.0.1 \
> +    crate://crates.io/clap/4.5.40 \
> +    crate://crates.io/clap_builder/4.5.40 \
> +    crate://crates.io/clap_complete/4.5.54 \
> +    crate://crates.io/clap_derive/4.5.40 \
> +    crate://crates.io/clap_lex/0.7.5 \
>      crate://crates.io/clru/0.6.2 \
>      crate://crates.io/color-print/0.3.7 \
>      crate://crates.io/color-print-proc-macro/0.3.7 \
> -    crate://crates.io/colorchoice/1.0.3 \
> +    crate://crates.io/colorchoice/1.0.4 \
>      crate://crates.io/const-oid/0.9.6 \
>      crate://crates.io/constant_time_eq/0.3.1 \
> -    crate://crates.io/core-foundation/0.10.0 \
> +    crate://crates.io/core-foundation/0.10.1 \
>      crate://crates.io/core-foundation-sys/0.8.7 \
>      crate://crates.io/cpufeatures/0.2.17 \
> -    crate://crates.io/crates-io/0.40.10 \
> +    crate://crates.io/crates-io/0.40.11 \
>      crate://crates.io/crc32fast/1.4.2 \
>      crate://crates.io/crossbeam-channel/0.5.15 \
>      crate://crates.io/crossbeam-deque/0.8.6 \
> @@ -60,9 +61,9 @@ SRC_URI +=3D " \
>      crate://crates.io/crossbeam-utils/0.8.21 \
>      crate://crates.io/crypto-bigint/0.5.5 \
>      crate://crates.io/crypto-common/0.1.6 \
> -    crate://crates.io/ct-codecs/1.1.5 \
> -    crate://crates.io/curl/0.4.47 \
> -    crate://crates.io/curl-sys/0.4.80+curl-8.12.1 \
> +    crate://crates.io/ct-codecs/1.1.6 \
> +    crate://crates.io/curl/0.4.48 \
> +    crate://crates.io/curl-sys/0.4.82+curl-8.14.1 \
>      crate://crates.io/dbus/0.9.7 \
>      crate://crates.io/der/0.7.10 \
>      crate://crates.io/deranged/0.4.0 \
> @@ -76,15 +77,16 @@ SRC_URI +=3D " \
>      crate://crates.io/encoding_rs/0.8.35 \
>      crate://crates.io/equivalent/1.0.2 \
>      crate://crates.io/erased-serde/0.4.6 \
> -    crate://crates.io/errno/0.3.12 \
> +    crate://crates.io/errno/0.3.13 \
>      crate://crates.io/fallible-iterator/0.3.0 \
>      crate://crates.io/fallible-streaming-iterator/0.1.9 \
>      crate://crates.io/faster-hex/0.9.0 \
> +    crate://crates.io/faster-hex/0.10.0 \
>      crate://crates.io/fastrand/2.3.0 \
>      crate://crates.io/ff/0.13.1 \
> -    crate://crates.io/fiat-crypto/0.2.9 \
> +    crate://crates.io/fiat-crypto/0.3.0 \
>      crate://crates.io/filetime/0.2.25 \
> -    crate://crates.io/flate2/1.1.1 \
> +    crate://crates.io/flate2/1.1.2 \
>      crate://crates.io/fnv/1.0.7 \
>      crate://crates.io/foldhash/0.1.5 \
>      crate://crates.io/foreign-types/0.3.2 \
> @@ -95,63 +97,68 @@ SRC_URI +=3D " \
>      crate://crates.io/getrandom/0.3.3 \
>      crate://crates.io/git2/0.20.2 \
>      crate://crates.io/git2-curl/0.21.0 \
> -    crate://crates.io/gix/0.70.0 \
> -    crate://crates.io/gix-actor/0.33.2 \
> -    crate://crates.io/gix-attributes/0.24.0 \
> +    crate://crates.io/gix/0.71.0 \
> +    crate://crates.io/gix-actor/0.34.0 \
> +    crate://crates.io/gix-attributes/0.25.0 \
>      crate://crates.io/gix-bitmap/0.2.14 \
>      crate://crates.io/gix-chunk/0.4.11 \
> -    crate://crates.io/gix-command/0.4.1 \
> -    crate://crates.io/gix-commitgraph/0.26.0 \
> -    crate://crates.io/gix-config/0.43.0 \
> +    crate://crates.io/gix-command/0.5.0 \
> +    crate://crates.io/gix-commitgraph/0.27.0 \
> +    crate://crates.io/gix-config/0.44.0 \
>      crate://crates.io/gix-config-value/0.14.12 \
> -    crate://crates.io/gix-credentials/0.27.0 \
> +    crate://crates.io/gix-credentials/0.28.0 \
>      crate://crates.io/gix-date/0.9.4 \
> -    crate://crates.io/gix-diff/0.50.0 \
> -    crate://crates.io/gix-dir/0.12.0 \
> -    crate://crates.io/gix-discover/0.38.0 \
> -    crate://crates.io/gix-features/0.40.0 \
> -    crate://crates.io/gix-filter/0.17.0 \
> -    crate://crates.io/gix-fs/0.13.0 \
> -    crate://crates.io/gix-glob/0.18.0 \
> -    crate://crates.io/gix-hash/0.16.0 \
> -    crate://crates.io/gix-hashtable/0.7.0 \
> -    crate://crates.io/gix-ignore/0.13.0 \
> -    crate://crates.io/gix-index/0.38.0 \
> -    crate://crates.io/gix-lock/16.0.0 \
> -    crate://crates.io/gix-negotiate/0.18.0 \
> -    crate://crates.io/gix-object/0.47.0 \
> -    crate://crates.io/gix-odb/0.67.0 \
> -    crate://crates.io/gix-pack/0.57.0 \
> +    crate://crates.io/gix-diff/0.51.0 \
> +    crate://crates.io/gix-dir/0.13.0 \
> +    crate://crates.io/gix-discover/0.39.0 \
> +    crate://crates.io/gix-features/0.41.1 \
> +    crate://crates.io/gix-features/0.42.1 \
> +    crate://crates.io/gix-filter/0.18.0 \
> +    crate://crates.io/gix-fs/0.14.0 \
> +    crate://crates.io/gix-fs/0.15.0 \
> +    crate://crates.io/gix-glob/0.19.0 \
> +    crate://crates.io/gix-hash/0.17.0 \
> +    crate://crates.io/gix-hash/0.18.0 \
> +    crate://crates.io/gix-hashtable/0.8.1 \
> +    crate://crates.io/gix-ignore/0.14.0 \
> +    crate://crates.io/gix-index/0.39.0 \
> +    crate://crates.io/gix-lock/17.1.0 \
> +    crate://crates.io/gix-negotiate/0.19.0 \
> +    crate://crates.io/gix-object/0.48.0 \
> +    crate://crates.io/gix-odb/0.68.0 \
> +    crate://crates.io/gix-pack/0.58.0 \
>      crate://crates.io/gix-packetline/0.18.4 \
>      crate://crates.io/gix-packetline-blocking/0.18.3 \
>      crate://crates.io/gix-path/0.10.18 \
> -    crate://crates.io/gix-pathspec/0.9.0 \
> -    crate://crates.io/gix-prompt/0.9.1 \
> -    crate://crates.io/gix-protocol/0.48.0 \
> -    crate://crates.io/gix-quote/0.4.15 \
> -    crate://crates.io/gix-ref/0.50.0 \
> -    crate://crates.io/gix-refspec/0.28.0 \
> -    crate://crates.io/gix-revision/0.32.0 \
> -    crate://crates.io/gix-revwalk/0.18.0 \
> +    crate://crates.io/gix-pathspec/0.10.0 \
> +    crate://crates.io/gix-prompt/0.10.0 \
> +    crate://crates.io/gix-protocol/0.49.0 \
> +    crate://crates.io/gix-quote/0.5.0 \
> +    crate://crates.io/gix-ref/0.51.0 \
> +    crate://crates.io/gix-refspec/0.29.0 \
> +    crate://crates.io/gix-revision/0.33.0 \
> +    crate://crates.io/gix-revwalk/0.19.0 \
>      crate://crates.io/gix-sec/0.10.12 \
> -    crate://crates.io/gix-shallow/0.2.0 \
> -    crate://crates.io/gix-submodule/0.17.0 \
> -    crate://crates.io/gix-tempfile/16.0.0 \
> +    crate://crates.io/gix-shallow/0.3.0 \
> +    crate://crates.io/gix-submodule/0.18.0 \
> +    crate://crates.io/gix-tempfile/17.1.0 \
>      crate://crates.io/gix-trace/0.1.12 \
> -    crate://crates.io/gix-transport/0.45.0 \
> -    crate://crates.io/gix-traverse/0.44.0 \
> -    crate://crates.io/gix-url/0.29.0 \
> -    crate://crates.io/gix-utils/0.1.14 \
> +    crate://crates.io/gix-transport/0.46.0 \
> +    crate://crates.io/gix-traverse/0.45.0 \
> +    crate://crates.io/gix-url/0.30.0 \
> +    crate://crates.io/gix-utils/0.2.0 \
> +    crate://crates.io/gix-utils/0.3.0 \
>      crate://crates.io/gix-validate/0.9.4 \
>      crate://crates.io/gix-validate/0.10.0 \
> -    crate://crates.io/gix-worktree/0.39.0 \
> +    crate://crates.io/gix-worktree/0.40.0 \
>      crate://crates.io/glob/0.3.2 \
>      crate://crates.io/globset/0.4.16 \
>      crate://crates.io/group/0.13.0 \
> +    crate://crates.io/hash32/0.3.1 \
>      crate://crates.io/hashbrown/0.14.5 \
> -    crate://crates.io/hashbrown/0.15.3 \
> +    crate://crates.io/hashbrown/0.15.4 \
>      crate://crates.io/hashlink/0.10.0 \
> -    crate://crates.io/heck/0.4.1 \
> +    crate://crates.io/heapless/0.8.0 \
>      crate://crates.io/heck/0.5.0 \
>      crate://crates.io/hex/0.4.3 \
>      crate://crates.io/hkdf/0.12.4 \
> @@ -162,21 +169,21 @@ SRC_URI +=3D " \
>      crate://crates.io/icu_locale_core/2.0.0 \
>      crate://crates.io/icu_normalizer/2.0.0 \
>      crate://crates.io/icu_normalizer_data/2.0.0 \
> -    crate://crates.io/icu_properties/2.0.0 \
> -    crate://crates.io/icu_properties_data/2.0.0 \
> +    crate://crates.io/icu_properties/2.0.1 \
> +    crate://crates.io/icu_properties_data/2.0.1 \
>      crate://crates.io/icu_provider/2.0.0 \
>      crate://crates.io/idna/1.0.3 \
>      crate://crates.io/idna_adapter/1.2.1 \
>      crate://crates.io/ignore/0.4.23 \
>      crate://crates.io/im-rc/15.1.0 \
>      crate://crates.io/implib/0.3.5 \
> -    crate://crates.io/indexmap/2.9.0 \
> +    crate://crates.io/indexmap/2.10.0 \
>      crate://crates.io/is_executable/1.0.4 \
>      crate://crates.io/is_terminal_polyfill/1.70.1 \
>      crate://crates.io/itertools/0.14.0 \
>      crate://crates.io/itoa/1.0.15 \
> -    crate://crates.io/jiff/0.2.13 \
> -    crate://crates.io/jiff-static/0.2.13 \
> +    crate://crates.io/jiff/0.2.15 \
> +    crate://crates.io/jiff-static/0.2.15 \
>      crate://crates.io/jiff-tzdb/0.1.4 \
>      crate://crates.io/jiff-tzdb-platform/0.1.3 \
>      crate://crates.io/jobserver/0.1.33 \
> @@ -184,27 +191,28 @@ SRC_URI +=3D " \
>      crate://crates.io/kstring/2.0.2 \
>      crate://crates.io/lazy_static/1.5.0 \
>      crate://crates.io/lazycell/1.3.0 \
> -    crate://crates.io/libc/0.2.172 \
> +    crate://crates.io/libc/0.2.174 \
>      crate://crates.io/libdbus-sys/0.2.5 \
> -    crate://crates.io/libgit2-sys/0.18.1+1.9.0 \
> -    crate://crates.io/libloading/0.8.7 \
> +    crate://crates.io/libgit2-sys/0.18.2+1.9.1 \
> +    crate://crates.io/libloading/0.8.8 \
>      crate://crates.io/libnghttp2-sys/0.1.11+1.64.0 \
> -    crate://crates.io/libredox/0.1.3 \
> -    crate://crates.io/libsqlite3-sys/0.31.0 \
> +    crate://crates.io/libredox/0.1.4 \
> +    crate://crates.io/libsqlite3-sys/0.32.0 \
>      crate://crates.io/libssh2-sys/0.3.1 \
> +    crate://crates.io/libz-rs-sys/0.5.1 \
>      crate://crates.io/libz-sys/1.1.22 \
>      crate://crates.io/linux-raw-sys/0.4.15 \
>      crate://crates.io/linux-raw-sys/0.9.4 \
>      crate://crates.io/litemap/0.8.0 \
> -    crate://crates.io/lock_api/0.4.12 \
> +    crate://crates.io/lock_api/0.4.13 \
>      crate://crates.io/log/0.4.27 \
>      crate://crates.io/matchers/0.1.0 \
>      crate://crates.io/maybe-async/0.2.10 \
> -    crate://crates.io/memchr/2.7.4 \
> +    crate://crates.io/memchr/2.7.5 \
>      crate://crates.io/memmap2/0.9.5 \
>      crate://crates.io/memoffset/0.9.1 \
>      crate://crates.io/minimal-lexical/0.2.1 \
> -    crate://crates.io/miniz_oxide/0.8.8 \
> +    crate://crates.io/miniz_oxide/0.8.9 \
>      crate://crates.io/miow/0.6.0 \
>      crate://crates.io/nom/7.1.3 \
>      crate://crates.io/normpath/1.3.0 \
> @@ -212,28 +220,31 @@ SRC_URI +=3D " \
>      crate://crates.io/num-conv/0.1.0 \
>      crate://crates.io/num-traits/0.2.19 \
>      crate://crates.io/object/0.36.7 \
> +    crate://crates.io/object/0.37.1 \
>      crate://crates.io/once_cell/1.21.3 \
> +    crate://crates.io/once_cell_polyfill/1.70.1 \
>      crate://crates.io/opener/0.7.2 \
> -    crate://crates.io/openssl/0.10.57 \
> +    crate://crates.io/openssl/0.10.73 \
>      crate://crates.io/openssl-macros/0.1.1 \
>      crate://crates.io/openssl-probe/0.1.6 \
>      crate://crates.io/openssl-src/300.5.0+3.5.0 \
> -    crate://crates.io/openssl-sys/0.9.108 \
> +    crate://crates.io/openssl-sys/0.9.109 \
>      crate://crates.io/ordered-float/2.10.1 \
> -    crate://crates.io/orion/0.17.10 \
> -    crate://crates.io/os_info/3.11.0 \
> +    crate://crates.io/orion/0.17.11 \
> +    crate://crates.io/os_info/3.12.0 \
>      crate://crates.io/overload/0.1.1 \
>      crate://crates.io/p384/0.13.1 \
> -    crate://crates.io/parking_lot/0.12.3 \
> -    crate://crates.io/parking_lot_core/0.9.10 \
> -    crate://crates.io/pasetors/0.7.4 \
> +    crate://crates.io/parking_lot/0.12.4 \
> +    crate://crates.io/parking_lot_core/0.9.11 \
> +    crate://crates.io/pasetors/0.7.6 \
>      crate://crates.io/pathdiff/0.2.3 \
>      crate://crates.io/pem-rfc7468/0.7.0 \
>      crate://crates.io/percent-encoding/2.3.1 \
>      crate://crates.io/pin-project-lite/0.2.16 \
>      crate://crates.io/pkcs8/0.10.2 \
>      crate://crates.io/pkg-config/0.3.32 \
> -    crate://crates.io/portable-atomic/1.11.0 \
> +    crate://crates.io/plist/1.7.2 \
> +    crate://crates.io/portable-atomic/1.11.1 \
>      crate://crates.io/portable-atomic-util/0.2.4 \
>      crate://crates.io/potential_utf/0.1.2 \
>      crate://crates.io/powerfmt/0.2.0 \
> @@ -241,24 +252,25 @@ SRC_URI +=3D " \
>      crate://crates.io/primeorder/0.13.6 \
>      crate://crates.io/proc-macro2/1.0.95 \
>      crate://crates.io/prodash/29.0.2 \
> +    crate://crates.io/quick-xml/0.37.5 \
>      crate://crates.io/quote/1.0.40 \
> -    crate://crates.io/r-efi/5.2.0 \
> +    crate://crates.io/r-efi/5.3.0 \
>      crate://crates.io/rand/0.9.1 \
>      crate://crates.io/rand_chacha/0.9.0 \
>      crate://crates.io/rand_core/0.6.4 \
>      crate://crates.io/rand_core/0.9.3 \
>      crate://crates.io/rand_xoshiro/0.6.0 \
> -    crate://crates.io/redox_syscall/0.5.12 \
> +    crate://crates.io/redox_syscall/0.5.13 \
>      crate://crates.io/regex/1.11.1 \
>      crate://crates.io/regex-automata/0.1.10 \
>      crate://crates.io/regex-automata/0.4.9 \
>      crate://crates.io/regex-syntax/0.6.29 \
>      crate://crates.io/regex-syntax/0.8.5 \
>      crate://crates.io/rfc6979/0.4.0 \
> -    crate://crates.io/rusqlite/0.33.0 \
> +    crate://crates.io/rusqlite/0.34.0 \
>      crate://crates.io/rustc-hash/2.1.1 \
>      crate://crates.io/rustc-stable-hash/0.1.2 \
> -    crate://crates.io/rustfix/0.9.0 \
> +    crate://crates.io/rustfix/0.9.1 \
>      crate://crates.io/rustix/0.38.44 \
>      crate://crates.io/rustix/1.0.7 \
>      crate://crates.io/ryu/1.0.20 \
> @@ -275,9 +287,9 @@ SRC_URI +=3D " \
>      crate://crates.io/serde_derive/1.0.219 \
>      crate://crates.io/serde_ignored/0.1.12 \
>      crate://crates.io/serde_json/1.0.140 \
> -    crate://crates.io/serde_spanned/0.6.8 \
> +    crate://crates.io/serde_spanned/0.6.9 \
>      crate://crates.io/sha1/0.10.6 \
> -    crate://crates.io/sha1_smol/1.0.1 \
> +    crate://crates.io/sha1-checked/0.10.0 \
>      crate://crates.io/sha2/0.10.9 \
>      crate://crates.io/sharded-slab/0.1.7 \
>      crate://crates.io/shell-escape/0.1.5 \
> @@ -285,8 +297,8 @@ SRC_URI +=3D " \
>      crate://crates.io/shlex/1.3.0 \
>      crate://crates.io/signature/2.2.0 \
>      crate://crates.io/sized-chunks/0.6.5 \
> -    crate://crates.io/smallvec/1.15.0 \
> -    crate://crates.io/socket2/0.5.9 \
> +    crate://crates.io/smallvec/1.15.1 \
> +    crate://crates.io/socket2/0.5.10 \
>      crate://crates.io/spki/0.7.3 \
>      crate://crates.io/stable_deref_trait/1.2.0 \
>      crate://crates.io/static_assertions/1.1.0 \
> @@ -294,7 +306,7 @@ SRC_URI +=3D " \
>      crate://crates.io/subtle/2.6.1 \
>      crate://crates.io/supports-hyperlinks/3.1.0 \
>      crate://crates.io/supports-unicode/3.0.0 \
> -    crate://crates.io/syn/2.0.101 \
> +    crate://crates.io/syn/2.0.104 \
>      crate://crates.io/synstructure/0.13.2 \
>      crate://crates.io/tar/0.4.44 \
>      crate://crates.io/tempfile/3.20.0 \
> @@ -303,21 +315,21 @@ SRC_URI +=3D " \
>      crate://crates.io/thiserror/2.0.12 \
>      crate://crates.io/thiserror-impl/1.0.69 \
>      crate://crates.io/thiserror-impl/2.0.12 \
> -    crate://crates.io/thread_local/1.1.8 \
> +    crate://crates.io/thread_local/1.1.9 \
>      crate://crates.io/time/0.3.41 \
>      crate://crates.io/time-core/0.1.4 \
>      crate://crates.io/time-macros/0.2.22 \
>      crate://crates.io/tinystr/0.8.1 \
>      crate://crates.io/tinyvec/1.9.0 \
>      crate://crates.io/tinyvec_macros/0.1.1 \
> -    crate://crates.io/toml/0.8.22 \
> -    crate://crates.io/toml_datetime/0.6.9 \
> -    crate://crates.io/toml_edit/0.22.26 \
> -    crate://crates.io/toml_write/0.1.1 \
> +    crate://crates.io/toml/0.8.23 \
> +    crate://crates.io/toml_datetime/0.6.11 \
> +    crate://crates.io/toml_edit/0.22.27 \
> +    crate://crates.io/toml_write/0.1.2 \
>      crate://crates.io/tracing/0.1.41 \
> -    crate://crates.io/tracing-attributes/0.1.28 \
> +    crate://crates.io/tracing-attributes/0.1.30 \
>      crate://crates.io/tracing-chrome/0.7.2 \
> -    crate://crates.io/tracing-core/0.1.33 \
> +    crate://crates.io/tracing-core/0.1.34 \
>      crate://crates.io/tracing-log/0.2.0 \
>      crate://crates.io/tracing-subscriber/0.3.19 \
>      crate://crates.io/typeid/1.0.3 \
> @@ -326,7 +338,7 @@ SRC_URI +=3D " \
>      crate://crates.io/unicode-bom/2.0.3 \
>      crate://crates.io/unicode-ident/1.0.18 \
>      crate://crates.io/unicode-normalization/0.1.24 \
> -    crate://crates.io/unicode-width/0.2.0 \
> +    crate://crates.io/unicode-width/0.2.1 \
>      crate://crates.io/unicode-xid/0.2.6 \
>      crate://crates.io/url/2.5.4 \
>      crate://crates.io/utf8_iter/1.0.4 \
> @@ -335,7 +347,7 @@ SRC_URI +=3D " \
>      crate://crates.io/vcpkg/0.2.15 \
>      crate://crates.io/version_check/0.9.5 \
>      crate://crates.io/walkdir/2.5.0 \
> -    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> +    crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
>      crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
>      crate://crates.io/wasm-bindgen/0.2.100 \
>      crate://crates.io/wasm-bindgen-backend/0.2.100 \
> @@ -349,9 +361,10 @@ SRC_URI +=3D " \
>      crate://crates.io/windows-sys/0.48.0 \
>      crate://crates.io/windows-sys/0.52.0 \
>      crate://crates.io/windows-sys/0.59.0 \
> +    crate://crates.io/windows-sys/0.60.2 \
>      crate://crates.io/windows-targets/0.48.5 \
>      crate://crates.io/windows-targets/0.52.6 \
> -    crate://crates.io/windows-targets/0.53.0 \
> +    crate://crates.io/windows-targets/0.53.2 \
>      crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
>      crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
>      crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
> @@ -375,73 +388,74 @@ SRC_URI +=3D " \
>      crate://crates.io/windows_x86_64_msvc/0.48.5 \
>      crate://crates.io/windows_x86_64_msvc/0.52.6 \
>      crate://crates.io/windows_x86_64_msvc/0.53.0 \
> -    crate://crates.io/winnow/0.6.26 \
> -    crate://crates.io/winnow/0.7.10 \
> +    crate://crates.io/winnow/0.7.11 \
>      crate://crates.io/wit-bindgen-rt/0.39.0 \
>      crate://crates.io/writeable/0.6.1 \
>      crate://crates.io/yoke/0.8.0 \
>      crate://crates.io/yoke-derive/0.8.0 \
> -    crate://crates.io/zerocopy/0.8.25 \
> -    crate://crates.io/zerocopy-derive/0.8.25 \
> +    crate://crates.io/zerocopy/0.8.26 \
> +    crate://crates.io/zerocopy-derive/0.8.26 \
>      crate://crates.io/zerofrom/0.1.6 \
>      crate://crates.io/zerofrom-derive/0.1.6 \
>      crate://crates.io/zeroize/1.8.1 \
>      crate://crates.io/zerotrie/0.2.2 \
>      crate://crates.io/zerovec/0.11.2 \
>      crate://crates.io/zerovec-derive/0.11.1 \
> +    crate://crates.io/zlib-rs/0.5.1 \
>  "
>
> -SRC_URI[adler2-2.0.0.sha256sum] =3D "512761e0bb2578dd7380c6baaa0f4ce03e8=
4f95e960231d1dec8bf4d7d6e2627"
> +SRC_URI[adler2-2.0.1.sha256sum] =3D "320119579fcad9c21884f5c4861d16174d0=
e06250625266f50fe6898340abefa"
>  SRC_URI[ahash-0.8.12.sha256sum] =3D "5a15f179cd60c4584b8a8c596927aadc462=
e27f2ca70c04e0071964a73ba7a75"
>  SRC_URI[aho-corasick-1.1.3.sha256sum] =3D "8e60d3430d3a69478ad0993f19238=
d2df97c507009a52b3c10addcd7f6bcb916"
>  SRC_URI[allocator-api2-0.2.21.sha256sum] =3D "683d7910e743518b0e34f1186f=
92494becacb047c7b6bf616c96772180fef923"
>  SRC_URI[annotate-snippets-0.11.5.sha256sum] =3D "710e8eae58854cdc1790fcb=
56cca04d712a17be849eeb81da2a724bf4bae2bc4"
> -SRC_URI[anstream-0.6.18.sha256sum] =3D "8acc5369981196006228e28809f76187=
5c0327210a891e941f4c683b3a99529b"
> -SRC_URI[anstyle-1.0.10.sha256sum] =3D "55cc3b69f167a1ef2e161439aa98aed94=
e6028e5f9a59be9a6ffb47aef1651f9"
> -SRC_URI[anstyle-parse-0.2.6.sha256sum] =3D "3b2d16507662817a6a20a9ea92df=
6652ee4f94f914589377d69f3b21bc5798a9"
> -SRC_URI[anstyle-query-1.1.2.sha256sum] =3D "79947af37f4177cfead1110013d6=
78905c37501914fba0efea834c3fe9a8d60c"
> -SRC_URI[anstyle-wincon-3.0.7.sha256sum] =3D "ca3534e77181a9cc07539ad51f2=
141fe32f6c3ffd4df76db8ad92346b003ae4e"
> +SRC_URI[anstream-0.6.19.sha256sum] =3D "301af1932e46185686725e0fad2f8f2a=
a7da69dd70bf6ecc44d6b703844a3933"
> +SRC_URI[anstyle-1.0.11.sha256sum] =3D "862ed96ca487e809f1c8e5a8447f6ee2c=
f102f846893800b20cebdf541fc6bbd"
> +SRC_URI[anstyle-parse-0.2.7.sha256sum] =3D "4e7644824f0aa2c7b9384579234e=
f10eb7efb6a0deb83f9630a49594dd9c15c2"
> +SRC_URI[anstyle-query-1.1.3.sha256sum] =3D "6c8bdeb6047d8983be085bab0ba1=
472e6dc604e7041dbf6fcd5e71523014fae9"
> +SRC_URI[anstyle-wincon-3.0.9.sha256sum] =3D "403f75924867bb1033c59fbf079=
7484329750cfbe3c4325cd33127941fabc882"
>  SRC_URI[anyhow-1.0.98.sha256sum] =3D "e16d2d3311acee920a9eb8d33b8cbc1787=
ce4a264e85f964c2404b969bdcd487"
>  SRC_URI[arc-swap-1.7.1.sha256sum] =3D "69f7f8c3906b62b754cd5326047894316=
021dcfe5a194c8ea52bdd94934a3457"
>  SRC_URI[arrayref-0.3.9.sha256sum] =3D "76a2e8124351fda1ef8aaaa3bbd7ebbcb=
486bbcd4225aca0aa0d84bb2db8fecb"
>  SRC_URI[arrayvec-0.7.6.sha256sum] =3D "7c02d123df017efcdfbd739ef81735b36=
c5ba83ec3c59c80a9d7ecc718f92e50"
> -SRC_URI[autocfg-1.4.0.sha256sum] =3D "ace50bade8e6234aa140d9a2f552bbee1d=
b4d353f69b8217bc503490fc1a9f26"
> +SRC_URI[autocfg-1.5.0.sha256sum] =3D "c08606f8c3cbf4ce6ec8e28fb0014a2c08=
6708fe954eaa885384a6165172e7e8"
>  SRC_URI[base16ct-0.2.0.sha256sum] =3D "4c7f02d4ea65f2c1853089ffd8d2787bd=
bc63de2f0d29dedbcf8ccdfa0ccd4cf"
>  SRC_URI[base64-0.22.1.sha256sum] =3D "72b3254f16251a8381aa12e40e3c4d2f01=
99f8c6508fbecb9d91f575e0fbb8c6"
> -SRC_URI[base64ct-1.7.3.sha256sum] =3D "89e25b6adfb930f02d1981565a6e5d9c5=
47ac15a96606256d3b59040e5cd4ca3"
> +SRC_URI[base64ct-1.8.0.sha256sum] =3D "55248b47b0caf0546f798890658877998=
1c43bb1bc9d0c44087278f80cdb44ba"
>  SRC_URI[bitflags-2.9.1.sha256sum] =3D "1b8e56985ec62d17e9c1001dc89c88ecd=
7dc08e47eba5ec7c29c7b5eeecde967"
>  SRC_URI[bitmaps-2.1.0.sha256sum] =3D "031043d04099746d8db04daf1fa424b2bc=
8bd69d92b25962dcde24da39ab64a2"
>  SRC_URI[blake3-1.8.2.sha256sum] =3D "3888aaa89e4b2a40fca9848e400f6a658a5=
a3978de7be858e209cafa8be9a4a0"
>  SRC_URI[block-buffer-0.10.4.sha256sum] =3D "3078c7629b62d3f0439517fa3949=
96acacc5cbc91c5a20d8c658e77abd503a71"
>  SRC_URI[bstr-1.12.0.sha256sum] =3D "234113d19d0d7d613b40e86fb654acf95891=
0802bcceab913a4f9e7cda03b1a4"
> -SRC_URI[bumpalo-3.17.0.sha256sum] =3D "1628fb46dfa0b37568d12e5edd512553e=
ccf6a22a78e8bde00bb4aed84d5bdbf"
> +SRC_URI[bumpalo-3.19.0.sha256sum] =3D "46c5e41b57b8bba42a04676d81cb89e9e=
e8e859a1a66f80a5a72e1cb76b34d43"
> +SRC_URI[byteorder-1.5.0.sha256sum] =3D "1fd0f2584146f6f2ef48085050886acf=
353beff7305ebd1ae69500e27c67f64b"
>  SRC_URI[bytes-1.10.1.sha256sum] =3D "d71b6127be86fdcfddb610f7182ac57211d=
4b18a3e9c82eb2d17662f2227ad6a"
> -SRC_URI[cargo-0.88.0.sha256sum] =3D "e3266d7f10870d970f22fd244b5d4bb017f=
723247e6743f2283f6fe63a4f6084"
> +SRC_URI[cargo-0.89.0.sha256sum] =3D "4ffb868a2869728e8cad2afd836cf7f287f=
5e9379f2e857deea187abfd7c5cfd"
>  SRC_URI[cargo-credential-0.4.8.sha256sum] =3D "ac1ef5080adde1db190e90188=
4d2c400990856c2a23201c5a181b910a6dbdf2a"
> -SRC_URI[cargo-credential-libsecret-0.4.13.sha256sum] =3D "02d4e8e593dd39=
67cf90d6ae8e0e820abbb9ba168c4015dc04d90abc80477b8b"
> -SRC_URI[cargo-credential-macos-keychain-0.4.13.sha256sum] =3D "4037e5af4=
bd682580c82143a0a22d9fd2ae6e57ee8b9ea7110dabcf1160828cc"
> -SRC_URI[cargo-credential-wincred-0.4.13.sha256sum] =3D "320491fd2d43703f=
e8685cc844af75eba650d32f51a26a9f37ec8fd0d426a738"
> -SRC_URI[cargo-platform-0.2.0.sha256sum] =3D "84982c6c0ae343635a3a4ee6ded=
ef965513735c8b183caa7289fa6e27399ebd4"
> -SRC_URI[cargo-util-0.2.20.sha256sum] =3D "d767bc85f367f6483a6072430b56f5=
c0d6ee7636751a21a800526d0711753d76"
> -SRC_URI[cargo-util-schemas-0.8.1.sha256sum] =3D "ea8b01266e95c3cf839fe62=
6e651fa36a9171033caa917a773d7a0ba1d5ce6be"
> -SRC_URI[cbindgen-0.28.0.sha256sum] =3D "eadd868a2ce9ca38de7eeafdcec9c706=
5ef89b42b32f0839278d55f35c54d1ff"
> -SRC_URI[cc-1.2.22.sha256sum] =3D "32db95edf998450acc7881c932f94cd9b05c87=
b4b2599e8bab064753da4acfd1"
> -SRC_URI[cfg-if-1.0.0.sha256sum] =3D "baf1de4339761588bc0619e3cbc0120ee58=
2ebb74b53b4efbf79117bd2da40fd"
> -SRC_URI[clap-4.5.38.sha256sum] =3D "ed93b9805f8ba930df42c2590f05453d5ec3=
6cbb85d018868a5b24d31f6ac000"
> -SRC_URI[clap_builder-4.5.38.sha256sum] =3D "379026ff283facf611b0ea629334=
361c4211d1b12ee01024eec1591133b04120"
> -SRC_URI[clap_complete-4.5.50.sha256sum] =3D "c91d3baa3bcd889d60e6ef28874=
126a0b384fd225ab83aa6d8a801c519194ce1"
> -SRC_URI[clap_derive-4.5.32.sha256sum] =3D "09176aae279615badda0765c0c0b3=
f6ed53f4709118af73cf4655d85d1530cd7"
> -SRC_URI[clap_lex-0.7.4.sha256sum] =3D "f46ad14479a25103f283c0f10005961cf=
086d8dc42205bb44c46ac563475dca6"
> +SRC_URI[cargo-credential-libsecret-0.4.14.sha256sum] =3D "d4c6e10380bfa2=
5a4f1495e6ca7256332857e3ef7bb16adf376641e6af03acaf"
> +SRC_URI[cargo-credential-macos-keychain-0.4.14.sha256sum] =3D "123e35709=
92ff3f899a62eefd482e131dea655df8c08150ae559bda2ff492836"
> +SRC_URI[cargo-credential-wincred-0.4.14.sha256sum] =3D "0310db795786db4b=
be6cc00f30099ff6a157bb78f9f590376e5e1005866a68d3"
> +SRC_URI[cargo-platform-0.3.0.sha256sum] =3D "8abf5d501fd757c2d2ee78d0cc4=
0f606e92e3a63544420316565556ed28485e2"
> +SRC_URI[cargo-util-0.2.21.sha256sum] =3D "c95ec8b2485b20aed818bd7460f8ee=
cc6c87c35c84191b353a3aba9aa1736c36"
> +SRC_URI[cargo-util-schemas-0.8.2.sha256sum] =3D "7dc1a6f7b5651af85774ae5=
a34b4e8be397d9cf4bc063b7e6dbd99a841837830"
> +SRC_URI[cbindgen-0.29.0.sha256sum] =3D "975982cdb7ad6a142be15bdf84aea7ec=
6a9e5d4d797c004d43185b24cfe4e684"
> +SRC_URI[cc-1.2.27.sha256sum] =3D "d487aa071b5f64da6f19a3e848e3578944b726=
ee5a4854b82172f02aa876bfdc"
> +SRC_URI[cfg-if-1.0.1.sha256sum] =3D "9555578bc9e57714c812a1f84e4fc5b4d21=
fcb063490c624de019f7464c91268"
> +SRC_URI[clap-4.5.40.sha256sum] =3D "40b6887a1d8685cebccf115538db5c0efe62=
5ccac9696ad45c409d96566e910f"
> +SRC_URI[clap_builder-4.5.40.sha256sum] =3D "e0c66c08ce9f0c698cbce5c0279d=
0bb6ac936d8674174fe48f736533b964f59e"
> +SRC_URI[clap_complete-4.5.54.sha256sum] =3D "aad5b1b4de04fead402672b4889=
7030eec1f3bfe1550776322f59f6d6e6a5677"
> +SRC_URI[clap_derive-4.5.40.sha256sum] =3D "d2c7947ae4cc3d851207c1adb5b5e=
260ff0cca11446b1d6d1423788e442257ce"
> +SRC_URI[clap_lex-0.7.5.sha256sum] =3D "b94f61472cee1439c0b966b47e3aca9ae=
07e45d070759512cd390ea2bebc6675"
>  SRC_URI[clru-0.6.2.sha256sum] =3D "cbd0f76e066e64fdc5631e3bb46381254deab=
9ef1158292f27c8c57e3bf3fe59"
>  SRC_URI[color-print-0.3.7.sha256sum] =3D "3aa954171903797d5623e047d9ab69=
d91b493657917bdfb8c2c80ecaf9cdb6f4"
>  SRC_URI[color-print-proc-macro-0.3.7.sha256sum] =3D "692186b5ebe54007e45=
a59aea47ece9eb4108e141326c304cdc91699a7118a22"
> -SRC_URI[colorchoice-1.0.3.sha256sum] =3D "5b63caa9aa9397e2d9480a9b136738=
56c78d8ac123288526c37d7839f2a86990"
> +SRC_URI[colorchoice-1.0.4.sha256sum] =3D "b05b61dc5112cbb17e4b6cd61790d9=
845d13888356391624cbe7e41efeac1e75"
>  SRC_URI[const-oid-0.9.6.sha256sum] =3D "c2459377285ad874054d797f3ccebf98=
4978aa39129f6eafde5cdc8315b612f8"
>  SRC_URI[constant_time_eq-0.3.1.sha256sum] =3D "7c74b8349d32d297c9134b8c8=
8677813a227df8f779daa29bfc29c183fe3dca6"
> -SRC_URI[core-foundation-0.10.0.sha256sum] =3D "b55271e5c8c478ad3f38ad24e=
f34923091e0548492a266d19b3c0b4d82574c63"
> +SRC_URI[core-foundation-0.10.1.sha256sum] =3D "b2a6cd9ae233e7f62ba4e9353=
e81a88df7fc8a5987b8d445b4d90c879bd156f6"
>  SRC_URI[core-foundation-sys-0.8.7.sha256sum] =3D "773648b94d0e5d620f64f2=
80777445740e61fe701025087ec8b57f45c791888b"
>  SRC_URI[cpufeatures-0.2.17.sha256sum] =3D "59ed5838eebb26a2bb2e58f6d5b53=
16989ae9d08bab10e0e6d103e656d1b0280"
> -SRC_URI[crates-io-0.40.10.sha256sum] =3D "9c15b946f2bbd53f5be858ed02fcac=
feb3646f3ca67b24defc276a01edd10de6"
> +SRC_URI[crates-io-0.40.11.sha256sum] =3D "9d8912d1316660f138aa2dec2c20e3=
8633449fb7a3b2b8fcbf1698ac31941b8e"
>  SRC_URI[crc32fast-1.4.2.sha256sum] =3D "a97769d94ddab943e4510d138150169a=
2758b5ef3eb191a9ee688de3e23ef7b3"
>  SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D "82b8f8f868b36967f960679=
0d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
>  SRC_URI[crossbeam-deque-0.8.6.sha256sum] =3D "9dd111b7b7f7d55b72c0a6ae36=
1660ee5853c9af73f70c3c2ef6858b950e2e51"
> @@ -449,9 +463,9 @@ SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D "5b82ac=
4a3c2ca9c3460964f020e1402edd5
>  SRC_URI[crossbeam-utils-0.8.21.sha256sum] =3D "d0a5c400df2834b80a4c3327b=
3aad3a4c4cd4de0629063962b03235697506a28"
>  SRC_URI[crypto-bigint-0.5.5.sha256sum] =3D "0dc92fb57ca44df6db8059111ab3=
af99a63d5d0f8375d9972e319a379c6bab76"
>  SRC_URI[crypto-common-0.1.6.sha256sum] =3D "1bfb12502f3fc46cca1bb51ac28d=
f9d618d813cdc3d2f25b9fe775a34af26bb3"
> -SRC_URI[ct-codecs-1.1.5.sha256sum] =3D "dd0d274c65cbc1c34703d2fc2ce0fb89=
2ff68f4516b677671a2f238a30b9b2b2"
> -SRC_URI[curl-0.4.47.sha256sum] =3D "d9fb4d13a1be2b58f14d60adba57c9834b78=
c62fd86c3e76a148f732686e9265"
> -SRC_URI[curl-sys-0.4.80+curl-8.12.1.sha256sum] =3D "55f7df2eac63200c3ab2=
5bde3b2268ef2ee56af3d238e76d61f01c3c49bff734"
> +SRC_URI[ct-codecs-1.1.6.sha256sum] =3D "9b10589d1a5e400d61f9f38f12f884cf=
d080ff345de8f17efda36fe0e4a02aa8"
> +SRC_URI[curl-0.4.48.sha256sum] =3D "9e2d5c8f48d9c0c23250e52b55e82a6ab4fd=
ba6650c931f5a0a57a43abda812b"
> +SRC_URI[curl-sys-0.4.82+curl-8.14.1.sha256sum] =3D "c4d63638b5ec65f1a4ae=
945287b3fd035be4554bbaf211901159c9a2a74fb5be"
>  SRC_URI[dbus-0.9.7.sha256sum] =3D "1bb21987b9fb1613058ba3843121dd18b163b=
254d8a6e797e144cbac14d96d1b"
>  SRC_URI[der-0.7.10.sha256sum] =3D "e7c1832837b905bbfb5101e07cc24c8deddf5=
2f93225eee6ead5f4d63d53ddcb"
>  SRC_URI[deranged-0.4.0.sha256sum] =3D "9c9e6a11ca8224451684bc0d7d5a7adbf=
8f2fd6887261a1cfc3c0432f9d4068e"
> @@ -465,15 +479,16 @@ SRC_URI[elliptic-curve-0.13.8.sha256sum] =3D "b5e60=
43086bf7973472e0c7dff2142ea0b68
>  SRC_URI[encoding_rs-0.8.35.sha256sum] =3D "75030f3c4f45dafd7586dd6780965=
a8c7e8e285a5ecb86713e63a79c5b2766f3"
>  SRC_URI[equivalent-1.0.2.sha256sum] =3D "877a4ace8713b0bcf2a4e7eec82529c=
029f1d0619886d18145fea96c3ffe5c0f"
>  SRC_URI[erased-serde-0.4.6.sha256sum] =3D "e004d887f51fcb9fef17317a2f352=
5c887d8aa3f4f50fed920816a688284a5b7"
> -SRC_URI[errno-0.3.12.sha256sum] =3D "cea14ef9355e3beab063703aa9dab15afd2=
5f0667c341310c1e5274bb1d0da18"
> +SRC_URI[errno-0.3.13.sha256sum] =3D "778e2ac28f6c47af28e4907f13ffd1e1ddb=
d400980a9abd7c8df189bf578a5ad"
>  SRC_URI[fallible-iterator-0.3.0.sha256sum] =3D "2acce4a10f12dc2fb14a2185=
89d4f1f62ef011b2d0cc4b3cb1bba8e94da14649"
>  SRC_URI[fallible-streaming-iterator-0.1.9.sha256sum] =3D "7360491ce676a3=
6bf9bb3c56c1aa791658183a54d2744120f27285738d90465a"
>  SRC_URI[faster-hex-0.9.0.sha256sum] =3D "a2a2b11eda1d40935b26cf18f6833c5=
26845ae8c41e58d09af6adeb6f0269183"
> +SRC_URI[faster-hex-0.10.0.sha256sum] =3D "7223ae2d2f179b803433d9c8304785=
27e92b8117eab39460edae7f1614d9fb73"
>  SRC_URI[fastrand-2.3.0.sha256sum] =3D "37909eebbb50d72f9059c3b6d82c0463f=
2ff062c9e95845c43a6c9c0355411be"
>  SRC_URI[ff-0.13.1.sha256sum] =3D "c0b50bfb653653f9ca9095b427bed08ab8d75a=
137839d9ad64eb11810d5b6393"
> -SRC_URI[fiat-crypto-0.2.9.sha256sum] =3D "28dea519a9695b9977216879a3ebfd=
df92f1c08c05d984f8996aecd6ecdc811d"
> +SRC_URI[fiat-crypto-0.3.0.sha256sum] =3D "64cd1e32ddd350061ae6edb1b082d7=
c54915b5c672c389143b9a63403a109f24"
>  SRC_URI[filetime-0.2.25.sha256sum] =3D "35c0522e981e68cbfa8c3f978441a5f3=
4b30b96e146b33cd3359176b50fe8586"
> -SRC_URI[flate2-1.1.1.sha256sum] =3D "7ced92e76e966ca2fd84c8f7aa01a4aea65=
b0eb6648d72f7c8f3e2764a67fece"
> +SRC_URI[flate2-1.1.2.sha256sum] =3D "4a3d7db9596fecd151c5f638c0ee5d5bd48=
7b6e0ea232e5dc96d5250f6f94b1d"
>  SRC_URI[fnv-1.0.7.sha256sum] =3D "3f9eec918d3f24069decb9af1554cad7c880e2=
da24a9afd88aca000531ab82c1"
>  SRC_URI[foldhash-0.1.5.sha256sum] =3D "d9c4f5dac5e15c24eb999c26181a6ca40=
b39fe946cbe4c263c7209467bc83af2"
>  SRC_URI[foreign-types-0.3.2.sha256sum] =3D "f6f339eb8adc052cd2ca78910fda=
869aefa38d22d5cb648e6485e4d3fc06f3b1"
> @@ -484,63 +499,68 @@ SRC_URI[getrandom-0.2.16.sha256sum] =3D "335ff9f135=
e4384c8150d6f27c6daed433577f86b
>  SRC_URI[getrandom-0.3.3.sha256sum] =3D "26145e563e54f2cadc477553f1ec5ee6=
50b00862f0a58bcd12cbdc5f0ea2d2f4"
>  SRC_URI[git2-0.20.2.sha256sum] =3D "2deb07a133b1520dc1a5690e9bd089501088=
73d7ed5de38dcc74d3b5ebffa110"
>  SRC_URI[git2-curl-0.21.0.sha256sum] =3D "be8dcabbc09ece4d30a9aa983d58042=
03b7e2f8054a171f792deff59b56d31fa"
> -SRC_URI[gix-0.70.0.sha256sum] =3D "736f14636705f3a56ea52b553e67282519418=
d9a35bb1e90b3a9637a00296b68"
> -SRC_URI[gix-actor-0.33.2.sha256sum] =3D "20018a1a6332e065f1fcc8305c1c932=
c6b8c9985edea2284b3c79dc6fa3ee4b2"
> -SRC_URI[gix-attributes-0.24.0.sha256sum] =3D "f151000bf662ef5f641eca6102=
d942ee31ace80f271a3ef642e99776ce6ddb38"
> +SRC_URI[gix-0.71.0.sha256sum] =3D "a61e71ec6817fc3c9f12f812682cfe51ee6ea=
0d2e27e02fc3849c35524617435"
> +SRC_URI[gix-actor-0.34.0.sha256sum] =3D "f438c87d4028aca4b82f82ba8d8ab15=
69823cfb3e5bc5fa8456a71678b2a20e7"
> +SRC_URI[gix-attributes-0.25.0.sha256sum] =3D "e4e25825e0430aa11096f8b65c=
ed6780d4a96a133f81904edceebb5344c8dd7f"
>  SRC_URI[gix-bitmap-0.2.14.sha256sum] =3D "b1db9765c69502650da68f0804e3dc=
2b5f8ccc6a2d104ca6c85bc40700d37540"
>  SRC_URI[gix-chunk-0.4.11.sha256sum] =3D "0b1f1d8764958699dc764e3f727cef2=
80ff4d1bd92c107bbf8acd85b30c1bd6f"
> -SRC_URI[gix-command-0.4.1.sha256sum] =3D "cb410b84d6575db45e62025a9118bd=
bf4d4b099ce7575a76161e898d9ca98df1"
> -SRC_URI[gix-commitgraph-0.26.0.sha256sum] =3D "e23a8ec2d8a16026a10dafdb6=
ed51bcfd08f5d97f20fa52e200bc50cb72e4877"
> -SRC_URI[gix-config-0.43.0.sha256sum] =3D "377c1efd2014d5d469e0b3cd2952c8=
097bce9828f634e04d5665383249f1d9e9"
> +SRC_URI[gix-command-0.5.0.sha256sum] =3D "c0378995847773a697f8e157fe2963=
ecf3462fe64be05b7b3da000b3b472def8"
> +SRC_URI[gix-commitgraph-0.27.0.sha256sum] =3D "043cbe49b7a7505150db975f3=
cb7c15833335ac1e26781f615454d9d640a28fe"
> +SRC_URI[gix-config-0.44.0.sha256sum] =3D "9c6f830bf746604940261b49abf7f6=
55d2c19cadc9f4142ae9379e3a316e8cfa"
>  SRC_URI[gix-config-value-0.14.12.sha256sum] =3D "8dc2c844c4cf141884678ca=
bef736fd91dd73068b9146e6f004ba1a0457944b6"
> -SRC_URI[gix-credentials-0.27.0.sha256sum] =3D "cf950f9ee1690bb9c4388b515=
2baa8a9f41ad61e5cf1ba0ec8c207b08dab9e45"
> +SRC_URI[gix-credentials-0.28.0.sha256sum] =3D "25322308aaf65789536b860d2=
1137c3f7b69004ac4971c15c1abb08d3951c062"
>  SRC_URI[gix-date-0.9.4.sha256sum] =3D "daa30058ec7d3511fbc229e4f9e696a35=
abd07ec5b82e635eff864a2726217e4"
> -SRC_URI[gix-diff-0.50.0.sha256sum] =3D "62afb7f4ca0acdf4e9dad92065b2eb1b=
f2993bcc5014b57bc796e3a365b17c4d"
> -SRC_URI[gix-dir-0.12.0.sha256sum] =3D "c1d78db3927a12f7d1b788047b84efaca=
ab03ef25738bd1c77856ad8966bd57b"
> -SRC_URI[gix-discover-0.38.0.sha256sum] =3D "d0c2414bdf04064e0f5a5aa029df=
da1e663cf9a6c4bfc8759f2d369299bb65d8"
> -SRC_URI[gix-features-0.40.0.sha256sum] =3D "8bfdd4838a8d42bd482c9f0cb526=
411d003ee94cc7c7b08afe5007329c71d554"
> -SRC_URI[gix-filter-0.17.0.sha256sum] =3D "bdcc36cd7dbc63ed0ec35586458865=
53d1afd3cd09daa5efb9cba9cceb942bbb"
> -SRC_URI[gix-fs-0.13.0.sha256sum] =3D "182e7fa7bfdf44ffb7cfe7451b373cdf1e=
00870ac9a488a49587a110c562063d"
> -SRC_URI[gix-glob-0.18.0.sha256sum] =3D "4e9c7249fa0a78f9b363aa58323db71e=
0a6161fd69860ed6f48dedf0ef3a314e"
> -SRC_URI[gix-hash-0.16.0.sha256sum] =3D "e81c5ec48649b1821b3ed066a44efb95=
f1a268b35c1d91295e61252539fbe9f8"
> -SRC_URI[gix-hashtable-0.7.0.sha256sum] =3D "189130bc372accd02e0520dc5ab1=
cef318dcc2bc829b76ab8d84bbe90ac212d1"
> -SRC_URI[gix-ignore-0.13.0.sha256sum] =3D "4f529dcb80bf9855c0a7c49f0ac588=
df6d6952d63a63fefc254b9c869d2cdf6f"
> -SRC_URI[gix-index-0.38.0.sha256sum] =3D "acd12e3626879369310fffe2ac61acc=
828613ef656b50c4ea984dd59d7dc85d8"
> -SRC_URI[gix-lock-16.0.0.sha256sum] =3D "9739815270ff6940968441824d162df9=
433db19211ca9ba8c3fc1b50b849c642"
> -SRC_URI[gix-negotiate-0.18.0.sha256sum] =3D "a6a8af1ef7bbe303d30b55312b7=
f4d33e955de43a3642ae9b7347c623d80ef80"
> -SRC_URI[gix-object-0.47.0.sha256sum] =3D "ddc4b3a0044244f0fe22347fb7a79c=
ca165e37829d668b41b85ff46a43e5fd68"
> -SRC_URI[gix-odb-0.67.0.sha256sum] =3D "3e93457df69cd09573608ce9fa4f443fb=
d84bc8d15d8d83adecd471058459c1b"
> -SRC_URI[gix-pack-0.57.0.sha256sum] =3D "fc13a475b3db735617017fb35f816079=
bf503765312d4b1913b18cf96f3fa515"
> +SRC_URI[gix-diff-0.51.0.sha256sum] =3D "a2c975dad2afc85e4e233f444d1efbe4=
36c3cdcf3a07173984509c436d00a3f8"
> +SRC_URI[gix-dir-0.13.0.sha256sum] =3D "5879497bd3815d8277ed864ec8975290a=
70de5b62bb92d2d666a4cefc5d4793b"
> +SRC_URI[gix-discover-0.39.0.sha256sum] =3D "f7fb8a4349b854506a3915de18d3=
341e5f1daa6b489c8affc9ca0d69efe86781"
> +SRC_URI[gix-features-0.41.1.sha256sum] =3D "016d6050219458d14520fe22bdfd=
eb9cb71631dec9bc2724767c983f60109634"
> +SRC_URI[gix-features-0.42.1.sha256sum] =3D "56f4399af6ec4fd9db84dd4cf965=
6c5c785ab492ab40a7c27ea92b4241923fed"
> +SRC_URI[gix-filter-0.18.0.sha256sum] =3D "cb2b2bbffdc5cc9b2b82fc82da1b98=
163c9b423ac2b45348baa83a947ac9ab89"
> +SRC_URI[gix-fs-0.14.0.sha256sum] =3D "951e886120dc5fa8cac053e5e5c89443f1=
2368ca36811b2e43d1539081f9c111"
> +SRC_URI[gix-fs-0.15.0.sha256sum] =3D "67a0637149b4ef24d3ea55f81f77231401=
c8463fae6da27331c987957eb597c7"
> +SRC_URI[gix-glob-0.19.0.sha256sum] =3D "20972499c03473e773a2099e5fd0c695=
b9b72465837797a51a43391a1635a030"
> +SRC_URI[gix-hash-0.17.0.sha256sum] =3D "834e79722063958b03342edaa1e17595=
cd2939bb2b3306b3225d0815566dcb49"
> +SRC_URI[gix-hash-0.18.0.sha256sum] =3D "8d4900562c662852a6b42e2ef03442ec=
cebf24f047d8eab4f23bc12ef0d785d8"
> +SRC_URI[gix-hashtable-0.8.1.sha256sum] =3D "b5b5cb3c308b4144f2612ff64e32=
130e641279fcf1a84d8d40dad843b4f64904"
> +SRC_URI[gix-ignore-0.14.0.sha256sum] =3D "9a27c8380f493a10d1457f756a3f81=
924d578fc08d6535e304dfcafbf0261d18"
> +SRC_URI[gix-index-0.39.0.sha256sum] =3D "855bece2d4153453aa5d0a80d51deea=
1ce8cd6a3b4cf213da85ac344ccb908a7"
> +SRC_URI[gix-lock-17.1.0.sha256sum] =3D "570f8b034659f256366dc90f1a249249=
02f20acccd6a15be96d44d1269e7a796"
> +SRC_URI[gix-negotiate-0.19.0.sha256sum] =3D "dad912acf5a68a7defa48360143=
37ff4381af8c3c098f41f818a8c524285e57b"
> +SRC_URI[gix-object-0.48.0.sha256sum] =3D "4943fcdae6ffc135920c9ea71e0362=
ed539182924ab7a85dd9dac8d89b0dd69a"
> +SRC_URI[gix-odb-0.68.0.sha256sum] =3D "50306d40dcc982eb6b7593103f066ea62=
89c7b094cb9db14f3cd2be0b9f5e610"
> +SRC_URI[gix-pack-0.58.0.sha256sum] =3D "9b65fffb09393c26624ca408d32cfe87=
76fb94cd0a5cdf984905e1d2f39779cb"
>  SRC_URI[gix-packetline-0.18.4.sha256sum] =3D "123844a70cf4d5352441dc06ba=
b0da8aef61be94ec239cb631e0ba01dc6d3a04"
>  SRC_URI[gix-packetline-blocking-0.18.3.sha256sum] =3D "1ecf3ea2e105c7e45=
587bac04099824301262a6c43357fad5205da36dbb233b3"
>  SRC_URI[gix-path-0.10.18.sha256sum] =3D "567f65fec4ef10dfab97ae71f26a27f=
d4d7fe7b8e3f90c8a58551c41ff3fb65b"
> -SRC_URI[gix-pathspec-0.9.0.sha256sum] =3D "6430d3a686c08e9d59019806faa78=
c17315fe22ae73151a452195857ca02f86c"
> -SRC_URI[gix-prompt-0.9.1.sha256sum] =3D "79f2185958e1512b989a007509df8d6=
1dca014aa759a22bee80cfa6c594c3b6d"
> -SRC_URI[gix-protocol-0.48.0.sha256sum] =3D "6c61bd61afc6b67d213241e21003=
94c164be421e3f7228d3521b04f48ca5ba90"
> -SRC_URI[gix-quote-0.4.15.sha256sum] =3D "e49357fccdb0c85c0d3a3292a9f6db3=
2d9b3535959b5471bb9624908f4a066c6"
> -SRC_URI[gix-ref-0.50.0.sha256sum] =3D "47adf4c5f933429f8554e95d0d92eee58=
3cfe4b95d2bf665cd6fd4a1531ee20c"
> -SRC_URI[gix-refspec-0.28.0.sha256sum] =3D "59650228d8f612f68e7f7a25f517f=
cf386c5d0d39826085492e94766858b0a90"
> -SRC_URI[gix-revision-0.32.0.sha256sum] =3D "3fe28bbccca55da6d66e6c6efc6b=
b4003c29d407afd8178380293729733e6b53"
> -SRC_URI[gix-revwalk-0.18.0.sha256sum] =3D "d4ecb80c235b1e9ef2b99b23a81ea=
50dd569a88a9eb767179793269e0e616247"
> +SRC_URI[gix-pathspec-0.10.0.sha256sum] =3D "fef8422c3c9066d649074b240251=
25963f85232bfad32d6d16aea9453b82ec14"
> +SRC_URI[gix-prompt-0.10.0.sha256sum] =3D "fbf9cbf6239fd32f2c2c9c57eeb4e9=
b28fa1c9b779fa0e3b7c455eb1ca49d5f0"
> +SRC_URI[gix-protocol-0.49.0.sha256sum] =3D "5678ddae1d62880bc30e2200be1b=
9387af3372e0e88e21f81b4e7f8367355b5a"
> +SRC_URI[gix-quote-0.5.0.sha256sum] =3D "1b005c550bf84de3b24aa5e540a23e61=
46a1c01c7d30470e35d75a12f827f969"
> +SRC_URI[gix-ref-0.51.0.sha256sum] =3D "b2e1f7eb6b7ce82d2d19961f74bd637ba=
b3ea79b1bc7bfb23dbefc67b0415d8b"
> +SRC_URI[gix-refspec-0.29.0.sha256sum] =3D "1d8587b21e2264a6e8938d940c5c9=
9662779c13a10741a5737b15fc85c252ffc"
> +SRC_URI[gix-revision-0.33.0.sha256sum] =3D "342caa4e158df3020cadf62f6563=
07c3948fe4eacfdf67171d7212811860c3e9"
> +SRC_URI[gix-revwalk-0.19.0.sha256sum] =3D "2dc7c3d7e5cdc1ab8d35130106e4a=
f0a4f9f9eca0c81f4312b690780e92bde0d"
>  SRC_URI[gix-sec-0.10.12.sha256sum] =3D "47aeb0f13de9ef2f3033f5ff218de30f=
44db827ac9f1286f9ef050aacddd5888"
> -SRC_URI[gix-shallow-0.2.0.sha256sum] =3D "ab72543011e303e52733c85bef7846=
03ef39632ddf47f69723def52825e35066"
> -SRC_URI[gix-submodule-0.17.0.sha256sum] =3D "74972fe8d46ac8a09490ae1e843=
b4caf221c5b157c5ac17057e8e1c38417a3ac"
> -SRC_URI[gix-tempfile-16.0.0.sha256sum] =3D "2558f423945ef24a8328c55d1fd6=
db06b8376b0e7013b1bb476cc4ffdf678501"
> +SRC_URI[gix-shallow-0.3.0.sha256sum] =3D "cc0598aacfe1d52575a21c9492fee0=
86edbb21e228ec36c819c42ab923f434c3"
> +SRC_URI[gix-submodule-0.18.0.sha256sum] =3D "78c7390c2059505c365e9548016=
d4edc9f35749c6a9112b7b1214400bbc68da2"
> +SRC_URI[gix-tempfile-17.1.0.sha256sum] =3D "c750e8c008453a2dba67a2b0d928=
b7716e05da31173a3f5e351d5457ad4470aa"
>  SRC_URI[gix-trace-0.1.12.sha256sum] =3D "7c396a2036920c69695f760a65e7f26=
77267ccf483f25046977d87e4cb2665f7"
> -SRC_URI[gix-transport-0.45.0.sha256sum] =3D "11187418489477b1b5b862ae1ae=
dbbac77e582f2c4b0ef54280f20cfe5b964d9"
> -SRC_URI[gix-traverse-0.44.0.sha256sum] =3D "2bec70e53896586ef32a3efa7e44=
27b67308531ed186bb6120fb3eca0f0d61b4"
> -SRC_URI[gix-url-0.29.0.sha256sum] =3D "29218c768b53dd8f116045d87fec05b29=
4c731a4b2bdd257eeca2084cc150b13"
> -SRC_URI[gix-utils-0.1.14.sha256sum] =3D "ff08f24e03ac8916c478c8419d7d3c3=
3393da9bb41fa4c24455d5406aeefd35f"
> +SRC_URI[gix-transport-0.46.0.sha256sum] =3D "b3f68c2870bfca8278389d2484a=
7f2215b67d0b0cc5277d3c72ad72acf41787e"
> +SRC_URI[gix-traverse-0.45.0.sha256sum] =3D "36c0b049f8bdb61b20016694102f=
7b507f2e1727e83e9c5e6dad4f7d84ff7384"
> +SRC_URI[gix-url-0.30.0.sha256sum] =3D "48dfe23f93f1ddb84977d80bb0dd7aa09=
d1bf5d5afc0c9b6820cccacc25ae860"
> +SRC_URI[gix-utils-0.2.0.sha256sum] =3D "189f8724cf903e7fd57cfe0b7bc209db=
255cacdcb22c781a022f52c3a774f8d0"
> +SRC_URI[gix-utils-0.3.0.sha256sum] =3D "5351af2b172caf41a3728eb4455326d8=
4e0d70fe26fc4de74ab0bd37df4191c5"
>  SRC_URI[gix-validate-0.9.4.sha256sum] =3D "34b5f1253109da6c79ed7cf6e1e38=
437080bb6d704c76af14c93e2f255234084"
>  SRC_URI[gix-validate-0.10.0.sha256sum] =3D "77b9e00cacde5b51388d28ed746c=
493b18a6add1f19b5e01d686b3b9ece66d4d"
> -SRC_URI[gix-worktree-0.39.0.sha256sum] =3D "6673512f7eaa57a6876adceca697=
8a501d6c6569a4f177767dc405f8b9778958"
> +SRC_URI[gix-worktree-0.40.0.sha256sum] =3D "f7760dbc4b79aa274fed30adc0d4=
1dca6b917641f26e7867c4071b1fb4dc727b"
>  SRC_URI[glob-0.3.2.sha256sum] =3D "a8d1add55171497b4705a648c6b583acafb01=
d58050a51727785f0b2c8e0a2b2"
>  SRC_URI[globset-0.4.16.sha256sum] =3D "54a1028dfc5f5df5da8a56a73e6c153c9=
a9708ec57232470703592a3f18e49f5"
>  SRC_URI[group-0.13.0.sha256sum] =3D "f0f9ef7462f7c099f518d754361858f86d8=
a07af53ba9af0fe635bbccb151a63"
> +SRC_URI[hash32-0.3.1.sha256sum] =3D "47d60b12902ba28e2730cd37e95b8c9223a=
f2808df9e902d4df49588d1470606"
>  SRC_URI[hashbrown-0.14.5.sha256sum] =3D "e5274423e17b7c9fc20b6e7e208532f=
9b19825d82dfd615708b70edd83df41f1"
> -SRC_URI[hashbrown-0.15.3.sha256sum] =3D "84b26c544d002229e640969970a2e74=
021aadf6e2f96372b9c58eff97de08eb3"
> +SRC_URI[hashbrown-0.15.4.sha256sum] =3D "5971ac85611da7067dbfcabef3c70eb=
b5606018acd9e2a3903a0da507521e0d5"
>  SRC_URI[hashlink-0.10.0.sha256sum] =3D "7382cf6263419f2d8df38c55d7da83da=
5c18aef87fc7a7fc1fb1e344edfe14c1"
> -SRC_URI[heck-0.4.1.sha256sum] =3D "95505c38b4572b2d910cecb0281560f54b440=
a19336cbbcb27bf6ce6adc6f5a8"
> +SRC_URI[heapless-0.8.0.sha256sum] =3D "0bfb9eb618601c89945a70e254898da93=
b13be0388091d42117462b265bb3fad"
>  SRC_URI[heck-0.5.0.sha256sum] =3D "2304e00983f87ffb38b55b444b5e3b60a884b=
5d30c0fca7d82fe33449bbe55ea"
>  SRC_URI[hex-0.4.3.sha256sum] =3D "7f24254aa9a54b5c858eaee2f5bccdb46aaf0e=
486a595ed5fd8f86ba55232a70"
>  SRC_URI[hkdf-0.12.4.sha256sum] =3D "7b5f8eb2ad728638ea2c7d47a21db23b7b58=
a72ed6a38256b8a1849f15fbbdf7"
> @@ -551,21 +571,21 @@ SRC_URI[icu_collections-2.0.0.sha256sum] =3D "20007=
2f5d0e3614556f94a9930d5dc3e0662
>  SRC_URI[icu_locale_core-2.0.0.sha256sum] =3D "0cde2700ccaed3872079a65fb1=
a78f6c0a36c91570f28755dda67bc8f7d9f00a"
>  SRC_URI[icu_normalizer-2.0.0.sha256sum] =3D "436880e8e18df4d7bbc06d58432=
329d6458cc84531f7ac5f024e93deadb37979"
>  SRC_URI[icu_normalizer_data-2.0.0.sha256sum] =3D "00210d6893afc98edb752b=
664b8890f0ef174c8adbb8d0be9710fa66fbbf72d3"
> -SRC_URI[icu_properties-2.0.0.sha256sum] =3D "2549ca8c7241c82f59c80ba2a6f=
415d931c5b58d24fb8412caa1a1f02c49139a"
> -SRC_URI[icu_properties_data-2.0.0.sha256sum] =3D "8197e866e47b68f8f7d952=
49e172903bec06004b18b2937f1095d40a0c57de04"
> +SRC_URI[icu_properties-2.0.1.sha256sum] =3D "016c619c1eeb94efb86809b015c=
58f479963de65bdb6253345c1a1276f22e32b"
> +SRC_URI[icu_properties_data-2.0.1.sha256sum] =3D "298459143998310acd25ff=
e6810ed544932242d3f07083eee1084d83a71bd632"
>  SRC_URI[icu_provider-2.0.0.sha256sum] =3D "03c80da27b5f4187909049ee2d72f=
276f0d9f99a42c306bd0131ecfe04d8e5af"
>  SRC_URI[idna-1.0.3.sha256sum] =3D "686f825264d630750a544639377bae7376280=
43f20d38bbc029e8f29ea968a7e"
>  SRC_URI[idna_adapter-1.2.1.sha256sum] =3D "3acae9609540aa318d1bc58845522=
5fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
>  SRC_URI[ignore-0.4.23.sha256sum] =3D "6d89fd380afde86567dfba715db0656739=
89d6253f42b88179abd3eae47bda4b"
>  SRC_URI[im-rc-15.1.0.sha256sum] =3D "af1955a75fa080c677d3972822ec4bad316=
169ab1cfc6c257a942c2265dbe5fe"
>  SRC_URI[implib-0.3.5.sha256sum] =3D "598bf7096215f835b0f70c94d7b033da3cb=
f66181b619f25e54d65adaf825e62"
> -SRC_URI[indexmap-2.9.0.sha256sum] =3D "cea70ddb795996207ad57735b50c5982d=
8844f38ba9ee5f1aedcfb708a2aa11e"
> +SRC_URI[indexmap-2.10.0.sha256sum] =3D "fe4cd85333e22411419a0bcae1297d25=
e58c9443848b11dc6a86fefe8c78a661"
>  SRC_URI[is_executable-1.0.4.sha256sum] =3D "d4a1b5bad6f9072935961dfbf1cc=
ed2f3d129963d091b6f69f007fe04e758ae2"
>  SRC_URI[is_terminal_polyfill-1.70.1.sha256sum] =3D "7943c866cc5cd64cbc25=
b2e01621d07fa8eb2a1a23160ee81ce38704e97b8ecf"
>  SRC_URI[itertools-0.14.0.sha256sum] =3D "2b192c782037fadd9cfa75548310488=
aabdbf3d2da73885b31bd0abd03351285"
>  SRC_URI[itoa-1.0.15.sha256sum] =3D "4a5f13b858c8d314ee3e8f639011f7ccefe7=
1f97f96e50151fb991f267928e2c"
> -SRC_URI[jiff-0.2.13.sha256sum] =3D "f02000660d30638906021176af16b17498bd=
0d12813dbfe7b276d8bc7f3c0806"
> -SRC_URI[jiff-static-0.2.13.sha256sum] =3D "f3c30758ddd7188629c6713fc45d1=
188af4f44c90582311d0c8d8c9907f60c48"
> +SRC_URI[jiff-0.2.15.sha256sum] =3D "be1f93b8b1eb69c77f24bbb0afdf66f54b63=
2ee39af40ca21c4365a1d7347e49"
> +SRC_URI[jiff-static-0.2.15.sha256sum] =3D "03343451ff899767262ec32146f6d=
559dd759fdadf42ff0e227c7c48f72594b4"
>  SRC_URI[jiff-tzdb-0.1.4.sha256sum] =3D "c1283705eb0a21404d2bfd6eef2a7593=
d240bc42a0bdb39db0ad6fa2ec026524"
>  SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] =3D "875a5a69ac2bab1a891711c=
f5eccbec1ce0341ea805560dcd90b7a2e925132e8"
>  SRC_URI[jobserver-0.1.33.sha256sum] =3D "38f262f097c174adebe41eb73d66ae9=
c06b2844fb0da69969647bbddd9b0538a"
> @@ -573,27 +593,28 @@ SRC_URI[js-sys-0.3.77.sha256sum] =3D "1cfaf33c695fc=
6e08064efbc1f72ec937429614f25ee
>  SRC_URI[kstring-2.0.2.sha256sum] =3D "558bf9508a558512042d3095138b1f7b8f=
e90c5467d94f9f1da28b3731c5dbd1"
>  SRC_URI[lazy_static-1.5.0.sha256sum] =3D "bbd2bcb4c963f2ddae06a2efc7e9f3=
591312473c50c6685e1f298068316e66fe"
>  SRC_URI[lazycell-1.3.0.sha256sum] =3D "830d08ce1d1d941e6b30645f1a0eb5643=
013d835ce3779a5fc208261dbe10f55"
> -SRC_URI[libc-0.2.172.sha256sum] =3D "d750af042f7ef4f724306de029d18836c26=
c1765a54a6a3f094cbd23a7267ffa"
> +SRC_URI[libc-0.2.174.sha256sum] =3D "1171693293099992e19cddea4e8b849964e=
9846f4acee11b3948bcc337be8776"
>  SRC_URI[libdbus-sys-0.2.5.sha256sum] =3D "06085512b750d640299b79be4bad3d=
2fa90a9c00b1fd9e1b46364f66f0485c72"
> -SRC_URI[libgit2-sys-0.18.1+1.9.0.sha256sum] =3D "e1dcb20f84ffcdd825c7a31=
1ae347cce604a6f084a767dec4a4929829645290e"
> -SRC_URI[libloading-0.8.7.sha256sum] =3D "6a793df0d7afeac54f95b471d3af7f0=
d4fb975699f972341a4b76988d49cdf0c"
> +SRC_URI[libgit2-sys-0.18.2+1.9.1.sha256sum] =3D "1c42fe03df2bd3c53a3a9c7=
317ad91d80c81cd1fb0caec8d7cc4cd2bfa10c222"
> +SRC_URI[libloading-0.8.8.sha256sum] =3D "07033963ba89ebaf1584d767badaa2e=
8fcec21aedea6b8c0346d487d49c28667"
>  SRC_URI[libnghttp2-sys-0.1.11+1.64.0.sha256sum] =3D "1b6c24e48a7167cffa7=
119da39d577fa482e66c688a4aac016bee862e1a713c4"
> -SRC_URI[libredox-0.1.3.sha256sum] =3D "c0ff37bd590ca25063e35af745c343cb7=
a0271906fb7b37e4813e8f79f00268d"
> -SRC_URI[libsqlite3-sys-0.31.0.sha256sum] =3D "ad8935b44e7c13394a179a438e=
0cebba0fe08fe01b54f152e29a93b5cf993fd4"
> +SRC_URI[libredox-0.1.4.sha256sum] =3D "1580801010e535496706ba011c15f8532=
df6b42297d2e471fec38ceadd8c0638"
> +SRC_URI[libsqlite3-sys-0.32.0.sha256sum] =3D "fbb8270bb4060bd76c6e96f20c=
52d80620f1d82a3470885694e41e0f81ef6fe7"
>  SRC_URI[libssh2-sys-0.3.1.sha256sum] =3D "220e4f05ad4a218192533b300327f5=
150e809b54c4ec83b5a1d91833601811b9"
> +SRC_URI[libz-rs-sys-0.5.1.sha256sum] =3D "172a788537a2221661b480fee8dc5f=
96c580eb34fa88764d3205dc356c7e4221"
>  SRC_URI[libz-sys-1.1.22.sha256sum] =3D "8b70e7a7df205e92a1a4cd9aaae7898d=
ac0aa555503cc0a649494d0d60e7651d"
>  SRC_URI[linux-raw-sys-0.4.15.sha256sum] =3D "d26c52dbd32dccf2d10cac7725f=
8eae5296885fb5703b261f7d0a0739ec807ab"
>  SRC_URI[linux-raw-sys-0.9.4.sha256sum] =3D "cd945864f07fe9f5371a27ad7b52=
a172b4b499999f1d97574c9fa68373937e12"
>  SRC_URI[litemap-0.8.0.sha256sum] =3D "241eaef5fd12c88705a01fc1066c48c4b3=
6e0dd4377dcdc7ec3942cea7a69956"
> -SRC_URI[lock_api-0.4.12.sha256sum] =3D "07af8b9cdd281b7915f413fa73f29ebd=
5d55d0d3f0155584dade1ff18cea1b17"
> +SRC_URI[lock_api-0.4.13.sha256sum] =3D "96936507f153605bddfcda068dd80479=
6c84324ed2510809e5b2a624c81da765"
>  SRC_URI[log-0.4.27.sha256sum] =3D "13dc2df351e3202783a1fe0d44375f7295ffb=
4049267b0f3018346dc122a1d94"
>  SRC_URI[matchers-0.1.0.sha256sum] =3D "8263075bb86c5a1b1427b5ae862e88896=
56f126e9f77c484496e8b47cf5c5558"
>  SRC_URI[maybe-async-0.2.10.sha256sum] =3D "5cf92c10c7e361d6b99666ec1c6f9=
805b0bea2c3bd8c78dc6fe98ac5bd78db11"
> -SRC_URI[memchr-2.7.4.sha256sum] =3D "78ca9ab1a0babb1e7d5695e3530886289c1=
8cf2f87ec19a575a0abdce112e3a3"
> +SRC_URI[memchr-2.7.5.sha256sum] =3D "32a282da65faaf38286cf3be983213fcf1d=
2e2a58700e808f83f4ea9a4804bc0"
>  SRC_URI[memmap2-0.9.5.sha256sum] =3D "fd3f7eed9d3848f8b98834af67102b7207=
45c4ec028fcd0aa0239277e7de374f"
>  SRC_URI[memoffset-0.9.1.sha256sum] =3D "488016bfae457b036d996092f6cb4486=
77611ce4449e970ceaf42695203f218a"
>  SRC_URI[minimal-lexical-0.2.1.sha256sum] =3D "68354c5c6bd36d73ff3feceb05=
efa59b6acb7626617f4962be322a825e61f79a"
> -SRC_URI[miniz_oxide-0.8.8.sha256sum] =3D "3be647b768db090acb35d5ec5db2b0=
e1f1de11133ca123b9eacf5137868f892a"
> +SRC_URI[miniz_oxide-0.8.9.sha256sum] =3D "1fa76a2c86f704bdb222d66965fb3d=
63269ce38518b83cb0575fca855ebb6316"
>  SRC_URI[miow-0.6.0.sha256sum] =3D "359f76430b20a79f9e20e115b3428614e654f=
04fab314482fc0fda0ebd3c6044"
>  SRC_URI[nom-7.1.3.sha256sum] =3D "d273983c5a657a70a3e8f2a01329822f3b8c81=
72b73826411a55751e404a0a4a"
>  SRC_URI[normpath-1.3.0.sha256sum] =3D "c8911957c4b1549ac0dc74e30db9c8b0e=
66ddcd6d7acc33098f4c63a64a6d7ed"
> @@ -601,28 +622,31 @@ SRC_URI[nu-ansi-term-0.46.0.sha256sum] =3D "77a8165=
726e8236064dbb45459242600304b42
>  SRC_URI[num-conv-0.1.0.sha256sum] =3D "51d515d32fb182ee37cda2ccdcb92950d=
6a3c2893aa280e540671c2cd0f3b1d9"
>  SRC_URI[num-traits-0.2.19.sha256sum] =3D "071dfc062690e90b734c0b2273ce72=
ad0ffa95f0c74596bc250dcfd960262841"
>  SRC_URI[object-0.36.7.sha256sum] =3D "62948e14d923ea95ea2c7c86c71013138b=
66525b86bdc08d2dcc262bdb497b87"
> +SRC_URI[object-0.37.1.sha256sum] =3D "03fd943161069e1768b4b3d050890ba487=
30e590f57e56d4aa04e7e090e61b4a"
>  SRC_URI[once_cell-1.21.3.sha256sum] =3D "42f5e15c9953c5e4ccceeb2e7382a71=
6482c34515315f7b03532b8b4e8393d2d"
> +SRC_URI[once_cell_polyfill-1.70.1.sha256sum] =3D "a4895175b425cb1f87721b=
59f0f286c2092bd4af812243672510e1ac53e2e0ad"
>  SRC_URI[opener-0.7.2.sha256sum] =3D "d0812e5e4df08da354c851a3376fead46db=
31c2214f849d3de356d774d057681"
> -SRC_URI[openssl-0.10.57.sha256sum] =3D "bac25ee399abb46215765b1cb35bc021=
2377e58a061560d8b29b024fd0430e7c"
> +SRC_URI[openssl-0.10.73.sha256sum] =3D "8505734d46c8ab1e19a1dce3aef597ad=
87dcb4c37e7188231769bd6bd51cebf8"
>  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D "a948666b637a0f465e8564c73e8=
9d4dde00d72d4d473cc972f390fc3dcee7d9c"
>  SRC_URI[openssl-probe-0.1.6.sha256sum] =3D "d05e27ee213611ffe7d6348b942e=
8f942b37114c00cc03cec254295a4a17852e"
>  SRC_URI[openssl-src-300.5.0+3.5.0.sha256sum] =3D "e8ce546f549326b0e6052b=
649198487d91320875da901e7bd11a06d1ee3f9c2f"
> -SRC_URI[openssl-sys-0.9.108.sha256sum] =3D "e145e1651e858e820e4860f7b9c5=
e169bc1d8ce1c86043be79fa7b7634821847"
> +SRC_URI[openssl-sys-0.9.109.sha256sum] =3D "90096e2e47630d78b7d1c20952dc=
621f957103f8bc2c8359ec81290d75238571"
>  SRC_URI[ordered-float-2.10.1.sha256sum] =3D "68f19d67e5a2795c94e73e0bb1c=
c1a7edeb2e28efd39e2e1c9b7a40c1108b11c"
> -SRC_URI[orion-0.17.10.sha256sum] =3D "ccc95d369bc6b5cf404c562cd33de439ae=
9ca6dc4b044cd2625b2072ca0b81e4"
> -SRC_URI[os_info-3.11.0.sha256sum] =3D "41fc863e2ca13dc2d5c34fb22ea4a5882=
48ac14db929616ba65c45f21744b1e9"
> +SRC_URI[orion-0.17.11.sha256sum] =3D "21b3da83b2b4cdc74ab6a556b2e7b473da=
046d5aa4008c0a7a3ae96b1b4aabb4"
> +SRC_URI[os_info-3.12.0.sha256sum] =3D "d0e1ac5fde8d43c34139135df8ea9ee94=
65394b2d8d20f032d38998f64afffc3"
>  SRC_URI[overload-0.1.1.sha256sum] =3D "b15813163c1d831bf4a13c3610c05c0d0=
3b39feb07f7e09fa234dac9b15aaf39"
>  SRC_URI[p384-0.13.1.sha256sum] =3D "fe42f1670a52a47d448f14b6a5c61dd78fce=
51856e68edaa38f7ae3a46b8d6b6"
> -SRC_URI[parking_lot-0.12.3.sha256sum] =3D "f1bf18183cf54e8d6059647fc3063=
646a1801cf30896933ec2311622cc4b9a27"
> -SRC_URI[parking_lot_core-0.9.10.sha256sum] =3D "1e401f977ab385c9e4e3ab30=
627d6f26d00e2c73eef317493c4ec6d468726cf8"
> -SRC_URI[pasetors-0.7.4.sha256sum] =3D "cb798c661c80718af935bea1799792893=
7822e7369cd087667ff4179f9146551"
> +SRC_URI[parking_lot-0.12.4.sha256sum] =3D "70d58bf43669b5795d1576d0641cf=
b6fbb2057bf629506267a92807158584a13"
> +SRC_URI[parking_lot_core-0.9.11.sha256sum] =3D "bc838d2a56b5b1a6c25f5557=
5dfc605fabb63bb2365f6c2353ef9159aa69e4a5"
> +SRC_URI[pasetors-0.7.6.sha256sum] =3D "8c1c6d47c07a08cb59ddad44d53cb5729=
855e35f7d993184cec3aa37ccdb7008"
>  SRC_URI[pathdiff-0.2.3.sha256sum] =3D "df94ce210e5bc13cb6651479fa48d14f6=
01d9858cfe0467f43ae157023b938d3"
>  SRC_URI[pem-rfc7468-0.7.0.sha256sum] =3D "88b39c9bfcfc231068454382784bb4=
60aae594343fb030d46e9f50a645418412"
>  SRC_URI[percent-encoding-2.3.1.sha256sum] =3D "e3148f5046208a5d56bcfc030=
53e3ca6334e51da8dfb19b6cdc8b306fae3283e"
>  SRC_URI[pin-project-lite-0.2.16.sha256sum] =3D "3b3cff922bd51709b605d9ea=
d9aa71031d81447142d828eb4a6eba76fe619f9b"
>  SRC_URI[pkcs8-0.10.2.sha256sum] =3D "f950b2377845cebe5cf8b5165cb3cc1a5e0=
fa5cfa3e1f7f55707d8fd82e0a7b7"
>  SRC_URI[pkg-config-0.3.32.sha256sum] =3D "7edddbd0b52d732b21ad9a5fab5c70=
4c14cd949e5e9a1ec5929a24fded1b904c"
> -SRC_URI[portable-atomic-1.11.0.sha256sum] =3D "350e9b48cbc6b0e028b0473b1=
14454c6316e57336ee184ceab6e53f72c178b3e"
> +SRC_URI[plist-1.7.2.sha256sum] =3D "3d77244ce2d584cd84f6a15f86195b8c9b2a=
0dfbfd817c09e0464244091a58ed"
> +SRC_URI[portable-atomic-1.11.1.sha256sum] =3D "f84267b20a16ea918e43c6a88=
433c2d54fa145c92a811b5b047ccbe153674483"
>  SRC_URI[portable-atomic-util-0.2.4.sha256sum] =3D "d8a2f0d8d040d7848a709=
caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
>  SRC_URI[potential_utf-0.1.2.sha256sum] =3D "e5a7c30837279ca13e7c867e9e40=
053bc68740f988cb07f7ca6df43cc734b585"
>  SRC_URI[powerfmt-0.2.0.sha256sum] =3D "439ee305def115ba05938db6eb1644ff9=
4165c5ab5e9420d1c1bcedbba909391"
> @@ -630,24 +654,25 @@ SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4e=
d2f50dcfe72643da4befc30deadb458
>  SRC_URI[primeorder-0.13.6.sha256sum] =3D "353e1ca18966c16d9deb1c69278edb=
c5f194139612772bd9537af60ac231e1e6"
>  SRC_URI[proc-macro2-1.0.95.sha256sum] =3D "02b3e5e68a3a1a02aad3ec490a980=
07cbc13c37cbe84a3cd7b8e406d76e7f778"
>  SRC_URI[prodash-29.0.2.sha256sum] =3D "f04bb108f648884c23b98a0e940ebc2c9=
3c0c3b89f04dbaf7eb8256ce617d1bc"
> +SRC_URI[quick-xml-0.37.5.sha256sum] =3D "331e97a1af0bf59823e6eadffe373d7=
b27f485be8748f71471c662c1f269b7fb"
>  SRC_URI[quote-1.0.40.sha256sum] =3D "1885c039570dc00dcb4ff087a89e185fd56=
bae234ddc7f056a945bf36467248d"
> -SRC_URI[r-efi-5.2.0.sha256sum] =3D "74765f6d916ee2faa39bc8e68e4f3ed8949b=
48cccdac59983d287a7cb71ce9c5"
> +SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f=
6657d83847bdffdbd7f346754b0f"
>  SRC_URI[rand-0.9.1.sha256sum] =3D "9fbfd9d094a40bf3ae768db9361049ace4c0e=
04a4fd6b359518bd7b73a73dd97"
>  SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e8a=
a15de382ae63b3a0c1bfc0e4d3e3f325cb"
>  SRC_URI[rand_core-0.6.4.sha256sum] =3D "ec0be4795e2f6a28069bec0b5ff3e2ac=
9bafc99e6a9a7dc3547996c5c816922c"
>  SRC_URI[rand_core-0.9.3.sha256sum] =3D "99d9a13982dcf210057a8a78572b2217=
b667c3beacbf3a0d8b454f6f82837d38"
>  SRC_URI[rand_xoshiro-0.6.0.sha256sum] =3D "6f97cdb2a36ed4183de61b2f824cc=
45c9f1037f28afe0a322e9fff4c108b5aaa"
> -SRC_URI[redox_syscall-0.5.12.sha256sum] =3D "928fca9cf2aa042393a8325b9ea=
d81d2f0df4cb12e1e24cef072922ccd99c5af"
> +SRC_URI[redox_syscall-0.5.13.sha256sum] =3D "0d04b7d0ee6b4a0207a0a7adb10=
4d23ecb0b47d6beae7152d0fa34b692b29fd6"
>  SRC_URI[regex-1.11.1.sha256sum] =3D "b544ef1b4eac5dc2db33ea63606ae9ffcfa=
c26c1416a2806ae0bf5f56b201191"
>  SRC_URI[regex-automata-0.1.10.sha256sum] =3D "6c230d73fb8d8c1b9c0b3135c5=
142a8acee3a0558fb8db5cf1cb65f8d7862132"
>  SRC_URI[regex-automata-0.4.9.sha256sum] =3D "809e8dc61f6de73b46c85f4c964=
86310fe304c434cfa43669d7b40f711150908"
>  SRC_URI[regex-syntax-0.6.29.sha256sum] =3D "f162c6dd7b008981e4d40210aca2=
0b4bd0f9b60ca9271061b07f78537722f2e1"
>  SRC_URI[regex-syntax-0.8.5.sha256sum] =3D "2b15c43186be67a4fd63bee50d030=
3afffcef381492ebe2c5d87f324e1b8815c"
>  SRC_URI[rfc6979-0.4.0.sha256sum] =3D "f8dd2a808d456c4a54e300a23e9f5a67e1=
22c3024119acbfd73e3bf664491cb2"
> -SRC_URI[rusqlite-0.33.0.sha256sum] =3D "1c6d5e5acb6f6129fe3f7ba0a7fc77bc=
a1942cb568535e18e7bc40262baf3110"
> +SRC_URI[rusqlite-0.34.0.sha256sum] =3D "37e34486da88d8e051c7c0e23c3f15fd=
806ea8546260aa2fec247e97242ec143"
>  SRC_URI[rustc-hash-2.1.1.sha256sum] =3D "357703d41365b4b27c590e3ed91eabb=
1b663f07c4c084095e60cbed4362dff0d"
>  SRC_URI[rustc-stable-hash-0.1.2.sha256sum] =3D "781442f29170c5c93b7185ad=
559492601acdc71d5bb0706f5868094f45cfcd08"
> -SRC_URI[rustfix-0.9.0.sha256sum] =3D "7f66156d7471ff4f12253cd7fd76dfe637=
a595a9418168154e8570f3947fe9a8"
> +SRC_URI[rustfix-0.9.1.sha256sum] =3D "8abe01883100061761642e19324f87514b=
caed7ddaab2dfd68041c992987b289"
>  SRC_URI[rustix-0.38.44.sha256sum] =3D "fdb5bc1ae2baa591800df16c9ca78619b=
f65c0488b41b96ccec5d11220d8c154"
>  SRC_URI[rustix-1.0.7.sha256sum] =3D "c71e83d6afe7ff64890ec6b71d6a69bb8a6=
10ab78ce364b3352876bb4c801266"
>  SRC_URI[ryu-1.0.20.sha256sum] =3D "28d3b2b1366ec20994f1fd18c3c594f05c5dd=
4bc44d8bb0c1c632c8d6829481f"
> @@ -664,9 +689,9 @@ SRC_URI[serde-value-0.7.0.sha256sum] =3D "f3a1a334121=
1875ef120e117ea7fd5228530ae7e
>  SRC_URI[serde_derive-1.0.219.sha256sum] =3D "5b0276cf7f2c73365f7157c8123=
c21cd9a50fbbd844757af28ca1f5925fc2a00"
>  SRC_URI[serde_ignored-0.1.12.sha256sum] =3D "b516445dac1e3535b6d658a7b52=
8d771153dfb272ed4180ca4617a20550365ff"
>  SRC_URI[serde_json-1.0.140.sha256sum] =3D "20068b6e96dc6c9bd23e01df8827e=
6c7e1f2fddd43c21810382803c136b99373"
> -SRC_URI[serde_spanned-0.6.8.sha256sum] =3D "87607cb1398ed59d48732e575a4c=
28a7a8ebf2454b964fe3f224f2afc07909e1"
> +SRC_URI[serde_spanned-0.6.9.sha256sum] =3D "bf41e0cfaf7226dca15e8197172c=
295a782857fcb97fad1808a166870dee75a3"
>  SRC_URI[sha1-0.10.6.sha256sum] =3D "e3bf829a2d51ab4a5ddf1352d8470c140cad=
c8301b2ae1789db023f01cedd6ba"
> -SRC_URI[sha1_smol-1.0.1.sha256sum] =3D "bbfa15b3dddfee50a0fff136974b3e1b=
de555604ba463834a7eb7deb6417705d"
> +SRC_URI[sha1-checked-0.10.0.sha256sum] =3D "89f599ac0c323ebb1c6082821a54=
962b839832b03984598375bff3975b804423"
>  SRC_URI[sha2-0.10.9.sha256sum] =3D "a7507d819769d01a365ab707794a4084392c=
824f54a7a6a7862f8c3d0892b283"
>  SRC_URI[sharded-slab-0.1.7.sha256sum] =3D "f40ca3c46823713e0d4209592e8d6=
e826aa57e928f09752619fc696c499637f6"
>  SRC_URI[shell-escape-0.1.5.sha256sum] =3D "45bb67a18fa91266cc7807181f62f=
9178a6873bfad7dc788c42e6430db40184f"
> @@ -674,8 +699,8 @@ SRC_URI[shell-words-1.1.0.sha256sum] =3D "24188a676b6=
ae68c3b2cb3a01be17fbf7240ce00
>  SRC_URI[shlex-1.3.0.sha256sum] =3D "0fda2ff0d084019ba4d7c6f371c95d8fd75c=
e3524c3cb8fb653a3023f6323e64"
>  SRC_URI[signature-2.2.0.sha256sum] =3D "77549399552de45a898a580c1b41d445=
bf730df867cc44e6c0233bbc4b8329de"
>  SRC_URI[sized-chunks-0.6.5.sha256sum] =3D "16d69225bde7a69b235da73377861=
095455d298f2b970996eec25ddbb42b3d1e"
> -SRC_URI[smallvec-1.15.0.sha256sum] =3D "8917285742e9f3e1683f0a9c4e6b5796=
0b7314d0b08d30d1ecd426713ee2eee9"
> -SRC_URI[socket2-0.5.9.sha256sum] =3D "4f5fd57c80058a56cf5c777ab8a126398e=
ce8e442983605d280a44ce79d0edef"
> +SRC_URI[smallvec-1.15.1.sha256sum] =3D "67b1b7a3b5fe4f1376887184045fcf45=
c69e92af734b7aaddc05fb777b6fbd03"
> +SRC_URI[socket2-0.5.10.sha256sum] =3D "e22376abed350d73dd1cd119b57ffccad=
95b4e585a7cda43e286245ce23c0678"
>  SRC_URI[spki-0.7.3.sha256sum] =3D "d91ed6c858b01f942cd56b37a94b3e0a17982=
90327d1236e4d9cf4eaca44d29d"
>  SRC_URI[stable_deref_trait-1.2.0.sha256sum] =3D "a8f112729512f8e442d81f9=
5a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
>  SRC_URI[static_assertions-1.1.0.sha256sum] =3D "a2eb9349b6444b326872e140=
eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> @@ -683,7 +708,7 @@ SRC_URI[strsim-0.11.1.sha256sum] =3D "7da8b5736845d9f=
2fcb837ea5d9e2628564b3b043a70
>  SRC_URI[subtle-2.6.1.sha256sum] =3D "13c2bddecc57b384dee18652358fb23172f=
acb8a2c51ccc10d74c157bdea3292"
>  SRC_URI[supports-hyperlinks-3.1.0.sha256sum] =3D "804f44ed3c63152de6a9f9=
0acbea1a110441de43006ea51bcce8f436196a288b"
>  SRC_URI[supports-unicode-3.0.0.sha256sum] =3D "b7401a30af6cb5818bb648522=
70bb722533397edcfc7344954a38f420819ece2"
> -SRC_URI[syn-2.0.101.sha256sum] =3D "8ce2b7fc941b3a24138a0a7cf8e858bfc6a9=
92e7978a068a5c760deb0ed43caf"
> +SRC_URI[syn-2.0.104.sha256sum] =3D "17b6f705963418cdb9927482fa304bc562ec=
e2fdd4f616084c50b7023b435a40"
>  SRC_URI[synstructure-0.13.2.sha256sum] =3D "728a70f3dbaf5bab7f0c4b1ac8d7=
ae5ea60a4b5549c8a5914361c99147a709d2"
>  SRC_URI[tar-0.4.44.sha256sum] =3D "1d863878d212c87a19c1a610eb53bb01fe129=
51c0501cf5a0d65f724914a667a"
>  SRC_URI[tempfile-3.20.0.sha256sum] =3D "e8a64e3985349f2441a1a9ef0b853f86=
9006c3855f2cda6862a94d26ebb9d6a1"
> @@ -692,21 +717,21 @@ SRC_URI[thiserror-1.0.69.sha256sum] =3D "b6aaf5339b=
578ea85b50e080feb250a3e8ae8cfcd
>  SRC_URI[thiserror-2.0.12.sha256sum] =3D "567b8a2dae586314f7be2a752ec7474=
332959c6460e02bde30d702a66d488708"
>  SRC_URI[thiserror-impl-1.0.69.sha256sum] =3D "4fee6c4efc90059e10f81e6d42=
c60a18f76588c3d74cb83a0b242a2b6c7504c1"
>  SRC_URI[thiserror-impl-2.0.12.sha256sum] =3D "7f7cf42b4507d8ea3221206596=
72cf1b9dbb93f8f2d4ecfd6e51350ff5b17a1d"
> -SRC_URI[thread_local-1.1.8.sha256sum] =3D "8b9ef9bad013ada3808854ceac7b4=
6812a6465ba368859a37e2100283d2d719c"
> +SRC_URI[thread_local-1.1.9.sha256sum] =3D "f60246a4944f24f6e018aa17cdeff=
b7818b76356965d03b07d6a9886e8962185"
>  SRC_URI[time-0.3.41.sha256sum] =3D "8a7619e19bc266e0f9c5e6686659d394bc57=
973859340060a69221e57dbc0c40"
>  SRC_URI[time-core-0.1.4.sha256sum] =3D "c9e9a38711f559d9e3ce1cdb06dd7c5b=
8ea546bc90052da6d06bb76da74bb07c"
>  SRC_URI[time-macros-0.2.22.sha256sum] =3D "3526739392ec93fd8b359c8e98514=
cb3e8e021beb4e5f597b00a0221f8ed8a49"
>  SRC_URI[tinystr-0.8.1.sha256sum] =3D "5d4f6d1145dcb577acf783d4e601bc1d76=
a13337bb54e6233add580b07344c8b"
>  SRC_URI[tinyvec-1.9.0.sha256sum] =3D "09b3661f17e86524eccd4371ab0429194e=
0d7c008abb45f7a7495b1719463c71"
>  SRC_URI[tinyvec_macros-0.1.1.sha256sum] =3D "1f3ccbac311fea05f86f61904b4=
62b55fb3df8837a366dfc601a0161d0532f20"
> -SRC_URI[toml-0.8.22.sha256sum] =3D "05ae329d1f08c4d17a59bed7ff5b5a769d06=
2e64a62d34a3261b219e62cd5aae"
> -SRC_URI[toml_datetime-0.6.9.sha256sum] =3D "3da5db5a963e24bc68be8b17b6fa=
82814bb22ee8660f192bb182771d498f09a3"
> -SRC_URI[toml_edit-0.22.26.sha256sum] =3D "310068873db2c5b3e7659d2cc35d21=
855dbafa50d1ce336397c666e3cb08137e"
> -SRC_URI[toml_write-0.1.1.sha256sum] =3D "bfb942dfe1d8e29a7ee7fcbde5bd2b9=
a25fb89aa70caea2eba3bee836ff41076"
> +SRC_URI[toml-0.8.23.sha256sum] =3D "dc1beb996b9d83529a9e75c17a1686767d14=
8d70663143c7854d8b4a09ced362"
> +SRC_URI[toml_datetime-0.6.11.sha256sum] =3D "22cddaf88f4fbc13c51aebbf5f8=
eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
> +SRC_URI[toml_edit-0.22.27.sha256sum] =3D "41fe8c660ae4257887cf66394862d2=
1dbca4a6ddd26f04a3560410406a2f819a"
> +SRC_URI[toml_write-0.1.2.sha256sum] =3D "5d99f8c9a7727884afe522e9bd5edbf=
c91a3312b36a77b5fb8926e4c31a41801"
>  SRC_URI[tracing-0.1.41.sha256sum] =3D "784e0ac535deb450455cbfa28a6f0df14=
5ea1bb7ae51b821cf5e7927fdcfbdd0"
> -SRC_URI[tracing-attributes-0.1.28.sha256sum] =3D "395ae124c09f9e6918a231=
0af6038fba074bcf474ac352496d5910dd59a2226d"
> +SRC_URI[tracing-attributes-0.1.30.sha256sum] =3D "81383ab64e72a7a8b8e131=
30c49e3dab29def6d0c7d76a03087b3cf71c5c6903"
>  SRC_URI[tracing-chrome-0.7.2.sha256sum] =3D "bf0a738ed5d6450a9fb96e86a23=
ad808de2b727fd1394585da5cdd6788ffe724"
> -SRC_URI[tracing-core-0.1.33.sha256sum] =3D "e672c95779cf947c5311f83787af=
4fa8fffd12fb27e4993211a84bdfd9610f9c"
> +SRC_URI[tracing-core-0.1.34.sha256sum] =3D "b9d12581f227e93f094d3af2ae69=
0a574abb8a2b9b7a96e7cfe9647b2b617678"
>  SRC_URI[tracing-log-0.2.0.sha256sum] =3D "ee855f1f400bd0e5c02d150ae5de38=
40039a3f54b025156404e34c23c03f47c3"
>  SRC_URI[tracing-subscriber-0.3.19.sha256sum] =3D "e8189decb5ac0fa7bc8b96=
b7cb9b2701d60d48805aca84a238004d665fcc4008"
>  SRC_URI[typeid-1.0.3.sha256sum] =3D "bc7d623258602320d5c55d1bc22793b57da=
ff0ec7efc270ea7d55ce1d5f5471c"
> @@ -715,7 +740,7 @@ SRC_URI[unicase-2.8.1.sha256sum] =3D "75b844d17643ee9=
18803943289730bec8aac48015045
>  SRC_URI[unicode-bom-2.0.3.sha256sum] =3D "7eec5d1121208364f6793f7d2e222b=
f75a915c19557537745b195b253dd64217"
>  SRC_URI[unicode-ident-1.0.18.sha256sum] =3D "5a5f39404a5da50712a4c1eecf2=
5e90dd62b613502b7e925fd4e4d19b5c96512"
>  SRC_URI[unicode-normalization-0.1.24.sha256sum] =3D "5033c97c4262335cded=
6d6fc3e5c18ab755e1a3dc96376350f3d8e9f009ad956"
> -SRC_URI[unicode-width-0.2.0.sha256sum] =3D "1fc81956842c57dac11422a97c3b=
8195a1ff727f06e85c84ed2e8aa277c9a0fd"
> +SRC_URI[unicode-width-0.2.1.sha256sum] =3D "4a1a07cc7db3810833284e8d372c=
cdc6da29741639ecc70c9ec107df0fa6154c"
>  SRC_URI[unicode-xid-0.2.6.sha256sum] =3D "ebc1c04c71510c7f702b52b7c35073=
4c9ff1295c464a03335b00bb84fc54f853"
>  SRC_URI[url-2.5.4.sha256sum] =3D "32f8b686cadd1473f4bd0117a5d28d36b1ade3=
84ea9b5069a1c40aefed7fda60"
>  SRC_URI[utf8_iter-1.0.4.sha256sum] =3D "b6c140620e7ffbb22c2dee59cafe6084=
a59b5ffc27a8859a5f0d494b5d52b6be"
> @@ -724,7 +749,7 @@ SRC_URI[valuable-0.1.1.sha256sum] =3D "ba73ea9cf16a25=
df0c8caa16c51acb937d5712a8429
>  SRC_URI[vcpkg-0.2.15.sha256sum] =3D "accd4ea62f7bb7a82fe23066fb0957d48ef=
677f6eeb8215f372f52e48bb32426"
>  SRC_URI[version_check-0.9.5.sha256sum] =3D "0b928f33d975fc6ad9f86c8f2838=
53ad26bdd5b10b7f1542aa2fa15e2289105a"
>  SRC_URI[walkdir-2.5.0.sha256sum] =3D "29790946404f91d9c5d06f9874efddea1d=
c06c5efe94541a7d6863108e3a5e4b"
> -SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] =3D "9c8d87e72b64a=
3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> +SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] =3D "ccf3ec651a847=
eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
>  SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] =3D "9683f9a5a998d873c0d21fcbe=
3c083009670149a8fab228644b8bd36b2c48cb3"
>  SRC_URI[wasm-bindgen-0.2.100.sha256sum] =3D "1edc8929d7499fc4e8f0be2262a=
241556cfc54a0bea223790e71446f2aab1ef5"
>  SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] =3D "2f0a0651a5c2bc21487=
bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
> @@ -738,9 +763,10 @@ SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum=
] =3D "712e227841d057c1ee1cd2f
>  SRC_URI[windows-sys-0.48.0.sha256sum] =3D "677d2418bec65e3338edb076e806b=
c1ec15693c5d0104683f2efe857f61056a9"
>  SRC_URI[windows-sys-0.52.0.sha256sum] =3D "282be5f36a8ce781fad8c8ae18fa3=
f9beff57ec1b52cb3de0789201425d9a33d"
>  SRC_URI[windows-sys-0.59.0.sha256sum] =3D "1e38bc4d79ed67fd075bcc251a1c3=
9b32a1776bbe92e5bef1f0bf1f8c531853b"
> +SRC_URI[windows-sys-0.60.2.sha256sum] =3D "f2f500e4d28234f72040990ec9d39=
e3a6b950f9f22d3dba18416c35882612bcb"
>  SRC_URI[windows-targets-0.48.5.sha256sum] =3D "9a2fa6e2155d7247be68c0964=
56083145c183cbbbc2764150dda45a87197940c"
>  SRC_URI[windows-targets-0.52.6.sha256sum] =3D "9b724f72796e036ab90c1021d=
4780d4d3d648aca59e491e6b98e725b84e99973"
> -SRC_URI[windows-targets-0.53.0.sha256sum] =3D "b1e4c7e8ceaaf9cb7d7507c97=
4735728ab453b67ef8f18febdd7c11fe59dca8b"
> +SRC_URI[windows-targets-0.53.2.sha256sum] =3D "c66f69fcc9ce11da9966ddb31=
a40968cad001c5bedeb5c2b82ede4253ab48aef"
>  SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] =3D "2b38e32f0abccf998=
7a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
>  SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] =3D "32a4622180e7a0ec0=
44bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
>  SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] =3D "86b8d5f90ddd19cb4=
a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
> @@ -764,17 +790,17 @@ SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] =
=3D "0a6e035dd0599267ce1ee132e51c
>  SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] =3D "ed94fce61571a4006852b=
7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
>  SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] =3D "589f6da84c646204747d1=
270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
>  SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] =3D "271414315aff87387382e=
c3d271b52d7ae78726f5d44ac98b4f4030c91880486"
> -SRC_URI[winnow-0.6.26.sha256sum] =3D "1e90edd2ac1aa278a5c4599b1d89cf0307=
4b610800f866d4026dc199d7929a28"
> -SRC_URI[winnow-0.7.10.sha256sum] =3D "c06928c8748d81b05c9be96aad92e1b6ff=
01833332f281e8cfca3be4b35fc9ec"
> +SRC_URI[winnow-0.7.11.sha256sum] =3D "74c7b26e3480b707944fc872477815d29a=
8e429d2f93a1ce000f5fa84a15cbcd"
>  SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] =3D "6f42320e61fe2cfd34354ecb59=
7f86f413484a798ba44a8ca1165c58d42da6c1"
>  SRC_URI[writeable-0.6.1.sha256sum] =3D "ea2f10b9bb0928dfb1b42b65e1f9e36f=
7f54dbdf08457afefb38afcdec4fa2bb"
>  SRC_URI[yoke-0.8.0.sha256sum] =3D "5f41bb01b8226ef4bfd589436a297c53d118f=
65921786300e427be8d487695cc"
>  SRC_URI[yoke-derive-0.8.0.sha256sum] =3D "38da3c9736e16c5d3c8c597a9aaa5d=
1fa565d0532ae05e27c24aa62fb32c0ab6"
> -SRC_URI[zerocopy-0.8.25.sha256sum] =3D "a1702d9583232ddb9174e01bb7c15a2a=
b8fb1bc6f227aa1233858c351a3ba0cb"
> -SRC_URI[zerocopy-derive-0.8.25.sha256sum] =3D "28a6e20d751156648aa063f38=
00b706ee209a32c0b4d9f24be3d980b01be55ef"
> +SRC_URI[zerocopy-0.8.26.sha256sum] =3D "1039dd0d3c310cf05de012d8a39ff557=
cb0d23087fd44cad61df08fc31907a2f"
> +SRC_URI[zerocopy-derive-0.8.26.sha256sum] =3D "9ecf5b4cc5364572d7f4c3296=
61bcc82724222973f2cab6f050a4e5c22f75181"
>  SRC_URI[zerofrom-0.1.6.sha256sum] =3D "50cc42e0333e05660c3587f3bf9d04786=
88e15d870fab3346451ce7f8c9fbea5"
>  SRC_URI[zerofrom-derive-0.1.6.sha256sum] =3D "d71e5d6e06ab090c67b5e44993=
ec16b72dcbaabc526db883a360057678b48502"
>  SRC_URI[zeroize-1.8.1.sha256sum] =3D "ced3678a2879b30306d323f4542626697a=
464a97c0a07c9aebf7ebca65cd4dde"
>  SRC_URI[zerotrie-0.2.2.sha256sum] =3D "36f0bbd478583f79edad978b407914f61=
b2972f5af6fa089686016be8f9af595"
>  SRC_URI[zerovec-0.11.2.sha256sum] =3D "4a05eb080e015ba39cc9e23bbe5e7fb04=
d5fb040350f99f34e338d5fdd294428"
>  SRC_URI[zerovec-derive-0.11.1.sha256sum] =3D "5b96237efa0c878c64bd89c436=
f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
> +SRC_URI[zlib-rs-0.5.1.sha256sum] =3D "626bd9fa9734751fc50d6060752170984d=
7053f5a39061f524cda68023d4db8a"
> diff --git a/meta/recipes-devtools/rust/cargo-c/0001-getrandom-Use-libc-S=
YS_futex_time64-on-riscv32.patch b/meta/recipes-devtools/rust/cargo-c/0001-=
getrandom-Use-libc-SYS_futex_time64-on-riscv32.patch
> new file mode 100644
> index 00000000000..dc7130fb574
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/cargo-c/0001-getrandom-Use-libc-SYS_fute=
x_time64-on-riscv32.patch
> @@ -0,0 +1,53 @@
> +From 71c356a07fbbf1530cfc87960e975f93bc9007e8 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 22 Jul 2025 09:46:03 -0700
> +Subject: [PATCH] Use libc::SYS_futex_time64 on riscv32
> +
> +On RISC-V 32-bit (riscv32), the SYS_futex system call is
> +often handled indirectly due to the use of a 64-bit time_t
> +type. Specifically, while SYS_futex is not directly defined,
> +a related syscall like SYS_futex_time64 can be used,
> +
> +Upstream-Status: Submitted [https://github.com/rust-random/getrandom/pul=
l/698]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/backends/use_file.rs | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> +
> +diff --git a/src/backends/use_file.rs b/src/backends/use_file.rs
> +index 7b48d43..baa0c66 100644
> +--- a/src/backends/use_file.rs
> ++++ b/src/backends/use_file.rs
> +@@ -158,7 +158,18 @@ mod sync {
> +     pub(super) fn wait() {
> +         let op =3D libc::FUTEX_WAIT | libc::FUTEX_PRIVATE_FLAG;
> +         let timeout_ptr =3D core::ptr::null::<libc::timespec>();
> ++        #[cfg(not(target_arch =3D "riscv32"))]
> +         let ret =3D unsafe { libc::syscall(libc::SYS_futex, &FD, op, FD=
_ONGOING_INIT, timeout_ptr) };
> ++        #[cfg(target_arch =3D "riscv32")]
> ++        let ret =3D unsafe {
> ++            libc::syscall(
> ++                libc::SYS_futex_time64,
> ++                &FD,
> ++                op,
> ++                FD_ONGOING_INIT,
> ++                timeout_ptr,
> ++            )
> ++        };
> +         // FUTEX_WAIT should return either 0 or EAGAIN error
> +         debug_assert!({
> +             match ret {
> +@@ -172,7 +183,13 @@ mod sync {
> +     /// Wake up all threads which wait for value of atomic `FD` to chan=
ge.
> +     pub(super) fn wake() {
> +         let op =3D libc::FUTEX_WAKE | libc::FUTEX_PRIVATE_FLAG;
> ++
> ++        #[cfg(not(target_arch =3D "riscv32"))]
> +         let ret =3D unsafe { libc::syscall(libc::SYS_futex, &FD, op, li=
bc::INT_MAX) };
> ++
> ++        #[cfg(target_arch =3D "riscv32")]
> ++        let ret =3D unsafe { libc::syscall(libc::SYS_futex_time64, &FD,=
 op, libc::INT_MAX) };
> ++
> +         debug_assert!(ret >=3D 0);
> +     }
> +
> diff --git a/meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc=
-SYS_futex_time64-on-riscv32.patch b/meta/recipes-devtools/rust/cargo-c/000=
1-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.patch
> new file mode 100644
> index 00000000000..37f21af3d14
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/cargo-c/0001-parking-lot-Use-libc-SYS_fu=
tex_time64-on-riscv32.patch
> @@ -0,0 +1,66 @@
> +From 78d4c37e9c5b60ea2368627c2fc297dfc46bec2a Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 22 Jul 2025 10:15:06 -0700
> +Subject: [PATCH] Use libc::SYS_futex_time64 on riscv32
> +
> +On RISC-V 32-bit (riscv32), the SYS_futex system call is
> +often handled indirectly due to the use of a 64-bit time_t
> +type. Specifically, while SYS_futex is not directly defined,
> +a related syscall like SYS_futex_time64 can be used,
> +
> +Upstream-Status: Submitted [https://github.com/Amanieu/parking_lot/pull/=
485]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/thread_parker/linux.rs | 19 +++++++++++++++++++
> + 1 file changed, 19 insertions(+)
> +
> +diff --git a/src/thread_parker/linux.rs b/src/thread_parker/linux.rs
> +index 92601f6..3695624 100644
> +--- a/src/thread_parker/linux.rs
> ++++ b/src/thread_parker/linux.rs
> +@@ -108,6 +108,7 @@ impl ThreadParker {
> +             .as_ref()
> +             .map(|ts_ref| ts_ref as *const _)
> +             .unwrap_or(ptr::null());
> ++        #[cfg(not(target_arch =3D "riscv32"))]
> +         let r =3D unsafe {
> +             libc::syscall(
> +                 libc::SYS_futex,
> +@@ -117,6 +118,16 @@ impl ThreadParker {
> +                 ts_ptr,
> +             )
> +         };
> ++        #[cfg(target_arch =3D "riscv32")]
> ++        let r =3D unsafe {
> ++            libc::syscall(
> ++                libc::SYS_futex_time64,
> ++                &self.futex,
> ++                libc::FUTEX_WAIT | libc::FUTEX_PRIVATE_FLAG,
> ++                1,
> ++                ts_ptr,
> ++            )
> ++        };
> +         debug_assert!(r =3D=3D 0 || r =3D=3D -1);
> +         if r =3D=3D -1 {
> +             debug_assert!(
> +@@ -137,12 +148,20 @@ impl super::UnparkHandleT for UnparkHandle {
> +     unsafe fn unpark(self) {
> +         // The thread data may have been freed at this point, but it do=
esn't
> +         // matter since the syscall will just return EFAULT in that cas=
e.
> ++        #[cfg(not(target_arch =3D "riscv32"))]
> +         let r =3D libc::syscall(
> +             libc::SYS_futex,
> +             self.futex,
> +             libc::FUTEX_WAKE | libc::FUTEX_PRIVATE_FLAG,
> +             1,
> +         );
> ++        #[cfg(target_arch =3D "riscv32")]
> ++        let r =3D libc::syscall(
> ++            libc::SYS_futex_time64,
> ++            self.futex,
> ++            libc::FUTEX_WAKE | libc::FUTEX_PRIVATE_FLAG,
> ++            1,
> ++        );
> +         debug_assert!(r =3D=3D 0 || r =3D=3D 1 || r =3D=3D -1);
> +         if r =3D=3D -1 {
> +             debug_assert_eq!(errno(), libc::EFAULT);
> diff --git a/meta/recipes-devtools/rust/cargo-c_0.10.13+cargo-0.88.0.bb b=
/meta/recipes-devtools/rust/cargo-c_0.10.14+cargo-0.89.0.bb
> similarity index 52%
> rename from meta/recipes-devtools/rust/cargo-c_0.10.13+cargo-0.88.0.bb
> rename to meta/recipes-devtools/rust/cargo-c_0.10.14+cargo-0.89.0.bb
> index 67777260723..f21fa9557ac 100644
> --- a/meta/recipes-devtools/rust/cargo-c_0.10.13+cargo-0.88.0.bb
> +++ b/meta/recipes-devtools/rust/cargo-c_0.10.14+cargo-0.89.0.bb
> @@ -5,8 +5,11 @@ LIC_FILES_CHKSUM =3D " \
>      file://LICENSE;md5=3D384ed0e2e0b2dac094e51fbf93fdcbe0 \
>  "
>
> -SRC_URI =3D "crate://crates.io/cargo-c/${PV};name=3Dcargo-c"
> -SRC_URI[cargo-c.sha256sum] =3D "bd11efb38aee5930cabfe8d41465f22859b2af90=
71fa04d3642814cf1cc2bc75"
> +SRC_URI =3D "crate://crates.io/cargo-c/${PV};name=3Dcargo-c \
> +           file://0001-getrandom-Use-libc-SYS_futex_time64-on-riscv32.pa=
tch;patchdir=3D../getrandom-0.3.3/ \
> +           file://0001-parking-lot-Use-libc-SYS_futex_time64-on-riscv32.=
patch;patchdir=3D../parking_lot_core-0.9.11/ \
> +"
> +SRC_URI[cargo-c.sha256sum] =3D "fe82742019f0e5c1a9f8549b0f41b20f1bc834f5=
ed0626c47019f15be566b321"
>  S =3D "${CARGO_VENDORING_DIRECTORY}/cargo-c-${PV}"
>
>  inherit cargo cargo-update-recipe-crates pkgconfig

