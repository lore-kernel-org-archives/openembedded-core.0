Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E146CCFA1A
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 10:21:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8259.1762510870469360980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hTNi6hrM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3406543a8f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A76Z2cL2647700
	for <openembedded-core@lists.openembedded.org>; Fri, 7 Nov 2025 02:21:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=B+TN3ikaSp245xEkmsQND3FXW6SKhQ/2EWBWZRUbW8s=; b=hTNi6hrMBSzg
	T3hvHU2ELAojR5mvDe1KAEo/OvVlQPYYVrGouhX18sYK+rP5irqhC0PjVkRuhq34
	E3OuPoV46xccY0YstLkJEf7QGGFaSKT5ZN712PB8G31i9QanK4ftmRU1jg7Oqn+y
	z6/45uoJrQZmvP4/dEZLyfbmDfG5+j3jIjEV0O4P8/ysPb4PFafB8EiENAhSJcwc
	ZUGw1KoZfSXfyZEkUpEtyL1vZtgOCsGFRfLi44jJ9DKtXG0NeQrjSpdtkpEfN0xX
	e6IpDLNzquSITzvUuWeVEBuFSHNIUIkDCxk7TumcFqvThWzeoH06jVevaZHmAk11
	0IrqawDbKw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a96ym8d0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 02:21:10 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 7 Nov 2025 02:21:09 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 7 Nov 2025 02:21:08 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH  3/7] go: fix CVE-2025-58188
Date: Fri, 7 Nov 2025 15:50:59 +0530
Message-ID: <20251107102103.436637-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251107102103.436637-1-archana.polampalli@windriver.com>
References: <20251107102103.436637-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2hxX3J2Qt3q8OK6lupRczuj6GEOIFFUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4MyBTYWx0ZWRfX1Wf55EZTYWPz
 ZZMIS+OhGO0LH2hdP810JgmeeWWwxrd8RWx7gUcHIVaOuYiaIWaWNyIHKbIS4zoNKr/sxn/RsIL
 OE+Vmfu4/4gPvCcGeart+swx+s3Unpm0TetKqiC0W0UG3i70YlJ0KuSrwsYWoT40vKdj76oJ/w+
 cP5emYRZSTlJYcjGikq0uIkPFGfZTXbsx8+bFcR3oyhECzzMoJxNk2JvQT5Tn7ofeKVHo0130NV
 FPmc8lzyTR5f3QMBw9lDvG6AR510H9qN78tM++RR9jqCnTtcX4lp8FxdSO+zCOA5nYbhX0L3h35
 7SGlyS3352NB0msa2w9ZWNxsoNSB3F9htcfGZBOzeNMM/U6d21ehHhdPmCiUzg14iIV15idy49n
 Xs/DKNRfATnMhAZNQGtV8N6pckC6Pg==
X-Proofpoint-GUID: 2hxX3J2Qt3q8OK6lupRczuj6GEOIFFUT
X-Authority-Analysis: v=2.4 cv=NqPcssdJ c=1 sm=1 tr=0 ts=690dc816 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8 a=LMaPaQqZR-gsADwCKQUA:9
 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 10:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226026

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
2.40.0


