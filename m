Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687DAEB64DC
	for <webhook@archiver.kernel.org>; Fri, 21 Jul 2023 17:13:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12725.1689959596002000049
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jul 2023 10:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JaopitTT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6566062bc0=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36LDpTvK008239
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 10:13:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=szx8W
	ln6+eq+1yfBF+4eAmGMHrOcQnryXooh85ffRR0=; b=JaopitTTJdiSbvHbPJl9Q
	jfeDYA0SAVqi3rxxHMpu7h8ZtJggWya6eOKf7YouzYwZv/en75NBg796yH5ZUe/U
	PBpoB4WAjPRXko3U7oGEgyBhiwSUUy7E1soOqxGU2A8TI2HPV7Lhd32XD5zjX7cr
	XPiEgip5fNJcmh+CG0M3ovSmax5yhJbXN+GSi2JenkQW/F1tP+1t7TJjJ6FA/HsA
	Hmki+kWlCwFI+iiUWeZbO46OY1wa777sKQk2em+37iPGVwBa5HbZysiXwzFzjaZ7
	UIw77bFDdTJVrgDhJ7mSziPaXNgf1+fxL0WBHIHwreGozTWToTegswqpsjE3hHZ2
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rupqydxmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 10:13:15 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 21 Jul 2023 10:13:14 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 21 Jul 2023 10:13:14 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] go: fix CVE-2023-24531
Date: Fri, 21 Jul 2023 10:13:08 -0700
Message-ID: <20230721171308.3720374-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: X8zFD-xFyy8qdeMkPM81JX_C8Hxecgzu
X-Proofpoint-ORIG-GUID: X8zFD-xFyy8qdeMkPM81JX_C8Hxecgzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-21_10,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1011 mlxscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307210150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jul 2023 17:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184707

Backport required commits to fix CVE-2023-24531.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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
2.39.0


