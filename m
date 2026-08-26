Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BA7C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 15:54:32 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16045.1787759663186575026
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 08:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=CqigCsfO;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id AF2EA20B7166
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:53:49 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AF2EA20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787759629;
	bh=qznLn3sYlZxazRcOgxvTgTV6zr0qGz9Y3thC+e2LbAE=;
	h=From:To:Subject:Date:From;
	b=CqigCsfOsBo5/PevrDFTN9ZmnRiGWoRnR5it2I2hbxs1x4TDuWsrMnXKhxBsr6ihA
	 f14aWEnbN70ofww9qIqr197NDEcAES4ziv74BdvaVKarpL3qXXoNZOzXxLwN1LlNM+
	 vZljMO2rgVs80qdB6yelMCsMvXykZ7Qx2CreIOXE=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] rust: Avoid passing host-specific information to crates Strict Version Hash
Date: Wed, 26 Aug 2026 15:54:17 +0000
Message-ID: <20260826155417.2774608-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 15:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244405

rustc computes each crate's Strict Version Hash (SVH) using inputs that i=
nclude
the *stage0/stage1 bootstrap compiler* fingerprint, which in turn depends=
 on the
build host arch.

This eventually may cause sstate matches across architectures for artifac=
ts that
are actually different, causing autobuilder intermitent reproducibility i=
ssues.

To avoid this, pass a fixed value instead of host-specific bits to the sp=
ecified
hash.

[YOCTO #15554]

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 ...ide-cfg-version-from-stable-crate-id.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0003-rustc-span-add-=
oe-knob-to-elide-cfg-version-from-stable-crate-id.patch

diff --git a/meta/recipes-devtools/rust/files/0003-rustc-span-add-oe-knob=
-to-elide-cfg-version-from-stable-crate-id.patch b/meta/recipes-devtools/=
rust/files/0003-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-c=
rate-id.patch
new file mode 100644
index 0000000000..f9d171df75
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0003-rustc-span-add-oe-knob-to-eli=
de-cfg-version-from-stable-crate-id.patch
@@ -0,0 +1,35 @@
+rust: Avoid passing host-dependent fingerprint to build artifacts
+
+To fix reproducibility issues, pass a fixed value instead of passing a
+host-dependent fingerprint to the rust build artifacts via the Strict
+Version Hash (SVH)
+
+Upstream-Status: Inappropriate [OE-specific reproducibility policy]
+Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
+---
+--- a/compiler/rustc_span/src/def_id.rs
++++ b/compiler/rustc_span/src/def_id.rs
+@@ -163,7 +163,7 @@
+         crate_name: Symbol,
+         is_exe: bool,
+         mut metadata: Vec<String>,
+-        cfg_version: &'static str,
++        _cfg_version: &'static str,
+     ) -> StableCrateId {
+         let mut hasher =3D StableHasher::new();
+         // We must hash the string text of the crate name, not the id, =
as the id is not stable
+@@ -195,11 +195,9 @@
+         //
+         // RUSTC_FORCE_RUSTC_VERSION is used to inject rustc version in=
formation
+         // during testing.
+-        if let Some(val) =3D std::env::var_os("RUSTC_FORCE_RUSTC_VERSIO=
N") {
+-            hasher.write(val.to_string_lossy().into_owned().as_bytes())
+-        } else {
+-            hasher.write(cfg_version.as_bytes())
+-        }
++        // OE reproducible builds use a fixed value so host-varying boo=
tstrap
++        // fingerprints do not perturb StableCrateId.
++        hasher.write(b"oe-stable-crate-id-no-cfg-version");
+=20
+         StableCrateId(hasher.finish())
+     }
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index 68f3009a7b..2bff69de3d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,6 +6,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-=
rust.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.pat=
ch;patchdir=3D${RUSTSRC} \
+            file://0003-rustc-span-add-oe-knob-to-elide-cfg-version-from=
-stable-crate-id.patch;patchdir=3D${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "0ed06fdaffd4722a7702e0b4eebfafc897ab8f513e8=
e1b247cdd7e5c6df6ded2"
=20
--=20
2.43.0


