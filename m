Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4062DE9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 07:45:03 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9295.1771487098915774168
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 23:44:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lHdr9oC3;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=30843; q=dns/txt;
  s=iport01; t=1771487098; x=1772696698;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2cPb+vNFUCVjgPDVJa861R7jNw6oWR7mYWcSnjMY2Yw=;
  b=lHdr9oC39hJc0oCZ1zJ5OlWOeJ0m2Hj/CkvfGs64Q5I6m+gCHwYMJmiw
   DMpDD31ZMykBTvIZIZhzZK0dZJl8wZVbvup7bAYSMlIE5xCdafneeSRz9
   HpQDiDhHRKRcWPOyxCCDZkqN6UmVGrglb4bFNWgQgjQgeMTrFQWArLoAf
   nyo3xQBvxCBT4ldu0No0gLekC1Mcz4Ynw/wxAeIHLaHQ9LfcC2rA1KMKR
   UqhMnnnB/eQk9nM6751GXAnkBgk3i8vsZHmncbOCv0wEUEdu181ecXgfS
   4xIXkd2o4OOoEjSWAE8Vn4l7kSknvgjt7YocY/Zv9td6NzQCe7aiZ+Dto
   A==;
X-CSE-ConnectionGUID: hKfciDumTD69/DGP6EHdcA==
X-CSE-MsgGUID: V+8/bYe3QZitR/P5zj36Ow==
X-IPAS-Result: =?us-ascii?q?A0BrCgCfvpZp/5X/Ja1aglmCSA9xX0JJA5QngiGBFopRk?=
 =?us-ascii?q?jaBfw8BAQEPPRQEAQGSKAImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgEgGAFyAwECTwsdAQUhgwIBgjoDNgIBEapegiyBA?=
 =?us-ascii?q?YNiAQUCQ0/YRw2CUgELFAGBOIU8gnmFIFsYAYNbgR8nGxuBcoEVgReBW3aBB?=
 =?us-ascii?q?YEaQgEBgUgGhlYEgg0VgQ6BYSaKL4EkhgtIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQsbBwWHcw+JBXhugR+BFgMLGA1IESw3FBsEPm4Hjj5BgS9QM?=
 =?us-ascii?q?gEBASwQJhgTASsgeAM5NAsBGAYIFAIOCJJrBws5j2OCIYE1nmhxCiiDdIwej?=
 =?us-ascii?q?z6FfBozhVulEAuYe4s2glOECZFNCjk3hGiBaQE6OYEOCwdwFYMiCUkZD44sD?=
 =?us-ascii?q?AuDXoF/glG6LiIiNQIENgIHCwEBAwmRbC1uYAEB?=
IronPort-Data: A9a23:GSP9w6IIrAOf6ieAFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENShWQDm
 DQfWG+AbK2MZTSjf9B+OoW1pBkFsJ7Xy9YyS1Yd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnU0
 T/Oi5eHYgH9gWckajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1uL089PKEF/9pbXzAJ2
 dMgdh0tYhuq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEWojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjua8a4KFIIXXLSlTtnjb9
 iXMzmmiOyMbKObY8WeX8CnyofCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:P2n4b60g4Ef/F4/Eq5/63AqjBKckLtp133Aq2lEZdPUzSL37qy
 nAppomPHPP5Qr5O0tQ+uxoRpPgfZq0z/cciuMs1NyZMzUO1lHFEGgb1+vfK/mKIVybygabvp
 0QFpRDNA==
X-Talos-CUID: 9a23:aE1XyWC5M/LIs+76EylE+kUVNt0gTlGDnTD8DHfmJEZlQ5TAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AR9CsBQ8DXKz1u3O1/R4E2ZiQf/krs+OkOU1WqKc?=
 =?us-ascii?q?Hp/PDDXFiOWzDqyviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,299,1763424000"; 
   d="scan'208";a="669308215"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Feb 2026 07:44:57 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 8EE66180001E9
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 07:44:57 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 370C7CC12B5; Wed, 18 Feb 2026 23:44:57 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [scarthgap] [PATCH 7/7] go 1.22.12: Fix CVE-2025-68121
Date: Wed, 18 Feb 2026 23:44:49 -0800
Message-Id: <20260219074449.3398914-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 07:45:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231418

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-68121
Type: Security Fix
CVE: CVE-2025-68121
Score: 4.8
Patch:
- https://github.com/golang/go/commit/5f07b226f9aa
- https://github.com/golang/go/commit/cb75daf3b291
- https://github.com/golang/go/commit/6a501314718b

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index cc4f98a8fe..3fa421e223 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -38,6 +38,9 @@ SRC_URI += "\
     file://CVE-2025-68119-dependent.patch \
     file://CVE-2025-68119.patch \
     file://CVE-2025-61732.patch \
+    file://CVE-2025-68121_p1.patch \
+    file://CVE-2025-68121_p2.patch \
+    file://CVE-2025-68121_p3.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-68121_p1.patch b/meta/recipes-devtools/go/go/CVE-2025-68121_p1.patch
new file mode 100644
index 0000000000..811bb17ee8
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-68121_p1.patch
@@ -0,0 +1,253 @@
+From 529caf01aff2314585688c0f92f009d0ad0914be Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Mon, 26 Jan 2026 10:55:32 -0800
+Subject: [PATCH 1/2] [release-branch.go1.24] crypto/tls: add verifiedChains
+ expiration checking during resumption
+
+When resuming a session, check that the verifiedChains contain at least
+one chain that is still valid at the time of resumption. If not, trigger
+a new handshake.
+
+Updates #77113
+Updates #77355
+Updates CVE-2025-68121
+
+CVE: CVE-2025-68121
+Upstream-Status: Backport [https://github.com/golang/go/commit/5f07b226f9aa]
+
+Change-Id: I14f585c43da17802513cbdd5b10c552d7a38b34e
+Reviewed-on: https://go-review.googlesource.com/c/go/+/739321
+Reviewed-by: Coia Prant <coiaprant@gmail.com>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+Auto-Submit: Roland Shoemaker <roland@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/740061
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 5f07b226f9aa185aca4b88a9ae58456d7800fc06)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/crypto/tls/common.go                 |  13 +++
+ src/crypto/tls/handshake_client.go       |  10 +-
+ src/crypto/tls/handshake_server.go       |   2 +-
+ src/crypto/tls/handshake_server_test.go  | 122 +++++++++++++++++++++++
+ src/crypto/tls/handshake_server_tls13.go |   2 +-
+ 5 files changed, 144 insertions(+), 5 deletions(-)
+
+diff --git a/src/crypto/tls/common.go b/src/crypto/tls/common.go
+index 849e8b0a20..738c7e100b 100644
+--- a/src/crypto/tls/common.go
++++ b/src/crypto/tls/common.go
+@@ -1555,3 +1555,16 @@ func (e *CertificateVerificationError) Error() string {
+ func (e *CertificateVerificationError) Unwrap() error {
+	return e.Err
+ }
++
++// anyUnexpiredChain reports if at least one of verifiedChains is still
++// unexpired. If verifiedChains is empty, it returns false.
++func anyUnexpiredChain(verifiedChains [][]*x509.Certificate, now time.Time) bool {
++	for _, chain := range verifiedChains {
++		if len(chain) != 0 && !slices.ContainsFunc(chain, func(cert *x509.Certificate) bool {
++			return now.Before(cert.NotBefore) || now.After(cert.NotAfter) // cert is expired
++		}) {
++			return true
++		}
++	}
++	return false
++}
+diff --git a/src/crypto/tls/handshake_client.go b/src/crypto/tls/handshake_client.go
+index 08a2d47974..c2ff9e1959 100644
+--- a/src/crypto/tls/handshake_client.go
++++ b/src/crypto/tls/handshake_client.go
+@@ -322,9 +322,6 @@ func (c *Conn) loadSession(hello *clientHelloMsg) (
+		return nil, nil, nil, nil
+	}
+
+-	// Check that the cached server certificate is not expired, and that it's
+-	// valid for the ServerName. This should be ensured by the cache key, but
+-	// protect the application from a faulty ClientSessionCache implementation.
+	if c.config.time().After(session.peerCertificates[0].NotAfter) {
+		// Expired certificate, delete the entry.
+		c.config.ClientSessionCache.Put(cacheKey, nil)
+@@ -336,6 +333,13 @@ func (c *Conn) loadSession(hello *clientHelloMsg) (
+			return nil, nil, nil, nil
+		}
+		if err := session.peerCertificates[0].VerifyHostname(c.config.ServerName); err != nil {
++			// This should be ensured by the cache key, but protect the
++			// application from a faulty ClientSessionCache implementation.
++			return nil, nil, nil, nil
++		}
++		if !anyUnexpiredChain(session.verifiedChains, c.config.time()) {
++			// No valid chains, delete the entry.
++			c.config.ClientSessionCache.Put(cacheKey, nil)
+			return nil, nil, nil, nil
+		}
+	}
+diff --git a/src/crypto/tls/handshake_server.go b/src/crypto/tls/handshake_server.go
+index 17b6891783..608b2535f1 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -483,7 +483,7 @@ func (hs *serverHandshakeState) checkForResumption() error {
+		return nil
+	}
+	if sessionHasClientCerts && c.config.ClientAuth >= VerifyClientCertIfGiven &&
+-		len(sessionState.verifiedChains) == 0 {
++		!anyUnexpiredChain(sessionState.verifiedChains, c.config.time()) {
+		return nil
+	}
+
+diff --git a/src/crypto/tls/handshake_server_test.go b/src/crypto/tls/handshake_server_test.go
+index 0f10a3e7a6..9eff106ecf 100644
+--- a/src/crypto/tls/handshake_server_test.go
++++ b/src/crypto/tls/handshake_server_test.go
+@@ -12,6 +12,7 @@ import (
+	"crypto/elliptic"
+	"crypto/rand"
+	"crypto/x509"
++	"crypto/x509/pkix"
+	"encoding/pem"
+	"errors"
+	"fmt"
+@@ -2049,3 +2050,124 @@ func TestHandshakeContextHierarchy(t *testing.T) {
+		t.Errorf("Unexpected client error: %v", err)
+	}
+ }
++
++func TestHandshakeChainExpiryResumption(t *testing.T) {
++	t.Run("TLS1.2", func(t *testing.T) {
++		testHandshakeChainExpiryResumption(t, VersionTLS12)
++	})
++	t.Run("TLS1.3", func(t *testing.T) {
++		testHandshakeChainExpiryResumption(t, VersionTLS13)
++	})
++}
++
++func testHandshakeChainExpiryResumption(t *testing.T, version uint16) {
++	now := time.Now()
++
++	createChain := func(leafNotAfter, rootNotAfter time.Time) (leafDER, expiredLeafDER []byte, root *x509.Certificate) {
++		tmpl := &x509.Certificate{
++			Subject:               pkix.Name{CommonName: "root"},
++			NotBefore:             rootNotAfter.Add(-time.Hour * 24),
++			NotAfter:              rootNotAfter,
++			IsCA:                  true,
++			BasicConstraintsValid: true,
++		}
++		rootDER, err := x509.CreateCertificate(rand.Reader, tmpl, tmpl, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++		if err != nil {
++			t.Fatalf("CreateCertificate: %v", err)
++		}
++		root, err = x509.ParseCertificate(rootDER)
++		if err != nil {
++			t.Fatalf("ParseCertificate: %v", err)
++		}
++
++		tmpl = &x509.Certificate{
++			Subject:   pkix.Name{},
++			DNSNames:  []string{"expired-resume.example.com"},
++			NotBefore: leafNotAfter.Add(-time.Hour * 24),
++			NotAfter:  leafNotAfter,
++			KeyUsage:  x509.KeyUsageDigitalSignature,
++		}
++		leafCertDER, err := x509.CreateCertificate(rand.Reader, tmpl, root, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++		if err != nil {
++			t.Fatalf("CreateCertificate: %v", err)
++		}
++		tmpl.NotBefore, tmpl.NotAfter = leafNotAfter.Add(-time.Hour*24*365), leafNotAfter.Add(-time.Hour*24*364)
++		expiredLeafDERCertDER, err := x509.CreateCertificate(rand.Reader, tmpl, root, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++		if err != nil {
++			t.Fatalf("CreateCertificate: %v", err)
++		}
++
++		return leafCertDER, expiredLeafDERCertDER, root
++	}
++	testExpiration := func(name string, leafNotAfter, rootNotAfter time.Time) {
++		t.Run(name, func(t *testing.T) {
++			initialLeafDER, expiredLeafDER, initialRoot := createChain(leafNotAfter, rootNotAfter)
++
++			serverConfig := testConfig.Clone()
++			serverConfig.MaxVersion = version
++			serverConfig.Certificates = []Certificate{{
++				Certificate: [][]byte{initialLeafDER, expiredLeafDER},
++				PrivateKey:  testECDSAPrivateKey,
++			}}
++			serverConfig.ClientCAs = x509.NewCertPool()
++			serverConfig.ClientCAs.AddCert(initialRoot)
++			serverConfig.ClientAuth = RequireAndVerifyClientCert
++			serverConfig.Time = func() time.Time {
++				return now
++			}
++			serverConfig.InsecureSkipVerify = false
++			serverConfig.ServerName = "expired-resume.example.com"
++
++			clientConfig := testConfig.Clone()
++			clientConfig.MaxVersion = version
++			clientConfig.Certificates = []Certificate{{
++				Certificate: [][]byte{initialLeafDER, expiredLeafDER},
++				PrivateKey:  testECDSAPrivateKey,
++			}}
++			clientConfig.RootCAs = x509.NewCertPool()
++			clientConfig.RootCAs.AddCert(initialRoot)
++			clientConfig.ServerName = "expired-resume.example.com"
++			clientConfig.ClientSessionCache = NewLRUClientSessionCache(32)
++			clientConfig.InsecureSkipVerify = false
++			clientConfig.ServerName = "expired-resume.example.com"
++			clientConfig.Time = func() time.Time {
++				return now
++			}
++
++			testResume := func(t *testing.T, sc, cc *Config, expectResume bool) {
++				t.Helper()
++				ss, cs, err := testHandshake(t, cc, sc)
++				if err != nil {
++					t.Fatalf("handshake: %v", err)
++				}
++				if cs.DidResume != expectResume {
++					t.Fatalf("DidResume = %v; want %v", cs.DidResume, expectResume)
++				}
++				if ss.DidResume != expectResume {
++					t.Fatalf("DidResume = %v; want %v", cs.DidResume, expectResume)
++				}
++			}
++
++			testResume(t, serverConfig, clientConfig, false)
++			testResume(t, serverConfig, clientConfig, true)
++
++			expiredNow := time.Unix(0, min(leafNotAfter.UnixNano(), rootNotAfter.UnixNano())).Add(time.Minute)
++
++			freshLeafDER, expiredLeafDER, freshRoot := createChain(expiredNow.Add(time.Hour), expiredNow.Add(time.Hour))
++			clientConfig.Certificates = []Certificate{{
++				Certificate: [][]byte{freshLeafDER, expiredLeafDER},
++				PrivateKey:  testECDSAPrivateKey,
++			}}
++			serverConfig.Time = func() time.Time {
++				return expiredNow
++			}
++			serverConfig.ClientCAs = x509.NewCertPool()
++			serverConfig.ClientCAs.AddCert(freshRoot)
++
++			testResume(t, serverConfig, clientConfig, false)
++		})
++	}
++
++	testExpiration("LeafExpiresBeforeRoot", now.Add(2*time.Hour), now.Add(3*time.Hour))
++	testExpiration("LeafExpiresAfterRoot", now.Add(2*time.Hour), now.Add(time.Hour))
++}
+diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/handshake_server_tls13.go
+index 5aa69e9640..a48a296721 100644
+--- a/src/crypto/tls/handshake_server_tls13.go
++++ b/src/crypto/tls/handshake_server_tls13.go
+@@ -346,7 +346,7 @@ func (hs *serverHandshakeStateTLS13) checkForResumption() error {
+			continue
+		}
+		if sessionHasClientCerts && c.config.ClientAuth >= VerifyClientCertIfGiven &&
+-			len(sessionState.verifiedChains) == 0 {
++			!anyUnexpiredChain(sessionState.verifiedChains, c.config.time()) {
+			continue
+		}
+
+--
+2.35.6
diff --git a/meta/recipes-devtools/go/go/CVE-2025-68121_p2.patch b/meta/recipes-devtools/go/go/CVE-2025-68121_p2.patch
new file mode 100644
index 0000000000..8e8cd45019
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-68121_p2.patch
@@ -0,0 +1,385 @@
+From c22ca724688b18d51b4bbf97ec42914a7b2642c5 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Mon, 26 Jan 2026 11:18:45 -0800
+Subject: [PATCH] [release-branch.go1.24] crypto/tls: check verifiedChains
+ roots when resuming sessions
+
+When resuming TLS sessions, on the server and client verify that the
+chains stored in the session state (verifiedChains) are still acceptable
+with regards to the Config by checking for the inclusion of the root in
+either ClientCAs (server) or RootCAs (client). This prevents resuming
+a session with a certificate chain that would be rejected during a full
+handshake due to an untrusted root.
+
+Updates #77113
+Updates #77355
+Updates CVE-2025-68121
+
+CVE: CVE-2025-68121
+Upstream-Status: Backport [https://github.com/golang/go/commit/cb75daf3b291]
+
+Backport Changes:
+- In src/crypto/tls/common.go, the upstream fix introduces the use of
+  slices.ContainsFunc(). To align with that change, the slices library
+  needs to be imported in our local common.go file as well. Since this
+  package is not available in our current Go version (v1.22), we are
+  adding it manually to resolve the compilation issue.
+- The slices library was originally introduced in Go v1.23 as part of
+  the this commit:https://github.com/golang/go/commit/0b57881571a7
+
+Change-Id: I11fe00909ef1961c24ecf80bf5b97f7b1121d359
+Reviewed-on: https://go-review.googlesource.com/c/go/+/737700
+Auto-Submit: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Coia Prant <coiaprant@gmail.com>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/740062
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+(cherry picked from commit cb75daf3b29129620fa4a35ee2d3903e908aeb1c)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/crypto/tls/common.go                 |  26 ++-
+ src/crypto/tls/handshake_client.go       |   7 +-
+ src/crypto/tls/handshake_server.go       |   7 +-
+ src/crypto/tls/handshake_server_test.go  | 214 +++++++++++++++++++++++
+ src/crypto/tls/handshake_server_tls13.go |   8 +-
+ 5 files changed, 254 insertions(+), 8 deletions(-)
+
+diff --git a/src/crypto/tls/common.go b/src/crypto/tls/common.go
+index 738c7e100b..299d6f32cb 100644
+--- a/src/crypto/tls/common.go
++++ b/src/crypto/tls/common.go
+@@ -21,6 +21,7 @@ import (
+	"internal/godebug"
+	"io"
+	"net"
++	"slices"
+	"strings"
+	"sync"
+	"time"
+@@ -1556,13 +1557,28 @@ func (e *CertificateVerificationError) Unwrap() error {
+	return e.Err
+ }
+
+-// anyUnexpiredChain reports if at least one of verifiedChains is still
+-// unexpired. If verifiedChains is empty, it returns false.
+-func anyUnexpiredChain(verifiedChains [][]*x509.Certificate, now time.Time) bool {
++// anyValidVerifiedChain reports if at least one of the chains in verifiedChains
++// is valid, as indicated by none of the certificates being expired and the root
++// being in opts.Roots (or in the system root pool if opts.Roots is nil). If
++// verifiedChains is empty, it returns false.
++func anyValidVerifiedChain(verifiedChains [][]*x509.Certificate, opts x509.VerifyOptions) bool {
+	for _, chain := range verifiedChains {
+-		if len(chain) != 0 && !slices.ContainsFunc(chain, func(cert *x509.Certificate) bool {
+-			return now.Before(cert.NotBefore) || now.After(cert.NotAfter) // cert is expired
++		if len(chain) == 0 {
++			continue
++		}
++		if slices.ContainsFunc(chain, func(cert *x509.Certificate) bool {
++			return opts.CurrentTime.Before(cert.NotBefore) || opts.CurrentTime.After(cert.NotAfter)
+		}) {
++			continue
++		}
++		// Since we already validated the chain, we only care that it is
++		// rooted in a CA in CAs, or in the system pool. On platforms where
++		// we control chain validation (e.g. not Windows or macOS) this is a
++		// simple lookup in the CertPool internal hash map. On other
++		// platforms, this may be more expensive, depending on how they
++		// implement verification of just root certificates.
++		root := chain[len(chain)-1]
++		if _, err := root.Verify(opts); err == nil {
+			return true
+		}
+	}
+diff --git a/src/crypto/tls/handshake_client.go b/src/crypto/tls/handshake_client.go
+index c2ff9e1959..c8746b1023 100644
+--- a/src/crypto/tls/handshake_client.go
++++ b/src/crypto/tls/handshake_client.go
+@@ -337,7 +337,12 @@ func (c *Conn) loadSession(hello *clientHelloMsg) (
+			// application from a faulty ClientSessionCache implementation.
+			return nil, nil, nil, nil
+		}
+-		if !anyUnexpiredChain(session.verifiedChains, c.config.time()) {
++		opts := x509.VerifyOptions{
++			CurrentTime: c.config.time(),
++			Roots:       c.config.RootCAs,
++			KeyUsages:   []x509.ExtKeyUsage{x509.ExtKeyUsageServerAuth},
++		}
++		if !anyValidVerifiedChain(session.verifiedChains, opts) {
+			// No valid chains, delete the entry.
+			c.config.ClientSessionCache.Put(cacheKey, nil)
+			return nil, nil, nil, nil
+diff --git a/src/crypto/tls/handshake_server.go b/src/crypto/tls/handshake_server.go
+index 608b2535f1..4e3f5e19fb 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -482,8 +482,13 @@ func (hs *serverHandshakeState) checkForResumption() error {
+	if sessionHasClientCerts && c.config.time().After(sessionState.peerCertificates[0].NotAfter) {
+		return nil
+	}
++	opts := x509.VerifyOptions{
++		CurrentTime: c.config.time(),
++		Roots:       c.config.ClientCAs,
++		KeyUsages:   []x509.ExtKeyUsage{x509.ExtKeyUsageClientAuth},
++	}
+	if sessionHasClientCerts && c.config.ClientAuth >= VerifyClientCertIfGiven &&
+-		!anyUnexpiredChain(sessionState.verifiedChains, c.config.time()) {
++		!anyValidVerifiedChain(sessionState.verifiedChains, opts) {
+		return nil
+	}
+
+diff --git a/src/crypto/tls/handshake_server_test.go b/src/crypto/tls/handshake_server_test.go
+index 9eff106ecf..c44ad51804 100644
+--- a/src/crypto/tls/handshake_server_test.go
++++ b/src/crypto/tls/handshake_server_test.go
+@@ -2171,3 +2171,217 @@ func testHandshakeChainExpiryResumption(t *testing.T, version uint16) {
+	testExpiration("LeafExpiresBeforeRoot", now.Add(2*time.Hour), now.Add(3*time.Hour))
+	testExpiration("LeafExpiresAfterRoot", now.Add(2*time.Hour), now.Add(time.Hour))
+ }
++
++func TestHandshakeGetConfigForClientDifferentClientCAs(t *testing.T) {
++	t.Run("TLS1.2", func(t *testing.T) {
++		testHandshakeGetConfigForClientDifferentClientCAs(t, VersionTLS12)
++	})
++	t.Run("TLS1.3", func(t *testing.T) {
++		testHandshakeGetConfigForClientDifferentClientCAs(t, VersionTLS13)
++	})
++}
++
++func testHandshakeGetConfigForClientDifferentClientCAs(t *testing.T, version uint16) {
++	now := time.Now()
++	tmpl := &x509.Certificate{
++		Subject:               pkix.Name{CommonName: "root"},
++		NotBefore:             now.Add(-time.Hour * 24),
++		NotAfter:              now.Add(time.Hour * 24),
++		IsCA:                  true,
++		BasicConstraintsValid: true,
++	}
++	rootDER, err := x509.CreateCertificate(rand.Reader, tmpl, tmpl, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++	if err != nil {
++		t.Fatalf("CreateCertificate: %v", err)
++	}
++	rootA, err := x509.ParseCertificate(rootDER)
++	if err != nil {
++		t.Fatalf("ParseCertificate: %v", err)
++	}
++	rootDER, err = x509.CreateCertificate(rand.Reader, tmpl, tmpl, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++	if err != nil {
++		t.Fatalf("CreateCertificate: %v", err)
++	}
++	rootB, err := x509.ParseCertificate(rootDER)
++	if err != nil {
++		t.Fatalf("ParseCertificate: %v", err)
++	}
++
++	tmpl = &x509.Certificate{
++		Subject:   pkix.Name{},
++		DNSNames:  []string{"example.com"},
++		NotBefore: now.Add(-time.Hour * 24),
++		NotAfter:  now.Add(time.Hour * 24),
++		KeyUsage:  x509.KeyUsageDigitalSignature,
++	}
++	certDER, err := x509.CreateCertificate(rand.Reader, tmpl, rootA, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++	if err != nil {
++		t.Fatalf("CreateCertificate: %v", err)
++	}
++
++	serverConfig := testConfig.Clone()
++	serverConfig.MaxVersion = version
++	serverConfig.Certificates = []Certificate{{
++		Certificate: [][]byte{certDER},
++		PrivateKey:  testECDSAPrivateKey,
++	}}
++	serverConfig.Time = func() time.Time {
++		return now
++	}
++	serverConfig.ClientCAs = x509.NewCertPool()
++	serverConfig.ClientCAs.AddCert(rootA)
++	serverConfig.ClientAuth = RequireAndVerifyClientCert
++	switchConfig := false
++	serverConfig.GetConfigForClient = func(clientHello *ClientHelloInfo) (*Config, error) {
++		if !switchConfig {
++			return nil, nil
++		}
++		cfg := serverConfig.Clone()
++		cfg.ClientCAs = x509.NewCertPool()
++		cfg.ClientCAs.AddCert(rootB)
++		return cfg, nil
++	}
++	serverConfig.InsecureSkipVerify = false
++	serverConfig.ServerName = "example.com"
++
++	clientConfig := testConfig.Clone()
++	clientConfig.MaxVersion = version
++	clientConfig.Certificates = []Certificate{{
++		Certificate: [][]byte{certDER},
++		PrivateKey:  testECDSAPrivateKey,
++	}}
++	clientConfig.ClientSessionCache = NewLRUClientSessionCache(32)
++	clientConfig.RootCAs = x509.NewCertPool()
++	clientConfig.RootCAs.AddCert(rootA)
++	clientConfig.Time = func() time.Time {
++		return now
++	}
++	clientConfig.InsecureSkipVerify = false
++	clientConfig.ServerName = "example.com"
++
++	testResume := func(t *testing.T, sc, cc *Config, expectResume bool) {
++		t.Helper()
++		ss, cs, err := testHandshake(t, cc, sc)
++		if err != nil {
++			t.Fatalf("handshake: %v", err)
++		}
++		if cs.DidResume != expectResume {
++			t.Fatalf("DidResume = %v; want %v", cs.DidResume, expectResume)
++		}
++		if ss.DidResume != expectResume {
++			t.Fatalf("DidResume = %v; want %v", cs.DidResume, expectResume)
++		}
++	}
++
++	testResume(t, serverConfig, clientConfig, false)
++	testResume(t, serverConfig, clientConfig, true)
++
++	// Cause GetConfigForClient to return a config cloned from the base config,
++	// but with a different ClientCAs pool. This should cause resumption to fail.
++	switchConfig = true
++
++	testResume(t, serverConfig, clientConfig, false)
++	testResume(t, serverConfig, clientConfig, true)
++}
++
++func TestHandshakeChangeRootCAsResumption(t *testing.T) {
++	t.Run("TLS1.2", func(t *testing.T) {
++		testHandshakeChangeRootCAsResumption(t, VersionTLS12)
++	})
++	t.Run("TLS1.3", func(t *testing.T) {
++		testHandshakeChangeRootCAsResumption(t, VersionTLS13)
++	})
++}
++
++func testHandshakeChangeRootCAsResumption(t *testing.T, version uint16) {
++	now := time.Now()
++	tmpl := &x509.Certificate{
++		Subject:               pkix.Name{CommonName: "root"},
++		NotBefore:             now.Add(-time.Hour * 24),
++		NotAfter:              now.Add(time.Hour * 24),
++		IsCA:                  true,
++		BasicConstraintsValid: true,
++	}
++	rootDER, err := x509.CreateCertificate(rand.Reader, tmpl, tmpl, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++	if err != nil {
++		t.Fatalf("CreateCertificate: %v", err)
++	}
++	rootA, err := x509.ParseCertificate(rootDER)
++	if err != nil {
++		t.Fatalf("ParseCertificate: %v", err)
++	}
++	rootDER, err = x509.CreateCertificate(rand.Reader, tmpl, tmpl, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++	if err != nil {
++		t.Fatalf("CreateCertificate: %v", err)
++	}
++	rootB, err := x509.ParseCertificate(rootDER)
++	if err != nil {
++		t.Fatalf("ParseCertificate: %v", err)
++	}
++
++	tmpl = &x509.Certificate{
++		Subject:   pkix.Name{},
++		DNSNames:  []string{"example.com"},
++		NotBefore: now.Add(-time.Hour * 24),
++		NotAfter:  now.Add(time.Hour * 24),
++		KeyUsage:  x509.KeyUsageDigitalSignature,
++	}
++	certDER, err := x509.CreateCertificate(rand.Reader, tmpl, rootA, &testECDSAPrivateKey.PublicKey, testECDSAPrivateKey)
++	if err != nil {
++		t.Fatalf("CreateCertificate: %v", err)
++	}
++
++	serverConfig := testConfig.Clone()
++	serverConfig.MaxVersion = version
++	serverConfig.Certificates = []Certificate{{
++		Certificate: [][]byte{certDER},
++		PrivateKey:  testECDSAPrivateKey,
++	}}
++	serverConfig.Time = func() time.Time {
++		return now
++	}
++	serverConfig.ClientCAs = x509.NewCertPool()
++	serverConfig.ClientCAs.AddCert(rootA)
++	serverConfig.ClientAuth = RequireAndVerifyClientCert
++	serverConfig.InsecureSkipVerify = false
++	serverConfig.ServerName = "example.com"
++
++	clientConfig := testConfig.Clone()
++	clientConfig.MaxVersion = version
++	clientConfig.Certificates = []Certificate{{
++		Certificate: [][]byte{certDER},
++		PrivateKey:  testECDSAPrivateKey,
++	}}
++	clientConfig.ClientSessionCache = NewLRUClientSessionCache(32)
++	clientConfig.RootCAs = x509.NewCertPool()
++	clientConfig.RootCAs.AddCert(rootA)
++	clientConfig.Time = func() time.Time {
++		return now
++	}
++	clientConfig.InsecureSkipVerify = false
++	clientConfig.ServerName = "example.com"
++
++	testResume := func(t *testing.T, sc, cc *Config, expectResume bool) {
++		t.Helper()
++		ss, cs, err := testHandshake(t, cc, sc)
++		if err != nil {
++			t.Fatalf("handshake: %v", err)
++		}
++		if cs.DidResume != expectResume {
++			t.Fatalf("DidResume = %v; want %v", cs.DidResume, expectResume)
++		}
++		if ss.DidResume != expectResume {
++			t.Fatalf("DidResume = %v; want %v", cs.DidResume, expectResume)
++		}
++	}
++
++	testResume(t, serverConfig, clientConfig, false)
++	testResume(t, serverConfig, clientConfig, true)
++
++	clientConfig = clientConfig.Clone()
++	clientConfig.RootCAs = x509.NewCertPool()
++	clientConfig.RootCAs.AddCert(rootB)
++
++	testResume(t, serverConfig, clientConfig, false)
++	testResume(t, serverConfig, clientConfig, true)
++}
+diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/handshake_server_tls13.go
+index a48a296721..1ecee3a867 100644
+--- a/src/crypto/tls/handshake_server_tls13.go
++++ b/src/crypto/tls/handshake_server_tls13.go
+@@ -11,6 +11,7 @@ import (
+	"crypto/hmac"
+	"crypto/rsa"
+	"encoding/binary"
++	"crypto/x509"
+	"errors"
+	"hash"
+	"io"
+@@ -345,8 +346,13 @@ func (hs *serverHandshakeStateTLS13) checkForResumption() error {
+		if sessionHasClientCerts && c.config.time().After(sessionState.peerCertificates[0].NotAfter) {
+			continue
+		}
++		opts := x509.VerifyOptions{
++			CurrentTime: c.config.time(),
++			Roots:       c.config.ClientCAs,
++			KeyUsages:   []x509.ExtKeyUsage{x509.ExtKeyUsageClientAuth},
++		}
+		if sessionHasClientCerts && c.config.ClientAuth >= VerifyClientCertIfGiven &&
+-			!anyUnexpiredChain(sessionState.verifiedChains, c.config.time()) {
++			!anyValidVerifiedChain(sessionState.verifiedChains, opts) {
+			continue
+		}
+
+--
+2.35.6
diff --git a/meta/recipes-devtools/go/go/CVE-2025-68121_p3.patch b/meta/recipes-devtools/go/go/CVE-2025-68121_p3.patch
new file mode 100644
index 0000000000..40266f9f9e
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-68121_p3.patch
@@ -0,0 +1,82 @@
+From f38ac662b21e333b77951848a7e0549e4f69799e Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Thu, 29 Jan 2026 11:32:25 +0100
+Subject: [PATCH] [release-branch.go1.24] crypto/tls: document resumption
+ behavior across Configs
+
+Updates #77113
+Updates #77217
+Updates CVE-2025-68121
+
+CVE: CVE-2025-68121
+Upstream-Status: Backport [https://github.com/golang/go/commit/6a501314718b]
+
+Change-Id: Ia47904a9ed001275aad0243a6a0ce57e6a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/740240
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+Auto-Submit: Filippo Valsorda <filippo@golang.org>
+(cherry picked from commit 1c9abbdc8e9032cd613bd147c78b166ebacc8a2e)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/741180
+Auto-Submit: Michael Pratt <mpratt@google.com>
+(cherry picked from commit 6a501314718b6d69bad1723b3065ca6067b560ea)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/crypto/tls/common.go | 26 +++++++++++++++++++-------
+ 1 file changed, 19 insertions(+), 7 deletions(-)
+
+diff --git a/src/crypto/tls/common.go b/src/crypto/tls/common.go
+index 299d6f32cb..348bdf0866 100644
+--- a/src/crypto/tls/common.go
++++ b/src/crypto/tls/common.go
+@@ -595,10 +595,13 @@ type Config struct {
+	// If GetConfigForClient is nil, the Config passed to Server() will be
+	// used for all connections.
+	//
+-	// If SessionTicketKey was explicitly set on the returned Config, or if
+-	// SetSessionTicketKeys was called on the returned Config, those keys will
++	// If SessionTicketKey is explicitly set on the returned Config, or if
++	// SetSessionTicketKeys is called on the returned Config, those keys will
+	// be used. Otherwise, the original Config keys will be used (and possibly
+-	// rotated if they are automatically managed).
++	// rotated if they are automatically managed). WARNING: this allows session
++	// resumtion of connections originally established with the parent (or a
++	// sibling) Config, which may bypass the [Config.VerifyPeerCertificate]
++	// value of the returned Config.
+	GetConfigForClient func(*ClientHelloInfo) (*Config, error)
+
+	// VerifyPeerCertificate, if not nil, is called after normal
+@@ -616,8 +619,10 @@ type Config struct {
+	// rawCerts may be empty on the server if ClientAuth is RequestClientCert or
+	// VerifyClientCertIfGiven.
+	//
+-	// This callback is not invoked on resumed connections, as certificates are
+-	// not re-verified on resumption.
++	// This callback is not invoked on resumed connections. WARNING: this
++	// includes connections resumed across Configs returned by [Config.Clone] or
++	// [Config.GetConfigForClient] and their parents. If that is not intended,
++	// use [Config.VerifyConnection] instead, or set [Config.SessionTicketsDisabled].
+	//
+	// verifiedChains and its contents should not be modified.
+	VerifyPeerCertificate func(rawCerts [][]byte, verifiedChains [][]*x509.Certificate) error
+@@ -825,8 +830,15 @@ func (c *Config) ticketKeyFromBytes(b [32]byte) (key ticketKey) {
+ // ticket, and the lifetime we set for all tickets we send.
+ const maxSessionTicketLifetime = 7 * 24 * time.Hour
+
+-// Clone returns a shallow clone of c or nil if c is nil. It is safe to clone a [Config] that is
+-// being used concurrently by a TLS client or server.
++// Clone returns a shallow clone of c or nil if c is nil. It is safe to clone a
++// [Config] that is being used concurrently by a TLS client or server.
++//
++// The returned Config can share session ticket keys with the original Config,
++// which means connections could be resumed across the two Configs. WARNING:
++// [Config.VerifyPeerCertificate] does not get called on resumed connections,
++// including connections that were originally established on the parent Config.
++// If that is not intended, use [Config.VerifyConnection] instead, or set
++// [Config.SessionTicketsDisabled].
+ func (c *Config) Clone() *Config {
+	if c == nil {
+		return nil
+--
+2.35.6
-- 
2.44.1


