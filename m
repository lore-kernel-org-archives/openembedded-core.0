Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A447CA6015
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 21:54:31 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5880.1791496467561122416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 14:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DTgMVXEj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026100821542542c9f69285000207a9-du7qnr@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026100821542542c9f69285000207a9
        for <openembedded-core@lists.openembedded.org>;
        Thu, 08 Oct 2026 23:54:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HOICPGsPJ8GtJybBTG08me5D1i3dpOo/jg+BebhFmwA=;
 b=DTgMVXEj1JNan+7u3vv/Q6IleSgeJCmFeqklfxJPanX3Da+2zDNJNMC1BQ00nBSr8S56yW
 1BJF5OtTmXFts52ChkbEziGqZE1+yJIaUMVobMW66UstZH4nMPszSi+mrzfrWW0psMQzrKb1
 PRQLYnlD4InyNda5+I1NrOuKaCRvKgrIONmubNpwLSSCcIzTwcJxTeM9/Lw5t2cdYVrd8YII
 GJeWb/qdZNo72EiggBy2ewl5idcH6+ZMo0dA/Vh4b56hCwUbas9YRskphsz+bDJZXAVnIrSO
 b4W85W5M9ypY2P4g4UiU25UfWFz3ps0A3DyIs8rszG41yicJmiD3+Ytw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] go: upgrade 1.26.8 -> 1.26.9
Date: Thu,  8 Oct 2026 23:52:38 +0200
Message-ID: <20261008215238.624353-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 21:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247452

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.8..go1.26.9
2ae494ef9f (tag: go1.26.9) [release-branch.go1.26] go1.26.9
6e04952188 [release-branch.go1.26] net/http: bundled HTTP/2 vuln fixes
eb25b4e532 [release-branch.go1.26] net/http: limit the size of range headers parsed in ServeContent
be88124d06 [release-branch.go1.26] os: correct Root junction handling on Windows (avoid mkdir escape)
087de1ff08 [release-branch.go1.26] net/http: avoid server reuse of connection after CONNECT
3fe1aac0ce [release-branch.go1.26] net/http, net/http/httputil: avoid post-CONNECT pool corruption
d7a7aa8e67 [release-branch.go1.26] net/textproto: enforce MIME memory limit on first line
eb1bf6e0c4 [release-branch.go1.26] crypto/tls: validate ECH outer extension references
7325b729f0 [release-branch.go1.26] cmd/go: always verify toolchain downloads with sumdb
5fa9de4696 [release-branch.go1.26] cmd/go: bundle go.sum h1 hashes for golang.org/fips140
5d84f6f08c [release-branch.go1.26] html/template: recognize `yield` as regexp preceder keyword
e59c03e695 [release-branch.go1.26] html/template: reset JS context for template expressions
7060ef9d77 [release-branch.go1.26] cmd/link: pass -no_fixup_chains to C linker when building plugin on macOS
305bfa6252 [release-branch.go1.26] cmd/go: include VetxOnly in the vet action ID
179610a1ed [release-branch.go1.26] os: preserve completion notification modes for NewFile handles
2a1834bf42 [release-branch.go1.26] cmd/compile: fix slice backing store analysis
c7183cd20d [release-branch.go1.26] os: handle unsupported OBJ_DONT_REPARSE on older Windows
19777cc57f [release-branch.go1.26] cmd/compile: don't stack-allocate a slice whose element interior escapes
5bf869b5ac [release-branch.go1.26] internal/runtime/syscall/linux: sync EpollEvent with the kernel header
6a97c5bf7c [release-branch.go1.26] net/http: vendor in CL 836505
ee49ded5ca [release-branch.go1.26] cmd/compile: fix large riscv64 move/zero
25d767a9a1 [release-branch.go1.26] runtime: netpoll: fix 32-bit little-endian eventfd type confusion
5e38ca6aaa [release-branch.go1.26] runtime: disable mutex profile during async preemption on windows
2c99952588 [release-branch.go1.26] crypto/mlkem: fix FIPS 130-3 CAST

Fixes CVE-2026-97032, CVE-2026-78659, CVE-2026-97031, CVE-2026-94444,
      CVE-2026-94447, CVE-2026-94448, CVE-2026-97030, CVE-2026-94440,
      CVE-2026-56866, CVE-2026-94439, CVE-2026-78669, CVE-2026-78660,
      CVE-2026-56857, CVE-2026-78667 and CVE-2026-78663.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.8...go1.26.9
[2] https://groups.google.com/g/golang-announce/c/U2fTuyDJznI

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.26.8.inc => go-1.26.9.inc} | 2 +-
 ...binary-native_1.26.8.bb => go-binary-native_1.26.9.bb} | 6 +++---
 ...oss-canadian_1.26.8.bb => go-cross-canadian_1.26.9.bb} | 0
 .../go/{go-cross_1.26.8.bb => go-cross_1.26.9.bb}         | 0
 .../go/{go-crosssdk_1.26.8.bb => go-crosssdk_1.26.9.bb}   | 0
 .../go/{go-runtime_1.26.8.bb => go-runtime_1.26.9.bb}     | 0
 ...go-make-content-based-hash-generation-less-pedan.patch | 8 ++++----
 .../go/go/0003-ld-add-soname-to-shareable-objects.patch   | 6 +++---
 .../go/0006-cmd-go-make-GOROOT-precious-by-default.patch  | 2 +-
 ....go-filter-out-build-specific-paths-from-linker-.patch | 4 ++--
 meta/recipes-devtools/go/{go_1.26.8.bb => go_1.26.9.bb}   | 0
 11 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.8.inc => go-1.26.9.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.8.bb => go-binary-native_1.26.9.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.8.bb => go-cross-canadian_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.8.bb => go-cross_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.8.bb => go-crosssdk_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.8.bb => go-runtime_1.26.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.8.bb => go_1.26.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.8.inc b/meta/recipes-devtools/go/go-1.26.9.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.8.inc
rename to meta/recipes-devtools/go/go-1.26.9.inc
index 7fa02ad710..e2657cf8ad 100644
--- a/meta/recipes-devtools/go/go-1.26.8.inc
+++ b/meta/recipes-devtools/go/go-1.26.9.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "4e39b98e42f946fa05ac8bc5b71877df97dbdb7cbb1a777b541667ad7117fd2e"
+SRC_URI[main.sha256sum] = "9735d7dcdb65b35d3fa577f04064737c03b89cf1a2b71e6e69fe2f3c6f9fd4ca"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.8.bb b/meta/recipes-devtools/go/go-binary-native_1.26.9.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.9.bb
index 1865c700fd..a42ce44360 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.9.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "d0f743b33e8d8945e6b1f432edd15785c70507121d6e2a723b21285eddf8b57b"
-SRC_URI[go_linux_arm64.sha256sum] = "211ffced9dcb9633a55eac6364816ec0ddd951389a740e88fa8b3337971bdda0"
-SRC_URI[go_linux_ppc64le.sha256sum] = "0ddf3ecab842013e6bd618602823a0b8158a18d3e9362f2540463ea5aa184975"
+SRC_URI[go_linux_amd64.sha256sum] = "42d158b4d8f7b61ac0a830567c940a86098fb7aac52e467a5ebec03ef5cc2f8d"
+SRC_URI[go_linux_arm64.sha256sum] = "4a97373d49fcacdcf3694fea368a500b00ee3e963974f3e7514132717632f052"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a21a65001146ca0c6c022c690d5418f8298c5513a81fb5eed42f6cdb29f40063"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.9.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.8.bb b/meta/recipes-devtools/go/go-cross_1.26.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.8.bb
rename to meta/recipes-devtools/go/go-cross_1.26.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.8.bb b/meta/recipes-devtools/go/go-runtime_1.26.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.9.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 077bebe743..cd61571e2c 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -109,7 +109,7 @@ index 7b073165d5..1f618be0bb 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2804,8 +2806,25 @@ func envList(key, def string) []string {
+@@ -2805,8 +2807,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -136,7 +136,7 @@ index 7b073165d5..1f618be0bb 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2821,6 +2840,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2822,6 +2841,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", DefaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -150,7 +150,7 @@ index 7b073165d5..1f618be0bb 100644
  
  	return
  }
-@@ -2909,7 +2935,7 @@ func (b *Builder) runCgo(ctx context.Context, a *Action) error {
+@@ -2910,7 +2936,7 @@ func (b *Builder) runCgo(ctx context.Context, a *Action) error {
  	cgoExe := base.Tool("cgo")
  	cgofiles = mkAbsFiles(p.Dir, cgofiles)
  
@@ -159,7 +159,7 @@ index 7b073165d5..1f618be0bb 100644
  	if err != nil {
  		return err
  	}
-@@ -3462,7 +3488,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+@@ -3463,7 +3489,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
  	p := a.Package
  	sh := b.Shell(a)
  
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index 0b5026fc12..f7f4dbead9 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -22,7 +22,7 @@ diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
 index 2d8f964f35..dfc72e02c0 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1652,6 +1652,7 @@ func (ctxt *Link) hostlink() {
+@@ -1660,6 +1660,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -30,7 +30,7 @@ index 2d8f964f35..dfc72e02c0 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1667,6 +1668,7 @@ func (ctxt *Link) hostlink() {
+@@ -1675,6 +1676,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -38,7 +38,7 @@ index 2d8f964f35..dfc72e02c0 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1675,6 +1677,7 @@ func (ctxt *Link) hostlink() {
+@@ -1683,6 +1685,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 9aebc2f0dc..70e16a1d57 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -94,7 +94,7 @@ index 1f618be0bb..651fa64582 100644
  	if err := sh.Mkdir(buildAction.Objdir); err != nil {
  		return nil, err
  	}
-@@ -1888,6 +1905,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1889,6 +1906,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
index 2598a7b34a..a620a9cb63 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -19,7 +19,7 @@ diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
 index 651fa64582..586079afb4 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1563,6 +1563,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1564,6 +1564,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	return h.Sum()
  }
  
@@ -49,7 +49,7 @@ index 651fa64582..586079afb4 100644
  // printLinkerConfig prints the linker config into the hash h,
  // as part of the computation of a linker-related action ID.
  func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
-@@ -1573,7 +1596,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+@@ -1574,7 +1597,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
  	case "gc":
  		fmt.Fprintf(h, "link %s %q %s\n", b.toolID("link"), forcedLdflags, ldBuildmode)
  		if p != nil {
diff --git a/meta/recipes-devtools/go/go_1.26.8.bb b/meta/recipes-devtools/go/go_1.26.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.8.bb
rename to meta/recipes-devtools/go/go_1.26.9.bb

