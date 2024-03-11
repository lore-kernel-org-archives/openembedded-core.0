Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD1EC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 05:44:27 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.55300.1710135861166765794
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 22:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZbPvj/CC;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dd6198c4e2so26885185ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 22:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1710135859; x=1710740659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vfcBf4r08oLp5XQC4I++/SaoylAqoRuEnAHYLPbUUe8=;
        b=ZbPvj/CCS6LEBFBohJafdfXfCHEsODGR1Wx3/pugp1M5OlU7Hw0p7wilqofWyRoQnl
         ZmxJIfsDb65aubA/khaNC/S67EAYVUmBDKOxzKK5rHhMgfQem/uNv9h5CJbMXGaXYYFT
         3qz1iDOV3xHgBbir3riMRB19P5gdcL/cyyQAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710135859; x=1710740659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfcBf4r08oLp5XQC4I++/SaoylAqoRuEnAHYLPbUUe8=;
        b=weZyFWo9gVvRUFtsvPriWNIMyqSwYVkGCmAQI5/5qv7mQOayckuWj881lNJq25LhAM
         WJh/yvnH7VXDvaYtFlOZg9AiEcQu1xvHHwcDeGsmM8dsBmNk+XQe8z24KwpGLLxEki12
         O8yzUheobaHYZsPx7WWySP2itYFYHnqyY/nhXNw/9rnJ0TePWH6Ug0oA2x/e+WqAw6YN
         8P4ai/MYEQVED73971X2/R3JqvPYndWWG52wSp9P/a0KciUDJ2ihJm6o0PGYlwUK9CU5
         dWLBjOSJsSPb/sG0b1oBLuChvvEZerMgWm07ugn1lCo4/lBAH/U+Mf7kRm9yj3MdvkkP
         ZGTw==
X-Gm-Message-State: AOJu0YwY4oCrmNCEUSLmJhS8ROrypYpoUwVd83GZt1mLnfQZKsd/Xb+X
	7YNSFs4j/Z5Qq6DF5a4ZsHlE3MMBVy7Sk9pRpDCgiuYYy1SScMiTYhqSW/f/rAQIokd4cpNFgOk
	e
X-Google-Smtp-Source: AGHT+IHPfd0RMECDEWcuCzePZzya+u5RLFJ0MqV/wPAjJEu0wp+CF0ytmL3yKYuBoa8SBS0U9946Aw==
X-Received: by 2002:a17:903:2443:b0:1dd:a642:81b8 with SMTP id l3-20020a170903244300b001dda64281b8mr189940pls.60.1710135859331;
        Sun, 10 Mar 2024 22:44:19 -0700 (PDT)
Received: from localhost.localdomain ([116.75.24.72])
        by smtp.googlemail.com with ESMTPSA id ko16-20020a17090307d000b001d9d4375149sm3717481plb.215.2024.03.10.22.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 22:44:18 -0700 (PDT)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: Backport fix CVE-2024-24784 & CVE-2024-24785
Date: Mon, 11 Mar 2024 11:14:00 +0530
Message-Id: <20240311054400.831311-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 05:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196911

Backport fixes for :

CVE-2024-24784 - Upstream-Status: Backport from https://github.com/golang/go/commit/5330cd225ba54c7dc78c1b46dcdf61a4671a632c
CVE-2024-24785 - Upstream-Status: Backport from https://github.com/golang/go/commit/056b0edcb8c152152021eebf4cf42adbfbe77992

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
 .../go/go-1.18/CVE-2024-24784.patch           | 207 ++++++++++++++++++
 .../go/go-1.18/CVE-2024-24785.patch           | 196 +++++++++++++++++
 3 files changed, 405 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2024-24784.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2024-24785.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index e635445579..768961de2c 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -53,6 +53,8 @@ SRC_URI += "\
     file://CVE-2023-45287.patch \
     file://CVE-2023-45289.patch \
     file://CVE-2023-45290.patch \
+    file://CVE-2024-24784.patch \
+    file://CVE-2024-24785.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2024-24784.patch b/meta/recipes-devtools/go/go-1.18/CVE-2024-24784.patch
new file mode 100644
index 0000000000..d3fc6b0313
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2024-24784.patch
@@ -0,0 +1,207 @@
+From 5330cd225ba54c7dc78c1b46dcdf61a4671a632c Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Wed, 10 Jan 2024 11:02:14 -0800
+Subject: [PATCH] [release-branch.go1.22] net/mail: properly handle special
+ characters in phrase and obs-phrase
+
+Fixes a couple of misalignments with RFC 5322 which introduce
+significant diffs between (mostly) conformant parsers.
+
+This change reverts the changes made in CL50911, which allowed certain
+special RFC 5322 characters to appear unquoted in the "phrase" syntax.
+It is unclear why this change was made in the first place, and created
+a divergence from comformant parsers. In particular this resulted in
+treating comments in display names incorrectly.
+
+Additionally properly handle trailing malformed comments in the group
+syntax.
+
+For #65083
+Fixed #65849
+
+Change-Id: I00dddc044c6ae3381154e43236632604c390f672
+Reviewed-on: https://go-review.googlesource.com/c/go/+/555596
+Reviewed-by: Damien Neil <dneil@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/566215
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5330cd225ba54c7dc78c1b46dcdf61a4671a632c]
+CVE: CVE-2024-24784
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/net/mail/message.go      | 30 +++++++++++++++------------
+ src/net/mail/message_test.go | 40 ++++++++++++++++++++++++++----------
+ 2 files changed, 46 insertions(+), 24 deletions(-)
+
+diff --git a/src/net/mail/message.go b/src/net/mail/message.go
+index 47bbf6c..84f48f0 100644
+--- a/src/net/mail/message.go
++++ b/src/net/mail/message.go
+@@ -231,7 +231,7 @@ func (a *Address) String() string {
+	// Add quotes if needed
+	quoteLocal := false
+	for i, r := range local {
+-		if isAtext(r, false, false) {
++		if isAtext(r, false) {
+			continue
+		}
+		if r == '.' {
+@@ -395,7 +395,7 @@ func (p *addrParser) parseAddress(handleGroup bool) ([]*Address, error) {
+	if !p.consume('<') {
+		atext := true
+		for _, r := range displayName {
+-			if !isAtext(r, true, false) {
++			if !isAtext(r, true) {
+				atext = false
+				break
+			}
+@@ -430,7 +430,9 @@ func (p *addrParser) consumeGroupList() ([]*Address, error) {
+	// handle empty group.
+	p.skipSpace()
+	if p.consume(';') {
+-		p.skipCFWS()
++		if !p.skipCFWS() {
++			return nil, errors.New("mail: misformatted parenthetical comment")
++		}
+		return group, nil
+	}
+
+@@ -447,7 +449,9 @@ func (p *addrParser) consumeGroupList() ([]*Address, error) {
+			return nil, errors.New("mail: misformatted parenthetical comment")
+		}
+		if p.consume(';') {
+-			p.skipCFWS()
++			if !p.skipCFWS() {
++				return nil, errors.New("mail: misformatted parenthetical comment")
++			}
+			break
+		}
+		if !p.consume(',') {
+@@ -517,6 +521,12 @@ func (p *addrParser) consumePhrase() (phrase string, err error) {
+	var words []string
+	var isPrevEncoded bool
+	for {
++		// obs-phrase allows CFWS after one word
++		if len(words) > 0 {
++			if !p.skipCFWS() {
++				return "", errors.New("mail: misformatted parenthetical comment")
++			}
++		}
+		// word = atom / quoted-string
+		var word string
+		p.skipSpace()
+@@ -612,7 +622,6 @@ Loop:
+ // If dot is true, consumeAtom parses an RFC 5322 dot-atom instead.
+ // If permissive is true, consumeAtom will not fail on:
+ // - leading/trailing/double dots in the atom (see golang.org/issue/4938)
+-// - special characters (RFC 5322 3.2.3) except '<', '>', ':' and '"' (see golang.org/issue/21018)
+ func (p *addrParser) consumeAtom(dot bool, permissive bool) (atom string, err error) {
+	i := 0
+
+@@ -623,7 +632,7 @@ Loop:
+		case size == 1 && r == utf8.RuneError:
+			return "", fmt.Errorf("mail: invalid utf-8 in address: %q", p.s)
+
+-		case size == 0 || !isAtext(r, dot, permissive):
++		case size == 0 || !isAtext(r, dot):
+			break Loop
+
+		default:
+@@ -777,18 +786,13 @@ func (e charsetError) Error() string {
+
+ // isAtext reports whether r is an RFC 5322 atext character.
+ // If dot is true, period is included.
+-// If permissive is true, RFC 5322 3.2.3 specials is included,
+-// except '<', '>', ':' and '"'.
+-func isAtext(r rune, dot, permissive bool) bool {
++func isAtext(r rune, dot bool) bool {
+	switch r {
+	case '.':
+		return dot
+
+	// RFC 5322 3.2.3. specials
+-	case '(', ')', '[', ']', ';', '@', '\\', ',':
+-		return permissive
+-
+-	case '<', '>', '"', ':':
++	case '(', ')', '<', '>', '[', ']', ':', ';', '@', '\\', ',', '"': // RFC 5322 3.2.3. specials
+		return false
+	}
+	return isVchar(r)
+diff --git a/src/net/mail/message_test.go b/src/net/mail/message_test.go
+index 80a17b2..00bc93e 100644
+--- a/src/net/mail/message_test.go
++++ b/src/net/mail/message_test.go
+@@ -334,8 +334,11 @@ func TestAddressParsingError(t *testing.T) {
+		13: {"group not closed: null@example.com", "expected comma"},
+		14: {"group: first@example.com, second@example.com;", "group with multiple addresses"},
+		15: {"john.doe", "missing '@' or angle-addr"},
+-		16: {"john.doe@", "no angle-addr"},
++		16: {"john.doe@", "missing '@' or angle-addr"},
+		17: {"John Doe@foo.bar", "no angle-addr"},
++		18: {" group: null@example.com; (asd", "misformatted parenthetical comment"},
++		19: {" group: ; (asd", "misformatted parenthetical comment"},
++		20: {`(John) Doe <jdoe@machine.example>`, "missing word in phrase:"},
+	}
+
+	for i, tc := range mustErrTestCases {
+@@ -374,24 +377,19 @@ func TestAddressParsing(t *testing.T) {
+				Address: "john.q.public@example.com",
+			}},
+		},
+-		{
+-			`"John (middle) Doe" <jdoe@machine.example>`,
+-			[]*Address{{
+-				Name:    "John (middle) Doe",
+-				Address: "jdoe@machine.example",
+-			}},
+-		},
++		// Comment in display name
+		{
+			`John (middle) Doe <jdoe@machine.example>`,
+			[]*Address{{
+-				Name:    "John (middle) Doe",
++				Name:    "John Doe",
+				Address: "jdoe@machine.example",
+			}},
+		},
++		// Display name is quoted string, so comment is not a comment
+		{
+-			`John !@M@! Doe <jdoe@machine.example>`,
++			`"John (middle) Doe" <jdoe@machine.example>`,
+			[]*Address{{
+-				Name:    "John !@M@! Doe",
++				Name:    "John (middle) Doe",
+				Address: "jdoe@machine.example",
+			}},
+		},
+@@ -726,6 +724,26 @@ func TestAddressParsing(t *testing.T) {
+				},
+			},
+		},
++		// Comment in group display name
++		{
++			`group (comment:): a@example.com, b@example.com;`,
++			[]*Address{
++				{
++					Address: "a@example.com",
++				},
++				{
++					Address: "b@example.com",
++				},
++			},
++		},
++		{
++			`x(:"):"@a.example;("@b.example;`,
++			[]*Address{
++				{
++					Address: `@a.example;(@b.example`,
++				},
++			},
++		},
+	}
+	for _, test := range tests {
+		if len(test.exp) == 1 {
+--
+2.39.3
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2024-24785.patch b/meta/recipes-devtools/go/go-1.18/CVE-2024-24785.patch
new file mode 100644
index 0000000000..5c8244e89a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2024-24785.patch
@@ -0,0 +1,196 @@
+From 056b0edcb8c152152021eebf4cf42adbfbe77992 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Wed, 14 Feb 2024 17:18:36 -0800
+Subject: [PATCH] [release-branch.go1.22] html/template: escape additional
+ tokens in MarshalJSON errors
+
+Escape "</script" and "<!--" in errors returned from MarshalJSON errors
+when attempting to marshal types in script blocks. This prevents any
+user controlled content from prematurely terminating the script block.
+
+Updates #65697
+Fixes #65969
+
+Change-Id: Icf0e26c54ea7d9c1deed0bff11b6506c99ddef1b
+Reviewed-on: https://go-review.googlesource.com/c/go/+/564196
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit ccbc725f2d678255df1bd326fa511a492aa3a0aa)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/567535
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/056b0edcb8c152152021eebf4cf42adbfbe77992]
+CVE: CVE-2024-24785
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/html/template/js.go      | 22 ++++++++-
+ src/html/template/js_test.go | 96 ++++++++++++++++++++----------------
+ 2 files changed, 74 insertions(+), 44 deletions(-)
+
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index 35994f0..4d3b25d 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -171,13 +171,31 @@ func jsValEscaper(args ...interface{}) string {
+	// cyclic data. This may be an unacceptable DoS risk.
+	b, err := json.Marshal(a)
+	if err != nil {
+-		// Put a space before comment so that if it is flush against
++		// While the standard JSON marshaller does not include user controlled
++		// information in the error message, if a type has a MarshalJSON method,
++		// the content of the error message is not guaranteed. Since we insert
++		// the error into the template, as part of a comment, we attempt to
++		// prevent the error from either terminating the comment, or the script
++		// block itself.
++		//
++		// In particular we:
++		//   * replace "*/" comment end tokens with "* /", which does not
++		//     terminate the comment
++		//   * replace "</script" with "\x3C/script", and "<!--" with
++		//     "\x3C!--", which prevents confusing script block termination
++		//     semantics
++		//
++		// We also put a space before the comment so that if it is flush against
+		// a division operator it is not turned into a line comment:
+		//     x/{{y}}
+		// turning into
+		//     x//* error marshaling y:
+		//          second line of error message */null
+-		return fmt.Sprintf(" /* %s */null ", strings.ReplaceAll(err.Error(), "*/", "* /"))
++		errStr := err.Error()
++		errStr = strings.ReplaceAll(errStr, "*/", "* /")
++		errStr = strings.ReplaceAll(errStr, "</script", `\x3C/script`)
++		errStr = strings.ReplaceAll(errStr, "<!--", `\x3C!--`)
++		return fmt.Sprintf(" /* %s */null ", errStr)
+	}
+
+	// TODO: maybe post-process output to prevent it from containing
+diff --git a/src/html/template/js_test.go b/src/html/template/js_test.go
+index de9ef28..0eaec11 100644
+--- a/src/html/template/js_test.go
++++ b/src/html/template/js_test.go
+@@ -5,6 +5,7 @@
+ package template
+
+ import (
++        "errors"
+	"bytes"
+	"math"
+	"strings"
+@@ -104,61 +105,72 @@ func TestNextJsCtx(t *testing.T) {
+	}
+ }
+
++type jsonErrType struct{}
++
++func (e *jsonErrType) MarshalJSON() ([]byte, error) {
++	return nil, errors.New("beep */ boop </script blip <!--")
++}
++
+ func TestJSValEscaper(t *testing.T) {
+	tests := []struct {
+-		x  interface{}
+-		js string
++		x        any
++		js       string
++		skipNest bool
+	}{
+-		{int(42), " 42 "},
+-		{uint(42), " 42 "},
+-		{int16(42), " 42 "},
+-		{uint16(42), " 42 "},
+-		{int32(-42), " -42 "},
+-		{uint32(42), " 42 "},
+-		{int16(-42), " -42 "},
+-		{uint16(42), " 42 "},
+-		{int64(-42), " -42 "},
+-		{uint64(42), " 42 "},
+-		{uint64(1) << 53, " 9007199254740992 "},
++		{int(42), " 42 ", false},
++		{uint(42), " 42 ", false},
++		{int16(42), " 42 ", false},
++		{uint16(42), " 42 ", false},
++		{int32(-42), " -42 ", false},
++		{uint32(42), " 42 ", false},
++		{int16(-42), " -42 ", false},
++		{uint16(42), " 42 ", false},
++		{int64(-42), " -42 ", false},
++		{uint64(42), " 42 ", false},
++		{uint64(1) << 53, " 9007199254740992 ", false},
+		// ulp(1 << 53) > 1 so this loses precision in JS
+		// but it is still a representable integer literal.
+-		{uint64(1)<<53 + 1, " 9007199254740993 "},
+-		{float32(1.0), " 1 "},
+-		{float32(-1.0), " -1 "},
+-		{float32(0.5), " 0.5 "},
+-		{float32(-0.5), " -0.5 "},
+-		{float32(1.0) / float32(256), " 0.00390625 "},
+-		{float32(0), " 0 "},
+-		{math.Copysign(0, -1), " -0 "},
+-		{float64(1.0), " 1 "},
+-		{float64(-1.0), " -1 "},
+-		{float64(0.5), " 0.5 "},
+-		{float64(-0.5), " -0.5 "},
+-		{float64(0), " 0 "},
+-		{math.Copysign(0, -1), " -0 "},
+-		{"", `""`},
+-		{"foo", `"foo"`},
++		{uint64(1)<<53 + 1, " 9007199254740993 ", false},
++		{float32(1.0), " 1 ", false},
++		{float32(-1.0), " -1 ", false},
++		{float32(0.5), " 0.5 ", false},
++		{float32(-0.5), " -0.5 ", false},
++		{float32(1.0) / float32(256), " 0.00390625 ", false},
++		{float32(0), " 0 ", false},
++		{math.Copysign(0, -1), " -0 ", false},
++		{float64(1.0), " 1 ", false},
++		{float64(-1.0), " -1 ", false},
++		{float64(0.5), " 0.5 ", false},
++		{float64(-0.5), " -0.5 ", false},
++		{float64(0), " 0 ", false},
++		{math.Copysign(0, -1), " -0 ", false},
++		{"", `""`, false},
++		{"foo", `"foo"`, false},
+		// Newlines.
+-		{"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`},
++		{"\r\n\u2028\u2029", `"\r\n\u2028\u2029"`, false},
+		// "\v" == "v" on IE 6 so use "\u000b" instead.
+-		{"\t\x0b", `"\t\u000b"`},
+-		{struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`},
+-		{[]interface{}{}, "[]"},
+-		{[]interface{}{42, "foo", nil}, `[42,"foo",null]`},
+-		{[]string{"<!--", "</script>", "-->"}, `["\u003c!--","\u003c/script\u003e","--\u003e"]`},
+-		{"<!--", `"\u003c!--"`},
+-		{"-->", `"--\u003e"`},
+-		{"<![CDATA[", `"\u003c![CDATA["`},
+-		{"]]>", `"]]\u003e"`},
+-		{"</script", `"\u003c/script"`},
+-		{"\U0001D11E", "\"\U0001D11E\""}, // or "\uD834\uDD1E"
+-		{nil, " null "},
++		{"\t\x0b", `"\t\u000b"`, false},
++		{struct{ X, Y int }{1, 2}, `{"X":1,"Y":2}`, false},
++		{[]any{}, "[]", false},
++		{[]any{42, "foo", nil}, `[42,"foo",null]`, false},
++		{[]string{"<!--", "</script>", "-->"}, `["\u003c!--","\u003c/script\u003e","--\u003e"]`, false},
++		{"<!--", `"\u003c!--"`, false},
++		{"-->", `"--\u003e"`, false},
++		{"<![CDATA[", `"\u003c![CDATA["`, false},
++		{"]]>", `"]]\u003e"`, false},
++		{"</script", `"\u003c/script"`, false},
++		{"\U0001D11E", "\"\U0001D11E\"", false}, // or "\uD834\uDD1E"
++		{nil, " null ", false},
++		{&jsonErrType{}, " /* json: error calling MarshalJSON for type *template.jsonErrType: beep * / boop \\x3C/script blip \\x3C!-- */null ", true},
+	}
+
+	for _, test := range tests {
+		if js := jsValEscaper(test.x); js != test.js {
+			t.Errorf("%+v: want\n\t%q\ngot\n\t%q", test.x, test.js, js)
+		}
++		if test.skipNest {
++			continue
++		}
+		// Make sure that escaping corner cases are not broken
+		// by nesting.
+		a := []interface{}{test.x}
+--
+2.39.3
-- 
2.39.3


