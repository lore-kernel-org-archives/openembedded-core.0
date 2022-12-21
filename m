Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB27EC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 16:32:34 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.23057.1671640351056425805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 08:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DpSswcYq;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so2824646pje.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 08:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NZSWeYHsLVaMwJJqlZJSVIxbrWZIlW30h9bWFDuK0x4=;
        b=DpSswcYq6/vW2S3asiOEiRLIuSjxZGzSmOE6bYgCizQDkq1IgHvPQmsS4dR7qfMsTE
         xmEVvRcGS+5drCCkugyHm5RKMXcmDKIRAac52gFpQy+OlJmpycgZBChSa4JLz/Ga0wEm
         8hWQWU5CC+svmCIlr2gMdH4Vg0TfdX3wphiPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZSWeYHsLVaMwJJqlZJSVIxbrWZIlW30h9bWFDuK0x4=;
        b=DhV1REqTiiN7PqfNpfljf3gt9uyqXVD4ZoAU0OcVX5EPnUDEFXqrMSyxk36yykA7HH
         YXH9ijppXGoau4jZvGWju0dttBhbTGwZjzBdK9+Sn+x7iVHxtu716e6bBzO6tlpQII6P
         C3dSrCauca1FUmVa6En/QIqs4qKYE87en6g3O8YAshWrM2EJxLIJycO65mWI73QTE5EV
         znIEQpGxITHMyXRrOpjpNqmyGmY327Nn4BnULEw04v+74VDm7dtQRwtkVhIvFViCSpvP
         PhhVYr2DZEzXg8Wca0kckP6DhfjSVpnBBn46gEesiHS/NPl9lq5TjvbkOtvKItvTI8Wu
         8P+Q==
X-Gm-Message-State: AFqh2kobnY1rFvghG1ha99xmjCnxTGj38CGeUoKf5jrMoLNvAUUr3iQ4
	5ekw+lppNXet/0/i3NBDShCLMoRaDcIUVMKi
X-Google-Smtp-Source: AMrXdXuw3qL+sM7vOYn1o45JTDH5wytOGISQmIiAzlB2cqHqqcgaROKpZeDNahHJlUVDQbhNRH4iZg==
X-Received: by 2002:a17:902:904b:b0:186:95c9:ddc9 with SMTP id w11-20020a170902904b00b0018695c9ddc9mr2004547plz.55.1671640349493;
        Wed, 21 Dec 2022 08:32:29 -0800 (PST)
Received: from vkumbhar-latitude3400.mvista.com ([116.74.134.6])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902db0900b00189d4c666c8sm11663296plx.153.2022.12.21.08.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 08:32:29 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
X-Google-Original-From: Vivek Kumbhar <vkumbhar@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: fix CVE-2022-1962 go/parser stack exhaustion in all Parse* functions
Date: Wed, 21 Dec 2022 22:02:16 +0530
Message-Id: <20221221163216.1758961-1-vkumbhar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 16:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174921

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-1962.patch            | 421 ++++++++++++++++++
 2 files changed, 422 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index cec37c1b09..0361bc763b 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -49,6 +49,7 @@ SRC_URI += "\
     file://CVE-2022-24921.patch \
     file://CVE-2022-28131.patch \
     file://CVE-2022-28327.patch \
+    file://CVE-2022-1962.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
new file mode 100644
index 0000000000..ceabc9057a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
@@ -0,0 +1,421 @@
+From ba8788ebcead55e99e631c6a1157ad7b35535d11 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Wed, 15 Jun 2022 10:43:05 -0700
+Subject: [PATCH] [release-branch.go1.17] go/parser: limit recursion depth
+
+Limit nested parsing to 100,000, which prevents stack exhaustion when
+parsing deeply nested statements, types, and expressions. Also limit
+the scope depth to 1,000 during object resolution.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #53707
+Updates #53616
+Fixes CVE-2022-1962
+
+Change-Id: I4d7b86c1d75d0bf3c7af1fdea91582aa74272c64
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1491025
+Reviewed-by: Russ Cox <rsc@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 6a856f08d58e4b6705c0c337d461c540c1235c83)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/417070
+Reviewed-by: Heschi Kreinick <heschi@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/ba8788ebcead55e99e631c6a1157ad7b35535d11]
+CVE: CVE-2022-1962
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/go/parser/interface.go   |  10 ++-
+ src/go/parser/parser.go      |  54 ++++++++++-
+ src/go/parser/parser_test.go | 169 +++++++++++++++++++++++++++++++++++
+ src/go/parser/resolver.go    |   9 ++
+ 4 files changed, 236 insertions(+), 6 deletions(-)
+
+diff --git a/src/go/parser/interface.go b/src/go/parser/interface.go
+index 85486d2f4b..eae429e6ef 100644
+--- a/src/go/parser/interface.go
++++ b/src/go/parser/interface.go
+@@ -97,8 +97,11 @@ func ParseFile(fset *token.FileSet, filename string, src interface{}, mode Mode)
+ 	defer func() {
+ 		if e := recover(); e != nil {
+ 			// resume same panic if it's not a bailout
+-			if _, ok := e.(bailout); !ok {
++			bail, ok := e.(bailout)
++			if !ok {
+ 				panic(e)
++			} else if bail.msg != "" {
++				p.errors.Add(p.file.Position(bail.pos), bail.msg)
+ 			}
+ 		}
+ 
+@@ -203,8 +206,11 @@ func ParseExprFrom(fset *token.FileSet, filename string, src interface{}, mode M
+ 	defer func() {
+ 		if e := recover(); e != nil {
+ 			// resume same panic if it's not a bailout
+-			if _, ok := e.(bailout); !ok {
++			bail, ok := e.(bailout)
++			if !ok {
+ 				panic(e)
++			} else if bail.msg != "" {
++				p.errors.Add(p.file.Position(bail.pos), bail.msg)
+ 			}
+ 		}
+ 		p.errors.Sort()
+diff --git a/src/go/parser/parser.go b/src/go/parser/parser.go
+index f10c8650af..2c42b9f8cc 100644
+--- a/src/go/parser/parser.go
++++ b/src/go/parser/parser.go
+@@ -60,6 +60,10 @@ type parser struct {
+ 	inRhs   bool // if set, the parser is parsing a rhs expression
+ 
+ 	imports []*ast.ImportSpec // list of imports
++
++	// nestLev is used to track and limit the recursion depth
++	// during parsing.
++	nestLev int
+ }
+ 
+ func (p *parser) init(fset *token.FileSet, filename string, src []byte, mode Mode) {
+@@ -110,6 +114,24 @@ func un(p *parser) {
+ 	p.printTrace(")")
+ }
+ 
++// maxNestLev is the deepest we're willing to recurse during parsing
++const maxNestLev int = 1e5
++
++func incNestLev(p *parser) *parser {
++	p.nestLev++
++	if p.nestLev > maxNestLev {
++		p.error(p.pos, "exceeded max nesting depth")
++		panic(bailout{})
++	}
++	return p
++}
++
++// decNestLev is used to track nesting depth during parsing to prevent stack exhaustion.
++// It is used along with incNestLev in a similar fashion to how un and trace are used.
++func decNestLev(p *parser) {
++	p.nestLev--
++}
++
+ // Advance to the next token.
+ func (p *parser) next0() {
+ 	// Because of one-token look-ahead, print the previous token
+@@ -222,8 +244,12 @@ func (p *parser) next() {
+ 	}
+ }
+ 
+-// A bailout panic is raised to indicate early termination.
+-type bailout struct{}
++// A bailout panic is raised to indicate early termination. pos and msg are
++// only populated when bailing out of object resolution.
++type bailout struct {
++	pos token.Pos
++	msg string
++}
+ 
+ func (p *parser) error(pos token.Pos, msg string) {
+ 	if p.trace {
+@@ -1119,6 +1145,8 @@ func (p *parser) parseTypeInstance(typ ast.Expr) ast.Expr {
+ }
+ 
+ func (p *parser) tryIdentOrType() ast.Expr {
++	defer decNestLev(incNestLev(p))
++
+ 	switch p.tok {
+ 	case token.IDENT:
+ 		typ := p.parseTypeName(nil)
+@@ -1531,7 +1559,13 @@ func (p *parser) parsePrimaryExpr() (x ast.Expr) {
+ 	}
+ 
+ 	x = p.parseOperand()
+-	for {
++	// We track the nesting here rather than at the entry for the function,
++	// since it can iteratively produce a nested output, and we want to
++	// limit how deep a structure we generate.
++	var n int
++	defer func() { p.nestLev -= n }()
++	for n = 1; ; n++ {
++		incNestLev(p)
+ 		switch p.tok {
+ 		case token.PERIOD:
+ 			p.next()
+@@ -1591,6 +1625,8 @@ func (p *parser) parsePrimaryExpr() (x ast.Expr) {
+ }
+ 
+ func (p *parser) parseUnaryExpr() ast.Expr {
++	defer decNestLev(incNestLev(p))
++
+ 	if p.trace {
+ 		defer un(trace(p, "UnaryExpr"))
+ 	}
+@@ -1673,7 +1709,13 @@ func (p *parser) parseBinaryExpr(prec1 int) ast.Expr {
+ 	}
+ 
+ 	x := p.parseUnaryExpr()
+-	for {
++	// We track the nesting here rather than at the entry for the function,
++	// since it can iteratively produce a nested output, and we want to
++	// limit how deep a structure we generate.
++	var n int
++	defer func() { p.nestLev -= n }()
++	for n = 1; ; n++ {
++		incNestLev(p)
+ 		op, oprec := p.tokPrec()
+ 		if oprec < prec1 {
+ 			return x
+@@ -1962,6 +2004,8 @@ func (p *parser) parseIfHeader() (init ast.Stmt, cond ast.Expr) {
+ }
+ 
+ func (p *parser) parseIfStmt() *ast.IfStmt {
++	defer decNestLev(incNestLev(p))
++
+ 	if p.trace {
+ 		defer un(trace(p, "IfStmt"))
+ 	}
+@@ -2265,6 +2309,8 @@ func (p *parser) parseForStmt() ast.Stmt {
+ }
+ 
+ func (p *parser) parseStmt() (s ast.Stmt) {
++	defer decNestLev(incNestLev(p))
++
+ 	if p.trace {
+ 		defer un(trace(p, "Statement"))
+ 	}
+diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
+index a4f882d368..1a46c87866 100644
+--- a/src/go/parser/parser_test.go
++++ b/src/go/parser/parser_test.go
+@@ -10,6 +10,7 @@ import (
+ 	"go/ast"
+ 	"go/token"
+ 	"io/fs"
++	"runtime"
+ 	"strings"
+ 	"testing"
+ )
+@@ -577,3 +578,171 @@ type x int // comment
+ 		t.Errorf("got %q, want %q", comment, "// comment")
+ 	}
+ }
++
++var parseDepthTests = []struct {
++	name   string
++	format string
++	// multipler is used when a single statement may result in more than one
++	// change in the depth level, for instance "1+(..." produces a BinaryExpr
++	// followed by a UnaryExpr, which increments the depth twice. The test
++	// case comment explains which nodes are triggering the multiple depth
++	// changes.
++	parseMultiplier int
++	// scope is true if we should also test the statement for the resolver scope
++	// depth limit.
++	scope bool
++	// scopeMultiplier does the same as parseMultiplier, but for the scope
++	// depths.
++	scopeMultiplier int
++}{
++	// The format expands the part inside « » many times.
++	// A second set of brackets nested inside the first stops the repetition,
++	// so that for example «(«1»)» expands to (((...((((1))))...))).
++	{name: "array", format: "package main; var x «[1]»int"},
++	{name: "slice", format: "package main; var x «[]»int"},
++	{name: "struct", format: "package main; var x «struct { X «int» }»", scope: true},
++	{name: "pointer", format: "package main; var x «*»int"},
++	{name: "func", format: "package main; var x «func()»int", scope: true},
++	{name: "chan", format: "package main; var x «chan »int"},
++	{name: "chan2", format: "package main; var x «<-chan »int"},
++	{name: "interface", format: "package main; var x «interface { M() «int» }»", scope: true, scopeMultiplier: 2}, // Scopes: InterfaceType, FuncType
++	{name: "map", format: "package main; var x «map[int]»int"},
++	{name: "slicelit", format: "package main; var x = «[]any{«»}»", parseMultiplier: 2},             // Parser nodes: UnaryExpr, CompositeLit
++	{name: "arraylit", format: "package main; var x = «[1]any{«nil»}»", parseMultiplier: 2},         // Parser nodes: UnaryExpr, CompositeLit
++	{name: "structlit", format: "package main; var x = «struct{x any}{«nil»}»", parseMultiplier: 2}, // Parser nodes: UnaryExpr, CompositeLit
++	{name: "maplit", format: "package main; var x = «map[int]any{1:«nil»}»", parseMultiplier: 2},    // Parser nodes: CompositeLit, KeyValueExpr
++	{name: "dot", format: "package main; var x = «x.»x"},
++	{name: "index", format: "package main; var x = x«[1]»"},
++	{name: "slice", format: "package main; var x = x«[1:2]»"},
++	{name: "slice3", format: "package main; var x = x«[1:2:3]»"},
++	{name: "dottype", format: "package main; var x = x«.(any)»"},
++	{name: "callseq", format: "package main; var x = x«()»"},
++	{name: "methseq", format: "package main; var x = x«.m()»", parseMultiplier: 2}, // Parser nodes: SelectorExpr, CallExpr
++	{name: "binary", format: "package main; var x = «1+»1"},
++	{name: "binaryparen", format: "package main; var x = «1+(«1»)»", parseMultiplier: 2}, // Parser nodes: BinaryExpr, ParenExpr
++	{name: "unary", format: "package main; var x = «^»1"},
++	{name: "addr", format: "package main; var x = «& »x"},
++	{name: "star", format: "package main; var x = «*»x"},
++	{name: "recv", format: "package main; var x = «<-»x"},
++	{name: "call", format: "package main; var x = «f(«1»)»", parseMultiplier: 2},    // Parser nodes: Ident, CallExpr
++	{name: "conv", format: "package main; var x = «(*T)(«1»)»", parseMultiplier: 2}, // Parser nodes: ParenExpr, CallExpr
++	{name: "label", format: "package main; func main() { «Label:» }"},
++	{name: "if", format: "package main; func main() { «if true { «» }»}", parseMultiplier: 2, scope: true, scopeMultiplier: 2}, // Parser nodes: IfStmt, BlockStmt. Scopes: IfStmt, BlockStmt
++	{name: "ifelse", format: "package main; func main() { «if true {} else » {} }", scope: true},
++	{name: "switch", format: "package main; func main() { «switch { default: «» }»}", scope: true, scopeMultiplier: 2},               // Scopes: TypeSwitchStmt, CaseClause
++	{name: "typeswitch", format: "package main; func main() { «switch x.(type) { default: «» }» }", scope: true, scopeMultiplier: 2}, // Scopes: TypeSwitchStmt, CaseClause
++	{name: "for0", format: "package main; func main() { «for { «» }» }", scope: true, scopeMultiplier: 2},                            // Scopes: ForStmt, BlockStmt
++	{name: "for1", format: "package main; func main() { «for x { «» }» }", scope: true, scopeMultiplier: 2},                          // Scopes: ForStmt, BlockStmt
++	{name: "for3", format: "package main; func main() { «for f(); g(); h() { «» }» }", scope: true, scopeMultiplier: 2},              // Scopes: ForStmt, BlockStmt
++	{name: "forrange0", format: "package main; func main() { «for range x { «» }» }", scope: true, scopeMultiplier: 2},               // Scopes: RangeStmt, BlockStmt
++	{name: "forrange1", format: "package main; func main() { «for x = range z { «» }» }", scope: true, scopeMultiplier: 2},           // Scopes: RangeStmt, BlockStmt
++	{name: "forrange2", format: "package main; func main() { «for x, y = range z { «» }» }", scope: true, scopeMultiplier: 2},        // Scopes: RangeStmt, BlockStmt
++	{name: "go", format: "package main; func main() { «go func() { «» }()» }", parseMultiplier: 2, scope: true},                      // Parser nodes: GoStmt, FuncLit
++	{name: "defer", format: "package main; func main() { «defer func() { «» }()» }", parseMultiplier: 2, scope: true},                // Parser nodes: DeferStmt, FuncLit
++	{name: "select", format: "package main; func main() { «select { default: «» }» }", scope: true},
++}
++
++// split splits pre«mid»post into pre, mid, post.
++// If the string does not have that form, split returns x, "", "".
++func split(x string) (pre, mid, post string) {
++	start, end := strings.Index(x, "«"), strings.LastIndex(x, "»")
++	if start < 0 || end < 0 {
++		return x, "", ""
++	}
++	return x[:start], x[start+len("«") : end], x[end+len("»"):]
++}
++
++func TestParseDepthLimit(t *testing.T) {
++	if runtime.GOARCH == "wasm" {
++		t.Skip("causes call stack exhaustion on js/wasm")
++	}
++	for _, tt := range parseDepthTests {
++		for _, size := range []string{"small", "big"} {
++			t.Run(tt.name+"/"+size, func(t *testing.T) {
++				n := maxNestLev + 1
++				if tt.parseMultiplier > 0 {
++					n /= tt.parseMultiplier
++				}
++				if size == "small" {
++					// Decrease the number of statements by 10, in order to check
++					// that we do not fail when under the limit. 10 is used to
++					// provide some wiggle room for cases where the surrounding
++					// scaffolding syntax adds some noise to the depth that changes
++					// on a per testcase basis.
++					n -= 10
++				}
++
++				pre, mid, post := split(tt.format)
++				if strings.Contains(mid, "«") {
++					left, base, right := split(mid)
++					mid = strings.Repeat(left, n) + base + strings.Repeat(right, n)
++				} else {
++					mid = strings.Repeat(mid, n)
++				}
++				input := pre + mid + post
++
++				fset := token.NewFileSet()
++				_, err := ParseFile(fset, "", input, ParseComments|SkipObjectResolution)
++				if size == "small" {
++					if err != nil {
++						t.Errorf("ParseFile(...): %v (want success)", err)
++					}
++				} else {
++					expected := "exceeded max nesting depth"
++					if err == nil || !strings.HasSuffix(err.Error(), expected) {
++						t.Errorf("ParseFile(...) = _, %v, want %q", err, expected)
++					}
++				}
++			})
++		}
++	}
++}
++
++func TestScopeDepthLimit(t *testing.T) {
++	if runtime.GOARCH == "wasm" {
++		t.Skip("causes call stack exhaustion on js/wasm")
++	}
++	for _, tt := range parseDepthTests {
++		if !tt.scope {
++			continue
++		}
++		for _, size := range []string{"small", "big"} {
++			t.Run(tt.name+"/"+size, func(t *testing.T) {
++				n := maxScopeDepth + 1
++				if tt.scopeMultiplier > 0 {
++					n /= tt.scopeMultiplier
++				}
++				if size == "small" {
++					// Decrease the number of statements by 10, in order to check
++					// that we do not fail when under the limit. 10 is used to
++					// provide some wiggle room for cases where the surrounding
++					// scaffolding syntax adds some noise to the depth that changes
++					// on a per testcase basis.
++					n -= 10
++				}
++
++				pre, mid, post := split(tt.format)
++				if strings.Contains(mid, "«") {
++					left, base, right := split(mid)
++					mid = strings.Repeat(left, n) + base + strings.Repeat(right, n)
++				} else {
++					mid = strings.Repeat(mid, n)
++				}
++				input := pre + mid + post
++
++				fset := token.NewFileSet()
++				_, err := ParseFile(fset, "", input, DeclarationErrors)
++				if size == "small" {
++					if err != nil {
++						t.Errorf("ParseFile(...): %v (want success)", err)
++					}
++				} else {
++					expected := "exceeded max scope depth during object resolution"
++					if err == nil || !strings.HasSuffix(err.Error(), expected) {
++						t.Errorf("ParseFile(...) = _, %v, want %q", err, expected)
++					}
++				}
++			})
++		}
++	}
++}
+diff --git a/src/go/parser/resolver.go b/src/go/parser/resolver.go
+index cf92c7e4f5..f55bdb7f17 100644
+--- a/src/go/parser/resolver.go
++++ b/src/go/parser/resolver.go
+@@ -25,6 +25,7 @@ func resolveFile(file *ast.File, handle *token.File, declErr func(token.Pos, str
+ 		declErr:  declErr,
+ 		topScope: pkgScope,
+ 		pkgScope: pkgScope,
++		depth:    1,
+ 	}
+ 
+ 	for _, decl := range file.Decls {
+@@ -53,6 +54,8 @@ func resolveFile(file *ast.File, handle *token.File, declErr func(token.Pos, str
+ 	file.Unresolved = r.unresolved[0:i]
+ }
+ 
++const maxScopeDepth int = 1e3
++
+ type resolver struct {
+ 	handle  *token.File
+ 	declErr func(token.Pos, string)
+@@ -61,6 +64,7 @@ type resolver struct {
+ 	pkgScope   *ast.Scope   // pkgScope.Outer == nil
+ 	topScope   *ast.Scope   // top-most scope; may be pkgScope
+ 	unresolved []*ast.Ident // unresolved identifiers
++	depth      int          // scope depth
+ 
+ 	// Label scopes
+ 	// (maintained by open/close LabelScope)
+@@ -83,6 +87,10 @@ func (r *resolver) sprintf(format string, args ...interface{}) string {
+ }
+ 
+ func (r *resolver) openScope(pos token.Pos) {
++	r.depth++
++	if r.depth > maxScopeDepth {
++		panic(bailout{pos: pos, msg: "exceeded max scope depth during object resolution"})
++	}
+ 	if debugResolve {
+ 		r.dump("opening scope @%v", pos)
+ 	}
+@@ -90,6 +98,7 @@ func (r *resolver) openScope(pos token.Pos) {
+ }
+ 
+ func (r *resolver) closeScope() {
++	r.depth--
+ 	if debugResolve {
+ 		r.dump("closing scope")
+ 	}
+-- 
+2.30.2
+
-- 
2.30.2


