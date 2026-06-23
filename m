Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3ADCDE000
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20832.1782220470269156522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Vzc8duOn;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4924944fe6bso21883965e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220468; x=1782825268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtIGJjN4cCXp6gpRLPSzWtp2fT9zanqghlNhYCKBnrM=;
        b=Vzc8duOnqSlXlY3VmRODY9O3oBZxTeS8JKUMvW/V3R1IFMq4DjhgFPc514UUDcjqs+
         tarWq75sPtilpQ3LKdWmC8erMe/l3bnnA6BFB7OQ6kws8pfs41Z5AgurysfHJSkY14iU
         QsvHQV7q8ft72IwBNWdl5g7SYb+W0wajLhwYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220468; x=1782825268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wtIGJjN4cCXp6gpRLPSzWtp2fT9zanqghlNhYCKBnrM=;
        b=pkZj1ZDG1XVe35MBUsMjaQAEFnUR96O3zmkwZ4+j4nLw+j33p9UZbNobLTXyX2Jzhd
         VxKZ3Paru6l/z9s8wjCK0we73JCjntXx7q3mcdSg+oGS7aBeanO8OPQaAXVBLEmfjZuV
         oNsXSIFHO0kX5iPN0ih+bYo94wQGdjcEAhNplBlwcUbNcQokgP4zYKoIpjiohXqCNkZ3
         zdTWpzi5r3M0xvh/EhJZhw+SjkPIN62RRdOSjpehe+a+2mrehmrXsy0hKIQSWvfmprPt
         EhGCEx/ALQduMlbsF2UYo3l5qdQYEZj+XXGIKrqr0SAwm7VyWr30KHdfLEigOmkQJ6NI
         hA1w==
X-Gm-Message-State: AOJu0YzrlHmPlI8P4fv8USv8UNlXh3HC9ZYmt33H2j9oEHOedH3DrGVL
	63+n3C9kTb0EdpomXAnXBz2Zlj9jsykU5oioODGYdutKBe5sqDIyoJ4JxAOovzCtkh6yQnPkX/q
	27sfh
X-Gm-Gg: AfdE7cntMYpqX7uJso09v2Z5n5YPFijy/Tg9gaPT1NTxcKY25SYswfYOxsPnjJ0dQR/
	M01eW5mGDAbKmg2O4t99yzxcq2JULcXIm8HcxfTEhyUP33N6EdJRAi598nvSNXn9AMxp9mckZWg
	XRQi7/FPZu1SksT60NK290m42EQMhUuIoLf/g905EanD0dfsa7fnt81kQy5ruchvbNoIRxMtlCQ
	AxqSYM7er4M+3OjGBoBYn1mW9egEAw1der4q9za++p9aYEazJkk9U25qqBaJ+ndfYXKnMwgm3Kf
	TZ5sr2zMN+kh3oBR2PY26ElKddWZGXvob0lbytFvjjYOqmtvnQlcWC2JTbuXTm4bUFRRO12RN9/
	GtJmKbdSiTb9ZjNMGJykZfMNzBdwQ/wamw4pO3T1kD+EziPD5xSvEPWxk/jeQnTVfcXyCILVXK9
	2ilWgWjqaM3fyf5qKeAFaqj23JSjNtDAwAll53dYcOWoqvX5z/j6I+a226g3lq97JL1n5Z29o+K
	kb5ob71dqpmL6FdtQ==
X-Received: by 2002:a05:600d:844f:10b0:490:b355:9c70 with SMTP id 5b1f17b1804b1-49240e061e9mr236191405e9.11.1782220468309;
        Tue, 23 Jun 2026 06:14:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/26] go: fix CVE-2026-25679
Date: Tue, 23 Jun 2026 15:13:46 +0200
Message-ID: <913b9dc19ea14edbbaf4b7a677507949e454e685.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782220259.git.yoann.congal@smile.fr>
References: <cover.1782220259.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239371

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1], as referenced in [2],
to address insufficient validation in `url.Parse`.

Debian marks older Go branches as not affected because the vulnerable
parseHost surface was introduced by the earlier CVE-2025-47912 fix.
This Scarthgap recipe already carries CVE-2025-47912.patch, so the
fix is applicable to the patched Go 1.22.12 source used here.

[1] https://github.com/golang/go/commit/d8174a9500d53784594b198f6195d1fae8dfe803
[2] https://security-tracker.debian.org/tracker/CVE-2026-25679

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-25679

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-25679.patch                | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-25679.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index f6feb1d0b5f..7d4274b4eb4 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -59,6 +59,7 @@ SRC_URI += "\
     file://CVE-2026-42504.patch \
     file://CVE-2026-42507.patch \
     file://CVE-2025-58183.patch \
+    file://CVE-2026-25679.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-25679.patch b/meta/recipes-devtools/go/go/CVE-2026-25679.patch
new file mode 100644
index 00000000000..13800564f00
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-25679.patch
@@ -0,0 +1,74 @@
+From c8f96fce4d34123a920558a1a3f5c0ddf2bf678e Mon Sep 17 00:00:00 2001
+From: Ian Alexander <jitsu@google.com>
+Date: Wed, 28 Jan 2026 15:29:52 -0500
+Subject: [PATCH] [release-branch.go1.25] net/url: reject IPv6 literal not
+ at start of host
+
+This change rejects IPv6 literals that do not appear at the start of the
+host subcomponent of a URL.
+
+For example:
+  http://example.com[::1] -> rejects
+  http://[::1]            -> accepts
+
+Thanks to Masaki Hara (https://github.com/qnighy) of Wantedly.
+
+Updates #77578
+Fixes #77969
+Fixes CVE-2026-25679
+
+CVE: CVE-2026-25679
+Upstream-Status: Backport [https://github.com/golang/go/commit/d8174a9500d53784594b198f6195d1fae8dfe803]
+
+Change-Id: I7109031880758f7c1eb4eca513323328feace33c
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3400
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3642
+Reviewed-on: https://go-review.googlesource.com/c/go/+/752100
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+Auto-Submit: Gopher Robot <gobot@golang.org>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+(cherry picked from commit d8174a9500d53784594b198f6195d1fae8dfe803)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ src/net/url/url.go      | 4 +++-
+ src/net/url/url_test.go | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/net/url/url.go b/src/net/url/url.go
+index 5219e3c130b..ab59c63adfa 100644
+--- a/src/net/url/url.go
++++ b/src/net/url/url.go
+@@ -623,7 +623,9 @@ func parseAuthority(authority string) (user *Userinfo, host string, err error) {
+ // parseHost parses host as an authority without user
+ // information. That is, as host[:port].
+ func parseHost(host string) (string, error) {
+-	if openBracketIdx := strings.LastIndex(host, "["); openBracketIdx != -1 {
++	if openBracketIdx := strings.LastIndex(host, "["); openBracketIdx > 0 {
++		return "", errors.New("invalid IP-literal")
++	} else if openBracketIdx == 0 {
+ 		// Parse an IP-Literal in RFC 3986 and RFC 6874.
+ 		// E.g., "[fe80::1]", "[fe80::1%25en0]", "[fe80::1]:80".
+ 		closeBracketIdx := strings.LastIndex(host, "]")
+diff --git a/src/net/url/url_test.go b/src/net/url/url_test.go
+index b2f8bd95fcf..8ffbf075cb8 100644
+--- a/src/net/url/url_test.go
++++ b/src/net/url/url_test.go
+@@ -1722,6 +1722,12 @@ func TestParseErrors(t *testing.T) {
+ 		{"http://[fe80::1", true},                   // missing closing bracket
+ 		{"http://fe80::1]/", true},                  // missing opening bracket
+ 		{"http://[test.com]/", true},                // domain name in brackets
++		{"http://example.com[::1]", true},            // IPv6 literal doesn't start with '['
++		{"http://example.com[::1", true},
++		{"http://[::1", true},
++		{"http://.[::1]", true},
++		{"http:// [::1]", true},
++		{"hxxp://mathepqo[.]serveftp(.)com:9059", true},
+ 	}
+ 	for _, tt := range tests {
+ 		u, err := Parse(tt.in)
+-- 
+2.35.6
+

