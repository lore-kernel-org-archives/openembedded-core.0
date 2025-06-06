Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE31C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 21:42:36 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.6264.1749246136414362026
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 14:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VPdg49U0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442ea341570so17222205e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 14:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749246134; x=1749850934; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wQJoIlWaNSihqueQV2d/mKVPR/7eH1qWsb00WbVD9MI=;
        b=VPdg49U0YiWWcDQlO39UJ9ZYCyX3O1t1kyzfZLs6MO7ZWjxj1ke1TKKRIcjwRwKN3Q
         CUIDurduk+KZzu+177fBnlgsgZBsQxQHvMmrzd9yKyBkm7DjHeG78VhcubSrjvIevdLY
         oq0djDowc3EQV/t6LG8W3na41ivkBBCC0S54U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749246134; x=1749850934;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQJoIlWaNSihqueQV2d/mKVPR/7eH1qWsb00WbVD9MI=;
        b=XEYRcgTnO25hT+W0Aj299yFYfHIihI3sIhot4s47yqx1zufrg5pHTcjeKpnYFkmcfQ
         GgesRGNFFU+VPWjWG1p7fA5MUUu8uSUtq349je2oZo8aj389gH9UZsC3D7Vs5qVDdX1r
         IosPkmSCydMTH6cY6xmMGOAN8BDT+yLUPQ/qbnASdnD9O3mrNJZMjOsTYoYWNUfhQcqf
         oPHzaHjMNxVCm4mdXVUuPLZO0btIB1Soxcui/pNsAZZfpX2gAMf0CO1uQPtUkU/wbDWl
         0DRyjFbAZ0L/8inlY4hzcv3iLsjGLB5FY+JvlSQnIaGErQEnkHrr6faOKZaao6XQAQbl
         /A9A==
X-Forwarded-Encrypted: i=1; AJvYcCXepi2j6fz4km94LuyxdPbzA+BHnpPi4svMrx2Cee5ns7FhUjkZxRFUdX4/+2lvI4a3mywC01dxuciZN2MSos9dnw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPAJaE9i9r/N1tnaX2vm5Synd0a1uTRXjDuuP6m0s9B2R++uFt
	vGhtPNLhFZC3zTq2vPgrz9i4szt0RXOd6+zEqyn6VxHZX5iVdjbvxGtCx5V7eLr2ge8=
X-Gm-Gg: ASbGncvAu3UWp5JFbCAoYVh5eVRYwCndU6FJcxnyI510EhI2s2AyfI8+H/nX/DN22UP
	E1s9ZmYfXGjmsAN3TREeses66xfRcWPkpnQ+9rbWWYxg8ysi5s31Ocpx0junL08ljq1vUCoPRi2
	P795KK9CtmYf497caGVsA+9SjKsd0bK6CAIpbYuCIhSge5ux34y3xVX2fBiklrCtPDmGcwnH9Dw
	s1IoxsT/nubEZM9If8w89JanvKsokAEtADftr2AHBEDRpbuiVGl9DkRvNYpPyna0WVyEYnFg47j
	0+FemSUSRzO0ZzjWsbsk6WeqClOh3r6IYajSoYkG/tnv4Pls73NJd91nG5lxKhU2xxTZbXAP7td
	4PXMwyV6nVAEj468soUDzvgCIVWfb2UuCKWiTS+2OiLPK6YQuOUA=
X-Google-Smtp-Source: AGHT+IHr+P/MJkUZAyFeL34aA4YZnJ3Yipqh7WMRR0b/C84Jc7DIzByxKc+BlwnX8dWvMGnSXT55FA==
X-Received: by 2002:a05:600c:5396:b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-452013681efmr58435575e9.2.1749246134521;
        Fri, 06 Jun 2025 14:42:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8f59:50ba:83a4:d366? ([2001:8b0:aba:5f3c:8f59:50ba:83a4:d366])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229d9e9sm2988801f8f.13.2025.06.06.14.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 14:42:13 -0700 (PDT)
Message-ID: <6e5e734bfa5e67cb2be0fabe624e488b87478d20.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.85.1->1.86.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Fri, 06 Jun 2025 22:42:12 +0100
In-Reply-To: <1846920EC8E84923.17668@lists.openembedded.org>
References: <20250606124816.365627-1-Yash.Shinde@windriver.com>
	 <1846920EC8E84923.17668@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 21:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218187

On Fri, 2025-06-06 at 22:41 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2025-06-06 at 05:48 -0700, Yash Shinde via
> lists.openembedded.org wrote:
> > From: Yash Shinde <Yash.Shinde@windriver.com>
> >=20
> > * Add pkgconfig-native and openssl to resolve openssl-sys crate
> > dependency on pkg-config. As per rust document this is a required
> > dependency.
> >=20
> > Fixes:
> > > error: failed to run custom build command for `openssl-sys
> > > v0.9.106`
> > > Could not find openssl via pkg-config:
> > > =C2=A0 The pkg-config command could not be found.
> > >=20
> > > =C2=A0 Most likely, you need to install a pkg-config package for your
> > > OS.
> > > =C2=A0 Try `apt install pkg-config`, or `yum install pkg-config`,
> > > =C2=A0 or `pkg install pkg-config`, or `apk add pkgconfig` depending
> > > on your distribution
> >=20
> > https://crates.io/crates/openssl-sys/0.9.108/dependencies
> > https://github.com/rust-lang/rust/blob/master/INSTALL.md#dependencies
> >=20
> > * Add Ninja as a dependency for building Rust to prevent bootstrap
> > =C2=A0 build regression.
> >=20
> > Fixes:
> > > Building LLD for x86_64-unknown-linux-gnu
> > >=20
> > > Couldn't find required command: ninja (or ninja-build)
> > >=20
> > > You should install ninja as described at
> > > <
> > > https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages
> > > >,
> > > or set `ninja =3D false` in the `[llvm]` section of `config.toml`.
> > > Alternatively, set `download-ci-llvm =3D true` in that `[llvm]`
> > > section
> > > to download LLVM rather than building it.
> >=20
> > * Add bash to DEPENDS to resolve missing dependency for subtree-
> > sync.sh
> > Fixes:
> > ERROR: rust-1.86.0-r0 do_package_qa: QA Issue:
> > /usr/lib/rustlib/src/rust/library/portable-simd/subtree-sync.sh
> > contained in package rust requires /bin/bash, but no providers
> > found in RDEPENDS:rust? [file-rdeps]
> >=20
> > * Add do_install:append() task to remove cargo bin from rust native
> > builds.
> > This resolves the following conflict:
> >=20
> > Fixes:
> > ERROR: libstd-rs-1.86.0-r0 do_prepare_recipe_sysroot: The file
> > /usr/bin/cargo is
> > installed by both rust-native and cargo-native, aborting
> >=20
> > * Update Unicode-3.0 license checksums.
> > License-Update: Copyright and license files to distributions are
> > updated.
> >=20
> > https://github.com/rust-lang/rust/commit/f9c16997dc016a3ef1456f56df2ab5=
64a1c48cb2
> > =C2=A0 It adds copyright and license files (including HTML versions) to
> > distributions,
> > =C2=A0 aligns with license compliance tools like reuse, and ensures all
> > required
> > =C2=A0 license texts are properly included and formatted.
> >=20
> > * Disable building of extended Rust tools to reduce build time and
> > filesystem usage.
> > =C2=A0 Update config.toml to disable building of extended Rust tools
> > that are not required.
> > =C2=A0 This helps minimize unnecessary build time and filesystem usage.
> >=20
> > * The "remote-test-server" bin is now generated in stage2-tools-bin
> > dir
> > =C2=A0 rather than stage1. Update the test suite accordingly.
> >=20
> > * Fix do_package QA issue by packing missing zsh files and
> > directories:
> >=20
> > Fixes:
> > do_package: QA Issue: rust: Files/directories were installed but
> > not shipped in any package:
> > /usr/share/zsh
> > /usr/share/zsh/site-functions
> > /usr/share/zsh/site-functions/_cargo
> > Please set FILES such that these items are packaged. Alternatively
> > if they are unneeded,
> > avoid installing them or delete them within do_install
> >=20
> > * Install "llvm-tblgen" from native-sysroot to recipe sysroot to
> > handle
> > =C2=A0 file not found error during rust builds:
> >=20
> > Fixes:
> > /bin/sh: line 1:/home/poky/build/tmp/work/core2-64-poky-
> > linux/rust/1.86.0/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-tblgen:
> > No such file or directory
> >=20
> > > make[2]: ***
> > > [COFF/CMakeFiles/COFFOptionsTableGen.dir/build.make:120:
> > > COFF/Options.inc] Error 127
> > > make[1]: *** [CMakeFiles/Makefile2:630:
> > > COFF/CMakeFiles/COFFOptionsTableGen.dir/all] Error 2
> > > make[1]: *** Waiting for unfinished jobs....
> >=20
> > * From v1.86.0, a "self-contained" LLD is built as part of rust
> > =C2=A0bootstrap build. This results in additional build time and
> > =C2=A0installations. Disable rust-lld in config.toml to prevent it.
> >=20
> > =C2=A0References: https://github.com/rust-lang/rust/pull/135001
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
> > https://github.com/rust-lang/rust/commit/8744b44e6bde053f7656a3c727c968=
177ee8e4b6
> >=20
> > * Drop Zdual-proc-macros-additional-check.patch patch
> > =C2=A0since it's merged with v1.86.0
> > =C2=A0
> > https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad4
> > 6fd5547bd4916
> >=20
> > * LTO config is applied to rustdoc from v1.86.0.
> > =C2=A0Rebase 0001-src-core-build_steps-tool.rs-switch-off-lto-for-
> > rust.patch
> > =C2=A0which disables it to avoid suffixes in binaries causing non-
> > reproducibility.
> > =C2=A0https://github.com/rust-lang/rust/commit/1fe351b
> >=20
> > * Restrict tests using "//@only <target_arch>" to avoid failures on
> > riscv64,
> > =C2=A0 which is now part of default AB testing. Since riscv64 is Tier 2
> > =C2=A0 with no automated testing, some tests may fail. This approach
> > ensures tests continue
> > =C2=A0 running on supported architectures while skipping them on
> > riscv64.
> > =C2=A0
> > https://doc.rust-lang.org/rustc/platform-support.html#tier-2-with-host-=
tools
> >=20
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > ---
> > =C2=A0meta/conf/distro/include/tcmode-default.inc=C2=A0=C2=A0 |=C2=A0 2=
 +-
> > =C2=A0meta/lib/oeqa/selftest/cases/rust.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > =C2=A0.../rust/{cargo_1.85.1.bb =3D> cargo_1.86.0.bb} |=C2=A0 0
> > =C2=A0...l-codes-on-riscv32gc-unknown-linux-g.patch | 32 -------
> > =C2=A0...teps-tool.rs-switch-off-lto-for-rust.patch | 54 +++++++++---
> > =C2=A0.../Zdual-proc-macros-additional-check.patch=C2=A0 | 31 -------
> > =C2=A0.../rust/files/rust-oe-selftest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 85 +++++++++++----
> > ----
> > =C2=A0...ibstd-rs_1.85.1.bb =3D> libstd-rs_1.86.0.bb} |=C2=A0 2 +-
> > =C2=A0....85.1.bb =3D> rust-cross-canadian_1.86.0.bb} |=C2=A0 0
> > =C2=A0...ust-llvm_1.85.1.bb =3D> rust-llvm_1.86.0.bb} |=C2=A0 4 +-
> > =C2=A0meta/recipes-devtools/rust/rust-snapshot.inc=C2=A0 | 78 ++++++++-=
------
> > --
> > =C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0=C2=A0=C2=A0 |=C2=
=A0 3 +-
> > =C2=A0.../rust/{rust_1.85.1.bb =3D> rust_1.86.0.bb}=C2=A0=C2=A0 | 20 ++=
++-
> > =C2=A013 files changed, 154 insertions(+), 159 deletions(-)
> > =C2=A0rename meta/recipes-devtools/rust/{cargo_1.85.1.bb =3D>
> > cargo_1.86.0.bb} (100%)
> > =C2=A0delete mode 100644 meta/recipes-devtools/rust/files/Zdual-proc-
> > macros-additional-check.patch
> > =C2=A0rename meta/recipes-devtools/rust/{libstd-rs_1.85.1.bb =3D> libst=
d-
> > rs_1.86.0.bb} (95%)
> > =C2=A0rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.1.bb
> > =3D> rust-cross-canadian_1.86.0.bb} (100%)
> > =C2=A0rename meta/recipes-devtools/rust/{rust-llvm_1.85.1.bb =3D> rust-
> > llvm_1.86.0.bb} (96%)
> > =C2=A0rename meta/recipes-devtools/rust/{rust_1.85.1.bb =3D>
> > rust_1.86.0.bb} (94%)
>=20
> Thanks Yash, this is definitely moving in the right direction.
> Unfortunately there was one issue that showed up during testing:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/1788

and

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1787

Cheers,

Richard

