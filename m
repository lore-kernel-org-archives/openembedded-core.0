Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67B3C77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 05:37:19 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.44491.1682314634405698306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Apr 2023 22:37:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=CQK05LjL;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b70f0b320so5556161b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Apr 2023 22:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682314633; x=1684906633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1RCW2CAZ9qYptZL077QgvC1Mv/18IC+SLCTHPu20Zzw=;
        b=CQK05LjLsr2wr2Eh4SrF/0Kh9/Sbj5Ex3WSojdbmrYSWJxxNUc/Vf7zhvjHPC2iNFq
         1j8G2Jlqk9Lro5bhlLKD65lkWAJq+Tb7VcUt5ZahqpF8jZiq43AEZuMiPwAmAAxMdBW8
         DPySVhwHdiCpKKS+NnteVINuRHRuZ93K8lJD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682314633; x=1684906633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RCW2CAZ9qYptZL077QgvC1Mv/18IC+SLCTHPu20Zzw=;
        b=dHIcqBrmOPihjQj4IXyBN5Vlw7KAiw0iMwV9xuDDJyjrvyvpy2KDDThp9MR67U50Cz
         4oQy0cubH09QCc45jctREbjmxzIFL4n5KQxjqs3M8CEg7XFBCQAgw5Rz2tM/20ejoI2a
         sNJWYV3mpMbvRKGnQpVS3gyKZR7H71oKORdKLuNUawi1eDrgHUKSKufh23cqzoRS2rGn
         2ZhPf3m4TggJYu6Ao49d+WEZ4GybzwDGUcXlnf/atfDb9wZWa2sczfpKSCg0TAlFrVcT
         L+kHQSOmvrLBpSqEvQzOpaviOn5wUZ/WiTMJSePfl2LVW6OImhDYgxuOg8DAWXb4ydFm
         7Qtw==
X-Gm-Message-State: AAQBX9cqAhpRVsm2wNX924B7TW7r1QRwh19txC9JBt80k3MHsVQcBHPd
	A6G7lBnOPPXTY9CN6GDulsWz2Hk1Xq7wL2I8KSc=
X-Google-Smtp-Source: AKy350blYC0PCE+5azgYBaJ2wWsAJfqFx3yPLyqFT4g8LuoTOhbDwXvjx/zSwUmQ70JgLAQRMYv8LQ==
X-Received: by 2002:a05:6a21:3383:b0:f0:3987:7b33 with SMTP id yy3-20020a056a21338300b000f039877b33mr17721381pzb.42.1682314633092;
        Sun, 23 Apr 2023 22:37:13 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id l26-20020a635b5a000000b0051416609fb7sm5629464pgm.61.2023.04.23.22.37.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Apr 2023 22:37:12 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: Security fix for CVE-2023-24538
Date: Mon, 24 Apr 2023 11:07:06 +0530
Message-Id: <20230424053706.18547-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 05:37:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180337

From: Shubham Kulkarni <skulkarni@mvista.com>

html/template: disallow actions in JS template literals

Backport from https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-24538.patch           | 371 ++++++++++++++++++
 2 files changed, 372 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index cda9227042..1ae811c38a 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -28,6 +28,7 @@ SRC_URI += "\
     file://cve-2022-41725.patch \
     file://CVE-2022-41722.patch \
     file://CVE-2023-24537.patch \
+    file://CVE-2023-24538.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch
new file mode 100644
index 0000000000..118c371dc9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch
@@ -0,0 +1,371 @@
+From 054f2261f69d98073ff141331f85f1794377bf72 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 20 Mar 2023 11:01:13 -0700
+Subject: [PATCH] html/template: disallow actions in JS template literals
+
+ECMAScript 6 introduced template literals[0][1] which are delimited with
+backticks. These need to be escaped in a similar fashion to the
+delimiters for other string literals. Additionally template literals can
+contain special syntax for string interpolation.
+
+There is no clear way to allow safe insertion of actions within JS
+template literals, as handling (JS) string interpolation inside of these
+literals is rather complex. As such we've chosen to simply disallow
+template actions within these template literals.
+
+A new error code is added for this parsing failure case, errJsTmplLit,
+but it is unexported as it is not backwards compatible with other minor
+release versions to introduce an API change in a minor release. We will
+export this code in the next major release.
+
+The previous behavior (with the cavet that backticks are now escaped
+properly) can be re-enabled with GODEBUG=jstmpllitinterp=1.
+
+This change subsumes CL471455.
+
+Thanks to Sohom Datta, Manipal Institute of Technology, for reporting
+this issue.
+
+Fixes CVE-2023-24538
+For #59234
+Fixes #59271
+
+[0] https://tc39.es/ecma262/multipage/ecmascript-language-expressions.html#sec-template-literals
+[1] https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802457
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802612
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Change-Id: Ic7f10595615f2b2740d9c85ad7ef40dc0e78c04c
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481987
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b
+CVE: CVE-2023-24538
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/html/template/context.go      |  2 ++
+ src/html/template/error.go        | 13 ++++++++
+ src/html/template/escape.go       | 11 +++++++
+ src/html/template/escape_test.go  | 66 ++++++++++++++++++++++-----------------
+ src/html/template/js.go           |  2 ++
+ src/html/template/js_test.go      |  2 +-
+ src/html/template/jsctx_string.go |  9 ++++++
+ src/html/template/state_string.go | 37 ++++++++++++++++++++--
+ src/html/template/transition.go   |  7 ++++-
+ 9 files changed, 116 insertions(+), 33 deletions(-)
+
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index f7d4849..0b65313 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -116,6 +116,8 @@ const (
+	stateJSDqStr
+	// stateJSSqStr occurs inside a JavaScript single quoted string.
+	stateJSSqStr
++	// stateJSBqStr occurs inside a JavaScript back quoted string.
++	stateJSBqStr
+	// stateJSRegexp occurs inside a JavaScript regexp literal.
+	stateJSRegexp
+	// stateJSBlockCmt occurs inside a JavaScript /* block comment */.
+diff --git a/src/html/template/error.go b/src/html/template/error.go
+index 0e52706..fd26b64 100644
+--- a/src/html/template/error.go
++++ b/src/html/template/error.go
+@@ -211,6 +211,19 @@ const (
+	//   pipeline occurs in an unquoted attribute value context, "html" is
+	//   disallowed. Avoid using "html" and "urlquery" entirely in new templates.
+	ErrPredefinedEscaper
++
++	// errJSTmplLit: "... appears in a JS template literal"
++	// Example:
++	//     <script>var tmpl = `{{.Interp}`</script>
++	// Discussion:
++	//   Package html/template does not support actions inside of JS template
++	//   literals.
++	//
++	// TODO(rolandshoemaker): we cannot add this as an exported error in a minor
++	// release, since it is backwards incompatible with the other minor
++	// releases. As such we need to leave it unexported, and then we'll add it
++	// in the next major release.
++	errJSTmplLit
+ )
+
+ func (e *Error) Error() string {
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index 8739735..ca078f4 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -8,6 +8,7 @@ import (
+	"bytes"
+	"fmt"
+	"html"
++	"internal/godebug"
+	"io"
+	"text/template"
+	"text/template/parse"
+@@ -205,6 +206,16 @@ func (e *escaper) escapeAction(c context, n *parse.ActionNode) context {
+		c.jsCtx = jsCtxDivOp
+	case stateJSDqStr, stateJSSqStr:
+		s = append(s, "_html_template_jsstrescaper")
++	case stateJSBqStr:
++		debugAllowActionJSTmpl := godebug.Get("jstmpllitinterp")
++		if debugAllowActionJSTmpl == "1" {
++			s = append(s, "_html_template_jsstrescaper")
++		} else {
++			return context{
++				state: stateError,
++				err:   errorf(errJSTmplLit, n, n.Line, "%s appears in a JS template literal", n),
++			}
++		}
+	case stateJSRegexp:
+		s = append(s, "_html_template_jsregexpescaper")
+	case stateCSS:
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index fbc84a7..9d7749f 100644
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
+@@ -920,6 +916,10 @@ func TestErrors(t *testing.T) {
+			"<a href='/foo?{{range .Items}}&{{.K}}={{.V}}{{end}}'>",
+			"",
+		},
++		{
++			"<script>var a = `${a+b}`</script>`",
++			"",
++		},
+		// Error cases.
+		{
+			"{{if .Cond}}<a{{end}}",
+@@ -1058,6 +1058,10 @@ func TestErrors(t *testing.T) {
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
+@@ -1280,6 +1284,10 @@ func TestEscapeText(t *testing.T) {
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
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index ea9c183..b888eaf 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -308,6 +308,7 @@ var jsStrReplacementTable = []string{
+	// Encode HTML specials as hex so the output can be embedded
+	// in HTML attributes without further encoding.
+	'"':  `\u0022`,
++	'`':  `\u0060`,
+	'&':  `\u0026`,
+	'\'': `\u0027`,
+	'+':  `\u002b`,
+@@ -331,6 +332,7 @@ var jsStrNormReplacementTable = []string{
+	'"':  `\u0022`,
+	'&':  `\u0026`,
+	'\'': `\u0027`,
++	'`':  `\u0060`,
+	'+':  `\u002b`,
+	'/':  `\/`,
+	'<':  `\u003c`,
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
+diff --git a/src/html/template/jsctx_string.go b/src/html/template/jsctx_string.go
+index dd1d87e..2394893 100644
+--- a/src/html/template/jsctx_string.go
++++ b/src/html/template/jsctx_string.go
+@@ -4,6 +4,15 @@ package template
+
+ import "strconv"
+
++func _() {
++	// An "invalid array index" compiler error signifies that the constant values have changed.
++	// Re-run the stringer command to generate them again.
++	var x [1]struct{}
++	_ = x[jsCtxRegexp-0]
++	_ = x[jsCtxDivOp-1]
++	_ = x[jsCtxUnknown-2]
++}
++
+ const _jsCtx_name = "jsCtxRegexpjsCtxDivOpjsCtxUnknown"
+
+ var _jsCtx_index = [...]uint8{0, 11, 21, 33}
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
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index 06df679..92eb351 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -27,6 +27,7 @@ var transitionFunc = [...]func(context, []byte) (context, int){
+	stateJS:          tJS,
+	stateJSDqStr:     tJSDelimited,
+	stateJSSqStr:     tJSDelimited,
++	stateJSBqStr:     tJSDelimited,
+	stateJSRegexp:    tJSDelimited,
+	stateJSBlockCmt:  tBlockCmt,
+	stateJSLineCmt:   tLineCmt,
+@@ -262,7 +263,7 @@ func tURL(c context, s []byte) (context, int) {
+
+ // tJS is the context transition function for the JS state.
+ func tJS(c context, s []byte) (context, int) {
+-	i := bytes.IndexAny(s, `"'/`)
++	i := bytes.IndexAny(s, "\"`'/")
+	if i == -1 {
+		// Entire input is non string, comment, regexp tokens.
+		c.jsCtx = nextJSCtx(s, c.jsCtx)
+@@ -274,6 +275,8 @@ func tJS(c context, s []byte) (context, int) {
+		c.state, c.jsCtx = stateJSDqStr, jsCtxRegexp
+	case '\'':
+		c.state, c.jsCtx = stateJSSqStr, jsCtxRegexp
++	case '`':
++		c.state, c.jsCtx = stateJSBqStr, jsCtxRegexp
+	case '/':
+		switch {
+		case i+1 < len(s) && s[i+1] == '/':
+@@ -303,6 +306,8 @@ func tJSDelimited(c context, s []byte) (context, int) {
+	switch c.state {
+	case stateJSSqStr:
+		specials = `\'`
++	case stateJSBqStr:
++		specials = "`\\"
+	case stateJSRegexp:
+		specials = `\/[]`
+	}
+--
+2.7.4
-- 
2.33.0


