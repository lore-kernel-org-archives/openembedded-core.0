Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF98C7EE24
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.36195.1683386704714619180
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=s6joqDDO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso3248588b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386704; x=1685978704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AFa/7sG1eaa45bnNFFw5CkX5fbNiS1ADPc4OD8qpWAM=;
        b=s6joqDDO4gTlyfsp89lETF7XMIYhK8iMD2LS/UF9Do+DdAY+q2tL+FkHJGX2FimvjP
         ZR9a4yjrgbdZkyC/IIuUku1aAS1YUAVkqc54XxTA58hlofptIAVgbi3PCunfbcsyNbdn
         zsWy/uWSqCekLzqKir1n6UlCw5bkyFioc3qeFqgki1w4Vu1+SmmuF/UVDteL7syWVjve
         kco2CSDNeV8HUE+KAQxOhFdSpUz3qDaI9OAQG+7nfJUn1CKGAwKclhBWyHBhjp/AnHvC
         w1iltwcSJZdPTvt2BsTU02acBecaVgLv9RHlbrbMGnBjfrbpKY3w6AXxAeR5FFExGhIo
         x9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386704; x=1685978704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFa/7sG1eaa45bnNFFw5CkX5fbNiS1ADPc4OD8qpWAM=;
        b=fo+e91+9HTiIJPas61GJkHWMPASf/pD6ff5N4bq0jLAW3y/4HuQC6pLa/xi7WDId1v
         i7VpRDfYEPw4RDjmmByRIiKFJapC5BmJeLFSnOEqkfaZl4WYs/sAATt1E3RhQxKszhIF
         E3Z69qnXlM43HjR4wN+VWfL2idjt4+NZ6dWardH1SeFgTrkoZo3R5DIDiTbUF73fiMdl
         Rmfs7KkzuhC91Rlf/FndVFgOBIUR1/OQ7liBeMBSVQiNxr0TfOL4G56owHctDgCyN9Cx
         9rbtP2gGcDs9eHFMN2K+mQy4ZzpKzDjQ2jfWg5CYqkqcEruoBu20qzcg492er9mGS9PF
         nMXg==
X-Gm-Message-State: AC+VfDyb4yrim8i6V2TsiJ9Fs4Nn62umSJhLD7cQC7m2LZbTC1keSPts
	XwG6fexwM16nYlAhbH4lg9xboihp7+wOq09VYCI=
X-Google-Smtp-Source: ACHHUZ7tj4r7gJXiGMa60ftl1QBuTlHOU2q4M+RYGSzjV7yuFLKit2iZL2tye7gPgifMYIJCLEoIjg==
X-Received: by 2002:a05:6a00:1a45:b0:643:9e7c:3829 with SMTP id h5-20020a056a001a4500b006439e7c3829mr6682354pfv.12.1683386703403;
        Sat, 06 May 2023 08:25:03 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/15] go: Security fix for CVE-2023-24538
Date: Sat,  6 May 2023 05:24:35 -1000
Message-Id: <835462d697a5f294900843b8bcd628709c256605.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180988

From: Shubham Kulkarni <skulkarni@mvista.com>

html/template: disallow actions in JS template literals

Backport from https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


