Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45583C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 01:22:12 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.1002.1671240127621715490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 17:22:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from alsamon-xub.lan (cpe-68-201-55-29.elp.res.rr.com [68.201.55.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id 7B70C20B96F3;
	Fri, 16 Dec 2022 17:22:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B70C20B96F3
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Subject: [PATCH v2] rust: Enable building rust from stable, beta and nightly channels
Date: Fri, 16 Dec 2022 18:21:58 -0700
Message-Id: <20221217012158.923251-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 01:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174766

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Rust follows the train release model via the stable, beta and nightly cha=
nnels,
by default we build rust from the stable channel, however there are certa=
in
features which are only available in the beta or nightly channels.

Make these channels available by setting a RUST_CHANNEL variable which de=
faults
to stable making this change transparent to the user.

The snapshot version used by rust during its compilation wont necessarily=
 match
the version being built, specially if were building from an unstable chan=
nel,
to avoid confusion rename this to SNAPSHOT_VERSION and use RUST_VERSION f=
or the
version to be built, which is automatically defined to PV.

Append -beta or -nightly to rusts PV for signature awareness.

It is important to note that this does not build rust from the beta/night=
ly
published tarball (which today build rust v1.67.0 and v1.68.0 respectivel=
y),
instead this builds rust from the current selected version (1.66.0) and e=
nables
the beta/nightly features for that version.

Setting the variable RUST_CHANNEL=3Dnightly results in the following:

$ rustc -Vv
rustc 1.66.0-nightly

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta/recipes-devtools/rust/rust-snapshot.inc | 7 ++++---
 meta/recipes-devtools/rust/rust-source.inc   | 5 +++--
 meta/recipes-devtools/rust/rust.inc          | 6 +++++-
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-=
devtools/rust/rust-snapshot.inc
index 222f34f9a8..6420bcff55 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -5,7 +5,8 @@
 ## The version is replicated here.
 ## TODO: find a way to add additional SRC_URIs based on the contents of =
an
 ##       earlier SRC_URI.
-RS_VERSION =3D "1.65.0"
+
+SNAPSHOT_VERSION =3D "1.65.0"
 CARGO_VERSION =3D "1.65.0"
=20
 # TODO: Add hashes for other architecture toolchains as well. Make a scr=
ipt?
@@ -27,6 +28,6 @@ SRC_URI +=3D " \
     https://static.rust-lang.org/dist/${CARGO_SNAPSHOT}.tar.xz;name=3Dca=
rgo-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
 "
=20
-RUST_STD_SNAPSHOT =3D "rust-std-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown=
-linux-gnu"
-RUSTC_SNAPSHOT =3D "rustc-${RS_VERSION}-${RUST_BUILD_ARCH}-unknown-linux=
-gnu"
+RUST_STD_SNAPSHOT =3D "rust-std-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-u=
nknown-linux-gnu"
+RUSTC_SNAPSHOT =3D "rustc-${SNAPSHOT_VERSION}-${RUST_BUILD_ARCH}-unknown=
-linux-gnu"
 CARGO_SNAPSHOT =3D "cargo-${CARGO_VERSION}-${RUST_BUILD_ARCH}-unknown-li=
nux-gnu"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index 1c511917e2..91a6c5a942 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,4 +1,5 @@
-SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;n=
ame=3Drust"
+RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
+SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-sr=
c.tar.xz;name=3Drust"
 SRC_URI[rust.sha256sum] =3D "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428=
d29281a07419c4950715c"
=20
 SRC_URI:append:class-target:pn-rust =3D " \
@@ -6,7 +7,7 @@ SRC_URI:append:class-target:pn-rust =3D " \
     file://crossbeam_atomic.patch"
 SRC_URI:append:class-nativesdk:pn-nativesdk-rust =3D " file://hardcodepa=
ths.patch"
=20
-RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
+RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
 UPSTREAM_CHECK_URI =3D "https://forge.rust-lang.org/infra/other-installa=
tion-methods.html"
 UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-src"
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
index 8d25e7993a..37a04e1204 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -13,6 +13,10 @@ DEPENDS:append:class-nativesdk =3D " nativesdk-rust-ll=
vm"
=20
 S =3D "${RUSTSRC}"
=20
+# Use at your own risk, accepted values are stable, beta and nightly
+RUST_CHANNEL ?=3D "stable"
+PV:append =3D "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RU=
ST_CHANNEL}', d)}"
+
 export FORCE_CRATE_HASH=3D"${BB_TASKHASH}"
=20
 RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-confi=
g"
@@ -116,7 +120,7 @@ python do_configure() {
     # [rust]
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
-    config.set("rust", "channel", e("stable"))
+    config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
=20
     # Whether or not to optimize the compiler and standard library
     config.set("rust", "optimize", e(True))
--=20
2.34.1


