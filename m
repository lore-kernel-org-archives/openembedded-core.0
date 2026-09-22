Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BE9C982FA
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:12:48 +0000 (UTC)
Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5780.1790068367751789373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=B6R3x7UN;
 spf=pass (domain: mvista.com, ip: 74.125.228.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cebad4aeso3081355a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 02:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790068367; x=1790673167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5sRctTHYMhdV/6X91dr6IqhcQInYmh2VLNXJBDcJdGo=;
        b=B6R3x7UNcefizkdnalMCpYmwf4LAjwb0fUYB9SPwQG4pBk29dXWtUhefdesYWpr4Y+
         zkNfZ0fccDJdEetADDGfruHl83D7D8YrqODxZl+S28aTJAqFvG+PSKuRXR/7g7s/qrgG
         6Q+zoILXZlFDx97gzn91DoCtZnJFUN36mGWzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068367; x=1790673167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5sRctTHYMhdV/6X91dr6IqhcQInYmh2VLNXJBDcJdGo=;
        b=YswY9mxvY8D794ZnNMFEYvb2IGRmBHE3h0YaagPZvI9jZrDi5UU/DvSnnDcQk6wFbx
         jakEguGUy9Zw12dRfXJ1y9BRctRFnbBPP9MpquFJDNU5QEGUKSJiwHky4Q5EVum7Rhtx
         c5mm84ngrfwbZEI7Dt/NIRxl0lTsm3hEWdZBBzPWtgqR/kdLrUWyT0VxWsiPv+y0Dj9R
         1Pv/F2sU7jAUUX0PjSw+qL3hK49A+peMM+sp0oeetuyIYIEmBtgnR97/sQ85SjzjXHUl
         LaFqPcV4yONuDcai3rFtviD3Z7/TnTCmOJAd14lG18WvQ6zOp7FpK7n7cY38lEW/Wn4N
         0Lyw==
X-Gm-Message-State: AFuF++khIVYZ7LfnneNyHjIwtKtH0r7v0If/0tHWDz21eT5j9ycH6nEA
	C2IL9ThWcpJCnJSs7z6fSMrFhHgytsYRKawT84ih3CIdATDFzlu57lRs5j5OI96hu/wmj+fHEDk
	X2Kok+LY=
X-Gm-Gg: AYBFou01oG52pFrRwh07jYLD4UcQ2massk4Mh+GCIkSUL5rjB7byTliq8wVfnlVe+Wr
	wPHgVM5UFYBhYXqDGmX2+UEppSDSt85sFnWW+N7pSk8sj9aiTf+qSiaROecdRLo8Hb2JX1t/xQI
	EKD8fz5bCoqjB8lK4L/zqQJvPSPt4A2S9RHH9kH1lvHnFOo48o8jBrue+EPfi6RsA0qr6Kqbkq+
	RkQFBf8ImgeMI1bE9A2U2maU7E2ABVhA+NocaUUckOEHRt+vGfElkCTayls9PYxsC0YAAEKu1zW
	LvuYKLc9umqhARGafvOc0hy4rsWGgYgSWZL6lP2MdaCLHduguZ0F3lf0m0rDMJVoQ2PXP6l0SfT
	//OanunAxurYAA7jlUA0azp0mxhX5DdYSdjASUaLz9AzZsSKPV9iVVbMZbfHPOS+7wpWtS92Bd3
	srVkr6Myzsm2pXAJ2EUHgPxY5yNJW41TqUMXBNT2on+XZNc0uNzVfXFpvrqCJtLyigmGth1JyPQ
	AHIPXBWsxM=
X-Received: by 2002:a05:6a21:3a94:b0:3dd:a006:7b37 with SMTP id adf61e73a8af0-3ddec8023b5mr638687637.54.1790068367072;
        Tue, 22 Sep 2026 02:12:47 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:b6aa:4514:5733:3fea:a0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3552686c88.13.2026.09.22.02.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:12:45 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2 1/3] python3-cryptography: Fix CVE-2026-34073
Date: Tue, 22 Sep 2026 14:42:34 +0530
Message-ID: <20260922091236.766239-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246392

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-34073
[2] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2026-34073

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-cryptography/CVE-2026-34073.patch | 167 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-34073.patch
new file mode 100644
index 0000000000..9f144fa709
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
index 10ce753eac..01382219fa 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -12,6 +12,7 @@ SRC_URI[sha256sum] = "6fe07eec95dfd477eb9530aef5bead34fec819b3aaf6c5bd6d20565da6
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://CVE-2026-26007.patch \
+            file://CVE-2026-34073.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
-- 
2.43.0


