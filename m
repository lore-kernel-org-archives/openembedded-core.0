Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1A9C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 18:16:45 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.9633.1635013005111231316
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aUq2eHjo;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id k26so6616826pfi.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1LX0vgDIdu49/C54Sq6tSFqDfM2p2ZQdV5tLpPft+I=;
        b=aUq2eHjoYZrjBInGfEwTz9XulSmiO36WcjFWLcFaklxDrwshMOkTRhM+FMZYyqDkTy
         3KMCDeDEz6E4ZC+YTiRPUBh9pxRPJ26ttZpDlGLQlOA/INAO4ql4hgeXmbRzgX/5j/pH
         ugH4WmGRfxKBJh1KMPpro7tCSVrwkgYMTr+1d9fvAv4KelOl+rK2NsurJnlEpEl1ylaQ
         3waw/no9DJwa5X1ZAyTkJAeHpl+H14TiBIGv6coVIsQe8HRnYFYu6nCccVC+WbGwMxPO
         2Q54rkPkEbvSzeCBTkpSdOGlp51IHsud4jhMpYPjSoJAmDWprAQWBnTJJVgNPHb9flde
         JE8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1LX0vgDIdu49/C54Sq6tSFqDfM2p2ZQdV5tLpPft+I=;
        b=RBQ7k+JJUJriTAbRLufYZJQe4bLBK9usCXiRr8v7gZySX7Mrldb/1GsmPXo4Z8nM9W
         YcM/eTatScg9asZFYUYkjA1V7yFrVL/sqMqUil2UfH5Cs2pkJXcc+sSlDeTzOhRdqXei
         1Ib3lvFNzbYSgPYy/sOwXLTANSiIsNRov6C7O2F8QSG49cZdqHpJ8knh2VShmSo0rO23
         C1p6VZ44HCoToaXR3KM0cu3NWYfyOqQejZkTrVABwcFBrN8zvTBGG6rnt03un64jkMPB
         O1GGjzjw5TD+tz79e+6sQ4EgouqCwvIJVT9Lhl+o8T8VT//6mda6RZ0bi1QTq5e99VR9
         oyNw==
X-Gm-Message-State: AOAM530Ps9iakyqs4UEuM/6+X3SxwOBnYLuntX0cL1Nc4lzbRnaTkB5w
	ySFFuy2BZ2Qmo7CTZ3o9h34VGcHLeOfgjw==
X-Google-Smtp-Source: 
 ABdhPJz0sWDBO0thL1bdfcxSkDigFo+PmdZQ296zr9MU4K7ZP83vCV6QFmf1V+Y6uEiBqH2+AU/iFw==
X-Received: by 2002:a05:6a00:cd6:b0:471:aded:3884 with SMTP id
 b22-20020a056a000cd600b00471aded3884mr7747680pfv.18.1635013004033;
        Sat, 23 Oct 2021 11:16:44 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 l11sm14990148pfu.55.2021.10.23.11.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 11:16:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] librsvg: Disable 64bit atomics in crossbeam for rv32
Date: Sat, 23 Oct 2021 11:16:41 -0700
Message-Id: <20211023181641.424368-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Oct 2021 18:16:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157306

This fixes
| error[E0412]: cannot find type `AtomicU64` in module `core::sync::atomic`
|     --> /usr/src/debug/librsvg/2.52.2-r0/librsvg-2.52.2/vendor/crossbeam-=
utils/src/atomic/consume.rs:78:14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../librsvg/riscv32-no-64bit-atomics.patch    | 31 +++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.52.2.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/riscv32-no-64bit-ato=
mics.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/riscv32-no-64bit-atomics.pa=
tch b/meta/recipes-gnome/librsvg/librsvg/riscv32-no-64bit-atomics.patch
new file mode 100644
index 0000000000..5f3274eb97
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/riscv32-no-64bit-atomics.patch
@@ -0,0 +1,31 @@
+Disable 64bit wide atomics in crossbeam-utils
+
+crossbeam leaves no other way to set it when its build system
+is not used, which seems to be the case here, since riscv32
+does not have 64bit atomics, these should be disabled for rv32
+based machines.
+
+It perhaps will be needed on few other 32bit machines too but
+for now lets fix whats broken
+
+Upstream-Status: Inappropriate [Cross compile specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/vendor/crossbeam-utils/.cargo-checksum.json
++++ b/vendor/crossbeam-utils/.cargo-checksum.json
+@@ -1,3 +1,3 @@
+ {"files":{"CHANGELOG.md":"5242f1740c65509c465c9a36326d344722facff5f5e58dd=
064f7b77806b83a46","Cargo.toml":"ac35a7b8ccb16f1ab256951576537aa4179a316c06=
8929c2acef89e0adc12319","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d",
+-"build.rs":"15c1a41a88373231cbc17c7de5ade07c6098455af9cdeef81b576f37ed923=
354",
++"build.rs":"aa5bf576b98f335a46354a1d31e2d7f257ffdde0dd63a911c56389ce5fa34=
51c",
+ "no_atomic.rs":"fda07862ab8c3ac999b58b494fa963e4024a0979037f4c37cf2069d78=
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
+--- a/vendor/crossbeam-utils/build.rs
++++ b/vendor/crossbeam-utils/build.rs
+@@ -36,6 +36,7 @@ fn main() {
+         println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
+     } else {
+         // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
++        println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
+     }
+=20
+     println!("cargo:rerun-if-changed=3Dno_atomic.rs");
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.2.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.52.2.bb
index 1197559904..0c159a5037 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.2.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.2.bb
@@ -25,6 +25,7 @@ SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to=
-cargo-also-when-not-.pat
            file://0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93=
.patch \
            file://0008-Update-checksums-for-modified-files-for-rust-1.54.0=
-.patch \
            "
+SRC_URI:append:riscv32 =3D " file://riscv32-no-64bit-atomics.patch"
=20
 SRC_URI[archive.sha256sum] =3D "03d2887c18ffb906e1a60f97fe46a7169f69aa28d6=
db5d285748f3618b093427"
=20
--=20
2.33.1


