Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEC0CD98DF
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71821.1781274404621740809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=z+CD+Aer;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so716125f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274403; x=1781879203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+m7xvI3JP75fOs7c+0IIxjCM1KKmKu28fwIJag5BcA=;
        b=z+CD+Aertl3EUtZSYVNUCtmG3SxSngdkAxQE02X+zEGHgc9+gffdYV8qJz5mxHYwwU
         S0SS1NK4Cl1dvAfH6uQ9T7EbHc2bRtwshxxFn1NZxwjknxkRwhvQBugkUq+PWWoYlqZZ
         3dpa6kRH+cfcbQkIZZRzi3pxXfeAB6pg2llVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274403; x=1781879203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o+m7xvI3JP75fOs7c+0IIxjCM1KKmKu28fwIJag5BcA=;
        b=B6o8MnTC242tTVDT63fAaQOVn/bnLFIsMmVvdDRazGTYZPZjeqgeYVrJkZFqJX717Z
         vvfBJL38m56zJzz3tMNtcaFKsjC4w/J4EwsVDDfZ42JQJC1nyrYvMxUn714zZ2hjFode
         uPr7eOxx0h37ArL9TesqDtgQek0hlvbFwkAoR6T1ysDLunv2f1iYvJBROKgcf6R0/GF9
         F/fkp6uaWbQTqm1Z2pYOiksliQ78JoOp4FfsAFUdefQpMHerxjqUnWZvJeE/6GHGa+je
         YTEMdxFiRb0L2HHKi7d9R5wycPvka8qTiCeydl6bfzu/Ys0IYyA/MMNL2b/zE23i7p+o
         PTBw==
X-Gm-Message-State: AOJu0YyD+XHCHA/QXrcwbH/2Ab78mxVb2QraVCT79tpxPNEqK0uq+upk
	p1vaYDZrpXLFOe11zqJi9z3DXdslggg69vm3Uk50g/zo7u3vuOQByKHZYNYSfSk42QaAs5ocAR6
	Bm+ydhw==
X-Gm-Gg: Acq92OGoxlQ3eylTk18/1AxFvMYG/5qM4U8cEJ15zTgQHgg3XA3CsKrwMNtACNsTV7y
	VgEiYAumk3jn0apa2oiTP3uqhVnE0iu/NT1X7hjsYoIsR/WhESGtWR4mFc3XKcggyV7OIU2iiY6
	oMU4UhhpKFHgBNYLLcmyhRr+P8531PHvD7XmGMDwf1HgIhV1YA6e13eTpSA424qeklPImZFujk2
	Q1QiDPO9O9nZoVxGpTpCYL/lLYDfkta3r4Y1RB8wT3yTPq2xcG4VpYIc1hIhytsH/bfLC4DtWo5
	ERolT0pFskhErehOfqc8/SsTFqQUaiYRU4Sv8HXlqkhskpqlLXV6xtiFTJ1Wg2FwrXs9B7R6UVa
	s9JKiidp4UKx59D3Mf5bfrgJ/Kz/fyNMRMxJRP574yONeprb35wnpbwR/N3U7n8gdOwwnq5U30p
	op4bPDjMl5cb5V/35/xaXDhyY=
X-Received: by 2002:a5d:5d83:0:b0:460:51ef:f81f with SMTP id ffacd0b85a97d-4606da5bf12mr4621017f8f.6.1781274402653;
        Fri, 12 Jun 2026 07:26:42 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:41 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 08/21] go: patch CVE-2026-32280
Date: Fri, 12 Jun 2026 16:25:58 +0200
Message-ID: <76f60545d2f925962be0f058ae14e5ae4ff4abd1.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238630

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/758320

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32280.patch                | 289 ++++++++++++++++++
 2 files changed, 290 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32280.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 8efa82f862..0d4dff6c21 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -42,6 +42,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
     file://CVE-2026-27142.patch \
+    file://CVE-2026-32280.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32280.patch b/meta/recipes-devtools/go/go/CVE-2026-32280.patch
new file mode 100644
index 0000000000..9a6f7950ae
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32280.patch
@@ -0,0 +1,289 @@
+From 1d71a2882078ea5057e68a7d2fedc83a5227c764 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 5 Mar 2026 14:28:44 -0800
+Subject: [PATCH] crypto/x509: fix signature checking limit
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
+Fixes #78282
+Fixes CVE-2026-32280
+
+Change-Id: Ie6f05c6ba3b0a40c21f64f7c4f846e74fae3b10e
+Reviewed-on: https://go-review.googlesource.com/c/go/+/758320
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Jakub Ciolek <jakub@ciolek.dev>
+
+CVE: CVE-2026-32280
+Upstream-Status: Backport [https://github.com/golang/go/commit/26d8a902002a2b41bc4c302044110f2eae8d597f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
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
+2.43.0
+
-- 
2.53.0


