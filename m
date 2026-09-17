Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 646AAC982E3
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1559.1789682874907745001
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LDWvDycQ;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso498765e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682873; x=1790287673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+kBi3rtEz3r0Av8Z6ksqcXspFxshq9l5DCr2d0dD/WU=;
        b=LDWvDycQ+ryVNeV9XGXQ1f2+2TlKdYp08yujaHRF6mHBbXoWySOSF1zVVs2vPwi6qR
         Y5O3pa7Zrps2l65XbgPTS+ahZeZt7ztMNA71obk7lqqyAOzk0aAAgruEEu9ZGT9Zw+Gi
         37c/k2VVzQt3062CiBYmMnaNFZBVvTmNihg2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682873; x=1790287673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+kBi3rtEz3r0Av8Z6ksqcXspFxshq9l5DCr2d0dD/WU=;
        b=xMg2PK1eEuz5XPJql8OOzv3PC6oLPjmdSJ+M5T+mwJanrRFo+/NxtAu2mvjjO4sAQg
         MBvMTi1jLUlDQUaTc4kA30aZ8XM5hek6eW0fDt6wVHCHY+Fzx4HtRzuBLtbYK2kuCZeI
         vrwe1rKVHxN4CINKu2IxO55goNgFqsHnaswQu4sPcbV/s0XfyANRSAakPl3ey0QMGn0a
         zL5PtVDc17POATSCiPz5mxQF2mWg5r/NRBwety8IinGZvK65sovnoUXGH1CheAy7G1LL
         WBa+NI6uKRkT5ZQgdXcX1eJpcxPKE0+bb/yeMWstQSMT+UJOV4vFHV4sTOcEUMfGcnwY
         6y1A==
X-Gm-Message-State: AFuF++kvRND0AMjp96FrAJsYa+ai3vVUACwaRrXxb4yNamyyb/5W6wSS
	7yEWJzJqZadfcA01CuYXzbdieOn95R0+hGh9eC78Unx7gU6auoBRcIwmorERy///swajgO9uUUz
	Gt+2iRTM=
X-Gm-Gg: AYBFou2GyJ7mMNZRx0HnsWPHf1tI3jc9v1cJq0Cun6Wl0NzgVHm0tVeRu2miIIGOuva
	PRar0eJjt+K0VDNbYLwqyiyhbJaB4TvuFYt0bZ5vi02pzmJPj0FsiReL5VBDhf8Ym+aGKqWrfuY
	WfD/RQ0I+hErFCxjgkCaPlgMcR81KurI2w0kB00yZCjX5hqm8Mt9kRTm2cCUEo29wjqT5ZPY7sf
	KQ/jpqEdswb9Abf0AaX5DkDJ/mkB+7dZe46dysdS9j4JaU4B0pDLqay+ENFAqsmXi2Ue1EQIOXz
	gdCqFJgaLS1PDHiMFToXDSgHwvwtQOHO22aI3gXdpApykX28TOgpNHqPVWJex8mERpUsQFwA4Kr
	1ILi9KVP9Hlub0nsltbhlStUnX2qDVdx1PBvJhqkbxVlra5lmMmYJv6Mp8Gnu/YgN6L7s9zv3f8
	HOJ75ZmncEKE0Qcvpkw8TO9lPq9yHKBgpgTJoleaqpotx/5d+0Ry0lWT+p8/C0YaG9N/RFQN76D
	sXKIDOhaRAZv5DOXGDGQpN/4bjxk/p8M92PfFd4U/uvgPBTWKaaca7LHC/fsq6yLbbfPoWT06U=
X-Received: by 2002:a05:600c:4e46:b0:49e:642a:4f6f with SMTP id 5b1f17b1804b1-49fc585e9edmr2640565e9.33.1789682872969;
        Thu, 17 Sep 2026 15:07:52 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/79] python3-cryptography: Fix CVE-2026-69248
Date: Fri, 18 Sep 2026 00:05:52 +0200
Message-ID: <7ea4f707d08c0286dbf748d2b1be78c5f9ada92b.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246102

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-69248
[2] https://security-tracker.debian.org/tracker/CVE-2026-69248

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-cryptography.bb            |   1 +
 .../python3-cryptography/CVE-2026-69248.patch | 302 ++++++++++++++++++
 2 files changed, 303 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69248.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index c6561deb3c4..5c1de9192b1 100644
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
index 00000000000..66cfa12a6c1
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

