Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E06EC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 11:07:24 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.10185.1749726434577336195
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 04:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AjhepeNw;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fadb9a0325so7460146d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 04:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749726433; x=1750331233; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qaLWqvpBmfWNdkJzGzKeyGkERZMOc0Hysn3ITVOEFQs=;
        b=AjhepeNwn6Ldyn59YWhFNQqiDNsT6gRSqGIfgRc/2wbAnKdREyO2TS4osJzkaHJVj6
         iHk3ebH2EArm0Z0hjmLtZnBo27/2zBXcepX4AKIz4gKaQBGKBIH0i6zituz2TiSn7Q7d
         FbVKf4PTokR0nwfPhTL0gxflhc4dB7MoBfEa1pXohfUhsI7D8/HperO1gXQ43JDhVSWP
         5oFssmO/61U671htztGVDeo5iJ4jzdgbxqrGlVj/7pWWgZA+SYzUJTA/e3KRC0ZTWXYl
         zz7yJeHoESWa/9uB3nX2P6jnSyU6Q7P2K+minN20/Vwag0cKTv+20iz302z8IAM9zeOg
         tU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749726433; x=1750331233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaLWqvpBmfWNdkJzGzKeyGkERZMOc0Hysn3ITVOEFQs=;
        b=eGmjNfD0wsaPAH2o80+Cz2JSruFlJWPpdkumz0Y0ae2zAN6+nAlbxC47an1T+S5OWg
         /mulhGCLBArWiRx76cqOuJuO6mxs62j5PihUPTXaRNzgVjaAEtnKfS6o2qIybpF82Vh0
         Ppj3avMY612R6qV2pGwFa8ldit/aQq8x1wqVJrGmL6A0KNEYcaLWApMU7LPeEAKPoZ2W
         1Uvh0R0dtkADHym9Qe8/4bhBFoOJX/TwZnfLqj/jzf9QyXOQzuMqbXMOSBybTO9rJqUu
         4mh1/ySWgh+SYZGfZSj6l1W/KHD29uadMCqbQJc/12RgQhyFl0OG6QYYCjpE2e6V4SYF
         djKA==
X-Forwarded-Encrypted: i=1; AJvYcCX4m1G9isDyiZrk3TupcJCG5K7X04XXMDEyX1+ra5mZ5MAYei4621xKNs+1I6WP9lQcxORg2xnrccZUK6GD6qkM/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHHozqbT2M27RtNNdZZelNuOsIIwh5hs3bBoY5/s2wR7h+VEZ4
	Cw3TFLXEEXl5KOxgMoSSb+NvvezOtfQzOa0fVbxDD/2ZpSgE0mcu+VroofuyEdz6EXYJlMdXURb
	kOMGtbo6yYVwHmjVnqUtO8CK0mQYtmRMniw==
X-Gm-Gg: ASbGncuLpPSrxIyfXo5mxe7D+OxOZaKJzKSKPr5Y75C2eZeCXvcK6V/dDQnCSp+GAHv
	yHdvPN0LUGkdWv4/2ddtaPSq44tzcpLUXTH7AoLoFOCEkUkN7VGEMoPfYK+5KmieXx+M3+Yx5m6
	8ipAPWNfRUUP8LfEzwi/zcUAda+qWcIf68RWDZag275prXhDwX083aGIYeYGpO4cO/wJbEyNy0l
	nSIAgvQlcIT0P5d
X-Google-Smtp-Source: AGHT+IH22Dx+yWMLUWNHUzX7qhD3/DpZth21bnAomeXIRW620e7J1gL4m+j10dS0xqKW8mfpyF3I5IgJe9X1zaRV2IY=
X-Received: by 2002:a05:6214:cc1:b0:6f6:e701:9612 with SMTP id
 6a1803df08f44-6fb34658e4amr52576326d6.34.1749726432474; Thu, 12 Jun 2025
 04:07:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250610061954.2344667-1-Yash.Shinde@windriver.com> <CANPvuRk-iXr1hoLXEBFGCahezTV_VOvD8uu+_WuD5eBb+8Ms-A@mail.gmail.com>
In-Reply-To: <CANPvuRk-iXr1hoLXEBFGCahezTV_VOvD8uu+_WuD5eBb+8Ms-A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 12 Jun 2025 13:07:00 +0200
X-Gm-Features: AX0GCFuxUFe4HoA5Z8OA_PVf6O4tfW2D0-9kTY2JWxk2wvZZl7dfq4EuIQIELe4
Message-ID: <CANNYZj86fwAXSbv229KdOsKssH2t3XQRMez_xyayKdE7rWcToA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Upgrade 1.85.1->1.86.0
To: quaresma.jose@gmail.com
Cc: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	sunilkumar.dora@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 11:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218511

Please trim unneeded lines when replying so I don't have to put my reply on=
 top.

That ship has already sailed. Rust package already depends on gcc and
binutils, both gplv3.

Alex

On Thu, 12 Jun 2025 at 13:02, Jose Quaresma via lists.openembedded.org
<quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>
> Hi Yash,
>
> Yash Shinde via lists.openembedded.org <Yash.Shinde=3Dwindriver.com@lists=
.openembedded.org> escreveu (ter=C3=A7a, 10/06/2025 =C3=A0(s) 07:20):
>>
>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>
>> Rust stable version updated to 1.86.0.
>> https://blog.rust-lang.org/2025/04/03/Rust-1.86.0.html
>>
>> * Add pkgconfig-native and openssl to resolve openssl-sys crate
>> dependency on pkg-config. As per rust document this is a required depend=
ency.
>>
>> Fixes:
>> | error: failed to run custom build command for `openssl-sys v0.9.106`
>> | Could not find openssl via pkg-config:
>> |   The pkg-config command could not be found.
>> |
>> |   Most likely, you need to install a pkg-config package for your OS.
>> |   Try `apt install pkg-config`, or `yum install pkg-config`,
>> |   or `pkg install pkg-config`, or `apk add pkgconfig` depending on you=
r distribution
>>
>> https://crates.io/crates/openssl-sys/0.9.108/dependencies
>> https://github.com/rust-lang/rust/blob/master/INSTALL.md#dependencies
>>
>> * Add Ninja as a dependency for building Rust to prevent bootstrap
>>   build regression.
>>
>> Fixes:
>> | Building LLD for x86_64-unknown-linux-gnu
>> |
>> | Couldn't find required command: ninja (or ninja-build)
>> |
>> | You should install ninja as described at
>> | <https://github.com/ninja-build/ninja/wiki/Pre-built-Ninja-packages>,
>> | or set `ninja =3D false` in the `[llvm]` section of `config.toml`.
>> | Alternatively, set `download-ci-llvm =3D true` in that `[llvm]` sectio=
n
>> | to download LLVM rather than building it.
>>
>> * Add bash to DEPENDS to resolve missing dependency for subtree-sync.sh
>> Fixes:
>> ERROR: rust-1.86.0-r0 do_package_qa: QA Issue: /usr/lib/rustlib/src/rust=
/library/portable-simd/subtree-sync.sh
>> contained in package rust requires /bin/bash, but no providers found in =
RDEPENDS:rust? [file-rdeps]
>
>
> Can you patch the subtree-sync.sh to use /bin/sh and see if it works well=
?
> Otherwise this will make any image that use rust be licensed with GPLv3
>
> Jose
>
>>
>>
>> * Add do_install:append() task to remove cargo bin from rust native buil=
ds.
>> This resolves the following conflict:
>>
>> Fixes:
>> ERROR: libstd-rs-1.86.0-r0 do_prepare_recipe_sysroot: The file /usr/bin/=
cargo is
>> installed by both rust-native and cargo-native, aborting
>>
>> * Update Unicode-3.0 license checksums.
>> License-Update: Copyright and license files to distributions are updated=
.
>>
>> https://github.com/rust-lang/rust/commit/f9c16997dc016a3ef1456f56df2ab56=
4a1c48cb2
>>   It adds copyright and license files (including HTML versions) to distr=
ibutions,
>>   aligns with license compliance tools like reuse, and ensures all requi=
red
>>   license texts are properly included and formatted.
>>
>> * Disable building of extended Rust tools to reduce build time and files=
ystem usage.
>>   Update config.toml to disable building of extended Rust tools that are=
 not required.
>>   This helps minimize unnecessary build time and filesystem usage.
>>
>> * The "remote-test-server" bin is now generated in stage2-tools-bin dir
>>   rather than stage1. Update the test suite accordingly.
>>
>> * Fix do_package QA issue by packing missing zsh files and directories:
>>
>> Fixes:
>> do_package: QA Issue: rust: Files/directories were installed but not shi=
pped in any package:
>> /usr/share/zsh
>> /usr/share/zsh/site-functions
>> /usr/share/zsh/site-functions/_cargo
>> Please set FILES such that these items are packaged. Alternatively if th=
ey are unneeded,
>> avoid installing them or delete them within do_install
>>
>> * From v1.86.0, a "self-contained" LLD is built as part of rust
>>  bootstrap build. This results in additional build time and
>>  installations. Disable rust-lld in config.toml to prevent it.
>>
>>  References: https://github.com/rust-lang/rust/pull/135001
>>              https://github.com/rust-lang/rust/commit/8744b44e6bde053f76=
56a3c727c968177ee8e4b6
>>
>> * Drop Zdual-proc-macros-additional-check.patch patch
>>  since it's merged with v1.86.0
>>  https://github.com/rust-lang/rust/commit/139d6ba054a1a4cc5fe64981ad46fd=
5547bd4916
>>
>> * LTO config is applied to rustdoc from v1.86.0.
>>  Rebase 0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
>>  which disables it to avoid suffixes in binaries causing non-reproducibi=
lity.
>>  https://github.com/rust-lang/rust/commit/1fe351b
>>
>> * Restrict tests using "//@only <target_arch>" to avoid failures on risc=
v64,
>>   which is now part of default AB testing. Since riscv64 is Tier 2
>>   with no automated testing, some tests may fail. This approach ensures =
tests continue
>>   running on supported architectures while skipping them on riscv64.
>>   https://doc.rust-lang.org/rustc/platform-support.html#tier-2-with-host=
-tools
>>
>> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> ---
>> v2: Drop llvm-tblgen installation.
>>
>>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>>  meta/lib/oeqa/selftest/cases/rust.py          |  2 +-
>>  .../rust/{cargo_1.85.1.bb =3D> cargo_1.86.0.bb} |  0
>>  ...l-codes-on-riscv32gc-unknown-linux-g.patch | 32 -------
>>  ...teps-tool.rs-switch-off-lto-for-rust.patch | 54 +++++++++---
>>  .../Zdual-proc-macros-additional-check.patch  | 31 -------
>>  .../rust/files/rust-oe-selftest.patch         | 85 +++++++++++--------
>>  ...ibstd-rs_1.85.1.bb =3D> libstd-rs_1.86.0.bb} |  2 +-
>>  ....85.1.bb =3D> rust-cross-canadian_1.86.0.bb} |  0
>>  ...ust-llvm_1.85.1.bb =3D> rust-llvm_1.86.0.bb} |  4 +-
>>  meta/recipes-devtools/rust/rust-snapshot.inc  | 78 ++++++++---------
>>  meta/recipes-devtools/rust/rust-source.inc    |  3 +-
>>  .../rust/{rust_1.85.1.bb =3D> rust_1.86.0.bb}   | 18 +++-
>>  13 files changed, 152 insertions(+), 159 deletions(-)
>>  rename meta/recipes-devtools/rust/{cargo_1.85.1.bb =3D> cargo_1.86.0.bb=
} (100%)
>>  delete mode 100644 meta/recipes-devtools/rust/files/Zdual-proc-macros-a=
dditional-check.patch
>>  rename meta/recipes-devtools/rust/{libstd-rs_1.85.1.bb =3D> libstd-rs_1=
.86.0.bb} (95%)
>>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.1.bb =3D> r=
ust-cross-canadian_1.86.0.bb} (100%)
>>  rename meta/recipes-devtools/rust/{rust-llvm_1.85.1.bb =3D> rust-llvm_1=
.86.0.bb} (96%)
>>  rename meta/recipes-devtools/rust/{rust_1.85.1.bb =3D> rust_1.86.0.bb} =
(96%)
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dis=
tro/include/tcmode-default.inc
>> index f0443fbdc6..e943ca77d1 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>>  GCCVERSION ?=3D "15.%"
>>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>>  GLIBCVERSION ?=3D "2.41%"
>> -RUSTVERSION ?=3D "1.85.1%"
>> +RUSTVERSION ?=3D "1.86.0%"
>>
>>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selfte=
st/cases/rust.py
>> index 806ddf6982..d99a58d6b9 100644
>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>> @@ -104,7 +104,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
>>              # Copy remote-test-server to image through scp
>>              host_sys =3D get_bb_var("RUST_BUILD_SYS", "rust")
>>              ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, use=
r=3D"root")
>> -            ssh.copy_to(builddir + "/build/" + host_sys + "/stage1-tool=
s-bin/remote-test-server","~/")
>> +            ssh.copy_to(builddir + "/build/" + host_sys + "/stage2-tool=
s-bin/remote-test-server","~/")
>>              # Execute remote-test-server on image through background ss=
h
>>              command =3D '~/remote-test-server --bind 0.0.0.0:12345 -v'
>>              sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKnownHostsFil=
e=3D/dev/null', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@%s" % qemu=
.ip, command), shell=3DFalse, stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess=
.PIPE)
>> diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb b/meta/recipes-d=
evtools/rust/cargo_1.86.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/cargo_1.85.1.bb
>> rename to meta/recipes-devtools/rust/cargo_1.86.0.bb
>> diff --git a/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-cod=
es-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/rust/files/00=
01-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
>> index b3a95f2e24..82edd71206 100644
>> --- a/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-r=
iscv32gc-unknown-linux-g.patch
>> +++ b/meta/recipes-devtools/rust/files/0001-Define-more-ioctl-codes-on-r=
iscv32gc-unknown-linux-g.patch
>> @@ -18,38 +18,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>   .../src/unix/linux_like/linux/arch/generic/mod.rs           | 4 +++-
>>   6 files changed, 14 insertions(+), 6 deletions(-)
>>
>> -diff --git a/vendor/libc-0.2.158/.cargo-checksum.json b/vendor/libc-0.2=
.158/.cargo-checksum.json
>> -index 636165bc0..dc86fd0db 100644
>> ---- a/vendor/libc-0.2.158/.cargo-checksum.json
>> -+++ b/vendor/libc-0.2.158/.cargo-checksum.json
>> -@@ -1 +1 @@
>> --{"files":{"CHANGELOG.md":"96fb278d188e87842fe2701f91e0f757665b44dc2e54=
9accb6ed1ed6eeb67602","CONTRIBUTING.md":"a93fcda0a76e1975fcfb0aa2ba00c9b186=
4f9ae6062704a294d81a3688898e10","Cargo.toml":"2196e21d3fd56b3019e235720a32b=
4e3c8ada82c08cb01c06c695752201396df","LICENSE-APACHE":"62c7a1e35f56406896d7=
aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256=
f56a8932dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"4da2919bb5=
09f3f06163778478494f780ca6627cb79ccab5d2c828c8d88dc133","build.rs":"5438723=
0fed8d16f1169a845e92a1c1a5d9227559acbf3bfa383c7901b2d1be8","rustfmt.toml":"=
eaa2ea84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixe=
d_width_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b=
8dca0ca","src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205f=
d39ada97075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ff=
ff768e60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"a8e3ff551e5f=
f4247ab1faa1b7ca1e042046a619198e8b30fe183c6ef8485d65","src/fuchsia/no_align=
.rs":"303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","sr=
c/fuchsia/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91=
ed4811293b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5=
fe689e0f38d8aa2ec5852255ac87","src/hermit.rs":"ad1e8685edf3f3a7c141ccc0e82d=
44b7feb13e81f2f59ed6aeb6e4964524637c","src/lib.rs":"7f57f05b3d9e1e14a666aab=
bd942cf5959e778966981e604087774d56eb059c8","src/macros.rs":"5f985b3de7b1883=
3f866bf832b8ffb0430f0f70aa9a468b6a2c855c1bf9d33e4","src/psp.rs":"0a7d5121a8=
cc2903009f586c00e4ae2d6126d24eb90531dafaba6f59823aa6b2","src/sgx.rs":"16a95=
cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/solid/aar=
ch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42ab7f8707"=
,"src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9cf4f1f487=
2097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856dddbdc0ca=
3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8572d00e1=
e11a39e6f7289a1349aadce90edba","src/teeos/mod.rs":"ecf8922923fb7541ef7b0813=
cdc5418b75be56247c4dbdbb7dca58a076f25b97","src/unix/aix/mod.rs":"91de34bf82=
37e4998e10f9274471d14fb9a31ac6f2ef6e44689066b8e280b3d3","src/unix/aix/power=
pc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8296f8e10d55169b"=
,"src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceee=
c56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9=
ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"254=
6ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bs=
d/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fe=
f7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263=
afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b=
64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e=
26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca=
0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec83=
3a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd=
/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b=
3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819=
dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"4=
84698da7c1083a46ae1a389486a8c2d75e3e6ecb4f80ded69b6c0dd2d1a92a0","src/unix/=
bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3=
b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"27=
77f94909a798df1b8030fb86d02e2118d0ac3e49e9a542df54a569ca5ae2f9","src/unix/b=
sd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4=
b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a=
670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/=
freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930=
da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/m=
od.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec722ba80dac1f","=
src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b=
686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebs=
d/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e60665a4d49a4a9e=
79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7=
f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f2=
5c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod=
.rs":"88be47524b28b6635ccb1e85ea511bf17337be0af7e9baa740c341ac9e83a6f7","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cf=
b4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freeb=
sd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2a=
fe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"6ddc6abf6=
d5ccaea0d8cccf521e8ca6457efcad3086af4155628d5d06d672346","src/unix/bsd/free=
bsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0fbe71690fad909e=
899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebsd/freebsd15/b6=
4.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd15/mod.rs":"93115c1a9faa43ebf58b7dee=
3582aed5a54291b284764e370e7f649b2e6a9565","src/unix/bsd/freebsdlike/freebsd=
/freebsd15/x86_64.rs":"e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbc=
a117e4fcb650","src/unix/bsd/freebsdlike/freebsd/mod.rs":"08e39a42392936857f=
d0c1c6b01788f5630fe8ff7f78b062490509c5dd816a42","src/unix/bsd/freebsdlike/f=
reebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da582049=
2bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87eac3b=
11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebsdlik=
e/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089551a04714f956107=
8e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"2837fed0ffee0ec443=
ecdb743b7142bcb4d6ba2de87e05459fb4498789d47200","src/unix/bsd/freebsdlike/f=
reebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096=
cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"e4d76219b=
ec0621db07dec37de9be1a9b7fb38daa10ffc1a6adbdbc34e163435","src/unix/bsd/free=
bsdlike/mod.rs":"c846f30eaffc7c1a21b4acd3df75cd17bb3d4f11401c9a9770924e4e6d=
847995","src/unix/bsd/mod.rs":"37765749481f7d0dec8681d8c9d0735e6021094b4ef4=
a2d9aab5643d7a4232e1","src/unix/bsd/netbsdlike/mod.rs":"ea60540aa4edd4e4313=
6749d5df497b1dc072b9912b6030dd1ab794a6d1c3c3c","src/unix/bsd/netbsdlike/net=
bsd/aarch64.rs":"057ee877db7193ba0dc10801b9a6563ac6dbdb78376d6851a84cb12b30=
841759","src/unix/bsd/netbsdlike/netbsd/arm.rs":"949b55e4dee1c8c511f4f061a6=
a57ac876a6c0eabfaf5cc20e9ab40d8f41b2e0","src/unix/bsd/netbsdlike/netbsd/mip=
s.rs":"88be18ac43ba224c77e78e4179b6761debc5e6c30a258fac56263809c7af4fbc","s=
rc/unix/bsd/netbsdlike/netbsd/mod.rs":"ab09cea2897ecd27fc7e35822dac23d6dcd5=
3f8577c771db3ee8b015e8d82001","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"=
ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix=
/bsd/netbsdlike/netbsd/riscv64.rs":"1cbe2e5ed681cb1054b699da37daaf6c714267d=
f7d332c90fc2a589b11579625","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"948=
9f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src/unix/bs=
d/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda1=
67376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"532b76199d6=
c71ff996eade9f906c55a72c9aff489595d25a21e21878cfd740b","src/unix/bsd/netbsd=
like/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdf=
f3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.rs":"01580d261bc6447b=
b327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/=
openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e09bd39442c9f74a7f23=
1c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"7b93b5b24b3c72a79b2de1=
9b47ac2f56b29d87e9fc8f4c721a63d1e87ec83fcc","src/unix/bsd/netbsdlike/openbs=
d/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729a=
d307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ff=
deeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openb=
sd/riscv64.rs":"1fe3332dc705a13e6242219970f5449d6d7a73e2e6c8537ab8e421d8a6f=
2e3ff","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48=
c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbs=
d/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87=
","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289c85af3339dbe357=
998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs":"a2efdbf7158a=
6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","src/unix/haiku/b64.r=
s":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf4681f91ff7985","src/=
unix/haiku/mod.rs":"b75976d84bdf4a3a226336bb06ec231d552240f302bb5da48ead692=
fd72758f9","src/unix/haiku/native.rs":"2b1f88c043777a915bb7218aa05a3647a0e0=
481ebff55a99e351c45dea2be8de","src/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b89=
16f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/hurd/align.rs":"=
03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src/unix=
/hurd/b32.rs":"2ba90ed973f90366c36a6387833a3df42abfee9622d4a0352635937d4a89=
eaf4","src/unix/hurd/b64.rs":"d919b4aec9b3080ad24c125c57b2c8b2e483d72045f15=
54c429d14560355846f","src/unix/hurd/mod.rs":"23ebadfdb9a92d7fb9e32b6a7c9566=
9ce979ba7407b924869f40a59d2807d052","src/unix/hurd/no_align.rs":"03c79b2cd8=
270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src/unix/linux_lik=
e/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee=
9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a3=
081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android=
/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c581=
5320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85=
dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/androi=
d/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9=
e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6=
f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux=
_like/android/b64/aarch64/mod.rs":"873af67c4a9757ead56bc797d04efcecd311ecbf=
0084ebdd198fb690463ef299","src/unix/linux_like/android/b64/mod.rs":"7b8efbd=
61ab965c93bacfab78108ff8eed38af07b119099020dc41a9d0901559","src/unix/linux_=
like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b5164=
45e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs"=
:"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/un=
ix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5=
d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/=
mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1",=
"src/unix/linux_like/android/mod.rs":"384275dc1d3559a9f83559b6c903758a9dc4c=
4b3d13db48d23ed4fdc3c0ff8da","src/unix/linux_like/emscripten/align.rs":"86c=
95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/li=
nux_like/emscripten/lfs64.rs":"3776af30a758d765a88920ec4fde442ab89040da13d3=
b3625c7fbcb8a958559f","src/unix/linux_like/emscripten/mod.rs":"70d4591730a7=
31ee32788a9d8d2de379592844ec36b7d1723514179605587713","src/unix/linux_like/=
emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a=
85d35b1051fad6","src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e098=
1e773c9c5fe3e0d5a66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arc=
h/generic/mod.rs":"3ab533349696d24505adb6bb9183d73fd5e3b17e2f90dd21478af2a4=
7b4d6fa8","src/unix/linux_like/linux/arch/mips/mod.rs":"ca3db0e3ae852abf18f=
3588e40d5d64707fcc1829e08ddc5da1080e1a92c8851","src/unix/linux_like/linux/a=
rch/mod.rs":"5bd5361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf1=
98","src/unix/linux_like/linux/arch/powerpc/mod.rs":"0bc2d2667a00eca81f4abe=
b6d613a90848a947f51224103f83268928b8197629","src/unix/linux_like/linux/arch=
/sparc/mod.rs":"5e6777863e74a9e2aa9dc487f1059783dd211babc2b32d6bf676f311e49=
c55d6","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb0=
5bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/=
arm/align.rs":"6ec0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899=
cdeb","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"f68ec59b6407f9d4e326f=
3e71a41ec21f19ecfc703edf9a93e496f661fed5506","src/unix/linux_like/linux/gnu=
/b32/csky/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cd=
bae25f039d","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"8729b68e433e94=
c2128e51a7db4fd555938e4be4dc64584c352b24a20d9c8e91","src/unix/linux_like/li=
nux/gnu/b32/m68k/align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c9179=
1570a203bf2b45bcb","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"80956d3=
fef163ecf248828a6f38782dd8ae856d86b1bb5aac2de36032dbd8ea0","src/unix/linux_=
like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"=
96e22350d5d132d917c743d6560464500652c67b52c3d0e8474494487df3365d","src/unix=
/linux_like/linux/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddc=
bf8a3481d598d101f8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"2=
0fc3cc4fe1ef6617b63b61b897f782ceb9c2842fc718f504a1840537229bf47","src/unix/=
linux_like/linux/gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111be=
b3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv=
32/mod.rs":"887288a0a1cfff319d0e15edcdc4fcb31fd643ff41715ec5244c8f241362416=
9","src/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed9=
34aaf733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gn=
u/b32/sparc/mod.rs":"cc4342b949e4d796f304acd9dfe3f721a1c2f37fec16b42d3bb27d=
c94723af37","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a=
7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/l=
inux/gnu/b32/x86/mod.rs":"06d4db4ee8352f62a0a5ead0c4d6ea0a78feff522f19b9bc5=
772f6dd920ffd80","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1=
c72375a2167699157e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/lin=
ux_like/linux/gnu/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32=
ca22378e42392ab83c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch=
64/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68=
e29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d=
20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/lin=
ux/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed=
4faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"820=
2614484da36c388d2ffdd2554c56bb4f9db8e5bd621f8c36114cdcfeec644","src/unix/li=
nux_like/linux/gnu/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c=
5729e551458ce18d0e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loo=
ngarch64/mod.rs":"10f025edecebc6e0ed8fdae4736ebe7564189741d5b910433f07c21fc=
12a94d8","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd47=
16f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/l=
inux/gnu/b64/mips64/mod.rs":"73532be4b5775acf9524c77feeefe1f6d1936ceffef908=
d01dd2586986520f2d","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef2543=
9c4fecdb0e3bd0b818742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like=
/linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a46=
8cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod=
.rs":"a90c2641616c620e9d1fea87695ce046e14f9da2282bb93f761eeb4077c74741","sr=
c/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"fe7e3c928d0367c37eb65268=
6591801c3694a3558ebbbeb5c22be692265d07f2","src/unix/linux_like/linux/gnu/b6=
4/riscv64/mod.rs":"dec86883731f7b8419bff35b125b40eefc927090c1510f6daf931726=
f7965c0b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"1ea9e39432ce6bf6877=
9d33546dacd7d39477a9f8fc3da4f4f339e4538cb74c3","src/unix/linux_like/linux/g=
nu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df8=
3f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"bed381=
c44cec2a5b50125f7e548ab487d4c829006c971d152a611b7141760052","src/unix/linux=
_like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b89393=
9ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.=
rs":"332846e4a5920d7e6b05df0448a2333c5dd00fb27cb33654648f507ee89dbec5","src=
/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a=
2b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b6=
4/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9daf=
edaaebb","src/unix/linux_like/linux/gnu/mod.rs":"8d11f66db9993e9a89c86fec3b=
732d9c0ec4ee42d9570d4e3389c075021dd29f","src/unix/linux_like/linux/gnu/no_a=
lign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25"=
,"src/unix/linux_like/linux/mod.rs":"da8c17828415fc1db81fb547fe20b7421774a3=
bdd3e79053cc127a3031e59302","src/unix/linux_like/linux/musl/b32/arm/align.r=
s":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/=
unix/linux_like/linux/musl/b32/arm/mod.rs":"af10147d7c3661751750a58ffad089d=
5d18d180cd18303c653aef126c07ccd91","src/unix/linux_like/linux/musl/b32/hexa=
gon.rs":"d079cab42529f7dab699334d43168c74ff4aa0282f11040a8b7d274b65767a7a",=
"src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430=
098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/=
b32/mips/mod.rs":"e44043766f7cd26de7ffa4232654afb6feb03e58dbd5890717970887b=
d003151","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1=
477628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/mus=
l/b32/powerpc.rs":"3dae56a4e7789bcc5314e419fea5e4b2495367b4f1a49d1c9477c602=
25d65eef","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33=
b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_lik=
e/linux/musl/b32/riscv32/mod.rs":"3ee845d272f91a1908d5f421d7c353e1f14681bbd=
fef64410e408f4c14365a91","src/unix/linux_like/linux/musl/b32/x86/align.rs":=
"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/uni=
x/linux_like/linux/musl/b32/x86/mod.rs":"f2b53ae0034c833244b7cdb8c670349bf8=
272a03abf04152eba65cf62810484d","src/unix/linux_like/linux/musl/b64/aarch64=
/align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe9656132915182982113=
3","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d2=
0dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linu=
x/musl/b64/aarch64/mod.rs":"45ce6897afcc960267bb7505702b639daf94dc69428a213=
bf1aefd367ca32adc","src/unix/linux_like/linux/musl/b64/loongarch64/align.rs=
":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0d45f39beeb60","src/u=
nix/linux_like/linux/musl/b64/loongarch64/mod.rs":"3d9ef92e682a1789544a2bd2=
0cad5a5623db9d7d9f5d0a3692bb0230af034165","src/unix/linux_like/linux/musl/b=
64/mips64.rs":"a968ef9c54fa22293085f318c8472c1754482df92cc500568dc33bd807d7=
1ea6","src/unix/linux_like/linux/musl/b64/mod.rs":"20ceaf90a03c24a2eb154a5d=
ffbfc9a538348404db5b554a3d8126021ba45509","src/unix/linux_like/linux/musl/b=
64/powerpc64.rs":"140e579800a67315f4cb8a42b22aa8157eae34ffe626e77e421b43c53=
c23b34d","src/unix/linux_like/linux/musl/b64/riscv64/align.rs":"fe7e3c928d0=
367c37eb652686591801c3694a3558ebbbeb5c22be692265d07f2","src/unix/linux_like=
/linux/musl/b64/riscv64/mod.rs":"c5944526d7e19cd43e9d14d119a1d98f8780db7ecb=
cc79e69d7b9348e596b520","src/unix/linux_like/linux/musl/b64/s390x.rs":"8557=
b3477ca8cefef7fce764a3c25441929a54e50ead4091f6f7823c427cd728","src/unix/lin=
ux_like/linux/musl/b64/x86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a1=
43aded05555b34a5b307b808cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/=
mod.rs":"a91c4f18027c9958037f78ae48f6352d23cb4e6f2995b2cc8de7dce0e5759470",=
"src/unix/linux_like/linux/musl/lfs64.rs":"3e4fb381f3a0756520bde0f1692d4fa4=
5e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/linux_like/linux/musl/mod.rs":"=
94dd7eb5064230637ccd135383c7d30f8d3f7874c22771b24b529e58de421731","src/unix=
/linux_like/linux/no_align.rs":"62cdca0e011937aaf09a51ca86d9f0ee0fdb05f61ec=
3c058e6a5d5fa6357d784","src/unix/linux_like/linux/non_exhaustive.rs":"181a0=
5bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19=
c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0=
afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb5=
3f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e475326=
7a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"6efae7ed90=
6bc5773dcce43ba1045cf93df5f8dac41f194d8cddc0579f14c015","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"8485=
b9182b7c67f7344fab377e7cc2a72afefd9ab63837c860514abba9728d76","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"e7197f0f68ece174c8ae42b2b9115893abfcdb=
e44a1a6ed98fb3cbd7bfe087e8","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"863f628cbaa864911ffebc58e9fb788b6c6a9651955fc401a=
c1f40f20eb62505","src/unix/mod.rs":"5f851ce1756443b9219edd11b6cc2abfb4031a2=
2a6496bb5d4d6090f97779f8a","src/unix/newlib/aarch64/mod.rs":"964c096288da83=
6b53c0c71d7f3a97048d177da220a69314c5ce93ba330d72af","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"cf754f8b1197489fca01e881a4b4b146e814998e4b365f116=
fa1a102c00e6a4e","src/unix/newlib/espidf/mod.rs":"689e29a9fff5a263e5ab8410d=
0a8919f77fa64aa12f4d71f71085a6f07f19f67","src/unix/newlib/generic.rs":"5f0b=
5d07ddb5a5d60580f9561fdb05e9218d9751d4068c4aadad2ba6b950aabf","src/unix/new=
lib/horizon/mod.rs":"3a521d22bf932fc01c1d26d1f9bff20f11b1855b03c8236a8eb183=
10f6cab5a8","src/unix/newlib/mod.rs":"e5d5faf27a6336b9f1c02b8726427801d906a=
14dae766852b4e85c1a92df06c8","src/unix/newlib/no_align.rs":"e0743b2179495a9=
514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc=
/mod.rs":"cc9e188711b9bf614323ad6c48e0d2e1a1ecc5d3bc64961ba451f29c6c22d2d8"=
,"src/unix/newlib/vita/mod.rs":"ff1caf74bb0696fe15d60dbac598db4520cd538aa0f=
5989713d97d008eee6ad8","src/unix/no_align.rs":"c06e95373b9088266e0b14bba095=
4eef95f93fb2b01d951855e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc=
8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.r=
s":"5eb045c352114f5d744d098acaf9e47a9223f6fccd43f36b9a3ba79b29af0eee","src/=
unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485=
bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07ae=
fb73d8ea2aafec19a84cfb040bc8e","src/unix/redox/mod.rs":"e75a319975472fe9e08=
73244fb07c5d2004672b7a4cf7a3cb01532d6d394cb8a","src/unix/solarish/compat.rs=
":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/u=
nix/solarish/illumos.rs":"26171da367221de1e456f1236250b5831a770d6f109ed12b0=
ebe4d508e490194","src/unix/solarish/mod.rs":"c0c5dfc406d728666010cdc2fe21b0=
df40547ed20dd7ad0eab65906e103b6d4b","src/unix/solarish/solaris.rs":"41b350a=
89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solari=
sh/x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522=
e","src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e0309=
8f3ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645=
c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs"=
:"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vx=
works/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d78=
8e88","src/vxworks/mod.rs":"ccdb6a6e0c12011705a15dadc04b26882e6090db4403af4=
d15cad9330ef96370","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133=
d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511=
cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs"=
:"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vx=
works/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98e=
d6b514a","src/wasi.rs":"51e38bb98547c40d0822d31975c976cd6e0784463d90d170109=
c87bf324395d3","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff=
9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0=
c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"9f=
dc5e1c62c441abef7bc62a7343efb2041edc24db9ac0efc0f74df55b69e249","src/window=
s/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf=
986f4","src/xous.rs":"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49=
250f3d65fae","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c2=
0a394e7774c7e545f21f1f4"},"package":"d8adc4bb1803a324070e64a98ae98f38934d91=
957a99cfb3a43dcbc01bc56439"}
>> -\ No newline at end of file
>> -+{"files":{"CHANGELOG.md":"96fb278d188e87842fe2701f91e0f757665b44dc2e54=
9accb6ed1ed6eeb67602","CONTRIBUTING.md":"a93fcda0a76e1975fcfb0aa2ba00c9b186=
4f9ae6062704a294d81a3688898e10","Cargo.toml":"2196e21d3fd56b3019e235720a32b=
4e3c8ada82c08cb01c06c695752201396df","LICENSE-APACHE":"62c7a1e35f56406896d7=
aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256=
f56a8932dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"4da2919bb5=
09f3f06163778478494f780ca6627cb79ccab5d2c828c8d88dc133","build.rs":"5438723=
0fed8d16f1169a845e92a1c1a5d9227559acbf3bfa383c7901b2d1be8","rustfmt.toml":"=
eaa2ea84fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixe=
d_width_ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b=
8dca0ca","src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205f=
d39ada97075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ff=
ff768e60f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"a8e3ff551e5f=
f4247ab1faa1b7ca1e042046a619198e8b30fe183c6ef8485d65","src/fuchsia/no_align=
.rs":"303f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","sr=
c/fuchsia/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91=
ed4811293b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5=
fe689e0f38d8aa2ec5852255ac87","src/hermit.rs":"ad1e8685edf3f3a7c141ccc0e82d=
44b7feb13e81f2f59ed6aeb6e4964524637c","src/lib.rs":"7f57f05b3d9e1e14a666aab=
bd942cf5959e778966981e604087774d56eb059c8","src/macros.rs":"5f985b3de7b1883=
3f866bf832b8ffb0430f0f70aa9a468b6a2c855c1bf9d33e4","src/psp.rs":"0a7d5121a8=
cc2903009f586c00e4ae2d6126d24eb90531dafaba6f59823aa6b2","src/sgx.rs":"16a95=
cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/solid/aar=
ch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42ab7f8707"=
,"src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9cf4f1f487=
2097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856dddbdc0ca=
3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8572d00e1=
e11a39e6f7289a1349aadce90edba","src/teeos/mod.rs":"ecf8922923fb7541ef7b0813=
cdc5418b75be56247c4dbdbb7dca58a076f25b97","src/unix/aix/mod.rs":"91de34bf82=
37e4998e10f9274471d14fb9a31ac6f2ef6e44689066b8e280b3d3","src/unix/aix/power=
pc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8296f8e10d55169b"=
,"src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceee=
c56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9=
ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"254=
6ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bs=
d/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5e7bcb5cdebd5fe=
f7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263=
afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b=
64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e=
26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca=
0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec83=
3a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd=
/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b=
3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819=
dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"4=
84698da7c1083a46ae1a389486a8c2d75e3e6ecb4f80ded69b6c0dd2d1a92a0","src/unix/=
bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3=
b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"27=
77f94909a798df1b8030fb86d02e2118d0ac3e49e9a542df54a569ca5ae2f9","src/unix/b=
sd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4=
b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a=
670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/=
freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930=
da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/m=
od.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec722ba80dac1f","=
src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b=
686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebs=
d/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e60665a4d49a4a9e=
79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7=
f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f2=
5c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod=
.rs":"88be47524b28b6635ccb1e85ea511bf17337be0af7e9baa740c341ac9e83a6f7","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cf=
b4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freeb=
sd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2a=
fe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"6ddc6abf6=
d5ccaea0d8cccf521e8ca6457efcad3086af4155628d5d06d672346","src/unix/bsd/free=
bsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0fbe71690fad909e=
899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebsd/freebsd15/b6=
4.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd15/mod.rs":"93115c1a9faa43ebf58b7dee=
3582aed5a54291b284764e370e7f649b2e6a9565","src/unix/bsd/freebsdlike/freebsd=
/freebsd15/x86_64.rs":"e7b5863e222d6cc416b6b0fbe71690fad909e899b4c4ae810bbc=
a117e4fcb650","src/unix/bsd/freebsdlike/freebsd/mod.rs":"08e39a42392936857f=
d0c1c6b01788f5630fe8ff7f78b062490509c5dd816a42","src/unix/bsd/freebsdlike/f=
reebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da582049=
2bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87eac3b=
11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebsdlik=
e/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089551a04714f956107=
8e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"2837fed0ffee0ec443=
ecdb743b7142bcb4d6ba2de87e05459fb4498789d47200","src/unix/bsd/freebsdlike/f=
reebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f096=
cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"e4d76219b=
ec0621db07dec37de9be1a9b7fb38daa10ffc1a6adbdbc34e163435","src/unix/bsd/free=
bsdlike/mod.rs":"c846f30eaffc7c1a21b4acd3df75cd17bb3d4f11401c9a9770924e4e6d=
847995","src/unix/bsd/mod.rs":"37765749481f7d0dec8681d8c9d0735e6021094b4ef4=
a2d9aab5643d7a4232e1","src/unix/bsd/netbsdlike/mod.rs":"ea60540aa4edd4e4313=
6749d5df497b1dc072b9912b6030dd1ab794a6d1c3c3c","src/unix/bsd/netbsdlike/net=
bsd/aarch64.rs":"057ee877db7193ba0dc10801b9a6563ac6dbdb78376d6851a84cb12b30=
841759","src/unix/bsd/netbsdlike/netbsd/arm.rs":"949b55e4dee1c8c511f4f061a6=
a57ac876a6c0eabfaf5cc20e9ab40d8f41b2e0","src/unix/bsd/netbsdlike/netbsd/mip=
s.rs":"88be18ac43ba224c77e78e4179b6761debc5e6c30a258fac56263809c7af4fbc","s=
rc/unix/bsd/netbsdlike/netbsd/mod.rs":"ab09cea2897ecd27fc7e35822dac23d6dcd5=
3f8577c771db3ee8b015e8d82001","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"=
ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix=
/bsd/netbsdlike/netbsd/riscv64.rs":"1cbe2e5ed681cb1054b699da37daaf6c714267d=
f7d332c90fc2a589b11579625","src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"948=
9f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","src/unix/bs=
d/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda1=
67376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"532b76199d6=
c71ff996eade9f906c55a72c9aff489595d25a21e21878cfd740b","src/unix/bsd/netbsd=
like/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdf=
f3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.rs":"01580d261bc6447b=
b327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/=
openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e09bd39442c9f74a7f23=
1c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"7b93b5b24b3c72a79b2de1=
9b47ac2f56b29d87e9fc8f4c721a63d1e87ec83fcc","src/unix/bsd/netbsdlike/openbs=
d/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729a=
d307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ff=
deeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openb=
sd/riscv64.rs":"1fe3332dc705a13e6242219970f5449d6d7a73e2e6c8537ab8e421d8a6f=
2e3ff","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48=
c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbs=
d/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87=
","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289c85af3339dbe357=
998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs":"a2efdbf7158a=
6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","src/unix/haiku/b64.r=
s":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf4681f91ff7985","src/=
unix/haiku/mod.rs":"b75976d84bdf4a3a226336bb06ec231d552240f302bb5da48ead692=
fd72758f9","src/unix/haiku/native.rs":"2b1f88c043777a915bb7218aa05a3647a0e0=
481ebff55a99e351c45dea2be8de","src/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b89=
16f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/hurd/align.rs":"=
03c79b2cd8270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src/unix=
/hurd/b32.rs":"2ba90ed973f90366c36a6387833a3df42abfee9622d4a0352635937d4a89=
eaf4","src/unix/hurd/b64.rs":"d919b4aec9b3080ad24c125c57b2c8b2e483d72045f15=
54c429d14560355846f","src/unix/hurd/mod.rs":"23ebadfdb9a92d7fb9e32b6a7c9566=
9ce979ba7407b924869f40a59d2807d052","src/unix/hurd/no_align.rs":"03c79b2cd8=
270ebd0cf93cb475a8f1ff85b28175ea0de007ede17cad94a89b03","src/unix/linux_lik=
e/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee=
9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a3=
081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android=
/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c581=
5320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85=
dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/androi=
d/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9=
e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6=
f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux=
_like/android/b64/aarch64/mod.rs":"873af67c4a9757ead56bc797d04efcecd311ecbf=
0084ebdd198fb690463ef299","src/unix/linux_like/android/b64/mod.rs":"7b8efbd=
61ab965c93bacfab78108ff8eed38af07b119099020dc41a9d0901559","src/unix/linux_=
like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b5164=
45e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs"=
:"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/un=
ix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5=
d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/=
mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1",=
"src/unix/linux_like/android/mod.rs":"384275dc1d3559a9f83559b6c903758a9dc4c=
4b3d13db48d23ed4fdc3c0ff8da","src/unix/linux_like/emscripten/align.rs":"86c=
95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/li=
nux_like/emscripten/lfs64.rs":"3776af30a758d765a88920ec4fde442ab89040da13d3=
b3625c7fbcb8a958559f","src/unix/linux_like/emscripten/mod.rs":"70d4591730a7=
31ee32788a9d8d2de379592844ec36b7d1723514179605587713","src/unix/linux_like/=
emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a=
85d35b1051fad6","src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e098=
1e773c9c5fe3e0d5a66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arc=
h/generic/mod.rs":"10577c664dbdd5d1410e53e3872435ad595758bd1deb410b1bce7825=
cd150178","src/unix/linux_like/linux/arch/mips/mod.rs":"ca3db0e3ae852abf18f=
3588e40d5d64707fcc1829e08ddc5da1080e1a92c8851","src/unix/linux_like/linux/a=
rch/mod.rs":"5bd5361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf1=
98","src/unix/linux_like/linux/arch/powerpc/mod.rs":"0bc2d2667a00eca81f4abe=
b6d613a90848a947f51224103f83268928b8197629","src/unix/linux_like/linux/arch=
/sparc/mod.rs":"5e6777863e74a9e2aa9dc487f1059783dd211babc2b32d6bf676f311e49=
c55d6","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb0=
5bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/=
arm/align.rs":"6ec0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899=
cdeb","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"f68ec59b6407f9d4e326f=
3e71a41ec21f19ecfc703edf9a93e496f661fed5506","src/unix/linux_like/linux/gnu=
/b32/csky/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cd=
bae25f039d","src/unix/linux_like/linux/gnu/b32/csky/mod.rs":"8729b68e433e94=
c2128e51a7db4fd555938e4be4dc64584c352b24a20d9c8e91","src/unix/linux_like/li=
nux/gnu/b32/m68k/align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c9179=
1570a203bf2b45bcb","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"80956d3=
fef163ecf248828a6f38782dd8ae856d86b1bb5aac2de36032dbd8ea0","src/unix/linux_=
like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"=
96e22350d5d132d917c743d6560464500652c67b52c3d0e8474494487df3365d","src/unix=
/linux_like/linux/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddc=
bf8a3481d598d101f8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"2=
0fc3cc4fe1ef6617b63b61b897f782ceb9c2842fc718f504a1840537229bf47","src/unix/=
linux_like/linux/gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111be=
b3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv=
32/mod.rs":"887288a0a1cfff319d0e15edcdc4fcb31fd643ff41715ec5244c8f241362416=
9","src/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed9=
34aaf733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gn=
u/b32/sparc/mod.rs":"cc4342b949e4d796f304acd9dfe3f721a1c2f37fec16b42d3bb27d=
c94723af37","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a=
7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/l=
inux/gnu/b32/x86/mod.rs":"06d4db4ee8352f62a0a5ead0c4d6ea0a78feff522f19b9bc5=
772f6dd920ffd80","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1=
c72375a2167699157e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/lin=
ux_like/linux/gnu/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32=
ca22378e42392ab83c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch=
64/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68=
e29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d=
20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/lin=
ux/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed=
4faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"820=
2614484da36c388d2ffdd2554c56bb4f9db8e5bd621f8c36114cdcfeec644","src/unix/li=
nux_like/linux/gnu/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c=
5729e551458ce18d0e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loo=
ngarch64/mod.rs":"10f025edecebc6e0ed8fdae4736ebe7564189741d5b910433f07c21fc=
12a94d8","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd47=
16f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/l=
inux/gnu/b64/mips64/mod.rs":"73532be4b5775acf9524c77feeefe1f6d1936ceffef908=
d01dd2586986520f2d","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef2543=
9c4fecdb0e3bd0b818742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like=
/linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a46=
8cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod=
.rs":"a90c2641616c620e9d1fea87695ce046e14f9da2282bb93f761eeb4077c74741","sr=
c/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"fe7e3c928d0367c37eb65268=
6591801c3694a3558ebbbeb5c22be692265d07f2","src/unix/linux_like/linux/gnu/b6=
4/riscv64/mod.rs":"dec86883731f7b8419bff35b125b40eefc927090c1510f6daf931726=
f7965c0b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"1ea9e39432ce6bf6877=
9d33546dacd7d39477a9f8fc3da4f4f339e4538cb74c3","src/unix/linux_like/linux/g=
nu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df8=
3f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"bed381=
c44cec2a5b50125f7e548ab487d4c829006c971d152a611b7141760052","src/unix/linux=
_like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b89393=
9ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.=
rs":"332846e4a5920d7e6b05df0448a2333c5dd00fb27cb33654648f507ee89dbec5","src=
/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a=
2b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b6=
4/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9daf=
edaaebb","src/unix/linux_like/linux/gnu/mod.rs":"8d11f66db9993e9a89c86fec3b=
732d9c0ec4ee42d9570d4e3389c075021dd29f","src/unix/linux_like/linux/gnu/no_a=
lign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25"=
,"src/unix/linux_like/linux/mod.rs":"da8c17828415fc1db81fb547fe20b7421774a3=
bdd3e79053cc127a3031e59302","src/unix/linux_like/linux/musl/b32/arm/align.r=
s":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/=
unix/linux_like/linux/musl/b32/arm/mod.rs":"af10147d7c3661751750a58ffad089d=
5d18d180cd18303c653aef126c07ccd91","src/unix/linux_like/linux/musl/b32/hexa=
gon.rs":"d079cab42529f7dab699334d43168c74ff4aa0282f11040a8b7d274b65767a7a",=
"src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430=
098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/=
b32/mips/mod.rs":"e44043766f7cd26de7ffa4232654afb6feb03e58dbd5890717970887b=
d003151","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1=
477628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/mus=
l/b32/powerpc.rs":"3dae56a4e7789bcc5314e419fea5e4b2495367b4f1a49d1c9477c602=
25d65eef","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33=
b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_lik=
e/linux/musl/b32/riscv32/mod.rs":"3ee845d272f91a1908d5f421d7c353e1f14681bbd=
fef64410e408f4c14365a91","src/unix/linux_like/linux/musl/b32/x86/align.rs":=
"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/uni=
x/linux_like/linux/musl/b32/x86/mod.rs":"f2b53ae0034c833244b7cdb8c670349bf8=
272a03abf04152eba65cf62810484d","src/unix/linux_like/linux/musl/b64/aarch64=
/align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe9656132915182982113=
3","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d2=
0dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linu=
x/musl/b64/aarch64/mod.rs":"45ce6897afcc960267bb7505702b639daf94dc69428a213=
bf1aefd367ca32adc","src/unix/linux_like/linux/musl/b64/loongarch64/align.rs=
":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0d45f39beeb60","src/u=
nix/linux_like/linux/musl/b64/loongarch64/mod.rs":"3d9ef92e682a1789544a2bd2=
0cad5a5623db9d7d9f5d0a3692bb0230af034165","src/unix/linux_like/linux/musl/b=
64/mips64.rs":"a968ef9c54fa22293085f318c8472c1754482df92cc500568dc33bd807d7=
1ea6","src/unix/linux_like/linux/musl/b64/mod.rs":"20ceaf90a03c24a2eb154a5d=
ffbfc9a538348404db5b554a3d8126021ba45509","src/unix/linux_like/linux/musl/b=
64/powerpc64.rs":"140e579800a67315f4cb8a42b22aa8157eae34ffe626e77e421b43c53=
c23b34d","src/unix/linux_like/linux/musl/b64/riscv64/align.rs":"fe7e3c928d0=
367c37eb652686591801c3694a3558ebbbeb5c22be692265d07f2","src/unix/linux_like=
/linux/musl/b64/riscv64/mod.rs":"c5944526d7e19cd43e9d14d119a1d98f8780db7ecb=
cc79e69d7b9348e596b520","src/unix/linux_like/linux/musl/b64/s390x.rs":"8557=
b3477ca8cefef7fce764a3c25441929a54e50ead4091f6f7823c427cd728","src/unix/lin=
ux_like/linux/musl/b64/x86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a1=
43aded05555b34a5b307b808cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/=
mod.rs":"a91c4f18027c9958037f78ae48f6352d23cb4e6f2995b2cc8de7dce0e5759470",=
"src/unix/linux_like/linux/musl/lfs64.rs":"3e4fb381f3a0756520bde0f1692d4fa4=
5e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/linux_like/linux/musl/mod.rs":"=
94dd7eb5064230637ccd135383c7d30f8d3f7874c22771b24b529e58de421731","src/unix=
/linux_like/linux/no_align.rs":"62cdca0e011937aaf09a51ca86d9f0ee0fdb05f61ec=
3c058e6a5d5fa6357d784","src/unix/linux_like/linux/non_exhaustive.rs":"181a0=
5bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19=
c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0=
afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb5=
3f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e475326=
7a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"6efae7ed90=
6bc5773dcce43ba1045cf93df5f8dac41f194d8cddc0579f14c015","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"8485=
b9182b7c67f7344fab377e7cc2a72afefd9ab63837c860514abba9728d76","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"e7197f0f68ece174c8ae42b2b9115893abfcdb=
e44a1a6ed98fb3cbd7bfe087e8","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"863f628cbaa864911ffebc58e9fb788b6c6a9651955fc401a=
c1f40f20eb62505","src/unix/mod.rs":"5f851ce1756443b9219edd11b6cc2abfb4031a2=
2a6496bb5d4d6090f97779f8a","src/unix/newlib/aarch64/mod.rs":"964c096288da83=
6b53c0c71d7f3a97048d177da220a69314c5ce93ba330d72af","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"cf754f8b1197489fca01e881a4b4b146e814998e4b365f116=
fa1a102c00e6a4e","src/unix/newlib/espidf/mod.rs":"689e29a9fff5a263e5ab8410d=
0a8919f77fa64aa12f4d71f71085a6f07f19f67","src/unix/newlib/generic.rs":"5f0b=
5d07ddb5a5d60580f9561fdb05e9218d9751d4068c4aadad2ba6b950aabf","src/unix/new=
lib/horizon/mod.rs":"3a521d22bf932fc01c1d26d1f9bff20f11b1855b03c8236a8eb183=
10f6cab5a8","src/unix/newlib/mod.rs":"e5d5faf27a6336b9f1c02b8726427801d906a=
14dae766852b4e85c1a92df06c8","src/unix/newlib/no_align.rs":"e0743b2179495a9=
514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc=
/mod.rs":"cc9e188711b9bf614323ad6c48e0d2e1a1ecc5d3bc64961ba451f29c6c22d2d8"=
,"src/unix/newlib/vita/mod.rs":"ff1caf74bb0696fe15d60dbac598db4520cd538aa0f=
5989713d97d008eee6ad8","src/unix/no_align.rs":"c06e95373b9088266e0b14bba095=
4eef95f93fb2b01d951855e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc=
8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.r=
s":"5eb045c352114f5d744d098acaf9e47a9223f6fccd43f36b9a3ba79b29af0eee","src/=
unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485=
bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07ae=
fb73d8ea2aafec19a84cfb040bc8e","src/unix/redox/mod.rs":"e75a319975472fe9e08=
73244fb07c5d2004672b7a4cf7a3cb01532d6d394cb8a","src/unix/solarish/compat.rs=
":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/u=
nix/solarish/illumos.rs":"26171da367221de1e456f1236250b5831a770d6f109ed12b0=
ebe4d508e490194","src/unix/solarish/mod.rs":"c0c5dfc406d728666010cdc2fe21b0=
df40547ed20dd7ad0eab65906e103b6d4b","src/unix/solarish/solaris.rs":"41b350a=
89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solari=
sh/x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522=
e","src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e0309=
8f3ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645=
c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs"=
:"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vx=
works/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d78=
8e88","src/vxworks/mod.rs":"ccdb6a6e0c12011705a15dadc04b26882e6090db4403af4=
d15cad9330ef96370","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133=
d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511=
cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs"=
:"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vx=
works/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98e=
d6b514a","src/wasi.rs":"51e38bb98547c40d0822d31975c976cd6e0784463d90d170109=
c87bf324395d3","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff=
9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0=
c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"9f=
dc5e1c62c441abef7bc62a7343efb2041edc24db9ac0efc0f74df55b69e249","src/window=
s/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf=
986f4","src/xous.rs":"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49=
250f3d65fae","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c2=
0a394e7774c7e545f21f1f4"},"package":"d8adc4bb1803a324070e64a98ae98f38934d91=
957a99cfb3a43dcbc01bc56439"}
>> -diff --git a/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic=
/mod.rs b/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/mod.rs
>> -index 2f437e16d..db1f1e70f 100644
>> ---- a/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/mod.rs
>> -+++ b/vendor/libc-0.2.158/src/unix/linux_like/linux/arch/generic/mod.rs
>> -@@ -114,6 +114,7 @@ cfg_if! {
>> -                  target_arch =3D "x86_64",
>> -                  target_arch =3D "arm",
>> -                  target_arch =3D "aarch64",
>> -+                 target_arch =3D "riscv32",
>> -                  target_arch =3D "riscv64",
>> -                  target_arch =3D "s390x",
>> -                  target_arch =3D "csky",
>> -@@ -218,7 +219,10 @@ cfg_if! {
>> -     // where S stands for size (int, long, struct...)
>> -     // where T stands for type ('f','v','X'...)
>> -     // where N stands for NR (NumbeR)
>> --    if #[cfg(any(target_arch =3D "x86", target_arch =3D "arm", target_=
arch =3D "csky"))] {
>> -+    if #[cfg(any(target_arch =3D "x86",
>> -+                 target_arch =3D "arm",
>> -+                 target_arch =3D "riscv32",
>> -+                 target_arch =3D "csky"))] {
>> -         pub const FS_IOC_GETFLAGS: ::Ioctl =3D 0x80046601;
>> -         pub const FS_IOC_SETFLAGS: ::Ioctl =3D 0x40046602;
>> -         pub const FS_IOC_GETVERSION: ::Ioctl =3D 0x80047601;
>>  diff --git a/vendor/libc-0.2.167/.cargo-checksum.json b/vendor/libc-0.2=
.167/.cargo-checksum.json
>>  index 7ea5d4122..def87f4ef 100644
>>  --- a/vendor/libc-0.2.167/.cargo-checksum.json
>> diff --git a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-=
tool.rs-switch-off-lto-for-rust.patch b/meta/recipes-devtools/rust/files/00=
01-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch
>> index e63cfb0719..5e0f5912a1 100644
>> --- a/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs=
-switch-off-lto-for-rust.patch
>> +++ b/meta/recipes-devtools/rust/files/0001-src-core-build_steps-tool.rs=
-switch-off-lto-for-rust.patch
>> @@ -24,23 +24,53 @@ diff --git a/src/bootstrap/src/core/build_steps/tool=
.rs b/src/bootstrap/src/core
>>  index 087df2f8a..00790affb 100644
>>  --- a/src/bootstrap/src/core/build_steps/tool.rs
>>  +++ b/src/bootstrap/src/core/build_steps/tool.rs
>> -@@ -635,7 +635,7 @@ impl Step for Rustdoc {
>> -         }
>> +@@ -1,14 +1,11 @@
>> + use std::path::PathBuf;
>> + use std::{env, fs};
>>
>> -         // NOTE: Never modify the rustflags here, it breaks the build =
cache for other tools!
>> --        let cargo =3D prepare_tool_cargo(
>> -+        let mut cargo =3D prepare_tool_cargo(
>> -             builder,
>> -             build_compiler,
>> -             Mode::ToolRustc,
>> -@@ -645,6 +645,7 @@ impl Step for Rustdoc {
>> +-use crate::core::build_steps::compile::is_lto_stage;
>> + use crate::core::build_steps::toolstate::ToolState;
>> + use crate::core::build_steps::{compile, llvm};
>> + use crate::core::builder;
>> +-use crate::core::builder::{
>> +-    Builder, Cargo as CargoCommand, RunConfig, ShouldRun, Step, cargo_=
profile_var,
>> +-};
>> +-use crate::core::config::{DebuginfoLevel, RustcLto, TargetSelection};
>> ++use crate::core::builder::{Builder, Cargo as CargoCommand, RunConfig, =
ShouldRun, Step};
>> ++use crate::core::config::{DebuginfoLevel, TargetSelection};
>> + use crate::utils::channel::GitInfo;
>> + use crate::utils::exec::{BootstrapCommand, command};
>> + use crate::utils::helpers::{add_dylib_path, exe, t};
>> +@@ -658,19 +655,7 @@
>>               SourceType::InTree,
>>               features.as_slice(),
>>           );
>> +-
>> +-        // rustdoc is performance sensitive, so apply LTO to it.
>> +-        if is_lto_stage(&build_compiler) {
>> +-            let lto =3D match builder.config.rust_lto {
>> +-                RustcLto::Off =3D> Some("off"),
>> +-                RustcLto::Thin =3D> Some("thin"),
>> +-                RustcLto::Fat =3D> Some("fat"),
>> +-                RustcLto::ThinLocal =3D> None,
>> +-            };
>> +-            if let Some(lto) =3D lto {
>> +-                cargo.env(cargo_profile_var("LTO", &builder.config), l=
to);
>> +-            }
>> +-        }
>>  +        cargo.rustflag("-Clto=3Doff");
>>
>>           let _guard =3D builder.msg_tool(
>>               Kind::Build,
>> ---
>> -2.39.5
>> -
>> +diff --git a/src/bootstrap/src/core/builder/mod.rs b/src/bootstrap/src/=
core/builder/mod.rs
>> +--- a/src/bootstrap/src/core/builder/mod.rs
>> ++++ b/src/bootstrap/src/core/builder/mod.rs
>> +@@ -11,7 +11,7 @@
>> +
>> + use clap::ValueEnum;
>> +
>> +-pub use self::cargo::{Cargo, cargo_profile_var};
>> ++pub use self::cargo::Cargo;
>> + pub use crate::Compiler;
>> + use crate::core::build_steps::{
>> +     check, clean, clippy, compile, dist, doc, gcc, install, llvm, run,=
 setup, test, tool, vendor,
>> diff --git a/meta/recipes-devtools/rust/files/Zdual-proc-macros-addition=
al-check.patch b/meta/recipes-devtools/rust/files/Zdual-proc-macros-additio=
nal-check.patch
>> deleted file mode 100644
>> index 6bb1738d05..0000000000
>> --- a/meta/recipes-devtools/rust/files/Zdual-proc-macros-additional-chec=
k.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -Fix bootstrap failure when multilibs are enabled.
>> -
>> -Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/139=
d6ba054a1a4cc5fe64981ad46fd5547bd4916]
>> -
>> -Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com=
>
>> ----
>> -diff --git a/src/bootstrap/src/core/builder/cargo.rs b/src/bootstrap/sr=
c/core/builder/cargo.rs
>> -index 066e6bf53f..a2f6fac4b1 100644
>> ---- a/src/bootstrap/src/core/builder/cargo.rs
>> -+++ b/src/bootstrap/src/core/builder/cargo.rs
>> -@@ -646,7 +646,10 @@ impl Builder<'_> {
>> -                 // Build proc macros both for the host and the target =
unless proc-macros are not
>> -                 // supported by the target.
>> -                 if target !=3D compiler.host && cmd_kind !=3D Kind::Ch=
eck {
>> --                    let error =3D command(self.rustc(compiler))
>> -+                    let mut rustc_cmd =3D command(self.rustc(compiler)=
);
>> -+                    self.add_rustc_lib_path(compiler, &mut rustc_cmd);
>> -+
>> -+                    let error =3D rustc_cmd
>> -                         .arg("--target")
>> -                         .arg(target.rustc_target_arg())
>> -                         .arg("--print=3Dfile-names")
>> -@@ -654,6 +657,7 @@ impl Builder<'_> {
>> -                         .arg("-")
>> -                         .run_capture(self)
>> -                         .stderr();
>> -+
>> -                     let not_supported =3D error
>> -                         .lines()
>> -                         .any(|line| line.contains("unsupported crate t=
ype `proc-macro`"));
>> -
>> diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/m=
eta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> index 048fc3f10b..49d85072cb 100644
>> --- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> +++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
>> @@ -43,10 +43,10 @@ diff --git a/compiler/rustc_interface/src/tests.rs b=
/compiler/rustc_interface/sr
>>   fn test_can_print_warnings() {
>>       sess_and_cfg(&["-Awarnings"], |sess, _cfg| {
>>           assert!(!sess.dcx().can_emit_warnings());
>> -diff --git a/library/std/src/sync/poison/rwlock/tests.rs b/library/std/=
src/sync/poison/rwlock/tests.rs
>> +diff --git a/library/std/tests/sync/rwlock.rs b/library/std/tests/sync/=
rwlock.rs
>>  index 1a9d3d3f12f..0a9cfc48806 100644
>> ---- a/library/std/src/sync/poison/rwlock/tests.rs
>> -+++ b/library/std/src/sync/poison/rwlock/tests.rs
>> +--- a/library/std/tests/sync/rwlock.rs
>> ++++ b/library/std/tests/sync/rwlock.rs
>>  @@ -47,6 +47,7 @@ fn frob() {
>>   }
>>
>> @@ -114,9 +114,9 @@ diff --git a/library/test/src/tests.rs b/library/tes=
t/src/tests.rs
>>   fn test_time_options_threshold() {
>>       let unit =3D TimeThreshold::new(Duration::from_millis(50), Duratio=
n::from_millis(100));
>>       let integration =3D TimeThreshold::new(Duration::from_millis(500),=
 Duration::from_millis(1000));
>> -diff --git a/library/std/src/sync/poison/mutex/tests.rs b/library/std/s=
rc/sync/poison/mutex/tests.rs
>> ---- a/library/std/src/sync/poison/mutex/tests.rs
>> -+++ b/library/std/src/sync/poison/mutex/tests.rs
>> +diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/m=
utex.rs
>> +--- a/library/std/tests/sync/mutex.rs
>> ++++ b/library/std/tests/sync/mutex.rs
>>  @@ -193,6 +193,7 @@
>>   }
>>
>> @@ -125,9 +125,9 @@ diff --git a/library/std/src/sync/poison/mutex/tests=
.rs b/library/std/src/sync/p
>>   fn test_mutex_arc_poison_mapped() {
>>       let arc =3D Arc::new(Mutex::new(1));
>>       assert!(!arc.is_poisoned());
>> -diff --git a/library/std/src/sync/poison/mutex/tests.rs b/library/std/s=
rc/sync/poison/mutex/tests.rs
>> ---- a/library/std/src/sync/poison/mutex/tests.rs
>> -+++ b/library/std/src/sync/poison/mutex/tests.rs
>> +diff --git a/library/std/tests/sync/mutex.rs b/library/std/tests/sync/m=
utex.rs
>> +--- a/library/std/tests/sync/mutex.rs
>> ++++ b/library/std/tests/sync/mutex.rs
>>  @@ -272,6 +272,7 @@
>>   }
>>
>> @@ -136,9 +136,9 @@ diff --git a/library/std/src/sync/poison/mutex/tests=
.rs b/library/std/src/sync/p
>>   fn panic_while_mapping_unlocked_poison() {
>>       let lock =3D Mutex::new(());
>>
>> -diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/src/syn=
c/poison/rwlock/tests.rs
>> ---- a/library/std/src/sync/poison/rwlock/tests.rs
>> -+++ b/library/std/src/sync/poison/rwlock/tests.rs
>> +diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/tests/s=
ync/rwlock.rs
>> +--- a/library/std/tests/sync/rwlock.rs
>> ++++ b/library/std/tests/sync/rwlock.rs
>>  @@ -59,6 +59,7 @@ fn test_rw_arc_poison_wr() {
>>   }
>>
>> @@ -163,10 +163,10 @@ diff --git a/library/std/src/sync/rwlock/tests.rs =
b/library/std/src/sync/poison/
>>   fn panic_while_mapping_write_unlocked_poison() {
>>       let lock =3D RwLock::new(());
>>
>> -diff --git a/library/core/benches/num/int_log/mod.rs b/library/core/ben=
ches/num/int_log/mod.rs
>> +diff --git a/library/coretests/benches/num/int_log/mod.rs b/library/cor=
etests/benches/num/int_log/mod.rs
>>  index 3807cd5d76c..018c5c04456 100644
>> ---- a/library/core/benches/num/int_log/mod.rs
>> -+++ b/library/core/benches/num/int_log/mod.rs
>> +--- a/library/coretests/benches/num/int_log/mod.rs
>> ++++ b/library/coretests/benches/num/int_log/mod.rs
>>  @@ -98,6 +98,7 @@ fn $random_small(bench: &mut Bencher) {
>>           }
>>
>> @@ -175,34 +175,22 @@ index 3807cd5d76c..018c5c04456 100644
>>           fn $geometric(bench: &mut Bencher) {
>>               let bases: [$t; 16] =3D [2, 3, 4, 5, 7, 8, 9, 15, 16, 17, =
31, 32, 33, 63, 64, 65];
>>               let base_and_numbers: Vec<($t, Vec<$t>)> =3D bases
>> -diff --git a/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.r=
s b/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
>> +diff --git a/compiler/rustc_data_structures/src/tagged_ptr/tests.rs b/c=
ompiler/rustc_data_structures/src/tagged_ptr/tests.rs
>>  index 160af8a65d..686f4607bb 100644
>> ---- a/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
>> -+++ b/compiler/rustc_data_structures/src/tagged_ptr/copy/tests.rs
>> +--- a/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
>> ++++ b/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
>>  @@ -5,6 +5,7 @@ use crate::stable_hasher::{HashStable, StableHasher};
>> - use crate::tagged_ptr::{CopyTaggedPtr, Pointer, Tag, Tag2};
>> -
>> - #[test]
>> -+#[ignore]
>> - fn smoke() {
>> -     let value =3D 12u32;
>> -     let reference =3D &value;
>> -diff --git a/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.r=
s b/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
>> -index 4d342c72cc..9a77f92616 100644
>> ---- a/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
>> -+++ b/compiler/rustc_data_structures/src/tagged_ptr/drop/tests.rs
>> -@@ -4,6 +4,7 @@ use std::sync::Arc;
>> - use crate::tagged_ptr::{Pointer, Tag, Tag2, TaggedPtr};
>> + }
>>
>>   #[test]
>>  +#[ignore]
>>   fn smoke() {
>>       let value =3D 12u32;
>>       let reference =3D &value;
>> -diff --git a/library/std/src/thread/local/tests.rs b/library/std/src/th=
read/local/tests.rs
>> +diff --git a/library/std/tests/thread_local/tests.rs b/library/std/test=
s/thread_local/tests.rs
>>  index 9d4f52a092..d425e5f7b7 100644
>> ---- a/library/std/src/thread/local/tests.rs
>> -+++ b/library/std/src/thread/local/tests.rs
>> +--- a/library/std/tests/thread_local/tests.rs
>> ++++ b/library/std/tests/thread_local/tests.rs
>>  @@ -346,6 +346,7 @@ fn join_orders_after_tls_destructors() {
>>
>>   // Test that thread::current is still available in TLS destructors.
>> @@ -242,3 +230,32 @@ index a05f274136..0e69b4cb98 100644
>>   fn sparse_inserts() {
>>       let cache: VecCache<u32, u8, u32> =3D VecCache::default();
>>       let end =3D if cfg!(target_pointer_width =3D "64") && cfg!(target_=
os =3D "linux") {
>> +diff --git a/tests/assembly/dwarf-mixed-versions-lto.rs b/tests/assembl=
y/dwarf-mixed-versions-lto.rs
>> +index 5b8e5ff4f4a..e558fbd7bd7 100644
>> +--- a/tests/assembly/dwarf-mixed-versions-lto.rs
>> ++++ b/tests/assembly/dwarf-mixed-versions-lto.rs
>> +@@ -1,6 +1,11 @@
>> + // This test ensures that if LTO occurs between crates with different =
DWARF versions, we
>> + // will choose the highest DWARF version for the final binary. This ma=
tches Clang's behavior.
>> +
>> ++//@ only-x86
>> ++//@ only-x86_64
>> ++//@ only-arm
>> ++//@ only-aarch64
>> ++
>> + //@ only-linux
>> + //@ aux-build:dwarf-mixed-versions-lto-aux.rs
>> + //@ compile-flags: -C lto -g -Zdwarf-version=3D5
>> +diff --git a/tests/codegen/dont-shuffle-bswaps.rs b/tests/codegen/dont-=
shuffle-bswaps.rs
>> +index 0e712bc3a4e..93965d990d0 100644
>> +--- a/tests/codegen/dont-shuffle-bswaps.rs
>> ++++ b/tests/codegen/dont-shuffle-bswaps.rs
>> +@@ -1,3 +1,8 @@
>> ++//@ only-x86
>> ++//@ only-x86_64
>> ++//@ only-arm
>> ++//@ only-aarch64
>> ++
>> + //@ revisions: OPT2 OPT3
>> + //@[OPT2] compile-flags: -Copt-level=3D2
>> + //@[OPT3] compile-flags: -C opt-level=3D3
>> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb b/meta/recip=
es-devtools/rust/libstd-rs_1.86.0.bb
>> similarity index 95%
>> rename from meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
>> rename to meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
>> index 00802f0fd9..b39ec0ab39 100644
>> --- a/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
>> +++ b/meta/recipes-devtools/rust/libstd-rs_1.86.0.bb
>> @@ -2,7 +2,7 @@ SUMMARY =3D "Rust standard libaries"
>>  HOMEPAGE =3D "http://www.rust-lang.org"
>>  SECTION =3D "devel"
>>  LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
>> -LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D9c0fae516fe8aaea2fb6=
01db4800daf7"
>> +LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D11a3899825f4376896e4=
38c8c753f8dc"
>>
>>  require rust-source.inc
>>
>> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb b/=
meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb
>> similarity index 100%
>> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
>> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.86.0.bb
>> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb b/meta/recip=
es-devtools/rust/rust-llvm_1.86.0.bb
>> similarity index 96%
>> rename from meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
>> rename to meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
>> index 2ba37f0784..327e8e6b69 100644
>> --- a/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
>> +++ b/meta/recipes-devtools/rust/rust-llvm_1.86.0.bb
>> @@ -2,9 +2,9 @@ SUMMARY =3D "LLVM compiler framework (packaged with rust=
)"
>>  LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
>>  HOMEPAGE =3D "http://www.rust-lang.org"
>>
>> -# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
>> +# check src/llvm-project/cmake/Modules/LLVMVersion.cmake for llvm versi=
on in use
>>  #
>> -LLVM_RELEASE =3D "19.1.5"
>> +LLVM_RELEASE =3D "19.1.7"
>>
>>  require rust-source.inc
>>
>> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes=
-devtools/rust/rust-snapshot.inc
>> index 98358bce40..445390fcaf 100644
>> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
>> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
>> @@ -4,56 +4,56 @@
>>  ## The exact (previous) version that has been used is specified in the =
source tarball.
>>  ## The version is replicated here.
>>
>> -SNAPSHOT_VERSION =3D "1.84.0"
>> +SNAPSHOT_VERSION =3D "1.85.0"
>>
>> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "9f5650aece53e083b933a57e=
5a8e0e2db4479f52ec897d5b6d0f77be6cd50498"
>> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "023f0b6153b23ac0e9686=
c2ab95bc393ee3e295b166bb36de3b4dfb53e3913e0"
>> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "68d4ad239b6d1e810e7b8591=
636dc408cb2c1e89661329fed906febf9c0a9d98"
>> -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "6022245416a988b9952f36b=
f20f62de0c2f3337bd150e34439ea6651592ac8ca"
>> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "e742b768f67303010b002b51=
5f6613c639e69ffcc78cd0857d6fe7989e9880f6"
>> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "8af1d793f7820e9ad0ee2=
3247a9123542c3ea23f8857a018651c7788af9bc5b7"
>> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "cdebe48b066d512d664c1344=
1e8fae2d0f67106c2080aa44289d98b24192b8bc"
>> +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "f3b8e769021a6bcee8174ac=
49a60c367effb6d97af0f2a6c44dc9ea39ff2bda9"
>>
>> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "f0bc277e8e8c072d20ee91784f9=
19c08b34a65ab56b67bcd2bb98a009cdcf97c"
>> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "e710100be26e742733d44572=
2a37227381f1ec2010664ece85489bc598d70456"
>> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "3a20231475b75f2f6ad0f7c5de2=
83c5706403b41e941d3f1ca6cccfbced214c6"
>> -SRC_URI[clippy-snapshot-i686.sha256sum] =3D "8b5bdd84b9128abc6d61bc1acb=
60e55eab90e063c7057371b4e6f79aaa1acb9b"
>> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "c5a5751f3cfa027b53fee83d01d=
ec8e555f3622b6993335aed12b1747aa9543c"
>> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "401571adfe1223d83ed041e5=
a8c54c1f3afb3010d1d5b0c1fd79e7da1ab0a0de"
>> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "3832027242911ab96fd86128587=
fc563596a5b10e8e38a073facf61c1ac9668f"
>> +SRC_URI[clippy-snapshot-i686.sha256sum] =3D "74ed13a67c6ea0452c0d9e8697=
c6cfdd8280f983b207187ac93c287f72b65066"
>>
>> -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "33ecfb62afce6e30864f=
07b4e3b76ac6d9f603a3626e5228ad0d59a7ee263cc1"
>> -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "763b93ca08028a1e6=
3a8a3754ac6118b2659022538e5e33675f2d7620488cd57"
>> -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "1531b9f3d09983c43f54=
d7e5ced6b452044e82b24609532e8cee345656e5d8a4"
>> -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "80719f10010eaf6a26b=
a7b2f8c5c7bce3a78fd838cbbe17c00a4e3e7cd45fe5e"
>> +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "d43d2119ff25d879b2d2=
80d3e5a03fcd21c57a32d479ad5626500c32432f18c9"
>> +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "2d05f5e13e7cb3ee6=
b0ca0dcd13a231a28eeb0faa4d15257a35cf7284149cd6a"
>> +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "9aa447eefcd3ba2f9dba=
b77596c8669849899ab243543fc8f1914089707081ac"
>> +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "d437b39465343a71ff4=
75a65acb6c03bc0f800861f293f48accf1fa170458432"
>>
>> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "ac99e907c9819b61de94a6c1=
2b64256661e5d76c53f3ed25246b46741d1dc973"
>> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "fdbb75060e59ad59273a8=
ef11fc2ad61837539686df0e8dfe46107e1b15ab90a"
>> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "dedcb36320cfa924e2d21552=
057f88ee8a30c0424802015494c2f6237150ec55"
>> -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "de2413ae321d2bccf77c77a=
cb1e9775b63eca1993ee1450e65e388f029565a51"
>> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "fbe7154abc641d6cacfdc623=
9ed4701fc7a09b5046c6d1bd209b59e7f2b2d0f0"
>> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "ab2d5ac7cd295adaa4d95=
9e8abbf42b372292c95d1a9f18aad64951ad6e2ab2b"
>> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "e67c30a72f969c51ad199084=
b3ce0cdc573a4e21f732b2cc39dafbcb9807a5ce"
>> +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "497104d49803598cd380174=
9ac86cb26c88a2bd9c3a8c7bdc18fdf487f4650c0"
>>
>> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "1f5ff831c9fd97d7d306eb=
7d99186b9e49f35527144aaabd43f67f04449cd732"
>> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "f2819f8ce1ae41c2c2b=
cf40fc90d6b1a5d340d3e9558267d464730a797122bf5"
>> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "09d9954bf817404c08a8ac=
952afe1e086ad11fe20d07522a4bde5f26bf7fb5d2"
>> -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "a34cde35f254210cbb212=
c3fa85411efaa8e70d600d2c2404b7b319eae9b5be6"
>> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "f8e38291ba4241bc28e9c1=
18d7a449ce3601abdeb2076f2f618858679fb3b929"
>> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "e9ff89e759125ad2786=
ad2f6c40e820095720ea00fba66819d15fba79489430a"
>> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "73cf850f6715acbf0029c7=
e5d4694825f61bd4e193e6413e65a78bcb13df97b7"
>> +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "29b63f23cd9af95846a24=
6c9cc8349e514c3fb92ec0c840a38155e252d6cc668"
>>
>> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "1f6aa28f848b24d45892=
77b04535ad0258e72b5fa78a4a85ba6d18db95636d69"
>> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "db731e894cce9973a=
b2b41109c9097d0fc6a49c0d45a0d333bd1547d2c7485a1"
>> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "7dc351327de2567cce2a=
3387f110cce1db20c68fc529353c5cdef2eada5dbfd8"
>> -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "b53cb58c719b84044de=
62851b6214db8d504f57ad71e81b373d7dea0393146d8"
>> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "371e40f9d6d82aecb056=
f70f82868d98ddc1c20510aa7d388442ac8d2d86a6ca"
>> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "d0cfda4e18623d179=
22eb367e44ac9549ab3d5fe1c0bdbe0c2c95754255fa705"
>> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "e1469f4249a7e21f872a=
f487dcd1bd10ce388b5b3679bdab0cb0965e1e30fe47"
>> +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "d8c590bc2e6fc75800e=
41516427f5095ba0e15d7633167689499fcf6523dc61a"
>>
>> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "c0eaf824c7789c94901f89=
5792333595fe131e43f097bcf5987301cc1b14c3f0"
>> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "451580f9cdc47eef4ef=
b0986b1960a8f9c4fb0959f81b77eb6292e6bcff9fc64"
>> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "3a850b74bdf2c3a5912e9f=
1ea32aaf1c9ac7c5f89c1c0bcf421b961195833992"
>> -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "fb8c9d489e10a961f9faa=
550980069738b5f0f68740e34d7b3ee46a262b53af7"
>> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "2da33044f17a8bc49a1478=
dc1eb2536df491a44d6e6bb0ec7c86f46877d44e98"
>> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "0f5ecfe54859bbe7158=
21f982b1a5396784fdf55605d00ece05d3e57a965ed16"
>> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "c9f28b519799fc2d808986=
5e30fad04bb5339604d13725365fcd7ad7ee6c1489"
>> +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "9d21bc180196bccdb301e=
7e03034d3fd0df14b0c6520da0317bba7b1ce385fe8"
>>
>> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "7dbc2fc2c04e820f636bfc7409=
3396c55df0296f7ee4f0547bb849d9a9f05fe0"
>> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "5208f45cec5f3600f2cbc11=
d1796bc217f09e9c922689c8e4f0cc3f2b83ebb74"
>> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "bdf944ff5c0b97e8b64093fff8=
d1f63926df86b5e98f91d30c7bd844c6efa20f"
>> -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "b02a586369e6edebb0f0608e3=
96472d1867419213fd01ba32f3c847e4c5a3c07"
>> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "308361737ed522aa77dd8b4ea9=
1b5db244113ada5fa234d3ed008b526d07e2e8"
>> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "d25053fbee1a0cb899bac8c=
8e4968aa35f9c3637e486cb5bb2c79ad43a78f3e7"
>> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "7e1defd60095c91ded1612194f=
811ec5f2fc2e83bb914d35594d01fa3c54049d"
>> +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "9780d8c4cfef9d05460b3e540=
aad142391b2e3994accf8cfc8afb87fefac6cf0"
>>
>> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a1737d86f80b31a6d48a67267=
26275dc068ecb930c9635b13aa59999486de837"
>> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "770237080b9310d126350c=
3bd70820bd91064c2e96c29ab5f2e002b31b5bd067"
>> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "6c2371488db92a09cd50a1b40=
45c022f3cf2c643285b3b21105ab5f9b64fd6b6"
>> -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "1db0212c08e126bf6ee28a0d=
363c5d6859fe357aa9e91d0247059397dbe7e1fd"
>> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "7436f13797475082cd87aa655=
47449e01659d6a810b4cd5f8aedc48bb9f89dfb"
>> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "285e105d25ebdf50134123=
8d4c0594ecdda50ec9078f45095f793a736b1f1ac2"
>> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "0aff33b57b0e0b102d762a2b5=
3042846c1ca346cff4b7bd96b5c03c9e8e51d81"
>> +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "0dc3ca1708a6c9eed05d0802=
364377572b79ff079815b7bcbe8e3991f77c4117"
>>
>> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "a877622fbbfa58304c34372d=
369e95db106cc35758ca59053144bf7d86fbf3fc"
>> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "3cb7318da10876de14076549=
d79410a8441923a92d62b616d8c105f5f5cd831b"
>>
>> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "ecd1662d6cbbb62984ab3=
1ae787442f1ab32caf6bc17260d407b3a94b434ad32"
>> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "65cd47af46a5b74e61ff6=
ae4cce8a979ee8670a57b8aa61e732828d1da073f73"
>>
>>  SRC_URI +=3D " \
>>      ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-st=
d-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
>> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-d=
evtools/rust/rust-source.inc
>> index 6cb08b7c38..f9c1fcd1c8 100644
>> --- a/meta/recipes-devtools/rust/rust-source.inc
>> +++ b/meta/recipes-devtools/rust/rust-source.inc
>> @@ -7,11 +7,10 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-=
${RUST_VERSION}-src.tar.xz;n
>>              file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru=
.patch;patchdir=3D${RUSTSRC} \
>>              file://0001-src-core-build_steps-tool.rs-switch-off-lto-for=
-rust.patch;patchdir=3D${RUSTSRC} \
>>              file://revert-link-std-statically-in-rustc_driver-feature.p=
atch;patchdir=3D${RUSTSRC} \
>> -            file://Zdual-proc-macros-additional-check.patch;patchdir=3D=
${RUSTSRC} \
>>              file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribu=
te.patch;patchdir=3D${RUSTSRC} \
>>              file://0001-Disable-libunwind-cross-architecture-unwinding.=
patch;patchdir=3D${RUSTSRC} \
>>  "
>> -SRC_URI[rust.sha256sum] =3D "b1fbf809efe9f036939401e142631c201a53bcf43e=
c1696bd9f5290ba236a266"
>> +SRC_URI[rust.sha256sum] =3D "d939eada065dc827a9d4dbb55bd48533ad14c16e7f=
0a42e70147029c82a7707b"
>>
>>  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
>>
>> diff --git a/meta/recipes-devtools/rust/rust_1.85.1.bb b/meta/recipes-de=
vtools/rust/rust_1.86.0.bb
>> similarity index 96%
>> rename from meta/recipes-devtools/rust/rust_1.85.1.bb
>> rename to meta/recipes-devtools/rust/rust_1.86.0.bb
>> index f289db6306..c2443fbb15 100644
>> --- a/meta/recipes-devtools/rust/rust_1.85.1.bb
>> +++ b/meta/recipes-devtools/rust/rust_1.86.0.bb
>> @@ -2,18 +2,18 @@ SUMMARY =3D "Rust compiler and runtime libaries"
>>  HOMEPAGE =3D "http://www.rust-lang.org"
>>  SECTION =3D "devel"
>>  LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
>> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D9c0fae516fe8aaea2fb601db48=
00daf7"
>> +LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c7=
53f8dc"
>>
>>  inherit rust
>>  inherit cargo_common
>>
>> -DEPENDS +=3D "rust-llvm"
>> +DEPENDS +=3D "rust-llvm pkgconfig-native openssl ninja-native"
>>  # native rust uses cargo/rustc from binary snapshots to bootstrap
>>  # but everything else should use our native builds
>>  DEPENDS:append:class-target =3D " cargo-native rust-native"
>>  DEPENDS:append:class-nativesdk =3D " cargo-native rust-native"
>>
>> -RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils"
>> +RDEPENDS:${PN}:append:class-target =3D " gcc g++ binutils bash"
>>
>>  # Otherwise we'll depend on what we provide
>>  INHIBIT_DEFAULT_RUST_DEPS:class-native =3D "1"
>> @@ -135,6 +135,8 @@ python do_configure() {
>>      config.set("rust", "remap-debuginfo", e(True))
>>      config.set("rust", "download-rustc", e(False))
>>      config.set("rust", "llvm-tools", e(False))
>> +    config.set("rust", "lld", e(False))
>> +    config.set("rust", "use-lld", e(False))
>>      config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
>>
>>      # Whether or not to optimize the compiler and standard library
>> @@ -155,6 +157,8 @@ python do_configure() {
>>      cargo =3D d.getVar('CARGO_BOOTSTRAP')
>>      config.set("build", "cargo", e(cargo))
>>
>> +    config.set("build", "extended", e(False))
>> +
>>      config.set("build", "vendor", e(True))
>>
>>      config.set("build", "target", e([d.getVar("RUST_TARGET_SYS")]))
>> @@ -233,10 +237,12 @@ do_test_compile () {
>>
>>  ALLOW_EMPTY:${PN} =3D "1"
>>
>> -PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt"
>> +PACKAGES =3D+ "${PN}-rustdoc ${PN}-tools-clippy ${PN}-tools-rustfmt ${P=
N}-zsh-completion"
>>  FILES:${PN}-rustdoc =3D "${bindir}/rustdoc"
>>  FILES:${PN}-tools-clippy =3D "${bindir}/cargo-clippy ${bindir}/clippy-d=
river"
>>  FILES:${PN}-tools-rustfmt =3D "${bindir}/rustfmt"
>> +FILES:${PN}-zsh-completion =3D "${datadir}/zsh"
>> +
>>  RDEPENDS:${PN}-rustdoc =3D "${PN}"
>>  RDEPENDS:${PN}-tools-clippy =3D "${PN}"
>>  RDEPENDS:${PN}-tools-rustfmt =3D "${PN}"
>> @@ -252,6 +258,10 @@ rust_do_install() {
>>      rust_runx install
>>  }
>>
>> +rust_do_install:append:class-native () {
>> +    rm -f ${D}${bindir}/cargo
>> +}
>> +
>>  rust_do_install:class-nativesdk() {
>>      export PSEUDO_UNLOAD=3D1
>>      rust_runx install
>> --
>> 2.49.0
>>
>>
>>
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218510): https://lists.openembedded.org/g/openembedde=
d-core/message/218510
> Mute This Topic: https://lists.openembedded.org/mt/113565449/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

