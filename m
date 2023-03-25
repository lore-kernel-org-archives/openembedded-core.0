Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CACCC6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 20:43:44 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.30679.1679777018893086767
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 13:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iRhlHUFU;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id j11so6479758lfg.13
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679777017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mo7LiEZRG7xLPTkzvmRnjyldpUTGLRxxejIjdf2K51E=;
        b=iRhlHUFUk3Bi3NHgPFrKCFFkPq1kQQRtzAqhIJFp6nxsN9id+Ty0TInDoV2QAWjBx0
         pUSkgGYwPCyAt0iUhENNwaNZTVv7FFkz4SN+IU74A7jVeYpRsABDHm6KxN5R5PJvzFav
         G7lbNgi9yRftqyA+dREFWqYNdCmP8XAGuMIcaQsKJA+gSavBNsXAqaUUSSu5ayDpF2++
         SHoQf2lKoGOL6AKvFwtsvIoaGjkfkx+H/rGd14cBEpL7+vRHrQyzPD3sLhOMCymEqLaR
         unxJsgf74iwP0eMOrBnT+stYNf74r5Ra6ffyZNYeG+SxuW4PJP05Lbprm1ISSfpor5nF
         XqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679777017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mo7LiEZRG7xLPTkzvmRnjyldpUTGLRxxejIjdf2K51E=;
        b=reOdf9kFUE6yrMi5ZkCV21vG0KvzmoZSyokn4H2TDGUNtpJyvoavHsSxwZX6Mu9wXp
         wLXG/5R5K1Qr6aVhuKWtlT5xXNGLRo89CO47yNuYfcG/UWhJKDfXjWtFZ8wyu3vA05uJ
         lVwJUEA8GUCc4fRJO7iAsNnDZu5GF7iPqfSSpS8TL5S/bXC+LrKUlodO8Iwb2dgl6izs
         5QGf2bld2UGyigmVgpZkiP5CECWLk3wMcplF6ijlboXtuL5Xtlv3ax5FWPzUCuOx/xGd
         JURtVq5Z4pQvLiVr34TYl6HKmhW60QNLMuiJc5Xwc8QfLEGgrFOHP06iTDiKHCfazLxV
         biJg==
X-Gm-Message-State: AAQBX9eKScEP5+E07KKeM+BtvLi92sRsS30+FT00zQZa9JdtChPoqSip
	GXI70pASVdM+kKtmXKwykL3zMRkfWCs+ukOt7dE=
X-Google-Smtp-Source: AK7set/Si6rEza6v8EeCILH5JvhqUelZ3TBpMzC6pG1ncdVHMNOZWqis8K8aJwopmNniZV/pZsm0982T9Ny7olfjiKY=
X-Received: by 2002:a05:6512:2523:b0:4e8:3ee1:db14 with SMTP id
 be35-20020a056512252300b004e83ee1db14mr7208101lfb.6.1679777016423; Sat, 25
 Mar 2023 13:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1679734210.git.frederic.martinsons@gmail.com>
 <417bea7e5fbf6c5e82d8594eac002c2a809686d2.1679734210.git.frederic.martinsons@gmail.com>
 <CANNYZj_Fjk7RqbP6ZhrfTDW3Ra3g7=gmmmSPN4juqciptBMVmg@mail.gmail.com>
In-Reply-To: <CANNYZj_Fjk7RqbP6ZhrfTDW3Ra3g7=gmmmSPN4juqciptBMVmg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sat, 25 Mar 2023 21:43:21 +0100
Message-ID: <CA+cAkeqY9spjHQ8Hsbn=wXPfu2zNSD-Nm2T9+oYtGM3V3rSx9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/5] rust-example: provide a recipe for zvariant
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005dab1105f7bf9096"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 20:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179106

--0000000000005dab1105f7bf9096
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I thought that would be treated the same as rust-hello-world_git.bb which
is in oe-core.

Anyway, I don't mind placing it elsewhere, which layer do you think this
recipe would land?



Le sam. 25 mars 2023, 19:52, Alexander Kanavin <alex.kanavin@gmail.com> a
=C3=A9crit :

> I don't think this should be going in oe-core, as it's not actually
> used by anything, or in any automated tests. But you can place it in a
> separate layer.
>
> Alex
>
> On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons
> <frederic.martinsons@gmail.com> wrote:
> >
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This recipe is for showing an "real world" example of
> > a crate that depends on some git repositories.
> >
> > Usually, this kind of crate is built within a global
> > workspace (here it is the zbus project) and so
> > doesn't need a Cargo.lock on its own.
> >
> > For the sake of the demonstration, I had to add
> > a patch for probiding a Cargo.lock and modifying
> > zvariant_deriver to get it from crates.io instead
> > of pulling locally with a relative path
> >
> > The use case where the crate had some git repository
> > in dependency is very common for "private" crate that
> > are not aimed to be published on crate.io.
> > When the project grow bigger, it is common to have
> > a bin and multiple lib developped in parallel, and these
> > libs are surely on a git repostitory.
> >
> > Hence the need of this support in oe-core.
> >
> > Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > ---
> >  .../rust-example/zvariant-crates.inc          |  140 ++
> >  .../0001-Tweak-zvariant-cargo-config.patch    | 1249 +++++++++++++++++
> >  .../rust-example/zvariant_3.12.0.bb           |   20 +
> >  3 files changed, 1409 insertions(+)
> >  create mode 100644
> meta/recipes-extended/rust-example/zvariant-crates.inc
> >  create mode 100644
> meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-con=
fig.patch
> >  create mode 100644 meta/recipes-extended/rust-example/
> zvariant_3.12.0.bb
> >
> > diff --git a/meta/recipes-extended/rust-example/zvariant-crates.inc
> b/meta/recipes-extended/rust-example/zvariant-crates.inc
> > new file mode 100644
> > index 0000000000..297a784661
> > --- /dev/null
> > +++ b/meta/recipes-extended/rust-example/zvariant-crates.inc
> > @@ -0,0 +1,140 @@
> > +SRC_URI +=3D " \
> > +    crate://crates.io/anes/0.1.6 \
> > +    crate://crates.io/anyhow/1.0.70 \
> > +    crate://crates.io/arrayvec/0.7.2 \
> > +    crate://crates.io/atty/0.2.14 \
> > +    crate://crates.io/autocfg/1.1.0 \
> > +    crate://crates.io/bitflags/1.3.2 \
> > +    crate://crates.io/bumpalo/3.12.0 \
> > +    crate://crates.io/byteorder/1.4.3 \
> > +    crate://crates.io/cast/0.3.0 \
> > +    crate://crates.io/cfg-if/1.0.0 \
> > +    crate://crates.io/chrono/0.4.24 \
> > +    crate://crates.io/ciborium-io/0.2.0 \
> > +    crate://crates.io/ciborium-ll/0.2.0 \
> > +    crate://crates.io/ciborium/0.2.0 \
> > +    crate://crates.io/clap/3.2.23 \
> > +    crate://crates.io/clap_lex/0.2.4 \
> > +    crate://crates.io/criterion-plot/0.5.0 \
> > +    crate://crates.io/criterion/0.4.0 \
> > +    crate://crates.io/crossbeam-channel/0.5.7 \
> > +    crate://crates.io/crossbeam-deque/0.8.3 \
> > +    crate://crates.io/crossbeam-epoch/0.9.14 \
> > +    crate://crates.io/crossbeam-utils/0.8.15 \
> > +    crate://crates.io/either/1.8.1 \
> > +    crate://crates.io/enumflags2/0.7.5 \
> > +    crate://crates.io/enumflags2_derive/0.7.4 \
> > +    crate://crates.io/form_urlencoded/1.1.0 \
> > +    crate://crates.io/futures-channel/0.3.27 \
> > +    crate://crates.io/futures-core/0.3.27 \
> > +    crate://crates.io/futures-executor/0.3.27 \
> > +    crate://crates.io/futures-macro/0.3.27 \
> > +    crate://crates.io/futures-task/0.3.27 \
> > +    crate://crates.io/futures-util/0.3.27 \
> > +    crate://crates.io/getrandom/0.2.8 \
> > +    crate://crates.io/half/1.8.2 \
> > +    crate://crates.io/hashbrown/0.12.3 \
> > +    crate://crates.io/heck/0.3.3 \
> > +    crate://crates.io/hermit-abi/0.1.19 \
> > +    crate://crates.io/hermit-abi/0.2.6 \
> > +    crate://crates.io/idna/0.3.0 \
> > +    crate://crates.io/indexmap/1.9.2 \
> > +    crate://crates.io/itertools/0.10.5 \
> > +    crate://crates.io/itertools/0.9.0 \
> > +    crate://crates.io/itoa/1.0.6 \
> > +    crate://crates.io/js-sys/0.3.61 \
> > +    crate://crates.io/lazy_static/1.4.0 \
> > +    crate://crates.io/libc/0.2.140 \
> > +    crate://crates.io/log/0.4.17 \
> > +    crate://crates.io/memchr/2.5.0 \
> > +    crate://crates.io/memoffset/0.8.0 \
> > +    crate://crates.io/num-integer/0.1.45 \
> > +    crate://crates.io/num-traits/0.2.15 \
> > +    crate://crates.io/num_cpus/1.15.0 \
> > +    crate://crates.io/once_cell/1.17.1 \
> > +    crate://crates.io/oorandom/11.1.3 \
> > +    crate://crates.io/os_str_bytes/6.5.0 \
> > +    crate://crates.io/percent-encoding/2.2.0 \
> > +    crate://crates.io/pin-project-lite/0.2.9 \
> > +    crate://crates.io/pin-utils/0.1.0 \
> > +    crate://crates.io/pkg-config/0.3.26 \
> > +    crate://crates.io/plotters-backend/0.3.4 \
> > +    crate://crates.io/plotters-svg/0.3.3 \
> > +    crate://crates.io/plotters/0.3.4 \
> > +    crate://crates.io/ppv-lite86/0.2.17 \
> > +    crate://crates.io/proc-macro-crate/0.1.5 \
> > +    crate://crates.io/proc-macro-crate/1.3.1 \
> > +    crate://crates.io/proc-macro-error-attr/1.0.4 \
> > +    crate://crates.io/proc-macro-error/1.0.4 \
> > +    crate://crates.io/proc-macro2/1.0.53 \
> > +    crate://crates.io/quote/1.0.26 \
> > +    crate://crates.io/rand/0.8.5 \
> > +    crate://crates.io/rand_chacha/0.3.1 \
> > +    crate://crates.io/rand_core/0.6.4 \
> > +    crate://crates.io/rayon-core/1.11.0 \
> > +    crate://crates.io/rayon/1.7.0 \
> > +    crate://crates.io/regex-syntax/0.6.29 \
> > +    crate://crates.io/regex/1.7.2 \
> > +    crate://crates.io/ryu/1.0.13 \
> > +    crate://crates.io/same-file/1.0.6 \
> > +    crate://crates.io/scopeguard/1.1.0 \
> > +    crate://crates.io/serde/1.0.158 \
> > +    crate://crates.io/serde_bytes/0.11.9 \
> > +    crate://crates.io/serde_derive/1.0.158 \
> > +    crate://crates.io/serde_json/1.0.94 \
> > +    crate://crates.io/serde_repr/0.1.12 \
> > +    crate://crates.io/slab/0.4.8 \
> > +    crate://crates.io/static_assertions/1.1.0 \
> > +    crate://crates.io/strum/0.18.0 \
> > +    crate://crates.io/strum_macros/0.18.0 \
> > +    crate://crates.io/syn/1.0.109 \
> > +    crate://crates.io/syn/2.0.8 \
> > +    crate://crates.io/system-deps/1.3.2 \
> > +    crate://crates.io/textwrap/0.16.0 \
> > +    crate://crates.io/thiserror-impl/1.0.40 \
> > +    crate://crates.io/thiserror/1.0.40 \
> > +    crate://crates.io/time-core/0.1.0 \
> > +    crate://crates.io/time-macros/0.2.8 \
> > +    crate://crates.io/time/0.3.20 \
> > +    crate://crates.io/tinytemplate/1.2.1 \
> > +    crate://crates.io/tinyvec/1.6.0 \
> > +    crate://crates.io/tinyvec_macros/0.1.1 \
> > +    crate://crates.io/toml/0.5.11 \
> > +    crate://crates.io/toml_datetime/0.6.1 \
> > +    crate://crates.io/toml_edit/0.19.8 \
> > +    crate://crates.io/unicode-bidi/0.3.13 \
> > +    crate://crates.io/unicode-ident/1.0.8 \
> > +    crate://crates.io/unicode-normalization/0.1.22 \
> > +    crate://crates.io/unicode-segmentation/1.10.1 \
> > +    crate://crates.io/url/2.3.1 \
> > +    crate://crates.io/uuid/1.3.0 \
> > +    crate://crates.io/version-compare/0.0.10 \
> > +    crate://crates.io/version_check/0.9.4 \
> > +    crate://crates.io/walkdir/2.3.3 \
> > +    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> > +    crate://crates.io/wasm-bindgen-backend/0.2.84 \
> > +    crate://crates.io/wasm-bindgen-macro-support/0.2.84 \
> > +    crate://crates.io/wasm-bindgen-macro/0.2.84 \
> > +    crate://crates.io/wasm-bindgen-shared/0.2.84 \
> > +    crate://crates.io/wasm-bindgen/0.2.84 \
> > +    crate://crates.io/web-sys/0.3.61 \
> > +    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi-util/0.1.5 \
> > +    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > +    crate://crates.io/winapi/0.3.9 \
> > +    crate://crates.io/winnow/0.4.0 \
> > +    crate://crates.io/zvariant_derive/3.12.0 \
> > +    crate://crates.io/zvariant_utils/1.0.0 \
> > +    git://
> github.com/gtk-rs/glib;protocol=3Dhttps;nobranch=3D1;name=3Dglib;destsuff=
ix=3Dglib
> \
> > +    git://
> github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dglib-sys;dests=
uffix=3Dglib-sys;subpath=3Dglib-sys
> \
> > +    git://
> github.com/gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgobject-sys;de=
stsuffix=3Dgobject-sys;subpath=3Dgobject-sys
> \
> > +"
> > +
> > +SRCREV_FORMAT .=3D "_glib"
> > +SRCREV_glib =3D "c9ee583cea07830c099cdcccd33eda9ef705ea93"
> > +
> > +SRCREV_FORMAT .=3D "_glib-sys"
> > +SRCREV_glib-sys =3D "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > +
> > +SRCREV_FORMAT .=3D "_gobject-sys"
> > +SRCREV_gobject-sys =3D "5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > diff --git
> a/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-c=
onfig.patch
> b/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-c=
onfig.patch
> > new file mode 100644
> > index 0000000000..638ba3ed4d
> > --- /dev/null
> > +++
> b/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-c=
onfig.patch
> > @@ -0,0 +1,1249 @@
> > +From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17 00:00:00 2001
> > +From: Frederic Martinsons <frederic.martinsons@gmail.com>
> > +Date: Thu, 23 Mar 2023 07:12:37 +0100
> > +Subject: [PATCH] Tweak zvariant cargo config
> > +
> > +This library crate is a part of zbus project, and is aimed to
> > +be published amongst the whole project.
> > +
> > +Nevertheless, this recipe is for showing example of real
> > +code which uses a local registry via git url inside yocto
> > +environment.
> > +
> > +I didn't find a real example of binary crate that uses git
> > +dependency but it seems to me a very common use case
> > +when we are working on multiple local crates that are not
> > +aimed to be published on public registry.
> > +
> > +Long story short, this patch add a modified Cargo.toml
> > +to use the zvariant_derive dependency from crates.io instead
> > +of zbus local one and a pre generated Cargo.lock in order
> > +to make cargo patch process inside cargo_common.bbclass work
> > +
> > +Upstream-Status: Inappropriate
> > +Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> > +---
> > + zvariant/Cargo.lock | 1198 ++++++++++++++++++++++++++++++++++++++++++=
+
> > + zvariant/Cargo.toml |    2 +-
> > + 2 files changed, 1199 insertions(+), 1 deletion(-)
> > + create mode 100644 zvariant/Cargo.lock
> > +
> > +diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock
> > +new file mode 100644
> > +index 00000000..02a83d42
> > +--- /dev/null
> > ++++ b/zvariant/Cargo.lock
> > +@@ -0,0 +1,1198 @@
> > ++# This file is automatically @generated by Cargo.
> > ++# It is not intended for manual editing.
> > ++version =3D 3
> > ++
> > ++[[package]]
> > ++name =3D "anes"
> > ++version =3D "0.1.6"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
> > ++
> > ++[[package]]
> > ++name =3D "anyhow"
> > ++version =3D "1.0.70"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "7de8ce5e0f9f8d88245311066a578d72b7af3e7088f32783804676302df237e4"
> > ++
> > ++[[package]]
> > ++name =3D "arrayvec"
> > ++version =3D "0.7.2"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e980de8ea54454d6"
> > ++dependencies =3D [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "atty"
> > ++version =3D "0.2.14"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf377614828a319d5fee8"
> > ++dependencies =3D [
> > ++ "hermit-abi 0.1.19",
> > ++ "libc",
> > ++ "winapi",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "autocfg"
> > ++version =3D "1.1.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
> > ++
> > ++[[package]]
> > ++name =3D "bitflags"
> > ++version =3D "1.3.2"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
> > ++
> > ++[[package]]
> > ++name =3D "bumpalo"
> > ++version =3D "3.12.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "0d261e256854913907f67ed06efbc3338dfe6179796deefc1ff763fc1aee5535"
> > ++
> > ++[[package]]
> > ++name =3D "byteorder"
> > ++version =3D "1.4.3"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
> > ++
> > ++[[package]]
> > ++name =3D "cast"
> > ++version =3D "0.3.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
> > ++
> > ++[[package]]
> > ++name =3D "cfg-if"
> > ++version =3D "1.0.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > ++
> > ++[[package]]
> > ++name =3D "chrono"
> > ++version =3D "0.4.24"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "4e3c5919066adf22df73762e50cffcde3a758f2a848b113b586d1f86728b673b"
> > ++dependencies =3D [
> > ++ "num-integer",
> > ++ "num-traits",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "ciborium"
> > ++version =3D "0.2.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb608ab89509d788f"
> > ++dependencies =3D [
> > ++ "ciborium-io",
> > ++ "ciborium-ll",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "ciborium-io"
> > ++version =3D "0.2.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "346de753af073cc87b52b2083a506b38ac176a44cfb05497b622e27be899b369"
> > ++
> > ++[[package]]
> > ++name =3D "ciborium-ll"
> > ++version =3D "0.2.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534e178e3906c4cf1b"
> > ++dependencies =3D [
> > ++ "ciborium-io",
> > ++ "half",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "clap"
> > ++version =3D "3.2.23"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023ad47c144e4e473a5"
> > ++dependencies =3D [
> > ++ "bitflags",
> > ++ "clap_lex",
> > ++ "indexmap",
> > ++ "textwrap",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "clap_lex"
> > ++version =3D "0.2.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345776f952765261c5"
> > ++dependencies =3D [
> > ++ "os_str_bytes",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "criterion"
> > ++version =3D "0.4.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49fd70de6412654cb"
> > ++dependencies =3D [
> > ++ "anes",
> > ++ "atty",
> > ++ "cast",
> > ++ "ciborium",
> > ++ "clap",
> > ++ "criterion-plot",
> > ++ "itertools 0.10.5",
> > ++ "lazy_static",
> > ++ "num-traits",
> > ++ "oorandom",
> > ++ "plotters",
> > ++ "rayon",
> > ++ "regex",
> > ++ "serde",
> > ++ "serde_derive",
> > ++ "serde_json",
> > ++ "tinytemplate",
> > ++ "walkdir",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "criterion-plot"
> > ++version =3D "0.5.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "6b50826342786a51a89e2da3a28f1c32b06e387201bc2d19791f622c673706b1"
> > ++dependencies =3D [
> > ++ "cast",
> > ++ "itertools 0.10.5",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "crossbeam-channel"
> > ++version =3D "0.5.7"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "cf2b3e8478797446514c91ef04bafcb59faba183e621ad488df88983cc14128c"
> > ++dependencies =3D [
> > ++ "cfg-if",
> > ++ "crossbeam-utils",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "crossbeam-deque"
> > ++version =3D "0.8.3"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "ce6fd6f855243022dcecf8702fef0c297d4338e226845fe067f6341ad9fa0cef"
> > ++dependencies =3D [
> > ++ "cfg-if",
> > ++ "crossbeam-epoch",
> > ++ "crossbeam-utils",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "crossbeam-epoch"
> > ++version =3D "0.9.14"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9edb08e819dcf5695"
> > ++dependencies =3D [
> > ++ "autocfg",
> > ++ "cfg-if",
> > ++ "crossbeam-utils",
> > ++ "memoffset",
> > ++ "scopeguard",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "crossbeam-utils"
> > ++version =3D "0.8.15"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c29b3359b346984b"
> > ++dependencies =3D [
> > ++ "cfg-if",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "either"
> > ++version =3D "1.8.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91"
> > ++
> > ++[[package]]
> > ++name =3D "enumflags2"
> > ++version =3D "0.7.5"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d36577329a1f55ccb"
> > ++dependencies =3D [
> > ++ "enumflags2_derive",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "enumflags2_derive"
> > ++version =3D "0.7.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322d2b850e36f6d5ae"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "form_urlencoded"
> > ++version =3D "1.1.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "a9c384f161156f5260c24a097c56119f9be8c798586aecc13afbcbe7b7e26bf8"
> > ++dependencies =3D [
> > ++ "percent-encoding",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "futures-channel"
> > ++version =3D "0.3.27"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346e8daf15963cf7ac"
> > ++dependencies =3D [
> > ++ "futures-core",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "futures-core"
> > ++version =3D "0.3.27"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f07db7603b7de69dd"
> > ++
> > ++[[package]]
> > ++name =3D "futures-executor"
> > ++version =3D "0.3.27"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe77ef3ed60ba0f83"
> > ++dependencies =3D [
> > ++ "futures-core",
> > ++ "futures-task",
> > ++ "futures-util",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "futures-macro"
> > ++version =3D "0.3.27"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599f38c975e5a963b6"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "futures-task"
> > ++version =3D "0.3.27"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f805b8f35ab592879"
> > ++
> > ++[[package]]
> > ++name =3D "futures-util"
> > ++version =3D "0.3.27"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd32ac4a6842e84ab"
> > ++dependencies =3D [
> > ++ "futures-core",
> > ++ "futures-macro",
> > ++ "futures-task",
> > ++ "pin-project-lite",
> > ++ "pin-utils",
> > ++ "slab",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "getrandom"
> > ++version =3D "0.2.8"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"
> > ++dependencies =3D [
> > ++ "cfg-if",
> > ++ "libc",
> > ++ "wasi",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "glib"
> > ++version =3D "0.10.0"
> > ++source =3D "git+
> https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdccc=
d33eda9ef705ea93
> "
> > ++dependencies =3D [
> > ++ "bitflags",
> > ++ "futures-channel",
> > ++ "futures-core",
> > ++ "futures-executor",
> > ++ "futures-task",
> > ++ "futures-util",
> > ++ "glib-macros",
> > ++ "glib-sys",
> > ++ "gobject-sys",
> > ++ "libc",
> > ++ "once_cell",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "glib-macros"
> > ++version =3D "0.10.0"
> > ++source =3D "git+
> https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0#c9ee583cea07830c099cdccc=
d33eda9ef705ea93
> "
> > ++dependencies =3D [
> > ++ "anyhow",
> > ++ "heck",
> > ++ "itertools 0.9.0",
> > ++ "proc-macro-crate 0.1.5",
> > ++ "proc-macro-error",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "glib-sys"
> > ++version =3D "0.10.0"
> > ++source =3D "git+
> https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > ++dependencies =3D [
> > ++ "libc",
> > ++ "system-deps",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "gobject-sys"
> > ++version =3D "0.10.0"
> > ++source =3D "git+
> https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba5f01"
> > ++dependencies =3D [
> > ++ "glib-sys",
> > ++ "libc",
> > ++ "system-deps",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "half"
> > ++version =3D "1.8.2"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a6a4e15445af0bd7"
> > ++
> > ++[[package]]
> > ++name =3D "hashbrown"
> > ++version =3D "0.12.3"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888"
> > ++
> > ++[[package]]
> > ++name =3D "heck"
> > ++version =3D "0.3.3"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa6c65c904e9e132c"
> > ++dependencies =3D [
> > ++ "unicode-segmentation",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "hermit-abi"
> > ++version =3D "0.1.19"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "62b467343b94ba476dcb2500d242dadbb39557df889310ac77c5d99100aaac33"
> > ++dependencies =3D [
> > ++ "libc",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "hermit-abi"
> > ++version =3D "0.2.6"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7"
> > ++dependencies =3D [
> > ++ "libc",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "idna"
> > ++version =3D "0.3.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11b5e024d657209e6"
> > ++dependencies =3D [
> > ++ "unicode-bidi",
> > ++ "unicode-normalization",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "indexmap"
> > ++version =3D "1.9.2"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c3293e98c5ba0c8b399"
> > ++dependencies =3D [
> > ++ "autocfg",
> > ++ "hashbrown",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "itertools"
> > ++version =3D "0.9.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "284f18f85651fe11e8a991b2adb42cb078325c996ed026d994719efcfca1d54b"
> > ++dependencies =3D [
> > ++ "either",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "itertools"
> > ++version =3D "0.10.5"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473"
> > ++dependencies =3D [
> > ++ "either",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "itoa"
> > ++version =3D "1.0.6"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6"
> > ++
> > ++[[package]]
> > ++name =3D "js-sys"
> > ++version =3D "0.3.61"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b8dd15e6af2a0730"
> > ++dependencies =3D [
> > ++ "wasm-bindgen",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "lazy_static"
> > ++version =3D "1.4.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
> > ++
> > ++[[package]]
> > ++name =3D "libc"
> > ++version =3D "0.2.140"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f80c"
> > ++
> > ++[[package]]
> > ++name =3D "log"
> > ++version =3D "0.4.17"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
> > ++dependencies =3D [
> > ++ "cfg-if",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "memchr"
> > ++version =3D "2.5.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d"
> > ++
> > ++[[package]]
> > ++name =3D "memoffset"
> > ++version =3D "0.8.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
> > ++dependencies =3D [
> > ++ "autocfg",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "num-integer"
> > ++version =3D "0.1.45"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
> > ++dependencies =3D [
> > ++ "autocfg",
> > ++ "num-traits",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "num-traits"
> > ++version =3D "0.2.15"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
> > ++dependencies =3D [
> > ++ "autocfg",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "num_cpus"
> > ++version =3D "1.15.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b"
> > ++dependencies =3D [
> > ++ "hermit-abi 0.2.6",
> > ++ "libc",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "once_cell"
> > ++version =3D "1.17.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8fc2cd5858f23ad3"
> > ++
> > ++[[package]]
> > ++name =3D "oorandom"
> > ++version =3D "11.1.3"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b63caa84da26b575"
> > ++
> > ++[[package]]
> > ++name =3D "os_str_bytes"
> > ++version =3D "6.5.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb3e514fa4238e267"
> > ++
> > ++[[package]]
> > ++name =3D "percent-encoding"
> > ++version =3D "2.2.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "478c572c3d73181ff3c2539045f6eb99e5491218eae919370993b890cdbdd98e"
> > ++
> > ++[[package]]
> > ++name =3D "pin-project-lite"
> > ++version =3D "0.2.9"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116"
> > ++
> > ++[[package]]
> > ++name =3D "pin-utils"
> > ++version =3D "0.1.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
> > ++
> > ++[[package]]
> > ++name =3D "pkg-config"
> > ++version =3D "0.3.26"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "6ac9a59f73473f1b8d852421e59e64809f025994837ef743615c6d0c5b305160"
> > ++
> > ++[[package]]
> > ++name =3D "plotters"
> > ++version =3D "0.3.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "2538b639e642295546c50fcd545198c9d64ee2a38620a628724a3b266d5fbf97"
> > ++dependencies =3D [
> > ++ "num-traits",
> > ++ "plotters-backend",
> > ++ "plotters-svg",
> > ++ "wasm-bindgen",
> > ++ "web-sys",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "plotters-backend"
> > ++version =3D "0.3.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "193228616381fecdc1224c62e96946dfbc73ff4384fba576e052ff8c1bea8142"
> > ++
> > ++[[package]]
> > ++name =3D "plotters-svg"
> > ++version =3D "0.3.3"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1b37f65a6ae5a56f"
> > ++dependencies =3D [
> > ++ "plotters-backend",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "ppv-lite86"
> > ++version =3D "0.2.17"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de"
> > ++
> > ++[[package]]
> > ++name =3D "proc-macro-crate"
> > ++version =3D "0.1.5"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4446ad341b8c9785"
> > ++dependencies =3D [
> > ++ "toml",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "proc-macro-crate"
> > ++version =3D "1.3.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "7f4c021e1093a56626774e81216a4ce732a735e5bad4868a03f3ed65ca0c3919"
> > ++dependencies =3D [
> > ++ "once_cell",
> > ++ "toml_edit",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "proc-macro-error"
> > ++version =3D "1.0.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
> > ++dependencies =3D [
> > ++ "proc-macro-error-attr",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "version_check",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "proc-macro-error-attr"
> > ++version =3D "1.0.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "version_check",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "proc-macro2"
> > ++version =3D "1.0.53"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "ba466839c78239c09faf015484e5cc04860f88242cff4d03eb038f04b4699b73"
> > ++dependencies =3D [
> > ++ "unicode-ident",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "quote"
> > ++version =3D "1.0.26"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "4424af4bf778aae2051a77b60283332f386554255d722233d09fbfc7e30da2fc"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "rand"
> > ++version =3D "0.8.5"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
> > ++dependencies =3D [
> > ++ "libc",
> > ++ "rand_chacha",
> > ++ "rand_core",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "rand_chacha"
> > ++version =3D "0.3.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
> > ++dependencies =3D [
> > ++ "ppv-lite86",
> > ++ "rand_core",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "rand_core"
> > ++version =3D "0.6.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
> > ++dependencies =3D [
> > ++ "getrandom",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "rayon"
> > ++version =3D "1.7.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1d2df5196e37bcc87abebc0053e20787d73847bb33134a69841207dd0a47f03b"
> > ++dependencies =3D [
> > ++ "either",
> > ++ "rayon-core",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "rayon-core"
> > ++version =3D "1.11.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddba9fc60661aebe8d"
> > ++dependencies =3D [
> > ++ "crossbeam-channel",
> > ++ "crossbeam-deque",
> > ++ "crossbeam-utils",
> > ++ "num_cpus",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "regex"
> > ++version =3D "1.7.2"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620fa0292ed5bb5814c"
> > ++dependencies =3D [
> > ++ "regex-syntax",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "regex-syntax"
> > ++version =3D "0.6.29"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b07f78537722f2e1"
> > ++
> > ++[[package]]
> > ++name =3D "ryu"
> > ++version =3D "1.0.13"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041"
> > ++
> > ++[[package]]
> > ++name =3D "same-file"
> > ++version =3D "1.0.6"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
> > ++dependencies =3D [
> > ++ "winapi-util",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "scopeguard"
> > ++version =3D "1.1.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
> > ++
> > ++[[package]]
> > ++name =3D "serde"
> > ++version =3D "1.0.158"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1bb9eb989425d9c9"
> > ++dependencies =3D [
> > ++ "serde_derive",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "serde_bytes"
> > ++version =3D "0.11.9"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe51ed97abb548294"
> > ++dependencies =3D [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "serde_derive"
> > ++version =3D "1.0.158"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e801c1712f48475582b7696ac71e0ca34ebb30e09338425384269d9717c62cad"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 2.0.8",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "serde_json"
> > ++version =3D "1.0.94"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc9434804029839884765d04ea"
> > ++dependencies =3D [
> > ++ "itoa",
> > ++ "ryu",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "serde_repr"
> > ++version =3D "0.1.12"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "bcec881020c684085e55a25f7fd888954d56609ef363479dc5a1305eb0d40cab"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 2.0.8",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "slab"
> > ++version =3D "0.4.8"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d"
> > ++dependencies =3D [
> > ++ "autocfg",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "static_assertions"
> > ++version =3D "1.1.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
> > ++
> > ++[[package]]
> > ++name =3D "strum"
> > ++version =3D "0.18.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "57bd81eb48f4c437cadc685403cad539345bf703d78e63707418431cecd4522b"
> > ++
> > ++[[package]]
> > ++name =3D "strum_macros"
> > ++version =3D "0.18.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad04002306f6e2774c"
> > ++dependencies =3D [
> > ++ "heck",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "syn"
> > ++version =3D "1.0.109"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "unicode-ident",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "syn"
> > ++version =3D "2.0.8"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c4d1687bdf704ad9"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "unicode-ident",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "system-deps"
> > ++version =3D "1.3.2"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "0f3ecc17269a19353b3558b313bba738b25d82993e30d62a18406a24aba4649b"
> > ++dependencies =3D [
> > ++ "heck",
> > ++ "pkg-config",
> > ++ "strum",
> > ++ "strum_macros",
> > ++ "thiserror",
> > ++ "toml",
> > ++ "version-compare",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "textwrap"
> > ++version =3D "0.16.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451fd7d0129c9c7c3d"
> > ++
> > ++[[package]]
> > ++name =3D "thiserror"
> > ++version =3D "1.0.40"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac"
> > ++dependencies =3D [
> > ++ "thiserror-impl",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "thiserror-impl"
> > ++version =3D "1.0.40"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 2.0.8",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "time"
> > ++version =3D "0.3.20"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b92017ebdf4999a5890"
> > ++dependencies =3D [
> > ++ "serde",
> > ++ "time-core",
> > ++ "time-macros",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "time-core"
> > ++version =3D "0.1.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b42640fff91f00fd"
> > ++
> > ++[[package]]
> > ++name =3D "time-macros"
> > ++version =3D "0.2.8"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "fd80a657e71da814b8e5d60d3374fc6d35045062245d80224748ae522dd76f36"
> > ++dependencies =3D [
> > ++ "time-core",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "tinytemplate"
> > ++version =3D "1.2.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
> > ++dependencies =3D [
> > ++ "serde",
> > ++ "serde_json",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "tinyvec"
> > ++version =3D "1.6.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb2421b52861a0a0cb50"
> > ++dependencies =3D [
> > ++ "tinyvec_macros",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "tinyvec_macros"
> > ++version =3D "0.1.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
> > ++
> > ++[[package]]
> > ++name =3D "toml"
> > ++version =3D "0.5.11"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "f4f7f0dd8d50a853a531c426359045b1998f04219d88799810762cd4ad314234"
> > ++dependencies =3D [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "toml_datetime"
> > ++version =3D "0.6.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "3ab8ed2edee10b50132aed5f331333428b011c99402b5a534154ed15746f9622"
> > ++
> > ++[[package]]
> > ++name =3D "toml_edit"
> > ++version =3D "0.19.8"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "239410c8609e8125456927e6707163a3b1fdb40561e4b803bc041f466ccfdc13"
> > ++dependencies =3D [
> > ++ "indexmap",
> > ++ "toml_datetime",
> > ++ "winnow",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "unicode-bidi"
> > ++version =3D "0.3.13"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "92888ba5573ff080736b3648696b70cafad7d250551175acbaa4e0385b3e1460"
> > ++
> > ++[[package]]
> > ++name =3D "unicode-ident"
> > ++version =3D "1.0.8"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb12f6d57d2269bf4"
> > ++
> > ++[[package]]
> > ++name =3D "unicode-normalization"
> > ++version =3D "0.1.22"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d0292cc7b0ce2ba921"
> > ++dependencies =3D [
> > ++ "tinyvec",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "unicode-segmentation"
> > ++version =3D "1.10.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1dd624098567895118886609431a7c3b8f516e41d30e0643f03d94592a147e36"
> > ++
> > ++[[package]]
> > ++name =3D "url"
> > ++version =3D "2.3.1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb51c09f22b83c4643"
> > ++dependencies =3D [
> > ++ "form_urlencoded",
> > ++ "idna",
> > ++ "percent-encoding",
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "uuid"
> > ++version =3D "1.3.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "1674845326ee10d37ca60470760d4288a6f80f304007d92e5c53bab78c9cfd79"
> > ++dependencies =3D [
> > ++ "serde",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "version-compare"
> > ++version =3D "0.0.10"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013837a3d0b3994ca1"
> > ++
> > ++[[package]]
> > ++name =3D "version_check"
> > ++version =3D "0.9.4"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
> > ++
> > ++[[package]]
> > ++name =3D "walkdir"
> > ++version =3D "2.3.3"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698"
> > ++dependencies =3D [
> > ++ "same-file",
> > ++ "winapi-util",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "wasi"
> > ++version =3D "0.11.0+wasi-snapshot-preview1"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
> > ++
> > ++[[package]]
> > ++name =3D "wasm-bindgen"
> > ++version =3D "0.2.84"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b3df58b2007ca53b"
> > ++dependencies =3D [
> > ++ "cfg-if",
> > ++ "wasm-bindgen-macro",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "wasm-bindgen-backend"
> > ++version =3D "0.2.84"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "95ce90fd5bcc06af55a641a86428ee4229e44e07033963a2290a8e241607ccb9"
> > ++dependencies =3D [
> > ++ "bumpalo",
> > ++ "log",
> > ++ "once_cell",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "wasm-bindgen-shared",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "wasm-bindgen-macro"
> > ++version =3D "0.2.84"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "4c21f77c0bedc37fd5dc21f897894a5ca01e7bb159884559461862ae90c0b4c5"
> > ++dependencies =3D [
> > ++ "quote",
> > ++ "wasm-bindgen-macro-support",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "wasm-bindgen-macro-support"
> > ++version =3D "0.2.84"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d823066102f35a5f6"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "wasm-bindgen-backend",
> > ++ "wasm-bindgen-shared",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "wasm-bindgen-shared"
> > ++version =3D "0.2.84"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57ebe37e49358989b5d"
> > ++
> > ++[[package]]
> > ++name =3D "web-sys"
> > ++version =3D "0.3.61"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d6027c0f575b0b97"
> > ++dependencies =3D [
> > ++ "js-sys",
> > ++ "wasm-bindgen",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "winapi"
> > ++version =3D "0.3.9"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
> > ++dependencies =3D [
> > ++ "winapi-i686-pc-windows-gnu",
> > ++ "winapi-x86_64-pc-windows-gnu",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "winapi-i686-pc-windows-gnu"
> > ++version =3D "0.4.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
> > ++
> > ++[[package]]
> > ++name =3D "winapi-util"
> > ++version =3D "0.1.5"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
> > ++dependencies =3D [
> > ++ "winapi",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "winapi-x86_64-pc-windows-gnu"
> > ++version =3D "0.4.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
> > ++
> > ++[[package]]
> > ++name =3D "winnow"
> > ++version =3D "0.4.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305ed5c0c10bb241d1"
> > ++dependencies =3D [
> > ++ "memchr",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "zvariant"
> > ++version =3D "3.12.0"
> > ++dependencies =3D [
> > ++ "arrayvec",
> > ++ "byteorder",
> > ++ "chrono",
> > ++ "criterion",
> > ++ "enumflags2",
> > ++ "glib",
> > ++ "libc",
> > ++ "rand",
> > ++ "serde",
> > ++ "serde_bytes",
> > ++ "serde_json",
> > ++ "serde_repr",
> > ++ "static_assertions",
> > ++ "time",
> > ++ "url",
> > ++ "uuid",
> > ++ "zvariant_derive",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "zvariant_derive"
> > ++version =3D "3.12.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616d34007fd84e462a"
> > ++dependencies =3D [
> > ++ "proc-macro-crate 1.3.1",
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++ "zvariant_utils",
> > ++]
> > ++
> > ++[[package]]
> > ++name =3D "zvariant_utils"
> > ++version =3D "1.0.0"
> > ++source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > ++checksum =3D
> "53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728d8b5d7c40640a8b"
> > ++dependencies =3D [
> > ++ "proc-macro2",
> > ++ "quote",
> > ++ "syn 1.0.109",
> > ++]
> > +diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml
> > +index 45367729..6981862a 100644
> > +--- a/zvariant/Cargo.toml
> > ++++ b/zvariant/Cargo.toml
> > +@@ -27,7 +27,7 @@ byteorder =3D "1.4.3"
> > + serde =3D { version =3D "1.0", features =3D ["derive"] }
> > + arrayvec =3D { version =3D "0.7.2", features =3D ["serde"], optional =
=3D true }
> > + enumflags2 =3D { version =3D "0.7.5", features =3D ["serde"], optiona=
l =3D
> true }
> > +-zvariant_derive =3D { version =3D "=3D3.12.0", path =3D "../zvariant_=
derive" }
> > ++zvariant_derive =3D "3.12.0"
> > + serde_bytes =3D { version =3D "0.11", optional =3D true }
> > + static_assertions =3D "1.1.0"
> > + libc =3D "0.2.137"
> > +2.34.1
> > +
> > diff --git a/meta/recipes-extended/rust-example/zvariant_3.12.0.bb
> b/meta/recipes-extended/rust-example/zvariant_3.12.0.bb
> > new file mode 100644
> > index 0000000000..ab769b3fce
> > --- /dev/null
> > +++ b/meta/recipes-extended/rust-example/zvariant_3.12.0.bb
> > @@ -0,0 +1,20 @@
> > +SUMMARY =3D "Provides API for encoding/decoding of data to/from D-Bus
> wire format"
> > +DESCRIPTION =3D "This crate provides API for encoding/decoding of data
> to/from D-Bus wire format.\
> > +This binary wire format is simple and very efficient and hence useful
> outside of D-Bus context as well.\
> > +A modified form of this format, GVariant is very commonly used for
> efficient storage of arbitrary \
> > +data and is also supported by this crate."
> > +HOMEPAGE =3D "https://gitlab.freedesktop.org/dbus/zbus/"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db377b220f43d747efdec40d69fc=
aa69d"
> > +
> > +SRC_URI =3D " \
> > +    git://
> gitlab.freedesktop.org/dbus/zbus;protocol=3Dhttps;branch=3Dmain;subpath=
=3Dzvariant
> \
> > +    file://0001-Tweak-zvariant-cargo-config.patch;striplevel=3D2 \
> > +"
> > +
> > +SRCREV =3D "07506776fab5f58e029760bb4b288f670c7eecd6"
> > +S =3D "${WORKDIR}/zvariant"
> > +
> > +inherit cargo cargo-update-recipe-crates
> > +
> > +require ${BPN}-crates.inc
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179092):
> https://lists.openembedded.org/g/openembedded-core/message/179092
> > Mute This Topic: https://lists.openembedded.org/mt/97840364/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000005dab1105f7bf9096
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I thought that would be treated the same as <a href=
=3D"http://rust-hello-world_git.bb">rust-hello-world_git.bb</a> which is in=
 oe-core.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Anyway, =
I don&#39;t mind placing it elsewhere, which layer do you think this recipe=
 would land?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br><=
br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_=
attr">Le sam. 25 mars 2023, 19:52, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">I don&#39;t think this should be go=
ing in oe-core, as it&#39;s not actually<br>
used by anything, or in any automated tests. But you can place it in a<br>
separate layer.<br>
<br>
Alex<br>
<br>
On Sat, 25 Mar 2023 at 10:01, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">frederic.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt;<br>
&gt; This recipe is for showing an &quot;real world&quot; example of<br>
&gt; a crate that depends on some git repositories.<br>
&gt;<br>
&gt; Usually, this kind of crate is built within a global<br>
&gt; workspace (here it is the zbus project) and so<br>
&gt; doesn&#39;t need a Cargo.lock on its own.<br>
&gt;<br>
&gt; For the sake of the demonstration, I had to add<br>
&gt; a patch for probiding a Cargo.lock and modifying<br>
&gt; zvariant_deriver to get it from <a href=3D"http://crates.io" rel=3D"no=
referrer noreferrer" target=3D"_blank">crates.io</a> instead<br>
&gt; of pulling locally with a relative path<br>
&gt;<br>
&gt; The use case where the crate had some git repository<br>
&gt; in dependency is very common for &quot;private&quot; crate that<br>
&gt; are not aimed to be published on <a href=3D"http://crate.io" rel=3D"no=
referrer noreferrer" target=3D"_blank">crate.io</a>.<br>
&gt; When the project grow bigger, it is common to have<br>
&gt; a bin and multiple lib developped in parallel, and these<br>
&gt; libs are surely on a git repostitory.<br>
&gt;<br>
&gt; Hence the need of this support in oe-core.<br>
&gt;<br>
&gt; Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mart=
insons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@=
gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../rust-example/zvariant-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 140 ++<br>
&gt;=C2=A0 .../0001-Tweak-zvariant-cargo-config.patch=C2=A0 =C2=A0 | 1249 +=
++++++++++++++++<br>
&gt;=C2=A0 .../rust-example/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"no=
referrer noreferrer" target=3D"_blank">zvariant_3.12.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +<br>
&gt;=C2=A0 3 files changed, 1409 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/rust-example/zvariant-c=
rates.inc<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/rust-example/zvariant/0=
001-Tweak-zvariant-cargo-config.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-extended/rust-example/<a href=3D=
"http://zvariant_3.12.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>zvariant_3.12.0.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/rust-example/zvariant-crates.inc b/=
meta/recipes-extended/rust-example/zvariant-crates.inc<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..297a784661<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/rust-example/zvariant-crates.inc<br>
&gt; @@ -0,0 +1,140 @@<br>
&gt; +SRC_URI +=3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anes/0.1.6" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/anes/0.1.6</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/anyhow/1.0.70" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/anyhow/1.0.70</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/arrayvec/0.7.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/arrayvec/0.7.2</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/atty/0.2.14" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/atty/0.2.14</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/autocfg/1.1.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/autocfg/1.1.0</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bitflags/1.3.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/bitflags/1.3.2</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/bumpalo/3.12.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/bumpalo/3.12.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/byteorder/1.4.3" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/byteorder/1.4.3</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cast/0.3.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/cast/0.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cfg-if/1.0.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/cfg-if/1.0.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/chrono/0.4.24" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/chrono/0.4.24</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ciborium-io/0.2.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ciborium-io/0.2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ciborium-ll/0.2.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ciborium-ll/0.2.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ciborium/0.2.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ciborium/0.2.0</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap/3.2.23" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/clap/3.2.23</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/clap_lex/0.2.4" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/clap_lex/0.2.4</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/criterion-plot/0.5.=
0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/criterion-plot=
/0.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/criterion/0.4.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/criterion/0.4.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0=
.5.7" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-c=
hannel/0.5.7</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-deque/0.8=
.3" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-deq=
ue/0.8.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoch/0.9=
.14" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-ep=
och/0.9.14</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-utils/0.8=
.15" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/crossbeam-ut=
ils/0.8.15</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/either/1.8.1" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/either/1.8.1</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2/0.7.5" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/enumflags2/0.7.5</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/enumflags2_derive/0=
.7.4" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/enumflags2_=
derive/0.7.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/form_urlencoded/1.1=
.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/form_urlencod=
ed/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-channel/0.3=
.27" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/futures-chan=
nel/0.3.27</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-core/0.3.27=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/futures-core/0.=
3.27</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-executor/0.=
3.27" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/futures-exe=
cutor/0.3.27</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-macro/0.3.2=
7" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/futures-macro/=
0.3.27</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-task/0.3.27=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/futures-task/0.=
3.27</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/futures-util/0.3.27=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/futures-util/0.=
3.27</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/getrandom/0.2.8" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/getrandom/0.2.8</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/half/1.8.2" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/half/1.8.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hashbrown/0.12.3" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/hashbrown/0.12.3</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/heck/0.3.3" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/heck/0.3.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.1.19" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/hermit-abi/0.1.19=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/hermit-abi/0.2.6" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/hermit-abi/0.2.6</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/idna/0.3.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/idna/0.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/indexmap/1.9.2" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/indexmap/1.9.2</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itertools/0.10.5" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/itertools/0.10.5</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itertools/0.9.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/itertools/0.9.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/itoa/1.0.6" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/itoa/1.0.6</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/js-sys/0.3.61" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/js-sys/0.3.61</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/lazy_static/1.4.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/lazy_static/1.4.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.140" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/libc/0.2.140</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/log/0.4.17" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/log/0.4.17</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memchr/2.5.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/memchr/2.5.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/memoffset/0.8.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/memoffset/0.8.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-integer/0.1.45"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/num-integer/0.1.=
45</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-traits/0.2.15" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/num-traits/0.2.15=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num_cpus/1.15.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/num_cpus/1.15.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.17.1" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/once_cell/1.17.1</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/oorandom/11.1.3" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/oorandom/11.1.3</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/os_str_bytes/6.5.0"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/os_str_bytes/6.5=
.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/percent-encoding/2.=
2.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/percent-enco=
ding/2.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pin-project-lite/0.=
2.9" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/pin-project-=
lite/0.2.9</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pin-utils/0.1.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/pin-utils/0.1.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/pkg-config/0.3.26" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/pkg-config/0.3.26=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/plotters-backend/0.=
3.4" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/plotters-bac=
kend/0.3.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/plotters-svg/0.3.3"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/plotters-svg/0.3=
.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/plotters/0.3.4" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/plotters/0.3.4</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ppv-lite86/0.2.17" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/ppv-lite86/0.2.17=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-crate/0.=
1.5" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/proc-macro-c=
rate/0.1.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-crate/1.=
3.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/proc-macro-c=
rate/1.3.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-error-at=
tr/1.0.4" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/proc-ma=
cro-error-attr/1.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro-error/1.=
0.4" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/proc-macro-e=
rror/1.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/proc-macro2/1.0.53"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/proc-macro2/1.0.=
53</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/quote/1.0.26" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/quote/1.0.26</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand/0.8.5" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/rand/0.8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_chacha/0.3.1" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_chacha/0.3.1=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rand_core/0.6.4" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rand_core/0.6.4</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rayon-core/1.11.0" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/rayon-core/1.11.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/rayon/1.7.0" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/rayon/1.7.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex-syntax/0.6.29=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/regex-syntax/0.=
6.29</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/regex/1.7.2" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/regex/1.7.2</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/ryu/1.0.13" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/ryu/1.0.13</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/same-file/1.0.6" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/same-file/1.0.6</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/scopeguard/1.1.0" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/scopeguard/1.1.0</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde/1.0.158" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde/1.0.158</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_bytes/0.11.9"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde_bytes/0.11=
.9</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_derive/1.0.15=
8" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde_derive/1=
.0.158</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_json/1.0.94" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde_json/1.0.94=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/serde_repr/0.1.12" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/serde_repr/0.1.12=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/slab/0.4.8" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/slab/0.4.8</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/static_assertions/1=
.1.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/static_asse=
rtions/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strum/0.18.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/strum/0.18.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/strum_macros/0.18.0=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/strum_macros/0.=
18.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/1.0.109" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/syn/1.0.109</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/syn/2.0.8" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">crates.io/syn/2.0.8</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/system-deps/1.3.2" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/system-deps/1.3.2=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/textwrap/0.16.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/textwrap/0.16.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror-impl/1.0.=
40" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/thiserror-imp=
l/1.0.40</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/thiserror/1.0.40" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/thiserror/1.0.40</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time-core/0.1.0" re=
l=3D"noreferrer noreferrer" target=3D"_blank">crates.io/time-core/0.1.0</a>=
 \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time-macros/0.2.8" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/time-macros/0.2.8=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/time/0.3.20" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/time/0.3.20</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinytemplate/1.2.1"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/tinytemplate/1.2=
.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinyvec/1.6.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/tinyvec/1.6.0</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/tinyvec_macros/0.1.=
1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/tinyvec_macros=
/0.1.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml/0.5.11" rel=3D=
"noreferrer noreferrer" target=3D"_blank">crates.io/toml/0.5.11</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_datetime/0.6.1=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/toml_datetime/0=
.6.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/toml_edit/0.19.8" r=
el=3D"noreferrer noreferrer" target=3D"_blank">crates.io/toml_edit/0.19.8</=
a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-bidi/0.3.13=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicode-bidi/0.=
3.13</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-ident/1.0.8=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicode-ident/1=
.0.8</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-normalizati=
on/0.1.22" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicod=
e-normalization/0.1.22</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/unicode-segmentatio=
n/1.10.1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/unicode=
-segmentation/1.10.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/url/2.3.1" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">crates.io/url/2.3.1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/uuid/1.3.0" rel=3D"=
noreferrer noreferrer" target=3D"_blank">crates.io/uuid/1.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version-compare/0.0=
.10" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/version-comp=
are/0.0.10</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/version_check/0.9.4=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/version_check/0=
.9.4</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/walkdir/2.3.3" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/walkdir/2.3.3</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasi/0.11.0+wasi-sn=
apshot-preview1" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/=
wasi/0.11.0+wasi-snapshot-preview1</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-backen=
d/0.2.84" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/wasm-bi=
ndgen-backend/0.2.84</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro-=
support/0.2.84" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/w=
asm-bindgen-macro-support/0.2.84</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-macro/=
0.2.84" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/wasm-bind=
gen-macro/0.2.84</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen-shared=
/0.2.84" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/wasm-bin=
dgen-shared/0.2.84</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/wasm-bindgen/0.2.84=
" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/wasm-bindgen/0.=
2.84</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/web-sys/0.3.61" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/web-sys/0.3.61</a> \=
<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-i686-pc-wind=
ows-gnu/0.4.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/wi=
napi-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-util/0.1.5" =
rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/winapi-util/0.1.5=
</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi-x86_64-pc-wi=
ndows-gnu/0.4.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/=
winapi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winapi/0.3.9" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/winapi/0.3.9</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/winnow/0.4.0" rel=
=3D"noreferrer noreferrer" target=3D"_blank">crates.io/winnow/0.4.0</a> \<b=
r>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_derive/3.1=
2.0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/zvariant_der=
ive/3.12.0</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zvariant_utils/1.0.=
0" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io/zvariant_utils=
/1.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/gtk-rs/glib;protocol=
=3Dhttps;nobranch=3D1;name=3Dglib;destsuffix=3Dglib" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">github.com/gtk-rs/glib;protocol=3Dhttps;nobranch=
=3D1;name=3Dglib;destsuffix=3Dglib</a> \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/gtk-rs/sys;protocol=
=3Dhttps;nobranch=3D1;name=3Dglib-sys;destsuffix=3Dglib-sys;subpath=3Dglib-=
sys" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/gtk-rs/sys;=
protocol=3Dhttps;nobranch=3D1;name=3Dglib-sys;destsuffix=3Dglib-sys;subpath=
=3Dglib-sys</a> \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://github.com/gtk-rs/sys;protocol=
=3Dhttps;nobranch=3D1;name=3Dgobject-sys;destsuffix=3Dgobject-sys;subpath=
=3Dgobject-sys" rel=3D"noreferrer noreferrer" target=3D"_blank">github.com/=
gtk-rs/sys;protocol=3Dhttps;nobranch=3D1;name=3Dgobject-sys;destsuffix=3Dgo=
bject-sys;subpath=3Dgobject-sys</a> \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRCREV_FORMAT .=3D &quot;_glib&quot;<br>
&gt; +SRCREV_glib =3D &quot;c9ee583cea07830c099cdcccd33eda9ef705ea93&quot;<=
br>
&gt; +<br>
&gt; +SRCREV_FORMAT .=3D &quot;_glib-sys&quot;<br>
&gt; +SRCREV_glib-sys =3D &quot;5f35e26c65d24f8f018f643218de0f5807ba5f01&qu=
ot;<br>
&gt; +<br>
&gt; +SRCREV_FORMAT .=3D &quot;_gobject-sys&quot;<br>
&gt; +SRCREV_gobject-sys =3D &quot;5f35e26c65d24f8f018f643218de0f5807ba5f01=
&quot;<br>
&gt; diff --git a/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zv=
ariant-cargo-config.patch b/meta/recipes-extended/rust-example/zvariant/000=
1-Tweak-zvariant-cargo-config.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..638ba3ed4d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-=
cargo-config.patch<br>
&gt; @@ -0,0 +1,1249 @@<br>
&gt; +From e85ce4136694899f0010d48f47c5e905c3a9d461 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.co=
m</a>&gt;<br>
&gt; +Date: Thu, 23 Mar 2023 07:12:37 +0100<br>
&gt; +Subject: [PATCH] Tweak zvariant cargo config<br>
&gt; +<br>
&gt; +This library crate is a part of zbus project, and is aimed to<br>
&gt; +be published amongst the whole project.<br>
&gt; +<br>
&gt; +Nevertheless, this recipe is for showing example of real<br>
&gt; +code which uses a local registry via git url inside yocto<br>
&gt; +environment.<br>
&gt; +<br>
&gt; +I didn&#39;t find a real example of binary crate that uses git<br>
&gt; +dependency but it seems to me a very common use case<br>
&gt; +when we are working on multiple local crates that are not<br>
&gt; +aimed to be published on public registry.<br>
&gt; +<br>
&gt; +Long story short, this patch add a modified Cargo.toml<br>
&gt; +to use the zvariant_derive dependency from <a href=3D"http://crates.i=
o" rel=3D"noreferrer noreferrer" target=3D"_blank">crates.io</a> instead<br=
>
&gt; +of zbus local one and a pre generated Cargo.lock in order<br>
&gt; +to make cargo patch process inside cargo_common.bbclass work<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate<br>
&gt; +Signed-off-by: Frederic Martinsons &lt;<a href=3D"mailto:frederic.mar=
tinsons@gmail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons=
@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + zvariant/Cargo.lock | 1198 +++++++++++++++++++++++++++++++++++++++++=
++<br>
&gt; + zvariant/Cargo.toml |=C2=A0 =C2=A0 2 +-<br>
&gt; + 2 files changed, 1199 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100644 zvariant/Cargo.lock<br>
&gt; +<br>
&gt; +diff --git a/zvariant/Cargo.lock b/zvariant/Cargo.lock<br>
&gt; +new file mode 100644<br>
&gt; +index 00000000..02a83d42<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/zvariant/Cargo.lock<br>
&gt; +@@ -0,0 +1,1198 @@<br>
&gt; ++# This file is automatically @generated by Cargo.<br>
&gt; ++# It is not intended for manual editing.<br>
&gt; ++version =3D 3<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;anes&quot;<br>
&gt; ++version =3D &quot;0.1.6&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275=
b9fcf1e380f7299&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;anyhow&quot;<br>
&gt; ++version =3D &quot;1.0.70&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;7de8ce5e0f9f8d88245311066a578d72b7af3e7088f327838=
04676302df237e4&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;arrayvec&quot;<br>
&gt; ++version =3D &quot;0.7.2&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;8da52d66c7071e2e3fa2a1e5c6d088fec47b593032b254f5e=
980de8ea54454d6&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;atty&quot;<br>
&gt; ++version =3D &quot;0.2.14&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;d9b39be18770d11421cdb1b9947a45dd3f37e93092cbf3776=
14828a319d5fee8&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;hermit-abi 0.1.19&quot;,<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++ &quot;winapi&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;autocfg&quot;<br>
&gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e35=
29ffa43161b97fa&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;bitflags&quot;<br>
&gt; ++version =3D &quot;1.3.2&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc=
18d06fb1037718a&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;bumpalo&quot;<br>
&gt; ++version =3D &quot;3.12.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;0d261e256854913907f67ed06efbc3338dfe6179796deefc1=
ff763fc1aee5535&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;byteorder&quot;<br>
&gt; ++version =3D &quot;1.4.3&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5=
b4585d8d3a6a610&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;cast&quot;<br>
&gt; ++version =3D &quot;0.3.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b61259=
8138befd7b37eb5&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;cfg-if&quot;<br>
&gt; ++version =3D &quot;1.0.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efb=
f79117bd2da40fd&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;chrono&quot;<br>
&gt; ++version =3D &quot;0.4.24&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;4e3c5919066adf22df73762e50cffcde3a758f2a848b113b5=
86d1f86728b673b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;num-integer&quot;,<br>
&gt; ++ &quot;num-traits&quot;,<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;ciborium&quot;<br>
&gt; ++version =3D &quot;0.2.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;b0c137568cc60b904a7724001b35ce2630fd00d5d84805fbb=
608ab89509d788f&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;ciborium-io&quot;,<br>
&gt; ++ &quot;ciborium-ll&quot;,<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;ciborium-io&quot;<br>
&gt; ++version =3D &quot;0.2.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;346de753af073cc87b52b2083a506b38ac176a44cfb05497b=
622e27be899b369&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;ciborium-ll&quot;<br>
&gt; ++version =3D &quot;0.2.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;213030a2b5a4e0c0892b6652260cf6ccac84827b83a85a534=
e178e3906c4cf1b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;ciborium-io&quot;,<br>
&gt; ++ &quot;half&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;clap&quot;<br>
&gt; ++version =3D &quot;3.2.23&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;71655c45cb9845d3270c9d6df84ebe72b4dad3c2ba3f7023a=
d47c144e4e473a5&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;bitflags&quot;,<br>
&gt; ++ &quot;clap_lex&quot;,<br>
&gt; ++ &quot;indexmap&quot;,<br>
&gt; ++ &quot;textwrap&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;clap_lex&quot;<br>
&gt; ++version =3D &quot;0.2.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;2850f2f5a82cbf437dd5af4d49848fbdfc27c157c3d010345=
776f952765261c5&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;os_str_bytes&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;criterion&quot;<br>
&gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e7c76e09c1aae2bc52b3d2f29e13c6572553b30c4aa1b8a49=
fd70de6412654cb&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;anes&quot;,<br>
&gt; ++ &quot;atty&quot;,<br>
&gt; ++ &quot;cast&quot;,<br>
&gt; ++ &quot;ciborium&quot;,<br>
&gt; ++ &quot;clap&quot;,<br>
&gt; ++ &quot;criterion-plot&quot;,<br>
&gt; ++ &quot;itertools 0.10.5&quot;,<br>
&gt; ++ &quot;lazy_static&quot;,<br>
&gt; ++ &quot;num-traits&quot;,<br>
&gt; ++ &quot;oorandom&quot;,<br>
&gt; ++ &quot;plotters&quot;,<br>
&gt; ++ &quot;rayon&quot;,<br>
&gt; ++ &quot;regex&quot;,<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++ &quot;serde_derive&quot;,<br>
&gt; ++ &quot;serde_json&quot;,<br>
&gt; ++ &quot;tinytemplate&quot;,<br>
&gt; ++ &quot;walkdir&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;criterion-plot&quot;<br>
&gt; ++version =3D &quot;0.5.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;6b50826342786a51a89e2da3a28f1c32b06e387201bc2d197=
91f622c673706b1&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;cast&quot;,<br>
&gt; ++ &quot;itertools 0.10.5&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;crossbeam-channel&quot;<br>
&gt; ++version =3D &quot;0.5.7&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;cf2b3e8478797446514c91ef04bafcb59faba183e621ad488=
df88983cc14128c&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;cfg-if&quot;,<br>
&gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;crossbeam-deque&quot;<br>
&gt; ++version =3D &quot;0.8.3&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;ce6fd6f855243022dcecf8702fef0c297d4338e226845fe06=
7f6341ad9fa0cef&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;cfg-if&quot;,<br>
&gt; ++ &quot;crossbeam-epoch&quot;,<br>
&gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;crossbeam-epoch&quot;<br>
&gt; ++version =3D &quot;0.9.14&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;46bd5f3f85273295a9d14aedfb86f6aadbff6d8f5295c4a9e=
db08e819dcf5695&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;autocfg&quot;,<br>
&gt; ++ &quot;cfg-if&quot;,<br>
&gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; ++ &quot;memoffset&quot;,<br>
&gt; ++ &quot;scopeguard&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;crossbeam-utils&quot;<br>
&gt; ++version =3D &quot;0.8.15&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;3c063cd8cc95f5c377ed0d4b49a4b21f632396ff690e8470c=
29b3359b346984b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;cfg-if&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;either&quot;<br>
&gt; ++version =3D &quot;1.8.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca=
9d6d1ae31f16d91&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;enumflags2&quot;<br>
&gt; ++version =3D &quot;0.7.5&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e75d4cd21b95383444831539909fbb14b9dc3fdceb2a6f5d3=
6577329a1f55ccb&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;enumflags2_derive&quot;,<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;enumflags2_derive&quot;<br>
&gt; ++version =3D &quot;0.7.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;f58dc3c5e468259f19f2d46304a6b28f1c3d034442e14b322=
d2b850e36f6d5ae&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;form_urlencoded&quot;<br>
&gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;a9c384f161156f5260c24a097c56119f9be8c798586aecc13=
afbcbe7b7e26bf8&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;percent-encoding&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;futures-channel&quot;<br>
&gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;164713a5a0dcc3e7b4b1ed7d3b433cabc18025386f9339346=
e8daf15963cf7ac&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;futures-core&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;futures-core&quot;<br>
&gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;86d7a0c1aa76363dac491de0ee99faf6941128376f1cf96f0=
7db7603b7de69dd&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;futures-executor&quot;<br>
&gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1997dd9df74cdac935c76252744c1ed5794fac083242ea4fe=
77ef3ed60ba0f83&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;futures-core&quot;,<br>
&gt; ++ &quot;futures-task&quot;,<br>
&gt; ++ &quot;futures-util&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;futures-macro&quot;<br>
&gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;3eb14ed937631bd8b8b8977f2c198443447a8355b6e3ca599=
f38c975e5a963b6&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;futures-task&quot;<br>
&gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;fd65540d33b37b16542a0438c12e6aeead10d4ac5d05bd3f8=
05b8f35ab592879&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;futures-util&quot;<br>
&gt; ++version =3D &quot;0.3.27&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;3ef6b17e481503ec85211fed8f39d1970f128935ca1f814cd=
32ac4a6842e84ab&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;futures-core&quot;,<br>
&gt; ++ &quot;futures-macro&quot;,<br>
&gt; ++ &quot;futures-task&quot;,<br>
&gt; ++ &quot;pin-project-lite&quot;,<br>
&gt; ++ &quot;pin-utils&quot;,<br>
&gt; ++ &quot;slab&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;getrandom&quot;<br>
&gt; ++version =3D &quot;0.2.8&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d=
7277a768d396b31&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;cfg-if&quot;,<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++ &quot;wasi&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;glib&quot;<br>
&gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/glib?rev=
=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://github.com/gtk-rs/glib?rev=3Dc9ee583c=
ea0#c9ee583cea07830c099cdcccd33eda9ef705ea93</a>&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;bitflags&quot;,<br>
&gt; ++ &quot;futures-channel&quot;,<br>
&gt; ++ &quot;futures-core&quot;,<br>
&gt; ++ &quot;futures-executor&quot;,<br>
&gt; ++ &quot;futures-task&quot;,<br>
&gt; ++ &quot;futures-util&quot;,<br>
&gt; ++ &quot;glib-macros&quot;,<br>
&gt; ++ &quot;glib-sys&quot;,<br>
&gt; ++ &quot;gobject-sys&quot;,<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++ &quot;once_cell&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;glib-macros&quot;<br>
&gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/glib?rev=
=3Dc9ee583cea0#c9ee583cea07830c099cdcccd33eda9ef705ea93" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://github.com/gtk-rs/glib?rev=3Dc9ee583c=
ea0#c9ee583cea07830c099cdcccd33eda9ef705ea93</a>&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;anyhow&quot;,<br>
&gt; ++ &quot;heck&quot;,<br>
&gt; ++ &quot;itertools 0.9.0&quot;,<br>
&gt; ++ &quot;proc-macro-crate 0.1.5&quot;,<br>
&gt; ++ &quot;proc-macro-error&quot;,<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;glib-sys&quot;<br>
&gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/sys#5f35e2=
6c65d24f8f018f643218de0f5807ba5f01" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba=
5f01</a>&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++ &quot;system-deps&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;gobject-sys&quot;<br>
&gt; ++version =3D &quot;0.10.0&quot;<br>
&gt; ++source =3D &quot;git+<a href=3D"https://github.com/gtk-rs/sys#5f35e2=
6c65d24f8f018f643218de0f5807ba5f01" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://github.com/gtk-rs/sys#5f35e26c65d24f8f018f643218de0f5807ba=
5f01</a>&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;glib-sys&quot;,<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++ &quot;system-deps&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;half&quot;<br>
&gt; ++version =3D &quot;1.8.2&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;eabb4a44450da02c90444cf74558da904edde8fb4e9035a9a=
6a4e15445af0bd7&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;hashbrown&quot;<br>
&gt; ++version =3D &quot;0.12.3&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae7=
8fe8272889ac888&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;heck&quot;<br>
&gt; ++version =3D &quot;0.3.3&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;6d621efb26863f0e9924c6ac577e8275e5e6b77455db64ffa=
6c65c904e9e132c&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;unicode-segmentation&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;hermit-abi&quot;<br>
&gt; ++version =3D &quot;0.1.19&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;62b467343b94ba476dcb2500d242dadbb39557df889310ac7=
7c5d99100aaac33&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;hermit-abi&quot;<br>
&gt; ++version =3D &quot;0.2.6&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601=
ef3e3f47d1ae4c7&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;idna&quot;<br>
&gt; ++version =3D &quot;0.3.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e14ddfc70884202db2244c223200c204c2bda1bc6e0998d11=
b5e024d657209e6&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;unicode-bidi&quot;,<br>
&gt; ++ &quot;unicode-normalization&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;indexmap&quot;<br>
&gt; ++version =3D &quot;1.9.2&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1885e79c1fc4b10f0e172c475f458b7f7b93061064d98c329=
3e98c5ba0c8b399&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;autocfg&quot;,<br>
&gt; ++ &quot;hashbrown&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;itertools&quot;<br>
&gt; ++version =3D &quot;0.9.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;284f18f85651fe11e8a991b2adb42cb078325c996ed026d99=
4719efcfca1d54b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;either&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;itertools&quot;<br>
&gt; ++version =3D &quot;0.10.5&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe9=
1b3f46e0f2c8473&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;either&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;itoa&quot;<br>
&gt; ++version =3D &quot;1.0.6&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f1=
2ac6d3e94164ca6&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;js-sys&quot;<br>
&gt; ++version =3D &quot;0.3.61&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;445dde2150c55e483f3d8416706b97ec8e8237c307e5b7b4b=
8dd15e6af2a0730&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;lazy_static&quot;<br>
&gt; ++version =3D &quot;1.4.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df91=
8f455c4e18cc646&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;libc&quot;<br>
&gt; ++version =3D &quot;0.2.140&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6f=
b3ea2ed6095f80c&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;log&quot;<br>
&gt; ++version =3D &quot;0.4.17&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4=
259d3c095a2382e&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;cfg-if&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;memchr&quot;<br>
&gt; ++version =3D &quot;2.5.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0=
e2fe85fcb74566d&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;memoffset&quot;<br>
&gt; ++version =3D &quot;0.8.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae3=
9fcc186108b8de1&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;autocfg&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;num-integer&quot;<br>
&gt; ++version =3D &quot;0.1.45&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636df=
f58d7c6f7569cd9&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;autocfg&quot;,<br>
&gt; ++ &quot;num-traits&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;num-traits&quot;<br>
&gt; ++version =3D &quot;0.2.15&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e=
7e0372b38c6cdcd&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;autocfg&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;num_cpus&quot;<br>
&gt; ++version =3D &quot;1.15.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a=
16cd9ac8697593b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;hermit-abi 0.2.6&quot;,<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;once_cell&quot;<br>
&gt; ++version =3D &quot;1.17.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;b7e5500299e16ebb147ae15a00a942af264cf3688f47923b8=
fc2cd5858f23ad3&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;oorandom&quot;<br>
&gt; ++version =3D &quot;11.1.3&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;0ab1bc2a289d34bd04a330323ac98a1b4bc82c9d9fcb1e66b=
63caa84da26b575&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;os_str_bytes&quot;<br>
&gt; ++version =3D &quot;6.5.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;ceedf44fb00f2d1984b0bc98102627ce622e083e49a5bacdb=
3e514fa4238e267&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;percent-encoding&quot;<br>
&gt; ++version =3D &quot;2.2.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;478c572c3d73181ff3c2539045f6eb99e5491218eae919370=
993b890cdbdd98e&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;pin-project-lite&quot;<br>
&gt; ++version =3D &quot;0.2.9&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e0a7ae3ac2f1173085d398531c705756c94a4c56843785df8=
5a60c1a0afac116&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;pin-utils&quot;<br>
&gt; ++version =3D &quot;0.1.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f=
8826aaaf7c9f184&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;pkg-config&quot;<br>
&gt; ++version =3D &quot;0.3.26&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;6ac9a59f73473f1b8d852421e59e64809f025994837ef7436=
15c6d0c5b305160&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;plotters&quot;<br>
&gt; ++version =3D &quot;0.3.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;2538b639e642295546c50fcd545198c9d64ee2a38620a6287=
24a3b266d5fbf97&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;num-traits&quot;,<br>
&gt; ++ &quot;plotters-backend&quot;,<br>
&gt; ++ &quot;plotters-svg&quot;,<br>
&gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt; ++ &quot;web-sys&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;plotters-backend&quot;<br>
&gt; ++version =3D &quot;0.3.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;193228616381fecdc1224c62e96946dfbc73ff4384fba576e=
052ff8c1bea8142&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;plotters-svg&quot;<br>
&gt; ++version =3D &quot;0.3.3&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;f9a81d2759aae1dae668f783c308bc5c8ebd191ff4184aaa1=
b37f65a6ae5a56f&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;plotters-backend&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;ppv-lite86&quot;<br>
&gt; ++version =3D &quot;0.2.17&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e765=
3e024ae4479e6de&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;proc-macro-crate&quot;<br>
&gt; ++version =3D &quot;0.1.5&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1d6ea3c4595b96363c13943497db34af4460fb474a95c43f4=
446ad341b8c9785&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;toml&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;proc-macro-crate&quot;<br>
&gt; ++version =3D &quot;1.3.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;7f4c021e1093a56626774e81216a4ce732a735e5bad4868a0=
3f3ed65ca0c3919&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;once_cell&quot;,<br>
&gt; ++ &quot;toml_edit&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;proc-macro-error&quot;<br>
&gt; ++version =3D &quot;1.0.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517=
bea02a73a5ce38c&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro-error-attr&quot;,<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++ &quot;version_check&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;proc-macro-error-attr&quot;<br>
&gt; ++version =3D &quot;1.0.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;a1be40180e52ecc98ad80b184934baf3d0d29f979574e439a=
f5a55274b35f869&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;version_check&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;proc-macro2&quot;<br>
&gt; ++version =3D &quot;1.0.53&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;ba466839c78239c09faf015484e5cc04860f88242cff4d03e=
b038f04b4699b73&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;unicode-ident&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;quote&quot;<br>
&gt; ++version =3D &quot;1.0.26&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;4424af4bf778aae2051a77b60283332f386554255d722233d=
09fbfc7e30da2fc&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;rand&quot;<br>
&gt; ++version =3D &quot;0.8.5&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049=
bef581b46327404&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++ &quot;rand_chacha&quot;,<br>
&gt; ++ &quot;rand_core&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;rand_chacha&quot;<br>
&gt; ++version =3D &quot;0.3.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1e=
aa8141b9b127d88&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;ppv-lite86&quot;,<br>
&gt; ++ &quot;rand_core&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;rand_core&quot;<br>
&gt; ++version =3D &quot;0.6.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc35=
47996c5c816922c&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;getrandom&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;rayon&quot;<br>
&gt; ++version =3D &quot;1.7.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1d2df5196e37bcc87abebc0053e20787d73847bb33134a698=
41207dd0a47f03b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;either&quot;,<br>
&gt; ++ &quot;rayon-core&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;rayon-core&quot;<br>
&gt; ++version =3D &quot;1.11.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;4b8f95bd6966f5c87776639160a66bd8ab9895d9d4ab01ddb=
a9fc60661aebe8d&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;crossbeam-channel&quot;,<br>
&gt; ++ &quot;crossbeam-deque&quot;,<br>
&gt; ++ &quot;crossbeam-utils&quot;,<br>
&gt; ++ &quot;num_cpus&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;regex&quot;<br>
&gt; ++version =3D &quot;1.7.2&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;cce168fea28d3e05f158bda4576cf0c844d5045bc2cc3620f=
a0292ed5bb5814c&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;regex-syntax&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;regex-syntax&quot;<br>
&gt; ++version =3D &quot;0.6.29&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;f162c6dd7b008981e4d40210aca20b4bd0f9b60ca9271061b=
07f78537722f2e1&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;ryu&quot;<br>
&gt; ++version =3D &quot;1.0.13&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;f91339c0467de62360649f8d3e185ca8de4224ff281f66000=
de5eb2a77a79041&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;same-file&quot;<br>
&gt; ++version =3D &quot;1.0.6&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b=
6b0b68378900502&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;winapi-util&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;scopeguard&quot;<br>
&gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b74=
8380fb20baa78cd&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;serde&quot;<br>
&gt; ++version =3D &quot;1.0.158&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;771d4d9c4163ee138805e12c710dd365e4f44be8be0503cb1=
bb9eb989425d9c9&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;serde_derive&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;serde_bytes&quot;<br>
&gt; ++version =3D &quot;0.11.9&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;416bda436f9aab92e02c8e10d49a15ddd339cea90b6e340fe=
51ed97abb548294&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;serde_derive&quot;<br>
&gt; ++version =3D &quot;1.0.158&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e801c1712f48475582b7696ac71e0ca34ebb30e0933842538=
4269d9717c62cad&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;serde_json&quot;<br>
&gt; ++version =3D &quot;1.0.94&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1c533a59c9d8a93a09c6ab31f0fd5e5f4dd1b8fc943480402=
9839884765d04ea&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;itoa&quot;,<br>
&gt; ++ &quot;ryu&quot;,<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;serde_repr&quot;<br>
&gt; ++version =3D &quot;0.1.12&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;bcec881020c684085e55a25f7fd888954d56609ef363479dc=
5a1305eb0d40cab&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;slab&quot;<br>
&gt; ++version =3D &quot;0.4.8&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3=
317cf875eecfc2d&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;autocfg&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;static_assertions&quot;<br>
&gt; ++version =3D &quot;1.1.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb=
0fb81c06b37543f&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;strum&quot;<br>
&gt; ++version =3D &quot;0.18.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;57bd81eb48f4c437cadc685403cad539345bf703d78e63707=
418431cecd4522b&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;strum_macros&quot;<br>
&gt; ++version =3D &quot;0.18.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;87c85aa3f8ea653bfd3ddf25f7ee357ee4d204731f6aa9ad0=
4002306f6e2774c&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;heck&quot;,<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;syn&quot;<br>
&gt; ++version =3D &quot;1.0.109&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792=
a6d0160888b4237&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;unicode-ident&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;syn&quot;<br>
&gt; ++version =3D &quot;2.0.8&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;bcc02725fd69ab9f26eab07fad303e2497fad6fb9eba4f96c=
4d1687bdf704ad9&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;unicode-ident&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;system-deps&quot;<br>
&gt; ++version =3D &quot;1.3.2&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;0f3ecc17269a19353b3558b313bba738b25d82993e30d62a1=
8406a24aba4649b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;heck&quot;,<br>
&gt; ++ &quot;pkg-config&quot;,<br>
&gt; ++ &quot;strum&quot;,<br>
&gt; ++ &quot;strum_macros&quot;,<br>
&gt; ++ &quot;thiserror&quot;,<br>
&gt; ++ &quot;toml&quot;,<br>
&gt; ++ &quot;version-compare&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;textwrap&quot;<br>
&gt; ++version =3D &quot;0.16.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;222a222a5bfe1bba4a77b45ec488a741b3cb8872e5e499451=
fd7d0129c9c7c3d&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;thiserror&quot;<br>
&gt; ++version =3D &quot;1.0.40&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153c=
aba6915336cebac&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;thiserror-impl&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;thiserror-impl&quot;<br>
&gt; ++version =3D &quot;1.0.40&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d=
286d5e86720569f&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 2.0.8&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;time&quot;<br>
&gt; ++version =3D &quot;0.3.20&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;cd0cbfecb4d19b5ea75bb31ad904eb5b9fa13f21079c3b920=
17ebdf4999a5890&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++ &quot;time-core&quot;,<br>
&gt; ++ &quot;time-macros&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;time-core&quot;<br>
&gt; ++version =3D &quot;0.1.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;2e153e1f1acaef8acc537e68b44906d2db6436e2b35ac2c6b=
42640fff91f00fd&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;time-macros&quot;<br>
&gt; ++version =3D &quot;0.2.8&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;fd80a657e71da814b8e5d60d3374fc6d35045062245d80224=
748ae522dd76f36&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;time-core&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;tinytemplate&quot;<br>
&gt; ++version =3D &quot;1.2.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8=
709b689d939b6bc&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++ &quot;serde_json&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;tinyvec&quot;<br>
&gt; ++version =3D &quot;1.6.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;87cc5ceb3875bb20c2890005a4e226a4651264a5c75edb242=
1b52861a0a0cb50&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;tinyvec_macros&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;tinyvec_macros&quot;<br>
&gt; ++version =3D &quot;0.1.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc6=
01a0161d0532f20&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;toml&quot;<br>
&gt; ++version =3D &quot;0.5.11&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;f4f7f0dd8d50a853a531c426359045b1998f04219d8879981=
0762cd4ad314234&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;toml_datetime&quot;<br>
&gt; ++version =3D &quot;0.6.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;3ab8ed2edee10b50132aed5f331333428b011c99402b5a534=
154ed15746f9622&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;toml_edit&quot;<br>
&gt; ++version =3D &quot;0.19.8&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;239410c8609e8125456927e6707163a3b1fdb40561e4b803b=
c041f466ccfdc13&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;indexmap&quot;,<br>
&gt; ++ &quot;toml_datetime&quot;,<br>
&gt; ++ &quot;winnow&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;unicode-bidi&quot;<br>
&gt; ++version =3D &quot;0.3.13&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;92888ba5573ff080736b3648696b70cafad7d250551175acb=
aa4e0385b3e1460&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;unicode-ident&quot;<br>
&gt; ++version =3D &quot;1.0.8&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e5464a87b239f13a63a501f2701565754bae92d243d4bb7eb=
12f6d57d2269bf4&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;unicode-normalization&quot;<br>
&gt; ++version =3D &quot;0.1.22&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;5c5713f0fc4b5db668a2ac63cdb7bb4469d8c9fed047b1d02=
92cc7b0ce2ba921&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;tinyvec&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;unicode-segmentation&quot;<br>
&gt; ++version =3D &quot;1.10.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1dd624098567895118886609431a7c3b8f516e41d30e0643f=
03d94592a147e36&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;url&quot;<br>
&gt; ++version =3D &quot;2.3.1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;0d68c799ae75762b8c3fe375feb6600ef5602c883c5d21eb5=
1c09f22b83c4643&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;form_urlencoded&quot;,<br>
&gt; ++ &quot;idna&quot;,<br>
&gt; ++ &quot;percent-encoding&quot;,<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;uuid&quot;<br>
&gt; ++version =3D &quot;1.3.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;1674845326ee10d37ca60470760d4288a6f80f304007d92e5=
c53bab78c9cfd79&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;version-compare&quot;<br>
&gt; ++version =3D &quot;0.0.10&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;d63556a25bae6ea31b52e640d7c41d1ab27faba4ccb600013=
837a3d0b3994ca1&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;version_check&quot;<br>
&gt; ++version =3D &quot;0.9.4&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;49874b5167b65d7193b8aba1567f5c7d93d001cafc34600ce=
e003eda787e483f&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;walkdir&quot;<br>
&gt; ++version =3D &quot;2.3.3&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;36df944cda56c7d8d8b7496af378e6b16de9284591917d307=
c9b4d313c44e698&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;same-file&quot;,<br>
&gt; ++ &quot;winapi-util&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;wasi&quot;<br>
&gt; ++version =3D &quot;0.11.0+wasi-snapshot-preview1&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a=
7eab63b7987e423&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;wasm-bindgen&quot;<br>
&gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;31f8dcbc21f30d9b8f2ea926ecb58f6b91192c17e9d33594b=
3df58b2007ca53b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;cfg-if&quot;,<br>
&gt; ++ &quot;wasm-bindgen-macro&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;wasm-bindgen-backend&quot;<br>
&gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;95ce90fd5bcc06af55a641a86428ee4229e44e07033963a22=
90a8e241607ccb9&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;bumpalo&quot;,<br>
&gt; ++ &quot;log&quot;,<br>
&gt; ++ &quot;once_cell&quot;,<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++ &quot;wasm-bindgen-shared&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;wasm-bindgen-macro&quot;<br>
&gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;4c21f77c0bedc37fd5dc21f897894a5ca01e7bb1598845594=
61862ae90c0b4c5&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;wasm-bindgen-macro-support&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;wasm-bindgen-macro-support&quot;<br>
&gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;2aff81306fcac3c7515ad4e177f521b5c9a15f2b08f4e32d8=
23066102f35a5f6&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++ &quot;wasm-bindgen-backend&quot;,<br>
&gt; ++ &quot;wasm-bindgen-shared&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;wasm-bindgen-shared&quot;<br>
&gt; ++version =3D &quot;0.2.84&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;0046fef7e28c3804e5e38bfa31ea2a0f73905319b677e57eb=
e37e49358989b5d&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;web-sys&quot;<br>
&gt; ++version =3D &quot;0.3.61&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;e33b99f4b23ba3eec1a53ac264e35a755f00e966e0065077d=
6027c0f575b0b97&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;js-sys&quot;,<br>
&gt; ++ &quot;wasm-bindgen&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;winapi&quot;<br>
&gt; ++version =3D &quot;0.3.9&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;5c839a674fcd7a98952e593242ea400abe93992746761e386=
41405d28b00f419&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;winapi-i686-pc-windows-gnu&quot;,<br>
&gt; ++ &quot;winapi-x86_64-pc-windows-gnu&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;winapi-i686-pc-windows-gnu&quot;<br>
&gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be0=
9ff6fb6ab51b7b6&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;winapi-util&quot;<br>
&gt; ++version =3D &quot;0.1.5&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f3=
3a334e3ce5de178&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;winapi&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;winapi-x86_64-pc-windows-gnu&quot;<br>
&gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79=
ec42cfc1931183f&quot;<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;winnow&quot;<br>
&gt; ++version =3D &quot;0.4.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;deac0939bd6e4f24ab5919fbf751c97a8cfc8543bb083a305=
ed5c0c10bb241d1&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;memchr&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;zvariant&quot;<br>
&gt; ++version =3D &quot;3.12.0&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;arrayvec&quot;,<br>
&gt; ++ &quot;byteorder&quot;,<br>
&gt; ++ &quot;chrono&quot;,<br>
&gt; ++ &quot;criterion&quot;,<br>
&gt; ++ &quot;enumflags2&quot;,<br>
&gt; ++ &quot;glib&quot;,<br>
&gt; ++ &quot;libc&quot;,<br>
&gt; ++ &quot;rand&quot;,<br>
&gt; ++ &quot;serde&quot;,<br>
&gt; ++ &quot;serde_bytes&quot;,<br>
&gt; ++ &quot;serde_json&quot;,<br>
&gt; ++ &quot;serde_repr&quot;,<br>
&gt; ++ &quot;static_assertions&quot;,<br>
&gt; ++ &quot;time&quot;,<br>
&gt; ++ &quot;url&quot;,<br>
&gt; ++ &quot;uuid&quot;,<br>
&gt; ++ &quot;zvariant_derive&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;zvariant_derive&quot;<br>
&gt; ++version =3D &quot;3.12.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;34c20260af4b28b3275d6676c7e2a6be0d4332e8e0aba4616=
d34007fd84e462a&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro-crate 1.3.1&quot;,<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++ &quot;zvariant_utils&quot;,<br>
&gt; ++]<br>
&gt; ++<br>
&gt; ++[[package]]<br>
&gt; ++name =3D &quot;zvariant_utils&quot;<br>
&gt; ++version =3D &quot;1.0.0&quot;<br>
&gt; ++source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cr=
ates.io-index" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/rust-lang/crates.io-index</a>&quot;<br>
&gt; ++checksum =3D &quot;53b22993dbc4d128a17a3b6c92f1c63872dd67198537ee728=
d8b5d7c40640a8b&quot;<br>
&gt; ++dependencies =3D [<br>
&gt; ++ &quot;proc-macro2&quot;,<br>
&gt; ++ &quot;quote&quot;,<br>
&gt; ++ &quot;syn 1.0.109&quot;,<br>
&gt; ++]<br>
&gt; +diff --git a/zvariant/Cargo.toml b/zvariant/Cargo.toml<br>
&gt; +index 45367729..6981862a 100644<br>
&gt; +--- a/zvariant/Cargo.toml<br>
&gt; ++++ b/zvariant/Cargo.toml<br>
&gt; +@@ -27,7 +27,7 @@ byteorder =3D &quot;1.4.3&quot;<br>
&gt; + serde =3D { version =3D &quot;1.0&quot;, features =3D [&quot;derive&=
quot;] }<br>
&gt; + arrayvec =3D { version =3D &quot;0.7.2&quot;, features =3D [&quot;se=
rde&quot;], optional =3D true }<br>
&gt; + enumflags2 =3D { version =3D &quot;0.7.5&quot;, features =3D [&quot;=
serde&quot;], optional =3D true }<br>
&gt; +-zvariant_derive =3D { version =3D &quot;=3D3.12.0&quot;, path =3D &q=
uot;../zvariant_derive&quot; }<br>
&gt; ++zvariant_derive =3D &quot;3.12.0&quot;<br>
&gt; + serde_bytes =3D { version =3D &quot;0.11&quot;, optional =3D true }<=
br>
&gt; + static_assertions =3D &quot;1.1.0&quot;<br>
&gt; + libc =3D &quot;0.2.137&quot;<br>
&gt; +2.34.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-extended/rust-example/<a href=3D"http://zvar=
iant_3.12.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">zvariant_3.=
12.0.bb</a> b/meta/recipes-extended/rust-example/<a href=3D"http://zvariant=
_3.12.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">zvariant_3.12.0=
.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ab769b3fce<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-extended/rust-example/<a href=3D"http://zvariant_3.=
12.0.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">zvariant_3.12.0.bb=
</a><br>
&gt; @@ -0,0 +1,20 @@<br>
&gt; +SUMMARY =3D &quot;Provides API for encoding/decoding of data to/from =
D-Bus wire format&quot;<br>
&gt; +DESCRIPTION =3D &quot;This crate provides API for encoding/decoding o=
f data to/from D-Bus wire format.\<br>
&gt; +This binary wire format is simple and very efficient and hence useful=
 outside of D-Bus context as well.\<br>
&gt; +A modified form of this format, GVariant is very commonly used for ef=
ficient storage of arbitrary \<br>
&gt; +data and is also supported by this crate.&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://gitlab.freedesktop.org/dbus/zbu=
s/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.freedesk=
top.org/dbus/zbus/</a>&quot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db377b220f43d747efdec4=
0d69fcaa69d&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot; \<br>
&gt; +=C2=A0 =C2=A0 git://<a href=3D"http://gitlab.freedesktop.org/dbus/zbu=
s;protocol=3Dhttps;branch=3Dmain;subpath=3Dzvariant" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">gitlab.freedesktop.org/dbus/zbus;protocol=3Dhttps=
;branch=3Dmain;subpath=3Dzvariant</a> \<br>
&gt; +=C2=A0 =C2=A0 file://0001-Tweak-zvariant-cargo-config.patch;stripleve=
l=3D2 \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +SRCREV =3D &quot;07506776fab5f58e029760bb4b288f670c7eecd6&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/zvariant&quot;<br>
&gt; +<br>
&gt; +inherit cargo cargo-update-recipe-crates<br>
&gt; +<br>
&gt; +require ${BPN}-crates.inc<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#179092): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/179092" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/1790=
92</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97840364=
/1686489" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.ope=
nembedded.org/mt/97840364/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank" rel=3D"noreferrer">alex.kanavin@gmail.com</=
a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>

--0000000000005dab1105f7bf9096--

