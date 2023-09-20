Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3C4C2FC0C
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:13 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.3130.1695249066000368007
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Skoo/8zA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6beff322a97so239936a34.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249065; x=1695853865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R89OIhdHvFnFHCEfL1z68kdY+p4eiDIqNNr2iPBtYJ8=;
        b=Skoo/8zANAvNWdMdAz3ZFcyvU+DCT3plf55KWQDZrZSTBC1mkG+3RXTpgBKNo/YcXE
         eI3PykwSoEBhmxA0eHi0BJDZ4GwaTAxvlIrPfRf0aodSVROyU7kOnaEur7gD/fqYf0+k
         msxc939PQi1YMkqrgeMMDsZYotaz3db6vG3wfvkp/84924UBzCakW1X0BFRZ4RY8Engq
         zs0jha3E2w2RF5VM57MVLSEu3GfyIzNJsmNeVvM0yET1G3H3kYmXDK1g8UA8nMYEFpiC
         MNyjhqq2k+ERHUDvjOjesS14tyQXxtJZJW+3QzpyxzDK5KkLSjtgTfn0uTXGVV2imXr9
         wWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249065; x=1695853865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R89OIhdHvFnFHCEfL1z68kdY+p4eiDIqNNr2iPBtYJ8=;
        b=B0cUZgjM8pzCdK4M5Qt7H6SN/lc44sHQGFJuevdLZZBDMj6sd/24WRMgapWJyHec77
         +PiGP9HzajfOKMWhpmwWjmw7dnnk7hq1Y6j3y+rJQr1aL+ecIg9bkOIA66fXMJ718t9U
         518DOlUlYv6Gw4trQswK0SCtzLXi3jJXzSX7h/tcT47B/vBnjyOC/Z90KP1jtmn6Pqr9
         rEmr54lOzA7BpaqPTv/8VRiL+dKEnxJm3lNAWmYVnxdYayI13mBZfZQOlobK5sEGZpxW
         guSBjQnaBvjtxCNsteYF+gfJXK25QMbt1yGbJkbk+Dsu6ZX7SWRU2dSRbZTVlG2equyk
         swvg==
X-Gm-Message-State: AOJu0Yyhe8Oq7rRvxuFO0/vILAoyE6AvBCK/4qUIdGb3Ix+jzOKvGJfi
	6ObuHnbBNejYSy0QxaZ9XOhtKuKeB1eul67Q1mc=
X-Google-Smtp-Source: AGHT+IHYlvt95fsv5+DOxjefwHv8/R7UHSJIqS7Xl3Ka3W4cM/NG4E2rDptD7BebkeJ+vfRHK/GS8w==
X-Received: by 2002:a05:6358:428f:b0:142:d62c:78e5 with SMTP id s15-20020a056358428f00b00142d62c78e5mr4401143rwc.15.1695249064626;
        Wed, 20 Sep 2023 15:31:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/20] go: Fix CVE-2023-39319
Date: Wed, 20 Sep 2023 12:30:38 -1000
Message-Id: <afdc322ecff4cfd8478c89a03f7fce748a132b48.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187949

From: Soumya Sambu <soumya.sambu@windriver.com>

The html/template package does not apply the proper rules for handling
occurrences of "<script", "<!--", and "</script" within JS literals in
<script> contexts. This may cause the template parser to improperly
consider script contexts to be terminated early, causing actions to be
improperly escaped. This could be leveraged to perform an XSS attack.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-39319

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 .../go/go-1.20/CVE-2023-39319.patch           | 254 ++++++++++++++++++
 2 files changed, 256 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 91dd886cd0..c753a26a7e 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -1,6 +1,6 @@
 require go-common.inc
 
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.20:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -43,6 +43,7 @@ SRC_URI += "\
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
     file://CVE-2023-29409.patch \
+    file://CVE-2023-39319.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch b/meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch
new file mode 100644
index 0000000000..1554aa975c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.20/CVE-2023-39319.patch
@@ -0,0 +1,254 @@
+From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu Aug 3 12:28:28 2023 -0700
+Subject: [PATCH] html/template: properly handle special tags within the script
+ context
+
+The HTML specification has incredibly complex rules for how to handle
+"<!--", "<script", and "</script" when they appear within literals in
+the script context. Rather than attempting to apply these restrictions
+(which require a significantly more complex state machine) we apply
+the workaround suggested in section 4.12.1.3 of the HTML specification [1].
+
+More precisely, when "<!--", "<script", and "</script" appear within
+literals (strings and regular expressions, ignoring comments since we
+already elide their content) we replace the "<" with "\x3C". This avoids
+the unintuitive behavior that using these tags within literals can cause,
+by simply preventing the rendered content from triggering it. This may
+break some correct usages of these tags, but on balance is more likely
+to prevent XSS attacks where users are unknowingly either closing or not
+closing the script blocks where they think they are.
+
+Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
+reporting this issue.
+
+Fixes #62197
+Fixes #62397
+Fixes CVE-2023-39319
+
+[1] https://html.spec.whatwg.org/#restrictions-for-contents-of-script-elements
+
+Change-Id: Iab57b0532694827e3eddf57a7497ba1fab1746dc
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1976594
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2014621
+Reviewed-on: https://go-review.googlesource.com/c/go/+/526099
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Cherry Mui <cherryyz@google.com>
+
+CVE: CVE-2023-39319
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab2f5]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/go/build/deps_test.go        |  6 ++--
+ src/html/template/context.go     | 14 ++++++++++
+ src/html/template/escape.go      | 26 ++++++++++++++++++
+ src/html/template/escape_test.go | 47 +++++++++++++++++++++++++++++++-
+ src/html/template/transition.go  | 15 ++++++++++
+ 5 files changed, 104 insertions(+), 4 deletions(-)
+
+diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
+index dc3bb8c..359a00a 100644
+--- a/src/go/build/deps_test.go
++++ b/src/go/build/deps_test.go
+@@ -255,15 +255,15 @@ var depsRules = `
+	< text/template
+	< internal/lazytemplate;
+
+-	encoding/json, html, text/template
+-	< html/template;
+-
+	# regexp
+	FMT
+	< regexp/syntax
+	< regexp
+	< internal/lazyregexp;
+
++	encoding/json, html, text/template, regexp
++	< html/template;
++
+	# suffix array
+	encoding/binary, regexp
+	< index/suffixarray;
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index 0b65313..f5f44a1 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -164,6 +164,20 @@ func isInTag(s state) bool {
+	return false
+ }
+
++// isInScriptLiteral returns true if s is one of the literal states within a
++// <script> tag, and as such occurances of "<!--", "<script", and "</script"
++// need to be treated specially.
++func isInScriptLiteral(s state) bool {
++	// Ignore the comment states (stateJSBlockCmt, stateJSLineCmt,
++	// stateJSHTMLOpenCmt, stateJSHTMLCloseCmt) because their content is already
++	// omitted from the output.
++	switch s {
++	case stateJSDqStr, stateJSSqStr, stateJSBqStr, stateJSRegexp:
++		return true
++	}
++	return false
++}
++
+ // delim is the delimiter that will end the current HTML attribute.
+ type delim uint8
+
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index bdccc65..1747ec9 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -10,6 +10,7 @@ import (
+	"html"
+	"internal/godebug"
+	"io"
++	"regexp"
+	"text/template"
+	"text/template/parse"
+ )
+@@ -652,6 +653,26 @@ var delimEnds = [...]string{
+	delimSpaceOrTagEnd: " \t\n\f\r>",
+ }
+
++var (
++	// Per WHATWG HTML specification, section 4.12.1.3, there are extremely
++	// complicated rules for how to handle the set of opening tags <!--,
++	// <script, and </script when they appear in JS literals (i.e. strings,
++	// regexs, and comments). The specification suggests a simple solution,
++	// rather than implementing the arcane ABNF, which involves simply escaping
++	// the opening bracket with \x3C. We use the below regex for this, since it
++	// makes doing the case-insensitive find-replace much simpler.
++	specialScriptTagRE          = regexp.MustCompile("(?i)<(script|/script|!--)")
++	specialScriptTagReplacement = []byte("\\x3C$1")
++)
++
++func containsSpecialScriptTag(s []byte) bool {
++	return specialScriptTagRE.Match(s)
++}
++
++func escapeSpecialScriptTags(s []byte) []byte {
++	return specialScriptTagRE.ReplaceAll(s, specialScriptTagReplacement)
++}
++
+ var doctypeBytes = []byte("<!DOCTYPE")
+
+ // escapeText escapes a text template node.
+@@ -707,6 +728,11 @@ func (e *escaper) escapeText(c context, n *parse.TextNode) context {
+			b.Write(s[written:cs])
+			written = i1
+		}
++		if isInScriptLiteral(c.state) && containsSpecialScriptTag(s[i:i1]) {
++			b.Write(s[written:i])
++			b.Write(escapeSpecialScriptTags(s[i:i1]))
++			written = i1
++		}
+		if i == i1 && c.state == c1.state {
+			panic(fmt.Sprintf("infinite loop from %v to %v on %q..%q", c, c1, s[:i], s[i:]))
+		}
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 4f48afe..7853daa 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -503,6 +503,21 @@ func TestEscape(t *testing.T) {
+			"<script>var a/*b*///c\nd</script>",
+			"<script>var a \nd</script>",
+		},
++		{
++			"Special tags in <script> string literals",
++			`<script>var a = "asd < 123 <!-- 456 < fgh <script jkl < 789 </script"</script>`,
++			`<script>var a = "asd < 123 \x3C!-- 456 < fgh \x3Cscript jkl < 789 \x3C/script"</script>`,
++		},
++		{
++			"Special tags in <script> string literals (mixed case)",
++			`<script>var a = "<!-- <ScripT </ScripT"</script>`,
++			`<script>var a = "\x3C!-- \x3CScripT \x3C/ScripT"</script>`,
++		},
++		{
++			"Special tags in <script> regex literals (mixed case)",
++			`<script>var a = /<!-- <ScripT </ScripT/</script>`,
++			`<script>var a = /\x3C!-- \x3CScripT \x3C/ScripT/</script>`,
++		},
+		{
+			"CSS comments",
+			"<style>p// paragraph\n" +
+@@ -1491,8 +1506,38 @@ func TestEscapeText(t *testing.T) {
+			context{state: stateJS, element: elementScript},
+		},
+		{
++			// <script and </script tags are escaped, so </script> should not
++			// cause us to exit the JS state.
+			`<script>document.write("<script>alert(1)</script>");`,
+-			context{state: stateText},
++			context{state: stateJS, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>`,
++			context{state: stateJSDqStr, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>alert(1)</script>`,
++			context{state: stateJSDqStr, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>alert(1)<!--`,
++			context{state: stateJSDqStr, element: elementScript},
++		},
++		{
++			`<script>document.write("<script>alert(1)</Script>");`,
++			context{state: stateJS, element: elementScript},
++		},
++		{
++			`<script>document.write("<!--");`,
++			context{state: stateJS, element: elementScript},
++		},
++		{
++			`<script>let a = /</script`,
++			context{state: stateJSRegexp, element: elementScript},
++		},
++		{
++			`<script>let a = /</script/`,
++			context{state: stateJS, element: elementScript, jsCtx: jsCtxDivOp},
+		},
+		{
+			`<script type="text/template">`,
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index 92eb351..e2660cc 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -212,6 +212,11 @@ var (
+ // element states.
+ func tSpecialTagEnd(c context, s []byte) (context, int) {
+	if c.element != elementNone {
++		// script end tags ("</script") within script literals are ignored, so that
++		// we can properly escape them.
++		if c.element == elementScript && (isInScriptLiteral(c.state) || isComment(c.state)) {
++			return c, len(s)
++		}
+		if i := indexTagEnd(s, specialTagEndMarkers[c.element]); i != -1 {
+			return context{}, i
+		}
+@@ -331,6 +336,16 @@ func tJSDelimited(c context, s []byte) (context, int) {
+			inCharset = true
+		case ']':
+			inCharset = false
++		case '/':
++			// If "</script" appears in a regex literal, the '/' should not
++			// close the regex literal, and it will later be escaped to
++			// "\x3C/script" in escapeText.
++			if i > 0 && i+7 <= len(s) && bytes.Compare(bytes.ToLower(s[i-1:i+7]), []byte("</script")) == 0 {
++				i++
++			} else if !inCharset {
++				c.state, c.jsCtx = stateJS, jsCtxDivOp
++				return c, i + 1
++			}
+		default:
+			// end delimiter
+			if !inCharset {
+--
+2.40.0
-- 
2.34.1


