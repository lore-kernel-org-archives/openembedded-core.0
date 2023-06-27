Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44438EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 08:13:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8118.1687853629923870808
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 01:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dG6o833P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5542140cb8=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35R80kMA031565
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 08:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=DJjtQ
	P9OWgkc4qHnqB4B4+TAs7glTdAIOTccKGoFZb4=; b=dG6o833PNrY3flk9JmUSO
	l66EDvEBY3TFQMmZmGiu1ZYIlcmNhkb5YH5BTuMXw4UJGLPmie3Kiz9Fsifd0DTL
	l+QHlI6udIv02Jbiu/SI2DppXQnqneERyhu8wFtNvejwXQncNoKKD6I9Zw/LBpsl
	qLwX3wzz/94W7xD8ZgDE4l17u69J4duarhvsQWms+vIFTphBzLrX5+PHSWeoGcWT
	bEv0oaOr8MbX/Kr4CC2cjUeZpaBvgmTVUmpNX8pqo7MdBvBaiUzAJ31HwOCQqQnQ
	D0bXNZ+kH3y1LW7x6nKL2FNLWoa/pvJbW3YhdgPQlIRiNmOIlYqhszmRNpTSDmD8
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdqf4ajat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 08:13:48 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 01:13:46 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH V2 1/1] go: fix CVE-2023-29402
Date: Tue, 27 Jun 2023 08:13:33 +0000
Message-ID: <20230627081333.2366926-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: LqZGIjMzJHZovtnm2A9cJszw0eQtrOOq
X-Proofpoint-GUID: LqZGIjMzJHZovtnm2A9cJszw0eQtrOOq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_04,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 08:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183477

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
2.40.0


