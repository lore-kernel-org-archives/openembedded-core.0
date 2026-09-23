Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7256FC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:26 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2941.1790154736389634243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QXPJcET+;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so5656865e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154735; x=1790759535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5hf1YZcQrZkOqitVDWJXah3+N5yWa1M6QMoi7JlYYHI=;
        b=QXPJcET+Fkd6LG5wrqoC9MVEGZPV54m7JuFeZX9jY/lyJ6HtsoOY6YhJNB86igaOm/
         uoIN+wiL5ibc+DWqpiJHpPjaW8buPNAv8C7HJB+uk1pKycZ0CJVrEYzGFeIa9Ys6ozFh
         b+DxYt55mjgBdhn++6/fzb0Bqyc1TUQb1HLns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154735; x=1790759535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5hf1YZcQrZkOqitVDWJXah3+N5yWa1M6QMoi7JlYYHI=;
        b=eT8rGgvMI/K3o1UnPx6Y6DSr446YSZhNJGCYw+Tvb96fuCBN8wKUHdDtelcxBgI4mi
         xcIAGrlknCZ3nOans9e57+UYWbrt7AeK6A4hw7pNC8EoN5dXnAu1yeohFujxCBx7AXal
         c5LyxrL4OuWEOD03d74Ba92oK9xyemtT6nhVB0R/0NiqDBNhICI1QhJkLAGuECVeElMN
         v/MW/vBi7lMEcbwtA+UjWKzYbmwW/oajkRdDf4jfaiQml2W3W89/SIsKDQXBoYRuokK0
         8Ak5jYxqx0tA/DPhxdKz9+7ZzMeeUzdsMiQBoHQPE7/dVpfZGhNmG2lxhFipQPV6VH/H
         t9vg==
X-Gm-Message-State: AFuF++kU0HKnjpv122RFLicvdt6aFwn8skwj2Gv6J3Ft346EweIVdv/P
	vD5rPe0O9bxv1hVe0vt2MGafyYE3TAps6zxz5CuqzRB4OEZvBlOUnPppf++YPV1jKfyjRGrXAkv
	q6UDO6RQ=
X-Gm-Gg: AYBFou1MM8bMaFC+o47v8swU6y0zMTUiFflOTy2nc6E2th7sm/czU4MWAoTFuQlo4Dt
	Sp3XUlWkRXifnwsl3cvBa5trEgbzv3fbgtjNSPc0IpGbTmfB7DqobVjkVEe6xpPT8znB/DOEYLn
	cgnSO9lAc+RzdwRkLoYSc4mdjuq/PXxOHHSq6aYLrmmqLIZI5gxUygzliKCbV11oQG+qTubPDmz
	IXQTHigbvGfuleNGOgbBmtJ8D7JivOjDbl5ky+amEl1HqgijdnlHlujQ+5YsnbWabPhJNdsimgF
	tnxgO0A9+rwDYvJidgXVu2dLYKxdrNa9qMVrfuJdHHRmLvOHT7nB68v69D+x05Lg7jstUM12tCg
	/VEVuYZ/Bf8PiRTryIaf8Ci6UUBFox/AvdjJ5Ire1oze4JOlLKzQc0wSqhqm9cyOsyCZWeypoC7
	Ru/92l86wkgdBSp+pMC0NvB9fOJz6aHzpXUcXbl9CHaRFoag4D7r7p+OPfdKo+IKzz7X1UuIjRZ
	hnmjWbavmlUB/zOzdi9nVQZlukkHS06lw+dy8QbhG/N48V02ro3ePbcJ4OZ+7tqJCvAQwdt
X-Received: by 2002:a05:600c:1f91:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49fdf24fa11mr25899295e9.31.1790154734553;
        Wed, 23 Sep 2026 02:12:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 42/48] python3-cryptography: Fix CVE-2026-34073
Date: Wed, 23 Sep 2026 11:10:44 +0200
Message-ID: <fc077ee2c3a8c306df3245da7114724a7220c30b.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246504

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-34073
[2] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-34073

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python3-cryptography/CVE-2026-34073.patch | 167 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch
new file mode 100644
index 00000000000..9f144fa7094
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch
@@ -0,0 +1,167 @@
+From 6d97887956a05b3aaed262793710f07568026b72 Mon Sep 17 00:00:00 2001
+From: William Woodruff <william@yossarian.net>
+Date: Wed, 25 Mar 2026 18:52:17 -0400
+Subject: [PATCH] Further restrict DNS wildcards in name constraint matching
+ (#14542)
+
+* Further restruct DNS wildcards in name constraint matching
+
+Signed-off-by: William Woodruff <william@yossarian.net>
+
+* Bump limbo
+
+Signed-off-by: William Woodruff <william@yossarian.net>
+
+Upstream-Status: Backport [import from suse https://download.opensuse.org/distribution/leap-micro/6.1/product/repo/openSUSE-Leap-Micro-6.1-x86_64-Source/src/python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm
+Upstream commit https://github.com/pyca/cryptography/commit/6d97887956a05b3aaed262793710f07568026b72]
+CVE: CVE-2026-34073
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../cryptography-x509-verification/src/lib.rs |  5 +-
+ .../src/types.rs                              | 89 ++++++++++++-------
+ 2 files changed, 62 insertions(+), 32 deletions(-)
+
+diff --git a/src/rust/cryptography-x509-verification/src/lib.rs b/src/rust/cryptography-x509-verification/src/lib.rs
+index 5ded892..f49f618 100644
+--- a/src/rust/cryptography-x509-verification/src/lib.rs
++++ b/src/rust/cryptography-x509-verification/src/lib.rs
+@@ -20,11 +20,12 @@ use cryptography_x509::{
+     oid::{NAME_CONSTRAINTS_OID, SUBJECT_ALTERNATIVE_NAME_OID},
+ };
+ 
++use types::{DNSPattern};
++
+ use crate::certificate::cert_is_self_issued;
+ use crate::ops::{CryptoOps, VerificationCertificate};
+ use crate::policy::Policy;
+ use crate::trust_store::Store;
+-use crate::types::DNSName;
+ use crate::types::{DNSConstraint, IPAddress, IPConstraint};
+ use crate::ApplyNameConstraintStatus::{Applied, Skipped};
+ 
+@@ -108,7 +109,7 @@ impl<'a, 'chain> NameChain<'a, 'chain> {
+ 
+         match (constraint, san) {
+             (GeneralName::DNSName(pattern), GeneralName::DNSName(name)) => {
+-                match (DNSConstraint::new(pattern.0), DNSName::new(name.0)) {
++                match (DNSConstraint::new(pattern.0), DNSPattern::new(name.0)) {
+                     (Some(pattern), Some(name)) => Ok(Applied(pattern.matches(&name))),
+                     (_, None) => Err(ValidationError::Other(format!(
+                         "unsatisfiable DNS name constraint: malformed SAN {}",
+diff --git a/src/rust/cryptography-x509-verification/src/types.rs b/src/rust/cryptography-x509-verification/src/types.rs
+index f564715..d82936e 100644
+--- a/src/rust/cryptography-x509-verification/src/types.rs
++++ b/src/rust/cryptography-x509-verification/src/types.rs
+@@ -129,35 +129,45 @@ impl<'a> DNSConstraint<'a> {
+         DNSName::new(pattern).map(Self)
+     }
+ 
+-    /// Returns true if this `DNSConstraint` matches the given name.
++    /// Returns true if this `DNSConstraint` matches the given `DNSPattern`.
+     ///
+     /// Constraint matching is defined by RFC 5280: any DNS name that can
+     /// be constructed by simply adding zero or more labels to the left-hand
+     /// side of the name satisfies the name constraint.
+     ///
+-    /// ```rust
+-    /// # use cryptography_x509_verification::types::{DNSConstraint, DNSName};
+-    /// let example_com = DNSName::new("example.com").unwrap();
+-    /// let badexample_com = DNSName::new("badexample.com").unwrap();
+-    /// let foo_example_com = DNSName::new("foo.example.com").unwrap();
+-    /// assert!(DNSConstraint::new(example_com.as_str()).unwrap().matches(&example_com));
+-    /// assert!(DNSConstraint::new(example_com.as_str()).unwrap().matches(&foo_example_com));
+-    /// assert!(!DNSConstraint::new(example_com.as_str()).unwrap().matches(&badexample_com));
+-    /// ```
+-    pub fn matches(&self, name: &DNSName<'_>) -> bool {
+-        // NOTE: This may seem like an obtuse way to perform label matching,
+-        // but it saves us a few allocations: doing a substring check instead
+-        // would require us to clone each string and do case normalization.
+-        // Note also that we check the length in advance: Rust's zip
+-        // implementation terminates with the shorter iterator, so we need
+-        // to first check that the candidate name is at least as long as
+-        // the constraint it's matching against.
+-        name.as_str().len() >= self.0.as_str().len()
+-            && self
+-                .0
+-                .rlabels()
+-                .zip(name.rlabels())
+-                .all(|(a, o)| a.eq_ignore_ascii_case(o))
++    /// On top of what RFC 5280 specifies, we define behavior for wildcard
++    /// patterns (which are not covered by RFC 5280): a wildcard pattern
++    /// matches a constraint if the pattern matches the constraint's inner name,
++    /// _or_ if the pattern's inner name matches the constraint.
++    /// This allows us to reject DNS names like `*.example.com` when
++    /// the constraint is `example.com` or `bar.example.com`.
++    pub fn matches(&self, name: &DNSPattern<'_>) -> bool {
++        match name {
++            DNSPattern::Exact(name) => {
++                // NOTE: This may seem like an obtuse way to perform label matching,
++                // but it saves us a few allocations: doing a substring check instead
++                // would require us to clone each string and do case normalization.
++                // Note also that we check the length in advance: Rust's zip
++                // implementation terminates with the shorter iterator, so we need
++                // to first check that the candidate name is at least as long as
++                // the constraint it's matching against.
++                name.as_str().len() >= self.0.as_str().len()
++                    && self
++                        .0
++                        .rlabels()
++                        .zip(name.rlabels())
++                        .all(|(a, o)| a.eq_ignore_ascii_case(o))
++            }
++            DNSPattern::Wildcard(inner) => {
++                // NOTE: This check is not as simple as a single pattern match,
++                // since we need two subtly distinct cases here:
++                // 1. Constraint `bar.example.com` on `*.example.com`
++                // 2. Constraint `example.com` on `*.example.com`
++                // The first cases is handled by `DNSPattern::matches`, and the second is handled
++                // by `DNSConstraint::matches`.
++                name.matches(&self.0) || self.matches(&DNSPattern::Exact(inner.clone()))
++            }
++        }
+     }
+ }
+ 
+@@ -456,14 +466,33 @@ mod tests {
+         let example_com = DNSConstraint::new("example.com").unwrap();
+ 
+         // Exact domain and arbitrary subdomains match.
+-        assert!(example_com.matches(&DNSName::new("example.com").unwrap()));
+-        assert!(example_com.matches(&DNSName::new("foo.example.com").unwrap()));
+-        assert!(example_com.matches(&DNSName::new("foo.bar.baz.quux.example.com").unwrap()));
++        assert!(example_com.matches(&DNSPattern::new("example.com").unwrap()));
++        assert!(example_com.matches(&DNSPattern::new("foo.example.com").unwrap()));
++        assert!(example_com.matches(&DNSPattern::new("foo.bar.baz.quux.example.com").unwrap()));
+ 
+         // Parent domains, distinct domains, and substring domains do not match.
+-        assert!(!example_com.matches(&DNSName::new("com").unwrap()));
+-        assert!(!example_com.matches(&DNSName::new("badexample.com").unwrap()));
+-        assert!(!example_com.matches(&DNSName::new("wrong.com").unwrap()));
++        assert!(!example_com.matches(&DNSPattern::new("com").unwrap()));
++        assert!(!example_com.matches(&DNSPattern::new("badexample.com").unwrap()));
++        assert!(!example_com.matches(&DNSPattern::new("wrong.com").unwrap()));
++    }
++
++    #[test]
++    fn test_dnsconstraint_matches_wildcard() {
++        let com = DNSConstraint::new("com").unwrap();
++        let example_com = DNSConstraint::new("example.com").unwrap();
++        let bar_example_com = DNSConstraint::new("bar.example.com").unwrap();
++        let baz_bar_example_com = DNSConstraint::new("baz.bar.example.com").unwrap();
++        let any_example_com = DNSPattern::new("*.example.com").unwrap();
++
++        assert!(com.matches(&any_example_com));
++        assert!(example_com.matches(&any_example_com));
++        assert!(bar_example_com.matches(&any_example_com));
++
++        // A constraint on `baz.bar.example.com` doesn't match `*.example.com`,
++        // since `baz.bar.example.com` matches zero or more sublabels of
++        // `baz.bar.example.com` while `*.example.com` matches exactly one
++        // sublabel of `example.com`.
++        assert!(!baz_bar_example_com.matches(&any_example_com));
+     }
+ 
+     #[test]
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index 10ce753eac3..01382219fa8 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da6
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://CVE-2026-26007.patch \
+            file://CVE-2026-34073.patch \
             file://check-memfree.py \
             file://run-ptest \
            "

