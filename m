Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516F0CD98DB
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71822.1781274405164912875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LDr7lZH5;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef82204c6so655612f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274403; x=1781879203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOs6sq/cMPbYJuhREunQ8yRvDyooEsBKoxslelt9hzo=;
        b=LDr7lZH58t0A4k78qC/snUp9ZZgILxLOR5YTUxd9vishZrRscQ28Mfago84H1wGAXn
         pjJWWzkkakFEW9tUQkxmIW83QNHFB7at2TxDTDunJwrAj+eTrsvki9Y9zSWsS97nBQVB
         8llo4cGqAdeha4sDU5NyJ6bSgC4ZdAEF6u2iY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274403; x=1781879203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOs6sq/cMPbYJuhREunQ8yRvDyooEsBKoxslelt9hzo=;
        b=hd4tUwaEDA1+f4fg+mSB2qSFE7PwL1gAqIJpZTGP2ljb9Z2Y7zz1+t+QQFH5bPIuZo
         PSQPNbhA9FqXIWwoyCBhavlXjOMwjPUHEMkKIjUwNl7o98347spIAAfOT4loETTfB67H
         g2xTbe2n2l1dJY68FAPmPYEwhWjZYLpQd65xmypS9mTahI6VEpOFWyt/NsLuuv1zRvSH
         /pkE3kV+fuMoeLCBKu7b8ZQdJBh89JHC/WBFdP8UwB5BdIHyk6iGrUwhDG2jzIgI8kG/
         +uxVoOYyznrZ/kbM2AtqPKHSmBM5vvejBn4AechzEVFSyIjJhGD8GqrJSdKz26F5Xk1z
         gowg==
X-Gm-Message-State: AOJu0YyPRfH3zAc6+gMpDRcKqqKsuOtQtYaa8wa3I1KC4MivYqkDYviu
	Cf/MDizEVL6ROmEy1LJTqYD/XTTa47kyTU1KG1ADSSxaVE1C9HhNCyKx00q/eoVXYGUCNZEA1aS
	7wmyStw==
X-Gm-Gg: Acq92OFdSg85hz3CS2vysZXOocs/P9QnID2k/4xfRxbL9meAUpunIo/z4zjNdx0FC+0
	ui6n4lGMWqLivdfa/BcHr12Zt/g9PevhgCT4v9w6/Lzp1Ok5ZEqolfZ3hFIcjFkGFqzVelnjZB7
	ADxAQHhCcGOk0o1bQ/H5q5LxgFjWex6zVBsswjA3tZxCIePwuK73t9AbygdZvGKPsY8F+t57z24
	X3zVICOLr9hU050yewIIF3AGHUgEKGG5P8oQgnXeHZRrx7fYJVpXYtOnw9bvgBU41/K7ouuRW5P
	AfzpIRz4X3MSqiBvQPxZ8euSKRNOIS3IqD5mgrJEEbgBphLt6hq2nwiFJ5HhuEnUW5IWBW66Lhs
	opQWNEQt8vLncIG0DaNyQgRwugQH4/3cZFp0nFeiLimJDdEJQz2/N8/xZdo1MbLLFfqNp10oskC
	0bTd6iRvnspYfAGdpu20r7Q2XSHeU0IwhlxA==
X-Received: by 2002:a05:6000:41e1:b0:460:2477:2277 with SMTP id ffacd0b85a97d-4606dba2ac3mr4353640f8f.31.1781274403360;
        Fri, 12 Jun 2026 07:26:43 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:42 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 09/21] go: patch CVE-2026-32283
Date: Fri, 12 Jun 2026 16:25:59 +0200
Message-ID: <b7d7d9279df23c3c8eaac2e9020f30f8dcf58e6c.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238631

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/763767

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32283.patch                | 177 ++++++++++++++++++
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32283.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 0d4dff6c21..99c2945a8c 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -43,6 +43,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p3.patch \
     file://CVE-2026-27142.patch \
     file://CVE-2026-32280.patch \
+    file://CVE-2026-32283.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32283.patch b/meta/recipes-devtools/go/go/CVE-2026-32283.patch
new file mode 100644
index 0000000000..87bcc5816f
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32283.patch
@@ -0,0 +1,177 @@
+From f560f55d3f804dcc3002dfe963b37bfa3a67202c Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 23 Mar 2026 11:54:41 -0700
+Subject: [PATCH] crypto/tls: prevent deadlock when client sends multiple key
+ update messages
+
+When we made setReadTrafficSecret send an alert when there are pending
+handshake messages, we introduced a deadlock when the client sends
+multiple key update messages that request a response, as handleKeyUpdate
+will lock the mutex, and defer the unlocking until the end of the
+function, but setReadTrafficSecret called sendAlert in the failure case,
+which also tries to lock the mutex.
+
+Add an argument to setReadTrafficSecret which lets the caller indicate
+if the mutex is already locked, and if so, call sendAlertLocked instead
+of sendAlert.
+
+Thanks to Jakub Ciolek for reporting this issue.
+
+Fixes #78334
+Fixes CVE-2026-32283
+
+Change-Id: Id8e56974233c910e0d66ba96eafbd2ea57832610
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3881
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763767
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: David Chase <drchase@google.com>
+Reviewed-by: Russ Cox <rsc@golang.org>
+Reviewed-by: Jakub Ciolek <jakub@ciolek.dev>
+
+CVE: CVE-2026-32283
+Upstream-Status: Backport [https://github.com/golang/go/commit/1ea7966042731bae941511fb2b261b9536ad268f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/crypto/tls/conn.go                   | 10 +++--
+ src/crypto/tls/handshake_client_tls13.go |  4 +-
+ src/crypto/tls/handshake_server_tls13.go |  4 +-
+ src/crypto/tls/handshake_test.go         | 48 ++++++++++++++++++++++++
+ 4 files changed, 59 insertions(+), 7 deletions(-)
+
+diff --git a/src/crypto/tls/conn.go b/src/crypto/tls/conn.go
+index 08609ce..770d456 100644
+--- a/src/crypto/tls/conn.go
++++ b/src/crypto/tls/conn.go
+@@ -1345,7 +1345,7 @@ func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error {
+ 	}
+ 
+ 	newSecret := cipherSuite.nextTrafficSecret(c.in.trafficSecret)
+-	if err := c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret); err != nil {
++	if err := c.setReadTrafficSecret(cipherSuite, QUICEncryptionLevelInitial, newSecret, keyUpdate.updateRequested); err != nil {
+ 		return err
+ 	}
+ 
+@@ -1675,12 +1675,16 @@ func (c *Conn) VerifyHostname(host string) error {
+ // setReadTrafficSecret sets the read traffic secret for the given encryption level. If
+ // being called at the same time as setWriteTrafficSecret, the caller must ensure the call
+ // to setWriteTrafficSecret happens first so any alerts are sent at the write level.
+-func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte) error {
++func (c *Conn) setReadTrafficSecret(suite *cipherSuiteTLS13, level QUICEncryptionLevel, secret []byte, locked bool) error {
+ 	// Ensure that there are no buffered handshake messages before changing the
+ 	// read keys, since that can cause messages to be parsed that were encrypted
+ 	// using old keys which are no longer appropriate.
+ 	if c.hand.Len() != 0 {
+-		c.sendAlert(alertUnexpectedMessage)
++		if locked {
++			c.sendAlertLocked(alertUnexpectedMessage)
++		} else {
++			c.sendAlert(alertUnexpectedMessage)
++		}
+ 		return errors.New("tls: handshake buffer not empty before setting read traffic secret")
+ 	}
+ 	c.in.setTrafficSecret(suite, level, secret)
+diff --git a/src/crypto/tls/handshake_client_tls13.go b/src/crypto/tls/handshake_client_tls13.go
+index 68ff92b..2d58b21 100644
+--- a/src/crypto/tls/handshake_client_tls13.go
++++ b/src/crypto/tls/handshake_client_tls13.go
+@@ -396,7 +396,7 @@ func (hs *clientHandshakeStateTLS13) establishHandshakeKeys() error {
+ 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret)
+ 	serverSecret := hs.suite.deriveSecret(handshakeSecret,
+ 		serverHandshakeTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+@@ -607,7 +607,7 @@ func (hs *clientHandshakeStateTLS13) readServerFinished() error {
+ 		clientApplicationTrafficLabel, hs.transcript)
+ 	serverSecret := hs.suite.deriveSecret(hs.masterSecret,
+ 		serverApplicationTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, serverSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+diff --git a/src/crypto/tls/handshake_server_tls13.go b/src/crypto/tls/handshake_server_tls13.go
+index 1ecee3a..f73b536 100644
+--- a/src/crypto/tls/handshake_server_tls13.go
++++ b/src/crypto/tls/handshake_server_tls13.go
+@@ -636,7 +636,7 @@ func (hs *serverHandshakeStateTLS13) sendServerParameters() error {
+ 	c.setWriteTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, serverSecret)
+ 	clientSecret := hs.suite.deriveSecret(hs.handshakeSecret,
+ 		clientHandshakeTrafficLabel, hs.transcript)
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelHandshake, clientSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+@@ -1005,7 +1005,7 @@ func (hs *serverHandshakeStateTLS13) readClientFinished() error {
+ 		return errors.New("tls: invalid client finished hash")
+ 	}
+ 
+-	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret); err != nil {
++	if err := c.setReadTrafficSecret(hs.suite, QUICEncryptionLevelApplication, hs.trafficSecret, false); err != nil {
+ 		return err
+ 	}
+ 
+diff --git a/src/crypto/tls/handshake_test.go b/src/crypto/tls/handshake_test.go
+index 4991a0e..a95d751 100644
+--- a/src/crypto/tls/handshake_test.go
++++ b/src/crypto/tls/handshake_test.go
+@@ -673,3 +673,51 @@ func concatHandshakeMessages(msgs ...handshakeMessage) ([]byte, error) {
+ 	outBuf = append(outBuf, marshalled...)
+ 	return outBuf, nil
+ }
++
++func TestMultipleKeyUpdate(t *testing.T) {
++	for _, requestUpdate := range []bool{true, false} {
++		t.Run(fmt.Sprintf("requestUpdate=%t", requestUpdate), func(t *testing.T) {
++
++			c, s := localPipe(t)
++			cfg := testConfig.Clone()
++			cfg.MinVersion = VersionTLS13
++			cfg.MaxVersion = VersionTLS13
++			client := Client(c, testConfig)
++			server := Server(s, testConfig)
++
++			clientHandshakeDone := make(chan struct{})
++			go func() {
++				if err := client.Handshake(); err != nil {
++				}
++				close(clientHandshakeDone)
++				io.Copy(io.Discard, server)
++			}()
++
++			if err := server.Handshake(); err != nil {
++				t.Fatalf("server handshake failed: %v\n", err)
++			}
++			<-clientHandshakeDone
++
++			c.SetReadDeadline(time.Now().Add(1 * time.Second))
++			s.SetReadDeadline(time.Now().Add(1 * time.Second))
++
++			kuMsg, err := (&keyUpdateMsg{updateRequested: requestUpdate}).marshal()
++			if err != nil {
++				t.Fatalf("failed to marshal key update message: %v", err)
++			}
++
++			client.out.Lock()
++			if _, err := client.writeRecordLocked(recordTypeHandshake, append(kuMsg, kuMsg...)); err != nil {
++				t.Fatalf("failed to write key update messages: %v", err)
++			}
++			client.out.Unlock()
++
++			_, err = io.Copy(io.Discard, client)
++			if err == nil {
++				t.Fatal("expected multiple key update messages to cause an error, got nil")
++			} else if !strings.HasSuffix(err.Error(), "tls: unexpected message") {
++				t.Fatalf("unexpected error: %v", err)
++			}
++		})
++	}
++}
+-- 
+2.43.0
+
-- 
2.53.0


