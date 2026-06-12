Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D312CCD98E4
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:26:49 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71820.1781274402680570151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o+Oqi3fF;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so887655f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781274401; x=1781879201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcDoHeR6CJQKLkQADLcnm9MMdBr63558ouu3EzWmbDI=;
        b=o+Oqi3fFw/OJnejtQUFGGlbyK4609/PD7bu3QAF0pfPo7hlIFiXDib3B35ctiQmfnT
         X+PgHn/1hb31VY7HOtfsxXALmsivMHMNxG+2x4uve2NIo8Ig6cIMl3OootWIdxmfo7/h
         OQEHF6uVcvje17yqgZGG3SOSFR1zV2MKuZP98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274401; x=1781879201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcDoHeR6CJQKLkQADLcnm9MMdBr63558ouu3EzWmbDI=;
        b=hMJQ+dbjX2hPlj8U/Ac16J8afxQlWxCZJF66aW1eP58NdQ7JiLfgPZCtL/JXi8CejW
         5rMHLmxGNmOUpPpxQoIBVAxJHfqg4Tdwg0v+dJJdlj9cxZl8fvUIeMIYbAq9Lb3pE6qG
         Fs6LysWEDyxCk3BcpbIbaNWyp0mjQLEF/4QKnnu9DSZSorEiqxDnptNPVzS3y2C+JAru
         15g5QPaM0+0jVlEq8BgKotB/w5YRBJbk5dWCTj0vjf8BRqDmcQUIbNkvnLTB+gTSf7/d
         v502T0nqGb9cDH5DzWFsW4126jPqBwsKws4TwbK34nGRBxXGOK+396jLhsPGrhfH6rnv
         ITiQ==
X-Gm-Message-State: AOJu0YwIIN+YTKH40VLZrXuvl19PtgmIJhDNsT3XGR7MeLnccU+d8eoF
	2wG6MQh7QuDmO24tnbFAcikOJNC9mbHI7z06eBpQKTbRc5Op8rZMuX618Ea2cIBZoTsyB7pTbRo
	RL+Ee9g==
X-Gm-Gg: Acq92OH9N2dc5tuL8fwRW32GAmKeyMOOZI+uNzZyne65ZLZ1XhCYmlInZtNnriDuZnc
	nXEO5vRHFMQyg+DdCCsjfjyQwUxymwXspa+hjHHpaMB7VEYnSNmCAhM4+zPuma5yCcl0V1cv5Cv
	0GQpsWu8yXonPiz9NGH/KTXOSmk6GUvhnFQqAQCJ2HdIg0+GCe8RhUW9z7tF2z0UO2asl33bgES
	W1J5WZcAJT+mLJvdEC2A1PbiIhcSHybk2nGeUUmZ9muf4PsPvt3F5SEWIjxkAyuTTGIFkh6vJ01
	nGkHA1hpgjEG17fCcNrw4M5U14NwLJ47VylOI/FidnQap7BCPUcPuXwBe1FPk5Can/YEDbT8luy
	xAIlu1jWZ1io28y4cFJ8qGxoPGxG3v3W1nDj/OH9h+uRSLJeZLqHNmLiaOa99BP1kOAvyHerUbi
	kbhR9GUWxKrL589VkaSZJo0wA=
X-Received: by 2002:a05:6000:428a:b0:45e:edcc:f6dc with SMTP id ffacd0b85a97d-4606db9667amr4783477f8f.6.1781274400838;
        Fri, 12 Jun 2026 07:26:40 -0700 (PDT)
Received: from Logrus.lan ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm6798747f8f.0.2026.06.12.07.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:26:40 -0700 (PDT)
From: Jeremy Rosen <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 07/21] go: patch CVE-2026-27142
Date: Fri, 12 Jun 2026 16:25:57 +0200
Message-ID: <bd443e123d8c10034e137296f82a43f8b764caa9.1781270474.git.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1781270474.git.jeremy.rosen@smile.fr>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238629

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/752081

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
Signed-off-by: Jeremy Rosen <jeremy.rosen@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-27142.patch                | 386 ++++++++++++++++++
 2 files changed, 387 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27142.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 3fa421e223..8efa82f862 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -41,6 +41,7 @@ SRC_URI += "\
     file://CVE-2025-68121_p1.patch \
     file://CVE-2025-68121_p2.patch \
     file://CVE-2025-68121_p3.patch \
+    file://CVE-2026-27142.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27142.patch b/meta/recipes-devtools/go/go/CVE-2026-27142.patch
new file mode 100644
index 0000000000..e735abaf4b
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27142.patch
@@ -0,0 +1,386 @@
+From 1ac19df75e9c25951c04008a52b23a1cd95e81cc Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Fri, 9 Jan 2026 11:12:01 -0800
+Subject: [PATCH] html/template: properly escape URLs in meta content
+ attributes
+
+The meta tag can include a content attribute that contains URLs, which
+we currently don't escape if they are inserted via a template action.
+This can plausibly lead to XSS vulnerabilities if untrusted data is
+inserted there, the http-equiv attribute is set to "refresh", and the
+content attribute contains an action like `url={{.}}`.
+
+Track whether we are inside of a meta element, if we are inside of a
+content attribute, _and_ if the content attribute contains "url=". If
+all of those are true, then we will apply the same URL escaping that we
+use elsewhere.
+
+Also add a new GODEBUG, htmlmetacontenturlescape, to allow disabling this
+escaping for cases where this behavior is considered safe. The behavior
+can be disabled by setting htmlmetacontenturlescape=0.
+
+Updates #77954
+Fixes #77972
+Fixes CVE-2026-27142
+
+Change-Id: I9bbca263be9894688e6ef1e9a8f8d2f4304f5873
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3360
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3643
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/752081
+Auto-Submit: Gopher Robot <gobot@golang.org>
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+TryBot-Bypass: Gopher Robot <gobot@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2026-27142
+Upstream-Status: Backport [https://github.com/golang/go/commit/994692847a2cd3efd319f0cb61a07c0012c8a4ff]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ doc/godebug.md                      |  5 +++
+ src/html/template/attr_string.go    |  5 +--
+ src/html/template/context.go        |  8 +++++
+ src/html/template/element_string.go |  5 +--
+ src/html/template/escape.go         | 14 +++++++++
+ src/html/template/escape_test.go    | 34 +++++++++++++++++++++
+ src/html/template/state_string.go   |  8 +++--
+ src/html/template/transition.go     | 47 +++++++++++++++++++++++++----
+ src/internal/godebugs/table.go      |  1 +
+ src/runtime/metrics/doc.go          |  5 +++
+ 10 files changed, 119 insertions(+), 13 deletions(-)
+
+diff --git a/doc/godebug.md b/doc/godebug.md
+index 635597e..07b63cb 100644
+--- a/doc/godebug.md
++++ b/doc/godebug.md
+@@ -126,6 +126,11 @@ for example,
+ see the [runtime documentation](/pkg/runtime#hdr-Environment_Variables)
+ and the [go command documentation](/cmd/go#hdr-Build_and_test_caching).
+ 
++Go 1.26.1 added a new `htmlmetacontenturlescape` setting that controls whether
++html/template will escape URLs in the `url=` portion of the content attribute of
++HTML meta tags. The default `htmlmetacontentescape=1` will cause URLs to be
++escaped. Setting `htmlmetacontentescape=0` disables this behavior.
++
+ Go 1.26 added a new `urlmaxqueryparams` setting that controls the maximum number
+ of query parameters that net/url will accept when parsing a URL-encoded query string.
+ If the number of parameters exceeds the number set in `urlmaxqueryparams`,
+diff --git a/src/html/template/attr_string.go b/src/html/template/attr_string.go
+index 51c3f26..7159fa9 100644
+--- a/src/html/template/attr_string.go
++++ b/src/html/template/attr_string.go
+@@ -14,11 +14,12 @@ func _() {
+ 	_ = x[attrStyle-3]
+ 	_ = x[attrURL-4]
+ 	_ = x[attrSrcset-5]
++	_ = x[attrMetaContent-6]
+ }
+ 
+-const _attr_name = "attrNoneattrScriptattrScriptTypeattrStyleattrURLattrSrcset"
++const _attr_name = "attrNoneattrScriptattrScriptTypeattrStyleattrURLattrSrcsetattrMetaContent"
+ 
+-var _attr_index = [...]uint8{0, 8, 18, 32, 41, 48, 58}
++var _attr_index = [...]uint8{0, 8, 18, 32, 41, 48, 58, 73}
+ 
+ func (i attr) String() string {
+ 	if i >= attr(len(_attr_index)-1) {
+diff --git a/src/html/template/context.go b/src/html/template/context.go
+index b78f0f7..8b3af2f 100644
+--- a/src/html/template/context.go
++++ b/src/html/template/context.go
+@@ -156,6 +156,10 @@ const (
+ 	// stateError is an infectious error state outside any valid
+ 	// HTML/CSS/JS construct.
+ 	stateError
++	// stateMetaContent occurs inside a HTML meta element content attribute.
++	stateMetaContent
++	// stateMetaContentURL occurs inside a "url=" tag in a HTML meta element content attribute.
++	stateMetaContentURL
+ 	// stateDead marks unreachable code after a {{break}} or {{continue}}.
+ 	stateDead
+ )
+@@ -267,6 +271,8 @@ const (
+ 	elementTextarea
+ 	// elementTitle corresponds to the RCDATA <title> element.
+ 	elementTitle
++	// elementMeta corresponds to the HTML <meta> element.
++	elementMeta
+ )
+ 
+ //go:generate stringer -type attr
+@@ -288,4 +294,6 @@ const (
+ 	attrURL
+ 	// attrSrcset corresponds to a srcset attribute.
+ 	attrSrcset
++	// attrMetaContent corresponds to the content attribute in meta HTML element.
++	attrMetaContent
+ )
+diff --git a/src/html/template/element_string.go b/src/html/template/element_string.go
+index db28665..bdf9da7 100644
+--- a/src/html/template/element_string.go
++++ b/src/html/template/element_string.go
+@@ -13,11 +13,12 @@ func _() {
+ 	_ = x[elementStyle-2]
+ 	_ = x[elementTextarea-3]
+ 	_ = x[elementTitle-4]
++	_ = x[elementMeta-5]
+ }
+ 
+-const _element_name = "elementNoneelementScriptelementStyleelementTextareaelementTitle"
++const _element_name = "elementNoneelementScriptelementStyleelementTextareaelementTitleelementMeta"
+ 
+-var _element_index = [...]uint8{0, 11, 24, 36, 51, 63}
++var _element_index = [...]uint8{0, 11, 24, 36, 51, 63, 74}
+ 
+ func (i element) String() string {
+ 	if i >= element(len(_element_index)-1) {
+diff --git a/src/html/template/escape.go b/src/html/template/escape.go
+index 1eace16..b368cab 100644
+--- a/src/html/template/escape.go
++++ b/src/html/template/escape.go
+@@ -165,6 +165,8 @@ func (e *escaper) escape(c context, n parse.Node) context {
+ 
+ var debugAllowActionJSTmpl = godebug.New("jstmpllitinterp")
+ 
++var htmlmetacontenturlescape = godebug.New("htmlmetacontenturlescape")
++
+ // escapeAction escapes an action template node.
+ func (e *escaper) escapeAction(c context, n *parse.ActionNode) context {
+ 	if len(n.Pipe.Decl) != 0 {
+@@ -222,6 +224,18 @@ func (e *escaper) escapeAction(c context, n *parse.ActionNode) context {
+ 		default:
+ 			panic(c.urlPart.String())
+ 		}
++	case stateMetaContent:
++		// Handled below in delim check.
++	case stateMetaContentURL:
++		if htmlmetacontenturlescape.Value() != "0" {
++			s = append(s, "_html_template_urlfilter")
++		} else {
++			// We don't have a great place to increment this, since it's hard to
++			// know if we actually escape any urls in _html_template_urlfilter,
++			// since it has no information about what context it is being
++			// executed in etc. This is probably the best we can do.
++			htmlmetacontenturlescape.IncNonDefault()
++		}
+ 	case stateJS:
+ 		s = append(s, "_html_template_jsvalescaper")
+ 		// A slash after a value starts a div operator.
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index 497ead8..1970db1 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -734,6 +734,16 @@ func TestEscape(t *testing.T) {
+ 			"<script>var a = `${ var a = \"{{\"a \\\" d\"}}\" }`</script>",
+ 			"<script>var a = `${ var a = \"a \\u0022 d\" }`</script>",
+ 		},
++		{
++			"meta content attribute url",
++			`<meta http-equiv="refresh" content="asd; url={{"javascript:alert(1)"}}; asd; url={{"vbscript:alert(1)"}}; asd">`,
++			`<meta http-equiv="refresh" content="asd; url=#ZgotmplZ; asd; url=#ZgotmplZ; asd">`,
++		},
++		{
++			"meta content string",
++			`<meta http-equiv="refresh" content="{{"asd: 123"}}">`,
++			`<meta http-equiv="refresh" content="asd: 123">`,
++		},
+ 	}
+ 
+ 	for _, test := range tests {
+@@ -1016,6 +1026,14 @@ func TestErrors(t *testing.T) {
+ 			"<script>var tmpl = `asd ${return \"{\"}`;</script>",
+ 			``,
+ 		},
++		{
++			`{{if eq "" ""}}<meta>{{end}}`,
++			``,
++		},
++		{
++			`{{if eq "" ""}}<meta content="url={{"asd"}}">{{end}}`,
++			``,
++		},
+ 
+ 		// Error cases.
+ 		{
+@@ -2194,3 +2212,19 @@ func TestAliasedParseTreeDoesNotOverescape(t *testing.T) {
+ 		t.Fatalf(`Template "foo" and "bar" rendered %q and %q respectively, expected equal values`, got1, got2)
+ 	}
+ }
++
++func TestMetaContentEscapeGODEBUG(t *testing.T) {
++	savedGODEBUG := os.Getenv("GODEBUG")
++	os.Setenv("GODEBUG", savedGODEBUG+",htmlmetacontenturlescape=0")
++	defer func() { os.Setenv("GODEBUG", savedGODEBUG) }()
++
++	tmpl := Must(New("").Parse(`<meta http-equiv="refresh" content="asd; url={{"javascript:alert(1)"}}; asd; url={{"vbscript:alert(1)"}}; asd">`))
++	var b strings.Builder
++	if err := tmpl.Execute(&b, nil); err != nil {
++		t.Fatalf("unexpected error: %s", err)
++	}
++	want := `<meta http-equiv="refresh" content="asd; url=javascript:alert(1); asd; url=vbscript:alert(1); asd">`
++	if got := b.String(); got != want {
++		t.Fatalf("got %q, want %q", got, want)
++	}
++}
+diff --git a/src/html/template/state_string.go b/src/html/template/state_string.go
+index eed1e8b..f5a70b2 100644
+--- a/src/html/template/state_string.go
++++ b/src/html/template/state_string.go
+@@ -36,12 +36,14 @@ func _() {
+ 	_ = x[stateCSSBlockCmt-25]
+ 	_ = x[stateCSSLineCmt-26]
+ 	_ = x[stateError-27]
+-	_ = x[stateDead-28]
++	_ = x[stateMetaContent-28]
++	_ = x[stateMetaContentURL-29]
++	_ = x[stateDead-30]
+ }
+ 
+-const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSTmplLitstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateDead"
++const _state_name = "stateTextstateTagstateAttrNamestateAfterNamestateBeforeValuestateHTMLCmtstateRCDATAstateAttrstateURLstateSrcsetstateJSstateJSDqStrstateJSSqStrstateJSTmplLitstateJSRegexpstateJSBlockCmtstateJSLineCmtstateJSHTMLOpenCmtstateJSHTMLCloseCmtstateCSSstateCSSDqStrstateCSSSqStrstateCSSDqURLstateCSSSqURLstateCSSURLstateCSSBlockCmtstateCSSLineCmtstateErrorstateMetaContentstateMetaContentURLstateDead"
+ 
+-var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 156, 169, 184, 198, 216, 235, 243, 256, 269, 282, 295, 306, 322, 337, 347, 356}
++var _state_index = [...]uint16{0, 9, 17, 30, 44, 60, 72, 83, 92, 100, 111, 118, 130, 142, 156, 169, 184, 198, 216, 235, 243, 256, 269, 282, 295, 306, 322, 337, 347, 363, 382, 391}
+ 
+ func (i state) String() string {
+ 	if i >= state(len(_state_index)-1) {
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index d5a05f6..5aa3c35 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -23,6 +23,8 @@ var transitionFunc = [...]func(context, []byte) (context, int){
+ 	stateRCDATA:         tSpecialTagEnd,
+ 	stateAttr:           tAttr,
+ 	stateURL:            tURL,
++	stateMetaContent:    tMetaContent,
++	stateMetaContentURL: tMetaContentURL,
+ 	stateSrcset:         tURL,
+ 	stateJS:             tJS,
+ 	stateJSDqStr:        tJSDelimited,
+@@ -83,6 +85,7 @@ var elementContentType = [...]state{
+ 	elementStyle:    stateCSS,
+ 	elementTextarea: stateRCDATA,
+ 	elementTitle:    stateRCDATA,
++	elementMeta:     stateText,
+ }
+ 
+ // tTag is the context transition function for the tag state.
+@@ -93,6 +96,11 @@ func tTag(c context, s []byte) (context, int) {
+ 		return c, len(s)
+ 	}
+ 	if s[i] == '>' {
++		// Treat <meta> specially, because it doesn't have an end tag, and we
++		// want to transition into the correct state/element for it.
++		if c.element == elementMeta {
++			return context{state: stateText, element: elementNone}, i + 1
++		}
+ 		return context{
+ 			state:   elementContentType[c.element],
+ 			element: c.element,
+@@ -113,6 +121,8 @@ func tTag(c context, s []byte) (context, int) {
+ 	attrName := strings.ToLower(string(s[i:j]))
+ 	if c.element == elementScript && attrName == "type" {
+ 		attr = attrScriptType
++	} else if c.element == elementMeta && attrName == "content" {
++		attr = attrMetaContent
+ 	} else {
+ 		switch attrType(attrName) {
+ 		case contentTypeURL:
+@@ -162,12 +172,13 @@ func tAfterName(c context, s []byte) (context, int) {
+ }
+ 
+ var attrStartStates = [...]state{
+-	attrNone:       stateAttr,
+-	attrScript:     stateJS,
+-	attrScriptType: stateAttr,
+-	attrStyle:      stateCSS,
+-	attrURL:        stateURL,
+-	attrSrcset:     stateSrcset,
++	attrNone:        stateAttr,
++	attrScript:      stateJS,
++	attrScriptType:  stateAttr,
++	attrStyle:       stateCSS,
++	attrURL:         stateURL,
++	attrSrcset:      stateSrcset,
++	attrMetaContent: stateMetaContent,
+ }
+ 
+ // tBeforeValue is the context transition function for stateBeforeValue.
+@@ -203,6 +214,7 @@ var specialTagEndMarkers = [...][]byte{
+ 	elementStyle:    []byte("style"),
+ 	elementTextarea: []byte("textarea"),
+ 	elementTitle:    []byte("title"),
++	elementMeta:     []byte(""),
+ }
+ 
+ var (
+@@ -612,6 +624,28 @@ func tError(c context, s []byte) (context, int) {
+ 	return c, len(s)
+ }
+ 
++// tMetaContent is the context transition function for the meta content attribute state.
++func tMetaContent(c context, s []byte) (context, int) {
++	for i := 0; i < len(s); i++ {
++		if i+3 <= len(s)-1 && bytes.Equal(bytes.ToLower(s[i:i+4]), []byte("url=")) {
++			c.state = stateMetaContentURL
++			return c, i + 4
++		}
++	}
++	return c, len(s)
++}
++
++// tMetaContentURL is the context transition function for the "url=" part of a meta content attribute state.
++func tMetaContentURL(c context, s []byte) (context, int) {
++	for i := 0; i < len(s); i++ {
++		if s[i] == ';' {
++			c.state = stateMetaContent
++			return c, i + 1
++		}
++	}
++	return c, len(s)
++}
++
+ // eatAttrName returns the largest j such that s[i:j] is an attribute name.
+ // It returns an error if s[i:] does not look like it begins with an
+ // attribute name, such as encountering a quote mark without a preceding
+@@ -638,6 +672,7 @@ var elementNameMap = map[string]element{
+ 	"style":    elementStyle,
+ 	"textarea": elementTextarea,
+ 	"title":    elementTitle,
++	"meta":     elementMeta,
+ }
+ 
+ // asciiAlpha reports whether c is an ASCII letter.
+diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
+index 7178df6..90311eb 100644
+--- a/src/internal/godebugs/table.go
++++ b/src/internal/godebugs/table.go
+@@ -31,6 +31,7 @@ var All = []Info{
+ 	{Name: "gocachetest", Package: "cmd/go"},
+ 	{Name: "gocacheverify", Package: "cmd/go"},
+ 	{Name: "gotypesalias", Package: "go/types"},
++	{Name: "htmlmetacontenturlescape", Package: "html/template"},
+ 	{Name: "http2client", Package: "net/http"},
+ 	{Name: "http2debug", Package: "net/http", Opaque: true},
+ 	{Name: "http2server", Package: "net/http"},
+diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
+index 335f787..f68e386 100644
+--- a/src/runtime/metrics/doc.go
++++ b/src/runtime/metrics/doc.go
+@@ -255,6 +255,11 @@ Below is the full list of supported metrics, ordered lexicographically.
+ 		The number of non-default behaviors executed by the go/types
+ 		package due to a non-default GODEBUG=gotypesalias=... setting.
+ 
++	/godebug/non-default-behavior/htmlmetacontenturlescape:events
++		The number of non-default behaviors executed by
++		the html/template package due to a non-default
++		GODEBUG=htmlmetacontenturlescape=... setting.
++
+ 	/godebug/non-default-behavior/http2client:events
+ 		The number of non-default behaviors executed by the net/http
+ 		package due to a non-default GODEBUG=http2client=... setting.
+-- 
+2.43.0
+
-- 
2.53.0


