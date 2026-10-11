Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EC7CA9ED0
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:40 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23583.1791708095508823060
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eVNzMLqn;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4be28b82so869638f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708094; x=1792312894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gCRvd2sQ7vyPuT3O/M9IajHe+2y2Lc+HofrVMOmx0Hw=;
        b=eVNzMLqnQRJbzZRZv06JtJYsfyNjfa30cJt97eRNB52op4eeLKCqoOPu8Pb2uludFk
         D1NOhqsB2w/DZwhVeDFkm5SIJzQjIWKNYStigE64YEOdXcmYp3epOS2M52dcD3ZWvG+L
         9HC5Ar7TDtfyerjRvtBE3lnchA0JkCRNRsgpU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708094; x=1792312894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gCRvd2sQ7vyPuT3O/M9IajHe+2y2Lc+HofrVMOmx0Hw=;
        b=OwVpLA5lLt5xD+nhaI2UDy//9NSCgqf9vfMPQmqlKTr5/25855CAm2KlAlVlrP3CSb
         EEuda0v2rTLYL1zwFzPhltoNaEsyAdAPTrGBbG5Gz13EgyLFy/oc94bQCcDkZhsOpXAt
         KElualZhUfyJf97nePE9uix7z61oYdZXo9QV0K/cI4qteBezhhkf/3dVUY6H9KtZ+03S
         SVE5IuMu1xeOcgzOL8ccZhldeCvBad2lwyrNIwYE0e8hMI8rN+GxxEm/2UxyF6Cantj0
         FtGRS2WOvFniH4Ax7g4pdhI16aKOINwfpl//V+azfFYLpF1paNb41XubnNguB0GXBna6
         YUnQ==
X-Gm-Message-State: AFq9FYJMvFNt4EP56Lf1Z0GIhrqTshgcFBhYenLl0Jtfmv5TMa15HNo/
	YmxW04PxO+HulZQ0gMCGwXOJYv2nGpARBpf4PV7noKvD/IngftDb8Olru9BzfmrsX3z3Zczi5+z
	0CQDesz8=
X-Gm-Gg: AYBFou2NDLA/uqKQsb1MXKAhWpKPtXPi8KYwtS5QL1ymRwVrBUK4pIzhGBn/+oTDhCw
	TBQGJFtJ2pwn1MXjdp0wdn0rXjFF6oGVhJjC/LQAdO1FsjQGxGTyHhG3BqtCALjleEGNJqtcBiC
	RyRO6ipq41ORB6QhTs09ooCXYvDIt20nqjLPpKCMR+uwPpu/aWiis/qKNacJnguycTohD/fQczK
	2bPcLn8seDDG1K/qq6BwRZGK4abgH7izunbAHfLGhui1oiFyuRneZekP7Ds64qrmRaNZKm9QlUv
	QSQ9hhkkr+P9y7vViQA6wHQ3rJRP9VmQiZq4PVU03FOhGB3ENN87kSg/+UdNBLcsMcvJqJuOFU/
	UxN2IgZvWdhof3Yd2qJqhjFR/cBn5DGcH5+kvICQ2kfIPJHhsVT6KZlgtaOaHSrxEyYncC+0mqP
	T8R9zJg6vL0CD1mVSs9CF/fr7qMAp701iIUo66V2qnLGp+9k4p/IsyD3OC3P1RO9/sWzfZrBEt7
	9zdZmclSPjO+Ogl00mYdH8PkVG8px6rZMkzVGzNEfHhskMcivqR2TzZT0wefyXoRoVCbPjg5Q==
X-Received: by 2002:a05:6000:29d5:b0:48c:4f83:f432 with SMTP id ffacd0b85a97d-48dbaae70b9mr7279617f8f.35.1791708093476;
        Sun, 11 Oct 2026 01:41:33 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 51/60] go: upgrade 1.26.8 -> 1.26.9
Date: Sun, 11 Oct 2026 10:40:24 +0200
Message-ID: <46dc7844b2df99b65b1e84b421273538aa1148b3.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247560

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index 7fa02ad7100..e2657cf8ad8 100644
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
index 1865c700fd4..a42ce443604 100644
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
index 077bebe743b..cd61571e2c7 100644
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
index 0b5026fc123..f7f4dbead93 100644
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
index 9aebc2f0dc3..70e16a1d57c 100644
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
index 2598a7b34a9..a620a9cb637 100644
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

