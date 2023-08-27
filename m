Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C572C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 20:52:44 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.126.1693169560762542195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 13:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eCVS7rN5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68c3b9f8333so958637b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 13:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693169560; x=1693774360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6073/4Sv40kusRPq0aYAw++xRBSH057oToU9RsNbLhE=;
        b=eCVS7rN5SQ/YzZhu99KLaY7ewEZ8OdP2NVFkJIn7o/aMMFvt7M7uyNN4zeHardXWv1
         F9NbQWuoKt+Hr8o17BX0l5KlzYrEqSYxzx/Ed0Tbe8pYOZpTBg2AloAMCP5za0PT9I3o
         6Qqa1WoMaqFBxB7wBNvfWecefv+1E8VO+1j9NZjRqAVlohg5GuKWNPtenjxumNV2jvem
         V/uioohoZH0zGbYbgZCN86ML54cY9y1jFzxxBd+h4ppc9a/RHpSEoEA2KJdOV8IRywvx
         yEK+a+mz1c5MUeq+H0OZyd5xV8Sf1m+F/g/gW/hKVVNa6qpYZa+inP1/oAnSGysd4wbz
         YaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169560; x=1693774360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6073/4Sv40kusRPq0aYAw++xRBSH057oToU9RsNbLhE=;
        b=kXxwXEFG9PP1RgJPei1zj5C+mkh7nR3oh62C4M9uqUJo3xej4qCrPTj4f/CkJVutRe
         rWNoCPY90lsyCfOAoi8WBNm4TS7Epsci36djDOWkEu+37jeLnFSqSmFTumPHLUW9o6VH
         UhZJqCCKETwcSKk8rWQtjZU+ZbtjpzUtBvvs48NgTLA8/rXeklHIIT7QTXIgNkLcxDhU
         rzkeZwrSGB2iNw74WXLt7yTiRX7onVF3Hql44eL1gQxAqbBkJkcJpYlAs6m5jFti6UFI
         LnjWSg7d12DNOe/l8hdGiiDym7vTgpdu/TJkrqRefIoU6/nVf1mDvZYgR8iG2oa2Tg3Y
         dErQ==
X-Gm-Message-State: AOJu0YwMXU3M28HjhQDBMqHvWFhztZq1BcKX1QKZBI4QfTFcv1voncSX
	LSUncTcbaYyBa0SPea8EHoVkLngD53Sgwz460NLlGg==
X-Google-Smtp-Source: AGHT+IG2A+4q4/MRPtWfyLIMwVwIPGQmQT9kf7XNifUv1zR/Zsu+Ujctx+M0s5ZMW0V0CDJMeJGPqg==
X-Received: by 2002:a05:6a20:3d83:b0:13d:7f7b:1926 with SMTP id s3-20020a056a203d8300b0013d7f7b1926mr34197829pzi.11.1693169559761;
        Sun, 27 Aug 2023 13:52:39 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a63c142000000b00565dd935938sm1220684pgi.85.2023.08.27.13.52.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:52:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] go: Fix CVE-2023-29409
Date: Sun, 27 Aug 2023 10:52:23 -1000
Message-Id: <51c2fee0e4bb4b3131c61d91510394cd4b4f9eb9.1693169420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693169420.git.steve@sakoman.com>
References: <cover.1693169420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 20:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186798

From: Soumya Sambu <soumya.sambu@windriver.com>

Extremely large RSA keys in certificate chains can cause a
client/server to expend significant CPU time verifying
signatures. With fix, the size of RSA keys transmitted
during handshakes is restricted to <= 8192 bits. Based on
a survey of publicly trusted RSA keys, there are currently
only three certificates in circulation with keys larger than
this, and all three appear to be test certificates that are
not actively deployed. It is possible there are larger keys
in use in private PKIs, but we target the web PKI, so causing
breakage here in the interests of increasing the default
safety of users of crypto/tls seems reasonable.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29409

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.19/CVE-2023-29409.patch           | 175 ++++++++++++++++++
 2 files changed, 176 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index e0f02f3e28..91dd886cd0 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -42,6 +42,7 @@ SRC_URI += "\
     file://CVE-2023-24536_3.patch \
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
+    file://CVE-2023-29409.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch
new file mode 100644
index 0000000000..38451f7555
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29409.patch
@@ -0,0 +1,175 @@
+From 2300f7ef07718f6be4d8aa8486c7de99836e233f Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Wed, 23 Aug 2023 12:03:43 +0000
+Subject: [PATCH] crypto/tls: restrict RSA keys in certificates to <= 8192 bits
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
+CVE: CVE-2023-29409
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2300f7ef07718f6be4d8aa8486c7de99836e233f]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/crypto/tls/handshake_client.go      |  8 +++
+ src/crypto/tls/handshake_client_test.go | 78 +++++++++++++++++++++++++
+ src/crypto/tls/handshake_server.go      |  4 ++
+ 3 files changed, 90 insertions(+)
+
+diff --git a/src/crypto/tls/handshake_client.go b/src/crypto/tls/handshake_client.go
+index 85622f1..828d2cb 100644
+--- a/src/crypto/tls/handshake_client.go
++++ b/src/crypto/tls/handshake_client.go
+@@ -852,6 +852,10 @@ func (hs *clientHandshakeState) sendFinished(out []byte) error {
+	return nil
+ }
+
++// maxRSAKeySize is the maximum RSA key size in bits that we are willing
++// to verify the signatures of during a TLS handshake.
++const maxRSAKeySize = 8192
++
+ // verifyServerCertificate parses and verifies the provided chain, setting
+ // c.verifiedChains and c.peerCertificates or sending the appropriate alert.
+ func (c *Conn) verifyServerCertificate(certificates [][]byte) error {
+@@ -862,6 +866,10 @@ func (c *Conn) verifyServerCertificate(certificates [][]byte) error {
+			c.sendAlert(alertBadCertificate)
+			return errors.New("tls: failed to parse certificate from server: " + err.Error())
+		}
++		if cert.PublicKeyAlgorithm == x509.RSA && cert.PublicKey.(*rsa.PublicKey).N.BitLen() > maxRSAKeySize {
++			c.sendAlert(alertBadCertificate)
++			return fmt.Errorf("tls: server sent certificate containing RSA key larger than %d bits", maxRSAKeySize)
++		}
+		certs[i] = cert
+	}
+
+diff --git a/src/crypto/tls/handshake_client_test.go b/src/crypto/tls/handshake_client_test.go
+index 0228745..d581cb1 100644
+--- a/src/crypto/tls/handshake_client_test.go
++++ b/src/crypto/tls/handshake_client_test.go
+@@ -2595,3 +2595,81 @@ func TestClientHandshakeContextCancellation(t *testing.T) {
+		t.Error("Client connection was not closed when the context was canceled")
+	}
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
+index 8d51e7e..a5d8f4a 100644
+--- a/src/crypto/tls/handshake_server.go
++++ b/src/crypto/tls/handshake_server.go
+@@ -812,6 +812,10 @@ func (c *Conn) processCertsFromClient(certificate Certificate) error {
+			c.sendAlert(alertBadCertificate)
+			return errors.New("tls: failed to parse client certificate: " + err.Error())
+		}
++		if certs[i].PublicKeyAlgorithm == x509.RSA && certs[i].PublicKey.(*rsa.PublicKey).N.BitLen() > maxRSAKeySize {
++			c.sendAlert(alertBadCertificate)
++			return fmt.Errorf("tls: client sent certificate containing RSA key larger than %d bits", maxRSAKeySize)
++		}
+	}
+
+	if len(certs) == 0 && requiresClientCert(c.config.ClientAuth) {
+--
+2.40.0
-- 
2.34.1


