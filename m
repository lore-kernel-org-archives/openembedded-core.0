Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20450CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:27:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71826.1781274411187886582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ETypZIho;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso8550045e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274410; x=1781879210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Iov+40IxO8DDzBkZiRrKnyt6Zu5hJE6cGTCPKWtcUM=;
        b=ETypZIhorfXwoIsbN6T363f8nLN86i7WL+MlsIx5aArkSSzfNnE1M6UYrAJ3Kis44k
         AbHUIxdjAbrMkoB4wOOMrc01wS/31xPopKXPXq5A1u57MBS8ZztrA4RMYGnpy2V5uayB
         LVFuMoihgJ/X9IiaQUp5pYndAF3CKeQLJxD6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274410; x=1781879210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Iov+40IxO8DDzBkZiRrKnyt6Zu5hJE6cGTCPKWtcUM=;
        b=Y3/vamjdG2A8U4hfL8z0QuDUxT2AvVxiJO9xYmmNzyZnb+fURyedW2nbbbnFuqdFnT
         B6R3VnqJ68iA0M1P5XzJKdLe1k/bcbKiryj3mEJBViXGjyOL0/h9rtULpPRK/8o/Ut7e
         Au0dBhWalu7Nru9Pd6oxt5O08o9kn8qEpmcI+2LiXPTgp0bXzTW1sV3oHEhe2gaF7ka2
         wiBswgiOxOZWKTZ1ubCqrRqltMJ6ciK7Nz7EvaJ5koDBMWeJUHwSNkEdAzL2QwjeVbj3
         RysZaA1HRipMZjGZM+RVRwUMQXOARzsOyyEWRrN8Gknp1+fAIiIgSotZnLl+bqQ+PJa/
         yXiw==
X-Gm-Message-State: AOJu0YyOKT8dk+CcfPECput9S0wVZ5p5RXwQdDJ7hBwuOHJA5OD4u2u9
	+EjXOxETR9W13Ohf4Jhg4pyC551pap7thGd1PfwhCcgnF0mWlVNWHUxH3Ql+8Lf0UUHgd59q+Vq
	xuHhCSw==
X-Gm-Gg: Acq92OGpOP507rFO3HmE/thFDFIW3uYMBZ1kHcudISeDQqueuRHYysWiW5kuW+z58PG
	5hpeJCYSBC2cz4Q+zUhcnoyB/PrtnEfIS2EHx1upPnAoGAcy4+tETh+GLNcacaJ6iYVZlc0pj1x
	gN5OJkWL7P051hySoks/8ydubpHF/PUXkOhnhQFZmjDoXV9T7GP1/TKFDyqSXs6K4inn1zVBeX8
	PZEx70bejIvNh2xQA1oFUSn/v2AzuxuZDDupR3EL2mgWQbglgjKBElXl0XhC7YiNjs1rg4cUdXj
	IdSPVbwV3Ft6bFiUROLv5DzItWXK2cSuiF5fDv+3YodcWOiLtGA+axEwCQWi9RP2HDPVlYHGFtf
	fagnHyP8eaDbLy0LBgajySyYJuETpsRRoB5vsT064SeKy2ODXDNua2u3lN+q5DYFdWriDXS7zDW
	UZYT/xDR7ROQmeNZqryIVZQhjS0W1vXv9LZw==
X-Received: by 2002:a05:600c:8b09:b0:490:b446:fb8 with SMTP id 5b1f17b1804b1-490ec4d9298mr39748885e9.11.1781274409387;
        Fri, 12 Jun 2026 07:26:49 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:48 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 17/21] go: patch CVE-2026-42499
Date: Fri, 12 Jun 2026 16:26:07 +0200
Message-ID: <b0982ba6ae2de7bd57c6562015ec3386ed437f39.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238639

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/771520

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-42499.patch                | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42499.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 77e6bcd59d..85f75f0d89 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -51,6 +51,7 @@ SRC_URI += "\
     file://CVE-2026-39820.patch \
     file://CVE-2026-39825.patch \
     file://CVE-2026-39826.patch \
+    file://CVE-2026-42499.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42499.patch b/meta/recipes-devtools/go/go/CVE-2026-42499.patch
new file mode 100644
index 0000000000..d4ac9b3823
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42499.patch
@@ -0,0 +1,91 @@
+From dd339e72189d59f249786afd4021b9fb391f3562 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Tue, 28 Apr 2026 12:10:24 -0400
+Subject: [PATCH] net/mail: fix quadratic consumePhrase behavior
+
+Updates #78987
+Fixes CVE-2026-42499
+
+Change-Id: I8438e5dee7e6433573d4161baf8fb2151e7fbc2f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/771520
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Nicholas Husin <nsh@golang.org>
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-42499
+Upstream-Status: Backport [https://github.com/golang/go/commit/2c59389fcc5194aeae742fb413e55b656c22343f]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/mail/message.go      | 23 +++++++++++++++++------
+ src/net/mail/message_test.go | 11 +++++++++++
+ 2 files changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/src/net/mail/message.go b/src/net/mail/message.go
+index 37d7ff5df1..f57742068e 100644
+--- a/src/net/mail/message.go
++++ b/src/net/mail/message.go
+@@ -567,8 +567,10 @@ func (p *addrParser) consumeAddrSpec() (spec string, err error) {
+ func (p *addrParser) consumePhrase() (phrase string, err error) {
+ 	debug.Printf("consumePhrase: [%s]", p.s)
+ 	// phrase = 1*word
+-	var words []string
+-	var isPrevEncoded bool
++	var (
++		words []string
++		sb    strings.Builder
++	)
+ 	for {
+ 		// obs-phrase allows CFWS after one word
+ 		if len(words) > 0 {
+@@ -600,13 +602,22 @@ func (p *addrParser) consumePhrase() (phrase string, err error) {
+ 			break
+ 		}
+ 		debug.Printf("consumePhrase: consumed %q", word)
+-		if isPrevEncoded && isEncoded {
+-			words[len(words)-1] += word
+-		} else {
++		switch {
++		case isEncoded:
++			sb.WriteString(word)
++		case !isEncoded && sb.Len() > 0:
++			words = append(words, sb.String())
++			sb.Reset()
++			words = append(words, word)
++		default:
+ 			words = append(words, word)
+ 		}
+-		isPrevEncoded = isEncoded
+ 	}
++
++	if sb.Len() > 0 {
++		words = append(words, sb.String())
++	}
++
+ 	// Ignore any error if we got at least one word.
+ 	if err != nil && len(words) == 0 {
+ 		debug.Printf("consumePhrase: hit err: %v", err)
+diff --git a/src/net/mail/message_test.go b/src/net/mail/message_test.go
+index 1b165317f9..27837a9cbd 100644
+--- a/src/net/mail/message_test.go
++++ b/src/net/mail/message_test.go
+@@ -1219,6 +1219,17 @@ func TestEmptyAddress(t *testing.T) {
+ 	}
+ }
+ 
++func BenchmarkConsumePhrase(b *testing.B) {
++	for _, n := range []int{10, 100, 1000, 10000} {
++		b.Run(fmt.Sprintf("words-%d", n), func(b *testing.B) {
++			input := strings.Repeat("=?utf-8?q?hello?= ", n) + "<user@example.com>"
++			for b.Loop() {
++				(&addrParser{s: input}).consumePhrase()
++			}
++		})
++	}
++}
++
+ func BenchmarkConsumeComment(b *testing.B) {
+ 	for _, n := range []int{10, 100, 1000, 10000} {
+ 		b.Run(fmt.Sprintf("depth-%d", n), func(b *testing.B) {
+-- 
+2.43.0
+
-- 
2.53.0


