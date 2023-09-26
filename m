Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187D8E81816
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 04:08:08 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.11432.1695701286571907419
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 21:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BxnZWEOd;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c3d6d88231so56001575ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 21:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695701286; x=1696306086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xT8mT9WcwQzPqVY3UQXtxl1tR9L2D8cIKJ0rVwGH86Y=;
        b=BxnZWEOdvZynefOg+ic+Q9oDcysXVkMGyKSu7SsIMFPQ0LwqqwM/HU492TNYReZMst
         IlerIstWtu8d0a0oWdPArOAl3e/vfs0CPAgYiLyqO0ARRDha9lp7TLmXsBfP/tZuVewo
         wm9P3OJD/gsaeb7LkR3hP1BH4N+qyI0dRkLTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695701286; x=1696306086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xT8mT9WcwQzPqVY3UQXtxl1tR9L2D8cIKJ0rVwGH86Y=;
        b=kCFleUPnKE5VWZgB2JyIiDupL+zaDwE9LEKjRFT7FPBxGyXwJlNxYxJcQ9ODdpGQdD
         Ypv6Uks9Hr/KAzxjwLHa9Sj2OPCMTRuwdt45ox2D0GnUR3F7J6O3QBJy+n9Jpzd9UY4B
         HpW6+s0VXVPrz2QqDQsA7nrKJz55Hr0G9MydWn++mHIqFrGmQpCXj6Yj1c+dFdkWWNT9
         gjhDJg9XPpb7+TmRjLkOBlM83HFvB2mKM5NHiFliVYNLy46avY24+BCveDvuH0k+p77l
         3z/CfepFHf7YPirVlzTb/WPRlREJOEgYIHMe+2poU/IILKoIouE6SvGU+61Q1lpqmg/l
         96fA==
X-Gm-Message-State: AOJu0YzEkazmPq4+JXI+UruxHTmy4Fif9RSWziPSRgNW8aKSmOfHOwMH
	MzjuOZtxHJpiuRruLtfhu/KazIDNwidZMCBFSt8=
X-Google-Smtp-Source: AGHT+IET6sJE22u3Qh5+ftwWyxQG/hwrSj8QhZyrvzqj+a28M+G95S2unjuDisKJVLEqlCxW93U+cg==
X-Received: by 2002:a17:902:dac1:b0:1c6:1d3d:b412 with SMTP id q1-20020a170902dac100b001c61d3db412mr4141518plx.30.1695701283080;
        Mon, 25 Sep 2023 21:08:03 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.75.204])
        by smtp.gmail.com with ESMTPSA id x23-20020a170902821700b001b80d399730sm9678490pln.242.2023.09.25.21.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 21:08:02 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Fix CVE-2023-39318 and CVE-2023-39319
Date: Tue, 26 Sep 2023 09:37:54 +0530
Message-Id: <20230926040754.6166-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 04:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188215

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c]
CVE: CVE-2023-39318
Upstream-Status: Backport from [https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab2f5]
CVE: CVE-2023-39319
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2023-39318.patch           | 238 ++++++++++++++++++
 .../go/go-1.14/CVE-2023-39319.patch           | 230 +++++++++++++++++
 3 files changed, 470 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 20377e095b..9fc5eb130f 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -70,6 +70,8 @@ SRC_URI += "\
     file://CVE-2023-29400.patch \
     file://CVE-2023-29406.patch \
     file://CVE-2023-29409.patch \
+    file://CVE-2023-39318.patch \
+    file://CVE-2023-39319.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
new file mode 100644
index 0000000000..20e70c0485
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
@@ -0,0 +1,238 @@
+From 023b542edf38e2a1f87fcefb9f75ff2f99401b4c Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 3 Aug 2023 12:24:13 -0700
+Subject: [PATCH] [release-branch.go1.20] html/template: support HTML-like
+ comments in script contexts
+
+Per Appendix B.1.1 of the ECMAScript specification, support HTML-like
+comments in script contexts. Also per section 12.5, support hashbang
+comments. This brings our parsing in-line with how browsers treat these
+comment types.
+
+Thanks to Takeshi Kaneko (GMO Cybersecurity by Ierae, Inc.) for
+reporting this issue.
+
+Fixes #62196
+Fixes #62395
+Fixes CVE-2023-39318
+
+Change-Id: Id512702c5de3ae46cf648e268cb10e1eb392a181
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1976593
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2014620
+Reviewed-on: https://go-review.googlesource.com/c/go/+/526098
+Run-TryBot: Cherry Mui <cherryyz@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport from [https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c]
+CVE: CVE-2023-39318
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/html/template/context.go      |  6 ++-
+ src/html/template/escape.go       |  5 +-
+ src/html/template/escape_test.go  | 10 ++++
+ src/html/template/state_string.go |  4 +-
+ src/html/template/transition.go   | 80 ++++++++++++++++++++-----------
+ 5 files changed, 72 insertions(+), 33 deletions(-)
+
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index 0b65313..4eb7891 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -124,6 +124,10 @@ const (
+ 	stateJSBlockCmt
+ 	// stateJSLineCmt occurs inside a JavaScript // line comment.
+ 	stateJSLineCmt
++	// stateJSHTMLOpenCmt occurs inside a JavaScript <!-- HTML-like comment.
++	stateJSHTMLOpenCmt
++	// stateJSHTMLCloseCmt occurs inside a JavaScript --> HTML-like comment.
++	stateJSHTMLCloseCmt
+ 	// stateCSS occurs inside a <style> element or style attribute.
+ 	stateCSS
+ 	// stateCSSDqStr occurs inside a CSS double quoted string.
+@@ -149,7 +153,7 @@ const (
+ // authors & maintainers, not for end-users or machines.
+ func isComment(s state) bool {
+ 	switch s {
+-	case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, stateCSSBlockCmt, stateCSSLineCmt:
++	case stateHTMLCmt, stateJSBlockCmt, stateJSLineCmt, stateJSHTMLOpenCmt, stateJSHTMLCloseCmt, stateCSSBlockCmt, stateCSSLineCmt:
+ 		return true
+ 	}
+ 	return false
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index 435f912..ad2ec69 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -698,9 +698,12 @@ func (e *escaper) escapeText(c context, n *parse.TextNode) context {
+ 		if c.state != c1.state && isComment(c1.state) && c1.delim == delimNone {
+ 			// Preserve the portion between written and the comment start.
+ 			cs := i1 - 2
+-			if c1.state == stateHTMLCmt {
++			if c1.state == stateHTMLCmt || c1.state == stateJSHTMLOpenCmt {
+ 				// "<!--" instead of "/*" or "//"
+ 				cs -= 2
++			} else if c1.state == stateJSHTMLCloseCmt {
++				// "-->" instead of "/*" or "//"
++				cs -= 1
+ 			}
+ 			b.Write(s[written:cs])
+ 			written = i1
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index f550691..5f41e52 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -503,6 +503,16 @@ func TestEscape(t *testing.T) {
+ 			"<script>var a/*b*///c\nd</script>",
+ 			"<script>var a \nd</script>",
+ 		},
++		{
++			"JS HTML-like comments",
++			"<script>before <!-- beep\nbetween\nbefore-->boop\n</script>",
++			"<script>before \nbetween\nbefore\n</script>",
++		},
++		{
++			"JS hashbang comment",
++			"<script>#! beep\n</script>",
++			"<script>\n</script>",
++		},
+ 		{
+ 			"CSS comments",
+ 			"<style>p// paragraph\n" +
+diff --git a/src/html/template/state_string.go b/src/html/template/state_string.go
+index 05104be..b5cfe70 100644
+--- a/src/html/template/state_string.go
++++ b/src/html/template/state_string.go
+@@ -4,9 +4,9 @@ package template
+ 
+ import "strconv"
+ 
+-const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateError"
++const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSBqStrstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
+ 
+-var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 155, 170, 184, 192, 205, 218, 231, 244, 255, 271, 286, 296}
++var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 154, 167, 182, 196, 214, 233, 241, 254, 267, 280, 293, 304, 320, 335, 345, 354}
+ 
+ func (i state) String() string {
+ 	if i >= state(len(_state_index)-1) {
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index 92eb351..12aa4c4 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -14,32 +14,34 @@ import (
+ // the updated context and the number of bytes consumed from the front of the
+ // input.
+ var transitionFunc = [...]func(context, []byte) (context, int){
+-	stateText:        tText,
+-	stateTag:         tTag,
+-	stateAttrName:    tAttrName,
+-	stateAfterName:   tAfterName,
+-	stateBeforeValue: tBeforeValue,
+-	stateHTMLCmt:     tHTMLCmt,
+-	stateRCDATA:      tSpecialTagEnd,
+-	stateAttr:        tAttr,
+-	stateURL:         tURL,
+-	stateSrcset:      tURL,
+-	stateJS:          tJS,
+-	stateJSDqStr:     tJSDelimited,
+-	stateJSSqStr:     tJSDelimited,
+-	stateJSBqStr:     tJSDelimited,
+-	stateJSRegexp:    tJSDelimited,
+-	stateJSBlockCmt:  tBlockCmt,
+-	stateJSLineCmt:   tLineCmt,
+-	stateCSS:         tCSS,
+-	stateCSSDqStr:    tCSSStr,
+-	stateCSSSqStr:    tCSSStr,
+-	stateCSSDqURL:    tCSSStr,
+-	stateCSSSqURL:    tCSSStr,
+-	stateCSSURL:      tCSSStr,
+-	stateCSSBlockCmt: tBlockCmt,
+-	stateCSSLineCmt:  tLineCmt,
+-	stateError:       tError,
++	stateText:           tText,
++	stateTag:            tTag,
++	stateAttrName:       tAttrName,
++	stateAfterName:      tAfterName,
++	stateBeforeValue:    tBeforeValue,
++	stateHTMLCmt:        tHTMLCmt,
++	stateRCDATA:         tSpecialTagEnd,
++	stateAttr:           tAttr,
++	stateURL:            tURL,
++	stateSrcset:         tURL,
++	stateJS:             tJS,
++	stateJSDqStr:        tJSDelimited,
++	stateJSSqStr:        tJSDelimited,
++	stateJSBqStr:        tJSDelimited,
++	stateJSRegexp:       tJSDelimited,
++	stateJSBlockCmt:     tBlockCmt,
++	stateJSLineCmt:      tLineCmt,
++	stateJSHTMLOpenCmt:  tLineCmt,
++	stateJSHTMLCloseCmt: tLineCmt,
++	stateCSS:            tCSS,
++	stateCSSDqStr:       tCSSStr,
++	stateCSSSqStr:       tCSSStr,
++	stateCSSDqURL:       tCSSStr,
++	stateCSSSqURL:       tCSSStr,
++	stateCSSURL:         tCSSStr,
++	stateCSSBlockCmt:    tBlockCmt,
++	stateCSSLineCmt:     tLineCmt,
++	stateError:          tError,
+ }
+ 
+ var commentStart = []byte("<!--")
+@@ -263,7 +265,7 @@ func tURL(c context, s []byte) (context, int) {
+ 
+ // tJS is the context transition function for the JS state.
+ func tJS(c context, s []byte) (context, int) {
+-	i := bytes.IndexAny(s, "\"`'/")
++	i := bytes.IndexAny(s, "\"`'/<-#")
+ 	if i == -1 {
+ 		// Entire input is non string, comment, regexp tokens.
+ 		c.jsCtx = nextJSCtx(s, c.jsCtx)
+@@ -293,6 +295,26 @@ func tJS(c context, s []byte) (context, int) {
+ 				err:   errorf(ErrSlashAmbig, nil, 0, "'/' could start a division or regexp: %.32q", s[i:]),
+ 			}, len(s)
+ 		}
++	// ECMAScript supports HTML style comments for legacy reasons, see Appendix
++	// B.1.1 "HTML-like Comments". The handling of these comments is somewhat
++	// confusing. Multi-line comments are not supported, i.e. anything on lines
++	// between the opening and closing tokens is not considered a comment, but
++	// anything following the opening or closing token, on the same line, is
++	// ignored. As such we simply treat any line prefixed with "<!--" or "-->"
++	// as if it were actually prefixed with "//" and move on.
++	case '<':
++		if i+3 < len(s) && bytes.Equal(commentStart, s[i:i+4]) {
++			c.state, i = stateJSHTMLOpenCmt, i+3
++		}
++	case '-':
++		if i+2 < len(s) && bytes.Equal(commentEnd, s[i:i+3]) {
++			c.state, i = stateJSHTMLCloseCmt, i+2
++		}
++	// ECMAScript also supports "hashbang" comment lines, see Section 12.5.
++	case '#':
++		if i+1 < len(s) && s[i+1] == '!' {
++			c.state, i = stateJSLineCmt, i+1
++		}
+ 	default:
+ 		panic("unreachable")
+ 	}
+@@ -372,12 +394,12 @@ func tBlockCmt(c context, s []byte) (context, int) {
+ 	return c, i + 2
+ }
+ 
+-// tLineCmt is the context transition function for //comment states.
++// tLineCmt is the context transition function for //comment states, and the JS HTML-like comment state.
+ func tLineCmt(c context, s []byte) (context, int) {
+ 	var lineTerminators string
+ 	var endState state
+ 	switch c.state {
+-	case stateJSLineCmt:
++	case stateJSLineCmt, stateJSHTMLOpenCmt, stateJSHTMLCloseCmt:
+ 		lineTerminators, endState = "\n\r\u2028\u2029", stateJS
+ 	case stateCSSLineCmt:
+ 		lineTerminators, endState = "\n\f\r", stateCSS
+-- 
+2.24.4
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
new file mode 100644
index 0000000000..69106e3e05
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
@@ -0,0 +1,230 @@
+From 2070531d2f53df88e312edace6c8dfc9686ab2f5 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 3 Aug 2023 12:28:28 -0700
+Subject: [PATCH] [release-branch.go1.20] html/template: properly handle
+ special tags within the script context
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
+TryBot-Result: Security TryBots <security-trybots@go-security-trybots.iam.gserviceaccount.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/526099
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Cherry Mui <cherryyz@google.com>
+
+Upstream-Status: Backport from [https://github.com/golang/go/commit/2070531d2f53df88e312edace6c8dfc9686ab2f5]
+CVE: CVE-2023-39319
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/html/template/context.go     | 14 ++++++++++
+ src/html/template/escape.go      | 26 ++++++++++++++++++
+ src/html/template/escape_test.go | 47 +++++++++++++++++++++++++++++++-
+ src/html/template/transition.go  | 15 ++++++++++
+ 4 files changed, 101 insertions(+), 1 deletion(-)
+
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index 4eb7891..feb6517 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -168,6 +168,20 @@ func isInTag(s state) bool {
+ 	return false
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
+index ad2ec69..de8cf6f 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -10,6 +10,7 @@ import (
+ 	"html"
+ 	"internal/godebug"
+ 	"io"
++	"regexp"
+ 	"text/template"
+ 	"text/template/parse"
+ )
+@@ -650,6 +651,26 @@ var delimEnds = [...]string{
+ 	delimSpaceOrTagEnd: " \t\n\f\r>",
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
+@@ -708,6 +729,11 @@ func (e *escaper) escapeText(c context, n *parse.TextNode) context {
+ 			b.Write(s[written:cs])
+ 			written = i1
+ 		}
++		if isInScriptLiteral(c.state) && containsSpecialScriptTag(s[i:i1]) {
++			b.Write(s[written:i])
++			b.Write(escapeSpecialScriptTags(s[i:i1]))
++			written = i1
++		}
+ 		if i == i1 && c.state == c1.state {
+ 			panic(fmt.Sprintf("infinite loop from %v to %v on %q..%q", c, c1, s[:i], s[i:]))
+ 		}
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 5f41e52..0cacb20 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -513,6 +513,21 @@ func TestEscape(t *testing.T) {
+ 			"<script>#! beep\n</script>",
+ 			"<script>\n</script>",
+ 		},
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
+ 		{
+ 			"CSS comments",
+ 			"<style>p// paragraph\n" +
+@@ -1501,8 +1516,38 @@ func TestEscapeText(t *testing.T) {
+ 			context{state: stateJS, element: elementScript},
+ 		},
+ 		{
++			// <script and </script tags are escaped, so </script> should not
++			// cause us to exit the JS state.
+ 			`<script>document.write("<script>alert(1)</script>");`,
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
+ 		},
+ 		{
+ 			`<script type="text/template">`,
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index 12aa4c4..3d2a37c 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -214,6 +214,11 @@ var (
+ // element states.
+ func tSpecialTagEnd(c context, s []byte) (context, int) {
+ 	if c.element != elementNone {
++		// script end tags ("</script") within script literals are ignored, so that
++		// we can properly escape them.
++		if c.element == elementScript && (isInScriptLiteral(c.state) || isComment(c.state)) {
++			return c, len(s)
++		}
+ 		if i := indexTagEnd(s, specialTagEndMarkers[c.element]); i != -1 {
+ 			return context{}, i
+ 		}
+@@ -353,6 +358,16 @@ func tJSDelimited(c context, s []byte) (context, int) {
+ 			inCharset = true
+ 		case ']':
+ 			inCharset = false
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
+ 		default:
+ 			// end delimiter
+ 			if !inCharset {
+-- 
+2.24.4
+
-- 
2.34.1


