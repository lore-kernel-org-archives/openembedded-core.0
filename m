Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8102FEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 14:04:38 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.15494.1691071476068626198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 07:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3GbNQ0gr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686f0d66652so873591b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 07:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691071475; x=1691676275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOLOzknA2k+OWpscwG/tulLhQT1HHXWIswFt2KeUk7U=;
        b=3GbNQ0grhqCmHjedOj6jV5qcnnCxlilLi0sF6EvDHxkwdCjJQrTulq6vwrJNKRPeUt
         w/I/XM0nfBWN+oABX65c0FDeJ1p9PhbjNeRbV8bKwfW8KYWyaObXYx/qr3e2oDTvB8Sr
         zHAM/HvCMvIKyR1ZsvwOWtPotP4Lki1H1g3JvdMf1Dzt9ES6CUgdGJZcESOrtiFxnV7W
         yA51xLbqbMUS3QPZ1CJyCDnSgGOmjMIpvyrwUq1WZVXwWuzqOreANZ+Z3nUHQ/XVz4z9
         Mg3EPwHHj0DKe3V4xlsAa2/6zXfCRLC9tvDdM7laB7QMAi4ojw39T89IChhA7bgUDLoh
         7d1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691071475; x=1691676275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOLOzknA2k+OWpscwG/tulLhQT1HHXWIswFt2KeUk7U=;
        b=kKIxi/HBtksj0G4skcESWbiPIueIz95Q+z/PrICqOpa43QnF787i7Mn1V+NIPzmLy1
         jseCTDr1BM6HHGSM4Qqb91og+yzUCLwQP6Or0pWnBOGCnBNkpUcwBJY5M09gbBK7UWhU
         F0tCIjUZ1FgeDuNJ0SvSU2dII+LekdK/KtOtsmy/M2Uv9y/zpG7/AuIwP6/GB2vKHRFb
         KrfnyLGT3Y9iBFfFLjoLCVB8GC+tosgkrtkjWn6Plxn6BZNlNC0UaF2UmZtZupeX4zKs
         i4i8CeBczRpOwD0BntNNx/fmRbfJ1hpwMrwwy786XoEAQSjTeBU/u8nML9s1tV8rnDDF
         MjOw==
X-Gm-Message-State: ABy/qLY25dTpJf71d3vB8lOM5KFezr2pis3PEfUHbknqrR4oXozW7tvq
	EJVXKlPHGem2fEuvxtXkb6ZWo2KApAxxNcT0EUk=
X-Google-Smtp-Source: APBJJlHn3F+dQ4Mk2EnfkYH7jynG15Bbsp8D2pqOfGUGULtHZXhyWz3eY/r/hQtgeyLgrI2EWFgOkA==
X-Received: by 2002:a05:6a20:dd9c:b0:12f:9e13:12b1 with SMTP id kw28-20020a056a20dd9c00b0012f9e1312b1mr18079005pzb.15.1691071474938;
        Thu, 03 Aug 2023 07:04:34 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78d08000000b006828e49c04csm12866242pfe.75.2023.08.03.07.04.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 07:04:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] go: fix CVE-2023-24531
Date: Thu,  3 Aug 2023 04:04:11 -1000
Message-Id: <6d892c52bd5806507a05e8b6f749c54bbd9e9da6.1691071255.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691071255.git.steve@sakoman.com>
References: <cover.1691071255.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 14:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185486

From: Sakib Sajal <sakib.sajal@windriver.com>

Backport required patches from go1.21 to fix CVE-2023-24531.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   4 +-
 .../go/go-1.21/CVE-2023-24531_1.patch         | 252 ++++++++++++++++++
 .../go/go-1.21/CVE-2023-24531_2.patch         |  47 ++++
 3 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-24531_1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2023-24531_2.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 53e09a545c..e0f02f3e28 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -1,6 +1,6 @@
 require go-common.inc
 
-FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
+FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.19:${FILE_DIRNAME}/go-1.18:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
@@ -40,6 +40,8 @@ SRC_URI += "\
     file://CVE-2023-24536_1.patch \
     file://CVE-2023-24536_2.patch \
     file://CVE-2023-24536_3.patch \
+    file://CVE-2023-24531_1.patch \
+    file://CVE-2023-24531_2.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-24531_1.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-24531_1.patch
new file mode 100644
index 0000000000..5f6d7e16a8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-24531_1.patch
@@ -0,0 +1,252 @@
+From 0f717b5f7d32bb660c01ec0366bd53c9b4c5ab5d Mon Sep 17 00:00:00 2001
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
+ 3 files changed, 157 insertions(+), 2 deletions(-)
+ create mode 100644 src/cmd/go/internal/envcmd/env_test.go
+ create mode 100644 src/cmd/go/testdata/script/env_sanitize.txt
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 43b94e7..0ce8843 100644
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
+@@ -379,9 +381,12 @@ func checkBuildConfig(add map[string]string, del map[string]bool) error {
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
+@@ -392,17 +397,68 @@ func PrintEnv(w io.Writer, env []cfg.EnvVar) {
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
+-- 
+2.35.5
+
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2023-24531_2.patch b/meta/recipes-devtools/go/go-1.21/CVE-2023-24531_2.patch
new file mode 100644
index 0000000000..eecc04c2e3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2023-24531_2.patch
@@ -0,0 +1,47 @@
+From b2624f973692ca093348395c2418d1c422f2a162 Mon Sep 17 00:00:00 2001
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
+index 0ce8843..b48d0bd 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -397,8 +397,7 @@ func PrintEnv(w io.Writer, env []cfg.EnvVar) {
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
+2.35.5
+
-- 
2.34.1


