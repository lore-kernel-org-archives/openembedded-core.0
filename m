Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8266EC433FE
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.2130.1633893016000243069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bgO8QOsj;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id y3so15479002wrl.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y57Pi2DFDGLsTlVgy20mXQbaH/nzD8WXp5AZ2Y0AIt8=;
        b=bgO8QOsjtJ7z3RU2e0kpwrzgYD5lcVgp0hIUhn1vk0PUSWE8rEp1BGCOZH5taY3QPy
         bj31GwtGpJrbgneGVQ5g4AYFZ+3rrLtf5mYhO4wm1s01WaesAX2ypw3Pev4LTrCYwcTC
         n+/MJdPVUO3yNxvSE7MOOz/NILZ8OE3rgyiaDpZnfw7DStXG5WQ6OKM1Chm40AuWXqXy
         DD00rpIMTZR+k7ZOWiC+H0Qj/E/mvF17FLSAUTjStlC2wu7JaxDEiZObPqF5Cq11Jv39
         zd07Nl4SqYjFx6mHd3it6IOgHHsiR6ESOEwDEDDMLBMNJM2dABQhdxZ8C24U82G6zOl6
         Ee0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y57Pi2DFDGLsTlVgy20mXQbaH/nzD8WXp5AZ2Y0AIt8=;
        b=M5o7ftY28ttzgnpyEQWLXmB1XPOOdyQeXogeF7Vvmh5wwETl1yd+riA+CxREqUxveP
         ZYazn1nHRFkHXDo0EQnS/mpGVBWIjthLV9fpDk2/5VSJdsK4FhD7i4+PvJy7FQkUj5uL
         yNurd19YOrvy0oF4JBdmOBLce/RsePSlvBmDAYCwjcpXwQgT8BlIZW55kA9/ngsJ922b
         r2/Qxx1lPmFbG1HaqO7SSgvhShe273zjiC2p8qNhhYJbPc9sgSkI3sfq3RG62KOYnWyx
         wVC0K3X8FY7Eb2LRVs93WFazXhHDzSHBW3p2FKtjhkD1Iw5cB/PTmKWJ4nY65fXXobkQ
         RzhA==
X-Gm-Message-State: AOAM5337Vwfx6nCGY/XmZ6zZdotk6/U/dAjq4vqIrduJF309S9E20YXi
	omHAyINrJNlq19JYEBAEdkrnIb/8P64=
X-Google-Smtp-Source: 
 ABdhPJxI/x9LaI1u294da5iJiezlOVe2YYh8+htSsqLDSU0N2KS7Xr45XwuG3Kp7R6fLLAodcypkgA==
X-Received: by 2002:a1c:c917:: with SMTP id f23mr3945923wmb.167.1633893014511;
        Sun, 10 Oct 2021 12:10:14 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/13] librsvg: use only the target architecture to determine
 availability of atomic primitives
Date: Sun, 10 Oct 2021 21:10:01 +0200
Message-Id: <20211010191008.4122049-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156799

This eliminates the hardcoded list of rust targets which can't
possibly include everything from OE universe.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...check-only-the-architecture-not-the-.patch | 148 ++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.52.0.bb  |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils=
-check-only-the-architecture-not-the-.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-=
only-the-architecture-not-the-.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-crossbeam-utils-check-only-the-architecture-not-the-.patch
new file mode 100644
index 00000000000..488c607480b
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-th=
e-architecture-not-the-.patch
@@ -0,0 +1,148 @@
+From 70557b217644901daaf9d8ef793f5e84c937762e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Tue, 5 Oct 2021 23:41:59 +0200
+Subject: [PATCH] crossbeam-utils: check only the architecture, not the who=
le
+ target string
+
+There can be custom targets in use, and it's not possible to make a list
+of them; for the check only the first item in the target string is actually
+relevant (the architecture of the target).
+
+Upstream-Status: Pending [needs an upstream ticket and possibly a rework o=
f list generator script]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ vendor/crossbeam-utils/.cargo-checksum.json |  4 +-
+ vendor/crossbeam-utils/build.rs             |  8 ++-
+ vendor/crossbeam-utils/no_atomic.rs         | 78 ++++++++-------------
+ 3 files changed, 38 insertions(+), 52 deletions(-)
+
+diff --git a/vendor/crossbeam-utils/.cargo-checksum.json b/vendor/crossbea=
m-utils/.cargo-checksum.json
+index 4ffc417..2d476df 100644
+--- a/vendor/crossbeam-utils/.cargo-checksum.json
++++ b/vendor/crossbeam-utils/.cargo-checksum.json
+@@ -1 +1,3 @@
+-{"files":{"CHANGELOG.md":"5242f1740c65509c465c9a36326d344722facff5f5e58dd=
064f7b77806b83a46","Cargo.toml":"ac35a7b8ccb16f1ab256951576537aa4179a316c06=
8929c2acef89e0adc12319","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"68c=
fc4be02429834a19411fba29cb1cb52c841f03ac8104d1bae59a8b2184f9c","no_atomic.r=
s":"a2621c1b029c614fb0ab8e3f5cda2e839df88d90d26133181c1b901965f7eec4","src/=
atomic/atomic_cell.rs":"1a3a1e073340317b5ce7a94e29c6a87db89ff7e00da6b92cb3c=
0339364c3b084","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"7f6afd5bd0da1f7b51765ab=
04da4e5f683588ac2d23506e61bf7007bb1e61ba2","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"ba8f75bf=
f31b8be9275808e8f393e71cc682dfc1109ceccb12f69a3700cff5be","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"0eb5ec1d3c1b40600d88eb70539d14276e32307=
f5bed2b679f50f6a20777a01e","tests/atomic_cell.rs":"6c9453384ecbbe76f8b97b62=
f022d478d3a76b4eae1e960f49790970f5d52158","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"726025ce6351fb56ed629d5a56bdf6e833b7afc5dedfa08de0b056c72=
6b6c26d","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"d82cfc11ce7f2c3faef78d8a684447=
b40d503d9681acebed6cb728d45940c4db"}
+\ No newline at end of file
++{"files":{"CHANGELOG.md":"5242f1740c65509c465c9a36326d344722facff5f5e58dd=
064f7b77806b83a46","Cargo.toml":"ac35a7b8ccb16f1ab256951576537aa4179a316c06=
8929c2acef89e0adc12319","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d",
++"build.rs":"15c1a41a88373231cbc17c7de5ade07c6098455af9cdeef81b576f37ed923=
354",
++"no_atomic.rs":"fda07862ab8c3ac999b58b494fa963e4024a0979037f4c37cf2069d78=
ab6e5ba","src/atomic/atomic_cell.rs":"1a3a1e073340317b5ce7a94e29c6a87db89ff=
7e00da6b92cb3c0339364c3b084","src/atomic/consume.rs":"7a7736fcd64f6473dfea7=
653559ffc5e1a2a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"7f6afd5bd=
0da1f7b51765ab04da4e5f683588ac2d23506e61bf7007bb1e61ba2","src/atomic/seq_lo=
ck.rs":"27182e6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","=
src/atomic/seq_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb=
8024454263b09080088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc27469=
3455a0933a2d7eb0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163=
dbd7a83247e1f1c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8=
458a53e865bf8efab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f5=
59a8f170a4b3247ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker=
.rs":"ba8f75bff31b8be9275808e8f393e71cc682dfc1109ceccb12f69a3700cff5be","sr=
c/sync/sharded_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da4656=
1023d96c4c120f","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c=
538fa0cf7cbcfa1d1f25990582cb6ea","src/thread.rs":"0eb5ec1d3c1b40600d88eb705=
39d14276e32307f5bed2b679f50f6a20777a01e","tests/atomic_cell.rs":"6c9453384e=
cbbe76f8b97b62f022d478d3a76b4eae1e960f49790970f5d52158","tests/cache_padded=
.rs":"1bfaff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","te=
sts/parker.rs":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd=
99d20","tests/sharded_lock.rs":"726025ce6351fb56ed629d5a56bdf6e833b7afc5ded=
fa08de0b056c726b6c26d","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc2=
52a816bc20ab62cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2=
e0737234d418f8b924d784a4db8d7e469deab8c95f5f8"},"package":"d82cfc11ce7f2c3f=
aef78d8a684447b40d503d9681acebed6cb728d45940c4db"}
+diff --git a/vendor/crossbeam-utils/build.rs b/vendor/crossbeam-utils/buil=
d.rs
+index 9c924ad..e97953c 100644
+--- a/vendor/crossbeam-utils/build.rs
++++ b/vendor/crossbeam-utils/build.rs
+@@ -20,17 +20,19 @@ fn main() {
+         }
+     };
+=20
++    let target_arch =3D target.split('-').next().unwrap_or_default();
++
+     // Note that this is `no_*`, not `has_*`. This allows treating
+     // `cfg(target_has_atomic =3D "ptr")` as true when the build script d=
oesn't
+     // run. This is needed for compatibility with non-cargo build systems=
 that
+     // don't run the build script.
+-    if NO_ATOMIC_CAS.contains(&&*target) {
++    if NO_ATOMIC_CAS.contains(&&*target_arch) {
+         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_cas");
+     }
+-    if NO_ATOMIC.contains(&&*target) {
++    if NO_ATOMIC.contains(&&*target_arch) {
+         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic");
+         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
+-    } else if NO_ATOMIC_64.contains(&&*target) {
++    } else if NO_ATOMIC_64.contains(&&*target_arch) {
+         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
+     } else {
+         // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
+diff --git a/vendor/crossbeam-utils/no_atomic.rs b/vendor/crossbeam-utils/=
no_atomic.rs
+index 522b3b8..8096630 100644
+--- a/vendor/crossbeam-utils/no_atomic.rs
++++ b/vendor/crossbeam-utils/no_atomic.rs
+@@ -2,58 +2,40 @@
+ // It is not intended for manual editing.
+=20
+ const NO_ATOMIC_CAS: &[&str] =3D &[
+-    "avr-unknown-gnu-atmega328",
+-    "msp430-none-elf",
+-    "riscv32i-unknown-none-elf",
+-    "riscv32imc-unknown-none-elf",
+-    "thumbv4t-none-eabi",
+-    "thumbv6m-none-eabi",
++    "avr",
++    "msp430",
++    "riscv32i",
++    "riscv32imc",
++    "thumbv4t",
++    "thumbv6m",
+ ];
+ #[allow(dead_code)]
+ const NO_ATOMIC_64: &[&str] =3D &[
+-    "arm-linux-androideabi",
+-    "armebv7r-none-eabi",
+-    "armebv7r-none-eabihf",
+-    "armv4t-unknown-linux-gnueabi",
+-    "armv5te-unknown-linux-gnueabi",
+-    "armv5te-unknown-linux-musleabi",
+-    "armv5te-unknown-linux-uclibceabi",
+-    "armv7r-none-eabi",
+-    "armv7r-none-eabihf",
+-    "hexagon-unknown-linux-musl",
+-    "mips-unknown-linux-gnu",
+-    "mips-unknown-linux-musl",
+-    "mips-unknown-linux-uclibc",
+-    "mipsel-unknown-linux-gnu",
+-    "mipsel-unknown-linux-musl",
+-    "mipsel-unknown-linux-uclibc",
+-    "mipsel-unknown-none",
+-    "mipsisa32r6-unknown-linux-gnu",
+-    "mipsisa32r6el-unknown-linux-gnu",
+-    "powerpc-unknown-linux-gnu",
+-    "powerpc-unknown-linux-gnuspe",
+-    "powerpc-unknown-linux-musl",
+-    "powerpc-unknown-netbsd",
+-    "powerpc-unknown-openbsd",
+-    "powerpc-wrs-vxworks",
+-    "powerpc-wrs-vxworks-spe",
+-    "riscv32gc-unknown-linux-gnu",
+-    "riscv32gc-unknown-linux-musl",
+-    "riscv32imac-unknown-none-elf",
+-    "thumbv7em-none-eabi",
+-    "thumbv7em-none-eabihf",
+-    "thumbv7m-none-eabi",
+-    "thumbv8m.base-none-eabi",
+-    "thumbv8m.main-none-eabi",
+-    "thumbv8m.main-none-eabihf",
+-    "mipsel-sony-psp",
+-    "thumbv4t-none-eabi",
+-    "thumbv6m-none-eabi",
++    "arm",
++    "armebv7r",
++    "armv4t",
++    "armv5te",
++    "armv7r",
++    "hexagon",
++    "mips",
++    "mipsel",
++    "mipsisa32r6",
++    "mipsisa32r6el",
++    "powerpc",
++    "riscv32gc",
++    "riscv32imac",
++    "thumbv7em",
++    "thumbv7m",
++    "thumbv8m.base",
++    "thumbv8m.main",
++    "mipsel",
++    "thumbv4t",
++    "thumbv6m",
+ ];
+ #[allow(dead_code)]
+ const NO_ATOMIC: &[&str] =3D &[
+-    "avr-unknown-gnu-atmega328",
+-    "msp430-none-elf",
+-    "riscv32i-unknown-none-elf",
+-    "riscv32imc-unknown-none-elf",
++    "avr",
++    "msp430",
++    "riscv32i",
++    "riscv32imc",
+ ];
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.52.0.bb
index 28b8bf2dcf2..50489453dfb 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
@@ -22,6 +22,7 @@ SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to=
-cargo-also-when-not-.pat
            file://0002-New-ToPixel-trait.patch \
            file://0003-New-ToCairoARGB-trait.patch \
            file://0004-impl-ToPixel-for-CairoARGB.patch \
+           file://0001-crossbeam-utils-check-only-the-architecture-not-the=
-.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "bd821fb3e16494b61f5185addd23b726b064f20312=
2b3ab4b3d5d7a44e6bf393"
--=20
2.20.1


