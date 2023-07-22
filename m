Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1725C001DC
	for <webhook@archiver.kernel.org>; Sat, 22 Jul 2023 18:57:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.11707.1690052228877613835
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jul 2023 11:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kI74AABW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-66767d628e2so1772151b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690052228; x=1690657028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7v21QBA0aNEw7C8cHbhzhMJwOB/MA6ZfoFhMxn+OBpk=;
        b=kI74AABWDL33uwHreACYgGE0woK6Ng35OdQKkZi8X2wbZk7PoZkZo8eJow1z0TALN4
         S1g/N9NSVqeyfZkj9MOa+2mKkn0S5wQJMEncAgrVUHHe9k/cSdhNDCLtaL5mGMMX/Nqx
         ErXrg1MZrj/6Lpc/w86ky1Fqt62wS/UN+07IgoRfYmo2zdpp5ZOI/iYCRnTow/vXjKRS
         t/jzRQbQ2efLmgrQA7eIO7qDSoRj/nevpIiT5KeM8Wmie37ucFWOmeMqQEd0X1/XoVWK
         DGzroVJjlihlymjgGOIniainEiCa+GUc6i+i3xYRnqlyYIo8ikRo3B4xMCnffB6dNHjp
         4MKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690052228; x=1690657028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7v21QBA0aNEw7C8cHbhzhMJwOB/MA6ZfoFhMxn+OBpk=;
        b=SL/ukmd3tkRrSennMlQn20nmGfafefGYCc7GSY2NOfFp5PZOWBTWCUiCp5UW3V8Bg3
         KuYIvYBjktPh+Mk+GOsy4t4asoDVdVYKVhv8rC+mtNMkh1ibnYRd/Icl0zPXp02cVsny
         NMTfiBCyOqydvVif+5Zunpp7AcbWkekM4/DoR9yXjax31FMAY4DA0lSa+fsnbY3Maxoq
         nPxseqQTqlHkKOgSXZcXlJkSzsRDLNo3NfTHhuqJmVg69vndVKZ0CAsdOrLh/rXEsAcT
         EdCtkKNwnPSCuF3vJyz6NKQob4bVjcwN9SeW9qIDfPMBMnLR742zRgHICr96UTMeAqj4
         nFhA==
X-Gm-Message-State: ABy/qLbt4vkr+CVcmVCckMmLsFRI2TnibBLJtlvBqnd6kSXN6TsTNiEf
	jPmI7o9sVJ5QPP0dxa1k5EtKnbu9ByeAxwkPFes=
X-Google-Smtp-Source: APBJJlEL4bC3HxpSaxpoI3AiTPOTjhsIT9rEG3+qBZYKvQy0yeyAYmSOLOfn2qekbHaR5UkfrUafrg==
X-Received: by 2002:a05:6a20:49a8:b0:137:3eba:b805 with SMTP id fs40-20020a056a2049a800b001373ebab805mr3267788pzb.37.1690052227725;
        Sat, 22 Jul 2023 11:57:07 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g28-20020a63375c000000b00553ad4ae5e5sm5400572pgn.22.2023.07.22.11.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 11:57:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/11] go: fix CVE-2023-24531
Date: Sat, 22 Jul 2023 08:56:46 -1000
Message-Id: <5d80e920c7ceaf091ccace8a3b6781b720abafbf.1690052101.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690052101.git.steve@sakoman.com>
References: <cover.1690052101.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jul 2023 18:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184725

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport required commits to fix CVE-2023-24531.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.20.5.inc        |   2 +
 .../go/go/CVE-2023-24531_1.patch              | 266 ++++++++++++++++++
 .../go/go/CVE-2023-24531_2.patch              |  47 ++++
 3 files changed, 315 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2023-24531_1.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2023-24531_2.patch

diff --git a/meta/recipes-devtools/go/go-1.20.5.inc b/meta/recipes-devtools/go/go-1.20.5.inc
index 4e4e57d5cb..9cc79a8073 100644
--- a/meta/recipes-devtools/go/go-1.20.5.inc
+++ b/meta/recipes-devtools/go/go-1.20.5.inc
@@ -14,5 +14,7 @@ SRC_URI += "\
     file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://CVE-2023-24531_1.patch \
+    file://CVE-2023-24531_2.patch \
 "
 SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24531_1.patch b/meta/recipes-devtools/go/go/CVE-2023-24531_1.patch
new file mode 100644
index 0000000000..9de701b64b
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2023-24531_1.patch
@@ -0,0 +1,266 @@
+From c5463ec922a57d8b175c6639186ba9cbe15e6bc1 Mon Sep 17 00:00:00 2001
+From: Michael Matloob <matloob@golang.org>
+Date: Mon, 24 Apr 2023 16:57:28 -0400
+Subject: [PATCH 1/2] cmd/go: sanitize go env outputs
+
+go env, without any arguments, outputs the environment variables in
+the form of a script that can be run on the host OS. On Unix, single
+quote the strings and place single quotes themselves outside the
+single quoted strings. On windows use the set "var=val" syntax with
+the quote starting before the variable.
+
+Fixes #58508
+
+Change-Id: Iecd379a4af7285ea9b2024f0202250c74fd9a2bd
+Reviewed-on: https://go-review.googlesource.com/c/go/+/488375
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Michael Matloob <matloob@golang.org>
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Michael Matloob <matloob@golang.org>
+Reviewed-by: Bryan Mills <bcmills@google.com>
+Reviewed-by: Quim Muntal <quimmuntal@gmail.com>
+
+CVE: CVE-2023-24531
+Upstream-Status: Backport [f379e78951a405e7e99a60fb231eeedbf976c108]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/cmd/go/internal/envcmd/env.go           | 60 ++++++++++++-
+ src/cmd/go/internal/envcmd/env_test.go      | 94 +++++++++++++++++++++
+ src/cmd/go/testdata/script/env_sanitize.txt |  5 ++
+ src/cmd/go/testdata/script/work_env.txt     |  2 +-
+ 4 files changed, 158 insertions(+), 3 deletions(-)
+ create mode 100644 src/cmd/go/internal/envcmd/env_test.go
+ create mode 100644 src/cmd/go/testdata/script/env_sanitize.txt
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index fb7448a..5b52fad 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -6,6 +6,7 @@
+ package envcmd
+ 
+ import (
++	"bytes"
+ 	"context"
+ 	"encoding/json"
+ 	"fmt"
+@@ -17,6 +18,7 @@ import (
+ 	"runtime"
+ 	"sort"
+ 	"strings"
++	"unicode"
+ 	"unicode/utf8"
+ 
+ 	"cmd/go/internal/base"
+@@ -413,9 +415,12 @@ func checkBuildConfig(add map[string]string, del map[string]bool) error {
+ func PrintEnv(w io.Writer, env []cfg.EnvVar) {
+ 	for _, e := range env {
+ 		if e.Name != "TERM" {
++			if runtime.GOOS != "plan9" && bytes.Contains([]byte(e.Value), []byte{0}) {
++				base.Fatalf("go: internal error: encountered null byte in environment variable %s on non-plan9 platform", e.Name)
++			}
+ 			switch runtime.GOOS {
+ 			default:
+-				fmt.Fprintf(w, "%s=\"%s\"\n", e.Name, e.Value)
++				fmt.Fprintf(w, "%s=%s\n", e.Name, shellQuote(e.Value))
+ 			case "plan9":
+ 				if strings.IndexByte(e.Value, '\x00') < 0 {
+ 					fmt.Fprintf(w, "%s='%s'\n", e.Name, strings.ReplaceAll(e.Value, "'", "''"))
+@@ -426,17 +431,68 @@ func PrintEnv(w io.Writer, env []cfg.EnvVar) {
+ 						if x > 0 {
+ 							fmt.Fprintf(w, " ")
+ 						}
++						// TODO(#59979): Does this need to be quoted like above?
+ 						fmt.Fprintf(w, "%s", s)
+ 					}
+ 					fmt.Fprintf(w, ")\n")
+ 				}
+ 			case "windows":
+-				fmt.Fprintf(w, "set %s=%s\n", e.Name, e.Value)
++				if hasNonGraphic(e.Value) {
++					base.Errorf("go: stripping unprintable or unescapable characters from %%%q%%", e.Name)
++				}
++				fmt.Fprintf(w, "set %s=%s\n", e.Name, batchEscape(e.Value))
+ 			}
+ 		}
+ 	}
+ }
+ 
++func hasNonGraphic(s string) bool {
++	for _, c := range []byte(s) {
++		if c == '\r' || c == '\n' || (!unicode.IsGraphic(rune(c)) && !unicode.IsSpace(rune(c))) {
++			return true
++		}
++	}
++	return false
++}
++
++func shellQuote(s string) string {
++	var b bytes.Buffer
++	b.WriteByte('\'')
++	for _, x := range []byte(s) {
++		if x == '\'' {
++			// Close the single quoted string, add an escaped single quote,
++			// and start another single quoted string.
++			b.WriteString(`'\''`)
++		} else {
++			b.WriteByte(x)
++		}
++	}
++	b.WriteByte('\'')
++	return b.String()
++}
++
++func batchEscape(s string) string {
++	var b bytes.Buffer
++	for _, x := range []byte(s) {
++		if x == '\r' || x == '\n' || (!unicode.IsGraphic(rune(x)) && !unicode.IsSpace(rune(x))) {
++			b.WriteRune(unicode.ReplacementChar)
++			continue
++		}
++		switch x {
++		case '%':
++			b.WriteString("%%")
++		case '<', '>', '|', '&', '^':
++			// These are special characters that need to be escaped with ^. See
++			// https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/set_1.
++			b.WriteByte('^')
++			b.WriteByte(x)
++		default:
++			b.WriteByte(x)
++		}
++	}
++	return b.String()
++}
++
+ func printEnvAsJSON(env []cfg.EnvVar) {
+ 	m := make(map[string]string)
+ 	for _, e := range env {
+diff --git a/src/cmd/go/internal/envcmd/env_test.go b/src/cmd/go/internal/envcmd/env_test.go
+new file mode 100644
+index 0000000..32d99fd
+--- /dev/null
++++ b/src/cmd/go/internal/envcmd/env_test.go
+@@ -0,0 +1,94 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++//go:build unix || windows
++
++package envcmd
++
++import (
++	"bytes"
++	"cmd/go/internal/cfg"
++	"fmt"
++	"internal/testenv"
++	"os"
++	"os/exec"
++	"path/filepath"
++	"runtime"
++	"testing"
++	"unicode"
++)
++
++func FuzzPrintEnvEscape(f *testing.F) {
++	f.Add(`$(echo 'cc"'; echo 'OOPS="oops')`)
++	f.Add("$(echo shell expansion 1>&2)")
++	f.Add("''")
++	f.Add(`C:\"Program Files"\`)
++	f.Add(`\\"Quoted Host"\\share`)
++	f.Add("\xfb")
++	f.Add("0")
++	f.Add("")
++	f.Add("''''''''")
++	f.Add("\r")
++	f.Add("\n")
++	f.Add("E,%")
++	f.Fuzz(func(t *testing.T, s string) {
++		t.Parallel()
++
++		for _, c := range []byte(s) {
++			if c == 0 {
++				t.Skipf("skipping %q: contains a null byte. Null bytes can't occur in the environment"+
++					" outside of Plan 9, which has different code path than Windows and Unix that this test"+
++					" isn't testing.", s)
++			}
++			if c > unicode.MaxASCII {
++				t.Skipf("skipping %#q: contains a non-ASCII character %q", s, c)
++			}
++			if !unicode.IsGraphic(rune(c)) && !unicode.IsSpace(rune(c)) {
++				t.Skipf("skipping %#q: contains non-graphic character %q", s, c)
++			}
++			if runtime.GOOS == "windows" && c == '\r' || c == '\n' {
++				t.Skipf("skipping %#q on Windows: contains unescapable character %q", s, c)
++			}
++		}
++
++		var b bytes.Buffer
++		if runtime.GOOS == "windows" {
++			b.WriteString("@echo off\n")
++		}
++		PrintEnv(&b, []cfg.EnvVar{{Name: "var", Value: s}})
++		var want string
++		if runtime.GOOS == "windows" {
++			fmt.Fprintf(&b, "echo \"%%var%%\"\n")
++			want += "\"" + s + "\"\r\n"
++		} else {
++			fmt.Fprintf(&b, "printf '%%s\\n' \"$var\"\n")
++			want += s + "\n"
++		}
++		scriptfilename := "script.sh"
++		if runtime.GOOS == "windows" {
++			scriptfilename = "script.bat"
++		}
++		scriptfile := filepath.Join(t.TempDir(), scriptfilename)
++		if err := os.WriteFile(scriptfile, b.Bytes(), 0777); err != nil {
++			t.Fatal(err)
++		}
++		t.Log(b.String())
++		var cmd *exec.Cmd
++		if runtime.GOOS == "windows" {
++			cmd = testenv.Command(t, "cmd.exe", "/C", scriptfile)
++		} else {
++			cmd = testenv.Command(t, "sh", "-c", scriptfile)
++		}
++		out, err := cmd.Output()
++		t.Log(string(out))
++		if err != nil {
++			t.Fatal(err)
++		}
++
++		if string(out) != want {
++			t.Fatalf("output of running PrintEnv script and echoing variable: got: %q, want: %q",
++				string(out), want)
++		}
++	})
++}
+diff --git a/src/cmd/go/testdata/script/env_sanitize.txt b/src/cmd/go/testdata/script/env_sanitize.txt
+new file mode 100644
+index 0000000..cc4d23a
+--- /dev/null
++++ b/src/cmd/go/testdata/script/env_sanitize.txt
+@@ -0,0 +1,5 @@
++env GOFLAGS='$(echo ''cc"''; echo ''OOPS="oops'')'
++go env
++[GOOS:darwin] stdout 'GOFLAGS=''\$\(echo ''\\''''cc"''\\''''; echo ''\\''''OOPS="oops''\\''''\)'''
++[GOOS:linux] stdout 'GOFLAGS=''\$\(echo ''\\''''cc"''\\''''; echo ''\\''''OOPS="oops''\\''''\)'''
++[GOOS:windows] stdout 'set GOFLAGS=\$\(echo ''cc"''; echo ''OOPS="oops''\)'
+diff --git a/src/cmd/go/testdata/script/work_env.txt b/src/cmd/go/testdata/script/work_env.txt
+index 511bb4e..8b1779e 100644
+--- a/src/cmd/go/testdata/script/work_env.txt
++++ b/src/cmd/go/testdata/script/work_env.txt
+@@ -1,7 +1,7 @@
+ go env GOWORK
+ stdout '^'$GOPATH'[\\/]src[\\/]go.work$'
+ go env
+-stdout '^(set )?GOWORK="?'$GOPATH'[\\/]src[\\/]go.work"?$'
++stdout '^(set )?GOWORK=''?'$GOPATH'[\\/]src[\\/]go.work''?$'
+ 
+ cd ..
+ go env GOWORK
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/go/go/CVE-2023-24531_2.patch b/meta/recipes-devtools/go/go/CVE-2023-24531_2.patch
new file mode 100644
index 0000000000..dec36f9d42
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2023-24531_2.patch
@@ -0,0 +1,47 @@
+From 24f1def536c5344e0067a3119790b83ee6224058 Mon Sep 17 00:00:00 2001
+From: miller <millerresearch@gmail.com>
+Date: Mon, 8 May 2023 16:56:21 +0100
+Subject: [PATCH 2/2] cmd/go: quote entries in list-valued variables for go env
+ in plan9
+
+When 'go env' without an argument prints environment variables as
+a script which can be executed by the shell, variables with a
+list value in Plan 9 (such as GOPATH) need to be printed with each
+element enclosed in single quotes in case it contains characters
+significant to the Plan 9 shell (such as ' ' or '=').
+
+For #58508
+
+Change-Id: Ia30f51307cc6d07a7e3ada6bf9d60bf9951982ff
+Reviewed-on: https://go-review.googlesource.com/c/go/+/493535
+Run-TryBot: Cherry Mui <cherryyz@google.com>
+Reviewed-by: Cherry Mui <cherryyz@google.com>
+Reviewed-by: Russ Cox <rsc@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Auto-Submit: Dmitri Shuralyov <dmitshur@golang.org>
+
+CVE: CVE-2023-24531
+Upstream-Status: Backport [05cc9e55876874462a4726ca0101c970838c80e5]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/cmd/go/internal/envcmd/env.go | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 5b52fad..d4fc399 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -431,8 +431,7 @@ func PrintEnv(w io.Writer, env []cfg.EnvVar) {
+ 						if x > 0 {
+ 							fmt.Fprintf(w, " ")
+ 						}
+-						// TODO(#59979): Does this need to be quoted like above?
+-						fmt.Fprintf(w, "%s", s)
++						fmt.Fprintf(w, "'%s'", strings.ReplaceAll(s, "'", "''"))
+ 					}
+ 					fmt.Fprintf(w, ")\n")
+ 				}
+-- 
+2.39.0
+
-- 
2.34.1


