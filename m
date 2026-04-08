Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A2810FC448
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:43:27 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.117698.1775684596837481170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=guFeLSZL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202604082143158166c2af2f000207cb-utrjxe@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202604082143158166c2af2f000207cb
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Apr 2026 23:43:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xmG+nemkv4gcP3YtpyLzHPX+90A6P0jzclsaluQSLiw=;
 b=guFeLSZL4rmRfRRxEXODM/Ehx1AKSLk8Z8z4Z1+3sbbzqxiVkEbxoGls4YHzSgdBlOsYMO
 8DJ+XiuwTzvsy7JndLcKig2ZGzRiaLWae5E7MCacGSVTI7wUSrqYJi6/gdsdDWTNAkeEbc5x
 ao9P55V6ydngonyB1PUMZ4LrlpJuql5tJErizYem0IIeldFZsDfnbHByU+LBe5gJ7EmRqQE/
 h/zWz5yeUVwk3uRoobsY1IEV8EXCUQLsH8jk6FHUhZGoiPV9HYnubGRLqTxoN8c0auzSqmTP
 1LxKizDdrhsb/3BQJMmA9Cbpfb/s0zLm90cHOlwPOkvApiMpUSMAZ8gA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [whinlatter][PATCH] go: upgrade 1.25.8 -> 1.25.9
Date: Wed,  8 Apr 2026 23:42:27 +0200
Message-ID: <20260408214227.641307-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234863

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.8..go1.25.9
7076e01d9d (tag: go1.25.9) [release-branch.go1.25] go1.25.9
abaa0cbb25 [release-branch.go1.25] cmd/go: disallow cgo trust boundary bypass
02f574a830 [release-branch.go1.25] crypto/tls: prevent deadlock when client sends multiple key update messages
82b0cdb741 [release-branch.go1.25] archive/tar: limit the number of old GNU sparse format entries
7d2dd3488c [release-branch.go1.25] cmd/compile: fix loopbce overflow check logic
72cc33629a [release-branch.go1.25] cmd/compile: fix mem access overlap detection
3ed3169244 [release-branch.go1.25] html/template: properly track JS template literal brace depth across contexts
4c79c4223e [release-branch.go1.25] internal/syscall/unix: properly support AT_SYMLINK_NOFOLLOW on Linux
edc1e4a5f2 [release-branch.go1.25] crypto/x509: fix signature checking limit
210b8112b1 [release-branch.go1.25] crypto/x509: hoist policy pruning out of loop
93a4f03ed8 [release-branch.go1.25] runtime/race: apply LLVM zero-initialization fix
cff64a5cf3 [release-branch.go1.25] cmd/go: tests: rename git-min-vers->git-sha256
7301bd39d1 [release-branch.go1.25] cmd/go: skip git sha256 tests if git < 2.29
f9532f001a [release-branch.go1.25] test/fixedbugs: remove issue46234 test timeout
4f81fbf332 [release-branch.go1.25] doc: remove template use in godebug.md
aed39507b1 [release-branch.go1.25] cmd/go/internal/cache: update trim timestamp before trimming
9a6627a5db [release-branch.go1.25] crypto/x509: fix wildcard domain exclusions.
19c660de6b [release-branch.go1.25] cmd/compile/internal/typecheck: simplify tcSliceHeader
b02c84a684 [release-branch.go1.25] cmd/internal/testdir: pass -buildid to link command
814b540c17 [release-branch.go1.25] cmd/internal/testdir: unify link command
de86eaeb0f [release-branch.go1.25] cmd/cgo/internal/test: use (syntactic) constant for C array bound

Fixes CVE-2026-32282, CVE-2026-32289, CVE-2026-27144, CVE-2026-27143,
      CVE-2026-32288, CVE-2026-32283, CVE-2026-27140, CVE-2026-32280 and
      CVE-2026-32281.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.8...go1.25.9
[2] https://groups.google.com/g/golang-announce/c/0uYbvbPZRWU

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.25.8.inc => go-1.25.9.inc} | 2 +-
 ...binary-native_1.25.8.bb => go-binary-native_1.25.9.bb} | 6 +++---
 ...oss-canadian_1.25.8.bb => go-cross-canadian_1.25.9.bb} | 0
 .../go/{go-cross_1.25.8.bb => go-cross_1.25.9.bb}         | 0
 .../go/{go-crosssdk_1.25.8.bb => go-crosssdk_1.25.9.bb}   | 0
 .../go/{go-runtime_1.25.8.bb => go-runtime_1.25.9.bb}     | 0
 ...go-make-content-based-hash-generation-less-pedan.patch | 8 ++++----
 .../go/0006-cmd-go-make-GOROOT-precious-by-default.patch  | 2 +-
 meta/recipes-devtools/go/{go_1.25.8.bb => go_1.25.9.bb}   | 0
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.8.inc => go-1.25.9.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.8.bb => go-binary-native_1.25.9.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.8.bb => go-cross-canadian_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.8.bb => go-cross_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.8.bb => go-crosssdk_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.8.bb => go-runtime_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.8.bb => go_1.25.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.8.inc b/meta/recipes-devtools/go/go-1.25.9.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.8.inc
rename to meta/recipes-devtools/go/go-1.25.9.inc
index 5db1b1c04c..9a96f6f170 100644
--- a/meta/recipes-devtools/go/go-1.25.8.inc
+++ b/meta/recipes-devtools/go/go-1.25.9.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e"
+SRC_URI[main.sha256sum] = "0ec9ef8ebcea097aac37decae9f09a7218b451cd96be7d6ed513d8e4bcf909cf"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.8.bb b/meta/recipes-devtools/go/go-binary-native_1.25.9.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.9.bb
index df6cb542fb..b11b822c94 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.9.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ceb5e041bbc3893846bd1614d76cb4681c91dadee579426cf21a63f2d7e03be6"
-SRC_URI[go_linux_arm64.sha256sum] = "7d137f59f66bb93f40a6b2b11e713adc2a9d0c8d9ae581718e3fad19e5295dc7"
-SRC_URI[go_linux_ppc64le.sha256sum] = "28ed144a945e4d7188c93f8d85fb772a98ed18f8f9f8d3a650696b739f8cc57c"
+SRC_URI[go_linux_amd64.sha256sum] = "00859d7bd6defe8bf84d9db9e57b9a4467b2887c18cd93ae7460e713db774bc1"
+SRC_URI[go_linux_arm64.sha256sum] = "ec342e7389b7f489564ed5463c63b16cf8040023dabc7861256677165a8c0e2b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "b0c41c7da1fc8d39020d65296a0dc54167afd9f76d67064e22c31ce3d839a739"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.8.bb b/meta/recipes-devtools/go/go-cross_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.8.bb
rename to meta/recipes-devtools/go/go-cross_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.8.bb b/meta/recipes-devtools/go/go-runtime_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 6d75266cbe..921e59c4a2 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -109,7 +109,7 @@ index 7b073165d5..1f618be0bb 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2639,8 +2641,25 @@ func envList(key, def string) []string {
+@@ -2636,8 +2638,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -136,7 +136,7 @@ index 7b073165d5..1f618be0bb 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2656,6 +2675,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2653,6 +2672,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", DefaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -150,7 +150,7 @@ index 7b073165d5..1f618be0bb 100644
  
  	return
  }
-@@ -2673,7 +2699,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+@@ -2670,7 +2696,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
  	p := a.Package
  	sh := b.Shell(a)
  
@@ -159,7 +159,7 @@ index 7b073165d5..1f618be0bb 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3237,7 +3263,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+@@ -3238,7 +3264,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
  	p := a.Package
  	sh := b.Shell(a)
  
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 15ffdb3cf3..4ac478be85 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -94,7 +94,7 @@ index 1f618be0bb..651fa64582 100644
  	if err := sh.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1739,6 +1756,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1736,6 +1753,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
diff --git a/meta/recipes-devtools/go/go_1.25.8.bb b/meta/recipes-devtools/go/go_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.8.bb
rename to meta/recipes-devtools/go/go_1.25.9.bb

