Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922EDC982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 09:12:58 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5808.1790068377417193234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 02:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=NwQ7MmnO;
 spf=pass (domain: mvista.com, ip: 74.125.228.12, mailfrom: vanusuri@mvista.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so2384619a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 02:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790068377; x=1790673177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYcnMKpWNanogmN4fpxjrYQ18ny4Wra+v0UdNczXrc4=;
        b=NwQ7MmnO9C4v7vfWSD1SBCl2onlNfzE7Xch/FSjIfFOrgam51ILKeGznyC9NOczhlV
         Qn5E9jMA4pQMvizKwFLvUyKcf7OQ2Vmz5zvyyB6WOT58MCyfiRmiPfRhmuADNM5zo8S+
         L7oaAd6NIk0XhDAPbPy6Z8bERtly56gwxtIU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068377; x=1790673177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYcnMKpWNanogmN4fpxjrYQ18ny4Wra+v0UdNczXrc4=;
        b=zPOBZj8Q0sU/m375OyBBSyq4FpWYkrG3aVjXjCn3lgO5NhlkRNSiV/XPRmCVoybQFK
         zUHC8zgkj6QFF5fWVGcf6CSjMMpca4nAgyIO56tOTAvDhj/ukbAEGC40jsE9kvwwiBsh
         bBGjNM2hdzIJwVMzYiyppPuGDAeZNtAgqSUVH4xSGs8kkjFWInAK8TZZpPQipIfTw8U4
         8fg5CqunNl+l/n7j5j5UbjzwQF/gv4ieMuk/tpTvJiOimyL6liZEcIb/Ig/y7qKl3wC7
         7WP3s8NTVjeVDE/jRXmDNyVPPtEumM9uQZlWQSobd8rn0WUv25lg/vvYJ+9dmIZ9CkTL
         upoA==
X-Gm-Message-State: AFuF++n+tDr1NO9EDoxueikoNSNQYD+fof8iJmRGZImAf5U7Jh+jI9Wr
	sHvClT36pIz8kDuEdi16aNcb/VByHjPTbLo5FoRsSUApcsb1G8rycZEdD06LJtXLNqEI1vNt/JX
	v/uh+D4Y=
X-Gm-Gg: AYBFou0mHbhhDn/euh8LdHax3Ef1V9PpejocODaJ3GsvcGmAVyppC8VZ1umSrfn2JBg
	S8dcTBu36dYchVbJytoRopGicysMAQ0MlxetM4Iw3zwgXOMkKvs+rY2749nUHHuNcA5Kq4IbEiQ
	627sN7F5GRMoXFW3MttTeIakg6ESj4LpzcITRCtupX67UksSQwhqd8tzxw6oSHaATsRSPzZ344G
	QF90vq4HlozfSNXLotL3mQ4WLNBWexUFrcQ0jvD9BMEsV9vmA071zZTN+qtVgHGkPGvJ1q3X8OJ
	YQFKZy3xFFKGYi20/z3T44aegcwZN0l2+uMnngnXQeYHu/zKge15LKvxUKyPCK32LdKoMGWQtVg
	NraEgx80ndbfKU3jBwwvQoUppzZPzrEHNICuoYGufl2PGNVryYDGLUtCVb/Qb7UJ0BJlDzLhJrA
	RgLZeM7aC+xzd8QZolOmCpW36LXKc4KhkzPCjt2pcb609+SG7/GJeQLh7gC2dq8aW6R/aRQMG9s
	w+t2aam6rk=
X-Received: by 2002:a17:90b:3c83:b0:3a0:4384:adf6 with SMTP id 98e67ed59e1d1-3a072e91a13mr562363a91.0.1790068376531;
        Tue, 22 Sep 2026 02:12:56 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:b6aa:4514:5733:3fea:a0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f2a44cc8sm3552686c88.13.2026.09.22.02.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:12:54 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch v2 3/3] python3-cryptography: Fix CVE-2026-69249
Date: Tue, 22 Sep 2026 14:42:36 +0530
Message-ID: <20260922091236.766239-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922091236.766239-1-vanusuri@mvista.com>
References: <20260922091236.766239-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 09:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246394

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/cve-2026-69249
[2] https://security-tracker.debian.org/tracker/CVE-2026-69249

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-cryptography/CVE-2026-69249.patch | 354 ++++++++++++++++++
 .../python/python3-cryptography_42.0.5.bb     |   1 +
 2 files changed, 355 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
new file mode 100644
index 0000000000..db4f06067c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2026-69249.patch
@@ -0,0 +1,354 @@
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
+Note: SUSE patch CVE-2026-69249-signature-validation-budget.patch was adapted to our codebase where required. The budget-handling hunks that are not present in the backported patch are already available in our existing codebase, so those changes were not applied again.
+
+Additionally, add tests for the ValidationError Display implementation
+to align with corresponding upstream commit.
+
+Upstream-Status: Backport [import from suse https://download.opensuse.org/distribution/leap-micro/6.1/product/repo/openSUSE-Leap-Micro-6.1-x86_64-Source/src/python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm
+Upstream commit https://github.com/pyca/cryptography/commit/4a12cf49675a184e47f912b00b04f3a629283582]
+CVE: CVE-2026-69249
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../cryptography-x509-verification/src/lib.rs | 209 +++++++++++++++++-
+ .../src/policy/mod.rs                         |   8 +-
+ 2 files changed, 208 insertions(+), 9 deletions(-)
+
+diff --git a/src/rust/cryptography-x509-verification/src/lib.rs b/src/rust/cryptography-x509-verification/src/lib.rs
+index a505349..334eed4 100644
+--- a/src/rust/cryptography-x509-verification/src/lib.rs
++++ b/src/rust/cryptography-x509-verification/src/lib.rs
+@@ -15,9 +15,12 @@ use std::vec;
+ 
+ use cryptography_x509::extensions::{DuplicateExtensionsError, Extensions};
+ use cryptography_x509::{
+-    extensions::{NameConstraints, SubjectAlternativeName},
++    extensions::{AuthorityKeyIdentifier, NameConstraints, SubjectAlternativeName},
+     name::GeneralName,
+-    oid::{NAME_CONSTRAINTS_OID, SUBJECT_ALTERNATIVE_NAME_OID},
++};
++use cryptography_x509::oid::{
++    AUTHORITY_KEY_IDENTIFIER_OID, NAME_CONSTRAINTS_OID, SUBJECT_ALTERNATIVE_NAME_OID,
++    SUBJECT_KEY_IDENTIFIER_OID,
+ };
+ 
+ use types::{DNSPattern};
+@@ -40,15 +43,23 @@ pub enum ValidationError {
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
+@@ -61,6 +72,15 @@ impl Budget {
+                 ))?;
+         Ok(())
+     }
++    
++    fn signature_check(&mut self) -> Result<(), ValidationError> {
++        self.signature_checks = self.signature_checks.checked_sub(1).ok_or_else(|| {
++            ValidationError::FatalError(
++                "Exceeded maximum signature check limit",
++            )
++        })?;
++        Ok(())
++    }
+ }
+ 
+ impl From<asn1::ParseError> for ValidationError {
+@@ -270,18 +290,57 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+         }
+     }
+ 
++    /// Identify and return potential issuers for `cert`, considering
++    /// candidates from both the trusted store and untrusted intermediate set.
++    /// Trusted candidates are returned before untrusted intermediate
++    /// candidates, and both groups are opportunisitically ordered by
++    /// "likeliness" in terms of AKI/SKI match.
+     fn potential_issuers(
+         &'a self,
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
++            .and_then(|ext| ext.value::<AuthorityKeyIdentifier<'_>>().ok())
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
+@@ -314,7 +373,8 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+         // Otherwise, we collect a list of potential issuers for this cert,
+         // and continue with the first that verifies.
+         let mut last_err: Option<ValidationError> = None;
+-        for issuing_cert_candidate in self.potential_issuers(working_cert) {
++        for issuing_cert_candidate in self.potential_issuers(working_cert, working_cert_extensions)
++        {
+             // A candidate issuer is said to verify if it both
+             // signs for the working certificate and conforms to the
+             // policy.
+@@ -324,6 +384,7 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+                 working_cert.certificate(),
+                 current_depth,
+                 &issuer_extensions,
++                budget,
+             ) {
+                 Ok(_) => {
+                     match self.build_chain_inner(
+@@ -417,3 +478,135 @@ impl<'a, 'chain, B: CryptoOps> ChainBuilder<'a, 'chain, B> {
+         Ok(chain)
+     }
+ }
++
++#[cfg(test)]
++mod tests {
++    use asn1::ParseError;
++    use cryptography_x509::certificate::Certificate;
++    use cryptography_x509::oid::SUBJECT_ALTERNATIVE_NAME_OID;
++
++    use crate::certificate::tests::PublicKeyErrorOps;
++    use crate::ops::{CryptoOps, VerificationCertificate};
++    use crate::policy::{Policy, PolicyDefinition, Subject};
++    use crate::trust_store::Store;
++    use crate::types::DNSName;
++    use crate::{Budget, ChainBuilder, NameChain, ValidationError};
++
++    #[test]
++    fn test_validationerror_display() {
++        let err = ValidationError::Malformed(
++            ParseError::new(asn1::ParseErrorKind::InvalidLength),
++        );
++        assert_eq!(err.to_string(), "ASN.1 parsing error: invalid length");
++
++        let err = ValidationError::ExtensionError{
++            oid: SUBJECT_ALTERNATIVE_NAME_OID,
++            reason: "duplicate extension",
++        };
++        assert_eq!(
++            err.to_string(),
++            "invalid extension: 2.5.29.17: duplicate extension"
++        );
++
++        let err = ValidationError::FatalError("oops");
++        assert_eq!(err.to_string(), "fatal error: oops");
++    }
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
++            ValidationError::Other(msg) if msg.contains("current depth calculation overflowed")
++        ));
++    }
++}
+diff --git a/src/rust/cryptography-x509-verification/src/policy/mod.rs b/src/rust/cryptography-x509-verification/src/policy/mod.rs
+index d5a199d..5bdc8d5 100644
+--- a/src/rust/cryptography-x509-verification/src/policy/mod.rs
++++ b/src/rust/cryptography-x509-verification/src/policy/mod.rs
+@@ -25,7 +25,7 @@ use once_cell::sync::Lazy;
+ use crate::ops::CryptoOps;
+ use crate::policy::extension::{ca, common, ee, Criticality, ExtensionPolicy, ExtensionValidator};
+ use crate::types::{DNSName, DNSPattern, IPAddress};
+-use crate::{ValidationError, VerificationCertificate};
++use crate::{Budget, ValidationError, VerificationCertificate};
+ 
+ // SubjectPublicKeyInfo AlgorithmIdentifier constants, as defined in CA/B 7.1.3.1.
+ 
+@@ -463,10 +463,16 @@ impl<'a, B: CryptoOps> Policy<'a, B> {
+         child: &Certificate<'_>,
+         current_depth: u8,
+         issuer_extensions: &Extensions<'_>,
++        budget: &mut Budget,
+     ) -> Result<(), ValidationError> {
+         // The issuer needs to be a valid CA at the current depth.
+         self.permits_ca(issuer.certificate(), current_depth, issuer_extensions)?;
+ 
++        // Charge the (potentially expensive) signature verification against the
++        // budget before performing it, bounding the total work an attacker can
++        // force during chain building.
++        budget.signature_check()?;
++
+         // CA/B 7.1.3.1 SubjectPublicKeyInfo
+         // NOTE: We check the issuer's SPKI here, since the issuer is
+         // definitionally a CA and thus subject to CABF key requirements.
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index 8148ec0ba5..899332123f 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
             file://CVE-2026-26007.patch \
             file://CVE-2026-34073.patch \
             file://CVE-2026-69248.patch \
+            file://CVE-2026-69249.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
-- 
2.43.0


