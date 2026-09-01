Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8A5C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 09:28:02 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3769.1788254872834401134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 02:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Pumsot4C;
 spf=pass (domain: mvista.com, ip: 209.85.215.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso3114058a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 02:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788254872; x=1788859672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=feNug+Elg1x8Q/COt43EGB9ov+VaPVX6mLqYVw9RUnk=;
        b=Pumsot4Civaz7+BRqfP4mo/2Ncf479AsHjfs/Q4WLnJzBiLCxj9f7k3a1w0W2hc5t2
         RnJiRMgq87Px0eaz/KYysYw9Lo3FCvav5GdKUvPNbO09+0BFLY6VKDKgdDo9UPl7GDNC
         2esXQjzY0xGre9p7d8cY6/Dkr+aoyJtBJoOJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254872; x=1788859672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feNug+Elg1x8Q/COt43EGB9ov+VaPVX6mLqYVw9RUnk=;
        b=l0YiLbxoFwASXlOJpTpSXJjDzTE/cplLMl6ka6D8E72Wc9p+FuG29UushaiZndwGqz
         qsWw4DKy9s9zleaRsbw4Sc86a8ZdZaLfuXJdjg1dApTqB5whSoxPf1rYKN65mRSOg2l6
         YktJFjBnEGm7Vv11hrqE76DVk/4VrXZ4DvVrXnF8JaR45azDKKQ6Cs83g8skZ1MgPPaj
         IRGzbW9YCG4oYMW5hahQJ9uk8FHJ+vf5MsdGJRg0qLwuImSfFlPX0ENZsOEgztLBA9i6
         5s0t+fTbRYlPmBDVznT3ndqxMp0oeZp3uM2Yn72EMPFw8l89f9ziWYpPBNElqJ/OR72H
         o2rA==
X-Gm-Message-State: AFuF++k1qg2wGttzai3qczl9UOsmdcEufGFTbowavrf9SHOFx6bfxssO
	56TNSCzEtdtngF7DZEEk8YKFgqZcMj7Mqgxb+fawnspjyeebuMB81H8Czg7M3aCBWYLherANGKk
	HAOrE
X-Gm-Gg: AR+sD10Jz9WSL14nNvG69SsKPjwOcJ45WOILT0Cu/kFzG6uNDauxRIc8t51PTCAKCrA
	H490SfFaeTzQF4IwKegZrsvXE1+Yp4VJREVEQL4k4/jt1J7LLBM0BcqYoHjNO9s+f+Mt0vo2ryB
	OIwt4JnbyyYrH1io0TVRTxmOz4+JzDrnExxPiX5XUC0PsuPri7jlvFr4jMDz2NibRVazr04ozrD
	84SNGWmxL1xP2dKLQCWb8Sbi02ncu+ovnGSpo0AJIG7jDKIr4zMjGT26BaXrGaxCZZqwBqfEEFQ
	mj5S4aqCtThYti3VyLengRJ0zufQ3OZw3p4WToAYQzXSQ5CEJtkXqOD3i80kjdKk1nUY8Sal/UK
	+zGBJzAry65jzv1ZDcm+WV3XZRClluiSuVlfQGItF6I20geMVLUubJiwSo8Oi85VjHyjseSdhqW
	MRdIYnZLHpfSl2o+ZmytimCTPxq3n69g/QE9KRtuYZLpOzf03Hqqy/kCu6s+vPE8JG
X-Received: by 2002:a05:6a21:3a87:b0:3d3:af86:fb94 with SMTP id adf61e73a8af0-3d3af87e902mr39298185637.26.1788254871932;
        Tue, 01 Sep 2026 02:27:51 -0700 (PDT)
Received: from MVIN00352.. ([2401:4900:1f29:c0f2:70c7:b40a:9f7a:1a18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b4bc05416sm23271473eec.6.2026.09.01.02.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:27:51 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 1/3] python3-cryptography: Fix CVE-2026-34073
Date: Tue,  1 Sep 2026 14:57:39 +0530
Message-ID: <20260901092741.34198-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 09:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244814

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
index 0000000000..93dd31f1aa
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
+Upstream-Status: Backport [import from suse python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm
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


