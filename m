Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C437C7EE23
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:10:44 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.77.1683043835172339837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 09:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=kkOpkDz7;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: skulkarni@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1aaf91ae451so22722515ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1683043834; x=1685635834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zoej4F2n/5URdQw70WfZyo9EaaEeB9pRUAieyEPJ6k=;
        b=kkOpkDz76DVOlPV0BYlFUFE3s8Z/LMOKUu7DI+l3K5dFtE3mXwU5C4kxUWAVMbgnG/
         wUfPsS2nih7P1yzkqm5nkabZJheO4seOHE3EcJNC/AeoqqcEdWOFCJlzAgjDJ4VQqXgL
         NqGr0zV/rGTKjWf83ZXSyVv+6Gzlw/8nNS9Us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683043834; x=1685635834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Zoej4F2n/5URdQw70WfZyo9EaaEeB9pRUAieyEPJ6k=;
        b=G4JlYY8BjFj86EvOEWy/OPCYjcCb6JLVLgGJycyJ955AndH5l8jrvCpnlNsB+zGzDy
         tkIWNGpnfkw4av1sp3WkMEWaHi1lZIuu0c8ARsj+uR+/ZOkPkCkIe61/gjJiNGM4heA+
         y0mCckJEuGP92F0zeBluFBWGmHzlcmtqU73ReuPQDkMI6ui6sAqv+k/jyfQMdmgb+l8M
         usewtbrx+xkWgbIIRMO3peQkQbCu3wyzvhWVvMQuMR8ZIsCM4wjTYXLslrBG/JG1LEwV
         sW2FUYBiCk7tou2AVHt9/2SioOy2q8js3CNNF1It3jAbdoSGrpxbLUIDhXWjvxtN4SyT
         es6w==
X-Gm-Message-State: AC+VfDzjbmCOQqP4GAhyW79PvZ6OxZvBnCp5vz9ZbPXl23VZq6uxq7Rm
	dNNTF3whN+BqV1o+774yg/iyFeZtL+RSm+qp9EQ=
X-Google-Smtp-Source: ACHHUZ6Xl5E1rGDt8Q/DDppsWQ6gxaN7k9LYYPpd9iZPtlLl/A7ZfCEdj60vieUUlRB15i80aF+y0A==
X-Received: by 2002:a17:902:ec83:b0:1a6:9f9b:1327 with SMTP id x3-20020a170902ec8300b001a69f9b1327mr21545565plg.45.1683043833681;
        Tue, 02 May 2023 09:10:33 -0700 (PDT)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id x9-20020a1709029a4900b001a6388ce38bsm20010917plv.240.2023.05.02.09.10.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 May 2023 09:10:32 -0700 (PDT)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] go: Security fix for CVE-2023-24538
Date: Tue,  2 May 2023 21:40:12 +0530
Message-Id: <1683043812-15152-1-git-send-email-skulkarni@mvista.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 16:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180751

From: Shubham Kulkarni <skulkarni@mvista.com>

html/template: disallow actions in JS template literals

Backport from https://github.com/golang/go/commit/b1e3ecfa06b67014429a197ec5e134ce4303ad9b

Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc               |   3 +
 .../go/go-1.14/CVE-2023-24538-1.patch              | 125 +++++++++++++
 .../go/go-1.14/CVE-2023-24538-2.patch              | 196 +++++++++++++++++++
 .../go/go-1.14/CVE-2023-24538-3.patch              | 208 +++++++++++++++++++++
 4 files changed, 532 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 3b99b8f..f734fe1 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -58,6 +58,9 @@ SRC_URI += "\
     file://CVE-2020-29510.patch \
     file://CVE-2023-24537.patch \
     file://CVE-2023-24534.patch \
+    file://CVE-2023-24538-1.patch \
+    file://CVE-2023-24538-2.patch \
+    file://CVE-2023-24538-3.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
new file mode 100644
index 0000000..eda26e5
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-1.patch
@@ -0,0 +1,125 @@
+From 8acd01094d9ee17f6e763a61e49a8a808b3a9ddb Mon Sep 17 00:00:00 2001
+From: Brad Fitzpatrick <bradfitz@golang.org>
+Date: Mon, 2 Aug 2021 14:55:51 -0700
+Subject: [PATCH 1/3] net/netip: add new IP address package
+
+Co-authored-by: Alex Willmer <alex@moreati.org.uk> (GitHub @moreati)
+Co-authored-by: Alexander Yastrebov <yastrebov.alex@gmail.com>
+Co-authored-by: David Anderson <dave@natulte.net> (Tailscale CLA)
+Co-authored-by: David Crawshaw <crawshaw@tailscale.com> (Tailscale CLA)
+Co-authored-by: Dmytro Shynkevych <dmytro@tailscale.com> (Tailscale CLA)
+Co-authored-by: Elias Naur <mail@eliasnaur.com>
+Co-authored-by: Joe Tsai <joetsai@digital-static.net> (Tailscale CLA)
+Co-authored-by: Jonathan Yu <jawnsy@cpan.org> (GitHub @jawnsy)
+Co-authored-by: Josh Bleecher Snyder <josharian@gmail.com> (Tailscale CLA)
+Co-authored-by: Maisem Ali <maisem@tailscale.com> (Tailscale CLA)
+Co-authored-by: Manuel Mendez (Go AUTHORS mmendez534@...)
+Co-authored-by: Matt Layher <mdlayher@gmail.com>
+Co-authored-by: Noah Treuhaft <noah.treuhaft@gmail.com> (GitHub @nwt)
+Co-authored-by: Stefan Majer <stefan.majer@gmail.com>
+Co-authored-by: Terin Stock <terinjokes@gmail.com> (Cloudflare CLA)
+Co-authored-by: Tobias Klauser <tklauser@distanz.ch>
+
+Fixes #46518
+
+Change-Id: I0041f9e1115d61fa6e95fcf32b01d9faee708712
+Reviewed-on: https://go-review.googlesource.com/c/go/+/339309
+Run-TryBot: Brad Fitzpatrick <bradfitz@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Russ Cox <rsc@golang.org>
+Trust: Brad Fitzpatrick <bradfitz@golang.org>
+
+Dependency Patch #1
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/a59e33224e42d60a97fa720a45e1b74eb6aaa3d0]
+CVE: CVE-2023-24538
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/internal/godebug/godebug.go      | 34 ++++++++++++++++++++++++++++++++++
+ src/internal/godebug/godebug_test.go | 34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 68 insertions(+)
+ create mode 100644 src/internal/godebug/godebug.go
+ create mode 100644 src/internal/godebug/godebug_test.go
+
+diff --git a/src/internal/godebug/godebug.go b/src/internal/godebug/godebug.go
+new file mode 100644
+index 0000000..ac434e5
+--- /dev/null
++++ b/src/internal/godebug/godebug.go
+@@ -0,0 +1,34 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++// Package godebug parses the GODEBUG environment variable.
++package godebug
++
++import "os"
++
++// Get returns the value for the provided GODEBUG key.
++func Get(key string) string {
++	return get(os.Getenv("GODEBUG"), key)
++}
++
++// get returns the value part of key=value in s (a GODEBUG value).
++func get(s, key string) string {
++	for i := 0; i < len(s)-len(key)-1; i++ {
++		if i > 0 && s[i-1] != ',' {
++			continue
++		}
++		afterKey := s[i+len(key):]
++		if afterKey[0] != '=' || s[i:i+len(key)] != key {
++			continue
++		}
++		val := afterKey[1:]
++		for i, b := range val {
++			if b == ',' {
++				return val[:i]
++			}
++		}
++		return val
++	}
++	return ""
++}
+diff --git a/src/internal/godebug/godebug_test.go b/src/internal/godebug/godebug_test.go
+new file mode 100644
+index 0000000..41b9117
+--- /dev/null
++++ b/src/internal/godebug/godebug_test.go
+@@ -0,0 +1,34 @@
++// Copyright 2021 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package godebug
++
++import "testing"
++
++func TestGet(t *testing.T) {
++	tests := []struct {
++		godebug string
++		key     string
++		want    string
++	}{
++		{"", "", ""},
++		{"", "foo", ""},
++		{"foo=bar", "foo", "bar"},
++		{"foo=bar,after=x", "foo", "bar"},
++		{"before=x,foo=bar,after=x", "foo", "bar"},
++		{"before=x,foo=bar", "foo", "bar"},
++		{",,,foo=bar,,,", "foo", "bar"},
++		{"foodecoy=wrong,foo=bar", "foo", "bar"},
++		{"foo=", "foo", ""},
++		{"foo", "foo", ""},
++		{",foo", "foo", ""},
++		{"foo=bar,baz", "loooooooong", ""},
++	}
++	for _, tt := range tests {
++		got := get(tt.godebug, tt.key)
++		if got != tt.want {
++			t.Errorf("get(%q, %q) = %q; want %q", tt.godebug, tt.key, got, tt.want)
++		}
++	}
++}
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
new file mode 100644
index 0000000..5036f28
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-2.patch
@@ -0,0 +1,196 @@
+From 6fc21505614f36178df0dad7034b6b8e3f7588d5 Mon Sep 17 00:00:00 2001
+From: empijei <robclap8@gmail.com>
+Date: Fri, 27 Mar 2020 19:27:55 +0100
+Subject: [PATCH 2/3] html/template,text/template: switch to Unicode escapes
+ for JSON compatibility
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The existing implementation is not compatible with JSON
+escape as it uses hex escaping.
+Unicode escape, instead, is valid for both JSON and JS.
+This fix avoids creating a separate escaping context for
+scripts of type "application/ld+json" and it is more
+future-proof in case more JSON+JS contexts get added
+to the platform (e.g. import maps).
+
+Fixes #33671
+Fixes #37634
+
+Change-Id: Id6f6524b4abc52e81d9d744d46bbe5bf2e081543
+Reviewed-on: https://go-review.googlesource.com/c/go/+/226097
+Reviewed-by: Carl Johnson <me@carlmjohnson.net>
+Reviewed-by: Daniel Martí <mvdan@mvdan.cc>
+Run-TryBot: Daniel Martí <mvdan@mvdan.cc>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+
+Dependency Patch #2
+
+Upstream-Status: Backport from https://github.com/golang/go/commit/d4d298040d072ddacea0e0d6b55fb148fff18070
+CVE: CVE-2023-24538
+Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
+---
+ src/html/template/js.go    | 70 +++++++++++++++++++++++++++-------------------
+ src/text/template/funcs.go |  8 +++---
+ 2 files changed, 46 insertions(+), 32 deletions(-)
+
+diff --git a/src/html/template/js.go b/src/html/template/js.go
+index 0e91458..ea9c183 100644
+--- a/src/html/template/js.go
++++ b/src/html/template/js.go
+@@ -163,7 +163,6 @@ func jsValEscaper(args ...interface{}) string {
+	}
+	// TODO: detect cycles before calling Marshal which loops infinitely on
+	// cyclic data. This may be an unacceptable DoS risk.
+-
+	b, err := json.Marshal(a)
+	if err != nil {
+		// Put a space before comment so that if it is flush against
+@@ -178,8 +177,8 @@ func jsValEscaper(args ...interface{}) string {
+	// TODO: maybe post-process output to prevent it from containing
+	// "<!--", "-->", "<![CDATA[", "]]>", or "</script"
+	// in case custom marshalers produce output containing those.
+-
+-	// TODO: Maybe abbreviate \u00ab to \xab to produce more compact output.
++	// Note: Do not use \x escaping to save bytes because it is not JSON compatible and this escaper
++	// supports ld+json content-type.
+	if len(b) == 0 {
+		// In, `x=y/{{.}}*z` a json.Marshaler that produces "" should
+		// not cause the output `x=y/*z`.
+@@ -260,6 +259,8 @@ func replace(s string, replacementTable []string) string {
+		r, w = utf8.DecodeRuneInString(s[i:])
+		var repl string
+		switch {
++		case int(r) < len(lowUnicodeReplacementTable):
++			repl = lowUnicodeReplacementTable[r]
+		case int(r) < len(replacementTable) && replacementTable[r] != "":
+			repl = replacementTable[r]
+		case r == '\u2028':
+@@ -283,67 +284,80 @@ func replace(s string, replacementTable []string) string {
+	return b.String()
+ }
+
++var lowUnicodeReplacementTable = []string{
++	0: `\u0000`, 1: `\u0001`, 2: `\u0002`, 3: `\u0003`, 4: `\u0004`, 5: `\u0005`, 6: `\u0006`,
++	'\a': `\u0007`,
++	'\b': `\u0008`,
++	'\t': `\t`,
++	'\n': `\n`,
++	'\v': `\u000b`, // "\v" == "v" on IE 6.
++	'\f': `\f`,
++	'\r': `\r`,
++	0xe:  `\u000e`, 0xf: `\u000f`, 0x10: `\u0010`, 0x11: `\u0011`, 0x12: `\u0012`, 0x13: `\u0013`,
++	0x14: `\u0014`, 0x15: `\u0015`, 0x16: `\u0016`, 0x17: `\u0017`, 0x18: `\u0018`, 0x19: `\u0019`,
++	0x1a: `\u001a`, 0x1b: `\u001b`, 0x1c: `\u001c`, 0x1d: `\u001d`, 0x1e: `\u001e`, 0x1f: `\u001f`,
++}
++
+ var jsStrReplacementTable = []string{
+-	0:    `\0`,
++	0:    `\u0000`,
+	'\t': `\t`,
+	'\n': `\n`,
+-	'\v': `\x0b`, // "\v" == "v" on IE 6.
++	'\v': `\u000b`, // "\v" == "v" on IE 6.
+	'\f': `\f`,
+	'\r': `\r`,
+	// Encode HTML specials as hex so the output can be embedded
+	// in HTML attributes without further encoding.
+-	'"':  `\x22`,
+-	'&':  `\x26`,
+-	'\'': `\x27`,
+-	'+':  `\x2b`,
++	'"':  `\u0022`,
++	'&':  `\u0026`,
++	'\'': `\u0027`,
++	'+':  `\u002b`,
+	'/':  `\/`,
+-	'<':  `\x3c`,
+-	'>':  `\x3e`,
++	'<':  `\u003c`,
++	'>':  `\u003e`,
+	'\\': `\\`,
+ }
+
+ // jsStrNormReplacementTable is like jsStrReplacementTable but does not
+ // overencode existing escapes since this table has no entry for `\`.
+ var jsStrNormReplacementTable = []string{
+-	0:    `\0`,
++	0:    `\u0000`,
+	'\t': `\t`,
+	'\n': `\n`,
+-	'\v': `\x0b`, // "\v" == "v" on IE 6.
++	'\v': `\u000b`, // "\v" == "v" on IE 6.
+	'\f': `\f`,
+	'\r': `\r`,
+	// Encode HTML specials as hex so the output can be embedded
+	// in HTML attributes without further encoding.
+-	'"':  `\x22`,
+-	'&':  `\x26`,
+-	'\'': `\x27`,
+-	'+':  `\x2b`,
++	'"':  `\u0022`,
++	'&':  `\u0026`,
++	'\'': `\u0027`,
++	'+':  `\u002b`,
+	'/':  `\/`,
+-	'<':  `\x3c`,
+-	'>':  `\x3e`,
++	'<':  `\u003c`,
++	'>':  `\u003e`,
+ }
+-
+ var jsRegexpReplacementTable = []string{
+-	0:    `\0`,
++	0:    `\u0000`,
+	'\t': `\t`,
+	'\n': `\n`,
+-	'\v': `\x0b`, // "\v" == "v" on IE 6.
++	'\v': `\u000b`, // "\v" == "v" on IE 6.
+	'\f': `\f`,
+	'\r': `\r`,
+	// Encode HTML specials as hex so the output can be embedded
+	// in HTML attributes without further encoding.
+-	'"':  `\x22`,
++	'"':  `\u0022`,
+	'$':  `\$`,
+-	'&':  `\x26`,
+-	'\'': `\x27`,
++	'&':  `\u0026`,
++	'\'': `\u0027`,
+	'(':  `\(`,
+	')':  `\)`,
+	'*':  `\*`,
+-	'+':  `\x2b`,
++	'+':  `\u002b`,
+	'-':  `\-`,
+	'.':  `\.`,
+	'/':  `\/`,
+-	'<':  `\x3c`,
+-	'>':  `\x3e`,
++	'<':  `\u003c`,
++	'>':  `\u003e`,
+	'?':  `\?`,
+	'[':  `\[`,
+	'\\': `\\`,
+diff --git a/src/text/template/funcs.go b/src/text/template/funcs.go
+index 46125bc..f3de9fb 100644
+--- a/src/text/template/funcs.go
++++ b/src/text/template/funcs.go
+@@ -640,10 +640,10 @@ var (
+	jsBackslash = []byte(`\\`)
+	jsApos      = []byte(`\'`)
+	jsQuot      = []byte(`\"`)
+-	jsLt        = []byte(`\x3C`)
+-	jsGt        = []byte(`\x3E`)
+-	jsAmp       = []byte(`\x26`)
+-	jsEq        = []byte(`\x3D`)
++	jsLt        = []byte(`\u003C`)
++	jsGt        = []byte(`\u003E`)
++	jsAmp       = []byte(`\u0026`)
++	jsEq        = []byte(`\u003D`)
+ )
+
+ // JSEscape writes to w the escaped JavaScript equivalent of the plain text data b.
+--
+2.7.4
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
new file mode 100644
index 0000000..d5bb33e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24538-3.patch
@@ -0,0 +1,208 @@
+From 16f4882984569f179d73967c9eee679bb9b098c5 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 20 Mar 2023 11:01:13 -0700
+Subject: [PATCH 3/3] html/template: disallow actions in JS template literals
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
+index f12dafa..29ca5b3 100644
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
+@@ -203,6 +204,16 @@ func (e *escaper) escapeAction(c context, n *parse.ActionNode) context {
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
2.7.4


