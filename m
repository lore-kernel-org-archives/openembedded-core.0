Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE51C001DB
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:33:44 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3939.1688092419080484051
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:33:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=KWr3iQ/n;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6686708c986so1248478b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092418; x=1690684418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PotZZ/DcUdwkLGnG/RNEAB9Ju6K/HojbBQizUwLtUsE=;
        b=KWr3iQ/n6zYhn10yd94EBPWOytIJmAc+Er4jFPL+r1FLnEFWyqfEAfFjs0xP1EANfc
         jjZJ5X/UEAH9H2IK8s8CU8ocjNZX8W3rknSGvEkJ8iaje+/CmEXzOqgEXpgarfAlfAQK
         B31h8FuUvn+nMlhEYpgIgd4+HfITstR/clxHDvaRQ98mXdJjEDJo+MkE8cOKID5BjjDQ
         Cx/JvfTR4W60Skj7sUXfL+igwlqEtC/gRnFAbcVgbyPkjBOZWYTXWH0vhvG2S5NJwRjf
         2foz878ChFxDtvdCDCgmamb1kRiFcCQtMmUjj5e3BE4ax3qAmr7+2ZYk8Qv6WlEZLCYr
         98VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092418; x=1690684418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PotZZ/DcUdwkLGnG/RNEAB9Ju6K/HojbBQizUwLtUsE=;
        b=TY50G2MYUcW9SNlj9yQmFMXTi/rqEsvnnDsvKAFAYM5Gu6G42ksqTczWjk8t1QZnG3
         SJ0FFt7BTI0fes5gz+MTsSs5fh1B2IqjygadW4k1m/XUlB3MbWMMIRnwsVfEShTVeDia
         Z3+h0IFsVCp+OMyfUSxsyi/EPz9E6y7UnuP22eVDav4uQ7r4CHELfDFttAI5DvZeRcy8
         whaAKkaNR8gRKL/neF0suzL7P8Z4dmllvp4gnnVhAN8VYv5F9/wCQoTCuR1J0h3mIY4X
         hsoYyblNuAqbDINBv13WxnkQjj3DsYQzJ/S7iJ1IjzeU5QrPw1c91L6EbtBcNyn8Bihb
         6K5g==
X-Gm-Message-State: AC+VfDyoDd8EXgMJcwaKm+WChydtNFlfrMrwh52An7wlF3U9GmKJY2/1
	FzyorRfCLpLATaOHK0DM1JkZpgHrIOKWwIBDj8EEhg==
X-Google-Smtp-Source: ACHHUZ68UnwrWjS95gDCN3TmZWJ2a2d9FJ8Xzbv//hY1eSrI8QdRKXIIsAOk8JkSyjjXpjy57nRS5w==
X-Received: by 2002:a05:6a20:a10c:b0:11d:9307:8acb with SMTP id q12-20020a056a20a10c00b0011d93078acbmr1178886pzk.45.1688092417950;
        Thu, 29 Jun 2023 19:33:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id l22-20020a62be16000000b006815fbe3245sm3028607pff.37.2023.06.29.19.33.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:33:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/10] go: fix CVE-2023-29402 & CVE-2023-29404
Date: Thu, 29 Jun 2023 16:33:17 -1000
Message-Id: <a4a989605d8cab3278d6c6e32eb882815ff36a28.1688092252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092252.git.steve@sakoman.com>
References: <cover.1688092252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183675

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:
* CVE-2023-29402 - Upstream-Status: Backport from https://github.com/golang/go/commit/c160b49b6d328c86bd76ca2fff9009a71347333f
* CVE-2023-29404 - Upstream-Status: Backport from https://github.com/golang/go/commit/bf3c8ce03e175e870763901a3850bca01381a828

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2023-29402.patch           | 201 ++++++++++++++++++
 .../go/go-1.14/CVE-2023-29404.patch           |  84 ++++++++
 3 files changed, 287 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29402.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29404.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index ed505c01b3..ea7b9ea80f 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -65,6 +65,8 @@ SRC_URI += "\
     file://CVE-2023-24540.patch \
     file://CVE-2023-29405-1.patch \
     file://CVE-2023-29405-2.patch \
+    file://CVE-2023-29402.patch \
+    file://CVE-2023-29404.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29402.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29402.patch
new file mode 100644
index 0000000000..01eed9fe1b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29402.patch
@@ -0,0 +1,201 @@
+rom c160b49b6d328c86bd76ca2fff9009a71347333f Mon Sep 17 00:00:00 2001
+From: "Bryan C. Mills" <bcmills@google.com>
+Date: Fri, 12 May 2023 14:15:16 -0400
+Subject: [PATCH] [release-branch.go1.19] cmd/go: disallow package directories
+ containing newlines
+
+Directory or file paths containing newlines may cause tools (such as
+cmd/cgo) that emit "//line" or "#line" -directives to write part of
+the path into non-comment lines in generated source code. If those
+lines contain valid Go code, it may be injected into the resulting
+binary.
+
+(Note that Go import paths and file paths within module zip files
+already could not contain newlines.)
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Updates #60167.
+Fixes #60515.
+Fixes CVE-2023-29402.
+
+Change-Id: If55d0400c02beb7a5da5eceac60f1abeac99f064
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1882606
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Russ Cox <rsc@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 41f9046495564fc728d6f98384ab7276450ac7e2)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1902229
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1904343
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Bryan Mills <bcmills@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501218
+Run-TryBot: David Chase <drchase@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c160b49b6d328c86bd76ca2fff9009a71347333f]
+CVE: CVE-2023-29402
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/go/internal/load/pkg.go               |   4 +
+ src/cmd/go/internal/work/exec.go              |   6 ++
+ src/cmd/go/script_test.go                     |   1 +
+ .../go/testdata/script/build_cwd_newline.txt  | 100 ++++++++++++++++++
+ 4 files changed, 111 insertions(+)
+ create mode 100644 src/cmd/go/testdata/script/build_cwd_newline.txt
+
+diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
+index 369a79b..d2b63b0 100644
+--- a/src/cmd/go/internal/load/pkg.go
++++ b/src/cmd/go/internal/load/pkg.go
+@@ -1697,6 +1697,10 @@ func (p *Package) load(stk *ImportStack, bp *build.Package, err error) {
+ 		setError(ImportErrorf(p.ImportPath, "invalid import path %q", p.ImportPath))
+ 		return
+ 	}
++	if strings.ContainsAny(p.Dir, "\r\n") {
++		setError(fmt.Errorf("invalid package directory %q", p.Dir))
++		return
++	}
+ 
+ 	// Build list of imported packages and full dependency list.
+ 	imports := make([]*Package, 0, len(p.Imports))
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 9a9650b..050b785 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -458,6 +458,12 @@ func (b *Builder) build(a *Action) (err error) {
+ 		b.Print(a.Package.ImportPath + "\n")
+ 	}
+ 
++	if p.Error != nil {
++		// Don't try to build anything for packages with errors. There may be a
++		// problem with the inputs that makes the package unsafe to build.
++		return p.Error
++	}
++
+ 	if a.Package.BinaryOnly {
+ 		p.Stale = true
+ 		p.StaleReason = "binary-only packages are no longer supported"
+diff --git a/src/cmd/go/script_test.go b/src/cmd/go/script_test.go
+index ec498bb..a1398ad 100644
+--- a/src/cmd/go/script_test.go
++++ b/src/cmd/go/script_test.go
+@@ -123,6 +123,7 @@ func (ts *testScript) setup() {
+ 		"devnull=" + os.DevNull,
+ 		"goversion=" + goVersion(ts),
+ 		":=" + string(os.PathListSeparator),
++                "newline=\n",
+ 	}
+ 
+ 	if runtime.GOOS == "plan9" {
+diff --git a/src/cmd/go/testdata/script/build_cwd_newline.txt b/src/cmd/go/testdata/script/build_cwd_newline.txt
+new file mode 100644
+index 0000000..61c6966
+--- /dev/null
++++ b/src/cmd/go/testdata/script/build_cwd_newline.txt
+@@ -0,0 +1,100 @@
++[windows] skip 'filesystem normalizes / to \'
++[plan9] skip 'filesystem disallows \n in paths'
++
++# If the directory path containing a package to be built includes a newline,
++# the go command should refuse to even try to build the package.
++
++env DIR=$WORK${/}${newline}'package main'${newline}'func main() { panic("uh-oh")'${newline}'/*'
++
++mkdir $DIR
++cd $DIR
++exec pwd
++cp $WORK/go.mod ./go.mod
++cp $WORK/main.go ./main.go
++cp $WORK/main_test.go ./main_test.go
++
++! go build -o $devnull .
++stderr 'package example: invalid package directory .*uh-oh'
++
++! go build -o $devnull main.go
++stderr 'package command-line-arguments: invalid package directory .*uh-oh'
++
++! go run .
++stderr 'package example: invalid package directory .*uh-oh'
++
++! go run main.go
++stderr 'package command-line-arguments: invalid package directory .*uh-oh'
++
++! go test .
++stderr 'package example: invalid package directory .*uh-oh'
++
++! go test -v main.go main_test.go
++stderr 'package command-line-arguments: invalid package directory .*uh-oh'
++
++
++# Since we do preserve $PWD (or set it appropriately) for commands, and we do
++# not resolve symlinks unnecessarily, referring to the contents of the unsafe
++# directory via a safe symlink should be ok, and should not inject the data from
++# the symlink target path.
++
++[!symlink] stop 'remainder of test checks symlink behavior'
++[short] stop 'links and runs binaries'
++
++symlink $WORK${/}link -> $DIR
++
++go run $WORK${/}link${/}main.go
++! stdout panic
++! stderr panic
++stderr '^ok$'
++
++go test -v $WORK${/}link${/}main.go $WORK${/}link${/}main_test.go
++! stdout panic
++! stderr panic
++stdout '^ok$'   # 'go test' combines the test's stdout into stderr
++
++cd $WORK/link
++
++! go run $DIR${/}main.go
++stderr 'package command-line-arguments: invalid package directory .*uh-oh'
++
++go run .
++! stdout panic
++! stderr panic
++stderr '^ok$'
++
++go run main.go
++! stdout panic
++! stderr panic
++stderr '^ok$'
++
++go test -v
++! stdout panic
++! stderr panic
++stdout '^ok$'  # 'go test' combines the test's stdout into stderr
++
++go test -v .
++! stdout panic
++! stderr panic
++stdout '^ok$'  # 'go test' combines the test's stdout into stderr
++
++
++-- $WORK/go.mod --
++module example
++go 1.19
++-- $WORK/main.go --
++package main
++
++import "C"
++
++func main() {
++	/* nothing here */
++	println("ok")
++}
++-- $WORK/main_test.go --
++package main
++
++import "testing"
++
++func TestMain(*testing.M) {
++	main()
++}
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29404.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29404.patch
new file mode 100644
index 0000000000..61336ee9ee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29404.patch
@@ -0,0 +1,84 @@
+From bf3c8ce03e175e870763901a3850bca01381a828 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Fri, 5 May 2023 13:10:34 -0700
+Subject: [PATCH] [release-branch.go1.19] cmd/go: enforce flags with
+ non-optional arguments
+
+Enforce that linker flags which expect arguments get them, otherwise it
+may be possible to smuggle unexpected flags through as the linker can
+consume what looks like a flag as an argument to a preceding flag (i.e.
+"-Wl,-O -Wl,-R,-bad-flag" is interpreted as "-O=-R -bad-flag"). Also be
+somewhat more restrictive in the general format of some flags.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Updates #60305
+Fixes #60511
+Fixes CVE-2023-29404
+
+Change-Id: Icdffef2c0f644da50261cace6f43742783931cff
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1876275
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit 896779503cf754cbdac24b61d4cc953b50fe2dde)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1902225
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1904342
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501217
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+Run-TryBot: David Chase <drchase@google.com>
+TryBot-Bypass: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/bf3c8ce03e175e870763901a3850bca01381a828]
+CVE: CVE-2023-29404
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/go/internal/work/security.go      | 6 +++---
+ src/cmd/go/internal/work/security_test.go | 5 +++++
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/go/internal/work/security.go b/src/cmd/go/internal/work/security.go
+index a823b20..8acb6dc 100644
+--- a/src/cmd/go/internal/work/security.go
++++ b/src/cmd/go/internal/work/security.go
+@@ -177,17 +177,17 @@ var validLinkerFlags = []*lazyregexp.Regexp{
+ 	re(`-Wl,-Bdynamic`),
+ 	re(`-Wl,-berok`),
+ 	re(`-Wl,-Bstatic`),
+-	re(`-WL,-O([^@,\-][^,]*)?`),
++	re(`-Wl,-O[0-9]+`),
+ 	re(`-Wl,-d[ny]`),
+ 	re(`-Wl,--disable-new-dtags`),
+-	re(`-Wl,-e[=,][a-zA-Z0-9]*`),
++	re(`-Wl,-e[=,][a-zA-Z0-9]+`),
+ 	re(`-Wl,--enable-new-dtags`),
+ 	re(`-Wl,--end-group`),
+ 	re(`-Wl,--(no-)?export-dynamic`),
+ 	re(`-Wl,-framework,[^,@\-][^,]+`),
+ 	re(`-Wl,-headerpad_max_install_names`),
+ 	re(`-Wl,--no-undefined`),
+-	re(`-Wl,-R([^@\-][^,@]*$)`),
++	re(`-Wl,-R,?([^@\-,][^,@]*$)`),
+ 	re(`-Wl,--just-symbols[=,]([^,@\-][^,@]+)`),
+ 	re(`-Wl,-rpath(-link)?[=,]([^,@\-][^,]+)`),
+ 	re(`-Wl,-s`),
+diff --git a/src/cmd/go/internal/work/security_test.go b/src/cmd/go/internal/work/security_test.go
+index bd707ff..7b0b7d3 100644
+--- a/src/cmd/go/internal/work/security_test.go
++++ b/src/cmd/go/internal/work/security_test.go
+@@ -220,6 +220,11 @@ var badLinkerFlags = [][]string{
+ 	{"-Wl,-R,@foo"},
+ 	{"-Wl,--just-symbols,@foo"},
+ 	{"../x.o"},
++	{"-Wl,-R,"},
++	{"-Wl,-O"},
++	{"-Wl,-e="},
++	{"-Wl,-e,"},
++	{"-Wl,-R,-flag"},
+ }
+ 
+ func TestCheckLinkerFlags(t *testing.T) {
+-- 
+2.25.1
+
-- 
2.34.1


