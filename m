Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6376C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 15:53:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.19213.1740758018820023363
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 07:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SbxzcLMt;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43989226283so15410355e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 07:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740758017; x=1741362817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFCZuegU2+bbZ6Nh5Rl+otdgM0d6qTH03DmZ6NiBv58=;
        b=SbxzcLMtd53ff0Splv00X45Shz8125LSBszVe+64PiUCfqAm2B/ygJhixl1e29U533
         BFpBkIbn8QXNkSIto8Vkp4O8HXU4FL2iR359y9VEIsEBXDT0s9NQqBhNOVPgWQAqosq+
         m90QdQs4Jw+LGJUhtp6fQBGi5newbiIGMtBJI/VL/28icrvLur7xJQkc6hjZb6vG/Z1w
         7fhdT2sb4fmuNnWtf0ceU0RRDRLyco86krhN2xQCf0F2HBkBqNYQzS8LDZKXH3DgAL2Q
         6WymT6eqJhKXX1VtUzHAZB8j4aDS/24OyRcixC0838JEegvEzsYpEgwjShPHtMHgbjxH
         8xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758017; x=1741362817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFCZuegU2+bbZ6Nh5Rl+otdgM0d6qTH03DmZ6NiBv58=;
        b=DoO79C5E0oqTC9T+NLs3QWTSNhWqupytELFoqcMcusctSZT2dW5Taxi2pKQ18+3dmv
         KCQkH6ASjowckj5HHsNuq+uMuTPcFIUJNzORhnrBZ3rn+Hnel31nqntxKXtHepTfMoPO
         /yt9zyXWooktFjt9LogzaRMIXn65zgTdquwwxqD4h2k9TLyV+YyhlhzY6Enp7RMjWnUr
         46n0SyubPluTrC2XfSYcllXJtzMPallb5K+YhmnQrQ5DK6iR6n87FGlaWGAhm016CFbn
         TAOPtlFn/2h9cKqUjCm2RawkZ82uBOJxVayZElSjHidN8giQeYBuXD90+wFJNuDz+/q/
         +2Og==
X-Gm-Message-State: AOJu0YxxBv8E50IjWBUFOFN+fE9qOmXPegWoz0jgSNN3CP0CU4Rdi5QT
	3vc0VhgS/fBx2M0/djrxqPcrnQg8seUskifgHqB7dvQ1WltkAjcP9DMVfQ==
X-Gm-Gg: ASbGnctkFpIAEK8e3PGpWulTlhBI5qYQlD+zCJTTvxii6bRa5TOT0f+GFqNhtcfxejo
	rlqGDBooTNMgMarLMoTyRJrPf/r+8Px2tTWBM8hoAaEcrivRH/2NVJx3EhXUfieSMeQb8Grwpde
	Xteb4zRJ2/qn88Z0JdiGrbJjdwVUJwLJjdE8x1djTiAtlkzGnFenYLdQO3IC263FnHqkwstcqWJ
	oNoJKlghIZdBHkKmbVn8qGI6JLgXMOJXJUeWMVgZuYJInqNZuRPjNETWim//l5g2NLwWmRsRvEh
	T1mHTdKl1otohILPER9pQjBUmsHzcBbuHOc=
X-Google-Smtp-Source: AGHT+IE2Vn2l7X0EEMnxoxvoyzl0LwVC8SoQm4hi8RpJ0bhh4ML9eHU3I3DppNMyxw4pz95yDL5Mpg==
X-Received: by 2002:a05:600c:3b0d:b0:439:88bb:d02d with SMTP id 5b1f17b1804b1-43ba66da7eemr30911815e9.2.1740758016427;
        Fri, 28 Feb 2025 07:53:36 -0800 (PST)
Received: from toster.lan ([185.228.162.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e48445c5sm5564717f8f.78.2025.02.28.07.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:53:35 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [RFC OE-core][PATCH 4/4] go: bump 1.24.0
Date: Fri, 28 Feb 2025 15:52:59 +0000
Message-ID: <20250228155301.1033479-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228155301.1033479-1-jose.quaresma@foundries.io>
References: <20250228155301.1033479-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 15:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212068

Go 1.24 Release Notes
https://go.dev/doc/go1.24

- LICENSE: update per Google Legal
https://github.com/golang/go/commit/760b722c344d312ab62a5c2f94865a869ce0bab9

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.23.6.inc => go-1.24.0.inc}       |  6 ++--
 ...e_1.23.6.bb => go-binary-native_1.24.0.bb} |  8 ++---
 ..._1.23.6.bb => go-cross-canadian_1.24.0.bb} |  0
 ...{go-cross_1.23.6.bb => go-cross_1.24.0.bb} |  0
 ...osssdk_1.23.6.bb => go-crosssdk_1.24.0.bb} |  0
 ...runtime_1.23.6.bb => go-runtime_1.24.0.bb} |  0
 ...ent-based-hash-generation-less-pedan.patch | 31 +++++++++---------
 ...OOLDIR-to-be-overridden-in-the-envir.patch | 14 ++++----
 ...3-ld-add-soname-to-shareable-objects.patch | 14 ++++----
 ...de-CC-when-building-dist-and-go_boot.patch | 12 +++----
 ...dist-separate-host-and-target-builds.patch | 32 +++++++++----------
 ...d-go-make-GOROOT-precious-by-default.patch | 22 ++++++-------
 ...ut-build-specific-paths-from-linker-.patch | 12 +++----
 ...ldgo.go-do-not-hardcode-host-compile.patch |  8 ++---
 ...uild-paths-on-staticly-linked-arches.patch | 14 ++++----
 ...cing-binutils-gold-dependency-on-aa.patch} | 19 +++++++----
 .../go/{go_1.23.6.bb => go_1.24.0.bb}         |  0
 18 files changed, 101 insertions(+), 93 deletions(-)
 rename meta/recipes-devtools/go/{go-1.23.6.inc => go-1.24.0.inc} (75%)
 rename meta/recipes-devtools/go/{go-binary-native_1.23.6.bb => go-binary-native_1.24.0.bb} (73%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.23.6.bb => go-cross-canadian_1.24.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.23.6.bb => go-cross_1.24.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.23.6.bb => go-crosssdk_1.24.0.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.23.6.bb => go-runtime_1.24.0.bb} (100%)
 rename meta/recipes-devtools/go/go/{6d265b008e3d106b2706645e5a88cd8e2fb98953.patch => 0010-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch} (76%)
 rename meta/recipes-devtools/go/{go_1.23.6.bb => go_1.24.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 95fcb986fb..d719b14b26 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GDBVERSION ?= "16.%"
 GLIBCVERSION ?= "2.41%"
 LINUXLIBCVERSION ?= "6.12%"
 QEMUVERSION ?= "9.2%"
-GOVERSION ?= "1.23%"
+GOVERSION ?= "1.24%"
 RUSTVERSION ?= "1.82%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/go/go-1.23.6.inc b/meta/recipes-devtools/go/go-1.24.0.inc
similarity index 75%
rename from meta/recipes-devtools/go/go-1.23.6.inc
rename to meta/recipes-devtools/go/go-1.24.0.inc
index b54fffc8b5..511211aa67 100644
--- a/meta/recipes-devtools/go/go-1.23.6.inc
+++ b/meta/recipes-devtools/go/go-1.24.0.inc
@@ -2,7 +2,7 @@ require go-common.inc
 
 FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7998cb338f82d15c0eff93b7004d272a"
 
 SRC_URI += "\
     file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
@@ -14,6 +14,6 @@ SRC_URI += "\
     file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
-    file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
+    file://0010-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
 "
-SRC_URI[main.sha256sum] = "039c5b04e65279daceee8a6f71e70bd05cf5b801782b6f77c6e19e2ed0511222"
+SRC_URI[main.sha256sum] = "d14120614acb29d12bcab72bd689f257eb4be9e0b6f88a8fb7e41ac65f8556e5"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.23.6.bb b/meta/recipes-devtools/go/go-binary-native_1.24.0.bb
similarity index 73%
rename from meta/recipes-devtools/go/go-binary-native_1.23.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.0.bb
index a29bf533ed..d9eebb9c37 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.23.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.0.bb
@@ -3,15 +3,15 @@
 SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
 HOMEPAGE = " http://golang.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7998cb338f82d15c0eff93b7004d272a"
 
 PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9379441ea310de000f33a4dc767bd966e72ab2826270e038e78b2c53c2e7802d"
-SRC_URI[go_linux_arm64.sha256sum] = "561c780e8f4a8955d32bf72e46af0b5ee5e0debe1e4633df9a03781878219202"
-SRC_URI[go_linux_ppc64le.sha256sum] = "0f817201e83d78ddbfa27f5f78d9b72450b92cc21d5e045145efacd0d3244a99"
+SRC_URI[go_linux_amd64.sha256sum] = "dea9ca38a0b852a74e81c26134671af7c0fbe65d81b0dc1c5bfe22cf7d4c8858"
+SRC_URI[go_linux_arm64.sha256sum] = "c3fa6d16ffa261091a5617145553c71d21435ce547e44cc6dfb7470865527cc7"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a871a43de7d26c91dd90cb6e0adacb214c9e35ee2188c617c91c08c017efe81a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.23.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.23.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.0.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.23.6.bb b/meta/recipes-devtools/go/go-cross_1.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.23.6.bb
rename to meta/recipes-devtools/go/go-cross_1.24.0.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.23.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.23.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.0.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.23.6.bb b/meta/recipes-devtools/go/go-runtime_1.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.23.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.0.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 1608a6cee5..df84dffea3 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,7 +1,8 @@
-From 1379e6ab70d2df8a1d9188db03b33fbd7ee5bf28 Mon Sep 17 00:00:00 2001
+From 344b4b92971c2e7883bdc78bb36a9035cf75572c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
-Subject: [PATCH 1/9] cmd/go: make content-based hash generation less pedantic
+Subject: [PATCH 01/10] cmd/go: make content-based hash generation less
+ pedantic
 
 Go 1.10's build tool now uses content-based hashes to
 determine when something should be built or re-built.
@@ -32,10 +33,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 36 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index f19577c4df..08ea33db60 100644
+index 7c370d4..c2441f7 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
-@@ -214,7 +214,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
+@@ -219,7 +219,7 @@ func ExtraEnvVarsCostly() []cfg.EnvVar {
  		}
  	}()
  
@@ -45,10 +46,10 @@ index f19577c4df..08ea33db60 100644
  		// Should not happen - b.CFlags was given an empty package.
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index c4852d82ae..ce82b9759b 100644
+index 7b07316..1f618be 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -233,6 +233,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
+@@ -237,6 +237,8 @@ func (b *Builder) Do(ctx context.Context, root *Action) {
  	writeActionGraph()
  }
  
@@ -57,7 +58,7 @@ index c4852d82ae..ce82b9759b 100644
  // buildActionID computes the action ID for a build action.
  func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	p := a.Package
-@@ -254,7 +256,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -258,7 +260,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		if p.Module != nil {
  			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
  		}
@@ -66,7 +67,7 @@ index c4852d82ae..ce82b9759b 100644
  		// The Go compiler always hides the exact value of $GOROOT
  		// when building things in GOROOT.
  		//
-@@ -289,9 +291,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -293,9 +295,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -78,7 +79,7 @@ index c4852d82ae..ce82b9759b 100644
  		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
  		// Include the C compiler tool ID so that if the C
  		// compiler changes we rebuild the package.
-@@ -299,14 +301,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -303,14 +305,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  			fmt.Fprintf(h, "CC ID=%q\n", ccID)
  		}
  		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
@@ -95,7 +96,7 @@ index c4852d82ae..ce82b9759b 100644
  			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
  			if fcID, _, err := b.gccToolID(fcExe[0], "f95"); err == nil {
  				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -323,7 +325,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+@@ -327,7 +329,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
  		}
  	}
  	if p.Internal.BuildInfo != nil {
@@ -104,7 +105,7 @@ index c4852d82ae..ce82b9759b 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2700,8 +2702,25 @@ func envList(key, def string) []string {
+@@ -2659,8 +2661,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -131,7 +132,7 @@ index c4852d82ae..ce82b9759b 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2717,6 +2736,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2676,6 +2695,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", DefaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -145,7 +146,7 @@ index c4852d82ae..ce82b9759b 100644
  
  	return
  }
-@@ -2734,7 +2760,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+@@ -2693,7 +2719,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
  	p := a.Package
  	sh := b.Shell(a)
  
@@ -154,7 +155,7 @@ index c4852d82ae..ce82b9759b 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3296,7 +3322,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+@@ -3256,7 +3282,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
  	p := a.Package
  	sh := b.Shell(a)
  
@@ -164,5 +165,5 @@ index c4852d82ae..ce82b9759b 100644
  		return "", "", err
  	}
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
index f1cf03a8ab..e17dc1301c 100644
--- a/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
+++ b/meta/recipes-devtools/go/go/0002-cmd-go-Allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -1,7 +1,7 @@
-From ff9aced9ed900ab6178821ac59cca0d91a664aa6 Mon Sep 17 00:00:00 2001
+From 99c8d1c4c0bfe89e5df63b06449e7fb31253ebbc Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:15:37 +0430
-Subject: [PATCH 2/9] cmd/go: Allow GOTOOLDIR to be overridden in the
+Subject: [PATCH 02/10] cmd/go: Allow GOTOOLDIR to be overridden in the
  environment
 
 to allow for split host/target build roots
@@ -20,10 +20,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  2 files changed, 8 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index c033beabdb..c35654f674 100644
+index 1f46764..b62e518 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -267,7 +267,9 @@ func xinit() {
+@@ -280,7 +280,9 @@ func xinit() {
  	}
  	xatexit(rmworkdir)
  
@@ -35,10 +35,10 @@ index c033beabdb..c35654f674 100644
  	goversion := findgoversion()
  	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
 diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index 3715a19a96..06788be6ca 100644
+index 3b9f27e..ec043c1 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -234,7 +234,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
+@@ -248,7 +248,11 @@ func SetGOROOT(goroot string, isTestGo bool) {
  			// This matches the initialization of ToolDir in go/build, except for
  			// using ctxt.GOROOT and the installed GOOS and GOARCH rather than the
  			// GOROOT, GOOS, and GOARCH reported by the runtime package.
@@ -52,5 +52,5 @@ index 3715a19a96..06788be6ca 100644
  	}
  }
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
index 5e00e54fa7..a1be396af7 100644
--- a/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go/0003-ld-add-soname-to-shareable-objects.patch
@@ -1,7 +1,7 @@
-From 527297e9c1b5a0c515620078039a37104281e7b7 Mon Sep 17 00:00:00 2001
+From 9f0187f3393f6d246a4e8d6ef187375447555fcd Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:16:32 +0430
-Subject: [PATCH 3/9] ld: add soname to shareable objects
+Subject: [PATCH 03/10] ld: add soname to shareable objects
 
 so that OE's shared library dependency handling
 can find them.
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index d66027387b..6ca7f5e19f 100644
+index 2d8f964..dfc72e0 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1611,6 +1611,7 @@ func (ctxt *Link) hostlink() {
+@@ -1624,6 +1624,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -30,7 +30,7 @@ index d66027387b..6ca7f5e19f 100644
  			if ctxt.HeadType == objabi.Hwindows {
  				argv = addASLRargs(argv, *flagAslr)
  			} else {
-@@ -1626,6 +1627,7 @@ func (ctxt *Link) hostlink() {
+@@ -1639,6 +1640,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -38,7 +38,7 @@ index d66027387b..6ca7f5e19f 100644
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1634,6 +1636,7 @@ func (ctxt *Link) hostlink() {
+@@ -1647,6 +1649,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -47,5 +47,5 @@ index d66027387b..6ca7f5e19f 100644
  	}
  
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 7681b3f1eb..765be78d64 100644
--- a/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go/0004-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -1,7 +1,7 @@
-From 9e7758ac824bc96d8e3a0c99d1864102a3565c79 Mon Sep 17 00:00:00 2001
+From 5dcf219e13c514ea54653fd6cd9053e78dc3fcf8 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:17:16 +0430
-Subject: [PATCH 4/9] make.bash: override CC when building dist and
+Subject: [PATCH 04/10] make.bash: override CC when building dist and
  go_bootstrap
 
 for handling OE cross-canadian builds.
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/make.bash b/src/make.bash
-index 814b7e87e1..f17493ec0b 100755
+index b67ae15..3496ff3 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -160,6 +160,7 @@ fi
+@@ -153,6 +153,7 @@ fi
  export GOROOT_BOOTSTRAP
  
  bootstrapenv() {
@@ -30,7 +30,7 @@ index 814b7e87e1..f17493ec0b 100755
  	GOROOT="$GOROOT_BOOTSTRAP" GO111MODULE=off GOENV=off GOOS= GOARCH= GOEXPERIMENT= GOFLAGS= "$@"
  }
  
-@@ -223,6 +224,7 @@ fi
+@@ -216,6 +217,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with the bootstrap toolchain, away after bootstrap.
@@ -39,5 +39,5 @@ index 814b7e87e1..f17493ec0b 100755
  rm -f ./cmd/dist/dist
  
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index 0ca7da2d0e..d27d55535b 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -1,7 +1,7 @@
-From 5f832dafcb179b8692af4c71c56f10def171debd Mon Sep 17 00:00:00 2001
+From 78e63c58b7fbabcb0c4e70c43f2b16266c4b984b Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:12 +0430
-Subject: [PATCH 5/9] cmd/dist: separate host and target builds
+Subject: [PATCH 05/10] cmd/dist: separate host and target builds
 
 Change the dist tool to allow for OE-style cross-
 and cross-canadian builds:
@@ -45,18 +45,18 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 75 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index c35654f674..12344c139a 100644
+index b62e518..0c54d82 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -47,6 +47,7 @@ var (
- 	goexperiment     string
+@@ -49,6 +49,7 @@ var (
+ 	gofips140        string
  	workdir          string
  	tooldir          string
 +	build_tooldir    string
  	oldgoos          string
  	oldgoarch        string
  	oldgocache       string
-@@ -59,6 +60,7 @@ var (
+@@ -61,6 +62,7 @@ var (
  	rebuildall bool
  	noOpt      bool
  	isRelease  bool
@@ -64,7 +64,7 @@ index c35654f674..12344c139a 100644
  
  	vflag int // verbosity
  )
-@@ -273,6 +275,8 @@ func xinit() {
+@@ -286,6 +288,8 @@ func xinit() {
  
  	goversion := findgoversion()
  	isRelease = strings.HasPrefix(goversion, "release.") || strings.HasPrefix(goversion, "go")
@@ -73,7 +73,7 @@ index c35654f674..12344c139a 100644
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -507,8 +511,10 @@ func setup() {
+@@ -547,8 +551,10 @@ func setup() {
  	goosGoarch := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(goosGoarch)
@@ -84,7 +84,7 @@ index c35654f674..12344c139a 100644
  	xatexit(func() {
  		if files := xreaddir(goosGoarch); len(files) == 0 {
  			xremove(goosGoarch)
-@@ -1370,14 +1376,20 @@ func cmdbootstrap() {
+@@ -1411,14 +1417,20 @@ func cmdbootstrap() {
  	defer timelog("end", "dist bootstrap")
  
  	var debug, distpack, force, noBanner, noClean bool
@@ -106,7 +106,7 @@ index c35654f674..12344c139a 100644
  
  	if noClean {
  		xprintf("warning: --no-clean is deprecated and has no effect; use 'go install std cmd' instead\n")
-@@ -1389,6 +1401,18 @@ func cmdbootstrap() {
+@@ -1430,6 +1442,18 @@ func cmdbootstrap() {
  			"Use the -force flag to build anyway.\n", goos, goarch)
  	}
  
@@ -125,7 +125,7 @@ index c35654f674..12344c139a 100644
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1472,9 +1496,14 @@ func cmdbootstrap() {
+@@ -1513,9 +1537,14 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -140,7 +140,7 @@ index c35654f674..12344c139a 100644
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	if debug {
  		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-@@ -1502,7 +1531,11 @@ func cmdbootstrap() {
+@@ -1543,7 +1572,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -152,7 +152,7 @@ index c35654f674..12344c139a 100644
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
  	// No need to enable PGO for toolchain2.
-@@ -1555,6 +1588,7 @@ func cmdbootstrap() {
+@@ -1596,6 +1629,7 @@ func cmdbootstrap() {
  		os.Setenv("GOCACHE", oldgocache)
  	}
  
@@ -160,7 +160,7 @@ index c35654f674..12344c139a 100644
  	if goos == oldgoos && goarch == oldgoarch {
  		// Common case - not setting up for cross-compilation.
  		timelog("build", "toolchain")
-@@ -1598,6 +1632,42 @@ func cmdbootstrap() {
+@@ -1639,6 +1673,42 @@ func cmdbootstrap() {
  		checkNotStale(toolenv(), goBootstrap, toolchain...)
  		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
  	}
@@ -203,7 +203,7 @@ index c35654f674..12344c139a 100644
  
  	// Check that there are no new files in $GOROOT/bin other than
  	// go and gofmt and $GOOS_$GOARCH (target bin when cross-compiling).
-@@ -1620,8 +1690,12 @@ func cmdbootstrap() {
+@@ -1661,8 +1731,12 @@ func cmdbootstrap() {
  		}
  	}
  
@@ -217,5 +217,5 @@ index c35654f674..12344c139a 100644
  	if goos == "android" {
  		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 58c13adeea..e9ae36f229 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -1,7 +1,7 @@
-From b77b6b043feca62f06ff12de0f5c427bb1e75faa Mon Sep 17 00:00:00 2001
+From e7f1c50f245cf0b81e2cf327a942a51a6b2ad431 Mon Sep 17 00:00:00 2001
 From: Alex Kube <alexander.j.kube@gmail.com>
 Date: Wed, 23 Oct 2019 21:18:56 +0430
-Subject: [PATCH 6/9] cmd/go: make GOROOT precious by default
+Subject: [PATCH 06/10] cmd/go: make GOROOT precious by default
 
 The go build tool normally rebuilds whatever it detects is
 stale.  This can be a problem when GOROOT is intended to
@@ -29,10 +29,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  3 files changed, 34 insertions(+)
 
 diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
-index 5e83f1ebfd..712e1322a9 100644
+index 44bb9f8..87ac4e3 100644
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -832,6 +832,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
+@@ -837,6 +837,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -43,10 +43,10 @@ index 5e83f1ebfd..712e1322a9 100644
  			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
  			// we'll end up building an overall library or executable that depends at runtime
 diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
-index ccfb4622e2..ff907db9aa 100644
+index 3508d51..77f5e72 100644
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -233,6 +233,8 @@ See also: go install, go get, go clean.
+@@ -238,6 +238,8 @@ See also: go install, go get, go clean.
  
  const concurrentGCBackendCompilationEnabledByDefault = true
  
@@ -55,7 +55,7 @@ index ccfb4622e2..ff907db9aa 100644
  func init() {
  	// break init cycle
  	CmdBuild.Run = runBuild
-@@ -246,6 +248,10 @@ func init() {
+@@ -251,6 +253,10 @@ func init() {
  		AddCoverFlags(CmdBuild, nil)
  		AddCoverFlags(CmdInstall, nil)
  	}
@@ -67,10 +67,10 @@ index ccfb4622e2..ff907db9aa 100644
  
  // Note that flags consulted by other parts of the code
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index ce82b9759b..6e0900c590 100644
+index 1f618be..651fa64 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -548,6 +548,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
+@@ -552,6 +552,23 @@ func (b *Builder) build(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -94,7 +94,7 @@ index ce82b9759b..6e0900c590 100644
  	if err := sh.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1758,6 +1775,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1747,6 +1764,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
@@ -110,5 +110,5 @@ index ce82b9759b..6e0900c590 100644
  		return err
  	}
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
index c5ae7400e3..97cf2fbf33 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -1,7 +1,7 @@
-From 1a5bbeabe745700d7af192ed9b4d3ade78e26fc7 Mon Sep 17 00:00:00 2001
+From 505435e898968ff322b089079505d64918dedb54 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Feb 2024 18:06:51 +0800
-Subject: [PATCH 7/9] exec.go: filter out build-specific paths from linker
+Subject: [PATCH 07/10] exec.go: filter out build-specific paths from linker
  flags
 
 The flags can contain build-specific paths, breaking reproducibility.
@@ -16,10 +16,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 24 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 6e0900c590..5dbb6e0eaf 100644
+index 651fa64..586079a 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1422,6 +1422,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1426,6 +1426,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	return h.Sum()
  }
  
@@ -49,7 +49,7 @@ index 6e0900c590..5dbb6e0eaf 100644
  // printLinkerConfig prints the linker config into the hash h,
  // as part of the computation of a linker-related action ID.
  func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
-@@ -1432,7 +1455,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+@@ -1436,7 +1459,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
  	case "gc":
  		fmt.Fprintf(h, "link %s %q %s\n", b.toolID("link"), forcedLdflags, ldBuildmode)
  		if p != nil {
@@ -59,5 +59,5 @@ index 6e0900c590..5dbb6e0eaf 100644
  
  		// GOARM, GOMIPS, etc.
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index 42731e0758..98d14c60ec 100644
--- a/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go/0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -1,7 +1,7 @@
-From 356ea4240b0b8aaf9cf469fcdbac69cb51259fc6 Mon Sep 17 00:00:00 2001
+From 325c2537eb4eff5f5708d5d27ebd77a011a01861 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 16:33:27 +0000
-Subject: [PATCH 8/9] src/cmd/dist/buildgo.go: do not hardcode host compilers
+Subject: [PATCH 08/10] src/cmd/dist/buildgo.go: do not hardcode host compilers
  into target binaries
 
 These come from $CC/$CXX on the build host and are not useful on targets;
@@ -16,7 +16,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
-index 884e9d729a..2f52edacfe 100644
+index 884e9d7..2f52eda 100644
 --- a/src/cmd/dist/buildgo.go
 +++ b/src/cmd/dist/buildgo.go
 @@ -51,8 +51,8 @@ func mkzdefaultcc(dir, file string) {
@@ -42,5 +42,5 @@ index 884e9d729a..2f52edacfe 100644
  }
  
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
index 1f69abee40..175c2d5341 100644
--- a/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
+++ b/meta/recipes-devtools/go/go/0009-go-Filter-build-paths-on-staticly-linked-arches.patch
@@ -1,7 +1,7 @@
-From 9d4164bd96e2862b15796020e25d41766044263b Mon Sep 17 00:00:00 2001
+From ab0ac264b38baea17047f36904b0cb246e1a7ef1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 2 Jul 2022 23:08:13 +0100
-Subject: [PATCH 9/9] go: Filter build paths on staticly linked arches
+Subject: [PATCH 09/10] go: Filter build paths on staticly linked arches
 
 Filter out build time paths from ldflags and other flags variables when they're
 embedded in the go binary so that builds are reproducible regardless of build
@@ -17,10 +17,10 @@ Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
  1 file changed, 13 insertions(+), 2 deletions(-)
 
 diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
-index 7c402b419e..0eb3c5229d 100644
+index 15f6b2e..47c5b86 100644
 --- a/src/cmd/go/internal/load/pkg.go
 +++ b/src/cmd/go/internal/load/pkg.go
-@@ -2229,6 +2229,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
+@@ -2291,6 +2291,17 @@ func appendBuildSetting(info *debug.BuildInfo, key, value string) {
  	info.Settings = append(info.Settings, debug.BuildSetting{Key: key, Value: value})
  }
  
@@ -38,7 +38,7 @@ index 7c402b419e..0eb3c5229d 100644
  // setBuildInfo gathers build information and sets it into
  // p.Internal.BuildInfo, which will later be formatted as a string and embedded
  // in the binary. setBuildInfo should only be called on a main package with no
-@@ -2336,7 +2347,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+@@ -2398,7 +2409,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	if gcflags := BuildGcflags.String(); gcflags != "" && cfg.BuildContext.Compiler == "gc" {
  		appendSetting("-gcflags", gcflags)
  	}
@@ -47,7 +47,7 @@ index 7c402b419e..0eb3c5229d 100644
  		// https://go.dev/issue/52372: only include ldflags if -trimpath is not set,
  		// since it can include system paths through various linker flags (notably
  		// -extar, -extld, and -extldflags).
-@@ -2382,7 +2393,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
+@@ -2444,7 +2455,7 @@ func (p *Package) setBuildInfo(ctx context.Context, autoVCS bool) {
  	// subset of flags that are known not to be paths?
  	if cfg.BuildContext.CgoEnabled && !cfg.BuildTrimpath {
  		for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
@@ -57,5 +57,5 @@ index 7c402b419e..0eb3c5229d 100644
  	}
  	appendSetting("GOARCH", cfg.BuildContext.GOARCH)
 -- 
-2.45.2
+2.48.1
 
diff --git a/meta/recipes-devtools/go/go/6d265b008e3d106b2706645e5a88cd8e2fb98953.patch b/meta/recipes-devtools/go/go/0010-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch
similarity index 76%
rename from meta/recipes-devtools/go/go/6d265b008e3d106b2706645e5a88cd8e2fb98953.patch
rename to meta/recipes-devtools/go/go/0010-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch
index d858cc6408..05d45372d3 100644
--- a/meta/recipes-devtools/go/go/6d265b008e3d106b2706645e5a88cd8e2fb98953.patch
+++ b/meta/recipes-devtools/go/go/0010-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch
@@ -1,7 +1,8 @@
-From 6d265b008e3d106b2706645e5a88cd8e2fb98953 Mon Sep 17 00:00:00 2001
-From: Dirk Müller <dirk@dmllr.de>
-Date: Wed, 09 Mar 2022 17:47:23 +0100
-Subject: [PATCH] cmd/link: stop forcing binutils-gold dependency on aarch64
+From aa976e4cccc329294b952cd8648a84f5e240e424 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dirk=20M=C3=BCller?= <dirk@dmllr.de>
+Date: Wed, 9 Mar 2022 17:47:23 +0100
+Subject: [PATCH 10/10] cmd/link: stop forcing binutils-gold dependency on
+ aarch64
 
 The bfd linker appears to be working just fine at least in version
 2.41 or above. Reject the known broken one instead, which
@@ -13,13 +14,16 @@ Fixes #22040.
 Change-Id: I9f377e47c22ef20497479c0978c053ed5de46a38
 
 Upstream-Status: Submitted [https://go-review.googlesource.com/c/go/+/391115]
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
 ---
+ src/cmd/link/internal/ld/lib.go | 21 ---------------------
+ 1 file changed, 21 deletions(-)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 2d8f964..fcf0bc7 100644
+index dfc72e0..2a2a304 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1670,27 +1670,6 @@
+@@ -1673,27 +1673,6 @@ func (ctxt *Link) hostlink() {
  			// Use lld to avoid errors from default linker (issue #38838)
  			altLinker = "lld"
  		}
@@ -47,3 +51,6 @@ index 2d8f964..fcf0bc7 100644
  	}
  	if ctxt.Arch.Family == sys.ARM64 && buildcfg.GOOS == "freebsd" {
  		// Switch to ld.bfd on freebsd/arm64.
+-- 
+2.48.1
+
diff --git a/meta/recipes-devtools/go/go_1.23.6.bb b/meta/recipes-devtools/go/go_1.24.0.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.23.6.bb
rename to meta/recipes-devtools/go/go_1.24.0.bb
-- 
2.48.1


