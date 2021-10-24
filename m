Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE13C433F5
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 06:59:48 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.16102.1635058787575723292
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 23:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ce+8XrSz;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id f11so7600482pfc.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Oct 2021 23:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm1UPKWWFEib1Wd5BYUu8ZNJr1KAQhuzEhqddHOfhQI=;
        b=Ce+8XrSzxVs3HIfdPa57us7dgMjFiwnFHT+GJy5dN5UEb19W+lF7Z28o1tu5RH3JN1
         QqS8Flvw5d/GbnGa3zzA16XCwUwC9rq3JjoiWbyYCAAxdaYEpzOddodcaJGS2fvRREk9
         UNIJqMKTAPGP2Q94v2GZvEIQc1qr1f+hRdrqiP43824ECEhmriSjADhPALOIk3P015U7
         Kk6/6PplqV/QCM/0FulKRxzlbt+Ai6z2lXBc9+SrTj11Ztia7ZWmZdvmhP2ffdSoiZTH
         uz9ao36QnK96w3+sp+u6I6E3huw6rleA65sGARZmWSs7W5lSlNWf7HsvRBGoz28CAMu9
         AemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dm1UPKWWFEib1Wd5BYUu8ZNJr1KAQhuzEhqddHOfhQI=;
        b=xs/syOf68IEwcBIX97EF3U6M7vG5n6TtyizbnYDDqAcBoq/86Td4A75Qsiyzoxe9Wt
         AN7cwwKCBDnUzXoDxcoUtYUT+AdftapKh+LfzeVqHN1SSX+cyXTqlusC/pkVjA9n5c+2
         pCLIdtts5+32MLd9sHmabVm/k0hZExuh4cGmF6NU1nJ60exI4ctcbo0VcfcahQUH1LC9
         k4IIpJuZS3rii4mCd/qEan2SauIwVJ/apk92BgS2met4bm4xFmCXM1Glz70vELl8/66s
         yJPdWkkKhrY8B818icU/zI6vMaSfT2b35g12qEOGm2h+EKRezs+FA5RCHnXgVGbgJFY2
         0qTg==
X-Gm-Message-State: AOAM530W8LheLS5PWa9X39pNYp8ZLbpdhuwC0P+3el/kivoRDM1WxLNb
	qLz8J90qc2CxDMTkNpDY0F5q2oX/1dxj2Q==
X-Google-Smtp-Source: 
 ABdhPJz7NKJD9OTEj3/kpyTL1/N8fcif4FC4tEOxRMKVD7M5x/RSSb6HlxBy+WPLRiP2n2afT4zNkA==
X-Received: by 2002:a65:45cd:: with SMTP id m13mr7894134pgr.26.1635058786717;
        Sat, 23 Oct 2021 23:59:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8f6a])
        by smtp.gmail.com with ESMTPSA id
 l17sm17098346pfc.94.2021.10.23.23.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 23:59:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] librsvg: Disable 64bit atomics in crossbeam for rv32
Date: Sat, 23 Oct 2021 23:59:43 -0700
Message-Id: <20211024065943.1880337-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 06:59:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157323

This fixes
| error[E0412]: cannot find type `AtomicU64` in module `core::sync::atomic`
|     --> /usr/src/debug/librsvg/2.52.2-r0/librsvg-2.52.2/vendor/crossbeam-=
utils/src/atomic/consume.rs:  78:14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add riscv32 to NO_ATOMIC_CAS

 ...m-utils-check-only-the-architecture-not-the-.patch | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-=
only-the-architecture-not-the-.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-crossbeam-utils-check-only-the-architecture-not-the-.patch
index 488c607480..0c1cf59eff 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-th=
e-architecture-not-the-.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-crossbeam-utils-check-only-th=
e-architecture-not-the-.patch
@@ -16,8 +16,6 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  vendor/crossbeam-utils/no_atomic.rs         | 78 ++++++++-------------
  3 files changed, 38 insertions(+), 52 deletions(-)
=20
-diff --git a/vendor/crossbeam-utils/.cargo-checksum.json b/vendor/crossbea=
m-utils/.cargo-checksum.json
-index 4ffc417..2d476df 100644
 --- a/vendor/crossbeam-utils/.cargo-checksum.json
 +++ b/vendor/crossbeam-utils/.cargo-checksum.json
 @@ -1 +1,3 @@
@@ -25,9 +23,7 @@ index 4ffc417..2d476df 100644
 \ No newline at end of file
 +{"files":{"CHANGELOG.md":"5242f1740c65509c465c9a36326d344722facff5f5e58dd=
064f7b77806b83a46","Cargo.toml":"ac35a7b8ccb16f1ab256951576537aa4179a316c06=
8929c2acef89e0adc12319","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d",
 +"build.rs":"15c1a41a88373231cbc17c7de5ade07c6098455af9cdeef81b576f37ed923=
354",
-+"no_atomic.rs":"fda07862ab8c3ac999b58b494fa963e4024a0979037f4c37cf2069d78=
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
-diff --git a/vendor/crossbeam-utils/build.rs b/vendor/crossbeam-utils/buil=
d.rs
-index 9c924ad..e97953c 100644
++"no_atomic.rs":"dcbd845deda197b13361238a6aab60b6d8124fb588fd0b33740e12744=
1db3f1a","src/atomic/atomic_cell.rs":"1a3a1e073340317b5ce7a94e29c6a87db89ff=
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
 --- a/vendor/crossbeam-utils/build.rs
 +++ b/vendor/crossbeam-utils/build.rs
 @@ -20,17 +20,19 @@ fn main() {
@@ -53,11 +49,9 @@ index 9c924ad..e97953c 100644
          println!("cargo:rustc-cfg=3Dcrossbeam_no_atomic_64");
      } else {
          // Otherwise, assuming `"max-atomic-width" =3D=3D 64`.
-diff --git a/vendor/crossbeam-utils/no_atomic.rs b/vendor/crossbeam-utils/=
no_atomic.rs
-index 522b3b8..8096630 100644
 --- a/vendor/crossbeam-utils/no_atomic.rs
 +++ b/vendor/crossbeam-utils/no_atomic.rs
-@@ -2,58 +2,40 @@
+@@ -2,58 +2,41 @@
  // It is not intended for manual editing.
=20=20
  const NO_ATOMIC_CAS: &[&str] =3D &[
@@ -125,6 +119,7 @@ index 522b3b8..8096630 100644
 +    "mipsisa32r6",
 +    "mipsisa32r6el",
 +    "powerpc",
++    "riscv32",
 +    "riscv32gc",
 +    "riscv32imac",
 +    "thumbv7em",
--=20
2.33.1


