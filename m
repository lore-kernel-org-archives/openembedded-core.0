Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B59D0C3F6B0
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:54:08 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.22487.1661424844687985336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:54:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EZFQkccN;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id s6so16468475lfo.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=jGnhhKu+wN5jsZ6LQxeiyrNCVrV/rS8y6JIj6x6Ufrk=;
        b=EZFQkccNYOKEHyLp8MXx6wPNJsIkRXegz8a1mk208sNDt1D0Sq7X5iBUirnDbQh4dY
         1SNqY7BJhZEI/Wxj6LH/wevZBdtqGyAKSh99d6krOQbic8xQvm4+i4E2P40srNrEks+P
         7MdwCqUKTL6etO6C62Iuq4JfwTujN1gUtfAGQBSrhCVJRWYiz+BlJsv447unhhoLr7gJ
         SWOAIweRpNkX2TSIOm4on7ztThaPLWumHtffOE+Hkj7/J4LUE6zpRFFDx5adpCzzQeXT
         d8dCVBkNwn/lIprAnTCAAI3PMUdqgFm3tQtCD2jYl+0LqHNLOwIH9hR3y/J94kLwiT2m
         cMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=jGnhhKu+wN5jsZ6LQxeiyrNCVrV/rS8y6JIj6x6Ufrk=;
        b=BkNkwiQjMYxIasYdGDhhFPsFqowg/rBvY5xDYN8yAct4vEAilGxAnbCKsi6XCbJwZf
         AZvp14Ybi6mBzKjVrI4VZYqpHDGDlHMbZ0Sy9ODHE+tsF2R7+Ql2dhEOwxvHgafT9KDO
         NwrKQI4LqG4TkuriM+w72yQNcGRlwUeZvai3LbuYAb5l3ISk1k4UORoT2nc4Q420LY8w
         AxGMI68StTGF77C3SfzYfeZZ4a8fc4CW0DOFgDgCLxpLYDTTobrhr4WkZvwEf9yhlLCE
         mNmGz78u3YbbTiy/63DiMM2UIAxx3U0pMB/tj2YsGUfhsbhoSa6aaDFoXcm7imE21dyF
         1XKQ==
X-Gm-Message-State: ACgBeo0mjswT+3/zyZydgTDvYX7AX8ZvDe+9Psz0vuIFnLum8kY4pghY
	GJOlQ6UYYn43CZb1ElN/lhzQ74xV6yHVRfVDuAo=
X-Google-Smtp-Source: 
 AA6agR5R0XaZ+Roe/bfnZczK8VitpRFR9ZxZsYzOo7BTDtrS+CjpoNj7TYG/fHVQBV8V+nub7KuvXrjXbTATXGUFUG4=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr928897lfa.380.1661424842848; Thu, 25
 Aug 2022 03:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_7Eroqgrf0bJr9ubDWEogOekWm3gYMUxUEO6ERrzBS4g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 Aug 2022 12:53:51 +0200
Message-ID: 
 <CANNYZj8NSK=Mko4hN24nTWaJ_45wahT6XJByQxCOqq2OgwNvMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] rust: Fix crossbeam-utils for arches
 without atomics
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:54:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169848

What would be much preferred is an explicit switch to disable atomics
on the platforms where we know they don't work.

Alex

On Thu, 25 Aug 2022 at 12:52, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
>
> This will complicate version updates unfortunately, as updating
> .cargo-checksum.json is a pain :(
> Can we try to arrive at something upstreamable?
>
> Alex
>
> On Thu, 25 Aug 2022 at 12:49, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > crossbeam-utils tries to use the triplet to look up whether the target
> > supports various forms of atomics. We use TARGET_VENDOR and not "-unkno=
wn"
> > in the target case which means this fails and breaks platforms like mip=
s
> > and powerpc 32 bit. Add a patch to handle TARGET_VENDOR in this case.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-devtools/rust/rust-source.inc    |  1 +
> >  .../rust/rust/crossbeam_atomic.patch          | 33 +++++++++++++++++++
> >  meta/recipes-devtools/rust/rust_1.63.0.bb     |  3 ++
> >  3 files changed, 37 insertions(+)
> >  create mode 100644 meta/recipes-devtools/rust/rust/crossbeam_atomic.pa=
tch
> >
> > diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> > index d8be2701367..ce6c983fc0b 100644
> > --- a/meta/recipes-devtools/rust/rust-source.inc
> > +++ b/meta/recipes-devtools/rust/rust-source.inc
> > @@ -3,6 +3,7 @@ SRC_URI[rust.sha256sum] =3D "8f44af6dc44cc4146634a4dd5e=
4cc5470b3052a2337019b870c0e
> >
> >  SRC_URI:append:class-target:pn-rust =3D " \
> >      file://hardcodepaths.patch \
> > +    file://crossbeam_atomic.patch \
> >      file://0001-Add-ENOTSUP-constant-for-riscv32-musl.patch"
> >  SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcode=
paths.patch"
> >
> > diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/m=
eta/recipes-devtools/rust/rust/crossbeam_atomic.patch
> > new file mode 100644
> > index 00000000000..64c73810a89
> > --- /dev/null
> > +++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
> > @@ -0,0 +1,33 @@
> > +Upstream-Status: Inappropriate [OE Specific tweak]
> > +
> > +Index: rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- rustc-1.63.0-src.orig/vendor/crossbeam-utils/build.rs
> > ++++ rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
> > +@@ -29,7 +29,7 @@ use std::env;
> > + include!("no_atomic.rs");
> > +
> > + fn main() {
> > +-    let target =3D match env::var("TARGET") {
> > ++    let mut target =3D match env::var("TARGET") {
> > +         Ok(target) =3D> target,
> > +         Err(e) =3D> {
> > +             println!(
> > +@@ -40,6 +40,8 @@ fn main() {
> > +             return;
> > +         }
> > +     };
> > ++    let vendor =3D env::var("TARGET_VENDOR").unwrap();
> > ++    target =3D target.replace(&vendor, "-unknown");
> > +
> > +     // Note that this is `no_*`, not `has_*`. This allows treating
> > +     // `cfg(target_has_atomic =3D "ptr")` as true when the build scri=
pt doesn't
> > +Index: rustc-1.63.0-src/vendor/crossbeam-utils/.cargo-checksum.json
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- rustc-1.63.0-src.orig/vendor/crossbeam-utils/.cargo-checksum.json
> > ++++ rustc-1.63.0-src/vendor/crossbeam-utils/.cargo-checksum.json
> > +@@ -1 +1 @@
> > +-{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5=
b42d7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d5678678971=
642814d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731=
449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b4028=
1ee9f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a=
63c84b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c9=
27eb3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":=
"7e74dc72343ff57e83d0a84a9fbdd9ff1645894165909999b4c3d2fba94bc96c","no_atom=
ic.rs":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","=
src/atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65=
991a34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5=
e1a2a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415=
e8d7be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27=
182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic=
/seq_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263=
b09080088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a=
2d7eb0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247=
e1f1c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865=
bf8efab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4=
b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f99=
7f5b41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sha=
rded_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c=
120f","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7c=
bcfa1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8=
c704f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca88963734683=
08031220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfa=
ff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker=
.rs":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","te=
sts/sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ce=
d815f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20=
ab62cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d4=
18f8b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54=
062ab0f68a88af2fb6a030e87e30bf721fcb38"}
> > +\ No newline at end of file
> > ++{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5=
b42d7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d5678678971=
642814d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731=
449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b4028=
1ee9f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a=
63c84b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c9=
27eb3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":=
"d983d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atom=
ic.rs":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","=
src/atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65=
991a34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5=
e1a2a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415=
e8d7be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27=
182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic=
/seq_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263=
b09080088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a=
2d7eb0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247=
e1f1c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865=
bf8efab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4=
b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f99=
7f5b41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sha=
rded_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c=
120f","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7c=
bcfa1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8=
c704f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca88963734683=
08031220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfa=
ff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker=
.rs":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","te=
sts/sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ce=
d815f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20=
ab62cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d4=
18f8b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54=
062ab0f68a88af2fb6a030e87e30bf721fcb38"}
> > +\ No newline at end of file
> > diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-d=
evtools/rust/rust_1.63.0.bb
> > index 050f398794f..db797146b09 100644
> > --- a/meta/recipes-devtools/rust/rust_1.63.0.bb
> > +++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
> > @@ -7,6 +7,9 @@ FILES:${PN} +=3D "${libdir}/rustlib"
> >  FILES:${PN} +=3D "${libdir}/*.so"
> >  FILES:${PN}-dev =3D ""
> >
> > +# Used by crossbeam_atomic.patch
> > +export TARGET_VENDOR
> > +
> >  do_compile () {
> >      rust_runx build --stage 2
> >  }
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#169844): https://lists.openembedded.org/g/openembed=
ded-core/message/169844
> > Mute This Topic: https://lists.openembedded.org/mt/93245408/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

