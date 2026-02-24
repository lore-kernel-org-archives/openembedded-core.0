Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80121F357DE
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21682.1771943589889662027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=U1UzbJkJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-483abed83b6so22424865e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943588; x=1772548388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ruZmv6TsVJn1j50/TMd0PUKBsIsu/kdSbYu5NgPABY=;
        b=U1UzbJkJqhhW0Kh3TX4et6cRWWbAOW3cLbB+1DKK543DkdZd3Jy/1uzwgugm431/5f
         yd9w/An9d7WH6m7y9w8QYsfigYpaetbsSq9zlcka8/J//7pp0uiyjN9lj1hBfs3NOvcW
         9TlqZC6/1pqax+n6AWnrXMeoVGGlGheB5NQSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943588; x=1772548388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ruZmv6TsVJn1j50/TMd0PUKBsIsu/kdSbYu5NgPABY=;
        b=mf10vFx+v3BoYeOgdko0RSUkdSd2KGPiSfNbDN9mMJjlLirfq7m21L+lR0Ks3RTJm1
         SQYTEf977tpjQo3RosfNdKL8vSeRP24p1nCo/Mp3kjaGM7vL3yH0lHvdyS96Wmsi9d6m
         J4C1Th23y3mD6hIAAMbDm1LbsdmDAXg8hMkO2SzF0nv3LcM71k2t33pajWzAgmgvyg6W
         WJXrie8F2OOBMPvAaEnbk9vOemeMACds4UUhHan2CDZnJ6rVXwK+Pmf2kCjPEV4bMwXB
         TSDopdRVW+Yj/4Oz5/KI7QbFLMeWYnG111ehJz9ShwhQcdQwBgcq0z0Qu7MNsSTEBRwM
         rRQg==
X-Gm-Message-State: AOJu0YwZ5XeThewZk0kNdd6YZ5oc4sAlws+gjQc+15FtVT/HTY1Ysgiw
	AZ0qVcuER+VS/LqwTbedw6upPo5nqnxRxJdJC1cTf2bCKdofyacmx/skT8bm9aBS1OOYwZ8mqAz
	+4Xi3
X-Gm-Gg: AZuq6aLt4V2965hvnXGsWl2MW/oQ8l5GJwBktLOUL4x4Sz4oIvylsXlyFdbzHHnqIvF
	RPl8g4VuFa3HecS4JwE9vZXQbzdorZrk4gmZHvE0k73E1xAtxmYBaTmkrF6GbbvwYP9u7UoTjwc
	uGw5oAKyVEMfKoYN2rjMQFJU1ZvoDitsdioG4m/aCCfZV6oJUc/LfL+1RZJZV6+ANzSJxciZXaW
	Zb6wb7Ze41wx0+dmWzyeNZWZ4yci83gOWwp+f5awVMq9jlhZCy9TrCDReSTqUFvQ5qgp39FcsRx
	Ss1U3d462xwpypVBicmNIjNQGZTIv3HYP+r36/y2JSCmngKW2xqA8vrQFIsuWQjCrMitEzsSnwk
	/7YYJbQeTQkMdGPSLZa90/hYUl/rrk4jsiKMMZB7ktRZVw78BjNRnMHPy57x9jUfF3BVDq6Yp9k
	lzueqiuMPIGRFiGdK737Hdxy+IeheoSgQavGXS5IBKLD1XA7UFzJYiDvLUeO20ZoLB/f0oENCay
	9OD8w8aDzNf3SO4qXXrp7pCW82uhxOXFA==
X-Received: by 2002:a05:600c:8b82:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-483a95b3e0dmr196141155e9.6.1771943587723;
        Tue, 24 Feb 2026 06:33:07 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 26/44] go 1.22.12: Fix CVE-2025-68121
Date: Tue, 24 Feb 2026 15:31:54 +0100
Message-ID: <9aaf56e80382bb608bc645e6227990c3d57d1e0b.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231833

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   3 +
 .../go/go/CVE-2025-68121_p1.patch             | 253 ++++++++++++
 .../go/go/CVE-2025-68121_p2.patch             | 385 ++++++++++++++++++
 .../go/go/CVE-2025-68121_p3.patch             |  82 ++++
 4 files changed, 723 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p1.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p2.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68121_p3.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index cc4f98a8fe6..3fa421e223e 100644
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
index 00000000000..811bb17ee8f
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
index 00000000000..8e8cd450194
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
index 00000000000..40266f9f9eb
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

