Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C7F6C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 18:37:33 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web08.14248.1634668652513405718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kQlbl8xV;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id f126so10845361vke.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 11:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TY8+0mM6rx+RnV1KCtHiFWpIqaHej4Y+J7yFD9rvNks=;
        b=kQlbl8xVxcgGoWBkJLoXf9mSGxk00jDHHhj7nhYgvJwS10+pQyQNDHhoNsN9nXua6r
         wXt+ml/i3vCTN9fkZkL/7DiwSoO5g77TiMIBx02v2aaRF6zIEwZdqzSFQxKCYxVcpM6L
         JfOzKNVyXC9cCiLLHb8wlTvGDQNiKsQKDcZO/vlTA+RjjIy0BLuNy98o9gwvWvGveKrn
         Z/HUnVpkZ9hLJWcqFv1vLABRlKlmm5SMbBNMYQ7db91JylpgmkmyFzgS57a2K/ydiXNe
         DTPRE1Jju/gRB3eZrZXUNflT99DEurk88QR1GhCauofI7GdxmpaeTA6yjHB05WYwasC2
         1e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TY8+0mM6rx+RnV1KCtHiFWpIqaHej4Y+J7yFD9rvNks=;
        b=NliJWvbUE94CZbSO6xOqIh4XJKLFPSl4afYjDWsCbP1QeVXOCmZxY8sq5dv+fE7RGf
         AO3ILjAS8aSPmRRlMKbydFZhXcfYG47JOpM1LOvUjleYba9FHUfO49eH9PXmcALugN7w
         RBGAH65SlLeCE5lG0Au7ahN8z2OO82AZsL6QIxNv/I98SwcQR1Eivp7SSXULTIx7LL4M
         HlL2XOCNwdljU8r4hAi8cll0o8YQxOrwjhJquPugOPvM0GtZwAzidTxK7flwTvaO0W5W
         R5q1f5UAkWmWLI9iAAdrbc7sUs2odacc7qkZFnP7Typ0ABnhRJl6FM3QhpM6c72SrHIr
         eIuw==
X-Gm-Message-State: AOAM530MzHJ4jiaIw4fM+rKd6nE+uyt4eG6N9zQzw0oktK3zqQHPVv+C
	3p1PgNekz/ONytt3L8AnIwpIrYoCwD+IsYjkb1E=
X-Google-Smtp-Source: 
 ABdhPJxRkXtrN0c0l1Yx8n70dkBkV8PrYeV3WEjJW7FVFvxOvm/WFiMg4NkRhPRQzu0oRFIf6etT72JtcC/3bL85DNk=
X-Received: by 2002:a1f:2a4c:: with SMTP id q73mr33962352vkq.8.1634668651589;
 Tue, 19 Oct 2021 11:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-2-alex@linutronix.de>
 <6c4d94b7-22e4-bf35-4fc1-bf9c680262e6@gmail.com>
 <CANNYZj8QiFX59VyR72TPZQPE2TLoy9tscTByQbFVjT75T5OqXg@mail.gmail.com>
 <CAMKF1srRnFs5Qe8+bxLEUq6h3hrR50w5-1Ru6NzTya88qeTNXg@mail.gmail.com>
 <CANNYZj_kzzBM7v96_fkivVgA4ksNBpk00hsCHPmkq4am1EpGXA@mail.gmail.com>
 <CAMKF1soyXWyzFd-FJTPopYt3Sds=4=A6=tVLz+fKrC59VgYKxg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soyXWyzFd-FJTPopYt3Sds=4=A6=tVLz+fKrC59VgYKxg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Oct 2021 20:37:19 +0200
Message-ID: 
 <CANNYZj9Q=9hXRziLC6c3_EVRViDfFcTe3-27ifOOnpz94P7_-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/65] rustfmt: remove
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004db58305ceb8f4a8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 18:37:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157199

--0000000000004db58305ceb8f4a8
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Oct 2021 at 20:31, Khem Raj <raj.khem@gmail.com> wrote:

> It would be wise to hear people who use rust and develop applications
> using rust, meta-rust is being used
> to develop field deployed products. Again I urge you to think with a
> little bit of wider scope.
>

Look, it's just an example of a recipe generated with cargo-bitbake. Where
is this
cargo-bitbake in core, so we can test that it works as it should? Until
it's available,
there's no point in keeping the recipe.

Alex



>
> >
> > If it is actually needed somewhere, we can easily bring it back, but
> until then I would take it out.
> > Especially considering it's a generated recipe (via cargo-bitbake) and
> it's not at all clear how
> > to keep it current.
> >
> > Joe who? The listed maintainer is Randy.
>
> Sorry. I did mean Randy.
>
> >
> > Alex
> >
> >>
> >>
> >> >
> >> > Alex
> >> >
> >> > On Tue 19. Oct 2021 at 18.34, Khem Raj <raj.khem@gmail.com> wrote:
> >> >>
> >> >>
> >> >>
> >> >> On 10/19/21 8:33 AM, Alexander Kanavin wrote:
> >> >> > The recipes does not have any consumers, is host-only,
> >> >> > is rather out of date, and is still present in meta-rust.
> >> >> >
> >> >> > Rust toolchain is now tested through other items, so I don't see
> >> >> > a use case for it. For a target example there's rust-hello-world.
> >> >> >
> >> >>
> >> >> its a tool. Think of strace, so there is value in keeping it in
> oe-core
> >> >> so lets not drop it.
> >> >>
> >> >> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> >> >> > ---
> >> >> >   meta/conf/distro/include/maintainers.inc      |   1 -
> >> >> >   meta/recipes-example/rustfmt/rustfmt_1.4.2.bb | 171
> ------------------
> >> >> >   2 files changed, 172 deletions(-)
> >> >> >   delete mode 100644 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> >> >> >
> >> >> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> >> >> > index baec2bef4d..d26d99a43d 100644
> >> >> > --- a/meta/conf/distro/include/maintainers.inc
> >> >> > +++ b/meta/conf/distro/include/maintainers.inc
> >> >> > @@ -662,7 +662,6 @@ RECIPE_MAINTAINER:pn-rt-tests = "Alexander
> Kanavin <alex.kanavin@gmail.com>"
> >> >> >   RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
> >> >> >   RECIPE_MAINTAINER:pn-run-postinsts = "Ross Burton <
> ross.burton@arm.com>"
> >> >> >   RECIPE_MAINTAINER:pn-rust = "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >> >> > -RECIPE_MAINTAINER:pn-rustfmt = "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >> >> >   RECIPE_MAINTAINER:pn-rust-cross-${TARGET_ARCH} = "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >> >> >
>  RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> "Randy MacLeod <Randy.MacLeod@windriver.com>"
> >> >> >   RECIPE_MAINTAINER:pn-rust-hello-world = "Randy MacLeod <
> Randy.MacLeod@windriver.com>"
> >> >> > diff --git a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> b/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> >> >> > deleted file mode 100644
> >> >> > index 2e4a47eb00..0000000000
> >> >> > --- a/meta/recipes-example/rustfmt/rustfmt_1.4.2.bb
> >> >> > +++ /dev/null
> >> >> > @@ -1,171 +0,0 @@
> >> >> > -# Auto-Generated by cargo-bitbake 0.3.13
> >> >> > -#
> >> >> > -inherit cargo
> >> >> > -
> >> >> > -# If this is git based prefer versioned ones if they exist
> >> >> > -# DEFAULT_PREFERENCE = "-1"
> >> >> > -
> >> >> > -# how to get rustfmt-nightly could be as easy as but default to a
> git checkout:
> >> >> > -# SRC_URI += "crate://crates.io/rustfmt-nightly/1.4.2"
> >> >> > -SRC_URI += "git://
> github.com/rust-lang/rustfmt.git;protocol=https;nobranch=1"
> >> >> > -SRCREV = "aeb3496f31a0dfa90fc511520d2023634e885260"
> >> >> > -S = "${WORKDIR}/git"
> >> >> > -CARGO_SRC_DIR = ""
> >> >> > -EXCLUDE_FROM_WORLD = "1"
> >> >> > -
> >> >> > -# please note if you have entries that do not begin with crate://
> >> >> > -# you must change them to how that package can be fetched
> >> >> > -SRC_URI += " \
> >> >> > -    crate://crates.io/aho-corasick/0.7.4 \
> >> >> > -    crate://crates.io/annotate-snippets/0.6.1 \
> >> >> > -    crate://crates.io/ansi_term/0.11.0 \
> >> >> > -    crate://crates.io/argon2rs/0.2.5 \
> >> >> > -    crate://crates.io/arrayvec/0.4.11 \
> >> >> > -    crate://crates.io/atty/0.2.13 \
> >> >> > -    crate://crates.io/autocfg/0.1.5 \
> >> >> > -    crate://crates.io/backtrace-sys/0.1.31 \
> >> >> > -    crate://crates.io/backtrace/0.3.33 \
> >> >> > -    crate://crates.io/bitflags/1.1.0 \
> >> >> > -    crate://crates.io/blake2-rfc/0.2.18 \
> >> >> > -    crate://crates.io/bstr/0.2.6 \
> >> >> > -    crate://crates.io/bytecount/0.5.1 \
> >> >> > -    crate://crates.io/byteorder/1.3.2 \
> >> >> > -    crate://crates.io/c2-chacha/0.2.2 \
> >> >> > -    crate://crates.io/cargo_metadata/0.8.1 \
> >> >> > -    crate://crates.io/cc/1.0.38 \
> >> >> > -    crate://crates.io/cfg-if/0.1.9 \
> >> >> > -    crate://crates.io/clap/2.33.0 \
> >> >> > -    crate://crates.io/cloudabi/0.0.3 \
> >> >> > -    crate://crates.io/constant_time_eq/0.1.3 \
> >> >> > -    crate://crates.io/crossbeam-channel/0.3.9 \
> >> >> > -    crate://crates.io/crossbeam-deque/0.2.0 \
> >> >> > -    crate://crates.io/crossbeam-epoch/0.3.1 \
> >> >> > -    crate://crates.io/crossbeam-utils/0.2.2 \
> >> >> > -    crate://crates.io/crossbeam-utils/0.6.6 \
> >> >> > -    crate://crates.io/derive-new/0.5.7 \
> >> >> > -    crate://crates.io/diff/0.1.11 \
> >> >> > -    crate://crates.io/dirs-sys/0.3.3 \
> >> >> > -    crate://crates.io/dirs/2.0.1 \
> >> >> > -    crate://crates.io/either/1.5.2 \
> >> >> > -    crate://crates.io/ena/0.13.0 \
> >> >> > -    crate://crates.io/env_logger/0.6.2 \
> >> >> > -    crate://crates.io/failure/0.1.5 \
> >> >> > -    crate://crates.io/failure_derive/0.1.5 \
> >> >> > -    crate://crates.io/fnv/1.0.6 \
> >> >> > -    crate://crates.io/fuchsia-cprng/0.1.1 \
> >> >> > -    crate://crates.io/getopts/0.2.19 \
> >> >> > -    crate://crates.io/getrandom/0.1.6 \
> >> >> > -    crate://crates.io/globset/0.4.4 \
> >> >> > -    crate://crates.io/heck/0.3.1 \
> >> >> > -    crate://crates.io/humantime/1.2.0 \
> >> >> > -    crate://crates.io/ignore/0.4.8 \
> >> >> > -    crate://crates.io/indexmap/1.0.2 \
> >> >> > -    crate://crates.io/itertools/0.8.0 \
> >> >> > -    crate://crates.io/itoa/0.4.4 \
> >> >> > -    crate://crates.io/jobserver/0.1.16 \
> >> >> > -    crate://crates.io/lazy_static/1.3.0 \
> >> >> > -    crate://crates.io/libc/0.2.60 \
> >> >> > -    crate://crates.io/lock_api/0.1.5 \
> >> >> > -    crate://crates.io/log/0.4.7 \
> >> >> > -    crate://crates.io/memchr/2.2.1 \
> >> >> > -    crate://crates.io/memoffset/0.2.1 \
> >> >> > -    crate://crates.io/nodrop/0.1.13 \
> >> >> > -    crate://crates.io/num_cpus/1.10.1 \
> >> >> > -    crate://crates.io/owning_ref/0.4.0 \
> >> >> > -    crate://crates.io/packed_simd/0.3.3 \
> >> >> > -    crate://crates.io/parking_lot/0.7.1 \
> >> >> > -    crate://crates.io/parking_lot_core/0.4.0 \
> >> >> > -    crate://crates.io/ppv-lite86/0.2.5 \
> >> >> > -    crate://crates.io/proc-macro2/0.4.30 \
> >> >> > -    crate://crates.io/quick-error/1.2.2 \
> >> >> > -    crate://crates.io/quote/0.6.13 \
> >> >> > -    crate://crates.io/rand/0.6.5 \
> >> >> > -    crate://crates.io/rand/0.7.0 \
> >> >> > -    crate://crates.io/rand_chacha/0.1.1 \
> >> >> > -    crate://crates.io/rand_chacha/0.2.1 \
> >> >> > -    crate://crates.io/rand_core/0.3.1 \
> >> >> > -    crate://crates.io/rand_core/0.4.0 \
> >> >> > -    crate://crates.io/rand_core/0.5.0 \
> >> >> > -    crate://crates.io/rand_hc/0.1.0 \
> >> >> > -    crate://crates.io/rand_hc/0.2.0 \
> >> >> > -    crate://crates.io/rand_isaac/0.1.1 \
> >> >> > -    crate://crates.io/rand_jitter/0.1.4 \
> >> >> > -    crate://crates.io/rand_os/0.1.3 \
> >> >> > -    crate://crates.io/rand_pcg/0.1.2 \
> >> >> > -    crate://crates.io/rand_xorshift/0.1.1 \
> >> >> > -    crate://crates.io/rdrand/0.4.0 \
> >> >> > -    crate://crates.io/redox_syscall/0.1.56 \
> >> >> > -    crate://crates.io/redox_users/0.3.0 \
> >> >> > -    crate://crates.io/regex-syntax/0.6.10 \
> >> >> > -    crate://crates.io/regex/1.2.0 \
> >> >> > -    crate://crates.io/rustc-ap-arena/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-graphviz/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-rustc_data_structures/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-rustc_errors/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-rustc_lexer/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-rustc_macros/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-rustc_target/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-serialize/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-syntax/542.0.0 \
> >> >> > -    crate://crates.io/rustc-ap-syntax_pos/542.0.0 \
> >> >> > -    crate://crates.io/rustc-demangle/0.1.15 \
> >> >> > -    crate://crates.io/rustc-hash/1.0.1 \
> >> >> > -    crate://crates.io/rustc-rayon-core/0.2.0 \
> >> >> > -    crate://crates.io/rustc-rayon/0.2.0 \
> >> >> > -    crate://crates.io/rustc-workspace-hack/1.0.0 \
> >> >> > -    crate://crates.io/rustc_version/0.2.3 \
> >> >> > -    crate://crates.io/ryu/1.0.0 \
> >> >> > -    crate://crates.io/same-file/1.0.5 \
> >> >> > -    crate://crates.io/scoped-tls/1.0.0 \
> >> >> > -    crate://crates.io/scoped_threadpool/0.1.9 \
> >> >> > -    crate://crates.io/scopeguard/0.3.3 \
> >> >> > -    crate://crates.io/semver-parser/0.7.0 \
> >> >> > -    crate://crates.io/semver/0.9.0 \
> >> >> > -    crate://crates.io/serde/1.0.97 \
> >> >> > -    crate://crates.io/serde_derive/1.0.97 \
> >> >> > -    crate://crates.io/serde_json/1.0.40 \
> >> >> > -    crate://crates.io/smallvec/0.6.10 \
> >> >> > -    crate://crates.io/spin/0.5.0 \
> >> >> > -    crate://crates.io/stable_deref_trait/1.1.1 \
> >> >> > -    crate://crates.io/strsim/0.8.0 \
> >> >> > -    crate://crates.io/structopt-derive/0.2.18 \
> >> >> > -    crate://crates.io/structopt/0.2.18 \
> >> >> > -    crate://crates.io/syn/0.15.42 \
> >> >> > -    crate://crates.io/synstructure/0.10.2 \
> >> >> > -    crate://crates.io/term/0.6.0 \
> >> >> > -    crate://crates.io/termcolor/1.0.5 \
> >> >> > -    crate://crates.io/textwrap/0.11.0 \
> >> >> > -    crate://crates.io/thread_local/0.3.6 \
> >> >> > -    crate://crates.io/toml/0.5.1 \
> >> >> > -    crate://crates.io/ucd-util/0.1.5 \
> >> >> > -    crate://crates.io/unicode-segmentation/1.3.0 \
> >> >> > -    crate://crates.io/unicode-width/0.1.5 \
> >> >> > -    crate://crates.io/unicode-xid/0.1.0 \
> >> >> > -    crate://crates.io/unicode_categories/0.1.1 \
> >> >> > -    crate://crates.io/utf8-ranges/1.0.3 \
> >> >> > -    crate://crates.io/vec_map/0.8.1 \
> >> >> > -    crate://crates.io/walkdir/2.2.9 \
> >> >> > -    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> >> >> > -    crate://crates.io/winapi-util/0.1.2 \
> >> >> > -    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> >> >> > -    crate://crates.io/winapi/0.3.7 \
> >> >> > -    crate://crates.io/wincolor/1.0.1 \
> >> >> > -"
> >> >> > -
> >> >> > -
> >> >> > -
> >> >> > -# FIXME: update generateme with the real MD5 of the license file
> >> >> > -LIC_FILES_CHKSUM = " \
> >> >> > -    file://LICENSE-APACHE;md5=1836efb2eb779966696f473ee8540542 \
> >> >> > -    file://LICENSE-MIT;md5=0b29d505d9225d1f0815cbdcf602b901 \
> >> >> > -"
> >> >> > -
> >> >> > -SUMMARY = "Tool to find and fix Rust formatting issues"
> >> >> > -HOMEPAGE = "https://github.com/rust-lang/rustfmt"
> >> >> > -LICENSE = "Apache-2.0 | MIT"
> >> >> > -
> >> >> > -# includes this file if it exists but does not fail
> >> >> > -# this is useful for anything you may want to override from
> >> >> > -# what cargo-bitbake generates.
> >> >> > -include rustfmt-nightly-${PV}.inc
> >> >> > -include rustfmt-nightly.inc
> >> >> >
> >> >> >
> >> >> >
> >> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >> > Links: You receive all messages sent to this group.
> >> >> > View/Reply Online (#157121):
> https://lists.openembedded.org/g/openembedded-core/message/157121
> >> >> > Mute This Topic:
> https://lists.openembedded.org/mt/86442640/1997914
> >> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> >> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> >> >> > -=-=-=-=-=-=-=-=-=-=-=-
> >> >> >
>

--0000000000004db58305ceb8f4a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 19 Oct 2021 at 20:31, Khem Raj &lt;<a href=3D"mailto:raj.khe=
m@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
It would be wise to hear people who use rust and develop applications<br>
using rust, meta-rust is being used<br>
to develop field deployed products. Again I urge you to think with a<br>
little bit of wider scope.<br></blockquote><div><br></div><div>Look, it&#39=
;s just an example of a recipe generated with cargo-bitbake. Where is this<=
/div><div>cargo-bitbake in core, so we can test that it works as it should?=
 Until it&#39;s available, <br></div><div>there&#39;s no point in keeping t=
he recipe.</div><div><br></div><div>Alex<br></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; If it is actually needed somewhere, we can easily bring it back, but u=
ntil then I would take it out.<br>
&gt; Especially considering it&#39;s a generated recipe (via cargo-bitbake)=
 and it&#39;s not at all clear how<br>
&gt; to keep it current.<br>
&gt;<br>
&gt; Joe who? The listed maintainer is Randy.<br>
<br>
Sorry. I did mean Randy.<br>
<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Alex<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue 19. Oct 2021 at 18.34, Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On 10/19/21 8:33 AM, Alexander Kanavin wrote:<br>
&gt;&gt; &gt;&gt; &gt; The recipes does not have any consumers, is host-onl=
y,<br>
&gt;&gt; &gt;&gt; &gt; is rather out of date, and is still present in meta-=
rust.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Rust toolchain is now tested through other items, so=
 I don&#39;t see<br>
&gt;&gt; &gt;&gt; &gt; a use case for it. For a target example there&#39;s =
rust-hello-world.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; its a tool. Think of strace, so there is value in keeping=
 it in oe-core<br>
&gt;&gt; &gt;&gt; so lets not drop it.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mail=
to:alex@linutronix.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0meta/conf/distro/include/maintainers.inc=
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0meta/recipes-example/rustfmt/<a href=3D"=
http://rustfmt_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">rustfmt_1.4.2=
.bb</a> | 171 ------------------<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A02 files changed, 172 deletions(-)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0delete mode 100644 meta/recipes-example/=
rustfmt/<a href=3D"http://rustfmt_1.4.2.bb" rel=3D"noreferrer" target=3D"_b=
lank">rustfmt_1.4.2.bb</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/meta/conf/distro/include/maintainers.in=
c b/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt;&gt; &gt; index baec2bef4d..d26d99a43d 100644<br>
&gt;&gt; &gt;&gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt;&gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt;&gt; &gt;&gt; &gt; @@ -662,7 +662,6 @@ RECIPE_MAINTAINER:pn-rt-tests =
=3D &quot;Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" t=
arget=3D"_blank">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-ruby =3D &quot;Ross=
 Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blank">ross.b=
urton@arm.com</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-run-postinsts =3D &=
quot;Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_blan=
k">ross.burton@arm.com</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust =3D &quot;Rand=
y MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_bla=
nk">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt; -RECIPE_MAINTAINER:pn-rustfmt =3D &quot;Randy MacLeo=
d &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Rand=
y.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust-cross-${TARGET=
_ARCH} =3D &quot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windrive=
r.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust-cross-canadian=
-${TRANSLATED_TARGET_ARCH} =3D &quot;Randy MacLeod &lt;<a href=3D"mailto:Ra=
ndy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@windriver.com</a=
>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0RECIPE_MAINTAINER:pn-rust-hello-world =
=3D &quot;Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" =
target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;&quot;<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/meta/recipes-example/rustfmt/<a href=3D=
"http://rustfmt_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">rustfmt_1.4.=
2.bb</a> b/meta/recipes-example/rustfmt/<a href=3D"http://rustfmt_1.4.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a><br>
&gt;&gt; &gt;&gt; &gt; deleted file mode 100644<br>
&gt;&gt; &gt;&gt; &gt; index 2e4a47eb00..0000000000<br>
&gt;&gt; &gt;&gt; &gt; --- a/meta/recipes-example/rustfmt/<a href=3D"http:/=
/rustfmt_1.4.2.bb" rel=3D"noreferrer" target=3D"_blank">rustfmt_1.4.2.bb</a=
><br>
&gt;&gt; &gt;&gt; &gt; +++ /dev/null<br>
&gt;&gt; &gt;&gt; &gt; @@ -1,171 +0,0 @@<br>
&gt;&gt; &gt;&gt; &gt; -# Auto-Generated by cargo-bitbake 0.3.13<br>
&gt;&gt; &gt;&gt; &gt; -#<br>
&gt;&gt; &gt;&gt; &gt; -inherit cargo<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -# If this is git based prefer versioned ones if the=
y exist<br>
&gt;&gt; &gt;&gt; &gt; -# DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -# how to get rustfmt-nightly could be as easy as bu=
t default to a git checkout:<br>
&gt;&gt; &gt;&gt; &gt; -# SRC_URI +=3D &quot;crate://<a href=3D"http://crat=
es.io/rustfmt-nightly/1.4.2" rel=3D"noreferrer" target=3D"_blank">crates.io=
/rustfmt-nightly/1.4.2</a>&quot;<br>
&gt;&gt; &gt;&gt; &gt; -SRC_URI +=3D &quot;git://<a href=3D"http://github.c=
om/rust-lang/rustfmt.git;protocol=3Dhttps;nobranch=3D1" rel=3D"noreferrer" =
target=3D"_blank">github.com/rust-lang/rustfmt.git;protocol=3Dhttps;nobranc=
h=3D1</a>&quot;<br>
&gt;&gt; &gt;&gt; &gt; -SRCREV =3D &quot;aeb3496f31a0dfa90fc511520d2023634e=
885260&quot;<br>
&gt;&gt; &gt;&gt; &gt; -S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&gt; &gt;&gt; &gt; -CARGO_SRC_DIR =3D &quot;&quot;<br>
&gt;&gt; &gt;&gt; &gt; -EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -# please note if you have entries that do not begin=
 with crate://<br>
&gt;&gt; &gt;&gt; &gt; -# you must change them to how that package can be f=
etched<br>
&gt;&gt; &gt;&gt; &gt; -SRC_URI +=3D &quot; \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/a=
ho-corasick/0.7.4" rel=3D"noreferrer" target=3D"_blank">crates.io/aho-coras=
ick/0.7.4</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/a=
nnotate-snippets/0.6.1" rel=3D"noreferrer" target=3D"_blank">crates.io/anno=
tate-snippets/0.6.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/a=
nsi_term/0.11.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ansi_term/0=
.11.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/a=
rgon2rs/0.2.5" rel=3D"noreferrer" target=3D"_blank">crates.io/argon2rs/0.2.=
5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/a=
rrayvec/0.4.11" rel=3D"noreferrer" target=3D"_blank">crates.io/arrayvec/0.4=
.11</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/a=
tty/0.2.13" rel=3D"noreferrer" target=3D"_blank">crates.io/atty/0.2.13</a> =
\<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/a=
utocfg/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/autocfg/0.1.5<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/b=
acktrace-sys/0.1.31" rel=3D"noreferrer" target=3D"_blank">crates.io/backtra=
ce-sys/0.1.31</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/b=
acktrace/0.3.33" rel=3D"noreferrer" target=3D"_blank">crates.io/backtrace/0=
.3.33</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/b=
itflags/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bitflags/1.1.=
0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/b=
lake2-rfc/0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.io/blake2-rfc=
/0.2.18</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/b=
str/0.2.6" rel=3D"noreferrer" target=3D"_blank">crates.io/bstr/0.2.6</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/b=
ytecount/0.5.1" rel=3D"noreferrer" target=3D"_blank">crates.io/bytecount/0.=
5.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/b=
yteorder/1.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/byteorder/1.=
3.2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
2-chacha/0.2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/c2-chacha/0.=
2.2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
argo_metadata/0.8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo_m=
etadata/0.8.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
c/1.0.38" rel=3D"noreferrer" target=3D"_blank">crates.io/cc/1.0.38</a> \<br=
>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
fg-if/0.1.9" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if/0.1.9</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
lap/2.33.0" rel=3D"noreferrer" target=3D"_blank">crates.io/clap/2.33.0</a> =
\<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
loudabi/0.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/cloudabi/0.0.=
3</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
onstant_time_eq/0.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/const=
ant_time_eq/0.1.3</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
rossbeam-channel/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/cros=
sbeam-channel/0.3.9</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
rossbeam-deque/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/crossb=
eam-deque/0.2.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
rossbeam-epoch/0.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/crossb=
eam-epoch/0.3.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
rossbeam-utils/0.2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/crossb=
eam-utils/0.2.2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/c=
rossbeam-utils/0.6.6" rel=3D"noreferrer" target=3D"_blank">crates.io/crossb=
eam-utils/0.6.6</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/d=
erive-new/0.5.7" rel=3D"noreferrer" target=3D"_blank">crates.io/derive-new/=
0.5.7</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/d=
iff/0.1.11" rel=3D"noreferrer" target=3D"_blank">crates.io/diff/0.1.11</a> =
\<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/d=
irs-sys/0.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/dirs-sys/0.3.=
3</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/d=
irs/2.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/dirs/2.0.1</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/e=
ither/1.5.2" rel=3D"noreferrer" target=3D"_blank">crates.io/either/1.5.2</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/e=
na/0.13.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ena/0.13.0</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/e=
nv_logger/0.6.2" rel=3D"noreferrer" target=3D"_blank">crates.io/env_logger/=
0.6.2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/f=
ailure/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/failure/0.1.5<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/f=
ailure_derive/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/failure=
_derive/0.1.5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/f=
nv/1.0.6" rel=3D"noreferrer" target=3D"_blank">crates.io/fnv/1.0.6</a> \<br=
>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/f=
uchsia-cprng/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/fuchsia-=
cprng/0.1.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/g=
etopts/0.2.19" rel=3D"noreferrer" target=3D"_blank">crates.io/getopts/0.2.1=
9</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/g=
etrandom/0.1.6" rel=3D"noreferrer" target=3D"_blank">crates.io/getrandom/0.=
1.6</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/g=
lobset/0.4.4" rel=3D"noreferrer" target=3D"_blank">crates.io/globset/0.4.4<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/h=
eck/0.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/heck/0.3.1</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/h=
umantime/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/humantime/1.=
2.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/i=
gnore/0.4.8" rel=3D"noreferrer" target=3D"_blank">crates.io/ignore/0.4.8</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/i=
ndexmap/1.0.2" rel=3D"noreferrer" target=3D"_blank">crates.io/indexmap/1.0.=
2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/i=
tertools/0.8.0" rel=3D"noreferrer" target=3D"_blank">crates.io/itertools/0.=
8.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/i=
toa/0.4.4" rel=3D"noreferrer" target=3D"_blank">crates.io/itoa/0.4.4</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/j=
observer/0.1.16" rel=3D"noreferrer" target=3D"_blank">crates.io/jobserver/0=
.1.16</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/l=
azy_static/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/lazy_stati=
c/1.3.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/l=
ibc/0.2.60" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0.2.60</a> =
\<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/l=
ock_api/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/lock_api/0.1.=
5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/l=
og/0.4.7" rel=3D"noreferrer" target=3D"_blank">crates.io/log/0.4.7</a> \<br=
>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/m=
emchr/2.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/memchr/2.2.1</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/m=
emoffset/0.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/memoffset/0.=
2.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/n=
odrop/0.1.13" rel=3D"noreferrer" target=3D"_blank">crates.io/nodrop/0.1.13<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/n=
um_cpus/1.10.1" rel=3D"noreferrer" target=3D"_blank">crates.io/num_cpus/1.1=
0.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/o=
wning_ref/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/owning_ref/=
0.4.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p=
acked_simd/0.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/packed_sim=
d/0.3.3</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p=
arking_lot/0.7.1" rel=3D"noreferrer" target=3D"_blank">crates.io/parking_lo=
t/0.7.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p=
arking_lot_core/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/parki=
ng_lot_core/0.4.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p=
pv-lite86/0.2.5" rel=3D"noreferrer" target=3D"_blank">crates.io/ppv-lite86/=
0.2.5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/p=
roc-macro2/0.4.30" rel=3D"noreferrer" target=3D"_blank">crates.io/proc-macr=
o2/0.4.30</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/q=
uick-error/1.2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/quick-erro=
r/1.2.2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/q=
uote/0.6.13" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/0.6.13</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and/0.6.5" rel=3D"noreferrer" target=3D"_blank">crates.io/rand/0.6.5</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and/0.7.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand/0.7.0</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_chacha/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_chach=
a/0.1.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_chacha/0.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_chach=
a/0.2.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_core/0.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.=
3.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_core/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.=
4.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_core/0.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_core/0.=
5.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_hc/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_hc/0.1.0<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_hc/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_hc/0.2.0<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_isaac/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_isaac/=
0.1.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_jitter/0.1.4" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_jitte=
r/0.1.4</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_os/0.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_os/0.1.3<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_pcg/0.1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_pcg/0.1.=
2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
and_xorshift/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rand_xor=
shift/0.1.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
drand/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rdrand/0.4.0</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
edox_syscall/0.1.56" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_s=
yscall/0.1.56</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
edox_users/0.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/redox_user=
s/0.3.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
egex-syntax/0.6.10" rel=3D"noreferrer" target=3D"_blank">crates.io/regex-sy=
ntax/0.6.10</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
egex/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/regex/1.2.0</a> =
\<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-arena/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc=
-ap-arena/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-graphviz/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ru=
stc-ap-graphviz/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-rustc_data_structures/542.0.0" rel=3D"noreferrer" target=3D"_blank"=
>crates.io/rustc-ap-rustc_data_structures/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-rustc_errors/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/rustc-ap-rustc_errors/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-rustc_lexer/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/rustc-ap-rustc_lexer/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-rustc_macros/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/rustc-ap-rustc_macros/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-rustc_target/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/rustc-ap-rustc_target/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-serialize/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/r=
ustc-ap-serialize/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-syntax/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rust=
c-ap-syntax/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-ap-syntax_pos/542.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
rustc-ap-syntax_pos/542.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-demangle/0.1.15" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-=
demangle/0.1.15</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-hash/1.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-hash/=
1.0.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-rayon-core/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc=
-rayon-core/0.2.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-rayon/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc-rayo=
n/0.2.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc-workspace-hack/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/r=
ustc-workspace-hack/1.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
ustc_version/0.2.3" rel=3D"noreferrer" target=3D"_blank">crates.io/rustc_ve=
rsion/0.2.3</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/r=
yu/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ryu/1.0.0</a> \<br=
>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
ame-file/1.0.5" rel=3D"noreferrer" target=3D"_blank">crates.io/same-file/1.=
0.5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
coped-tls/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/scoped-tls/=
1.0.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
coped_threadpool/0.1.9" rel=3D"noreferrer" target=3D"_blank">crates.io/scop=
ed_threadpool/0.1.9</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
copeguard/0.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/scopeguard/=
0.3.3</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
emver-parser/0.7.0" rel=3D"noreferrer" target=3D"_blank">crates.io/semver-p=
arser/0.7.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
emver/0.9.0" rel=3D"noreferrer" target=3D"_blank">crates.io/semver/0.9.0</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
erde/1.0.97" rel=3D"noreferrer" target=3D"_blank">crates.io/serde/1.0.97</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
erde_derive/1.0.97" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_de=
rive/1.0.97</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
erde_json/1.0.40" rel=3D"noreferrer" target=3D"_blank">crates.io/serde_json=
/1.0.40</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
mallvec/0.6.10" rel=3D"noreferrer" target=3D"_blank">crates.io/smallvec/0.6=
.10</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
pin/0.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/spin/0.5.0</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
table_deref_trait/1.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/sta=
ble_deref_trait/1.1.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
trsim/0.8.0" rel=3D"noreferrer" target=3D"_blank">crates.io/strsim/0.8.0</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
tructopt-derive/0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.io/stru=
ctopt-derive/0.2.18</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
tructopt/0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.io/structopt/0=
.2.18</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
yn/0.15.42" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/0.15.42</a> =
\<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/s=
ynstructure/0.10.2" rel=3D"noreferrer" target=3D"_blank">crates.io/synstruc=
ture/0.10.2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/t=
erm/0.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/term/0.6.0</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/t=
ermcolor/1.0.5" rel=3D"noreferrer" target=3D"_blank">crates.io/termcolor/1.=
0.5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/t=
extwrap/0.11.0" rel=3D"noreferrer" target=3D"_blank">crates.io/textwrap/0.1=
1.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/t=
hread_local/0.3.6" rel=3D"noreferrer" target=3D"_blank">crates.io/thread_lo=
cal/0.3.6</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/t=
oml/0.5.1" rel=3D"noreferrer" target=3D"_blank">crates.io/toml/0.5.1</a> \<=
br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/u=
cd-util/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/ucd-util/0.1.=
5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/u=
nicode-segmentation/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/u=
nicode-segmentation/1.3.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/u=
nicode-width/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-=
width/0.1.5</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/u=
nicode-xid/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/unicode-xi=
d/0.1.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/u=
nicode_categories/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/uni=
code_categories/0.1.1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/u=
tf8-ranges/1.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/utf8-range=
s/1.0.3</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/v=
ec_map/0.8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/vec_map/0.8.1<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/w=
alkdir/2.2.9" rel=3D"noreferrer" target=3D"_blank">crates.io/walkdir/2.2.9<=
/a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/w=
inapi-i686-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/winapi-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/w=
inapi-util/0.1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi-uti=
l/0.1.2</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/w=
inapi-x86_64-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/winapi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/w=
inapi/0.3.7" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi/0.3.7</a=
> \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/w=
incolor/1.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/wincolor/1.0.=
1</a> \<br>
&gt;&gt; &gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -# FIXME: update generateme with the real MD5 of the=
 license file<br>
&gt;&gt; &gt;&gt; &gt; -LIC_FILES_CHKSUM =3D &quot; \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 file://LICENSE-APACHE;md5=3D1836efb2e=
b779966696f473ee8540542 \<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 file://LICENSE-MIT;md5=3D0b29d505d922=
5d1f0815cbdcf602b901 \<br>
&gt;&gt; &gt;&gt; &gt; -&quot;<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -SUMMARY =3D &quot;Tool to find and fix Rust formatt=
ing issues&quot;<br>
&gt;&gt; &gt;&gt; &gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/ru=
st-lang/rustfmt" rel=3D"noreferrer" target=3D"_blank">https://github.com/ru=
st-lang/rustfmt</a>&quot;<br>
&gt;&gt; &gt;&gt; &gt; -LICENSE =3D &quot;Apache-2.0 | MIT&quot;<br>
&gt;&gt; &gt;&gt; &gt; -<br>
&gt;&gt; &gt;&gt; &gt; -# includes this file if it exists but does not fail=
<br>
&gt;&gt; &gt;&gt; &gt; -# this is useful for anything you may want to overr=
ide from<br>
&gt;&gt; &gt;&gt; &gt; -# what cargo-bitbake generates.<br>
&gt;&gt; &gt;&gt; &gt; -include rustfmt-nightly-${PV}.inc<br>
&gt;&gt; &gt;&gt; &gt; -include rustfmt-nightly.inc<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; &gt; Links: You receive all messages sent to this group.<=
br>
&gt;&gt; &gt;&gt; &gt; View/Reply Online (#157121): <a href=3D"https://list=
s.openembedded.org/g/openembedded-core/message/157121" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message=
/157121</a><br>
&gt;&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedd=
ed.org/mt/86442640/1997914" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/86442640/1997914</a><br>
&gt;&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bo=
wner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@list=
s.openembedded.org</a><br>
&gt;&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj=
.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;&gt; &gt;<br>
</blockquote></div></div>

--0000000000004db58305ceb8f4a8--

