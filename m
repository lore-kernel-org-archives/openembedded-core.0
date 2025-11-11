Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200C9CCFA1E
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:58:59 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19314.1762873128971808828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:58:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CY9CXpfj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3437af844afso2768928a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873128; x=1763477928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7Vy68zM4f0zMTiOuF2Wop4jx25fQmxUsfovZOW2ICE=;
        b=CY9CXpfjNS3UQTUMaDo1NNUJLoL10FQVKL2qz31WoWu8e1X+nUc773HT1T21kiyJFQ
         6fZ5EtGeXrkGuB/mHLzePWHUWIDTCeHJ7U13GJRu480/BoGxg4MmRG6SxV20eAcm10qw
         hBObwoYKJg0SibVLidYxkX6huJSc/2wxCD+toMUku18U+gnUIDj6O7alONAxCHTV8o9i
         EAinmRMXKHkMOVU8Qh3jDZHEBts7KZ5rQfEf39wTwji/pbGzLL4AqJGy6HduNHceTgJd
         54XfaiJ6tx2b2CLeDwoX2GV9koZsbGcReEYsfmJ/ChKO4tM5ap36SAj6ls/G6vkXfKhv
         AqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873128; x=1763477928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7Vy68zM4f0zMTiOuF2Wop4jx25fQmxUsfovZOW2ICE=;
        b=ggGEtplNo3XINVsa1MN+olfhbzuMVEN3dY5PBHsmzTcyfT8qP+Ac3oyf+H62R4+wS5
         bufUI09cqKX3SopWO+BEGUQWnJVadHS4uVRPhgYu/ADcg6cS8WGtDxwzqYS/mPipqyyL
         +OVs1zqC3H49UysdTuNEpcHxH5m1JAl9WUw1DpRFF5dmOzp7gYC6nO8ITM1AOCGdejEp
         O6hszOTqSw6jXb1a05mnaUd0qz3T8w8ym3xJLTUxGJSzoa9oukIg2CrBOaLxCTxyq/LM
         HIW1x4KjmgD6tCpR4qG0d8nrhhOKofVbEYsJ/HcChLC/vjzMjeHxv6En3Y2NDPlRcbvz
         CJsA==
X-Gm-Message-State: AOJu0YwwiQZcEODSbrUs5OcUEjGzhdqzZt8jmFv0urFMqCS55Rx0n9Sq
	TnGid3LFbOUaVwfb0n/4iKrjiCanqFNwcJ0yIt8yC/zXKxRMo1yUEV2n5F93CaNhOz+tZ+CBmEs
	h9mjGApg=
X-Gm-Gg: ASbGnct9fGrE3WhxAbnEBYewyPLh5klIsOe5Vg8V97dGU8MQoApLvQGmnNtDLf0pq4P
	IIvJ2W1NRFXrpsIonAHEiqlc1jH3EYzSNJ8EToF+O5tUd3spX7dqr9kgvfrXEHHKu5cFw89TGnB
	9ZKn2fo8RNlBDE25V9FCmVt6TP3y6i51HP26UhS/XPhbiyHmbGCp0MrDRlWpEBffAFv9GfWrGAX
	FYYz1dFJi+gzTG9s2wsHCnCrmfOFJYe8S6gvgWDXRruTH9Cd3biGxXD5UT9VieXjsDfeSyY3+Ep
	+1l0j1iCulJzF/p2JfCxQ+uV4WWAK83W0YIyQhAsR+OVeaavouRnhFB/2CWp/q27hZRpd9snr6B
	8gqHpCNFzSdVQYi0W3DLGij418o65784jifzguo/VVlvFfdwDtTrP2Djn8I7hDy3gWOg=
X-Google-Smtp-Source: AGHT+IFZZqAUPaR3K388VfhK0pk1dxPGeTHSrrxHjJTrC0P6EeA/OEAfLJfGgHpDW7dz7/jPtFqv5w==
X-Received: by 2002:a17:90b:38cf:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-3436cbf892amr17544749a91.23.1762873128163;
        Tue, 11 Nov 2025 06:58:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.58.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:58:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/19] go: fix CVE-2025-58188
Date: Tue, 11 Nov 2025 06:58:12 -0800
Message-ID: <b532fa208d0b102326642a2fba8b17661a14307e.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226169

From: Archana Polampalli <archana.polampalli@windriver.com>

Validating certificate chains which contain DSA public keys can cause
programs to panic, due to a interface cast that assumes they implement
the Equal method. This affects programs which validate arbitrary certificate chains.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-58188.patch                | 194 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58188.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index a1c14ea684..b619fc48f4 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -23,6 +23,7 @@ SRC_URI += "\
     file://CVE-2025-47906.patch \
     file://CVE-2025-58185.patch \
     file://CVE-2025-58187.patch \
+    file://CVE-2025-58188.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-58188.patch b/meta/recipes-devtools/go/go/CVE-2025-58188.patch
new file mode 100644
index 0000000000..5787527414
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-58188.patch
@@ -0,0 +1,194 @@
+From f9f198ab05e3282cbf6b13251d47d9141981e401 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Thu, 11 Sep 2025 16:27:04 -0400
+Subject: [PATCH] [release-branch.go1.24] crypto/x509: mitigate DoS vector when
+ intermediate certificate contains DSA public key An attacker could craft an
+ intermediate X.509 certificate containing a DSA public key and can crash a
+ remote host with an unauthenticated call to any endpoint that verifies the
+ certificate chain.
+
+Thank you to Jakub Ciolek for reporting this issue.
+
+Fixes CVE-2025-58188
+For #75675
+Fixes #75702
+
+Change-Id: I2ecbb87b9b8268dbc55c8795891e596ab60f0088
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2780
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/709836
+TryBot-Bypass: Michael Pratt <mpratt@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+
+CVE: CVE-2025-58188
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/f9f198ab05e3282cbf6b13251d47d9141981e401]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/crypto/x509/verify.go      |   5 +-
+ src/crypto/x509/verify_test.go | 126 +++++++++++++++++++++++++++++++++
+ 2 files changed, 130 insertions(+), 1 deletion(-)
+
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 4502d4c..14cd23f 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -868,7 +868,10 @@ func alreadyInChain(candidate *Certificate, chain []*Certificate) bool {
+		if !bytes.Equal(candidate.RawSubject, cert.RawSubject) {
+			continue
+		}
+-		if !candidate.PublicKey.(pubKeyEqual).Equal(cert.PublicKey) {
++		// We enforce the canonical encoding of SPKI (by only allowing the
++		// correct AI paremeter encodings in parseCertificate), so it's safe to
++		// directly compare the raw bytes.
++		if !bytes.Equal(candidate.RawSubjectPublicKeyInfo, cert.RawSubjectPublicKeyInfo) {
+			continue
+		}
+		var certSAN *pkix.Extension
+diff --git a/src/crypto/x509/verify_test.go b/src/crypto/x509/verify_test.go
+index 8a7a5f6..4a7d8da 100644
+--- a/src/crypto/x509/verify_test.go
++++ b/src/crypto/x509/verify_test.go
+@@ -6,6 +6,7 @@ package x509
+
+ import (
+	"crypto"
++	"crypto/dsa"
+	"crypto/ecdsa"
+	"crypto/elliptic"
+	"crypto/rand"
+@@ -2811,3 +2812,128 @@ func TestVerifyNilPubKey(t *testing.T) {
+		t.Fatalf("buildChains returned unexpected error, got: %v, want %v", err, UnknownAuthorityError{})
+	}
+ }
++func TestCertificateChainSignedByECDSA(t *testing.T) {
++	caKey, err := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
++	if err != nil {
++		t.Fatal(err)
++	}
++	root := &Certificate{
++		SerialNumber:          big.NewInt(1),
++		Subject:               pkix.Name{CommonName: "X"},
++		NotBefore:             time.Now().Add(-time.Hour),
++		NotAfter:              time.Now().Add(365 * 24 * time.Hour),
++		IsCA:                  true,
++		KeyUsage:              KeyUsageCertSign | KeyUsageCRLSign,
++		BasicConstraintsValid: true,
++	}
++	caDER, err := CreateCertificate(rand.Reader, root, root, &caKey.PublicKey, caKey)
++	if err != nil {
++		t.Fatal(err)
++	}
++	root, err = ParseCertificate(caDER)
++	if err != nil {
++		t.Fatal(err)
++	}
++
++	leafKey, _ := ecdsa.GenerateKey(elliptic.P256(), rand.Reader)
++	leaf := &Certificate{
++		SerialNumber:          big.NewInt(42),
++		Subject:               pkix.Name{CommonName: "leaf"},
++		NotBefore:             time.Now().Add(-10 * time.Minute),
++		NotAfter:              time.Now().Add(24 * time.Hour),
++		KeyUsage:              KeyUsageDigitalSignature,
++		ExtKeyUsage:           []ExtKeyUsage{ExtKeyUsageServerAuth},
++		BasicConstraintsValid: true,
++	}
++	leafDER, err := CreateCertificate(rand.Reader, leaf, root, &leafKey.PublicKey, caKey)
++	if err != nil {
++		t.Fatal(err)
++	}
++	leaf, err = ParseCertificate(leafDER)
++	if err != nil {
++		t.Fatal(err)
++	}
++
++	inter, err := ParseCertificate(dsaSelfSignedCNX(t))
++	if err != nil {
++		t.Fatal(err)
++	}
++
++	inters := NewCertPool()
++	inters.AddCert(root)
++	inters.AddCert(inter)
++
++	wantErr := "certificate signed by unknown authority"
++	_, err = leaf.Verify(VerifyOptions{Intermediates: inters, Roots: NewCertPool()})
++	if !strings.Contains(err.Error(), wantErr) {
++		t.Errorf("got %v, want %q", err, wantErr)
++	}
++}
++
++// dsaSelfSignedCNX produces DER-encoded
++// certificate with the properties:
++//
++//	Subject=Issuer=CN=X
++//	DSA SPKI
++//	Matching inner/outer signature OIDs
++//	Dummy ECDSA signature
++func dsaSelfSignedCNX(t *testing.T) []byte {
++	t.Helper()
++	var params dsa.Parameters
++	if err := dsa.GenerateParameters(&params, rand.Reader, dsa.L1024N160); err != nil {
++		t.Fatal(err)
++	}
++
++	var dsaPriv dsa.PrivateKey
++	dsaPriv.Parameters = params
++	if err := dsa.GenerateKey(&dsaPriv, rand.Reader); err != nil {
++		t.Fatal(err)
++	}
++	dsaPub := &dsaPriv.PublicKey
++
++	type dsaParams struct{ P, Q, G *big.Int }
++	paramDER, err := asn1.Marshal(dsaParams{dsaPub.P, dsaPub.Q, dsaPub.G})
++	if err != nil {
++		t.Fatal(err)
++	}
++	yDER, err := asn1.Marshal(dsaPub.Y)
++	if err != nil {
++		t.Fatal(err)
++	}
++
++	spki := publicKeyInfo{
++		Algorithm: pkix.AlgorithmIdentifier{
++			Algorithm:  oidPublicKeyDSA,
++			Parameters: asn1.RawValue{FullBytes: paramDER},
++		},
++		PublicKey: asn1.BitString{Bytes: yDER, BitLength: 8 * len(yDER)},
++	}
++
++	rdn := pkix.Name{CommonName: "X"}.ToRDNSequence()
++	b, err := asn1.Marshal(rdn)
++	if err != nil {
++		t.Fatal(err)
++	}
++	rawName := asn1.RawValue{FullBytes: b}
++
++	algoIdent := pkix.AlgorithmIdentifier{Algorithm: oidSignatureDSAWithSHA256}
++	tbs := tbsCertificate{
++		Version:            0,
++		SerialNumber:       big.NewInt(1002),
++		SignatureAlgorithm: algoIdent,
++		Issuer:             rawName,
++		Validity:           validity{NotBefore: time.Now().Add(-time.Hour), NotAfter: time.Now().Add(24 * time.Hour)},
++		Subject:            rawName,
++		PublicKey:          spki,
++	}
++	c := certificate{
++		TBSCertificate:     tbs,
++		SignatureAlgorithm: algoIdent,
++		SignatureValue:     asn1.BitString{Bytes: []byte{0}, BitLength: 8},
++	}
++	dsaDER, err := asn1.Marshal(c)
++	if err != nil {
++		t.Fatal(err)
++	}
++	return dsaDER
++}
+--
+2.40.0
-- 
2.43.0


