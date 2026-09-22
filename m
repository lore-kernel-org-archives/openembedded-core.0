Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BE4C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:12:58 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5781.1790068372150133464
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NoFTQ3Db;
 spf=pass (domain: mvista.com, ip: 74.125.228.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4adso2825012a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 02:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790068371; x=1790673171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgEu8fu+GAbpCLvR4LgwfuJwDQMxbpVOZHLEOXCnlUk=;
        b=NoFTQ3Db5kVUAFGmBQhfxijVSRK9nF1/NI0iwgWbG+YQpNEjVOC9GIbxeVP3gTA2/4
         LX6x/2KpoLDea+o9y0LEJV/6UEzyk44SzNVtx105z8JzaF5ZO6ePFFje1FdFXB/oj135
         XcYYHBiDVS7/7KjL9MA83iDSpp8GiTcaw/QQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068371; x=1790673171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hgEu8fu+GAbpCLvR4LgwfuJwDQMxbpVOZHLEOXCnlUk=;
        b=p28jLYQH38HwlJTFz4XffQaUzAYDlcVLUijih05FzUtBFnbmFF+ihtrOxOL5VHVDq2
         kI4rUmnqyZxwpYBKxcj14+x1DDoKFJaSoiQxEMiMdIU+7SNOSR+/jpVDG2I2sO12RyTt
         gj1WJmdbna9gG5JqUXsEj836hZmzDduULYCHyU5ofJoVJWXHSb5dBlf2WcvaKDssdLj+
         jHHzgnimx3sNfyZrgEiRexsXH0Ryb+nItMdbmb/+9wCMXBlZ28L1qhTJ7FKzclP6He8W
         ki8HcySByu9FnGdwe0j/zSHnpw/6HyudscoiSPujcAeGrFJu/wNsTuK6Ljym3baufkw5
         InfQ==
X-Gm-Message-State: AFuF++lYPuVKSkbKHZU9nxBfxucmrNMTRazgY9aZf3bQBs2Gb728mg3l
	1QpqgsByxwD+E4qS3ruc/zYcmDQVHHu7Qpr3FRwG/5TMImNCZ+OW01D6lOmXzI72WNT/jMLTHeQ
	zkQ+Uo3k=
X-Gm-Gg: AYBFou27wXnyVYpYmB7ZXYPvMoGWkKvti4CQqErLK+0rlHjuhGRK0Whhhv4WhDV/zpb
	wJ5APokh35m2Vyjl4fz9GOiw+Mv5jtpWkddqLTcGsLNdybFLGxk85M0nAkm2hbDL1LK2y0w+ede
	PYYbFmXZRzytltkEhV4mqoZijMIA8gtoHUc1Zrsod76BvXKR3bmeypZNwAWSupOf4ywCU3LGXs6
	T97OyZtgK/CJ1SCQnFVlrXfq0dTG++WCmqvyLD4KvCgO18ryipDp3fH87z9pFf4/djCziEtDjGs
	8vXvsUGEnGSXfD5bSyZWhHxcv+WFE6yzxvNhq//gJ/7Ah+eM6oL7bLp94eFWCOHkL8kGz+J1HZk
	g0y0wxOHbUmHFk/E0X2MJauFUIfm4tb5H6zGOC68k3nxArHMjA5Z3YxQwf2EAtjDzHtLQAVvwx8
	XslDPio1iiQJveEPzv3aTjDv/5bJ4EjTdewpfcAYWoLxNI/UaWEHRhcPcPnX1hBcR51BddLQDVT
	wrSE0SHa4IN+fvfjbnrhg==
X-Received: by 2002:a05:6a20:394c:b0:3dd:a197:cf2b with SMTP id adf61e73a8af0-3ddec88f366mr612353637.79.1790068371399;
        Tue, 22 Sep 2026 02:12:51 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:b6aa:4514:5733:3fea:a0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3552686c88.13.2026.09.22.02.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:12:50 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2 2/3] python3-cryptography: Fix CVE-2026-69248
Date: Tue, 22 Sep 2026 14:42:35 +0530
Message-ID: <20260922091236.766239-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922091236.766239-1-vanusuri@mvista.com>
References: <20260922091236.766239-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246393

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-69248
[2] https://security-tracker.debian.org/tracker/CVE-2026-69248

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-cryptography/CVE-2026-69248.patch | 299 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 2 files changed, 300 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
new file mode 100644
index 0000000000..659d1bf72a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
@@ -0,0 +1,299 @@
+From 4d035a4225965edeffd312079a510ef25fcfdcb2 Mon Sep 17 00:00:00 2001
+From: William Woodruff <william@yossarian.net>
+Date: Thu, 21 May 2026 20:44:05 -0400
+Subject: [PATCH] x509: distinguish NC kinds when evaluating wildcard DNS SANs
+ (#14888)
+
+* x509: distinguish NC kinds when evaluating wildcard DNS SANs
+
+* Bump x509-limbo
+
+Note: SUSE patch CVE-2026-69248-distingush-nc-kinds-wildcard-sans.patch was adapted to our version where required.
+
+Upstream-Status: Backport [import from suse https://download.opensuse.org/distribution/leap-micro/6.1/product/repo/openSUSE-Leap-Micro-6.1-x86_64-Source/src/python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm
+Upstream commit https://github.com/pyca/cryptography/commit/4d035a4225965edeffd312079a510ef25fcfdcb2]
+CVE: CVE-2026-69248
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../cryptography-x509-verification/src/lib.rs |  37 +++-
+ .../src/types.rs                              | 165 ++++++++++++------
+ 2 files changed, 145 insertions(+), 57 deletions(-)
+
+diff --git a/src/rust/cryptography-x509-verification/src/lib.rs b/src/rust/cryptography-x509-verification/src/lib.rs
+index f49f618..a505349 100644
+--- a/src/rust/cryptography-x509-verification/src/lib.rs
++++ b/src/rust/cryptography-x509-verification/src/lib.rs
+@@ -101,6 +101,7 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+ 
+     fn evaluate_single_constraint(
+         &self,
++        kind: SubtreeKind,
+         constraint: &GeneralName<'chain>,
+         san: &GeneralName<'chain>,
+         budget: &mut Budget,
+@@ -109,8 +110,18 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+ 
+         match (constraint, san) {
+             (GeneralName::DNSName(pattern), GeneralName::DNSName(name)) => {
++                // NOTE: A DNS SAN can be a wildcard pattern (e.g. `*.foo.com`)
++                // rather than an ordinary DNS name. A wildcard represents a
++                // *set* of names, so the check depends on which subtree we're
++                // evaluating: a `permittedSubtrees` constraint must contain
++                // *every* name the wildcard can expand to, whereas an
++                // `excludedSubtrees` constraint matches if it overlaps the
++                // wildcard at all. We dispatch on `kind` accordingly.
+                 match (DNSConstraint::new(pattern.0), DNSPattern::new(name.0)) {
+-                    (Some(pattern), Some(name)) => Ok(Applied(pattern.matches(&name))),
++                    (Some(pattern), Some(name)) => Ok(Applied(match kind {
++                        SubtreeKind::Permitted => pattern.permits(&name),
++                        SubtreeKind::Excluded => pattern.excludes(&name),
++                    })),
+                     (_, None) => Err(ValidationError::Other(format!(
+                         "unsatisfiable DNS name constraint: malformed SAN {}",
+                         name.0
+@@ -155,7 +166,12 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+             let mut permit = true;
+             if let Some(permitted_subtrees) = &constraints.permitted_subtrees {
+                 for p in permitted_subtrees.unwrap_read().clone() {
+-                    let status = self.evaluate_single_constraint(&p.base, &san, budget)?;
++                    let status = self.evaluate_single_constraint(
++                        SubtreeKind::Permitted,
++                        &p.base,
++                        &san,
++                        budget,
++                    )?;
+                     if status.is_applied() {
+                         permit = status.is_match();
+                         if permit {
+@@ -173,7 +189,12 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+ 
+             if let Some(excluded_subtrees) = &constraints.excluded_subtrees {
+                 for e in excluded_subtrees.unwrap_read().clone() {
+-                    let status = self.evaluate_single_constraint(&e.base, &san, budget)?;
++                    let status = self.evaluate_single_constraint(
++                        SubtreeKind::Excluded,
++                        &e.base,
++                        &san,
++                        budget,
++                    )?;
+                     if status.is_match() {
+                         return Err(ValidationError::Other(
+                             "excluded name constraint matched SAN".into(),
+@@ -207,6 +228,16 @@ struct ChainBuilder<'a, 'chain, B: CryptoOps> {
+     store: &'a Store<'chain, B>,
+ }
+ 
++/// Identifies which kind of name constraint subtree a SAN is being evaluated
++/// against. The two subtree kinds use different matching semantics for
++/// wildcard DNS SANs (containment vs. overlap); see [`DNSConstraint::permits`]
++/// and [`DNSConstraint::excludes`].
++#[derive(Clone, Copy)]
++enum SubtreeKind {
++    Permitted,
++    Excluded,
++}
++
+ // When applying a name constraint, we need to distinguish between a few different scenarios:
+ // * `Applied(true)`: The name constraint is the same type as the SAN and matches.
+ // * `Applied(false)`: The name constraint is the same type as the SAN and does not match.
+diff --git a/src/rust/cryptography-x509-verification/src/types.rs b/src/rust/cryptography-x509-verification/src/types.rs
+index d82936e..c0b72e3 100644
+--- a/src/rust/cryptography-x509-verification/src/types.rs
++++ b/src/rust/cryptography-x509-verification/src/types.rs
+@@ -129,44 +129,69 @@ impl<'a> DNSConstraint<'a> {
+         DNSName::new(pattern).map(Self)
+     }
+ 
+-    /// Returns true if this `DNSConstraint` matches the given `DNSPattern`.
++    /// Returns true if the given exact `DNSName` falls within this
++    /// constraint's subtree.
+     ///
+-    /// Constraint matching is defined by RFC 5280: any DNS name that can
+-    /// be constructed by simply adding zero or more labels to the left-hand
+-    /// side of the name satisfies the name constraint.
++    /// Per RFC 5280, a name satisfies the constraint if it can be constructed
++    /// by adding zero or more labels to the left-hand side of the constraint's
++    /// name (i.e. it is the constraint's name, or a subdomain of it).
++    fn contains(&self, name: &DNSName<'_>) -> bool {
++        // NOTE: This may seem like an obtuse way to perform label matching,
++        // but it saves us a few allocations: doing a substring check instead
++        // would require us to clone each string and do case normalization.
++        // Note also that we check the length in advance: Rust's zip
++        // implementation terminates with the shorter iterator, so we need
++        // to first check that the candidate name is at least as long as
++        // the constraint it's matching against.
++        name.as_str().len() >= self.0.as_str().len()
++            && self
++                .0
++                .rlabels()
++                .zip(name.rlabels())
++                .all(|(a, o)| a.eq_ignore_ascii_case(o))
++    }
++
++    /// Returns true if the given `DNSPattern` is permitted by this constraint,
++    /// for use with a `permittedSubtrees` name constraint.
+     ///
+-    /// On top of what RFC 5280 specifies, we define behavior for wildcard
+-    /// patterns (which are not covered by RFC 5280): a wildcard pattern
+-    /// matches a constraint if the pattern matches the constraint's inner name,
+-    /// _or_ if the pattern's inner name matches the constraint.
+-    /// This allows us to reject DNS names like `*.example.com` when
+-    /// the constraint is `example.com` or `bar.example.com`.
+-    pub fn matches(&self, name: &DNSPattern<'_>) -> bool {
+-        match name {
+-            DNSPattern::Exact(name) => {
+-                // NOTE: This may seem like an obtuse way to perform label matching,
+-                // but it saves us a few allocations: doing a substring check instead
+-                // would require us to clone each string and do case normalization.
+-                // Note also that we check the length in advance: Rust's zip
+-                // implementation terminates with the shorter iterator, so we need
+-                // to first check that the candidate name is at least as long as
+-                // the constraint it's matching against.
+-                name.as_str().len() >= self.0.as_str().len()
+-                    && self
+-                        .0
+-                        .rlabels()
+-                        .zip(name.rlabels())
+-                        .all(|(a, o)| a.eq_ignore_ascii_case(o))
+-            }
+-            DNSPattern::Wildcard(inner) => {
+-                // NOTE: This check is not as simple as a single pattern match,
+-                // since we need two subtly distinct cases here:
+-                // 1. Constraint `bar.example.com` on `*.example.com`
+-                // 2. Constraint `example.com` on `*.example.com`
+-                // The first cases is handled by `DNSPattern::matches`, and the second is handled
+-                // by `DNSConstraint::matches`.
+-                name.matches(&self.0) || self.matches(&DNSPattern::Exact(inner.clone()))
+-            }
++    /// A pattern is permitted only if *every* name it can represent falls
++    /// within the constraint's subtree. An exact name is permitted by ordinary
++    /// subtree containment (per RFC 5280).
++    ///
++    /// Wildcard patterns are not covered by RFC 5280; we define their behavior
++    /// here. A wildcard pattern `*.X` is permitted only if its base name `X`
++    /// itself falls within the constraint's subtree. This is stricter than
++    /// mere overlap: `*.example.com` is *not* permitted by `foo.example.com`,
++    /// since it can also expand to a sibling such as `bar.example.com` that
++    /// lies outside the permitted subtree.
++    pub fn permits(&self, pattern: &DNSPattern<'_>) -> bool {
++        match pattern {
++            DNSPattern::Exact(name) => self.contains(name),
++            DNSPattern::Wildcard(base) => self.contains(base),
++        }
++    }
++
++    /// Returns true if the given `DNSPattern` is excluded by this constraint,
++    /// for use with an `excludedSubtrees` name constraint.
++    ///
++    /// A pattern is excluded if *any* name it can represent falls within the
++    /// constraint's subtree. An exact name is excluded by ordinary subtree
++    /// containment (per RFC 5280).
++    ///
++    /// Wildcard patterns are not covered by RFC 5280; we define their behavior
++    /// here. A wildcard pattern `*.X` is excluded if it overlaps the subtree
++    /// at all, which happens in two subtly distinct cases:
++    ///
++    /// 1. The constraint is more specific than the wildcard, e.g. constraint
++    ///    `bar.example.com` and pattern `*.example.com` (which can expand to
++    ///    `bar.example.com`). This is handled by `DNSPattern::matches`.
++    /// 2. The wildcard's base name falls within the subtree, e.g. constraint
++    ///    `example.com` and pattern `*.example.com`. This is handled by
++    ///    `DNSConstraint::contains`.
++    pub fn excludes(&self, pattern: &DNSPattern<'_>) -> bool {
++        match pattern {
++            DNSPattern::Exact(name) => self.contains(name),
++            DNSPattern::Wildcard(base) => pattern.matches(&self.0) || self.contains(base),
+         }
+     }
+ }
+@@ -462,37 +487,69 @@ mod tests {
+     }
+ 
+     #[test]
+-    fn test_dnsconstraint_matches() {
++    fn test_dnsconstraint_exact() {
+         let example_com = DNSConstraint::new("example.com").unwrap();
+ 
+-        // Exact domain and arbitrary subdomains match.
+-        assert!(example_com.matches(&DNSPattern::new("example.com").unwrap()));
+-        assert!(example_com.matches(&DNSPattern::new("foo.example.com").unwrap()));
+-        assert!(example_com.matches(&DNSPattern::new("foo.bar.baz.quux.example.com").unwrap()));
++        // For exact patterns, `permits` and `excludes` behave identically:
++        // the pattern must fall within the constraint's subtree.
++        for permitted in [
++            "example.com",
++            "foo.example.com",
++            "foo.bar.baz.quux.example.com",
++        ] {
++            let pattern = DNSPattern::new(permitted).unwrap();
++            assert!(example_com.permits(&pattern));
++            assert!(example_com.excludes(&pattern));
++        }
+ 
+         // Parent domains, distinct domains, and substring domains do not match.
+-        assert!(!example_com.matches(&DNSPattern::new("com").unwrap()));
+-        assert!(!example_com.matches(&DNSPattern::new("badexample.com").unwrap()));
+-        assert!(!example_com.matches(&DNSPattern::new("wrong.com").unwrap()));
++        for rejected in ["com", "badexample.com", "wrong.com"] {
++            let pattern = DNSPattern::new(rejected).unwrap();
++            assert!(!example_com.permits(&pattern));
++            assert!(!example_com.excludes(&pattern));
++        }
++    }
++
++    #[test]
++    fn test_dnsconstraint_permits_wildcard() {
++        let com = DNSConstraint::new("com").unwrap();
++        let example_com = DNSConstraint::new("example.com").unwrap();
++        let foo_example_com = DNSConstraint::new("foo.example.com").unwrap();
++        let any_example_com = DNSPattern::new("*.example.com").unwrap();
++
++        // A wildcard `*.example.com` is permitted only by constraints whose
++        // subtree contains *every* name the wildcard can expand to, i.e. those
++        // that contain `example.com` itself.
++        assert!(com.permits(&any_example_com));
++        assert!(example_com.permits(&any_example_com));
++
++        // A constraint more specific than the wildcard's base does *not*
++        // permit it: the wildcard can expand to siblings outside the subtree
++        // (e.g. `*.example.com` can be `bar.example.com`, which lies outside
++        // `foo.example.com`).
++        assert!(!foo_example_com.permits(&any_example_com));
+     }
+ 
+     #[test]
+-    fn test_dnsconstraint_matches_wildcard() {
++    fn test_dnsconstraint_excludes_wildcard() {
+         let com = DNSConstraint::new("com").unwrap();
+         let example_com = DNSConstraint::new("example.com").unwrap();
+         let bar_example_com = DNSConstraint::new("bar.example.com").unwrap();
+         let baz_bar_example_com = DNSConstraint::new("baz.bar.example.com").unwrap();
+         let any_example_com = DNSPattern::new("*.example.com").unwrap();
+ 
+-        assert!(com.matches(&any_example_com));
+-        assert!(example_com.matches(&any_example_com));
+-        assert!(bar_example_com.matches(&any_example_com));
+-
+-        // A constraint on `baz.bar.example.com` doesn't match `*.example.com`,
+-        // since `baz.bar.example.com` matches zero or more sublabels of
+-        // `baz.bar.example.com` while `*.example.com` matches exactly one
+-        // sublabel of `example.com`.
+-        assert!(!baz_bar_example_com.matches(&any_example_com));
++        // A wildcard `*.example.com` is excluded by any constraint whose
++        // subtree it overlaps, including constraints more specific than the
++        // wildcard's base.
++        assert!(com.excludes(&any_example_com));
++        assert!(example_com.excludes(&any_example_com));
++        assert!(bar_example_com.excludes(&any_example_com));
++
++        // A constraint on `baz.bar.example.com` doesn't overlap
++        // `*.example.com`, since `baz.bar.example.com` matches zero or more
++        // sublabels of `baz.bar.example.com` while `*.example.com` matches
++        // exactly one sublabel of `example.com`.
++        assert!(!baz_bar_example_com.excludes(&any_example_com));
+     }
+ 
+     #[test]
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index 01382219fa..8148ec0ba5 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -13,6 +13,7 @@ SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da6
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://CVE-2026-26007.patch \
             file://CVE-2026-34073.patch \
+            file://CVE-2026-69248.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
-- 
2.43.0


