Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EEAC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 07:39:19 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.20076.1744357150084453068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 00:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m0cMVL78;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549b116321aso1951890e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744357148; x=1744961948; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cArZXkzfk7yjH7ub4MNn/eL/SrmVMMCgV5tm7od1iuE=;
        b=m0cMVL782MXCkffTORsPg0oRPyOYjoT7mhpgapFB34QwEV18dY26BOApE80esp3g2b
         P/IVILLjVMxxfDLTxP+vHGRVM4qTHBC5Wyauztnn+0H414NbdxSyStLHWYFIRGuVlb5z
         +u59oB/7yoUc0XqjYmNP4SbZ8L5EhoRk5BIzSLLd7g0tPY92j4x9H86YcGmgwJtJEpYc
         PV1PUsHwjZyAITKqkKPh4R6E3b2wRQoG4AGyXU3RSPuyQWg4CByd1A8LrP3aBJ7yidL1
         DjRX5kmPGMNMKwQj1I2rGrK/5faqogoWkRbrCksgWJ1/o8lUQ+o5DeQQwg7Rh+3pla6Y
         2HtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744357148; x=1744961948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cArZXkzfk7yjH7ub4MNn/eL/SrmVMMCgV5tm7od1iuE=;
        b=fADH03eRnaY0Wk1iSUQsfGF3H9PVmLzOHk2akWxbVvxGLj5nExMABEAkjjt9d8c0TB
         atqEVGdeHiv3ZdYWXeNbau+mELZmMMdMxwhwPtQSw9DBA3107uw/XDGj1f7sVoBqps4k
         Ea3+iksbml+pN2M6pTHo7n1CwVmDwClLOkteyUYuvCmo940scLbN7Lmp9Ufap2NT680B
         tQolIkWbaf50Zw5FIKssX5e5ZK8vkBihNaktrKU7HJjMcnUOCsRtNMYgOaAjweayiq/q
         TaSDE5pwVCdPMM4pZ7u9AtGYEaQqFPt+KfGCFaZRsVJi3MpEBHrJmmQjHetrQbEwuypA
         5JUA==
X-Forwarded-Encrypted: i=1; AJvYcCU26y25CaCnuvIBLcQ8rAt21F8C4CIGHugBqFoR77K6F4gj4vr+iLfRByH8KwNXJHclFeC8lwVy6QMdQij3nAwq2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxGllp2YqdGSTJqYqSVjatO7sKmCmBBAMoaGHYcrHlviH4aUbPD
	IFgNhVTNYJgs84EqQVMu0kmsCSFldNzdSNXFdRgnCrPqBFCaaRMt4jIAI+anZGQmkret3DZB1uP
	8CSN+DZKbQ+OAzrBWjxRWt9Fp+4k=
X-Gm-Gg: ASbGncufrltmF8dsJLXWf9aMXK8lbrnBeAFT/GdO9KCrQXpo5u43AdvRU1m7fYr/+ly
	bd1pvUpbFnnzaDh2Wlf2/RrvJiuygrqXDYtTkwYehXlqCsrvQ9Xj1C43s4l97us68y7Vn2DTgv6
	GY1jk5SM6L06ePCXDO9joKVyWq
X-Google-Smtp-Source: AGHT+IHCZxh6or5qtOoCzlMWewz+AV7DETGPTuEh4OqcKTJnT9jjfO4p1Zm6Cpy6WTxj7yUbJcS28iB5TSY08Fj1q6Y=
X-Received: by 2002:a05:6512:6d2:b0:545:ae6:d73f with SMTP id
 2adb3069b0e04-54d452ca6b4mr517099e87.46.1744357147925; Fri, 11 Apr 2025
 00:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com> <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
In-Reply-To: <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 11 Apr 2025 09:38:54 +0200
X-Gm-Features: ATxdqUEX1veiO7YwXtJYc-T-BTBQDHuV9_i29OvrJbxJhaxIPicQbO6lWPATT6M
Message-ID: <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: raj.khem@gmail.com
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 07:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214715

On Mon, Mar 31, 2025 at 6:47=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sun, Mar 30, 2025 at 10:54=E2=80=AFPM Yash Shinde via
> lists.openembedded.org
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >
> > Rust stable version updated to 1.85.0
> > https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
> >
> > Some of the major updates:
> >
> > - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
> > License-Update: Unicode license text is updated to Unicode-3.0 License.
> > https://github.com/rust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e7046=
328296ac86
> >
> > - Pass '-Zforce-unstable-if-unmarked' to RUSTFLAGS in libstd-rs.bb
> > Fix: https://github.com/rust-lang/rust/issues/133857#issuecomment-25263=
41227
> >
> > - Downgrade bootstrap cc version causing bootstrap to fail on custom ta=
rgets. (Backported from v1.85.1)
> > Fix: https://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffc=
a8c63aa56d45b46e62b6acc58bd7
> >
> > - Explicitly set float ABI for all ARM 32 bits targets.
> > Fix: https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005=
b50982d0049d905
> >
> > - Rust v1.85.0 tarball doesn't ship gcc tree.
> > Drop "remove_gcc_directory" postfunc which removed it and prevented the=
 bloat.
> > Fix: https://github.com/rust-lang/rust/commit/13c3f9b9498013837782b4612=
0085ea19ca75518
> >
> > Adapted the patch changes with v1.85.0:
> >   repro-issue-fix-with-cc-crate-hashmap.patch
> >   revert-link-std-statically-in-rustc_driver-feature.patch
> >   rust-oe-selftest.patch
> >   rv32-cargo-rustix-0.38.40-fix.patch
> >
> > Dropped patches:
> >   fix-tidy-check-failure.patch since it's merged with v1.85.0.
> >
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > ---
> >  .../classes-recipe/rust-target-config.bbclass |   5 +
> >  meta/conf/distro/include/tcmode-default.inc   |   2 +-
> >  .../rust/{cargo_1.84.1.bb =3D> cargo_1.85.0.bb} |   0
> >  .../rust/files/downgrade-bootstrap-cc.patch   |  41 +++
> >  .../rust/files/fix-tidy-check-failure.patch   |  19 --
> >  ...epro-issue-fix-with-cc-crate-hashmap.patch |  60 ++++-
> >  ...d-statically-in-rustc_driver-feature.patch |   4 +-
> >  .../rust/files/rust-oe-selftest.patch         |  46 ++--
> >  .../files/rv32-cargo-rustix-0.38.38-fix.patch | 236 ------------------
> >  .../files/rv32-cargo-rustix-0.38.40-fix.patch | 236 ++++++++++++++++++
> >  ...ibstd-rs_1.84.1.bb =3D> libstd-rs_1.85.0.bb} |   4 +-
> >  ....84.1.bb =3D> rust-cross-canadian_1.85.0.bb} |   0
> >  ...ust-llvm_1.84.1.bb =3D> rust-llvm_1.85.0.bb} |   0
> >  meta/recipes-devtools/rust/rust-snapshot.inc  |  81 +++---
> >  meta/recipes-devtools/rust/rust-source.inc    |  23 +-
> >  .../rust/{rust_1.84.1.bb =3D> rust_1.85.0.bb}   |   2 +-
> >  16 files changed, 417 insertions(+), 342 deletions(-)
> >  rename meta/recipes-devtools/rust/{cargo_1.84.1.bb =3D> cargo_1.85.0.b=
b} (100%)
> >  create mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstra=
p-cc.patch
> >  delete mode 100644 meta/recipes-devtools/rust/files/fix-tidy-check-fai=
lure.patch
> >  delete mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-=
0.38.38-fix.patch
> >  create mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-=
0.38.40-fix.patch
> >  rename meta/recipes-devtools/rust/{libstd-rs_1.84.1.bb =3D> libstd-rs_=
1.85.0.bb} (88%)
> >  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.84.1.bb =3D> =
rust-cross-canadian_1.85.0.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust-llvm_1.84.1.bb =3D> rust-llvm_=
1.85.0.bb} (100%)
> >  rename meta/recipes-devtools/rust/{rust_1.84.1.bb =3D> rust_1.85.0.bb}=
 (99%)
> >
> > diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/clas=
ses-recipe/rust-target-config.bbclass
> > index 67aaa56bac..c04940ce54 100644
> > --- a/meta/classes-recipe/rust-target-config.bbclass
> > +++ b/meta/classes-recipe/rust-target-config.bbclass
> > @@ -391,6 +391,11 @@ def rust_gen_target(d, thing, wd, arch):
> >      tspec['cpu'] =3D cpu
> >      if features !=3D "":
> >          tspec['features'] =3D features
> > +    fpu =3D d.getVar('TARGET_FPU')
> > +    if fpu =3D=3D "soft":
> > +        tspec['llvm-floatabi'] =3D "soft"
> > +    elif fpu =3D=3D "hard":
> > +        tspec['llvm-floatabi'] =3D "hard"
>
> Thanks for this. I see there are three ABIs for arm w.r.t floats soft.
> hard and softfp you can perhaps get this value
> from TUNE_CCARGS_MFLOAT, maybe in a follow up please check the third
> case as well and we might need to add
> it as well


Yash:

any update about this comment from Khem?

libstd-rs is still failing to build when TARGET_FPU is set to softfp

error: failed to run `rustc` to learn about target-specific information

Caused by:
  process didn't exit successfully: `rustc - --crate-name ___
--print=3Dfile-names ... -Cembed-bitcode=3Dyes
-Zforce-unstable-if-unmarked  -C link-arg=3D-Wl,-soname,libstd.so
--target armv7-oemllib32-linux-gnueabi --crate-type bin --crate-type
rlib --crate-type dylib --crate-type cdylib --crate-type staticlib
--crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo
--print=3Dcrate-name --print=3Dcfg` (exit status: 1)
  --- stderr
  error: Error loading target specification: ARM targets must specify
their float ABI. Run `rustc --print target-list` for a list of
built-in targets

it's set to softfp from TUNE_CCARGS_MFLOAT

# $TUNE_CCARGS_MFLOAT
#   set oe-core/meta/conf/machine/include/arm/feature-arm-vfp.inc:14
#     "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard',
'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '' or
bb.utils.contains('TUNE_FEATURES', 'simd', True, False, d)) else '' }"
TUNE_CCARGS_MFLOAT=3D"softfp"

# $TARGET_FPU [3 operations]
#   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:16
#     "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
#   set oe-core/meta/conf/machine/include/arm/arch-arm64.inc:39
#     "${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
'${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}"
#   set oe-core/meta/conf/documentation.conf:417
#     [doc] "Specifies the method for handling FPU code. For FPU-less
targets, which include most ARM CPUs, the variable must be set to
'soft'. If not, the kernel emulation gets used, which results in a
performance penalty."
# pre-expansion value:
#   "${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
'${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}"
TARGET_FPU=3D"softfp"

