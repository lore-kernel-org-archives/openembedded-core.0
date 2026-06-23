Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7CECDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32852.1782253621180698631
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=THf+Xr0B;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso4012365e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253619; x=1782858419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wtIGJjN4cCXp6gpRLPSzWtp2fT9zanqghlNhYCKBnrM=;
        b=THf+Xr0B1sdKKwdOZhzA//PAXrloOnEAXPuy2pe2TudBgF7nK32MWRjglIVx3c27Dp
         kiOlMhpNL/NBZGLEFY1mDGCLbRnKIQTUmq9bfvoOHbBTYTBQBVjvfd8sIq2mJBaAOZZQ
         E/nxT5k7xwN5KpSuWlgN66Q3VawrzVon3uIw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253619; x=1782858419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wtIGJjN4cCXp6gpRLPSzWtp2fT9zanqghlNhYCKBnrM=;
        b=np6ODsOl5LDhZT0AW7rs15ZYBvy4XfMAs0UY9DhbayZuQuC0xD5591aeea/wzaltiy
         cedBmfGr7B0U4j/76Px/H78J/OgBDc/rsafBq+TTOlDDpKu44nY/xbZx5EwWUHrlRWy2
         6SCGipe4Bu5pKmkxzpwf2JEGFSlGTRUgbv8iCHIgOwem/hrGTK9wkISWwV/wU6kmTERs
         YVLXeZjmqQavb+vVzpwnqmEmU0vJXQqN5Cfh7D7YP7ZzQ8udBiI2cHr96utM+zrXzqnr
         qWd9/ejfoiS3ro4ucK3cvJlNmEDHV+SOIVjr8rE9ficZUFb3n7CUh0ZI2bC7Q61x9+aV
         jbrw==
X-Gm-Message-State: AOJu0Ywtz/PVdEYVPNqowclIFqh2KKv0566U7sWA1FcqvYnGTVxk64re
	Y+fj46f/t9eN5mkoMDPsSyhQlMTpxiTJu5r2fi9/yeRjvICLaJnG+0r4OdD6YMApvN8MIKVNSsv
	uLcjf
X-Gm-Gg: AfdE7cnLhqXTVPXegfXg4gjueJTs7JDcrjh5SHfakOkjiFTLokr38/IewJFJdDLgYGb
	LFFhcwcJa7VNVmFkvhetpoSnSqkTbYqcaO5DZM82expyohPaMA9eOYXw6tobpxnCFc+mT5ofSij
	PGSdyUcQmFK5MYrVLfMdl+vyElJ9FSCBa1Hz5ChDL2KSlu9cRx9oZJoIXZoCN86ppPNylF98Odt
	HAi0CApj+Jl1u+VuqJ6IRJ+t7ntplOO5s9mtyIv5XCZpxQSeR6iL7VsbI9GBBTXZlGZLh+C2RJn
	4kq79gpQD9eGbDbcYQ/hKp/ED0f9QTMFec2y/74H/NZCkIiMBeG7zRyagQ+YCpT2TKj+RQkvUMf
	zSWFKMNv9FrlNhaZsJC2y8ApQq990uMdf4hsbRkma33zTIYAx0o84PG42d7RPebYJwE+DTYkX2E
	ootAkNK2UlY0IS5408InM+5Sz090oOwkB3bJWzMSunKynQwxZfUZqpO8SbhidASczUjzmBKU0CF
	zZEAfDzn3sdTvQG
X-Received: by 2002:a05:600c:8109:b0:490:b4e5:ce7e with SMTP id 5b1f17b1804b1-49260878cbbmr7407205e9.25.1782253619344;
        Tue, 23 Jun 2026 15:26:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:26:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 05/41] go: fix CVE-2026-25679
Date: Wed, 24 Jun 2026 00:26:04 +0200
Message-ID: <913b9dc19ea14edbbaf4b7a677507949e454e685.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239427

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

