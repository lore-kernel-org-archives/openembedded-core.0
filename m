Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D827BEF06E0
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21675.1771943585053941517
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=O6r4Vz9H;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so69579305e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943583; x=1772548383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsIndrrT5oMuxQjGJLDTrNlNSbjY+chXUd4Xncsv6ro=;
        b=O6r4Vz9HHQ36XQ38x0ydn+2G0ubEcpAq9E8cDIzKgywAqEr66DIHuvwv+rTf6qkzNw
         1mEAtHoEMdGw0TvyQY15tvZsv3j8I0aE8HwLnzkOjmbDQkrRemXSdXX2a/rlmFrji93i
         a+HzS1vwwLIn211O3V1VQalc/KQaTFS/2nfRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943583; x=1772548383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EsIndrrT5oMuxQjGJLDTrNlNSbjY+chXUd4Xncsv6ro=;
        b=RTkHUG+JYeNv7G/bruQ3Kik4KO20bnuHEN64oQB1J5DlAHSdied+KOqBy0fMeJkhHl
         6SrAybZr6g6Hktw4Z6lZK6ezeoiHl8AF8I+ThkbDS75dhsuQ9AV7P8mYvH0MHgRAX3Z0
         OurU3+YeupxY0fxGzFR69BR3wehdlAQlogxR8uN4SQ1rujp/qRPlRi9mSh7n0MeAoLbC
         sHaa4+CaVOm+8lvwDYyz00JzscDCQSy1dKZtrqry6/l5KmSTla8CpsShs4TR/rXf4Aih
         tDHqO1I/lkVTJ+7t/vjLJEXkFtfP5albTOzzgCvrixBonGo9MLjpqN9UxtSv4YarVlYt
         TtFQ==
X-Gm-Message-State: AOJu0Yzyi4czVqdBHct+rEv8c5GuxOVPle3hgYdiW0KZ0DaXoO8oEbh0
	H3QYQoXEQ4EXq843vbWX3k0PlGd5sosEZtHOeraoNNuAi64QznOJRkGEDcA8IrKGEEZONH1BEJ3
	jbOhL
X-Gm-Gg: AZuq6aJ9kSz9J/kwTVIAagMADXQeAmm63bFCU/jHasko8UD8DnKqm4B9x5os2bCdtqb
	ofDb8Ggz4L8YwHKGb+BBbVJhQGmD+uxkbH5XrwdJ29yu27BTOHY2VHGjAd7Gs30pnbZLVV4eNNP
	+SClWzhWNCPkxZypkRJ0N4hZnHRWg+u1+dGrB+eshQy4NNhpbX9ORZh9ynUONGT9S7uDZmK7WDm
	TmJUKaiLpPCW+H5yJWJnNinvyLjTKO+Lj7wTaPc9/4fOrfajmCxfmCStLbzDhuq9zQtgN4WfC2H
	tMStjEigDRJ+fNfXfyLjwEWKE5D5qXXAwUSrQ5SttJFZcqmLvVIrSRr48ujuLWBTr62SdcExR19
	+BA7v6msblYyegTYhY9Ya4DXmC+Xok5s5fpNY1FZkB0AGQEl/wSXvk4D9emOiieyFr1DxpcAWxo
	az80Ubd8G2vabGfF+K6K2SRObXvEx/mu7wsMuV760UBUEMqebNHs70lojVNPR6n3NJKf7K9dg+W
	hOvIBQQu8l16/+vmWCSCMlPvNzRNxip9A==
X-Received: by 2002:a05:600c:6291:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-483a95b5a7dmr205584025e9.1.1771943582881;
        Tue, 24 Feb 2026 06:33:02 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:02 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/44] go 1.22.12: Fix CVE-2025-61730
Date: Tue, 24 Feb 2026 15:31:48 +0100
Message-ID: <4d4f6d196afcfa3bfde0f8ea161e73b82395ab11.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231827

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61730
Type: Security Fix
CVE: CVE-2025-61730
Score: 4.2
Patch: https://github.com/golang/go/commit/ad2cd043db66

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-61730.patch                | 460 ++++++++++++++++++
 2 files changed, 461 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-61730.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ca5016c2f56..e9a1803252e 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -31,6 +31,7 @@ SRC_URI += "\
     file://CVE-2025-61724.patch \
     file://CVE-2025-61727.patch \
     file://CVE-2025-61729.patch \
+    file://CVE-2025-61730.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-61730.patch b/meta/recipes-devtools/go/go/CVE-2025-61730.patch
new file mode 100644
index 00000000000..b7234e6bf23
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-61730.patch
@@ -0,0 +1,460 @@
+From 2cfa797798cc982973d194eca3be19fb1f092556 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Mon, 24 Nov 2025 14:03:10 -0800
+Subject: [PATCH] [release-branch.go1.24] crypto/tls: reject trailing messages
+ after client/server hello
+
+For TLS 1.3, after procesesing the server/client hello, if there isn't a
+CCS message, reject the trailing messages which were appended to the
+hello messages. This prevents an on-path attacker from injecting
+plaintext messages into the handshake.
+
+Additionally, check that we don't have any buffered messages before we
+switch the read traffic secret regardless, since any buffered messages
+would have been under an old key which is no longer appropriate.
+
+We also invert the ordering of setting the read/write secrets so that if
+we fail when changing the read secret we send the alert using the
+correct write secret.
+
+Updates #76443
+Fixes #76854
+Fixes CVE-2025-61730
+
+CVE: CVE-2025-61730
+Upstream-Status: Backport [https://github.com/golang/go/commit/ad2cd043db66]
+
+Backport Changes:
+- In version 1.24, the doHelloRetryRequest function defined in handshake_server_tls13.go
+  returns keyshare and error, but in version 1.22 it only returns error. The backport
+  was adjusted accordingly and These changes were introduced by commit
+  https://github.com/golang/go/commit/d0edd9acc80a in version 1.24.
+- In file src/crypto/tls/handshake_server_tls13.go, Replaced the function call
+  hs.handshakeSecret.ClientHandshakeTrafficSecret(hs.transcript) with
+  hs.suite.deriveSecret(hs.handshakeSecret, clientHandshakeTrafficLabel, hs.transcript).
+  This change is not present in version v1.22 and it was introduced by commit
+  https://github.com/golang/go/commit/743746a3a52d in version 1.24.
+
+Change-Id: If6ba8ad16f48d5cd5db5574824062ad4244a5b52
+Reviewed-on: https://go-review.googlesource.com/c/go/+/724120
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Daniel McCarney <daniel@binaryparadox.net>
+Reviewed-by: Coia Prant <coiaprant@gmail.com>
+(cherry picked from commit 5046bdf8a612b35a2c1a9e168054c1d5c65e7dd7)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/731961
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit ad2cd043db66cd36e1f55359638729d2c8ff3d99)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/crypto/tls/conn.go                   |  39 ++++++-
+ src/crypto/tls/handshake_client_tls13.go |  22 ++--
+ src/crypto/tls/handshake_server_tls13.go |  39 ++++---
+ src/crypto/tls/handshake_test.go         | 140 +++++++++++++++++++++++
+ src/crypto/tls/quic.go                   |  11 +-
+ 5 files changed, 219 insertions(+), 32 deletions(-)
+
+diff --git a/src/crypto/tls/conn.go b/src/crypto/tls/conn.go
+index 0e4669866e..08609ce17b 100644
+--- a/src/crypto/tls/conn.go
++++ b/src/crypto/tls/conn.go
+@@ -225,6 +225,9 @@ func (hc *halfConn) changeCipherSpec() error {
+	return nil
+ }
+
++// setTrafficSecret sets the traffic secret for the given encryption level. setTrafficSecret
++// should not be called directly, but rather through the Conn setWriteTrafficSecret and
++// setReadTrafficSecret wrapper methods.
+ func (hc *halfConn) setTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte) {
+	hc.trafficSecret = secret
+	hc.level = level
+@@ -1321,9 +1324,6 @@ func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error {
+		return c.in.setErrorLocked(c.sendAlert(alertInternalError))
+	}
+
+-	newSecret := cipherSuite.nextTrafficSecret(c.in.trafficSecret)
+-	c.in.setTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret)
+-
+	if keyUpdate.updateRequested {
+		c.out.Lock()
+		defer c.out.Unlock()
+@@ -1341,7 +1341,12 @@ func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error {
+		}
+
+		newSecret := cipherSuite.nextTrafficSecret(c.out.trafficSecret)
+-		c.out.setTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret)
++		c.setWriteTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret)
++	}
++
++	newSecret := cipherSuite.nextTrafficSecret(c.in.trafficSecret)
++	if err := c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret); err != nil {
++		return err
+	}
+
+	return nil
+@@ -1572,7 +1577,9 @@ func (c *Conn) handshakeContext(ctx context.Context) (ret error) {
+			// Provide the 1-RTT read secret now that the handshake is complete.
+			// The QUIC layer MUST NOT decrypt 1-RTT packets prior to completing
+			// the handshake (RFC 9001, Section 5.7).
+-			c.quicSetReadSecret(QUICEncryptionLevelApplication, c.cipherSuite, c.in.trafficSecret)
++			if err := c.quicSetReadSecret(QUICEncryptionLevelApplication, c.cipherSuite, c.in.trafficSecret); err != nil {
++				return err
++			}
+		} else {
+			var a alert
+			c.out.Lock()
+@@ -1664,3 +1671,25 @@ func (c *Conn) VerifyHostname(host string) error {
+	}
+	return c.peerCertificates[0].VerifyHostname(host)
+ }
++
++// setReadTrafficSecret sets the read traffic secret for the given encryption level. If
++// being called at the same time as setWriteTrafficSecret, the caller must ensure the call
++// to setWriteTrafficSecret happens first so any alerts are sent at the write level.
++func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte) error {
++	// Ensure that there are no buffered handshake messages before changing the
++	// read keys, since that can cause messages to be parsed that were encrypted
++	// using old keys which are no longer appropriate.
++	if c.hand.Len() != 0 {
++		c.sendAlert(alertUnexpectedMessage)
++		return errors.New("tls: handshake buffer not empty before setting read traffic secret")
++	}
++	c.in.setTrafficSecret(suite, level, secret)
++	return nil
++}
++
++// setWriteTrafficSecret sets the write traffic secret for the given encryption level. If
++// being called at the same time as setReadTrafficSecret, the caller must ensure the call
++// to setWriteTrafficSecret happens first so any alerts are sent at the write level.
++func (c *Conn) setWriteTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte) {
++	c.out.setTrafficSecret(suite, level, secret)
++}
+diff --git a/src/crypto/tls/handshake_client_tls13.go b/src/crypto/tls/handshake_client_tls13.go
+index 2f59f6888c..68ff92beda 100644
+--- a/src/crypto/tls/handshake_client_tls13.go
++++ b/src/crypto/tls/handshake_client_tls13.go
+@@ -393,17 +393,18 @@ func (hs *clientHandshakeStateTLS13) establishHandshakeKeys() error {
+
+	clientSecret := hs.suite.deriveSecret(handshakeSecret,
+		clientHandshakeTrafficLabel, hs.transcript)
+-	c.out.setTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret)
++	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret)
+	serverSecret := hs.suite.deriveSecret(handshakeSecret,
+		serverHandshakeTrafficLabel, hs.transcript)
+-	c.in.setTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret)
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret); err != nil {
++		return err
++	}
+
+	if c.quic != nil {
+-		if c.hand.Len() != 0 {
+-			c.sendAlert(alertUnexpectedMessage)
+-		}
+		c.quicSetWriteSecret(QUICEncryptionLevelHandshake, hs.suite.id, clientSecret)
+-		c.quicSetReadSecret(QUICEncryptionLevelHandshake, hs.suite.id, serverSecret)
++		if err := c.quicSetReadSecret(QUICEncryptionLevelHandshake, hs.suite.id, serverSecret); err != nil {
++			return err
++		}
+	}
+
+	err = c.config.writeKeyLog(keyLogLabelClientHandshake, hs.hello.random, clientSecret)
+@@ -606,7 +607,9 @@ func (hs *clientHandshakeStateTLS13) readServerFinished() error {
+		clientApplicationTrafficLabel, hs.transcript)
+	serverSecret := hs.suite.deriveSecret(hs.masterSecret,
+		serverApplicationTrafficLabel, hs.transcript)
+-	c.in.setTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret)
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret); err != nil {
++		return err
++	}
+
+	err = c.config.writeKeyLog(keyLogLabelClientTraffic, hs.hello.random, hs.trafficSecret)
+	if err != nil {
+@@ -702,7 +705,7 @@ func (hs *clientHandshakeStateTLS13) sendClientFinished() error {
+		return err
+	}
+
+-	c.out.setTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret)
++	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret)
+
+	if !c.config.SessionTicketsDisabled && c.config.ClientSessionCache != nil {
+		c.resumptionSecret = hs.suite.deriveSecret(hs.masterSecret,
+@@ -710,9 +713,6 @@ func (hs *clientHandshakeStateTLS13) sendClientFinished() error {
+	}
+
+	if c.quic != nil {
+-		if c.hand.Len() != 0 {
+-			c.sendAlert(alertUnexpectedMessage)
+-		}
+		c.quicSetWriteSecret(QUICEncryptionLevelApplication, hs.suite.id, hs.trafficSecret)
+	}
+
+diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/handshake_server_tls13.go
+index 21d798de37..5aa69e9640 100644
+--- a/src/crypto/tls/handshake_server_tls13.go
++++ b/src/crypto/tls/handshake_server_tls13.go
+@@ -380,7 +380,9 @@ func (hs *serverHandshakeStateTLS13) checkForResumption() error {
+				return err
+			}
+			earlyTrafficSecret := hs.suite.deriveSecret(hs.earlySecret, clientEarlyTrafficLabel, transcript)
+-			c.quicSetReadSecret(QUICEncryptionLevelEarly, hs.suite.id, earlyTrafficSecret)
++			if err := c.quicSetReadSecret(QUICEncryptionLevelEarly, hs.suite.id, earlyTrafficSecret); err != nil {
++				return err
++			}
+		}
+
+		c.didResume = true
+@@ -477,6 +479,14 @@ func (hs *serverHandshakeStateTLS13) sendDummyChangeCipherSpec() error {
+ func (hs *serverHandshakeStateTLS13) doHelloRetryRequest(selectedGroup CurveID) error {
+	c := hs.c
+
++	// Make sure the client didn't send extra handshake messages alongside
++	// their initial client_hello. If they sent two client_hello messages,
++	// we will consume the second before they respond to the server_hello.
++	if c.hand.Len() != 0 {
++		c.sendAlert(alertUnexpectedMessage)
++		return errors.New("tls: handshake buffer not empty before HelloRetryRequest")
++	}
++
+	// The first ClientHello gets double-hashed into the transcript upon a
+	// HelloRetryRequest. See RFC 8446, Section 4.4.1.
+	if err := transcriptMsg(hs.clientHello, hs.transcript); err != nil {
+@@ -615,19 +625,20 @@ func (hs *serverHandshakeStateTLS13) sendServerParameters() error {
+	hs.handshakeSecret = hs.suite.extract(hs.sharedKey,
+		hs.suite.deriveSecret(earlySecret, "derived", nil))
+
+-	clientSecret := hs.suite.deriveSecret(hs.handshakeSecret,
+-		clientHandshakeTrafficLabel, hs.transcript)
+-	c.in.setTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret)
+	serverSecret := hs.suite.deriveSecret(hs.handshakeSecret,
+		serverHandshakeTrafficLabel, hs.transcript)
+-	c.out.setTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret)
++	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret)
++	clientSecret := hs.suite.deriveSecret(hs.handshakeSecret,
++		clientHandshakeTrafficLabel, hs.transcript)
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret); err != nil {
++		return err
++	}
+
+	if c.quic != nil {
+-		if c.hand.Len() != 0 {
+-			c.sendAlert(alertUnexpectedMessage)
+-		}
+		c.quicSetWriteSecret(QUICEncryptionLevelHandshake, hs.suite.id, serverSecret)
+-		c.quicSetReadSecret(QUICEncryptionLevelHandshake, hs.suite.id, clientSecret)
++		if err := c.quicSetReadSecret(QUICEncryptionLevelHandshake, hs.suite.id, clientSecret); err != nil {
++			return err
++		}
+	}
+
+	err := c.config.writeKeyLog(keyLogLabelClientHandshake, hs.clientHello.random, clientSecret)
+@@ -751,13 +762,9 @@ func (hs *serverHandshakeStateTLS13) sendServerFinished() error {
+		clientApplicationTrafficLabel, hs.transcript)
+	serverSecret := hs.suite.deriveSecret(hs.masterSecret,
+		serverApplicationTrafficLabel, hs.transcript)
+-	c.out.setTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret)
++	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret)
+
+	if c.quic != nil {
+-		if c.hand.Len() != 0 {
+-			// TODO: Handle this in setTrafficSecret?
+-			c.sendAlert(alertUnexpectedMessage)
+-		}
+		c.quicSetWriteSecret(QUICEncryptionLevelApplication, hs.suite.id, serverSecret)
+	}
+
+@@ -992,7 +999,9 @@ func (hs *serverHandshakeStateTLS13) readClientFinished() error {
+		return errors.New("tls: invalid client finished hash")
+	}
+
+-	c.in.setTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret)
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret); err != nil {
++		return err
++	}
+
+	return nil
+ }
+diff --git a/src/crypto/tls/handshake_test.go b/src/crypto/tls/handshake_test.go
+index 27ab19ef31..4991a0e69b 100644
+--- a/src/crypto/tls/handshake_test.go
++++ b/src/crypto/tls/handshake_test.go
+@@ -6,6 +6,7 @@ package tls
+
+ import (
+	"bufio"
++	"context"
+	"crypto/ed25519"
+	"crypto/x509"
+	"encoding/hex"
+@@ -533,3 +534,142 @@ var clientEd25519KeyPEM = testingKey(`
+ -----BEGIN TESTING KEY-----
+ MC4CAQAwBQYDK2VwBCIEINifzf07d9qx3d44e0FSbV4mC/xQxT644RRbpgNpin7I
+ -----END TESTING KEY-----`)
++
++func TestServerHelloTrailingMessage(t *testing.T) {
++	// In TLS 1.3 the change cipher spec message is optional. If a CCS message
++	// is not sent, after reading the ServerHello, the read traffic secret is
++	// set, and all following messages must be encrypted. If the server sends
++	// additional unencrypted messages in a record with the ServerHello, the
++	// client must either fail or ignore the additional messages.
++
++	c, s := localPipe(t)
++	go func() {
++		ctx := context.Background()
++		srv := Server(s, testConfig)
++		clientHello, _, err := srv.readClientHello(ctx)
++		if err != nil {
++			testFatal(t, err)
++		}
++
++		hs := serverHandshakeStateTLS13{
++			c:           srv,
++			ctx:         ctx,
++			clientHello: clientHello,
++		}
++		if err := hs.processClientHello(); err != nil {
++			testFatal(t, err)
++		}
++		if err := transcriptMsg(hs.clientHello, hs.transcript); err != nil {
++			testFatal(t, err)
++		}
++
++		record, err := concatHandshakeMessages(hs.hello, &encryptedExtensionsMsg{alpnProtocol: "h2"})
++		if err != nil {
++			testFatal(t, err)
++		}
++
++		if _, err := s.Write(record); err != nil {
++			testFatal(t, err)
++		}
++		srv.Close()
++	}()
++
++	cli := Client(c, testConfig)
++	expectedErr := "tls: handshake buffer not empty before setting read traffic secret"
++	if err := cli.Handshake(); err == nil {
++		t.Fatal("expected error from incomplete handshake, got nil")
++	} else if err.Error() != expectedErr {
++		t.Fatalf("expected error %q, got %q", expectedErr, err.Error())
++	}
++}
++
++func TestClientHelloTrailingMessage(t *testing.T) {
++	// Same as TestServerHelloTrailingMessage but for the client side.
++
++	c, s := localPipe(t)
++	go func() {
++		cli := Client(c, testConfig)
++
++		hello, _, _, err := cli.makeClientHello()
++		if err != nil {
++			testFatal(t, err)
++		}
++
++		record, err := concatHandshakeMessages(hello, &certificateMsgTLS13{})
++		if err != nil {
++			testFatal(t, err)
++		}
++
++		if _, err := c.Write(record); err != nil {
++			testFatal(t, err)
++		}
++		cli.Close()
++	}()
++
++	srv := Server(s, testConfig)
++	expectedErr := "tls: handshake buffer not empty before setting read traffic secret"
++	if err := srv.Handshake(); err == nil {
++		t.Fatal("expected error from incomplete handshake, got nil")
++	} else if err.Error() != expectedErr {
++		t.Fatalf("expected error %q, got %q", expectedErr, err.Error())
++	}
++}
++
++func TestDoubleClientHelloHRR(t *testing.T) {
++	// If a client sends two ClientHello messages in a single record, and the
++	// server sends a HRR after reading the first ClientHello, the server must
++	// either fail or ignore the trailing ClientHello.
++
++	c, s := localPipe(t)
++
++	go func() {
++		cli := Client(c, testConfig)
++
++		hello, _, _, err := cli.makeClientHello()
++		if err != nil {
++			testFatal(t, err)
++		}
++		hello.keyShares = nil
++
++		record, err := concatHandshakeMessages(hello, hello)
++		if err != nil {
++			testFatal(t, err)
++		}
++
++		if _, err := c.Write(record); err != nil {
++			testFatal(t, err)
++		}
++		cli.Close()
++	}()
++
++	srv := Server(s, testConfig)
++	expectedErr := "tls: handshake buffer not empty before HelloRetryRequest"
++	if err := srv.Handshake(); err == nil {
++		t.Fatal("expected error from incomplete handshake, got nil")
++	} else if err.Error() != expectedErr {
++		t.Fatalf("expected error %q, got %q", expectedErr, err.Error())
++	}
++}
++
++// concatHandshakeMessages marshals and concatenates the given handshake
++// messages into a single record.
++func concatHandshakeMessages(msgs ...handshakeMessage) ([]byte, error) {
++	var marshalled []byte
++	for _, msg := range msgs {
++		data, err := msg.marshal()
++		if err != nil {
++			return nil, err
++		}
++		marshalled = append(marshalled, data...)
++	}
++	m := len(marshalled)
++	outBuf := make([]byte, recordHeaderLen)
++	outBuf[0] = byte(recordTypeHandshake)
++	vers := VersionTLS12
++	outBuf[1] = byte(vers >> 8)
++	outBuf[2] = byte(vers)
++	outBuf[3] = byte(m >> 8)
++	outBuf[4] = byte(m)
++	outBuf = append(outBuf, marshalled...)
++	return outBuf, nil
++}
+diff --git a/src/crypto/tls/quic.go b/src/crypto/tls/quic.go
+index 3518169bf7..aa14f1dadb 100644
+--- a/src/crypto/tls/quic.go
++++ b/src/crypto/tls/quic.go
+@@ -323,13 +323,22 @@ func (c *Conn) quicReadHandshakeBytes(n int) error {
+	return nil
+ }
+
+-func (c *Conn) quicSetReadSecret(level QUICEncryptionLevel, suite uint16, secret []byte) {
++func (c *Conn) quicSetReadSecret(level QUICEncryptionLevel, suite uint16, secret []byte) error {
++	// Ensure that there are no buffered handshake messages before changing the
++	// read keys, since that can cause messages to be parsed that were encrypted
++	// using old keys which are no longer appropriate.
++	// TODO(roland): we should merge this check with the similar one in setReadTrafficSecret.
++	if c.hand.Len() != 0 {
++		c.sendAlert(alertUnexpectedMessage)
++		return errors.New("tls: handshake buffer not empty before setting read traffic secret")
++	}
+	c.quic.events = append(c.quic.events, QUICEvent{
+		Kind:  QUICSetReadSecret,
+		Level: level,
+		Suite: suite,
+		Data:  secret,
+	})
++	return nil
+ }
+
+ func (c *Conn) quicSetWriteSecret(level QUICEncryptionLevel, suite uint16, secret []byte) {
+--
+2.35.6

