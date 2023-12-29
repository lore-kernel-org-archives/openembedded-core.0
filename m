Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F8FC4707B
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:18 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.151496.1703864713351766870
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LkmfgU+j;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d45f182fa2so27639145ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864712; x=1704469512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dT/cAf07XOSsyjpFsJ893wkq+oUM7VbPSIHZ0kQnJ9w=;
        b=LkmfgU+jbqK1zCHPSZCBnozAQUjTY1lF7XeYEZxXBHC9l1syaU5wsa2hOtL0MSNk4B
         9QJjnKq9aoce92Om5FXId+K7TSOd//2ILla2gU3zWXr2YlXnWc7bK7rQ1OICaudQ1BfV
         fmp/oEzpS8mWN6GiBv3PnuwTMSOCRX6JvW7lDmCzrmZBHacKkQSmFfIivXwZUhW8isw+
         7803P7pGttCSr3zyB+ru/I+zij00Nunmk7oCIdW0sXQZKpFvedYCFVc6dwZDHtgbXi1W
         wBHnXTxjxLCti5LMCRSWO8Mc3nT4HIk7wb+VHyGD3qfpMlJ75mO5WVi+mFueou1wLa3Y
         t2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864712; x=1704469512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dT/cAf07XOSsyjpFsJ893wkq+oUM7VbPSIHZ0kQnJ9w=;
        b=t3HMUYhb2vVyZq0RT2INWqQeufAuJt77aq6O66FFK1U5u6Q1fUNVTsjyOleRHMnDtF
         WDuEpSkqUDTQl84n+Gjkhgx8+nYvrIjXI7WikT2ggKg5pV/duet2i0cp7e11PkXt2rFI
         ZUVtpV4T7XqSGLgchlrQQqY+clMXzBEKlt2OLhQXn8pjaxM2zF9ewkR340F9TRqeY4og
         NffKGcio6oMf6zeiiz4gZYzFBlMcoaGxfv1WOf27lsdGc+pVuHcG0lFema6RxCFhMYfN
         BRrwZDWaY3O6ZgizpVPsxLxVj8lwqw+XazoH59aO1lZYoeiERD1xynEyGMZqHY8l7Q1e
         DZ4Q==
X-Gm-Message-State: AOJu0Yxg5WtDgm+H0qtRG+Ucyo/8183w9vo2g0ij1DeRCfcADkADqC24
	slrzIvqsN7XCcKbcHooJWG+4js4SsM1PbxUFTP5AcapvQrsBzw==
X-Google-Smtp-Source: AGHT+IEnZzxYpCEcozHiF0CpZqztGTVihhMowdrvNMxzQa+/dDVJkM9f2Ym13ErcZtrcwgH9SsbZkg==
X-Received: by 2002:a17:903:200b:b0:1d4:42f:d39b with SMTP id s11-20020a170903200b00b001d4042fd39bmr10385455pla.3.1703864712143;
        Fri, 29 Dec 2023 07:45:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 05/41] rust: Fix CVE-2023-40030
Date: Fri, 29 Dec 2023 05:44:19 -1000
Message-Id: <c55e8f8b1971cc9f311b6a18a34c4c34f732177a.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193022

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

CVE:CVE-2023-40030

This converts the feature name validation check from a warning to an error

Upstream-Status: Backport from https://github.com/rust-lang/cargo/commit/9835622853f08be9a4b58ebe29dcec8f43b64b33

Reference: https://nvd.nist.gov/vuln/detail/CVE-2023-40030

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rust/files/0002-CVE-2023-40030.patch      | 412 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 413 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch

diff --git a/meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch b/meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch
new file mode 100644
index 0000000000..bf9b251226
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0002-CVE-2023-40030.patch
@@ -0,0 +1,412 @@
+Author: Eric Huss <eric@huss.org>
+Date:   Sun Jun 11 12:52:25 2023 -0700
+
+    Convert valid feature name warning to an error.
+
+Upstream-Status: Backport [https://github.com/rust-lang/cargo/commit/9835622853f08be9a4b58ebe29dcec8f43b64b33]
+CVE: CVE-2023-40030
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+diff --git a/src/tools/cargo/crates/resolver-tests/src/lib.rs b/src/tools/cargo/crates/resolver-tests/src/lib.rs
+index 01d9b5e6d..ab34e8663 100644
+--- a/src/tools/cargo/crates/resolver-tests/src/lib.rs
++++ b/src/tools/cargo/crates/resolver-tests/src/lib.rs
+@@ -179,7 +179,6 @@ pub fn resolve_with_config_raw(
+         used: HashSet::new(),
+     };
+     let summary = Summary::new(
+-        config,
+         pkg_id("root"),
+         deps,
+         &BTreeMap::new(),
+@@ -581,7 +580,6 @@ pub fn pkg_dep<T: ToPkgId>(name: T, dep: Vec<Dependency>) -> Summary {
+         None
+     };
+     Summary::new(
+-        &Config::default().unwrap(),
+         name.to_pkgid(),
+         dep,
+         &BTreeMap::new(),
+@@ -610,7 +608,6 @@ pub fn pkg_loc(name: &str, loc: &str) -> Summary {
+         None
+     };
+     Summary::new(
+-        &Config::default().unwrap(),
+         pkg_id_loc(name, loc),
+         Vec::new(),
+         &BTreeMap::new(),
+@@ -625,7 +622,6 @@ pub fn remove_dep(sum: &Summary, ind: usize) -> Summary {
+     deps.remove(ind);
+     // note: more things will need to be copied over in the future, but it works for now.
+     Summary::new(
+-        &Config::default().unwrap(),
+         sum.package_id(),
+         deps,
+         &BTreeMap::new(),
+diff --git a/src/tools/cargo/src/cargo/core/resolver/version_prefs.rs b/src/tools/cargo/src/cargo/core/resolver/version_prefs.rs
+index 002f11ff8..bf26d0498 100644
+--- a/src/tools/cargo/src/cargo/core/resolver/version_prefs.rs
++++ b/src/tools/cargo/src/cargo/core/resolver/version_prefs.rs
+@@ -73,7 +73,6 @@ impl VersionPreferences {
+ mod test {
+     use super::*;
+     use crate::core::SourceId;
+-    use crate::util::Config;
+     use std::collections::BTreeMap;
+
+     fn pkgid(name: &str, version: &str) -> PackageId {
+@@ -90,9 +89,8 @@ mod test {
+
+     fn summ(name: &str, version: &str) -> Summary {
+         let pkg_id = pkgid(name, version);
+-        let config = Config::default().unwrap();
+         let features = BTreeMap::new();
+-        Summary::new(&config, pkg_id, Vec::new(), &features, None::<&String>).unwrap()
++        Summary::new(pkg_id, Vec::new(), &features, None::<&String>).unwrap()
+     }
+
+     fn describe(summaries: &Vec<Summary>) -> String {
+
+diff --git a/src/tools/cargo/src/cargo/core/summary.rs b/src/tools/cargo/src/cargo/core/summary.rs
+index 2535c4482..1883df33b 100644
+--- a/src/tools/cargo/src/cargo/core/summary.rs
++++ b/src/tools/cargo/src/cargo/core/summary.rs
+@@ -1,6 +1,6 @@
+ use crate::core::{Dependency, PackageId, SourceId};
+ use crate::util::interning::InternedString;
+-use crate::util::{CargoResult, Config};
++use crate::util::CargoResult;
+ use anyhow::bail;
+ use semver::Version;
+ use std::collections::{BTreeMap, HashMap, HashSet};
+@@ -30,7 +30,6 @@ struct Inner {
+ 
+ impl Summary {
+     pub fn new(
+-        config: &Config,
+         pkg_id: PackageId,
+         dependencies: Vec<Dependency>,
+         features: &BTreeMap<InternedString, Vec<InternedString>>,
+@@ -49,7 +48,7 @@ impl Summary {
+                 )
+             }
+         }
+-        let feature_map = build_feature_map(config, pkg_id, features, &dependencies)?;
++        let feature_map = build_feature_map(pkg_id, features, &dependencies)?;
+         Ok(Summary {
+             inner: Rc::new(Inner {
+                 package_id: pkg_id,
+@@ -140,7 +139,6 @@ impl Hash for Summary {
+ /// Checks features for errors, bailing out a CargoResult:Err if invalid,
+ /// and creates FeatureValues for each feature.
+ fn build_feature_map(
+-    config: &Config,
+     pkg_id: PackageId,
+     features: &BTreeMap<InternedString, Vec<InternedString>>,
+     dependencies: &[Dependency],
+@@ -204,7 +202,7 @@ fn build_feature_map(
+                 feature
+             );
+         }
+-        validate_feature_name(config, pkg_id, feature)?;
++        validate_feature_name(pkg_id, feature)?;
+         for fv in fvs {
+             // Find data for the referenced dependency...
+             let dep_data = {
+@@ -431,33 +429,63 @@ impl fmt::Display for FeatureValue {
+ 
+ pub type FeatureMap = BTreeMap<InternedString, Vec<FeatureValue>>;
+ 
+-fn validate_feature_name(config: &Config, pkg_id: PackageId, name: &str) -> CargoResult<()> {
++fn validate_feature_name(pkg_id: PackageId, name: &str) -> CargoResult<()> {
+     let mut chars = name.chars();
+-    const FUTURE: &str = "This was previously accepted but is being phased out; \
+-        it will become a hard error in a future release.\n\
+-        For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, \
+-        and please leave a comment if this will be a problem for your project.";
+     if let Some(ch) = chars.next() {
+         if !(unicode_xid::UnicodeXID::is_xid_start(ch) || ch == '_' || ch.is_digit(10)) {
+-            config.shell().warn(&format!(
++            bail!(
+                 "invalid character `{}` in feature `{}` in package {}, \
+                 the first character must be a Unicode XID start character or digit \
+-                (most letters or `_` or `0` to `9`)\n\
+-                {}",
+-                ch, name, pkg_id, FUTURE
+-            ))?;
++                (most letters or `_` or `0` to `9`)",
++                ch,
++                name,
++                pkg_id
++            );
+         }
+     }
+     for ch in chars {
+         if !(unicode_xid::UnicodeXID::is_xid_continue(ch) || ch == '-' || ch == '+' || ch == '.') {
+-            config.shell().warn(&format!(
++            bail!(
+                 "invalid character `{}` in feature `{}` in package {}, \
+                 characters must be Unicode XID characters, `+`, or `.` \
+-                (numbers, `+`, `-`, `_`, `.`, or most letters)\n\
+-                {}",
+-                ch, name, pkg_id, FUTURE
+-            ))?;
++                (numbers, `+`, `-`, `_`, `.`, or most letters)",
++                ch,
++                name,
++                pkg_id
++            );
+         }
+     }
+     Ok(())
+ }
++
++#[cfg(test)]
++mod tests {
++    use super::*;
++    use crate::sources::CRATES_IO_INDEX;
++    use crate::util::into_url::IntoUrl;
++
++    use crate::core::SourceId;
++
++    #[test]
++    fn valid_feature_names() {
++        let loc = CRATES_IO_INDEX.into_url().unwrap();
++        let source_id = SourceId::for_registry(&loc).unwrap();
++        let pkg_id = PackageId::new("foo", "1.0.0", source_id).unwrap();
++
++        assert!(validate_feature_name(pkg_id, "c++17").is_ok());
++        assert!(validate_feature_name(pkg_id, "128bit").is_ok());
++        assert!(validate_feature_name(pkg_id, "_foo").is_ok());
++        assert!(validate_feature_name(pkg_id, "feat-name").is_ok());
++        assert!(validate_feature_name(pkg_id, "feat_name").is_ok());
++        assert!(validate_feature_name(pkg_id, "foo.bar").is_ok());
++
++        assert!(validate_feature_name(pkg_id, "+foo").is_err());
++        assert!(validate_feature_name(pkg_id, "-foo").is_err());
++        assert!(validate_feature_name(pkg_id, ".foo").is_err());
++        assert!(validate_feature_name(pkg_id, "foo:bar").is_err());
++        assert!(validate_feature_name(pkg_id, "foo?").is_err());
++        assert!(validate_feature_name(pkg_id, "?foo").is_err());
++        assert!(validate_feature_name(pkg_id, "ⒶⒷⒸ").is_err());
++        assert!(validate_feature_name(pkg_id, "a¼").is_err());
++    }
++}
+diff --git a/src/tools/cargo/src/cargo/sources/registry/index.rs b/src/tools/cargo/src/cargo/sources/registry/index.rs
+index aa5c2a78c..6d565da8f 100644
+--- a/src/tools/cargo/src/cargo/sources/registry/index.rs
++++ b/src/tools/cargo/src/cargo/sources/registry/index.rs
+@@ -293,7 +293,6 @@ impl<'cfg> RegistryIndex<'cfg>
+         'a: 'b,
+     {
+         let source_id = self.source_id;
+-        let config = self.config;
+
+         // First up actually parse what summaries we have available. If Cargo
+         // has run previously this will parse a Cargo-specific cache file rather
+@@ -312,15 +311,13 @@ impl<'cfg> RegistryIndex<'cfg> {
+             .versions
+             .iter_mut()
+             .filter_map(move |(k, v)| if req.matches(k) { Some(v) } else { None })
+-            .filter_map(
+-                move |maybe| match maybe.parse(config, raw_data, source_id) {
++            .filter_map(move |maybe| match maybe.parse(raw_data, source_id) {
+                     Ok(summary) => Some(summary),
+                     Err(e) => {
+                         info!("failed to parse `{}` registry package: {}", name, e);
+                         None
+                     }
+-                },
+-            )
++                })
+             .filter(move |is| {
+                 if is.v > INDEX_V_MAX {
+                     debug!(
+@@ -605,7 +602,7 @@ impl Summaries {
+                     // allow future cargo implementations to break the
+                     // interpretation of each line here and older cargo will simply
+                     // ignore the new lines.
+-                    let summary = match IndexSummary::parse(config, line, source_id) {
++                    let summary = match IndexSummary::parse(line, source_id) {
+                         Ok(summary) => summary,
+                         Err(e) => {
+                             // This should only happen when there is an index
+@@ -793,17 +790,12 @@ impl MaybeIndexSummary {
+     /// Does nothing if this is already `Parsed`, and otherwise the `raw_data`
+     /// passed in is sliced with the bounds in `Unparsed` and then actually
+     /// parsed.
+-    fn parse(
+-        &mut self,
+-        config: &Config,
+-        raw_data: &[u8],
+-        source_id: SourceId,
+-    ) -> CargoResult<&IndexSummary> {
++    fn parse(&mut self, raw_data: &[u8], source_id: SourceId,) -> CargoResult<&IndexSummary> {
+         let (start, end) = match self {
+             MaybeIndexSummary::Unparsed { start, end } => (*start, *end),
+             MaybeIndexSummary::Parsed(summary) => return Ok(summary),
+         };
+-        let summary = IndexSummary::parse(config, &raw_data[start..end], source_id)?;
++        let summary = IndexSummary::parse(&raw_data[start..end], source_id)?;
+         *self = MaybeIndexSummary::Parsed(summary);
+         match self {
+             MaybeIndexSummary::Unparsed { .. } => unreachable!(),
+@@ -823,7 +815,7 @@ impl IndexSummary {
+     /// a package.
+     ///
+     /// The `line` provided is expected to be valid JSON.
+-    fn parse(config: &Config, line: &[u8], source_id: SourceId) -> CargoResult<IndexSummary> {
++    fn parse(line: &[u8], source_id: SourceId) -> CargoResult<IndexSummary> {
+         // ****CAUTION**** Please be extremely careful with returning errors
+         // from this function. Entries that error are not included in the
+         // index cache, and can cause cargo to get confused when switching
+@@ -853,7 +845,7 @@ impl IndexSummary {
+                 features.entry(name).or_default().extend(values);
+             }
+         }
+-        let mut summary = Summary::new(config, pkgid, deps, &features, links)?;
++        let mut summary = Summary::new(pkgid, deps, &features, links)?;
+         summary.set_checksum(cksum);
+         Ok(IndexSummary {
+             summary,
+
+diff --git a/src/tools/cargo/src/cargo/util/toml/mod.rs b/src/tools/cargo/src/cargo/util/toml/mod.rs
+index 1cc32dee8..a32f0384b 100644
+--- a/src/tools/cargo/src/cargo/util/toml/mod.rs
++++ b/src/tools/cargo/src/cargo/util/toml/mod.rs
+@@ -2432,7 +2432,6 @@ impl TomlManifest {
+         let empty_features = BTreeMap::new();
+ 
+         let summary = Summary::new(
+-            config,
+             pkgid,
+             deps,
+             me.features.as_ref().unwrap_or(&empty_features),
+diff --git a/src/tools/cargo/tests/testsuite/features.rs b/src/tools/cargo/tests/testsuite/features.rs
+index 848e05677..557fab14a 100644
+--- a/src/tools/cargo/tests/testsuite/features.rs
++++ b/src/tools/cargo/tests/testsuite/features.rs
+@@ -1937,8 +1937,8 @@ fn nonexistent_required_features() {
+ }
+ 
+ #[cargo_test]
+-fn invalid_feature_names_warning() {
+-    // Warnings for more restricted feature syntax.
++fn invalid_feature_names_error() {
++    // Errors for more restricted feature syntax.
+     let p = project()
+         .file(
+             "Cargo.toml",
+@@ -1948,72 +1948,57 @@ fn invalid_feature_names_warning() {
+                 version = "0.1.0"
+ 
+                 [features]
+-                # Some valid, but unusual names, shouldn't warn.
+-                "c++17" = []
+-                "128bit" = []
+-                "_foo" = []
+-                "feat-name" = []
+-                "feat_name" = []
+-                "foo.bar" = []
+-
+-                # Invalid names.
++                # Invalid start character.
+                 "+foo" = []
+-                "-foo" = []
+-                ".foo" = []
+-                "foo:bar" = []
+-                "foo?" = []
+-                "?foo" = []
+-                "ⒶⒷⒸ" = []
+-                "a¼" = []
+             "#,
+         )
+         .file("src/lib.rs", "")
+         .build();
+ 
+-    // Unfortunately the warnings are duplicated due to the Summary being
+-    // loaded twice (once in the Workspace, and once in PackageRegistry) and
+-    // Cargo does not have a de-duplication system. This should probably be
+-    // OK, since I'm not expecting this to affect anyone.
+     p.cargo("check")
+-        .with_stderr("\
+-[WARNING] invalid character `+` in feature `+foo` in package foo v0.1.0 ([ROOT]/foo), the first character must be a Unicode XID start character or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `-` in feature `-foo` in package foo v0.1.0 ([ROOT]/foo), the first character must be a Unicode XID start character or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `.` in feature `.foo` in package foo v0.1.0 ([ROOT]/foo), the first character must be a Unicode XID start character or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `?` in feature `?foo` in package foo v0.1.0 ([ROOT]/foo), the first character must be a Unicode XID start character or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `¼` in feature `a¼` in package foo v0.1.0 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `:` in feature `foo:bar` in package foo v0.1.0 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `?` in feature `foo?` in package foo v0.1.0 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `Ⓐ` in feature `ⒶⒷⒸ` in package foo v0.1.0 ([ROOT]/foo), the first character must be a Unicode XID start character or digit (most letters or `_` or `0` to `9`)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `Ⓑ` in feature `ⒶⒷⒸ` in package foo v0.1.0 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[WARNING] invalid character `Ⓒ` in feature `ⒶⒷⒸ` in package foo v0.1.0 ([ROOT]/foo), characters must be Unicode XID characters, `+`, or `.` (numbers, `+`, `-`, `_`, `.`, or most letters)
+-This was previously accepted but is being phased out; it will become a hard error in a future release.
+-For more information, see issue #8813 <https://github.com/rust-lang/cargo/issues/8813>, and please leave a comment if this will be a problem for your project.
+-[CHECKING] foo v0.1.0 [..]
+-[FINISHED] [..]
+-")
++        .with_status(101)
++        .with_stderr(
++            "\
++error: failed to parse manifest at `[ROOT]/foo/Cargo.toml`
++
++Caused by:
++  invalid character `+` in feature `+foo` in package foo v0.1.0 ([ROOT]/foo), \
++  the first character must be a Unicode XID start character or digit \
++  (most letters or `_` or `0` to `9`)
++",
++        )
++        .run();
++
++    p.change_file(
++        "Cargo.toml",
++        r#"
++            [package]
++            name = "foo"
++            version = "0.1.0"
++
++            [features]
++            # Invalid continue character.
++            "a&b" = []
++        "#,
++    );
++
++    p.cargo("check")
++        .with_status(101)
++        .with_stderr(
++            "\
++error: failed to parse manifest at `[ROOT]/foo/Cargo.toml`
++
++Caused by:
++  invalid character `&` in feature `a&b` in package foo v0.1.0 ([ROOT]/foo), \
++  characters must be Unicode XID characters, `+`, or `.` \
++  (numbers, `+`, `-`, `_`, `.`, or most letters)
++",
++        )
+         .run();
+ }
+ 
+ #[cargo_test]
+-fn invalid_feature_names_error() {
++fn invalid_feature_name_slash_error() {
+     // Errors for more restricted feature syntax.
+     let p = project()
+         .file(
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 4a720e645b..086375a3c6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://bootstrap_fail.patch;patchdir=${RUSTSRC} \
+	    file://0002-CVE-2023-40030.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "bb8e9c564566b2d3228d95de9063a9254182446a161353f1d843bfbaf5c34639"
 
-- 
2.34.1


