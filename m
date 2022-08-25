Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C939BC3F6B0
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 10:49:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.22349.1661424538519596512
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hSwdn0sz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 h204-20020a1c21d5000000b003a5b467c3abso2435949wmh.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=0XRVnNOf1PRg8unzTKa+AeeLi1dkUO7njTnkRjOSNeM=;
        b=hSwdn0sz/kSqmE6Z0TMC3GFEjqkYEr+U77XgE6Xm4QwYCy44AaI6uGn9q/46qzgiBp
         wsVrw0Yq0sMtIqNCoIXIlujXKQF5rRK+f2f6Ek5n0rux0/InTEm+z3pJ485MCNjmGLtX
         vY2btQWgkWKmc/iM2vetJdq5ZPsvwtflVapW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=0XRVnNOf1PRg8unzTKa+AeeLi1dkUO7njTnkRjOSNeM=;
        b=1waCc75yPdQtMISOTxewpUOzSqvRMZ+2bfPyTLYSNFz6EhiKatGwIx37mr/LVtbgn3
         IocW6S+XW2FsqG8GbhP5JBhuLnDT0HICKNkOL5oiwPKYaDsZ5kiuxmQhJOojZatxnrbY
         wgHMn1G4X45EsJAKlGR3bK+dKDyHJOHp4uqMpYpKDMeuMiVoW4lX07KKERSgLRepBIX7
         4nVrWyekViXUJEvqcp+G7Rq+PJORO9giRErnidLckXkhHGEAQdObEjH2sc4RsXdrBUQa
         eb+YQHP3Wyay1puypjwhdcW0b3JoHtNSl4CJR7jVFuesLgKGk/3U2nxo7zPhkcsVOFIV
         AYDQ==
X-Gm-Message-State: ACgBeo3CQtAylKuXQRLvRVgIuS/KCL1RIybjZFkqFr6rzuKLPgKKBVmi
	tPa14KBUaQpma75Rw7TEqbWjcctZVZtYxw==
X-Google-Smtp-Source: 
 AA6agR5GqT1z7UdQn2nE0JKqS76q29u91+wtyJdgYOinjNy0vOHNnvFCM3lOtcKr1J2f3xXfsWdOtw==
X-Received: by 2002:a05:600c:4e0f:b0:3a5:df56:4ea1 with SMTP id
 b15-20020a05600c4e0f00b003a5df564ea1mr1834286wmq.179.1661424536122;
        Thu, 25 Aug 2022 03:48:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8059:8737:891c:87d])
        by smtp.gmail.com with ESMTPSA id
 bh19-20020a05600c3d1300b003a54d610e5fsm5235521wmb.26.2022.08.25.03.48.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 03:48:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] rust: Fix crossbeam-utils for arches without atomics
Date: Thu, 25 Aug 2022 11:48:49 +0100
Message-Id: <20220825104851.3258387-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 10:49:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169844

crossbeam-utils tries to use the triplet to look up whether the target
supports various forms of atomics. We use TARGET_VENDOR and not "-unknown"
in the target case which means this fails and breaks platforms like mips
and powerpc 32 bit. Add a patch to handle TARGET_VENDOR in this case.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 .../rust/rust/crossbeam_atomic.patch          | 33 +++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.63.0.bb     |  3 ++
 3 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/rust/crossbeam_atomic.patch

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index d8be2701367..ce6c983fc0b 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -3,6 +3,7 @@ SRC_URI[rust.sha256sum] =3D "8f44af6dc44cc4146634a4dd5e4cc5=
470b3052a2337019b870c0e
=20
 SRC_URI:append:class-target:pn-rust =3D " \
     file://hardcodepaths.patch \
+    file://crossbeam_atomic.patch \
     file://0001-Add-ENOTSUP-constant-for-riscv32-musl.patch"
 SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcodepath=
s.patch"
=20
diff --git a/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch b/meta/=
recipes-devtools/rust/rust/crossbeam_atomic.patch
new file mode 100644
index 00000000000..64c73810a89
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [OE Specific tweak]
+
+Index: rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.63.0-src.orig/vendor/crossbeam-utils/build.rs
++++ rustc-1.63.0-src/vendor/crossbeam-utils/build.rs
+@@ -29,7 +29,7 @@ use std::env;
+ include!("no_atomic.rs");
+=20
+ fn main() {
+-    let target =3D match env::var("TARGET") {
++    let mut target =3D match env::var("TARGET") {
+         Ok(target) =3D> target,
+         Err(e) =3D> {
+             println!(
+@@ -40,6 +40,8 @@ fn main() {
+             return;
+         }
+     };
++    let vendor =3D env::var("TARGET_VENDOR").unwrap();
++    target =3D target.replace(&vendor, "-unknown");
+=20
+     // Note that this is `no_*`, not `has_*`. This allows treating
+     // `cfg(target_has_atomic =3D "ptr")` as true when the build script d=
oesn't
+Index: rustc-1.63.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- rustc-1.63.0-src.orig/vendor/crossbeam-utils/.cargo-checksum.json
++++ rustc-1.63.0-src/vendor/crossbeam-utils/.cargo-checksum.json
+@@ -1 +1 @@
+-{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"7e7=
4dc72343ff57e83d0a84a9fbdd9ff1645894165909999b4c3d2fba94bc96c","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
+\ No newline at end of file
++{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"d98=
3d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
+\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devto=
ols/rust/rust_1.63.0.bb
index 050f398794f..db797146b09 100644
--- a/meta/recipes-devtools/rust/rust_1.63.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.63.0.bb
@@ -7,6 +7,9 @@ FILES:${PN} +=3D "${libdir}/rustlib"
 FILES:${PN} +=3D "${libdir}/*.so"
 FILES:${PN}-dev =3D ""
=20
+# Used by crossbeam_atomic.patch
+export TARGET_VENDOR
+
 do_compile () {
     rust_runx build --stage 2
 }
--=20
2.34.1


