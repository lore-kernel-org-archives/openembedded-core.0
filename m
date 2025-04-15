Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BDF1C369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 11:38:23 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.17750.1744717100478686214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 04:38:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a/13IbG8;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso55649601fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 04:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744717099; x=1745321899; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5NY+pLg43Uhi33IwBdn5543TH+8dxZglbQeljX0IGc=;
        b=a/13IbG8Sqt/xvsznjsrFapTKJk3CGMnyIxvWxT7c11jwZeLnazvvwOdJWmj05rHV9
         lrJwQlFDKWgzFexa0rg+MblSGj0hlXhJcTHV+Qw/sOjqWd6YFDJuXtAAwCgkhKeOZ7FW
         iE5zbjEtEAGpkwaDyiBMxLfVss83IFrTSXo3CYf7w86SHqcX0aBD5vEwZgoDqaIbjfVL
         nnBO4LNVilng+MUfDOZPoN60hLscNtptfc7NVIqFZCEDn9SpMJAXitxTStJ3/2J8aBBL
         3SUSbwg+jmTDvb+6ZjehWyDwS6eCRnxlpJJBCg/IA6MunEkx6LZqoHhboHzoS1/jbpvn
         wPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744717099; x=1745321899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5NY+pLg43Uhi33IwBdn5543TH+8dxZglbQeljX0IGc=;
        b=dlIlbwyrR4ZmrMk00waIEXoObBxzxY3eLCgOlJzIWZlJKrRRM7Y6DXOvIgf4Q0cjcx
         GLO7MLGJFDbOFSKnYEmNUqUtX1n8oe+FhkpAwETJ84/4hFoUcABAcAac8MEa7dHcZAYc
         xG583VZMuH3Q6bdQIg3SXtNjxVF5ZIiLaLWe8Yz6G5nYhjv4X+z0UiXxYYA3SYtVgXI5
         2ecvsYUROPy6sYCm+N+Z406is39TuAB4dnnmtuVIu8sBf+/ZBQnKnSg1pFEF9NH788oa
         DDXk185Zz2sz1Qv+C7r5wKFBNlJ5E9KRNCgg0M0skzQk92t0cyBjheKTJ/V87Fawy0xd
         Od9g==
X-Forwarded-Encrypted: i=1; AJvYcCWJeeTVjMTbUCaIR7Ffdukjzk43ficXXEcuUwgYd+aHIXvDvXt9a3Oqd1R3ipekzNELG2ms762+tcyOafpP6lVFgg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrTFyyRSh6qViZw0PZcxSRO1QMI6TT+imr2P+lAS5nuvnqAw4p
	TFRjMQsEnkkTAWdC5BQLCmBczOtCxE9U37fUuorRYD4rhzeQrGr8XhJ5xW+LjDTCWLKz+zLD180
	jEhXi5lJXRZzLX5TqoeU+YJaENys=
X-Gm-Gg: ASbGncvW0aStwAKIuRTJq/Md8KuRUzIQgZK4QHBNMbSWv5bZMIpPJlWaX9tp1VwhFNx
	qxtt0z4ChaqkkK99F+/na+FUxomsj/RnWD3fhmJzgoXehGSBPgEkzeCndLvSwyiO5kQd/meoC1w
	zVujgyXXVHSS9ScSPZPDYuH2YO
X-Google-Smtp-Source: AGHT+IGjnEdQ7UBezWJLKM9z3c5cMzEP6aeAzy/sd15fqQ7T91sld6iRa0B+NT32tD7orXTOlInCf7mKop39/PT3tXw=
X-Received: by 2002:a2e:9fc9:0:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-3104951cefamr51159741fa.0.1744717098192; Tue, 15 Apr 2025
 04:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250331055424.1978243-1-Yash.Shinde@windriver.com>
 <20250331055424.1978243-2-Yash.Shinde@windriver.com> <CAMKF1sowYqhv29_Him+th4PkxvGG2FkEzeWmM3fgYzUeKpHqSQ@mail.gmail.com>
 <CA+chaQcn9EfvFMSEmBPnCu3duzwY=cNXzwXVGPBNSP7n-9SduQ@mail.gmail.com> <1d01500d-39e2-4578-9fc0-b8c7c231e6d9@windriver.com>
In-Reply-To: <1d01500d-39e2-4578-9fc0-b8c7c231e6d9@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 15 Apr 2025 13:38:06 +0200
X-Gm-Features: ATxdqUHDeFGnFZqPjVfKJusRkHHjt-xIFocAsULlSwZt7VnKg4NVnXRX0vHSb3k
Message-ID: <CA+chaQf_eWJgp9QVKQQ9iGviZU54Zc_1h-LyWW2yurWf06zCLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] rust: Upgrade 1.84.1->1.85.0
To: Yash Shinde <Yash.Shinde@windriver.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214843

qemuarmv5 uses tune-arm926ejs which uses armv5te, I think you would
need to use armv5te-vfp to reproduce this, or use qemuarm with
tune-cortexa15 but switch from default cortexa15thf-neon to
cortexa15t-neon

I was seeing it in multilib builds e.g. with
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster&id=3D40e9c4744a7f1eb2d91af9539d69555d36dfba30
which uses DEFAULTTUNE:virtclass-multilib-lib32 =3D "armv7at-neon"

unfortunately just treating softfp as soft ends with segfaults in rust
as shown nere:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/ma=
ster&id=3Dc65eda95e5dd3ad0be0565477236d7902d5d625c

Regards,

On Tue, Apr 15, 2025 at 11:05=E2=80=AFAM Yash Shinde <Yash.Shinde@windriver=
.com> wrote:
>
>
> On 11-04-2025 13:08, Martin Jansa wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Mon, Mar 31, 2025 at 6:47=E2=80=AFPM Khem Raj via lists.openembedded.o=
rg
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Sun, Mar 30, 2025 at 10:54=E2=80=AFPM Yash Shinde via
> lists.openembedded.org
> <Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Rust stable version updated to 1.85.0
> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>
> Some of the major updates:
>
> - Update LIC_FILES_CHKSUM in libstd-rs and rust recipes.
> License-Update: Unicode license text is updated to Unicode-3.0 License.
> https://github.com/rust-lang/rust/commit/6d2a3e9786ec43a0e0af20386e704632=
8296ac86
>
> - Pass '-Zforce-unstable-if-unmarked' to RUSTFLAGS in libstd-rs.bb
> Fix: https://github.com/rust-lang/rust/issues/133857#issuecomment-2526341=
227
>
> - Downgrade bootstrap cc version causing bootstrap to fail on custom targ=
ets. (Backported from v1.85.1)
> Fix: https://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffca8=
c63aa56d45b46e62b6acc58bd7
>
> - Explicitly set float ABI for all ARM 32 bits targets.
> Fix: https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005b5=
0982d0049d905
>
> - Rust v1.85.0 tarball doesn't ship gcc tree.
> Drop "remove_gcc_directory" postfunc which removed it and prevented the b=
loat.
> Fix: https://github.com/rust-lang/rust/commit/13c3f9b9498013837782b461200=
85ea19ca75518
>
> Adapted the patch changes with v1.85.0:
>   repro-issue-fix-with-cc-crate-hashmap.patch
>   revert-link-std-statically-in-rustc_driver-feature.patch
>   rust-oe-selftest.patch
>   rv32-cargo-rustix-0.38.40-fix.patch
>
> Dropped patches:
>   fix-tidy-check-failure.patch since it's merged with v1.85.0.
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../classes-recipe/rust-target-config.bbclass |   5 +
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  .../rust/{cargo_1.84.1.bb =3D> cargo_1.85.0.bb} |   0
>  .../rust/files/downgrade-bootstrap-cc.patch   |  41 +++
>  .../rust/files/fix-tidy-check-failure.patch   |  19 --
>  ...epro-issue-fix-with-cc-crate-hashmap.patch |  60 ++++-
>  ...d-statically-in-rustc_driver-feature.patch |   4 +-
>  .../rust/files/rust-oe-selftest.patch         |  46 ++--
>  .../files/rv32-cargo-rustix-0.38.38-fix.patch | 236 ------------------
>  .../files/rv32-cargo-rustix-0.38.40-fix.patch | 236 ++++++++++++++++++
>  ...ibstd-rs_1.84.1.bb =3D> libstd-rs_1.85.0.bb} |   4 +-
>  ....84.1.bb =3D> rust-cross-canadian_1.85.0.bb} |   0
>  ...ust-llvm_1.84.1.bb =3D> rust-llvm_1.85.0.bb} |   0
>  meta/recipes-devtools/rust/rust-snapshot.inc  |  81 +++---
>  meta/recipes-devtools/rust/rust-source.inc    |  23 +-
>  .../rust/{rust_1.84.1.bb =3D> rust_1.85.0.bb}   |   2 +-
>  16 files changed, 417 insertions(+), 342 deletions(-)
>  rename meta/recipes-devtools/rust/{cargo_1.84.1.bb =3D> cargo_1.85.0.bb}=
 (100%)
>  create mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstrap-=
cc.patch
>  delete mode 100644 meta/recipes-devtools/rust/files/fix-tidy-check-failu=
re.patch
>  delete mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-0.=
38.38-fix.patch
>  create mode 100644 meta/recipes-devtools/rust/files/rv32-cargo-rustix-0.=
38.40-fix.patch
>  rename meta/recipes-devtools/rust/{libstd-rs_1.84.1.bb =3D> libstd-rs_1.=
85.0.bb} (88%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.84.1.bb =3D> ru=
st-cross-canadian_1.85.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.84.1.bb =3D> rust-llvm_1.=
85.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust_1.84.1.bb =3D> rust_1.85.0.bb} (=
99%)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classe=
s-recipe/rust-target-config.bbclass
> index 67aaa56bac..c04940ce54 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -391,6 +391,11 @@ def rust_gen_target(d, thing, wd, arch):
>      tspec['cpu'] =3D cpu
>      if features !=3D "":
>          tspec['features'] =3D features
> +    fpu =3D d.getVar('TARGET_FPU')
> +    if fpu =3D=3D "soft":
> +        tspec['llvm-floatabi'] =3D "soft"
> +    elif fpu =3D=3D "hard":
> +        tspec['llvm-floatabi'] =3D "hard"
>
> Thanks for this. I see there are three ABIs for arm w.r.t floats soft.
> hard and softfp you can perhaps get this value
> from TUNE_CCARGS_MFLOAT, maybe in a follow up please check the third
> case as well and we might need to add
> it as well
>
> Yash:
>
> any update about this comment from Khem?
>
> libstd-rs is still failing to build when TARGET_FPU is set to softfp
>
> I checked the value from TUNE_CCARGS_MFLOAT and it wasn't set to soft whe=
n using qemuarmv5 as the MACHINE. Thus, we need to use TARGET_FPU.
> For softfp, I didn't find any target supported/valid using oe-core config=
.
> Could you share the config for setting softfp for arm target?
>
> I will add and check a condition for softfp setting as well with that.
>
> Regards,
> Yash
>
> error: failed to run `rustc` to learn about target-specific information
>
> Caused by:
>   process didn't exit successfully: `rustc - --crate-name ___
> --print=3Dfile-names ... -Cembed-bitcode=3Dyes
> -Zforce-unstable-if-unmarked  -C link-arg=3D-Wl,-soname,libstd.so
> --target armv7-oemllib32-linux-gnueabi --crate-type bin --crate-type
> rlib --crate-type dylib --crate-type cdylib --crate-type staticlib
> --crate-type proc-macro --print=3Dsysroot --print=3Dsplit-debuginfo
> --print=3Dcrate-name --print=3Dcfg` (exit status: 1)
>   --- stderr
>   error: Error loading target specification: ARM targets must specify
> their float ABI. Run `rustc --print target-list` for a list of
> built-in targets
>
> it's set to softfp from TUNE_CCARGS_MFLOAT
>
> # $TUNE_CCARGS_MFLOAT
> #   set oe-core/meta/conf/machine/include/arm/feature-arm-vfp.inc:14
> #     "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard',
> 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '' or
> bb.utils.contains('TUNE_FEATURES', 'simd', True, False, d)) else '' }"
> TUNE_CCARGS_MFLOAT=3D"softfp"
>
> # $TARGET_FPU [3 operations]
> #   set oe-core/meta/conf/machine/include/arm/arch-arm.inc:16
> #     "${@d.getVar('TUNE_CCARGS_MFLOAT') or 'soft'}"
> #   set oe-core/meta/conf/machine/include/arm/arch-arm64.inc:39
> #     "${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
> '${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}"
> #   set oe-core/meta/conf/documentation.conf:417
> #     [doc] "Specifies the method for handling FPU code. For FPU-less
> targets, which include most ARM CPUs, the variable must be set to
> 'soft'. If not, the kernel emulation gets used, which results in a
> performance penalty."
> # pre-expansion value:
> #   "${@bb.utils.contains('TUNE_FEATURES', 'aarch64',
> '${TARGET_FPU_64}', '${TARGET_FPU_32}', d)}"
> TARGET_FPU=3D"softfp"

