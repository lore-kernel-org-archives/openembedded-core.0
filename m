Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA22FCD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 12:13:07 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73730.1778587982902634168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 05:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ii0hkiQO;
 spf=pass (domain: mvista.com, ip: 74.125.82.169, mailfrom: hprajapati@mvista.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f7020a928eso7503456eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 05:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1778587982; x=1779192782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/e1w/EpwDRW/K4I9W2mw1o+DIp3RmmBqmqrbKeAPGiI=;
        b=Ii0hkiQOJBU5DqHME9O57RFTtKQL644MpbLtz9+LssD6Naft7LlPSarHT8qXkjR8v4
         5vVMSvttulSYXx6enK30FMVXc/LYqHKUbv/D0ZCQBIlu3AvXID5b3iJGZZAae2MSG5AE
         NYI+454v/XZtQldJX27a/b+EzMymgnuvstlMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587982; x=1779192782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/e1w/EpwDRW/K4I9W2mw1o+DIp3RmmBqmqrbKeAPGiI=;
        b=LdVy52nr+vQ9IbvQI++lvl21vzZTpTgKiBAU62c3O5OIHT3WHrZAMhRq4BEya4FxMO
         Ra6SsGOR85LdS1Of5SWnA3HA8gPE5i+ZvvJ/qXrvvW56pOhPwQewZEuxtwmX3ET0hMMB
         igF6RxdozB8HWpku9C32bKZRYjFT+UZ+i38XfwrxV6rQKRUFWJeLx52q1mR9lpCG7zFT
         t6xrNx07MG3gdw/n9ocIjmMzps/7A1seH35Q91zVdADmEyocqnHCVMSi6+ypIeWWab2b
         glj8PWZtV51+z+Qku6MQZx5BVtK5KcSlMbRaXnG24w0nBquH1GmDtMBlRR5Hc3LNLilE
         LBFg==
X-Gm-Message-State: AOJu0YyoHF3663X/XPx9DrKWvvmkk73SburohXoZt00rFAL05nvT0JO5
	X+XZOTzPKI/tdZQdXB5vxTzp6PyBTuBPDRjhPFvX6NTQw5+398KjIlXuL2HK6zrFs5rl0OW2laz
	bYFqS2EY=
X-Gm-Gg: Acq92OETfQlWjvyZmysh+rCyhw9RL3wpaS5TevL8PeHCY8sb8b9Aj0qMi0gm9Am+Rp4
	KipvfihyG5s9WDa5AIMgZaW9z7KMGPZuWdcz2yndPk/gGEBN2w9lVQDcyLc+9yK657XL9zlWZAI
	UnNuRaALITqi4gtV7RjBi2BlxZq4whrkLu/IGydV0Hti/z6aOFzakDtXGm9qAf9/XrenvOOcLFG
	rM2WFv2MHvYRpOXu8XYrbQo4HjFogKzg1zBq1jXiKGVNTVgKg6h5ow3e5ZRE23FvG0ALtasfW0H
	dA50txYF6M/WndRvjrYaScoQ0hCyGcXTujzETiyM/EdKLGuh5sOxh7X2edruRmJcD2jA6EO5sKz
	eyIckc05oUJfJDx8stM7wxl/wdC9mtx/pkNUcNNEJRgIrJiUpz3OL5tCDwbHhRHKlCfHeXdC98p
	QII8GV/naGtS//jMzE/BQIev6vEIkuwZSIQA1s
X-Received: by 2002:a05:7301:605:b0:2ed:e14:7f5b with SMTP id 5a478bee46e88-2ffd88b93cbmr1563907eec.31.1778587981581;
        Tue, 12 May 2026 05:13:01 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm21889756eec.23.2026.05.12.05.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:13:01 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] go 1.22.12: fix CVE-2026-32280
Date: Tue, 12 May 2026 17:42:54 +0530
Message-ID: <20260512121254.89456-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 12:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236881

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://github.com/golang/go/commit/edc1e4a5f2af48b648502d987b8d4eebf43c884b
[2] https://security-tracker.debian.org/tracker/CVE-2026-32280
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-32280

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32280.patch                | 294 ++++++++++++++++++
 2 files changed, 295 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32280.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 03437f0358..5753243f0e 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -44,6 +44,7 @@ SRC_URI += "\
     file://CVE-2026-27140.patch \
     file://CVE-2026-27143.patch \
     file://CVE-2026-27144.patch \
+    file://CVE-2026-32280.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32280.patch b/meta/recipes-devtools/go/go/CVE-2026-32280.patch
new file mode 100644
index 0000000000..30af4cf2ab
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32280.patch
@@ -0,0 +1,294 @@
+From edc1e4a5f2af48b648502d987b8d4eebf43c884b Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 5 Mar 2026 14:28:44 -0800
+Subject: [PATCH] [release-branch.go1.25] crypto/x509: fix signature checking
+ limit
+
+We added the "is this cert already in the chain" check (alreadyInChain)
+to considerCandidates before the signature limit. considerCandidates
+bails out when we exceed the signature check, but buildChains keeps
+calling considerCandidates until it exhausts all potential parents. In
+the case where a large number of certificates look to have signed each
+other (e.g. all have subject==issuerSubject and the same key),
+alreadyInChain is not particularly cheap, meaning even though we hit our
+"this is too much work" limit, we still do a lot of work.
+
+Move alreadyInChain after the signature limit, and also return a
+sentinel error, and check it in buildChains so we can break out of the
+loop early if we aren't actually going to do any more work.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Updates #78282
+Fixes #78361
+Fixes CVE-2026-32280
+
+Change-Id: Ie6f05c6ba3b0a40c21f64f7c4f846e74fae3b10e
+Reviewed-on: https://go-review.googlesource.com/c/go/+/758320
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Jakub Ciolek <jakub@ciolek.dev>
+(cherry picked from commit 26d8a902002a2b41bc4c302044110f2eae8d597f)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/759221
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2026-32280
+Upstream-Status: Backport [https://github.com/golang/go/commit/edc1e4a5f2af48b648502d987b8d4eebf43c884b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/crypto/x509/verify.go      |  31 ++++---
+ src/crypto/x509/verify_test.go | 150 ++++++++++++++++-----------------
+ 2 files changed, 96 insertions(+), 85 deletions(-)
+
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 0ae8aef..1de06bc 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -939,6 +939,8 @@ func alreadyInChain(candidate *Certificate, chain []*Certificate) bool {
+ // for failed checks due to different intermediates having the same Subject.
+ const maxChainSignatureChecks = 100
+ 
++var errSignatureLimit = errors.New("x509: signature check attempts limit reached while verifying certificate chain")
++
+ func (c *Certificate) buildChains(currentChain []*Certificate, sigChecks *int, opts *VerifyOptions) (chains [][]*Certificate, err error) {
+ 	var (
+ 		hintErr  error
+@@ -946,16 +948,16 @@ func (c *Certificate) buildChains(currentChain []*Certificate, sigChecks *int, o
+ 	)
+ 
+ 	considerCandidate := func(certType int, candidate potentialParent) {
+-		if candidate.cert.PublicKey == nil || alreadyInChain(candidate.cert, currentChain) {
+-			return
+-		}
+-
+ 		if sigChecks == nil {
+ 			sigChecks = new(int)
+ 		}
+ 		*sigChecks++
+ 		if *sigChecks > maxChainSignatureChecks {
+-			err = errors.New("x509: signature check attempts limit reached while verifying certificate chain")
++			err = errSignatureLimit
++			return
++		}
++
++		if candidate.cert.PublicKey == nil || alreadyInChain(candidate.cert, currentChain) {
+ 			return
+ 		}
+ 
+@@ -996,11 +998,20 @@ func (c *Certificate) buildChains(currentChain []*Certificate, sigChecks *int, o
+ 		}
+ 	}
+ 
+-	for _, root := range opts.Roots.findPotentialParents(c) {
+-		considerCandidate(rootCertificate, root)
+-	}
+-	for _, intermediate := range opts.Intermediates.findPotentialParents(c) {
+-		considerCandidate(intermediateCertificate, intermediate)
++candidateLoop:
++	for _, parents := range []struct {
++		certType   int
++		potentials []potentialParent
++	}{
++		{rootCertificate, opts.Roots.findPotentialParents(c)},
++		{intermediateCertificate, opts.Intermediates.findPotentialParents(c)},
++	} {
++		for _, parent := range parents.potentials {
++			considerCandidate(parents.certType, parent)
++			if err == errSignatureLimit {
++				break candidateLoop
++			}
++		}
+ 	}
+ 
+ 	if len(chains) > 0 {
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 223c250..f3711ac 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -1765,10 +1765,13 @@ func TestValidHostname(t *testing.T) {
+ 	}
+ }
+ 
+-func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.PrivateKey) (*Certificate, crypto.PrivateKey, error) {
+-	priv, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
+-	if err != nil {
+-		return nil, nil, err
++func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.PrivateKey, priv crypto.PrivateKey) (*Certificate, crypto.PrivateKey, error) {
++	if priv == nil {
++		var err error
++		priv, err = ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
++		if err != nil {
++			return nil, nil, err
++		}
+ 	}
+ 
+ 	serialNumberLimit := new(big.Int).Lsh(big.NewInt(1), 128)
+@@ -1779,6 +1782,7 @@ func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.Pr
+ 		Subject:      pkix.Name{CommonName: cn},
+ 		NotBefore:    time.Now().Add(-1 * time.Hour),
+ 		NotAfter:     time.Now().Add(24 * time.Hour),
++		DNSNames:     []string{rand.Text()},
+ 
+ 		KeyUsage:              KeyUsageKeyEncipherment | KeyUsageDigitalSignature | KeyUsageCertSign,
+ 		ExtKeyUsage:           []ExtKeyUsage{ExtKeyUsageServerAuth},
+@@ -1790,7 +1794,7 @@ func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.Pr
+ 		issuerKey = priv
+ 	}
+ 
+-	derBytes, err := CreateCertificate(rand.Reader, template, issuer, priv.Public(), issuerKey)
++	derBytes, err := CreateCertificate(rand.Reader, template, issuer, priv.(crypto.Signer).Public(), issuerKey)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
+@@ -1802,81 +1806,77 @@ func generateCert(cn string, isCA bool, issuer *Certificate, issuerKey crypto.Pr
+ 	return cert, priv, nil
+ }
+ 
+-func TestPathologicalChain(t *testing.T) {
+-	if testing.Short() {
+-		t.Skip("skipping generation of a long chain of certificates in short mode")
+-	}
+-
+-	// Build a chain where all intermediates share the same subject, to hit the
+-	// path building worst behavior.
+-	roots, intermediates := NewCertPool(), NewCertPool()
+-
+-	parent, parentKey, err := generateCert("Root CA", true, nil, nil)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
+-	roots.AddCert(parent)
+-
+-	for i := 1; i < 100; i++ {
+-		parent, parentKey, err = generateCert("Intermediate CA", true, parent, parentKey)
+-		if err != nil {
+-			t.Fatal(err)
+-		}
+-		intermediates.AddCert(parent)
+-	}
+-
+-	leaf, _, err := generateCert("Leaf", false, parent, parentKey)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
+-
+-	start := time.Now()
+-	_, err = leaf.Verify(VerifyOptions{
+-		Roots:         roots,
+-		Intermediates: intermediates,
+-	})
+-	t.Logf("verification took %v", time.Since(start))
+-
+-	if err == nil || !strings.Contains(err.Error(), "signature check attempts limit") {
+-		t.Errorf("expected verification to fail with a signature checks limit error; got %v", err)
+-	}
+-}
+-
+-func TestLongChain(t *testing.T) {
++func TestPathologicalChains(t *testing.T) {
+ 	if testing.Short() {
+-		t.Skip("skipping generation of a long chain of certificates in short mode")
+-	}
+-
+-	roots, intermediates := NewCertPool(), NewCertPool()
+-
+-	parent, parentKey, err := generateCert("Root CA", true, nil, nil)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
+-	roots.AddCert(parent)
++		t.Skip("skipping generation of a long chains of certificates in short mode")
++	}
++
++	// Test four pathological cases, where the intermediates in the chain have
++	// the same/different subjects and the same/different keys. This covers a
++	// number of cases where the chain building algorithm might be inefficient,
++	// such as when there are many intermediates with the same subject but
++	// different keys, many intermediates with the same key but different
++	// subjects, many intermediates with the same subject and key, or many
++	// intermediates with different subjects and keys.
++	//
++	// The worst case for our algorithm is when all of the intermediates share
++	// both subject and key, in which case all of the intermediates appear to
++	// have signed each other, causing us to see a large number of potential
++	// parents for each intermediate.
++	//
++	// All of these cases, Certificate.Verify should return errSignatureLimit.
++	//
++	// In all cases, don't have a root in the pool, so a valid chain cannot actually be built.
++
++	for _, test := range []struct {
++		sameSubject bool
++		sameKey     bool
++	}{
++		{sameSubject: false, sameKey: false},
++		{sameSubject: true, sameKey: false},
++		{sameSubject: false, sameKey: true},
++		{sameSubject: true, sameKey: true},
++	} {
++		t.Run(fmt.Sprintf("sameSubject=%t,sameKey=%t", test.sameSubject, test.sameKey), func(t *testing.T) {
++			intermediates := NewCertPool()
++
++			var intermediateKey crypto.PrivateKey
++			if test.sameKey {
++				var err error
++				intermediateKey, err = ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
++				if err != nil {
++					t.Fatal(err)
++				}
++			}
+ 
+-	for i := 1; i < 15; i++ {
+-		name := fmt.Sprintf("Intermediate CA #%d", i)
+-		parent, parentKey, err = generateCert(name, true, parent, parentKey)
+-		if err != nil {
+-			t.Fatal(err)
+-		}
+-		intermediates.AddCert(parent)
+-	}
++			var leafSigner crypto.PrivateKey
++			var intermediate *Certificate
++			for i := range 100 {
++				cn := "Intermediate CA"
++				if !test.sameSubject {
++					cn += fmt.Sprintf(" #%d", i)
++				}
++				var err error
++				intermediate, leafSigner, err = generateCert(cn, true, intermediate, leafSigner, intermediateKey)
++				if err != nil {
++					t.Fatal(err)
++				}
++				intermediates.AddCert(intermediate)
++			}
+ 
+-	leaf, _, err := generateCert("Leaf", false, parent, parentKey)
+-	if err != nil {
+-		t.Fatal(err)
+-	}
++			leaf, _, err := generateCert("Leaf", false, intermediate, leafSigner, nil)
++			if err != nil {
++				t.Fatal(err)
++			}
+ 
+-	start := time.Now()
+-	if _, err := leaf.Verify(VerifyOptions{
+-		Roots:         roots,
+-		Intermediates: intermediates,
+-	}); err != nil {
+-		t.Error(err)
++			start := time.Now()
++			_, err = leaf.Verify(VerifyOptions{
++				Roots:         NewCertPool(),
++				Intermediates: intermediates,
++			})
++			t.Logf("verification took %v", time.Since(start))
++		})
+ 	}
+-	t.Logf("verification took %v", time.Since(start))
+ }
+ 
+ func TestSystemRootsError(t *testing.T) {
+-- 
+2.50.1
+
-- 
2.50.1


