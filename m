Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA287C282D0
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 15:53:39 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.19211.1740758016058123851
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 07:53:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+Ws0c3G;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390e6ac844fso1989541f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 07:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740758014; x=1741362814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cJ9Ex0eEvAsB0jwiPj/Nk75ZZiigdTEPYIofr82AJA=;
        b=C+Ws0c3GRWy974TDqNDSrgaxozV//w+Onaq5FXxYHMlT+bjIS/R05C2sN1lxeqUiEN
         cPBP6++nXj3xYUiY6dkvRLBGwk6tXuzQebGLlhT6eG/tPR2gLvg9xczXD4gmOmVvkxOt
         wHz+P9Dr3WpEOjsKJc1Ybhvf2SWFruYh/Znyb7M2wRXwsfFGhnwt6Cm74pLtXQeRLg4p
         /yE27L9sSbIj9lbJCe9VNbCKvfJBe/vnbVvYVs9ADk1ywFV2qLh9VrJ9oD/Px15G3IJB
         Fm7k0BOkQTjo9+lGZaTY3YEaC/5yeopFw6YnoOsyBnPVJPHgUxMkX6u+jQJEGOTFZCNW
         3b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758014; x=1741362814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8cJ9Ex0eEvAsB0jwiPj/Nk75ZZiigdTEPYIofr82AJA=;
        b=mv3Ht9N5YX+JtTnICiNnNR8KYu2et5+NCoajQYNb2Pp+ZWZdQuDSTvOUAc3cnHX4YP
         bVliK7lgpaMndhYevSnOIjZv1fN1Wnt3KZDSuopYGyihLssqJFLxVI2Ukvl5S3Ry/MVP
         8Z89aed/a6+x9GnoPnuJTztfKedzsF9eSAx9bnlUyNwTx2Aezhfe+TJjxHFWlPvb6sGr
         hYsHlr9gAdiNvCloK5Nf9x+5PGvnhBE+Fc5hcUJ7oFFYsM9fWz6iNy/5zo0G3o++3qoL
         SlmPW+sSo7YMtFIq9Ok1SGh80jSqoSeWe5zqB1A/3Pt9oYVud8RzHXw4Gmn2ULy3IO7t
         VpsA==
X-Gm-Message-State: AOJu0YxZ4JDHZ4YIYn80vW8u6/eARwjY4WXCPJ5X/TKGpH7XWEKjF4BY
	PPMStAMCPan8YwXScPW1msPuZujG0YvILrWpls63qCJCXz4jghm6PxJ/FQ==
X-Gm-Gg: ASbGncslcx9Xnw8sxqOmL95xWycbBkc8X1Urkq2ptDxIH9O9QmELKzntL1B1+reMl3F
	scqGh9e7Qp5O8m6SoVJVGkcRg6v6AIqe7bZsMnBPCtbheJsxTWoC/d9gHPk9d8avw220zAhCpef
	sgNWiSGH1leYPNrgg9V1VwuXJcQz7NjuWI10qBUzPXF58TXuzWeZgqhZMY2BQLmI92w4BMWxSzC
	/YmpsInR40ChsZmsLGffD6ktQPLuqVtwrwsH8+RZpkgWeQ68UAEQlqxNq4Lea9Eg0Cexk3lmv0Z
	vAdLgzVZwWNsZQTknSfQq/Laqv1pfImL+aI=
X-Google-Smtp-Source: AGHT+IEOWGxseTho/+lP1iHDjsJ1cpLvfDlbJbEZB+txyEbmzZrnrCEQp+O6sxkBqQyil9pUwAH6iQ==
X-Received: by 2002:a05:6000:188c:b0:38d:e15e:17e1 with SMTP id ffacd0b85a97d-390ec7c6743mr3094517f8f.10.1740758013571;
        Fri, 28 Feb 2025 07:53:33 -0800 (PST)
Received: from toster.lan ([185.228.162.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e48445c5sm5564717f8f.78.2025.02.28.07.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:53:32 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 1/4] go: bump 1.23.0
Date: Fri, 28 Feb 2025 15:52:56 +0000
Message-ID: <20250228155301.1033479-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 15:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212065

Go 1.23 Release Notes
https://go.dev/doc/go1.23

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/classes-recipe/go.bbclass                |  1 -
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.22.12.inc => go-1.23.0.inc}      |  2 +-
 ..._1.22.12.bb => go-binary-native_1.23.0.bb} |  6 ++--
 meta/recipes-devtools/go/go-common.inc        |  1 -
 ...1.22.12.bb => go-cross-canadian_1.23.0.bb} |  0
 ...go-cross_1.22.12.bb => go-cross_1.23.0.bb} |  0
 ...sssdk_1.22.12.bb => go-crosssdk_1.23.0.bb} |  0
 ...untime_1.22.12.bb => go-runtime_1.23.0.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch | 33 +++++++++--------
 ...OOLDIR-to-be-overridden-in-the-envir.patch | 16 +++++----
 ...3-ld-add-soname-to-shareable-objects.patch | 15 ++++----
 ...de-CC-when-building-dist-and-go_boot.patch | 36 ++++++++++---------
 ...dist-separate-host-and-target-builds.patch | 31 ++++++++--------
 ...d-go-make-GOROOT-precious-by-default.patch | 19 +++++-----
 ...ut-build-specific-paths-from-linker-.patch | 14 +++++---
 ...ldgo.go-do-not-hardcode-host-compile.patch | 11 +++---
 ...uild-paths-on-staticly-linked-arches.patch | 15 ++++----
 .../go/{go_1.22.12.bb => go_1.23.0.bb}        |  0
 19 files changed, 114 insertions(+), 88 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.12.inc => go-1.23.0.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.12.bb => go-binary-native_1.23.0.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.12.bb => go-cross-canadian_1.23.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.12.bb => go-cross_1.23.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.12.bb => go-crosssdk_1.23.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.12.bb => go-runtime_1.23.0.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.12.bb => go_1.23.0.bb} (100%)

diff --git a/meta/classes-recipe/go.bbclass b/meta/classes-recipe/go.bbclass
index e3e4782025..c81d946069 100644
--- a/meta/classes-recipe/go.bbclass
+++ b/meta/classes-recipe/go.bbclass
@@ -15,7 +15,6 @@ GOROOT:class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT:class-nativesdk = "${STAGING_DIR_TARGET}${libdir}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
 export GOROOT
-export GOROOT_FINAL = "${libdir}/go"
 export GOCACHE = "${B}/.cache"
 
 export GOARCH = "${TARGET_GOARCH}"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 13f31d46de..95fcb986fb 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GDBVERSION ?= "16.%"
 GLIBCVERSION ?= "2.41%"
 LINUXLIBCVERSION ?= "6.12%"
 QEMUVERSION ?= "9.2%"
-GOVERSION ?= "1.22%"
+GOVERSION ?= "1.23%"
 RUSTVERSION ?= "1.82%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.23.0.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.22.12.inc
rename to meta/recipes-devtools/go/go-1.23.0.inc
index 8d14efa1e9..55e6174c67 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.23.0.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
+SRC_URI[main.sha256sum] = "42b7a8e80d805daa03022ed3fde4321d4c3bf2c990a144165d01eeecd6f699c6"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.23.0.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.12.bb
rename to meta/recipes-devtools/go/go-binary-native_1.23.0.bb
index 747737ff94..da27c1ae73 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.23.0.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "4fa4f869b0f7fc6bb1eb2660e74657fbf04cdd290b5aef905585c86051b34d43"
-SRC_URI[go_linux_arm64.sha256sum] = "fd017e647ec28525e86ae8203236e0653242722a7436929b1f775744e26278e7"
-SRC_URI[go_linux_ppc64le.sha256sum] = "9573d30003b0796717a99d9e2e96c48fddd4fc0f29d840f212c503b03d7de112"
+SRC_URI[go_linux_amd64.sha256sum] = "905a297f19ead44780548933e0ff1a1b86e8327bb459e92f9c0012569f76f5e3"
+SRC_URI[go_linux_arm64.sha256sum] = "62788056693009bcf7020eedc778cdd1781941c6145eab7688bd087bce0f8659"
+SRC_URI[go_linux_ppc64le.sha256sum] = "8b26e20d4d43a4d7641cddbdc0298d7ba3804d910a9e06cda7672970dbf2829d"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index db165792dc..ca8469dbd9 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -38,7 +38,6 @@ export GOARCH ?= "${TARGET_GOARCH}"
 export GOARM ?= "${TARGET_GOARM}"
 export GO386 ?= "${TARGET_GO386}"
 export GOMIPS ?= "${TARGET_GOMIPS}"
-export GOROOT_FINAL ?= "${libdir}/go"
 
 export GODEBUG = "gocachehash=1"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.12.bb b/meta/recipes-devtools/go/go-cross-canadian_1.23.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.12.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.23.0.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.12.bb b/meta/recipes-devtools/go/go-cross_1.23.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.12.bb
rename to meta/recipes-devtools/go/go-cross_1.23.0.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.12.bb b/meta/recipes-devtools/go/go-crosssdk_1.23.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.12.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.23.0.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.12.bb b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.12.bb
rename to meta/recipes-devtools/go/go-runtime_1.23.0.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index a8e5d6e86d..1608a6cee5 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,7 @@
-From 9b3ebef0356594a447906f00fe80584952c08289 Mon Sep 17 00:00:00 2001
+From 1379e6ab70d2df8a1d9188db03b33fbd7ee5bf28 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
-Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
+Subject: [PATCH 1/9] cmd/go: make content-based hash generation less pedantic
 
 Go 1.10's build tool now uses content-based hashes to
 determine when something should be built or re-built.
@@ -32,10 +32,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 36 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index c7c2e83..4a90d9d 100644
+index f19577c4df..08ea33db60 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -189,7 +189,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
+@@ -214,7 +214,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
  		}
  	}()
  
@@ -45,10 +45,10 @@ index c7c2e83..4a90d9d 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index e05471b..9724cd0 100644
+index c4852d82ae..ce82b9759b 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -232,6 +232,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
+@@ -233,6 +233,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
  	writeActionGraph()
  }
  
@@ -57,7 +57,7 @@ index e05471b..9724cd0 100644
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -253,7 +255,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -254,7 +256,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		if p.Module != nil {
  			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
  		}
@@ -66,7 +66,7 @@ index e05471b..9724cd0 100644
  		// The Go compiler always hides the exact value of $GOROOT
  		// when building things in GOROOT.
  		//
-@@ -285,9 +287,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -289,9 +291,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -78,7 +78,7 @@ index e05471b..9724cd0 100644
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
-@@ -295,14 +297,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -299,14 +301,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  			fmt.Fprintf(h, "CC ID=%q\n", ccID)
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
@@ -95,7 +95,7 @@ index e05471b..9724cd0 100644
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
  			if fcID, _, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -319,7 +321,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -323,7 +325,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		}
  	}
  	if p.Internal.BuildInfo != nil {
@@ -104,7 +104,7 @@ index e05471b..9724cd0 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2679,8 +2681,25 @@ func envList(key, def string) []string {
+@@ -2700,8 +2702,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -131,8 +131,8 @@ index e05471b..9724cd0 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2696,6 +2715,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
- 	if ldflags, err = buildFlags("LDFLAGS", defaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
+@@ -2717,6 +2736,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+ 	if ldflags, err = buildFlags("LDFLAGS", DefaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
 +	if filtered {
@@ -145,7 +145,7 @@ index e05471b..9724cd0 100644
  
  	return
  }
-@@ -2713,7 +2739,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+@@ -2734,7 +2760,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
  	p := a.Package
  	sh := b.Shell(a)
  
@@ -154,7 +154,7 @@ index e05471b..9724cd0 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3268,7 +3294,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+@@ -3296,7 +3322,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
  	p := a.Package
  	sh := b.Shell(a)
  
@@ -163,3 +163,6 @@ index e05471b..9724cd0 100644
  	if err != nil {
  		return "", "", err
  	}
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index a69ada47b0..f1cf03a8ab 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,7 +1,8 @@
-From 687ff9d17f756145f9a58413070cccbd488d1ea2 Mon Sep 17 00:00:00 2001
+From ff9aced9ed900ab6178821ac59cca0d91a664aa6 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
-Subject: [PATCH] cmd/go: Allow GOTOOLDIR to be overridden in the environment
+Subject: [PATCH 2/9] cmd/go: Allow GOTOOLDIR to be overridden in the
+ environment
 
 to allow for split host/target build roots
 
@@ -19,10 +20,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 32e59b4..06ee4de 100644
+index c033beabdb..c35654f674 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -259,7 +259,9 @@ func xinit() {
+@@ -267,7 +267,9 @@ func xinit() {
  	}
  	xatexit(rmworkdir)
  
@@ -34,10 +35,10 @@ index 32e59b4..06ee4de 100644
  	goversion := findgoversion()
  	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index a8daa2d..393ada3 100644
+index 3715a19a96..06788be6ca 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -230,7 +230,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
+@@ -234,7 +234,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
  			// This matches the initialization of ToolDir in go/build, except for
  			// using ctxt.GOROOT and the installed GOOS and GOARCH rather than the
  			// GOROOT, GOOS, and GOARCH reported by the runtime package.
@@ -50,3 +51,6 @@ index a8daa2d..393ada3 100644
  		}
  	}
  }
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index abc5faa21c..5e00e54fa7 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 01fe178b292db12d811811ff2d8d56b225e4b5e8 Mon Sep 17 00:00:00 2001
+From 527297e9c1b5a0c515620078039a37104281e7b7 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:16:32 +0430
-Subject: [PATCH] ld: add soname to shareable objects
+Subject: [PATCH 3/9] ld: add soname to shareable objects
 
 so that OE's shared library dependency handling
 can find them.
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index eab74dc..ae9bbc9 100644
+index d66027387b..6ca7f5e19f 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1576,6 +1576,7 @@ func (ctxt *Link) hostlink() {
+@@ -1611,6 +1611,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -30,7 +30,7 @@ index eab74dc..ae9bbc9 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1591,6 +1592,7 @@ func (ctxt *Link) hostlink() {
+@@ -1626,6 +1627,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -38,7 +38,7 @@ index eab74dc..ae9bbc9 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1599,6 +1601,7 @@ func (ctxt *Link) hostlink() {
+@@ -1634,6 +1636,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -46,3 +46,6 @@ index eab74dc..ae9bbc9 100644
  		}
  	}
  
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 9df43c46d0..7681b3f1eb 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,7 +1,8 @@
-From e47d157631d1b97403f253c63d361b7380b32c22 Mon Sep 17 00:00:00 2001
+From 9e7758ac824bc96d8e3a0c99d1864102a3565c79 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
-Subject: [PATCH] make.bash: override CC when building dist and go_bootstrap
+Subject: [PATCH 4/9] make.bash: override CC when building dist and
+ go_bootstrap
 
 for handling OE cross-canadian builds.
 
@@ -14,28 +15,29 @@ Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
- src/make.bash | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/make.bash | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/src/make.bash b/src/make.bash
-index 76ad516..074e129 100755
+index 814b7e87e1..f17493ec0b 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -198,7 +198,7 @@ if [[ "$GOROOT_BOOTSTRAP" == "$GOROOT" ]]; then
- 	exit 1
- fi
- rm -f cmd/dist/dist
--GOROOT="$GOROOT_BOOTSTRAP" nogoenv "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
-+CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" nogoenv "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
+@@ -160,6 +160,7 @@ fi
+ export GOROOT_BOOTSTRAP
  
- # -e doesn't propagate out of eval, so check success by hand.
- eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -223,7 +223,7 @@ fi
+ bootstrapenv() {
++	CC="${BUILD_CC:-${CC}}" \
+ 	GOROOT="$GOROOT_BOOTSTRAP" GO111MODULE=off GOENV=off GOOS= GOARCH= GOEXPERIMENT= GOFLAGS= "$@"
+ }
+ 
+@@ -223,6 +224,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with the bootstrap toolchain, away after bootstrap.
--./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
-+CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
++CC="${BUILD_CC:-${CC}}" \
+ ./cmd/dist/dist bootstrap -a $vflag $GO_DISTFLAGS "$@"
  rm -f ./cmd/dist/dist
  
- # DO NOT ADD ANY NEW CODE HERE.
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index bc25d08fbf..0ca7da2d0e 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From bae1cec790ff17c4c93a2f8fda27036e5e021f6d Mon Sep 17 00:00:00 2001
+From 5f832dafcb179b8692af4c71c56f10def171debd Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
-Subject: [PATCH] cmd/dist: separate host and target builds
+Subject: [PATCH 5/9] cmd/dist: separate host and target builds
 
 Change the dist tool to allow for OE-style cross-
 and cross-canadian builds:
@@ -45,10 +45,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 75 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 06ee4de..016b1dd 100644
+index c35654f674..12344c139a 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -46,6 +46,7 @@ var (
+@@ -47,6 +47,7 @@ var (
  	goexperiment     string
  	workdir          string
  	tooldir          string
@@ -56,7 +56,7 @@ index 06ee4de..016b1dd 100644
  	oldgoos          string
  	oldgoarch        string
  	oldgocache       string
-@@ -58,6 +59,7 @@ var (
+@@ -59,6 +60,7 @@ var (
  	rebuildall bool
  	noOpt      bool
  	isRelease  bool
@@ -64,7 +64,7 @@ index 06ee4de..016b1dd 100644
  
  	vflag int // verbosity
  )
-@@ -265,6 +267,8 @@ func xinit() {
+@@ -273,6 +275,8 @@ func xinit() {
  
  	goversion := findgoversion()
  	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
@@ -73,7 +73,7 @@ index 06ee4de..016b1dd 100644
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -499,8 +503,10 @@ func setup() {
+@@ -507,8 +511,10 @@ func setup() {
  	goosGoarch := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(goosGoarch)
@@ -84,7 +84,7 @@ index 06ee4de..016b1dd 100644
  	xatexit(func() {
  		if files := xreaddir(goosGoarch); len(files) == 0 {
  			xremove(goosGoarch)
-@@ -1338,14 +1344,20 @@ func cmdbootstrap() {
+@@ -1370,14 +1376,20 @@ func cmdbootstrap() {
  	defer timelog("end", "dist bootstrap")
  
  	var debug, distpack, force, noBanner, noClean bool
@@ -106,7 +106,7 @@ index 06ee4de..016b1dd 100644
  
  	if noClean {
  		xprintf("warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n")
-@@ -1357,6 +1369,18 @@ func cmdbootstrap() {
+@@ -1389,6 +1401,18 @@ func cmdbootstrap() {
  			"Use the -force flag to build anyway.\n", goos, goarch)
  	}
  
@@ -125,7 +125,7 @@ index 06ee4de..016b1dd 100644
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1434,9 +1458,14 @@ func cmdbootstrap() {
+@@ -1472,9 +1496,14 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -140,7 +140,7 @@ index 06ee4de..016b1dd 100644
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	if debug {
  		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-@@ -1464,7 +1493,11 @@ func cmdbootstrap() {
+@@ -1502,7 +1531,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -152,7 +152,7 @@ index 06ee4de..016b1dd 100644
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
  	// No need to enable PGO for toolchain2.
-@@ -1517,6 +1550,7 @@ func cmdbootstrap() {
+@@ -1555,6 +1588,7 @@ func cmdbootstrap() {
  		os.Setenv("GOCACHE", oldgocache)
  	}
  
@@ -160,7 +160,7 @@ index 06ee4de..016b1dd 100644
  	if goos == oldgoos && goarch == oldgoarch {
  		// Common case - not setting up for cross-compilation.
  		timelog("build", "toolchain")
-@@ -1560,6 +1594,42 @@ func cmdbootstrap() {
+@@ -1598,6 +1632,42 @@ func cmdbootstrap() {
  		checkNotStale(toolenv(), goBootstrap, toolchain...)
  		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
  	}
@@ -203,7 +203,7 @@ index 06ee4de..016b1dd 100644
  
  	// Check that there are no new files in $GOROOT/bin other than
  	// go and gofmt and $GOOS_$GOARCH (target bin when cross-compiling).
-@@ -1582,8 +1652,12 @@ func cmdbootstrap() {
+@@ -1620,8 +1690,12 @@ func cmdbootstrap() {
  		}
  	}
  
@@ -216,3 +216,6 @@ index 06ee4de..016b1dd 100644
  
  	if goos == "android" {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 4a57b07b7a..58c13adeea 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From a31db6f78d851741aea1e76132a84a24138a5bc6 Mon Sep 17 00:00:00 2001
+From b77b6b043feca62f06ff12de0f5c427bb1e75faa Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:56 +0430
-Subject: [PATCH] cmd/go: make GOROOT precious by default
+Subject: [PATCH 6/9] cmd/go: make GOROOT precious by default
 
 The go build tool normally rebuilds whatever it detects is
 stale.  This can be a problem when GOROOT is intended to
@@ -29,10 +29,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  3 files changed, 34 insertions(+)
 
 diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
-index a59072e..9e35ebd 100644
+index 5e83f1ebfd..712e1322a9 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -754,6 +754,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
+@@ -832,6 +832,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -43,7 +43,7 @@ index a59072e..9e35ebd 100644
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
 diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index 408edb5..3d60252 100644
+index ccfb4622e2..ff907db9aa 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
 @@ -233,6 +233,8 @@ See also: go install, go get, go clean.
@@ -67,10 +67,10 @@ index 408edb5..3d60252 100644
  
  // Note that flags consulted by other parts of the code
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 9724cd0..544df46 100644
+index ce82b9759b..6e0900c590 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -544,6 +544,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
+@@ -548,6 +548,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -94,7 +94,7 @@ index 9724cd0..544df46 100644
  	if err := sh.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1737,6 +1754,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1758,6 +1775,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -109,3 +109,6 @@ index 9724cd0..544df46 100644
  	if err := b.Shell(a).Mkdir(a.Objdir); err != nil {
  		return err
  	}
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
index 2fdd52974f..c5ae7400e3 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -1,7 +1,8 @@
-From 1097a07b097043e15fe29a85326dbd196401244a Mon Sep 17 00:00:00 2001
+From 1a5bbeabe745700d7af192ed9b4d3ade78e26fc7 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Feb 2024 18:06:51 +0800
-Subject: [PATCH] exec.go: filter out build-specific paths from linker flags
+Subject: [PATCH 7/9] exec.go: filter out build-specific paths from linker
+ flags
 
 The flags can contain build-specific paths, breaking reproducibility.
 Filter out options that have build-specific paths.
@@ -15,10 +16,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 24 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 544df46..c8f297c 100644
+index 6e0900c590..5dbb6e0eaf 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1401,6 +1401,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1422,6 +1422,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	return h.Sum()
  }
  
@@ -48,7 +49,7 @@ index 544df46..c8f297c 100644
  // printLinkerConfig prints the linker config into the hash h,
  // as part of the computation of a linker-related action ID.
  func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
-@@ -1411,7 +1434,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+@@ -1432,7 +1455,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
  	case "gc":
  		fmt.Fprintf(h, "link %s %q %s\n", b.toolID("link"), forcedLdflags, ldBuildmode)
  		if p != nil {
@@ -57,3 +58,6 @@ index 544df46..c8f297c 100644
  		}
  
  		// GOARM, GOMIPS, etc.
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index 4c1f0ca145..42731e0758 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,8 +1,8 @@
-From e5af6155f2d6e0758d11d6c12d6f47ea8e65b141 Mon Sep 17 00:00:00 2001
+From 356ea4240b0b8aaf9cf469fcdbac69cb51259fc6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 16:33:27 +0000
-Subject: [PATCH] src/cmd/dist/buildgo.go: do not hardcode host compilers into
- target binaries
+Subject: [PATCH 8/9] src/cmd/dist/buildgo.go: do not hardcode host compilers
+ into target binaries
 
 These come from $CC/$CXX on the build host and are not useful on targets;
 additionally as they contain host specific paths, this helps reproducibility.
@@ -16,7 +16,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
-index 884e9d7..2f52eda 100644
+index 884e9d729a..2f52edacfe 100644
 --- a/src/cmd/dist/buildgo.go
 +++ b/src/cmd/dist/buildgo.go
 @@ -51,8 +51,8 @@ func mkzdefaultcc(dir, file string) {
@@ -41,3 +41,6 @@ index 884e9d7..2f52eda 100644
  	writefile(buf.String(), file, writeSkipSame)
  }
  
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
index d939cb4716..1f69abee40 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 6bdd6405ce63c7aa4b35cd85833d03c7f1b9109a Mon Sep 17 00:00:00 2001
+From 9d4164bd96e2862b15796020e25d41766044263b Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 2 Jul 2022 23:08:13 +0100
-Subject: [PATCH] go: Filter build paths on staticly linked arches
+Subject: [PATCH 9/9] go: Filter build paths on staticly linked arches
 
 Filter out build time paths from ldflags and other flags variables when they're
 embedded in the go binary so that builds are reproducible regardless of build
@@ -17,10 +17,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index 1549800..f41fb2c 100644
+index 7c402b419e..0eb3c5229d 100644
 --- a/src/cmd/go/internal/load/pkg.go
 +++ b/src/cmd/go/internal/load/pkg.go
-@@ -2277,6 +2277,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
+@@ -2229,6 +2229,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
  	info.Settings = append(info.Settings, debug.BuildSetting{Key: key, Value: value})
  }
  
@@ -38,7 +38,7 @@ index 1549800..f41fb2c 100644
  // setBuildInfo gathers build information and sets it into
  // p.Internal.BuildInfo, which will later be formatted as a string and embedded
  // in the binary. setBuildInfo should only be called on a main package with no
-@@ -2384,7 +2395,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+@@ -2336,7 +2347,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	if gcflags := BuildGcflags.String(); gcflags != "" && cfg.BuildContext.Compiler == "gc" {
  		appendSetting("-gcflags", gcflags)
  	}
@@ -47,7 +47,7 @@ index 1549800..f41fb2c 100644
  		// https://go.dev/issue/52372: only include ldflags if -trimpath is not set,
  		// since it can include system paths through various linker flags (notably
  		// -extar, -extld, and -extldflags).
-@@ -2427,7 +2438,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+@@ -2382,7 +2393,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	// subset of flags that are known not to be paths?
  	if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
  		for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
@@ -56,3 +56,6 @@ index 1549800..f41fb2c 100644
  		}
  	}
  	appendSetting("GOARCH", cfg.BuildContext.GOARCH)
+-- 
+2.45.2
+
diff --git a/meta/recipes-devtools/go/go_1.22.12.bb b/meta/recipes-devtools/go/go_1.23.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.12.bb
rename to meta/recipes-devtools/go/go_1.23.0.bb
-- 
2.48.1


