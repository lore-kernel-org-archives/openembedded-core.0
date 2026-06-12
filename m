Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B459CD98DE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71823.1781274406082271001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PvCpWhIT;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cdae130cso5613695e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274404; x=1781879204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5bJ0DBsxxR/wbiooWq0/eucdvN/nWCrCvO80ft10pk=;
        b=PvCpWhITC96kLjRUk9CwMeWLICLCWyNQXWVf+Z8TJ+larcv3fqcJWWLxg20UibFnX5
         n1L5RbUvMlSHHIGvM6DLu+DmT4OownQuNqdhJKYfvHPKv1xXGMEixbHFPzoqLVYBBkkc
         C8OhhWfv/vKJ5ra73CqBQggsr3OKycsVBcKq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274404; x=1781879204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/5bJ0DBsxxR/wbiooWq0/eucdvN/nWCrCvO80ft10pk=;
        b=rd/iMZVWqsuWRRc+Sm6CJA1Ga3erS6eGzVV6pTjTOU7lkRmtCevxEz4vphDwx21A30
         FCJB1MDUvBhQ9NhePDfob62ZD2OFdmRcQIeyrb3oEWvKs28q5hvAQZ0ljTrGz66X6W9b
         DJBMoV/YnItefB25qqJqjkZe4CGYpRV8M14RLNtDTcgVxNz0U6pqTMaEEa31waw5C0Kt
         MwT8CWwdZWiEKZv+/q3mWwR07WgIFAxCr3qZl1YxM7Di8+8oTmF29mFETsYrhzMtFFyj
         PqPu35KEx32Rjl69Rw5hWRGTwMiH/NpZW9dnjtGumCjQQlq9m85XDBFD2V1U8cCspAxd
         +FNQ==
X-Gm-Message-State: AOJu0Yy0hH+pO519I1ALH6ShPWlv5jjjWM3TFLTI45DaTfiuGD1EYGTS
	CeOLLIIhYKDe0qRXLUpczoRPFSUI6ZsRQruuynPFtubTK1ljyzy0orC2Ba6nArXlaq8PjxFNh+q
	pNOux3Q==
X-Gm-Gg: Acq92OF71l/rkHE703LW5M91ymn1noHDtgd6zCgyj2AwM2LQn26YN9jt7UlyijsaBvC
	sEnhgtqqXv+bFwlzbzqrn8gfW8n5u7Ia6zymvmlp5oRZ1A3Pgpsrn2S1836bkt2uHd75UqP5LM2
	kQiiR/5TtiNshWx6cbw0mAg1f5013gFVUuBdSfrPK9ZWDfi/iOJN2AE03WzDun4QBMslqPRVQdL
	1x8a60D0QJqX+Rz0sjstv0mPhW7bs2dGqP3zev7Ju5NaBdR+AExKhFV64iC5XdFUo8jot/muvOw
	nfZzesot7Pyiok9sooQ5JsqMdQ92YA5dnGniMY6rRGYH/Aempi68DMVqQKiTpoGy2ZKTCLo7lzD
	f3tziDDvF5Ahb0QK1muYchJXZmInOxT+BKOiL+GY/49JDx4iB6jV3/IybtyS9bBoUJZ/xg40NV4
	PL2jXGbClGxj1SXqw7DozNFAc=
X-Received: by 2002:a05:600c:4745:b0:490:6e12:542d with SMTP id 5b1f17b1804b1-490ec4fd28bmr41529345e9.19.1781274404238;
        Fri, 12 Jun 2026 07:26:44 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:43 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 10/21] go: patch CVE-2026-32289
Date: Fri, 12 Jun 2026 16:26:00 +0200
Message-ID: <cb2f7073c4fe38c026b6696eb9f3a77ef73051b1.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238632

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/763762

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-32289.patch                | 217 ++++++++++++++++++
 2 files changed, 218 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32289.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 99c2945a8c..288cd5c95f 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -44,6 +44,7 @@ SRC_URI += "\
     file://CVE-2026-27142.patch \
     file://CVE-2026-32280.patch \
     file://CVE-2026-32283.patch \
+    file://CVE-2026-32289.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-32289.patch b/meta/recipes-devtools/go/go/CVE-2026-32289.patch
new file mode 100644
index 0000000000..28ff0c00e0
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-32289.patch
@@ -0,0 +1,217 @@
+From 5291c6d3e6d0bc0a764a9a6bd6b3de1be64b8264 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 23 Mar 2026 13:34:23 -0700
+Subject: [PATCH] html/template: properly track JS template literal brace depth
+ across contexts
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Properly track JS template literal brace depth across branches/ranges,
+and prevent accidental re-use of escape analysis by including the
+brace depth in the stringification/mangling for contexts.
+
+Fixes #78331
+Fixes CVE-2026-32289
+
+Change-Id: I9f3f47c29e042220b18e4d3299db7a3fae4207fa
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3882
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/763762
+Reviewed-by: Russ Cox <rsc@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: David Chase <drchase@google.com>
+Reviewed-by: Fan Mỹ Tâm Club <letrivien97@gmail.com>
+
+CVE: CVE-2026-32289
+Upstream-Status: Backport [https://github.com/golang/go/commit/199c4d1c3c9d509a51f777c81cb17d4b17728097]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/html/template/context.go     | 14 +++++++++++-
+ src/html/template/escape.go      |  4 ++--
+ src/html/template/escape_test.go | 38 +++++++++++++++++++++-----------
+ 3 files changed, 40 insertions(+), 16 deletions(-)
+
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index 8b3af2feab..132ae2d28d 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -6,6 +6,7 @@ package template
+ 
+ import (
+ 	"fmt"
++	"slices"
+ 	"text/template/parse"
+ )
+ 
+@@ -37,7 +38,7 @@ func (c context) String() string {
+ 	if c.err != nil {
+ 		err = c.err
+ 	}
+-	return fmt.Sprintf("{%v %v %v %v %v %v %v}", c.state, c.delim, c.urlPart, c.jsCtx, c.attr, c.element, err)
++	return fmt.Sprintf("{%v %v %v %v %v %v %v %v}", c.state, c.delim, c.urlPart, c.jsCtx, c.jsBraceDepth, c.attr, c.element, err)
+ }
+ 
+ // eq reports whether two contexts are equal.
+@@ -46,6 +47,7 @@ func (c context) eq(d context) bool {
+ 		c.delim == d.delim &&
+ 		c.urlPart == d.urlPart &&
+ 		c.jsCtx == d.jsCtx &&
++		slices.Equal(c.jsBraceDepth, d.jsBraceDepth) &&
+ 		c.attr == d.attr &&
+ 		c.element == d.element &&
+ 		c.err == d.err
+@@ -68,6 +70,9 @@ func (c context) mangle(templateName string) string {
+ 	if c.jsCtx != jsCtxRegexp {
+ 		s += "_" + c.jsCtx.String()
+ 	}
++	if c.jsBraceDepth != nil {
++		s += fmt.Sprintf("_jsBraceDepth(%v)", c.jsBraceDepth)
++	}
+ 	if c.attr != attrNone {
+ 		s += "_" + c.attr.String()
+ 	}
+@@ -77,6 +82,13 @@ func (c context) mangle(templateName string) string {
+ 	return s
+ }
+ 
++// clone returns a copy of c with the same field values.
++func (c context) clone() context {
++	clone := c
++	clone.jsBraceDepth = slices.Clone(c.jsBraceDepth)
++	return clone
++}
++
+ // state describes a high-level HTML parser state.
+ //
+ // It bounds the top of the element stack, and by extension the HTML insertion
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index b368cab38c..c031ed27b9 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -522,7 +522,7 @@ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string)
+ 	if nodeName == "range" {
+ 		e.rangeContext = &rangeContext{outer: e.rangeContext}
+ 	}
+-	c0 := e.escapeList(c, n.List)
++	c0 := e.escapeList(c.clone(), n.List)
+ 	if nodeName == "range" {
+ 		if c0.state != stateError {
+ 			c0 = joinRange(c0, e.rangeContext)
+@@ -553,7 +553,7 @@ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string)
+ 			return c0
+ 		}
+ 	}
+-	c1 := e.escapeList(c, n.ElseList)
++	c1 := e.escapeList(c.clone(), n.ElseList)
+ 	return join(c0, c1, n, nodeName)
+ }
+ 
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 1970db1695..435c83378f 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -1181,6 +1181,18 @@ func TestErrors(t *testing.T) {
+ 			// html is allowed since it is the last command in the pipeline, but urlquery is not.
+ 			`predefined escaper "urlquery" disallowed in template`,
+ 		},
++		{
++			"<script>var a = `{{if .X}}`{{end}}",
++			`{{if}} branches end in different contexts`,
++		},
++		{
++			"<script>var a = `{{if .X}}a{{else}}`{{end}}",
++			`{{if}} branches end in different contexts`,
++		},
++		{
++			"<script>var a = `{{if .X}}a{{else}}b{{end}}`</script>",
++			``,
++		},
+ 	}
+ 	for _, test := range tests {
+ 		buf := new(bytes.Buffer)
+@@ -1752,7 +1764,7 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>var a = `${",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${}",
+@@ -1760,27 +1772,27 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>var a = `${`",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${var a = \"",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${var a = \"`",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${var a = \"}",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${``",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${`}",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>`${ {} } asd`</script><script>`${ {} }",
+@@ -1788,7 +1800,7 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>var foo = `${ (_ => { return \"x\" })() + \"${",
+-			context{state: stateJSDqStr, element: elementScript},
++			context{state: stateJSDqStr, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var a = `${ {</script><script>var b = `${ x }",
+@@ -1816,23 +1828,23 @@ func TestEscapeText(t *testing.T) {
+ 		},
+ 		{
+ 			"<script>`${ { `` }",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>`${ { }`",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 		{
+ 			"<script>var foo = `${ foo({ a: { c: `${",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{2, 0}},
+ 		},
+ 		{
+ 			"<script>var foo = `${ foo({ a: { c: `${ {{.}} }` }, b: ",
+-			context{state: stateJS, element: elementScript},
++			context{state: stateJS, element: elementScript, jsBraceDepth: []int{1}},
+ 		},
+ 		{
+ 			"<script>`${ `}",
+-			context{state: stateJSTmplLit, element: elementScript},
++			context{state: stateJSTmplLit, element: elementScript, jsBraceDepth: []int{0}},
+ 		},
+ 	}
+ 
+-- 
+2.43.0
+
-- 
2.53.0


