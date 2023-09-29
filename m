Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DE6E728D8
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 19:20:54 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.26644.1696015247411860155
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 12:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=dbnCTEpP;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: skulkarni@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27751ac0653so7901669a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 12:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696015246; x=1696620046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H4eduhtjFXNDGom3AbZuWjZel8N/VYqWjq7LvRXfPH4=;
        b=dbnCTEpPoNySNaXR6e1lrFO6FxpHodbw6KP7NQoFHlVQT9YHYdUCBDUGqfNDsJPC5M
         ZD8m/nr9owVSJC2pFwj5m0NmkPnYJGG+Uzs8CLhV18pF29O+a1d2T5rENpJHVzjpS9qQ
         KBBh9L3Ogwf68K1kLVARfe1vMiW2pWSIbvdDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696015246; x=1696620046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4eduhtjFXNDGom3AbZuWjZel8N/VYqWjq7LvRXfPH4=;
        b=qKoCD5JaQ9epiCz/sLvxS1rYoJKCqbDaUCWBdvulEMD4q3ooEjn2lXwbyMTo2GC1JC
         HYAlaoCB+Z1qPDC2fDGHtrx8qdViVYMTglmLPmGJzZoeUSvS8K645KbJBPCGESVfRuZv
         qACix9qb76Y+YVe8QZ1DD7sgAEGx4FroyfzPxk7iK/FzjU1ylR2wqOaDQnXhmpdMxHeA
         xi2ymox2Fx88R+F9/icPcrrUzMy1xVH88r14q5IIrtcrpRzoAl46s/3UR4vKNv2hfaUs
         bKGQBEyKuygDz1VYA3bFftPw/AQcohngoG+8IiEbL0G6k54UbiNR9hzzsqzXuLadvzWJ
         5M5Q==
X-Gm-Message-State: AOJu0YyHQ0Qkp3RC3/zNSeJeyh0gKOyJW47siJvbAvhrdpcbjvC6wrLh
	9WD9y8QRnWYmMmv9oSHpe6l3Et/QLKp+kV/PKTw=
X-Google-Smtp-Source: AGHT+IE4clMt7I4/WoyyfQZ3vZ1IpuJgl0v11NSwhcEcFEdtcNqC1+MuTs86ffngvmDtwwmkHD9P3A==
X-Received: by 2002:a17:90b:1d08:b0:274:84f3:d73a with SMTP id on8-20020a17090b1d0800b0027484f3d73amr5117924pjb.28.1696015245788;
        Fri, 29 Sep 2023 12:20:45 -0700 (PDT)
Received: from MVIN00032.mvista.com ([103.134.108.34])
        by smtp.gmail.com with ESMTPSA id c9-20020a17090ab28900b00279163e52bbsm1853058pjr.17.2023.09.29.12.20.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Sep 2023 12:20:45 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH v3] go: Update fix for CVE-2023-24538 & CVE-2023-39318
Date: Sat, 30 Sep 2023 00:50:33 +0530
Message-Id: <20230929192033.14893-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 19:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188413

From: Shubham Kulkarni <skulkarni@mvista.com>

Add missing files in fix for CVE-2023-24538 & CVE-2023-39318

Upstream Link -
CVE-2023-24538: https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b
CVE-2023-39318: https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 .../go/go-1.18/CVE-2023-24538_1.patch         | 597 ++++++++++++++++++
 ...023-24538.patch => CVE-2023-24538_2.patch} | 175 ++++-
 .../go/go-1.21/CVE-2023-39318.patch           |  44 +-
 4 files changed, 802 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24538_1.patch
 rename meta/recipes-devtools/go/go-1.18/{CVE-2023-24538.patch => CVE-2023-24538_2.patch} (53%)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index ed2645bc12..461819d80f 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -29,7 +29,8 @@ SRC_URI += "\
     file://CVE-2022-41722.patch \
     file://CVE-2023-24537.patch \
     file://CVE-2023-24534.patch \
-    file://CVE-2023-24538.patch \
+    file://CVE-2023-24538_1.patch \
+    file://CVE-2023-24538_2.patch \
     file://CVE-2023-24540.patch \
     file://CVE-2023-24539.patch \
     file://CVE-2023-29404.patch \
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24538_1.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538_1.patch
new file mode 100644
index 0000000000..bb0a416f46
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538_1.patch
@@ -0,0 +1,597 @@
+From b1e4e8ec7e946ff2d3bb37ac99c5468ceb49c362 Mon Sep 17 00:00:00 2001
+From: Russ Cox <rsc@golang.org>
+Date: Thu, 20 May 2021 12:46:33 -0400
+Subject: [PATCH 1/2] html/template, text/template: implement break and
+ continue for range loops
+
+Break and continue for range loops was accepted as a proposal in June 2017.
+It was implemented in CL 66410 (Oct 2017)
+but then rolled back in CL 92155 (Feb 2018)
+because html/template changes had not been implemented.
+
+This CL reimplements break and continue in text/template
+and then adds support for them in html/template as well.
+
+Fixes #20531.
+
+Change-Id: I05330482a976f1c078b4b49c2287bd9031bb7616
+Reviewed-on: https://go-review.googlesource.com/c/go/+/321491
+Trust: Russ Cox <rsc@golang.org>
+Run-TryBot: Russ Cox <rsc@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Rob Pike <r@golang.org>
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/d0dd26a88c019d54f22463daae81e785f5867565
+CVE: CVE-2023-24538
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/html/template/context.go          |  4 ++
+ src/html/template/escape.go           | 71 ++++++++++++++++++++++++++++++++++-
+ src/html/template/escape_test.go      | 24 ++++++++++++
+ src/html/template/exec_test.go        |  2 +
+ src/text/template/doc.go              |  8 ++++
+ src/text/template/exec.go             | 24 +++++++++++-
+ src/text/template/exec_test.go        |  2 +
+ src/text/template/parse/lex.go        | 13 ++++++-
+ src/text/template/parse/lex_test.go   |  2 +
+ src/text/template/parse/node.go       | 36 ++++++++++++++++++
+ src/text/template/parse/parse.go      | 42 ++++++++++++++++++++-
+ src/text/template/parse/parse_test.go |  8 ++++
+ 12 files changed, 232 insertions(+), 4 deletions(-)
+
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index f7d4849..aaa7d08 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -6,6 +6,7 @@ package template
+
+ import (
+	"fmt"
++	"text/template/parse"
+ )
+
+ // context describes the state an HTML parser must be in when it reaches the
+@@ -22,6 +23,7 @@ type context struct {
+	jsCtx   jsCtx
+	attr    attr
+	element element
++	n       parse.Node // for range break/continue
+	err     *Error
+ }
+
+@@ -141,6 +143,8 @@ const (
+	// stateError is an infectious error state outside any valid
+	// HTML/CSS/JS construct.
+	stateError
++	// stateDead marks unreachable code after a {{break}} or {{continue}}.
++	stateDead
+ )
+
+ // isComment is true for any state that contains content meant for template
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index 8739735..6dea79c 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -97,6 +97,15 @@ type escaper struct {
+	actionNodeEdits   map[*parse.ActionNode][]string
+	templateNodeEdits map[*parse.TemplateNode]string
+	textNodeEdits     map[*parse.TextNode][]byte
++	// rangeContext holds context about the current range loop.
++	rangeContext *rangeContext
++}
++
++// rangeContext holds information about the current range loop.
++type rangeContext struct {
++	outer     *rangeContext // outer loop
++	breaks    []context     // context at each break action
++	continues []context     // context at each continue action
+ }
+
+ // makeEscaper creates a blank escaper for the given set.
+@@ -109,6 +118,7 @@ func makeEscaper(n *nameSpace) escaper {
+		map[*parse.ActionNode][]string{},
+		map[*parse.TemplateNode]string{},
+		map[*parse.TextNode][]byte{},
++		nil,
+	}
+ }
+
+@@ -124,8 +134,16 @@ func (e *escaper) escape(c context, n parse.Node) context {
+	switch n := n.(type) {
+	case *parse.ActionNode:
+		return e.escapeAction(c, n)
++	case *parse.BreakNode:
++		c.n = n
++		e.rangeContext.breaks = append(e.rangeContext.breaks, c)
++		return context{state: stateDead}
+	case *parse.CommentNode:
+		return c
++	case *parse.ContinueNode:
++		c.n = n
++		e.rangeContext.continues = append(e.rangeContext.breaks, c)
++		return context{state: stateDead}
+	case *parse.IfNode:
+		return e.escapeBranch(c, &n.BranchNode, "if")
+	case *parse.ListNode:
+@@ -427,6 +445,12 @@ func join(a, b context, node parse.Node, nodeName string) context {
+	if b.state == stateError {
+		return b
+	}
++	if a.state == stateDead {
++		return b
++	}
++	if b.state == stateDead {
++		return a
++	}
+	if a.eq(b) {
+		return a
+	}
+@@ -466,14 +490,27 @@ func join(a, b context, node parse.Node, nodeName string) context {
+
+ // escapeBranch escapes a branch template node: "if", "range" and "with".
+ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string) context {
++	if nodeName == "range" {
++		e.rangeContext = &rangeContext{outer: e.rangeContext}
++	}
+	c0 := e.escapeList(c, n.List)
+-	if nodeName == "range" && c0.state != stateError {
++	if nodeName == "range" {
++		if c0.state != stateError {
++			c0 = joinRange(c0, e.rangeContext)
++		}
++		e.rangeContext = e.rangeContext.outer
++		if c0.state == stateError {
++			return c0
++		}
++
+		// The "true" branch of a "range" node can execute multiple times.
+		// We check that executing n.List once results in the same context
+		// as executing n.List twice.
++		e.rangeContext = &rangeContext{outer: e.rangeContext}
+		c1, _ := e.escapeListConditionally(c0, n.List, nil)
+		c0 = join(c0, c1, n, nodeName)
+		if c0.state == stateError {
++			e.rangeContext = e.rangeContext.outer
+			// Make clear that this is a problem on loop re-entry
+			// since developers tend to overlook that branch when
+			// debugging templates.
+@@ -481,11 +518,39 @@ func (e *escaper) escapeBranch(c context, n *parse.BranchNode, nodeName string)
+			c0.err.Description = "on range loop re-entry: " + c0.err.Description
+			return c0
+		}
++		c0 = joinRange(c0, e.rangeContext)
++		e.rangeContext = e.rangeContext.outer
++		if c0.state == stateError {
++			return c0
++		}
+	}
+	c1 := e.escapeList(c, n.ElseList)
+	return join(c0, c1, n, nodeName)
+ }
+
++func joinRange(c0 context, rc *rangeContext) context {
++	// Merge contexts at break and continue statements into overall body context.
++	// In theory we could treat breaks differently from continues, but for now it is
++	// enough to treat them both as going back to the start of the loop (which may then stop).
++	for _, c := range rc.breaks {
++		c0 = join(c0, c, c.n, "range")
++		if c0.state == stateError {
++			c0.err.Line = c.n.(*parse.BreakNode).Line
++			c0.err.Description = "at range loop break: " + c0.err.Description
++			return c0
++		}
++	}
++	for _, c := range rc.continues {
++		c0 = join(c0, c, c.n, "range")
++		if c0.state == stateError {
++			c0.err.Line = c.n.(*parse.ContinueNode).Line
++			c0.err.Description = "at range loop continue: " + c0.err.Description
++			return c0
++		}
++	}
++	return c0
++}
++
+ // escapeList escapes a list template node.
+ func (e *escaper) escapeList(c context, n *parse.ListNode) context {
+	if n == nil {
+@@ -493,6 +558,9 @@ func (e *escaper) escapeList(c context, n *parse.ListNode) context {
+	}
+	for _, m := range n.Nodes {
+		c = e.escape(c, m)
++		if c.state == stateDead {
++			break
++		}
+	}
+	return c
+ }
+@@ -503,6 +571,7 @@ func (e *escaper) escapeList(c context, n *parse.ListNode) context {
+ // which is the same as whether e was updated.
+ func (e *escaper) escapeListConditionally(c context, n *parse.ListNode, filter func(*escaper, context) bool) (context, bool) {
+	e1 := makeEscaper(e.ns)
++	e1.rangeContext = e.rangeContext
+	// Make type inferences available to f.
+	for k, v := range e.output {
+		e1.output[k] = v
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index fbc84a7..3b0aa8c 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -920,6 +920,22 @@ func TestErrors(t *testing.T) {
+			"<a href='/foo?{{range .Items}}&{{.K}}={{.V}}{{end}}'>",
+			"",
+		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{end}}",
++			"",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{continue}}{{end}}",
++			"",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{break}}{{end}}",
++			"",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{end}}>{{if .X}}{{break}}{{end}}{{end}}",
++			"",
++		},
+		// Error cases.
+		{
+			"{{if .Cond}}<a{{end}}",
+@@ -956,6 +972,14 @@ func TestErrors(t *testing.T) {
+			"z:2:8: on range loop re-entry: {{range}} branches",
+		},
+		{
++			"{{range .Items}}<a{{if .X}}{{break}}{{end}}>{{end}}",
++			"z:1:29: at range loop break: {{range}} branches end in different contexts",
++		},
++		{
++			"{{range .Items}}<a{{if .X}}{{continue}}{{end}}>{{end}}",
++			"z:1:29: at range loop continue: {{range}} branches end in different contexts",
++		},
++		{
+			"<a b=1 c={{.H}}",
+			"z: ends in a non-text context: {stateAttr delimSpaceOrTagEnd",
+		},
+diff --git a/src/html/template/exec_test.go b/src/html/template/exec_test.go
+index 8885873..523340b 100644
+--- a/src/html/template/exec_test.go
++++ b/src/html/template/exec_test.go
+@@ -567,6 +567,8 @@ var execTests = []execTest{
+	{"range empty no else", "{{range .SIEmpty}}-{{.}}-{{end}}", "", tVal, true},
+	{"range []int else", "{{range .SI}}-{{.}}-{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
+	{"range empty else", "{{range .SIEmpty}}-{{.}}-{{else}}EMPTY{{end}}", "EMPTY", tVal, true},
++	{"range []int break else", "{{range .SI}}-{{.}}-{{break}}NOTREACHED{{else}}EMPTY{{end}}", "-3-", tVal, true},
++	{"range []int continue else", "{{range .SI}}-{{.}}-{{continue}}NOTREACHED{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
+	{"range []bool", "{{range .SB}}-{{.}}-{{end}}", "-true--false-", tVal, true},
+	{"range []int method", "{{range .SI | .MAdd .I}}-{{.}}-{{end}}", "-20--21--22-", tVal, true},
+	{"range map", "{{range .MSI}}-{{.}}-{{end}}", "-1--3--2-", tVal, true},
+diff --git a/src/text/template/doc.go b/src/text/template/doc.go
+index 7b30294..0228b15 100644
+--- a/src/text/template/doc.go
++++ b/src/text/template/doc.go
+@@ -112,6 +112,14 @@ data, defined in detail in the corresponding sections that follow.
+		T0 is executed; otherwise, dot is set to the successive elements
+		of the array, slice, or map and T1 is executed.
+
++	{{break}}
++		The innermost {{range pipeline}} loop is ended early, stopping the
++		current iteration and bypassing all remaining iterations.
++
++	{{continue}}
++		The current iteration of the innermost {{range pipeline}} loop is
++		stopped, and the loop starts the next iteration.
++
+	{{template "name"}}
+		The template with the specified name is executed with nil data.
+
+diff --git a/src/text/template/exec.go b/src/text/template/exec.go
+index 5ad3b4e..92fa9d9 100644
+--- a/src/text/template/exec.go
++++ b/src/text/template/exec.go
+@@ -5,6 +5,7 @@
+ package template
+
+ import (
++	"errors"
+	"fmt"
+	"internal/fmtsort"
+	"io"
+@@ -243,6 +244,12 @@ func (t *Template) DefinedTemplates() string {
+	return b.String()
+ }
+
++// Sentinel errors for use with panic to signal early exits from range loops.
++var (
++	walkBreak    = errors.New("break")
++	walkContinue = errors.New("continue")
++)
++
+ // Walk functions step through the major pieces of the template structure,
+ // generating output as they go.
+ func (s *state) walk(dot reflect.Value, node parse.Node) {
+@@ -255,7 +262,11 @@ func (s *state) walk(dot reflect.Value, node parse.Node) {
+		if len(node.Pipe.Decl) == 0 {
+			s.printValue(node, val)
+		}
++	case *parse.BreakNode:
++		panic(walkBreak)
+	case *parse.CommentNode:
++	case *parse.ContinueNode:
++		panic(walkContinue)
+	case *parse.IfNode:
+		s.walkIfOrWith(parse.NodeIf, dot, node.Pipe, node.List, node.ElseList)
+	case *parse.ListNode:
+@@ -334,6 +345,11 @@ func isTrue(val reflect.Value) (truth, ok bool) {
+
+ func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode) {
+	s.at(r)
++	defer func() {
++		if r := recover(); r != nil && r != walkBreak {
++			panic(r)
++		}
++	}()
+	defer s.pop(s.mark())
+	val, _ := indirect(s.evalPipeline(dot, r.Pipe))
+	// mark top of stack before any variables in the body are pushed.
+@@ -347,8 +363,14 @@ func (s *state) walkRange(dot reflect.Value, r *parse.RangeNode) {
+		if len(r.Pipe.Decl) > 1 {
+			s.setTopVar(2, index)
+		}
++		defer s.pop(mark)
++		defer func() {
++			// Consume panic(walkContinue)
++			if r := recover(); r != nil && r != walkContinue {
++				panic(r)
++			}
++		}()
+		s.walk(elem, r.List)
+-		s.pop(mark)
+	}
+	switch val.Kind() {
+	case reflect.Array, reflect.Slice:
+diff --git a/src/text/template/exec_test.go b/src/text/template/exec_test.go
+index ef52164..586af55 100644
+--- a/src/text/template/exec_test.go
++++ b/src/text/template/exec_test.go
+@@ -564,6 +564,8 @@ var execTests = []execTest{
+	{"range empty no else", "{{range .SIEmpty}}-{{.}}-{{end}}", "", tVal, true},
+	{"range []int else", "{{range .SI}}-{{.}}-{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
+	{"range empty else", "{{range .SIEmpty}}-{{.}}-{{else}}EMPTY{{end}}", "EMPTY", tVal, true},
++	{"range []int break else", "{{range .SI}}-{{.}}-{{break}}NOTREACHED{{else}}EMPTY{{end}}", "-3-", tVal, true},
++	{"range []int continue else", "{{range .SI}}-{{.}}-{{continue}}NOTREACHED{{else}}EMPTY{{end}}", "-3--4--5-", tVal, true},
+	{"range []bool", "{{range .SB}}-{{.}}-{{end}}", "-true--false-", tVal, true},
+	{"range []int method", "{{range .SI | .MAdd .I}}-{{.}}-{{end}}", "-20--21--22-", tVal, true},
+	{"range map", "{{range .MSI}}-{{.}}-{{end}}", "-1--3--2-", tVal, true},
+diff --git a/src/text/template/parse/lex.go b/src/text/template/parse/lex.go
+index 6784071..95e3377 100644
+--- a/src/text/template/parse/lex.go
++++ b/src/text/template/parse/lex.go
+@@ -62,6 +62,8 @@ const (
+	// Keywords appear after all the rest.
+	itemKeyword  // used only to delimit the keywords
+	itemBlock    // block keyword
++	itemBreak    // break keyword
++	itemContinue // continue keyword
+	itemDot      // the cursor, spelled '.'
+	itemDefine   // define keyword
+	itemElse     // else keyword
+@@ -76,6 +78,8 @@ const (
+ var key = map[string]itemType{
+	".":        itemDot,
+	"block":    itemBlock,
++	"break":    itemBreak,
++	"continue": itemContinue,
+	"define":   itemDefine,
+	"else":     itemElse,
+	"end":      itemEnd,
+@@ -119,6 +123,8 @@ type lexer struct {
+	parenDepth  int       // nesting depth of ( ) exprs
+	line        int       // 1+number of newlines seen
+	startLine   int       // start line of this item
++	breakOK     bool      // break keyword allowed
++	continueOK  bool      // continue keyword allowed
+ }
+
+ // next returns the next rune in the input.
+@@ -461,7 +467,12 @@ Loop:
+			}
+			switch {
+			case key[word] > itemKeyword:
+-				l.emit(key[word])
++				item := key[word]
++				if item == itemBreak && !l.breakOK || item == itemContinue && !l.continueOK {
++					l.emit(itemIdentifier)
++				} else {
++					l.emit(item)
++				}
+			case word[0] == '.':
+				l.emit(itemField)
+			case word == "true", word == "false":
+diff --git a/src/text/template/parse/lex_test.go b/src/text/template/parse/lex_test.go
+index 6510eed..df6aabf 100644
+--- a/src/text/template/parse/lex_test.go
++++ b/src/text/template/parse/lex_test.go
+@@ -35,6 +35,8 @@ var itemName = map[itemType]string{
+	// keywords
+	itemDot:      ".",
+	itemBlock:    "block",
++	itemBreak:    "break",
++	itemContinue: "continue",
+	itemDefine:   "define",
+	itemElse:     "else",
+	itemIf:       "if",
+diff --git a/src/text/template/parse/node.go b/src/text/template/parse/node.go
+index 177482f..4726822 100644
+--- a/src/text/template/parse/node.go
++++ b/src/text/template/parse/node.go
+@@ -71,6 +71,8 @@ const (
+	NodeVariable                   // A $ variable.
+	NodeWith                       // A with action.
+	NodeComment                    // A comment.
++	NodeBreak                      // A break action.
++	NodeContinue                   // A continue action.
+ )
+
+ // Nodes.
+@@ -907,6 +909,40 @@ func (i *IfNode) Copy() Node {
+	return i.tr.newIf(i.Pos, i.Line, i.Pipe.CopyPipe(), i.List.CopyList(), i.ElseList.CopyList())
+ }
+
++// BreakNode represents a {{break}} action.
++type BreakNode struct {
++	tr *Tree
++	NodeType
++	Pos
++	Line int
++}
++
++func (t *Tree) newBreak(pos Pos, line int) *BreakNode {
++	return &BreakNode{tr: t, NodeType: NodeBreak, Pos: pos, Line: line}
++}
++
++func (b *BreakNode) Copy() Node                  { return b.tr.newBreak(b.Pos, b.Line) }
++func (b *BreakNode) String() string              { return "{{break}}" }
++func (b *BreakNode) tree() *Tree                 { return b.tr }
++func (b *BreakNode) writeTo(sb *strings.Builder) { sb.WriteString("{{break}}") }
++
++// ContinueNode represents a {{continue}} action.
++type ContinueNode struct {
++	tr *Tree
++	NodeType
++	Pos
++	Line int
++}
++
++func (t *Tree) newContinue(pos Pos, line int) *ContinueNode {
++	return &ContinueNode{tr: t, NodeType: NodeContinue, Pos: pos, Line: line}
++}
++
++func (c *ContinueNode) Copy() Node                  { return c.tr.newContinue(c.Pos, c.Line) }
++func (c *ContinueNode) String() string              { return "{{continue}}" }
++func (c *ContinueNode) tree() *Tree                 { return c.tr }
++func (c *ContinueNode) writeTo(sb *strings.Builder) { sb.WriteString("{{continue}}") }
++
+ // RangeNode represents a {{range}} action and its commands.
+ type RangeNode struct {
+	BranchNode
+diff --git a/src/text/template/parse/parse.go b/src/text/template/parse/parse.go
+index 1a63961..d92bed5 100644
+--- a/src/text/template/parse/parse.go
++++ b/src/text/template/parse/parse.go
+@@ -31,6 +31,7 @@ type Tree struct {
+	vars       []string // variables defined at the moment.
+	treeSet    map[string]*Tree
+	actionLine int // line of left delim starting action
++	rangeDepth int
+	mode       Mode
+ }
+
+@@ -224,6 +225,8 @@ func (t *Tree) startParse(funcs []map[string]interface{}, lex *lexer, treeSet ma
+	t.vars = []string{"$"}
+	t.funcs = funcs
+	t.treeSet = treeSet
++	lex.breakOK = !t.hasFunction("break")
++	lex.continueOK = !t.hasFunction("continue")
+ }
+
+ // stopParse terminates parsing.
+@@ -386,6 +389,10 @@ func (t *Tree) action() (n Node) {
+	switch token := t.nextNonSpace(); token.typ {
+	case itemBlock:
+		return t.blockControl()
++	case itemBreak:
++		return t.breakControl(token.pos, token.line)
++	case itemContinue:
++		return t.continueControl(token.pos, token.line)
+	case itemElse:
+		return t.elseControl()
+	case itemEnd:
+@@ -405,6 +412,32 @@ func (t *Tree) action() (n Node) {
+	return t.newAction(token.pos, token.line, t.pipeline("command", itemRightDelim))
+ }
+
++// Break:
++//	{{break}}
++// Break keyword is past.
++func (t *Tree) breakControl(pos Pos, line int) Node {
++	if token := t.next(); token.typ != itemRightDelim {
++		t.unexpected(token, "in {{break}}")
++	}
++	if t.rangeDepth == 0 {
++		t.errorf("{{break}} outside {{range}}")
++	}
++	return t.newBreak(pos, line)
++}
++
++// Continue:
++//	{{continue}}
++// Continue keyword is past.
++func (t *Tree) continueControl(pos Pos, line int) Node {
++	if token := t.next(); token.typ != itemRightDelim {
++		t.unexpected(token, "in {{continue}}")
++	}
++	if t.rangeDepth == 0 {
++		t.errorf("{{continue}} outside {{range}}")
++	}
++	return t.newContinue(pos, line)
++}
++
+ // Pipeline:
+ //	declarations? command ('|' command)*
+ func (t *Tree) pipeline(context string, end itemType) (pipe *PipeNode) {
+@@ -480,8 +513,14 @@ func (t *Tree) checkPipeline(pipe *PipeNode, context string) {
+ func (t *Tree) parseControl(allowElseIf bool, context string) (pos Pos, line int, pipe *PipeNode, list, elseList *ListNode) {
+	defer t.popVars(len(t.vars))
+	pipe = t.pipeline(context, itemRightDelim)
++	if context == "range" {
++		t.rangeDepth++
++	}
+	var next Node
+	list, next = t.itemList()
++	if context == "range" {
++		t.rangeDepth--
++	}
+	switch next.Type() {
+	case nodeEnd: //done
+	case nodeElse:
+@@ -523,7 +562,8 @@ func (t *Tree) ifControl() Node {
+ //	{{range pipeline}} itemList {{else}} itemList {{end}}
+ // Range keyword is past.
+ func (t *Tree) rangeControl() Node {
+-	return t.newRange(t.parseControl(false, "range"))
++	r := t.newRange(t.parseControl(false, "range"))
++	return r
+ }
+
+ // With:
+diff --git a/src/text/template/parse/parse_test.go b/src/text/template/parse/parse_test.go
+index 9b1be27..c3679a0 100644
+--- a/src/text/template/parse/parse_test.go
++++ b/src/text/template/parse/parse_test.go
+@@ -230,6 +230,10 @@ var parseTests = []parseTest{
+		`{{range $x := .SI}}{{.}}{{end}}`},
+	{"range 2 vars", "{{range $x, $y := .SI}}{{.}}{{end}}", noError,
+		`{{range $x, $y := .SI}}{{.}}{{end}}`},
++	{"range with break", "{{range .SI}}{{.}}{{break}}{{end}}", noError,
++		`{{range .SI}}{{.}}{{break}}{{end}}`},
++	{"range with continue", "{{range .SI}}{{.}}{{continue}}{{end}}", noError,
++		`{{range .SI}}{{.}}{{continue}}{{end}}`},
+	{"constants", "{{range .SI 1 -3.2i true false 'a' nil}}{{end}}", noError,
+		`{{range .SI 1 -3.2i true false 'a' nil}}{{end}}`},
+	{"template", "{{template `x`}}", noError,
+@@ -279,6 +283,10 @@ var parseTests = []parseTest{
+	{"adjacent args", "{{printf 3`x`}}", hasError, ""},
+	{"adjacent args with .", "{{printf `x`.}}", hasError, ""},
+	{"extra end after if", "{{if .X}}a{{else if .Y}}b{{end}}{{end}}", hasError, ""},
++	{"break outside range", "{{range .}}{{end}} {{break}}", hasError, ""},
++	{"continue outside range", "{{range .}}{{end}} {{continue}}", hasError, ""},
++	{"break in range else", "{{range .}}{{else}}{{break}}{{end}}", hasError, ""},
++	{"continue in range else", "{{range .}}{{else}}{{continue}}{{end}}", hasError, ""},
+	// Other kinds of assignments and operators aren't available yet.
+	{"bug0a", "{{$x := 0}}{{$x}}", noError, "{{$x := 0}}{{$x}}"},
+	{"bug0b", "{{$x += 1}}{{$x}}", hasError, ""},
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538_2.patch
similarity index 53%
rename from meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch
rename to meta/recipes-devtools/go/go-1.18/CVE-2023-24538_2.patch
index 502486befc..f94f0f55c7 100644
--- a/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538_2.patch
@@ -1,7 +1,7 @@
 From 07cc3b8711a8efbb5885f56dd90d854049ad2f7d Mon Sep 17 00:00:00 2001
 From: Roland Shoemaker <bracewell@google.com>
 Date: Mon, 20 Mar 2023 11:01:13 -0700
-Subject: [PATCH] html/template: disallow actions in JS template literals
+Subject: [PATCH 2/2] html/template: disallow actions in JS template literals
 
 ECMAScript 6 introduced template literals[0][1] which are delimited with
 backticks. These need to be escaped in a similar fashion to the
@@ -52,12 +52,15 @@ CVE: CVE-2023-24538
 Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
 ---
  src/html/template/context.go      |  2 ++
- src/html/template/error.go        | 13 +++++++++++++
- src/html/template/escape.go       | 11 +++++++++++
+ src/html/template/error.go        | 13 ++++++++
+ src/html/template/escape.go       | 11 +++++++
+ src/html/template/escape_test.go  | 66 ++++++++++++++++++++++-----------------
  src/html/template/js.go           |  2 ++
- src/html/template/jsctx_string.go |  9 +++++++++
- src/html/template/transition.go   |  7 ++++++-
- 6 files changed, 43 insertions(+), 1 deletion(-)
+ src/html/template/js_test.go      |  2 +-
+ src/html/template/jsctx_string.go |  9 ++++++
+ src/html/template/state_string.go | 37 ++++++++++++++++++++--
+ src/html/template/transition.go   |  7 ++++-
+ 9 files changed, 116 insertions(+), 33 deletions(-)
 
 diff --git a/src/html/template/context.go b/src/html/template/context.go
 index f7d4849..0b65313 100644
@@ -125,6 +128,104 @@ index 8739735..ca078f4 100644
 	case stateJSRegexp:
 		s = append(s, "_html_template_jsregexpescaper")
 	case stateCSS:
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 3b0aa8c..a695b17 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -681,35 +681,31 @@ func TestEscape(t *testing.T) {
+	}
+
+	for _, test := range tests {
+-		tmpl := New(test.name)
+-		tmpl = Must(tmpl.Parse(test.input))
+-		// Check for bug 6459: Tree field was not set in Parse.
+-		if tmpl.Tree != tmpl.text.Tree {
+-			t.Errorf("%s: tree not set properly", test.name)
+-			continue
+-		}
+-		b := new(bytes.Buffer)
+-		if err := tmpl.Execute(b, data); err != nil {
+-			t.Errorf("%s: template execution failed: %s", test.name, err)
+-			continue
+-		}
+-		if w, g := test.output, b.String(); w != g {
+-			t.Errorf("%s: escaped output: want\n\t%q\ngot\n\t%q", test.name, w, g)
+-			continue
+-		}
+-		b.Reset()
+-		if err := tmpl.Execute(b, pdata); err != nil {
+-			t.Errorf("%s: template execution failed for pointer: %s", test.name, err)
+-			continue
+-		}
+-		if w, g := test.output, b.String(); w != g {
+-			t.Errorf("%s: escaped output for pointer: want\n\t%q\ngot\n\t%q", test.name, w, g)
+-			continue
+-		}
+-		if tmpl.Tree != tmpl.text.Tree {
+-			t.Errorf("%s: tree mismatch", test.name)
+-			continue
+-		}
++		t.Run(test.name, func(t *testing.T) {
++			tmpl := New(test.name)
++			tmpl = Must(tmpl.Parse(test.input))
++			// Check for bug 6459: Tree field was not set in Parse.
++			if tmpl.Tree != tmpl.text.Tree {
++				t.Fatalf("%s: tree not set properly", test.name)
++			}
++			b := new(strings.Builder)
++			if err := tmpl.Execute(b, data); err != nil {
++				t.Fatalf("%s: template execution failed: %s", test.name, err)
++			}
++			if w, g := test.output, b.String(); w != g {
++				t.Fatalf("%s: escaped output: want\n\t%q\ngot\n\t%q", test.name, w, g)
++			}
++			b.Reset()
++			if err := tmpl.Execute(b, pdata); err != nil {
++				t.Fatalf("%s: template execution failed for pointer: %s", test.name, err)
++			}
++			if w, g := test.output, b.String(); w != g {
++				t.Fatalf("%s: escaped output for pointer: want\n\t%q\ngot\n\t%q", test.name, w, g)
++			}
++			if tmpl.Tree != tmpl.text.Tree {
++				t.Fatalf("%s: tree mismatch", test.name)
++			}
++		})
+	}
+ }
+
+@@ -936,6 +932,10 @@ func TestErrors(t *testing.T) {
+			"{{range .Items}}<a{{if .X}}{{end}}>{{if .X}}{{break}}{{end}}{{end}}",
+			"",
+		},
++		{
++			"<script>var a = `${a+b}`</script>`",
++			"",
++		},
+		// Error cases.
+		{
+			"{{if .Cond}}<a{{end}}",
+@@ -1082,6 +1082,10 @@ func TestErrors(t *testing.T) {
+			// html is allowed since it is the last command in the pipeline, but urlquery is not.
+			`predefined escaper "urlquery" disallowed in template`,
+		},
++		{
++			"<script>var tmpl = `asd {{.}}`;</script>",
++			`{{.}} appears in a JS template literal`,
++		},
+	}
+	for _, test := range tests {
+		buf := new(bytes.Buffer)
+@@ -1304,6 +1308,10 @@ func TestEscapeText(t *testing.T) {
+			context{state: stateJSSqStr, delim: delimDoubleQuote, attr: attrScript},
+		},
+		{
++			"<a onclick=\"`foo",
++			context{state: stateJSBqStr, delim: delimDoubleQuote, attr: attrScript},
++		},
++		{
+			`<A ONCLICK="'`,
+			context{state: stateJSSqStr, delim: delimDoubleQuote, attr: attrScript},
+		},
 diff --git a/src/html/template/js.go b/src/html/template/js.go
 index ea9c183..b888eaf 100644
 --- a/src/html/template/js.go
@@ -145,6 +246,19 @@ index ea9c183..b888eaf 100644
 	'+':  `\u002b`,
 	'/':  `\/`,
 	'<':  `\u003c`,
+diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
+index d7ee47b..7d963ae 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -292,7 +292,7 @@ func TestEscapersOnLower7AndSelectHighCodepoints(t *testing.T) {
+				`0123456789:;\u003c=\u003e?` +
+				`@ABCDEFGHIJKLMNO` +
+				`PQRSTUVWXYZ[\\]^_` +
+-				"`abcdefghijklmno" +
++				"\\u0060abcdefghijklmno" +
+				"pqrstuvwxyz{|}~\u007f" +
+				"\u00A0\u0100\\u2028\\u2029\ufeff\U0001D11E",
+		},
 diff --git a/src/html/template/jsctx_string.go b/src/html/template/jsctx_string.go
 index dd1d87e..2394893 100644
 --- a/src/html/template/jsctx_string.go
@@ -165,6 +279,55 @@ index dd1d87e..2394893 100644
  const _jsCtx_name = "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
 
  var _jsCtx_index = [...]uint8{0, 11, 21, 33}
+diff --git a/src/html/template/state_string.go b/src/html/template/state_string.go
+index 05104be..6fb1a6e 100644
+--- a/src/html/template/state_string.go
++++ b/src/html/template/state_string.go
+@@ -4,9 +4,42 @@ package template
+
+ import "strconv"
+
+-const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
++func _() {
++	// An "invalid array index" compiler error signifies that the constant values have changed.
++	// Re-run the stringer command to generate them again.
++	var x [1]struct{}
++	_ = x[stateText-0]
++	_ = x[stateTag-1]
++	_ = x[stateAttrName-2]
++	_ = x[stateAfterName-3]
++	_ = x[stateBeforeValue-4]
++	_ = x[stateHTMLCmt-5]
++	_ = x[stateRCDATA-6]
++	_ = x[stateAttr-7]
++	_ = x[stateURL-8]
++	_ = x[stateSrcset-9]
++	_ = x[stateJS-10]
++	_ = x[stateJSDqStr-11]
++	_ = x[stateJSSqStr-12]
++	_ = x[stateJSBqStr-13]
++	_ = x[stateJSRegexp-14]
++	_ = x[stateJSBlockCmt-15]
++	_ = x[stateJSLineCmt-16]
++	_ = x[stateCSS-17]
++	_ = x[stateCSSDqStr-18]
++	_ = x[stateCSSSqStr-19]
++	_ = x[stateCSSDqURL-20]
++	_ = x[stateCSSSqURL-21]
++	_ = x[stateCSSURL-22]
++	_ = x[stateCSSBlockCmt-23]
++	_ = x[stateCSSLineCmt-24]
++	_ = x[stateError-25]
++	_ = x[stateDead-26]
++}
++
++const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
+
+-var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286, 296}
++var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 283, 298, 308, 317}
+
+ func (i state) String() string {
+	if i >= state(len(_state_index)-1) {
 diff --git a/src/html/template/transition.go b/src/html/template/transition.go
 index 06df679..92eb351 100644
 --- a/src/html/template/transition.go
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
index 85c6ec97c8..503a4a288a 100644
--- a/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
@@ -32,11 +32,11 @@ CVE: CVE-2023-39318
 Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
 ---
  src/html/template/context.go      |  6 ++-
- src/html/template/escape.go       |  5 +-
- src/html/template/escape_test.go  | 10 ++++
- src/html/template/state_string.go |  4 +-
- src/html/template/transition.go   | 80 ++++++++++++++++++++-----------
- 5 files changed, 72 insertions(+), 33 deletions(-)
+ src/html/template/escape.go       |  5 ++-
+ src/html/template/escape_test.go  | 10 +++++
+ src/html/template/state_string.go | 26 +++++++------
+ src/html/template/transition.go   | 80 +++++++++++++++++++++++++--------------
+ 5 files changed, 84 insertions(+), 43 deletions(-)
 
 diff --git a/src/html/template/context.go b/src/html/template/context.go
 index f5f44a1..feb6517 100644
@@ -105,14 +105,38 @@ diff --git a/src/html/template/state_string.go b/src/html/template/state_string.
 index 05104be..b5cfe70 100644
 --- a/src/html/template/state_string.go
 +++ b/src/html/template/state_string.go
-@@ -4,9 +4,9 @@ package template
- 
- import "strconv"
+@@ -25,21 +25,23 @@ func _() {
+ 	_ = x[stateJSRegexp-14]
+ 	_ = x[stateJSBlockCmt-15]
+ 	_ = x[stateJSLineCmt-16]
+-	_ = x[stateCSS-17]
+-	_ = x[stateCSSDqStr-18]
+-	_ = x[stateCSSSqStr-19]
+-	_ = x[stateCSSDqURL-20]
+-	_ = x[stateCSSSqURL-21]
+-	_ = x[stateCSSURL-22]
+-	_ = x[stateCSSBlockCmt-23]
+-	_ = x[stateCSSLineCmt-24]
+-	_ = x[stateError-25]
+-	_ = x[stateDead-26]
++	_ = x[stateJSHTMLOpenCmt-17]
++	_ = x[stateJSHTMLCloseCmt-18]
++	_ = x[stateCSS-19]
++	_ = x[stateCSSDqStr-20]
++	_ = x[stateCSSSqStr-21]
++	_ = x[stateCSSDqURL-22]
++	_ = x[stateCSSSqURL-23]
++	_ = x[stateCSSURL-24]
++	_ = x[stateCSSBlockCmt-25]
++	_ = x[stateCSSLineCmt-26]
++	_ = x[stateError-27]
++	_ = x[stateDead-28]
+ }
  
--const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
+-const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
 +const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
  
--var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286, 296}
+-var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 204, 217, 230, 243, 256, 267, 283, 298, 308, 317}
 +var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293, 304, 320, 335, 345, 354}
  
  func (i state) String() string {
-- 
2.33.0


