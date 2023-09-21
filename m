Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA4BC04AAB
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 17:08:05 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.992.1695316076041335084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 10:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UqfOXTf3;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso9780005ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 10:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1695316075; x=1695920875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hdkrV219tQPzyVPoJ6F2kvuJR/gt1x1CmlPtfRVMhdg=;
        b=UqfOXTf35VYAal0iTKdsFMPGWegUvvgQdc0A8U7ZgE9XN9C70E7oApcDiNCPAIZyvt
         r99sm2Y/CUUeb9DzbycCuJ4K0He/NgxrR1uuZJf1arFKnKrB5gCWiK7SQjOEvH/QNYKu
         8//1VlDNmwgjGD0Jb6dss5xD+wM36fHhkTbg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695316075; x=1695920875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hdkrV219tQPzyVPoJ6F2kvuJR/gt1x1CmlPtfRVMhdg=;
        b=OK+lPxOlxnzb65y1/IZdU6Ads0FLEf7xlkfchavNQaYWl2xmjy3RQAFCbGZ5GdT2c+
         K3/jbZ8fZ4hnAmhLGaF/7k5Iki/cIkc5Jtq/giGxh3C0Ko7lUtE1tp6/9fRsRWoig2dF
         ZarzwniakaaUIIthxiUZMDmJDfy72oP8e5XvmUsXVs3SnwsjgOl+HKZAaaJd1GghHHCA
         oy1rVR1/cTBAoOLiCSXEUNJRcAMC57zRNCUCrMX+K5UqW8XhdnucUnOJf+Z3Unmt4cW/
         xjH8GOM+DklAtQTvm/Rxz/wXPJxJ3K3l5Z1ZfSoIyy/ZelWTznWYqhINob9ZI8KurtfP
         pTZw==
X-Gm-Message-State: AOJu0Yx72t/WFYitRc4/6CN+Ewg2lVOrvNfplXZ6S3H/VYWBaltXVedN
	PR+2EBG1gVNRP/fF7+pkn0gP18HINyCav/R6kuw=
X-Google-Smtp-Source: AGHT+IGI9QBqkTKqeB8C0+hoeKpwV7Xk3T7Q+N/i5oAHRfS6CcbhC5Z0OAhWEnCQSx1ELhJeZp1RSg==
X-Received: by 2002:a17:903:4291:b0:1c5:64fd:a1c3 with SMTP id ju17-20020a170903429100b001c564fda1c3mr5215262plb.26.1695316074914;
        Thu, 21 Sep 2023 10:07:54 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.36.130])
        by smtp.gmail.com with ESMTPSA id ji12-20020a170903324c00b001c44489ee55sm1745926plb.273.2023.09.21.10.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 10:07:54 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: Fix CVE-2023-39318
Date: Thu, 21 Sep 2023 22:37:46 +0530
Message-Id: <20230921170746.224878-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 17:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188020

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/golang/go/commit/023b542edf38e2a1f87fcefb9f75ff2f99401b4c]
CVE: CVE-2023-39318
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2023-39318.patch           | 238 ++++++++++++++++++
 2 files changed, 239 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-39318.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 119ae112af..df7d5d235a 100644
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
index 0000000000..942af323e0
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
+index bdccc65..3249c67 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -700,9 +700,12 @@ func (e *escaper) escapeText(c context, n *parse.TextNode) context {
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
+index 4f48afe..69cad08 100644
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
+2.25.1
+
-- 
2.34.1


