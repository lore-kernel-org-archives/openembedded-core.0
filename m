Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2419FEDF034
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 04:59:02 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38401.1770872334994029811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 20:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iBha0SlP;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19877; q=dns/txt;
  s=iport01; t=1770872335; x=1772081935;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QS1JpkG+Sro42mg7o03YdBJ6O/38+ssJKYVq82gvbZI=;
  b=iBha0SlPgmuN5uILosbXywl/NN6r2tV6S3Y+kd9IBg86s4KZVi6tgUS8
   yZjgaG6yLuAyM4kfoI6QtxqfoTFyY65poXG0ntVKCutzXdTUhnDxV+dxh
   haor9gp+sUP/90TRSjj2JKjhiPaMklogV3q2RxuErVw1jcCrpmPcPkcuA
   AWNmUXC2O0QKYHu8nWsr2fV6Vx2tvKIjl96bHbZgyPhSnOs9lMFfPsFSK
   aoKHCcu86/AwDMP7ByGz1MnXGMdlBhs28YySDktHV0hPjalDSiqHWWZkC
   YFsbYrit8dorrrgO/2ulgXmDdxX+cujjty1KoiUNKnLLx855c2cEFarOD
   Q==;
X-CSE-ConnectionGUID: 74V4lFNbRKeire/1FiwYDQ==
X-CSE-MsgGUID: px0FOccCSByE8oT/5zTHEw==
X-IPAS-Result: =?us-ascii?q?A0CgBgCfXI1p/47/Ja1aglmCSA9xX0JJA5QngiGBFopRk?=
 =?us-ascii?q?jaBfw8BAQEPPRQEAQGFBwKNHQImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgE4AXIDAQJPCyMhgwIBgjoDNgIBEahQgiyBA?=
 =?us-ascii?q?YNiAQUCQ0/YRw2CUgELFAGBOIU7gnmFH1sYAYNZgR8IHxsbgXKBFYJydoEFg?=
 =?us-ascii?q?RpCAQGBSIZcBIIigQ6BZDaRVEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBCxsHBYgVD4kPeHCBIHIDCxgNSBEsNxQbBD5uB45LQYEvERtGEQEBFV4HE?=
 =?us-ascii?q?wErBBMYJUc/Eh0KARgGSJJXEAOSPKAdcQoog3SMHo8+hXwaM4QElBWSUguYe?=
 =?us-ascii?q?44JhAmEcIxnJkqEaIFoPDmBDgsHcBWDIglJGQ+OLAwLg16BBHu/YyI1AgQ2A?=
 =?us-ascii?q?gcLAQEDCZNnAQE?=
IronPort-Data: A9a23:ld77gaj/pWG1xzrEmoPk5HPoX161MREKZh0ujC45NGQN5FlHY01je
 htvXjqFM/yCY2KgfIx/YNu/9U4Hu5LWyYI2HFc5r3wxRi5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeGULOZ82QsaDxMsfvZ8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVHptgrBU9o/
 8Y7JTEXY1faqeOp8Z6CH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg1/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9JILXFJQFxBfFz
 o7A13zpWj89P9e08hCU3yKruqiSjx/bdZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmMHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:useDu67fyh0W5W9/1QPXwN3XdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I++rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfBU+I+UyFJ8U4ndQtsJ
 tdTw==
X-Talos-CUID: 9a23:yZiP5G9VJDmSoGOLJ/GVvxFIJJwhXFvX9lTdIlW1Tj9HSaKkZWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AH5U7ww6vH9yf5gqGbsAxTbq5xoxw8/yAL0sGuq4?=
 =?us-ascii?q?squTUMhA3ZiWhrBmoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,286,1763424000"; 
   d="scan'208";a="665998295"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Feb 2026 04:58:53 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 742F518000223
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 04:58:53 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 1B838CC12B5; Wed, 11 Feb 2026 20:58:53 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core] [scarthgap] [PATCH 1/5] go 1.22.12: Fix CVE-2025-61730
Date: Wed, 11 Feb 2026 20:58:01 -0800
Message-ID: <20260212045843.4046769-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 04:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231005

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-61730
Type: Security Fix
CVE: CVE-2025-61730
Score: 4.2
Patch: https://github.com/golang/go/commit/ad2cd043db66

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ca5016c2f5..e9a1803252 100644
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
index 0000000000..b7234e6bf2
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
-- 
2.35.6


