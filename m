Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD2DC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 16:03:20 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11305.1788883395020959792
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 09:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=tK/IMLm3;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [52.172.102.222])
	by linux.microsoft.com (Postfix) with ESMTPSA id A0F0520B7128
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 09:02:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A0F0520B7128
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1788883353;
	bh=NIzKv/p2jVVJRS7CzpJ7uuY1+OLdyOOlplhFtJKSofk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tK/IMLm3UsGM64ewEwXw3OPx6YZMRx0NVGWxCXKzCsNphg3jRi44/Bc+amFaFkKcy
	 0Pw6YReqk8hGUTVo75YylKI8paa+pavix8D2vSKgl1KmjCP+/H+dmzPng/kRfdDQtC
	 3gHKjBv0pW96wyxr1MYXREali01fDC6S4l7mCFlk=
Content-Type: multipart/alternative;
 boundary="------------hPE1rg5BUts4cVDKnBkKSayD"
Message-ID: <bdb742a4-8a83-4424-bdfa-7bd29ebdf421@linux.microsoft.com>
Date: Tue, 8 Sep 2026 10:03:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5] rust: Avoid passing host-specific
 information to crates
To: openembedded-core@lists.openembedded.org
References: <18D363CCD7DEB481.108400@lists.openembedded.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <18D363CCD7DEB481.108400@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 16:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245381

This is a multi-part message in MIME format.
--------------hPE1rg5BUts4cVDKnBkKSayD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I was able to debug a few more issues, I admit I don't have an autobuilder set up
available so its still possible that this wont address everything, but I think its
worth spinning it at this point.

To find these, I attempted to reproduce the reproducibility check, I did iterative
builds on x86-64 and aarch64 hosts and did byte-to-byte comparison on the build
artifacts.

Fixed the build tag based on the comment by Richard, and v4 -> v5 had some typos.

Please let me know the results of the AB testing.


Thanks,

Alejandro

On 9/8/2026 10:00 AM, Alejandro Hernandez Samaniego via 
lists.openembedded.org wrote:
> There were several build contamination issues found on our rust builds:
>
> SVH - rustc computes each crate's Strict Version Hash (SVH) using inputs that
>      include the *stage0/stage1 bootstrap compiler* fingerprint, which in turn
>      depends on the build host arch.
>
>      This eventually may cause sstate matches across architectures for artifacts
>      that are actually different, causing autobuilder intermitent reproducibility
>      issues.
>
>      To avoid this, pass a fixed value instead of host-specific bits to the
>      specified hash.
>
> Cmetadata - Cargo hashes the `host:` line of `rustc -vV` into the metadata of
>      host units (build scripts and proc-macros), so target libraries that depend
>      on a crate carrying a build script inherited the build host triple through
>      -Cmetadata and, from there, each crate's StableCrateId.
>
> Unordered data - DocLinkResMap is an UnordMap wrapping an FxHashMap, so the
>      doc-link table was serialised into crate metadata in hash iteration order,
>      which is not stable across hosts. Switch it to FxIndexMap, which is already
>      Encodable, Decodable and HashStable.
>
>      HygieneEncodeContext::encode consumed `latest_ctxts` and `latest_expns`
>      directly from an `FxHashSet` without sorting. Payload blobs are serialized
>      into the crate metadata buffer during this loop in hash iteration order.
>      Sort both before encoding so payloads are written into metadata in
>      deterministic order.
>
> With all three addressed, Rust metadata and compiled libraries are reproducible
> across mixed-architecture build hosts (x86_64 vs aarch64).
>
> [YOCTO #16376]
>
> Assisted-by: AI - OpenAI
> Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
> ---
>   ...ide-cfg-version-from-stable-crate-id.patch | 36 +++++++++++
>   ...-host-triple-from-unit-metadata-hash.patch | 55 +++++++++++++++++
>   ...oc-link-metadata-order-deterministic.patch | 36 +++++++++++
>   ...hygiene-encoding-order-deterministic.patch | 59 +++++++++++++++++++
>   meta/recipes-devtools/rust/rust-source.inc    |  4 ++
>   5 files changed, 190 insertions(+)
>   create mode 100644 meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch
>   create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
>   create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
>   create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
>
> diff --git a/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch b/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch
> new file mode 100644
> index 00000000000..a7d03d9c363
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch
> @@ -0,0 +1,36 @@
> +rust: Avoid passing host-dependent fingerprint to build artifacts
> +
> +To fix reproducibility issues, pass a fixed value instead of passing a
> +host-dependent fingerprint to the rust build artifacts via the Strict
> +Version Hash (SVH)
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +Assisted-by: AI - OpenAI
> +Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
> +---
> +--- a/compiler/rustc_span/src/def_id.rs
> ++++ b/compiler/rustc_span/src/def_id.rs
> +@@ -163,7 +163,7 @@
> +         crate_name: Symbol,
> +         is_exe: bool,
> +         mut metadata: Vec<String>,
> +-        cfg_version: &'static str,
> ++        _cfg_version: &'static str,
> +     ) -> StableCrateId {
> +         let mut hasher = StableHasher::new();
> +         // We must hash the string text of the crate name, not the id, as the id is not stable
> +@@ -195,11 +195,9 @@
> +         //
> +         // RUSTC_FORCE_RUSTC_VERSION is used to inject rustc version information
> +         // during testing.
> +-        if let Some(val) = std::env::var_os("RUSTC_FORCE_RUSTC_VERSION") {
> +-            hasher.write(val.to_string_lossy().into_owned().as_bytes())
> +-        } else {
> +-            hasher.write(cfg_version.as_bytes())
> +-        }
> ++        // OE reproducible builds use a fixed value so host-varying bootstrap
> ++        // fingerprints do not perturb StableCrateId.
> ++        hasher.write(b"oe-stable-crate-id-no-cfg-version");
> +
> +         StableCrateId(hasher.finish())
> +     }
> diff --git a/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
> new file mode 100644
> index 00000000000..ca842858c10
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
> @@ -0,0 +1,55 @@
> +cargo: omit the build host triple from the unit metadata hash
> +
> +Cargo mixes the `host:` line of `rustc -vV` into the metadata hash of host
> +units (build scripts and proc-macros), and every unit additionally hashes the
> +metadata of its dependencies. Target libraries that depend on a crate carrying
> +a build script therefore inherit the build host triple, which ends up in
> +`-Cmetadata` and consequently in each crate's StableCrateId.
> +
> +The result is that libraries built for the same target are not reproducible
> +across build hosts of different architectures: only `core` (which has no
> +build-script dependency) keeps a stable crate id, while `alloc`, `std` and
> +everything downstream change.
> +
> +Stop hashing the host triple so the metadata of a unit depends on the target
> +being built rather than on the machine performing the build.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +
> +Assisted-by: AI - OpenAI
> +Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
> +
> +---
> +--- a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
> ++++ b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
> +@@ -877,7 +877,7 @@
> + }
> +
> + /// Hash the version of rustc being used during the build process.
> +-fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, unit: &Unit) {
> ++fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher, _unit: &Unit) {
> +     let vers = &bcx.rustc().version;
> +     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
> +         // For stable, keep the artifacts separate. This helps if someone is
> +@@ -886,7 +886,7 @@
> +         // omitted since rustc should produce the same output for each target
> +         // regardless of the host.
> +         for line in bcx.rustc().verbose_version.lines() {
> +-            if unit.kind.is_host() || !line.starts_with("host: ") {
> ++            if !line.starts_with("host: ") {
> +                 line.hash(hasher);
> +             }
> +         }
> +@@ -899,12 +899,6 @@
> +     // This assumes that the first segment is the important bit ("nightly",
> +     // "beta", "dev", etc.). Skip other parts like the `.3` in `-beta.3`.
> +     vers.pre.split('.').next().hash(hasher);
> +-    // Keep "host" since some people switch hosts to implicitly change
> +-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
> +-    // to consider hashing `unit.kind.short_name()` instead.
> +-    if unit.kind.is_host() {
> +-        bcx.rustc().host.hash(hasher);
> +-    }
> +     // None of the other lines are important. Currently they are:
> +     // binary: rustc  <-- or "rustdoc"
> +     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
> diff --git a/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
> new file mode 100644
> index 00000000000..46fb2ed9712
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
> @@ -0,0 +1,36 @@
> +rustc_hir: serialise doc-link resolutions in a deterministic order
> +
> +DocLinkResMap is an UnordMap, which wraps an FxHashMap and derives its
> +Encodable implementation, so crate metadata records the doc-link table in hash
> +iteration order. That order is not stable across build hosts, leaving a few
> +hundred bytes of the .rustc section, and the DefIndex values that follow it,
> +different for otherwise identical builds.
> +
> +Use an insertion-ordered FxIndexMap instead. Entries are added while walking
> +the AST, so insertion order is deterministic, and the consumers of this map
> +only ever look entries up by key.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +Assisted-by: AI - OpenAI
> +Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
> +---
> +--- a/compiler/rustc_hir/src/def.rs
> ++++ b/compiler/rustc_hir/src/def.rs
> +@@ -4,7 +4,7 @@
> +
> + use rustc_ast as ast;
> + use rustc_ast::NodeId;
> +-use rustc_data_structures::unord::UnordMap;
> ++use rustc_data_structures::fx::FxIndexMap;
> + use rustc_error_messages::{DiagArgValue, IntoDiagArg};
> + use rustc_macros::{Decodable, Encodable, StableHash};
> + use rustc_span::Symbol;
> +@@ -969,4 +969,7 @@
> +     ElidedAnchor { start: NodeId, end: NodeId },
> + }
> +
> +-pub type DocLinkResMap = UnordMap<(Symbol, Namespace), Option<Res<NodeId>>>;
> ++// Serialise doc-link resolutions in insertion order: UnordMap wraps an
> ++// FxHashMap, whose iteration order varies with the build host and leaves
> ++// crate metadata unreproducible across builders.
> ++pub type DocLinkResMap = FxIndexMap<(Symbol, Namespace), Option<Res<NodeId>>>;
> diff --git a/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
> new file mode 100644
> index 00000000000..40ebe10c276
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
> @@ -0,0 +1,59 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Alejandro Hernandez<alhe@linux.microsoft.com>
> +Date: Mon, 7 Sep 2026 00:00:00 +0000
> +Subject: [PATCH] rustc_span: Make hygiene metadata encoding order deterministic
> +
> +In `HygieneEncodeContext::encode`, `latest_ctxts` (`FxHashSet<SyntaxContext>`)
> +and `latest_expns` (`FxHashSet<ExpnId>`) are consumed by iterating directly
> +over the hash set.
> +
> +While the table entries storing offsets for syntax contexts and expansions
> +are indexed by ID, `encode_ctxt` and `encode_expn` serialize the actual
> +`SyntaxContextData` and `ExpnData` payload blobs directly into the crate
> +metadata buffer (`self.opaque`) during this loop.
> +
> +Because `FxHashSet` iteration order depends on hash values that differ
> +between build host architectures, the byte stream of hygiene payloads
> +in metadata was non-deterministic across x86_64 and aarch64 build hosts.
> +
> +Sort `latest_ctxts` and `latest_expns` prior to encoding so hygiene
> +payloads are written into metadata in deterministic ascending ID order.
> +
> +Upstream-Status: Inappropriate [OE-specific]
> +Assisted-by: AI - OpenAI
> +Signed-off-by: Alejandro Hernandez<alhe@linux.microsoft.com>
> +
> +--- a/compiler/rustc_span/src/hygiene.rs
> ++++ b/compiler/rustc_span/src/hygiene.rs
> +@@ -1314,24 +1326,26 @@
> +             // Consume the current round of syntax contexts.
> +             // Drop the lock() temporary early.
> +-            // It's fine to iterate over a HashMap, because the serialization of the table
> +-            // that we insert data into doesn't depend on insertion order.
> +             #[allow(rustc::potential_query_instability)]
> +-            let latest_ctxts = { mem::take(&mut *self.latest_ctxts.lock()) }.into_iter();
> ++            let mut latest_ctxts: Vec<_> = { mem::take(&mut *self.latest_ctxts.lock()) }.into_iter().collect();
> ++            latest_ctxts.sort_by_key(|ctxt| ctxt.0);
> +             let all_ctxt_data: Vec<_> = HygieneData::with(|data| {
> +                 latest_ctxts
> ++                    .into_iter()
> +                     .map(|ctxt| (ctxt, data.syntax_context_data[ctxt.0 as usize].key()))
> +                     .collect()
> +             });
> +             for (ctxt, ctxt_key) in all_ctxt_data {
> +                 if self.serialized_ctxts.lock().insert(ctxt) {
> +                     encode_ctxt(encoder, ctxt.0, &ctxt_key);
> +                 }
> +             }
> +
> +             // Same as above, but for expansions instead of syntax contexts.
> +             #[allow(rustc::potential_query_instability)]
> +-            let latest_expns = { mem::take(&mut *self.latest_expns.lock()) }.into_iter();
> ++            let mut latest_expns: Vec<_> = { mem::take(&mut *self.latest_expns.lock()) }.into_iter().collect();
> ++            latest_expns.sort_by_key(|expn| (expn.krate, expn.local_id));
> +             let all_expn_data: Vec<_> = HygieneData::with(|data| {
> +                 latest_expns
> ++                    .into_iter()
> +                     .map(|expn| (expn, data.expn_data(expn).clone(), data.expn_hash(expn)))
> +                     .collect()
> +             });
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index 019e2585e28..1d192b1c716 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -9,6 +9,10 @@ SRC_URI +="https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n 
> file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patchdir=${RUSTSRC} 
> \ 
> file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} 
> \ 
> file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} 
> \ + 
> file://0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch;patchdir=${RUSTSRC} 
> \ + 
> file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} 
> \ + 
> file://0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch;patchdir=${RUSTSRC} 
> \ + 
> file://0009-rustc-span-make-hygiene-encoding-order-deterministic.patch;patchdir=${RUSTSRC} 
> \ "
>   SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#245379):https://lists.openembedded.org/g/openembedded-core/message/245379
> Mute This Topic:https://lists.openembedded.org/mt/121147070/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------hPE1rg5BUts4cVDKnBkKSayD
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>I was able to debug a few more issues, I admit I don't have an autobuilder set up
available so its still possible that this wont address everything, but I think its
worth spinning it at this point.

To find these, I attempted to reproduce the reproducibility check, I did iterative
builds on x86-64 and aarch64 hosts and did byte-to-byte comparison on the build
artifacts.

Fixed the build tag based on the comment by Richard, and v4 -&gt; v5 had some typos.

Please let me know the results of the AB testing.


Thanks,

Alejandro</pre>
    <div class="moz-cite-prefix">On 9/8/2026 10:00 AM, Alejandro
      Hernandez Samaniego via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:18D363CCD7DEB481.108400@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">There were several build contamination issues found on our rust builds:

SVH - rustc computes each crate's Strict Version Hash (SVH) using inputs that
    include the *stage0/stage1 bootstrap compiler* fingerprint, which in turn
    depends on the build host arch.

    This eventually may cause sstate matches across architectures for artifacts
    that are actually different, causing autobuilder intermitent reproducibility
    issues.

    To avoid this, pass a fixed value instead of host-specific bits to the
    specified hash.

Cmetadata - Cargo hashes the `host:` line of `rustc -vV` into the metadata of
    host units (build scripts and proc-macros), so target libraries that depend
    on a crate carrying a build script inherited the build host triple through
    -Cmetadata and, from there, each crate's StableCrateId.

Unordered data - DocLinkResMap is an UnordMap wrapping an FxHashMap, so the
    doc-link table was serialised into crate metadata in hash iteration order,
    which is not stable across hosts. Switch it to FxIndexMap, which is already
    Encodable, Decodable and HashStable.

    HygieneEncodeContext::encode consumed `latest_ctxts` and `latest_expns`
    directly from an `FxHashSet` without sorting. Payload blobs are serialized
    into the crate metadata buffer during this loop in hash iteration order.
    Sort both before encoding so payloads are written into metadata in
    deterministic order.

With all three addressed, Rust metadata and compiled libraries are reproducible
across mixed-architecture build hosts (x86_64 vs aarch64).

[YOCTO #16376]

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
---
 ...ide-cfg-version-from-stable-crate-id.patch | 36 +++++++++++
 ...-host-triple-from-unit-metadata-hash.patch | 55 +++++++++++++++++
 ...oc-link-metadata-order-deterministic.patch | 36 +++++++++++
 ...hygiene-encoding-order-deterministic.patch | 59 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  4 ++
 5 files changed, 190 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch
 create mode 100644 meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
 create mode 100644 meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
 create mode 100644 meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch

diff --git a/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch b/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch
new file mode 100644
index 00000000000..a7d03d9c363
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch
@@ -0,0 +1,36 @@
+rust: Avoid passing host-dependent fingerprint to build artifacts
+
+To fix reproducibility issues, pass a fixed value instead of passing a
+host-dependent fingerprint to the rust build artifacts via the Strict
+Version Hash (SVH)
+
+Upstream-Status: Inappropriate [OE-specific]
+Assisted-by: AI - OpenAI
+Signed-off-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
+---
+--- a/compiler/rustc_span/src/def_id.rs
++++ b/compiler/rustc_span/src/def_id.rs
+@@ -163,7 +163,7 @@
+         crate_name: Symbol,
+         is_exe: bool,
+         mut metadata: Vec&lt;String&gt;,
+-        cfg_version: &amp;'static str,
++        _cfg_version: &amp;'static str,
+     ) -&gt; StableCrateId {
+         let mut hasher = StableHasher::new();
+         // We must hash the string text of the crate name, not the id, as the id is not stable
+@@ -195,11 +195,9 @@
+         //
+         // RUSTC_FORCE_RUSTC_VERSION is used to inject rustc version information
+         // during testing.
+-        if let Some(val) = std::env::var_os("RUSTC_FORCE_RUSTC_VERSION") {
+-            hasher.write(val.to_string_lossy().into_owned().as_bytes())
+-        } else {
+-            hasher.write(cfg_version.as_bytes())
+-        }
++        // OE reproducible builds use a fixed value so host-varying bootstrap
++        // fingerprints do not perturb StableCrateId.
++        hasher.write(b"oe-stable-crate-id-no-cfg-version");
+ 
+         StableCrateId(hasher.finish())
+     }
diff --git a/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
new file mode 100644
index 00000000000..ca842858c10
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-from-unit-metadata-hash.patch
@@ -0,0 +1,55 @@
+cargo: omit the build host triple from the unit metadata hash
+
+Cargo mixes the `host:` line of `rustc -vV` into the metadata hash of host
+units (build scripts and proc-macros), and every unit additionally hashes the
+metadata of its dependencies. Target libraries that depend on a crate carrying
+a build script therefore inherit the build host triple, which ends up in
+`-Cmetadata` and consequently in each crate's StableCrateId.
+
+The result is that libraries built for the same target are not reproducible
+across build hosts of different architectures: only `core` (which has no
+build-script dependency) keeps a stable crate id, while `alloc`, `std` and
+everything downstream change.
+
+Stop hashing the host triple so the metadata of a unit depends on the target
+being built rather than on the machine performing the build.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Assisted-by: AI - OpenAI
+Signed-off-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
+
+---
+--- a/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
++++ b/src/tools/cargo/src/cargo/core/compiler/build_runner/compilation_files.rs
+@@ -877,7 +877,7 @@
+ }
+ 
+ /// Hash the version of rustc being used during the build process.
+-fn hash_rustc_version(bcx: &amp;BuildContext&lt;'_, '_&gt;, hasher: &amp;mut StableHasher, unit: &amp;Unit) {
++fn hash_rustc_version(bcx: &amp;BuildContext&lt;'_, '_&gt;, hasher: &amp;mut StableHasher, _unit: &amp;Unit) {
+     let vers = &amp;bcx.rustc().version;
+     if vers.pre.is_empty() || bcx.gctx.cli_unstable().separate_nightlies {
+         // For stable, keep the artifacts separate. This helps if someone is
+@@ -886,7 +886,7 @@
+         // omitted since rustc should produce the same output for each target
+         // regardless of the host.
+         for line in bcx.rustc().verbose_version.lines() {
+-            if unit.kind.is_host() || !line.starts_with("host: ") {
++            if !line.starts_with("host: ") {
+                 line.hash(hasher);
+             }
+         }
+@@ -899,12 +899,6 @@
+     // This assumes that the first segment is the important bit ("nightly",
+     // "beta", "dev", etc.). Skip other parts like the `.3` in `-beta.3`.
+     vers.pre.split('.').next().hash(hasher);
+-    // Keep "host" since some people switch hosts to implicitly change
+-    // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
+-    // to consider hashing `unit.kind.short_name()` instead.
+-    if unit.kind.is_host() {
+-        bcx.rustc().host.hash(hasher);
+-    }
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  &lt;-- or "rustdoc"
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
diff --git a/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
new file mode 100644
index 00000000000..46fb2ed9712
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch
@@ -0,0 +1,36 @@
+rustc_hir: serialise doc-link resolutions in a deterministic order
+
+DocLinkResMap is an UnordMap, which wraps an FxHashMap and derives its
+Encodable implementation, so crate metadata records the doc-link table in hash
+iteration order. That order is not stable across build hosts, leaving a few
+hundred bytes of the .rustc section, and the DefIndex values that follow it,
+different for otherwise identical builds.
+
+Use an insertion-ordered FxIndexMap instead. Entries are added while walking
+the AST, so insertion order is deterministic, and the consumers of this map
+only ever look entries up by key.
+
+Upstream-Status: Inappropriate [OE-specific]
+Assisted-by: AI - OpenAI
+Signed-off-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
+---
+--- a/compiler/rustc_hir/src/def.rs
++++ b/compiler/rustc_hir/src/def.rs
+@@ -4,7 +4,7 @@
+ 
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
+ 
+-pub type DocLinkResMap = UnordMap&lt;(Symbol, Namespace), Option&lt;Res&lt;NodeId&gt;&gt;&gt;;
++// Serialise doc-link resolutions in insertion order: UnordMap wraps an
++// FxHashMap, whose iteration order varies with the build host and leaves
++// crate metadata unreproducible across builders.
++pub type DocLinkResMap = FxIndexMap&lt;(Symbol, Namespace), Option&lt;Res&lt;NodeId&gt;&gt;&gt;;
diff --git a/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
new file mode 100644
index 00000000000..40ebe10c276
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene-encoding-order-deterministic.patch
@@ -0,0 +1,59 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
+Date: Mon, 7 Sep 2026 00:00:00 +0000
+Subject: [PATCH] rustc_span: Make hygiene metadata encoding order deterministic
+
+In `HygieneEncodeContext::encode`, `latest_ctxts` (`FxHashSet&lt;SyntaxContext&gt;`)
+and `latest_expns` (`FxHashSet&lt;ExpnId&gt;`) are consumed by iterating directly
+over the hash set.
+
+While the table entries storing offsets for syntax contexts and expansions
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
+Upstream-Status: Inappropriate [OE-specific]
+Assisted-by: AI - OpenAI
+Signed-off-by: Alejandro Hernandez <a class="moz-txt-link-rfc2396E" href="mailto:alhe@linux.microsoft.com">&lt;alhe@linux.microsoft.com&gt;</a>
+
+--- a/compiler/rustc_span/src/hygiene.rs
++++ b/compiler/rustc_span/src/hygiene.rs
+@@ -1314,24 +1326,26 @@
+             // Consume the current round of syntax contexts.
+             // Drop the lock() temporary early.
+-            // It's fine to iterate over a HashMap, because the serialization of the table
+-            // that we insert data into doesn't depend on insertion order.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_ctxts = { mem::take(&amp;mut *self.latest_ctxts.lock()) }.into_iter();
++            let mut latest_ctxts: Vec&lt;_&gt; = { mem::take(&amp;mut *self.latest_ctxts.lock()) }.into_iter().collect();
++            latest_ctxts.sort_by_key(|ctxt| ctxt.0);
+             let all_ctxt_data: Vec&lt;_&gt; = HygieneData::with(|data| {
+                 latest_ctxts
++                    .into_iter()
+                     .map(|ctxt| (ctxt, data.syntax_context_data[ctxt.0 as usize].key()))
+                     .collect()
+             });
+             for (ctxt, ctxt_key) in all_ctxt_data {
+                 if self.serialized_ctxts.lock().insert(ctxt) {
+                     encode_ctxt(encoder, ctxt.0, &amp;ctxt_key);
+                 }
+             }
+ 
+             // Same as above, but for expansions instead of syntax contexts.
+             #[allow(rustc::potential_query_instability)]
+-            let latest_expns = { mem::take(&amp;mut *self.latest_expns.lock()) }.into_iter();
++            let mut latest_expns: Vec&lt;_&gt; = { mem::take(&amp;mut *self.latest_expns.lock()) }.into_iter().collect();
++            latest_expns.sort_by_key(|expn| (expn.krate, expn.local_id));
+             let all_expn_data: Vec&lt;_&gt; = HygieneData::with(|data| {
+                 latest_expns
++                    .into_iter()
+                     .map(|expn| (expn, data.expn_data(expn).clone(), data.expn_hash(expn)))
+                     .collect()
+             });
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 019e2585e28..1d192b1c716 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,6 +9,10 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patchdir=${RUSTSRC}\file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC}\file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC}\+file://0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch;patchdir=${RUSTSRC}\+file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC}\+file://0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch;patchdir=${RUSTSRC}\+file://0009-rustc-span-make-hygiene-encoding-order-deterministic.patch;patchdir=${RUSTSRC}\">"https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.patch;patchdir=${RUSTSRC} \
             file://0004-Backport-commits-from-rust-Fix-selftest-llvm23.patch;patchdir=${RUSTSRC} \
             file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch;patchdir=${RUSTSRC} \
+            file://0006-rustc-span-add-oe-knob-to-elide-cfg-version-from-stable-crate-id.patch;patchdir=${RUSTSRC} \
+            file://0007-cargo-omit-host-triple-from-unit-metadata-hash.patch;patchdir=${RUSTSRC} \
+            file://0008-rustc-hir-make-doc-link-metadata-order-deterministic.patch;patchdir=${RUSTSRC} \
+            file://0009-rustc-span-make-hygiene-encoding-order-deterministic.patch;patchdir=${RUSTSRC} \
 "</a>
 SRC_URI[rust.sha256sum] = "be1816e7f6c40abb90245ad6e024bed2a7e88d7dda4561e4d5470207df616b9f"
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#245379): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/245379">https://lists.openembedded.org/g/openembedded-core/message/245379</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/121147070/4354175">https://lists.openembedded.org/mt/121147070/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------hPE1rg5BUts4cVDKnBkKSayD--

