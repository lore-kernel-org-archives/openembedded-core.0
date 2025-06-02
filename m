Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C13C5AD49
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 15:19:47 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.52455.1748877582363269574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 08:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kHsPcOj3;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-adb47e0644dso392997066b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748877581; x=1749482381; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/0N/lRMOB1GMDsLj4mDRs5KYItkRz1GgkFJbgLIgH8Q=;
        b=kHsPcOj3Ih9Q6UedEYaM02IXoT/sGtt+8nlbKo3/+apyYZsjT4lJWyFuvE7Oro2WAw
         WL9mT+kbROkRrDflS7nMMXGS69im90J2vlbDoKAidabw7fP/RlIzE3w8uQX8bcLX8b0N
         Q+gVYBg8vbgFt3lzVORd/7hwDBuNwRo+e+cxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877581; x=1749482381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0N/lRMOB1GMDsLj4mDRs5KYItkRz1GgkFJbgLIgH8Q=;
        b=BttGh8tFnc+4Dl23OuHq4t8apXawEH0PYSFSAU4CfkpgEfoMpA+l6spRoxQ/0M02K/
         pMz5f4brIW16xyhKYp1HaOjwDekivY9bLud78JT6oYBSlH87L1WSBm3r2MCVL+A6JZf8
         1B+AG5WP2pYm4vyfDZKoQZIYZ7ZZQbrH/aIVSu9JULnxVH8+dw8Q5Da+YYU6w6OKa322
         t4dqijfJp/A9mV6wUHa+hcEDvd+kbsxZIS40zmoDznU5ueRZhCO4yOrG6il9qsQL6k+/
         ktyFkum5PDQNg4h4Wpt3uozvdKUBdB0prOffjQ7gqpgfTa6hdrSM26LVeewgg7vId8gH
         Xk9w==
X-Gm-Message-State: AOJu0Yyacx80SYhuQ07xsKBk57q/iEWaZDuL/b5h7WnXrfExtuWMVIww
	HU0N3IjeH38iP+3QxR+DS8cEJC2u+wPJUhTULIcjmPwb49Q/Saoyggxb3veaGTFJQ9/ixhgMNzF
	znxMi3G+ZlbA7e7RkkjITL6sfFqqhP/NtaS58wlRFgA==
X-Gm-Gg: ASbGnct1mDTHL5lHvRxMDUGnkZ3iTMI4b5rkChlcrqwh5Af6IT2zC9NtBOxBSY/E+K1
	EB6vwZ/jVDcm9okKSI0+WYLDKoI2lKdhMmtbkHr9uZyi+uWfYtPFT41CGGFMPBx2OmQWTgNVesT
	JgxliB3OXSNi/33SWb2YHbqVL+lqY5iM2RUR9ee130aiw=
X-Google-Smtp-Source: AGHT+IE0+cFsIQ+CjRflEzDnKYkMsbNtscT+eQ6NBcWlXCsr9fZVl4Xlki+Nvutj3xzkjXva17Ny1EplIGsR9495ZpI=
X-Received: by 2002:a17:907:8693:b0:ad5:2cc5:4496 with SMTP id
 a640c23a62f3a-ad8b070b9cemr1687001866b.0.1748877579779; Mon, 02 Jun 2025
 08:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1748816484.git.tim.orling@konsulko.com> <09d7e38bfe20f3de0e2489d52305c81be2975d4b.1748816484.git.tim.orling@konsulko.com>
 <CANNYZj9tPyLENmU5wsH44CdXE1bC1bcXnNiG1KO4=S=S5edCrA@mail.gmail.com>
In-Reply-To: <CANNYZj9tPyLENmU5wsH44CdXE1bC1bcXnNiG1KO4=S=S5edCrA@mail.gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Mon, 2 Jun 2025 08:19:28 -0700
X-Gm-Features: AX0GCFuEpYlFNnG42cRflLQ3paU5G2JTI5P3-a2MJ5MVe7jH9-rFC07uiwbYgEs
Message-ID: <CAOyo-87eG2PEJL2ptfUztvwcJ3j-iwoo+EdbenDyb3i=rmitqA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/8] python3-maturin: upgrade 1.8.3 -> 1.8.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e61cfa0636984a37"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 15:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217721

--000000000000e61cfa0636984a37
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 1:08=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com>
wrote:

> This duplicates the list of crates in .inc with another list in .bb
> which doesn't seem right?
>
> Thank you for the catch. Sunday brain missed that.

I will send a v2.

Alex
>
> On Mon, 2 Jun 2025 at 00:26, Tim Orling via lists.openembedded.org
> <tim.orling=3Dkonsulko.com@lists.openembedded.org> wrote:
> >
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > Comparing changes since 1.8.3:
> > https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6
> >
> > Changelog:
> >
> > 1.8.6
> > * Print a message when overriding platform tag from _PYTHON_HOST_PLATFO=
RM
> >   in #2594
> > * Use the current python interpreter's version when the abi3 feature is
> set
> >   with no explicit version in #2597
> >
> > 1.8.5
> > * Fix release CI build
> >
> > 1.8.4
> > * Install a Rust toolchain into a temporary directory when building
> maturin
> >   itself or a package and a Rust toolchain is missing. Set
> >   MATURIN_NO_INSTALL_RUST to disable this behavior. #2421
> > * Fix broken maturin develop with latest uv in #2584
> > * Add PYO3_PYTHON env var support in #2534
> > * Sort RECORD file in wheel archives to make them deterministic in #255=
0
> > * Publish wheel for loongarch64 in #2548
> > * Add --compression-level option to build command in #2572
> >
> > Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> > ---
> > oe-selftest for maturin passes
> >
> >  .../python/python3-maturin-crates.inc         |  20 +-
> >  ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----
> >  .../python/python3-maturin_1.8.3.bb           |  43 --
> >  .../python/python3-maturin_1.8.6.bb           | 405 ++++++++++++++++++
> >  4 files changed, 415 insertions(+), 163 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes=
-on-riscv32gc-unknown-linux-g.patch
> >  delete mode 100644 meta/recipes-devtools/python/
> python3-maturin_1.8.3.bb
> >  create mode 100644 meta/recipes-devtools/python/
> python3-maturin_1.8.6.bb
> >
> > diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc
> b/meta/recipes-devtools/python/python3-maturin-crates.inc
> > index 2f196f56570..5c939a09a8e 100644
> > --- a/meta/recipes-devtools/python/python3-maturin-crates.inc
> > +++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
> > @@ -34,7 +34,7 @@ SRC_URI +=3D " \
> >      crate://crates.io/cargo-options/0.7.4 \
> >      crate://crates.io/cargo-platform/0.1.8 \
> >      crate://crates.io/cargo-xwin/0.18.4 \
> > -    crate://crates.io/cargo-zigbuild/0.19.7 \
> > +    crate://crates.io/cargo-zigbuild/0.20.0 \
> >      crate://crates.io/cargo_metadata/0.19.0 \
> >      crate://crates.io/cbindgen/0.28.0 \
> >      crate://crates.io/cc/1.2.16 \
> > @@ -60,7 +60,7 @@ SRC_URI +=3D " \
> >      crate://crates.io/crc/3.2.1 \
> >      crate://crates.io/crc-catalog/2.4.0 \
> >      crate://crates.io/crc32fast/1.4.2 \
> > -    crate://crates.io/crossbeam-channel/0.5.13 \
> > +    crate://crates.io/crossbeam-channel/0.5.15 \
> >      crate://crates.io/crossbeam-deque/0.8.5 \
> >      crate://crates.io/crossbeam-epoch/0.9.18 \
> >      crate://crates.io/crossbeam-utils/0.8.20 \
> > @@ -169,10 +169,10 @@ SRC_URI +=3D " \
> >      crate://crates.io/num-conv/0.1.0 \
> >      crate://crates.io/number_prefix/0.4.0 \
> >      crate://crates.io/once_cell/1.20.2 \
> > -    crate://crates.io/openssl/0.10.70 \
> > +    crate://crates.io/openssl/0.10.72 \
> >      crate://crates.io/openssl-macros/0.1.1 \
> >      crate://crates.io/openssl-probe/0.1.5 \
> > -    crate://crates.io/openssl-sys/0.9.105 \
> > +    crate://crates.io/openssl-sys/0.9.107 \
> >      crate://crates.io/option-ext/0.2.0 \
> >      crate://crates.io/os_pipe/1.2.0 \
> >      crate://crates.io/overload/0.1.1 \
> > @@ -362,7 +362,7 @@ SRC_URI +=3D " \
> >      crate://crates.io/zeroize/1.8.1 \
> >      crate://crates.io/zerovec/0.10.4 \
> >      crate://crates.io/zerovec-derive/0.10.3 \
> > -    crate://crates.io/zip/2.2.3 \
> > +    crate://crates.io/zip/2.3.0 \
> >      crate://crates.io/zopfli/0.8.1 \
> >  "
> >
> > @@ -398,7 +398,7 @@ SRC_URI[cargo-config2-0.1.26.sha256sum] =3D
> "d83ce0be8bd1479e5de6202def660e6c7e27e
> >  SRC_URI[cargo-options-0.7.4.sha256sum] =3D
> "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
> >  SRC_URI[cargo-platform-0.1.8.sha256sum] =3D
> "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
> >  SRC_URI[cargo-xwin-0.18.4.sha256sum] =3D
> "60f1954e4ffa0f4c47b3df5e6e9508706d8dcaa56152cd672dcee02930ba0326"
> > -SRC_URI[cargo-zigbuild-0.19.7.sha256sum] =3D
> "04cc649328f39bbf1ef92ef753406e1785ff1074941c398e5214b6c74d318a9e"
> > +SRC_URI[cargo-zigbuild-0.20.0.sha256sum] =3D
> "3f6e9e856390d5b0a859acaeda16528f8a61c964bdb894c3216c254908f1c2ea"
> >  SRC_URI[cargo_metadata-0.19.0.sha256sum] =3D
> "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
> >  SRC_URI[cbindgen-0.28.0.sha256sum] =3D
> "eadd868a2ce9ca38de7eeafdcec9c7065ef89b42b32f0839278d55f35c54d1ff"
> >  SRC_URI[cc-1.2.16.sha256sum] =3D
> "be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c"
> > @@ -424,7 +424,7 @@ SRC_URI[cpufeatures-0.2.12.sha256sum] =3D
> "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c
> >  SRC_URI[crc-3.2.1.sha256sum] =3D
> "69e6e4d7b33a94f0991c26729976b10ebde1d34c3ee82408fb536164fa10d636"
> >  SRC_URI[crc-catalog-2.4.0.sha256sum] =3D
> "19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5"
> >  SRC_URI[crc32fast-1.4.2.sha256sum] =3D
> "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
> > -SRC_URI[crossbeam-channel-0.5.13.sha256sum] =3D
> "33480d6946193aa8033910124896ca395333cae7e2d1113d1fef6c3272217df2"
> > +SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D
> "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
> >  SRC_URI[crossbeam-deque-0.8.5.sha256sum] =3D
> "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
> >  SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D
> "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
> >  SRC_URI[crossbeam-utils-0.8.20.sha256sum] =3D
> "22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80"
> > @@ -533,10 +533,10 @@ SRC_URI[nu-ansi-term-0.46.0.sha256sum] =3D
> "77a8165726e8236064dbb45459242600304b42
> >  SRC_URI[num-conv-0.1.0.sha256sum] =3D
> "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
> >  SRC_URI[number_prefix-0.4.0.sha256sum] =3D
> "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
> >  SRC_URI[once_cell-1.20.2.sha256sum] =3D
> "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
> > -SRC_URI[openssl-0.10.70.sha256sum] =3D
> "61cfb4e166a8bb8c9b55c500bc2308550148ece889be90f609377e58140f42c6"
> > +SRC_URI[openssl-0.10.72.sha256sum] =3D
> "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
> >  SRC_URI[openssl-macros-0.1.1.sha256sum] =3D
> "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
> >  SRC_URI[openssl-probe-0.1.5.sha256sum] =3D
> "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
> > -SRC_URI[openssl-sys-0.9.105.sha256sum] =3D
> "8b22d5b84be05a8d6947c7cb71f7c849aa0f112acd4bf51c2a7c1c988ac0a9dc"
> > +SRC_URI[openssl-sys-0.9.107.sha256sum] =3D
> "8288979acd84749c744a9014b4382d42b8f7b2592847b5afb2ed29e5d16ede07"
> >  SRC_URI[option-ext-0.2.0.sha256sum] =3D
> "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
> >  SRC_URI[os_pipe-1.2.0.sha256sum] =3D
> "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
> >  SRC_URI[overload-0.1.1.sha256sum] =3D
> "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
> > @@ -726,5 +726,5 @@ SRC_URI[zerofrom-derive-0.1.5.sha256sum] =3D
> "595eed982f7d355beb85837f651fa22e90b3
> >  SRC_URI[zeroize-1.8.1.sha256sum] =3D
> "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
> >  SRC_URI[zerovec-0.10.4.sha256sum] =3D
> "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
> >  SRC_URI[zerovec-derive-0.10.3.sha256sum] =3D
> "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
> > -SRC_URI[zip-2.2.3.sha256sum] =3D
> "b280484c454e74e5fff658bbf7df8fdbe7a07c6b2de4a53def232c15ef138f3a"
> > +SRC_URI[zip-2.3.0.sha256sum] =3D
> "84e9a772a54b54236b9b744aaaf8d7be01b4d6e99725523cb82cb32d1c81b1d7"
> >  SRC_URI[zopfli-0.8.1.sha256sum] =3D
> "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
> > diff --git
> a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-cod=
es-on-riscv32gc-unknown-linux-g.patch
> b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-cod=
es-on-riscv32gc-unknown-linux-g.patch
> > deleted file mode 100644
> > index aceefa7967e..00000000000
> > ---
> a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-cod=
es-on-riscv32gc-unknown-linux-g.patch
> > +++ /dev/null
> > @@ -1,110 +0,0 @@
> > -From 4b439b0953573e0383da7e092b1f516ba21f3398 Mon Sep 17 00:00:00 2001
> > -From: Dan Gohman <dev@sunfishcode.online>
> > -Date: Sun, 6 Apr 2025 05:22:49 -0700
> > -Subject: [PATCH] Define Linux ioctl codes on more architectures.
> > -
> > -Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` using
> > -`_IOR` and `_IOW` so that they're automatically supported on all
> > -architectures, including riscv32gc-unknown-linux-gnu.
> > -
> > -Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4382=
/
> ]
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ----
> > - src/unix/linux_like/linux/arch/generic/mod.rs | 75 ++++--------------=
-
> > - 1 file changed, 15 insertions(+), 60 deletions(-)
> > -
> > ---- a/src/unix/linux_like/linux/arch/generic/mod.rs
> > -+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
> > -@@ -1,5 +1,5 @@
> > - use crate::prelude::*;
> > --use crate::Ioctl;
> > -+use crate::{Ioctl, _IOR, _IOW};
> > -
> > - s! {
> > -     pub struct termios2 {
> > -@@ -116,21 +116,8 @@ cfg_if! {
> > - // pub const SO_PREFER_BUSY_POLL: c_int =3D 69;
> > - // pub const SO_BUSY_POLL_BUDGET: c_int =3D 70;
> > -
> > --cfg_if! {
> > --    if #[cfg(any(
> > --        target_arch =3D "x86",
> > --        target_arch =3D "x86_64",
> > --        target_arch =3D "arm",
> > --        target_arch =3D "aarch64",
> > --        target_arch =3D "riscv64",
> > --        target_arch =3D "s390x",
> > --        target_arch =3D "csky",
> > --        target_arch =3D "loongarch64"
> > --    ))] {
> > --        pub const FICLONE: c_ulong =3D 0x40049409;
> > --        pub const FICLONERANGE: c_ulong =3D 0x4020940D;
> > --    }
> > --}
> > -+pub const FICLONE: Ioctl =3D _IOW::<c_int>(0x94, 9) as Ioctl;
> > -+pub const FICLONERANGE: Ioctl =3D _IOW::<crate::file_clone_range>(0x9=
4,
> 13) as Ioctl;
> > -
> > - // Defined in unix/linux_like/mod.rs
> > - // pub const SCM_TIMESTAMP: c_int =3D SO_TIMESTAMP;
> > -@@ -248,49 +235,18 @@ pub const TUNGETVNETBE: Ioctl =3D 0x800454
> > - pub const TUNSETSTEERINGEBPF: Ioctl =3D 0x800454e0;
> > - pub const TUNSETFILTEREBPF: Ioctl =3D 0x800454e1;
> > -
> > --cfg_if! {
> > --    // Those type are constructed using the _IOC macro
> > --    // DD-SS_SSSS_SSSS_SSSS-TTTT_TTTT-NNNN_NNNN
> > --    // where D stands for direction (either None (00), Read (01) or
> Write (11))
> > --    // where S stands for size (int, long, struct...)
> > --    // where T stands for type ('f','v','X'...)
> > --    // where N stands for NR (NumbeR)
> > --    if #[cfg(any(
> > --        target_arch =3D "x86",
> > --        target_arch =3D "arm",
> > --        target_arch =3D "csky"
> > --    ))] {
> > --        pub const FS_IOC_GETFLAGS: Ioctl =3D 0x80046601;
> > --        pub const FS_IOC_SETFLAGS: Ioctl =3D 0x40046602;
> > --        pub const FS_IOC_GETVERSION: Ioctl =3D 0x80047601;
> > --        pub const FS_IOC_SETVERSION: Ioctl =3D 0x40047602;
> > --        pub const FS_IOC32_GETFLAGS: Ioctl =3D 0x80046601;
> > --        pub const FS_IOC32_SETFLAGS: Ioctl =3D 0x40046602;
> > --        pub const FS_IOC32_GETVERSION: Ioctl =3D 0x80047601;
> > --        pub const FS_IOC32_SETVERSION: Ioctl =3D 0x40047602;
> > --        pub const TUNATTACHFILTER: Ioctl =3D 0x400854d5;
> > --        pub const TUNDETACHFILTER: Ioctl =3D 0x400854d6;
> > --        pub const TUNGETFILTER: Ioctl =3D 0x800854db;
> > --    } else if #[cfg(any(
> > --        target_arch =3D "x86_64",
> > --        target_arch =3D "riscv64",
> > --        target_arch =3D "aarch64",
> > --        target_arch =3D "s390x",
> > --        target_arch =3D "loongarch64"
> > --    ))] {
> > --        pub const FS_IOC_GETFLAGS: Ioctl =3D 0x80086601;
> > --        pub const FS_IOC_SETFLAGS: Ioctl =3D 0x40086602;
> > --        pub const FS_IOC_GETVERSION: Ioctl =3D 0x80087601;
> > --        pub const FS_IOC_SETVERSION: Ioctl =3D 0x40087602;
> > --        pub const FS_IOC32_GETFLAGS: Ioctl =3D 0x80046601;
> > --        pub const FS_IOC32_SETFLAGS: Ioctl =3D 0x40046602;
> > --        pub const FS_IOC32_GETVERSION: Ioctl =3D 0x80047601;
> > --        pub const FS_IOC32_SETVERSION: Ioctl =3D 0x40047602;
> > --        pub const TUNATTACHFILTER: Ioctl =3D 0x401054d5;
> > --        pub const TUNDETACHFILTER: Ioctl =3D 0x401054d6;
> > --        pub const TUNGETFILTER: Ioctl =3D 0x801054db;
> > --    }
> > --}
> > -+pub const FS_IOC_GETFLAGS: Ioctl =3D _IOR::<c_long>('f' as u32, 1) as
> Ioctl;
> > -+pub const FS_IOC_SETFLAGS: Ioctl =3D _IOW::<c_long>('f' as u32, 2) as
> Ioctl;
> > -+pub const FS_IOC_GETVERSION: Ioctl =3D _IOR::<c_long>('v' as u32, 1) =
as
> Ioctl;
> > -+pub const FS_IOC_SETVERSION: Ioctl =3D _IOW::<c_long>('v' as u32, 2) =
as
> Ioctl;
> > -+pub const FS_IOC32_GETFLAGS: Ioctl =3D _IOR::<c_int>('f' as u32, 1) a=
s
> Ioctl;
> > -+pub const FS_IOC32_SETFLAGS: Ioctl =3D _IOW::<c_int>('f' as u32, 2) a=
s
> Ioctl;
> > -+pub const FS_IOC32_GETVERSION: Ioctl =3D _IOR::<c_int>('v' as u32, 1)=
 as
> Ioctl;
> > -+pub const FS_IOC32_SETVERSION: Ioctl =3D _IOW::<c_int>('v' as u32, 2)=
 as
> Ioctl;
> > -+
> > -+pub const TUNATTACHFILTER: Ioctl =3D _IOW::<crate::sock_fprog>('T' as
> u32, 213) as Ioctl;
> > -+pub const TUNDETACHFILTER: Ioctl =3D _IOW::<crate::sock_fprog>('T' as
> u32, 214) as Ioctl;
> > -+pub const TUNGETFILTER: Ioctl =3D _IOR::<crate::sock_fprog>('T' as u3=
2,
> 219) as Ioctl;
> > -
> > - cfg_if! {
> > -     if #[cfg(any(target_arch =3D "arm", target_arch =3D "s390x"))] {
> > diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > deleted file mode 100644
> > index 08975e177f0..00000000000
> > --- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
> > +++ /dev/null
> > @@ -1,43 +0,0 @@
> > -SUMMARY =3D "Build and publish crates with pyo3, rust-cpython, cffi
> bindings and rust binaries as python packages"
> > -HOMEPAGE =3D "https://github.com/pyo3/maturin"
> > -SECTION =3D "devel/python"
> > -LICENSE =3D "MIT | Apache-2.0"
> > -LIC_FILES_CHKSUM =3D
> "file://license-apache;md5=3D1836efb2eb779966696f473ee8540542 \
> > -
> file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5c0797"
> > -
> > -SRC_URI +=3D
> "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;p=
atchdir=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
> > -SRC_URI[sha256sum] =3D
> "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc0152e1e12"
> > -
> > -S =3D "${WORKDIR}/maturin-${PV}"
> > -
> > -CFLAGS +=3D
> "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/cargo_home"
> > -
> > -DEPENDS +=3D "\
> > -    python3-setuptools-rust-native \
> > -    python3-semantic-version-native \
> > -    python3-setuptools-rust \
> > -"
> > -
> > -require ${BPN}-crates.inc
> > -
> > -inherit pypi cargo-update-recipe-crates python_pyo3
> python_setuptools_build_meta
> > -
> > -do_configure() {
> > -    python_pyo3_do_configure
> > -    cargo_common_do_configure
> > -    python_pep517_do_configure
> > -}
> > -
> > -RDEPENDS:${PN} +=3D "\
> > -    cargo \
> > -    python3-json \
> > -    rust \
> > -"
> > -
> > -RRECOMMENDS:${PN} +=3D "\
> > -    python3-ensurepip \
> > -    python3-pip \
> > -    python3-venv \
> > -"
> > -
> > -BBCLASSEXTEND =3D "native nativesdk"
> > diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
> b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
> > new file mode 100644
> > index 00000000000..d7aa9fc99f0
> > --- /dev/null
> > +++ b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
> > @@ -0,0 +1,405 @@
> > +SUMMARY =3D "Build and publish crates with pyo3, rust-cpython, cffi
> bindings and rust binaries as python packages"
> > +HOMEPAGE =3D "https://github.com/pyo3/maturin"
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "MIT | Apache-2.0"
> > +LIC_FILES_CHKSUM =3D
> "file://license-apache;md5=3D1836efb2eb779966696f473ee8540542 \
> > +
> file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5c0797"
> > +
> > +SRC_URI +=3D "crate://crates.io/adler2/2.0.0 \
> > +           crate://crates.io/ahash/0.8.11 \
> > +           crate://crates.io/aho-corasick/1.1.3 \
> > +           crate://crates.io/allocator-api2/0.2.18 \
> > +           crate://crates.io/anstream/0.6.14 \
> > +           crate://crates.io/anstyle/1.0.7 \
> > +           crate://crates.io/anstyle-parse/0.2.4 \
> > +           crate://crates.io/anstyle-query/1.1.0 \
> > +           crate://crates.io/anstyle-wincon/3.0.3 \
> > +           crate://crates.io/anyhow/1.0.89 \
> > +           crate://crates.io/arbitrary/1.4.1 \
> > +           crate://crates.io/autocfg/1.3.0 \
> > +           crate://crates.io/automod/1.0.14 \
> > +           crate://crates.io/base64/0.21.7 \
> > +           crate://crates.io/base64/0.22.1 \
> > +           crate://crates.io/bitflags/1.3.2 \
> > +           crate://crates.io/bitflags/2.5.0 \
> > +           crate://crates.io/block-buffer/0.10.4 \
> > +           crate://crates.io/boxcar/0.2.8 \
> > +           crate://crates.io/bstr/1.10.0 \
> > +           crate://crates.io/bumpalo/3.16.0 \
> > +           crate://crates.io/byteorder/1.5.0 \
> > +           crate://crates.io/bytes/1.9.0 \
> > +           crate://crates.io/bytesize/1.3.0 \
> > +           crate://crates.io/bzip2/0.5.2 \
> > +           crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
> > +           crate://crates.io/cab/0.6.0 \
> > +           crate://crates.io/camino/1.1.9 \
> > +           crate://crates.io/cargo-config2/0.1.26 \
> > +           crate://crates.io/cargo-options/0.7.4 \
> > +           crate://crates.io/cargo-platform/0.1.8 \
> > +           crate://crates.io/cargo-xwin/0.18.4 \
> > +           crate://crates.io/cargo-zigbuild/0.20.0 \
> > +           crate://crates.io/cargo_metadata/0.19.0 \
> > +           crate://crates.io/cbindgen/0.28.0 \
> > +           crate://crates.io/cc/1.2.16 \
> > +           crate://crates.io/cfb/0.10.0 \
> > +           crate://crates.io/cfg-if/1.0.0 \
> > +           crate://crates.io/charset/0.1.5 \
> > +           crate://crates.io/chumsky/0.9.3 \
> > +           crate://crates.io/clap/4.5.7 \
> > +           crate://crates.io/clap_builder/4.5.7 \
> > +           crate://crates.io/clap_complete/4.5.5 \
> > +           crate://crates.io/clap_complete_command/0.6.1 \
> > +           crate://crates.io/clap_complete_nushell/4.5.2 \
> > +           crate://crates.io/clap_derive/4.5.5 \
> > +           crate://crates.io/clap_lex/0.7.1 \
> > +           crate://crates.io/cli-table/0.4.7 \
> > +           crate://crates.io/colorchoice/1.0.1 \
> > +           crate://crates.io/configparser/3.1.0 \
> > +           crate://crates.io/console/0.15.8 \
> > +           crate://crates.io/content_inspector/0.2.4 \
> > +           crate://crates.io/core-foundation/0.9.4 \
> > +           crate://crates.io/core-foundation-sys/0.8.6 \
> > +           crate://crates.io/cpufeatures/0.2.12 \
> > +           crate://crates.io/crc/3.2.1 \
> > +           crate://crates.io/crc-catalog/2.4.0 \
> > +           crate://crates.io/crc32fast/1.4.2 \
> > +           crate://crates.io/crossbeam-channel/0.5.15 \
> > +           crate://crates.io/crossbeam-deque/0.8.5 \
> > +           crate://crates.io/crossbeam-epoch/0.9.18 \
> > +           crate://crates.io/crossbeam-utils/0.8.20 \
> > +           crate://crates.io/crypto-common/0.1.6 \
> > +           crate://crates.io/data-encoding/2.6.0 \
> > +           crate://crates.io/deranged/0.3.11 \
> > +           crate://crates.io/derive_arbitrary/1.4.1 \
> > +           crate://crates.io/dialoguer/0.11.0 \
> > +           crate://crates.io/diff/0.1.13 \
> > +           crate://crates.io/digest/0.10.7 \
> > +           crate://crates.io/dirs/5.0.1 \
> > +           crate://crates.io/dirs-sys/0.4.1 \
> > +           crate://crates.io/displaydoc/0.2.5 \
> > +           crate://crates.io/dissimilar/1.0.9 \
> > +           crate://crates.io/dunce/1.0.5 \
> > +           crate://crates.io/dyn-clone/1.0.17 \
> > +           crate://crates.io/either/1.13.0 \
> > +           crate://crates.io/encode_unicode/0.3.6 \
> > +           crate://crates.io/encoding_rs/0.8.34 \
> > +           crate://crates.io/equivalent/1.0.1 \
> > +           crate://crates.io/errno/0.3.9 \
> > +           crate://crates.io/expect-test/1.5.0 \
> > +           crate://crates.io/fastrand/2.1.0 \
> > +           crate://crates.io/fat-macho/0.4.9 \
> > +           crate://crates.io/filetime/0.2.23 \
> > +           crate://crates.io/flate2/1.0.33 \
> > +           crate://crates.io/fnv/1.0.7 \
> > +           crate://crates.io/foreign-types/0.3.2 \
> > +           crate://crates.io/foreign-types-shared/0.1.1 \
> > +           crate://crates.io/form_urlencoded/1.2.1 \
> > +           crate://crates.io/fs-err/3.0.0 \
> > +           crate://crates.io/fs4/0.12.0 \
> > +           crate://crates.io/futures/0.3.30 \
> > +           crate://crates.io/futures-channel/0.3.31 \
> > +           crate://crates.io/futures-core/0.3.31 \
> > +           crate://crates.io/futures-executor/0.3.30 \
> > +           crate://crates.io/futures-io/0.3.31 \
> > +           crate://crates.io/futures-macro/0.3.31 \
> > +           crate://crates.io/futures-sink/0.3.31 \
> > +           crate://crates.io/futures-task/0.3.31 \
> > +           crate://crates.io/futures-timer/3.0.3 \
> > +           crate://crates.io/futures-util/0.3.31 \
> > +           crate://crates.io/generic-array/0.14.7 \
> > +           crate://crates.io/getrandom/0.2.15 \
> > +           crate://crates.io/glob/0.3.1 \
> > +           crate://crates.io/globset/0.4.15 \
> > +           crate://crates.io/goblin/0.9.2 \
> > +           crate://crates.io/hashbrown/0.14.5 \
> > +           crate://crates.io/hashbrown/0.15.2 \
> > +           crate://crates.io/heck/0.4.1 \
> > +           crate://crates.io/heck/0.5.0 \
> > +           crate://crates.io/home/0.5.9 \
> > +           crate://crates.io/humantime/2.1.0 \
> > +           crate://crates.io/humantime-serde/1.1.1 \
> > +           crate://crates.io/icu_collections/1.5.0 \
> > +           crate://crates.io/icu_locid/1.5.0 \
> > +           crate://crates.io/icu_locid_transform/1.5.0 \
> > +           crate://crates.io/icu_locid_transform_data/1.5.0 \
> > +           crate://crates.io/icu_normalizer/1.5.0 \
> > +           crate://crates.io/icu_normalizer_data/1.5.0 \
> > +           crate://crates.io/icu_properties/1.5.1 \
> > +           crate://crates.io/icu_properties_data/1.5.0 \
> > +           crate://crates.io/icu_provider/1.5.0 \
> > +           crate://crates.io/icu_provider_macros/1.5.0 \
> > +           crate://crates.io/idna/1.0.3 \
> > +           crate://crates.io/idna_adapter/1.2.0 \
> > +           crate://crates.io/ignore/0.4.23 \
> > +           crate://crates.io/indexmap/2.6.0 \
> > +           crate://crates.io/indicatif/0.17.9 \
> > +           crate://crates.io/indoc/2.0.5 \
> > +           crate://crates.io/is_terminal_polyfill/1.70.0 \
> > +           crate://crates.io/itertools/0.12.1 \
> > +           crate://crates.io/itertools/0.13.0 \
> > +           crate://crates.io/itoa/1.0.11 \
> > +           crate://crates.io/js-sys/0.3.73 \
> > +           crate://crates.io/keyring/2.3.3 \
> > +           crate://crates.io/lazy_static/1.4.0 \
> > +           crate://crates.io/lddtree/0.3.7 \
> > +           crate://crates.io/libc/0.2.167 \
> > +           crate://crates.io/libmimalloc-sys/0.1.39 \
> > +           crate://crates.io/libredox/0.1.3 \
> > +           crate://crates.io/linux-keyutils/0.2.4 \
> > +           crate://crates.io/linux-raw-sys/0.4.14 \
> > +           crate://crates.io/litemap/0.7.3 \
> > +           crate://crates.io/lock_api/0.4.12 \
> > +           crate://crates.io/lockfree-object-pool/0.1.6 \
> > +           crate://crates.io/log/0.4.22 \
> > +           crate://crates.io/lzma-sys/0.1.20 \
> > +           crate://crates.io/lzxd/0.2.5 \
> > +           crate://crates.io/mailparse/0.15.0 \
> > +           crate://crates.io/matchers/0.1.0 \
> > +           crate://crates.io/memchr/2.7.4 \
> > +           crate://crates.io/mimalloc/0.1.43 \
> > +           crate://crates.io/mime/0.3.17 \
> > +           crate://crates.io/mime_guess/2.0.4 \
> > +           crate://crates.io/minijinja/2.5.0 \
> > +           crate://crates.io/minimal-lexical/0.2.1 \
> > +           crate://crates.io/miniz_oxide/0.8.0 \
> > +           crate://crates.io/msi/0.8.0 \
> > +           crate://crates.io/multipart/0.18.0 \
> > +           crate://crates.io/native-tls/0.2.12 \
> > +           crate://crates.io/nom/7.1.3 \
> > +           crate://crates.io/normalize-line-endings/0.3.0 \
> > +           crate://crates.io/normpath/1.2.0 \
> > +           crate://crates.io/nu-ansi-term/0.46.0 \
> > +           crate://crates.io/num-conv/0.1.0 \
> > +           crate://crates.io/number_prefix/0.4.0 \
> > +           crate://crates.io/once_cell/1.20.2 \
> > +           crate://crates.io/openssl/0.10.72 \
> > +           crate://crates.io/openssl-macros/0.1.1 \
> > +           crate://crates.io/openssl-probe/0.1.5 \
> > +           crate://crates.io/openssl-sys/0.9.107 \
> > +           crate://crates.io/option-ext/0.2.0 \
> > +           crate://crates.io/os_pipe/1.2.0 \
> > +           crate://crates.io/overload/0.1.1 \
> > +           crate://crates.io/parking_lot/0.12.3 \
> > +           crate://crates.io/parking_lot_core/0.9.10 \
> > +           crate://crates.io/paste/1.0.15 \
> > +           crate://crates.io/path-slash/0.2.1 \
> > +           crate://crates.io/pep440_rs/0.7.3 \
> > +           crate://crates.io/pep508_rs/0.9.2 \
> > +           crate://crates.io/percent-encoding/2.3.1 \
> > +           crate://crates.io/pin-project-lite/0.2.15 \
> > +           crate://crates.io/pin-utils/0.1.0 \
> > +           crate://crates.io/pkg-config/0.3.30 \
> > +           crate://crates.io/plain/0.2.3 \
> > +           crate://crates.io/platform-info/2.0.3 \
> > +           crate://crates.io/portable-atomic/1.6.0 \
> > +           crate://crates.io/powerfmt/0.2.0 \
> > +           crate://crates.io/ppv-lite86/0.2.17 \
> > +           crate://crates.io/pretty_assertions/1.4.1 \
> > +           crate://crates.io/proc-macro-crate/3.1.0 \
> > +           crate://crates.io/proc-macro2/1.0.92 \
> > +           crate://crates.io/psm/0.1.21 \
> > +           crate://crates.io/pyproject-toml/0.13.4 \
> > +           crate://crates.io/python-pkginfo/0.6.5 \
> > +           crate://crates.io/quote/1.0.37 \
> > +           crate://crates.io/quoted_printable/0.5.0 \
> > +           crate://crates.io/rand/0.8.5 \
> > +           crate://crates.io/rand_chacha/0.3.1 \
> > +           crate://crates.io/rand_core/0.6.4 \
> > +           crate://crates.io/rayon/1.10.0 \
> > +           crate://crates.io/rayon-core/1.12.1 \
> > +           crate://crates.io/redox_syscall/0.4.1 \
> > +           crate://crates.io/redox_syscall/0.5.1 \
> > +           crate://crates.io/redox_users/0.4.5 \
> > +           crate://crates.io/regex/1.11.1 \
> > +           crate://crates.io/regex-automata/0.1.10 \
> > +           crate://crates.io/regex-automata/0.4.9 \
> > +           crate://crates.io/regex-syntax/0.6.29 \
> > +           crate://crates.io/regex-syntax/0.8.5 \
> > +           crate://crates.io/relative-path/1.9.3 \
> > +           crate://crates.io/rfc2047-decoder/1.0.6 \
> > +           crate://crates.io/ring/0.17.13 \
> > +           crate://crates.io/rstest/0.22.0 \
> > +           crate://crates.io/rstest_macros/0.22.0 \
> > +           crate://crates.io/rustc-hash/2.0.0 \
> > +           crate://crates.io/rustc_version/0.4.1 \
> > +           crate://crates.io/rustflags/0.1.6 \
> > +           crate://crates.io/rustix/0.38.41 \
> > +           crate://crates.io/rustls/0.23.19 \
> > +           crate://crates.io/rustls-pemfile/2.1.3 \
> > +           crate://crates.io/rustls-pki-types/1.10.0 \
> > +           crate://crates.io/rustls-webpki/0.102.8 \
> > +           crate://crates.io/rustversion/1.0.18 \
> > +           crate://crates.io/ryu/1.0.18 \
> > +           crate://crates.io/same-file/1.0.6 \
> > +           crate://crates.io/schannel/0.1.23 \
> > +           crate://crates.io/schemars/0.8.21 \
> > +           crate://crates.io/schemars_derive/0.8.21 \
> > +           crate://crates.io/scopeguard/1.2.0 \
> > +           crate://crates.io/scroll/0.12.0 \
> > +           crate://crates.io/scroll_derive/0.12.0 \
> > +           crate://crates.io/security-framework/2.11.0 \
> > +           crate://crates.io/security-framework-sys/2.11.0 \
> > +           crate://crates.io/semver/1.0.23 \
> > +           crate://crates.io/serde/1.0.217 \
> > +           crate://crates.io/serde_derive/1.0.217 \
> > +           crate://crates.io/serde_derive_internals/0.29.1 \
> > +           crate://crates.io/serde_json/1.0.135 \
> > +           crate://crates.io/serde_spanned/0.6.8 \
> > +           crate://crates.io/sha2/0.10.8 \
> > +           crate://crates.io/sharded-slab/0.1.7 \
> > +           crate://crates.io/shell-words/1.1.0 \
> > +           crate://crates.io/shlex/1.3.0 \
> > +           crate://crates.io/simd-adler32/0.3.7 \
> > +           crate://crates.io/similar/2.5.0 \
> > +           crate://crates.io/slab/0.4.9 \
> > +           crate://crates.io/smallvec/1.13.2 \
> > +           crate://crates.io/smawk/0.3.2 \
> > +           crate://crates.io/snapbox/0.6.16 \
> > +           crate://crates.io/snapbox-macros/0.3.10 \
> > +           crate://crates.io/socks/0.3.4 \
> > +           crate://crates.io/stable_deref_trait/1.2.0 \
> > +           crate://crates.io/stacker/0.1.15 \
> > +           crate://crates.io/static_assertions/1.1.0 \
> > +           crate://crates.io/strsim/0.11.1 \
> > +           crate://crates.io/subtle/2.5.0 \
> > +           crate://crates.io/syn/2.0.90 \
> > +           crate://crates.io/synstructure/0.13.1 \
> > +           crate://crates.io/tar/0.4.43 \
> > +           crate://crates.io/target-lexicon/0.13.1 \
> > +           crate://crates.io/tempfile/3.11.0 \
> > +           crate://crates.io/termcolor/1.4.1 \
> > +           crate://crates.io/terminal_size/0.3.0 \
> > +           crate://crates.io/textwrap/0.16.1 \
> > +           crate://crates.io/thiserror/1.0.69 \
> > +           crate://crates.io/thiserror/2.0.3 \
> > +           crate://crates.io/thiserror-impl/1.0.69 \
> > +           crate://crates.io/thiserror-impl/2.0.3 \
> > +           crate://crates.io/thread_local/1.1.8 \
> > +           crate://crates.io/time/0.3.36 \
> > +           crate://crates.io/time-core/0.1.2 \
> > +           crate://crates.io/time-macros/0.2.18 \
> > +           crate://crates.io/tinystr/0.7.6 \
> > +           crate://crates.io/toml/0.8.19 \
> > +           crate://crates.io/toml_datetime/0.6.8 \
> > +           crate://crates.io/toml_edit/0.21.1 \
> > +           crate://crates.io/toml_edit/0.22.22 \
> > +           crate://crates.io/tracing/0.1.41 \
> > +           crate://crates.io/tracing-attributes/0.1.28 \
> > +           crate://crates.io/tracing-core/0.1.33 \
> > +           crate://crates.io/tracing-log/0.2.0 \
> > +           crate://crates.io/tracing-serde/0.2.0 \
> > +           crate://crates.io/tracing-subscriber/0.3.19 \
> > +           crate://crates.io/trycmd/0.15.6 \
> > +           crate://crates.io/twox-hash/1.6.3 \
> > +           crate://crates.io/typenum/1.17.0 \
> > +           crate://crates.io/unicase/2.7.0 \
> > +           crate://crates.io/unicode-ident/1.0.12 \
> > +           crate://crates.io/unicode-linebreak/0.1.5 \
> > +           crate://crates.io/unicode-width/0.1.13 \
> > +           crate://crates.io/unicode-width/0.2.0 \
> > +           crate://crates.io/unicode-xid/0.2.6 \
> > +           crate://crates.io/unscanny/0.1.0 \
> > +           crate://crates.io/untrusted/0.9.0 \
> > +           crate://crates.io/ureq/2.11.0 \
> > +           crate://crates.io/url/2.5.4 \
> > +           crate://crates.io/urlencoding/2.1.3 \
> > +           crate://crates.io/utf16_iter/1.0.5 \
> > +           crate://crates.io/utf8_iter/1.0.4 \
> > +           crate://crates.io/utf8parse/0.2.2 \
> > +           crate://crates.io/uuid/1.8.0 \
> > +           crate://crates.io/valuable/0.1.0 \
> > +           crate://crates.io/vcpkg/0.2.15 \
> > +           crate://crates.io/version-ranges/0.1.1 \
> > +           crate://crates.io/version_check/0.9.4 \
> > +           crate://crates.io/versions/6.2.0 \
> > +           crate://crates.io/wait-timeout/0.2.0 \
> > +           crate://crates.io/walkdir/2.5.0 \
> > +           crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
> > +           crate://crates.io/wasm-bindgen/0.2.96 \
> > +           crate://crates.io/wasm-bindgen-backend/0.2.96 \
> > +           crate://crates.io/wasm-bindgen-macro/0.2.96 \
> > +           crate://crates.io/wasm-bindgen-macro-support/0.2.96 \
> > +           crate://crates.io/wasm-bindgen-shared/0.2.96 \
> > +           crate://crates.io/web-time/1.1.0 \
> > +           crate://crates.io/webpki-roots/0.26.2 \
> > +           crate://crates.io/which/7.0.0 \
> > +           crate://crates.io/wild/2.2.1 \
> > +           crate://crates.io/winapi/0.3.9 \
> > +           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
> > +           crate://crates.io/winapi-util/0.1.8 \
> > +           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
> > +           crate://crates.io/windows-sys/0.48.0 \
> > +           crate://crates.io/windows-sys/0.52.0 \
> > +           crate://crates.io/windows-targets/0.48.5 \
> > +           crate://crates.io/windows-targets/0.52.5 \
> > +           crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
> > +           crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
> > +           crate://crates.io/windows_aarch64_msvc/0.48.5 \
> > +           crate://crates.io/windows_aarch64_msvc/0.52.5 \
> > +           crate://crates.io/windows_i686_gnu/0.48.5 \
> > +           crate://crates.io/windows_i686_gnu/0.52.5 \
> > +           crate://crates.io/windows_i686_gnullvm/0.52.5 \
> > +           crate://crates.io/windows_i686_msvc/0.48.5 \
> > +           crate://crates.io/windows_i686_msvc/0.52.5 \
> > +           crate://crates.io/windows_x86_64_gnu/0.48.5 \
> > +           crate://crates.io/windows_x86_64_gnu/0.52.5 \
> > +           crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
> > +           crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
> > +           crate://crates.io/windows_x86_64_msvc/0.48.5 \
> > +           crate://crates.io/windows_x86_64_msvc/0.52.5 \
> > +           crate://crates.io/winnow/0.5.40 \
> > +           crate://crates.io/winnow/0.6.20 \
> > +           crate://crates.io/winsafe/0.0.19 \
> > +           crate://crates.io/write16/1.0.0 \
> > +           crate://crates.io/writeable/0.5.5 \
> > +           crate://crates.io/xattr/1.3.1 \
> > +           crate://crates.io/xwin/0.6.5 \
> > +           crate://crates.io/xz2/0.1.7 \
> > +           crate://crates.io/yansi/1.0.1 \
> > +           crate://crates.io/yoke/0.7.4 \
> > +           crate://crates.io/yoke-derive/0.7.5 \
> > +           crate://crates.io/zerocopy/0.7.35 \
> > +           crate://crates.io/zerocopy-derive/0.7.35 \
> > +           crate://crates.io/zerofrom/0.1.4 \
> > +           crate://crates.io/zerofrom-derive/0.1.5 \
> > +           crate://crates.io/zeroize/1.8.1 \
> > +           crate://crates.io/zerovec/0.10.4 \
> > +           crate://crates.io/zerovec-derive/0.10.3 \
> > +           crate://crates.io/zip/2.3.0 \
> > +           crate://crates.io/zopfli/0.8.1 \
> > +           "
> > +SRC_URI[sha256sum] =3D
> "0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250ccaa29c1aa8d0e61fa664b0289d"
> > +
> > +S =3D "${WORKDIR}/maturin-${PV}"
> > +
> > +CFLAGS +=3D
> "-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC_DIR}/cargo_home"
> > +
> > +DEPENDS +=3D "\
> > +    python3-setuptools-rust-native \
> > +    python3-semantic-version-native \
> > +    python3-setuptools-rust \
> > +"
> > +
> > +require ${BPN}-crates.inc
> > +
> > +inherit pypi cargo-update-recipe-crates python_pyo3
> python_setuptools_build_meta
> > +
> > +do_configure() {
> > +    python_pyo3_do_configure
> > +    cargo_common_do_configure
> > +    python_pep517_do_configure
> > +}
> > +
> > +RDEPENDS:${PN} +=3D "\
> > +    cargo \
> > +    python3-json \
> > +    rust \
> > +"
> > +
> > +RRECOMMENDS:${PN} +=3D "\
> > +    python3-ensurepip \
> > +    python3-pip \
> > +    python3-venv \
> > +"
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.43.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#217680):
> https://lists.openembedded.org/g/openembedded-core/message/217680
> > Mute This Topic: https://lists.openembedded.org/mt/113419172/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000e61cfa0636984a37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 2, =
2025 at 1:08=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavi=
n@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">This duplicates the list of crates in .i=
nc with another list in .bb<br>
which doesn&#39;t seem right?<br>
<br></blockquote><div>Thank you for the catch. Sunday brain missed that.</d=
iv><div><br></div><div>I will send a v2.</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Alex<br>
<br>
On Mon, 2 Jun 2025 at 00:26, Tim Orling via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><=
br>
&lt;tim.orling=3D<a href=3D"mailto:konsulko.com@lists.openembedded.org" tar=
get=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt;<br>
&gt; Comparing changes since 1.8.3:<br>
&gt; <a href=3D"https://github.com/PyO3/maturin/compare/v1.8.3...v1.8.6" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/PyO3/maturin/compare/=
v1.8.3...v1.8.6</a><br>
&gt;<br>
&gt; Changelog:<br>
&gt;<br>
&gt; 1.8.6<br>
&gt; * Print a message when overriding platform tag from _PYTHON_HOST_PLATF=
ORM<br>
&gt;=C2=A0 =C2=A0in #2594<br>
&gt; * Use the current python interpreter&#39;s version when the abi3 featu=
re is set<br>
&gt;=C2=A0 =C2=A0with no explicit version in #2597<br>
&gt;<br>
&gt; 1.8.5<br>
&gt; * Fix release CI build<br>
&gt;<br>
&gt; 1.8.4<br>
&gt; * Install a Rust toolchain into a temporary directory when building ma=
turin<br>
&gt;=C2=A0 =C2=A0itself or a package and a Rust toolchain is missing. Set<b=
r>
&gt;=C2=A0 =C2=A0MATURIN_NO_INSTALL_RUST to disable this behavior. #2421<br=
>
&gt; * Fix broken maturin develop with latest uv in #2584<br>
&gt; * Add PYO3_PYTHON env var support in #2534<br>
&gt; * Sort RECORD file in wheel archives to make them deterministic in #25=
50<br>
&gt; * Publish wheel for loongarch64 in #2548<br>
&gt; * Add --compression-level option to build command in #2572<br>
&gt;<br>
&gt; Signed-off-by: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.co=
m" target=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; ---<br>
&gt; oe-selftest for maturin passes<br>
&gt;<br>
&gt;=C2=A0 .../python/python3-maturin-crates.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 20 +-<br>
&gt;=C2=A0 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.8.3.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.8.3.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 43 --<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-maturin_1.8.6.bb" rel=3D"no=
referrer" target=3D"_blank">python3-maturin_1.8.6.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 405 ++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 415 insertions(+), 163 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/python3-maturin/=
0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-maturin_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
turin_1.8.3.bb</a><br>
&gt;=C2=A0 create mode 100644 meta/recipes-devtools/python/<a href=3D"http:=
//python3-maturin_1.8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-ma=
turin_1.8.6.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b=
/meta/recipes-devtools/python/python3-maturin-crates.inc<br>
&gt; index 2f196f56570..5c939a09a8e 100644<br>
&gt; --- a/meta/recipes-devtools/python/python3-maturin-crates.inc<br>
&gt; +++ b/meta/recipes-devtools/python/python3-maturin-crates.inc<br>
&gt; @@ -34,7 +34,7 @@ SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo-options/=
0.7.4" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo-options/0.7.4</=
a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo-platform=
/0.1.8" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo-platform/0.1.8=
</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo-xwin/0.1=
8.4" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo-xwin/0.18.4</a> \=
<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo-zigbuild/0.19=
.7" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo-zigbuild/0.19.7</a=
> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo-zigbuild/0.20=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo-zigbuild/0.20.0</a=
> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cargo_metadata=
/0.19.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cargo_metadata/0.19=
.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cbindgen/0.28.=
0" rel=3D"noreferrer" target=3D"_blank">crates.io/cbindgen/0.28.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/cc/1.2.16" rel=
=3D"noreferrer" target=3D"_blank">crates.io/cc/1.2.16</a> \<br>
&gt; @@ -60,7 +60,7 @@ SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crc/3.2.1" rel=
=3D"noreferrer" target=3D"_blank">crates.io/crc/3.2.1</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crc-catalog/2.=
4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/crc-catalog/2.4.0</a> \=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crc32fast/1.4.=
2" rel=3D"noreferrer" target=3D"_blank">crates.io/crc32fast/1.4.2</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0=
.5.13" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-channel/0.5=
.13</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-channel/0=
.5.15" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-channel/0.5=
.15</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-dequ=
e/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-deque/0.8=
.5</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-epoc=
h/0.9.18" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-epoch/0.=
9.18</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/crossbeam-util=
s/0.8.20" rel=3D"noreferrer" target=3D"_blank">crates.io/crossbeam-utils/0.=
8.20</a> \<br>
&gt; @@ -169,10 +169,10 @@ SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/num-conv/0.1.0=
" rel=3D"noreferrer" target=3D"_blank">crates.io/num-conv/0.1.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/number_prefix/=
0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/number_prefix/0.4.0</=
a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/once_cell/1.20=
.2" rel=3D"noreferrer" target=3D"_blank">crates.io/once_cell/1.20.2</a> \<b=
r>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.70" re=
l=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.70</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl/0.10.72" re=
l=3D"noreferrer" target=3D"_blank">crates.io/openssl/0.10.72</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-macros=
/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-macros/0.1.1=
</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-probe/=
0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-probe/0.1.5</=
a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.105=
" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.105</a> \<=
br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/openssl-sys/0.9.107=
" rel=3D"noreferrer" target=3D"_blank">crates.io/openssl-sys/0.9.107</a> \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/option-ext/0.2=
.0" rel=3D"noreferrer" target=3D"_blank">crates.io/option-ext/0.2.0</a> \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/os_pipe/1.2.0"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/os_pipe/1.2.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/overload/0.1.1=
" rel=3D"noreferrer" target=3D"_blank">crates.io/overload/0.1.1</a> \<br>
&gt; @@ -362,7 +362,7 @@ SRC_URI +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zeroize/1.8.1"=
 rel=3D"noreferrer" target=3D"_blank">crates.io/zeroize/1.8.1</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerovec/0.10.4=
" rel=3D"noreferrer" target=3D"_blank">crates.io/zerovec/0.10.4</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zerovec-derive=
/0.10.3" rel=3D"noreferrer" target=3D"_blank">crates.io/zerovec-derive/0.10=
.3</a> \<br>
&gt; -=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zip/2.2.3" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zip/2.2.3</a> \<br>
&gt; +=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zip/2.3.0" rel=3D"n=
oreferrer" target=3D"_blank">crates.io/zip/2.3.0</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/zopfli/0.8.1" =
rel=3D"noreferrer" target=3D"_blank">crates.io/zopfli/0.8.1</a> \<br>
&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt; @@ -398,7 +398,7 @@ SRC_URI[cargo-config2-0.1.26.sha256sum] =3D &quot;=
d83ce0be8bd1479e5de6202def660e6c7e27e<br>
&gt;=C2=A0 SRC_URI[cargo-options-0.7.4.sha256sum] =3D &quot;f3540247c0a37a7=
6eb324acc238dc617786ea22c43b95da560c82a8f2714321f&quot;<br>
&gt;=C2=A0 SRC_URI[cargo-platform-0.1.8.sha256sum] =3D &quot;24b1f0365a6c6b=
b4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc&quot;<br>
&gt;=C2=A0 SRC_URI[cargo-xwin-0.18.4.sha256sum] =3D &quot;60f1954e4ffa0f4c4=
7b3df5e6e9508706d8dcaa56152cd672dcee02930ba0326&quot;<br>
&gt; -SRC_URI[cargo-zigbuild-0.19.7.sha256sum] =3D &quot;04cc649328f39bbf1e=
f92ef753406e1785ff1074941c398e5214b6c74d318a9e&quot;<br>
&gt; +SRC_URI[cargo-zigbuild-0.20.0.sha256sum] =3D &quot;3f6e9e856390d5b0a8=
59acaeda16528f8a61c964bdb894c3216c254908f1c2ea&quot;<br>
&gt;=C2=A0 SRC_URI[cargo_metadata-0.19.0.sha256sum] =3D &quot;afc309ed89476=
c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85&quot;<br>
&gt;=C2=A0 SRC_URI[cbindgen-0.28.0.sha256sum] =3D &quot;eadd868a2ce9ca38de7=
eeafdcec9c7065ef89b42b32f0839278d55f35c54d1ff&quot;<br>
&gt;=C2=A0 SRC_URI[cc-1.2.16.sha256sum] =3D &quot;be714c154be609ec7f5dad223=
a33bf1482fff90472de28f7362806e6d4832b8c&quot;<br>
&gt; @@ -424,7 +424,7 @@ SRC_URI[cpufeatures-0.2.12.sha256sum] =3D &quot;53=
fe5e26ff1b7aef8bca9c6080520cfb8d9333c<br>
&gt;=C2=A0 SRC_URI[crc-3.2.1.sha256sum] =3D &quot;69e6e4d7b33a94f0991c26729=
976b10ebde1d34c3ee82408fb536164fa10d636&quot;<br>
&gt;=C2=A0 SRC_URI[crc-catalog-2.4.0.sha256sum] =3D &quot;19d374276b40fb8bb=
dee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5&quot;<br>
&gt;=C2=A0 SRC_URI[crc32fast-1.4.2.sha256sum] =3D &quot;a97769d94ddab943e45=
10d138150169a2758b5ef3eb191a9ee688de3e23ef7b3&quot;<br>
&gt; -SRC_URI[crossbeam-channel-0.5.13.sha256sum] =3D &quot;33480d6946193aa=
8033910124896ca395333cae7e2d1113d1fef6c3272217df2&quot;<br>
&gt; +SRC_URI[crossbeam-channel-0.5.15.sha256sum] =3D &quot;82b8f8f868b3696=
7f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2&quot;<br>
&gt;=C2=A0 SRC_URI[crossbeam-deque-0.8.5.sha256sum] =3D &quot;613f8cc01fe9c=
f1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d&quot;<br>
&gt;=C2=A0 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] =3D &quot;5b82ac4a3c2c=
a9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e&quot;<br>
&gt;=C2=A0 SRC_URI[crossbeam-utils-0.8.20.sha256sum] =3D &quot;22ec99545bb0=
ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80&quot;<br>
&gt; @@ -533,10 +533,10 @@ SRC_URI[nu-ansi-term-0.46.0.sha256sum] =3D &quot=
;77a8165726e8236064dbb45459242600304b42<br>
&gt;=C2=A0 SRC_URI[num-conv-0.1.0.sha256sum] =3D &quot;51d515d32fb182ee37cd=
a2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9&quot;<br>
&gt;=C2=A0 SRC_URI[number_prefix-0.4.0.sha256sum] =3D &quot;830b246a0e5f20a=
f87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3&quot;<br>
&gt;=C2=A0 SRC_URI[once_cell-1.20.2.sha256sum] =3D &quot;1261fe7e33c73b354e=
ab43b1273a57c8f967d0391e80353e51f764ac02cf6775&quot;<br>
&gt; -SRC_URI[openssl-0.10.70.sha256sum] =3D &quot;61cfb4e166a8bb8c9b55c500=
bc2308550148ece889be90f609377e58140f42c6&quot;<br>
&gt; +SRC_URI[openssl-0.10.72.sha256sum] =3D &quot;fedfea7d58a1f73118430a55=
da6a286e7b044961736ce96a16a17068ea25e5da&quot;<br>
&gt;=C2=A0 SRC_URI[openssl-macros-0.1.1.sha256sum] =3D &quot;a948666b637a0f=
465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c&quot;<br>
&gt;=C2=A0 SRC_URI[openssl-probe-0.1.5.sha256sum] =3D &quot;ff011a302c396a5=
197692431fc1948019154afc178baf7d8e37367442a4601cf&quot;<br>
&gt; -SRC_URI[openssl-sys-0.9.105.sha256sum] =3D &quot;8b22d5b84be05a8d6947=
c7cb71f7c849aa0f112acd4bf51c2a7c1c988ac0a9dc&quot;<br>
&gt; +SRC_URI[openssl-sys-0.9.107.sha256sum] =3D &quot;8288979acd84749c744a=
9014b4382d42b8f7b2592847b5afb2ed29e5d16ede07&quot;<br>
&gt;=C2=A0 SRC_URI[option-ext-0.2.0.sha256sum] =3D &quot;04744f49eae99ab78e=
0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d&quot;<br>
&gt;=C2=A0 SRC_URI[os_pipe-1.2.0.sha256sum] =3D &quot;29d73ba8daf8fac13b050=
1d1abeddcfe21ba7401ada61a819144b6c2a4f32209&quot;<br>
&gt;=C2=A0 SRC_URI[overload-0.1.1.sha256sum] =3D &quot;b15813163c1d831bf4a1=
3c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39&quot;<br>
&gt; @@ -726,5 +726,5 @@ SRC_URI[zerofrom-derive-0.1.5.sha256sum] =3D &quot=
;595eed982f7d355beb85837f651fa22e90b3<br>
&gt;=C2=A0 SRC_URI[zeroize-1.8.1.sha256sum] =3D &quot;ced3678a2879b30306d32=
3f4542626697a464a97c0a07c9aebf7ebca65cd4dde&quot;<br>
&gt;=C2=A0 SRC_URI[zerovec-0.10.4.sha256sum] =3D &quot;aa2b893d79df23bfb12d=
5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079&quot;<br>
&gt;=C2=A0 SRC_URI[zerovec-derive-0.10.3.sha256sum] =3D &quot;6eafa6dfb1758=
4ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6&quot;<br>
&gt; -SRC_URI[zip-2.2.3.sha256sum] =3D &quot;b280484c454e74e5fff658bbf7df8f=
dbe7a07c6b2de4a53def232c15ef138f3a&quot;<br>
&gt; +SRC_URI[zip-2.3.0.sha256sum] =3D &quot;84e9a772a54b54236b9b744aaaf8d7=
be01b4d6e99725523cb82cb32d1c81b1d7&quot;<br>
&gt;=C2=A0 SRC_URI[zopfli-0.8.1.sha256sum] =3D &quot;e5019f391bac5cf252e93b=
bcc53d039ffd62c7bfb7c150414d61369afe57e946&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Define-=
more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools=
/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-l=
inux-g.patch<br>
&gt; deleted file mode 100644<br>
&gt; index aceefa7967e..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-io=
ctl-codes-on-riscv32gc-unknown-linux-g.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,110 +0,0 @@<br>
&gt; -From 4b439b0953573e0383da7e092b1f516ba21f3398 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Dan Gohman &lt;dev@sunfishcode.online&gt;<br>
&gt; -Date: Sun, 6 Apr 2025 05:22:49 -0700<br>
&gt; -Subject: [PATCH] Define Linux ioctl codes on more architectures.<br>
&gt; -<br>
&gt; -Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` usin=
g<br>
&gt; -`_IOR` and `_IOW` so that they&#39;re automatically supported on all<=
br>
&gt; -architectures, including riscv32gc-unknown-linux-gnu.<br>
&gt; -<br>
&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/rust-lang/li=
bc/pull/4382/" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust=
-lang/libc/pull/4382/</a>]<br>
&gt; -Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ----<br>
&gt; - src/unix/linux_like/linux/arch/generic/<a href=3D"http://mod.rs" rel=
=3D"noreferrer" target=3D"_blank">mod.rs</a> | 75 ++++---------------<br>
&gt; - 1 file changed, 15 insertions(+), 60 deletions(-)<br>
&gt; -<br>
&gt; ---- a/src/unix/linux_like/linux/arch/generic/<a href=3D"http://mod.rs=
" rel=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt; -+++ b/src/unix/linux_like/linux/arch/generic/<a href=3D"http://mod.rs=
" rel=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt; -@@ -1,5 +1,5 @@<br>
&gt; - use crate::prelude::*;<br>
&gt; --use crate::Ioctl;<br>
&gt; -+use crate::{Ioctl, _IOR, _IOW};<br>
&gt; -<br>
&gt; - s! {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0pub struct termios2 {<br>
&gt; -@@ -116,21 +116,8 @@ cfg_if! {<br>
&gt; - // pub const SO_PREFER_BUSY_POLL: c_int =3D 69;<br>
&gt; - // pub const SO_BUSY_POLL_BUDGET: c_int =3D 70;<br>
&gt; -<br>
&gt; --cfg_if! {<br>
&gt; --=C2=A0 =C2=A0 if #[cfg(any(<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;x86&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;x86_64&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;arm&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;aarch64&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;riscv64&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;s390x&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;csky&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;loongarch64&quot;<=
br>
&gt; --=C2=A0 =C2=A0 ))] {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FICLONE: c_ulong =3D 0x4004940=
9;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FICLONERANGE: c_ulong =3D 0x40=
20940D;<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --}<br>
&gt; -+pub const FICLONE: Ioctl =3D _IOW::&lt;c_int&gt;(0x94, 9) as Ioctl;<=
br>
&gt; -+pub const FICLONERANGE: Ioctl =3D _IOW::&lt;crate::file_clone_range&=
gt;(0x94, 13) as Ioctl;<br>
&gt; -<br>
&gt; - // Defined in unix/linux_like/<a href=3D"http://mod.rs" rel=3D"noref=
errer" target=3D"_blank">mod.rs</a><br>
&gt; - // pub const SCM_TIMESTAMP: c_int =3D SO_TIMESTAMP;<br>
&gt; -@@ -248,49 +235,18 @@ pub const TUNGETVNETBE: Ioctl =3D 0x800454<br>
&gt; - pub const TUNSETSTEERINGEBPF: Ioctl =3D 0x800454e0;<br>
&gt; - pub const TUNSETFILTEREBPF: Ioctl =3D 0x800454e1;<br>
&gt; -<br>
&gt; --cfg_if! {<br>
&gt; --=C2=A0 =C2=A0 // Those type are constructed using the _IOC macro<br>
&gt; --=C2=A0 =C2=A0 // DD-SS_SSSS_SSSS_SSSS-TTTT_TTTT-NNNN_NNNN<br>
&gt; --=C2=A0 =C2=A0 // where D stands for direction (either None (00), Rea=
d (01) or Write (11))<br>
&gt; --=C2=A0 =C2=A0 // where S stands for size (int, long, struct...)<br>
&gt; --=C2=A0 =C2=A0 // where T stands for type (&#39;f&#39;,&#39;v&#39;,&#=
39;X&#39;...)<br>
&gt; --=C2=A0 =C2=A0 // where N stands for NR (NumbeR)<br>
&gt; --=C2=A0 =C2=A0 if #[cfg(any(<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;x86&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;arm&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;csky&quot;<br>
&gt; --=C2=A0 =C2=A0 ))] {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_GETFLAGS: Ioctl =3D 0x8=
0046601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_SETFLAGS: Ioctl =3D 0x4=
0046602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_GETVERSION: Ioctl =3D 0=
x80047601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_SETVERSION: Ioctl =3D 0=
x40047602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_GETFLAGS: Ioctl =3D 0=
x80046601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_SETFLAGS: Ioctl =3D 0=
x40046602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_GETVERSION: Ioctl =3D=
 0x80047601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_SETVERSION: Ioctl =3D=
 0x40047602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const TUNATTACHFILTER: Ioctl =3D 0x4=
00854d5;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const TUNDETACHFILTER: Ioctl =3D 0x4=
00854d6;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const TUNGETFILTER: Ioctl =3D 0x8008=
54db;<br>
&gt; --=C2=A0 =C2=A0 } else if #[cfg(any(<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;x86_64&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;riscv64&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;aarch64&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;s390x&quot;,<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 target_arch =3D &quot;loongarch64&quot;<=
br>
&gt; --=C2=A0 =C2=A0 ))] {<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_GETFLAGS: Ioctl =3D 0x8=
0086601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_SETFLAGS: Ioctl =3D 0x4=
0086602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_GETVERSION: Ioctl =3D 0=
x80087601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC_SETVERSION: Ioctl =3D 0=
x40087602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_GETFLAGS: Ioctl =3D 0=
x80046601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_SETFLAGS: Ioctl =3D 0=
x40046602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_GETVERSION: Ioctl =3D=
 0x80047601;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const FS_IOC32_SETVERSION: Ioctl =3D=
 0x40047602;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const TUNATTACHFILTER: Ioctl =3D 0x4=
01054d5;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const TUNDETACHFILTER: Ioctl =3D 0x4=
01054d6;<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub const TUNGETFILTER: Ioctl =3D 0x8010=
54db;<br>
&gt; --=C2=A0 =C2=A0 }<br>
&gt; --}<br>
&gt; -+pub const FS_IOC_GETFLAGS: Ioctl =3D _IOR::&lt;c_long&gt;(&#39;f&#39=
; as u32, 1) as Ioctl;<br>
&gt; -+pub const FS_IOC_SETFLAGS: Ioctl =3D _IOW::&lt;c_long&gt;(&#39;f&#39=
; as u32, 2) as Ioctl;<br>
&gt; -+pub const FS_IOC_GETVERSION: Ioctl =3D _IOR::&lt;c_long&gt;(&#39;v&#=
39; as u32, 1) as Ioctl;<br>
&gt; -+pub const FS_IOC_SETVERSION: Ioctl =3D _IOW::&lt;c_long&gt;(&#39;v&#=
39; as u32, 2) as Ioctl;<br>
&gt; -+pub const FS_IOC32_GETFLAGS: Ioctl =3D _IOR::&lt;c_int&gt;(&#39;f&#3=
9; as u32, 1) as Ioctl;<br>
&gt; -+pub const FS_IOC32_SETFLAGS: Ioctl =3D _IOW::&lt;c_int&gt;(&#39;f&#3=
9; as u32, 2) as Ioctl;<br>
&gt; -+pub const FS_IOC32_GETVERSION: Ioctl =3D _IOR::&lt;c_int&gt;(&#39;v&=
#39; as u32, 1) as Ioctl;<br>
&gt; -+pub const FS_IOC32_SETVERSION: Ioctl =3D _IOW::&lt;c_int&gt;(&#39;v&=
#39; as u32, 2) as Ioctl;<br>
&gt; -+<br>
&gt; -+pub const TUNATTACHFILTER: Ioctl =3D _IOW::&lt;crate::sock_fprog&gt;=
(&#39;T&#39; as u32, 213) as Ioctl;<br>
&gt; -+pub const TUNDETACHFILTER: Ioctl =3D _IOW::&lt;crate::sock_fprog&gt;=
(&#39;T&#39; as u32, 214) as Ioctl;<br>
&gt; -+pub const TUNGETFILTER: Ioctl =3D _IOR::&lt;crate::sock_fprog&gt;(&#=
39;T&#39; as u32, 219) as Ioctl;<br>
&gt; -<br>
&gt; - cfg_if! {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if #[cfg(any(target_arch =3D &quot;arm&quot;, tar=
get_arch =3D &quot;s390x&quot;))] {<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-ma=
turin_1.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.3.=
bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1.8=
.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.3.bb</a><br=
>
&gt; deleted file mode 100644<br>
&gt; index 08975e177f0..00000000000<br>
&gt; --- a/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1=
.8.3.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.3.bb</a><=
br>
&gt; +++ /dev/null<br>
&gt; @@ -1,43 +0,0 @@<br>
&gt; -SUMMARY =3D &quot;Build and publish crates with pyo3, rust-cpython, c=
ffi bindings and rust binaries as python packages&quot;<br>
&gt; -HOMEPAGE =3D &quot;<a href=3D"https://github.com/pyo3/maturin" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/pyo3/maturin</a>&quot;<br=
>
&gt; -SECTION =3D &quot;devel/python&quot;<br>
&gt; -LICENSE =3D &quot;MIT | Apache-2.0&quot;<br>
&gt; -LIC_FILES_CHKSUM =3D &quot;file://license-apache;md5=3D1836efb2eb7799=
66696f473ee8540542 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5c0797&quot;<br>
&gt; -<br>
&gt; -SRC_URI +=3D &quot;file://0001-Define-more-ioctl-codes-on-riscv32gc-u=
nknown-linux-g.patch;patchdir=3D${CARGO_VENDORING_DIRECTORY}/libc-0.2.167&q=
uot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;304762f86fd53a8031b1bf006d12572a2aa0a523=
5485031113195cc0152e1e12&quot;<br>
&gt; -<br>
&gt; -S =3D &quot;${WORKDIR}/maturin-${PV}&quot;<br>
&gt; -<br>
&gt; -CFLAGS +=3D &quot;-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC=
_DIR}/cargo_home&quot;<br>
&gt; -<br>
&gt; -DEPENDS +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 python3-setuptools-rust-native \<br>
&gt; -=C2=A0 =C2=A0 python3-semantic-version-native \<br>
&gt; -=C2=A0 =C2=A0 python3-setuptools-rust \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -require ${BPN}-crates.inc<br>
&gt; -<br>
&gt; -inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools=
_build_meta<br>
&gt; -<br>
&gt; -do_configure() {<br>
&gt; -=C2=A0 =C2=A0 python_pyo3_do_configure<br>
&gt; -=C2=A0 =C2=A0 cargo_common_do_configure<br>
&gt; -=C2=A0 =C2=A0 python_pep517_do_configure<br>
&gt; -}<br>
&gt; -<br>
&gt; -RDEPENDS:${PN} +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 cargo \<br>
&gt; -=C2=A0 =C2=A0 python3-json \<br>
&gt; -=C2=A0 =C2=A0 rust \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -RRECOMMENDS:${PN} +=3D &quot;\<br>
&gt; -=C2=A0 =C2=A0 python3-ensurepip \<br>
&gt; -=C2=A0 =C2=A0 python3-pip \<br>
&gt; -=C2=A0 =C2=A0 python3-venv \<br>
&gt; -&quot;<br>
&gt; -<br>
&gt; -BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3-ma=
turin_1.8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.6.=
bb</a> b/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1.8=
.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.6.bb</a><br=
>
&gt; new file mode 100644<br>
&gt; index 00000000000..d7aa9fc99f0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/python/<a href=3D"http://python3-maturin_1=
.8.6.bb" rel=3D"noreferrer" target=3D"_blank">python3-maturin_1.8.6.bb</a><=
br>
&gt; @@ -0,0 +1,405 @@<br>
&gt; +SUMMARY =3D &quot;Build and publish crates with pyo3, rust-cpython, c=
ffi bindings and rust binaries as python packages&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://github.com/pyo3/maturin" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/pyo3/maturin</a>&quot;<br=
>
&gt; +SECTION =3D &quot;devel/python&quot;<br>
&gt; +LICENSE =3D &quot;MIT | Apache-2.0&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://license-apache;md5=3D1836efb2eb7799=
66696f473ee8540542 \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5c0797&quot;<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;crate://<a href=3D"http://crates.io/adler2/2.0.0" =
rel=3D"noreferrer" target=3D"_blank">crates.io/adler2/2.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/ahash/0.8.11" rel=3D"noreferrer" target=3D"_blank">crates.io/ahash/=
0.8.11</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/aho-corasick/1.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/=
aho-corasick/1.1.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/allocator-api2/0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.=
io/allocator-api2/0.2.18</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/anstream/0.6.14" rel=3D"noreferrer" target=3D"_blank">crates.io/ans=
tream/0.6.14</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/anstyle/1.0.7" rel=3D"noreferrer" target=3D"_blank">crates.io/ansty=
le/1.0.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/anstyle-parse/0.2.4" rel=3D"noreferrer" target=3D"_blank">crates.io=
/anstyle-parse/0.2.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/anstyle-query/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/anstyle-query/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/anstyle-wincon/3.0.3" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/anstyle-wincon/3.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/anyhow/1.0.89" rel=3D"noreferrer" target=3D"_blank">crates.io/anyho=
w/1.0.89</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/arbitrary/1.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io/arb=
itrary/1.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/autocfg/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/autoc=
fg/1.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/automod/1.0.14" rel=3D"noreferrer" target=3D"_blank">crates.io/auto=
mod/1.0.14</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/base64/0.21.7" rel=3D"noreferrer" target=3D"_blank">crates.io/base6=
4/0.21.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/base64/0.22.1" rel=3D"noreferrer" target=3D"_blank">crates.io/base6=
4/0.22.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bitflags/1.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/bitf=
lags/1.3.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bitflags/2.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bitf=
lags/2.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/block-buffer/0.10.4" rel=3D"noreferrer" target=3D"_blank">crates.io=
/block-buffer/0.10.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/boxcar/0.2.8" rel=3D"noreferrer" target=3D"_blank">crates.io/boxcar=
/0.2.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bstr/1.10.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bstr/1.=
10.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bumpalo/3.16.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bump=
alo/3.16.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/byteorder/1.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/byt=
eorder/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bytes/1.9.0" rel=3D"noreferrer" target=3D"_blank">crates.io/bytes/1=
.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bytesize/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/byte=
size/1.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bzip2/0.5.2" rel=3D"noreferrer" target=3D"_blank">crates.io/bzip2/0=
.5.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/bzip2-sys/0.1.13+1.0.8" rel=3D"noreferrer" target=3D"_blank">crates=
.io/bzip2-sys/0.1.13+1.0.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cab/0.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cab/0.6.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/camino/1.1.9" rel=3D"noreferrer" target=3D"_blank">crates.io/camino=
/1.1.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cargo-config2/0.1.26" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/cargo-config2/0.1.26</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cargo-options/0.7.4" rel=3D"noreferrer" target=3D"_blank">crates.io=
/cargo-options/0.7.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cargo-platform/0.1.8" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/cargo-platform/0.1.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cargo-xwin/0.18.4" rel=3D"noreferrer" target=3D"_blank">crates.io/c=
argo-xwin/0.18.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cargo-zigbuild/0.20.0" rel=3D"noreferrer" target=3D"_blank">crates.=
io/cargo-zigbuild/0.20.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cargo_metadata/0.19.0" rel=3D"noreferrer" target=3D"_blank">crates.=
io/cargo_metadata/0.19.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cbindgen/0.28.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cbi=
ndgen/0.28.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cc/1.2.16" rel=3D"noreferrer" target=3D"_blank">crates.io/cc/1.2.16=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cfb/0.10.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cfb/0.10=
.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cfg-if/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/cfg-if=
/1.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/charset/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io/chars=
et/0.1.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/chumsky/0.9.3" rel=3D"noreferrer" target=3D"_blank">crates.io/chums=
ky/0.9.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/clap/4.5.7" rel=3D"noreferrer" target=3D"_blank">crates.io/clap/4.5=
.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/clap_builder/4.5.7" rel=3D"noreferrer" target=3D"_blank">crates.io/=
clap_builder/4.5.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/clap_complete/4.5.5" rel=3D"noreferrer" target=3D"_blank">crates.io=
/clap_complete/4.5.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/clap_complete_command/0.6.1" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/clap_complete_command/0.6.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/clap_complete_nushell/4.5.2" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/clap_complete_nushell/4.5.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/clap_derive/4.5.5" rel=3D"noreferrer" target=3D"_blank">crates.io/c=
lap_derive/4.5.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/clap_lex/0.7.1" rel=3D"noreferrer" target=3D"_blank">crates.io/clap=
_lex/0.7.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cli-table/0.4.7" rel=3D"noreferrer" target=3D"_blank">crates.io/cli=
-table/0.4.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/colorchoice/1.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/c=
olorchoice/1.0.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/configparser/3.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
configparser/3.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/console/0.15.8" rel=3D"noreferrer" target=3D"_blank">crates.io/cons=
ole/0.15.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/content_inspector/0.2.4" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/content_inspector/0.2.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/core-foundation/0.9.4" rel=3D"noreferrer" target=3D"_blank">crates.=
io/core-foundation/0.9.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/core-foundation-sys/0.8.6" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/core-foundation-sys/0.8.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/cpufeatures/0.2.12" rel=3D"noreferrer" target=3D"_blank">crates.io/=
cpufeatures/0.2.12</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crc/3.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/crc/3.2.1=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crc-catalog/2.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/c=
rc-catalog/2.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crc32fast/1.4.2" rel=3D"noreferrer" target=3D"_blank">crates.io/crc=
32fast/1.4.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crossbeam-channel/0.5.15" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/crossbeam-channel/0.5.15</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crossbeam-deque/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.=
io/crossbeam-deque/0.8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crossbeam-epoch/0.9.18" rel=3D"noreferrer" target=3D"_blank">crates=
.io/crossbeam-epoch/0.9.18</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crossbeam-utils/0.8.20" rel=3D"noreferrer" target=3D"_blank">crates=
.io/crossbeam-utils/0.8.20</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/crypto-common/0.1.6" rel=3D"noreferrer" target=3D"_blank">crates.io=
/crypto-common/0.1.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/data-encoding/2.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/data-encoding/2.6.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/deranged/0.3.11" rel=3D"noreferrer" target=3D"_blank">crates.io/der=
anged/0.3.11</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/derive_arbitrary/1.4.1" rel=3D"noreferrer" target=3D"_blank">crates=
.io/derive_arbitrary/1.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/dialoguer/0.11.0" rel=3D"noreferrer" target=3D"_blank">crates.io/di=
aloguer/0.11.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/diff/0.1.13" rel=3D"noreferrer" target=3D"_blank">crates.io/diff/0.=
1.13</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/digest/0.10.7" rel=3D"noreferrer" target=3D"_blank">crates.io/diges=
t/0.10.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/dirs/5.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/dirs/5.0=
.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/dirs-sys/0.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io/dirs=
-sys/0.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/displaydoc/0.2.5" rel=3D"noreferrer" target=3D"_blank">crates.io/di=
splaydoc/0.2.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/dissimilar/1.0.9" rel=3D"noreferrer" target=3D"_blank">crates.io/di=
ssimilar/1.0.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/dunce/1.0.5" rel=3D"noreferrer" target=3D"_blank">crates.io/dunce/1=
.0.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/dyn-clone/1.0.17" rel=3D"noreferrer" target=3D"_blank">crates.io/dy=
n-clone/1.0.17</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/either/1.13.0" rel=3D"noreferrer" target=3D"_blank">crates.io/eithe=
r/1.13.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/encode_unicode/0.3.6" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/encode_unicode/0.3.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/encoding_rs/0.8.34" rel=3D"noreferrer" target=3D"_blank">crates.io/=
encoding_rs/0.8.34</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/equivalent/1.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/eq=
uivalent/1.0.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/errno/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/errno/0=
.3.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/expect-test/1.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/e=
xpect-test/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/fastrand/2.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/fast=
rand/2.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/fat-macho/0.4.9" rel=3D"noreferrer" target=3D"_blank">crates.io/fat=
-macho/0.4.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/filetime/0.2.23" rel=3D"noreferrer" target=3D"_blank">crates.io/fil=
etime/0.2.23</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/flate2/1.0.33" rel=3D"noreferrer" target=3D"_blank">crates.io/flate=
2/1.0.33</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/fnv/1.0.7" rel=3D"noreferrer" target=3D"_blank">crates.io/fnv/1.0.7=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/foreign-types/0.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io=
/foreign-types/0.3.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/foreign-types-shared/0.1.1" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/foreign-types-shared/0.1.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/form_urlencoded/1.2.1" rel=3D"noreferrer" target=3D"_blank">crates.=
io/form_urlencoded/1.2.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/fs-err/3.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/fs-err=
/3.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/fs4/0.12.0" rel=3D"noreferrer" target=3D"_blank">crates.io/fs4/0.12=
.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures/0.3.30" rel=3D"noreferrer" target=3D"_blank">crates.io/futu=
res/0.3.30</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-channel/0.3.31" rel=3D"noreferrer" target=3D"_blank">crates=
.io/futures-channel/0.3.31</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-core/0.3.31" rel=3D"noreferrer" target=3D"_blank">crates.io=
/futures-core/0.3.31</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-executor/0.3.30" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/futures-executor/0.3.30</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-io/0.3.31" rel=3D"noreferrer" target=3D"_blank">crates.io/f=
utures-io/0.3.31</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-macro/0.3.31" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/futures-macro/0.3.31</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-sink/0.3.31" rel=3D"noreferrer" target=3D"_blank">crates.io=
/futures-sink/0.3.31</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-task/0.3.31" rel=3D"noreferrer" target=3D"_blank">crates.io=
/futures-task/0.3.31</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-timer/3.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io=
/futures-timer/3.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/futures-util/0.3.31" rel=3D"noreferrer" target=3D"_blank">crates.io=
/futures-util/0.3.31</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/generic-array/0.14.7" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/generic-array/0.14.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/getrandom/0.2.15" rel=3D"noreferrer" target=3D"_blank">crates.io/ge=
trandom/0.2.15</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/glob/0.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/glob/0.3=
.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/globset/0.4.15" rel=3D"noreferrer" target=3D"_blank">crates.io/glob=
set/0.4.15</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/goblin/0.9.2" rel=3D"noreferrer" target=3D"_blank">crates.io/goblin=
/0.9.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/hashbrown/0.14.5" rel=3D"noreferrer" target=3D"_blank">crates.io/ha=
shbrown/0.14.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/hashbrown/0.15.2" rel=3D"noreferrer" target=3D"_blank">crates.io/ha=
shbrown/0.15.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/heck/0.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io/heck/0.4=
.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/heck/0.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/heck/0.5=
.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/home/0.5.9" rel=3D"noreferrer" target=3D"_blank">crates.io/home/0.5=
.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/humantime/2.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/hum=
antime/2.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/humantime-serde/1.1.1" rel=3D"noreferrer" target=3D"_blank">crates.=
io/humantime-serde/1.1.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_collections/1.5.0" rel=3D"noreferrer" target=3D"_blank">crates.=
io/icu_collections/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_locid/1.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/icu=
_locid/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_locid_transform/1.5.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/icu_locid_transform/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_locid_transform_data/1.5.0" rel=3D"noreferrer" target=3D"_blank=
">crates.io/icu_locid_transform_data/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_normalizer/1.5.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/icu_normalizer/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_normalizer_data/1.5.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/icu_normalizer_data/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_properties/1.5.1" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/icu_properties/1.5.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_properties_data/1.5.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/icu_properties_data/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_provider/1.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
icu_provider/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/icu_provider_macros/1.5.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/icu_provider_macros/1.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/idna/1.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/idna/1.0=
.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/idna_adapter/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
idna_adapter/1.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/ignore/0.4.23" rel=3D"noreferrer" target=3D"_blank">crates.io/ignor=
e/0.4.23</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/indexmap/2.6.0" rel=3D"noreferrer" target=3D"_blank">crates.io/inde=
xmap/2.6.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/indicatif/0.17.9" rel=3D"noreferrer" target=3D"_blank">crates.io/in=
dicatif/0.17.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/indoc/2.0.5" rel=3D"noreferrer" target=3D"_blank">crates.io/indoc/2=
.0.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/is_terminal_polyfill/1.70.0" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/is_terminal_polyfill/1.70.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/itertools/0.12.1" rel=3D"noreferrer" target=3D"_blank">crates.io/it=
ertools/0.12.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/itertools/0.13.0" rel=3D"noreferrer" target=3D"_blank">crates.io/it=
ertools/0.13.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/itoa/1.0.11" rel=3D"noreferrer" target=3D"_blank">crates.io/itoa/1.=
0.11</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/js-sys/0.3.73" rel=3D"noreferrer" target=3D"_blank">crates.io/js-sy=
s/0.3.73</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/keyring/2.3.3" rel=3D"noreferrer" target=3D"_blank">crates.io/keyri=
ng/2.3.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/lazy_static/1.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io/l=
azy_static/1.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/lddtree/0.3.7" rel=3D"noreferrer" target=3D"_blank">crates.io/lddtr=
ee/0.3.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/libc/0.2.167" rel=3D"noreferrer" target=3D"_blank">crates.io/libc/0=
.2.167</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/libmimalloc-sys/0.1.39" rel=3D"noreferrer" target=3D"_blank">crates=
.io/libmimalloc-sys/0.1.39</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/libredox/0.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/libr=
edox/0.1.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/linux-keyutils/0.2.4" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/linux-keyutils/0.2.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/linux-raw-sys/0.4.14" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/linux-raw-sys/0.4.14</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/litemap/0.7.3" rel=3D"noreferrer" target=3D"_blank">crates.io/litem=
ap/0.7.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/lock_api/0.4.12" rel=3D"noreferrer" target=3D"_blank">crates.io/loc=
k_api/0.4.12</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/lockfree-object-pool/0.1.6" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/lockfree-object-pool/0.1.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/log/0.4.22" rel=3D"noreferrer" target=3D"_blank">crates.io/log/0.4.=
22</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/lzma-sys/0.1.20" rel=3D"noreferrer" target=3D"_blank">crates.io/lzm=
a-sys/0.1.20</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/lzxd/0.2.5" rel=3D"noreferrer" target=3D"_blank">crates.io/lzxd/0.2=
.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/mailparse/0.15.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ma=
ilparse/0.15.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/matchers/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/matc=
hers/0.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/memchr/2.7.4" rel=3D"noreferrer" target=3D"_blank">crates.io/memchr=
/2.7.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/mimalloc/0.1.43" rel=3D"noreferrer" target=3D"_blank">crates.io/mim=
alloc/0.1.43</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/mime/0.3.17" rel=3D"noreferrer" target=3D"_blank">crates.io/mime/0.=
3.17</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/mime_guess/2.0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/mi=
me_guess/2.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/minijinja/2.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/min=
ijinja/2.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/minimal-lexical/0.2.1" rel=3D"noreferrer" target=3D"_blank">crates.=
io/minimal-lexical/0.2.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/miniz_oxide/0.8.0" rel=3D"noreferrer" target=3D"_blank">crates.io/m=
iniz_oxide/0.8.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/msi/0.8.0" rel=3D"noreferrer" target=3D"_blank">crates.io/msi/0.8.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/multipart/0.18.0" rel=3D"noreferrer" target=3D"_blank">crates.io/mu=
ltipart/0.18.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/native-tls/0.2.12" rel=3D"noreferrer" target=3D"_blank">crates.io/n=
ative-tls/0.2.12</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/nom/7.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/nom/7.1.3=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/normalize-line-endings/0.3.0" rel=3D"noreferrer" target=3D"_blank">=
crates.io/normalize-line-endings/0.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/normpath/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/norm=
path/1.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/nu-ansi-term/0.46.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/nu-ansi-term/0.46.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/num-conv/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/num-=
conv/0.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/number_prefix/0.4.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/number_prefix/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/once_cell/1.20.2" rel=3D"noreferrer" target=3D"_blank">crates.io/on=
ce_cell/1.20.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/openssl/0.10.72" rel=3D"noreferrer" target=3D"_blank">crates.io/ope=
nssl/0.10.72</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/openssl-macros/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/openssl-macros/0.1.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/openssl-probe/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.io=
/openssl-probe/0.1.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/openssl-sys/0.9.107" rel=3D"noreferrer" target=3D"_blank">crates.io=
/openssl-sys/0.9.107</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/option-ext/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/op=
tion-ext/0.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/os_pipe/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/os_pi=
pe/1.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/overload/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.io/over=
load/0.1.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/parking_lot/0.12.3" rel=3D"noreferrer" target=3D"_blank">crates.io/=
parking_lot/0.12.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/parking_lot_core/0.9.10" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/parking_lot_core/0.9.10</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/paste/1.0.15" rel=3D"noreferrer" target=3D"_blank">crates.io/paste/=
1.0.15</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/path-slash/0.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/pa=
th-slash/0.2.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/pep440_rs/0.7.3" rel=3D"noreferrer" target=3D"_blank">crates.io/pep=
440_rs/0.7.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/pep508_rs/0.9.2" rel=3D"noreferrer" target=3D"_blank">crates.io/pep=
508_rs/0.9.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/percent-encoding/2.3.1" rel=3D"noreferrer" target=3D"_blank">crates=
.io/percent-encoding/2.3.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/pin-project-lite/0.2.15" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/pin-project-lite/0.2.15</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/pin-utils/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/pin=
-utils/0.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/pkg-config/0.3.30" rel=3D"noreferrer" target=3D"_blank">crates.io/p=
kg-config/0.3.30</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/plain/0.2.3" rel=3D"noreferrer" target=3D"_blank">crates.io/plain/0=
.2.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/platform-info/2.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io=
/platform-info/2.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/portable-atomic/1.6.0" rel=3D"noreferrer" target=3D"_blank">crates.=
io/portable-atomic/1.6.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/powerfmt/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/powe=
rfmt/0.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/ppv-lite86/0.2.17" rel=3D"noreferrer" target=3D"_blank">crates.io/p=
pv-lite86/0.2.17</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/pretty_assertions/1.4.1" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/pretty_assertions/1.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/proc-macro-crate/3.1.0" rel=3D"noreferrer" target=3D"_blank">crates=
.io/proc-macro-crate/3.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/proc-macro2/1.0.92" rel=3D"noreferrer" target=3D"_blank">crates.io/=
proc-macro2/1.0.92</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/psm/0.1.21" rel=3D"noreferrer" target=3D"_blank">crates.io/psm/0.1.=
21</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/pyproject-toml/0.13.4" rel=3D"noreferrer" target=3D"_blank">crates.=
io/pyproject-toml/0.13.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/python-pkginfo/0.6.5" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/python-pkginfo/0.6.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/quote/1.0.37" rel=3D"noreferrer" target=3D"_blank">crates.io/quote/=
1.0.37</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/quoted_printable/0.5.0" rel=3D"noreferrer" target=3D"_blank">crates=
.io/quoted_printable/0.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rand/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/rand/0.8=
.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rand_chacha/0.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/r=
and_chacha/0.3.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rand_core/0.6.4" rel=3D"noreferrer" target=3D"_blank">crates.io/ran=
d_core/0.6.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rayon/1.10.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rayon/=
1.10.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rayon-core/1.12.1" rel=3D"noreferrer" target=3D"_blank">crates.io/r=
ayon-core/1.12.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/redox_syscall/0.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io=
/redox_syscall/0.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/redox_syscall/0.5.1" rel=3D"noreferrer" target=3D"_blank">crates.io=
/redox_syscall/0.5.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/redox_users/0.4.5" rel=3D"noreferrer" target=3D"_blank">crates.io/r=
edox_users/0.4.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/regex/1.11.1" rel=3D"noreferrer" target=3D"_blank">crates.io/regex/=
1.11.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/regex-automata/0.1.10" rel=3D"noreferrer" target=3D"_blank">crates.=
io/regex-automata/0.1.10</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/regex-automata/0.4.9" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/regex-automata/0.4.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/regex-syntax/0.6.29" rel=3D"noreferrer" target=3D"_blank">crates.io=
/regex-syntax/0.6.29</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/regex-syntax/0.8.5" rel=3D"noreferrer" target=3D"_blank">crates.io/=
regex-syntax/0.8.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/relative-path/1.9.3" rel=3D"noreferrer" target=3D"_blank">crates.io=
/relative-path/1.9.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rfc2047-decoder/1.0.6" rel=3D"noreferrer" target=3D"_blank">crates.=
io/rfc2047-decoder/1.0.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/ring/0.17.13" rel=3D"noreferrer" target=3D"_blank">crates.io/ring/0=
.17.13</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rstest/0.22.0" rel=3D"noreferrer" target=3D"_blank">crates.io/rstes=
t/0.22.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rstest_macros/0.22.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/rstest_macros/0.22.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustc-hash/2.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ru=
stc-hash/2.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustc_version/0.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io=
/rustc_version/0.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustflags/0.1.6" rel=3D"noreferrer" target=3D"_blank">crates.io/rus=
tflags/0.1.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustix/0.38.41" rel=3D"noreferrer" target=3D"_blank">crates.io/rust=
ix/0.38.41</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustls/0.23.19" rel=3D"noreferrer" target=3D"_blank">crates.io/rust=
ls/0.23.19</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustls-pemfile/2.1.3" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/rustls-pemfile/2.1.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustls-pki-types/1.10.0" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/rustls-pki-types/1.10.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustls-webpki/0.102.8" rel=3D"noreferrer" target=3D"_blank">crates.=
io/rustls-webpki/0.102.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/rustversion/1.0.18" rel=3D"noreferrer" target=3D"_blank">crates.io/=
rustversion/1.0.18</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/ryu/1.0.18" rel=3D"noreferrer" target=3D"_blank">crates.io/ryu/1.0.=
18</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/same-file/1.0.6" rel=3D"noreferrer" target=3D"_blank">crates.io/sam=
e-file/1.0.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/schannel/0.1.23" rel=3D"noreferrer" target=3D"_blank">crates.io/sch=
annel/0.1.23</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/schemars/0.8.21" rel=3D"noreferrer" target=3D"_blank">crates.io/sch=
emars/0.8.21</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/schemars_derive/0.8.21" rel=3D"noreferrer" target=3D"_blank">crates=
.io/schemars_derive/0.8.21</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/scopeguard/1.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/sc=
opeguard/1.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/scroll/0.12.0" rel=3D"noreferrer" target=3D"_blank">crates.io/scrol=
l/0.12.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/scroll_derive/0.12.0" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/scroll_derive/0.12.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/security-framework/2.11.0" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/security-framework/2.11.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/security-framework-sys/2.11.0" rel=3D"noreferrer" target=3D"_blank"=
>crates.io/security-framework-sys/2.11.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/semver/1.0.23" rel=3D"noreferrer" target=3D"_blank">crates.io/semve=
r/1.0.23</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/serde/1.0.217" rel=3D"noreferrer" target=3D"_blank">crates.io/serde=
/1.0.217</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/serde_derive/1.0.217" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/serde_derive/1.0.217</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/serde_derive_internals/0.29.1" rel=3D"noreferrer" target=3D"_blank"=
>crates.io/serde_derive_internals/0.29.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/serde_json/1.0.135" rel=3D"noreferrer" target=3D"_blank">crates.io/=
serde_json/1.0.135</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/serde_spanned/0.6.8" rel=3D"noreferrer" target=3D"_blank">crates.io=
/serde_spanned/0.6.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/sha2/0.10.8" rel=3D"noreferrer" target=3D"_blank">crates.io/sha2/0.=
10.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/sharded-slab/0.1.7" rel=3D"noreferrer" target=3D"_blank">crates.io/=
sharded-slab/0.1.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/shell-words/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/s=
hell-words/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/shlex/1.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/shlex/1=
.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/simd-adler32/0.3.7" rel=3D"noreferrer" target=3D"_blank">crates.io/=
simd-adler32/0.3.7</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/similar/2.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/simil=
ar/2.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/slab/0.4.9" rel=3D"noreferrer" target=3D"_blank">crates.io/slab/0.4=
.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/smallvec/1.13.2" rel=3D"noreferrer" target=3D"_blank">crates.io/sma=
llvec/1.13.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/smawk/0.3.2" rel=3D"noreferrer" target=3D"_blank">crates.io/smawk/0=
.3.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/snapbox/0.6.16" rel=3D"noreferrer" target=3D"_blank">crates.io/snap=
box/0.6.16</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/snapbox-macros/0.3.10" rel=3D"noreferrer" target=3D"_blank">crates.=
io/snapbox-macros/0.3.10</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/socks/0.3.4" rel=3D"noreferrer" target=3D"_blank">crates.io/socks/0=
.3.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/stable_deref_trait/1.2.0" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/stable_deref_trait/1.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/stacker/0.1.15" rel=3D"noreferrer" target=3D"_blank">crates.io/stac=
ker/0.1.15</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/static_assertions/1.1.0" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/static_assertions/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/strsim/0.11.1" rel=3D"noreferrer" target=3D"_blank">crates.io/strsi=
m/0.11.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/subtle/2.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/subtle=
/2.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/syn/2.0.90" rel=3D"noreferrer" target=3D"_blank">crates.io/syn/2.0.=
90</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/synstructure/0.13.1" rel=3D"noreferrer" target=3D"_blank">crates.io=
/synstructure/0.13.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tar/0.4.43" rel=3D"noreferrer" target=3D"_blank">crates.io/tar/0.4.=
43</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/target-lexicon/0.13.1" rel=3D"noreferrer" target=3D"_blank">crates.=
io/target-lexicon/0.13.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tempfile/3.11.0" rel=3D"noreferrer" target=3D"_blank">crates.io/tem=
pfile/3.11.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/termcolor/1.4.1" rel=3D"noreferrer" target=3D"_blank">crates.io/ter=
mcolor/1.4.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/terminal_size/0.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/terminal_size/0.3.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/textwrap/0.16.1" rel=3D"noreferrer" target=3D"_blank">crates.io/tex=
twrap/0.16.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/thiserror/1.0.69" rel=3D"noreferrer" target=3D"_blank">crates.io/th=
iserror/1.0.69</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/thiserror/2.0.3" rel=3D"noreferrer" target=3D"_blank">crates.io/thi=
serror/2.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/thiserror-impl/1.0.69" rel=3D"noreferrer" target=3D"_blank">crates.=
io/thiserror-impl/1.0.69</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/thiserror-impl/2.0.3" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/thiserror-impl/2.0.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/thread_local/1.1.8" rel=3D"noreferrer" target=3D"_blank">crates.io/=
thread_local/1.1.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/time/0.3.36" rel=3D"noreferrer" target=3D"_blank">crates.io/time/0.=
3.36</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/time-core/0.1.2" rel=3D"noreferrer" target=3D"_blank">crates.io/tim=
e-core/0.1.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/time-macros/0.2.18" rel=3D"noreferrer" target=3D"_blank">crates.io/=
time-macros/0.2.18</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tinystr/0.7.6" rel=3D"noreferrer" target=3D"_blank">crates.io/tinys=
tr/0.7.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/toml/0.8.19" rel=3D"noreferrer" target=3D"_blank">crates.io/toml/0.=
8.19</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/toml_datetime/0.6.8" rel=3D"noreferrer" target=3D"_blank">crates.io=
/toml_datetime/0.6.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/toml_edit/0.21.1" rel=3D"noreferrer" target=3D"_blank">crates.io/to=
ml_edit/0.21.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/toml_edit/0.22.22" rel=3D"noreferrer" target=3D"_blank">crates.io/t=
oml_edit/0.22.22</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tracing/0.1.41" rel=3D"noreferrer" target=3D"_blank">crates.io/trac=
ing/0.1.41</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tracing-attributes/0.1.28" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/tracing-attributes/0.1.28</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tracing-core/0.1.33" rel=3D"noreferrer" target=3D"_blank">crates.io=
/tracing-core/0.1.33</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tracing-log/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/t=
racing-log/0.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tracing-serde/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/tracing-serde/0.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/tracing-subscriber/0.3.19" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/tracing-subscriber/0.3.19</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/trycmd/0.15.6" rel=3D"noreferrer" target=3D"_blank">crates.io/trycm=
d/0.15.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/twox-hash/1.6.3" rel=3D"noreferrer" target=3D"_blank">crates.io/two=
x-hash/1.6.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/typenum/1.17.0" rel=3D"noreferrer" target=3D"_blank">crates.io/type=
num/1.17.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/unicase/2.7.0" rel=3D"noreferrer" target=3D"_blank">crates.io/unica=
se/2.7.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/unicode-ident/1.0.12" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/unicode-ident/1.0.12</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/unicode-linebreak/0.1.5" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/unicode-linebreak/0.1.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/unicode-width/0.1.13" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/unicode-width/0.1.13</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/unicode-width/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io=
/unicode-width/0.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/unicode-xid/0.2.6" rel=3D"noreferrer" target=3D"_blank">crates.io/u=
nicode-xid/0.2.6</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/unscanny/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/unsc=
anny/0.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/untrusted/0.9.0" rel=3D"noreferrer" target=3D"_blank">crates.io/unt=
rusted/0.9.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/ureq/2.11.0" rel=3D"noreferrer" target=3D"_blank">crates.io/ureq/2.=
11.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/url/2.5.4" rel=3D"noreferrer" target=3D"_blank">crates.io/url/2.5.4=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/urlencoding/2.1.3" rel=3D"noreferrer" target=3D"_blank">crates.io/u=
rlencoding/2.1.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/utf16_iter/1.0.5" rel=3D"noreferrer" target=3D"_blank">crates.io/ut=
f16_iter/1.0.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/utf8_iter/1.0.4" rel=3D"noreferrer" target=3D"_blank">crates.io/utf=
8_iter/1.0.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/utf8parse/0.2.2" rel=3D"noreferrer" target=3D"_blank">crates.io/utf=
8parse/0.2.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/uuid/1.8.0" rel=3D"noreferrer" target=3D"_blank">crates.io/uuid/1.8=
.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/valuable/0.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/valu=
able/0.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/vcpkg/0.2.15" rel=3D"noreferrer" target=3D"_blank">crates.io/vcpkg/=
0.2.15</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/version-ranges/0.1.1" rel=3D"noreferrer" target=3D"_blank">crates.i=
o/version-ranges/0.1.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/version_check/0.9.4" rel=3D"noreferrer" target=3D"_blank">crates.io=
/version_check/0.9.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/versions/6.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/vers=
ions/6.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wait-timeout/0.2.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
wait-timeout/0.2.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/walkdir/2.5.0" rel=3D"noreferrer" target=3D"_blank">crates.io/walkd=
ir/2.5.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wasi/0.11.0+wasi-snapshot-preview1" rel=3D"noreferrer" target=3D"_b=
lank">crates.io/wasi/0.11.0+wasi-snapshot-preview1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wasm-bindgen/0.2.96" rel=3D"noreferrer" target=3D"_blank">crates.io=
/wasm-bindgen/0.2.96</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wasm-bindgen-backend/0.2.96" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/wasm-bindgen-backend/0.2.96</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wasm-bindgen-macro/0.2.96" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/wasm-bindgen-macro/0.2.96</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wasm-bindgen-macro-support/0.2.96" rel=3D"noreferrer" target=3D"_bl=
ank">crates.io/wasm-bindgen-macro-support/0.2.96</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wasm-bindgen-shared/0.2.96" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/wasm-bindgen-shared/0.2.96</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/web-time/1.1.0" rel=3D"noreferrer" target=3D"_blank">crates.io/web-=
time/1.1.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/webpki-roots/0.26.2" rel=3D"noreferrer" target=3D"_blank">crates.io=
/webpki-roots/0.26.2</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/which/7.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/which/7=
.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/wild/2.2.1" rel=3D"noreferrer" target=3D"_blank">crates.io/wild/2.2=
.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/winapi/0.3.9" rel=3D"noreferrer" target=3D"_blank">crates.io/winapi=
/0.3.9</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/winapi-i686-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_bla=
nk">crates.io/winapi-i686-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/winapi-util/0.1.8" rel=3D"noreferrer" target=3D"_blank">crates.io/w=
inapi-util/0.1.8</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/winapi-x86_64-pc-windows-gnu/0.4.0" rel=3D"noreferrer" target=3D"_b=
lank">crates.io/winapi-x86_64-pc-windows-gnu/0.4.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows-sys/0.48.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
windows-sys/0.48.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows-sys/0.52.0" rel=3D"noreferrer" target=3D"_blank">crates.io/=
windows-sys/0.52.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows-targets/0.48.5" rel=3D"noreferrer" target=3D"_blank">crates=
.io/windows-targets/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows-targets/0.52.5" rel=3D"noreferrer" target=3D"_blank">crates=
.io/windows-targets/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_aarch64_gnullvm/0.48.5" rel=3D"noreferrer" target=3D"_blank=
">crates.io/windows_aarch64_gnullvm/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_aarch64_gnullvm/0.52.5" rel=3D"noreferrer" target=3D"_blank=
">crates.io/windows_aarch64_gnullvm/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_aarch64_msvc/0.48.5" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/windows_aarch64_msvc/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_aarch64_msvc/0.52.5" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/windows_aarch64_msvc/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_i686_gnu/0.48.5" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/windows_i686_gnu/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_i686_gnu/0.52.5" rel=3D"noreferrer" target=3D"_blank">crate=
s.io/windows_i686_gnu/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_i686_gnullvm/0.52.5" rel=3D"noreferrer" target=3D"_blank">c=
rates.io/windows_i686_gnullvm/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_i686_msvc/0.48.5" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/windows_i686_msvc/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_i686_msvc/0.52.5" rel=3D"noreferrer" target=3D"_blank">crat=
es.io/windows_i686_msvc/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_x86_64_gnu/0.48.5" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/windows_x86_64_gnu/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_x86_64_gnu/0.52.5" rel=3D"noreferrer" target=3D"_blank">cra=
tes.io/windows_x86_64_gnu/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_x86_64_gnullvm/0.48.5" rel=3D"noreferrer" target=3D"_blank"=
>crates.io/windows_x86_64_gnullvm/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_x86_64_gnullvm/0.52.5" rel=3D"noreferrer" target=3D"_blank"=
>crates.io/windows_x86_64_gnullvm/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_x86_64_msvc/0.48.5" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/windows_x86_64_msvc/0.48.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/windows_x86_64_msvc/0.52.5" rel=3D"noreferrer" target=3D"_blank">cr=
ates.io/windows_x86_64_msvc/0.52.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/winnow/0.5.40" rel=3D"noreferrer" target=3D"_blank">crates.io/winno=
w/0.5.40</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/winnow/0.6.20" rel=3D"noreferrer" target=3D"_blank">crates.io/winno=
w/0.6.20</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/winsafe/0.0.19" rel=3D"noreferrer" target=3D"_blank">crates.io/wins=
afe/0.0.19</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/write16/1.0.0" rel=3D"noreferrer" target=3D"_blank">crates.io/write=
16/1.0.0</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/writeable/0.5.5" rel=3D"noreferrer" target=3D"_blank">crates.io/wri=
teable/0.5.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/xattr/1.3.1" rel=3D"noreferrer" target=3D"_blank">crates.io/xattr/1=
.3.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/xwin/0.6.5" rel=3D"noreferrer" target=3D"_blank">crates.io/xwin/0.6=
.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/xz2/0.1.7" rel=3D"noreferrer" target=3D"_blank">crates.io/xz2/0.1.7=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/yansi/1.0.1" rel=3D"noreferrer" target=3D"_blank">crates.io/yansi/1=
.0.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/yoke/0.7.4" rel=3D"noreferrer" target=3D"_blank">crates.io/yoke/0.7=
.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/yoke-derive/0.7.5" rel=3D"noreferrer" target=3D"_blank">crates.io/y=
oke-derive/0.7.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zerocopy/0.7.35" rel=3D"noreferrer" target=3D"_blank">crates.io/zer=
ocopy/0.7.35</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zerocopy-derive/0.7.35" rel=3D"noreferrer" target=3D"_blank">crates=
.io/zerocopy-derive/0.7.35</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zerofrom/0.1.4" rel=3D"noreferrer" target=3D"_blank">crates.io/zero=
from/0.1.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zerofrom-derive/0.1.5" rel=3D"noreferrer" target=3D"_blank">crates.=
io/zerofrom-derive/0.1.5</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zeroize/1.8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/zeroi=
ze/1.8.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zerovec/0.10.4" rel=3D"noreferrer" target=3D"_blank">crates.io/zero=
vec/0.10.4</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zerovec-derive/0.10.3" rel=3D"noreferrer" target=3D"_blank">crates.=
io/zerovec-derive/0.10.3</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zip/2.3.0" rel=3D"noreferrer" target=3D"_blank">crates.io/zip/2.3.0=
</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crate://<a href=3D"http://cr=
ates.io/zopfli/0.8.1" rel=3D"noreferrer" target=3D"_blank">crates.io/zopfli=
/0.8.1</a> \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250cca=
a29c1aa8d0e61fa664b0289d&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/maturin-${PV}&quot;<br>
&gt; +<br>
&gt; +CFLAGS +=3D &quot;-ffile-prefix-map=3D${CARGO_HOME}=3D${TARGET_DBGSRC=
_DIR}/cargo_home&quot;<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 python3-setuptools-rust-native \<br>
&gt; +=C2=A0 =C2=A0 python3-semantic-version-native \<br>
&gt; +=C2=A0 =C2=A0 python3-setuptools-rust \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +require ${BPN}-crates.inc<br>
&gt; +<br>
&gt; +inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools=
_build_meta<br>
&gt; +<br>
&gt; +do_configure() {<br>
&gt; +=C2=A0 =C2=A0 python_pyo3_do_configure<br>
&gt; +=C2=A0 =C2=A0 cargo_common_do_configure<br>
&gt; +=C2=A0 =C2=A0 python_pep517_do_configure<br>
&gt; +}<br>
&gt; +<br>
&gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 cargo \<br>
&gt; +=C2=A0 =C2=A0 python3-json \<br>
&gt; +=C2=A0 =C2=A0 rust \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +RRECOMMENDS:${PN} +=3D &quot;\<br>
&gt; +=C2=A0 =C2=A0 python3-ensurepip \<br>
&gt; +=C2=A0 =C2=A0 python3-pip \<br>
&gt; +=C2=A0 =C2=A0 python3-venv \<br>
&gt; +&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#217680): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/217680" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/217680</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11341917=
2/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/113419172/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--000000000000e61cfa0636984a37--

