Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4890C433EF
	for <webhook@archiver.kernel.org>; Sat,  6 Nov 2021 07:49:59 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.16697.1636184998753425472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 00:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z1AGK4u8;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id bm28so10876006qkb.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Nov 2021 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2a2dbruuICRdT/UflmcJ6w8g4F/4YOJq6iJCbk7AGbM=;
        b=Z1AGK4u88DVx/GtUV6c34VKaUNg93zVnoYPRiHllqVw/HLAWcj4KCXq39Ftyh5hc8y
         pTrF0PvOGln7SpDildU2HVUH0A75CSYQqysrW1B/TVs4etvBgL3eHIe3Z55rlIpdw9zQ
         l8ofO1eMfBH7Lp5KVjj6GNw0FYHd2ZowZc/8S9C7wESYQTqngGN0xarqwMlXw3FRN3zZ
         m70Q55PMui2X61IXpOrwdgJSCGuhDvDK69n5kROl9u727mGBAf8FtvSzL1r/58utBdM9
         cMtJodlAUB+dhC3cHm3WzmqahnygHZuddOeY57/qGClxzzFy/nUwHe0TfSNIy8Ah3I13
         325A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2a2dbruuICRdT/UflmcJ6w8g4F/4YOJq6iJCbk7AGbM=;
        b=Axg22aQO7hm30I+OAvKjYbsbrcYTCzmPTiDZSaCJvZtdQUChwUg0xBfzb3c53IrI6m
         kz9tiOtNIgCW0kObLpyPJoUjBASbO8nkQzKgP3sl2dkGTWNcca4S5LzbxG7iyNtDSv3/
         V+0BX1DvDt2dbzP1ZWTuPmDNQFOZ+GZTRESOdn+W4pS/u3+SvEmFN8StmLQe6E3ClPvr
         PwV3oM+7nO9YZtrUHU3JvftPpBZgpPdBJLyoNwssHZ9mDafVa58esJMNRocaJCKUaYjs
         wKuGQi1URFnz1klDnFyA9S87zedOjNB0Y6aWtqVXdFIPWgX2kxJiqhiRIE2zMCnhzCtk
         oGHA==
X-Gm-Message-State: AOAM533UT06nvdYONOR6ktOr286DuPfz0pwLpdmpCK1ltA3AAMr2UvFn
	SM+zbQbUzmi0pSMKbZBDRjhw0M1qlPd6NkCiwB0=
X-Google-Smtp-Source: 
 ABdhPJw0xGeogDMalzRxettcNejYjDSJn573JoaaXuKE41/SEfz7atBw7ujn7/vctHcSRJIy6VKzA9wWEVwONUwrPcA=
X-Received: by 2002:a37:6107:: with SMTP id v7mr20065300qkb.105.1636184997579;
 Sat, 06 Nov 2021 00:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211105084812.1828227-1-alex@linutronix.de>
 <20211105084812.1828227-5-alex@linutronix.de>
In-Reply-To: <20211105084812.1828227-5-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 6 Nov 2021 00:49:30 -0700
Message-ID: 
 <CAMKF1so2bL97N3fJj6j2+1Qz20G3GN-yUesymjFccw908jVHow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/7] librsvg: set the needed atomic
 configuration flags directly per-target
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Nov 2021 07:49:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157934

On Fri, Nov 5, 2021 at 1:48 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> Do not try to mangle the upstream list of targets;
> after discussion with upstream it turns out it's neither
> necessary nor upstreamable:
> https://github.com/crossbeam-rs/crossbeam/pull/751
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...check-only-the-architecture-not-the-.patch | 143 ------------------
>  meta/recipes-gnome/librsvg/librsvg_2.52.3.bb  |   4 +-
>  2 files changed, 3 insertions(+), 144 deletions(-)
>  delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-uti=
ls-check-only-the-architecture-not-the-.patch
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-chec=
k-only-the-architecture-not-the-.patch b/meta/recipes-gnome/librsvg/librsvg=
/0001-crossbeam-utils-check-only-the-architecture-not-the-.patch
> deleted file mode 100644
> index 0c1cf59eff..0000000000
> --- a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-=
the-architecture-not-the-.patch
> +++ /dev/null
> @@ -1,143 +0,0 @@
> -From 70557b217644901daaf9d8ef793f5e84c937762e Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Tue, 5 Oct 2021 23:41:59 +0200
> -Subject: [PATCH] crossbeam-utils: check only the architecture, not the w=
hole
> - target string
> -
> -There can be custom targets in use, and it's not possible to make a list
> -of them; for the check only the first item in the target string is actua=
lly
> -relevant (the architecture of the target).
> -
> -Upstream-Status: Pending [needs an upstream ticket and possibly a rework=
 of list generator script]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ----
> - vendor/crossbeam-utils/.cargo-checksum.json |  4 +-
> - vendor/crossbeam-utils/build.rs             |  8 ++-
> - vendor/crossbeam-utils/no_atomic.rs         | 78 ++++++++-------------
> - 3 files changed, 38 insertions(+), 52 deletions(-)
> -
> ---- a/vendor/crossbeam-utils/.cargo-checksum.json
> -+++ b/vendor/crossbeam-utils/.cargo-checksum.json
> -@@ -1 +1,3 @@
> --{"files":{"CHANGELOG.md":"5242f1740c65509c465c9a36326d344722facff5f5e58=
dd064f7b77806b83a46","Cargo.toml":"ac35a7b8ccb16f1ab256951576537aa4179a316c=
068929c2acef89e0adc12319","LICENSE-APACHE":"a60eea817514531668d7e0076573144=
9fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281e=
e9f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63=
c84b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927=
eb3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"6=
8cfc4be02429834a19411fba29cb1cb52c841f03ac8104d1bae59a8b2184f9c","no_atomic=
.rs":"a2621c1b029c614fb0ab8e3f5cda2e839df88d90d26133181c1b901965f7eec4","sr=
c/atomic/atomic_cell.rs":"1a3a1e073340317b5ce7a94e29c6a87db89ff7e00da6b92cb=
3c0339364c3b084","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1=
a2a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"7f6afd5bd0da1f7b51765=
ab04da4e5f683588ac2d23506e61bf7007bb1e61ba2","src/atomic/seq_lock.rs":"2718=
2e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/s=
eq_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b0=
9080088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d=
7eb0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1=
f1c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf=
8efab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b3=
247ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"ba8f75=
bff31b8be9275808e8f393e71cc682dfc1109ceccb12f69a3700cff5be","src/sync/shard=
ed_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c12=
0f","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbc=
fa1d1f25990582cb6ea","src/thread.rs":"0eb5ec1d3c1b40600d88eb70539d14276e323=
07f5bed2b679f50f6a20777a01e","tests/atomic_cell.rs":"6c9453384ecbbe76f8b97b=
62f022d478d3a76b4eae1e960f49790970f5d52158","tests/cache_padded.rs":"1bfaff=
8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.r=
s":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","test=
s/sharded_lock.rs":"726025ce6351fb56ed629d5a56bdf6e833b7afc5dedfa08de0b056c=
726b6c26d","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab=
62cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418=
f8b924d784a4db8d7e469deab8c95f5f8"},"package":"d82cfc11ce7f2c3faef78d8a6844=
47b40d503d9681acebed6cb728d45940c4db"}
> -\ No newline at end of file
> -+{"files":{"CHANGELOG.md":"5242f1740c65509c465c9a36326d344722facff5f5e58=
dd064f7b77806b83a46","Cargo.toml":"ac35a7b8ccb16f1ab256951576537aa4179a316c=
068929c2acef89e0adc12319","LICENSE-APACHE":"a60eea817514531668d7e0076573144=
9fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281e=
e9f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63=
c84b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927=
eb3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d",
> -+"build.rs":"15c1a41a88373231cbc17c7de5ade07c6098455af9cdeef81b576f37ed9=
23354",
> -+"no_atomic.rs":"dcbd845deda197b13361238a6aab60b6d8124fb588fd0b33740e127=
441db3f1a","src/atomic/atomic_cell.rs":"1a3a1e073340317b5ce7a94e29c6a87db89=
ff7e00da6b92cb3c0339364c3b084","src/atomic/consume.rs":"7a7736fcd64f6473dfe=
a7653559ffc5e1a2a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"7f6afd5=
bd0da1f7b51765ab04da4e5f683588ac2d23506e61bf7007bb1e61ba2","src/atomic/seq_=
lock.rs":"27182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a"=
,"src/atomic/seq_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7=
eb8024454263b09080088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274=
693455a0933a2d7eb0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b1=
63dbd7a83247e1f1c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06a=
d8458a53e865bf8efab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986=
f559a8f170a4b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/park=
er.rs":"ba8f75bff31b8be9275808e8f393e71cc682dfc1109ceccb12f69a3700cff5be","=
src/sync/sharded_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46=
561023d96c4c120f","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b17=
7c538fa0cf7cbcfa1d1f25990582cb6ea","src/thread.rs":"0eb5ec1d3c1b40600d88eb7=
0539d14276e32307f5bed2b679f50f6a20777a01e","tests/atomic_cell.rs":"6c945338=
4ecbbe76f8b97b62f022d478d3a76b4eae1e960f49790970f5d52158","tests/cache_padd=
ed.rs":"1bfaff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","=
tests/parker.rs":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69=
dd99d20","tests/sharded_lock.rs":"726025ce6351fb56ed629d5a56bdf6e833b7afc5d=
edfa08de0b056c726b6c26d","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1c=
c252a816bc20ab62cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594=
a2e0737234d418f8b924d784a4db8d7e469deab8c95f5f8"},"package":"d82cfc11ce7f2c=
3faef78d8a684447b40d503d9681acebed6cb728d45940c4db"}
> ---- a/vendor/crossbeam-utils/build.rs
> -+++ b/vendor/crossbeam-utils/build.rs
> -@@ -20,17 +20,19 @@ fn main() {
> -         }
> -     };
> -
> -+    let target_arch =3D target.split('-').next().unwrap_or_default();
> -+
> -     // Note that this is `no_*`, not `has_*`. This allows treating
> -     // `cfg(target_has_atomic =3D "ptr")` as true when the build script=
 doesn't
> -     // run. This is needed for compatibility with non-cargo build syste=
ms that
> -     // don't run the build script.
> --    if NO_ATOMIC_CAS.contains(&&*target) {
> -+    if NO_ATOMIC_CAS.contains(&&*target_arch) {
> -         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_cas");
> -     }
> --    if NO_ATOMIC.contains(&&*target) {
> -+    if NO_ATOMIC.contains(&&*target_arch) {
> -         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic");
> -         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
> --    } else if NO_ATOMIC_64.contains(&&*target) {
> -+    } else if NO_ATOMIC_64.contains(&&*target_arch) {
> -         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
> -     } else {
> -         // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
> ---- a/vendor/crossbeam-utils/no_atomic.rs
> -+++ b/vendor/crossbeam-utils/no_atomic.rs
> -@@ -2,58 +2,41 @@
> - // It is not intended for manual editing.
> -
> - const NO_ATOMIC_CAS: &[&str] =3D &[
> --    "avr-unknown-gnu-atmega328",
> --    "msp430-none-elf",
> --    "riscv32i-unknown-none-elf",
> --    "riscv32imc-unknown-none-elf",
> --    "thumbv4t-none-eabi",
> --    "thumbv6m-none-eabi",
> -+    "avr",
> -+    "msp430",
> -+    "riscv32i",
> -+    "riscv32imc",
> -+    "thumbv4t",
> -+    "thumbv6m",
> - ];
> - #[allow(dead_code)]
> - const NO_ATOMIC_64: &[&str] =3D &[
> --    "arm-linux-androideabi",
> --    "armebv7r-none-eabi",
> --    "armebv7r-none-eabihf",
> --    "armv4t-unknown-linux-gnueabi",
> --    "armv5te-unknown-linux-gnueabi",
> --    "armv5te-unknown-linux-musleabi",
> --    "armv5te-unknown-linux-uclibceabi",
> --    "armv7r-none-eabi",
> --    "armv7r-none-eabihf",
> --    "hexagon-unknown-linux-musl",
> --    "mips-unknown-linux-gnu",
> --    "mips-unknown-linux-musl",
> --    "mips-unknown-linux-uclibc",
> --    "mipsel-unknown-linux-gnu",
> --    "mipsel-unknown-linux-musl",
> --    "mipsel-unknown-linux-uclibc",
> --    "mipsel-unknown-none",
> --    "mipsisa32r6-unknown-linux-gnu",
> --    "mipsisa32r6el-unknown-linux-gnu",
> --    "powerpc-unknown-linux-gnu",
> --    "powerpc-unknown-linux-gnuspe",
> --    "powerpc-unknown-linux-musl",
> --    "powerpc-unknown-netbsd",
> --    "powerpc-unknown-openbsd",
> --    "powerpc-wrs-vxworks",
> --    "powerpc-wrs-vxworks-spe",
> --    "riscv32gc-unknown-linux-gnu",
> --    "riscv32gc-unknown-linux-musl",
> --    "riscv32imac-unknown-none-elf",
> --    "thumbv7em-none-eabi",
> --    "thumbv7em-none-eabihf",
> --    "thumbv7m-none-eabi",
> --    "thumbv8m.base-none-eabi",
> --    "thumbv8m.main-none-eabi",
> --    "thumbv8m.main-none-eabihf",
> --    "mipsel-sony-psp",
> --    "thumbv4t-none-eabi",
> --    "thumbv6m-none-eabi",
> -+    "arm",
> -+    "armebv7r",
> -+    "armv4t",
> -+    "armv5te",
> -+    "armv7r",
> -+    "hexagon",
> -+    "mips",
> -+    "mipsel",
> -+    "mipsisa32r6",
> -+    "mipsisa32r6el",
> -+    "powerpc",
> -+    "riscv32",
> -+    "riscv32gc",
> -+    "riscv32imac",
> -+    "thumbv7em",
> -+    "thumbv7m",
> -+    "thumbv8m.base",
> -+    "thumbv8m.main",
> -+    "mipsel",
> -+    "thumbv4t",
> -+    "thumbv6m",
> - ];
> - #[allow(dead_code)]
> - const NO_ATOMIC: &[&str] =3D &[
> --    "avr-unknown-gnu-atmega328",
> --    "msp430-none-elf",
> --    "riscv32i-unknown-none-elf",
> --    "riscv32imc-unknown-none-elf",
> -+    "avr",
> -+    "msp430",
> -+    "riscv32i",
> -+    "riscv32imc",
> - ];
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.52.3.bb
> index 335d891f05..6c4850271d 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.52.3.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.52.3.bb
> @@ -18,7 +18,6 @@ inherit gnomebase gtk-doc pixbufcache upstream-version-=
is-even gobject-introspec
>
>  SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to-cargo-also-whe=
n-not-.patch \
>             file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded=
-li.patch \
> -           file://0001-crossbeam-utils-check-only-the-architecture-not-t=
he-.patch \
>             file://0001-vendor-system-deps-sort-dependencies-before-using=
-th.patch \
>             file://0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93=
.patch \
>             file://0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-li=
bc-.patch \
> @@ -39,6 +38,9 @@ export RUST_TARGET_PATH
>
>  export RUST_TARGET =3D "${HOST_SYS}"
>
> +RUSTFLAGS:append:mips =3D " --cfg crossbeam_no_atomic_64"
> +RUSTFLAGS:append:powerpc =3D " --cfg crossbeam_no_atomic_64"
> +

we also need to disable it for riscv32 and mipsel too. I will send a follow=
up.

>  # rust-cross writes the target linker binary into target json definition=
 without any flags.
>  # This breaks here because the linker isn't going to work without at lea=
st knowing where
>  # the sysroot is. So copy the json to workdir, and patch in the path to =
wrapper from rust class
> --
> 2.20.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157886): https://lists.openembedded.org/g/openembedde=
d-core/message/157886
> Mute This Topic: https://lists.openembedded.org/mt/86836028/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

