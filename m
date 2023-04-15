Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFD7C77B76
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:27:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.10506.1681572428262007252
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zi0YHYX7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-63b62d2f729so433808b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572427; x=1684164427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5PoxMyYabpa1/AYhSZ73f/ei8z2lTveppDFc8LW6Cc=;
        b=zi0YHYX7GfdWwYzSztO6UV7QQ8QPjaMaVwdOnF8hgANAd7fbXrEsgeCNTkm2JTAIvk
         5uODfjf4DzAxbyljwk9Edz3titEfs3nWeyCwt2466B9d4FFfqrUncsG96EeULzZiATGY
         majnfm0hEEx4hln+3QZ/DbD7DiiuNs8Ma8W5UhK7XB11Mt1vxDZpzlGJkl+Flbf2CsbX
         61RdE5XefJV7JZ0LU5AqQ6+7rcVVbS9maUB+GknkUVRnuUbTFZpHiilCNWhkyqq9qgNZ
         /PTOTes72oy291s34ybY5E39aEN+tQay+I4lkTAe877+QUdSfEdPw1Q5dlX/+WmdRXc1
         8JLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572427; x=1684164427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5PoxMyYabpa1/AYhSZ73f/ei8z2lTveppDFc8LW6Cc=;
        b=P7O5F8ogDZ/KgShooJdnwBf6kKo+QwBosOCHoJrNKmHRSrVydSbsCdvPNcWncTs95w
         RNDaxLth2KzIvJJvc3/KqnC9VXOzXW6AqzSQRqFFyofpwb9rPGmIwIdOwGYHLElOwXGE
         WQglJxSBCsONEiHEQDVMeCam4O/+3XHPbjZ15+qmdRwlo/15CwfrgNiljJ2q8K1FsOD+
         eAzW3Pa5Jy/BXGBvawPTWrF1VCoYsddTQrJ5ifg3goK3cy2iadY5MBrc1Z9thU4Rf/h7
         AKeK/Az52PxjnrGBNAiA8pv2saXNsOP8VAZR3JfDmawNYg4YPJk6Mvi8QBgpJZ7jtWvR
         MQbQ==
X-Gm-Message-State: AAQBX9exeJYvnEbBrrdrIWAqxyysXNzJ6FKPqsdsdUzZUyla5FMtgbt5
	yxpbSgk5ecafn6rmPQFrOBd69PM/h4Tp5c/vyac=
X-Google-Smtp-Source: AKy350b25doOjh7dzv5ZGaK5ZhUb/POnmtgY6X4l1PkR9lETF+ypxJBfCUjsfHmmHKz+KuuEEhgTQw==
X-Received: by 2002:a05:6a00:2d15:b0:63b:1e80:3850 with SMTP id fa21-20020a056a002d1500b0063b1e803850mr15668077pfb.19.1681572425553;
        Sat, 15 Apr 2023 08:27:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b0063b1e7ffc5fsm4824410pfn.39.2023.04.15.08.27.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:27:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/7] go: fix CVE-2022-41724, 41725
Date: Sat, 15 Apr 2023 05:26:42 -1000
Message-Id: <e5cf04f55b4849ae6db1253b39ad8b037cf01af4.1681572283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572283.git.steve@sakoman.com>
References: <cover.1681572283.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180015

From: Joe Slater <joe.slater@windriver.com>

Backport from go-1.19.  The godebug package is needed by
the fix to CVE-2022-41725.

Mostly a cherry-pick but exceptions are noted in comments
marked "backport".

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |    5 +-
 .../go/go-1.19/add_godebug.patch              |   84 +
 .../go/go-1.19/cve-2022-41724.patch           | 2391 +++++++++++++++++
 .../go/go-1.19/cve-2022-41725.patch           |  652 +++++
 4 files changed, 3131 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/go-1.19/add_godebug.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/cve-2022-41724.patch
 create mode 100644 meta/recipes-devtools/go/go-1.19/cve-2022-41725.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 14d58932dc..23380f04c3 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -1,6 +1,6 @@
 require go-common.inc
 
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.18:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -23,6 +23,9 @@ SRC_URI += "\
     file://CVE-2022-2879.patch \
     file://CVE-2022-41720.patch \
     file://CVE-2022-41723.patch \
+    file://cve-2022-41724.patch \
+    file://add_godebug.patch \
+    file://cve-2022-41725.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/add_godebug.patch b/meta/recipes-devtools/go/go-1.19/add_godebug.patch
new file mode 100644
index 0000000000..0c3d2d2855
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/add_godebug.patch
@@ -0,0 +1,84 @@
+
+Upstream-Status: Backport [see text]
+
+https://github.com/golong/go.git as of commit 22c1d18a27...
+Copy src/internal/godebug from go 1.19 since it does not
+exist in 1.17.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+
+--- /dev/null
++++ go/src/internal/godebug/godebug.go
+@@ -0,0 +1,34 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++// Package godebug parses the GODEBUG environment variable.
++package godebug
++
++import "os"
++
++// Get returns the value for the provided GODEBUG key.
++func Get(key string) string {
++	return get(os.Getenv("GODEBUG"), key)
++}
++
++// get returns the value part of key=value in s (a GODEBUG value).
++func get(s, key string) string {
++	for i := 0; i < len(s)-len(key)-1; i++ {
++		if i > 0 && s[i-1] != ',' {
++			continue
++		}
++		afterKey := s[i+len(key):]
++		if afterKey[0] != '=' || s[i:i+len(key)] != key {
++			continue
++		}
++		val := afterKey[1:]
++		for i, b := range val {
++			if b == ',' {
++				return val[:i]
++			}
++		}
++		return val
++	}
++	return ""
++}
+--- /dev/null
++++ go/src/internal/godebug/godebug_test.go
+@@ -0,0 +1,34 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package godebug
++
++import "testing"
++
++func TestGet(t *testing.T) {
++	tests := []struct {
++		godebug string
++		key     string
++		want    string
++	}{
++		{"", "", ""},
++		{"", "foo", ""},
++		{"foo=bar", "foo", "bar"},
++		{"foo=bar,after=x", "foo", "bar"},
++		{"before=x,foo=bar,after=x", "foo", "bar"},
++		{"before=x,foo=bar", "foo", "bar"},
++		{",,,foo=bar,,,", "foo", "bar"},
++		{"foodecoy=wrong,foo=bar", "foo", "bar"},
++		{"foo=", "foo", ""},
++		{"foo", "foo", ""},
++		{",foo", "foo", ""},
++		{"foo=bar,baz", "loooooooong", ""},
++	}
++	for _, tt := range tests {
++		got := get(tt.godebug, tt.key)
++		if got != tt.want {
++			t.Errorf("get(%q, %q) = %q; want %q", tt.godebug, tt.key, got, tt.want)
++		}
++	}
++}
diff --git a/meta/recipes-devtools/go/go-1.19/cve-2022-41724.patch b/meta/recipes-devtools/go/go-1.19/cve-2022-41724.patch
new file mode 100644
index 0000000000..aacffbffcd
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/cve-2022-41724.patch
@@ -0,0 +1,2391 @@
+From 00b256e9e3c0fa02a278ec9dfc3e191e02ceaf80 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Wed, 14 Dec 2022 09:43:16 -0800
+Subject: [PATCH] [release-branch.go1.19] crypto/tls: replace all usages of
+ BytesOrPanic
+
+Message marshalling makes use of BytesOrPanic a lot, under the
+assumption that it will never panic. This assumption was incorrect, and
+specifically crafted handshakes could trigger panics. Rather than just
+surgically replacing the usages of BytesOrPanic in paths that could
+panic, replace all usages of it with proper error returns in case there
+are other ways of triggering panics which we didn't find.
+
+In one specific case, the tree routed by expandLabel, we replace the
+usage of BytesOrPanic, but retain a panic. This function already
+explicitly panicked elsewhere, and returning an error from it becomes
+rather painful because it requires changing a large number of APIs.
+The marshalling is unlikely to ever panic, as the inputs are all either
+fixed length, or already limited to the sizes required. If it were to
+panic, it'd likely only be during development. A close inspection shows
+no paths for a user to cause a panic currently.
+
+This patches ends up being rather large, since it requires routing
+errors back through functions which previously had no error returns.
+Where possible I've tried to use helpers that reduce the verbosity
+of frequently repeated stanzas, and to make the diffs as minimal as
+possible.
+
+Thanks to Marten Seemann for reporting this issue.
+
+Updates #58001
+Fixes #58358
+Fixes CVE-2022-41724
+
+Change-Id: Ieb55867ef0a3e1e867b33f09421932510cb58851
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1679436
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 0f3a44ad7b41cc89efdfad25278953e17d9c1e04)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1728204
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/468117
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Run-TryBot: Michael Pratt <mpratt@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Than McIntosh <thanm@google.com>
+---
+
+CVE: CVE-2022-41724
+
+Upstream-Status: Backport [see text]
+
+https://github.com/golong/go.git commit 00b256e9e3c0fa...
+boring_test.go does not exist
+modified for conn.go and handshake_messages.go
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/crypto/tls/boring_test.go             |   2 +-
+ src/crypto/tls/common.go                  |   2 +-
+ src/crypto/tls/conn.go                    |  46 +-
+ src/crypto/tls/handshake_client.go        |  95 +--
+ src/crypto/tls/handshake_client_test.go   |   4 +-
+ src/crypto/tls/handshake_client_tls13.go  |  74 ++-
+ src/crypto/tls/handshake_messages.go      | 716 +++++++++++-----------
+ src/crypto/tls/handshake_messages_test.go |  19 +-
+ src/crypto/tls/handshake_server.go        |  73 ++-
+ src/crypto/tls/handshake_server_test.go   |  31 +-
+ src/crypto/tls/handshake_server_tls13.go  |  71 ++-
+ src/crypto/tls/key_schedule.go            |  19 +-
+ src/crypto/tls/ticket.go                  |   8 +-
+ 13 files changed, 657 insertions(+), 503 deletions(-)
+
+--- go.orig/src/crypto/tls/common.go
++++ go/src/crypto/tls/common.go
+@@ -1357,7 +1357,7 @@ func (c *Certificate) leaf() (*x509.Cert
+ }
+ 
+ type handshakeMessage interface {
+-	marshal() []byte
++	marshal() ([]byte, error)
+ 	unmarshal([]byte) bool
+ }
+ 
+--- go.orig/src/crypto/tls/conn.go
++++ go/src/crypto/tls/conn.go
+@@ -994,18 +994,46 @@ func (c *Conn) writeRecordLocked(typ rec
+ 	return n, nil
+ }
+ 
+-// writeRecord writes a TLS record with the given type and payload to the
+-// connection and updates the record layer state.
+-func (c *Conn) writeRecord(typ recordType, data []byte) (int, error) {
++// writeHandshakeRecord writes a handshake message to the connection and updates
++// the record layer state. If transcript is non-nil the marshalled message is
++// written to it.
++func (c *Conn) writeHandshakeRecord(msg handshakeMessage, transcript transcriptHash) (int, error) {
+ 	c.out.Lock()
+ 	defer c.out.Unlock()
+ 
+-	return c.writeRecordLocked(typ, data)
++	data, err := msg.marshal()
++	if err != nil {
++		return 0, err
++	}
++	if transcript != nil {
++		transcript.Write(data)
++	}
++
++	return c.writeRecordLocked(recordTypeHandshake, data)
++}
++
++// writeChangeCipherRecord writes a ChangeCipherSpec message to the connection and
++// updates the record layer state.
++func (c *Conn) writeChangeCipherRecord() error {
++	c.out.Lock()
++	defer c.out.Unlock()
++	_, err := c.writeRecordLocked(recordTypeChangeCipherSpec, []byte{1})
++	return err
+ }
+ 
+ // readHandshake reads the next handshake message from
+-// the record layer.
+-func (c *Conn) readHandshake() (interface{}, error) {
++// the record layer. If transcript is non-nil, the message
++// is written to the passed transcriptHash.
++
++// backport 00b256e9e3c0fa02a278ec9dfc3e191e02ceaf80 
++//
++// Commit wants to set this to
++//
++// func (c *Conn) readHandshake(transcript transcriptHash) (any, error) {
++//
++// but that does not compile.  Retain the original interface{} argument.
++//
++func (c *Conn) readHandshake(transcript transcriptHash) (interface{}, error) {
+ 	for c.hand.Len() < 4 {
+ 		if err := c.readRecord(); err != nil {
+ 			return nil, err
+@@ -1084,6 +1112,11 @@ func (c *Conn) readHandshake() (interfac
+ 	if !m.unmarshal(data) {
+ 		return nil, c.in.setErrorLocked(c.sendAlert(alertUnexpectedMessage))
+ 	}
++
++	if transcript != nil {
++		transcript.Write(data)
++	}
++
+ 	return m, nil
+ }
+ 
+@@ -1159,7 +1192,7 @@ func (c *Conn) handleRenegotiation() err
+ 		return errors.New("tls: internal error: unexpected renegotiation")
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -1205,7 +1238,7 @@ func (c *Conn) handlePostHandshakeMessag
+ 		return c.handleRenegotiation()
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -1241,7 +1274,11 @@ func (c *Conn) handleKeyUpdate(keyUpdate
+ 		defer c.out.Unlock()
+ 
+ 		msg := &keyUpdateMsg{}
+-		_, err := c.writeRecordLocked(recordTypeHandshake, msg.marshal())
++		msgBytes, err := msg.marshal()
++		if err != nil {
++			return err
++		}
++		_, err = c.writeRecordLocked(recordTypeHandshake, msgBytes)
+ 		if err != nil {
+ 			// Surface the error at the next write.
+ 			c.out.setErrorLocked(err)
+--- go.orig/src/crypto/tls/handshake_client.go
++++ go/src/crypto/tls/handshake_client.go
+@@ -157,7 +157,10 @@ func (c *Conn) clientHandshake(ctx conte
+ 	}
+ 	c.serverName = hello.serverName
+ 
+-	cacheKey, session, earlySecret, binderKey := c.loadSession(hello)
++	cacheKey, session, earlySecret, binderKey, err := c.loadSession(hello)
++	if err != nil {
++		return err
++	}
+ 	if cacheKey != "" && session != nil {
+ 		defer func() {
+ 			// If we got a handshake failure when resuming a session, throw away
+@@ -172,11 +175,12 @@ func (c *Conn) clientHandshake(ctx conte
+ 		}()
+ 	}
+ 
+-	if _, err := c.writeRecord(recordTypeHandshake, hello.marshal()); err != nil {
++	if _, err := c.writeHandshakeRecord(hello, nil); err != nil {
+ 		return err
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	// serverHelloMsg is not included in the transcript
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -241,9 +245,9 @@ func (c *Conn) clientHandshake(ctx conte
+ }
+ 
+ func (c *Conn) loadSession(hello *clientHelloMsg) (cacheKey string,
+-	session *ClientSessionState, earlySecret, binderKey []byte) {
++	session *ClientSessionState, earlySecret, binderKey []byte, err error) {
+ 	if c.config.SessionTicketsDisabled || c.config.ClientSessionCache == nil {
+-		return "", nil, nil, nil
++		return "", nil, nil, nil, nil
+ 	}
+ 
+ 	hello.ticketSupported = true
+@@ -258,14 +262,14 @@ func (c *Conn) loadSession(hello *client
+ 	// renegotiation is primarily used to allow a client to send a client
+ 	// certificate, which would be skipped if session resumption occurred.
+ 	if c.handshakes != 0 {
+-		return "", nil, nil, nil
++		return "", nil, nil, nil, nil
+ 	}
+ 
+ 	// Try to resume a previously negotiated TLS session, if available.
+ 	cacheKey = clientSessionCacheKey(c.conn.RemoteAddr(), c.config)
+ 	session, ok := c.config.ClientSessionCache.Get(cacheKey)
+ 	if !ok || session == nil {
+-		return cacheKey, nil, nil, nil
++		return cacheKey, nil, nil, nil, nil
+ 	}
+ 
+ 	// Check that version used for the previous session is still valid.
+@@ -277,7 +281,7 @@ func (c *Conn) loadSession(hello *client
+ 		}
+ 	}
+ 	if !versOk {
+-		return cacheKey, nil, nil, nil
++		return cacheKey, nil, nil, nil, nil
+ 	}
+ 
+ 	// Check that the cached server certificate is not expired, and that it's
+@@ -286,16 +290,16 @@ func (c *Conn) loadSession(hello *client
+ 	if !c.config.InsecureSkipVerify {
+ 		if len(session.verifiedChains) == 0 {
+ 			// The original connection had InsecureSkipVerify, while this doesn't.
+-			return cacheKey, nil, nil, nil
++			return cacheKey, nil, nil, nil, nil
+ 		}
+ 		serverCert := session.serverCertificates[0]
+ 		if c.config.time().After(serverCert.NotAfter) {
+ 			// Expired certificate, delete the entry.
+ 			c.config.ClientSessionCache.Put(cacheKey, nil)
+-			return cacheKey, nil, nil, nil
++			return cacheKey, nil, nil, nil, nil
+ 		}
+ 		if err := serverCert.VerifyHostname(c.config.ServerName); err != nil {
+-			return cacheKey, nil, nil, nil
++			return cacheKey, nil, nil, nil, nil
+ 		}
+ 	}
+ 
+@@ -303,7 +307,7 @@ func (c *Conn) loadSession(hello *client
+ 		// In TLS 1.2 the cipher suite must match the resumed session. Ensure we
+ 		// are still offering it.
+ 		if mutualCipherSuite(hello.cipherSuites, session.cipherSuite) == nil {
+-			return cacheKey, nil, nil, nil
++			return cacheKey, nil, nil, nil, nil
+ 		}
+ 
+ 		hello.sessionTicket = session.sessionTicket
+@@ -313,14 +317,14 @@ func (c *Conn) loadSession(hello *client
+ 	// Check that the session ticket is not expired.
+ 	if c.config.time().After(session.useBy) {
+ 		c.config.ClientSessionCache.Put(cacheKey, nil)
+-		return cacheKey, nil, nil, nil
++		return cacheKey, nil, nil, nil, nil
+ 	}
+ 
+ 	// In TLS 1.3 the KDF hash must match the resumed session. Ensure we
+ 	// offer at least one cipher suite with that hash.
+ 	cipherSuite := cipherSuiteTLS13ByID(session.cipherSuite)
+ 	if cipherSuite == nil {
+-		return cacheKey, nil, nil, nil
++		return cacheKey, nil, nil, nil, nil
+ 	}
+ 	cipherSuiteOk := false
+ 	for _, offeredID := range hello.cipherSuites {
+@@ -331,7 +335,7 @@ func (c *Conn) loadSession(hello *client
+ 		}
+ 	}
+ 	if !cipherSuiteOk {
+-		return cacheKey, nil, nil, nil
++		return cacheKey, nil, nil, nil, nil
+ 	}
+ 
+ 	// Set the pre_shared_key extension. See RFC 8446, Section 4.2.11.1.
+@@ -349,9 +353,15 @@ func (c *Conn) loadSession(hello *client
+ 	earlySecret = cipherSuite.extract(psk, nil)
+ 	binderKey = cipherSuite.deriveSecret(earlySecret, resumptionBinderLabel, nil)
+ 	transcript := cipherSuite.hash.New()
+-	transcript.Write(hello.marshalWithoutBinders())
++	helloBytes, err := hello.marshalWithoutBinders()
++	if err != nil {
++		return "", nil, nil, nil, err
++	}
++	transcript.Write(helloBytes)
+ 	pskBinders := [][]byte{cipherSuite.finishedHash(binderKey, transcript)}
+-	hello.updateBinders(pskBinders)
++	if err := hello.updateBinders(pskBinders); err != nil {
++		return "", nil, nil, nil, err
++	}
+ 
+ 	return
+ }
+@@ -396,8 +406,12 @@ func (hs *clientHandshakeState) handshak
+ 		hs.finishedHash.discardHandshakeBuffer()
+ 	}
+ 
+-	hs.finishedHash.Write(hs.hello.marshal())
+-	hs.finishedHash.Write(hs.serverHello.marshal())
++	if err := transcriptMsg(hs.hello, &hs.finishedHash); err != nil {
++		return err
++	}
++	if err := transcriptMsg(hs.serverHello, &hs.finishedHash); err != nil {
++		return err
++	}
+ 
+ 	c.buffering = true
+ 	c.didResume = isResume
+@@ -468,7 +482,7 @@ func (hs *clientHandshakeState) pickCiph
+ func (hs *clientHandshakeState) doFullHandshake() error {
+ 	c := hs.c
+ 
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(&hs.finishedHash)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -477,9 +491,8 @@ func (hs *clientHandshakeState) doFullHa
+ 		c.sendAlert(alertUnexpectedMessage)
+ 		return unexpectedMessageError(certMsg, msg)
+ 	}
+-	hs.finishedHash.Write(certMsg.marshal())
+ 
+-	msg, err = c.readHandshake()
++	msg, err = c.readHandshake(&hs.finishedHash)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -497,11 +510,10 @@ func (hs *clientHandshakeState) doFullHa
+ 			c.sendAlert(alertUnexpectedMessage)
+ 			return errors.New("tls: received unexpected CertificateStatus message")
+ 		}
+-		hs.finishedHash.Write(cs.marshal())
+ 
+ 		c.ocspResponse = cs.response
+ 
+-		msg, err = c.readHandshake()
++		msg, err = c.readHandshake(&hs.finishedHash)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -530,14 +542,13 @@ func (hs *clientHandshakeState) doFullHa
+ 
+ 	skx, ok := msg.(*serverKeyExchangeMsg)
+ 	if ok {
+-		hs.finishedHash.Write(skx.marshal())
+ 		err = keyAgreement.processServerKeyExchange(c.config, hs.hello, hs.serverHello, c.peerCertificates[0], skx)
+ 		if err != nil {
+ 			c.sendAlert(alertUnexpectedMessage)
+ 			return err
+ 		}
+ 
+-		msg, err = c.readHandshake()
++		msg, err = c.readHandshake(&hs.finishedHash)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -548,7 +559,6 @@ func (hs *clientHandshakeState) doFullHa
+ 	certReq, ok := msg.(*certificateRequestMsg)
+ 	if ok {
+ 		certRequested = true
+-		hs.finishedHash.Write(certReq.marshal())
+ 
+ 		cri := certificateRequestInfoFromMsg(hs.ctx, c.vers, certReq)
+ 		if chainToSend, err = c.getClientCertificate(cri); err != nil {
+@@ -556,7 +566,7 @@ func (hs *clientHandshakeState) doFullHa
+ 			return err
+ 		}
+ 
+-		msg, err = c.readHandshake()
++		msg, err = c.readHandshake(&hs.finishedHash)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -567,7 +577,6 @@ func (hs *clientHandshakeState) doFullHa
+ 		c.sendAlert(alertUnexpectedMessage)
+ 		return unexpectedMessageError(shd, msg)
+ 	}
+-	hs.finishedHash.Write(shd.marshal())
+ 
+ 	// If the server requested a certificate then we have to send a
+ 	// Certificate message, even if it's empty because we don't have a
+@@ -575,8 +584,7 @@ func (hs *clientHandshakeState) doFullHa
+ 	if certRequested {
+ 		certMsg = new(certificateMsg)
+ 		certMsg.certificates = chainToSend.Certificate
+-		hs.finishedHash.Write(certMsg.marshal())
+-		if _, err := c.writeRecord(recordTypeHandshake, certMsg.marshal()); err != nil {
++		if _, err := hs.c.writeHandshakeRecord(certMsg, &hs.finishedHash); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -587,8 +595,7 @@ func (hs *clientHandshakeState) doFullHa
+ 		return err
+ 	}
+ 	if ckx != nil {
+-		hs.finishedHash.Write(ckx.marshal())
+-		if _, err := c.writeRecord(recordTypeHandshake, ckx.marshal()); err != nil {
++		if _, err := hs.c.writeHandshakeRecord(ckx, &hs.finishedHash); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -635,8 +642,7 @@ func (hs *clientHandshakeState) doFullHa
+ 			return err
+ 		}
+ 
+-		hs.finishedHash.Write(certVerify.marshal())
+-		if _, err := c.writeRecord(recordTypeHandshake, certVerify.marshal()); err != nil {
++		if _, err := hs.c.writeHandshakeRecord(certVerify, &hs.finishedHash); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -771,7 +777,10 @@ func (hs *clientHandshakeState) readFini
+ 		return err
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	// finishedMsg is included in the transcript, but not until after we
++	// check the client version, since the state before this message was
++	// sent is used during verification.
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -787,7 +796,11 @@ func (hs *clientHandshakeState) readFini
+ 		c.sendAlert(alertHandshakeFailure)
+ 		return errors.New("tls: server's Finished message was incorrect")
+ 	}
+-	hs.finishedHash.Write(serverFinished.marshal())
++
++	if err := transcriptMsg(serverFinished, &hs.finishedHash); err != nil {
++		return err
++	}
++
+ 	copy(out, verify)
+ 	return nil
+ }
+@@ -798,7 +811,7 @@ func (hs *clientHandshakeState) readSess
+ 	}
+ 
+ 	c := hs.c
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(&hs.finishedHash)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -807,7 +820,6 @@ func (hs *clientHandshakeState) readSess
+ 		c.sendAlert(alertUnexpectedMessage)
+ 		return unexpectedMessageError(sessionTicketMsg, msg)
+ 	}
+-	hs.finishedHash.Write(sessionTicketMsg.marshal())
+ 
+ 	hs.session = &ClientSessionState{
+ 		sessionTicket:      sessionTicketMsg.ticket,
+@@ -827,14 +839,13 @@ func (hs *clientHandshakeState) readSess
+ func (hs *clientHandshakeState) sendFinished(out []byte) error {
+ 	c := hs.c
+ 
+-	if _, err := c.writeRecord(recordTypeChangeCipherSpec, []byte{1}); err != nil {
++	if err := c.writeChangeCipherRecord(); err != nil {
+ 		return err
+ 	}
+ 
+ 	finished := new(finishedMsg)
+ 	finished.verifyData = hs.finishedHash.clientSum(hs.masterSecret)
+-	hs.finishedHash.Write(finished.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, finished.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(finished, &hs.finishedHash); err != nil {
+ 		return err
+ 	}
+ 	copy(out, finished.verifyData)
+--- go.orig/src/crypto/tls/handshake_client_test.go
++++ go/src/crypto/tls/handshake_client_test.go
+@@ -1257,7 +1257,7 @@ func TestServerSelectingUnconfiguredAppl
+ 		cipherSuite:  TLS_RSA_WITH_AES_128_GCM_SHA256,
+ 		alpnProtocol: "how-about-this",
+ 	}
+-	serverHelloBytes := serverHello.marshal()
++	serverHelloBytes := mustMarshal(t, serverHello)
+ 
+ 	s.Write([]byte{
+ 		byte(recordTypeHandshake),
+@@ -1500,7 +1500,7 @@ func TestServerSelectingUnconfiguredCiph
+ 		random:      make([]byte, 32),
+ 		cipherSuite: TLS_RSA_WITH_AES_256_GCM_SHA384,
+ 	}
+-	serverHelloBytes := serverHello.marshal()
++	serverHelloBytes := mustMarshal(t, serverHello)
+ 
+ 	s.Write([]byte{
+ 		byte(recordTypeHandshake),
+--- go.orig/src/crypto/tls/handshake_client_tls13.go
++++ go/src/crypto/tls/handshake_client_tls13.go
+@@ -58,7 +58,10 @@ func (hs *clientHandshakeStateTLS13) han
+ 	}
+ 
+ 	hs.transcript = hs.suite.hash.New()
+-	hs.transcript.Write(hs.hello.marshal())
++
++	if err := transcriptMsg(hs.hello, hs.transcript); err != nil {
++		return err
++	}
+ 
+ 	if bytes.Equal(hs.serverHello.random, helloRetryRequestRandom) {
+ 		if err := hs.sendDummyChangeCipherSpec(); err != nil {
+@@ -69,7 +72,9 @@ func (hs *clientHandshakeStateTLS13) han
+ 		}
+ 	}
+ 
+-	hs.transcript.Write(hs.serverHello.marshal())
++	if err := transcriptMsg(hs.serverHello, hs.transcript); err != nil {
++		return err
++	}
+ 
+ 	c.buffering = true
+ 	if err := hs.processServerHello(); err != nil {
+@@ -168,8 +173,7 @@ func (hs *clientHandshakeStateTLS13) sen
+ 	}
+ 	hs.sentDummyCCS = true
+ 
+-	_, err := hs.c.writeRecord(recordTypeChangeCipherSpec, []byte{1})
+-	return err
++	return hs.c.writeChangeCipherRecord()
+ }
+ 
+ // processHelloRetryRequest handles the HRR in hs.serverHello, modifies and
+@@ -184,7 +188,9 @@ func (hs *clientHandshakeStateTLS13) pro
+ 	hs.transcript.Reset()
+ 	hs.transcript.Write([]byte{typeMessageHash, 0, 0, uint8(len(chHash))})
+ 	hs.transcript.Write(chHash)
+-	hs.transcript.Write(hs.serverHello.marshal())
++	if err := transcriptMsg(hs.serverHello, hs.transcript); err != nil {
++		return err
++	}
+ 
+ 	// The only HelloRetryRequest extensions we support are key_share and
+ 	// cookie, and clients must abort the handshake if the HRR would not result
+@@ -249,10 +255,18 @@ func (hs *clientHandshakeStateTLS13) pro
+ 			transcript := hs.suite.hash.New()
+ 			transcript.Write([]byte{typeMessageHash, 0, 0, uint8(len(chHash))})
+ 			transcript.Write(chHash)
+-			transcript.Write(hs.serverHello.marshal())
+-			transcript.Write(hs.hello.marshalWithoutBinders())
++			if err := transcriptMsg(hs.serverHello, hs.transcript); err != nil {
++				return err
++			}
++			helloBytes, err := hs.hello.marshalWithoutBinders()
++			if err != nil {
++				return err
++			}
++			transcript.Write(helloBytes)
+ 			pskBinders := [][]byte{hs.suite.finishedHash(hs.binderKey, transcript)}
+-			hs.hello.updateBinders(pskBinders)
++			if err := hs.hello.updateBinders(pskBinders); err != nil {
++				return err
++			}
+ 		} else {
+ 			// Server selected a cipher suite incompatible with the PSK.
+ 			hs.hello.pskIdentities = nil
+@@ -260,12 +274,12 @@ func (hs *clientHandshakeStateTLS13) pro
+ 		}
+ 	}
+ 
+-	hs.transcript.Write(hs.hello.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, hs.hello.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(hs.hello, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	// serverHelloMsg is not included in the transcript
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -354,6 +368,7 @@ func (hs *clientHandshakeStateTLS13) est
+ 	if !hs.usingPSK {
+ 		earlySecret = hs.suite.extract(nil, nil)
+ 	}
++
+ 	handshakeSecret := hs.suite.extract(sharedKey,
+ 		hs.suite.deriveSecret(earlySecret, "derived", nil))
+ 
+@@ -384,7 +399,7 @@ func (hs *clientHandshakeStateTLS13) est
+ func (hs *clientHandshakeStateTLS13) readServerParameters() error {
+ 	c := hs.c
+ 
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(hs.transcript)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -394,7 +409,6 @@ func (hs *clientHandshakeStateTLS13) rea
+ 		c.sendAlert(alertUnexpectedMessage)
+ 		return unexpectedMessageError(encryptedExtensions, msg)
+ 	}
+-	hs.transcript.Write(encryptedExtensions.marshal())
+ 
+ 	if err := checkALPN(hs.hello.alpnProtocols, encryptedExtensions.alpnProtocol); err != nil {
+ 		c.sendAlert(alertUnsupportedExtension)
+@@ -423,18 +437,16 @@ func (hs *clientHandshakeStateTLS13) rea
+ 		return nil
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(hs.transcript)
+ 	if err != nil {
+ 		return err
+ 	}
+ 
+ 	certReq, ok := msg.(*certificateRequestMsgTLS13)
+ 	if ok {
+-		hs.transcript.Write(certReq.marshal())
+-
+ 		hs.certReq = certReq
+ 
+-		msg, err = c.readHandshake()
++		msg, err = c.readHandshake(hs.transcript)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -449,7 +461,6 @@ func (hs *clientHandshakeStateTLS13) rea
+ 		c.sendAlert(alertDecodeError)
+ 		return errors.New("tls: received empty certificates message")
+ 	}
+-	hs.transcript.Write(certMsg.marshal())
+ 
+ 	c.scts = certMsg.certificate.SignedCertificateTimestamps
+ 	c.ocspResponse = certMsg.certificate.OCSPStaple
+@@ -458,7 +469,10 @@ func (hs *clientHandshakeStateTLS13) rea
+ 		return err
+ 	}
+ 
+-	msg, err = c.readHandshake()
++	// certificateVerifyMsg is included in the transcript, but not until
++	// after we verify the handshake signature, since the state before
++	// this message was sent is used.
++	msg, err = c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -489,7 +503,9 @@ func (hs *clientHandshakeStateTLS13) rea
+ 		return errors.New("tls: invalid signature by the server certificate: " + err.Error())
+ 	}
+ 
+-	hs.transcript.Write(certVerify.marshal())
++	if err := transcriptMsg(certVerify, hs.transcript); err != nil {
++		return err
++	}
+ 
+ 	return nil
+ }
+@@ -497,7 +513,10 @@ func (hs *clientHandshakeStateTLS13) rea
+ func (hs *clientHandshakeStateTLS13) readServerFinished() error {
+ 	c := hs.c
+ 
+-	msg, err := c.readHandshake()
++	// finishedMsg is included in the transcript, but not until after we
++	// check the client version, since the state before this message was
++	// sent is used during verification.
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -514,7 +533,9 @@ func (hs *clientHandshakeStateTLS13) rea
+ 		return errors.New("tls: invalid server finished hash")
+ 	}
+ 
+-	hs.transcript.Write(finished.marshal())
++	if err := transcriptMsg(finished, hs.transcript); err != nil {
++		return err
++	}
+ 
+ 	// Derive secrets that take context through the server Finished.
+ 
+@@ -563,8 +584,7 @@ func (hs *clientHandshakeStateTLS13) sen
+ 	certMsg.scts = hs.certReq.scts && len(cert.SignedCertificateTimestamps) > 0
+ 	certMsg.ocspStapling = hs.certReq.ocspStapling && len(cert.OCSPStaple) > 0
+ 
+-	hs.transcript.Write(certMsg.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, certMsg.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(certMsg, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -601,8 +621,7 @@ func (hs *clientHandshakeStateTLS13) sen
+ 	}
+ 	certVerifyMsg.signature = sig
+ 
+-	hs.transcript.Write(certVerifyMsg.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, certVerifyMsg.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(certVerifyMsg, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -616,8 +635,7 @@ func (hs *clientHandshakeStateTLS13) sen
+ 		verifyData: hs.suite.finishedHash(c.out.trafficSecret, hs.transcript),
+ 	}
+ 
+-	hs.transcript.Write(finished.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, finished.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(finished, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+--- go.orig/src/crypto/tls/handshake_messages.go
++++ go/src/crypto/tls/handshake_messages.go
+@@ -5,6 +5,7 @@
+ package tls
+ 
+ import (
++	"errors"
+ 	"fmt"
+ 	"strings"
+ 
+@@ -94,9 +95,181 @@ type clientHelloMsg struct {
+ 	pskBinders                       [][]byte
+ }
+ 
+-func (m *clientHelloMsg) marshal() []byte {
++func (m *clientHelloMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
++	}
++
++	var exts cryptobyte.Builder
++	if len(m.serverName) > 0 {
++		// RFC 6066, Section 3
++		exts.AddUint16(extensionServerName)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddUint8(0) // name_type = host_name
++				exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++					exts.AddBytes([]byte(m.serverName))
++				})
++			})
++		})
++	}
++	if m.ocspStapling {
++		// RFC 4366, Section 3.6
++		exts.AddUint16(extensionStatusRequest)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint8(1)  // status_type = ocsp
++			exts.AddUint16(0) // empty responder_id_list
++			exts.AddUint16(0) // empty request_extensions
++		})
++	}
++	if len(m.supportedCurves) > 0 {
++		// RFC 4492, sections 5.1.1 and RFC 8446, Section 4.2.7
++		exts.AddUint16(extensionSupportedCurves)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, curve := range m.supportedCurves {
++					exts.AddUint16(uint16(curve))
++				}
++			})
++		})
++	}
++	if len(m.supportedPoints) > 0 {
++		// RFC 4492, Section 5.1.2
++		exts.AddUint16(extensionSupportedPoints)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.supportedPoints)
++			})
++		})
++	}
++	if m.ticketSupported {
++		// RFC 5077, Section 3.2
++		exts.AddUint16(extensionSessionTicket)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddBytes(m.sessionTicket)
++		})
++	}
++	if len(m.supportedSignatureAlgorithms) > 0 {
++		// RFC 5246, Section 7.4.1.4.1
++		exts.AddUint16(extensionSignatureAlgorithms)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, sigAlgo := range m.supportedSignatureAlgorithms {
++					exts.AddUint16(uint16(sigAlgo))
++				}
++			})
++		})
++	}
++	if len(m.supportedSignatureAlgorithmsCert) > 0 {
++		// RFC 8446, Section 4.2.3
++		exts.AddUint16(extensionSignatureAlgorithmsCert)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, sigAlgo := range m.supportedSignatureAlgorithmsCert {
++					exts.AddUint16(uint16(sigAlgo))
++				}
++			})
++		})
++	}
++	if m.secureRenegotiationSupported {
++		// RFC 5746, Section 3.2
++		exts.AddUint16(extensionRenegotiationInfo)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.secureRenegotiation)
++			})
++		})
++	}
++	if len(m.alpnProtocols) > 0 {
++		// RFC 7301, Section 3.1
++		exts.AddUint16(extensionALPN)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, proto := range m.alpnProtocols {
++					exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++						exts.AddBytes([]byte(proto))
++					})
++				}
++			})
++		})
++	}
++	if m.scts {
++		// RFC 6962, Section 3.3.1
++		exts.AddUint16(extensionSCT)
++		exts.AddUint16(0) // empty extension_data
++	}
++	if len(m.supportedVersions) > 0 {
++		// RFC 8446, Section 4.2.1
++		exts.AddUint16(extensionSupportedVersions)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, vers := range m.supportedVersions {
++					exts.AddUint16(vers)
++				}
++			})
++		})
++	}
++	if len(m.cookie) > 0 {
++		// RFC 8446, Section 4.2.2
++		exts.AddUint16(extensionCookie)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.cookie)
++			})
++		})
++	}
++	if len(m.keyShares) > 0 {
++		// RFC 8446, Section 4.2.8
++		exts.AddUint16(extensionKeyShare)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, ks := range m.keyShares {
++					exts.AddUint16(uint16(ks.group))
++					exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++						exts.AddBytes(ks.data)
++					})
++				}
++			})
++		})
++	}
++	if m.earlyData {
++		// RFC 8446, Section 4.2.10
++		exts.AddUint16(extensionEarlyData)
++		exts.AddUint16(0) // empty extension_data
++	}
++	if len(m.pskModes) > 0 {
++		// RFC 8446, Section 4.2.9
++		exts.AddUint16(extensionPSKModes)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.pskModes)
++			})
++		})
++	}
++	if len(m.pskIdentities) > 0 { // pre_shared_key must be the last extension
++		// RFC 8446, Section 4.2.11
++		exts.AddUint16(extensionPreSharedKey)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, psk := range m.pskIdentities {
++					exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++						exts.AddBytes(psk.label)
++					})
++					exts.AddUint32(psk.obfuscatedTicketAge)
++				}
++			})
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, binder := range m.pskBinders {
++					exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++						exts.AddBytes(binder)
++					})
++				}
++			})
++		})
++	}
++	extBytes, err := exts.Bytes()
++	if err != nil {
++		return nil, err
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -116,219 +289,53 @@ func (m *clientHelloMsg) marshal() []byt
+ 			b.AddBytes(m.compressionMethods)
+ 		})
+ 
+-		// If extensions aren't present, omit them.
+-		var extensionsPresent bool
+-		bWithoutExtensions := *b
+-
+-		b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-			if len(m.serverName) > 0 {
+-				// RFC 6066, Section 3
+-				b.AddUint16(extensionServerName)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddUint8(0) // name_type = host_name
+-						b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-							b.AddBytes([]byte(m.serverName))
+-						})
+-					})
+-				})
+-			}
+-			if m.ocspStapling {
+-				// RFC 4366, Section 3.6
+-				b.AddUint16(extensionStatusRequest)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint8(1)  // status_type = ocsp
+-					b.AddUint16(0) // empty responder_id_list
+-					b.AddUint16(0) // empty request_extensions
+-				})
+-			}
+-			if len(m.supportedCurves) > 0 {
+-				// RFC 4492, sections 5.1.1 and RFC 8446, Section 4.2.7
+-				b.AddUint16(extensionSupportedCurves)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, curve := range m.supportedCurves {
+-							b.AddUint16(uint16(curve))
+-						}
+-					})
+-				})
+-			}
+-			if len(m.supportedPoints) > 0 {
+-				// RFC 4492, Section 5.1.2
+-				b.AddUint16(extensionSupportedPoints)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.supportedPoints)
+-					})
+-				})
+-			}
+-			if m.ticketSupported {
+-				// RFC 5077, Section 3.2
+-				b.AddUint16(extensionSessionTicket)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddBytes(m.sessionTicket)
+-				})
+-			}
+-			if len(m.supportedSignatureAlgorithms) > 0 {
+-				// RFC 5246, Section 7.4.1.4.1
+-				b.AddUint16(extensionSignatureAlgorithms)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, sigAlgo := range m.supportedSignatureAlgorithms {
+-							b.AddUint16(uint16(sigAlgo))
+-						}
+-					})
+-				})
+-			}
+-			if len(m.supportedSignatureAlgorithmsCert) > 0 {
+-				// RFC 8446, Section 4.2.3
+-				b.AddUint16(extensionSignatureAlgorithmsCert)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, sigAlgo := range m.supportedSignatureAlgorithmsCert {
+-							b.AddUint16(uint16(sigAlgo))
+-						}
+-					})
+-				})
+-			}
+-			if m.secureRenegotiationSupported {
+-				// RFC 5746, Section 3.2
+-				b.AddUint16(extensionRenegotiationInfo)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.secureRenegotiation)
+-					})
+-				})
+-			}
+-			if len(m.alpnProtocols) > 0 {
+-				// RFC 7301, Section 3.1
+-				b.AddUint16(extensionALPN)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, proto := range m.alpnProtocols {
+-							b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-								b.AddBytes([]byte(proto))
+-							})
+-						}
+-					})
+-				})
+-			}
+-			if m.scts {
+-				// RFC 6962, Section 3.3.1
+-				b.AddUint16(extensionSCT)
+-				b.AddUint16(0) // empty extension_data
+-			}
+-			if len(m.supportedVersions) > 0 {
+-				// RFC 8446, Section 4.2.1
+-				b.AddUint16(extensionSupportedVersions)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, vers := range m.supportedVersions {
+-							b.AddUint16(vers)
+-						}
+-					})
+-				})
+-			}
+-			if len(m.cookie) > 0 {
+-				// RFC 8446, Section 4.2.2
+-				b.AddUint16(extensionCookie)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.cookie)
+-					})
+-				})
+-			}
+-			if len(m.keyShares) > 0 {
+-				// RFC 8446, Section 4.2.8
+-				b.AddUint16(extensionKeyShare)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, ks := range m.keyShares {
+-							b.AddUint16(uint16(ks.group))
+-							b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-								b.AddBytes(ks.data)
+-							})
+-						}
+-					})
+-				})
+-			}
+-			if m.earlyData {
+-				// RFC 8446, Section 4.2.10
+-				b.AddUint16(extensionEarlyData)
+-				b.AddUint16(0) // empty extension_data
+-			}
+-			if len(m.pskModes) > 0 {
+-				// RFC 8446, Section 4.2.9
+-				b.AddUint16(extensionPSKModes)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.pskModes)
+-					})
+-				})
+-			}
+-			if len(m.pskIdentities) > 0 { // pre_shared_key must be the last extension
+-				// RFC 8446, Section 4.2.11
+-				b.AddUint16(extensionPreSharedKey)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, psk := range m.pskIdentities {
+-							b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-								b.AddBytes(psk.label)
+-							})
+-							b.AddUint32(psk.obfuscatedTicketAge)
+-						}
+-					})
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, binder := range m.pskBinders {
+-							b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-								b.AddBytes(binder)
+-							})
+-						}
+-					})
+-				})
+-			}
+-
+-			extensionsPresent = len(b.BytesOrPanic()) > 2
+-		})
+-
+-		if !extensionsPresent {
+-			*b = bWithoutExtensions
+-		}
+-	})
++		if len(extBytes) > 0 {
++			b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
++				b.AddBytes(extBytes)
++			})
++ 		}
++ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ // marshalWithoutBinders returns the ClientHello through the
+ // PreSharedKeyExtension.identities field, according to RFC 8446, Section
+ // 4.2.11.2. Note that m.pskBinders must be set to slices of the correct length.
+-func (m *clientHelloMsg) marshalWithoutBinders() []byte {
++func (m *clientHelloMsg) marshalWithoutBinders() ([]byte, error) {
+ 	bindersLen := 2 // uint16 length prefix
+ 	for _, binder := range m.pskBinders {
+ 		bindersLen += 1 // uint8 length prefix
+ 		bindersLen += len(binder)
+ 	}
+ 
+-	fullMessage := m.marshal()
+-	return fullMessage[:len(fullMessage)-bindersLen]
++	fullMessage, err := m.marshal()
++	if err != nil {
++		return nil, err
++	}
++	return fullMessage[:len(fullMessage)-bindersLen], nil
+ }
+ 
+ // updateBinders updates the m.pskBinders field, if necessary updating the
+ // cached marshaled representation. The supplied binders must have the same
+ // length as the current m.pskBinders.
+-func (m *clientHelloMsg) updateBinders(pskBinders [][]byte) {
++func (m *clientHelloMsg) updateBinders(pskBinders [][]byte) error {
+ 	if len(pskBinders) != len(m.pskBinders) {
+-		panic("tls: internal error: pskBinders length mismatch")
++		return errors.New("tls: internal error: pskBinders length mismatch")
+ 	}
+ 	for i := range m.pskBinders {
+ 		if len(pskBinders[i]) != len(m.pskBinders[i]) {
+-			panic("tls: internal error: pskBinders length mismatch")
++			return errors.New("tls: internal error: pskBinders length mismatch")
+ 		}
+ 	}
+ 	m.pskBinders = pskBinders
+ 	if m.raw != nil {
+-		lenWithoutBinders := len(m.marshalWithoutBinders())
++		helloBytes, err := m.marshalWithoutBinders()
++		if err != nil {
++			return err
++		}
++		lenWithoutBinders := len(helloBytes)
+ 		// TODO(filippo): replace with NewFixedBuilder once CL 148882 is imported.
+ 		b := cryptobyte.NewBuilder(m.raw[:lenWithoutBinders])
+ 		b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+@@ -339,9 +346,11 @@ func (m *clientHelloMsg) updateBinders(p
+ 			}
+ 		})
+ 		if len(b.BytesOrPanic()) != len(m.raw) {
+-			panic("tls: internal error: failed to update binders")
++			return errors.New("tls: internal error: failed to update binders")
+ 		}
+ 	}
++
++	return nil
+ }
+ 
+ func (m *clientHelloMsg) unmarshal(data []byte) bool {
+@@ -613,9 +622,98 @@ type serverHelloMsg struct {
+ 	selectedGroup CurveID
+ }
+ 
+-func (m *serverHelloMsg) marshal() []byte {
++func (m *serverHelloMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
++	}
++
++	var exts cryptobyte.Builder
++	if m.ocspStapling {
++		exts.AddUint16(extensionStatusRequest)
++		exts.AddUint16(0) // empty extension_data
++	}
++	if m.ticketSupported {
++		exts.AddUint16(extensionSessionTicket)
++		exts.AddUint16(0) // empty extension_data
++	}
++	if m.secureRenegotiationSupported {
++		exts.AddUint16(extensionRenegotiationInfo)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.secureRenegotiation)
++			})
++		})
++	}
++	if len(m.alpnProtocol) > 0 {
++		exts.AddUint16(extensionALPN)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++					exts.AddBytes([]byte(m.alpnProtocol))
++				})
++			})
++		})
++	}
++	if len(m.scts) > 0 {
++		exts.AddUint16(extensionSCT)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				for _, sct := range m.scts {
++					exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++						exts.AddBytes(sct)
++					})
++				}
++			})
++		})
++	}
++	if m.supportedVersion != 0 {
++		exts.AddUint16(extensionSupportedVersions)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16(m.supportedVersion)
++		})
++	}
++	if m.serverShare.group != 0 {
++		exts.AddUint16(extensionKeyShare)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16(uint16(m.serverShare.group))
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.serverShare.data)
++			})
++		})
++	}
++	if m.selectedIdentityPresent {
++		exts.AddUint16(extensionPreSharedKey)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16(m.selectedIdentity)
++		})
++	}
++
++	if len(m.cookie) > 0 {
++		exts.AddUint16(extensionCookie)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.cookie)
++			})
++		})
++	}
++	if m.selectedGroup != 0 {
++		exts.AddUint16(extensionKeyShare)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint16(uint16(m.selectedGroup))
++		})
++	}
++	if len(m.supportedPoints) > 0 {
++		exts.AddUint16(extensionSupportedPoints)
++		exts.AddUint16LengthPrefixed(func(exts *cryptobyte.Builder) {
++			exts.AddUint8LengthPrefixed(func(exts *cryptobyte.Builder) {
++				exts.AddBytes(m.supportedPoints)
++			})
++		})
++	}
++
++	extBytes, err := exts.Bytes()
++	if err != nil {
++		return nil, err
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -629,104 +727,15 @@ func (m *serverHelloMsg) marshal() []byt
+ 		b.AddUint16(m.cipherSuite)
+ 		b.AddUint8(m.compressionMethod)
+ 
+-		// If extensions aren't present, omit them.
+-		var extensionsPresent bool
+-		bWithoutExtensions := *b
+-
+-		b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-			if m.ocspStapling {
+-				b.AddUint16(extensionStatusRequest)
+-				b.AddUint16(0) // empty extension_data
+-			}
+-			if m.ticketSupported {
+-				b.AddUint16(extensionSessionTicket)
+-				b.AddUint16(0) // empty extension_data
+-			}
+-			if m.secureRenegotiationSupported {
+-				b.AddUint16(extensionRenegotiationInfo)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.secureRenegotiation)
+-					})
+-				})
+-			}
+-			if len(m.alpnProtocol) > 0 {
+-				b.AddUint16(extensionALPN)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-							b.AddBytes([]byte(m.alpnProtocol))
+-						})
+-					})
+-				})
+-			}
+-			if len(m.scts) > 0 {
+-				b.AddUint16(extensionSCT)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						for _, sct := range m.scts {
+-							b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-								b.AddBytes(sct)
+-							})
+-						}
+-					})
+-				})
+-			}
+-			if m.supportedVersion != 0 {
+-				b.AddUint16(extensionSupportedVersions)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16(m.supportedVersion)
+-				})
+-			}
+-			if m.serverShare.group != 0 {
+-				b.AddUint16(extensionKeyShare)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16(uint16(m.serverShare.group))
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.serverShare.data)
+-					})
+-				})
+-			}
+-			if m.selectedIdentityPresent {
+-				b.AddUint16(extensionPreSharedKey)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16(m.selectedIdentity)
+-				})
+-			}
+-
+-			if len(m.cookie) > 0 {
+-				b.AddUint16(extensionCookie)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.cookie)
+-					})
+-				})
+-			}
+-			if m.selectedGroup != 0 {
+-				b.AddUint16(extensionKeyShare)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint16(uint16(m.selectedGroup))
+-				})
+-			}
+-			if len(m.supportedPoints) > 0 {
+-				b.AddUint16(extensionSupportedPoints)
+-				b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
+-					b.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+-						b.AddBytes(m.supportedPoints)
+-					})
+-				})
+-			}
+-
+-			extensionsPresent = len(b.BytesOrPanic()) > 2
+-		})
+-
+-		if !extensionsPresent {
+-			*b = bWithoutExtensions
++		if len(extBytes) > 0 {
++			b.AddUint16LengthPrefixed(func(b *cryptobyte.Builder) {
++				b.AddBytes(extBytes)
++			})
+ 		}
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *serverHelloMsg) unmarshal(data []byte) bool {
+@@ -844,9 +853,9 @@ type encryptedExtensionsMsg struct {
+ 	alpnProtocol string
+ }
+ 
+-func (m *encryptedExtensionsMsg) marshal() []byte {
++func (m *encryptedExtensionsMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -866,8 +875,9 @@ func (m *encryptedExtensionsMsg) marshal
+ 		})
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *encryptedExtensionsMsg) unmarshal(data []byte) bool {
+@@ -915,10 +925,10 @@ func (m *encryptedExtensionsMsg) unmarsh
+ 
+ type endOfEarlyDataMsg struct{}
+ 
+-func (m *endOfEarlyDataMsg) marshal() []byte {
++func (m *endOfEarlyDataMsg) marshal() ([]byte, error) {
+ 	x := make([]byte, 4)
+ 	x[0] = typeEndOfEarlyData
+-	return x
++	return x, nil
+ }
+ 
+ func (m *endOfEarlyDataMsg) unmarshal(data []byte) bool {
+@@ -930,9 +940,9 @@ type keyUpdateMsg struct {
+ 	updateRequested bool
+ }
+ 
+-func (m *keyUpdateMsg) marshal() []byte {
++func (m *keyUpdateMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -945,8 +955,9 @@ func (m *keyUpdateMsg) marshal() []byte
+ 		}
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *keyUpdateMsg) unmarshal(data []byte) bool {
+@@ -978,9 +989,9 @@ type newSessionTicketMsgTLS13 struct {
+ 	maxEarlyData uint32
+ }
+ 
+-func (m *newSessionTicketMsgTLS13) marshal() []byte {
++func (m *newSessionTicketMsgTLS13) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -1005,8 +1016,9 @@ func (m *newSessionTicketMsgTLS13) marsh
+ 		})
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *newSessionTicketMsgTLS13) unmarshal(data []byte) bool {
+@@ -1059,9 +1071,9 @@ type certificateRequestMsgTLS13 struct {
+ 	certificateAuthorities           [][]byte
+ }
+ 
+-func (m *certificateRequestMsgTLS13) marshal() []byte {
++func (m *certificateRequestMsgTLS13) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -1120,8 +1132,9 @@ func (m *certificateRequestMsgTLS13) mar
+ 		})
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *certificateRequestMsgTLS13) unmarshal(data []byte) bool {
+@@ -1205,9 +1218,9 @@ type certificateMsg struct {
+ 	certificates [][]byte
+ }
+ 
+-func (m *certificateMsg) marshal() (x []byte) {
++func (m *certificateMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var i int
+@@ -1216,7 +1229,7 @@ func (m *certificateMsg) marshal() (x []
+ 	}
+ 
+ 	length := 3 + 3*len(m.certificates) + i
+-	x = make([]byte, 4+length)
++	x := make([]byte, 4+length)
+ 	x[0] = typeCertificate
+ 	x[1] = uint8(length >> 16)
+ 	x[2] = uint8(length >> 8)
+@@ -1237,7 +1250,7 @@ func (m *certificateMsg) marshal() (x []
+ 	}
+ 
+ 	m.raw = x
+-	return
++	return m.raw, nil
+ }
+ 
+ func (m *certificateMsg) unmarshal(data []byte) bool {
+@@ -1284,9 +1297,9 @@ type certificateMsgTLS13 struct {
+ 	scts         bool
+ }
+ 
+-func (m *certificateMsgTLS13) marshal() []byte {
++func (m *certificateMsgTLS13) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -1304,8 +1317,9 @@ func (m *certificateMsgTLS13) marshal()
+ 		marshalCertificate(b, certificate)
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func marshalCertificate(b *cryptobyte.Builder, certificate Certificate) {
+@@ -1428,9 +1442,9 @@ type serverKeyExchangeMsg struct {
+ 	key []byte
+ }
+ 
+-func (m *serverKeyExchangeMsg) marshal() []byte {
++func (m *serverKeyExchangeMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 	length := len(m.key)
+ 	x := make([]byte, length+4)
+@@ -1441,7 +1455,7 @@ func (m *serverKeyExchangeMsg) marshal()
+ 	copy(x[4:], m.key)
+ 
+ 	m.raw = x
+-	return x
++	return x, nil
+ }
+ 
+ func (m *serverKeyExchangeMsg) unmarshal(data []byte) bool {
+@@ -1458,9 +1472,9 @@ type certificateStatusMsg struct {
+ 	response []byte
+ }
+ 
+-func (m *certificateStatusMsg) marshal() []byte {
++func (m *certificateStatusMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -1472,8 +1486,9 @@ func (m *certificateStatusMsg) marshal()
+ 		})
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *certificateStatusMsg) unmarshal(data []byte) bool {
+@@ -1492,10 +1507,10 @@ func (m *certificateStatusMsg) unmarshal
+ 
+ type serverHelloDoneMsg struct{}
+ 
+-func (m *serverHelloDoneMsg) marshal() []byte {
++func (m *serverHelloDoneMsg) marshal() ([]byte, error) {
+ 	x := make([]byte, 4)
+ 	x[0] = typeServerHelloDone
+-	return x
++	return x, nil
+ }
+ 
+ func (m *serverHelloDoneMsg) unmarshal(data []byte) bool {
+@@ -1507,9 +1522,9 @@ type clientKeyExchangeMsg struct {
+ 	ciphertext []byte
+ }
+ 
+-func (m *clientKeyExchangeMsg) marshal() []byte {
++func (m *clientKeyExchangeMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 	length := len(m.ciphertext)
+ 	x := make([]byte, length+4)
+@@ -1520,7 +1535,7 @@ func (m *clientKeyExchangeMsg) marshal()
+ 	copy(x[4:], m.ciphertext)
+ 
+ 	m.raw = x
+-	return x
++	return x, nil
+ }
+ 
+ func (m *clientKeyExchangeMsg) unmarshal(data []byte) bool {
+@@ -1541,9 +1556,9 @@ type finishedMsg struct {
+ 	verifyData []byte
+ }
+ 
+-func (m *finishedMsg) marshal() []byte {
++func (m *finishedMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -1552,8 +1567,9 @@ func (m *finishedMsg) marshal() []byte {
+ 		b.AddBytes(m.verifyData)
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *finishedMsg) unmarshal(data []byte) bool {
+@@ -1575,9 +1591,9 @@ type certificateRequestMsg struct {
+ 	certificateAuthorities       [][]byte
+ }
+ 
+-func (m *certificateRequestMsg) marshal() (x []byte) {
++func (m *certificateRequestMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	// See RFC 4346, Section 7.4.4.
+@@ -1592,7 +1608,7 @@ func (m *certificateRequestMsg) marshal(
+ 		length += 2 + 2*len(m.supportedSignatureAlgorithms)
+ 	}
+ 
+-	x = make([]byte, 4+length)
++	x := make([]byte, 4+length)
+ 	x[0] = typeCertificateRequest
+ 	x[1] = uint8(length >> 16)
+ 	x[2] = uint8(length >> 8)
+@@ -1627,7 +1643,7 @@ func (m *certificateRequestMsg) marshal(
+ 	}
+ 
+ 	m.raw = x
+-	return
++	return m.raw, nil
+ }
+ 
+ func (m *certificateRequestMsg) unmarshal(data []byte) bool {
+@@ -1713,9 +1729,9 @@ type certificateVerifyMsg struct {
+ 	signature             []byte
+ }
+ 
+-func (m *certificateVerifyMsg) marshal() (x []byte) {
++func (m *certificateVerifyMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	var b cryptobyte.Builder
+@@ -1729,8 +1745,9 @@ func (m *certificateVerifyMsg) marshal()
+ 		})
+ 	})
+ 
+-	m.raw = b.BytesOrPanic()
+-	return m.raw
++	var err error
++	m.raw, err = b.Bytes()
++	return m.raw, err
+ }
+ 
+ func (m *certificateVerifyMsg) unmarshal(data []byte) bool {
+@@ -1753,15 +1770,15 @@ type newSessionTicketMsg struct {
+ 	ticket []byte
+ }
+ 
+-func (m *newSessionTicketMsg) marshal() (x []byte) {
++func (m *newSessionTicketMsg) marshal() ([]byte, error) {
+ 	if m.raw != nil {
+-		return m.raw
++		return m.raw, nil
+ 	}
+ 
+ 	// See RFC 5077, Section 3.3.
+ 	ticketLen := len(m.ticket)
+ 	length := 2 + 4 + ticketLen
+-	x = make([]byte, 4+length)
++	x := make([]byte, 4+length)
+ 	x[0] = typeNewSessionTicket
+ 	x[1] = uint8(length >> 16)
+ 	x[2] = uint8(length >> 8)
+@@ -1772,7 +1789,7 @@ func (m *newSessionTicketMsg) marshal()
+ 
+ 	m.raw = x
+ 
+-	return
++	return m.raw, nil
+ }
+ 
+ func (m *newSessionTicketMsg) unmarshal(data []byte) bool {
+@@ -1800,10 +1817,25 @@ func (m *newSessionTicketMsg) unmarshal(
+ type helloRequestMsg struct {
+ }
+ 
+-func (*helloRequestMsg) marshal() []byte {
+-	return []byte{typeHelloRequest, 0, 0, 0}
++func (*helloRequestMsg) marshal() ([]byte, error) {
++	return []byte{typeHelloRequest, 0, 0, 0}, nil
+ }
+ 
+ func (*helloRequestMsg) unmarshal(data []byte) bool {
+ 	return len(data) == 4
+ }
++
++type transcriptHash interface {
++	Write([]byte) (int, error)
++}
++
++// transcriptMsg is a helper used to marshal and hash messages which typically
++// are not written to the wire, and as such aren't hashed during Conn.writeRecord.
++func transcriptMsg(msg handshakeMessage, h transcriptHash) error {
++	data, err := msg.marshal()
++	if err != nil {
++		return err
++	}
++	h.Write(data)
++	return nil
++}
+--- go.orig/src/crypto/tls/handshake_messages_test.go
++++ go/src/crypto/tls/handshake_messages_test.go
+@@ -37,6 +37,15 @@ var tests = []interface{}{
+ 	&certificateMsgTLS13{},
+ }
+ 
++func mustMarshal(t *testing.T, msg handshakeMessage) []byte {
++	t.Helper()
++	b, err := msg.marshal()
++	if err != nil {
++		t.Fatal(err)
++	}
++	return b
++}
++
+ func TestMarshalUnmarshal(t *testing.T) {
+ 	rand := rand.New(rand.NewSource(time.Now().UnixNano()))
+ 
+@@ -55,7 +64,7 @@ func TestMarshalUnmarshal(t *testing.T)
+ 			}
+ 
+ 			m1 := v.Interface().(handshakeMessage)
+-			marshaled := m1.marshal()
++			marshaled := mustMarshal(t, m1)
+ 			m2 := iface.(handshakeMessage)
+ 			if !m2.unmarshal(marshaled) {
+ 				t.Errorf("#%d failed to unmarshal %#v %x", i, m1, marshaled)
+@@ -408,12 +417,12 @@ func TestRejectEmptySCTList(t *testing.T
+ 
+ 	var random [32]byte
+ 	sct := []byte{0x42, 0x42, 0x42, 0x42}
+-	serverHello := serverHelloMsg{
++	serverHello := &serverHelloMsg{
+ 		vers:   VersionTLS12,
+ 		random: random[:],
+ 		scts:   [][]byte{sct},
+ 	}
+-	serverHelloBytes := serverHello.marshal()
++	serverHelloBytes := mustMarshal(t, serverHello)
+ 
+ 	var serverHelloCopy serverHelloMsg
+ 	if !serverHelloCopy.unmarshal(serverHelloBytes) {
+@@ -451,12 +460,12 @@ func TestRejectEmptySCT(t *testing.T) {
+ 	// not be zero length.
+ 
+ 	var random [32]byte
+-	serverHello := serverHelloMsg{
++	serverHello := &serverHelloMsg{
+ 		vers:   VersionTLS12,
+ 		random: random[:],
+ 		scts:   [][]byte{nil},
+ 	}
+-	serverHelloBytes := serverHello.marshal()
++	serverHelloBytes := mustMarshal(t, serverHello)
+ 
+ 	var serverHelloCopy serverHelloMsg
+ 	if serverHelloCopy.unmarshal(serverHelloBytes) {
+--- go.orig/src/crypto/tls/handshake_server.go
++++ go/src/crypto/tls/handshake_server.go
+@@ -129,7 +129,9 @@ func (hs *serverHandshakeState) handshak
+ 
+ // readClientHello reads a ClientHello message and selects the protocol version.
+ func (c *Conn) readClientHello(ctx context.Context) (*clientHelloMsg, error) {
+-	msg, err := c.readHandshake()
++	// clientHelloMsg is included in the transcript, but we haven't initialized
++	// it yet. The respective handshake functions will record it themselves.
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -456,9 +458,10 @@ func (hs *serverHandshakeState) doResume
+ 	hs.hello.ticketSupported = hs.sessionState.usedOldKey
+ 	hs.finishedHash = newFinishedHash(c.vers, hs.suite)
+ 	hs.finishedHash.discardHandshakeBuffer()
+-	hs.finishedHash.Write(hs.clientHello.marshal())
+-	hs.finishedHash.Write(hs.hello.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, hs.hello.marshal()); err != nil {
++	if err := transcriptMsg(hs.clientHello, &hs.finishedHash); err != nil {
++		return err
++	}
++	if _, err := hs.c.writeHandshakeRecord(hs.hello, &hs.finishedHash); err != nil {
+ 		return err
+ 	}
+ 
+@@ -496,24 +499,23 @@ func (hs *serverHandshakeState) doFullHa
+ 		// certificates won't be used.
+ 		hs.finishedHash.discardHandshakeBuffer()
+ 	}
+-	hs.finishedHash.Write(hs.clientHello.marshal())
+-	hs.finishedHash.Write(hs.hello.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, hs.hello.marshal()); err != nil {
++	if err := transcriptMsg(hs.clientHello, &hs.finishedHash); err != nil {
++		return err
++	}
++	if _, err := hs.c.writeHandshakeRecord(hs.hello, &hs.finishedHash); err != nil {
+ 		return err
+ 	}
+ 
+ 	certMsg := new(certificateMsg)
+ 	certMsg.certificates = hs.cert.Certificate
+-	hs.finishedHash.Write(certMsg.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, certMsg.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(certMsg, &hs.finishedHash); err != nil {
+ 		return err
+ 	}
+ 
+ 	if hs.hello.ocspStapling {
+ 		certStatus := new(certificateStatusMsg)
+ 		certStatus.response = hs.cert.OCSPStaple
+-		hs.finishedHash.Write(certStatus.marshal())
+-		if _, err := c.writeRecord(recordTypeHandshake, certStatus.marshal()); err != nil {
++		if _, err := hs.c.writeHandshakeRecord(certStatus, &hs.finishedHash); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -525,8 +527,7 @@ func (hs *serverHandshakeState) doFullHa
+ 		return err
+ 	}
+ 	if skx != nil {
+-		hs.finishedHash.Write(skx.marshal())
+-		if _, err := c.writeRecord(recordTypeHandshake, skx.marshal()); err != nil {
++		if _, err := hs.c.writeHandshakeRecord(skx, &hs.finishedHash); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -552,15 +553,13 @@ func (hs *serverHandshakeState) doFullHa
+ 		if c.config.ClientCAs != nil {
+ 			certReq.certificateAuthorities = c.config.ClientCAs.Subjects()
+ 		}
+-		hs.finishedHash.Write(certReq.marshal())
+-		if _, err := c.writeRecord(recordTypeHandshake, certReq.marshal()); err != nil {
++		if _, err := hs.c.writeHandshakeRecord(certReq, &hs.finishedHash); err != nil {
+ 			return err
+ 		}
+ 	}
+ 
+ 	helloDone := new(serverHelloDoneMsg)
+-	hs.finishedHash.Write(helloDone.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, helloDone.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(helloDone, &hs.finishedHash); err != nil {
+ 		return err
+ 	}
+ 
+@@ -570,7 +569,7 @@ func (hs *serverHandshakeState) doFullHa
+ 
+ 	var pub crypto.PublicKey // public key for client auth, if any
+ 
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(&hs.finishedHash)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -583,7 +582,6 @@ func (hs *serverHandshakeState) doFullHa
+ 			c.sendAlert(alertUnexpectedMessage)
+ 			return unexpectedMessageError(certMsg, msg)
+ 		}
+-		hs.finishedHash.Write(certMsg.marshal())
+ 
+ 		if err := c.processCertsFromClient(Certificate{
+ 			Certificate: certMsg.certificates,
+@@ -594,7 +592,7 @@ func (hs *serverHandshakeState) doFullHa
+ 			pub = c.peerCertificates[0].PublicKey
+ 		}
+ 
+-		msg, err = c.readHandshake()
++		msg, err = c.readHandshake(&hs.finishedHash)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -612,7 +610,6 @@ func (hs *serverHandshakeState) doFullHa
+ 		c.sendAlert(alertUnexpectedMessage)
+ 		return unexpectedMessageError(ckx, msg)
+ 	}
+-	hs.finishedHash.Write(ckx.marshal())
+ 
+ 	preMasterSecret, err := keyAgreement.processClientKeyExchange(c.config, hs.cert, ckx, c.vers)
+ 	if err != nil {
+@@ -632,7 +629,10 @@ func (hs *serverHandshakeState) doFullHa
+ 	// to the client's certificate. This allows us to verify that the client is in
+ 	// possession of the private key of the certificate.
+ 	if len(c.peerCertificates) > 0 {
+-		msg, err = c.readHandshake()
++		// certificateVerifyMsg is included in the transcript, but not until
++		// after we verify the handshake signature, since the state before
++		// this message was sent is used.
++		msg, err = c.readHandshake(nil)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -667,7 +667,9 @@ func (hs *serverHandshakeState) doFullHa
+ 			return errors.New("tls: invalid signature by the client certificate: " + err.Error())
+ 		}
+ 
+-		hs.finishedHash.Write(certVerify.marshal())
++		if err := transcriptMsg(certVerify, &hs.finishedHash); err != nil {
++			return err
++		}
+ 	}
+ 
+ 	hs.finishedHash.discardHandshakeBuffer()
+@@ -707,7 +709,10 @@ func (hs *serverHandshakeState) readFini
+ 		return err
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	// finishedMsg is included in the transcript, but not until after we
++	// check the client version, since the state before this message was
++	// sent is used during verification.
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -724,7 +729,10 @@ func (hs *serverHandshakeState) readFini
+ 		return errors.New("tls: client's Finished message is incorrect")
+ 	}
+ 
+-	hs.finishedHash.Write(clientFinished.marshal())
++	if err := transcriptMsg(clientFinished, &hs.finishedHash); err != nil {
++		return err
++	}
++
+ 	copy(out, verify)
+ 	return nil
+ }
+@@ -758,14 +766,16 @@ func (hs *serverHandshakeState) sendSess
+ 		masterSecret: hs.masterSecret,
+ 		certificates: certsFromClient,
+ 	}
+-	var err error
+-	m.ticket, err = c.encryptTicket(state.marshal())
++	stateBytes, err := state.marshal()
++	if err != nil {
++		return err
++	}
++	m.ticket, err = c.encryptTicket(stateBytes)
+ 	if err != nil {
+ 		return err
+ 	}
+ 
+-	hs.finishedHash.Write(m.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, m.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(m, &hs.finishedHash); err != nil {
+ 		return err
+ 	}
+ 
+@@ -775,14 +785,13 @@ func (hs *serverHandshakeState) sendSess
+ func (hs *serverHandshakeState) sendFinished(out []byte) error {
+ 	c := hs.c
+ 
+-	if _, err := c.writeRecord(recordTypeChangeCipherSpec, []byte{1}); err != nil {
++	if err := c.writeChangeCipherRecord(); err != nil {
+ 		return err
+ 	}
+ 
+ 	finished := new(finishedMsg)
+ 	finished.verifyData = hs.finishedHash.serverSum(hs.masterSecret)
+-	hs.finishedHash.Write(finished.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, finished.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(finished, &hs.finishedHash); err != nil {
+ 		return err
+ 	}
+ 
+--- go.orig/src/crypto/tls/handshake_server_test.go
++++ go/src/crypto/tls/handshake_server_test.go
+@@ -30,6 +30,13 @@ func testClientHello(t *testing.T, serve
+ 	testClientHelloFailure(t, serverConfig, m, "")
+ }
+ 
++// testFatal is a hack to prevent the compiler from complaining that there is a
++// call to t.Fatal from a non-test goroutine
++func testFatal(t *testing.T, err error) {
++	t.Helper()
++	t.Fatal(err)
++}
++
+ func testClientHelloFailure(t *testing.T, serverConfig *Config, m handshakeMessage, expectedSubStr string) {
+ 	c, s := localPipe(t)
+ 	go func() {
+@@ -37,7 +44,9 @@ func testClientHelloFailure(t *testing.T
+ 		if ch, ok := m.(*clientHelloMsg); ok {
+ 			cli.vers = ch.vers
+ 		}
+-		cli.writeRecord(recordTypeHandshake, m.marshal())
++		if _, err := cli.writeHandshakeRecord(m, nil); err != nil {
++			testFatal(t, err)
++		}
+ 		c.Close()
+ 	}()
+ 	ctx := context.Background()
+@@ -194,7 +203,9 @@ func TestRenegotiationExtension(t *testi
+ 	go func() {
+ 		cli := Client(c, testConfig)
+ 		cli.vers = clientHello.vers
+-		cli.writeRecord(recordTypeHandshake, clientHello.marshal())
++		if _, err := cli.writeHandshakeRecord(clientHello, nil); err != nil {
++			testFatal(t, err)
++		}
+ 
+ 		buf := make([]byte, 1024)
+ 		n, err := c.Read(buf)
+@@ -253,8 +264,10 @@ func TestTLS12OnlyCipherSuites(t *testin
+ 	go func() {
+ 		cli := Client(c, testConfig)
+ 		cli.vers = clientHello.vers
+-		cli.writeRecord(recordTypeHandshake, clientHello.marshal())
+-		reply, err := cli.readHandshake()
++		if _, err := cli.writeHandshakeRecord(clientHello, nil); err != nil {
++			testFatal(t, err)
++		}
++		reply, err := cli.readHandshake(nil)
+ 		c.Close()
+ 		if err != nil {
+ 			replyChan <- err
+@@ -308,8 +321,10 @@ func TestTLSPointFormats(t *testing.T) {
+ 			go func() {
+ 				cli := Client(c, testConfig)
+ 				cli.vers = clientHello.vers
+-				cli.writeRecord(recordTypeHandshake, clientHello.marshal())
+-				reply, err := cli.readHandshake()
++				if _, err := cli.writeHandshakeRecord(clientHello, nil); err != nil {
++					testFatal(t, err)
++				}
++				reply, err := cli.readHandshake(nil)
+ 				c.Close()
+ 				if err != nil {
+ 					replyChan <- err
+@@ -1425,7 +1440,9 @@ func TestSNIGivenOnFailure(t *testing.T)
+ 	go func() {
+ 		cli := Client(c, testConfig)
+ 		cli.vers = clientHello.vers
+-		cli.writeRecord(recordTypeHandshake, clientHello.marshal())
++		if _, err := cli.writeHandshakeRecord(clientHello, nil); err != nil {
++			testFatal(t, err)
++		}
+ 		c.Close()
+ 	}()
+ 	conn := Server(s, serverConfig)
+--- go.orig/src/crypto/tls/handshake_server_tls13.go
++++ go/src/crypto/tls/handshake_server_tls13.go
+@@ -298,7 +298,12 @@ func (hs *serverHandshakeStateTLS13) che
+ 			c.sendAlert(alertInternalError)
+ 			return errors.New("tls: internal error: failed to clone hash")
+ 		}
+-		transcript.Write(hs.clientHello.marshalWithoutBinders())
++		clientHelloBytes, err := hs.clientHello.marshalWithoutBinders()
++		if err != nil {
++			c.sendAlert(alertInternalError)
++			return err
++		}
++		transcript.Write(clientHelloBytes)
+ 		pskBinder := hs.suite.finishedHash(binderKey, transcript)
+ 		if !hmac.Equal(hs.clientHello.pskBinders[i], pskBinder) {
+ 			c.sendAlert(alertDecryptError)
+@@ -389,8 +394,7 @@ func (hs *serverHandshakeStateTLS13) sen
+ 	}
+ 	hs.sentDummyCCS = true
+ 
+-	_, err := hs.c.writeRecord(recordTypeChangeCipherSpec, []byte{1})
+-	return err
++	return hs.c.writeChangeCipherRecord()
+ }
+ 
+ func (hs *serverHandshakeStateTLS13) doHelloRetryRequest(selectedGroup CurveID) error {
+@@ -398,7 +402,9 @@ func (hs *serverHandshakeStateTLS13) doH
+ 
+ 	// The first ClientHello gets double-hashed into the transcript upon a
+ 	// HelloRetryRequest. See RFC 8446, Section 4.4.1.
+-	hs.transcript.Write(hs.clientHello.marshal())
++	if err := transcriptMsg(hs.clientHello, hs.transcript); err != nil {
++		return err
++	}
+ 	chHash := hs.transcript.Sum(nil)
+ 	hs.transcript.Reset()
+ 	hs.transcript.Write([]byte{typeMessageHash, 0, 0, uint8(len(chHash))})
+@@ -414,8 +420,7 @@ func (hs *serverHandshakeStateTLS13) doH
+ 		selectedGroup:     selectedGroup,
+ 	}
+ 
+-	hs.transcript.Write(helloRetryRequest.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, helloRetryRequest.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(helloRetryRequest, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -423,7 +428,8 @@ func (hs *serverHandshakeStateTLS13) doH
+ 		return err
+ 	}
+ 
+-	msg, err := c.readHandshake()
++	// clientHelloMsg is not included in the transcript.
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -514,9 +520,10 @@ func illegalClientHelloChange(ch, ch1 *c
+ func (hs *serverHandshakeStateTLS13) sendServerParameters() error {
+ 	c := hs.c
+ 
+-	hs.transcript.Write(hs.clientHello.marshal())
+-	hs.transcript.Write(hs.hello.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, hs.hello.marshal()); err != nil {
++	if err := transcriptMsg(hs.clientHello, hs.transcript); err != nil {
++		return err
++	}
++	if _, err := hs.c.writeHandshakeRecord(hs.hello, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -559,8 +566,7 @@ func (hs *serverHandshakeStateTLS13) sen
+ 	encryptedExtensions.alpnProtocol = selectedProto
+ 	c.clientProtocol = selectedProto
+ 
+-	hs.transcript.Write(encryptedExtensions.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, encryptedExtensions.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(encryptedExtensions, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -589,8 +595,7 @@ func (hs *serverHandshakeStateTLS13) sen
+ 			certReq.certificateAuthorities = c.config.ClientCAs.Subjects()
+ 		}
+ 
+-		hs.transcript.Write(certReq.marshal())
+-		if _, err := c.writeRecord(recordTypeHandshake, certReq.marshal()); err != nil {
++		if _, err := hs.c.writeHandshakeRecord(certReq, hs.transcript); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -601,8 +606,7 @@ func (hs *serverHandshakeStateTLS13) sen
+ 	certMsg.scts = hs.clientHello.scts && len(hs.cert.SignedCertificateTimestamps) > 0
+ 	certMsg.ocspStapling = hs.clientHello.ocspStapling && len(hs.cert.OCSPStaple) > 0
+ 
+-	hs.transcript.Write(certMsg.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, certMsg.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(certMsg, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -633,8 +637,7 @@ func (hs *serverHandshakeStateTLS13) sen
+ 	}
+ 	certVerifyMsg.signature = sig
+ 
+-	hs.transcript.Write(certVerifyMsg.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, certVerifyMsg.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(certVerifyMsg, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -648,8 +651,7 @@ func (hs *serverHandshakeStateTLS13) sen
+ 		verifyData: hs.suite.finishedHash(c.out.trafficSecret, hs.transcript),
+ 	}
+ 
+-	hs.transcript.Write(finished.marshal())
+-	if _, err := c.writeRecord(recordTypeHandshake, finished.marshal()); err != nil {
++	if _, err := hs.c.writeHandshakeRecord(finished, hs.transcript); err != nil {
+ 		return err
+ 	}
+ 
+@@ -710,7 +712,9 @@ func (hs *serverHandshakeStateTLS13) sen
+ 	finishedMsg := &finishedMsg{
+ 		verifyData: hs.clientFinished,
+ 	}
+-	hs.transcript.Write(finishedMsg.marshal())
++	if err := transcriptMsg(finishedMsg, hs.transcript); err != nil {
++		return err
++	}
+ 
+ 	if !hs.shouldSendSessionTickets() {
+ 		return nil
+@@ -735,8 +739,12 @@ func (hs *serverHandshakeStateTLS13) sen
+ 			SignedCertificateTimestamps: c.scts,
+ 		},
+ 	}
+-	var err error
+-	m.label, err = c.encryptTicket(state.marshal())
++	stateBytes, err := state.marshal()
++	if err != nil {
++		c.sendAlert(alertInternalError)
++		return err
++	}
++	m.label, err = c.encryptTicket(stateBytes)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -755,7 +763,7 @@ func (hs *serverHandshakeStateTLS13) sen
+ 	// ticket_nonce, which must be unique per connection, is always left at
+ 	// zero because we only ever send one ticket per connection.
+ 
+-	if _, err := c.writeRecord(recordTypeHandshake, m.marshal()); err != nil {
++	if _, err := c.writeHandshakeRecord(m, nil); err != nil {
+ 		return err
+ 	}
+ 
+@@ -780,7 +788,7 @@ func (hs *serverHandshakeStateTLS13) rea
+ 	// If we requested a client certificate, then the client must send a
+ 	// certificate message. If it's empty, no CertificateVerify is sent.
+ 
+-	msg, err := c.readHandshake()
++	msg, err := c.readHandshake(hs.transcript)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -790,7 +798,6 @@ func (hs *serverHandshakeStateTLS13) rea
+ 		c.sendAlert(alertUnexpectedMessage)
+ 		return unexpectedMessageError(certMsg, msg)
+ 	}
+-	hs.transcript.Write(certMsg.marshal())
+ 
+ 	if err := c.processCertsFromClient(certMsg.certificate); err != nil {
+ 		return err
+@@ -804,7 +811,10 @@ func (hs *serverHandshakeStateTLS13) rea
+ 	}
+ 
+ 	if len(certMsg.certificate.Certificate) != 0 {
+-		msg, err = c.readHandshake()
++		// certificateVerifyMsg is included in the transcript, but not until
++		// after we verify the handshake signature, since the state before
++		// this message was sent is used.
++		msg, err = c.readHandshake(nil)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -835,7 +845,9 @@ func (hs *serverHandshakeStateTLS13) rea
+ 			return errors.New("tls: invalid signature by the client certificate: " + err.Error())
+ 		}
+ 
+-		hs.transcript.Write(certVerify.marshal())
++		if err := transcriptMsg(certVerify, hs.transcript); err != nil {
++			return err
++		}
+ 	}
+ 
+ 	// If we waited until the client certificates to send session tickets, we
+@@ -850,7 +862,8 @@ func (hs *serverHandshakeStateTLS13) rea
+ func (hs *serverHandshakeStateTLS13) readClientFinished() error {
+ 	c := hs.c
+ 
+-	msg, err := c.readHandshake()
++	// finishedMsg is not included in the transcript.
++	msg, err := c.readHandshake(nil)
+ 	if err != nil {
+ 		return err
+ 	}
+--- go.orig/src/crypto/tls/key_schedule.go
++++ go/src/crypto/tls/key_schedule.go
+@@ -8,6 +8,7 @@ import (
+ 	"crypto/elliptic"
+ 	"crypto/hmac"
+ 	"errors"
++	"fmt"
+ 	"hash"
+ 	"io"
+ 	"math/big"
+@@ -42,8 +43,24 @@ func (c *cipherSuiteTLS13) expandLabel(s
+ 	hkdfLabel.AddUint8LengthPrefixed(func(b *cryptobyte.Builder) {
+ 		b.AddBytes(context)
+ 	})
++	hkdfLabelBytes, err := hkdfLabel.Bytes()
++	if err != nil {
++		// Rather than calling BytesOrPanic, we explicitly handle this error, in
++		// order to provide a reasonable error message. It should be basically
++		// impossible for this to panic, and routing errors back through the
++		// tree rooted in this function is quite painful. The labels are fixed
++		// size, and the context is either a fixed-length computed hash, or
++		// parsed from a field which has the same length limitation. As such, an
++		// error here is likely to only be caused during development.
++		//
++		// NOTE: another reasonable approach here might be to return a
++		// randomized slice if we encounter an error, which would break the
++		// connection, but avoid panicking. This would perhaps be safer but
++		// significantly more confusing to users.
++		panic(fmt.Errorf("failed to construct HKDF label: %s", err))
++	}
+ 	out := make([]byte, length)
+-	n, err := hkdf.Expand(c.hash.New, secret, hkdfLabel.BytesOrPanic()).Read(out)
++	n, err := hkdf.Expand(c.hash.New, secret, hkdfLabelBytes).Read(out)
+ 	if err != nil || n != length {
+ 		panic("tls: HKDF-Expand-Label invocation failed unexpectedly")
+ 	}
+--- go.orig/src/crypto/tls/ticket.go
++++ go/src/crypto/tls/ticket.go
+@@ -32,7 +32,7 @@ type sessionState struct {
+ 	usedOldKey bool
+ }
+ 
+-func (m *sessionState) marshal() []byte {
++func (m *sessionState) marshal() ([]byte, error) {
+ 	var b cryptobyte.Builder
+ 	b.AddUint16(m.vers)
+ 	b.AddUint16(m.cipherSuite)
+@@ -47,7 +47,7 @@ func (m *sessionState) marshal() []byte
+ 			})
+ 		}
+ 	})
+-	return b.BytesOrPanic()
++	return b.Bytes()
+ }
+ 
+ func (m *sessionState) unmarshal(data []byte) bool {
+@@ -86,7 +86,7 @@ type sessionStateTLS13 struct {
+ 	certificate      Certificate // CertificateEntry certificate_list<0..2^24-1>;
+ }
+ 
+-func (m *sessionStateTLS13) marshal() []byte {
++func (m *sessionStateTLS13) marshal() ([]byte, error) {
+ 	var b cryptobyte.Builder
+ 	b.AddUint16(VersionTLS13)
+ 	b.AddUint8(0) // revision
+@@ -96,7 +96,7 @@ func (m *sessionStateTLS13) marshal() []
+ 		b.AddBytes(m.resumptionSecret)
+ 	})
+ 	marshalCertificate(&b, m.certificate)
+-	return b.BytesOrPanic()
++	return b.Bytes()
+ }
+ 
+ func (m *sessionStateTLS13) unmarshal(data []byte) bool {
diff --git a/meta/recipes-devtools/go/go-1.19/cve-2022-41725.patch b/meta/recipes-devtools/go/go-1.19/cve-2022-41725.patch
new file mode 100644
index 0000000000..a71d07e3f1
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/cve-2022-41725.patch
@@ -0,0 +1,652 @@
+From 5c55ac9bf1e5f779220294c843526536605f42ab Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 25 Jan 2023 09:27:01 -0800
+Subject: [PATCH] [release-branch.go1.19] mime/multipart: limit memory/inode
+ consumption of ReadForm
+
+Reader.ReadForm is documented as storing "up to maxMemory bytes + 10MB"
+in memory. Parsed forms can consume substantially more memory than
+this limit, since ReadForm does not account for map entry overhead
+and MIME headers.
+
+In addition, while the amount of disk memory consumed by ReadForm can
+be constrained by limiting the size of the parsed input, ReadForm will
+create one temporary file per form part stored on disk, potentially
+consuming a large number of inodes.
+
+Update ReadForm's memory accounting to include part names,
+MIME headers, and map entry overhead.
+
+Update ReadForm to store all on-disk file parts in a single
+temporary file.
+
+Files returned by FileHeader.Open are documented as having a concrete
+type of *os.File when a file is stored on disk. The change to use a
+single temporary file for all parts means that this is no longer the
+case when a form contains more than a single file part stored on disk.
+
+The previous behavior of storing each file part in a separate disk
+file may be reenabled with GODEBUG=multipartfiles=distinct.
+
+Update Reader.NextPart and Reader.NextRawPart to set a 10MiB cap
+on the size of MIME headers.
+
+Thanks to Jakob Ackermann (@das7pad) for reporting this issue.
+
+Updates #58006
+Fixes #58362
+Fixes CVE-2022-41725
+
+Change-Id: Ibd780a6c4c83ac8bcfd3cbe344f042e9940f2eab
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1714276
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+(cherry picked from commit ed4664330edcd91b24914c9371c377c132dbce8c)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1728949
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/468116
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Than McIntosh <thanm@google.com>
+Run-TryBot: Michael Pratt <mpratt@google.com>
+Auto-Submit: Michael Pratt <mpratt@google.com>
+---
+
+CVE: CVE-2022-41725
+
+Upstream-Status: Backport [see text]
+
+https://github.com/golong/go.git commit 5c55ac9bf1e5...
+modified for reader.go
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+___
+ src/mime/multipart/formdata.go       | 132 ++++++++++++++++++++-----
+ src/mime/multipart/formdata_test.go  | 140 ++++++++++++++++++++++++++-
+ src/mime/multipart/multipart.go      |  25 +++--
+ src/mime/multipart/readmimeheader.go |  14 +++
+ src/net/http/request_test.go         |   2 +-
+ src/net/textproto/reader.go          |  20 +++-
+ 6 files changed, 295 insertions(+), 38 deletions(-)
+ create mode 100644 src/mime/multipart/readmimeheader.go
+
+--- go.orig/src/mime/multipart/formdata.go
++++ go/src/mime/multipart/formdata.go
+@@ -7,6 +7,7 @@ package multipart
+ import (
+ 	"bytes"
+ 	"errors"
++	"internal/godebug"
+ 	"io"
+ 	"math"
+ 	"net/textproto"
+@@ -33,23 +34,58 @@ func (r *Reader) ReadForm(maxMemory int6
+ 
+ func (r *Reader) readForm(maxMemory int64) (_ *Form, err error) {
+ 	form := &Form{make(map[string][]string), make(map[string][]*FileHeader)}
++	var (
++		file    *os.File
++		fileOff int64
++	)
++	numDiskFiles := 0
++	multipartFiles := godebug.Get("multipartfiles")
++	combineFiles := multipartFiles != "distinct"
+ 	defer func() {
++		if file != nil {
++			if cerr := file.Close(); err == nil {
++				err = cerr
++			}
++		}
++		if combineFiles && numDiskFiles > 1 {
++			for _, fhs := range form.File {
++				for _, fh := range fhs {
++					fh.tmpshared = true
++				}
++			}
++		}
+ 		if err != nil {
+ 			form.RemoveAll()
++			if file != nil {
++				os.Remove(file.Name())
++			}
+ 		}
+ 	}()
+ 
+-	// Reserve an additional 10 MB for non-file parts.
+-	maxValueBytes := maxMemory + int64(10<<20)
+-	if maxValueBytes <= 0 {
++	// maxFileMemoryBytes is the maximum bytes of file data we will store in memory.
++	// Data past this limit is written to disk.
++	// This limit strictly applies to content, not metadata (filenames, MIME headers, etc.),
++	// since metadata is always stored in memory, not disk.
++	//
++	// maxMemoryBytes is the maximum bytes we will store in memory, including file content,
++	// non-file part values, metdata, and map entry overhead.
++	//
++	// We reserve an additional 10 MB in maxMemoryBytes for non-file data.
++	//
++	// The relationship between these parameters, as well as the overly-large and
++	// unconfigurable 10 MB added on to maxMemory, is unfortunate but difficult to change
++	// within the constraints of the API as documented.
++	maxFileMemoryBytes := maxMemory
++	maxMemoryBytes := maxMemory + int64(10<<20)
++	if maxMemoryBytes <= 0 {
+ 		if maxMemory < 0 {
+-			maxValueBytes = 0
++			maxMemoryBytes = 0
+ 		} else {
+-			maxValueBytes = math.MaxInt64
++			maxMemoryBytes = math.MaxInt64
+ 		}
+ 	}
+ 	for {
+-		p, err := r.NextPart()
++		p, err := r.nextPart(false, maxMemoryBytes)
+ 		if err == io.EOF {
+ 			break
+ 		}
+@@ -63,16 +99,27 @@ func (r *Reader) readForm(maxMemory int6
+ 		}
+ 		filename := p.FileName()
+ 
++		// Multiple values for the same key (one map entry, longer slice) are cheaper
++		// than the same number of values for different keys (many map entries), but
++		// using a consistent per-value cost for overhead is simpler.
++		maxMemoryBytes -= int64(len(name))
++		maxMemoryBytes -= 100 // map overhead
++		if maxMemoryBytes < 0 {
++			// We can't actually take this path, since nextPart would already have
++			// rejected the MIME headers for being too large. Check anyway.
++			return nil, ErrMessageTooLarge
++		}
++
+ 		var b bytes.Buffer
+ 
+ 		if filename == "" {
+ 			// value, store as string in memory
+-			n, err := io.CopyN(&b, p, maxValueBytes+1)
++			n, err := io.CopyN(&b, p, maxMemoryBytes+1)
+ 			if err != nil && err != io.EOF {
+ 				return nil, err
+ 			}
+-			maxValueBytes -= n
+-			if maxValueBytes < 0 {
++			maxMemoryBytes -= n
++			if maxMemoryBytes < 0 {
+ 				return nil, ErrMessageTooLarge
+ 			}
+ 			form.Value[name] = append(form.Value[name], b.String())
+@@ -80,35 +127,45 @@ func (r *Reader) readForm(maxMemory int6
+ 		}
+ 
+ 		// file, store in memory or on disk
++		maxMemoryBytes -= mimeHeaderSize(p.Header)
++		if maxMemoryBytes < 0 {
++			return nil, ErrMessageTooLarge
++		}
+ 		fh := &FileHeader{
+ 			Filename: filename,
+ 			Header:   p.Header,
+ 		}
+-		n, err := io.CopyN(&b, p, maxMemory+1)
++		n, err := io.CopyN(&b, p, maxFileMemoryBytes+1)
+ 		if err != nil && err != io.EOF {
+ 			return nil, err
+ 		}
+-		if n > maxMemory {
+-			// too big, write to disk and flush buffer
+-			file, err := os.CreateTemp("", "multipart-")
+-			if err != nil {
+-				return nil, err
++		if n > maxFileMemoryBytes {
++			if file == nil {
++				file, err = os.CreateTemp(r.tempDir, "multipart-")
++				if err != nil {
++					return nil, err
++				}
+ 			}
++			numDiskFiles++
+ 			size, err := io.Copy(file, io.MultiReader(&b, p))
+-			if cerr := file.Close(); err == nil {
+-				err = cerr
+-			}
+ 			if err != nil {
+-				os.Remove(file.Name())
+ 				return nil, err
+ 			}
+ 			fh.tmpfile = file.Name()
+ 			fh.Size = size
++			fh.tmpoff = fileOff
++			fileOff += size
++			if !combineFiles {
++				if err := file.Close(); err != nil {
++					return nil, err
++				}
++				file = nil
++			}
+ 		} else {
+ 			fh.content = b.Bytes()
+ 			fh.Size = int64(len(fh.content))
+-			maxMemory -= n
+-			maxValueBytes -= n
++			maxFileMemoryBytes -= n
++			maxMemoryBytes -= n
+ 		}
+ 		form.File[name] = append(form.File[name], fh)
+ 	}
+@@ -116,6 +173,17 @@ func (r *Reader) readForm(maxMemory int6
+ 	return form, nil
+ }
+ 
++func mimeHeaderSize(h textproto.MIMEHeader) (size int64) {
++	for k, vs := range h {
++		size += int64(len(k))
++		size += 100 // map entry overhead
++		for _, v := range vs {
++			size += int64(len(v))
++		}
++	}
++	return size
++}
++
+ // Form is a parsed multipart form.
+ // Its File parts are stored either in memory or on disk,
+ // and are accessible via the *FileHeader's Open method.
+@@ -133,7 +201,7 @@ func (f *Form) RemoveAll() error {
+ 		for _, fh := range fhs {
+ 			if fh.tmpfile != "" {
+ 				e := os.Remove(fh.tmpfile)
+-				if e != nil && err == nil {
++				if e != nil && !errors.Is(e, os.ErrNotExist) && err == nil {
+ 					err = e
+ 				}
+ 			}
+@@ -148,15 +216,25 @@ type FileHeader struct {
+ 	Header   textproto.MIMEHeader
+ 	Size     int64
+ 
+-	content []byte
+-	tmpfile string
++	content   []byte
++	tmpfile   string
++	tmpoff    int64
++	tmpshared bool
+ }
+ 
+ // Open opens and returns the FileHeader's associated File.
+ func (fh *FileHeader) Open() (File, error) {
+ 	if b := fh.content; b != nil {
+ 		r := io.NewSectionReader(bytes.NewReader(b), 0, int64(len(b)))
+-		return sectionReadCloser{r}, nil
++		return sectionReadCloser{r, nil}, nil
++	}
++	if fh.tmpshared {
++		f, err := os.Open(fh.tmpfile)
++		if err != nil {
++			return nil, err
++		}
++		r := io.NewSectionReader(f, fh.tmpoff, fh.Size)
++		return sectionReadCloser{r, f}, nil
+ 	}
+ 	return os.Open(fh.tmpfile)
+ }
+@@ -175,8 +253,12 @@ type File interface {
+ 
+ type sectionReadCloser struct {
+ 	*io.SectionReader
++	io.Closer
+ }
+ 
+ func (rc sectionReadCloser) Close() error {
++	if rc.Closer != nil {
++		return rc.Closer.Close()
++	}
+ 	return nil
+ }
+--- go.orig/src/mime/multipart/formdata_test.go
++++ go/src/mime/multipart/formdata_test.go
+@@ -6,8 +6,10 @@ package multipart
+ 
+ import (
+ 	"bytes"
++	"fmt"
+ 	"io"
+ 	"math"
++	"net/textproto"
+ 	"os"
+ 	"strings"
+ 	"testing"
+@@ -208,8 +210,8 @@ Content-Disposition: form-data; name="la
+ 		maxMemory int64
+ 		err       error
+ 	}{
+-		{"smaller", 50, nil},
+-		{"exact-fit", 25, nil},
++		{"smaller", 50 + int64(len("largetext")) + 100, nil},
++		{"exact-fit", 25 + int64(len("largetext")) + 100, nil},
+ 		{"too-large", 0, ErrMessageTooLarge},
+ 	}
+ 	for _, tc := range testCases {
+@@ -224,7 +226,7 @@ Content-Disposition: form-data; name="la
+ 				defer f.RemoveAll()
+ 			}
+ 			if tc.err != err {
+-				t.Fatalf("ReadForm error - got: %v; expected: %v", tc.err, err)
++				t.Fatalf("ReadForm error - got: %v; expected: %v", err, tc.err)
+ 			}
+ 			if err == nil {
+ 				if g := f.Value["largetext"][0]; g != largeTextValue {
+@@ -234,3 +236,135 @@ Content-Disposition: form-data; name="la
+ 		})
+ 	}
+ }
++
++// TestReadForm_MetadataTooLarge verifies that we account for the size of field names,
++// MIME headers, and map entry overhead while limiting the memory consumption of parsed forms.
++func TestReadForm_MetadataTooLarge(t *testing.T) {
++	for _, test := range []struct {
++		name string
++		f    func(*Writer)
++	}{{
++		name: "large name",
++		f: func(fw *Writer) {
++			name := strings.Repeat("a", 10<<20)
++			w, _ := fw.CreateFormField(name)
++			w.Write([]byte("value"))
++		},
++	}, {
++		name: "large MIME header",
++		f: func(fw *Writer) {
++			h := make(textproto.MIMEHeader)
++			h.Set("Content-Disposition", `form-data; name="a"`)
++			h.Set("X-Foo", strings.Repeat("a", 10<<20))
++			w, _ := fw.CreatePart(h)
++			w.Write([]byte("value"))
++		},
++	}, {
++		name: "many parts",
++		f: func(fw *Writer) {
++			for i := 0; i < 110000; i++ {
++				w, _ := fw.CreateFormField("f")
++				w.Write([]byte("v"))
++			}
++		},
++	}} {
++		t.Run(test.name, func(t *testing.T) {
++			var buf bytes.Buffer
++			fw := NewWriter(&buf)
++			test.f(fw)
++			if err := fw.Close(); err != nil {
++				t.Fatal(err)
++			}
++			fr := NewReader(&buf, fw.Boundary())
++			_, err := fr.ReadForm(0)
++			if err != ErrMessageTooLarge {
++				t.Errorf("fr.ReadForm() = %v, want ErrMessageTooLarge", err)
++			}
++		})
++	}
++}
++
++// TestReadForm_ManyFiles_Combined tests that a multipart form containing many files only
++// results in a single on-disk file.
++func TestReadForm_ManyFiles_Combined(t *testing.T) {
++	const distinct = false
++	testReadFormManyFiles(t, distinct)
++}
++
++// TestReadForm_ManyFiles_Distinct tests that setting GODEBUG=multipartfiles=distinct
++// results in every file in a multipart form being placed in a distinct on-disk file.
++func TestReadForm_ManyFiles_Distinct(t *testing.T) {
++	t.Setenv("GODEBUG", "multipartfiles=distinct")
++	const distinct = true
++	testReadFormManyFiles(t, distinct)
++}
++
++func testReadFormManyFiles(t *testing.T, distinct bool) {
++	var buf bytes.Buffer
++	fw := NewWriter(&buf)
++	const numFiles = 10
++	for i := 0; i < numFiles; i++ {
++		name := fmt.Sprint(i)
++		w, err := fw.CreateFormFile(name, name)
++		if err != nil {
++			t.Fatal(err)
++		}
++		w.Write([]byte(name))
++	}
++	if err := fw.Close(); err != nil {
++		t.Fatal(err)
++	}
++	fr := NewReader(&buf, fw.Boundary())
++	fr.tempDir = t.TempDir()
++	form, err := fr.ReadForm(0)
++	if err != nil {
++		t.Fatal(err)
++	}
++	for i := 0; i < numFiles; i++ {
++		name := fmt.Sprint(i)
++		if got := len(form.File[name]); got != 1 {
++			t.Fatalf("form.File[%q] has %v entries, want 1", name, got)
++		}
++		fh := form.File[name][0]
++		file, err := fh.Open()
++		if err != nil {
++			t.Fatalf("form.File[%q].Open() = %v", name, err)
++		}
++		if distinct {
++			if _, ok := file.(*os.File); !ok {
++				t.Fatalf("form.File[%q].Open: %T, want *os.File", name, file)
++			}
++		}
++		got, err := io.ReadAll(file)
++		file.Close()
++		if string(got) != name || err != nil {
++			t.Fatalf("read form.File[%q]: %q, %v; want %q, nil", name, string(got), err, name)
++		}
++	}
++	dir, err := os.Open(fr.tempDir)
++	if err != nil {
++		t.Fatal(err)
++	}
++	defer dir.Close()
++	names, err := dir.Readdirnames(0)
++	if err != nil {
++		t.Fatal(err)
++	}
++	wantNames := 1
++	if distinct {
++		wantNames = numFiles
++	}
++	if len(names) != wantNames {
++		t.Fatalf("temp dir contains %v files; want 1", len(names))
++	}
++	if err := form.RemoveAll(); err != nil {
++		t.Fatalf("form.RemoveAll() = %v", err)
++	}
++	names, err = dir.Readdirnames(0)
++	if err != nil {
++		t.Fatal(err)
++	}
++	if len(names) != 0 {
++		t.Fatalf("temp dir contains %v files; want 0", len(names))
++	}
++}
+--- go.orig/src/mime/multipart/multipart.go
++++ go/src/mime/multipart/multipart.go
+@@ -128,12 +128,12 @@ func (r *stickyErrorReader) Read(p []byt
+ 	return n, r.err
+ }
+ 
+-func newPart(mr *Reader, rawPart bool) (*Part, error) {
++func newPart(mr *Reader, rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
+ 	bp := &Part{
+ 		Header: make(map[string][]string),
+ 		mr:     mr,
+ 	}
+-	if err := bp.populateHeaders(); err != nil {
++	if err := bp.populateHeaders(maxMIMEHeaderSize); err != nil {
+ 		return nil, err
+ 	}
+ 	bp.r = partReader{bp}
+@@ -149,12 +149,16 @@ func newPart(mr *Reader, rawPart bool) (
+ 	return bp, nil
+ }
+ 
+-func (bp *Part) populateHeaders() error {
++func (bp *Part) populateHeaders(maxMIMEHeaderSize int64) error {
+ 	r := textproto.NewReader(bp.mr.bufReader)
+-	header, err := r.ReadMIMEHeader()
++	header, err := readMIMEHeader(r, maxMIMEHeaderSize)
+ 	if err == nil {
+ 		bp.Header = header
+ 	}
++	// TODO: Add a distinguishable error to net/textproto.
++	if err != nil && err.Error() == "message too large" {
++		err = ErrMessageTooLarge
++	}
+ 	return err
+ }
+ 
+@@ -294,6 +298,7 @@ func (p *Part) Close() error {
+ // isn't supported.
+ type Reader struct {
+ 	bufReader *bufio.Reader
++	tempDir   string // used in tests
+ 
+ 	currentPart *Part
+ 	partsRead   int
+@@ -304,6 +309,10 @@ type Reader struct {
+ 	dashBoundary     []byte // "--boundary"
+ }
+ 
++// maxMIMEHeaderSize is the maximum size of a MIME header we will parse,
++// including header keys, values, and map overhead.
++const maxMIMEHeaderSize = 10 << 20
++
+ // NextPart returns the next part in the multipart or an error.
+ // When there are no more parts, the error io.EOF is returned.
+ //
+@@ -311,7 +320,7 @@ type Reader struct {
+ // has a value of "quoted-printable", that header is instead
+ // hidden and the body is transparently decoded during Read calls.
+ func (r *Reader) NextPart() (*Part, error) {
+-	return r.nextPart(false)
++	return r.nextPart(false, maxMIMEHeaderSize)
+ }
+ 
+ // NextRawPart returns the next part in the multipart or an error.
+@@ -320,10 +329,10 @@ func (r *Reader) NextPart() (*Part, erro
+ // Unlike NextPart, it does not have special handling for
+ // "Content-Transfer-Encoding: quoted-printable".
+ func (r *Reader) NextRawPart() (*Part, error) {
+-	return r.nextPart(true)
++	return r.nextPart(true, maxMIMEHeaderSize)
+ }
+ 
+-func (r *Reader) nextPart(rawPart bool) (*Part, error) {
++func (r *Reader) nextPart(rawPart bool, maxMIMEHeaderSize int64) (*Part, error) {
+ 	if r.currentPart != nil {
+ 		r.currentPart.Close()
+ 	}
+@@ -348,7 +357,7 @@ func (r *Reader) nextPart(rawPart bool)
+ 
+ 		if r.isBoundaryDelimiterLine(line) {
+ 			r.partsRead++
+-			bp, err := newPart(r, rawPart)
++			bp, err := newPart(r, rawPart, maxMIMEHeaderSize)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+--- /dev/null
++++ go/src/mime/multipart/readmimeheader.go
+@@ -0,0 +1,14 @@
++// Copyright 2023 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++package multipart
++
++import (
++	"net/textproto"
++	_ "unsafe" // for go:linkname
++)
++
++// readMIMEHeader is defined in package net/textproto.
++//
++//go:linkname readMIMEHeader net/textproto.readMIMEHeader
++func readMIMEHeader(r *textproto.Reader, lim int64) (textproto.MIMEHeader, error)
+--- go.orig/src/net/http/request_test.go
++++ go/src/net/http/request_test.go
+@@ -1110,7 +1110,7 @@ func testMissingFile(t *testing.T, req *
+ 		t.Errorf("FormFile file = %v, want nil", f)
+ 	}
+ 	if fh != nil {
+-		t.Errorf("FormFile file header = %q, want nil", fh)
++		t.Errorf("FormFile file header = %v, want nil", fh)
+ 	}
+ 	if err != ErrMissingFile {
+ 		t.Errorf("FormFile err = %q, want ErrMissingFile", err)
+--- go.orig/src/net/textproto/reader.go
++++ go/src/net/textproto/reader.go
+@@ -7,8 +7,10 @@ package textproto
+ import (
+ 	"bufio"
+ 	"bytes"
++	"errors"
+ 	"fmt"
+ 	"io"
++	"math"
+ 	"strconv"
+ 	"strings"
+ 	"sync"
+@@ -481,6 +483,12 @@ func (r *Reader) ReadDotLines() ([]strin
+ //	}
+ //
+ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
++	return readMIMEHeader(r, math.MaxInt64)
++}
++
++// readMIMEHeader is a version of ReadMIMEHeader which takes a limit on the header size.
++// It is called by the mime/multipart package.
++func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 	// Avoid lots of small slice allocations later by allocating one
+ 	// large one ahead of time which we'll cut up into smaller
+ 	// slices. If this isn't big enough later, we allocate small ones.
+@@ -521,6 +529,16 @@ func (r *Reader) ReadMIMEHeader() (MIMEH
+ 			continue
+ 		}
+ 
++		// backport 5c55ac9bf1e5f779220294c843526536605f42ab
++		//
++		// value is computed as
++		//
++		// value := string(bytes.TrimLeft(v, " \t"))
++		//
++		// in the original patch from 1.19.  This relies on
++		// 'v' which does not exist in 1.17.  We leave the
++		// 1.17 method unchanged.
++
+ 		// Skip initial spaces in value.
+ 		i++ // skip colon
+ 		for i < len(kv) && (kv[i] == ' ' || kv[i] == '\t') {
+@@ -529,6 +547,16 @@ func (r *Reader) ReadMIMEHeader() (MIMEH
+ 		value := string(kv[i:])
+ 
+ 		vv := m[key]
++		if vv == nil {
++			lim -= int64(len(key))
++			lim -= 100 // map entry overhead
++		}
++		lim -= int64(len(value))
++		if lim < 0 {
++			// TODO: This should be a distinguishable error (ErrMessageTooLarge)
++			// to allow mime/multipart to detect it.
++			return m, errors.New("message too large")
++		}
+ 		if vv == nil && len(strs) > 0 {
+ 			// More than likely this will be a single-element key.
+ 			// Most headers aren't multi-valued.
-- 
2.34.1


