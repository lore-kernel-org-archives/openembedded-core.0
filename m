Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ABECD98D6
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:00 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71898.1781274413981239465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Lq7Jqqa3;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1342454f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274412; x=1781879212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tFGJ+cg6FZKQVOc1mQZ9C+zp0fsqq239ESKjVGZcS1M=;
        b=Lq7Jqqa3PmmrLvw2bP+R3N8gABD8Ng+wud39a6rQVez56t2m3FkgvJFAGQYmRcYfHB
         CuMbGE8iCkCaXeP2cApe9Xwm1lXEoEL2bFGKmRBQr+8TgtlIDfJZvvlX7cBudsPkM4Tl
         q3ABWhSYQb5/X0yiKysr5hQ+WCZTRw41yHPeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274412; x=1781879212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tFGJ+cg6FZKQVOc1mQZ9C+zp0fsqq239ESKjVGZcS1M=;
        b=F3r7LGqSg6QeC6ZlLbO8ppKuWdN78O5uDUUjp3Vt7hnaCEuDbrnDP/xxqR2n8h5I55
         +Bh05RhbAqrCnBpu1DqnK5AkhXuJItYvvTNoOjcIsF5IHRAzziIp84wkKDZlkv3tqwn2
         Ffd/z3MDhnUlCU3AGLwgRoBtd3A6s02Ay+QclijOKNu3KJDhPOSzTvaB3i7AEtO+/1D6
         Ur5BOHlvKlNJKBQCLYQcL0MEIDgj/KFYZ5EdT0ymXxt8pQOOd+SRFi63Qni12xBJVYIe
         MgArdaUplfp70TS6INdtiNiwQQ3ylAdzDJlqGawC0t9+dIPZhZ9ktruorRFlYDSbm8gX
         qgIA==
X-Gm-Message-State: AOJu0YxLS9zSjn6olST/pICjZzIcq29hkCnaA3zpogZScOb43ALEAKcy
	onYZ2XA4TBC44TeCQIHhGMH6YsZPlVunIvNVvcvEguAwMrv1OiEBw+gNmiqO9dIHTa3iMtX9Cx1
	c4Ib8ew==
X-Gm-Gg: Acq92OHftWPIcyVHbrE3RWq7c1tEZ9/Kty48vEWFHy2qMeJ8Z2pOaanormAtcqapCyD
	FisnlSB6lXpFJbIkFIrpt6chAIw+t+zH6jNt1YPwxkTr4jxWnUPKn+bqKPmeYjlTylpTfs2G8hC
	YYOpSmQeNyOvJ31sHld8zt0xEp/i3ctcnTpQGi1ZFxjJF4MtWtv48FMQxMT6AZSK7mJz4JJ1Vb6
	X0NnO8eQ3wIJlitu+v3ADFJOJIsRQsZZlmUA6O4hH4GYccFBjwsMlIvyqupD7js2F+5ib8PhK0v
	nmb3MmBKRDmexNyVQyAtR4GFnjczoBggO3OY0R/yw5VzGZD+1Ezf0ydNdKzU500CvAkRkVadJ6r
	dNlmtJA9kQyKEULVuVn6vN2Yg2VVKhd9VJT0s8G1i094dX8QmGkGIMfoQwviN8twr2KyidjRYYR
	lBMPO9fP8cMmfYHxHW5S/dL8g=
X-Received: by 2002:a5d:5d10:0:b0:45e:9304:a4c3 with SMTP id ffacd0b85a97d-4606f25dc7bmr3771526f8f.19.1781274412276;
        Fri, 12 Jun 2026 07:26:52 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:51 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 20/21] go: patch CVE-2026-42507
Date: Fri, 12 Jun 2026 16:26:10 +0200
Message-ID: <6eedc9b05adf40fe635e7cfac767a123a365f57a.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238642

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/777060

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-42507.patch                | 160 ++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42507.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ba4fe9a734..f67da3e078 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -54,6 +54,7 @@ SRC_URI += "\
     file://CVE-2026-42499.patch \
     file://CVE-2026-42501.patch \
     file://CVE-2026-42504.patch \
+    file://CVE-2026-42507.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42507.patch b/meta/recipes-devtools/go/go/CVE-2026-42507.patch
new file mode 100644
index 0000000000..d48b2b53eb
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42507.patch
@@ -0,0 +1,160 @@
+From 943e53a7b667a1570648b5f1c4592b9d9d5b4aac Mon Sep 17 00:00:00 2001
+From: "Nicholas S. Husin" <nsh@golang.org>
+Date: Mon, 11 May 2026 18:04:07 -0400
+Subject: [PATCH] net/textproto: escape arbitrary input when including them in
+ errors
+
+When returning errors, functions in the net/textproto package would
+include its input as part of the error, without any escaping. Note that
+said input is often controlled by external parties when using this
+package naturally. For example, a net/http client uses ReadMIMEHeader
+when parsing the headers it receive from a server.
+
+As a result, an attacker could inject arbitrary content into the error.
+Practically, this can result in an attacker injecting misleading
+content, terminal control bytes, etc. into a victim's output or logs.
+
+Fix this issue by making sure that ProtocolError usages within the
+package are properly escaped, and that Error.String will escape its Msg.
+
+Fixes #79346
+Fixes CVE-2026-42507
+
+Change-Id: Ide4c1005d8254f90d95d7a389b8ca3a26a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/777060
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+
+CVE: CVE-2026-42507
+Upstream-Status: Backport [https://github.com/golang/go/commit/1a7e601d07b67aec8d795c8182ee7257ba7d1960]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/smtp/smtp_test.go        |  6 +++---
+ src/net/textproto/reader.go      | 14 +++++++-------
+ src/net/textproto/reader_test.go |  6 ++++--
+ src/net/textproto/textproto.go   |  2 +-
+ 4 files changed, 15 insertions(+), 13 deletions(-)
+
+diff --git a/src/net/smtp/smtp_test.go b/src/net/smtp/smtp_test.go
+index 259b10b93d..3e03da5208 100644
+--- a/src/net/smtp/smtp_test.go
++++ b/src/net/smtp/smtp_test.go
+@@ -664,7 +664,7 @@ func TestHello(t *testing.T) {
+ 			err = c.Hello("customhost")
+ 		case 1:
+ 			err = c.StartTLS(nil)
+-			if err.Error() == "502 Not implemented" {
++			if err.Error() == `502 "Not implemented"` {
+ 				err = nil
+ 			}
+ 		case 2:
+@@ -922,8 +922,8 @@ func TestAuthFailed(t *testing.T) {
+ 
+ 	if err == nil {
+ 		t.Error("Auth: expected error; got none")
+-	} else if err.Error() != "535 Invalid credentials\nplease see www.example.com" {
+-		t.Errorf("Auth: got error: %v, want: %s", err, "535 Invalid credentials\nplease see www.example.com")
++	} else if err.Error() != `535 "Invalid credentials\nplease see www.example.com"` {
++		t.Errorf("Auth: got error: %v, want: %s", err, `535 "Invalid credentials\nplease see www.example.com"`)
+ 	}
+ 
+ 	bcmdbuf.Flush()
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 0027efe3ca..b4cd22a6ed 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -213,13 +213,13 @@ func (r *Reader) readCodeLine(expectCode int) (code int, continued bool, message
+ 
+ func parseCodeLine(line string, expectCode int) (code int, continued bool, message string, err error) {
+ 	if len(line) < 4 || line[3] != ' ' && line[3] != '-' {
+-		err = ProtocolError("short response: " + line)
++		err = ProtocolError(fmt.Sprintf("short response: %q", line))
+ 		return
+ 	}
+ 	continued = line[3] == '-'
+ 	code, err = strconv.Atoi(line[0:3])
+ 	if err != nil || code < 100 {
+-		err = ProtocolError("invalid response code: " + line)
++		err = ProtocolError(fmt.Sprintf("invalid response code: %q", line))
+ 		return
+ 	}
+ 	message = line[4:]
+@@ -251,7 +251,7 @@ func parseCodeLine(line string, expectCode int) (code int, continued bool, messa
+ func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err error) {
+ 	code, continued, message, err := r.readCodeLine(expectCode)
+ 	if err == nil && continued {
+-		err = ProtocolError("unexpected multi-line response: " + message)
++		err = ProtocolError(fmt.Sprintf("unexpected multi-line response: %q", message))
+ 	}
+ 	return
+ }
+@@ -536,7 +536,7 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 		if err != nil {
+ 			return m, err
+ 		}
+-		return m, ProtocolError("malformed MIME header initial line: " + string(line))
++		return m, ProtocolError(fmt.Sprintf("malformed MIME header initial line: %q", line))
+ 	}
+ 
+ 	for {
+@@ -548,15 +548,15 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 		// Key ends at first colon.
+ 		k, v, ok := bytes.Cut(kv, colon)
+ 		if !ok {
+-			return m, ProtocolError("malformed MIME header line: " + string(kv))
++			return m, ProtocolError(fmt.Sprintf("malformed MIME header line: %q", kv))
+ 		}
+ 		key, ok := canonicalMIMEHeaderKey(k)
+ 		if !ok {
+-			return m, ProtocolError("malformed MIME header line: " + string(kv))
++			return m, ProtocolError(fmt.Sprintf("malformed MIME header line: %q", kv))
+ 		}
+ 		for _, c := range v {
+ 			if !validHeaderValueByte(c) {
+-				return m, ProtocolError("malformed MIME header line: " + string(kv))
++				return m, ProtocolError(fmt.Sprintf("malformed MIME header line: %q", kv))
+ 			}
+ 		}
+ 
+diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
+index 26ff617470..844069a4ad 100644
+--- a/src/net/textproto/reader_test.go
++++ b/src/net/textproto/reader_test.go
+@@ -409,6 +409,8 @@ func TestReadMultiLineError(t *testing.T) {
+ 		"Unexpected but legal text!\n" +
+ 		"5.1.1 https://support.google.com/mail/answer/6596 h20si25154304pfd.166 - gsmtp"
+ 
++	wantError := `550 "5.1.1 The email account that you tried to reach does not exist. Please try\n5.1.1 double-checking the recipient's email address for typos or\n5.1.1 unnecessary spaces. Learn more at\nUnexpected but legal text!\n5.1.1 https://support.google.com/mail/answer/6596 h20si25154304pfd.166 - gsmtp"`
++
+ 	code, msg, err := r.ReadResponse(250)
+ 	if err == nil {
+ 		t.Errorf("ReadResponse: no error, want error")
+@@ -419,8 +421,8 @@ func TestReadMultiLineError(t *testing.T) {
+ 	if msg != wantMsg {
+ 		t.Errorf("ReadResponse: msg=%q, want %q", msg, wantMsg)
+ 	}
+-	if err != nil && err.Error() != "550 "+wantMsg {
+-		t.Errorf("ReadResponse: error=%q, want %q", err.Error(), "550 "+wantMsg)
++	if err != nil && err.Error() != wantError {
++		t.Errorf("ReadResponse: error=%q, want %q", err.Error(), wantError)
+ 	}
+ }
+ 
+diff --git a/src/net/textproto/textproto.go b/src/net/textproto/textproto.go
+index 4ae3ecff74..a2291eff2b 100644
+--- a/src/net/textproto/textproto.go
++++ b/src/net/textproto/textproto.go
+@@ -38,7 +38,7 @@ type Error struct {
+ }
+ 
+ func (e *Error) Error() string {
+-	return fmt.Sprintf("%03d %s", e.Code, e.Msg)
++	return fmt.Sprintf("%03d %q", e.Code, e.Msg)
+ }
+ 
+ // A ProtocolError describes a protocol violation such
+-- 
+2.43.0
+
-- 
2.53.0


