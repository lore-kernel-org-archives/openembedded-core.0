Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3638BC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 13:11:38 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web09.5973.1639746697416336997
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 05:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iXU0jrwE;
 spf=pass (domain: gmail.com, ip: 209.85.166.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id x10so2817406ioj.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 05:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=thciryqARFJlDGJS0CgQFCXKw37QgpiAgIdXVgwe8A4=;
        b=iXU0jrwEagmmDK5ZnzmCXxDLBc/Aozsncz03Upievh3YrU7V262HPTbhTIMhi7S+nX
         MHXO6jiXx/45W4W5ty36uUayzWHMFHKo52SXrfHMQ3/zj+h5R2gN2U891IPbwc+1ARJN
         wuJSh8CcP7XfBYv+eg4lVQTNRxK6Rk4UPkCS8R8lFORjWWaaxUAuLQ/P25WBx+KDHFId
         D6FklgYO8roCkIrDwyw7xNp6YV2+c81pvj8AEKkPL+sV4aTY7xrEQub/sAkxByOQ1FDu
         IBi5fBGN4INknq5biKRjMzB3vx2teOJ/u8wtV19YWLM/jjK379o2JnUYVHS6FRPYqeBA
         mmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=thciryqARFJlDGJS0CgQFCXKw37QgpiAgIdXVgwe8A4=;
        b=QMLd7AP/Tjt6PYl1c1nYpilqULuhINLAnTjUQJ8obW09/EN7vX485MCn24hJ2B3ump
         vQwO4m+51MxJuktqaHkbXsrEF+V4Z/Xv9GCmLfWqGNG1A7H8ngBZh/1N/KrxDvA98Ddn
         E4geobpK3GabPusxuSMTTonAQ/B+GNE091/HaGV8WlLEUueZ0ucxMMKrl8YMd53DW5RJ
         VWgF6EOyy+E0GkiRhdTnotyT+1IJjVJpUMfmm0A+fUDfX2RUktO8mU/el2LHwpU6BxMC
         UpHRlmHd+gPtbkJNJgVb1xJgf7NHidR6T7EPy3F9/jzH67fFp7UggOhZIURrFwSh0WLZ
         ZEqQ==
X-Gm-Message-State: AOAM532T4ABhraQbKE522OZ/KwYt4N6lco+pNmjGIlyASCtIjCssTO8i
	43scqY61Dm/SQ34fA2qoejNb4fY5/5S8GsXntMibSgH0p/Q=
X-Google-Smtp-Source: 
 ABdhPJw096vH5WSNtsTOJwrotoOiPJlmHt77xrL/oAvKRPKqzQ3t0lmV0A1uWI8qsAcm/1Iv8D5HjkjblQ4PnprYxXs=
X-Received: by 2002:a05:6638:dd0:: with SMTP id
 m16mr1801326jaj.274.1639746696695;
 Fri, 17 Dec 2021 05:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20211216091940.GE5920@codepurple>
 <20211216230430.GF5920@codepurple>
In-Reply-To: <20211216230430.GF5920@codepurple>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 17 Dec 2021 13:11:24 +0000
Message-ID: 
 <CAO5Uq5SW_SN8dnhmS06hb5Z2VoksOp9Fgu9mQiCDb-HiaY8Adw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: fix arm64 link failures when building
 rust apps
To: "S. Lockwood-Childs" <sjl@vctlabs.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 13:11:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159823

We're stuck on thud (vendor related), I ended up backporting these two
commits from upstream, to address this issue:

https://github.com/zuma-array/meta-rust/commit/5631d561f16d88acf9cd6a014dd292cf20668501

But I don't think the issue appears in master because of the newer gcc.

On Thu, Dec 16, 2021 at 11:04 PM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> Patch withdrawn: turns out meta-tegra was pulling in an old toolchain
> for CUDA reasons, and that just got fixed. Probably there isn't another
> aarch64 platform still using a non-fixed toolchain, and if there happens
> to be one maybe they will run across this patch to carry it in their own
> layer.
>
> Note: apologies for not CC-ing Alexander Kanavin, but I couldn't figure
> out how to directly reply to his question from this list's web UI & I don't
> have a copy of his email in my inbox.
> https://lists.openembedded.org/g/openembedded-core/message/159775
>
> On Thu, Dec 16, 2021 at 01:19:45AM -0800, S. Lockwood-Childs wrote:
> > Typical error when trying to build a rust app (for example, librsvg)
> > for aarch64 targets looks like:
> >   undefined references to `__aarch64_ldadd8_rel'
> >
> > The upstream rust commit
> > "add target feature outline-atomics" 0f9f241aac21bc77fb9e757da18207abefdc841d
> > has caused a number of such link failure regressions on platforms with aarch64
> > toolchains that are not able to cope with -moutline-atomics flag. This includes
> > musl toolchains [1] but some glibc toolchains also are not able to handle this
> > flag [2,3]
> >
> > OE gcc-cross-aarch64 is currently one of the latter, but when it *is* able to
> > handle outline-atomics this patch should go away, to take advantage of the
> > reported performance benefit.
> >
> > [1] https://github.com/rust-lang/git2-rs/issues/706
> > [2] https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738.html
> > [3] https://bugzilla.redhat.com/show_bug.cgi?id=1830472
> >
> > Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> > ---
> >  meta/recipes-devtools/rust/rust-target.inc    |  2 +
> >  .../rust/rust-disable-outline-atomics.patch   | 50 +++++++++++++++++++
> >  2 files changed, 52 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> >
> > diff --git a/meta/recipes-devtools/rust/rust-target.inc b/meta/recipes-devtools/rust/rust-target.inc
> > index 3f637b3ba5..bac743f66d 100644
> > --- a/meta/recipes-devtools/rust/rust-target.inc
> > +++ b/meta/recipes-devtools/rust/rust-target.inc
> > @@ -2,6 +2,8 @@ require rust.inc
> >
> >  DEPENDS += "rust-llvm (=${PV})"
> >
> > +SRC_URI += "file://rust-disable-outline-atomics.patch"
> > +
> >  # Otherwise we'll depend on what we provide
> >  INHIBIT_DEFAULT_RUST_DEPS:class-native = "1"
> >  # We don't need to depend on gcc-native because yocto assumes it exists
> > diff --git a/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> > new file mode 100644
> > index 0000000000..fc99a06a6a
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rust/rust/rust-disable-outline-atomics.patch
> > @@ -0,0 +1,50 @@
> > +rust: fix arm64 link failures when building rust apps
> > +
> > +Typical error when trying to build a rust app looks like:
> > +  undefined references to `__aarch64_ldadd8_rel'
> > +
> > +The upstream rust commit
> > +"add target feature outline-atomics" 0f9f241aac21bc77fb9e757da18207abefdc841d
> > +has caused a number of such link failure regressions on platforms with aarch64
> > +toolchains that are not able to cope with -moutline-atomics flag. This includes
> > +musl toolchains [1] but some glibc toolchains also are not able to handle this
> > +flag [2,3]
> > +
> > +OE gcc-cross-aarch64 is currently one of the latter, but when it *is* able to
> > +handle outline-atomics this patch should go away, to take advantage of the
> > +reported performance benefit.
> > +
> > +[1] https://github.com/rust-lang/git2-rs/issues/706
> > +[2] https://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg661738.html
> > +[3] https://bugzilla.redhat.com/show_bug.cgi?id=1830472
> > +
> > +Upstream-Status: Inappropriate [other]
> > +
> > +Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> > +
> > +diff --git a/compiler/rustc_codegen_llvm/src/llvm_util.rs b/compiler/rustc_codegen_llvm/src/llvm_util.rs
> > +index c2136f161..ca221eb4a 100644
> > +--- a/compiler/rustc_codegen_llvm/src/llvm_util.rs
> > ++++ b/compiler/rustc_codegen_llvm/src/llvm_util.rs
> > +@@ -416,13 +416,14 @@ pub fn llvm_global_features(sess: &Session) -> Vec<String> {
> > +     // -Ctarget-features
> > +     features.extend(sess.opts.cg.target_feature.split(',').flat_map(&filter));
> > +
> > +-    // FIXME: Move outline-atomics to target definition when earliest supported LLVM is 12.
> > +-    if get_version() >= (12, 0, 0)
> > +-        && sess.target.llvm_target.contains("aarch64-unknown-linux")
> > +-        && sess.target.llvm_target != "aarch64-unknown-linux-musl"
> > +-    {
> > +-        features.push("+outline-atomics".to_string());
> > +-    }
> > ++//    // FIXME: Move outline-atomics to target definition when earliest supported LLVM is 12.
> > ++//    if get_version() >= (12, 0, 0)
> > ++//        && sess.target.llvm_target.contains("aarch64-unknown-linux")
> > ++//        && sess.target.llvm_target != "aarch64-unknown-linux-musl"
> > ++//    {
> > ++//        features.push("+outline-atomics".to_string());
> > ++//    }
> > ++
> > +
> > +     features
> > + }
> > --
> > 2.20.1
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159810): https://lists.openembedded.org/g/openembedded-core/message/159810
> Mute This Topic: https://lists.openembedded.org/mt/87763768/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
Alex Kiernan

