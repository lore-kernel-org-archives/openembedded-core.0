Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F565C88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:18:36 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40615.1789136307853289142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 07:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XvNruRgq;
 spf=pass (domain: mvista.com, ip: 209.85.216.53, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398b3d66515so1187535a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 07:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789136307; x=1789741107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgDqCWbIwL8PYs+XOMbqPovnXeaD58UKsP7okTR47Rk=;
        b=XvNruRgqyeYlbz+d65ABsavuGMoN4Pj22dkMVOytSyyzseRmqX3QV+7TzpLu5YQGMa
         gl3hrwBNVDFaaK5UsUugmp/pR1YjwEqYANY8N7BZnuonbYqr95yW8DAwuCcAQZ71ixJC
         I+ewxDyhAFUXUck/r2Q1xb8V9mRoVAjetC0uA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136307; x=1789741107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GgDqCWbIwL8PYs+XOMbqPovnXeaD58UKsP7okTR47Rk=;
        b=OQzNxv7Fnk9PG+AYf7K1uyC9rr+aKF5mKAliQ+pJIX1UuS9vEjMm1WlaL6592Adisz
         ve1THXyiBkINY7V+NS6M8hMpFBSvZNHz4bdG2tKYmhe67Qqv1nP9lkrv+gaLLyp0/Q7M
         CM7pup8UQ+jQNyubi3tXhybDgJiWLRS2DZ3iI7PDUdRllPE3qAY8tbvdRFcMOiiTQ2ru
         ph4bXsGwywWstS6Ru2648Y0BcOvXECLn59QbTRRQCMV3whl0LY6yIZw2PAE96fCiNO1y
         PsAo8na26O/N9ZdLcGbCw0G3xtMvAXyyyO3joIqUu7t3XbESED7x4JbcwK8M9voMtp08
         w2jQ==
X-Gm-Message-State: AFuF++kAuNU8Ub6pq/GEt6d3YE+pq6pgeLgB2fTga0OoBlopDV85N/p2
	Aae3w4+ZhThMseoj+y8iNlj2TlFud8CjHXHWyw+kf2bB9X0SX5H6yzyThHz3MLoENYKB1XKCXMl
	fRAX7
X-Gm-Gg: AYBFou21e2433EcIVoP2CEarVD6hcZLStMDVe6Dusu0Q4PpYFDZxYdEKVC2SlnT1ehu
	nw/1yg5Hm+KWJWhP+LmkuTL7dp/Qi/CS4a+UOLhebuG0X88UNVF6fh9KO/fBDF0Y76HD6rY03jG
	DDOlmPiQj8NQD9BvRIvhYkTb7arU1L7bf9b6nRmRYI//IeF5inQGvR6AnVzkwrRcwYyzn9y7Gkd
	R29MH4/nx1SfrtjMMWXeVTjg2p3oL3dSRqt3N+SEjOOWV9ZehRUIk29Tas5PXiStExb4t4ZmfWU
	xS/hObjAH3HHvba1N4ihHBmUdO3TCvZX6CfR0xo3k8hOuRb79LfrLOOtRaBkOOdRSxatF/CLmRW
	Si5boAZDOKUBZVNOXMY0RBgdIUgVOEA1T1UNdgXfwdmfqjVKaTtjGQo+0EMdE1C9AbrytmoMoKm
	/XoRCw+sD1VfloQBNpc73ziXvszBYPSV7prVAtXS5zEvW5eJH4y2GH3AkeefextSmXJjXT8GVOH
	X8=
X-Received: by 2002:a17:90b:57e6:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39d9bec3f25mr7935167a91.9.1789136306823;
        Fri, 11 Sep 2026 07:18:26 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1f28:4681:c629:eec8:3fba:5347])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm7020102eec.12.2026.09.11.07.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:18:26 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 1/2] python3-cryptography: Fix CVE-2026-69248
Date: Fri, 11 Sep 2026 19:48:14 +0530
Message-ID: <20260911141815.1479412-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 14:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245653

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-69248
[2] https://security-tracker.debian.org/tracker/CVE-2026-69248

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python/python3-cryptography.bb            |   1 +
 .../python3-cryptography/CVE-2026-69248.patch | 302 ++++++++++++++++++
 2 files changed, 303 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index c6561deb3c..5c1de9192b 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -15,6 +15,7 @@ SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0002-Fix-installing-stray-files-into-site-packages.patch \
+            file://CVE-2026-69248.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
new file mode 100644
index 0000000000..66cfa12a6c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch
@@ -0,0 +1,302 @@
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
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/4d035a4225965edeffd312079a510ef25fcfdcb2]
+CVE: CVE-2026-69248
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../cryptography-x509-verification/src/lib.rs |  43 ++++-
+ .../src/types.rs                              | 165 ++++++++++++------
+ 2 files changed, 145 insertions(+), 63 deletions(-)
+
+diff --git a/src/rust/cryptography-x509-verification/src/lib.rs b/src/rust/cryptography-x509-verification/src/lib.rs
+index c59f84f..60c89d4 100644
+--- a/src/rust/cryptography-x509-verification/src/lib.rs
++++ b/src/rust/cryptography-x509-verification/src/lib.rs
+@@ -147,6 +147,7 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+ 
+     fn evaluate_single_constraint<B: CryptoOps>(
+         &self,
++        kind: SubtreeKind,
+         constraint: &GeneralName<'chain>,
+         san: &GeneralName<'chain>,
+         budget: &mut Budget,
+@@ -155,14 +156,18 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+ 
+         match (constraint, san) {
+             (GeneralName::DNSName(constraint), GeneralName::DNSName(name)) => {
+-                // NOTE: A DNS SAN can be a wildcard pattern instead of a normal DNS name.
+-                // These are handled by matching unconditionally on the inner name,
+-                // since a NC of `foo.com` will match both `foo.com` and any arbitrarily deep
+-                // subdomain of `foo.com`, where a wildcard SAN like `*.foo.com` will only
+-                // match exactly one subdomain of `foo.com`. Therefore, the NC's matching
+-                // set is a strict superset of any possible wildcard SAN pattern.
++                // NOTE: A DNS SAN can be a wildcard pattern (e.g. `*.foo.com`)
++                // rather than an ordinary DNS name. A wildcard represents a
++                // *set* of names, so the check depends on which subtree we're
++                // evaluating: a `permittedSubtrees` constraint must contain
++                // *every* name the wildcard can expand to, whereas an
++                // `excludedSubtrees` constraint matches if it overlaps the
++                // wildcard at all. We dispatch on `kind` accordingly.
+                 match (DNSConstraint::new(constraint.0), DNSPattern::new(name.0)) {
+-                    (Some(constraint), Some(name)) => Ok(Applied(constraint.matches(&name))),
++                    (Some(constraint), Some(name)) => Ok(Applied(match kind {
++                        SubtreeKind::Permitted => constraint.permits(&name),
++                        SubtreeKind::Excluded => constraint.excludes(&name),
++                    })),
+                     (_, None) => Err(ValidationError::new(ValidationErrorKind::Other(format!(
+                         "unsatisfiable DNS name constraint: malformed SAN {}",
+                         name.0
+@@ -232,7 +237,12 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+             let mut permit = true;
+             if let Some(permitted_subtrees) = &constraints.permitted_subtrees {
+                 for p in permitted_subtrees.clone() {
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
+@@ -250,7 +260,12 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+ 
+             if let Some(excluded_subtrees) = &constraints.excluded_subtrees {
+                 for e in excluded_subtrees.clone() {
+-                    let status = self.evaluate_single_constraint(&e.base, &san, budget)?;
++                    let status = self.evaluate_single_constraint(
++                        SubtreeKind::Excluded,
++                        &e.base,
++                        &san,
++                        budget,
++                    )?;
+                     if status.is_match() {
+                         return Err(ValidationError::new(ValidationErrorKind::Other(
+                             "excluded name constraint matched SAN".into(),
+@@ -284,6 +299,16 @@ struct ChainBuilder<'a, 'chain, B: CryptoOps> {
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
+index 86316f4..0ec0be2 100644
+--- a/src/rust/cryptography-x509-verification/src/types.rs
++++ b/src/rust/cryptography-x509-verification/src/types.rs
+@@ -150,44 +150,69 @@ impl<'a> DNSConstraint<'a> {
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
+@@ -590,37 +615,69 @@ mod tests {
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
+     }
+ 
+     #[test]
+-    fn test_dnsconstraint_matches_wildcard() {
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
++    }
++
++    #[test]
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
-- 
2.43.0


