Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128C4C83F33
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 14:22:54 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.48937.1693837372631342839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 07:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OLfs3G8w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-68ca2a37c6aso1445571b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 07:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693837371; x=1694442171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lH/Pu7nFcnTF8IDDfjBhzn/gWKz4Qdqq/1gxC/CsoxM=;
        b=OLfs3G8wQ7+nnWFe5M2/nrxCP6aMnZppxo3kW0pXahcufpLL70CFZdjccDelReOMhf
         R5QwPO9JW5gXNmReYzLdtVypRrRCvwcbukaW53A8xa9qRe6KTg4MMNaOwDUrdluNf5cO
         tZpI3DQLjHy7tLyaSyvr31XyIpsYIOAH/0rNkNMcQuFguFjmzXFdyZ3NhPjUZqfOUjhT
         rQwCbR/6WVLk3B34vEQro86NLLIpnvSQ7qm0EXjCJrI8ZTRZXwd4Fn+RWjscCNHUcO3z
         g1sBIoDm17Tv7+HzxjG4weIbwiUb27SsLjvue2zw1HK5CCXdJqQf9UY/QRG++JmRYsSQ
         dmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693837371; x=1694442171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lH/Pu7nFcnTF8IDDfjBhzn/gWKz4Qdqq/1gxC/CsoxM=;
        b=dnEXYFHQ47wYbgU6tMEuRXK93qklB4dq4yyYvLvntPDJiAbLciSRacRKDDCTC1UEDi
         htAtOsqdFhT/nHnw2I1Rd9DrrK5HlgVoncBlG69OqhfRv5762EYHFRVL69CZ6NOpteWD
         99yWc9SO76J7eCuVXmmnt+RZ5YrnXaZ0pd9ch/dK4LSEXUpzQoaq72xM/6Pn/MdqaBpK
         8IpieBHw8WjC5+jBQCUncF6+1PSHeG5cI+HuGpW6C4c9w16+kQhGVZDKUexNX4wRyiY5
         nN6GhAhDR+U/ZEQ1Mv7ogk5z8e8HRefDFbclz/+Eu3aHDG2mkwdzukpRpDBeyIqWmXKh
         0ozg==
X-Gm-Message-State: AOJu0YzWp1IA/SZVU2mbqwge50bbNXjg5CIi4alg7B77Uw6+dAowx+Go
	xGq8RjkxCDDqqllExgFOlGfcCptP41tPyqJsR5o=
X-Google-Smtp-Source: AGHT+IEyYWm+PVkCjVSIrSTN/KmBH0eC282Sb2Xmg0Is/yv3gRcl3ohTIXBX1Z6kkJuv6AnMBhlMTQ==
X-Received: by 2002:a05:6a20:7d9c:b0:149:602e:9239 with SMTP id v28-20020a056a207d9c00b00149602e9239mr13518361pzj.21.1693837371378;
        Mon, 04 Sep 2023 07:22:51 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z14-20020aa785ce000000b00689f10adef9sm7443032pfn.67.2023.09.04.07.22.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 07:22:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] go: Backport fix for CVE-2023-29409
Date: Mon,  4 Sep 2023 04:22:37 -1000
Message-Id: <37212694b9a610b1086ef574673dd24095585f4a.1693837232.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693837231.git.steve@sakoman.com>
References: <cover.1693837231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 14:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187184

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit: https://github.com/golang/go/commit/2300f7ef07718f6be4d8aa8486c7de99836e233f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


