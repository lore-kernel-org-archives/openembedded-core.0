Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35474C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 13:49:55 +0000 (UTC)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web10.13750.1749736190925617133
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 06:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTqOk+xZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87ecdf5f326so1107861241.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749736190; x=1750340990; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cXfQ4EEsoTe/PYPeLUDbgHG5QYl3uHjjg29BMGhzgmE=;
        b=OTqOk+xZw7mhLDRYd42iJxE5VPwd55F+srSfKX0969T+ADkYPLQPsZwvXdTlZ44rGo
         bFbcV2S3FzCTPo20MhAGdgw7Ja8QoQ5ou8Swi+YeG7upWr7tLsCIJTrBNpTVvZdh1SxQ
         oXeR6Z6OIlV1CFsQ+xW0mXUBwvxqCwW0TCfI0kwg7rJAJJdz6mZ0neUNjfs41/aGpYOM
         uUNq9Cgv9ymc/zgm6EEsCyKwPpkgCobzQ0FQnsbxUdwl9g/SdTID1aK1MZ3ONOEjjvl/
         0TZaid1fCXvAwc7mpazRIeGLI1BXAxeRxVv8AdpDpDQs1OhwLQ2MbJNUDPLtrkdU8+gx
         HF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736190; x=1750340990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXfQ4EEsoTe/PYPeLUDbgHG5QYl3uHjjg29BMGhzgmE=;
        b=IWtizUw4BJvlhyMtIxm5RMzgkdmXutgvkNPmGl52RYN30ZPoFViiln6Ob9LVViF41t
         mJsD5RxDFcqvLD8h4jIc834Q+fXmRuCyACKN+8aSOVkhYIxPmzmBTuORqVli2CpnfSyr
         eNACLUCGoX695ghWhjEPL1KfiIVCCHkU2ZSszZljJHP+oOtGSAvI+z+MhiSrz/DKKfIG
         lJYOhnIbQIORC1OPmts1va+VCt9zDS3PaTt98JOMqqwZsb2/Xk6zQh/1qxh3ZLeqTxLa
         774DqhmGp9CMqT1+dwdwlktKHcxGyFhdoheic4nh3GQYXNSG+ulBdVukRNmYACyo4Px2
         X3hA==
X-Forwarded-Encrypted: i=1; AJvYcCWriEFuRxoiQwPbZFjdKVM6QhrrLTWFPjAjFZseumITGCgzbZT+vKAKCBxG381C4ZJqNEQqAiUhO6KbebuXmZsHlQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YySXsZAoowUh6ksMQ5WJ4eUcm52NJzuf8AR3SG+C3uB1p3yTrxp
	sJ4+ETUomKgEsDVTLv0fIvBvKICIo0bdWc52uErKm5LMog7SJlQcaj5NDTzSk3NPHmL1EVUJ94W
	7lChK9hZyYr/mNKRdJpq2yE+IzvXrAAx9ADDwkno=
X-Gm-Gg: ASbGnctSmFuOxb0w7GZ8EhBecVAeAsbuLROHt9tRFsEF6SoIVCxMHQ5XtX/lN0L3MUx
	RMeG870MRpnZkIe5ieFKgrBhVV6aB4eu8zZJ0jjmIjrhY3G5Xkm/pkqIrZG+PYrevM8zn0Vxzb/
	Z24QJqsM65B0PJY5v6+FleV2Tik0zBm53CyfX43KB+8RE=
X-Google-Smtp-Source: AGHT+IGpD6QKhHWrUbTG2kkhz/kN8FiICHFitB6lNvYlrJSN+GPFzH0mRlferWCUii4rWlRHZ18fQr4FQAfhJs6YCjo=
X-Received: by 2002:a05:6122:7c8:b0:531:1b56:54cf with SMTP id
 71dfb90a1353d-5312dc4e3aamr3150600e0c.7.1749736189051; Thu, 12 Jun 2025
 06:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250610061954.2344667-1-Yash.Shinde@windriver.com>
 <CANPvuRk-iXr1hoLXEBFGCahezTV_VOvD8uu+_WuD5eBb+8Ms-A@mail.gmail.com> <CANNYZj86fwAXSbv229KdOsKssH2t3XQRMez_xyayKdE7rWcToA@mail.gmail.com>
In-Reply-To: <CANNYZj86fwAXSbv229KdOsKssH2t3XQRMez_xyayKdE7rWcToA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 12 Jun 2025 14:49:36 +0100
X-Gm-Features: AX0GCFurQIPMrB8Nv7_rKXZa9OfFWSQMu6AfW8KdaHLJ__L3BdWX6hK8qOCLn4g
Message-ID: <CANPvuRkbtkCRjdWPNWonBQTC2bGXZckkZ9HvC4McMSR9u_JaKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Upgrade 1.85.1->1.86.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	sunilkumar.dora@windriver.com
Content-Type: multipart/alternative; boundary="000000000000ffc9ce06376033db"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 13:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218520

--000000000000ffc9ce06376033db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu (quinta, 12/06/2025
=C3=A0(s) 12:07):

> Please trim unneeded lines when replying so I don't have to put my reply
> on top.
>

Ok I will do that next time if I don't forget.


>
> That ship has already sailed. Rust package already depends on gcc and
> binutils, both gplv3.
>

Right! To install the rust compiler itself on the target image we already
have the gplv3.
I misread the rdepends and thought it was something runtime needed in the
image to run rust applications.

Sorry for the noise and thanks for the clarification.

Jose


> Alex
>
> On Thu, 12 Jun 2025 at 13:02, Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Hi Yash,
> >
> > Yash Shinde via lists.openembedded.org <Yash.Shinde=3D
> windriver.com@lists.openembedded.org> escreveu (ter=C3=A7a, 10/06/2025 =
=C3=A0(s)
> 07:20):
> >>
> >> From: Yash Shinde <Yash.Shinde@windriver.com>
> >>
> >> Rust stable version updated to 1.86.0.
> >> https://blog.rust-lang.org/2025/04/03/Rust-1.86.0.html
> >>
> >> * Add pkgconfig-native and openssl to resolve openssl-sys crate
> >> dependency on pkg-config. As per rust document this is a required
> dependency.
> >>
> >> Fixes:
> >> | error: failed to run custom build command for `openssl-sys v0.9.106`
> >> | Could not find openssl via pkg-config:
> >> |   The pkg-config command could not be found.
> >> |
> >> |   Most likely, you need to install a pkg-config package for your OS.
> >> |   Try `apt install pkg-config`, or `yum install pkg-config`,
> >> |   or `pkg install pkg-config`, or `apk add pkgconfig` depending on
> your distribution
> >>
> >> https://crates.io/crates/openssl-sys/0.9.108/dependencies
> >> https://github.com/rust-lang/rust/blob/master/INSTALL.md#dependencies
> >>
> >> * Add Ninja as a dependency for building Rust to prevent bootstrap
> >>   build regression.
> >>
> >> Fixes:
> >> | Building LLD for x86_64-unknown-linux-gnu
> >> |
> >> | Couldn't find required command: ninja (or ninja-build)
> >> |
> >> | You should install ninja as described at
> >> | <https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages>=
,
> >> | or set `ninja =3D false` in the `[llvm]` section of `config.toml`.
> >> | Alternatively, set `download-ci-llvm =3D true` in that `[llvm]` sect=
ion
> >> | to download LLVM rather than building it.
> >>
> >> * Add bash to DEPENDS to resolve missing dependency for subtree-sync.s=
h
> >> Fixes:
> >> ERROR: rust-1.86.0-r0 do_package_qa: QA Issue:
> /usr/lib/rustlib/src/rust/library/portable-simd/subtree-sync.sh
> >> contained in package rust requires /bin/bash, but no providers found i=
n
> RDEPENDS:rust? [file-rdeps]
> >
> >
> > Can you patch the subtree-sync.sh to use /bin/sh and see if it works
> well?
> > Otherwise this will make any image that use rust be licensed with GPLv3
> >
> > Jose
> >
> >>
> >>
> >> * Add do_install:append() task to remove cargo bin from rust native
> builds.
> >> This resolves the following conflict:
> >>
> >> Fixes:
> >> ERROR: libstd-rs-1.86.0-r0 do_prepare_recipe_sysroot: The file
> /usr/bin/cargo is
> >> installed by both rust-native and cargo-native, aborting
> >>
> >> * Update Unicode-3.0 license checksums.
> >> License-Update: Copyright and license files to distributions are
> updated.
> >>
> >>
> https://github.com/rust-lang/rust/commit/f9c16997dc016a3ef1456f56df2ab564=
a1c48cb2
> >>   It adds copyright and license files (including HTML versions) to
> distributions,
> >>   aligns with license compliance tools like reuse, and ensures all
> required
> >>   license texts are properly included and formatted.
> >>
> >> * Disable building of extended Rust tools to reduce build time and
> filesystem usage.
> >>   Update config.toml to disable building of extended Rust tools that
> are not required.
> >>   This helps minimize unnecessary build time and filesystem usage.
> >>
> >> * The "remote-test-server" bin is now generated in stage2-tools-bin di=
r
> >>   rather than stage1. Update the test suite accordingly.
> >>
> >> * Fix do_package QA issue by packing missing zsh files and directories=
:
> >>
> >> Fixes:
> >> do_package: QA Issue: rust: Files/directories were installed but not
> shipped in any package:
> >> /usr/share/zsh
> >> /usr/share/zsh/site-functions
> >> /usr/share/zsh/site-functions/_cargo
> >> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded,
> >> avoid installing them or delete them within do_install
> >>
> >> * From v1.86.0, a "self-contained" LLD is built as part of rust
> >>  bootstrap build. This results in additional build time and
> >>  installations. Disable rust-lld in config.toml to prevent it.
> >>
> >>  References: https://github.com/rust-lang/rust/pull/135001
> >>
> https://github.com/rust-lang/rust/commit/8744b44e6bde053f7656a3c727c96817=
7ee8e4b6
> >>
> >> * Drop Zdual-proc-macros-additional-check.patch patch
> >>  since it's merged with v1.86.0
> >>
> https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad46fd55=
47bd4916
> >>
> >> * LTO config is applied to rustdoc from v1.86.0.
> >>  Rebase 0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patc=
h
> >>  which disables it to avoid suffixes in binaries causing
> non-reproducibility.
> >>  https://github.com/rust-lang/rust/commit/1fe351b
> >>
> >> * Restrict tests using "//@only <target_arch>" to avoid failures on
> riscv64,
> >>   which is now part of default AB testing. Since riscv64 is Tier 2
> >>   with no automated testing, some tests may fail. This approach ensure=
s
> tests continue
> >>   running on supported architectures while skipping them on riscv64.
> >>
> https://doc.rust-lang.org/rustc/platform-support.html#tier-2-with-host-to=
ols
> >>
> >> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> >> ---
> >> v2: Drop llvm-tblgen installation.
> >>
> >>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >>  meta/lib/oeqa/selftest/cases/rust.py          |  2 +-
> >>  .../rust/{cargo_1.85.1.bb =3D> cargo_1.86.0.bb} |  0
> >>  ...l-codes-on-riscv32gc-unknown-linux-g.patch | 32 -------
> >>  ...teps-tool.rs-switch-off-lto-for-rust.patch | 54 +++++++++---
> >>  .../Zdual-proc-macros-additional-check.patch  | 31 -------
> >>  .../rust/files/rust-oe-selftest.patch         | 85 +++++++++++-------=
-
> >>  ...ibstd-rs_1.85.1.bb =3D> libstd-rs_1.86.0.bb} |  2 +-
> >>  ....85.1.bb =3D> rust-cross-canadian_1.86.0.bb} |  0
> >>  ...ust-llvm_1.85.1.bb =3D> rust-llvm_1.86.0.bb} |  4 +-
> >>  meta/recipes-devtools/rust/rust-snapshot.inc  | 78 ++++++++---------
> >>  meta/recipes-devtools/rust/rust-source.inc    |  3 +-
> >>  .../rust/{rust_1.85.1.bb =3D> rust_1.86.0.bb}   | 18 +++-
> >>  13 files changed, 152 insertions(+), 159 deletions(-)
> >>  rename meta/recipes-devtools/rust/{cargo_1.85.1.bb =3D> cargo_1.86.0.=
bb}
> (100%)
> >>  delete mode 100644
> meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.patch
> >>  rename meta/recipes-devtools/rust/{libstd-rs_1.85.1.bb =3D>
> libstd-rs_1.86.0.bb} (95%)
> >>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.1.bb =3D>
> rust-cross-canadian_1.86.0.bb} (100%)
> >>  rename meta/recipes-devtools/rust/{rust-llvm_1.85.1.bb =3D>
> rust-llvm_1.86.0.bb} (96%)
> >>  rename meta/recipes-devtools/rust/{rust_1.85.1.bb =3D> rust_1.86.0.bb=
}
> (96%)
> >>
> >> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> >> index f0443fbdc6..e943ca77d1 100644
> >> --- a/meta/conf/distro/include/tcmode-default.inc
> >> +++ b/meta/conf/distro/include/tcmode-default.inc
> >> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
> >>  GCCVERSION ?=3D "15.%"
> >>  SDKGCCVERSION ?=3D "${GCCVERSION}"
> >>  GLIBCVERSION ?=3D "2.41%"
> >> -RUSTVERSION ?=3D "1.85.1%"
> >> +RUSTVERSION ?=3D "1.86.0%"
> >>
> >>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> >>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> >> diff --git a/meta/lib/oeqa/selftest/cases/rust.py
> b/meta/lib/oeqa/selftest/cases/rust.py
> >> index 806ddf6982..d99a58d6b9 100644
> >> --- a/meta/lib/oeqa/selftest/cases/rust.py
> >> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> >> @@ -104,7 +104,7 @@ class
> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
> >>              # Copy remote-test-server to image through scp
> >>              host_sys =3D get_bb_var("RUST_BUILD_SYS", "rust")
> >>              ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog,
> user=3D"root")
> >> -            ssh.copy_to(builddir + "/build/" + host_sys +
> "/stage1-tools-bin/remote-test-server","~/")
> >> +            ssh.copy_to(builddir + "/build/" + host_sys +
> "/stage2-tools-bin/remote-test-server","~/")
> >>              # Execute remote-test-server on image through background
> ssh
> >>              command =3D '~/remote-test-server --bind 0.0.0.0:12345 -v=
'
> >>              sshrun=3Dsubprocess.Popen(("ssh", '-o',
> 'UserKnownHostsFile=3D/dev/null', '-o',  'StrictHostKeyChecking=3Dno', '-=
f',
> "root@%s" % qemu.ip, command), shell=3DFalse, stdout=3Dsubprocess.PIPE,
> stderr=3Dsubprocess.PIPE)
> >> diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb
> b/meta/recipes-devtools/rust/cargo_1.86.0.bb
> >> similarity index 100%
> >> rename from meta/recipes-devtools/rust/cargo_1.85.1.bb
> >> rename to meta/recipes-devtools/rust/cargo_1.86.0.bb
> >> diff --git
> a/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-riscv3=
2gc-unknown-linux-g.patch
> b/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-riscv3=
2gc-unknown-linux-g.patch
> >> index b3a95f2e24..82edd71206 100644
> >> ---
> a/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-riscv3=
2gc-unknown-linux-g.patch
> >> +++
> b/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-riscv3=
2gc-unknown-linux-g.patch
> >> @@ -18,38 +18,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>   .../src/unix/linux_like/linux/arch/generic/mod.rs           | 4 +++-
> >>   6 files changed, 14 insertions(+), 6 deletions(-)
> >>
> >> -diff --git a/vendor/libc-0.2.158/.cargo-checksum.json
> b/vendor/libc-0.2.158/.cargo-checksum.json
> >> -index 636165bc0..dc86fd0db 100644
> >> ---- a/vendor/libc-0.2.158/.cargo-checksum.json
> >> -+++ b/vendor/libc-0.2.158/.cargo-checksum.json
> >> -@@ -1 +1 @@
> >>
> --{"files":{"CHANGELOG.md":"96fb278d188e87842fe2701f91e0f757665b44dc2e549=
accb6ed1ed6eeb67602","CONTRIBUTING.md":"a93fcda0a76e1975fcfb0aa2ba00c9b1864=
f9ae6062704a294d81a3688898e10","Cargo.toml":"2196e21d3fd56b3019e235720a32b4=
e3c8ada82c08cb01c06c695752201396df","LICENSE-APACHE":"62c7a1e35f56406896d7a=
a7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f=
56a8932dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"4da2919bb50=
9f3f06163778478494f780ca6627cb79ccab5d2c828c8d88dc133","
> build.rs
> ":"54387230fed8d16f1169a845e92a1c1a5d9227559acbf3bfa383c7901b2d1be8","rus=
tfmt.toml":"eaa2ea84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b=
2","src/
> fixed_width_ints.rs
> ":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","src=
/fuchsia/
> aarch64.rs
> ":"893fcec48142d273063ffd814dca33fbec92205fd39ada97075f85201d803996","src=
/fuchsia/
> align.rs
> ":"ae1cf8f011a99737eabeb14ffff768e60f13b13363d7646744dbb0f443dab3d6","src=
/fuchsia/
> mod.rs
> ":"a8e3ff551e5ff4247ab1faa1b7ca1e042046a619198e8b30fe183c6ef8485d65","src=
/fuchsia/
> no_align.rs
> ":"303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src=
/fuchsia/
> riscv64.rs
> ":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b11","src=
/fuchsia/
> x86_64.rs
> ":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac87","src=
/
> hermit.rs
> ":"ad1e8685edf3f3a7c141ccc0e82d44b7feb13e81f2f59ed6aeb6e4964524637c","src=
/
> lib.rs
> ":"7f57f05b3d9e1e14a666aabbd942cf5959e778966981e604087774d56eb059c8","src=
/
> macros.rs
> ":"5f985b3de7b18833f866bf832b8ffb0430f0f70aa9a468b6a2c855c1bf9d33e4","src=
/
> psp.rs
> ":"0a7d5121a8cc2903009f586c00e4ae2d6126d24eb90531dafaba6f59823aa6b2","src=
/
> sgx.rs
> ":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src=
/solid/
> aarch64.rs
> ":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42ab7f8707","src=
/solid/
> arm.rs
> ":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9cf4f1f4872097fc27fe","src=
/solid/
> mod.rs
> ":"5f4151dca5132e4b4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src=
/
> switch.rs
> ":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src=
/teeos/
> mod.rs
> ":"ecf8922923fb7541ef7b0813cdc5418b75be56247c4dbdbb7dca58a076f25b97","src=
/unix/aix/
> mod.rs
> ":"91de34bf8237e4998e10f9274471d14fb9a31ac6f2ef6e44689066b8e280b3d3","src=
/unix/aix/
> powerpc64.rs
> ":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8296f8e10d55169b","src=
/unix/
> align.rs
> ":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src=
/unix/bsd/apple/b32/
> align.rs
> ":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src=
/unix/bsd/apple/b32/
> mod.rs
> ":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src=
/unix/bsd/apple/b64/aarch64/
> align.rs
> ":"2eaf0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src=
/unix/bsd/apple/b64/aarch64/
> mod.rs
> ":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src=
/unix/bsd/apple/b64/
> align.rs
> ":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src=
/unix/bsd/apple/b64/
> mod.rs
> ":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src=
/unix/bsd/apple/b64/x86_64/
> align.rs
> ":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src=
/unix/bsd/apple/b64/x86_64/
> mod.rs
> ":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src=
/unix/bsd/apple/
> long_array.rs
> ":"3cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src=
/unix/bsd/apple/
> mod.rs
> ":"484698da7c1083a46ae1a389486a8c2d75e3e6ecb4f80ded69b6c0dd2d1a92a0","src=
/unix/bsd/freebsdlike/dragonfly/
> errno.rs
> ":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src=
/unix/bsd/freebsdlike/dragonfly/
> mod.rs
> ":"2777f94909a798df1b8030fb86d02e2118d0ac3e49e9a542df54a569ca5ae2f9","src=
/unix/bsd/freebsdlike/freebsd/
> aarch64.rs
> ":"6c8e216385f53a4bf5f171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src=
/unix/bsd/freebsdlike/freebsd/
> arm.rs
> ":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src=
/unix/bsd/freebsdlike/freebsd/freebsd11/
> b64.rs
> ":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src=
/unix/bsd/freebsdlike/freebsd/freebsd11/
> mod.rs
> ":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec722ba80dac1f","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/
> mod.rs
> ":"bef9fae288a4f29e941ea369be1cd20b170040e60665a4d49a4a9e79009b72d8","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/
> x86_64.rs
> ":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/
> mod.rs
> ":"88be47524b28b6635ccb1e85ea511bf17337be0af7e9baa740c341ac9e83a6f7","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/
> x86_64.rs
> ":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/
> mod.rs
> ":"6ddc6abf6d5ccaea0d8cccf521e8ca6457efcad3086af4155628d5d06d672346","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/
> x86_64.rs
> ":"e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src=
/unix/bsd/freebsdlike/freebsd/freebsd15/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd15/
> mod.rs
> ":"93115c1a9faa43ebf58b7dee3582aed5a54291b284764e370e7f649b2e6a9565","src=
/unix/bsd/freebsdlike/freebsd/freebsd15/
> x86_64.rs
> ":"e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src=
/unix/bsd/freebsdlike/freebsd/
> mod.rs
> ":"08e39a42392936857fd0c1c6b01788f5630fe8ff7f78b062490509c5dd816a42","src=
/unix/bsd/freebsdlike/freebsd/
> powerpc.rs
> ":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src=
/unix/bsd/freebsdlike/freebsd/
> powerpc64.rs
> ":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src=
/unix/bsd/freebsdlike/freebsd/
> riscv64.rs
> ":"fa4bed4c58cad24ba3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src=
/unix/bsd/freebsdlike/freebsd/
> x86.rs
> ":"2837fed0ffee0ec443ecdb743b7142bcb4d6ba2de87e05459fb4498789d47200","src=
/unix/bsd/freebsdlike/freebsd/x86_64/
> align.rs
> ":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src=
/unix/bsd/freebsdlike/freebsd/x86_64/
> mod.rs
> ":"e4d76219bec0621db07dec37de9be1a9b7fb38daa10ffc1a6adbdbc34e163435","src=
/unix/bsd/freebsdlike/
> mod.rs
> ":"c846f30eaffc7c1a21b4acd3df75cd17bb3d4f11401c9a9770924e4e6d847995","src=
/unix/bsd/
> mod.rs
> ":"37765749481f7d0dec8681d8c9d0735e6021094b4ef4a2d9aab5643d7a4232e1","src=
/unix/bsd/netbsdlike/
> mod.rs
> ":"ea60540aa4edd4e43136749d5df497b1dc072b9912b6030dd1ab794a6d1c3c3c","src=
/unix/bsd/netbsdlike/netbsd/
> aarch64.rs
> ":"057ee877db7193ba0dc10801b9a6563ac6dbdb78376d6851a84cb12b30841759","src=
/unix/bsd/netbsdlike/netbsd/
> arm.rs
> ":"949b55e4dee1c8c511f4f061a6a57ac876a6c0eabfaf5cc20e9ab40d8f41b2e0","src=
/unix/bsd/netbsdlike/netbsd/
> mips.rs
> ":"88be18ac43ba224c77e78e4179b6761debc5e6c30a258fac56263809c7af4fbc","src=
/unix/bsd/netbsdlike/netbsd/
> mod.rs
> ":"ab09cea2897ecd27fc7e35822dac23d6dcd53f8577c771db3ee8b015e8d82001","src=
/unix/bsd/netbsdlike/netbsd/
> powerpc.rs
> ":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src=
/unix/bsd/netbsdlike/netbsd/
> riscv64.rs
> ":"1cbe2e5ed681cb1054b699da37daaf6c714267df7d332c90fc2a589b11579625","src=
/unix/bsd/netbsdlike/netbsd/
> sparc64.rs
> ":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src=
/unix/bsd/netbsdlike/netbsd/
> x86.rs
> ":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src=
/unix/bsd/netbsdlike/netbsd/
> x86_64.rs
> ":"532b76199d6c71ff996eade9f906c55a72c9aff489595d25a21e21878cfd740b","src=
/unix/bsd/netbsdlike/openbsd/
> aarch64.rs
> ":"dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src=
/unix/bsd/netbsdlike/openbsd/
> arm.rs
> ":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src=
/unix/bsd/netbsdlike/openbsd/
> mips64.rs
> ":"8532a189ae10c7d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src=
/unix/bsd/netbsdlike/openbsd/
> mod.rs
> ":"7b93b5b24b3c72a79b2de19b47ac2f56b29d87e9fc8f4c721a63d1e87ec83fcc","src=
/unix/bsd/netbsdlike/openbsd/
> powerpc.rs
> ":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src=
/unix/bsd/netbsdlike/openbsd/
> powerpc64.rs
> ":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src=
/unix/bsd/netbsdlike/openbsd/
> riscv64.rs
> ":"1fe3332dc705a13e6242219970f5449d6d7a73e2e6c8537ab8e421d8a6f2e3ff","src=
/unix/bsd/netbsdlike/openbsd/
> sparc64.rs
> ":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src=
/unix/bsd/netbsdlike/openbsd/
> x86.rs
> ":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","src=
/unix/bsd/netbsdlike/openbsd/
> x86_64.rs
> ":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src=
/unix/haiku/
> b32.rs
> ":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","src=
/unix/haiku/
> b64.rs
> ":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf4681f91ff7985","src=
/unix/haiku/
> mod.rs
> ":"b75976d84bdf4a3a226336bb06ec231d552240f302bb5da48ead692fd72758f9","src=
/unix/haiku/
> native.rs
> ":"2b1f88c043777a915bb7218aa05a3647a0e0481ebff55a99e351c45dea2be8de","src=
/unix/haiku/
> x86_64.rs
> ":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src=
/unix/hurd/
> align.rs
> ":"03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src=
/unix/hurd/
> b32.rs
> ":"2ba90ed973f90366c36a6387833a3df42abfee9622d4a0352635937d4a89eaf4","src=
/unix/hurd/
> b64.rs
> ":"d919b4aec9b3080ad24c125c57b2c8b2e483d72045f1554c429d14560355846f","src=
/unix/hurd/
> mod.rs
> ":"23ebadfdb9a92d7fb9e32b6a7c95669ce979ba7407b924869f40a59d2807d052","src=
/unix/hurd/
> no_align.rs
> ":"03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src=
/unix/linux_like/android/b32/
> arm.rs
> ":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3ec2564","src=
/unix/linux_like/android/b32/
> mod.rs
> ":"7c173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src=
/unix/linux_like/android/b32/x86/
> align.rs
> ":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab","src=
/unix/linux_like/android/b32/x86/
> mod.rs
> ":"e6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src=
/unix/linux_like/android/b64/aarch64/
> align.rs
> ":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src=
/unix/linux_like/android/b64/aarch64/
> int128.rs
> ":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/
> mod.rs
> ":"873af67c4a9757ead56bc797d04efcecd311ecbf0084ebdd198fb690463ef299","src=
/unix/linux_like/android/b64/
> mod.rs
> ":"7b8efbd61ab965c93bacfab78108ff8eed38af07b119099020dc41a9d0901559","src=
/unix/linux_like/android/b64/riscv64/
> align.rs
> ":"0bf138f84e5327d8339bcd4adf071a6832b516445e597552c82bbd881095e3a8","src=
/unix/linux_like/android/b64/riscv64/
> mod.rs
> ":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src=
/unix/linux_like/android/b64/x86_64/
> align.rs
> ":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src=
/unix/linux_like/android/b64/x86_64/
> mod.rs
> ":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src=
/unix/linux_like/android/
> mod.rs
> ":"384275dc1d3559a9f83559b6c903758a9dc4c4b3d13db48d23ed4fdc3c0ff8da","src=
/unix/linux_like/emscripten/
> align.rs
> ":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/
> lfs64.rs
> ":"3776af30a758d765a88920ec4fde442ab89040da13d3b3625c7fbcb8a958559f","src=
/unix/linux_like/emscripten/
> mod.rs
> ":"70d4591730a731ee32788a9d8d2de379592844ec36b7d1723514179605587713","src=
/unix/linux_like/emscripten/
> no_align.rs
> ":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src=
/unix/linux_like/linux/
> align.rs
> ":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff049228f6a1acad80ef8b","src=
/unix/linux_like/linux/arch/generic/
> mod.rs
> ":"3ab533349696d24505adb6bb9183d73fd5e3b17e2f90dd21478af2a47b4d6fa8","src=
/unix/linux_like/linux/arch/mips/
> mod.rs
> ":"ca3db0e3ae852abf18f3588e40d5d64707fcc1829e08ddc5da1080e1a92c8851","src=
/unix/linux_like/linux/arch/
> mod.rs
> ":"5bd5361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src=
/unix/linux_like/linux/arch/powerpc/
> mod.rs
> ":"0bc2d2667a00eca81f4abeb6d613a90848a947f51224103f83268928b8197629","src=
/unix/linux_like/linux/arch/sparc/
> mod.rs
> ":"5e6777863e74a9e2aa9dc487f1059783dd211babc2b32d6bf676f311e49c55d6","src=
/unix/linux_like/linux/gnu/
> align.rs
> ":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src=
/unix/linux_like/linux/gnu/b32/arm/
> align.rs
> ":"6ec0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src=
/unix/linux_like/linux/gnu/b32/arm/
> mod.rs
> ":"f68ec59b6407f9d4e326f3e71a41ec21f19ecfc703edf9a93e496f661fed5506","src=
/unix/linux_like/linux/gnu/b32/csky/
> align.rs
> ":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src=
/unix/linux_like/linux/gnu/b32/csky/
> mod.rs
> ":"8729b68e433e94c2128e51a7db4fd555938e4be4dc64584c352b24a20d9c8e91","src=
/unix/linux_like/linux/gnu/b32/m68k/
> align.rs
> ":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/
> mod.rs
> ":"80956d3fef163ecf248828a6f38782dd8ae856d86b1bb5aac2de36032dbd8ea0","src=
/unix/linux_like/linux/gnu/b32/mips/
> align.rs
> ":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src=
/unix/linux_like/linux/gnu/b32/mips/
> mod.rs
> ":"96e22350d5d132d917c743d6560464500652c67b52c3d0e8474494487df3365d","src=
/unix/linux_like/linux/gnu/b32/
> mod.rs
> ":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b78","src=
/unix/linux_like/linux/gnu/b32/
> powerpc.rs
> ":"20fc3cc4fe1ef6617b63b61b897f782ceb9c2842fc718f504a1840537229bf47","src=
/unix/linux_like/linux/gnu/b32/riscv32/
> align.rs
> ":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src=
/unix/linux_like/linux/gnu/b32/riscv32/
> mod.rs
> ":"887288a0a1cfff319d0e15edcdc4fcb31fd643ff41715ec5244c8f2413624169","src=
/unix/linux_like/linux/gnu/b32/sparc/
> align.rs
> ":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","src=
/unix/linux_like/linux/gnu/b32/sparc/
> mod.rs
> ":"cc4342b949e4d796f304acd9dfe3f721a1c2f37fec16b42d3bb27dc94723af37","src=
/unix/linux_like/linux/gnu/b32/x86/
> align.rs
> ":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src=
/unix/linux_like/linux/gnu/b32/x86/
> mod.rs
> ":"06d4db4ee8352f62a0a5ead0c4d6ea0a78feff522f19b9bc5772f6dd920ffd80","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> align.rs
> ":"fdf1c72375a2167699157e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> fallback.rs
> ":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915cbc59d8be3","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> ilp32.rs
> ":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> int128.rs
> ":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> lp64.rs
> ":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> mod.rs
> ":"8202614484da36c388d2ffdd2554c56bb4f9db8e5bd621f8c36114cdcfeec644","src=
/unix/linux_like/linux/gnu/b64/loongarch64/
> align.rs
> ":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0d45f39beeb60","src=
/unix/linux_like/linux/gnu/b64/loongarch64/
> mod.rs
> ":"10f025edecebc6e0ed8fdae4736ebe7564189741d5b910433f07c21fc12a94d8","src=
/unix/linux_like/linux/gnu/b64/mips64/
> align.rs
> ":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src=
/unix/linux_like/linux/gnu/b64/mips64/
> mod.rs
> ":"73532be4b5775acf9524c77feeefe1f6d1936ceffef908d01dd2586986520f2d","src=
/unix/linux_like/linux/gnu/b64/
> mod.rs
> ":"6a160ef25439c4fecdb0e3bd0b818742263c791364da874d4febd3aa644ec8e2","src=
/unix/linux_like/linux/gnu/b64/powerpc64/
> align.rs
> ":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src=
/unix/linux_like/linux/gnu/b64/powerpc64/
> mod.rs
> ":"a90c2641616c620e9d1fea87695ce046e14f9da2282bb93f761eeb4077c74741","src=
/unix/linux_like/linux/gnu/b64/riscv64/
> align.rs
> ":"fe7e3c928d0367c37eb652686591801c3694a3558ebbbeb5c22be692265d07f2","src=
/unix/linux_like/linux/gnu/b64/riscv64/
> mod.rs
> ":"dec86883731f7b8419bff35b125b40eefc927090c1510f6daf931726f7965c0b","src=
/unix/linux_like/linux/gnu/b64/
> s390x.rs
> ":"1ea9e39432ce6bf68779d33546dacd7d39477a9f8fc3da4f4f339e4538cb74c3","src=
/unix/linux_like/linux/gnu/b64/sparc64/
> align.rs
> ":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src=
/unix/linux_like/linux/gnu/b64/sparc64/
> mod.rs
> ":"bed381c44cec2a5b50125f7e548ab487d4c829006c971d152a611b7141760052","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> align.rs
> ":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b49769","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> mod.rs
> ":"332846e4a5920d7e6b05df0448a2333c5dd00fb27cb33654648f507ee89dbec5","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> not_x32.rs
> ":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4db84ff3285b4421fb","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> x32.rs
> ":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src=
/unix/linux_like/linux/gnu/
> mod.rs
> ":"8d11f66db9993e9a89c86fec3b732d9c0ec4ee42d9570d4e3389c075021dd29f","src=
/unix/linux_like/linux/gnu/
> no_align.rs
> ":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src=
/unix/linux_like/linux/
> mod.rs
> ":"da8c17828415fc1db81fb547fe20b7421774a3bdd3e79053cc127a3031e59302","src=
/unix/linux_like/linux/musl/b32/arm/
> align.rs
> ":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src=
/unix/linux_like/linux/musl/b32/arm/
> mod.rs
> ":"af10147d7c3661751750a58ffad089d5d18d180cd18303c653aef126c07ccd91","src=
/unix/linux_like/linux/musl/b32/
> hexagon.rs
> ":"d079cab42529f7dab699334d43168c74ff4aa0282f11040a8b7d274b65767a7a","src=
/unix/linux_like/linux/musl/b32/mips/
> align.rs
> ":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src=
/unix/linux_like/linux/musl/b32/mips/
> mod.rs
> ":"e44043766f7cd26de7ffa4232654afb6feb03e58dbd5890717970887bd003151","src=
/unix/linux_like/linux/musl/b32/
> mod.rs
> ":"31677597fd9544c4b1ec1477628288f6273fabbc06e38f33da862ad55f019ce1","src=
/unix/linux_like/linux/musl/b32/
> powerpc.rs
> ":"3dae56a4e7789bcc5314e419fea5e4b2495367b4f1a49d1c9477c60225d65eef","src=
/unix/linux_like/linux/musl/b32/riscv32/
> align.rs
> ":"efd2accf33b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src=
/unix/linux_like/linux/musl/b32/riscv32/
> mod.rs
> ":"3ee845d272f91a1908d5f421d7c353e1f14681bbdfef64410e408f4c14365a91","src=
/unix/linux_like/linux/musl/b32/x86/
> align.rs
> ":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src=
/unix/linux_like/linux/musl/b32/x86/
> mod.rs
> ":"f2b53ae0034c833244b7cdb8c670349bf8272a03abf04152eba65cf62810484d","src=
/unix/linux_like/linux/musl/b64/aarch64/
> align.rs
> ":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src=
/unix/linux_like/linux/musl/b64/aarch64/
> int128.rs
> ":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/linux/musl/b64/aarch64/
> mod.rs
> ":"45ce6897afcc960267bb7505702b639daf94dc69428a213bf1aefd367ca32adc","src=
/unix/linux_like/linux/musl/b64/loongarch64/
> align.rs
> ":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0d45f39beeb60","src=
/unix/linux_like/linux/musl/b64/loongarch64/
> mod.rs
> ":"3d9ef92e682a1789544a2bd20cad5a5623db9d7d9f5d0a3692bb0230af034165","src=
/unix/linux_like/linux/musl/b64/
> mips64.rs
> ":"a968ef9c54fa22293085f318c8472c1754482df92cc500568dc33bd807d71ea6","src=
/unix/linux_like/linux/musl/b64/
> mod.rs
> ":"20ceaf90a03c24a2eb154a5dffbfc9a538348404db5b554a3d8126021ba45509","src=
/unix/linux_like/linux/musl/b64/
> powerpc64.rs
> ":"140e579800a67315f4cb8a42b22aa8157eae34ffe626e77e421b43c53c23b34d","src=
/unix/linux_like/linux/musl/b64/riscv64/
> align.rs
> ":"fe7e3c928d0367c37eb652686591801c3694a3558ebbbeb5c22be692265d07f2","src=
/unix/linux_like/linux/musl/b64/riscv64/
> mod.rs
> ":"c5944526d7e19cd43e9d14d119a1d98f8780db7ecbcc79e69d7b9348e596b520","src=
/unix/linux_like/linux/musl/b64/
> s390x.rs
> ":"8557b3477ca8cefef7fce764a3c25441929a54e50ead4091f6f7823c427cd728","src=
/unix/linux_like/linux/musl/b64/x86_64/
> align.rs
> ":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src=
/unix/linux_like/linux/musl/b64/x86_64/
> mod.rs
> ":"a91c4f18027c9958037f78ae48f6352d23cb4e6f2995b2cc8de7dce0e5759470","src=
/unix/linux_like/linux/musl/
> lfs64.rs
> ":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src=
/unix/linux_like/linux/musl/
> mod.rs
> ":"94dd7eb5064230637ccd135383c7d30f8d3f7874c22771b24b529e58de421731","src=
/unix/linux_like/linux/
> no_align.rs
> ":"62cdca0e011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src=
/unix/linux_like/linux/
> non_exhaustive.rs
> ":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src=
/unix/linux_like/linux/uclibc/
> align.rs
> ":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src=
/unix/linux_like/linux/uclibc/arm/
> align.rs
> ":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src=
/unix/linux_like/linux/uclibc/arm/
> mod.rs
> ":"50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src=
/unix/linux_like/linux/uclibc/arm/
> no_align.rs
> ":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src=
/unix/linux_like/linux/uclibc/mips/mips32/
> align.rs
> ":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src=
/unix/linux_like/linux/uclibc/mips/mips32/
> mod.rs
> ":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src=
/unix/linux_like/linux/uclibc/mips/mips32/
> no_align.rs
> ":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src=
/unix/linux_like/linux/uclibc/mips/mips64/
> align.rs
> ":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/
> mod.rs
> ":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0","src=
/unix/linux_like/linux/uclibc/mips/mips64/
> no_align.rs
> ":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src=
/unix/linux_like/linux/uclibc/mips/
> mod.rs
> ":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src=
/unix/linux_like/linux/uclibc/
> mod.rs
> ":"6efae7ed906bc5773dcce43ba1045cf93df5f8dac41f194d8cddc0579f14c015","src=
/unix/linux_like/linux/uclibc/
> no_align.rs
> ":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src=
/unix/linux_like/linux/uclibc/x86_64/
> l4re.rs
> ":"8485b9182b7c67f7344fab377e7cc2a72afefd9ab63837c860514abba9728d76","src=
/unix/linux_like/linux/uclibc/x86_64/
> mod.rs
> ":"e7197f0f68ece174c8ae42b2b9115893abfcdbe44a1a6ed98fb3cbd7bfe087e8","src=
/unix/linux_like/linux/uclibc/x86_64/
> other.rs
> ":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/
> mod.rs
> ":"863f628cbaa864911ffebc58e9fb788b6c6a9651955fc401ac1f40f20eb62505","src=
/unix/
> mod.rs
> ":"5f851ce1756443b9219edd11b6cc2abfb4031a22a6496bb5d4d6090f97779f8a","src=
/unix/newlib/aarch64/
> mod.rs
> ":"964c096288da836b53c0c71d7f3a97048d177da220a69314c5ce93ba330d72af","src=
/unix/newlib/
> align.rs
> ":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/
> mod.rs
> ":"cf754f8b1197489fca01e881a4b4b146e814998e4b365f116fa1a102c00e6a4e","src=
/unix/newlib/espidf/
> mod.rs
> ":"689e29a9fff5a263e5ab8410d0a8919f77fa64aa12f4d71f71085a6f07f19f67","src=
/unix/newlib/
> generic.rs
> ":"5f0b5d07ddb5a5d60580f9561fdb05e9218d9751d4068c4aadad2ba6b950aabf","src=
/unix/newlib/horizon/
> mod.rs
> ":"3a521d22bf932fc01c1d26d1f9bff20f11b1855b03c8236a8eb18310f6cab5a8","src=
/unix/newlib/
> mod.rs
> ":"e5d5faf27a6336b9f1c02b8726427801d906a14dae766852b4e85c1a92df06c8","src=
/unix/newlib/
> no_align.rs
> ":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src=
/unix/newlib/powerpc/
> mod.rs
> ":"cc9e188711b9bf614323ad6c48e0d2e1a1ecc5d3bc64961ba451f29c6c22d2d8","src=
/unix/newlib/vita/
> mod.rs
> ":"ff1caf74bb0696fe15d60dbac598db4520cd538aa0f5989713d97d008eee6ad8","src=
/unix/
> no_align.rs
> ":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src=
/unix/nto/
> aarch64.rs
> ":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555","src=
/unix/nto/
> mod.rs
> ":"5eb045c352114f5d744d098acaf9e47a9223f6fccd43f36b9a3ba79b29af0eee","src=
/unix/nto/
> neutrino.rs
> ":"799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src=
/unix/nto/
> x86_64.rs
> ":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src=
/unix/redox/
> mod.rs
> ":"e75a319975472fe9e0873244fb07c5d2004672b7a4cf7a3cb01532d6d394cb8a","src=
/unix/solarish/
> compat.rs
> ":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src=
/unix/solarish/
> illumos.rs
> ":"26171da367221de1e456f1236250b5831a770d6f109ed12b0ebe4d508e490194","src=
/unix/solarish/
> mod.rs
> ":"c0c5dfc406d728666010cdc2fe21b0df40547ed20dd7ad0eab65906e103b6d4b","src=
/unix/solarish/
> solaris.rs
> ":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src=
/unix/solarish/
> x86.rs
> ":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src=
/unix/solarish/
> x86_64.rs
> ":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src=
/unix/solarish/
> x86_common.rs
> ":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src=
/vxworks/
> aarch64.rs
> ":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src=
/vxworks/
> arm.rs
> ":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/
> mod.rs
> ":"ccdb6a6e0c12011705a15dadc04b26882e6090db4403af4d15cad9330ef96370","src=
/vxworks/
> powerpc.rs
> ":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/
> powerpc64.rs
> ":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src=
/vxworks/
> x86.rs
> ":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src=
/vxworks/
> x86_64.rs
> ":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src=
/
> wasi.rs
> ":"51e38bb98547c40d0822d31975c976cd6e0784463d90d170109c87bf324395d3","src=
/windows/gnu/
> align.rs
> ":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src=
/windows/gnu/
> mod.rs
> ":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src=
/windows/
> mod.rs
> ":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0efc0f74df55b69e249","src=
/windows/msvc/
> mod.rs
> ":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src=
/
> xous.rs
> ":"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tes=
ts/
> const_fn.rs
> ":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"pa=
ckage":"d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439"}
> >> -\ No newline at end of file
> >>
> -+{"files":{"CHANGELOG.md":"96fb278d188e87842fe2701f91e0f757665b44dc2e549=
accb6ed1ed6eeb67602","CONTRIBUTING.md":"a93fcda0a76e1975fcfb0aa2ba00c9b1864=
f9ae6062704a294d81a3688898e10","Cargo.toml":"2196e21d3fd56b3019e235720a32b4=
e3c8ada82c08cb01c06c695752201396df","LICENSE-APACHE":"62c7a1e35f56406896d7a=
a7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f=
56a8932dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"4da2919bb50=
9f3f06163778478494f780ca6627cb79ccab5d2c828c8d88dc133","
> build.rs
> ":"54387230fed8d16f1169a845e92a1c1a5d9227559acbf3bfa383c7901b2d1be8","rus=
tfmt.toml":"eaa2ea84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b=
2","src/
> fixed_width_ints.rs
> ":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","src=
/fuchsia/
> aarch64.rs
> ":"893fcec48142d273063ffd814dca33fbec92205fd39ada97075f85201d803996","src=
/fuchsia/
> align.rs
> ":"ae1cf8f011a99737eabeb14ffff768e60f13b13363d7646744dbb0f443dab3d6","src=
/fuchsia/
> mod.rs
> ":"a8e3ff551e5ff4247ab1faa1b7ca1e042046a619198e8b30fe183c6ef8485d65","src=
/fuchsia/
> no_align.rs
> ":"303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src=
/fuchsia/
> riscv64.rs
> ":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b11","src=
/fuchsia/
> x86_64.rs
> ":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac87","src=
/
> hermit.rs
> ":"ad1e8685edf3f3a7c141ccc0e82d44b7feb13e81f2f59ed6aeb6e4964524637c","src=
/
> lib.rs
> ":"7f57f05b3d9e1e14a666aabbd942cf5959e778966981e604087774d56eb059c8","src=
/
> macros.rs
> ":"5f985b3de7b18833f866bf832b8ffb0430f0f70aa9a468b6a2c855c1bf9d33e4","src=
/
> psp.rs
> ":"0a7d5121a8cc2903009f586c00e4ae2d6126d24eb90531dafaba6f59823aa6b2","src=
/
> sgx.rs
> ":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src=
/solid/
> aarch64.rs
> ":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42ab7f8707","src=
/solid/
> arm.rs
> ":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9cf4f1f4872097fc27fe","src=
/solid/
> mod.rs
> ":"5f4151dca5132e4b4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src=
/
> switch.rs
> ":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src=
/teeos/
> mod.rs
> ":"ecf8922923fb7541ef7b0813cdc5418b75be56247c4dbdbb7dca58a076f25b97","src=
/unix/aix/
> mod.rs
> ":"91de34bf8237e4998e10f9274471d14fb9a31ac6f2ef6e44689066b8e280b3d3","src=
/unix/aix/
> powerpc64.rs
> ":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8296f8e10d55169b","src=
/unix/
> align.rs
> ":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src=
/unix/bsd/apple/b32/
> align.rs
> ":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src=
/unix/bsd/apple/b32/
> mod.rs
> ":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src=
/unix/bsd/apple/b64/aarch64/
> align.rs
> ":"2eaf0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src=
/unix/bsd/apple/b64/aarch64/
> mod.rs
> ":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src=
/unix/bsd/apple/b64/
> align.rs
> ":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src=
/unix/bsd/apple/b64/
> mod.rs
> ":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src=
/unix/bsd/apple/b64/x86_64/
> align.rs
> ":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src=
/unix/bsd/apple/b64/x86_64/
> mod.rs
> ":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src=
/unix/bsd/apple/
> long_array.rs
> ":"3cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src=
/unix/bsd/apple/
> mod.rs
> ":"484698da7c1083a46ae1a389486a8c2d75e3e6ecb4f80ded69b6c0dd2d1a92a0","src=
/unix/bsd/freebsdlike/dragonfly/
> errno.rs
> ":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src=
/unix/bsd/freebsdlike/dragonfly/
> mod.rs
> ":"2777f94909a798df1b8030fb86d02e2118d0ac3e49e9a542df54a569ca5ae2f9","src=
/unix/bsd/freebsdlike/freebsd/
> aarch64.rs
> ":"6c8e216385f53a4bf5f171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src=
/unix/bsd/freebsdlike/freebsd/
> arm.rs
> ":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src=
/unix/bsd/freebsdlike/freebsd/freebsd11/
> b64.rs
> ":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src=
/unix/bsd/freebsdlike/freebsd/freebsd11/
> mod.rs
> ":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec722ba80dac1f","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/
> mod.rs
> ":"bef9fae288a4f29e941ea369be1cd20b170040e60665a4d49a4a9e79009b72d8","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/
> x86_64.rs
> ":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/
> mod.rs
> ":"88be47524b28b6635ccb1e85ea511bf17337be0af7e9baa740c341ac9e83a6f7","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/
> x86_64.rs
> ":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/
> mod.rs
> ":"6ddc6abf6d5ccaea0d8cccf521e8ca6457efcad3086af4155628d5d06d672346","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/
> x86_64.rs
> ":"e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src=
/unix/bsd/freebsdlike/freebsd/freebsd15/
> b64.rs
> ":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src=
/unix/bsd/freebsdlike/freebsd/freebsd15/
> mod.rs
> ":"93115c1a9faa43ebf58b7dee3582aed5a54291b284764e370e7f649b2e6a9565","src=
/unix/bsd/freebsdlike/freebsd/freebsd15/
> x86_64.rs
> ":"e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src=
/unix/bsd/freebsdlike/freebsd/
> mod.rs
> ":"08e39a42392936857fd0c1c6b01788f5630fe8ff7f78b062490509c5dd816a42","src=
/unix/bsd/freebsdlike/freebsd/
> powerpc.rs
> ":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src=
/unix/bsd/freebsdlike/freebsd/
> powerpc64.rs
> ":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src=
/unix/bsd/freebsdlike/freebsd/
> riscv64.rs
> ":"fa4bed4c58cad24ba3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src=
/unix/bsd/freebsdlike/freebsd/
> x86.rs
> ":"2837fed0ffee0ec443ecdb743b7142bcb4d6ba2de87e05459fb4498789d47200","src=
/unix/bsd/freebsdlike/freebsd/x86_64/
> align.rs
> ":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src=
/unix/bsd/freebsdlike/freebsd/x86_64/
> mod.rs
> ":"e4d76219bec0621db07dec37de9be1a9b7fb38daa10ffc1a6adbdbc34e163435","src=
/unix/bsd/freebsdlike/
> mod.rs
> ":"c846f30eaffc7c1a21b4acd3df75cd17bb3d4f11401c9a9770924e4e6d847995","src=
/unix/bsd/
> mod.rs
> ":"37765749481f7d0dec8681d8c9d0735e6021094b4ef4a2d9aab5643d7a4232e1","src=
/unix/bsd/netbsdlike/
> mod.rs
> ":"ea60540aa4edd4e43136749d5df497b1dc072b9912b6030dd1ab794a6d1c3c3c","src=
/unix/bsd/netbsdlike/netbsd/
> aarch64.rs
> ":"057ee877db7193ba0dc10801b9a6563ac6dbdb78376d6851a84cb12b30841759","src=
/unix/bsd/netbsdlike/netbsd/
> arm.rs
> ":"949b55e4dee1c8c511f4f061a6a57ac876a6c0eabfaf5cc20e9ab40d8f41b2e0","src=
/unix/bsd/netbsdlike/netbsd/
> mips.rs
> ":"88be18ac43ba224c77e78e4179b6761debc5e6c30a258fac56263809c7af4fbc","src=
/unix/bsd/netbsdlike/netbsd/
> mod.rs
> ":"ab09cea2897ecd27fc7e35822dac23d6dcd53f8577c771db3ee8b015e8d82001","src=
/unix/bsd/netbsdlike/netbsd/
> powerpc.rs
> ":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src=
/unix/bsd/netbsdlike/netbsd/
> riscv64.rs
> ":"1cbe2e5ed681cb1054b699da37daaf6c714267df7d332c90fc2a589b11579625","src=
/unix/bsd/netbsdlike/netbsd/
> sparc64.rs
> ":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src=
/unix/bsd/netbsdlike/netbsd/
> x86.rs
> ":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src=
/unix/bsd/netbsdlike/netbsd/
> x86_64.rs
> ":"532b76199d6c71ff996eade9f906c55a72c9aff489595d25a21e21878cfd740b","src=
/unix/bsd/netbsdlike/openbsd/
> aarch64.rs
> ":"dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src=
/unix/bsd/netbsdlike/openbsd/
> arm.rs
> ":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src=
/unix/bsd/netbsdlike/openbsd/
> mips64.rs
> ":"8532a189ae10c7d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src=
/unix/bsd/netbsdlike/openbsd/
> mod.rs
> ":"7b93b5b24b3c72a79b2de19b47ac2f56b29d87e9fc8f4c721a63d1e87ec83fcc","src=
/unix/bsd/netbsdlike/openbsd/
> powerpc.rs
> ":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src=
/unix/bsd/netbsdlike/openbsd/
> powerpc64.rs
> ":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src=
/unix/bsd/netbsdlike/openbsd/
> riscv64.rs
> ":"1fe3332dc705a13e6242219970f5449d6d7a73e2e6c8537ab8e421d8a6f2e3ff","src=
/unix/bsd/netbsdlike/openbsd/
> sparc64.rs
> ":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src=
/unix/bsd/netbsdlike/openbsd/
> x86.rs
> ":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","src=
/unix/bsd/netbsdlike/openbsd/
> x86_64.rs
> ":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src=
/unix/haiku/
> b32.rs
> ":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","src=
/unix/haiku/
> b64.rs
> ":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf4681f91ff7985","src=
/unix/haiku/
> mod.rs
> ":"b75976d84bdf4a3a226336bb06ec231d552240f302bb5da48ead692fd72758f9","src=
/unix/haiku/
> native.rs
> ":"2b1f88c043777a915bb7218aa05a3647a0e0481ebff55a99e351c45dea2be8de","src=
/unix/haiku/
> x86_64.rs
> ":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src=
/unix/hurd/
> align.rs
> ":"03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src=
/unix/hurd/
> b32.rs
> ":"2ba90ed973f90366c36a6387833a3df42abfee9622d4a0352635937d4a89eaf4","src=
/unix/hurd/
> b64.rs
> ":"d919b4aec9b3080ad24c125c57b2c8b2e483d72045f1554c429d14560355846f","src=
/unix/hurd/
> mod.rs
> ":"23ebadfdb9a92d7fb9e32b6a7c95669ce979ba7407b924869f40a59d2807d052","src=
/unix/hurd/
> no_align.rs
> ":"03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src=
/unix/linux_like/android/b32/
> arm.rs
> ":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3ec2564","src=
/unix/linux_like/android/b32/
> mod.rs
> ":"7c173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src=
/unix/linux_like/android/b32/x86/
> align.rs
> ":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab","src=
/unix/linux_like/android/b32/x86/
> mod.rs
> ":"e6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src=
/unix/linux_like/android/b64/aarch64/
> align.rs
> ":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src=
/unix/linux_like/android/b64/aarch64/
> int128.rs
> ":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/
> mod.rs
> ":"873af67c4a9757ead56bc797d04efcecd311ecbf0084ebdd198fb690463ef299","src=
/unix/linux_like/android/b64/
> mod.rs
> ":"7b8efbd61ab965c93bacfab78108ff8eed38af07b119099020dc41a9d0901559","src=
/unix/linux_like/android/b64/riscv64/
> align.rs
> ":"0bf138f84e5327d8339bcd4adf071a6832b516445e597552c82bbd881095e3a8","src=
/unix/linux_like/android/b64/riscv64/
> mod.rs
> ":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src=
/unix/linux_like/android/b64/x86_64/
> align.rs
> ":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src=
/unix/linux_like/android/b64/x86_64/
> mod.rs
> ":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src=
/unix/linux_like/android/
> mod.rs
> ":"384275dc1d3559a9f83559b6c903758a9dc4c4b3d13db48d23ed4fdc3c0ff8da","src=
/unix/linux_like/emscripten/
> align.rs
> ":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src=
/unix/linux_like/emscripten/
> lfs64.rs
> ":"3776af30a758d765a88920ec4fde442ab89040da13d3b3625c7fbcb8a958559f","src=
/unix/linux_like/emscripten/
> mod.rs
> ":"70d4591730a731ee32788a9d8d2de379592844ec36b7d1723514179605587713","src=
/unix/linux_like/emscripten/
> no_align.rs
> ":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src=
/unix/linux_like/linux/
> align.rs
> ":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff049228f6a1acad80ef8b","src=
/unix/linux_like/linux/arch/generic/
> mod.rs
> ":"10577c664dbdd5d1410e53e3872435ad595758bd1deb410b1bce7825cd150178","src=
/unix/linux_like/linux/arch/mips/
> mod.rs
> ":"ca3db0e3ae852abf18f3588e40d5d64707fcc1829e08ddc5da1080e1a92c8851","src=
/unix/linux_like/linux/arch/
> mod.rs
> ":"5bd5361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src=
/unix/linux_like/linux/arch/powerpc/
> mod.rs
> ":"0bc2d2667a00eca81f4abeb6d613a90848a947f51224103f83268928b8197629","src=
/unix/linux_like/linux/arch/sparc/
> mod.rs
> ":"5e6777863e74a9e2aa9dc487f1059783dd211babc2b32d6bf676f311e49c55d6","src=
/unix/linux_like/linux/gnu/
> align.rs
> ":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src=
/unix/linux_like/linux/gnu/b32/arm/
> align.rs
> ":"6ec0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src=
/unix/linux_like/linux/gnu/b32/arm/
> mod.rs
> ":"f68ec59b6407f9d4e326f3e71a41ec21f19ecfc703edf9a93e496f661fed5506","src=
/unix/linux_like/linux/gnu/b32/csky/
> align.rs
> ":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src=
/unix/linux_like/linux/gnu/b32/csky/
> mod.rs
> ":"8729b68e433e94c2128e51a7db4fd555938e4be4dc64584c352b24a20d9c8e91","src=
/unix/linux_like/linux/gnu/b32/m68k/
> align.rs
> ":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/
> mod.rs
> ":"80956d3fef163ecf248828a6f38782dd8ae856d86b1bb5aac2de36032dbd8ea0","src=
/unix/linux_like/linux/gnu/b32/mips/
> align.rs
> ":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src=
/unix/linux_like/linux/gnu/b32/mips/
> mod.rs
> ":"96e22350d5d132d917c743d6560464500652c67b52c3d0e8474494487df3365d","src=
/unix/linux_like/linux/gnu/b32/
> mod.rs
> ":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b78","src=
/unix/linux_like/linux/gnu/b32/
> powerpc.rs
> ":"20fc3cc4fe1ef6617b63b61b897f782ceb9c2842fc718f504a1840537229bf47","src=
/unix/linux_like/linux/gnu/b32/riscv32/
> align.rs
> ":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src=
/unix/linux_like/linux/gnu/b32/riscv32/
> mod.rs
> ":"887288a0a1cfff319d0e15edcdc4fcb31fd643ff41715ec5244c8f2413624169","src=
/unix/linux_like/linux/gnu/b32/sparc/
> align.rs
> ":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","src=
/unix/linux_like/linux/gnu/b32/sparc/
> mod.rs
> ":"cc4342b949e4d796f304acd9dfe3f721a1c2f37fec16b42d3bb27dc94723af37","src=
/unix/linux_like/linux/gnu/b32/x86/
> align.rs
> ":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src=
/unix/linux_like/linux/gnu/b32/x86/
> mod.rs
> ":"06d4db4ee8352f62a0a5ead0c4d6ea0a78feff522f19b9bc5772f6dd920ffd80","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> align.rs
> ":"fdf1c72375a2167699157e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> fallback.rs
> ":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915cbc59d8be3","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> ilp32.rs
> ":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> int128.rs
> ":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> lp64.rs
> ":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","src=
/unix/linux_like/linux/gnu/b64/aarch64/
> mod.rs
> ":"8202614484da36c388d2ffdd2554c56bb4f9db8e5bd621f8c36114cdcfeec644","src=
/unix/linux_like/linux/gnu/b64/loongarch64/
> align.rs
> ":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0d45f39beeb60","src=
/unix/linux_like/linux/gnu/b64/loongarch64/
> mod.rs
> ":"10f025edecebc6e0ed8fdae4736ebe7564189741d5b910433f07c21fc12a94d8","src=
/unix/linux_like/linux/gnu/b64/mips64/
> align.rs
> ":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src=
/unix/linux_like/linux/gnu/b64/mips64/
> mod.rs
> ":"73532be4b5775acf9524c77feeefe1f6d1936ceffef908d01dd2586986520f2d","src=
/unix/linux_like/linux/gnu/b64/
> mod.rs
> ":"6a160ef25439c4fecdb0e3bd0b818742263c791364da874d4febd3aa644ec8e2","src=
/unix/linux_like/linux/gnu/b64/powerpc64/
> align.rs
> ":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src=
/unix/linux_like/linux/gnu/b64/powerpc64/
> mod.rs
> ":"a90c2641616c620e9d1fea87695ce046e14f9da2282bb93f761eeb4077c74741","src=
/unix/linux_like/linux/gnu/b64/riscv64/
> align.rs
> ":"fe7e3c928d0367c37eb652686591801c3694a3558ebbbeb5c22be692265d07f2","src=
/unix/linux_like/linux/gnu/b64/riscv64/
> mod.rs
> ":"dec86883731f7b8419bff35b125b40eefc927090c1510f6daf931726f7965c0b","src=
/unix/linux_like/linux/gnu/b64/
> s390x.rs
> ":"1ea9e39432ce6bf68779d33546dacd7d39477a9f8fc3da4f4f339e4538cb74c3","src=
/unix/linux_like/linux/gnu/b64/sparc64/
> align.rs
> ":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src=
/unix/linux_like/linux/gnu/b64/sparc64/
> mod.rs
> ":"bed381c44cec2a5b50125f7e548ab487d4c829006c971d152a611b7141760052","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> align.rs
> ":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b49769","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> mod.rs
> ":"332846e4a5920d7e6b05df0448a2333c5dd00fb27cb33654648f507ee89dbec5","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> not_x32.rs
> ":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4db84ff3285b4421fb","src=
/unix/linux_like/linux/gnu/b64/x86_64/
> x32.rs
> ":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src=
/unix/linux_like/linux/gnu/
> mod.rs
> ":"8d11f66db9993e9a89c86fec3b732d9c0ec4ee42d9570d4e3389c075021dd29f","src=
/unix/linux_like/linux/gnu/
> no_align.rs
> ":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src=
/unix/linux_like/linux/
> mod.rs
> ":"da8c17828415fc1db81fb547fe20b7421774a3bdd3e79053cc127a3031e59302","src=
/unix/linux_like/linux/musl/b32/arm/
> align.rs
> ":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src=
/unix/linux_like/linux/musl/b32/arm/
> mod.rs
> ":"af10147d7c3661751750a58ffad089d5d18d180cd18303c653aef126c07ccd91","src=
/unix/linux_like/linux/musl/b32/
> hexagon.rs
> ":"d079cab42529f7dab699334d43168c74ff4aa0282f11040a8b7d274b65767a7a","src=
/unix/linux_like/linux/musl/b32/mips/
> align.rs
> ":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src=
/unix/linux_like/linux/musl/b32/mips/
> mod.rs
> ":"e44043766f7cd26de7ffa4232654afb6feb03e58dbd5890717970887bd003151","src=
/unix/linux_like/linux/musl/b32/
> mod.rs
> ":"31677597fd9544c4b1ec1477628288f6273fabbc06e38f33da862ad55f019ce1","src=
/unix/linux_like/linux/musl/b32/
> powerpc.rs
> ":"3dae56a4e7789bcc5314e419fea5e4b2495367b4f1a49d1c9477c60225d65eef","src=
/unix/linux_like/linux/musl/b32/riscv32/
> align.rs
> ":"efd2accf33b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src=
/unix/linux_like/linux/musl/b32/riscv32/
> mod.rs
> ":"3ee845d272f91a1908d5f421d7c353e1f14681bbdfef64410e408f4c14365a91","src=
/unix/linux_like/linux/musl/b32/x86/
> align.rs
> ":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src=
/unix/linux_like/linux/musl/b32/x86/
> mod.rs
> ":"f2b53ae0034c833244b7cdb8c670349bf8272a03abf04152eba65cf62810484d","src=
/unix/linux_like/linux/musl/b64/aarch64/
> align.rs
> ":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src=
/unix/linux_like/linux/musl/b64/aarch64/
> int128.rs
> ":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/linux/musl/b64/aarch64/
> mod.rs
> ":"45ce6897afcc960267bb7505702b639daf94dc69428a213bf1aefd367ca32adc","src=
/unix/linux_like/linux/musl/b64/loongarch64/
> align.rs
> ":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0d45f39beeb60","src=
/unix/linux_like/linux/musl/b64/loongarch64/
> mod.rs
> ":"3d9ef92e682a1789544a2bd20cad5a5623db9d7d9f5d0a3692bb0230af034165","src=
/unix/linux_like/linux/musl/b64/
> mips64.rs
> ":"a968ef9c54fa22293085f318c8472c1754482df92cc500568dc33bd807d71ea6","src=
/unix/linux_like/linux/musl/b64/
> mod.rs
> ":"20ceaf90a03c24a2eb154a5dffbfc9a538348404db5b554a3d8126021ba45509","src=
/unix/linux_like/linux/musl/b64/
> powerpc64.rs
> ":"140e579800a67315f4cb8a42b22aa8157eae34ffe626e77e421b43c53c23b34d","src=
/unix/linux_like/linux/musl/b64/riscv64/
> align.rs
> ":"fe7e3c928d0367c37eb652686591801c3694a3558ebbbeb5c22be692265d07f2","src=
/unix/linux_like/linux/musl/b64/riscv64/
> mod.rs
> ":"c5944526d7e19cd43e9d14d119a1d98f8780db7ecbcc79e69d7b9348e596b520","src=
/unix/linux_like/linux/musl/b64/
> s390x.rs
> ":"8557b3477ca8cefef7fce764a3c25441929a54e50ead4091f6f7823c427cd728","src=
/unix/linux_like/linux/musl/b64/x86_64/
> align.rs
> ":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src=
/unix/linux_like/linux/musl/b64/x86_64/
> mod.rs
> ":"a91c4f18027c9958037f78ae48f6352d23cb4e6f2995b2cc8de7dce0e5759470","src=
/unix/linux_like/linux/musl/
> lfs64.rs
> ":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src=
/unix/linux_like/linux/musl/
> mod.rs
> ":"94dd7eb5064230637ccd135383c7d30f8d3f7874c22771b24b529e58de421731","src=
/unix/linux_like/linux/
> no_align.rs
> ":"62cdca0e011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src=
/unix/linux_like/linux/
> non_exhaustive.rs
> ":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src=
/unix/linux_like/linux/uclibc/
> align.rs
> ":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src=
/unix/linux_like/linux/uclibc/arm/
> align.rs
> ":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src=
/unix/linux_like/linux/uclibc/arm/
> mod.rs
> ":"50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src=
/unix/linux_like/linux/uclibc/arm/
> no_align.rs
> ":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src=
/unix/linux_like/linux/uclibc/mips/mips32/
> align.rs
> ":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src=
/unix/linux_like/linux/uclibc/mips/mips32/
> mod.rs
> ":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src=
/unix/linux_like/linux/uclibc/mips/mips32/
> no_align.rs
> ":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src=
/unix/linux_like/linux/uclibc/mips/mips64/
> align.rs
> ":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/
> mod.rs
> ":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0","src=
/unix/linux_like/linux/uclibc/mips/mips64/
> no_align.rs
> ":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src=
/unix/linux_like/linux/uclibc/mips/
> mod.rs
> ":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src=
/unix/linux_like/linux/uclibc/
> mod.rs
> ":"6efae7ed906bc5773dcce43ba1045cf93df5f8dac41f194d8cddc0579f14c015","src=
/unix/linux_like/linux/uclibc/
> no_align.rs
> ":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src=
/unix/linux_like/linux/uclibc/x86_64/
> l4re.rs
> ":"8485b9182b7c67f7344fab377e7cc2a72afefd9ab63837c860514abba9728d76","src=
/unix/linux_like/linux/uclibc/x86_64/
> mod.rs
> ":"e7197f0f68ece174c8ae42b2b9115893abfcdbe44a1a6ed98fb3cbd7bfe087e8","src=
/unix/linux_like/linux/uclibc/x86_64/
> other.rs
> ":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/
> mod.rs
> ":"863f628cbaa864911ffebc58e9fb788b6c6a9651955fc401ac1f40f20eb62505","src=
/unix/
> mod.rs
> ":"5f851ce1756443b9219edd11b6cc2abfb4031a22a6496bb5d4d6090f97779f8a","src=
/unix/newlib/aarch64/
> mod.rs
> ":"964c096288da836b53c0c71d7f3a97048d177da220a69314c5ce93ba330d72af","src=
/unix/newlib/
> align.rs
> ":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/
> mod.rs
> ":"cf754f8b1197489fca01e881a4b4b146e814998e4b365f116fa1a102c00e6a4e","src=
/unix/newlib/espidf/
> mod.rs
> ":"689e29a9fff5a263e5ab8410d0a8919f77fa64aa12f4d71f71085a6f07f19f67","src=
/unix/newlib/
> generic.rs
> ":"5f0b5d07ddb5a5d60580f9561fdb05e9218d9751d4068c4aadad2ba6b950aabf","src=
/unix/newlib/horizon/
> mod.rs
> ":"3a521d22bf932fc01c1d26d1f9bff20f11b1855b03c8236a8eb18310f6cab5a8","src=
/unix/newlib/
> mod.rs
> ":"e5d5faf27a6336b9f1c02b8726427801d906a14dae766852b4e85c1a92df06c8","src=
/unix/newlib/
> no_align.rs
> ":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src=
/unix/newlib/powerpc/
> mod.rs
> ":"cc9e188711b9bf614323ad6c48e0d2e1a1ecc5d3bc64961ba451f29c6c22d2d8","src=
/unix/newlib/vita/
> mod.rs
> ":"ff1caf74bb0696fe15d60dbac598db4520cd538aa0f5989713d97d008eee6ad8","src=
/unix/
> no_align.rs
> ":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src=
/unix/nto/
> aarch64.rs
> ":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555","src=
/unix/nto/
> mod.rs
> ":"5eb045c352114f5d744d098acaf9e47a9223f6fccd43f36b9a3ba79b29af0eee","src=
/unix/nto/
> neutrino.rs
> ":"799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src=
/unix/nto/
> x86_64.rs
> ":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src=
/unix/redox/
> mod.rs
> ":"e75a319975472fe9e0873244fb07c5d2004672b7a4cf7a3cb01532d6d394cb8a","src=
/unix/solarish/
> compat.rs
> ":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src=
/unix/solarish/
> illumos.rs
> ":"26171da367221de1e456f1236250b5831a770d6f109ed12b0ebe4d508e490194","src=
/unix/solarish/
> mod.rs
> ":"c0c5dfc406d728666010cdc2fe21b0df40547ed20dd7ad0eab65906e103b6d4b","src=
/unix/solarish/
> solaris.rs
> ":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src=
/unix/solarish/
> x86.rs
> ":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src=
/unix/solarish/
> x86_64.rs
> ":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src=
/unix/solarish/
> x86_common.rs
> ":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src=
/vxworks/
> aarch64.rs
> ":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src=
/vxworks/
> arm.rs
> ":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/
> mod.rs
> ":"ccdb6a6e0c12011705a15dadc04b26882e6090db4403af4d15cad9330ef96370","src=
/vxworks/
> powerpc.rs
> ":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/
> powerpc64.rs
> ":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src=
/vxworks/
> x86.rs
> ":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src=
/vxworks/
> x86_64.rs
> ":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src=
/
> wasi.rs
> ":"51e38bb98547c40d0822d31975c976cd6e0784463d90d170109c87bf324395d3","src=
/windows/gnu/
> align.rs
> ":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src=
/windows/gnu/
> mod.rs
> ":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src=
/windows/
> mod.rs
> ":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0efc0f74df55b69e249","src=
/windows/msvc/
> mod.rs
> ":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src=
/
> xous.rs
> ":"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tes=
ts/
> const_fn.rs
> ":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"pa=
ckage":"d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439"}
> >> -diff --git
> a/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/mod.rs
> b/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/mod.rs
> >> -index 2f437e16d..db1f1e70f 100644
> >> ---- a/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/
> mod.rs
> >> -+++ b/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/
> mod.rs
> >> -@@ -114,6 +114,7 @@ cfg_if! {
> >> -                  target_arch =3D "x86_64",
> >> -                  target_arch =3D "arm",
> >> -                  target_arch =3D "aarch64",
> >> -+                 target_arch =3D "riscv32",
> >> -                  target_arch =3D "riscv64",
> >> -                  target_arch =3D "s390x",
> >> -                  target_arch =3D "csky",
> >> -@@ -218,7 +219,10 @@ cfg_if! {
> >> -     // where S stands for size (int, long, struct...)
> >> -     // where T stands for type ('f','v','X'...)
> >> -     // where N stands for NR (NumbeR)
> >> --    if #[cfg(any(target_arch =3D "x86", target_arch =3D "arm",
> target_arch =3D "csky"))] {
> >> -+    if #[cfg(any(target_arch =3D "x86",
> >> -+                 target_arch =3D "arm",
> >> -+                 target_arch =3D "riscv32",
> >> -+                 target_arch =3D "csky"))] {
> >> -         pub const FS_IOC_GETFLAGS: ::Ioctl =3D 0x80046601;
> >> -         pub const FS_IOC_SETFLAGS: ::Ioctl =3D 0x40046602;
> >> -         pub const FS_IOC_GETVERSION: ::Ioctl =3D 0x80047601;
> >>  diff --git a/vendor/libc-0.2.167/.cargo-checksum.json
> b/vendor/libc-0.2.167/.cargo-checksum.json
> >>  index 7ea5d4122..def87f4ef 100644
> >>  --- a/vendor/libc-0.2.167/.cargo-checksum.json
> >> diff --git
> a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-swit=
ch-off-lto-for-rust.patch
> b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-swit=
ch-off-lto-for-rust.patch
> >> index e63cfb0719..5e0f5912a1 100644
> >> ---
> a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-swit=
ch-off-lto-for-rust.patch
> >> +++
> b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs-swit=
ch-off-lto-for-rust.patch
> >> @@ -24,23 +24,53 @@ diff --git a/src/bootstrap/src/core/build_steps/
> tool.rs b/src/bootstrap/src/core
> >>  index 087df2f8a..00790affb 100644
> >>  --- a/src/bootstrap/src/core/build_steps/tool.rs
> >>  +++ b/src/bootstrap/src/core/build_steps/tool.rs
> >> -@@ -635,7 +635,7 @@ impl Step for Rustdoc {
> >> -         }
> >> +@@ -1,14 +1,11 @@
> >> + use std::path::PathBuf;
> >> + use std::{env, fs};
> >>
> >> -         // NOTE: Never modify the rustflags here, it breaks the buil=
d
> cache for other tools!
> >> --        let cargo =3D prepare_tool_cargo(
> >> -+        let mut cargo =3D prepare_tool_cargo(
> >> -             builder,
> >> -             build_compiler,
> >> -             Mode::ToolRustc,
> >> -@@ -645,6 +645,7 @@ impl Step for Rustdoc {
> >> +-use crate::core::build_steps::compile::is_lto_stage;
> >> + use crate::core::build_steps::toolstate::ToolState;
> >> + use crate::core::build_steps::{compile, llvm};
> >> + use crate::core::builder;
> >> +-use crate::core::builder::{
> >> +-    Builder, Cargo as CargoCommand, RunConfig, ShouldRun, Step,
> cargo_profile_var,
> >> +-};
> >> +-use crate::core::config::{DebuginfoLevel, RustcLto, TargetSelection}=
;
> >> ++use crate::core::builder::{Builder, Cargo as CargoCommand, RunConfig=
,
> ShouldRun, Step};
> >> ++use crate::core::config::{DebuginfoLevel, TargetSelection};
> >> + use crate::utils::channel::GitInfo;
> >> + use crate::utils::exec::{BootstrapCommand, command};
> >> + use crate::utils::helpers::{add_dylib_path, exe, t};
> >> +@@ -658,19 +655,7 @@
> >>               SourceType::InTree,
> >>               features.as_slice(),
> >>           );
> >> +-
> >> +-        // rustdoc is performance sensitive, so apply LTO to it.
> >> +-        if is_lto_stage(&build_compiler) {
> >> +-            let lto =3D match builder.config.rust_lto {
> >> +-                RustcLto::Off =3D> Some("off"),
> >> +-                RustcLto::Thin =3D> Some("thin"),
> >> +-                RustcLto::Fat =3D> Some("fat"),
> >> +-                RustcLto::ThinLocal =3D> None,
> >> +-            };
> >> +-            if let Some(lto) =3D lto {
> >> +-                cargo.env(cargo_profile_var("LTO", &builder.config),
> lto);
> >> +-            }
> >> +-        }
> >>  +        cargo.rustflag("-Clto=3Doff");
> >>
> >>           let _guard =3D builder.msg_tool(
> >>               Kind::Build,
> >> ---
> >> -2.39.5
> >> -
> >> +diff --git a/src/bootstrap/src/core/builder/mod.rs
> b/src/bootstrap/src/core/builder/mod.rs
> >> +--- a/src/bootstrap/src/core/builder/mod.rs
> >> ++++ b/src/bootstrap/src/core/builder/mod.rs
> >> +@@ -11,7 +11,7 @@
> >> +
> >> + use clap::ValueEnum;
> >> +
> >> +-pub use self::cargo::{Cargo, cargo_profile_var};
> >> ++pub use self::cargo::Cargo;
> >> + pub use crate::Compiler;
> >> + use crate::core::build_steps::{
> >> +     check, clean, clippy, compile, dist, doc, gcc, install, llvm,
> run, setup, test, tool, vendor,
> >> diff --git
> a/meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.pat=
ch
> b/meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.pat=
ch
> >> deleted file mode 100644
> >> index 6bb1738d05..0000000000
> >> ---
> a/meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-check.pat=
ch
> >> +++ /dev/null
> >> @@ -1,31 +0,0 @@
> >> -Fix bootstrap failure when multilibs are enabled.
> >> -
> >> -Upstream-Status: Backport [
> https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad46fd55=
47bd4916
> ]
> >> -
> >> -Signed-off-by: Deepesh Varatharajan <
> Deepesh.Varatharajan@windriver.com>
> >> ----
> >> -diff --git a/src/bootstrap/src/core/builder/cargo.rs
> b/src/bootstrap/src/core/builder/cargo.rs
> >> -index 066e6bf53f..a2f6fac4b1 100644
> >> ---- a/src/bootstrap/src/core/builder/cargo.rs
> >> -+++ b/src/bootstrap/src/core/builder/cargo.rs
> >> -@@ -646,7 +646,10 @@ impl Builder<'_> {
> >> -                 // Build proc macros both for the host and the targe=
t
> unless proc-macros are not
> >> -                 // supported by the target.
> >> -                 if target !=3D compiler.host && cmd_kind !=3D Kind::=
Check
> {
> >> --                    let error =3D command(self.rustc(compiler))
> >> -+                    let mut rustc_cmd =3D command(self.rustc(compile=
r));
> >> -+                    self.add_rustc_lib_path(compiler, &mut rustc_cmd=
);
> >> -+
> >> -+                    let error =3D rustc_cmd
> >> -                         .arg("--target")
> >> -                         .arg(target.rustc_target_arg())
> >> -                         .arg("--print=3Dfile-names")
> >> -@@ -654,6 +657,7 @@ impl Builder<'_> {
> >> -                         .arg("-")
> >> -                         .run_capture(self)
> >> -                         .stderr();
> >> -+
> >> -                     let not_supported =3D error
> >> -                         .lines()
> >> -                         .any(|line| line.contains("unsupported crate
> type `proc-macro`"));
> >> -
> >> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> >> index 048fc3f10b..49d85072cb 100644
> >> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> >> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
> >> @@ -43,10 +43,10 @@ diff --git a/compiler/rustc_interface/src/tests.rs
> b/compiler/rustc_interface/sr
> >>   fn test_can_print_warnings() {
> >>       sess_and_cfg(&["-Awarnings"], |sess, _cfg| {
> >>           assert!(!sess.dcx().can_emit_warnings());
> >> -diff --git a/library/std/src/sync/poison/rwlock/tests.rs
> b/library/std/src/sync/poison/rwlock/tests.rs
> >> +diff --git a/library/std/tests/sync/rwlock.rs
> b/library/std/tests/sync/rwlock.rs
> >>  index 1a9d3d3f12f..0a9cfc48806 100644
> >> ---- a/library/std/src/sync/poison/rwlock/tests.rs
> >> -+++ b/library/std/src/sync/poison/rwlock/tests.rs
> >> +--- a/library/std/tests/sync/rwlock.rs
> >> ++++ b/library/std/tests/sync/rwlock.rs
> >>  @@ -47,6 +47,7 @@ fn frob() {
> >>   }
> >>
> >> @@ -114,9 +114,9 @@ diff --git a/library/test/src/tests.rs
> b/library/test/src/tests.rs
> >>   fn test_time_options_threshold() {
> >>       let unit =3D TimeThreshold::new(Duration::from_millis(50),
> Duration::from_millis(100));
> >>       let integration =3D TimeThreshold::new(Duration::from_millis(500=
),
> Duration::from_millis(1000));
> >> -diff --git a/library/std/src/sync/poison/mutex/tests.rs
> b/library/std/src/sync/poison/mutex/tests.rs
> >> ---- a/library/std/src/sync/poison/mutex/tests.rs
> >> -+++ b/library/std/src/sync/poison/mutex/tests.rs
> >> +diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync=
/
> mutex.rs
> >> +--- a/library/std/tests/sync/mutex.rs
> >> ++++ b/library/std/tests/sync/mutex.rs
> >>  @@ -193,6 +193,7 @@
> >>   }
> >>
> >> @@ -125,9 +125,9 @@ diff --git a/library/std/src/sync/poison/mutex/
> tests.rs b/library/std/src/sync/p
> >>   fn test_mutex_arc_poison_mapped() {
> >>       let arc =3D Arc::new(Mutex::new(1));
> >>       assert!(!arc.is_poisoned());
> >> -diff --git a/library/std/src/sync/poison/mutex/tests.rs
> b/library/std/src/sync/poison/mutex/tests.rs
> >> ---- a/library/std/src/sync/poison/mutex/tests.rs
> >> -+++ b/library/std/src/sync/poison/mutex/tests.rs
> >> +diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync=
/
> mutex.rs
> >> +--- a/library/std/tests/sync/mutex.rs
> >> ++++ b/library/std/tests/sync/mutex.rs
> >>  @@ -272,6 +272,7 @@
> >>   }
> >>
> >> @@ -136,9 +136,9 @@ diff --git a/library/std/src/sync/poison/mutex/
> tests.rs b/library/std/src/sync/p
> >>   fn panic_while_mapping_unlocked_poison() {
> >>       let lock =3D Mutex::new(());
> >>
> >> -diff --git a/library/std/src/sync/rwlock/tests.rs
> b/library/std/src/sync/poison/rwlock/tests.rs
> >> ---- a/library/std/src/sync/poison/rwlock/tests.rs
> >> -+++ b/library/std/src/sync/poison/rwlock/tests.rs
> >> +diff --git a/library/std/src/sync/rwlock/tests.rs
> b/library/std/tests/sync/rwlock.rs
> >> +--- a/library/std/tests/sync/rwlock.rs
> >> ++++ b/library/std/tests/sync/rwlock.rs
> >>  @@ -59,6 +59,7 @@ fn test_rw_arc_poison_wr() {
> >>   }
> >>
> >> @@ -163,10 +163,10 @@ diff --git a/library/std/src/sync/rwlock/tests.r=
s
> b/library/std/src/sync/poison/
> >>   fn panic_while_mapping_write_unlocked_poison() {
> >>       let lock =3D RwLock::new(());
> >>
> >> -diff --git a/library/core/benches/num/int_log/mod.rs
> b/library/core/benches/num/int_log/mod.rs
> >> +diff --git a/library/coretests/benches/num/int_log/mod.rs
> b/library/coretests/benches/num/int_log/mod.rs
> >>  index 3807cd5d76c..018c5c04456 100644
> >> ---- a/library/core/benches/num/int_log/mod.rs
> >> -+++ b/library/core/benches/num/int_log/mod.rs
> >> +--- a/library/coretests/benches/num/int_log/mod.rs
> >> ++++ b/library/coretests/benches/num/int_log/mod.rs
> >>  @@ -98,6 +98,7 @@ fn $random_small(bench: &mut Bencher) {
> >>           }
> >>
> >> @@ -175,34 +175,22 @@ index 3807cd5d76c..018c5c04456 100644
> >>           fn $geometric(bench: &mut Bencher) {
> >>               let bases: [$t; 16] =3D [2, 3, 4, 5, 7, 8, 9, 15, 16, 17=
,
> 31, 32, 33, 63, 64, 65];
> >>               let base_and_numbers: Vec<($t, Vec<$t>)> =3D bases
> >> -diff --git a/compiler/rustc_data_structures/src/tagged_ptr/copy/
> tests.rs b/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
> >> +diff --git a/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
> b/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
> >>  index 160af8a65d..686f4607bb 100644
> >> ---- a/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
> >> -+++ b/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
> >> +--- a/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
> >> ++++ b/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
> >>  @@ -5,6 +5,7 @@ use crate::stable_hasher::{HashStable, StableHasher};
> >> - use crate::tagged_ptr::{CopyTaggedPtr, Pointer, Tag, Tag2};
> >> -
> >> - #[test]
> >> -+#[ignore]
> >> - fn smoke() {
> >> -     let value =3D 12u32;
> >> -     let reference =3D &value;
> >> -diff --git a/compiler/rustc_data_structures/src/tagged_ptr/drop/
> tests.rs b/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
> >> -index 4d342c72cc..9a77f92616 100644
> >> ---- a/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
> >> -+++ b/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
> >> -@@ -4,6 +4,7 @@ use std::sync::Arc;
> >> - use crate::tagged_ptr::{Pointer, Tag, Tag2, TaggedPtr};
> >> + }
> >>
> >>   #[test]
> >>  +#[ignore]
> >>   fn smoke() {
> >>       let value =3D 12u32;
> >>       let reference =3D &value;
> >> -diff --git a/library/std/src/thread/local/tests.rs
> b/library/std/src/thread/local/tests.rs
> >> +diff --git a/library/std/tests/thread_local/tests.rs
> b/library/std/tests/thread_local/tests.rs
> >>  index 9d4f52a092..d425e5f7b7 100644
> >> ---- a/library/std/src/thread/local/tests.rs
> >> -+++ b/library/std/src/thread/local/tests.rs
> >> +--- a/library/std/tests/thread_local/tests.rs
> >> ++++ b/library/std/tests/thread_local/tests.rs
> >>  @@ -346,6 +346,7 @@ fn join_orders_after_tls_destructors() {
> >>
> >>   // Test that thread::current is still available in TLS destructors.
> >> @@ -242,3 +230,32 @@ index a05f274136..0e69b4cb98 100644
> >>   fn sparse_inserts() {
> >>       let cache: VecCache<u32, u8, u32> =3D VecCache::default();
> >>       let end =3D if cfg!(target_pointer_width =3D "64") && cfg!(targe=
t_os
> =3D "linux") {
> >> +diff --git a/tests/assembly/dwarf-mixed-versions-lto.rs
> b/tests/assembly/dwarf-mixed-versions-lto.rs
> >> +index 5b8e5ff4f4a..e558fbd7bd7 100644
> >> +--- a/tests/assembly/dwarf-mixed-versions-lto.rs
> >> ++++ b/tests/assembly/dwarf-mixed-versions-lto.rs
> >> +@@ -1,6 +1,11 @@
> >> + // This test ensures that if LTO occurs between crates with differen=
t
> DWARF versions, we
> >> + // will choose the highest DWARF version for the final binary. This
> matches Clang's behavior.
> >> +
> >> ++//@ only-x86
> >> ++//@ only-x86_64
> >> ++//@ only-arm
> >> ++//@ only-aarch64
> >> ++
> >> + //@ only-linux
> >> + //@ aux-build:dwarf-mixed-versions-lto-aux.rs
> >> + //@ compile-flags: -C lto -g -Zdwarf-version=3D5
> >> +diff --git a/tests/codegen/dont-shuffle-bswaps.rs b/tests/codegen/
> dont-shuffle-bswaps.rs
> >> +index 0e712bc3a4e..93965d990d0 100644
> >> +--- a/tests/codegen/dont-shuffle-bswaps.rs
> >> ++++ b/tests/codegen/dont-shuffle-bswaps.rs
> >> +@@ -1,3 +1,8 @@
> >> ++//@ only-x86
> >> ++//@ only-x86_64
> >> ++//@ only-arm
> >> ++//@ only-aarch64
> >> ++
> >> + //@ revisions: OPT2 OPT3
> >> + //@[OPT2] compile-flags: -Copt-level=3D2
> >> + //@[OPT3] compile-flags: -C opt-level=3D3
> >> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
> b/meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
> >> similarity index 95%
> >> rename from meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
> >> rename to meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
> >> index 00802f0fd9..b39ec0ab39 100644
> >> --- a/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
> >> +++ b/meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
> >> @@ -2,7 +2,7 @@ SUMMARY =3D "Rust standard libaries"
> >>  HOMEPAGE =3D "http://www.rust-lang.org"
> >>  SECTION =3D "devel"
> >>  LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
> >> -LIC_FILES_CHKSUM =3D
> "file://../../COPYRIGHT;md5=3D9c0fae516fe8aaea2fb601db4800daf7"
> >> +LIC_FILES_CHKSUM =3D
> "file://../../COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
> >>
> >>  require rust-source.inc
> >>
> >> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
> b/meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb
> >> similarity index 100%
> >> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
> >> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb
> >> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
> b/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
> >> similarity index 96%
> >> rename from meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
> >> rename to meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
> >> index 2ba37f0784..327e8e6b69 100644
> >> --- a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
> >> +++ b/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
> >> @@ -2,9 +2,9 @@ SUMMARY =3D "LLVM compiler framework (packaged with ru=
st)"
> >>  LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
> >>  HOMEPAGE =3D "http://www.rust-lang.org"
> >>
> >> -# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
> >> +# check src/llvm-project/cmake/Modules/LLVMVersion.cmake for llvm
> version in use
> >>  #
> >> -LLVM_RELEASE =3D "19.1.5"
> >> +LLVM_RELEASE =3D "19.1.7"
> >>
> >>  require rust-source.inc
> >>
> >> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc
> b/meta/recipes-devtools/rust/rust-snapshot.inc
> >> index 98358bce40..445390fcaf 100644
> >> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> >> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> >> @@ -4,56 +4,56 @@
> >>  ## The exact (previous) version that has been used is specified in th=
e
> source tarball.
> >>  ## The version is replicated here.
> >>
> >> -SNAPSHOT_VERSION =3D "1.84.0"
> >> +SNAPSHOT_VERSION =3D "1.85.0"
> >>
> >> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D
> "9f5650aece53e083b933a57e5a8e0e2db4479f52ec897d5b6d0f77be6cd50498"
> >> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D
> "023f0b6153b23ac0e9686c2ab95bc393ee3e295b166bb36de3b4dfb53e3913e0"
> >> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D
> "68d4ad239b6d1e810e7b8591636dc408cb2c1e89661329fed906febf9c0a9d98"
> >> -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D
> "6022245416a988b9952f36bf20f62de0c2f3337bd150e34439ea6651592ac8ca"
> >> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D
> "e742b768f67303010b002b515f6613c639e69ffcc78cd0857d6fe7989e9880f6"
> >> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D
> "8af1d793f7820e9ad0ee23247a9123542c3ea23f8857a018651c7788af9bc5b7"
> >> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D
> "cdebe48b066d512d664c13441e8fae2d0f67106c2080aa44289d98b24192b8bc"
> >> +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D
> "f3b8e769021a6bcee8174ac49a60c367effb6d97af0f2a6c44dc9ea39ff2bda9"
> >>
> >> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D
> "f0bc277e8e8c072d20ee91784f919c08b34a65ab56b67bcd2bb98a009cdcf97c"
> >> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D
> "e710100be26e742733d445722a37227381f1ec2010664ece85489bc598d70456"
> >> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D
> "3a20231475b75f2f6ad0f7c5de283c5706403b41e941d3f1ca6cccfbced214c6"
> >> -SRC_URI[clippy-snapshot-i686.sha256sum] =3D
> "8b5bdd84b9128abc6d61bc1acb60e55eab90e063c7057371b4e6f79aaa1acb9b"
> >> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D
> "c5a5751f3cfa027b53fee83d01dec8e555f3622b6993335aed12b1747aa9543c"
> >> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D
> "401571adfe1223d83ed041e5a8c54c1f3afb3010d1d5b0c1fd79e7da1ab0a0de"
> >> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D
> "3832027242911ab96fd86128587fc563596a5b10e8e38a073facf61c1ac9668f"
> >> +SRC_URI[clippy-snapshot-i686.sha256sum] =3D
> "74ed13a67c6ea0452c0d9e8697c6cfdd8280f983b207187ac93c287f72b65066"
> >>
> >> -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D
> "33ecfb62afce6e30864f07b4e3b76ac6d9f603a3626e5228ad0d59a7ee263cc1"
> >> -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D
> "763b93ca08028a1e63a8a3754ac6118b2659022538e5e33675f2d7620488cd57"
> >> -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D
> "1531b9f3d09983c43f54d7e5ced6b452044e82b24609532e8cee345656e5d8a4"
> >> -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D
> "80719f10010eaf6a26ba7b2f8c5c7bce3a78fd838cbbe17c00a4e3e7cd45fe5e"
> >> +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D
> "d43d2119ff25d879b2d280d3e5a03fcd21c57a32d479ad5626500c32432f18c9"
> >> +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D
> "2d05f5e13e7cb3ee6b0ca0dcd13a231a28eeb0faa4d15257a35cf7284149cd6a"
> >> +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D
> "9aa447eefcd3ba2f9dbab77596c8669849899ab243543fc8f1914089707081ac"
> >> +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D
> "d437b39465343a71ff475a65acb6c03bc0f800861f293f48accf1fa170458432"
> >>
> >> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D
> "ac99e907c9819b61de94a6c12b64256661e5d76c53f3ed25246b46741d1dc973"
> >> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D
> "fdbb75060e59ad59273a8ef11fc2ad61837539686df0e8dfe46107e1b15ab90a"
> >> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D
> "dedcb36320cfa924e2d21552057f88ee8a30c0424802015494c2f6237150ec55"
> >> -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D
> "de2413ae321d2bccf77c77acb1e9775b63eca1993ee1450e65e388f029565a51"
> >> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D
> "fbe7154abc641d6cacfdc6239ed4701fc7a09b5046c6d1bd209b59e7f2b2d0f0"
> >> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D
> "ab2d5ac7cd295adaa4d959e8abbf42b372292c95d1a9f18aad64951ad6e2ab2b"
> >> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D
> "e67c30a72f969c51ad199084b3ce0cdc573a4e21f732b2cc39dafbcb9807a5ce"
> >> +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D
> "497104d49803598cd3801749ac86cb26c88a2bd9c3a8c7bdc18fdf487f4650c0"
> >>
> >> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D
> "1f5ff831c9fd97d7d306eb7d99186b9e49f35527144aaabd43f67f04449cd732"
> >> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D
> "f2819f8ce1ae41c2c2bcf40fc90d6b1a5d340d3e9558267d464730a797122bf5"
> >> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D
> "09d9954bf817404c08a8ac952afe1e086ad11fe20d07522a4bde5f26bf7fb5d2"
> >> -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D
> "a34cde35f254210cbb212c3fa85411efaa8e70d600d2c2404b7b319eae9b5be6"
> >> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D
> "f8e38291ba4241bc28e9c118d7a449ce3601abdeb2076f2f618858679fb3b929"
> >> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D
> "e9ff89e759125ad2786ad2f6c40e820095720ea00fba66819d15fba79489430a"
> >> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D
> "73cf850f6715acbf0029c7e5d4694825f61bd4e193e6413e65a78bcb13df97b7"
> >> +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D
> "29b63f23cd9af95846a246c9cc8349e514c3fb92ec0c840a38155e252d6cc668"
> >>
> >> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D
> "1f6aa28f848b24d4589277b04535ad0258e72b5fa78a4a85ba6d18db95636d69"
> >> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D
> "db731e894cce9973ab2b41109c9097d0fc6a49c0d45a0d333bd1547d2c7485a1"
> >> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D
> "7dc351327de2567cce2a3387f110cce1db20c68fc529353c5cdef2eada5dbfd8"
> >> -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D
> "b53cb58c719b84044de62851b6214db8d504f57ad71e81b373d7dea0393146d8"
> >> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D
> "371e40f9d6d82aecb056f70f82868d98ddc1c20510aa7d388442ac8d2d86a6ca"
> >> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D
> "d0cfda4e18623d17922eb367e44ac9549ab3d5fe1c0bdbe0c2c95754255fa705"
> >> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D
> "e1469f4249a7e21f872af487dcd1bd10ce388b5b3679bdab0cb0965e1e30fe47"
> >> +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D
> "d8c590bc2e6fc75800e41516427f5095ba0e15d7633167689499fcf6523dc61a"
> >>
> >> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D
> "c0eaf824c7789c94901f895792333595fe131e43f097bcf5987301cc1b14c3f0"
> >> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D
> "451580f9cdc47eef4efb0986b1960a8f9c4fb0959f81b77eb6292e6bcff9fc64"
> >> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D
> "3a850b74bdf2c3a5912e9f1ea32aaf1c9ac7c5f89c1c0bcf421b961195833992"
> >> -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D
> "fb8c9d489e10a961f9faa550980069738b5f0f68740e34d7b3ee46a262b53af7"
> >> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D
> "2da33044f17a8bc49a1478dc1eb2536df491a44d6e6bb0ec7c86f46877d44e98"
> >> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D
> "0f5ecfe54859bbe715821f982b1a5396784fdf55605d00ece05d3e57a965ed16"
> >> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D
> "c9f28b519799fc2d8089865e30fad04bb5339604d13725365fcd7ad7ee6c1489"
> >> +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D
> "9d21bc180196bccdb301e7e03034d3fd0df14b0c6520da0317bba7b1ce385fe8"
> >>
> >> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D
> "7dbc2fc2c04e820f636bfc74093396c55df0296f7ee4f0547bb849d9a9f05fe0"
> >> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D
> "5208f45cec5f3600f2cbc11d1796bc217f09e9c922689c8e4f0cc3f2b83ebb74"
> >> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D
> "bdf944ff5c0b97e8b64093fff8d1f63926df86b5e98f91d30c7bd844c6efa20f"
> >> -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D
> "b02a586369e6edebb0f0608e396472d1867419213fd01ba32f3c847e4c5a3c07"
> >> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D
> "308361737ed522aa77dd8b4ea91b5db244113ada5fa234d3ed008b526d07e2e8"
> >> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D
> "d25053fbee1a0cb899bac8c8e4968aa35f9c3637e486cb5bb2c79ad43a78f3e7"
> >> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D
> "7e1defd60095c91ded1612194f811ec5f2fc2e83bb914d35594d01fa3c54049d"
> >> +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D
> "9780d8c4cfef9d05460b3e540aad142391b2e3994accf8cfc8afb87fefac6cf0"
> >>
> >> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D
> "a1737d86f80b31a6d48a6726726275dc068ecb930c9635b13aa59999486de837"
> >> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D
> "770237080b9310d126350c3bd70820bd91064c2e96c29ab5f2e002b31b5bd067"
> >> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D
> "6c2371488db92a09cd50a1b4045c022f3cf2c643285b3b21105ab5f9b64fd6b6"
> >> -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D
> "1db0212c08e126bf6ee28a0d363c5d6859fe357aa9e91d0247059397dbe7e1fd"
> >> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D
> "7436f13797475082cd87aa65547449e01659d6a810b4cd5f8aedc48bb9f89dfb"
> >> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D
> "285e105d25ebdf501341238d4c0594ecdda50ec9078f45095f793a736b1f1ac2"
> >> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D
> "0aff33b57b0e0b102d762a2b53042846c1ca346cff4b7bd96b5c03c9e8e51d81"
> >> +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D
> "0dc3ca1708a6c9eed05d0802364377572b79ff079815b7bcbe8e3991f77c4117"
> >>
> >> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D
> "a877622fbbfa58304c34372d369e95db106cc35758ca59053144bf7d86fbf3fc"
> >> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D
> "3cb7318da10876de14076549d79410a8441923a92d62b616d8c105f5f5cd831b"
> >>
> >> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D
> "ecd1662d6cbbb62984ab31ae787442f1ab32caf6bc17260d407b3a94b434ad32"
> >> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D
> "65cd47af46a5b74e61ff6ae4cce8a979ee8670a57b8aa61e732828d1da073f73"
> >>
> >>  SRC_URI +=3D " \
> >>
> ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-snap=
shot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components
> \
> >> diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> >> index 6cb08b7c38..f9c1fcd1c8 100644
> >> --- a/meta/recipes-devtools/rust/rust-source.inc
> >> +++ b/meta/recipes-devtools/rust/rust-source.inc
> >> @@ -7,11 +7,10 @@ SRC_URI +=3D "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
> >>
> file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdi=
r=3D${RUSTSRC}
> \
> >>
> file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;pa=
tchdir=3D${RUSTSRC}
> \
> >>
> file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=
=3D${RUSTSRC}
> \
> >> -
> file://Zdual-proc-macros-additional-check.patch;patchdir=3D${RUSTSRC} \
> >>
> file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch;patch=
dir=3D${RUSTSRC}
> \
> >>
> file://0001-Disable-libunwind-cross-architecture-unwinding.patch;patchdir=
=3D${RUSTSRC}
> \
> >>  "
> >> -SRC_URI[rust.sha256sum] =3D
> "b1fbf809efe9f036939401e142631c201a53bcf43ec1696bd9f5290ba236a266"
> >> +SRC_URI[rust.sha256sum] =3D
> "d939eada065dc827a9d4dbb55bd48533ad14c16e7f0a42e70147029c82a7707b"
> >>
> >>  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> >>
> >> diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb
> b/meta/recipes-devtools/rust/rust_1.86.0.bb
> >> similarity index 96%
> >> rename from meta/recipes-devtools/rust/rust_1.85.1.bb
> >> rename to meta/recipes-devtools/rust/rust_1.86.0.bb
> >> index f289db6306..c2443fbb15 100644
> >> --- a/meta/recipes-devtools/rust/rust_1.85.1.bb
> >> +++ b/meta/recipes-devtools/rust/rust_1.86.0.bb
> >> @@ -2,18 +2,18 @@ SUMMARY =3D "Rust compiler and runtime libaries"
> >>  HOMEPAGE =3D "http://www.rust-lang.org"
> >>  SECTION =3D "devel"
> >>  LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
> >> -LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3D9c0fae516fe8aaea2fb601db4800daf7"
> >> +LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
> >>
> >>  inherit rust
> >>  inherit cargo_common
> >>
> >> -DEPENDS +=3D "rust-llvm"
> >> +DEPENDS +=3D "rust-llvm pkgconfig-native openssl ninja-native"
> >>  # native rust uses cargo/rustc from binary snapshots to bootstrap
> >>  # but everything else should use our native builds
> >>  DEPENDS:append:class-target =3D " cargo-native rust-native"
> >>  DEPENDS:append:class-nativesdk =3D " cargo-native rust-native"
> >>
> >> -RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils"
> >> +RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils bash"
> >>
> >>  # Otherwise we'll depend on what we provide
> >>  INHIBIT_DEFAULT_RUST_DEPS:class-native =3D "1"
> >> @@ -135,6 +135,8 @@ python do_configure() {
> >>      config.set("rust", "remap-debuginfo", e(True))
> >>      config.set("rust", "download-rustc", e(False))
> >>      config.set("rust", "llvm-tools", e(False))
> >> +    config.set("rust", "lld", e(False))
> >> +    config.set("rust", "use-lld", e(False))
> >>      config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
> >>
> >>      # Whether or not to optimize the compiler and standard library
> >> @@ -155,6 +157,8 @@ python do_configure() {
> >>      cargo =3D d.getVar('CARGO_BOOTSTRAP')
> >>      config.set("build", "cargo", e(cargo))
> >>
> >> +    config.set("build", "extended", e(False))
> >> +
> >>      config.set("build", "vendor", e(True))
> >>
> >>      config.set("build", "target", e([d.getVar("RUST_TARGET_SYS")]))
> >> @@ -233,10 +237,12 @@ do_test_compile () {
> >>
> >>  ALLOW_EMPTY:${PN} =3D "1"
> >>
> >> -PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
> >> +PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt
> ${PN}-zsh-completion"
> >>  FILES:${PN}-rustdoc =3D "${bindir}/rustdoc"
> >>  FILES:${PN}-tools-clippy =3D "${bindir}/cargo-clippy
> ${bindir}/clippy-driver"
> >>  FILES:${PN}-tools-rustfmt =3D "${bindir}/rustfmt"
> >> +FILES:${PN}-zsh-completion =3D "${datadir}/zsh"
> >> +
> >>  RDEPENDS:${PN}-rustdoc =3D "${PN}"
> >>  RDEPENDS:${PN}-tools-clippy =3D "${PN}"
> >>  RDEPENDS:${PN}-tools-rustfmt =3D "${PN}"
> >> @@ -252,6 +258,10 @@ rust_do_install() {
> >>      rust_runx install
> >>  }
> >>
> >> +rust_do_install:append:class-native () {
> >> +    rm -f ${D}${bindir}/cargo
> >> +}
> >> +
> >>  rust_do_install:class-nativesdk() {
> >>      export PSEUDO_UNLOAD=3D1
> >>      rust_runx install
> >> --
> >> 2.49.0
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#218510):
> https://lists.openembedded.org/g/openembedded-core/message/218510
> > Mute This Topic: https://lists.openembedded.org/mt/113565449/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ffc9ce06376033db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanav=
in &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>=
&gt; escreveu (quinta, 12/06/2025 =C3=A0(s) 12:07):<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Please trim unneeded lines when replyin=
g so I don&#39;t have to put my reply on top.<br></blockquote><div><br></di=
v><div>Ok I will do that next time=C2=A0if I don&#39;t forget.<br>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
That ship has already sailed. Rust package already depends on gcc and<br>
binutils, both gplv3.<br></blockquote><div><br>Right! To install the rust c=
ompiler itself on the target image we already have the gplv3.<br>I misread =
the rdepends and thought it was something runtime needed in the image to ru=
n rust applications.<br><br>Sorry for the noise and thanks for the clarific=
ation.</div><div><br></div><div>Jose<br><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Alex<br>
<br>
On Thu, 12 Jun 2025 at 13:02, Jose Quaresma via <a href=3D"http://lists.ope=
nembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org<=
/a><br>
&lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" tar=
get=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Yash,<br>
&gt;<br>
&gt; Yash Shinde via <a href=3D"http://lists.openembedded.org" rel=3D"noref=
errer" target=3D"_blank">lists.openembedded.org</a> &lt;Yash.Shinde=3D<a hr=
ef=3D"mailto:windriver.com@lists.openembedded.org" target=3D"_blank">windri=
ver.com@lists.openembedded.org</a>&gt; escreveu (ter=C3=A7a, 10/06/2025 =C3=
=A0(s) 07:20):<br>
&gt;&gt;<br>
&gt;&gt; From: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windriver.com"=
 target=3D"_blank">Yash.Shinde@windriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Rust stable version updated to 1.86.0.<br>
&gt;&gt; <a href=3D"https://blog.rust-lang.org/2025/04/03/Rust-1.86.0.html"=
 rel=3D"noreferrer" target=3D"_blank">https://blog.rust-lang.org/2025/04/03=
/Rust-1.86.0.html</a><br>
&gt;&gt;<br>
&gt;&gt; * Add pkgconfig-native and openssl to resolve openssl-sys crate<br=
>
&gt;&gt; dependency on pkg-config. As per rust document this is a required =
dependency.<br>
&gt;&gt;<br>
&gt;&gt; Fixes:<br>
&gt;&gt; | error: failed to run custom build command for `openssl-sys v0.9.=
106`<br>
&gt;&gt; | Could not find openssl via pkg-config:<br>
&gt;&gt; |=C2=A0 =C2=A0The pkg-config command could not be found.<br>
&gt;&gt; |<br>
&gt;&gt; |=C2=A0 =C2=A0Most likely, you need to install a pkg-config packag=
e for your OS.<br>
&gt;&gt; |=C2=A0 =C2=A0Try `apt install pkg-config`, or `yum install pkg-co=
nfig`,<br>
&gt;&gt; |=C2=A0 =C2=A0or `pkg install pkg-config`, or `apk add pkgconfig` =
depending on your distribution<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://crates.io/crates/openssl-sys/0.9.108/dependenci=
es" rel=3D"noreferrer" target=3D"_blank">https://crates.io/crates/openssl-s=
ys/0.9.108/dependencies</a><br>
&gt;&gt; <a href=3D"https://github.com/rust-lang/rust/blob/master/INSTALL.m=
d#dependencies" rel=3D"noreferrer" target=3D"_blank">https://github.com/rus=
t-lang/rust/blob/master/INSTALL.md#dependencies</a><br>
&gt;&gt;<br>
&gt;&gt; * Add Ninja as a dependency for building Rust to prevent bootstrap=
<br>
&gt;&gt;=C2=A0 =C2=A0build regression.<br>
&gt;&gt;<br>
&gt;&gt; Fixes:<br>
&gt;&gt; | Building LLD for x86_64-unknown-linux-gnu<br>
&gt;&gt; |<br>
&gt;&gt; | Couldn&#39;t find required command: ninja (or ninja-build)<br>
&gt;&gt; |<br>
&gt;&gt; | You should install ninja as described at<br>
&gt;&gt; | &lt;<a href=3D"https://github.com/ninja-build/ninja/wiki/Pre-bui=
lt-Ninja-packages" rel=3D"noreferrer" target=3D"_blank">https://github.com/=
ninja-build/ninja/wiki/Pre-built-Ninja-packages</a>&gt;,<br>
&gt;&gt; | or set `ninja =3D false` in the `[llvm]` section of `config.toml=
`.<br>
&gt;&gt; | Alternatively, set `download-ci-llvm =3D true` in that `[llvm]` =
section<br>
&gt;&gt; | to download LLVM rather than building it.<br>
&gt;&gt;<br>
&gt;&gt; * Add bash to DEPENDS to resolve missing dependency for subtree-sy=
nc.sh<br>
&gt;&gt; Fixes:<br>
&gt;&gt; ERROR: rust-1.86.0-r0 do_package_qa: QA Issue: /usr/lib/rustlib/sr=
c/rust/library/portable-simd/subtree-sync.sh<br>
&gt;&gt; contained in package rust requires /bin/bash, but no providers fou=
nd in RDEPENDS:rust? [file-rdeps]<br>
&gt;<br>
&gt;<br>
&gt; Can you patch the subtree-sync.sh to use /bin/sh and see if it works w=
ell?<br>
&gt; Otherwise this will make any image that use rust be licensed with GPLv=
3<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; * Add do_install:append() task to remove cargo bin from rust nativ=
e builds.<br>
&gt;&gt; This resolves the following conflict:<br>
&gt;&gt;<br>
&gt;&gt; Fixes:<br>
&gt;&gt; ERROR: libstd-rs-1.86.0-r0 do_prepare_recipe_sysroot: The file /us=
r/bin/cargo is<br>
&gt;&gt; installed by both rust-native and cargo-native, aborting<br>
&gt;&gt;<br>
&gt;&gt; * Update Unicode-3.0 license checksums.<br>
&gt;&gt; License-Update: Copyright and license files to distributions are u=
pdated.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/rust-lang/rust/commit/f9c16997dc016a=
3ef1456f56df2ab564a1c48cb2" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/rust-lang/rust/commit/f9c16997dc016a3ef1456f56df2ab564a1c48cb2</a>=
<br>
&gt;&gt;=C2=A0 =C2=A0It adds copyright and license files (including HTML ve=
rsions) to distributions,<br>
&gt;&gt;=C2=A0 =C2=A0aligns with license compliance tools like reuse, and e=
nsures all required<br>
&gt;&gt;=C2=A0 =C2=A0license texts are properly included and formatted.<br>
&gt;&gt;<br>
&gt;&gt; * Disable building of extended Rust tools to reduce build time and=
 filesystem usage.<br>
&gt;&gt;=C2=A0 =C2=A0Update config.toml to disable building of extended Rus=
t tools that are not required.<br>
&gt;&gt;=C2=A0 =C2=A0This helps minimize unnecessary build time and filesys=
tem usage.<br>
&gt;&gt;<br>
&gt;&gt; * The &quot;remote-test-server&quot; bin is now generated in stage=
2-tools-bin dir<br>
&gt;&gt;=C2=A0 =C2=A0rather than stage1. Update the test suite accordingly.=
<br>
&gt;&gt;<br>
&gt;&gt; * Fix do_package QA issue by packing missing zsh files and directo=
ries:<br>
&gt;&gt;<br>
&gt;&gt; Fixes:<br>
&gt;&gt; do_package: QA Issue: rust: Files/directories were installed but n=
ot shipped in any package:<br>
&gt;&gt; /usr/share/zsh<br>
&gt;&gt; /usr/share/zsh/site-functions<br>
&gt;&gt; /usr/share/zsh/site-functions/_cargo<br>
&gt;&gt; Please set FILES such that these items are packaged. Alternatively=
 if they are unneeded,<br>
&gt;&gt; avoid installing them or delete them within do_install<br>
&gt;&gt;<br>
&gt;&gt; * From v1.86.0, a &quot;self-contained&quot; LLD is built as part =
of rust<br>
&gt;&gt;=C2=A0 bootstrap build. This results in additional build time and<b=
r>
&gt;&gt;=C2=A0 installations. Disable rust-lld in config.toml to prevent it=
.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 References: <a href=3D"https://github.com/rust-lang/rust/pul=
l/135001" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/rust/pull/135001</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https:/=
/github.com/rust-lang/rust/commit/8744b44e6bde053f7656a3c727c968177ee8e4b6"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/rust/com=
mit/8744b44e6bde053f7656a3c727c968177ee8e4b6</a><br>
&gt;&gt;<br>
&gt;&gt; * Drop Zdual-proc-macros-additional-check.patch patch<br>
&gt;&gt;=C2=A0 since it&#39;s merged with v1.86.0<br>
&gt;&gt;=C2=A0 <a href=3D"https://github.com/rust-lang/rust/commit/139d6ba0=
54a1a4cc5fe64981ad46fd5547bd4916" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad46fd5547bd49=
16</a><br>
&gt;&gt;<br>
&gt;&gt; * LTO config is applied to rustdoc from v1.86.0.<br>
&gt;&gt;=C2=A0 Rebase 0001-src-core-build_steps-tool.rs-switch-off-lto-for-=
rust.patch<br>
&gt;&gt;=C2=A0 which disables it to avoid suffixes in binaries causing non-=
reproducibility.<br>
&gt;&gt;=C2=A0 <a href=3D"https://github.com/rust-lang/rust/commit/1fe351b"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang/rust/com=
mit/1fe351b</a><br>
&gt;&gt;<br>
&gt;&gt; * Restrict tests using &quot;//@only &lt;target_arch&gt;&quot; to =
avoid failures on riscv64,<br>
&gt;&gt;=C2=A0 =C2=A0which is now part of default AB testing. Since riscv64=
 is Tier 2<br>
&gt;&gt;=C2=A0 =C2=A0with no automated testing, some tests may fail. This a=
pproach ensures tests continue<br>
&gt;&gt;=C2=A0 =C2=A0running on supported architectures while skipping them=
 on riscv64.<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://doc.rust-lang.org/rustc/platform-su=
pport.html#tier-2-with-host-tools" rel=3D"noreferrer" target=3D"_blank">htt=
ps://doc.rust-lang.org/rustc/platform-support.html#tier-2-with-host-tools</=
a><br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windr=
iver.com" target=3D"_blank">Yash.Shinde@windriver.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; v2: Drop llvm-tblgen installation.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=
=A0 2 +-<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/selftest/cases/rust.py=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 .../rust/{<a href=3D"http://cargo_1.85.1.bb" rel=3D"noreferr=
er" target=3D"_blank">cargo_1.85.1.bb</a> =3D&gt; <a href=3D"http://cargo_1=
.86.0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.86.0.bb</a>} |=C2=A0=
 0<br>
&gt;&gt;=C2=A0 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 32 -------<b=
r>
&gt;&gt;=C2=A0 ...teps-tool.rs-switch-off-lto-for-rust.patch | 54 +++++++++=
---<br>
&gt;&gt;=C2=A0 .../Zdual-proc-macros-additional-check.patch=C2=A0 | 31 ----=
---<br>
&gt;&gt;=C2=A0 .../rust/files/rust-oe-selftest.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 85 +++++++++++--------<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://ibstd-rs_1.85.1.bb" rel=3D"noreferrer" =
target=3D"_blank">ibstd-rs_1.85.1.bb</a> =3D&gt; <a href=3D"http://libstd-r=
s_1.86.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.86.0.bb</a>} =
|=C2=A0 2 +-<br>
&gt;&gt;=C2=A0 ....<a href=3D"http://85.1.bb" rel=3D"noreferrer" target=3D"=
_blank">85.1.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.86.0.bb=
" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadian_1.86.0.bb</a>} |=
=C2=A0 0<br>
&gt;&gt;=C2=A0 ...<a href=3D"http://ust-llvm_1.85.1.bb" rel=3D"noreferrer" =
target=3D"_blank">ust-llvm_1.85.1.bb</a> =3D&gt; <a href=3D"http://rust-llv=
m_1.86.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.86.0.bb</a>} =
|=C2=A0 4 +-<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/rust/rust-snapshot.inc=C2=A0 | 78 ++++=
++++---------<br>
&gt;&gt;=C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=
=A0 3 +-<br>
&gt;&gt;=C2=A0 .../rust/{<a href=3D"http://rust_1.85.1.bb" rel=3D"noreferre=
r" target=3D"_blank">rust_1.85.1.bb</a> =3D&gt; <a href=3D"http://rust_1.86=
.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.86.0.bb</a>}=C2=A0 =C2=
=A0| 18 +++-<br>
&gt;&gt;=C2=A0 13 files changed, 152 insertions(+), 159 deletions(-)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://cargo_1=
.85.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.85.1.bb</a> =3D&gt; =
<a href=3D"http://cargo_1.86.0.bb" rel=3D"noreferrer" target=3D"_blank">car=
go_1.86.0.bb</a>} (100%)<br>
&gt;&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rust/files/Zdual-pr=
oc-macros-additional-check.patch<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://libstd-=
rs_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.85.1.bb</a> =
=3D&gt; <a href=3D"http://libstd-rs_1.86.0.bb" rel=3D"noreferrer" target=3D=
"_blank">libstd-rs_1.86.0.bb</a>} (95%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://rust-cr=
oss-canadian_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-can=
adian_1.85.1.bb</a> =3D&gt; <a href=3D"http://rust-cross-canadian_1.86.0.bb=
" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadian_1.86.0.bb</a>} (=
100%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://rust-ll=
vm_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a> =
=3D&gt; <a href=3D"http://rust-llvm_1.86.0.bb" rel=3D"noreferrer" target=3D=
"_blank">rust-llvm_1.86.0.bb</a>} (96%)<br>
&gt;&gt;=C2=A0 rename meta/recipes-devtools/rust/{<a href=3D"http://rust_1.=
85.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.85.1.bb</a> =3D&gt; <a=
 href=3D"http://rust_1.86.0.bb" rel=3D"noreferrer" target=3D"_blank">rust_1=
.86.0.bb</a>} (96%)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/co=
nf/distro/include/tcmode-default.inc<br>
&gt;&gt; index f0443fbdc6..e943ca77d1 100644<br>
&gt;&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt; @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;g=
ettext&quot;<br>
&gt;&gt;=C2=A0 GCCVERSION ?=3D &quot;15.%&quot;<br>
&gt;&gt;=C2=A0 SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
&gt;&gt;=C2=A0 GLIBCVERSION ?=3D &quot;2.41%&quot;<br>
&gt;&gt; -RUSTVERSION ?=3D &quot;1.85.1%&quot;<br>
&gt;&gt; +RUSTVERSION ?=3D &quot;1.86.0%&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSION}&quot;<br>
&gt;&gt;=C2=A0 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D &quot;${GCCV=
ERSION}&quot;<br>
&gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/=
selftest/cases/rust.py<br>
&gt;&gt; index 806ddf6982..d99a58d6b9 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/selftest/cases/rust.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/rust.py<br>
&gt;&gt; @@ -104,7 +104,7 @@ class RustSelfTestSystemEmulated(OESelftestTes=
tCase, OEPTestResultTestCase):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy remote-test=
-server to image through scp<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 host_sys =3D get_b=
b_var(&quot;RUST_BUILD_SYS&quot;, &quot;rust&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh =3D SSHControl=
(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=3D&quot;root&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh.copy_to(builddir + =
&quot;/build/&quot; + host_sys + &quot;/stage1-tools-bin/remote-test-server=
&quot;,&quot;~/&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh.copy_to(builddir + =
&quot;/build/&quot; + host_sys + &quot;/stage2-tools-bin/remote-test-server=
&quot;,&quot;~/&quot;)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Execute remote-t=
est-server on image through background ssh<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command =3D &#39;~=
/remote-test-server --bind <a href=3D"http://0.0.0.0:12345" rel=3D"noreferr=
er" target=3D"_blank">0.0.0.0:12345</a> -v&#39;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sshrun=3Dsubproces=
s.Popen((&quot;ssh&quot;, &#39;-o&#39;,=C2=A0 &#39;UserKnownHostsFile=3D/de=
v/null&#39;, &#39;-o&#39;,=C2=A0 &#39;StrictHostKeyChecking=3Dno&#39;, &#39=
;-f&#39;, &quot;root@%s&quot; % qemu.ip, command), shell=3DFalse, stdout=3D=
subprocess.PIPE, stderr=3Dsubprocess.PIPE)<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://cargo_1.=
85.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.85.1.bb</a> b/meta/re=
cipes-devtools/rust/<a href=3D"http://cargo_1.86.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">cargo_1.86.0.bb</a><br>
&gt;&gt; similarity index 100%<br>
&gt;&gt; rename from meta/recipes-devtools/rust/<a href=3D"http://cargo_1.8=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.85.1.bb</a><br>
&gt;&gt; rename to meta/recipes-devtools/rust/<a href=3D"http://cargo_1.86.=
0.bb" rel=3D"noreferrer" target=3D"_blank">cargo_1.86.0.bb</a><br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/files/0001-Define-more-ioc=
tl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/rust/fi=
les/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch<br>
&gt;&gt; index b3a95f2e24..82edd71206 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-code=
s-on-riscv32gc-unknown-linux-g.patch<br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-code=
s-on-riscv32gc-unknown-linux-g.patch<br>
&gt;&gt; @@ -18,38 +18,6 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt;&gt;=C2=A0 =C2=A0.../src/unix/linux_like/linux/arch/generic/<a href=3D"=
http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +++-<br>
&gt;&gt;=C2=A0 =C2=A06 files changed, 14 insertions(+), 6 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; -diff --git a/vendor/libc-0.2.158/.cargo-checksum.json b/vendor/li=
bc-0.2.158/.cargo-checksum.json<br>
&gt;&gt; -index 636165bc0..dc86fd0db 100644<br>
&gt;&gt; ---- a/vendor/libc-0.2.158/.cargo-checksum.json<br>
&gt;&gt; -+++ b/vendor/libc-0.2.158/.cargo-checksum.json<br>
&gt;&gt; -@@ -1 +1 @@<br>
&gt;&gt; --{&quot;files&quot;:{&quot;CHANGELOG.md&quot;:&quot;96fb278d188e8=
7842fe2701f91e0f757665b44dc2e549accb6ed1ed6eeb67602&quot;,&quot;CONTRIBUTIN=
G.md&quot;:&quot;a93fcda0a76e1975fcfb0aa2ba00c9b1864f9ae6062704a294d81a3688=
898e10&quot;,&quot;Cargo.toml&quot;:&quot;2196e21d3fd56b3019e235720a32b4e3c=
8ada82c08cb01c06c695752201396df&quot;,&quot;LICENSE-APACHE&quot;:&quot;62c7=
a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a&quot;,&quot;LI=
CENSE-MIT&quot;:&quot;a8d47ff51ca256f56a8932dba07660672dbfe3004257ca8de708a=
ac1415937a1&quot;,&quot;README.md&quot;:&quot;4da2919bb509f3f06163778478494=
f780ca6627cb79ccab5d2c828c8d88dc133&quot;,&quot;<a href=3D"http://build.rs"=
 rel=3D"noreferrer" target=3D"_blank">build.rs</a>&quot;:&quot;54387230fed8=
d16f1169a845e92a1c1a5d9227559acbf3bfa383c7901b2d1be8&quot;,&quot;rustfmt.to=
ml&quot;:&quot;eaa2ea84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f7=
87b2&quot;,&quot;src/<a href=3D"http://fixed_width_ints.rs" rel=3D"noreferr=
er" target=3D"_blank">fixed_width_ints.rs</a>&quot;:&quot;7f986e5f5e68d25ef=
04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca&quot;,&quot;src/fuchsia/<a =
href=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs<=
/a>&quot;:&quot;893fcec48142d273063ffd814dca33fbec92205fd39ada97075f85201d8=
03996&quot;,&quot;src/fuchsia/<a href=3D"http://align.rs" rel=3D"noreferrer=
" target=3D"_blank">align.rs</a>&quot;:&quot;ae1cf8f011a99737eabeb14ffff768=
e60f13b13363d7646744dbb0f443dab3d6&quot;,&quot;src/fuchsia/<a href=3D"http:=
//mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;a8e3f=
f551e5ff4247ab1faa1b7ca1e042046a619198e8b30fe183c6ef8485d65&quot;,&quot;src=
/fuchsia/<a href=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank=
">no_align.rs</a>&quot;:&quot;303f3f1b255e0088b5715094353cf00476131d8e94e6a=
ebb3f469557771c8b8a&quot;,&quot;src/fuchsia/<a href=3D"http://riscv64.rs" r=
el=3D"noreferrer" target=3D"_blank">riscv64.rs</a>&quot;:&quot;617cd75e79e0=
e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b11&quot;,&quot;src/fuchsi=
a/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.=
rs</a>&quot;:&quot;93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585=
2255ac87&quot;,&quot;src/<a href=3D"http://hermit.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">hermit.rs</a>&quot;:&quot;ad1e8685edf3f3a7c141ccc0e82d44b7f=
eb13e81f2f59ed6aeb6e4964524637c&quot;,&quot;src/<a href=3D"http://lib.rs" r=
el=3D"noreferrer" target=3D"_blank">lib.rs</a>&quot;:&quot;7f57f05b3d9e1e14=
a666aabbd942cf5959e778966981e604087774d56eb059c8&quot;,&quot;src/<a href=3D=
"http://macros.rs" rel=3D"noreferrer" target=3D"_blank">macros.rs</a>&quot;=
:&quot;5f985b3de7b18833f866bf832b8ffb0430f0f70aa9a468b6a2c855c1bf9d33e4&quo=
t;,&quot;src/<a href=3D"http://psp.rs" rel=3D"noreferrer" target=3D"_blank"=
>psp.rs</a>&quot;:&quot;0a7d5121a8cc2903009f586c00e4ae2d6126d24eb90531dafab=
a6f59823aa6b2&quot;,&quot;src/<a href=3D"http://sgx.rs" rel=3D"noreferrer" =
target=3D"_blank">sgx.rs</a>&quot;:&quot;16a95cdefc81c5ee00d8353a60db363c4c=
c3e0f75abcd5d0144723f2a306ed1b&quot;,&quot;src/solid/<a href=3D"http://aarc=
h64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>&quot;:&quot;a72=
6e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42ab7f8707&quot;,&quot;s=
rc/solid/<a href=3D"http://arm.rs" rel=3D"noreferrer" target=3D"_blank">arm=
.rs</a>&quot;:&quot;e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9cf4f1f4872=
097fc27fe&quot;,&quot;src/solid/<a href=3D"http://mod.rs" rel=3D"noreferrer=
" target=3D"_blank">mod.rs</a>&quot;:&quot;5f4151dca5132e4b4e4c23ab9737e128=
56dddbdc0ca3f7dbc004328ef3c8acde&quot;,&quot;src/<a href=3D"http://switch.r=
s" rel=3D"noreferrer" target=3D"_blank">switch.rs</a>&quot;:&quot;9da3dd39b=
3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba&quot;,&quot;src/tee=
os/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a=
>&quot;:&quot;ecf8922923fb7541ef7b0813cdc5418b75be56247c4dbdbb7dca58a076f25=
b97&quot;,&quot;src/unix/aix/<a href=3D"http://mod.rs" rel=3D"noreferrer" t=
arget=3D"_blank">mod.rs</a>&quot;:&quot;91de34bf8237e4998e10f9274471d14fb9a=
31ac6f2ef6e44689066b8e280b3d3&quot;,&quot;src/unix/aix/<a href=3D"http://po=
werpc64.rs" rel=3D"noreferrer" target=3D"_blank">powerpc64.rs</a>&quot;:&qu=
ot;cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8296f8e10d55169b&quot;,&=
quot;src/unix/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_bla=
nk">align.rs</a>&quot;:&quot;2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d=
7e4ceeec56d6874f65&quot;,&quot;src/unix/bsd/apple/b32/<a href=3D"http://ali=
gn.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;ec833a=
747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c&quot;,&quot;src/=
unix/bsd/apple/b32/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_=
blank">mod.rs</a>&quot;:&quot;2546ad3eb6aecb95f916648bc63264117c92b4b485953=
2b34cb011e4c75a5a72&quot;,&quot;src/unix/bsd/apple/b64/aarch64/<a href=3D"h=
ttp://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&qu=
ot;2eaf0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94&quot;,&=
quot;src/unix/bsd/apple/b64/aarch64/<a href=3D"http://mod.rs" rel=3D"norefe=
rrer" target=3D"_blank">mod.rs</a>&quot;:&quot;44c217a4f263afe7a97435de9323=
d20a96c37836f899ca0925306d4b7e073c27&quot;,&quot;src/unix/bsd/apple/b64/<a =
href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&=
quot;:&quot;ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26=
c&quot;,&quot;src/unix/bsd/apple/b64/<a href=3D"http://mod.rs" rel=3D"noref=
errer" target=3D"_blank">mod.rs</a>&quot;:&quot;f5e278a1af7fb358891d1c9be4e=
b7e815aaca0c5cb738d0c3604ba2208a856f7&quot;,&quot;src/unix/bsd/apple/b64/x8=
6_64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align=
.rs</a>&quot;:&quot;ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884=
c40b0e26c&quot;,&quot;src/unix/bsd/apple/b64/x86_64/<a href=3D"http://mod.r=
s" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;8c87c5855038=
aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936&quot;,&quot;src/unix/b=
sd/apple/<a href=3D"http://long_array.rs" rel=3D"noreferrer" target=3D"_bla=
nk">long_array.rs</a>&quot;:&quot;3cf1f19b812e6d093c819dc65ce55b13491963e07=
80eda0d0bd1577603e81948&quot;,&quot;src/unix/bsd/apple/<a href=3D"http://mo=
d.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;484698da7=
c1083a46ae1a389486a8c2d75e3e6ecb4f80ded69b6c0dd2d1a92a0&quot;,&quot;src/uni=
x/bsd/freebsdlike/dragonfly/<a href=3D"http://errno.rs" rel=3D"noreferrer" =
target=3D"_blank">errno.rs</a>&quot;:&quot;8295b8bb0dfd38d2cdb4d9192cdeeb53=
4cc6c3b208170e64615fa3e0edb3e578&quot;,&quot;src/unix/bsd/freebsdlike/drago=
nfly/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs<=
/a>&quot;:&quot;2777f94909a798df1b8030fb86d02e2118d0ac3e49e9a542df54a569ca5=
ae2f9&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a href=3D"http://aarch6=
4.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>&quot;:&quot;6c8e2=
16385f53a4bf5f171749b57602fc34a4e4b160a44ca31c058cb0c8a2126&quot;,&quot;src=
/unix/bsd/freebsdlike/freebsd/<a href=3D"http://arm.rs" rel=3D"noreferrer" =
target=3D"_blank">arm.rs</a>&quot;:&quot;59d6a670eea562fb87686e243e0a84603d=
29a2028a3d4b3f99ccc01bd04d2f47&quot;,&quot;src/unix/bsd/freebsdlike/freebsd=
/freebsd11/<a href=3D"http://b64.rs" rel=3D"noreferrer" target=3D"_blank">b=
64.rs</a>&quot;:&quot;9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a4497554=
5e3d9d17681&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd11/<a href=
=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&q=
uot;e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec722ba80dac1f&quot;,=
&quot;src/unix/bsd/freebsdlike/freebsd/freebsd12/<a href=3D"http://b64.rs" =
rel=3D"noreferrer" target=3D"_blank">b64.rs</a>&quot;:&quot;61cbe45f8499bed=
b168106b686d4f8239472f25c7553b069eec2afe197ff2df6&quot;,&quot;src/unix/bsd/=
freebsdlike/freebsd/freebsd12/<a href=3D"http://mod.rs" rel=3D"noreferrer" =
target=3D"_blank">mod.rs</a>&quot;:&quot;bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8&quot;,&quot;src/unix/bsd/freebsdlike/freebsd=
/freebsd12/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank=
">x86_64.rs</a>&quot;:&quot;2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b=
3daae55a481bfd052&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd13/<a=
 href=3D"http://b64.rs" rel=3D"noreferrer" target=3D"_blank">b64.rs</a>&quo=
t;:&quot;61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6&q=
uot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd13/<a href=3D"http://mod=
.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;88be47524b=
28b6635ccb1e85ea511bf17337be0af7e9baa740c341ac9e83a6f7&quot;,&quot;src/unix=
/bsd/freebsdlike/freebsd/freebsd13/<a href=3D"http://x86_64.rs" rel=3D"nore=
ferrer" target=3D"_blank">x86_64.rs</a>&quot;:&quot;2df36a7f122f6d6e5753cfb=
4d22e915cc80f6bc91c0161b3daae55a481bfd052&quot;,&quot;src/unix/bsd/freebsdl=
ike/freebsd/freebsd14/<a href=3D"http://b64.rs" rel=3D"noreferrer" target=
=3D"_blank">b64.rs</a>&quot;:&quot;61cbe45f8499bedb168106b686d4f8239472f25c=
7553b069eec2afe197ff2df6&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freeb=
sd14/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs<=
/a>&quot;:&quot;6ddc6abf6d5ccaea0d8cccf521e8ca6457efcad3086af4155628d5d06d6=
72346&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd14/<a href=3D"htt=
p://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.rs</a>&quot;:&qu=
ot;e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650&quot;,&=
quot;src/unix/bsd/freebsdlike/freebsd/freebsd15/<a href=3D"http://b64.rs" r=
el=3D"noreferrer" target=3D"_blank">b64.rs</a>&quot;:&quot;61cbe45f8499bedb=
168106b686d4f8239472f25c7553b069eec2afe197ff2df6&quot;,&quot;src/unix/bsd/f=
reebsdlike/freebsd/freebsd15/<a href=3D"http://mod.rs" rel=3D"noreferrer" t=
arget=3D"_blank">mod.rs</a>&quot;:&quot;93115c1a9faa43ebf58b7dee3582aed5a54=
291b284764e370e7f649b2e6a9565&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/=
freebsd15/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank"=
>x86_64.rs</a>&quot;:&quot;e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae81=
0bbca117e4fcb650&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a href=3D"ht=
tp://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;08=
e39a42392936857fd0c1c6b01788f5630fe8ff7f78b062490509c5dd816a42&quot;,&quot;=
src/unix/bsd/freebsdlike/freebsd/<a href=3D"http://powerpc.rs" rel=3D"noref=
errer" target=3D"_blank">powerpc.rs</a>&quot;:&quot;9ca3f82f88974e6db5569f2=
d76a5a3749b248a31747a6c0da5820492bdfeca42&quot;,&quot;src/unix/bsd/freebsdl=
ike/freebsd/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" target=3D"_b=
lank">powerpc64.rs</a>&quot;:&quot;2dae3ecc87eac3b11657aa98915def55fc4b5c0d=
e11fe26aae23329a54628a9a&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a hr=
ef=3D"http://riscv64.rs" rel=3D"noreferrer" target=3D"_blank">riscv64.rs</a=
>&quot;:&quot;fa4bed4c58cad24ba3395941c7fa6b11e089551a04714f9561078e400f5b2=
b62&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a href=3D"http://x86.rs" =
rel=3D"noreferrer" target=3D"_blank">x86.rs</a>&quot;:&quot;2837fed0ffee0ec=
443ecdb743b7142bcb4d6ba2de87e05459fb4498789d47200&quot;,&quot;src/unix/bsd/=
freebsdlike/freebsd/x86_64/<a href=3D"http://align.rs" rel=3D"noreferrer" t=
arget=3D"_blank">align.rs</a>&quot;:&quot;0e1f69a88fca1c32874b1daf5db3d446f=
efbe518dca497f096cc9168c39dde70&quot;,&quot;src/unix/bsd/freebsdlike/freebs=
d/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod=
.rs</a>&quot;:&quot;e4d76219bec0621db07dec37de9be1a9b7fb38daa10ffc1a6adbdbc=
34e163435&quot;,&quot;src/unix/bsd/freebsdlike/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;c846f30eaffc7c1a2=
1b4acd3df75cd17bb3d4f11401c9a9770924e4e6d847995&quot;,&quot;src/unix/bsd/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;37765749481f7d0dec8681d8c9d0735e6021094b4ef4a2d9aab5643d7a4232e1&q=
uot;,&quot;src/unix/bsd/netbsdlike/<a href=3D"http://mod.rs" rel=3D"norefer=
rer" target=3D"_blank">mod.rs</a>&quot;:&quot;ea60540aa4edd4e43136749d5df49=
7b1dc072b9912b6030dd1ab794a6d1c3c3c&quot;,&quot;src/unix/bsd/netbsdlike/net=
bsd/<a href=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_blank">aarc=
h64.rs</a>&quot;:&quot;057ee877db7193ba0dc10801b9a6563ac6dbdb78376d6851a84c=
b12b30841759&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a href=3D"http://a=
rm.rs" rel=3D"noreferrer" target=3D"_blank">arm.rs</a>&quot;:&quot;949b55e4=
dee1c8c511f4f061a6a57ac876a6c0eabfaf5cc20e9ab40d8f41b2e0&quot;,&quot;src/un=
ix/bsd/netbsdlike/netbsd/<a href=3D"http://mips.rs" rel=3D"noreferrer" targ=
et=3D"_blank">mips.rs</a>&quot;:&quot;88be18ac43ba224c77e78e4179b6761debc5e=
6c30a258fac56263809c7af4fbc&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a h=
ref=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;=
:&quot;ab09cea2897ecd27fc7e35822dac23d6dcd53f8577c771db3ee8b015e8d82001&quo=
t;,&quot;src/unix/bsd/netbsdlike/netbsd/<a href=3D"http://powerpc.rs" rel=
=3D"noreferrer" target=3D"_blank">powerpc.rs</a>&quot;:&quot;ee7ff5d89d0ed2=
2f531237b5059aa669df93a3b5c489fa641465ace8d405bf41&quot;,&quot;src/unix/bsd=
/netbsdlike/netbsd/<a href=3D"http://riscv64.rs" rel=3D"noreferrer" target=
=3D"_blank">riscv64.rs</a>&quot;:&quot;1cbe2e5ed681cb1054b699da37daaf6c7142=
67df7d332c90fc2a589b11579625&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a =
href=3D"http://sparc64.rs" rel=3D"noreferrer" target=3D"_blank">sparc64.rs<=
/a>&quot;:&quot;9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b90=
2d7d9&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a href=3D"http://x86.rs" =
rel=3D"noreferrer" target=3D"_blank">x86.rs</a>&quot;:&quot;20692320e36bfe0=
28d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7&quot;,&quot;src/unix/bsd/=
netbsdlike/netbsd/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D=
"_blank">x86_64.rs</a>&quot;:&quot;532b76199d6c71ff996eade9f906c55a72c9aff4=
89595d25a21e21878cfd740b&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a hre=
f=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>=
&quot;:&quot;dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36=
af&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a href=3D"http://arm.rs" re=
l=3D"noreferrer" target=3D"_blank">arm.rs</a>&quot;:&quot;01580d261bc6447bb=
327a0d982181b7bdabfa066cee65a30373d3ced729ad307&quot;,&quot;src/unix/bsd/ne=
tbsdlike/openbsd/<a href=3D"http://mips64.rs" rel=3D"noreferrer" target=3D"=
_blank">mips64.rs</a>&quot;:&quot;8532a189ae10c7d668d9d4065da8b05d124e09bd3=
9442c9f74a7f231c43eca48&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a href=
=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&q=
uot;7b93b5b24b3c72a79b2de19b47ac2f56b29d87e9fc8f4c721a63d1e87ec83fcc&quot;,=
&quot;src/unix/bsd/netbsdlike/openbsd/<a href=3D"http://powerpc.rs" rel=3D"=
noreferrer" target=3D"_blank">powerpc.rs</a>&quot;:&quot;01580d261bc6447bb3=
27a0d982181b7bdabfa066cee65a30373d3ced729ad307&quot;,&quot;src/unix/bsd/net=
bsdlike/openbsd/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" target=
=3D"_blank">powerpc64.rs</a>&quot;:&quot;1dd5449dd1fd3d51e30ffdeeaece91d0aa=
f05c710e0ac699fecc5461cfa2c28e&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/=
<a href=3D"http://riscv64.rs" rel=3D"noreferrer" target=3D"_blank">riscv64.=
rs</a>&quot;:&quot;1fe3332dc705a13e6242219970f5449d6d7a73e2e6c8537ab8e421d8=
a6f2e3ff&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a href=3D"http://spar=
c64.rs" rel=3D"noreferrer" target=3D"_blank">sparc64.rs</a>&quot;:&quot;d04=
fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085&quot;,&quot;s=
rc/unix/bsd/netbsdlike/openbsd/<a href=3D"http://x86.rs" rel=3D"noreferrer"=
 target=3D"_blank">x86.rs</a>&quot;:&quot;6f7f5c4fde2a2259eb547890cbd86570c=
ea04ef85347d7569e94e679448bec87&quot;,&quot;src/unix/bsd/netbsdlike/openbsd=
/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.r=
s</a>&quot;:&quot;d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7=
675a4e1&quot;,&quot;src/unix/haiku/<a href=3D"http://b32.rs" rel=3D"norefer=
rer" target=3D"_blank">b32.rs</a>&quot;:&quot;a2efdbf7158a6da341e1db9176b0a=
b193ba88b449616239ed95dced11f54d87b&quot;,&quot;src/unix/haiku/<a href=3D"h=
ttp://b64.rs" rel=3D"noreferrer" target=3D"_blank">b64.rs</a>&quot;:&quot;f=
f8115367d3d7d354f792d6176dfaaa26353f57056197b563bf4681f91ff7985&quot;,&quot=
;src/unix/haiku/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bla=
nk">mod.rs</a>&quot;:&quot;b75976d84bdf4a3a226336bb06ec231d552240f302bb5da4=
8ead692fd72758f9&quot;,&quot;src/unix/haiku/<a href=3D"http://native.rs" re=
l=3D"noreferrer" target=3D"_blank">native.rs</a>&quot;:&quot;2b1f88c043777a=
915bb7218aa05a3647a0e0481ebff55a99e351c45dea2be8de&quot;,&quot;src/unix/hai=
ku/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64=
.rs</a>&quot;:&quot;3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789=
f043b7237&quot;,&quot;src/unix/hurd/<a href=3D"http://align.rs" rel=3D"nore=
ferrer" target=3D"_blank">align.rs</a>&quot;:&quot;03c79b2cd8270ebd0cf93cb4=
75a8f1ff85b28175ea0de007ede17cad94a89b03&quot;,&quot;src/unix/hurd/<a href=
=3D"http://b32.rs" rel=3D"noreferrer" target=3D"_blank">b32.rs</a>&quot;:&q=
uot;2ba90ed973f90366c36a6387833a3df42abfee9622d4a0352635937d4a89eaf4&quot;,=
&quot;src/unix/hurd/<a href=3D"http://b64.rs" rel=3D"noreferrer" target=3D"=
_blank">b64.rs</a>&quot;:&quot;d919b4aec9b3080ad24c125c57b2c8b2e483d72045f1=
554c429d14560355846f&quot;,&quot;src/unix/hurd/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;23ebadfdb9a92d7fb=
9e32b6a7c95669ce979ba7407b924869f40a59d2807d052&quot;,&quot;src/unix/hurd/<=
a href=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank">no_align=
.rs</a>&quot;:&quot;03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17ca=
d94a89b03&quot;,&quot;src/unix/linux_like/android/b32/<a href=3D"http://arm=
.rs" rel=3D"noreferrer" target=3D"_blank">arm.rs</a>&quot;:&quot;ce582de7e9=
83a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3ec2564&quot;,&quot;src/unix=
/linux_like/android/b32/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=
=3D"_blank">mod.rs</a>&quot;:&quot;7c173e0375119bf06a3081652faede95e5bcd685=
8e7576b7533d037978737c8f&quot;,&quot;src/unix/linux_like/android/b32/x86/<a=
 href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>=
&quot;:&quot;812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0d=
ab&quot;,&quot;src/unix/linux_like/android/b32/x86/<a href=3D"http://mod.rs=
" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;e6d107efbcd37=
b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac&quot;,&quot;src/unix/li=
nux_like/android/b64/aarch64/<a href=3D"http://align.rs" rel=3D"noreferrer"=
 target=3D"_blank">align.rs</a>&quot;:&quot;2179c3b1608fa4bf68840482bfc2b2f=
a3ee2faf6fcae3770f9e505cddca35c7b&quot;,&quot;src/unix/linux_like/android/b=
64/aarch64/<a href=3D"http://int128.rs" rel=3D"noreferrer" target=3D"_blank=
">int128.rs</a>&quot;:&quot;1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82=
f23f3288a4a7276de&quot;,&quot;src/unix/linux_like/android/b64/aarch64/<a hr=
ef=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:=
&quot;873af67c4a9757ead56bc797d04efcecd311ecbf0084ebdd198fb690463ef299&quot=
;,&quot;src/unix/linux_like/android/b64/<a href=3D"http://mod.rs" rel=3D"no=
referrer" target=3D"_blank">mod.rs</a>&quot;:&quot;7b8efbd61ab965c93bacfab7=
8108ff8eed38af07b119099020dc41a9d0901559&quot;,&quot;src/unix/linux_like/an=
droid/b64/riscv64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"=
_blank">align.rs</a>&quot;:&quot;0bf138f84e5327d8339bcd4adf071a6832b516445e=
597552c82bbd881095e3a8&quot;,&quot;src/unix/linux_like/android/b64/riscv64/=
<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&q=
uot;:&quot;19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d=
&quot;,&quot;src/unix/linux_like/android/b64/x86_64/<a href=3D"http://align=
.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;7169d07a=
9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6&quot;,&quot;src/un=
ix/linux_like/android/b64/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferre=
r" target=3D"_blank">mod.rs</a>&quot;:&quot;4ec2de11a9b65c4325b7b991f0b99a4=
14975e0e61ba8668caca5d921e9b314d1&quot;,&quot;src/unix/linux_like/android/<=
a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&qu=
ot;:&quot;384275dc1d3559a9f83559b6c903758a9dc4c4b3d13db48d23ed4fdc3c0ff8da&=
quot;,&quot;src/unix/linux_like/emscripten/<a href=3D"http://align.rs" rel=
=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;86c95cbed7a7161b=
1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216&quot;,&quot;src/unix/linux=
_like/emscripten/<a href=3D"http://lfs64.rs" rel=3D"noreferrer" target=3D"_=
blank">lfs64.rs</a>&quot;:&quot;3776af30a758d765a88920ec4fde442ab89040da13d=
3b3625c7fbcb8a958559f&quot;,&quot;src/unix/linux_like/emscripten/<a href=3D=
"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot=
;70d4591730a731ee32788a9d8d2de379592844ec36b7d1723514179605587713&quot;,&qu=
ot;src/unix/linux_like/emscripten/<a href=3D"http://no_align.rs" rel=3D"nor=
eferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;0128e4aa721a99027548=
28b61b5ec7d8a86619983ed1e0544a85d35b1051fad6&quot;,&quot;src/unix/linux_lik=
e/linux/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">al=
ign.rs</a>&quot;:&quot;bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff049228f6=
a1acad80ef8b&quot;,&quot;src/unix/linux_like/linux/arch/generic/<a href=3D"=
http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;=
3ab533349696d24505adb6bb9183d73fd5e3b17e2f90dd21478af2a47b4d6fa8&quot;,&quo=
t;src/unix/linux_like/linux/arch/mips/<a href=3D"http://mod.rs" rel=3D"nore=
ferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;ca3db0e3ae852abf18f3588e40=
d5d64707fcc1829e08ddc5da1080e1a92c8851&quot;,&quot;src/unix/linux_like/linu=
x/arch/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.r=
s</a>&quot;:&quot;5bd5361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa=
1fdf198&quot;,&quot;src/unix/linux_like/linux/arch/powerpc/<a href=3D"http:=
//mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;0bc2d=
2667a00eca81f4abeb6d613a90848a947f51224103f83268928b8197629&quot;,&quot;src=
/unix/linux_like/linux/arch/sparc/<a href=3D"http://mod.rs" rel=3D"noreferr=
er" target=3D"_blank">mod.rs</a>&quot;:&quot;5e6777863e74a9e2aa9dc487f10597=
83dd211babc2b32d6bf676f311e49c55d6&quot;,&quot;src/unix/linux_like/linux/gn=
u/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs=
</a>&quot;:&quot;e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7=
b9f936&quot;,&quot;src/unix/linux_like/linux/gnu/b32/arm/<a href=3D"http://=
align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;6ec=
0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb&quot;,&quot;s=
rc/unix/linux_like/linux/gnu/b32/arm/<a href=3D"http://mod.rs" rel=3D"noref=
errer" target=3D"_blank">mod.rs</a>&quot;:&quot;f68ec59b6407f9d4e326f3e71a4=
1ec21f19ecfc703edf9a93e496f661fed5506&quot;,&quot;src/unix/linux_like/linux=
/gnu/b32/csky/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_bla=
nk">align.rs</a>&quot;:&quot;3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e29=
0259c5cdbae25f039d&quot;,&quot;src/unix/linux_like/linux/gnu/b32/csky/<a hr=
ef=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:=
&quot;8729b68e433e94c2128e51a7db4fd555938e4be4dc64584c352b24a20d9c8e91&quot=
;,&quot;src/unix/linux_like/linux/gnu/b32/m68k/<a href=3D"http://align.rs" =
rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;8faa92f77a923=
2c035418d45331774e64a9a841d99c91791570a203bf2b45bcb&quot;,&quot;src/unix/li=
nux_like/linux/gnu/b32/m68k/<a href=3D"http://mod.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">mod.rs</a>&quot;:&quot;80956d3fef163ecf248828a6f38782dd8ae8=
56d86b1bb5aac2de36032dbd8ea0&quot;,&quot;src/unix/linux_like/linux/gnu/b32/=
mips/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align=
.rs</a>&quot;:&quot;429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd5874=
72ae954ee&quot;,&quot;src/unix/linux_like/linux/gnu/b32/mips/<a href=3D"htt=
p://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;96e=
22350d5d132d917c743d6560464500652c67b52c3d0e8474494487df3365d&quot;,&quot;s=
rc/unix/linux_like/linux/gnu/b32/<a href=3D"http://mod.rs" rel=3D"noreferre=
r" target=3D"_blank">mod.rs</a>&quot;:&quot;b56625dd20dd48a8699034d349ef089=
c540c0ddcbf8a3481d598d101f8b40b78&quot;,&quot;src/unix/linux_like/linux/gnu=
/b32/<a href=3D"http://powerpc.rs" rel=3D"noreferrer" target=3D"_blank">pow=
erpc.rs</a>&quot;:&quot;20fc3cc4fe1ef6617b63b61b897f782ceb9c2842fc718f504a1=
840537229bf47&quot;,&quot;src/unix/linux_like/linux/gnu/b32/riscv32/<a href=
=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot=
;:&quot;d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119&qu=
ot;,&quot;src/unix/linux_like/linux/gnu/b32/riscv32/<a href=3D"http://mod.r=
s" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;887288a0a1cf=
ff319d0e15edcdc4fcb31fd643ff41715ec5244c8f2413624169&quot;,&quot;src/unix/l=
inux_like/linux/gnu/b32/sparc/<a href=3D"http://align.rs" rel=3D"noreferrer=
" target=3D"_blank">align.rs</a>&quot;:&quot;21adbed27df73e2d1ed934aaf733a6=
43003d7baf2bde9c48ea440895bcca6d41&quot;,&quot;src/unix/linux_like/linux/gn=
u/b32/sparc/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">=
mod.rs</a>&quot;:&quot;cc4342b949e4d796f304acd9dfe3f721a1c2f37fec16b42d3bb2=
7dc94723af37&quot;,&quot;src/unix/linux_like/linux/gnu/b32/x86/<a href=3D"h=
ttp://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&qu=
ot;e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413&quot;,&=
quot;src/unix/linux_like/linux/gnu/b32/x86/<a href=3D"http://mod.rs" rel=3D=
"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;06d4db4ee8352f62a0a5e=
ad0c4d6ea0a78feff522f19b9bc5772f6dd920ffd80&quot;,&quot;src/unix/linux_like=
/linux/gnu/b64/aarch64/<a href=3D"http://align.rs" rel=3D"noreferrer" targe=
t=3D"_blank">align.rs</a>&quot;:&quot;fdf1c72375a2167699157e0dd825422690bb6=
719f7bc69515a2e5846d0431d7c&quot;,&quot;src/unix/linux_like/linux/gnu/b64/a=
arch64/<a href=3D"http://fallback.rs" rel=3D"noreferrer" target=3D"_blank">=
fallback.rs</a>&quot;:&quot;832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab8=
3c56915cbc59d8be3&quot;,&quot;src/unix/linux_like/linux/gnu/b64/aarch64/<a =
href=3D"http://ilp32.rs" rel=3D"noreferrer" target=3D"_blank">ilp32.rs</a>&=
quot;:&quot;bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e2=
9&quot;,&quot;src/unix/linux_like/linux/gnu/b64/aarch64/<a href=3D"http://i=
nt128.rs" rel=3D"noreferrer" target=3D"_blank">int128.rs</a>&quot;:&quot;17=
35f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de&quot;,&quot;=
src/unix/linux_like/linux/gnu/b64/aarch64/<a href=3D"http://lp64.rs" rel=3D=
"noreferrer" target=3D"_blank">lp64.rs</a>&quot;:&quot;11a950697fdda0258c6e=
37c6b13993348c8de4134105ed4faa79358e53175072&quot;,&quot;src/unix/linux_lik=
e/linux/gnu/b64/aarch64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=
=3D"_blank">mod.rs</a>&quot;:&quot;8202614484da36c388d2ffdd2554c56bb4f9db8e=
5bd621f8c36114cdcfeec644&quot;,&quot;src/unix/linux_like/linux/gnu/b64/loon=
garch64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">al=
ign.rs</a>&quot;:&quot;060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60&quot;,&quot;src/unix/linux_like/linux/gnu/b64/loongarch64/<a h=
ref=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;=
:&quot;10f025edecebc6e0ed8fdae4736ebe7564189741d5b910433f07c21fc12a94d8&quo=
t;,&quot;src/unix/linux_like/linux/gnu/b64/mips64/<a href=3D"http://align.r=
s" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;7169d07a9f=
d4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6&quot;,&quot;src/unix=
/linux_like/linux/gnu/b64/mips64/<a href=3D"http://mod.rs" rel=3D"noreferre=
r" target=3D"_blank">mod.rs</a>&quot;:&quot;73532be4b5775acf9524c77feeefe1f=
6d1936ceffef908d01dd2586986520f2d&quot;,&quot;src/unix/linux_like/linux/gnu=
/b64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs<=
/a>&quot;:&quot;6a160ef25439c4fecdb0e3bd0b818742263c791364da874d4febd3aa644=
ec8e2&quot;,&quot;src/unix/linux_like/linux/gnu/b64/powerpc64/<a href=3D"ht=
tp://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quo=
t;e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9&quot;,&q=
uot;src/unix/linux_like/linux/gnu/b64/powerpc64/<a href=3D"http://mod.rs" r=
el=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;a90c2641616c620e=
9d1fea87695ce046e14f9da2282bb93f761eeb4077c74741&quot;,&quot;src/unix/linux=
_like/linux/gnu/b64/riscv64/<a href=3D"http://align.rs" rel=3D"noreferrer" =
target=3D"_blank">align.rs</a>&quot;:&quot;fe7e3c928d0367c37eb652686591801c=
3694a3558ebbbeb5c22be692265d07f2&quot;,&quot;src/unix/linux_like/linux/gnu/=
b64/riscv64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">=
mod.rs</a>&quot;:&quot;dec86883731f7b8419bff35b125b40eefc927090c1510f6daf93=
1726f7965c0b&quot;,&quot;src/unix/linux_like/linux/gnu/b64/<a href=3D"http:=
//s390x.rs" rel=3D"noreferrer" target=3D"_blank">s390x.rs</a>&quot;:&quot;1=
ea9e39432ce6bf68779d33546dacd7d39477a9f8fc3da4f4f339e4538cb74c3&quot;,&quot=
;src/unix/linux_like/linux/gnu/b64/sparc64/<a href=3D"http://align.rs" rel=
=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;e29c4868bbecfa4a=
6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9&quot;,&quot;src/unix/linux=
_like/linux/gnu/b64/sparc64/<a href=3D"http://mod.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">mod.rs</a>&quot;:&quot;bed381c44cec2a5b50125f7e548ab487d4c8=
29006c971d152a611b7141760052&quot;,&quot;src/unix/linux_like/linux/gnu/b64/=
x86_64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">ali=
gn.rs</a>&quot;:&quot;62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b057=
8bcc4b49769&quot;,&quot;src/unix/linux_like/linux/gnu/b64/x86_64/<a href=3D=
"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot=
;332846e4a5920d7e6b05df0448a2333c5dd00fb27cb33654648f507ee89dbec5&quot;,&qu=
ot;src/unix/linux_like/linux/gnu/b64/x86_64/<a href=3D"http://not_x32.rs" r=
el=3D"noreferrer" target=3D"_blank">not_x32.rs</a>&quot;:&quot;38f74ce15d96=
62ce4818815a2b87be1618d5e45f190f7e4db84ff3285b4421fb&quot;,&quot;src/unix/l=
inux_like/linux/gnu/b64/x86_64/<a href=3D"http://x32.rs" rel=3D"noreferrer"=
 target=3D"_blank">x32.rs</a>&quot;:&quot;b20218a11364a6dec87f96d6c0d8b19e6=
60697ab09ad5ee0e9b3a9dafedaaebb&quot;,&quot;src/unix/linux_like/linux/gnu/<=
a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&qu=
ot;:&quot;8d11f66db9993e9a89c86fec3b732d9c0ec4ee42d9570d4e3389c075021dd29f&=
quot;,&quot;src/unix/linux_like/linux/gnu/<a href=3D"http://no_align.rs" re=
l=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;9cd223135de7=
5315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25&quot;,&quot;src/unix/l=
inux_like/linux/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bla=
nk">mod.rs</a>&quot;:&quot;da8c17828415fc1db81fb547fe20b7421774a3bdd3e79053=
cc127a3031e59302&quot;,&quot;src/unix/linux_like/linux/musl/b32/arm/<a href=
=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot=
;:&quot;3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c&qu=
ot;,&quot;src/unix/linux_like/linux/musl/b32/arm/<a href=3D"http://mod.rs" =
rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;af10147d7c36617=
51750a58ffad089d5d18d180cd18303c653aef126c07ccd91&quot;,&quot;src/unix/linu=
x_like/linux/musl/b32/<a href=3D"http://hexagon.rs" rel=3D"noreferrer" targ=
et=3D"_blank">hexagon.rs</a>&quot;:&quot;d079cab42529f7dab699334d43168c74ff=
4aa0282f11040a8b7d274b65767a7a&quot;,&quot;src/unix/linux_like/linux/musl/b=
32/mips/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">al=
ign.rs</a>&quot;:&quot;429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd5=
87472ae954ee&quot;,&quot;src/unix/linux_like/linux/musl/b32/mips/<a href=3D=
"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot=
;e44043766f7cd26de7ffa4232654afb6feb03e58dbd5890717970887bd003151&quot;,&qu=
ot;src/unix/linux_like/linux/musl/b32/<a href=3D"http://mod.rs" rel=3D"nore=
ferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;31677597fd9544c4b1ec147762=
8288f6273fabbc06e38f33da862ad55f019ce1&quot;,&quot;src/unix/linux_like/linu=
x/musl/b32/<a href=3D"http://powerpc.rs" rel=3D"noreferrer" target=3D"_blan=
k">powerpc.rs</a>&quot;:&quot;3dae56a4e7789bcc5314e419fea5e4b2495367b4f1a49=
d1c9477c60225d65eef&quot;,&quot;src/unix/linux_like/linux/musl/b32/riscv32/=
<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</=
a>&quot;:&quot;efd2accf33b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a=
5d48&quot;,&quot;src/unix/linux_like/linux/musl/b32/riscv32/<a href=3D"http=
://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;3ee8=
45d272f91a1908d5f421d7c353e1f14681bbdfef64410e408f4c14365a91&quot;,&quot;sr=
c/unix/linux_like/linux/musl/b32/x86/<a href=3D"http://align.rs" rel=3D"nor=
eferrer" target=3D"_blank">align.rs</a>&quot;:&quot;08e77fbd7435d7dec2ff569=
32433bece3f02e47ce810f89004a275a86d39cbe1&quot;,&quot;src/unix/linux_like/l=
inux/musl/b32/x86/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_b=
lank">mod.rs</a>&quot;:&quot;f2b53ae0034c833244b7cdb8c670349bf8272a03abf041=
52eba65cf62810484d&quot;,&quot;src/unix/linux_like/linux/musl/b64/aarch64/<=
a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a=
>&quot;:&quot;6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821=
133&quot;,&quot;src/unix/linux_like/linux/musl/b64/aarch64/<a href=3D"http:=
//int128.rs" rel=3D"noreferrer" target=3D"_blank">int128.rs</a>&quot;:&quot=
;1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de&quot;,&qu=
ot;src/unix/linux_like/linux/musl/b64/aarch64/<a href=3D"http://mod.rs" rel=
=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;45ce6897afcc960267=
bb7505702b639daf94dc69428a213bf1aefd367ca32adc&quot;,&quot;src/unix/linux_l=
ike/linux/musl/b64/loongarch64/<a href=3D"http://align.rs" rel=3D"noreferre=
r" target=3D"_blank">align.rs</a>&quot;:&quot;060aa33cc737966c691aab8511c5c=
5729e551458ce18d0e284e0d45f39beeb60&quot;,&quot;src/unix/linux_like/linux/m=
usl/b64/loongarch64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"=
_blank">mod.rs</a>&quot;:&quot;3d9ef92e682a1789544a2bd20cad5a5623db9d7d9f5d=
0a3692bb0230af034165&quot;,&quot;src/unix/linux_like/linux/musl/b64/<a href=
=3D"http://mips64.rs" rel=3D"noreferrer" target=3D"_blank">mips64.rs</a>&qu=
ot;:&quot;a968ef9c54fa22293085f318c8472c1754482df92cc500568dc33bd807d71ea6&=
quot;,&quot;src/unix/linux_like/linux/musl/b64/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;20ceaf90a03c24a2e=
b154a5dffbfc9a538348404db5b554a3d8126021ba45509&quot;,&quot;src/unix/linux_=
like/linux/musl/b64/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" targ=
et=3D"_blank">powerpc64.rs</a>&quot;:&quot;140e579800a67315f4cb8a42b22aa815=
7eae34ffe626e77e421b43c53c23b34d&quot;,&quot;src/unix/linux_like/linux/musl=
/b64/riscv64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blan=
k">align.rs</a>&quot;:&quot;fe7e3c928d0367c37eb652686591801c3694a3558ebbbeb=
5c22be692265d07f2&quot;,&quot;src/unix/linux_like/linux/musl/b64/riscv64/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;c5944526d7e19cd43e9d14d119a1d98f8780db7ecbcc79e69d7b9348e596b520&q=
uot;,&quot;src/unix/linux_like/linux/musl/b64/<a href=3D"http://s390x.rs" r=
el=3D"noreferrer" target=3D"_blank">s390x.rs</a>&quot;:&quot;8557b3477ca8ce=
fef7fce764a3c25441929a54e50ead4091f6f7823c427cd728&quot;,&quot;src/unix/lin=
ux_like/linux/musl/b64/x86_64/<a href=3D"http://align.rs" rel=3D"noreferrer=
" target=3D"_blank">align.rs</a>&quot;:&quot;77309276ad7a42cbe59ca381f23590=
b7a143aded05555b34a5b307b808cbca6e&quot;,&quot;src/unix/linux_like/linux/mu=
sl/b64/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank=
">mod.rs</a>&quot;:&quot;a91c4f18027c9958037f78ae48f6352d23cb4e6f2995b2cc8d=
e7dce0e5759470&quot;,&quot;src/unix/linux_like/linux/musl/<a href=3D"http:/=
/lfs64.rs" rel=3D"noreferrer" target=3D"_blank">lfs64.rs</a>&quot;:&quot;3e=
4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f&quot;,&quot;=
src/unix/linux_like/linux/musl/<a href=3D"http://mod.rs" rel=3D"noreferrer"=
 target=3D"_blank">mod.rs</a>&quot;:&quot;94dd7eb5064230637ccd135383c7d30f8=
d3f7874c22771b24b529e58de421731&quot;,&quot;src/unix/linux_like/linux/<a hr=
ef=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank">no_align.rs<=
/a>&quot;:&quot;62cdca0e011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa635=
7d784&quot;,&quot;src/unix/linux_like/linux/<a href=3D"http://non_exhaustiv=
e.rs" rel=3D"noreferrer" target=3D"_blank">non_exhaustive.rs</a>&quot;:&quo=
t;181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9&quot;,&q=
uot;src/unix/linux_like/linux/uclibc/<a href=3D"http://align.rs" rel=3D"nor=
eferrer" target=3D"_blank">align.rs</a>&quot;:&quot;9ed16138d8e439bd9093084=
5a65eafa7ebd67366e6bf633936d44014f6e4c959&quot;,&quot;src/unix/linux_like/l=
inux/uclibc/arm/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_b=
lank">align.rs</a>&quot;:&quot;e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936&quot;,&quot;src/unix/linux_like/linux/uclibc/arm/<a hr=
ef=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:=
&quot;50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e&quot=
;,&quot;src/unix/linux_like/linux/uclibc/arm/<a href=3D"http://no_align.rs"=
 rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;9cd223135=
de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25&quot;,&quot;src/uni=
x/linux_like/linux/uclibc/mips/mips32/<a href=3D"http://align.rs" rel=3D"no=
referrer" target=3D"_blank">align.rs</a>&quot;:&quot;e4a3c27fe20a57b8d612c3=
4cb05bc70646edb5cec7251957315afa53a7b9f936&quot;,&quot;src/unix/linux_like/=
linux/uclibc/mips/mips32/<a href=3D"http://mod.rs" rel=3D"noreferrer" targe=
t=3D"_blank">mod.rs</a>&quot;:&quot;d0c4434e2bf813372c418a8f516c706cdccc9f7=
be2f0921b2207b0afdb66fe81&quot;,&quot;src/unix/linux_like/linux/uclibc/mips=
/mips32/<a href=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank"=
>no_align.rs</a>&quot;:&quot;9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85=
a76f8316c86653db25&quot;,&quot;src/unix/linux_like/linux/uclibc/mips/mips64=
/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs<=
/a>&quot;:&quot;a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd=
08b2d&quot;,&quot;src/unix/linux_like/linux/uclibc/mips/mips64/<a href=3D"h=
ttp://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;3=
f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0&quot;,&quot=
;src/unix/linux_like/linux/uclibc/mips/mips64/<a href=3D"http://no_align.rs=
" rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30&quot;,&quot;src/un=
ix/linux_like/linux/uclibc/mips/<a href=3D"http://mod.rs" rel=3D"noreferrer=
" target=3D"_blank">mod.rs</a>&quot;:&quot;a048fce1c2d9b1ad57305642e8ad05ca=
0f0c7e4753267a2e2d6b4fee5db3b072&quot;,&quot;src/unix/linux_like/linux/ucli=
bc/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a=
>&quot;:&quot;6efae7ed906bc5773dcce43ba1045cf93df5f8dac41f194d8cddc0579f14c=
015&quot;,&quot;src/unix/linux_like/linux/uclibc/<a href=3D"http://no_align=
.rs" rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;3f286=
37046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709&quot;,&quot;src=
/unix/linux_like/linux/uclibc/x86_64/<a href=3D"http://l4re.rs" rel=3D"nore=
ferrer" target=3D"_blank">l4re.rs</a>&quot;:&quot;8485b9182b7c67f7344fab377=
e7cc2a72afefd9ab63837c860514abba9728d76&quot;,&quot;src/unix/linux_like/lin=
ux/uclibc/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bl=
ank">mod.rs</a>&quot;:&quot;e7197f0f68ece174c8ae42b2b9115893abfcdbe44a1a6ed=
98fb3cbd7bfe087e8&quot;,&quot;src/unix/linux_like/linux/uclibc/x86_64/<a hr=
ef=3D"http://other.rs" rel=3D"noreferrer" target=3D"_blank">other.rs</a>&qu=
ot;:&quot;42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8&=
quot;,&quot;src/unix/linux_like/<a href=3D"http://mod.rs" rel=3D"noreferrer=
" target=3D"_blank">mod.rs</a>&quot;:&quot;863f628cbaa864911ffebc58e9fb788b=
6c6a9651955fc401ac1f40f20eb62505&quot;,&quot;src/unix/<a href=3D"http://mod=
.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;5f851ce175=
6443b9219edd11b6cc2abfb4031a22a6496bb5d4d6090f97779f8a&quot;,&quot;src/unix=
/newlib/aarch64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bla=
nk">mod.rs</a>&quot;:&quot;964c096288da836b53c0c71d7f3a97048d177da220a69314=
c5ce93ba330d72af&quot;,&quot;src/unix/newlib/<a href=3D"http://align.rs" re=
l=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;28aaf87fafbc6b3=
12622719d472d8cf65f9e5467d15339df5f73e66d8502b28a&quot;,&quot;src/unix/newl=
ib/arm/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.r=
s</a>&quot;:&quot;cf754f8b1197489fca01e881a4b4b146e814998e4b365f116fa1a102c=
00e6a4e&quot;,&quot;src/unix/newlib/espidf/<a href=3D"http://mod.rs" rel=3D=
"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;689e29a9fff5a263e5ab8=
410d0a8919f77fa64aa12f4d71f71085a6f07f19f67&quot;,&quot;src/unix/newlib/<a =
href=3D"http://generic.rs" rel=3D"noreferrer" target=3D"_blank">generic.rs<=
/a>&quot;:&quot;5f0b5d07ddb5a5d60580f9561fdb05e9218d9751d4068c4aadad2ba6b95=
0aabf&quot;,&quot;src/unix/newlib/horizon/<a href=3D"http://mod.rs" rel=3D"=
noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;3a521d22bf932fc01c1d26=
d1f9bff20f11b1855b03c8236a8eb18310f6cab5a8&quot;,&quot;src/unix/newlib/<a h=
ref=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;=
:&quot;e5d5faf27a6336b9f1c02b8726427801d906a14dae766852b4e85c1a92df06c8&quo=
t;,&quot;src/unix/newlib/<a href=3D"http://no_align.rs" rel=3D"noreferrer" =
target=3D"_blank">no_align.rs</a>&quot;:&quot;e0743b2179495a9514bc3a4d1781e=
492878c4ec834ee0085d0891dd1712e82fb&quot;,&quot;src/unix/newlib/powerpc/<a =
href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot=
;:&quot;cc9e188711b9bf614323ad6c48e0d2e1a1ecc5d3bc64961ba451f29c6c22d2d8&qu=
ot;,&quot;src/unix/newlib/vita/<a href=3D"http://mod.rs" rel=3D"noreferrer"=
 target=3D"_blank">mod.rs</a>&quot;:&quot;ff1caf74bb0696fe15d60dbac598db452=
0cd538aa0f5989713d97d008eee6ad8&quot;,&quot;src/unix/<a href=3D"http://no_a=
lign.rs" rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;c=
06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53&quot;,&quot=
;src/unix/nto/<a href=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_b=
lank">aarch64.rs</a>&quot;:&quot;4709c9afdc8d583be876598e7c238499ee3e8da5bd=
2baa614d9c7dd414851555&quot;,&quot;src/unix/nto/<a href=3D"http://mod.rs" r=
el=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;5eb045c352114f5d=
744d098acaf9e47a9223f6fccd43f36b9a3ba79b29af0eee&quot;,&quot;src/unix/nto/<=
a href=3D"http://neutrino.rs" rel=3D"noreferrer" target=3D"_blank">neutrino=
.rs</a>&quot;:&quot;799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf1=
3bc80026b&quot;,&quot;src/unix/nto/<a href=3D"http://x86_64.rs" rel=3D"nore=
ferrer" target=3D"_blank">x86_64.rs</a>&quot;:&quot;a3e18e93c2999da1cd7a6f7=
48a4b60c07aefb73d8ea2aafec19a84cfb040bc8e&quot;,&quot;src/unix/redox/<a hre=
f=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&=
quot;e75a319975472fe9e0873244fb07c5d2004672b7a4cf7a3cb01532d6d394cb8a&quot;=
,&quot;src/unix/solarish/<a href=3D"http://compat.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">compat.rs</a>&quot;:&quot;00f1ee3faec9da69204e42f025f6735dd=
13d894071a154425dcc43ecbdd06e7f&quot;,&quot;src/unix/solarish/<a href=3D"ht=
tp://illumos.rs" rel=3D"noreferrer" target=3D"_blank">illumos.rs</a>&quot;:=
&quot;26171da367221de1e456f1236250b5831a770d6f109ed12b0ebe4d508e490194&quot=
;,&quot;src/unix/solarish/<a href=3D"http://mod.rs" rel=3D"noreferrer" targ=
et=3D"_blank">mod.rs</a>&quot;:&quot;c0c5dfc406d728666010cdc2fe21b0df40547e=
d20dd7ad0eab65906e103b6d4b&quot;,&quot;src/unix/solarish/<a href=3D"http://=
solaris.rs" rel=3D"noreferrer" target=3D"_blank">solaris.rs</a>&quot;:&quot=
;41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf&quot;,&qu=
ot;src/unix/solarish/<a href=3D"http://x86.rs" rel=3D"noreferrer" target=3D=
"_blank">x86.rs</a>&quot;:&quot;e86e806df0caed72765040eaa2f3c883198d1aa9150=
8540adf9b7008c77f522e&quot;,&quot;src/unix/solarish/<a href=3D"http://x86_6=
4.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.rs</a>&quot;:&quot;ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc&quot;,&quot;src/=
unix/solarish/<a href=3D"http://x86_common.rs" rel=3D"noreferrer" target=3D=
"_blank">x86_common.rs</a>&quot;:&quot;ac869d9c3c95645c22460468391eb1982023=
c3a8e02b9e06a72e3aef3d5f1eac&quot;,&quot;src/vxworks/<a href=3D"http://aarc=
h64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>&quot;:&quot;98f=
0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99&quot;,&quot;s=
rc/vxworks/<a href=3D"http://arm.rs" rel=3D"noreferrer" target=3D"_blank">a=
rm.rs</a>&quot;:&quot;acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88&quot;,&quot;src/vxworks/<a href=3D"http://mod.rs" rel=3D"norefe=
rrer" target=3D"_blank">mod.rs</a>&quot;:&quot;ccdb6a6e0c12011705a15dadc04b=
26882e6090db4403af4d15cad9330ef96370&quot;,&quot;src/vxworks/<a href=3D"htt=
p://powerpc.rs" rel=3D"noreferrer" target=3D"_blank">powerpc.rs</a>&quot;:&=
quot;acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88&quot;=
,&quot;src/vxworks/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" targe=
t=3D"_blank">powerpc64.rs</a>&quot;:&quot;98f0afdc511cd02557e506c21fed67375=
85490a1dce7a9d4941d08c437762b99&quot;,&quot;src/vxworks/<a href=3D"http://x=
86.rs" rel=3D"noreferrer" target=3D"_blank">x86.rs</a>&quot;:&quot;552f007f=
38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba&quot;,&quot;src/vx=
works/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86=
_64.rs</a>&quot;:&quot;018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a=
7f98ed6b514a&quot;,&quot;src/<a href=3D"http://wasi.rs" rel=3D"noreferrer" =
target=3D"_blank">wasi.rs</a>&quot;:&quot;51e38bb98547c40d0822d31975c976cd6=
e0784463d90d170109c87bf324395d3&quot;,&quot;src/windows/gnu/<a href=3D"http=
://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;=
b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647&quot;,&quo=
t;src/windows/gnu/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_b=
lank">mod.rs</a>&quot;:&quot;3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef3=
0571b4f4e38375767a&quot;,&quot;src/windows/<a href=3D"http://mod.rs" rel=3D=
"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;9fdc5e1c62c441abef7bc=
62a7343efb2041edc24db9ac0efc0f74df55b69e249&quot;,&quot;src/windows/msvc/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4&q=
uot;,&quot;src/<a href=3D"http://xous.rs" rel=3D"noreferrer" target=3D"_bla=
nk">xous.rs</a>&quot;:&quot;eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20=
756c49250f3d65fae&quot;,&quot;tests/<a href=3D"http://const_fn.rs" rel=3D"n=
oreferrer" target=3D"_blank">const_fn.rs</a>&quot;:&quot;cb75a1f0864f926aeb=
e79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4&quot;},&quot;package&quot;:&=
quot;d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439&quot;=
}<br>
&gt;&gt; -\ No newline at end of file<br>
&gt;&gt; -+{&quot;files&quot;:{&quot;CHANGELOG.md&quot;:&quot;96fb278d188e8=
7842fe2701f91e0f757665b44dc2e549accb6ed1ed6eeb67602&quot;,&quot;CONTRIBUTIN=
G.md&quot;:&quot;a93fcda0a76e1975fcfb0aa2ba00c9b1864f9ae6062704a294d81a3688=
898e10&quot;,&quot;Cargo.toml&quot;:&quot;2196e21d3fd56b3019e235720a32b4e3c=
8ada82c08cb01c06c695752201396df&quot;,&quot;LICENSE-APACHE&quot;:&quot;62c7=
a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a&quot;,&quot;LI=
CENSE-MIT&quot;:&quot;a8d47ff51ca256f56a8932dba07660672dbfe3004257ca8de708a=
ac1415937a1&quot;,&quot;README.md&quot;:&quot;4da2919bb509f3f06163778478494=
f780ca6627cb79ccab5d2c828c8d88dc133&quot;,&quot;<a href=3D"http://build.rs"=
 rel=3D"noreferrer" target=3D"_blank">build.rs</a>&quot;:&quot;54387230fed8=
d16f1169a845e92a1c1a5d9227559acbf3bfa383c7901b2d1be8&quot;,&quot;rustfmt.to=
ml&quot;:&quot;eaa2ea84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f7=
87b2&quot;,&quot;src/<a href=3D"http://fixed_width_ints.rs" rel=3D"noreferr=
er" target=3D"_blank">fixed_width_ints.rs</a>&quot;:&quot;7f986e5f5e68d25ef=
04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca&quot;,&quot;src/fuchsia/<a =
href=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs<=
/a>&quot;:&quot;893fcec48142d273063ffd814dca33fbec92205fd39ada97075f85201d8=
03996&quot;,&quot;src/fuchsia/<a href=3D"http://align.rs" rel=3D"noreferrer=
" target=3D"_blank">align.rs</a>&quot;:&quot;ae1cf8f011a99737eabeb14ffff768=
e60f13b13363d7646744dbb0f443dab3d6&quot;,&quot;src/fuchsia/<a href=3D"http:=
//mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;a8e3f=
f551e5ff4247ab1faa1b7ca1e042046a619198e8b30fe183c6ef8485d65&quot;,&quot;src=
/fuchsia/<a href=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank=
">no_align.rs</a>&quot;:&quot;303f3f1b255e0088b5715094353cf00476131d8e94e6a=
ebb3f469557771c8b8a&quot;,&quot;src/fuchsia/<a href=3D"http://riscv64.rs" r=
el=3D"noreferrer" target=3D"_blank">riscv64.rs</a>&quot;:&quot;617cd75e79e0=
e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b11&quot;,&quot;src/fuchsi=
a/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.=
rs</a>&quot;:&quot;93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec585=
2255ac87&quot;,&quot;src/<a href=3D"http://hermit.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">hermit.rs</a>&quot;:&quot;ad1e8685edf3f3a7c141ccc0e82d44b7f=
eb13e81f2f59ed6aeb6e4964524637c&quot;,&quot;src/<a href=3D"http://lib.rs" r=
el=3D"noreferrer" target=3D"_blank">lib.rs</a>&quot;:&quot;7f57f05b3d9e1e14=
a666aabbd942cf5959e778966981e604087774d56eb059c8&quot;,&quot;src/<a href=3D=
"http://macros.rs" rel=3D"noreferrer" target=3D"_blank">macros.rs</a>&quot;=
:&quot;5f985b3de7b18833f866bf832b8ffb0430f0f70aa9a468b6a2c855c1bf9d33e4&quo=
t;,&quot;src/<a href=3D"http://psp.rs" rel=3D"noreferrer" target=3D"_blank"=
>psp.rs</a>&quot;:&quot;0a7d5121a8cc2903009f586c00e4ae2d6126d24eb90531dafab=
a6f59823aa6b2&quot;,&quot;src/<a href=3D"http://sgx.rs" rel=3D"noreferrer" =
target=3D"_blank">sgx.rs</a>&quot;:&quot;16a95cdefc81c5ee00d8353a60db363c4c=
c3e0f75abcd5d0144723f2a306ed1b&quot;,&quot;src/solid/<a href=3D"http://aarc=
h64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>&quot;:&quot;a72=
6e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42ab7f8707&quot;,&quot;s=
rc/solid/<a href=3D"http://arm.rs" rel=3D"noreferrer" target=3D"_blank">arm=
.rs</a>&quot;:&quot;e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9cf4f1f4872=
097fc27fe&quot;,&quot;src/solid/<a href=3D"http://mod.rs" rel=3D"noreferrer=
" target=3D"_blank">mod.rs</a>&quot;:&quot;5f4151dca5132e4b4e4c23ab9737e128=
56dddbdc0ca3f7dbc004328ef3c8acde&quot;,&quot;src/<a href=3D"http://switch.r=
s" rel=3D"noreferrer" target=3D"_blank">switch.rs</a>&quot;:&quot;9da3dd39b=
3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba&quot;,&quot;src/tee=
os/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a=
>&quot;:&quot;ecf8922923fb7541ef7b0813cdc5418b75be56247c4dbdbb7dca58a076f25=
b97&quot;,&quot;src/unix/aix/<a href=3D"http://mod.rs" rel=3D"noreferrer" t=
arget=3D"_blank">mod.rs</a>&quot;:&quot;91de34bf8237e4998e10f9274471d14fb9a=
31ac6f2ef6e44689066b8e280b3d3&quot;,&quot;src/unix/aix/<a href=3D"http://po=
werpc64.rs" rel=3D"noreferrer" target=3D"_blank">powerpc64.rs</a>&quot;:&qu=
ot;cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8296f8e10d55169b&quot;,&=
quot;src/unix/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_bla=
nk">align.rs</a>&quot;:&quot;2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d=
7e4ceeec56d6874f65&quot;,&quot;src/unix/bsd/apple/b32/<a href=3D"http://ali=
gn.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;ec833a=
747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c&quot;,&quot;src/=
unix/bsd/apple/b32/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_=
blank">mod.rs</a>&quot;:&quot;2546ad3eb6aecb95f916648bc63264117c92b4b485953=
2b34cb011e4c75a5a72&quot;,&quot;src/unix/bsd/apple/b64/aarch64/<a href=3D"h=
ttp://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&qu=
ot;2eaf0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fef7b4df2ca8e38e144d94&quot;,&=
quot;src/unix/bsd/apple/b64/aarch64/<a href=3D"http://mod.rs" rel=3D"norefe=
rrer" target=3D"_blank">mod.rs</a>&quot;:&quot;44c217a4f263afe7a97435de9323=
d20a96c37836f899ca0925306d4b7e073c27&quot;,&quot;src/unix/bsd/apple/b64/<a =
href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&=
quot;:&quot;ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26=
c&quot;,&quot;src/unix/bsd/apple/b64/<a href=3D"http://mod.rs" rel=3D"noref=
errer" target=3D"_blank">mod.rs</a>&quot;:&quot;f5e278a1af7fb358891d1c9be4e=
b7e815aaca0c5cb738d0c3604ba2208a856f7&quot;,&quot;src/unix/bsd/apple/b64/x8=
6_64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align=
.rs</a>&quot;:&quot;ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884=
c40b0e26c&quot;,&quot;src/unix/bsd/apple/b64/x86_64/<a href=3D"http://mod.r=
s" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;8c87c5855038=
aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936&quot;,&quot;src/unix/b=
sd/apple/<a href=3D"http://long_array.rs" rel=3D"noreferrer" target=3D"_bla=
nk">long_array.rs</a>&quot;:&quot;3cf1f19b812e6d093c819dc65ce55b13491963e07=
80eda0d0bd1577603e81948&quot;,&quot;src/unix/bsd/apple/<a href=3D"http://mo=
d.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;484698da7=
c1083a46ae1a389486a8c2d75e3e6ecb4f80ded69b6c0dd2d1a92a0&quot;,&quot;src/uni=
x/bsd/freebsdlike/dragonfly/<a href=3D"http://errno.rs" rel=3D"noreferrer" =
target=3D"_blank">errno.rs</a>&quot;:&quot;8295b8bb0dfd38d2cdb4d9192cdeeb53=
4cc6c3b208170e64615fa3e0edb3e578&quot;,&quot;src/unix/bsd/freebsdlike/drago=
nfly/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs<=
/a>&quot;:&quot;2777f94909a798df1b8030fb86d02e2118d0ac3e49e9a542df54a569ca5=
ae2f9&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a href=3D"http://aarch6=
4.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>&quot;:&quot;6c8e2=
16385f53a4bf5f171749b57602fc34a4e4b160a44ca31c058cb0c8a2126&quot;,&quot;src=
/unix/bsd/freebsdlike/freebsd/<a href=3D"http://arm.rs" rel=3D"noreferrer" =
target=3D"_blank">arm.rs</a>&quot;:&quot;59d6a670eea562fb87686e243e0a84603d=
29a2028a3d4b3f99ccc01bd04d2f47&quot;,&quot;src/unix/bsd/freebsdlike/freebsd=
/freebsd11/<a href=3D"http://b64.rs" rel=3D"noreferrer" target=3D"_blank">b=
64.rs</a>&quot;:&quot;9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a4497554=
5e3d9d17681&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd11/<a href=
=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&q=
uot;e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec722ba80dac1f&quot;,=
&quot;src/unix/bsd/freebsdlike/freebsd/freebsd12/<a href=3D"http://b64.rs" =
rel=3D"noreferrer" target=3D"_blank">b64.rs</a>&quot;:&quot;61cbe45f8499bed=
b168106b686d4f8239472f25c7553b069eec2afe197ff2df6&quot;,&quot;src/unix/bsd/=
freebsdlike/freebsd/freebsd12/<a href=3D"http://mod.rs" rel=3D"noreferrer" =
target=3D"_blank">mod.rs</a>&quot;:&quot;bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8&quot;,&quot;src/unix/bsd/freebsdlike/freebsd=
/freebsd12/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank=
">x86_64.rs</a>&quot;:&quot;2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b=
3daae55a481bfd052&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd13/<a=
 href=3D"http://b64.rs" rel=3D"noreferrer" target=3D"_blank">b64.rs</a>&quo=
t;:&quot;61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6&q=
uot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd13/<a href=3D"http://mod=
.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;88be47524b=
28b6635ccb1e85ea511bf17337be0af7e9baa740c341ac9e83a6f7&quot;,&quot;src/unix=
/bsd/freebsdlike/freebsd/freebsd13/<a href=3D"http://x86_64.rs" rel=3D"nore=
ferrer" target=3D"_blank">x86_64.rs</a>&quot;:&quot;2df36a7f122f6d6e5753cfb=
4d22e915cc80f6bc91c0161b3daae55a481bfd052&quot;,&quot;src/unix/bsd/freebsdl=
ike/freebsd/freebsd14/<a href=3D"http://b64.rs" rel=3D"noreferrer" target=
=3D"_blank">b64.rs</a>&quot;:&quot;61cbe45f8499bedb168106b686d4f8239472f25c=
7553b069eec2afe197ff2df6&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freeb=
sd14/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs<=
/a>&quot;:&quot;6ddc6abf6d5ccaea0d8cccf521e8ca6457efcad3086af4155628d5d06d6=
72346&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/freebsd14/<a href=3D"htt=
p://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.rs</a>&quot;:&qu=
ot;e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650&quot;,&=
quot;src/unix/bsd/freebsdlike/freebsd/freebsd15/<a href=3D"http://b64.rs" r=
el=3D"noreferrer" target=3D"_blank">b64.rs</a>&quot;:&quot;61cbe45f8499bedb=
168106b686d4f8239472f25c7553b069eec2afe197ff2df6&quot;,&quot;src/unix/bsd/f=
reebsdlike/freebsd/freebsd15/<a href=3D"http://mod.rs" rel=3D"noreferrer" t=
arget=3D"_blank">mod.rs</a>&quot;:&quot;93115c1a9faa43ebf58b7dee3582aed5a54=
291b284764e370e7f649b2e6a9565&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/=
freebsd15/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank"=
>x86_64.rs</a>&quot;:&quot;e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae81=
0bbca117e4fcb650&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a href=3D"ht=
tp://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;08=
e39a42392936857fd0c1c6b01788f5630fe8ff7f78b062490509c5dd816a42&quot;,&quot;=
src/unix/bsd/freebsdlike/freebsd/<a href=3D"http://powerpc.rs" rel=3D"noref=
errer" target=3D"_blank">powerpc.rs</a>&quot;:&quot;9ca3f82f88974e6db5569f2=
d76a5a3749b248a31747a6c0da5820492bdfeca42&quot;,&quot;src/unix/bsd/freebsdl=
ike/freebsd/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" target=3D"_b=
lank">powerpc64.rs</a>&quot;:&quot;2dae3ecc87eac3b11657aa98915def55fc4b5c0d=
e11fe26aae23329a54628a9a&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a hr=
ef=3D"http://riscv64.rs" rel=3D"noreferrer" target=3D"_blank">riscv64.rs</a=
>&quot;:&quot;fa4bed4c58cad24ba3395941c7fa6b11e089551a04714f9561078e400f5b2=
b62&quot;,&quot;src/unix/bsd/freebsdlike/freebsd/<a href=3D"http://x86.rs" =
rel=3D"noreferrer" target=3D"_blank">x86.rs</a>&quot;:&quot;2837fed0ffee0ec=
443ecdb743b7142bcb4d6ba2de87e05459fb4498789d47200&quot;,&quot;src/unix/bsd/=
freebsdlike/freebsd/x86_64/<a href=3D"http://align.rs" rel=3D"noreferrer" t=
arget=3D"_blank">align.rs</a>&quot;:&quot;0e1f69a88fca1c32874b1daf5db3d446f=
efbe518dca497f096cc9168c39dde70&quot;,&quot;src/unix/bsd/freebsdlike/freebs=
d/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod=
.rs</a>&quot;:&quot;e4d76219bec0621db07dec37de9be1a9b7fb38daa10ffc1a6adbdbc=
34e163435&quot;,&quot;src/unix/bsd/freebsdlike/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;c846f30eaffc7c1a2=
1b4acd3df75cd17bb3d4f11401c9a9770924e4e6d847995&quot;,&quot;src/unix/bsd/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;37765749481f7d0dec8681d8c9d0735e6021094b4ef4a2d9aab5643d7a4232e1&q=
uot;,&quot;src/unix/bsd/netbsdlike/<a href=3D"http://mod.rs" rel=3D"norefer=
rer" target=3D"_blank">mod.rs</a>&quot;:&quot;ea60540aa4edd4e43136749d5df49=
7b1dc072b9912b6030dd1ab794a6d1c3c3c&quot;,&quot;src/unix/bsd/netbsdlike/net=
bsd/<a href=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_blank">aarc=
h64.rs</a>&quot;:&quot;057ee877db7193ba0dc10801b9a6563ac6dbdb78376d6851a84c=
b12b30841759&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a href=3D"http://a=
rm.rs" rel=3D"noreferrer" target=3D"_blank">arm.rs</a>&quot;:&quot;949b55e4=
dee1c8c511f4f061a6a57ac876a6c0eabfaf5cc20e9ab40d8f41b2e0&quot;,&quot;src/un=
ix/bsd/netbsdlike/netbsd/<a href=3D"http://mips.rs" rel=3D"noreferrer" targ=
et=3D"_blank">mips.rs</a>&quot;:&quot;88be18ac43ba224c77e78e4179b6761debc5e=
6c30a258fac56263809c7af4fbc&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a h=
ref=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;=
:&quot;ab09cea2897ecd27fc7e35822dac23d6dcd53f8577c771db3ee8b015e8d82001&quo=
t;,&quot;src/unix/bsd/netbsdlike/netbsd/<a href=3D"http://powerpc.rs" rel=
=3D"noreferrer" target=3D"_blank">powerpc.rs</a>&quot;:&quot;ee7ff5d89d0ed2=
2f531237b5059aa669df93a3b5c489fa641465ace8d405bf41&quot;,&quot;src/unix/bsd=
/netbsdlike/netbsd/<a href=3D"http://riscv64.rs" rel=3D"noreferrer" target=
=3D"_blank">riscv64.rs</a>&quot;:&quot;1cbe2e5ed681cb1054b699da37daaf6c7142=
67df7d332c90fc2a589b11579625&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a =
href=3D"http://sparc64.rs" rel=3D"noreferrer" target=3D"_blank">sparc64.rs<=
/a>&quot;:&quot;9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b90=
2d7d9&quot;,&quot;src/unix/bsd/netbsdlike/netbsd/<a href=3D"http://x86.rs" =
rel=3D"noreferrer" target=3D"_blank">x86.rs</a>&quot;:&quot;20692320e36bfe0=
28d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7&quot;,&quot;src/unix/bsd/=
netbsdlike/netbsd/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D=
"_blank">x86_64.rs</a>&quot;:&quot;532b76199d6c71ff996eade9f906c55a72c9aff4=
89595d25a21e21878cfd740b&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a hre=
f=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>=
&quot;:&quot;dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36=
af&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a href=3D"http://arm.rs" re=
l=3D"noreferrer" target=3D"_blank">arm.rs</a>&quot;:&quot;01580d261bc6447bb=
327a0d982181b7bdabfa066cee65a30373d3ced729ad307&quot;,&quot;src/unix/bsd/ne=
tbsdlike/openbsd/<a href=3D"http://mips64.rs" rel=3D"noreferrer" target=3D"=
_blank">mips64.rs</a>&quot;:&quot;8532a189ae10c7d668d9d4065da8b05d124e09bd3=
9442c9f74a7f231c43eca48&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a href=
=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&q=
uot;7b93b5b24b3c72a79b2de19b47ac2f56b29d87e9fc8f4c721a63d1e87ec83fcc&quot;,=
&quot;src/unix/bsd/netbsdlike/openbsd/<a href=3D"http://powerpc.rs" rel=3D"=
noreferrer" target=3D"_blank">powerpc.rs</a>&quot;:&quot;01580d261bc6447bb3=
27a0d982181b7bdabfa066cee65a30373d3ced729ad307&quot;,&quot;src/unix/bsd/net=
bsdlike/openbsd/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" target=
=3D"_blank">powerpc64.rs</a>&quot;:&quot;1dd5449dd1fd3d51e30ffdeeaece91d0aa=
f05c710e0ac699fecc5461cfa2c28e&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/=
<a href=3D"http://riscv64.rs" rel=3D"noreferrer" target=3D"_blank">riscv64.=
rs</a>&quot;:&quot;1fe3332dc705a13e6242219970f5449d6d7a73e2e6c8537ab8e421d8=
a6f2e3ff&quot;,&quot;src/unix/bsd/netbsdlike/openbsd/<a href=3D"http://spar=
c64.rs" rel=3D"noreferrer" target=3D"_blank">sparc64.rs</a>&quot;:&quot;d04=
fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085&quot;,&quot;s=
rc/unix/bsd/netbsdlike/openbsd/<a href=3D"http://x86.rs" rel=3D"noreferrer"=
 target=3D"_blank">x86.rs</a>&quot;:&quot;6f7f5c4fde2a2259eb547890cbd86570c=
ea04ef85347d7569e94e679448bec87&quot;,&quot;src/unix/bsd/netbsdlike/openbsd=
/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.r=
s</a>&quot;:&quot;d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7=
675a4e1&quot;,&quot;src/unix/haiku/<a href=3D"http://b32.rs" rel=3D"norefer=
rer" target=3D"_blank">b32.rs</a>&quot;:&quot;a2efdbf7158a6da341e1db9176b0a=
b193ba88b449616239ed95dced11f54d87b&quot;,&quot;src/unix/haiku/<a href=3D"h=
ttp://b64.rs" rel=3D"noreferrer" target=3D"_blank">b64.rs</a>&quot;:&quot;f=
f8115367d3d7d354f792d6176dfaaa26353f57056197b563bf4681f91ff7985&quot;,&quot=
;src/unix/haiku/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bla=
nk">mod.rs</a>&quot;:&quot;b75976d84bdf4a3a226336bb06ec231d552240f302bb5da4=
8ead692fd72758f9&quot;,&quot;src/unix/haiku/<a href=3D"http://native.rs" re=
l=3D"noreferrer" target=3D"_blank">native.rs</a>&quot;:&quot;2b1f88c043777a=
915bb7218aa05a3647a0e0481ebff55a99e351c45dea2be8de&quot;,&quot;src/unix/hai=
ku/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86_64=
.rs</a>&quot;:&quot;3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789=
f043b7237&quot;,&quot;src/unix/hurd/<a href=3D"http://align.rs" rel=3D"nore=
ferrer" target=3D"_blank">align.rs</a>&quot;:&quot;03c79b2cd8270ebd0cf93cb4=
75a8f1ff85b28175ea0de007ede17cad94a89b03&quot;,&quot;src/unix/hurd/<a href=
=3D"http://b32.rs" rel=3D"noreferrer" target=3D"_blank">b32.rs</a>&quot;:&q=
uot;2ba90ed973f90366c36a6387833a3df42abfee9622d4a0352635937d4a89eaf4&quot;,=
&quot;src/unix/hurd/<a href=3D"http://b64.rs" rel=3D"noreferrer" target=3D"=
_blank">b64.rs</a>&quot;:&quot;d919b4aec9b3080ad24c125c57b2c8b2e483d72045f1=
554c429d14560355846f&quot;,&quot;src/unix/hurd/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;23ebadfdb9a92d7fb=
9e32b6a7c95669ce979ba7407b924869f40a59d2807d052&quot;,&quot;src/unix/hurd/<=
a href=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank">no_align=
.rs</a>&quot;:&quot;03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17ca=
d94a89b03&quot;,&quot;src/unix/linux_like/android/b32/<a href=3D"http://arm=
.rs" rel=3D"noreferrer" target=3D"_blank">arm.rs</a>&quot;:&quot;ce582de7e9=
83a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3ec2564&quot;,&quot;src/unix=
/linux_like/android/b32/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=
=3D"_blank">mod.rs</a>&quot;:&quot;7c173e0375119bf06a3081652faede95e5bcd685=
8e7576b7533d037978737c8f&quot;,&quot;src/unix/linux_like/android/b32/x86/<a=
 href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>=
&quot;:&quot;812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0d=
ab&quot;,&quot;src/unix/linux_like/android/b32/x86/<a href=3D"http://mod.rs=
" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;e6d107efbcd37=
b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac&quot;,&quot;src/unix/li=
nux_like/android/b64/aarch64/<a href=3D"http://align.rs" rel=3D"noreferrer"=
 target=3D"_blank">align.rs</a>&quot;:&quot;2179c3b1608fa4bf68840482bfc2b2f=
a3ee2faf6fcae3770f9e505cddca35c7b&quot;,&quot;src/unix/linux_like/android/b=
64/aarch64/<a href=3D"http://int128.rs" rel=3D"noreferrer" target=3D"_blank=
">int128.rs</a>&quot;:&quot;1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82=
f23f3288a4a7276de&quot;,&quot;src/unix/linux_like/android/b64/aarch64/<a hr=
ef=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:=
&quot;873af67c4a9757ead56bc797d04efcecd311ecbf0084ebdd198fb690463ef299&quot=
;,&quot;src/unix/linux_like/android/b64/<a href=3D"http://mod.rs" rel=3D"no=
referrer" target=3D"_blank">mod.rs</a>&quot;:&quot;7b8efbd61ab965c93bacfab7=
8108ff8eed38af07b119099020dc41a9d0901559&quot;,&quot;src/unix/linux_like/an=
droid/b64/riscv64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"=
_blank">align.rs</a>&quot;:&quot;0bf138f84e5327d8339bcd4adf071a6832b516445e=
597552c82bbd881095e3a8&quot;,&quot;src/unix/linux_like/android/b64/riscv64/=
<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&q=
uot;:&quot;19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d=
&quot;,&quot;src/unix/linux_like/android/b64/x86_64/<a href=3D"http://align=
.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;7169d07a=
9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6&quot;,&quot;src/un=
ix/linux_like/android/b64/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferre=
r" target=3D"_blank">mod.rs</a>&quot;:&quot;4ec2de11a9b65c4325b7b991f0b99a4=
14975e0e61ba8668caca5d921e9b314d1&quot;,&quot;src/unix/linux_like/android/<=
a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&qu=
ot;:&quot;384275dc1d3559a9f83559b6c903758a9dc4c4b3d13db48d23ed4fdc3c0ff8da&=
quot;,&quot;src/unix/linux_like/emscripten/<a href=3D"http://align.rs" rel=
=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;86c95cbed7a7161b=
1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216&quot;,&quot;src/unix/linux=
_like/emscripten/<a href=3D"http://lfs64.rs" rel=3D"noreferrer" target=3D"_=
blank">lfs64.rs</a>&quot;:&quot;3776af30a758d765a88920ec4fde442ab89040da13d=
3b3625c7fbcb8a958559f&quot;,&quot;src/unix/linux_like/emscripten/<a href=3D=
"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot=
;70d4591730a731ee32788a9d8d2de379592844ec36b7d1723514179605587713&quot;,&qu=
ot;src/unix/linux_like/emscripten/<a href=3D"http://no_align.rs" rel=3D"nor=
eferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;0128e4aa721a99027548=
28b61b5ec7d8a86619983ed1e0544a85d35b1051fad6&quot;,&quot;src/unix/linux_lik=
e/linux/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">al=
ign.rs</a>&quot;:&quot;bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff049228f6=
a1acad80ef8b&quot;,&quot;src/unix/linux_like/linux/arch/generic/<a href=3D"=
http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;=
10577c664dbdd5d1410e53e3872435ad595758bd1deb410b1bce7825cd150178&quot;,&quo=
t;src/unix/linux_like/linux/arch/mips/<a href=3D"http://mod.rs" rel=3D"nore=
ferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;ca3db0e3ae852abf18f3588e40=
d5d64707fcc1829e08ddc5da1080e1a92c8851&quot;,&quot;src/unix/linux_like/linu=
x/arch/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.r=
s</a>&quot;:&quot;5bd5361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa=
1fdf198&quot;,&quot;src/unix/linux_like/linux/arch/powerpc/<a href=3D"http:=
//mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;0bc2d=
2667a00eca81f4abeb6d613a90848a947f51224103f83268928b8197629&quot;,&quot;src=
/unix/linux_like/linux/arch/sparc/<a href=3D"http://mod.rs" rel=3D"noreferr=
er" target=3D"_blank">mod.rs</a>&quot;:&quot;5e6777863e74a9e2aa9dc487f10597=
83dd211babc2b32d6bf676f311e49c55d6&quot;,&quot;src/unix/linux_like/linux/gn=
u/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs=
</a>&quot;:&quot;e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7=
b9f936&quot;,&quot;src/unix/linux_like/linux/gnu/b32/arm/<a href=3D"http://=
align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;6ec=
0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb&quot;,&quot;s=
rc/unix/linux_like/linux/gnu/b32/arm/<a href=3D"http://mod.rs" rel=3D"noref=
errer" target=3D"_blank">mod.rs</a>&quot;:&quot;f68ec59b6407f9d4e326f3e71a4=
1ec21f19ecfc703edf9a93e496f661fed5506&quot;,&quot;src/unix/linux_like/linux=
/gnu/b32/csky/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_bla=
nk">align.rs</a>&quot;:&quot;3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e29=
0259c5cdbae25f039d&quot;,&quot;src/unix/linux_like/linux/gnu/b32/csky/<a hr=
ef=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:=
&quot;8729b68e433e94c2128e51a7db4fd555938e4be4dc64584c352b24a20d9c8e91&quot=
;,&quot;src/unix/linux_like/linux/gnu/b32/m68k/<a href=3D"http://align.rs" =
rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;8faa92f77a923=
2c035418d45331774e64a9a841d99c91791570a203bf2b45bcb&quot;,&quot;src/unix/li=
nux_like/linux/gnu/b32/m68k/<a href=3D"http://mod.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">mod.rs</a>&quot;:&quot;80956d3fef163ecf248828a6f38782dd8ae8=
56d86b1bb5aac2de36032dbd8ea0&quot;,&quot;src/unix/linux_like/linux/gnu/b32/=
mips/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align=
.rs</a>&quot;:&quot;429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd5874=
72ae954ee&quot;,&quot;src/unix/linux_like/linux/gnu/b32/mips/<a href=3D"htt=
p://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;96e=
22350d5d132d917c743d6560464500652c67b52c3d0e8474494487df3365d&quot;,&quot;s=
rc/unix/linux_like/linux/gnu/b32/<a href=3D"http://mod.rs" rel=3D"noreferre=
r" target=3D"_blank">mod.rs</a>&quot;:&quot;b56625dd20dd48a8699034d349ef089=
c540c0ddcbf8a3481d598d101f8b40b78&quot;,&quot;src/unix/linux_like/linux/gnu=
/b32/<a href=3D"http://powerpc.rs" rel=3D"noreferrer" target=3D"_blank">pow=
erpc.rs</a>&quot;:&quot;20fc3cc4fe1ef6617b63b61b897f782ceb9c2842fc718f504a1=
840537229bf47&quot;,&quot;src/unix/linux_like/linux/gnu/b32/riscv32/<a href=
=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot=
;:&quot;d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119&qu=
ot;,&quot;src/unix/linux_like/linux/gnu/b32/riscv32/<a href=3D"http://mod.r=
s" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;887288a0a1cf=
ff319d0e15edcdc4fcb31fd643ff41715ec5244c8f2413624169&quot;,&quot;src/unix/l=
inux_like/linux/gnu/b32/sparc/<a href=3D"http://align.rs" rel=3D"noreferrer=
" target=3D"_blank">align.rs</a>&quot;:&quot;21adbed27df73e2d1ed934aaf733a6=
43003d7baf2bde9c48ea440895bcca6d41&quot;,&quot;src/unix/linux_like/linux/gn=
u/b32/sparc/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">=
mod.rs</a>&quot;:&quot;cc4342b949e4d796f304acd9dfe3f721a1c2f37fec16b42d3bb2=
7dc94723af37&quot;,&quot;src/unix/linux_like/linux/gnu/b32/x86/<a href=3D"h=
ttp://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&qu=
ot;e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413&quot;,&=
quot;src/unix/linux_like/linux/gnu/b32/x86/<a href=3D"http://mod.rs" rel=3D=
"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;06d4db4ee8352f62a0a5e=
ad0c4d6ea0a78feff522f19b9bc5772f6dd920ffd80&quot;,&quot;src/unix/linux_like=
/linux/gnu/b64/aarch64/<a href=3D"http://align.rs" rel=3D"noreferrer" targe=
t=3D"_blank">align.rs</a>&quot;:&quot;fdf1c72375a2167699157e0dd825422690bb6=
719f7bc69515a2e5846d0431d7c&quot;,&quot;src/unix/linux_like/linux/gnu/b64/a=
arch64/<a href=3D"http://fallback.rs" rel=3D"noreferrer" target=3D"_blank">=
fallback.rs</a>&quot;:&quot;832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab8=
3c56915cbc59d8be3&quot;,&quot;src/unix/linux_like/linux/gnu/b64/aarch64/<a =
href=3D"http://ilp32.rs" rel=3D"noreferrer" target=3D"_blank">ilp32.rs</a>&=
quot;:&quot;bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e2=
9&quot;,&quot;src/unix/linux_like/linux/gnu/b64/aarch64/<a href=3D"http://i=
nt128.rs" rel=3D"noreferrer" target=3D"_blank">int128.rs</a>&quot;:&quot;17=
35f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de&quot;,&quot;=
src/unix/linux_like/linux/gnu/b64/aarch64/<a href=3D"http://lp64.rs" rel=3D=
"noreferrer" target=3D"_blank">lp64.rs</a>&quot;:&quot;11a950697fdda0258c6e=
37c6b13993348c8de4134105ed4faa79358e53175072&quot;,&quot;src/unix/linux_lik=
e/linux/gnu/b64/aarch64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=
=3D"_blank">mod.rs</a>&quot;:&quot;8202614484da36c388d2ffdd2554c56bb4f9db8e=
5bd621f8c36114cdcfeec644&quot;,&quot;src/unix/linux_like/linux/gnu/b64/loon=
garch64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">al=
ign.rs</a>&quot;:&quot;060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60&quot;,&quot;src/unix/linux_like/linux/gnu/b64/loongarch64/<a h=
ref=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;=
:&quot;10f025edecebc6e0ed8fdae4736ebe7564189741d5b910433f07c21fc12a94d8&quo=
t;,&quot;src/unix/linux_like/linux/gnu/b64/mips64/<a href=3D"http://align.r=
s" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;7169d07a9f=
d4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6&quot;,&quot;src/unix=
/linux_like/linux/gnu/b64/mips64/<a href=3D"http://mod.rs" rel=3D"noreferre=
r" target=3D"_blank">mod.rs</a>&quot;:&quot;73532be4b5775acf9524c77feeefe1f=
6d1936ceffef908d01dd2586986520f2d&quot;,&quot;src/unix/linux_like/linux/gnu=
/b64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs<=
/a>&quot;:&quot;6a160ef25439c4fecdb0e3bd0b818742263c791364da874d4febd3aa644=
ec8e2&quot;,&quot;src/unix/linux_like/linux/gnu/b64/powerpc64/<a href=3D"ht=
tp://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quo=
t;e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9&quot;,&q=
uot;src/unix/linux_like/linux/gnu/b64/powerpc64/<a href=3D"http://mod.rs" r=
el=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;a90c2641616c620e=
9d1fea87695ce046e14f9da2282bb93f761eeb4077c74741&quot;,&quot;src/unix/linux=
_like/linux/gnu/b64/riscv64/<a href=3D"http://align.rs" rel=3D"noreferrer" =
target=3D"_blank">align.rs</a>&quot;:&quot;fe7e3c928d0367c37eb652686591801c=
3694a3558ebbbeb5c22be692265d07f2&quot;,&quot;src/unix/linux_like/linux/gnu/=
b64/riscv64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">=
mod.rs</a>&quot;:&quot;dec86883731f7b8419bff35b125b40eefc927090c1510f6daf93=
1726f7965c0b&quot;,&quot;src/unix/linux_like/linux/gnu/b64/<a href=3D"http:=
//s390x.rs" rel=3D"noreferrer" target=3D"_blank">s390x.rs</a>&quot;:&quot;1=
ea9e39432ce6bf68779d33546dacd7d39477a9f8fc3da4f4f339e4538cb74c3&quot;,&quot=
;src/unix/linux_like/linux/gnu/b64/sparc64/<a href=3D"http://align.rs" rel=
=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;e29c4868bbecfa4a=
6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9&quot;,&quot;src/unix/linux=
_like/linux/gnu/b64/sparc64/<a href=3D"http://mod.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">mod.rs</a>&quot;:&quot;bed381c44cec2a5b50125f7e548ab487d4c8=
29006c971d152a611b7141760052&quot;,&quot;src/unix/linux_like/linux/gnu/b64/=
x86_64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">ali=
gn.rs</a>&quot;:&quot;62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b057=
8bcc4b49769&quot;,&quot;src/unix/linux_like/linux/gnu/b64/x86_64/<a href=3D=
"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot=
;332846e4a5920d7e6b05df0448a2333c5dd00fb27cb33654648f507ee89dbec5&quot;,&qu=
ot;src/unix/linux_like/linux/gnu/b64/x86_64/<a href=3D"http://not_x32.rs" r=
el=3D"noreferrer" target=3D"_blank">not_x32.rs</a>&quot;:&quot;38f74ce15d96=
62ce4818815a2b87be1618d5e45f190f7e4db84ff3285b4421fb&quot;,&quot;src/unix/l=
inux_like/linux/gnu/b64/x86_64/<a href=3D"http://x32.rs" rel=3D"noreferrer"=
 target=3D"_blank">x32.rs</a>&quot;:&quot;b20218a11364a6dec87f96d6c0d8b19e6=
60697ab09ad5ee0e9b3a9dafedaaebb&quot;,&quot;src/unix/linux_like/linux/gnu/<=
a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&qu=
ot;:&quot;8d11f66db9993e9a89c86fec3b732d9c0ec4ee42d9570d4e3389c075021dd29f&=
quot;,&quot;src/unix/linux_like/linux/gnu/<a href=3D"http://no_align.rs" re=
l=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;9cd223135de7=
5315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25&quot;,&quot;src/unix/l=
inux_like/linux/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bla=
nk">mod.rs</a>&quot;:&quot;da8c17828415fc1db81fb547fe20b7421774a3bdd3e79053=
cc127a3031e59302&quot;,&quot;src/unix/linux_like/linux/musl/b32/arm/<a href=
=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot=
;:&quot;3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c&qu=
ot;,&quot;src/unix/linux_like/linux/musl/b32/arm/<a href=3D"http://mod.rs" =
rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;af10147d7c36617=
51750a58ffad089d5d18d180cd18303c653aef126c07ccd91&quot;,&quot;src/unix/linu=
x_like/linux/musl/b32/<a href=3D"http://hexagon.rs" rel=3D"noreferrer" targ=
et=3D"_blank">hexagon.rs</a>&quot;:&quot;d079cab42529f7dab699334d43168c74ff=
4aa0282f11040a8b7d274b65767a7a&quot;,&quot;src/unix/linux_like/linux/musl/b=
32/mips/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">al=
ign.rs</a>&quot;:&quot;429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd5=
87472ae954ee&quot;,&quot;src/unix/linux_like/linux/musl/b32/mips/<a href=3D=
"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot=
;e44043766f7cd26de7ffa4232654afb6feb03e58dbd5890717970887bd003151&quot;,&qu=
ot;src/unix/linux_like/linux/musl/b32/<a href=3D"http://mod.rs" rel=3D"nore=
ferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;31677597fd9544c4b1ec147762=
8288f6273fabbc06e38f33da862ad55f019ce1&quot;,&quot;src/unix/linux_like/linu=
x/musl/b32/<a href=3D"http://powerpc.rs" rel=3D"noreferrer" target=3D"_blan=
k">powerpc.rs</a>&quot;:&quot;3dae56a4e7789bcc5314e419fea5e4b2495367b4f1a49=
d1c9477c60225d65eef&quot;,&quot;src/unix/linux_like/linux/musl/b32/riscv32/=
<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</=
a>&quot;:&quot;efd2accf33b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a=
5d48&quot;,&quot;src/unix/linux_like/linux/musl/b32/riscv32/<a href=3D"http=
://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;3ee8=
45d272f91a1908d5f421d7c353e1f14681bbdfef64410e408f4c14365a91&quot;,&quot;sr=
c/unix/linux_like/linux/musl/b32/x86/<a href=3D"http://align.rs" rel=3D"nor=
eferrer" target=3D"_blank">align.rs</a>&quot;:&quot;08e77fbd7435d7dec2ff569=
32433bece3f02e47ce810f89004a275a86d39cbe1&quot;,&quot;src/unix/linux_like/l=
inux/musl/b32/x86/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_b=
lank">mod.rs</a>&quot;:&quot;f2b53ae0034c833244b7cdb8c670349bf8272a03abf041=
52eba65cf62810484d&quot;,&quot;src/unix/linux_like/linux/musl/b64/aarch64/<=
a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a=
>&quot;:&quot;6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821=
133&quot;,&quot;src/unix/linux_like/linux/musl/b64/aarch64/<a href=3D"http:=
//int128.rs" rel=3D"noreferrer" target=3D"_blank">int128.rs</a>&quot;:&quot=
;1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de&quot;,&qu=
ot;src/unix/linux_like/linux/musl/b64/aarch64/<a href=3D"http://mod.rs" rel=
=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;45ce6897afcc960267=
bb7505702b639daf94dc69428a213bf1aefd367ca32adc&quot;,&quot;src/unix/linux_l=
ike/linux/musl/b64/loongarch64/<a href=3D"http://align.rs" rel=3D"noreferre=
r" target=3D"_blank">align.rs</a>&quot;:&quot;060aa33cc737966c691aab8511c5c=
5729e551458ce18d0e284e0d45f39beeb60&quot;,&quot;src/unix/linux_like/linux/m=
usl/b64/loongarch64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"=
_blank">mod.rs</a>&quot;:&quot;3d9ef92e682a1789544a2bd20cad5a5623db9d7d9f5d=
0a3692bb0230af034165&quot;,&quot;src/unix/linux_like/linux/musl/b64/<a href=
=3D"http://mips64.rs" rel=3D"noreferrer" target=3D"_blank">mips64.rs</a>&qu=
ot;:&quot;a968ef9c54fa22293085f318c8472c1754482df92cc500568dc33bd807d71ea6&=
quot;,&quot;src/unix/linux_like/linux/musl/b64/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;20ceaf90a03c24a2e=
b154a5dffbfc9a538348404db5b554a3d8126021ba45509&quot;,&quot;src/unix/linux_=
like/linux/musl/b64/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" targ=
et=3D"_blank">powerpc64.rs</a>&quot;:&quot;140e579800a67315f4cb8a42b22aa815=
7eae34ffe626e77e421b43c53c23b34d&quot;,&quot;src/unix/linux_like/linux/musl=
/b64/riscv64/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blan=
k">align.rs</a>&quot;:&quot;fe7e3c928d0367c37eb652686591801c3694a3558ebbbeb=
5c22be692265d07f2&quot;,&quot;src/unix/linux_like/linux/musl/b64/riscv64/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;c5944526d7e19cd43e9d14d119a1d98f8780db7ecbcc79e69d7b9348e596b520&q=
uot;,&quot;src/unix/linux_like/linux/musl/b64/<a href=3D"http://s390x.rs" r=
el=3D"noreferrer" target=3D"_blank">s390x.rs</a>&quot;:&quot;8557b3477ca8ce=
fef7fce764a3c25441929a54e50ead4091f6f7823c427cd728&quot;,&quot;src/unix/lin=
ux_like/linux/musl/b64/x86_64/<a href=3D"http://align.rs" rel=3D"noreferrer=
" target=3D"_blank">align.rs</a>&quot;:&quot;77309276ad7a42cbe59ca381f23590=
b7a143aded05555b34a5b307b808cbca6e&quot;,&quot;src/unix/linux_like/linux/mu=
sl/b64/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank=
">mod.rs</a>&quot;:&quot;a91c4f18027c9958037f78ae48f6352d23cb4e6f2995b2cc8d=
e7dce0e5759470&quot;,&quot;src/unix/linux_like/linux/musl/<a href=3D"http:/=
/lfs64.rs" rel=3D"noreferrer" target=3D"_blank">lfs64.rs</a>&quot;:&quot;3e=
4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f&quot;,&quot;=
src/unix/linux_like/linux/musl/<a href=3D"http://mod.rs" rel=3D"noreferrer"=
 target=3D"_blank">mod.rs</a>&quot;:&quot;94dd7eb5064230637ccd135383c7d30f8=
d3f7874c22771b24b529e58de421731&quot;,&quot;src/unix/linux_like/linux/<a hr=
ef=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank">no_align.rs<=
/a>&quot;:&quot;62cdca0e011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa635=
7d784&quot;,&quot;src/unix/linux_like/linux/<a href=3D"http://non_exhaustiv=
e.rs" rel=3D"noreferrer" target=3D"_blank">non_exhaustive.rs</a>&quot;:&quo=
t;181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9&quot;,&q=
uot;src/unix/linux_like/linux/uclibc/<a href=3D"http://align.rs" rel=3D"nor=
eferrer" target=3D"_blank">align.rs</a>&quot;:&quot;9ed16138d8e439bd9093084=
5a65eafa7ebd67366e6bf633936d44014f6e4c959&quot;,&quot;src/unix/linux_like/l=
inux/uclibc/arm/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_b=
lank">align.rs</a>&quot;:&quot;e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936&quot;,&quot;src/unix/linux_like/linux/uclibc/arm/<a hr=
ef=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:=
&quot;50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e&quot=
;,&quot;src/unix/linux_like/linux/uclibc/arm/<a href=3D"http://no_align.rs"=
 rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;9cd223135=
de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25&quot;,&quot;src/uni=
x/linux_like/linux/uclibc/mips/mips32/<a href=3D"http://align.rs" rel=3D"no=
referrer" target=3D"_blank">align.rs</a>&quot;:&quot;e4a3c27fe20a57b8d612c3=
4cb05bc70646edb5cec7251957315afa53a7b9f936&quot;,&quot;src/unix/linux_like/=
linux/uclibc/mips/mips32/<a href=3D"http://mod.rs" rel=3D"noreferrer" targe=
t=3D"_blank">mod.rs</a>&quot;:&quot;d0c4434e2bf813372c418a8f516c706cdccc9f7=
be2f0921b2207b0afdb66fe81&quot;,&quot;src/unix/linux_like/linux/uclibc/mips=
/mips32/<a href=3D"http://no_align.rs" rel=3D"noreferrer" target=3D"_blank"=
>no_align.rs</a>&quot;:&quot;9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85=
a76f8316c86653db25&quot;,&quot;src/unix/linux_like/linux/uclibc/mips/mips64=
/<a href=3D"http://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs<=
/a>&quot;:&quot;a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd=
08b2d&quot;,&quot;src/unix/linux_like/linux/uclibc/mips/mips64/<a href=3D"h=
ttp://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;3=
f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0&quot;,&quot=
;src/unix/linux_like/linux/uclibc/mips/mips64/<a href=3D"http://no_align.rs=
" rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30&quot;,&quot;src/un=
ix/linux_like/linux/uclibc/mips/<a href=3D"http://mod.rs" rel=3D"noreferrer=
" target=3D"_blank">mod.rs</a>&quot;:&quot;a048fce1c2d9b1ad57305642e8ad05ca=
0f0c7e4753267a2e2d6b4fee5db3b072&quot;,&quot;src/unix/linux_like/linux/ucli=
bc/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a=
>&quot;:&quot;6efae7ed906bc5773dcce43ba1045cf93df5f8dac41f194d8cddc0579f14c=
015&quot;,&quot;src/unix/linux_like/linux/uclibc/<a href=3D"http://no_align=
.rs" rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;3f286=
37046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709&quot;,&quot;src=
/unix/linux_like/linux/uclibc/x86_64/<a href=3D"http://l4re.rs" rel=3D"nore=
ferrer" target=3D"_blank">l4re.rs</a>&quot;:&quot;8485b9182b7c67f7344fab377=
e7cc2a72afefd9ab63837c860514abba9728d76&quot;,&quot;src/unix/linux_like/lin=
ux/uclibc/x86_64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bl=
ank">mod.rs</a>&quot;:&quot;e7197f0f68ece174c8ae42b2b9115893abfcdbe44a1a6ed=
98fb3cbd7bfe087e8&quot;,&quot;src/unix/linux_like/linux/uclibc/x86_64/<a hr=
ef=3D"http://other.rs" rel=3D"noreferrer" target=3D"_blank">other.rs</a>&qu=
ot;:&quot;42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8&=
quot;,&quot;src/unix/linux_like/<a href=3D"http://mod.rs" rel=3D"noreferrer=
" target=3D"_blank">mod.rs</a>&quot;:&quot;863f628cbaa864911ffebc58e9fb788b=
6c6a9651955fc401ac1f40f20eb62505&quot;,&quot;src/unix/<a href=3D"http://mod=
.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;5f851ce175=
6443b9219edd11b6cc2abfb4031a22a6496bb5d4d6090f97779f8a&quot;,&quot;src/unix=
/newlib/aarch64/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_bla=
nk">mod.rs</a>&quot;:&quot;964c096288da836b53c0c71d7f3a97048d177da220a69314=
c5ce93ba330d72af&quot;,&quot;src/unix/newlib/<a href=3D"http://align.rs" re=
l=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;28aaf87fafbc6b3=
12622719d472d8cf65f9e5467d15339df5f73e66d8502b28a&quot;,&quot;src/unix/newl=
ib/arm/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.r=
s</a>&quot;:&quot;cf754f8b1197489fca01e881a4b4b146e814998e4b365f116fa1a102c=
00e6a4e&quot;,&quot;src/unix/newlib/espidf/<a href=3D"http://mod.rs" rel=3D=
"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;689e29a9fff5a263e5ab8=
410d0a8919f77fa64aa12f4d71f71085a6f07f19f67&quot;,&quot;src/unix/newlib/<a =
href=3D"http://generic.rs" rel=3D"noreferrer" target=3D"_blank">generic.rs<=
/a>&quot;:&quot;5f0b5d07ddb5a5d60580f9561fdb05e9218d9751d4068c4aadad2ba6b95=
0aabf&quot;,&quot;src/unix/newlib/horizon/<a href=3D"http://mod.rs" rel=3D"=
noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;3a521d22bf932fc01c1d26=
d1f9bff20f11b1855b03c8236a8eb18310f6cab5a8&quot;,&quot;src/unix/newlib/<a h=
ref=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;=
:&quot;e5d5faf27a6336b9f1c02b8726427801d906a14dae766852b4e85c1a92df06c8&quo=
t;,&quot;src/unix/newlib/<a href=3D"http://no_align.rs" rel=3D"noreferrer" =
target=3D"_blank">no_align.rs</a>&quot;:&quot;e0743b2179495a9514bc3a4d1781e=
492878c4ec834ee0085d0891dd1712e82fb&quot;,&quot;src/unix/newlib/powerpc/<a =
href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot=
;:&quot;cc9e188711b9bf614323ad6c48e0d2e1a1ecc5d3bc64961ba451f29c6c22d2d8&qu=
ot;,&quot;src/unix/newlib/vita/<a href=3D"http://mod.rs" rel=3D"noreferrer"=
 target=3D"_blank">mod.rs</a>&quot;:&quot;ff1caf74bb0696fe15d60dbac598db452=
0cd538aa0f5989713d97d008eee6ad8&quot;,&quot;src/unix/<a href=3D"http://no_a=
lign.rs" rel=3D"noreferrer" target=3D"_blank">no_align.rs</a>&quot;:&quot;c=
06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53&quot;,&quot=
;src/unix/nto/<a href=3D"http://aarch64.rs" rel=3D"noreferrer" target=3D"_b=
lank">aarch64.rs</a>&quot;:&quot;4709c9afdc8d583be876598e7c238499ee3e8da5bd=
2baa614d9c7dd414851555&quot;,&quot;src/unix/nto/<a href=3D"http://mod.rs" r=
el=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;5eb045c352114f5d=
744d098acaf9e47a9223f6fccd43f36b9a3ba79b29af0eee&quot;,&quot;src/unix/nto/<=
a href=3D"http://neutrino.rs" rel=3D"noreferrer" target=3D"_blank">neutrino=
.rs</a>&quot;:&quot;799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf1=
3bc80026b&quot;,&quot;src/unix/nto/<a href=3D"http://x86_64.rs" rel=3D"nore=
ferrer" target=3D"_blank">x86_64.rs</a>&quot;:&quot;a3e18e93c2999da1cd7a6f7=
48a4b60c07aefb73d8ea2aafec19a84cfb040bc8e&quot;,&quot;src/unix/redox/<a hre=
f=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&=
quot;e75a319975472fe9e0873244fb07c5d2004672b7a4cf7a3cb01532d6d394cb8a&quot;=
,&quot;src/unix/solarish/<a href=3D"http://compat.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">compat.rs</a>&quot;:&quot;00f1ee3faec9da69204e42f025f6735dd=
13d894071a154425dcc43ecbdd06e7f&quot;,&quot;src/unix/solarish/<a href=3D"ht=
tp://illumos.rs" rel=3D"noreferrer" target=3D"_blank">illumos.rs</a>&quot;:=
&quot;26171da367221de1e456f1236250b5831a770d6f109ed12b0ebe4d508e490194&quot=
;,&quot;src/unix/solarish/<a href=3D"http://mod.rs" rel=3D"noreferrer" targ=
et=3D"_blank">mod.rs</a>&quot;:&quot;c0c5dfc406d728666010cdc2fe21b0df40547e=
d20dd7ad0eab65906e103b6d4b&quot;,&quot;src/unix/solarish/<a href=3D"http://=
solaris.rs" rel=3D"noreferrer" target=3D"_blank">solaris.rs</a>&quot;:&quot=
;41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf&quot;,&qu=
ot;src/unix/solarish/<a href=3D"http://x86.rs" rel=3D"noreferrer" target=3D=
"_blank">x86.rs</a>&quot;:&quot;e86e806df0caed72765040eaa2f3c883198d1aa9150=
8540adf9b7008c77f522e&quot;,&quot;src/unix/solarish/<a href=3D"http://x86_6=
4.rs" rel=3D"noreferrer" target=3D"_blank">x86_64.rs</a>&quot;:&quot;ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc&quot;,&quot;src/=
unix/solarish/<a href=3D"http://x86_common.rs" rel=3D"noreferrer" target=3D=
"_blank">x86_common.rs</a>&quot;:&quot;ac869d9c3c95645c22460468391eb1982023=
c3a8e02b9e06a72e3aef3d5f1eac&quot;,&quot;src/vxworks/<a href=3D"http://aarc=
h64.rs" rel=3D"noreferrer" target=3D"_blank">aarch64.rs</a>&quot;:&quot;98f=
0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99&quot;,&quot;s=
rc/vxworks/<a href=3D"http://arm.rs" rel=3D"noreferrer" target=3D"_blank">a=
rm.rs</a>&quot;:&quot;acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88&quot;,&quot;src/vxworks/<a href=3D"http://mod.rs" rel=3D"norefe=
rrer" target=3D"_blank">mod.rs</a>&quot;:&quot;ccdb6a6e0c12011705a15dadc04b=
26882e6090db4403af4d15cad9330ef96370&quot;,&quot;src/vxworks/<a href=3D"htt=
p://powerpc.rs" rel=3D"noreferrer" target=3D"_blank">powerpc.rs</a>&quot;:&=
quot;acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88&quot;=
,&quot;src/vxworks/<a href=3D"http://powerpc64.rs" rel=3D"noreferrer" targe=
t=3D"_blank">powerpc64.rs</a>&quot;:&quot;98f0afdc511cd02557e506c21fed67375=
85490a1dce7a9d4941d08c437762b99&quot;,&quot;src/vxworks/<a href=3D"http://x=
86.rs" rel=3D"noreferrer" target=3D"_blank">x86.rs</a>&quot;:&quot;552f007f=
38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba&quot;,&quot;src/vx=
works/<a href=3D"http://x86_64.rs" rel=3D"noreferrer" target=3D"_blank">x86=
_64.rs</a>&quot;:&quot;018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a=
7f98ed6b514a&quot;,&quot;src/<a href=3D"http://wasi.rs" rel=3D"noreferrer" =
target=3D"_blank">wasi.rs</a>&quot;:&quot;51e38bb98547c40d0822d31975c976cd6=
e0784463d90d170109c87bf324395d3&quot;,&quot;src/windows/gnu/<a href=3D"http=
://align.rs" rel=3D"noreferrer" target=3D"_blank">align.rs</a>&quot;:&quot;=
b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647&quot;,&quo=
t;src/windows/gnu/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_b=
lank">mod.rs</a>&quot;:&quot;3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef3=
0571b4f4e38375767a&quot;,&quot;src/windows/<a href=3D"http://mod.rs" rel=3D=
"noreferrer" target=3D"_blank">mod.rs</a>&quot;:&quot;9fdc5e1c62c441abef7bc=
62a7343efb2041edc24db9ac0efc0f74df55b69e249&quot;,&quot;src/windows/msvc/<a=
 href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a>&quo=
t;:&quot;c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4&q=
uot;,&quot;src/<a href=3D"http://xous.rs" rel=3D"noreferrer" target=3D"_bla=
nk">xous.rs</a>&quot;:&quot;eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20=
756c49250f3d65fae&quot;,&quot;tests/<a href=3D"http://const_fn.rs" rel=3D"n=
oreferrer" target=3D"_blank">const_fn.rs</a>&quot;:&quot;cb75a1f0864f926aeb=
e79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4&quot;},&quot;package&quot;:&=
quot;d8adc4bb1803a324070e64a98ae98f38934d91957a99cfb3a43dcbc01bc56439&quot;=
}<br>
&gt;&gt; -diff --git a/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/g=
eneric/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.r=
s</a> b/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/<a href=
=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt;&gt; -index 2f437e16d..db1f1e70f 100644<br>
&gt;&gt; ---- a/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/=
<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a><b=
r>
&gt;&gt; -+++ b/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/=
<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a><b=
r>
&gt;&gt; -@@ -114,6 +114,7 @@ cfg_if! {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ta=
rget_arch =3D &quot;x86_64&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ta=
rget_arch =3D &quot;arm&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ta=
rget_arch =3D &quot;aarch64&quot;,<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ta=
rget_arch =3D &quot;riscv32&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ta=
rget_arch =3D &quot;riscv64&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ta=
rget_arch =3D &quot;s390x&quot;,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ta=
rget_arch =3D &quot;csky&quot;,<br>
&gt;&gt; -@@ -218,7 +219,10 @@ cfg_if! {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0// where S stands for size (int, long, struct=
...)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0// where T stands for type (&#39;f&#39;,&#39;=
v&#39;,&#39;X&#39;...)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0// where N stands for NR (NumbeR)<br>
&gt;&gt; --=C2=A0 =C2=A0 if #[cfg(any(target_arch =3D &quot;x86&quot;, targ=
et_arch =3D &quot;arm&quot;, target_arch =3D &quot;csky&quot;))] {<br>
&gt;&gt; -+=C2=A0 =C2=A0 if #[cfg(any(target_arch =3D &quot;x86&quot;,<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ta=
rget_arch =3D &quot;arm&quot;,<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ta=
rget_arch =3D &quot;riscv32&quot;,<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ta=
rget_arch =3D &quot;csky&quot;))] {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pub const FS_IOC_GETFLAGS: ::Io=
ctl =3D 0x80046601;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pub const FS_IOC_SETFLAGS: ::Io=
ctl =3D 0x40046602;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pub const FS_IOC_GETVERSION: ::=
Ioctl =3D 0x80047601;<br>
&gt;&gt;=C2=A0 diff --git a/vendor/libc-0.2.167/.cargo-checksum.json b/vend=
or/libc-0.2.167/.cargo-checksum.json<br>
&gt;&gt;=C2=A0 index 7ea5d4122..def87f4ef 100644<br>
&gt;&gt;=C2=A0 --- a/vendor/libc-0.2.167/.cargo-checksum.json<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_=
steps-tool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/fi=
les/0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch<br>
&gt;&gt; index e63cfb0719..5e0f5912a1 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-t=
ool.rs-switch-off-lto-for-rust.patch<br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-t=
ool.rs-switch-off-lto-for-rust.patch<br>
&gt;&gt; @@ -24,23 +24,53 @@ diff --git a/src/bootstrap/src/core/build_step=
s/<a href=3D"http://tool.rs" rel=3D"noreferrer" target=3D"_blank">tool.rs</=
a> b/src/bootstrap/src/core<br>
&gt;&gt;=C2=A0 index 087df2f8a..00790affb 100644<br>
&gt;&gt;=C2=A0 --- a/src/bootstrap/src/core/build_steps/<a href=3D"http://t=
ool.rs" rel=3D"noreferrer" target=3D"_blank">tool.rs</a><br>
&gt;&gt;=C2=A0 +++ b/src/bootstrap/src/core/build_steps/<a href=3D"http://t=
ool.rs" rel=3D"noreferrer" target=3D"_blank">tool.rs</a><br>
&gt;&gt; -@@ -635,7 +635,7 @@ impl Step for Rustdoc {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +@@ -1,14 +1,11 @@<br>
&gt;&gt; + use std::path::PathBuf;<br>
&gt;&gt; + use std::{env, fs};<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// NOTE: Never modify the rustf=
lags here, it breaks the build cache for other tools!<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 let cargo =3D prepare_tool_cargo(<br=
>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut cargo =3D prepare_tool_cargo=
(<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0builder,<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build_compiler,<b=
r>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mode::ToolRustc,<=
br>
&gt;&gt; -@@ -645,6 +645,7 @@ impl Step for Rustdoc {<br>
&gt;&gt; +-use crate::core::build_steps::compile::is_lto_stage;<br>
&gt;&gt; + use crate::core::build_steps::toolstate::ToolState;<br>
&gt;&gt; + use crate::core::build_steps::{compile, llvm};<br>
&gt;&gt; + use crate::core::builder;<br>
&gt;&gt; +-use crate::core::builder::{<br>
&gt;&gt; +-=C2=A0 =C2=A0 Builder, Cargo as CargoCommand, RunConfig, ShouldR=
un, Step, cargo_profile_var,<br>
&gt;&gt; +-};<br>
&gt;&gt; +-use crate::core::config::{DebuginfoLevel, RustcLto, TargetSelect=
ion};<br>
&gt;&gt; ++use crate::core::builder::{Builder, Cargo as CargoCommand, RunCo=
nfig, ShouldRun, Step};<br>
&gt;&gt; ++use crate::core::config::{DebuginfoLevel, TargetSelection};<br>
&gt;&gt; + use crate::utils::channel::GitInfo;<br>
&gt;&gt; + use crate::utils::exec::{BootstrapCommand, command};<br>
&gt;&gt; + use crate::utils::helpers::{add_dylib_path, exe, t};<br>
&gt;&gt; +@@ -658,19 +655,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SourceType::=
InTree,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0features.as_=
slice(),<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0);<br>
&gt;&gt; +-<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 // rustdoc is performance sensitive,=
 so apply LTO to it.<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_lto_stage(&amp;build_compiler)=
 {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let lto =3D match buil=
der.config.rust_lto {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RustcLto=
::Off =3D&gt; Some(&quot;off&quot;),<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RustcLto=
::Thin =3D&gt; Some(&quot;thin&quot;),<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RustcLto=
::Fat =3D&gt; Some(&quot;fat&quot;),<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RustcLto=
::ThinLocal =3D&gt; None,<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if let Some(lto) =3D l=
to {<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo.en=
v(cargo_profile_var(&quot;LTO&quot;, &amp;builder.config), lto);<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo.rustflag(&quot;-Clto=3Dof=
f&quot;);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let _guard =3D builder.msg=
_tool(<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Kind::Build,=
<br>
&gt;&gt; ---<br>
&gt;&gt; -2.39.5<br>
&gt;&gt; -<br>
&gt;&gt; +diff --git a/src/bootstrap/src/core/builder/<a href=3D"http://mod=
.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a> b/src/bootstrap/src/co=
re/builder/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">m=
od.rs</a><br>
&gt;&gt; +--- a/src/bootstrap/src/core/builder/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt;&gt; ++++ b/src/bootstrap/src/core/builder/<a href=3D"http://mod.rs" re=
l=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt;&gt; +@@ -11,7 +11,7 @@<br>
&gt;&gt; +<br>
&gt;&gt; + use clap::ValueEnum;<br>
&gt;&gt; +<br>
&gt;&gt; +-pub use self::cargo::{Cargo, cargo_profile_var};<br>
&gt;&gt; ++pub use self::cargo::Cargo;<br>
&gt;&gt; + pub use crate::Compiler;<br>
&gt;&gt; + use crate::core::build_steps::{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0check, clean, clippy, compile, dist, doc, gcc=
, install, llvm, run, setup, test, tool, vendor,<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/files/Zdual-proc-macros-ad=
ditional-check.patch b/meta/recipes-devtools/rust/files/Zdual-proc-macros-a=
dditional-check.patch<br>
&gt;&gt; deleted file mode 100644<br>
&gt;&gt; index 6bb1738d05..0000000000<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/files/Zdual-proc-macros-additiona=
l-check.patch<br>
&gt;&gt; +++ /dev/null<br>
&gt;&gt; @@ -1,31 +0,0 @@<br>
&gt;&gt; -Fix bootstrap failure when multilibs are enabled.<br>
&gt;&gt; -<br>
&gt;&gt; -Upstream-Status: Backport [<a href=3D"https://github.com/rust-lan=
g/rust/commit/139d6ba054a1a4cc5fe64981ad46fd5547bd4916" rel=3D"noreferrer" =
target=3D"_blank">https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc=
5fe64981ad46fd5547bd4916</a>]<br>
&gt;&gt; -<br>
&gt;&gt; -Signed-off-by: Deepesh Varatharajan &lt;<a href=3D"mailto:Deepesh=
.Varatharajan@windriver.com" target=3D"_blank">Deepesh.Varatharajan@windriv=
er.com</a>&gt;<br>
&gt;&gt; ----<br>
&gt;&gt; -diff --git a/src/bootstrap/src/core/builder/<a href=3D"http://car=
go.rs" rel=3D"noreferrer" target=3D"_blank">cargo.rs</a> b/src/bootstrap/sr=
c/core/builder/<a href=3D"http://cargo.rs" rel=3D"noreferrer" target=3D"_bl=
ank">cargo.rs</a><br>
&gt;&gt; -index 066e6bf53f..a2f6fac4b1 100644<br>
&gt;&gt; ---- a/src/bootstrap/src/core/builder/<a href=3D"http://cargo.rs" =
rel=3D"noreferrer" target=3D"_blank">cargo.rs</a><br>
&gt;&gt; -+++ b/src/bootstrap/src/core/builder/<a href=3D"http://cargo.rs" =
rel=3D"noreferrer" target=3D"_blank">cargo.rs</a><br>
&gt;&gt; -@@ -646,7 +646,10 @@ impl Builder&lt;&#39;_&gt; {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// =
Build proc macros both for the host and the target unless proc-macros are n=
ot<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// =
supported by the target.<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if =
target !=3D compiler.host &amp;&amp; cmd_kind !=3D Kind::Check {<br>
&gt;&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 let error =3D command(self.rustc(compiler))<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 let mut rustc_cmd =3D command(self.rustc(compiler));<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 self.add_rustc_lib_path(compiler, &amp;mut rustc_cmd);<br>
&gt;&gt; -+<br>
&gt;&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 let error =3D rustc_cmd<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.arg(&quot;--target&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.arg(target.rustc_target_arg())<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.arg(&quot;--print=3Dfile-names&quot;)<br>
&gt;&gt; -@@ -654,6 +657,7 @@ impl Builder&lt;&#39;_&gt; {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.arg(&quot;-&quot;)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.run_capture(self)<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.stderr();<br>
&gt;&gt; -+<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0let not_supported =3D error<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.lines()<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.any(|line| line.contains(&quot;unsupported crat=
e type `proc-macro`&quot;));<br>
&gt;&gt; -<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.pat=
ch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch<br>
&gt;&gt; index 048fc3f10b..49d85072cb 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch<br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch<br>
&gt;&gt; @@ -43,10 +43,10 @@ diff --git a/compiler/rustc_interface/src/<a h=
ref=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b=
/compiler/rustc_interface/sr<br>
&gt;&gt;=C2=A0 =C2=A0fn test_can_print_warnings() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sess_and_cfg(&amp;[&quot;-Awarnings&quot=
;], |sess, _cfg| {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert!(!sess.dcx().can_em=
it_warnings());<br>
&gt;&gt; -diff --git a/library/std/src/sync/poison/rwlock/<a href=3D"http:/=
/tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/std/=
src/sync/poison/rwlock/<a href=3D"http://tests.rs" rel=3D"noreferrer" targe=
t=3D"_blank">tests.rs</a><br>
&gt;&gt; +diff --git a/library/std/tests/sync/<a href=3D"http://rwlock.rs" =
rel=3D"noreferrer" target=3D"_blank">rwlock.rs</a> b/library/std/tests/sync=
/<a href=3D"http://rwlock.rs" rel=3D"noreferrer" target=3D"_blank">rwlock.r=
s</a><br>
&gt;&gt;=C2=A0 index 1a9d3d3f12f..0a9cfc48806 100644<br>
&gt;&gt; ---- a/library/std/src/sync/poison/rwlock/<a href=3D"http://tests.=
rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -+++ b/library/std/src/sync/poison/rwlock/<a href=3D"http://tests.=
rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; +--- a/library/std/tests/sync/<a href=3D"http://rwlock.rs" rel=3D"=
noreferrer" target=3D"_blank">rwlock.rs</a><br>
&gt;&gt; ++++ b/library/std/tests/sync/<a href=3D"http://rwlock.rs" rel=3D"=
noreferrer" target=3D"_blank">rwlock.rs</a><br>
&gt;&gt;=C2=A0 @@ -47,6 +47,7 @@ fn frob() {<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -114,9 +114,9 @@ diff --git a/library/test/src/<a href=3D"http:=
//tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/tes=
t/src/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">test=
s.rs</a><br>
&gt;&gt;=C2=A0 =C2=A0fn test_time_options_threshold() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let unit =3D TimeThreshold::new(Duration=
::from_millis(50), Duration::from_millis(100));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let integration =3D TimeThreshold::new(D=
uration::from_millis(500), Duration::from_millis(1000));<br>
&gt;&gt; -diff --git a/library/std/src/sync/poison/mutex/<a href=3D"http://=
tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/std/s=
rc/sync/poison/mutex/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=
=3D"_blank">tests.rs</a><br>
&gt;&gt; ---- a/library/std/src/sync/poison/mutex/<a href=3D"http://tests.r=
s" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -+++ b/library/std/src/sync/poison/mutex/<a href=3D"http://tests.r=
s" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; +diff --git a/library/std/tests/sync/<a href=3D"http://mutex.rs" r=
el=3D"noreferrer" target=3D"_blank">mutex.rs</a> b/library/std/tests/sync/<=
a href=3D"http://mutex.rs" rel=3D"noreferrer" target=3D"_blank">mutex.rs</a=
><br>
&gt;&gt; +--- a/library/std/tests/sync/<a href=3D"http://mutex.rs" rel=3D"n=
oreferrer" target=3D"_blank">mutex.rs</a><br>
&gt;&gt; ++++ b/library/std/tests/sync/<a href=3D"http://mutex.rs" rel=3D"n=
oreferrer" target=3D"_blank">mutex.rs</a><br>
&gt;&gt;=C2=A0 @@ -193,6 +193,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -125,9 +125,9 @@ diff --git a/library/std/src/sync/poison/mutex=
/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs<=
/a> b/library/std/src/sync/p<br>
&gt;&gt;=C2=A0 =C2=A0fn test_mutex_arc_poison_mapped() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let arc =3D Arc::new(Mutex::new(1));<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0assert!(!arc.is_poisoned());<br>
&gt;&gt; -diff --git a/library/std/src/sync/poison/mutex/<a href=3D"http://=
tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/std/s=
rc/sync/poison/mutex/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=
=3D"_blank">tests.rs</a><br>
&gt;&gt; ---- a/library/std/src/sync/poison/mutex/<a href=3D"http://tests.r=
s" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -+++ b/library/std/src/sync/poison/mutex/<a href=3D"http://tests.r=
s" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; +diff --git a/library/std/tests/sync/<a href=3D"http://mutex.rs" r=
el=3D"noreferrer" target=3D"_blank">mutex.rs</a> b/library/std/tests/sync/<=
a href=3D"http://mutex.rs" rel=3D"noreferrer" target=3D"_blank">mutex.rs</a=
><br>
&gt;&gt; +--- a/library/std/tests/sync/<a href=3D"http://mutex.rs" rel=3D"n=
oreferrer" target=3D"_blank">mutex.rs</a><br>
&gt;&gt; ++++ b/library/std/tests/sync/<a href=3D"http://mutex.rs" rel=3D"n=
oreferrer" target=3D"_blank">mutex.rs</a><br>
&gt;&gt;=C2=A0 @@ -272,6 +272,7 @@<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -136,9 +136,9 @@ diff --git a/library/std/src/sync/poison/mutex=
/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs<=
/a> b/library/std/src/sync/p<br>
&gt;&gt;=C2=A0 =C2=A0fn panic_while_mapping_unlocked_poison() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let lock =3D Mutex::new(());<br>
&gt;&gt;<br>
&gt;&gt; -diff --git a/library/std/src/sync/rwlock/<a href=3D"http://tests.=
rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/std/src/syn=
c/poison/rwlock/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_b=
lank">tests.rs</a><br>
&gt;&gt; ---- a/library/std/src/sync/poison/rwlock/<a href=3D"http://tests.=
rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -+++ b/library/std/src/sync/poison/rwlock/<a href=3D"http://tests.=
rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; +diff --git a/library/std/src/sync/rwlock/<a href=3D"http://tests.=
rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/std/tests/s=
ync/<a href=3D"http://rwlock.rs" rel=3D"noreferrer" target=3D"_blank">rwloc=
k.rs</a><br>
&gt;&gt; +--- a/library/std/tests/sync/<a href=3D"http://rwlock.rs" rel=3D"=
noreferrer" target=3D"_blank">rwlock.rs</a><br>
&gt;&gt; ++++ b/library/std/tests/sync/<a href=3D"http://rwlock.rs" rel=3D"=
noreferrer" target=3D"_blank">rwlock.rs</a><br>
&gt;&gt;=C2=A0 @@ -59,6 +59,7 @@ fn test_rw_arc_poison_wr() {<br>
&gt;&gt;=C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -163,10 +163,10 @@ diff --git a/library/std/src/sync/rwlock/<a =
href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> =
b/library/std/src/sync/poison/<br>
&gt;&gt;=C2=A0 =C2=A0fn panic_while_mapping_write_unlocked_poison() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let lock =3D RwLock::new(());<br>
&gt;&gt;<br>
&gt;&gt; -diff --git a/library/core/benches/num/int_log/<a href=3D"http://m=
od.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a> b/library/core/bench=
es/num/int_log/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blan=
k">mod.rs</a><br>
&gt;&gt; +diff --git a/library/coretests/benches/num/int_log/<a href=3D"htt=
p://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a> b/library/coret=
ests/benches/num/int_log/<a href=3D"http://mod.rs" rel=3D"noreferrer" targe=
t=3D"_blank">mod.rs</a><br>
&gt;&gt;=C2=A0 index 3807cd5d76c..018c5c04456 100644<br>
&gt;&gt; ---- a/library/core/benches/num/int_log/<a href=3D"http://mod.rs" =
rel=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt;&gt; -+++ b/library/core/benches/num/int_log/<a href=3D"http://mod.rs" =
rel=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt;&gt; +--- a/library/coretests/benches/num/int_log/<a href=3D"http://mod=
.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt;&gt; ++++ b/library/coretests/benches/num/int_log/<a href=3D"http://mod=
.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a><br>
&gt;&gt;=C2=A0 @@ -98,6 +98,7 @@ fn $random_small(bench: &amp;mut Bencher) =
{<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;<br>
&gt;&gt; @@ -175,34 +175,22 @@ index 3807cd5d76c..018c5c04456 100644<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fn $geometric(bench: &amp;=
mut Bencher) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let bases: [=
$t; 16] =3D [2, 3, 4, 5, 7, 8, 9, 15, 16, 17, 31, 32, 33, 63, 64, 65];<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let base_and=
_numbers: Vec&lt;($t, Vec&lt;$t&gt;)&gt; =3D bases<br>
&gt;&gt; -diff --git a/compiler/rustc_data_structures/src/tagged_ptr/copy/<=
a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a=
> b/compiler/rustc_data_structures/src/tagged_ptr/copy/<a href=3D"http://te=
sts.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; +diff --git a/compiler/rustc_data_structures/src/tagged_ptr/<a hre=
f=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/c=
ompiler/rustc_data_structures/src/tagged_ptr/<a href=3D"http://tests.rs" re=
l=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt;=C2=A0 index 160af8a65d..686f4607bb 100644<br>
&gt;&gt; ---- a/compiler/rustc_data_structures/src/tagged_ptr/copy/<a href=
=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -+++ b/compiler/rustc_data_structures/src/tagged_ptr/copy/<a href=
=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; +--- a/compiler/rustc_data_structures/src/tagged_ptr/<a href=3D"ht=
tp://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; ++++ b/compiler/rustc_data_structures/src/tagged_ptr/<a href=3D"ht=
tp://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt;=C2=A0 @@ -5,6 +5,7 @@ use crate::stable_hasher::{HashStable, Stabl=
eHasher};<br>
&gt;&gt; - use crate::tagged_ptr::{CopyTaggedPtr, Pointer, Tag, Tag2};<br>
&gt;&gt; -<br>
&gt;&gt; - #[test]<br>
&gt;&gt; -+#[ignore]<br>
&gt;&gt; - fn smoke() {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0let value =3D 12u32;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0let reference =3D &amp;value;<br>
&gt;&gt; -diff --git a/compiler/rustc_data_structures/src/tagged_ptr/drop/<=
a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a=
> b/compiler/rustc_data_structures/src/tagged_ptr/drop/<a href=3D"http://te=
sts.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -index 4d342c72cc..9a77f92616 100644<br>
&gt;&gt; ---- a/compiler/rustc_data_structures/src/tagged_ptr/drop/<a href=
=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -+++ b/compiler/rustc_data_structures/src/tagged_ptr/drop/<a href=
=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -@@ -4,6 +4,7 @@ use std::sync::Arc;<br>
&gt;&gt; - use crate::tagged_ptr::{Pointer, Tag, Tag2, TaggedPtr};<br>
&gt;&gt; + }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0#[test]<br>
&gt;&gt;=C2=A0 +#[ignore]<br>
&gt;&gt;=C2=A0 =C2=A0fn smoke() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let value =3D 12u32;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let reference =3D &amp;value;<br>
&gt;&gt; -diff --git a/library/std/src/thread/local/<a href=3D"http://tests=
.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/std/src/th=
read/local/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_blank"=
>tests.rs</a><br>
&gt;&gt; +diff --git a/library/std/tests/thread_local/<a href=3D"http://tes=
ts.rs" rel=3D"noreferrer" target=3D"_blank">tests.rs</a> b/library/std/test=
s/thread_local/<a href=3D"http://tests.rs" rel=3D"noreferrer" target=3D"_bl=
ank">tests.rs</a><br>
&gt;&gt;=C2=A0 index 9d4f52a092..d425e5f7b7 100644<br>
&gt;&gt; ---- a/library/std/src/thread/local/<a href=3D"http://tests.rs" re=
l=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; -+++ b/library/std/src/thread/local/<a href=3D"http://tests.rs" re=
l=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; +--- a/library/std/tests/thread_local/<a href=3D"http://tests.rs" =
rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt; ++++ b/library/std/tests/thread_local/<a href=3D"http://tests.rs" =
rel=3D"noreferrer" target=3D"_blank">tests.rs</a><br>
&gt;&gt;=C2=A0 @@ -346,6 +346,7 @@ fn join_orders_after_tls_destructors() {=
<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0// Test that thread::current is still available in TLS=
 destructors.<br>
&gt;&gt; @@ -242,3 +230,32 @@ index a05f274136..0e69b4cb98 100644<br>
&gt;&gt;=C2=A0 =C2=A0fn sparse_inserts() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let cache: VecCache&lt;u32, u8, u32&gt; =
=3D VecCache::default();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let end =3D if cfg!(target_pointer_width=
 =3D &quot;64&quot;) &amp;&amp; cfg!(target_os =3D &quot;linux&quot;) {<br>
&gt;&gt; +diff --git a/tests/assembly/<a href=3D"http://dwarf-mixed-version=
s-lto.rs" rel=3D"noreferrer" target=3D"_blank">dwarf-mixed-versions-lto.rs<=
/a> b/tests/assembly/<a href=3D"http://dwarf-mixed-versions-lto.rs" rel=3D"=
noreferrer" target=3D"_blank">dwarf-mixed-versions-lto.rs</a><br>
&gt;&gt; +index 5b8e5ff4f4a..e558fbd7bd7 100644<br>
&gt;&gt; +--- a/tests/assembly/<a href=3D"http://dwarf-mixed-versions-lto.r=
s" rel=3D"noreferrer" target=3D"_blank">dwarf-mixed-versions-lto.rs</a><br>
&gt;&gt; ++++ b/tests/assembly/<a href=3D"http://dwarf-mixed-versions-lto.r=
s" rel=3D"noreferrer" target=3D"_blank">dwarf-mixed-versions-lto.rs</a><br>
&gt;&gt; +@@ -1,6 +1,11 @@<br>
&gt;&gt; + // This test ensures that if LTO occurs between crates with diff=
erent DWARF versions, we<br>
&gt;&gt; + // will choose the highest DWARF version for the final binary. T=
his matches Clang&#39;s behavior.<br>
&gt;&gt; +<br>
&gt;&gt; ++//@ only-x86<br>
&gt;&gt; ++//@ only-x86_64<br>
&gt;&gt; ++//@ only-arm<br>
&gt;&gt; ++//@ only-aarch64<br>
&gt;&gt; ++<br>
&gt;&gt; + //@ only-linux<br>
&gt;&gt; + //@ aux-build:<a href=3D"http://dwarf-mixed-versions-lto-aux.rs"=
 rel=3D"noreferrer" target=3D"_blank">dwarf-mixed-versions-lto-aux.rs</a><b=
r>
&gt;&gt; + //@ compile-flags: -C lto -g -Zdwarf-version=3D5<br>
&gt;&gt; +diff --git a/tests/codegen/<a href=3D"http://dont-shuffle-bswaps.=
rs" rel=3D"noreferrer" target=3D"_blank">dont-shuffle-bswaps.rs</a> b/tests=
/codegen/<a href=3D"http://dont-shuffle-bswaps.rs" rel=3D"noreferrer" targe=
t=3D"_blank">dont-shuffle-bswaps.rs</a><br>
&gt;&gt; +index 0e712bc3a4e..93965d990d0 100644<br>
&gt;&gt; +--- a/tests/codegen/<a href=3D"http://dont-shuffle-bswaps.rs" rel=
=3D"noreferrer" target=3D"_blank">dont-shuffle-bswaps.rs</a><br>
&gt;&gt; ++++ b/tests/codegen/<a href=3D"http://dont-shuffle-bswaps.rs" rel=
=3D"noreferrer" target=3D"_blank">dont-shuffle-bswaps.rs</a><br>
&gt;&gt; +@@ -1,3 +1,8 @@<br>
&gt;&gt; ++//@ only-x86<br>
&gt;&gt; ++//@ only-x86_64<br>
&gt;&gt; ++//@ only-arm<br>
&gt;&gt; ++//@ only-aarch64<br>
&gt;&gt; ++<br>
&gt;&gt; + //@ revisions: OPT2 OPT3<br>
&gt;&gt; + //@[OPT2] compile-flags: -Copt-level=3D2<br>
&gt;&gt; + //@[OPT3] compile-flags: -C opt-level=3D3<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://libstd-r=
s_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.85.1.bb</a> b=
/meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_1.86.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libstd-rs_1.86.0.bb</a><br>
&gt;&gt; similarity index 95%<br>
&gt;&gt; rename from meta/recipes-devtools/rust/<a href=3D"http://libstd-rs=
_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.85.1.bb</a><br=
>
&gt;&gt; rename to meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_1=
.86.0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.86.0.bb</a><br>
&gt;&gt; index 00802f0fd9..b39ec0ab39 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_1.85.=
1.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.85.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://libstd-rs_1.86.=
0.bb" rel=3D"noreferrer" target=3D"_blank">libstd-rs_1.86.0.bb</a><br>
&gt;&gt; @@ -2,7 +2,7 @@ SUMMARY =3D &quot;Rust standard libaries&quot;<br>
&gt;&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://www.rust-lang.org" rel=
=3D"noreferrer" target=3D"_blank">http://www.rust-lang.org</a>&quot;<br>
&gt;&gt;=C2=A0 SECTION =3D &quot;devel&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;(MIT | Apache-2.0) &amp; Unicode-3.0&quot;=
<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://../../COPYRIGHT;md5=3D9c0fae516=
fe8aaea2fb601db4800daf7&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://../../COPYRIGHT;md5=3D11a389982=
5f4376896e438c8c753f8dc&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 require rust-source.inc<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-cro=
ss-canadian_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-cana=
dian_1.85.1.bb</a> b/meta/recipes-devtools/rust/<a href=3D"http://rust-cros=
s-canadian_1.86.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canad=
ian_1.86.0.bb</a><br>
&gt;&gt; similarity index 100%<br>
&gt;&gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust-cros=
s-canadian_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canad=
ian_1.85.1.bb</a><br>
&gt;&gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust-cross-=
canadian_1.86.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-cross-canadia=
n_1.86.0.bb</a><br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust-llv=
m_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a> b=
/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.86.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust-llvm_1.86.0.bb</a><br>
&gt;&gt; similarity index 96%<br>
&gt;&gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust-llvm=
_1.85.1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a><br=
>
&gt;&gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1=
.86.0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.86.0.bb</a><br>
&gt;&gt; index 2ba37f0784..327e8e6b69 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.85.=
1.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.85.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://rust-llvm_1.86.=
0.bb" rel=3D"noreferrer" target=3D"_blank">rust-llvm_1.86.0.bb</a><br>
&gt;&gt; @@ -2,9 +2,9 @@ SUMMARY =3D &quot;LLVM compiler framework (package=
d with rust)&quot;<br>
&gt;&gt;=C2=A0 LICENSE ?=3D &quot;Apache-2.0-with-LLVM-exception&quot;<br>
&gt;&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://www.rust-lang.org" rel=
=3D"noreferrer" target=3D"_blank">http://www.rust-lang.org</a>&quot;<br>
&gt;&gt;<br>
&gt;&gt; -# check src/llvm-project/llvm/CMakeLists.txt for llvm version in =
use<br>
&gt;&gt; +# check src/llvm-project/cmake/Modules/LLVMVersion.cmake for llvm=
 version in use<br>
&gt;&gt;=C2=A0 #<br>
&gt;&gt; -LLVM_RELEASE =3D &quot;19.1.5&quot;<br>
&gt;&gt; +LLVM_RELEASE =3D &quot;19.1.7&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 require rust-source.inc<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/r=
ecipes-devtools/rust/rust-snapshot.inc<br>
&gt;&gt; index 98358bce40..445390fcaf 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/rust-snapshot.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/rust-snapshot.inc<br>
&gt;&gt; @@ -4,56 +4,56 @@<br>
&gt;&gt;=C2=A0 ## The exact (previous) version that has been used is specif=
ied in the source tarball.<br>
&gt;&gt;=C2=A0 ## The version is replicated here.<br>
&gt;&gt;<br>
&gt;&gt; -SNAPSHOT_VERSION =3D &quot;1.84.0&quot;<br>
&gt;&gt; +SNAPSHOT_VERSION =3D &quot;1.85.0&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D &quot;9f5650aece53e=
083b933a57e5a8e0e2db4479f52ec897d5b6d0f77be6cd50498&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D &quot;023f0b6153=
b23ac0e9686c2ab95bc393ee3e295b166bb36de3b4dfb53e3913e0&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D &quot;68d4ad239b6d1=
e810e7b8591636dc408cb2c1e89661329fed906febf9c0a9d98&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D &quot;6022245416a9=
88b9952f36bf20f62de0c2f3337bd150e34439ea6651592ac8ca&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D &quot;e742b768f6730=
3010b002b515f6613c639e69ffcc78cd0857d6fe7989e9880f6&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D &quot;8af1d793f7=
820e9ad0ee23247a9123542c3ea23f8857a018651c7788af9bc5b7&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D &quot;cdebe48b066d5=
12d664c13441e8fae2d0f67106c2080aa44289d98b24192b8bc&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D &quot;f3b8e769021a=
6bcee8174ac49a60c367effb6d97af0f2a6c44dc9ea39ff2bda9&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-i686.sha256sum] =3D &quot;f0bc277e8e8c072d=
20ee91784f919c08b34a65ab56b67bcd2bb98a009cdcf97c&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D &quot;e710100be26e7=
42733d445722a37227381f1ec2010664ece85489bc598d70456&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-i686.sha256sum] =3D &quot;3a20231475b75f2f=
6ad0f7c5de283c5706403b41e941d3f1ca6cccfbced214c6&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-i686.sha256sum] =3D &quot;8b5bdd84b9128ab=
c6d61bc1acb60e55eab90e063c7057371b4e6f79aaa1acb9b&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-i686.sha256sum] =3D &quot;c5a5751f3cfa027b=
53fee83d01dec8e555f3622b6993335aed12b1747aa9543c&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D &quot;401571adfe122=
3d83ed041e5a8c54c1f3afb3010d1d5b0c1fd79e7da1ab0a0de&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-i686.sha256sum] =3D &quot;3832027242911ab9=
6fd86128587fc563596a5b10e8e38a073facf61c1ac9668f&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-i686.sha256sum] =3D &quot;74ed13a67c6ea04=
52c0d9e8697c6cfdd8280f983b207187ac93c287f72b65066&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D &quot;33ecfb62a=
fce6e30864f07b4e3b76ac6d9f603a3626e5228ad0d59a7ee263cc1&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D &quot;763b93=
ca08028a1e63a8a3754ac6118b2659022538e5e33675f2d7620488cd57&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D &quot;1531b9f3d=
09983c43f54d7e5ced6b452044e82b24609532e8cee345656e5d8a4&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D &quot;80719f10=
010eaf6a26ba7b2f8c5c7bce3a78fd838cbbe17c00a4e3e7cd45fe5e&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D &quot;d43d2119f=
f25d879b2d280d3e5a03fcd21c57a32d479ad5626500c32432f18c9&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D &quot;2d05f5=
e13e7cb3ee6b0ca0dcd13a231a28eeb0faa4d15257a35cf7284149cd6a&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D &quot;9aa447eef=
cd3ba2f9dbab77596c8669849899ab243543fc8f1914089707081ac&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D &quot;d437b394=
65343a71ff475a65acb6c03bc0f800861f293f48accf1fa170458432&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D &quot;ac99e907c9819=
b61de94a6c12b64256661e5d76c53f3ed25246b46741d1dc973&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D &quot;fdbb75060e=
59ad59273a8ef11fc2ad61837539686df0e8dfe46107e1b15ab90a&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D &quot;dedcb36320cfa=
924e2d21552057f88ee8a30c0424802015494c2f6237150ec55&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D &quot;de2413ae321d=
2bccf77c77acb1e9775b63eca1993ee1450e65e388f029565a51&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D &quot;fbe7154abc641=
d6cacfdc6239ed4701fc7a09b5046c6d1bd209b59e7f2b2d0f0&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D &quot;ab2d5ac7cd=
295adaa4d959e8abbf42b372292c95d1a9f18aad64951ad6e2ab2b&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D &quot;e67c30a72f969=
c51ad199084b3ce0cdc573a4e21f732b2cc39dafbcb9807a5ce&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D &quot;497104d49803=
598cd3801749ac86cb26c88a2bd9c3a8c7bdc18fdf487f4650c0&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D &quot;1f5ff831c9f=
d97d7d306eb7d99186b9e49f35527144aaabd43f67f04449cd732&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D &quot;f2819f8c=
e1ae41c2c2bcf40fc90d6b1a5d340d3e9558267d464730a797122bf5&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D &quot;09d9954bf81=
7404c08a8ac952afe1e086ad11fe20d07522a4bde5f26bf7fb5d2&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D &quot;a34cde35f2=
54210cbb212c3fa85411efaa8e70d600d2c2404b7b319eae9b5be6&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D &quot;f8e38291ba4=
241bc28e9c118d7a449ce3601abdeb2076f2f618858679fb3b929&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D &quot;e9ff89e7=
59125ad2786ad2f6c40e820095720ea00fba66819d15fba79489430a&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D &quot;73cf850f671=
5acbf0029c7e5d4694825f61bd4e193e6413e65a78bcb13df97b7&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D &quot;29b63f23cd=
9af95846a246c9cc8349e514c3fb92ec0c840a38155e252d6cc668&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D &quot;1f6aa28f8=
48b24d4589277b04535ad0258e72b5fa78a4a85ba6d18db95636d69&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D &quot;db731e=
894cce9973ab2b41109c9097d0fc6a49c0d45a0d333bd1547d2c7485a1&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D &quot;7dc351327=
de2567cce2a3387f110cce1db20c68fc529353c5cdef2eada5dbfd8&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D &quot;b53cb58c=
719b84044de62851b6214db8d504f57ad71e81b373d7dea0393146d8&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D &quot;371e40f9d=
6d82aecb056f70f82868d98ddc1c20510aa7d388442ac8d2d86a6ca&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D &quot;d0cfda=
4e18623d17922eb367e44ac9549ab3d5fe1c0bdbe0c2c95754255fa705&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D &quot;e1469f424=
9a7e21f872af487dcd1bd10ce388b5b3679bdab0cb0965e1e30fe47&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D &quot;d8c590bc=
2e6fc75800e41516427f5095ba0e15d7633167689499fcf6523dc61a&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D &quot;c0eaf824c77=
89c94901f895792333595fe131e43f097bcf5987301cc1b14c3f0&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D &quot;451580f9=
cdc47eef4efb0986b1960a8f9c4fb0959f81b77eb6292e6bcff9fc64&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D &quot;3a850b74bdf=
2c3a5912e9f1ea32aaf1c9ac7c5f89c1c0bcf421b961195833992&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D &quot;fb8c9d489e=
10a961f9faa550980069738b5f0f68740e34d7b3ee46a262b53af7&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D &quot;2da33044f17=
a8bc49a1478dc1eb2536df491a44d6e6bb0ec7c86f46877d44e98&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D &quot;0f5ecfe5=
4859bbe715821f982b1a5396784fdf55605d00ece05d3e57a965ed16&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D &quot;c9f28b51979=
9fc2d8089865e30fad04bb5339604d13725365fcd7ad7ee6c1489&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D &quot;9d21bc1801=
96bccdb301e7e03034d3fd0df14b0c6520da0317bba7b1ce385fe8&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D &quot;7dbc2fc2c04e820=
f636bfc74093396c55df0296f7ee4f0547bb849d9a9f05fe0&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D &quot;5208f45cec5f=
3600f2cbc11d1796bc217f09e9c922689c8e4f0cc3f2b83ebb74&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D &quot;bdf944ff5c0b97e=
8b64093fff8d1f63926df86b5e98f91d30c7bd844c6efa20f&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D &quot;b02a586369e6ed=
ebb0f0608e396472d1867419213fd01ba32f3c847e4c5a3c07&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D &quot;308361737ed522a=
a77dd8b4ea91b5db244113ada5fa234d3ed008b526d07e2e8&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D &quot;d25053fbee1a=
0cb899bac8c8e4968aa35f9c3637e486cb5bb2c79ad43a78f3e7&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D &quot;7e1defd60095c91=
ded1612194f811ec5f2fc2e83bb914d35594d01fa3c54049d&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D &quot;9780d8c4cfef9d=
05460b3e540aad142391b2e3994accf8cfc8afb87fefac6cf0&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D &quot;a1737d86f80b31=
a6d48a6726726275dc068ecb930c9635b13aa59999486de837&quot;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D &quot;770237080b9=
310d126350c3bd70820bd91064c2e96c29ab5f2e002b31b5bd067&quot;<br>
&gt;&gt; -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D &quot;6c2371488db92a=
09cd50a1b4045c022f3cf2c643285b3b21105ab5f9b64fd6b6&quot;<br>
&gt;&gt; -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D &quot;1db0212c08e12=
6bf6ee28a0d363c5d6859fe357aa9e91d0247059397dbe7e1fd&quot;<br>
&gt;&gt; +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D &quot;7436f137974750=
82cd87aa65547449e01659d6a810b4cd5f8aedc48bb9f89dfb&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D &quot;285e105d25e=
bdf501341238d4c0594ecdda50ec9078f45095f793a736b1f1ac2&quot;<br>
&gt;&gt; +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D &quot;0aff33b57b0e0b=
102d762a2b53042846c1ca346cff4b7bd96b5c03c9e8e51d81&quot;<br>
&gt;&gt; +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D &quot;0dc3ca1708a6c=
9eed05d0802364377572b79ff079815b7bcbe8e3991f77c4117&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D &quot;a877622fbbfa5=
8304c34372d369e95db106cc35758ca59053144bf7d86fbf3fc&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D &quot;3cb7318da1087=
6de14076549d79410a8441923a92d62b616d8c105f5f5cd831b&quot;<br>
&gt;&gt;<br>
&gt;&gt; -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D &quot;ecd1662d6c=
bbb62984ab31ae787442f1ab32caf6bc17260d407b3a94b434ad32&quot;<br>
&gt;&gt; +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D &quot;65cd47af46=
a5b74e61ff6ae4cce8a979ee8670a57b8aa61e732828d1da073f73&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 SRC_URI +=3D &quot; \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.=
tar.xz;name=3Drust-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-c=
omponents \<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/rec=
ipes-devtools/rust/rust-source.inc<br>
&gt;&gt; index 6cb08b7c38..f9c1fcd1c8 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt;&gt; @@ -7,11 +7,10 @@ SRC_URI +=3D &quot;<a href=3D"https://static.rus=
t-lang.org/dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"noreferrer" =
target=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-s=
rc.tar.xz;n</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://oeqa-selfte=
st-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=3D${RUSTSRC} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-src-co=
re-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=3D${RUSTSRC} =
\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://revert-link=
-std-statically-in-rustc_driver-feature.patch;patchdir=3D${RUSTSRC} \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Zdual-proc-macro=
s-additional-check.patch;patchdir=3D${RUSTSRC} \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-libunw=
ind-Use-gcs-instead-of-gcs-target-attribute.patch;patchdir=3D${RUSTSRC} \<b=
r>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Disabl=
e-libunwind-cross-architecture-unwinding.patch;patchdir=3D${RUSTSRC} \<br>
&gt;&gt;=C2=A0 &quot;<br>
&gt;&gt; -SRC_URI[rust.sha256sum] =3D &quot;b1fbf809efe9f036939401e142631c2=
01a53bcf43ec1696bd9f5290ba236a266&quot;<br>
&gt;&gt; +SRC_URI[rust.sha256sum] =3D &quot;d939eada065dc827a9d4dbb55bd4853=
3ad14c16e7f0a42e70147029c82a7707b&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 RUSTSRC =3D &quot;${WORKDIR}/rustc-${RUST_VERSION}-src&quot;=
<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.8=
5.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.85.1.bb</a> b/meta/reci=
pes-devtools/rust/<a href=3D"http://rust_1.86.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">rust_1.86.0.bb</a><br>
&gt;&gt; similarity index 96%<br>
&gt;&gt; rename from meta/recipes-devtools/rust/<a href=3D"http://rust_1.85=
.1.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.85.1.bb</a><br>
&gt;&gt; rename to meta/recipes-devtools/rust/<a href=3D"http://rust_1.86.0=
.bb" rel=3D"noreferrer" target=3D"_blank">rust_1.86.0.bb</a><br>
&gt;&gt; index f289db6306..c2443fbb15 100644<br>
&gt;&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.85.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">rust_1.85.1.bb</a><br>
&gt;&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.86.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">rust_1.86.0.bb</a><br>
&gt;&gt; @@ -2,18 +2,18 @@ SUMMARY =3D &quot;Rust compiler and runtime liba=
ries&quot;<br>
&gt;&gt;=C2=A0 HOMEPAGE =3D &quot;<a href=3D"http://www.rust-lang.org" rel=
=3D"noreferrer" target=3D"_blank">http://www.rust-lang.org</a>&quot;<br>
&gt;&gt;=C2=A0 SECTION =3D &quot;devel&quot;<br>
&gt;&gt;=C2=A0 LICENSE =3D &quot;(MIT | Apache-2.0) &amp; Unicode-3.0&quot;=
<br>
&gt;&gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D9c0fae516fe8aae=
a2fb601db4800daf7&quot;<br>
&gt;&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D11a3899825f4376=
896e438c8c753f8dc&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 inherit rust<br>
&gt;&gt;=C2=A0 inherit cargo_common<br>
&gt;&gt;<br>
&gt;&gt; -DEPENDS +=3D &quot;rust-llvm&quot;<br>
&gt;&gt; +DEPENDS +=3D &quot;rust-llvm pkgconfig-native openssl ninja-nativ=
e&quot;<br>
&gt;&gt;=C2=A0 # native rust uses cargo/rustc from binary snapshots to boot=
strap<br>
&gt;&gt;=C2=A0 # but everything else should use our native builds<br>
&gt;&gt;=C2=A0 DEPENDS:append:class-target =3D &quot; cargo-native rust-nat=
ive&quot;<br>
&gt;&gt;=C2=A0 DEPENDS:append:class-nativesdk =3D &quot; cargo-native rust-=
native&quot;<br>
&gt;&gt;<br>
&gt;&gt; -RDEPENDS:${PN}:append:class-target =3D &quot; gcc g++ binutils&qu=
ot;<br>
&gt;&gt; +RDEPENDS:${PN}:append:class-target =3D &quot; gcc g++ binutils ba=
sh&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 # Otherwise we&#39;ll depend on what we provide<br>
&gt;&gt;=C2=A0 INHIBIT_DEFAULT_RUST_DEPS:class-native =3D &quot;1&quot;<br>
&gt;&gt; @@ -135,6 +135,8 @@ python do_configure() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;remap-debug=
info&quot;, e(True))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;download-ru=
stc&quot;, e(False))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;llvm-tools&=
quot;, e(False))<br>
&gt;&gt; +=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;lld&quot;, e(Fal=
se))<br>
&gt;&gt; +=C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;use-lld&quot;, e=
(False))<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;rust&quot;, &quot;channel&quo=
t;, e(d.expand(&quot;${RUST_CHANNEL}&quot;)))<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 # Whether or not to optimize the compiler and =
standard library<br>
&gt;&gt; @@ -155,6 +157,8 @@ python do_configure() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cargo =3D d.getVar(&#39;CARGO_BOOTSTRAP&#39;)<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;cargo&quot=
;, e(cargo))<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;extended&quot;,=
 e(False))<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;vendor&quo=
t;, e(True))<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 config.set(&quot;build&quot;, &quot;target&quo=
t;, e([d.getVar(&quot;RUST_TARGET_SYS&quot;)]))<br>
&gt;&gt; @@ -233,10 +237,12 @@ do_test_compile () {<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt;&gt;<br>
&gt;&gt; -PACKAGES =3D+ &quot;${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-=
rustfmt&quot;<br>
&gt;&gt; +PACKAGES =3D+ &quot;${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-=
rustfmt ${PN}-zsh-completion&quot;<br>
&gt;&gt;=C2=A0 FILES:${PN}-rustdoc =3D &quot;${bindir}/rustdoc&quot;<br>
&gt;&gt;=C2=A0 FILES:${PN}-tools-clippy =3D &quot;${bindir}/cargo-clippy ${=
bindir}/clippy-driver&quot;<br>
&gt;&gt;=C2=A0 FILES:${PN}-tools-rustfmt =3D &quot;${bindir}/rustfmt&quot;<=
br>
&gt;&gt; +FILES:${PN}-zsh-completion =3D &quot;${datadir}/zsh&quot;<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 RDEPENDS:${PN}-rustdoc =3D &quot;${PN}&quot;<br>
&gt;&gt;=C2=A0 RDEPENDS:${PN}-tools-clippy =3D &quot;${PN}&quot;<br>
&gt;&gt;=C2=A0 RDEPENDS:${PN}-tools-rustfmt =3D &quot;${PN}&quot;<br>
&gt;&gt; @@ -252,6 +258,10 @@ rust_do_install() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 rust_runx install<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt; +rust_do_install:append:class-native () {<br>
&gt;&gt; +=C2=A0 =C2=A0 rm -f ${D}${bindir}/cargo<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 rust_do_install:class-nativesdk() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 export PSEUDO_UNLOAD=3D1<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 rust_runx install<br>
&gt;&gt; --<br>
&gt;&gt; 2.49.0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#218510): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/218510" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/218510</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11356544=
9/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/113565449/1686489</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000ffc9ce06376033db--

