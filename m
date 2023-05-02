Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A612C77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:13:44 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.160.1683044015999919320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 09:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=XDgLJhWv;
 spf=pass (domain: mvista.com, ip: 209.85.215.172, mailfrom: skulkarni@mvista.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-51f597c975fso3552371a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683044015; x=1685636015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MMe7sufch0wBcSELG1wYbHFssLYeU8jDU9uoRCW/8AE=;
        b=XDgLJhWvAqAGr6WUDr7Y7z2Hv94OZLXCCt+AhMGx7QNyuckPAiroCtQfkSa1FQlDov
         YZl2vdSv2R/V9F2rahkw+y6jcc9Hc0qzVwqUUCJtfiEjhNhvJrgyomaicO1j+AyHiUse
         IonCztJ5R0A0ymORA5mnj+GzXGF/m+zd7aJf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683044015; x=1685636015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MMe7sufch0wBcSELG1wYbHFssLYeU8jDU9uoRCW/8AE=;
        b=RPvT+kK6Xf3XHBI1EmrqrcKo+mKxNhPHAFWGb8b1aRHgXbnEya8w6O89IkJJGURnvC
         cyPklRgYph14sawmzaP8FUQ0xQ2NCHFn0kHiwi34m2ZzMQAl67qYEjzZ5oZt945RB4D/
         Twg6jLB5W5HB3sjtIbzyksRZgtXU1HKimnkIOI2mcGHlJJhVkG4uNTheipViodNsR/+a
         GIPkOFHOTUGDYZK270SOHbteSzREJbig0tRIc5OzOg2Lif3azjKOAOZX3Y9VcPHPwWxu
         90GQFKOol9JQr42sE6txmBYOwdOEdtE15X4x501NuT1l1iEtlK223pygOei4n+al4HFU
         H89g==
X-Gm-Message-State: AC+VfDz7rYwzFkj74+bZfQSKcKBQCL/aoOIDakYHUCPBj8riFn/s3uFy
	RbelGAPh8yfENGLoVz5w02rd39Vu0zMyMuQmdOU=
X-Google-Smtp-Source: ACHHUZ6TvAfeUMQUT1o9sADTpPHdWzv2VEoJlwfwyEQ2rDDaSvxJIiHkPU+fDBSXi0ZUEy/S68tGWw==
X-Received: by 2002:a17:902:db03:b0:1a9:8ff5:af51 with SMTP id m3-20020a170902db0300b001a98ff5af51mr24519555plx.60.1683044014798;
        Tue, 02 May 2023 09:13:34 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id fu2-20020a17090ad18200b0024dfcaed451sm3923815pjb.52.2023.05.02.09.13.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2023 09:13:34 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2] go: Security fix for CVE-2023-24538
Date: Tue,  2 May 2023 21:43:24 +0530
Message-Id: <20230502161324.15213-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 16:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180752

From: Shubham Kulkarni <skulkarni@mvista.com>

html/template: disallow actions in JS template literals

Backport from https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-24538.patch           | 208 ++++++++++++++++++
 2 files changed, 209 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index c5260569e2..d7cb47ebf4 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -29,6 +29,7 @@ SRC_URI += "\
     file://CVE-2022-41722.patch \
     file://CVE-2023-24537.patch \
     file://CVE-2023-24534.patch \
+    file://CVE-2023-24538.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch
new file mode 100644
index 0000000000..502486befc
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24538.patch
@@ -0,0 +1,208 @@
+From 07cc3b8711a8efbb5885f56dd90d854049ad2f7d Mon Sep 17 00:00:00 2001
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
+ src/html/template/error.go        | 13 +++++++++++++
+ src/html/template/escape.go       | 11 +++++++++++
+ src/html/template/js.go           |  2 ++
+ src/html/template/jsctx_string.go |  9 +++++++++
+ src/html/template/transition.go   |  7 ++++++-
+ 6 files changed, 43 insertions(+), 1 deletion(-)
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


