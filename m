Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB41C79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 15:53:29 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11014.1788882801441662184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 08:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=E3Dve5Fe;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1993F20B712B
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 08:52:40 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1993F20B712B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1788882760;
	bh=OHNwaclb0EptcfF8EP1G2v1TwzNidyjsrBNoLinfvU4=;
	h=From:To:Subject:Date:From;
	b=E3Dve5Fe3DBWiEfbwDKGBJcuuyt/VZs+b2eK0MOeDbm8d5RTnIFDLFmx7GWhAQeCD
	 uBwc7Khp2VWEdJ5o2SdJvKryVlUHCUCMTIKW/WU5PnDpyuLmFevfct3ysLltde50mr
	 4bfC3qZt5LD6kpXgJvhIN3d4wng5DfFlbNalqIuE=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4] rust: Avoid passing host-specific information to crates
Date: Tue,  8 Sep 2026 15:53:15 +0000
Message-ID: <20260908155315.2468903-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 15:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245378

There were several build contamination issues found on our rust builds:

SVH - rustc computes each crate's Strict Version Hash (SVH) using inputs =
that
    include the *stage0/stage1 bootstrap compiler* fingerprint, which in =
turn
    depends on the build host arch.

    This eventually may cause sstate matches across architectures for art=
ifacts
    that are actually different, causing autobuilder intermitent reproduc=
ibility
    issues.

    To avoid this, pass a fixed value instead of host-specific bits to th=
e
    specified hash.

Cmetadata - Cargo hashes the `host:` line of `rustc -vV` into the metadat=
a of
    host units (build scripts and proc-macros), so target libraries that =
depend
    on a crate carrying a build script inherited the build host triple th=
rough
    -Cmetadata and, from there, each crate's StableCrateId.

Unordered data - DocLinkResMap is an UnordMap wrapping an FxHashMap, so t=
he
    doc-link table was serialised into crate metadata in hash iteration o=
rder,
    which is not stable across hosts. Switch it to FxIndexMap, which is a=
lready
    Encodable, Decodable and HashStable.

    HygieneEncodeContext::encode consumed `latest_ctxts` and `latest_expn=
s`
    directly from an `FxHashSet` without sorting. Payload blobs are seria=
lized
    into the crate metadata buffer during this loop in hash iteration ord=
er.
    Sort both before encoding so payloads are written into metadata in
    deterministic order.

With all three addressed, Rust metadata and compiled libraries are reprod=
ucible
across mixed-architecture build hosts (x86_64 vs aarch64).

[YOCTO #16376]

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 ...ide-cfg-version-from-stable-crate-id.patch | 36 +++++++++++
 ...-host-triple-from-unit-metadata-hash.patch | 55 +++++++++++++++++
 ...oc-link-metadata-order-deterministic.patch | 36 +++++++++++
 ...hygiene-encoding-order-deterministic.patch | 60 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  4 ++
 5 files changed, 191 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0006-rustc-span-add-=
oe-knob-to-elide-cfg-version-from-stable-crate-id.patch
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host=
-triple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-=
doc-link-metadata-order-deterministic.patch
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make=
-hygiene-encoding-order-deterministic.patch

diff --git a/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob=
-to-elide-cfg-version-from-stable-crate-id.patch b/meta/recipes-devtools/=
rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-c=
rate-id.patch
new file mode 100644
index 00000000000..a7d03d9c363
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-eli=
de-cfg-version-from-stable-crate-id.patch
@@ -0,0 +1,36 @@
+rust: Avoid passing host-dependent fingerprint to build artifacts
+
+To fix reproducibility issues, pass a fixed value instead of passing a
+host-dependent fingerprint to the rust build artifacts via the Strict
+Version Hash (SVH)
+
+Upstream-Status: Inappropriate [OE-specific]
+Assisted-by: AI - OpenAI
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
diff --git a/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple=
-from-unit-metadata-hash.patch b/meta/recipes-devtools/rust/files/0007-ca=
rgo-omit-host-triple-from-unit-metadata-hash.patch
new file mode 100644
index 00000000000..ca842858c10
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-u=
nit-metadata-hash.patch
@@ -0,0 +1,55 @@
+cargo: omit the build host triple from the unit metadata hash
+
+Cargo mixes the `host:` line of `rustc -vV` into the metadata hash of ho=
st
+units (build scripts and proc-macros), and every unit additionally hashe=
s the
+metadata of its dependencies. Target libraries that depend on a crate ca=
rrying
+a build script therefore inherit the build host triple, which ends up in
+`-Cmetadata` and consequently in each crate's StableCrateId.
+
+The result is that libraries built for the same target are not reproduci=
ble
+across build hosts of different architectures: only `core` (which has no
+build-script dependency) keeps a stable crate id, while `alloc`, `std` a=
nd
+everything downstream change.
+
+Stop hashing the host triple so the metadata of a unit depends on the ta=
rget
+being built rather than on the machine performing the build.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Assisted-by: AI - OpenAI
+Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
+
+---
+--- a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_f=
iles.rs
++++ b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_f=
iles.rs
+@@ -877,7 +877,7 @@
+ }
+=20
+ /// Hash the version of rustc being used during the build process.
+-fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHa=
sher, unit: &Unit) {
++fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHa=
sher, _unit: &Unit) {
+     let vers =3D &bcx.rustc().version;
+     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlie=
s {
+         // For stable, keep the artifacts separate. This helps if someo=
ne is
+@@ -886,7 +886,7 @@
+         // omitted since rustc should produce the same output for each =
target
+         // regardless of the host.
+         for line in bcx.rustc().verbose_version.lines() {
+-            if unit.kind.is_host() || !line.starts_with("host: ") {
++            if !line.starts_with("host: ") {
+                 line.hash(hasher);
+             }
+         }
+@@ -899,12 +899,6 @@
+     // This assumes that the first segment is the important bit ("night=
ly",
+     // "beta", "dev", etc.). Skip other parts like the `.3` in `-beta.3=
`.
+     vers.pre.split('.').next().hash(hasher);
+-    // Keep "host" since some people switch hosts to implicitly change
+-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we ma=
y want
+-    // to consider hashing `unit.kind.short_name()` instead.
+-    if unit.kind.is_host() {
+-        bcx.rustc().host.hash(hasher);
+-    }
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  <-- or "rustdoc"
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
diff --git a/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-lin=
k-metadata-order-deterministic.patch b/meta/recipes-devtools/rust/files/0=
008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
new file mode 100644
index 00000000000..46fb2ed9712
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metad=
ata-order-deterministic.patch
@@ -0,0 +1,36 @@
+rustc_hir: serialise doc-link resolutions in a deterministic order
+
+DocLinkResMap is an UnordMap, which wraps an FxHashMap and derives its
+Encodable implementation, so crate metadata records the doc-link table i=
n hash
+iteration order. That order is not stable across build hosts, leaving a =
few
+hundred bytes of the .rustc section, and the DefIndex values that follow=
 it,
+different for otherwise identical builds.
+
+Use an insertion-ordered FxIndexMap instead. Entries are added while wal=
king
+the AST, so insertion order is deterministic, and the consumers of this =
map
+only ever look entries up by key.
+
+Upstream-Status: Inappropriate [OE-specific]
+Assisted-by: AI - OpenAI
+Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
+---
+--- a/compiler/rustc_hir/src/def.rs
++++ b/compiler/rustc_hir/src/def.rs
+@@ -4,7 +4,7 @@
+=20
+ use rustc_ast as ast;
+ use rustc_ast::NodeId;
+-use rustc_data_structures::unord::UnordMap;
++use rustc_data_structures::fx::FxIndexMap;
+ use rustc_error_messages::{DiagArgValue, IntoDiagArg};
+ use rustc_macros::{Decodable, Encodable, StableHash};
+ use rustc_span::Symbol;
+@@ -969,4 +969,7 @@
+     ElidedAnchor { start: NodeId, end: NodeId },
+ }
+=20
+-pub type DocLinkResMap =3D UnordMap<(Symbol, Namespace), Option<Res<Nod=
eId>>>;
++// Serialise doc-link resolutions in insertion order: UnordMap wraps an
++// FxHashMap, whose iteration order varies with the build host and leav=
es
++// crate metadata unreproducible across builders.
++pub type DocLinkResMap =3D FxIndexMap<(Symbol, Namespace), Option<Res<N=
odeId>>>;
diff --git a/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygien=
e-encoding-order-deterministic.patch b/meta/recipes-devtools/rust/files/0=
009-rustc-span-make-hygiene-encoding-order-deterministic.patch
new file mode 100644
index 00000000000..93b0fcd68e1
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encod=
ing-order-deterministic.patch
@@ -0,0 +1,60 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alejandro Hernandez <alhe@linux.microsoft.com>
+Date: Mon, 7 Sep 2026 00:00:00 +0000
+Subject: [PATCH] rustc_span: Make hygiene metadata encoding order determ=
inistic
+
+In `HygieneEncodeContext::encode`, `latest_ctxts` (`FxHashSet<SyntaxCont=
ext>`)
+and `latest_expns` (`FxHashSet<ExpnId>`) are consumed by iterating direc=
tly
+over the hash set.
+
+While the table entries storing offsets for syntax contexts and expansio=
ns
+are indexed by ID, `encode_ctxt` and `encode_expn` serialize the actual
+`SyntaxContextData` and `ExpnData` payload blobs directly into the crate
+metadata buffer (`self.opaque`) during this loop.
+
+Because `FxHashSet` iteration order depends on hash values that differ
+between build host architectures, the byte stream of hygiene payloads
+in metadata was non-deterministic across x86_64 and aarch64 build hosts.
+
+Sort `latest_ctxts` and `latest_expns` prior to encoding so hygiene
+payloads are written into metadata in deterministic ascending ID order.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/...]
+[YOCTO #15554]
+
+AI-Generated: Uses GitHub Copilot
+
+--- a/compiler/rustc_span/src/hygiene.rs
++++ b/compiler/rustc_span/src/hygiene.rs
+@@ -1314,24 +1326,26 @@
+             // Consume the current round of syntax contexts.
+             // Drop the lock() temporary early.
+-            // It's fine to iterate over a HashMap, because the seriali=
zation of the table
+-            // that we insert data into doesn't depend on insertion ord=
er.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_ctxts =3D { mem::take(&mut *self.latest_ctxts.lo=
ck()) }.into_iter();
++            let mut latest_ctxts: Vec<_> =3D { mem::take(&mut *self.lat=
est_ctxts.lock()) }.into_iter().collect();
++            latest_ctxts.sort_by_key(|ctxt| ctxt.0);
+             let all_ctxt_data: Vec<_> =3D HygieneData::with(|data| {
+                 latest_ctxts
++                    .into_iter()
+                     .map(|ctxt| (ctxt, data.syntax_context_data[ctxt.0 =
as usize].key()))
+                     .collect()
+             });
+             for (ctxt, ctxt_key) in all_ctxt_data {
+                 if self.serialized_ctxts.lock().insert(ctxt) {
+                     encode_ctxt(encoder, ctxt.0, &ctxt_key);
+                 }
+             }
+=20
+             // Same as above, but for expansions instead of syntax cont=
exts.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_expns =3D { mem::take(&mut *self.latest_expns.lo=
ck()) }.into_iter();
++            let mut latest_expns: Vec<_> =3D { mem::take(&mut *self.lat=
est_expns.lock()) }.into_iter().collect();
++            latest_expns.sort_by_key(|expn| (expn.krate, expn.local_id)=
);
+             let all_expn_data: Vec<_> =3D HygieneData::with(|data| {
+                 latest_expns
++                    .into_iter()
+                     .map(|expn| (expn, data.expn_data(expn).clone(), da=
ta.expn_hash(expn)))
+                     .collect()
+             });
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index 019e2585e28..1d192b1c716 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,10 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${=
RUST_VERSION}-src.tar.xz;n
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing=
.patch;patchdir=3D${RUSTSRC} \
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.p=
atch;patchdir=3D${RUSTSRC} \
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-=
23.patch;patchdir=3D${RUSTSRC} \
+            file://0006-rustc-span-add-oe-knob-to-elide-cfg-version-from=
-stable-crate-id.patch;patchdir=3D${RUSTSRC} \
+            file://0007-cargo-omit-host-triple-from-unit-metadata-hash.p=
atch;patchdir=3D${RUSTSRC} \
+            file://0008-rustc-hir-make-doc-link-metadata-order-determini=
stic.patch;patchdir=3D${RUSTSRC} \
+            file://0009-rustc-span-make-hygiene-encoding-order-determini=
stic.patch;patchdir=3D${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4=
561e4d5470207df616b9f"
=20
--=20
2.43.0


