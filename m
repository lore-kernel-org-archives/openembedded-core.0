Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF68CC83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 08:25:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.11993.1693470333017484679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 01:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AZ78cY5q;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c06f6f98c0so4083895ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693470331; x=1694075131; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGR3H5fq+U/sxsxJwuPXcm6HOYx3AHhGayAlh7/BXBU=;
        b=AZ78cY5qprjw1s6l+x9dlPV3xS2kk/il7OaQxW9QTJkqYW8t0x9fqhFPSgU4FzoQv+
         Yrjm8qZDpKpr5c1+vHkQlqoDFIyWOd7EmKN7fdA80ESJxhdAgja8bDF4hV4HlrP+/4ET
         4cNBJyhN3Uqz5dwiC6WU4el1Q138sbjomkQus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693470331; x=1694075131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGR3H5fq+U/sxsxJwuPXcm6HOYx3AHhGayAlh7/BXBU=;
        b=LmqCnBd9EWrzJP59dMe8nXoyFYJgPXYgziXVA7Hn5+HqRliVuQeXMQi5P+o7RnjJQp
         U0cHC7SuoKxJT1nIo4LMDCDCgS/xlrpq9tMMVI+eXTMyftuKC1kUHqx5Mmw9ZjeJHs4t
         /QJba8UNwCwNIN/CucSiEpdQV3EMMuijqpL70z8OpZJASc5i36uIxm5oSZaCWnklWUAq
         8rB4CpczwBCgJWr49gGbGEfpe4a7MYJzMRr+JO5BGAmAREV9Bz9lkYf3iFI3YZmurH3A
         sxPp5B+WVOJSi4WyiQ9TTazx8KQ4DXHvehA2dhyUHangLSZ5GS/MoxJc3E1e3AI92ZrB
         Ogvw==
X-Gm-Message-State: AOJu0Yw5jI1hLGiE52ozHh3KLR7BYPJMlWBWQprTPesyQJtfi9zeG4C5
	Ohct9B9eX5D/uriUwQOIaLCU2B8sSxXbvF/HwVQ=
X-Google-Smtp-Source: AGHT+IGBemPrfLM8kLFUNLfhIvQd8BrNLcRGcjYDOi2MlIWo3YyWYFmaUaKEuXR1dye3ka6mE4LiZA==
X-Received: by 2002:a17:903:124e:b0:1bd:e998:ec0a with SMTP id u14-20020a170903124e00b001bde998ec0amr4681302plh.67.1693470331395;
        Thu, 31 Aug 2023 01:25:31 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:fa9:11c0:b6b0:61d])
        by smtp.gmail.com with ESMTPSA id l18-20020a170902d35200b001bbf7fd354csm745707plk.213.2023.08.31.01.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:25:30 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Backport fix for CVE-2023-29409
Date: Thu, 31 Aug 2023 13:55:22 +0530
Message-Id: <20230831082522.117800-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 08:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186964

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit: https://github.com/golang/go/commit/2300f7ef07718f6be4d8aa8486c7de99836e233f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2023-29409.patch           | 175 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29409.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index b2cf805d2d..20377e095b 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -69,6 +69,7 @@ SRC_URI += "\
     file://CVE-2023-29404.patch \
     file://CVE-2023-29400.patch \
     file://CVE-2023-29406.patch \
+    file://CVE-2023-29409.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29409.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29409.patch
new file mode 100644
index 0000000000..00685cc180
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29409.patch
@@ -0,0 +1,175 @@
+From 2300f7ef07718f6be4d8aa8486c7de99836e233f Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Wed, 7 Jun 2023 15:27:13 -0700
+Subject: [PATCH] [release-branch.go1.19] crypto/tls: restrict RSA keys in
+ certificates to <= 8192 bits
+
+Extremely large RSA keys in certificate chains can cause a client/server
+to expend significant CPU time verifying signatures. Limit this by
+restricting the size of RSA keys transmitted during handshakes to <=
+8192 bits.
+
+Based on a survey of publicly trusted RSA keys, there are currently only
+three certificates in circulation with keys larger than this, and all
+three appear to be test certificates that are not actively deployed. It
+is possible there are larger keys in use in private PKIs, but we target
+the web PKI, so causing breakage here in the interests of increasing the
+default safety of users of crypto/tls seems reasonable.
+
+Thanks to Mateusz Poliwczak for reporting this issue.
+
+Updates #61460
+Fixes #61579
+Fixes CVE-2023-29409
+
+Change-Id: Ie35038515a649199a36a12fc2c5df3af855dca6c
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1912161
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+(cherry picked from commit d865c715d92887361e4bd5596e19e513f27781b7)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1965487
+Reviewed-on: https://go-review.googlesource.com/c/go/+/514915
+Run-TryBot: David Chase <drchase@google.com>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+TryBot-Bypass: David Chase <drchase@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2300f7ef07718f6be4d8aa8486c7de99836e233f]
+CVE: CVE-2023-29409
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/crypto/tls/handshake_client.go      |  8 +++
+ src/crypto/tls/handshake_client_test.go | 78 +++++++++++++++++++++++++
+ src/crypto/tls/handshake_server.go      |  4 ++
+ 3 files changed, 90 insertions(+)
+
+diff --git a/src/crypto/tls/handshake_client.go b/src/crypto/tls/handshake_client.go
+index 4fb528c..ba33ea1 100644
+--- a/src/crypto/tls/handshake_client.go
++++ b/src/crypto/tls/handshake_client.go
+@@ -788,6 +788,10 @@ func (hs *clientHandshakeState) sendFinished(out []byte) error {
+ 	return nil
+ }
+ 
++// maxRSAKeySize is the maximum RSA key size in bits that we are willing
++// to verify the signatures of during a TLS handshake.
++const maxRSAKeySize = 8192
++
+ // verifyServerCertificate parses and verifies the provided chain, setting
+ // c.verifiedChains and c.peerCertificates or sending the appropriate alert.
+ func (c *Conn) verifyServerCertificate(certificates [][]byte) error {
+@@ -798,6 +802,10 @@ func (c *Conn) verifyServerCertificate(certificates [][]byte) error {
+ 			c.sendAlert(alertBadCertificate)
+ 			return errors.New("tls: failed to parse certificate from server: " + err.Error())
+ 		}
++		if cert.PublicKeyAlgorithm == x509.RSA && cert.PublicKey.(*rsa.PublicKey).N.BitLen() > maxRSAKeySize {
++			c.sendAlert(alertBadCertificate)
++			return fmt.Errorf("tls: server sent certificate containing RSA key larger than %d bits", maxRSAKeySize)
++		}
+ 		certs[i] = cert
+ 	}
+ 
+diff --git a/src/crypto/tls/handshake_client_test.go b/src/crypto/tls/handshake_client_test.go
+index 6bd3c37..8d20b2b 100644
+--- a/src/crypto/tls/handshake_client_test.go
++++ b/src/crypto/tls/handshake_client_test.go
+@@ -1984,3 +1984,81 @@ func TestCloseClientConnectionOnIdleServer(t *testing.T) {
+ 		t.Errorf("Error expected, but no error returned")
+ 	}
+ }
++
++// discardConn wraps a net.Conn but discards all writes, but reports that they happened.
++type discardConn struct {
++	net.Conn
++}
++
++func (dc *discardConn) Write(data []byte) (int, error) {
++	return len(data), nil
++}
++
++// largeRSAKeyCertPEM contains a 8193 bit RSA key
++const largeRSAKeyCertPEM = `-----BEGIN CERTIFICATE-----
++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
++u58=
++-----END CERTIFICATE-----`
++
++func TestHandshakeRSATooBig(t *testing.T) {
++	testCert, _ := pem.Decode([]byte(largeRSAKeyCertPEM))
++
++	c := &Conn{conn: &discardConn{}, config: testConfig.Clone()}
++
++	expectedErr := "tls: server sent certificate containing RSA key larger than 8192 bits"
++	err := c.verifyServerCertificate([][]byte{testCert.Bytes})
++	if err == nil || err.Error() != expectedErr {
++		t.Errorf("Conn.verifyServerCertificate unexpected error: want %q, got %q", expectedErr, err)
++	}
++
++	expectedErr = "tls: client sent certificate containing RSA key larger than 8192 bits"
++	err = c.processCertsFromClient(Certificate{Certificate: [][]byte{testCert.Bytes}})
++	if err == nil || err.Error() != expectedErr {
++		t.Errorf("Conn.processCertsFromClient unexpected error: want %q, got %q", expectedErr, err)
++	}
++}
+diff --git a/src/crypto/tls/handshake_server.go b/src/crypto/tls/handshake_server.go
+index b16415a..2e36840 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -738,6 +738,10 @@ func (c *Conn) processCertsFromClient(certificate Certificate) error {
+ 			c.sendAlert(alertBadCertificate)
+ 			return errors.New("tls: failed to parse client certificate: " + err.Error())
+ 		}
++		if certs[i].PublicKeyAlgorithm == x509.RSA && certs[i].PublicKey.(*rsa.PublicKey).N.BitLen() > maxRSAKeySize {
++			c.sendAlert(alertBadCertificate)
++			return fmt.Errorf("tls: client sent certificate containing RSA key larger than %d bits", maxRSAKeySize)
++		}
+ 	}
+ 
+ 	if len(certs) == 0 && requiresClientCert(c.config.ClientAuth) {
+-- 
+2.25.1
+
-- 
2.25.1


