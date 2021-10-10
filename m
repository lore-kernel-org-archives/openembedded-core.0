Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82642C433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:17 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.2048.1633893016546239702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X1MPm6+k;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id e12so48567586wra.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vipKHt8AHPzWk249oiIG5UzWNaVP8DHPFc9ICzkN21k=;
        b=X1MPm6+k9c8ORIHbYM6rfhOure1fnF7pRdMCd/02SsBsYuCZzxmvgnp+2riONYARo9
         CV6zH8ZND4tDneHoLgL5qltIwm8E7ciyvSwRpcG4VFL7vHYnaMg0PA7k68LactC+zL1x
         MWN7DUnhuSJQ53xHCuKQMjHfXhrHKkmj7TCjEMSZX/RTFfQC5lCxTR4miBbBhFJm+QNw
         Uuy9+kRd80AgkAvWyVnJNNZJtEj1Mv/R7dwOC4s2LGFDsPIOIX8+u1T3EWmLUeVKsTVc
         lhBSLtFM4aBDXsWOTwqtKFJknRfSZOrazpjcuihmQt71tzi1+PPxbe6pJZCVkC9LK+Uq
         G18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vipKHt8AHPzWk249oiIG5UzWNaVP8DHPFc9ICzkN21k=;
        b=BXuPkijolTlKZhz65Rd2zuxZeXa/I4dGszqqpWwiv42oCKW4p/dTZ0VQGbdFunakp4
         bEcTmLOoHwJ7Rv29G2ktKITxRlluqrSuTesaK7DMNoB+QKpOEUEtPfriG7umzP/4lfzy
         m4ZyCEpcnKn6ubM1tjv/jWUcROFzHzJdMhMN9zIkb8OMIzaCg10ZHG5R+Y/0yL9uOviF
         aQajM0sl6BsvwjJDjQ5iogT1T8X3L/Eliga5sgQgjI/4/dXtSB+58rj7FPOU4uNwTBmm
         Sq7XcIR8TXLeUP1xl8+d6IOdCp16ws8NJVIUp6u4Q7g2UKtvbjmI3ENCGo4OH8vMOwsW
         keug==
X-Gm-Message-State: AOAM533McU+j7PCWbaLFAsFBkSqBVgVP36Hzccbe6p7IXpW5pDffCIh3
	HKB9ds7i4DxgEELwd6FK5K9d3a1Uyo0=
X-Google-Smtp-Source: 
 ABdhPJx/HiQc4xNkIDaMSZ6Sexw8BOQdVXQ9PioqqO/CRcD4cyAx5EuByTrI6XQEfOIwUFiGKX5bEg==
X-Received: by 2002:adf:b31d:: with SMTP id
 j29mr19543414wrd.429.1633893015178;
        Sun, 10 Oct 2021 12:10:15 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/13] librsvg: restore reproducibility
Date: Sun, 10 Oct 2021 21:10:02 +0200
Message-Id: <20211010191008.4122049-7-alex@linutronix.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/156800

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ps-sort-dependencies-before-using-th.patch | 53 +++++++++++++++++++
 meta/recipes-gnome/librsvg/librsvg_2.52.0.bb  |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-d=
eps-sort-dependencies-before-using-th.patch

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sor=
t-dependencies-before-using-th.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-vendor-system-deps-sort-dependencies-before-using-th.patch
new file mode 100644
index 00000000000..9fe11930d38
--- /dev/null
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sort-depen=
dencies-before-using-th.patch
@@ -0,0 +1,53 @@
+From 9c20757ef8055535579ca3b7e69834e6917200e2 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 24 Sep 2021 16:20:40 +0200
+Subject: [PATCH] vendor/system-deps: sort dependencies before using them
+
+Otherwise they come out in non-reproducible order, leaking into
+target binaries.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ vendor/system-deps/.cargo-checksum.json | 3 ++-
+ vendor/system-deps/src/lib.rs           | 6 +++---
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/vendor/system-deps/.cargo-checksum.json b/vendor/system-deps/=
.cargo-checksum.json
+index aae6cb9..73155dc 100644
+--- a/vendor/system-deps/.cargo-checksum.json
++++ b/vendor/system-deps/.cargo-checksum.json
+@@ -1 +1,2 @@
+-{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"594e5f14180590adc9ea0a8ba=
1cc35f9a8a260322d08de3037efac3ce1dc729b","src/metadata.rs":"4c8d6ac2c88646a=
5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","src/test.rs":"1ec48d1e4=
43a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","src/tests/testano=
therlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b1424eb=
3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3f8d36a2ce001928=
d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14c3d948118408f3d=
1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.0.pc":"cd39c2ef=
88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","src/tests/testli=
b.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707a52db","s=
rc/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f15315df6538610cf=
cd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f870722b3b08d2f13=
053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
++{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae",
++"src/lib.rs":"d88593afdcb0cc3765bf427913ebb718ac6dcd9d62d1381d9afe44dddef=
3abbf","src/metadata.rs":"4c8d6ac2c88646a5b97ecb50ed44b65e5b2865cce6897add8=
5b29ca2ae08c2bb","src/test.rs":"1ec48d1e443a0a4ac8035a2b60ff0321543aa2fa998=
fee72cf7762a936bf5f8c","src/tests/testanotherlib.pc":"bb4fd942324e6d49ce3be=
cd827aa5c948d1924ca6681904a3695c19b1424eb3c","src/tests/testdata.pc":"43f48=
1e989c03674fed5ef78c6420b3f8d36a2ce001928d86c418d1844acd5e7","src/tests/tes=
tlib-2.0.pc":"152eb0c70c14c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db90b=
45b","src/tests/testlib-3.0.pc":"cd39c2ef88f6828c9291150cc4b624e769abef4846=
74eaebaa4f67979501315f","src/tests/testlib.pc":"75c0d8a5345f65794f583c83e1c=
f0dbf3385af6e6abea1d61bb86eef707a52db","src/tests/toml-missing-file/no-carg=
o-toml-here":"6ab4da4b56f15315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78f7d4=
1fa"},"package":"480c269f870722b3b08d2f13053ce0c2ab722839f472863c3e2d61ff3a=
1c2fa6"}
+diff --git a/vendor/system-deps/src/lib.rs b/vendor/system-deps/src/lib.rs
+index af14348..5f0682e 100644
+--- a/vendor/system-deps/src/lib.rs
++++ b/vendor/system-deps/src/lib.rs
+@@ -242,11 +242,11 @@ impl Dependencies {
+         self.libs.get(name)
+     }
+=20
+-    /// An iterator visiting all system dependencies in arbitrary order.
++    /// An iterator visiting all system dependencies in sorted (for build=
 reproducibility) order.
+     /// The first element of the tuple is the name of the `toml` key defi=
ning the
+     /// dependency in `Cargo.toml`.
+     pub fn iter(&self) -> impl Iterator<Item =3D (&str, &Library)> {
+-        self.libs.iter().map(|(k, v)| (k.as_str(), v))
++        self.libs.iter().map(|(k, v)| (k.as_str(), v)).sorted_by_key(|x| =
x.0)
+     }
+=20
+     fn aggregate_str<F: Fn(&Library) -> &Vec<String>>(
+@@ -338,7 +338,7 @@ impl Dependencies {
+         let mut flags =3D BuildFlags::new();
+         let mut include_paths =3D Vec::new();
+=20
+-        for (name, lib) in self.libs.iter() {
++        for (name, lib) in self.libs.iter().sorted_by_key(|x| x.0) {
+             include_paths.extend(lib.include_paths.clone());
+=20
+             if lib.source =3D=3D Source::EnvVariables
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.52.0.bb
index 50489453dfb..47d3880873a 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.0.bb
@@ -23,6 +23,7 @@ SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to=
-cargo-also-when-not-.pat
            file://0003-New-ToCairoARGB-trait.patch \
            file://0004-impl-ToPixel-for-CairoARGB.patch \
            file://0001-crossbeam-utils-check-only-the-architecture-not-the=
-.patch \
+           file://0001-vendor-system-deps-sort-dependencies-before-using-t=
h.patch \
            "
=20
 SRC_URI[archive.sha256sum] =3D "bd821fb3e16494b61f5185addd23b726b064f20312=
2b3ab4b3d5d7a44e6bf393"
--=20
2.20.1


