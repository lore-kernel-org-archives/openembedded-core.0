Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3CCEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 04:51:03 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.1861.1688014256545028225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 21:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=AKMnxCLn;
 spf=pass (domain: mvista.com, ip: 209.85.167.171, mailfrom: hprajapati@mvista.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a1e6022b93so205624b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 21:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1688014255; x=1690606255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yzyWUL1GoJuZLFQnQoVDG0JzPOdUyG8DzLIuXZKKQRs=;
        b=AKMnxCLnOs57YxWgAx9ZZn/WpqkjHPJCbpis4RmfbN/Frh7a1nXNZ+izjGf8zmz9Di
         cB8RVtWhuIii4k1ToAdn9fR1IDOYxNEYkisYX/xX3lHZ0OETXqkBSbHkAhHWhv+NKErM
         SYzOOr9OULUDKsp+vzP/Vtp3LTsw0vTgBKytI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688014255; x=1690606255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzyWUL1GoJuZLFQnQoVDG0JzPOdUyG8DzLIuXZKKQRs=;
        b=OtcWnf3zNlxraC6bn72EPqDVs1/Ik5YYKg7xvrAKyR4Zk9VAdR0o3wtP7HBMXVc6+N
         LsNq1bEJ6EposMIEhjtz60/O5/ni5FOZt8vnLDNgExMX0MbGBAXp0IaCjKCtdrQHSqim
         T349vICyCt/0CCmBBtJv8+jKRox/8gdat5ikFVK8Wd/h6NXEMNn+2kv+1Xk7HeHsSCY3
         dxf3KLCwHsFkW53rX3P/06SQfCj7f7uC2iq0AhHMTdakQbifmfvSWbKFmog+Fj0Mwakn
         F/KkL8R6rMch9qAKW+dyYSce/aOskcSVn4s8B0eWp3MYUg69cLNj6RQdG8HGiWU3RrMP
         ebgQ==
X-Gm-Message-State: AC+VfDzM/lrBeiAZhGYqPrhvfI4pNjZw5g853BPNxCtwcsxDkZYTeZ9P
	O5hElHAt+uZS/tanVvdWOHuAF7feF2DTOOOGzsLBYA==
X-Google-Smtp-Source: ACHHUZ6JT+7Xyon39PuM3N6ZtceVuChPCgqYwYNEhLOrg+il31WpC/ppRUuqxpd+Rf2UGF40HkQlTQ==
X-Received: by 2002:a05:6808:10c2:b0:3a1:c1f6:8f9c with SMTP id s2-20020a05680810c200b003a1c1f68f9cmr19132476ois.12.1688014255467;
        Wed, 28 Jun 2023 21:50:55 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.161])
        by smtp.gmail.com with ESMTPSA id l18-20020a62be12000000b0065c8c5b3a7dsm8018944pff.13.2023.06.28.21.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 21:50:55 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 29 Jun 2023 10:20:49 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] go: fix CVE-2023-29402 & CVE-2023-29404
Date: Thu, 29 Jun 2023 10:20:48 +0530
Message-Id: <20230629045048.49309-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 04:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183608

Backport fixes for:
* CVE-2023-29402 - Upstream-Status: Backport from https://github.com/golang/go/commit/c160b49b6d328c86bd76ca2fff9009a71347333f
* CVE-2023-29404 - Upstream-Status: Backport from https://github.com/golang/go/commit/bf3c8ce03e175e870763901a3850bca01381a828

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


