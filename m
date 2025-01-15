Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23ACBC02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:04 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.22647.1736951883614339269
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WdAa9LVR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2164b662090so120339215ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951883; x=1737556683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgA/5T9WzdqMHIEpI6IXH0/OmgBB0l6Qj0KpXxVSgwE=;
        b=WdAa9LVRntSnoz7fFYBX+qB3cWuniUveYBkTbZsqHeTQgyWw7j/0ux7GTYTBbiWsZf
         DHdTeDNNB/VgIrxhw+33Pst2Bbvi5JaHydmZ/Zo8QyuSlqnzzXzmGCq2iA3xvwUjbLlj
         5TM/gSa4GfbylIJGNm4t0aGJxFmZ6LyjIUyZqhxEmU5/T5EjfK+AyWv6hhYcOHfNlGRB
         6X9LK7v0VdRIz8mCkD1u9DJBRY4NvQUcEXjx6jDFkcxsOGDyUFksrZ0xvqyE6c1lUM3s
         J+/rMMeofXUD5nPh9l0y6ys/+kBykKKmSVE6CU9EVj0TXiTZzicblHn5cXybQZG7JSky
         HCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951883; x=1737556683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgA/5T9WzdqMHIEpI6IXH0/OmgBB0l6Qj0KpXxVSgwE=;
        b=iJ1SsgrqT13nn0//mWPn9X4RinaDe5Jwe9UY9XC30ADlufU/10c1qphnP1blNtLHmX
         CwKKxvJWa6ZRS3h7AD8kT9GsamjuuEs2r/iajBWHL9cGgKIkNwAktxZT8p6VBQ0z1nZu
         RGtzacVlAsT7l7W2nkto2JYWioObiHP76gmfRXtidI7rTDigkK1iVz5zRD7UmYSdHbfk
         PaAwV2cROYug8mR2DZM8Ne2MoBcXe5XzAT2frQ7HP2iwUBNCytwIJ7Jr89X7R0T1GceQ
         9XIojcdFW72rX/WrAzrlsRBIlPU5kgCuvcbd9Jm/6HH1fG2Mu5qO7kOprxLARE/5a012
         j7SQ==
X-Gm-Message-State: AOJu0YweWQnmVa1eseAbiY6Zb9n5aH2W23I3efSJ9C9tW9rvqovloiJU
	79xwj0goeNYsBgq4K0lsZxWnJAswn4fMmfCb4gfXfGcW47HpB+pW4vNZmPixVF/6Wjj2J+UZg0s
	cJsk=
X-Gm-Gg: ASbGncuF5lXRdarmqSmLPBwn6OG03VVC21xjdMXLvkcLThYSDHbOSakG3eJWC001ebl
	zIOejRtwF0UekLtRPLVrGun5dCeJN2mIg5NQQP+uztG/JaVR4xavnL53YBHA3Alw2sk+VesdgK7
	va1u7LoASIeJUbv5vQzfA3FDo7zlTPQb08kuxM8aWzKNYfoT5EIHjxZpx837oHbp3D8A7LYWZw8
	2Um2QsLktmUzfi8UIaEeiFvatj6jOL3C9zilC/kENaHoA==
X-Google-Smtp-Source: AGHT+IGcnlbqgAEIWAohgFrTrOcpSc3LcSmd96xiXRnwENd/2NAxbGjj/pToaWoCmCnnMSL0ClqVMA==
X-Received: by 2002:a17:902:d352:b0:215:8847:435c with SMTP id d9443c01a7336-21a83f4b133mr368272975ad.12.1736951882752;
        Wed, 15 Jan 2025 06:38:02 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/11] go: Fix CVE-2024-34158
Date: Wed, 15 Jan 2025 06:37:41 -0800
Message-ID: <eb14e9722d023b4d1668c55ce4bc6ef02f8ce6c2.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209908

From: Archana Polampalli <archana.polampalli@windriver.com>

Calling Parse on a "// +build" build tag line with deeply nested
expressions can cause a panic due to stack exhaustion.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-34158

Upstream-patch:
https://github.com/golang/go/commit/d4c53812e6ce2ac368173d7fcd31d0ecfcffb002

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-34158.patch           | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 53ca869221..c483590931 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -60,6 +60,7 @@ SRC_URI += "\
     file://CVE-2024-24791.patch \
     file://CVE-2024-34155.patch \
     file://CVE-2024-34156.patch \
+    file://CVE-2024-34158.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch
new file mode 100644
index 0000000000..ad4d4f092c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-34158.patch
@@ -0,0 +1,205 @@
+From d4c53812e6ce2ac368173d7fcd31d0ecfcffb002 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 20 Jun 2024 10:45:30 -0700
+Subject: [PATCH] go/build/constraint: add parsing limits
+
+Limit the size of build constraints that we will parse. This prevents a
+number of stack exhaustions that can be hit when parsing overly complex
+constraints. The imposed limits are unlikely to ever be hit in real
+world usage.
+
+Updates #69141
+Fixes #69148
+Fixes CVE-2024-34158
+
+Change-Id: I38b614bf04caa36eefc6a4350d848588c4cef3c4
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1540
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Russ Cox <rsc@google.com>
+(cherry picked from commit 0c74dc9e0da0cf1e12494b514d822b5bebbc9f04)
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1582
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/611183
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2024-34158
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/d4c53812e6ce2ac368173d7fcd31d0ecfcffb002]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/go/build/constraint/expr.go      | 28 ++++++++++--
+ src/go/build/constraint/expr_test.go | 65 +++++++++++++++++++++++++++-
+ 2 files changed, 89 insertions(+), 4 deletions(-)
+
+diff --git a/src/go/build/constraint/expr.go b/src/go/build/constraint/expr.go
+index 957eb9b..85897e2 100644
+--- a/src/go/build/constraint/expr.go
++++ b/src/go/build/constraint/expr.go
+@@ -18,6 +18,10 @@ import (
+	"unicode/utf8"
+ )
+
++// maxSize is a limit used to control the complexity of expressions, in order
++// to prevent stack exhaustion issues due to recursion.
++const maxSize = 1000
++
+ // An Expr is a build tag constraint expression.
+ // The underlying concrete type is *AndExpr, *OrExpr, *NotExpr, or *TagExpr.
+ type Expr interface {
+@@ -153,7 +157,7 @@ func Parse(line string) (Expr, error) {
+		return parseExpr(text)
+	}
+	if text, ok := splitPlusBuild(line); ok {
+-		return parsePlusBuildExpr(text), nil
++		return parsePlusBuildExpr(text)
+	}
+	return nil, errNotConstraint
+ }
+@@ -203,6 +207,8 @@ type exprParser struct {
+	tok   string // last token read
+	isTag bool
+	pos   int // position (start) of last token
++
++	size int
+ }
+
+ // parseExpr parses a boolean build tag expression.
+@@ -251,6 +257,10 @@ func (p *exprParser) and() Expr {
+ // On entry, the next input token has not yet been lexed.
+ // On exit, the next input token has been lexed and is in p.tok.
+ func (p *exprParser) not() Expr {
++	p.size++
++	if p.size > maxSize {
++		panic(&SyntaxError{Offset: p.pos, Err: "build expression too large"})
++	}
+	p.lex()
+	if p.tok == "!" {
+		p.lex()
+@@ -391,7 +401,13 @@ func splitPlusBuild(line string) (expr string, ok bool) {
+ }
+
+ // parsePlusBuildExpr parses a legacy build tag expression (as used with “// +build”).
+-func parsePlusBuildExpr(text string) Expr {
++func parsePlusBuildExpr(text string) (Expr, error) {
++	// Only allow up to 100 AND/OR operators for "old" syntax.
++	// This is much less than the limit for "new" syntax,
++	// but uses of old syntax were always very simple.
++	const maxOldSize = 100
++	size := 0
++
+	var x Expr
+	for _, clause := range strings.Fields(text) {
+		var y Expr
+@@ -417,19 +433,25 @@ func parsePlusBuildExpr(text string) Expr {
+			if y == nil {
+				y = z
+			} else {
++				if size++; size > maxOldSize {
++					return nil, errComplex
++				}
+				y = and(y, z)
+			}
+		}
+		if x == nil {
+			x = y
+		} else {
++			if size++; size > maxOldSize {
++				return nil, errComplex
++			}
+			x = or(x, y)
+		}
+	}
+	if x == nil {
+		x = tag("ignore")
+	}
+-	return x
++	return x, nil
+ }
+
+ // isValidTag reports whether the word is a valid build tag.
+diff --git a/src/go/build/constraint/expr_test.go b/src/go/build/constraint/expr_test.go
+index 15d1890..ac38ba6 100644
+--- a/src/go/build/constraint/expr_test.go
++++ b/src/go/build/constraint/expr_test.go
+@@ -222,7 +222,7 @@ var parsePlusBuildExprTests = []struct {
+ func TestParsePlusBuildExpr(t *testing.T) {
+	for i, tt := range parsePlusBuildExprTests {
+		t.Run(fmt.Sprint(i), func(t *testing.T) {
+-			x := parsePlusBuildExpr(tt.in)
++			x, _ := parsePlusBuildExpr(tt.in)
+			if x.String() != tt.x.String() {
+				t.Errorf("parsePlusBuildExpr(%q):\nhave %v\nwant %v", tt.in, x, tt.x)
+			}
+@@ -319,3 +319,66 @@ func TestPlusBuildLines(t *testing.T) {
+		})
+	}
+ }
++
++func TestSizeLimits(t *testing.T) {
++	for _, tc := range []struct {
++		name string
++		expr string
++	}{
++		{
++			name: "go:build or limit",
++			expr: "//go:build " + strings.Repeat("a || ", maxSize+2),
++		},
++		{
++			name: "go:build and limit",
++			expr: "//go:build " + strings.Repeat("a && ", maxSize+2),
++		},
++		{
++			name: "go:build and depth limit",
++			expr: "//go:build " + strings.Repeat("(a &&", maxSize+2),
++		},
++		{
++			name: "go:build or depth limit",
++			expr: "//go:build " + strings.Repeat("(a ||", maxSize+2),
++		},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			_, err := Parse(tc.expr)
++			if err == nil {
++				t.Error("expression did not trigger limit")
++			} else if syntaxErr, ok := err.(*SyntaxError); !ok || syntaxErr.Err != "build expression too large" {
++				if !ok {
++					t.Errorf("unexpected error: %v", err)
++				} else {
++					t.Errorf("unexpected syntax error: %s", syntaxErr.Err)
++				}
++			}
++		})
++	}
++}
++
++func TestPlusSizeLimits(t *testing.T) {
++	maxOldSize := 100
++	for _, tc := range []struct {
++		name string
++		expr string
++	}{
++		{
++			name: "+build or limit",
++			expr: "// +build " + strings.Repeat("a ", maxOldSize+2),
++		},
++		{
++			name: "+build and limit",
++			expr: "// +build " + strings.Repeat("a,", maxOldSize+2),
++		},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			_, err := Parse(tc.expr)
++			if err == nil {
++				t.Error("expression did not trigger limit")
++			} else if err != errComplex {
++				t.Errorf("unexpected error: got %q, want %q", err, errComplex)
++			}
++		})
++	}
++}
+--
+2.40.0
-- 
2.43.0


