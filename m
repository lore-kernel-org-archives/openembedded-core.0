Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C909CE7AEB
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:08 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.6270.1695869342527551467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P4HK8jXA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68fdcc37827so10098511b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869342; x=1696474142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BR65heOwPjf8UR8I4XEEG51b/uWW5lbGXG/KZ8njsE=;
        b=P4HK8jXAucxYctcs3C/AOFOHw2KdadOqhYjuQhKkM0f7OBkV5QkxGnVtHzg7K2+BuD
         qRmKlOwZ/1bgI1+FknUdXoJEJr06ByYIVe0I5ABDEt2eaBxP4Lcp3l6R2RX1jmm6uW6c
         GTUx0PsC7FAEbHOBDALeH1C2TUrTY2l6kqNZ7pFeMhQBShZm3I0hoeGmMDdPYwge7PxF
         3BTElHqy51VctIeN8tHC1SV15QqOjhskP8y2zRFAVY5PWaQpA14fthbkiCLwEBFkQHMA
         GXanlb7aNDl/FEQ0tN98mBdDdvhqCpxbydFCDCSd8s01l2gVbFWiJM/l2s9lKCCZGdFr
         d74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869342; x=1696474142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BR65heOwPjf8UR8I4XEEG51b/uWW5lbGXG/KZ8njsE=;
        b=XSBIxsSJGoOLykrePJcG2+uK8OS8iz5RiZXNLPCcJukDcRGsN4sUxEXnW/ereoy8MI
         wJUP8ey/gddnCN2yDcnjYq0YxRxyStzBrt2rg+84Rq+vy2j80E9E/doEzk4pj4hx9sOx
         qrc1HjV2dDaNWyviHds6S9KKkhIvZhJTaYDO5VQZ5n3VNHJjZ8UF0IF6683ZKYFXwfP+
         kk4zTTVm4oskJ8/PPU8kdRUlSYc42MvK8opWkpdgiMczakiHhPsoN2jqMaEi6V6LSgTb
         fZv2G4wPn96uYf5LFdjy5IMy7bITH7AU3+K3zjyJs9D0Wb9OlUpy+TRwWrbZlxZjlYLb
         REOw==
X-Gm-Message-State: AOJu0Yx/Pl1dAeztL/+7vu9tPYHDlXg9W+xkNlKeITUQen5KvUDHYJDC
	D9dBSUvKqiEiinOvS46D+5t0UN2LJYqIzygaG+E=
X-Google-Smtp-Source: AGHT+IGHgkh4Pc8O7QDsFNyHEq5DabGe/HnITBK/qZ6eW4R9FTjh2Fx4VsBTI0q6S9QOFqqfjx+GyQ==
X-Received: by 2002:a05:6a20:4413:b0:140:61f8:53f6 with SMTP id ce19-20020a056a20441300b0014061f853f6mr6924254pzb.29.1695869341542;
        Wed, 27 Sep 2023 19:49:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.49.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:49:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/17] go: Fix CVE-2023-39318
Date: Wed, 27 Sep 2023 16:48:35 -1000
Message-Id: <35fa5c12f86bda2c8542bdb57074f55808697a42.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188356

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c]
CVE: CVE-2023-39318
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2023-39318.patch           | 238 ++++++++++++++++++
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index c753a26a7e..ed2645bc12 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -44,6 +44,7 @@ SRC_URI += "\
     file://CVE-2023-24531_2.patch \
     file://CVE-2023-29409.patch \
     file://CVE-2023-39319.patch \
+    file://CVE-2023-39318.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
new file mode 100644
index 0000000000..85c6ec97c8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch
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
+index f5f44a1..feb6517 100644
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
+index 1747ec9..b0085ce 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -721,9 +721,12 @@ func (e *escaper) escapeText(c context, n *parse.TextNode) context {
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
+index 7853daa..bff38c6 100644
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
+ 			"Special tags in <script> string literals",
+ 			`<script>var a = "asd < 123 <!-- 456 < fgh <script jkl < 789 </script"</script>`,
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
+index e2660cc..3d2a37c 100644
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
+@@ -268,7 +270,7 @@ func tURL(c context, s []byte) (context, int) {
+ 
+ // tJS is the context transition function for the JS state.
+ func tJS(c context, s []byte) (context, int) {
+-	i := bytes.IndexAny(s, "\"`'/")
++	i := bytes.IndexAny(s, "\"`'/<-#")
+ 	if i == -1 {
+ 		// Entire input is non string, comment, regexp tokens.
+ 		c.jsCtx = nextJSCtx(s, c.jsCtx)
+@@ -298,6 +300,26 @@ func tJS(c context, s []byte) (context, int) {
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
+@@ -387,12 +409,12 @@ func tBlockCmt(c context, s []byte) (context, int) {
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
+2.35.7
+
-- 
2.34.1


