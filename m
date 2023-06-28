Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5853EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.17361.1687961590567744761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xtpChx3q;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b7fb02edfaso32156595ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961590; x=1690553590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MH2evfLCwvavEsXiq3R8MJDBj6V+g3LE8Iu66LJyPs=;
        b=xtpChx3qDst0Y7+t43ePHcmjClGxoIVx9wY7HHtVTEdya/Sp4W8D9yHKMdEuwULgJ+
         GbJz6VFt7x/uk2vSq+Rjbj99wgcJ5LeD6aog6Qif8swjCbDReQ0V8JGdWLuG5q/gGI9f
         BxVImmaZ5G2QrTx6Ny3C9YjNEjHYGQraVVM06a8FJrNaFockqkkHDjwkh32WK0zeweH1
         OfC3njR4OLUOkHhvPTYjDwKt2I00Sh/5ymlQ1MwSV5OFeUzd4I83VktqQmieSYDQhS0x
         QxXPLQeS9vailMZIXOaTQBCGVWT6jbkkIlXqpj68vfge+rMbYC3khn0IgEHl8ob3Eb1p
         IfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961590; x=1690553590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MH2evfLCwvavEsXiq3R8MJDBj6V+g3LE8Iu66LJyPs=;
        b=ChJu0OQVpwX2LZgp63WyQnsY8YdXpalBlSiws3BK28pdZSpZMuC4T8a73NJ7FQ9xB8
         wOpKk84601zyyq0R0RY+u3NkYdqgEMMm6A2/Y3LP/TJ+coktWDjqheACnU7hSuWTRiJX
         CfRRQlGkqzo5OwXnLh0DEe7l+wNFrg/RFAUZzYhsf6W7yUOieXL9Fisd4XfvGWTb3ZX/
         jYeh/aNjOx4zFGr5gEUXBkzIC3vi+Lkcfe/Nh+m9XhavRCC8lwVmRJ63Mey6cXt6QHgQ
         uWskEtfQXMRF3j5zhwY2hbWa0PIpeq+OuCVNLY9I1p6OSP3PSdxfAagjjGBMFJ2jhirC
         X0Sg==
X-Gm-Message-State: AC+VfDxRsK4ywpC3XlZOfekw+M5K1xxwB1tgmypa8wS7IudF25224O4q
	lq+ocxSpYdrLaq2ZpQ2kUzTxIraXcGvoXTuvXCA+tw==
X-Google-Smtp-Source: ACHHUZ7B3XOg6NU5w+oL0j/mjBXBCEl3w9O9Bo+CRzcRSFixrQRGoG7NquSArcsyhNgUvuXRPc55PQ==
X-Received: by 2002:a17:902:ead5:b0:1b8:2a96:6471 with SMTP id p21-20020a170902ead500b001b82a966471mr4080134pld.46.1687961589383;
        Wed, 28 Jun 2023 07:13:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/29] go: fix CVE-2023-29402
Date: Wed, 28 Jun 2023 04:12:30 -1000
Message-Id: <aeb0829e52c60a77a2135af8332435b6e2db5b3d.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183560

From: Archana Polampalli <archana.polampalli@windriver.com>

The go command may generate unexpected code at build time when using cgo.
This may result in unexpected behavior when running a go program which uses cgo.
This may occur when running an untrusted module which contains directories
with newline characters in their names. Modules which are retrieved using the go
command, i.e. via "go get", are not affected (modules retrieved using GOPATH-mode,
i.e. GO111MODULE=off, may be affected).

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29402

Upstream patches:
https://github.com/golang/go/commit/4dae3bbe0e6a5700037bb996ae84d6f457c4f58a

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.19/CVE-2023-29402.patch           | 194 ++++++++++++++++++
 2 files changed, 195 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29402.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 9af9eb2752..3365075fe5 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -34,6 +34,7 @@ SRC_URI += "\
     file://CVE-2023-24539.patch \
     file://CVE-2023-29404.patch \
     file://CVE-2023-29405.patch \
+    file://CVE-2023-29402.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29402.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-29402.patch
new file mode 100644
index 0000000000..bf1fbbe0d6
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29402.patch
@@ -0,0 +1,194 @@
+From  4dae3bbe0e6a5700037bb996ae84d6f457c4f58a Mon Sep 17 00:00:00 2001
+From: Bryan C. Mills <bcmills@google.com>
+Date: Fri, 12 May 2023 14:15:16 -0400
+Subject: [PATCH] cmd/go: disallow package directories containing newlines
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
+Fixes #60167.
+Fixes CVE-2023-29402.
+
+Change-Id: I64572e9f454bce7b685d00e2e6a1c96cd33d53df
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1882606
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Russ Cox <rsc@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501226
+Run-TryBot: David Chase <drchase@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/4dae3bbe0e6a5700037bb996ae84d6f457c4f58a]
+CVE: CVE-2023-29402
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/cmd/go/internal/load/pkg.go               |   4 +
+ src/cmd/go/internal/work/exec.go              |   6 ++
+ src/cmd/go/script_test.go                     |   1 +
+ .../go/testdata/script/build_cwd_newline.txt  | 100 ++++++++++++++++++
+ 4 files changed, 111 insertions(+)
+ create mode 100644 src/cmd/go/testdata/script/build_cwd_newline.txt
+
+diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
+index a83cc9a..d4da86d 100644
+--- a/src/cmd/go/internal/load/pkg.go
++++ b/src/cmd/go/internal/load/pkg.go
+@@ -1897,6 +1897,10 @@ func (p *Package) load(ctx context.Context, opts PackageOpts, path string, stk *
+		setError(fmt.Errorf("invalid input directory name %q", name))
+		return
+	}
++	if strings.ContainsAny(p.Dir, "\r\n") {
++		setError(fmt.Errorf("invalid package directory %q", p.Dir))
++		return
++	}
+
+	// Build list of imported packages and full dependency list.
+	imports := make([]*Package, 0, len(p.Imports))
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index b35caa4..b1bf347 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -505,6 +505,12 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
+		b.Print(a.Package.ImportPath + "\n")
+	}
+
++	if p.Error != nil {
++		// Don't try to build anything for packages with errors. There may be a
++		// problem with the inputs that makes the package unsafe to build.
++		return p.Error
++	}
++
+	if a.Package.BinaryOnly {
+		p.Stale = true
+		p.StaleReason = "binary-only packages are no longer supported"
+diff --git a/src/cmd/go/script_test.go b/src/cmd/go/script_test.go
+index c0156d0..ce4ff37 100644
+--- a/src/cmd/go/script_test.go
++++ b/src/cmd/go/script_test.go
+@@ -182,6 +182,7 @@ func (ts *testScript) setup() {
+		"devnull=" + os.DevNull,
+		"goversion=" + goVersion(ts),
+		":=" + string(os.PathListSeparator),
++		"newline=\n",
+	}
+	if !testenv.HasExternalNetwork() {
+		ts.env = append(ts.env, "TESTGONETWORK=panic", "TESTGOVCS=panic")
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
+2.40.0
-- 
2.34.1


