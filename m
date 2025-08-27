Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563A1CA0FFE
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:29:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.6623.1756330191816259408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:29:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P/kFdVYy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77053017462so265655b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330191; x=1756934991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjxpjleGmnPr60pufOiDp0/VurDkXXIbxNmPCFGrnAI=;
        b=P/kFdVYyJo79xO/r3gio5yG5TgGqSfaWGAOB6cgQI9XaKIAvI+K/9inIbl19zHErDd
         9oHMHRkA/N36a1+ZdCvTkGRiQCCv+8+x4AXVyICvEIlAjZI7LinLEiMw4/TZwMVOMptG
         +muUN9B5g/AZadagEegmIBP3QoV+z23CLYZ1vP36Iq1gADg0Ppj/ZE4JdS8L2GmHG1WZ
         cSbvzWW5Fju0QpldUufUe9BhvSrVYWdq3gwbtzb/PPYOJ24qmnS6VcH98f/ER7lUG0qy
         rt+ZeZbR0pphLe74WcgT5o4//FQyHiO++e5WZMY3ww7iZFKBou59hD0aBuv2xF+sDEBA
         mKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330191; x=1756934991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjxpjleGmnPr60pufOiDp0/VurDkXXIbxNmPCFGrnAI=;
        b=u88MpTzkysowFpc7P5Fcyn4tcdsQK88FRMtiVzhMidd960BV2RKMkF8wbm7xTFpxUj
         hsVLv2G+kQuB3V3PbEt9q7b8IGCLrgQypltHX+sdC1DxTs4JvY3fYMJD41hK1gwcvkyd
         2fiFApfXxAsq3ztwI6ZpYYkTC84VB6wX/55Lfg0OUECbCzureyZL737ZKuBmPJfSSppw
         zyiWOR75Nkr9OAaX05uAHhH9R04pOjXK2QrbWv7C2VeIihmDRsSaLc23Nh9n+KY+f/tz
         6bxOmdC5YfwFx+ROMn3jzrYXPW/9XwuEH708xm1n7y2OsNFOR+IryMfQY6L4h0qxnA/D
         m1nQ==
X-Gm-Message-State: AOJu0Yxp9PFp5BYTaL+UtaJNfW3YsuDNUII3C4U06d8U3VQPOC9p9S9B
	C7nOWPxQEM+Rog9d5rDhF3usTzleIUIbJZDtgcwO2wZZoZpiQ/tl36+JOUFJGAlh3uhndI9mMr9
	WHRgw
X-Gm-Gg: ASbGncsYGqMhPrAtIIo0dVZCWZtWv4c16TE7CaHMYL15/BVHZrhtkPI9u5MYEPExBe3
	bFBczHIpu/W8kq+aO50cj1c9GXeAlxMHbcOnmhqh590zjA5orMplWXdq+B1Jx/1IsfoZnX8I/5z
	iYluwwb2MCaK9Z3BMF2C7+Qdo2GsHO18DfVcz5rTvX5x5XVhxboNF2ic3KxfTAkMQzT6y6pBCfp
	TJpk+JFy9OOG5z1lwxgqTPW0jIf7QwClCLZuJ9T94o1gxZta3Cy6/sc7RddGr9tZJgQFXM8dY5f
	vSGHucQyc0qBhkpZJnNcSgpUWAB770G+IlOzf4V4r9xN91kQMiK93lqEBoTjb2Fefo2PxC4GXRZ
	CY2fdVx7PfEyTbw==
X-Google-Smtp-Source: AGHT+IG4RsA6MM4REFbboksRKyeJ/1dogpPlXXwqLqAQdt2iCJozgzE0RQrlDbAahA7mwkmPdbTYxA==
X-Received: by 2002:a05:6a20:3d1a:b0:23f:fec8:9ace with SMTP id adf61e73a8af0-24340bd0efcmr28778154637.11.1756330190580;
        Wed, 27 Aug 2025 14:29:50 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.29.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:29:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/33] go: fix CVE-2025-4674
Date: Wed, 27 Aug 2025 14:29:08 -0700
Message-ID: <efdc4920571677c9051d4402eaa801672eeb24e3.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222509

From: Archana Polampalli <archana.polampalli@windriver.com>

The go command may execute unexpected commands when operating in untrusted VCS repositories.
This occurs when possibly dangerous VCS configuration is present in repositories.
This can happen when a repository was fetched via one VCS (e.g. Git), but contains metadata
for another VCS (e.g. Mercurial). Modules which are retrieved using the go command line,
i.e. via "go get", are not affected.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-4674.patch                 | 332 ++++++++++++++++++
 2 files changed, 333 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-4674.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ea57b23c3e..12d7539017 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -17,6 +17,7 @@ SRC_URI += "\
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
2.43.0


