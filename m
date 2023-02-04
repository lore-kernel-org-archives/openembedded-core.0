Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3EEC63797
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:48:53 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.16751.1675547329971330315
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:48:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=h8LdJhQO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 7so5912780pga.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 13:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgMt9euIILGBvyURL5iNj07dNozpkZ4TwiugN/tNwYE=;
        b=h8LdJhQOpEzmCj5YZsyKjRkEznj44NM/s7u4ngox2HVRTYuu+1QRSKGtWjiAIVFit/
         os+ejLHJvH/w1kAL+JPs/oVqLEONwZE8XSsa0S/gOeEyFnzjNJQjBsegVGwYGXSpB3Yi
         qfAmpKF4vMt6738r8ydwI82hr7UiFTA2cXs5JIZwP1diiE1lS3oscezPRe5gLULAx41L
         hpFLfap3Q7xPnRzL2gX9aphOaHFTwQcrmOibVG+NHz5oaGTbixCjV59wUPuZWQe49+ma
         my4xrI+t3Q+7BFFwNtieNdYnSCgccgO7a+gMUDIgcB9vcW+iS4XAIbquppHs2P5bvhTf
         wRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgMt9euIILGBvyURL5iNj07dNozpkZ4TwiugN/tNwYE=;
        b=W4wZvGn3M1VMsjuDzqWvSTcSkZWJdWyF2SqC1yAg//UEbwUT5SaCnhOf9OP6Ih/EbN
         ZqzWB2BP0RGzgBfu2gISKfs78eB/Aa1i3FuEI4d4KqSNsyqhSrki5dKLi39L9dYTAhJd
         glLxDqGygWqpio//BFOgRdmA4cQZmRSMcsgpQCwPg3zWk4kLRRZuTmkakLcWTddkvPk+
         zzh9h+ZH3lpWJH2LvTayyri6Dvuh3Ozim9d2e2+oFqWPfR+k0aEthI+6UaOnawedGyKC
         hGvlqaFFQYYnw0Wzu/7QoTVN1GPLsAQmL8ZaogsKLGUDkVRS0ZexFj0mGVVFaxT9FA4Q
         gxtA==
X-Gm-Message-State: AO0yUKU3yQLV9aspzqDEW1JjbvSslOAcFJqIMeLT1tWt3PuMw0Ix9ByE
	QXjaZKasf8YZ1rm/ak5cC1QYUkqDWb+rqy0tTHM=
X-Google-Smtp-Source: AK7set+EpJMQf1HWc+qjVSsIH9NhzkHle72i3X0LmnLhfHBhzAjn47PT2HAFe0L8vyAFSg/EgNxAwg==
X-Received: by 2002:a05:6a00:3498:b0:593:1405:943 with SMTP id cp24-20020a056a00349800b0059314050943mr14953865pfb.15.1675547328713;
        Sat, 04 Feb 2023 13:48:48 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h4-20020a056a001a4400b00590774b9ea1sm4150960pfv.107.2023.02.04.13.48.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Feb 2023 13:48:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] go: fix CVE-2022-1962 go/parser stack exhaustion in all Parse* functions
Date: Sat,  4 Feb 2023 11:48:27 -1000
Message-Id: <3126830360ca431fb5eecf3d1e5fde7e928b1365.1675547139.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675547139.git.steve@sakoman.com>
References: <cover.1675547139.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176769

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-1962.patch            | 357 ++++++++++++++++++
 2 files changed, 358 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 1d97001654..be9abb5b2d 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -51,6 +51,7 @@ SRC_URI += "\
     file://CVE-2022-28327.patch \
     file://CVE-2022-41715.patch \
     file://CVE-2022-41717.patch \
+    file://CVE-2022-1962.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
new file mode 100644
index 0000000000..b2ab5d0669
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-1962.patch
@@ -0,0 +1,357 @@
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
+ src/go/parser/parser.go      |  48 ++++++++--
+ src/go/parser/parser_test.go | 169 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 220 insertions(+), 7 deletions(-)
+
+diff --git a/src/go/parser/interface.go b/src/go/parser/interface.go
+index 54f9d7b..537b327 100644
+--- a/src/go/parser/interface.go
++++ b/src/go/parser/interface.go
+@@ -92,8 +92,11 @@ func ParseFile(fset *token.FileSet, filename string, src interface{}, mode Mode)
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
+@@ -188,8 +191,11 @@ func ParseExprFrom(fset *token.FileSet, filename string, src interface{}, mode M
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
+index 31a7398..586fe90 100644
+--- a/src/go/parser/parser.go
++++ b/src/go/parser/parser.go
+@@ -64,6 +64,10 @@ type parser struct {
+ 	unresolved []*ast.Ident      // unresolved identifiers
+ 	imports    []*ast.ImportSpec // list of imports
+ 
++	// nestLev is used to track and limit the recursion depth
++	// during parsing.
++	nestLev int
++	
+ 	// Label scopes
+ 	// (maintained by open/close LabelScope)
+ 	labelScope  *ast.Scope     // label scope for current function
+@@ -236,6 +240,24 @@ func un(p *parser) {
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
+@@ -348,8 +370,12 @@ func (p *parser) next() {
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
+ 	epos := p.file.Position(pos)
+@@ -1030,6 +1056,8 @@ func (p *parser) parseChanType() *ast.ChanType {
+ 
+ // If the result is an identifier, it is not resolved.
+ func (p *parser) tryIdentOrType() ast.Expr {
++	defer decNestLev(incNestLev(p))
++
+ 	switch p.tok {
+ 	case token.IDENT:
+ 		return p.parseTypeName()
+@@ -1609,7 +1637,13 @@ func (p *parser) parseBinaryExpr(lhs bool, prec1 int) ast.Expr {
+ 	}
+ 
+ 	x := p.parseUnaryExpr(lhs)
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
+@@ -1628,7 +1662,7 @@ func (p *parser) parseBinaryExpr(lhs bool, prec1 int) ast.Expr {
+ // The result may be a type or even a raw type ([...]int). Callers must
+ // check the result (using checkExpr or checkExprOrType), depending on
+ // context.
+-func (p *parser) parseExpr(lhs bool) ast.Expr {
++func (p *parser) parseExpr(lhs bool) ast.Expr {    
+ 	if p.trace {
+ 		defer un(trace(p, "Expression"))
+ 	}
+@@ -1899,6 +1933,8 @@ func (p *parser) parseIfHeader() (init ast.Stmt, cond ast.Expr) {
+ }
+ 
+ func (p *parser) parseIfStmt() *ast.IfStmt {
++	defer decNestLev(incNestLev(p))
++
+ 	if p.trace {
+ 		defer un(trace(p, "IfStmt"))
+ 	}
+@@ -2214,6 +2250,8 @@ func (p *parser) parseForStmt() ast.Stmt {
+ }
+ 
+ func (p *parser) parseStmt() (s ast.Stmt) {
++	defer decNestLev(incNestLev(p))
++
+ 	if p.trace {
+ 		defer un(trace(p, "Statement"))
+ 	}
+diff --git a/src/go/parser/parser_test.go b/src/go/parser/parser_test.go
+index 25a374e..37a6a2b 100644
+--- a/src/go/parser/parser_test.go
++++ b/src/go/parser/parser_test.go
+@@ -10,6 +10,7 @@ import (
+ 	"go/ast"
+ 	"go/token"
+ 	"os"
++	"runtime"
+ 	"strings"
+ 	"testing"
+ )
+@@ -569,3 +570,171 @@ type x int // comment
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
+-- 
+2.30.2
+
-- 
2.25.1


