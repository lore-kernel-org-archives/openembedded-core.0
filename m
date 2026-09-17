Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD7DC982E9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1560.1789682875284044630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XEh24+B9;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e620fa473so732495e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682873; x=1790287673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tIs5yHPwh/xOP2k16tnjAlBBarB1L5b5Gx/8UvI38ZE=;
        b=XEh24+B9aEwxYXPRkV0tqsZb3nqgEZiUg4SRfADXmt9i3hXyAB20YWSFNF+n9yNFJV
         Vykr5o6MYuJG0xELf5LCIfwbqcSaOAMom5gA+a9kAhlLrcV+awowE0MwiKgNNAtst4Ki
         NrDdYguLmDmoDD+HhU8TIRL9UNjYEF1YxfKAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682873; x=1790287673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tIs5yHPwh/xOP2k16tnjAlBBarB1L5b5Gx/8UvI38ZE=;
        b=X+M6qvYdXiGhTLktc4k00sfJu05UYMI5sx4XCkyjBVyA4Gemfj+1+twHmr7VPjKjj3
         A39Vt2CXt7eKXRMnvXl/m3dPveJZlePKYF20y70VkomvLnXVPgSJLzgyZTM3VR0gk7Ur
         1K0yreftVWdQpU9UUdapc9B2OvKUEWTOgHefwizwJ1cs8Tr7StMdPEgWplR2Bz1DdIIq
         RQ2mZ2fOX7i5WzV4L2A92nCMQvuOKVpIOLk7jrXjF0b+uu8fPhhRMWrPzX17SBkVteQq
         Kq+mK/37MI6PUR45c6tVmFLHYP2L9Mv5AdZ/dyCY0ZvSzgUwmxHpLetaHi2Ijn2aGBZc
         nxhQ==
X-Gm-Message-State: AFuF++nmSkF1YtrUm9JsXvqUGni8uBB59lYZhTn5NVUw90X6XOcQtm+t
	AW4i8EoEhL42ewtwAUZ4Ab7SHvPi/4FGWvnGWSxnXeJ/zoKi/Blbt82eP1VAGDGg1tK40BLaAaq
	/YK/ka5I=
X-Gm-Gg: AYBFou1CICSm4Y/uaOjrTEx1LL1JOTeoWP1YTMhH1xi0yI0LgnE0Yzyh94GRvPzrEhk
	qLzenM4xp/ExGkE7IkM2CDEFujNYxY1YLuzCPiwvj5N5XSOed5MM5SUQMDNkydd7IYum4A2Z6xz
	4mg5QonsYd14aIg/hETE7pKs7H4ukvGdZMJhdcmErf7gC6viRsHIORAtZAl1zURsR6C3/asO0LE
	1JINo617+x6zqlOkcQguGjEFVbr7fU+vW3B9f3MAIpo6WkAVZ4CkqPEF50l1mvz9XNIL/96YTkJ
	9M+abKZLrbdi3Xveakiu+O2gRKeUDIuWgVuCLbzZB2lNxDkDqq2Gl5HrEo5bQDb6Ix+rFnUIaxv
	Uu6Venfs7vOBYa5HFcs254TXVFRoYNbKdGbAk11tKWjEMHcYfpu5JFgyyYoSHLvhkWoRSWDVSoG
	tBO8rac6y42z+M1yhGp3aU+H4An72sNjO6aAs+hQzM4p1nXy6SEi1DkbhPfpRDAiI9GrEO2TqLo
	FzWaGpsTXQR/51KMFjKyGvyYg/YyWIR8iAdS4Yff54i3FNEtsSL0Z6wnwEnywl+DHuw4dOrN98=
X-Received: by 2002:a05:600c:4505:b0:49e:69e3:884d with SMTP id 5b1f17b1804b1-49fc56dba00mr2984415e9.4.1789682873472;
        Thu, 17 Sep 2026 15:07:53 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/79] python3-cryptography: Fix CVE-2026-69249
Date: Fri, 18 Sep 2026 00:05:53 +0200
Message-ID: <a9d12718380cf428413b8e2b9afa95fb211b6553.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246103

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-69249
[2] https://security-tracker.debian.org/tracker/CVE-2026-69249

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../python/python3-cryptography.bb            |   1 +
 .../python3-cryptography/CVE-2026-69249.patch | 338 ++++++++++++++++++
 2 files changed, 339 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography.bb b/meta/recipes-devtools/python/python3-cryptography.bb
index 5c1de9192b1..f3cb755ed5b 100644
--- a/meta/recipes-devtools/python/python3-cryptography.bb
+++ b/meta/recipes-devtools/python/python3-cryptography.bb
@@ -16,6 +16,7 @@ SRC_URI[sha256sum] = "e4cfd68c5f3e0bfdad0d38e023239b96a2fe84146481852dffbcca442c
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://0002-Fix-installing-stray-files-into-site-packages.patch \
             file://CVE-2026-69248.patch \
+            file://CVE-2026-69249.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
new file mode 100644
index 00000000000..f700d3f1eee
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
@@ -0,0 +1,338 @@
+From 4a12cf49675a184e47f912b00b04f3a629283582 Mon Sep 17 00:00:00 2001
+From: William Woodruff <william@yossarian.net>
+Date: Sat, 6 Jun 2026 23:30:03 -0400
+Subject: [PATCH] Add a signature validation budget during path construction
+ (#14960)
+
+* Add a signature validation budget during path construction
+
+This extends our existing NC budget check to include a budget
+for signature validations. If a path construction exceeds the
+budget by performing more than the allowed number of signature
+validation steps, the entire construction fails.
+
+For now, our budget is 128 signature validations. This is
+consistent with (higher than) Go and rustls-webpki, which
+both set a limit of 100. Like Go, we attempt to make the "best"
+use of our signature budget by ordering by likelihood, using
+AKI/SKI match as the strongest signal of fitness.
+
+* Bump limbo
+
+* Temporary commit
+
+* Revert "Temporary commit"
+
+This reverts commit bcdb6808562a8b8f484f85d21cb201cfdb2bbbd7.
+
+* Fudge a coverage test into place
+
+* Coverage for the coverage god
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/4a12cf49675a184e47f912b00b04f3a629283582]
+CVE: CVE-2026-69249
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../cryptography-x509-verification/src/lib.rs | 183 +++++++++++++++++-
+ .../src/policy/mod.rs                         |   9 +-
+ 2 files changed, 182 insertions(+), 10 deletions(-)
+
+diff --git a/src/rust/cryptography-x509-verification/src/lib.rs b/src/rust/cryptography-x509-verification/src/lib.rs
+index 60c89d4..7ee3bb0 100644
+--- a/src/rust/cryptography-x509-verification/src/lib.rs
++++ b/src/rust/cryptography-x509-verification/src/lib.rs
+@@ -18,10 +18,14 @@ use std::vec;
+ use asn1::ObjectIdentifier;
+ use cryptography_x509::common::Asn1Read;
+ use cryptography_x509::extensions::{
+-    DuplicateExtensionsError, Extensions, NameConstraints, SubjectAlternativeName,
++    AuthorityKeyIdentifier, DuplicateExtensionsError, Extensions, NameConstraints,
++    SubjectAlternativeName,
+ };
+ use cryptography_x509::name::GeneralName;
+-use cryptography_x509::oid::{NAME_CONSTRAINTS_OID, SUBJECT_ALTERNATIVE_NAME_OID};
++use cryptography_x509::oid::{
++    AUTHORITY_KEY_IDENTIFIER_OID, NAME_CONSTRAINTS_OID, SUBJECT_ALTERNATIVE_NAME_OID,
++    SUBJECT_KEY_IDENTIFIER_OID,
++};
+ 
+ use crate::certificate::cert_is_self_issued;
+ use crate::ops::{CryptoOps, VerificationCertificate};
+@@ -98,15 +102,23 @@ impl<B: CryptoOps> Display for ValidationError<'_, B> {
+ 
+ struct Budget {
+     name_constraint_checks: usize,
++    signature_checks: usize,
+ }
+ 
+ impl Budget {
+-    // Same limit as other validators
++    // The maximum number of name constraint checks performed when attempting
++    // path construction. This is the same limit as other validators.
+     const DEFAULT_NAME_CONSTRAINT_CHECK_LIMIT: usize = 1 << 20;
+ 
++    // The maximum number of signature verifications performed when attempting
++    // path construction. The is similar to other validators:
++    // both Go and rustls-webpki pick 100.
++    const DEFAULT_SIGNATURE_CHECK_LIMIT: usize = 1 << 7;
++
+     fn new() -> Budget {
+         Budget {
+             name_constraint_checks: Self::DEFAULT_NAME_CONSTRAINT_CHECK_LIMIT,
++            signature_checks: Self::DEFAULT_SIGNATURE_CHECK_LIMIT,
+         }
+     }
+ 
+@@ -119,6 +131,15 @@ impl Budget {
+             })?;
+         Ok(())
+     }
++
++    fn signature_check<'chain, B: CryptoOps>(&mut self) -> ValidationResult<'chain, (), B> {
++        self.signature_checks = self.signature_checks.checked_sub(1).ok_or_else(|| {
++            ValidationError::new(ValidationErrorKind::FatalError(
++                "Exceeded maximum signature check limit",
++            ))
++        })?;
++        Ok(())
++    }
+ }
+ 
+ struct NameChain<'a, 'chain> {
+@@ -341,18 +362,57 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+         }
+     }
+ 
++    /// Identify and return potential issuers for `cert`, considering
++    /// candidates from both the trusted store and untrusted intermediate set.
++    /// Trusted candidates are returned before untrusted intermediate
++    /// candidates, and both groups are opportunisitically ordered by
++    /// "likeliness" in terms of AKI/SKI match.
+     fn potential_issuers(
+         &self,
+         cert: &'a VerificationCertificate<'chain, B>,
+-    ) -> impl Iterator<Item = &'a VerificationCertificate<'chain, B>> + '_ {
+-        // TODO: Optimizations:
+-        // * Search by AKI and other identifiers?
+-        self.store
++        cert_extensions: &Extensions<'chain>,
++    ) -> Vec<&'a VerificationCertificate<'chain, B>> {
++        let mut candidates: Vec<&'a VerificationCertificate<'chain, B>> = self
++            .store
+             .get_by_subject(&cert.certificate().tbs_cert.issuer)
+             .iter()
+             .chain(self.intermediates.iter().filter(|&candidate| {
+                 candidate.certificate().subject() == cert.certificate().issuer()
+             }))
++            .collect();
++
++        let want_kid: Option<&[u8]> = cert_extensions
++            .get_extension(&AUTHORITY_KEY_IDENTIFIER_OID)
++            .and_then(|ext| ext.value::<AuthorityKeyIdentifier<'_, Asn1Read>>().ok())
++            .and_then(|aki| aki.key_identifier);
++
++        // This mirrors Go's `findPotentialParents`: we have a global
++        // signature budget, so we want to bucket candidates by likeliness
++        // to avoid wasting budget on (potentially adversarial) name collisions.
++        //
++        // Observe that we use a stable sort to preserve trusted candidates
++        // before untrusted candidates in each likeliness bucket. In other
++        // words, we always try a likely trusted candidate over an equally
++        // likely untrusted one.
++        //
++        // See: <https://github.com/golang/go/blob/d00c67f297e/src/crypto/x509/cert_pool.go#L136>
++        candidates.sort_by_key(|candidate| {
++            let have_kid: Option<&[u8]> =
++                candidate.certificate().extensions().ok().and_then(|exts| {
++                    exts.get_extension(&SUBJECT_KEY_IDENTIFIER_OID)
++                        .and_then(|ext| ext.value::<&[u8]>().ok())
++                });
++
++            match (want_kid, have_kid) {
++                // cert AKID matches candidate SKID, highest likelihood.
++                (Some(want), Some(have)) if want == have => 0,
++                // cert AKID and candidate SKID don't match, lowest likelihood.
++                (Some(_), Some(_)) => 2,
++                // cert AKID and/or candidate SKID is not present, medium likelihood.
++                _ => 1u8,
++            }
++        });
++        candidates
+     }
+ 
+     fn build_chain_inner(
+@@ -385,7 +445,8 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+         // Otherwise, we collect a list of potential issuers for this cert,
+         // and continue with the first that verifies.
+         let mut last_err: Option<ValidationError<'_, B>> = None;
+-        for issuing_cert_candidate in self.potential_issuers(working_cert) {
++        for issuing_cert_candidate in self.potential_issuers(working_cert, working_cert_extensions)
++        {
+             // A candidate issuer is said to verify if it both
+             // signs for the working certificate and conforms to the
+             // policy.
+@@ -395,6 +456,7 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+                 working_cert,
+                 current_depth,
+                 &issuer_extensions,
++                budget,
+             ) {
+                 Ok(_) => {
+                     match self.build_chain_inner(
+@@ -503,10 +565,15 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+ #[cfg(test)]
+ mod tests {
+     use asn1::ParseError;
++    use cryptography_x509::certificate::Certificate;
+     use cryptography_x509::oid::SUBJECT_ALTERNATIVE_NAME_OID;
+ 
+     use crate::certificate::tests::PublicKeyErrorOps;
+-    use crate::{ValidationError, ValidationErrorKind};
++    use crate::ops::{CryptoOps, VerificationCertificate};
++    use crate::policy::{Policy, PolicyDefinition, Subject};
++    use crate::trust_store::Store;
++    use crate::types::DNSName;
++    use crate::{Budget, ChainBuilder, NameChain, ValidationError, ValidationErrorKind};
+ 
+     #[test]
+     fn test_validationerror_display() {
+@@ -528,4 +595,102 @@ mod tests {
+             ValidationError::<PublicKeyErrorOps>::new(ValidationErrorKind::FatalError("oops"));
+         assert_eq!(err.to_string(), "fatal error: oops");
+     }
++
++    /// A `CryptoOps` whose public key extraction and signature verification
++    /// always succeed, so that `valid_issuer` can be driven to completion
++    /// without real cryptographic material.
++    struct NullOps;
++
++    impl CryptoOps for NullOps {
++        type Key = ();
++        type Err = ();
++        type CertificateExtra = ();
++        type PolicyExtra = ();
++
++        fn public_key(&self, _cert: &Certificate<'_>) -> Result<Self::Key, Self::Err> {
++            Ok(())
++        }
++
++        fn verify_signed_by(
++            &self,
++            _cert: &Certificate<'_>,
++            _key: &Self::Key,
++        ) -> Result<(), Self::Err> {
++            Ok(())
++        }
++
++        fn clone_public_key(_key: &Self::Key) -> Self::Key {}
++
++        fn clone_extra(_extra: &Self::CertificateExtra) -> Self::CertificateExtra {}
++    }
++
++    #[test]
++    fn test_clone() {
++        assert_eq!(NullOps::clone_public_key(&()), ());
++        assert_eq!(NullOps::clone_extra(&()), ());
++    }
++
++    // A self-issued ("looping") CA certificate that is its own issuer.
++    fn looping_ca_pem() -> pem::Pem {
++        pem::parse(
++            "-----BEGIN CERTIFICATE-----
++MIIBcjCCARmgAwIBAgIBATAKBggqhkjOPQQDAjAhMR8wHQYDVQQDDBZsb29waW5n
++IHNlbGYtc2lnbmVkIENBMB4XDTIzMTIzMTAwMDAwMFoXDTI0MDEzMTAwMDAwMFow
++ITEfMB0GA1UEAwwWbG9vcGluZyBzZWxmLXNpZ25lZCBDQTBZMBMGByqGSM49AgEG
++CCqGSM49AwEHA0IABKAoXUGnHdfXJbSXjRjeW+PCVHmlo4KEki69N5pJUA0QyQMR
++v9ySOMnWf3Ea7TR4g3zdguwTP7LdpSku3uR1QkmjQjBAMA8GA1UdEwEB/wQFMAMB
++Af8wDgYDVR0PAQH/BAQDAgGGMB0GA1UdDgQWBBR23MGdG1Ma9iR+3CxKTafD/OE0
++dTAKBggqhkjOPQQDAgNHADBEAiA4RCr07KfZdM16VfGNZAQFjvC60SWIU3RRVY/L
++qolIOwIgCaIgj9ipK0Q0p+45UJiq+L/ncrxsweJkFq/UYubzhX0=
++-----END CERTIFICATE-----",
++        )
++        .unwrap()
++    }
++
++    /// Exercises our pathlen overflow error scenario.
++    ///
++    /// This condition is logically unreachable from Python, since
++    /// we unconditionally limit signature checks to a number smaller
++    /// than `u8::MAX`, meaning that we always exhaust the signature budget
++    /// before potentially exhausting the pathlen budget.
++    ///
++    /// To test that directly, we manually lift the signature budget
++    /// and start our pathlen state right at `u8::MAX`, guaranteeing
++    /// an overflow on the immediate chain building step.
++    #[test]
++    fn test_build_chain_inner_depth_overflow() {
++        let pem = looping_ca_pem();
++        let ca = asn1::parse_single::<Certificate<'_>>(pem.contents()).unwrap();
++        let ca_exts = ca.extensions().ok().unwrap();
++
++        // The same self-issued CA is both the working certificate and its own
++        // (only) candidate issuer, so the search recurses on itself.
++        let working = VerificationCertificate::<NullOps>::new(&ca, ());
++        let intermediates = [VerificationCertificate::<NullOps>::new(&ca, ())];
++        let store: Store<'_, NullOps> = Store::new([]);
++
++        let subject = Subject::DNS(DNSName::new("example.com").unwrap());
++        let time = asn1::DateTime::new(2024, 1, 1, 0, 0, 0).unwrap();
++        let policy_def =
++            PolicyDefinition::server(NullOps, subject, time, Some(u8::MAX), None, None).unwrap();
++        let policy = Policy::new(&policy_def, ());
++
++        let builder = ChainBuilder::new(&intermediates, &policy, &store);
++        let mut budget = Budget {
++            name_constraint_checks: usize::MAX,
++            signature_checks: usize::MAX,
++        };
++
++        let name_chain = NameChain::new::<NullOps>(None, &ca_exts, false)
++            .ok()
++            .unwrap();
++        let err = builder
++            .build_chain_inner(&working, u8::MAX, &ca_exts, name_chain, &mut budget)
++            .unwrap_err();
++
++        assert!(matches!(
++            err.kind,
++            ValidationErrorKind::Other(msg) if msg.contains("current depth calculation overflowed")
++        ));
++    }
+ }
+diff --git a/src/rust/cryptography-x509-verification/src/policy/mod.rs b/src/rust/cryptography-x509-verification/src/policy/mod.rs
+index 1d82e4b..b3a1f08 100644
+--- a/src/rust/cryptography-x509-verification/src/policy/mod.rs
++++ b/src/rust/cryptography-x509-verification/src/policy/mod.rs
+@@ -30,7 +30,9 @@ pub use crate::policy::extension::{
+     PresentExtensionValidatorCallback,
+ };
+ use crate::types::{DNSName, DNSPattern, IPAddress};
+-use crate::{ValidationError, ValidationErrorKind, ValidationResult, VerificationCertificate};
++use crate::{
++    Budget, ValidationError, ValidationErrorKind, ValidationResult, VerificationCertificate,
++};
+ 
+ // RSA key constraints, as defined in CA/B 6.1.5.
+ const WEBPKI_MINIMUM_RSA_MODULUS: usize = 2048;
+@@ -503,6 +505,7 @@ impl<'a, B: CryptoOps> Policy<'a, B> {
+         child: &VerificationCertificate<'chain, B>,
+         current_depth: u8,
+         issuer_extensions: &Extensions<'_>,
++        budget: &mut Budget,
+     ) -> ValidationResult<'chain, (), B> {
+         // The issuer needs to be a valid CA at the current depth.
+         self.permits_ca(issuer, current_depth, issuer_extensions)
+@@ -563,6 +566,10 @@ impl<'a, B: CryptoOps> Policy<'a, B> {
+             }
+         }
+ 
++        // Charge the (potentially expensive) signature verification against the
++        // budget before performing it, bounding the total work an attacker can
++        // force during chain building.
++        budget.signature_check()?;
+         if self.ops.verify_signed_by(child.certificate(), pk).is_err() {
+             return Err(ValidationError::new(ValidationErrorKind::Other(
+                 "signature does not match".to_string(),
+-- 
+2.43.0
+

