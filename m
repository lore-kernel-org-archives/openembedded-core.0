Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3567CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 06:58:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14162.1755673108181926947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 23:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DKPaoKgX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=032789f14d=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57K68RcN3254631
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=eghJnnG6nuYBpckE8/+DhojxedJRTWVtS3UB8I+yL1s=; b=DKPaoKgXsjkf
	FrhEWKCgSGEMtSyFF9hi0JUbvI+QfZ0h9OtMMKqjGFo9umovTCC7Nfw0hr7dsKzn
	YBhq4vKgIlQvZencFGUkiiPOO+HKuH1DYfYPq4mELa9zoOuNXmWUUWLwV4uaqAx0
	i/urVpvfVT781VmkAKmiLoD4/rzDOvp+fO6pNMLFvYfUms9BKAQoMOyGlItuQobW
	lM25VKMJPii6ZRiJxoJ09wrQ3Ye6IZhLuUChlxzK2QYor0sN3oKawv6If94LDVbT
	48xIZDHbmTI0Hon/mMBWiqO3RWs7NiIWsNh7qfYtXW1ja0GwrPyL90Kbx9+sszxF
	EUVMJ62H6w==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydqre0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:58:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 19 Aug 2025 23:58:17 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 19 Aug 2025 23:58:15 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 2/2] go: fix CVE-2025-4674
Date: Wed, 20 Aug 2025 12:28:12 +0530
Message-ID: <20250820065812.1818560-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250820065812.1818560-1-archana.polampalli@windriver.com>
References: <20250820065812.1818560-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PpTe_z6IRWvl1wW7tmLFS6LtqQYxWdge
X-Proofpoint-ORIG-GUID: PpTe_z6IRWvl1wW7tmLFS6LtqQYxWdge
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDA1OSBTYWx0ZWRfX7RZHOhivKsLJ
 BvHinRrejwJ2LMlb89cCvgHyH5Xh6t3huE5fg/iUDA35xXE0AB7klQaGgW4xAU8e1w8m4Qs46Gk
 9uATRNs7WQHv6C7gAEQ6hMM4i5KPO+JTkP58NphDyUXQAH9PRRq+t6scx8lz8VSM4PAEvW9aNf8
 ioQ/jP93GPBp7FhOCyEhSEyTD+WTmbrS3DmndfZt+WDDRqYUGRcxeZnSMudokzLq57V4Av7U8Vk
 B8a3VB40yGFWD5NvSgSOgnLvbLoK8zqGzq3o9vS2ve3QNsjkV7UwGbYhhiJC0yyJcB1YrdDzY4D
 QAkH2aUCfXWvCjABga+R9mNut5LAenxh1WdSDB7j8wi0Yww22SFSUX4hAM259VndiCcHIDNdarZ
 rXSwINJfyFigOzRIC8hoOMCgaMEr9Q==
X-Authority-Analysis: v=2.4 cv=XOhpiQhE c=1 sm=1 tr=0 ts=68a57213 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=W0HYcSKoAAAA:8 a=NEAV23lmAAAA:8 a=Oh2cFVv5AAAA:8
 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=yhUri8FnAAAA:8 a=pM9yUfARAAAA:8
 a=A1X0JdhQAAAA:8 a=pE-wlHv-HPtbXZKR9ZQA:9 a=bLb_CXWbkAz7TZrN:21
 a=ppclIlqPgZou8qzj2Vqa:22 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=8nbOMqh3J4Vhtx036jbE:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:58:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222156

From: Archana Polampalli <archana.polampalli@windriver.com>

The go command may execute unexpected commands when operating in untrusted VCS repositories.
This occurs when possibly dangerous VCS configuration is present in repositories.
This can happen when a repository was fetched via one VCS (e.g. Git), but contains metadata
for another VCS (e.g. Mercurial). Modules which are retrieved using the go command line,
i.e. via "go get", are not affected.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-4674.patch                 | 332 ++++++++++++++++++
 2 files changed, 333 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-4674.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index af09cb52cd..4de087170c 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -17,5 +17,6 @@ SRC_URI += "\
     file://CVE-2025-22870.patch \
     file://CVE-2025-22871.patch \
     file://CVE-2025-4673.patch \
+    file://CVE-2025-4674.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go/CVE-2025-4674.patch b/meta/recipes-devtools/go/go/CVE-2025-4674.patch
new file mode 100644
index 0000000000..bc6e438652
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-4674.patch
@@ -0,0 +1,332 @@
+From e9d2c032b14c17083be0f8f0c822565199d2994f Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Mon, 9 Jun 2025 11:23:46 -0700
+Subject: [PATCH] [release-branch.go1.23] cmd/go: disable support for multiple
+ vcs in one module
+
+Removes the somewhat redundant vcs.FromDir, "allowNesting" argument,
+which was always enabled, and disallow multiple VCS metadata folders
+being present in a single directory. This makes VCS injection attacks
+much more difficult.
+
+Also adds a GODEBUG, allowmultiplevcs, which re-enables this behavior.
+
+Thanks to RyotaK (https://ryotak.net) of GMO Flatt Security Inc for
+reporting this issue.
+
+Updates #74380
+Fixes #74382
+Fixes CVE-2025-4674
+
+CVE: CVE-2025-4674
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e9d2c032b14c17083be0f8f0c822565199d2994f]
+
+Change-Id: I2db79f2baacfacfec331ee7c6978c4057d483eba
+Reviewed-on: https://go-review.googlesource.com/c/go/+/686337
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: David Chase <drchase@google.com>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Commit-Queue: Carlos Amedee <carlos@golang.org>
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ doc/godebug.md                                |  4 ++
+ src/cmd/go/internal/load/pkg.go               | 14 ++---
+ src/cmd/go/internal/vcs/vcs.go                | 28 ++++++----
+ src/cmd/go/internal/vcs/vcs_test.go           |  2 +-
+ src/cmd/go/testdata/script/test_multivcs.txt  | 54 +++++++++++++++++++
+ .../script/version_buildvcs_nested.txt        | 20 +++++--
+ src/internal/godebugs/godebugs_test.go        |  3 +-
+ src/internal/godebugs/table.go                |  1 +
+ src/runtime/metrics/doc.go                    |  5 ++
+ 9 files changed, 108 insertions(+), 23 deletions(-)
+ create mode 100644 src/cmd/go/testdata/script/test_multivcs.txt
+
+diff --git a/doc/godebug.md b/doc/godebug.md
+index fb3f32f..ae4f057 100644
+--- a/doc/godebug.md
++++ b/doc/godebug.md
+@@ -126,6 +126,10 @@ for example,
+ see the [runtime documentation](/pkg/runtime#hdr-Environment_Variables)
+ and the [go command documentation](/cmd/go#hdr-Build_and_test_caching).
+
++Go 1.23.11 disabled build information stamping when multiple VCS are detected due
++to concerns around VCS injection attacks. This behavior can be renabled with the
++setting `allowmultiplevcs=1`.
++
+ ### Go 1.22
+
+ Go 1.22 adds a configurable limit to control the maximum acceptable RSA key size
+diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
+index f41fb2c..428780e 100644
+--- a/src/cmd/go/internal/load/pkg.go
++++ b/src/cmd/go/internal/load/pkg.go
+@@ -2465,7 +2465,6 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+	var repoDir string
+	var vcsCmd *vcs.Cmd
+	var err error
+-	const allowNesting = true
+
+	wantVCS := false
+	switch cfg.BuildBuildvcs {
+@@ -2485,7 +2484,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+			// (so the bootstrap toolchain packages don't even appear to be in GOROOT).
+			goto omitVCS
+		}
+-		repoDir, vcsCmd, err = vcs.FromDir(base.Cwd(), "", allowNesting)
++		repoDir, vcsCmd, err = vcs.FromDir(base.Cwd(), "")
+		if err != nil && !errors.Is(err, os.ErrNotExist) {
+			setVCSError(err)
+			return
+@@ -2508,10 +2507,11 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+	}
+	if repoDir != "" && vcsCmd.Status != nil {
+		// Check that the current directory, package, and module are in the same
+-		// repository. vcs.FromDir allows nested Git repositories, but nesting
+-		// is not allowed for other VCS tools. The current directory may be outside
+-		// p.Module.Dir when a workspace is used.
+-		pkgRepoDir, _, err := vcs.FromDir(p.Dir, "", allowNesting)
++		// repository. vcs.FromDir disallows nested VCS and multiple VCS in the
++		// same repository, unless the GODEBUG allowmultiplevcs is set. The
++		// current directory may be outside p.Module.Dir when a workspace is
++		// used.
++		pkgRepoDir, _, err := vcs.FromDir(p.Dir, "")
+		if err != nil {
+			setVCSError(err)
+			return
+@@ -2523,7 +2523,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+			}
+			goto omitVCS
+		}
+-		modRepoDir, _, err := vcs.FromDir(p.Module.Dir, "", allowNesting)
++		modRepoDir, _, err := vcs.FromDir(p.Module.Dir, "")
+		if err != nil {
+			setVCSError(err)
+			return
+diff --git a/src/cmd/go/internal/vcs/vcs.go b/src/cmd/go/internal/vcs/vcs.go
+index 8550f2a..89d9f0e 100644
+--- a/src/cmd/go/internal/vcs/vcs.go
++++ b/src/cmd/go/internal/vcs/vcs.go
+@@ -8,6 +8,7 @@ import (
+	"bytes"
+	"errors"
+	"fmt"
++	"internal/godebug"
+	"internal/lazyregexp"
+	"internal/singleflight"
+	"io/fs"
+@@ -831,11 +832,13 @@ type vcsPath struct {
+	schemelessRepo bool                                // if true, the repo pattern lacks a scheme
+ }
+
++var allowmultiplevcs = godebug.New("allowmultiplevcs")
++
+ // FromDir inspects dir and its parents to determine the
+ // version control system and code repository to use.
+ // If no repository is found, FromDir returns an error
+ // equivalent to os.ErrNotExist.
+-func FromDir(dir, srcRoot string, allowNesting bool) (repoDir string, vcsCmd *Cmd, err error) {
++func FromDir(dir, srcRoot string) (repoDir string, vcsCmd *Cmd, err error) {
+	// Clean and double-check that dir is in (a subdirectory of) srcRoot.
+	dir = filepath.Clean(dir)
+	if srcRoot != "" {
+@@ -849,21 +852,28 @@ func FromDir(dir, srcRoot string, allowNesting bool) (repoDir string, vcsCmd *Cm
+	for len(dir) > len(srcRoot) {
+		for _, vcs := range vcsList {
+			if isVCSRoot(dir, vcs.RootNames) {
+-				// Record first VCS we find.
+-				// If allowNesting is false (as it is in GOPATH), keep looking for
+-				// repositories in parent directories and report an error if one is
+-				// found to mitigate VCS injection attacks.
+				if vcsCmd == nil {
++					// Record first VCS we find.
+					vcsCmd = vcs
+					repoDir = dir
+-					if allowNesting {
++					if allowmultiplevcs.Value() == "1" {
++						allowmultiplevcs.IncNonDefault()
+						return repoDir, vcsCmd, nil
+					}
++					// If allowmultiplevcs is not set, keep looking for
++					// repositories in current and parent directories and report
++					// an error if one is found to mitigate VCS injection
++					// attacks.
++					continue
++				}
++				if vcsCmd == vcsGit && vcs == vcsGit {
++					// Nested Git is allowed, as this is how things like
++					// submodules work. Git explicitly protects against
++					// injection against itself.
+					continue
+				}
+-				// Otherwise, we have one VCS inside a different VCS.
+-				return "", nil, fmt.Errorf("directory %q uses %s, but parent %q uses %s",
+-					repoDir, vcsCmd.Cmd, dir, vcs.Cmd)
++				return "", nil, fmt.Errorf("multiple VCS detected: %s in %q, and %s in %q",
++					vcsCmd.Cmd, repoDir, vcs.Cmd, dir)
+			}
+		}
+
+diff --git a/src/cmd/go/internal/vcs/vcs_test.go b/src/cmd/go/internal/vcs/vcs_test.go
+index 2ce85ea..06e63c2 100644
+--- a/src/cmd/go/internal/vcs/vcs_test.go
++++ b/src/cmd/go/internal/vcs/vcs_test.go
+@@ -239,7 +239,7 @@ func TestFromDir(t *testing.T) {
+			}
+
+			wantRepoDir := filepath.Dir(dir)
+-			gotRepoDir, gotVCS, err := FromDir(dir, tempDir, false)
++			gotRepoDir, gotVCS, err := FromDir(dir, tempDir)
+			if err != nil {
+				t.Errorf("FromDir(%q, %q): %v", dir, tempDir, err)
+				continue
+diff --git a/src/cmd/go/testdata/script/test_multivcs.txt b/src/cmd/go/testdata/script/test_multivcs.txt
+new file mode 100644
+index 0000000..538cbf7
+--- /dev/null
++++ b/src/cmd/go/testdata/script/test_multivcs.txt
+@@ -0,0 +1,54 @@
++# To avoid VCS injection attacks, we should not accept multiple different VCS metadata
++# folders within a single module (either in the same directory, or nested in different
++# directories.)
++#
++# This behavior should be disabled by setting the allowmultiplevcs GODEBUG.
++
++[short] skip
++[!git] skip
++
++cd samedir
++
++exec git init .
++
++# Without explicitly requesting buildvcs, the go command should silently continue
++# without determining the correct VCS.
++go test -c -o $devnull .
++
++# If buildvcs is explicitly requested, we expect the go command to fail
++! go test -buildvcs -c -o $devnull .
++stderr '^error obtaining VCS status: multiple VCS detected:'
++
++env GODEBUG=allowmultiplevcs=1
++go test -buildvcs -c -o $devnull .
++
++env GODEBUG=
++cd ../nested
++exec git init .
++# cd a
++go test -c -o $devnull ./a
++! go test -buildvcs -c -o $devnull ./a
++stderr '^error obtaining VCS status: multiple VCS detected:'
++# allowmultiplevcs doesn't disable the check that the current directory, package, and
++# module are in the same repository.
++env GODEBUG=allowmultiplevcs=1
++! go test -buildvcs -c -o $devnull ./a
++stderr '^error obtaining VCS status: main package is in repository'
++
++-- samedir/go.mod --
++module example
++
++go 1.18
++-- samedir/example.go --
++package main
++-- samedir/.bzr/test --
++hello
++
++-- nested/go.mod --
++module example
++
++go 1.18
++-- nested/a/example.go --
++package main
++-- nested/a/.bzr/test --
++hello
+diff --git a/src/cmd/go/testdata/script/version_buildvcs_nested.txt b/src/cmd/go/testdata/script/version_buildvcs_nested.txt
+index 6dab847..22cd71c 100644
+--- a/src/cmd/go/testdata/script/version_buildvcs_nested.txt
++++ b/src/cmd/go/testdata/script/version_buildvcs_nested.txt
+@@ -9,25 +9,35 @@ cd root
+ go mod init example.com/root
+ exec git init
+
+-# Nesting repositories in parent directories are ignored, as the current
+-# directory main package, and containing main module are in the same repository.
+-# This is an error in GOPATH mode (to prevent VCS injection), but for modules,
+-# we assume users have control over repositories they've checked out.
++
++# Nesting repositories in parent directories are an error, to prevent VCS injection.
++# This can be disabled with the allowmultiplevcs GODEBUG.
+ mkdir hgsub
+ cd hgsub
+ exec hg init
+ cp ../../main.go main.go
+ ! go build
++stderr '^error obtaining VCS status: multiple VCS detected: hg in ".*hgsub", and git in ".*root"$'
++stderr '^\tUse -buildvcs=false to disable VCS stamping.$'
++env GODEBUG=allowmultiplevcs=1
++! go build
+ stderr '^error obtaining VCS status: main module is in repository ".*root" but current directory is in repository ".*hgsub"$'
+ stderr '^\tUse -buildvcs=false to disable VCS stamping.$'
+ go build -buildvcs=false
++env GODEBUG=
+ go mod init example.com/root/hgsub
++! go build
++stderr '^error obtaining VCS status: multiple VCS detected: hg in ".*hgsub", and git in ".*root"$'
++stderr '^\tUse -buildvcs=false to disable VCS stamping.$'
++env GODEBUG=allowmultiplevcs=1
+ go build
++env GODEBUG=
+ cd ..
+
+ # It's an error to build a package from a nested Git repository if the package
+ # is in a separate repository from the current directory or from the module
+-# root directory.
++# root directory. Otherwise nested Git repositories are allowed, as this is
++# how Git implements submodules (and protects against Git based VCS injection.)
+ mkdir gitsub
+ cd gitsub
+ exec git init
+diff --git a/src/internal/godebugs/godebugs_test.go b/src/internal/godebugs/godebugs_test.go
+index a1cb8d4..b3784eb 100644
+--- a/src/internal/godebugs/godebugs_test.go
++++ b/src/internal/godebugs/godebugs_test.go
+@@ -39,7 +39,8 @@ func TestAll(t *testing.T) {
+		if info.Old != "" && info.Changed == 0 {
+			t.Errorf("Name=%s has Old, missing Changed", info.Name)
+		}
+-		if !strings.Contains(doc, "`"+info.Name+"`") {
++		if !strings.Contains(doc, "`"+info.Name+"`") &&
++                       !strings.Contains(doc, "`"+info.Name+"=") {
+			t.Errorf("Name=%s not documented in doc/godebug.md", info.Name)
+		}
+	}
+diff --git a/src/internal/godebugs/table.go b/src/internal/godebugs/table.go
+index 11c5b7d..33dcd81 100644
+--- a/src/internal/godebugs/table.go
++++ b/src/internal/godebugs/table.go
+@@ -25,6 +25,7 @@ type Info struct {
+ // Note: After adding entries to this table, update the list in doc/godebug.md as well.
+ // (Otherwise the test in this package will fail.)
+ var All = []Info{
++	{Name: "allowmultiplevcs", Package: "cmd/go"},
+	{Name: "execerrdot", Package: "os/exec"},
+	{Name: "gocachehash", Package: "cmd/go"},
+	{Name: "gocachetest", Package: "cmd/go"},
+diff --git a/src/runtime/metrics/doc.go b/src/runtime/metrics/doc.go
+index 85f256d..517ec0e 100644
+--- a/src/runtime/metrics/doc.go
++++ b/src/runtime/metrics/doc.go
+@@ -230,6 +230,11 @@ Below is the full list of supported metrics, ordered lexicographically.
+	/gc/stack/starting-size:bytes
+		The stack size of new goroutines.
+
++	/godebug/non-default-behavior/allowmultiplevcs:events
++               The number of non-default behaviors executed by the cmd/go
++               package due to a non-default GODEBUG=allowmultiplevcs=...
++               setting.
++
+	/godebug/non-default-behavior/execerrdot:events
+		The number of non-default behaviors executed by the os/exec
+		package due to a non-default GODEBUG=execerrdot=... setting.
+--
+2.40.0
-- 
2.40.0


