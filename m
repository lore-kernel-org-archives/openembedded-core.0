Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.2660.1614140005262091592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 20:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c2BNqZbP;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id o10so641471pgg.4
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 20:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ejcGYtr6NyIej906lX3b4iRV5SnCvbP2J/eVKllivvU=;
        b=c2BNqZbPHEmvVuWw+p5ycKADf5vkQUT3S4O7B6c7r4dF4o1FXHoca/FyZ2axcV7OqC
         Amv9lBcpecH40dncC2pvqs1Uxjow2mpVHBK/jvgZYh1a4kxIq2+vPshqKHspI7Bv7g89
         hKhc1yn43b6Gvk+JvdhW9BvEQzXAV1MudG2befdiL4ZtSiDp8WfpXl7ldl1D/o05W99Z
         6qj5BomPPvARr74tryhllMZkffhxOcdc5xprlaVf0u7ydCvOWZtCmXgEXyIkeyLY4r0X
         IsGJutRVQpizYseSxK/wvj4xbk97GihrAWBXpyiUkGxUJSVFvU6mCExHPfInOvebsTCI
         9xlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ejcGYtr6NyIej906lX3b4iRV5SnCvbP2J/eVKllivvU=;
        b=YqCVYSvLnkCWjAjPm6LX8+/CcEmcEGjRbGCZC8BbzszY6l0fCZpPyBeNnG4yB8AKX5
         +3AtDMvVqhm5QRlekc33M573z6NouIyE6bkupGQ2D3rxd5BbJ0AgFjRiOokv12wXIeCH
         24sjYvZ7yheS6ZmgDZxFHdB1RVQ46YKT0fqyYeDbMRoU9BCoc5zd2JiJOxWHTQJLntXy
         hgPptkg9MCiFXaiyeG9+NmXlTVRZmRxlvs+3i74nKy7gW4QmMPLJIBCcZ/OSI6eI1Ah0
         P5mhgWTYdLIZd1BI8cBcpZFB/qyFFKtadRgKCmful4JoD1TtwbqMvxf9ysFGt/29sLYJ
         ORRw==
X-Gm-Message-State: AOAM531Hnr8RncrpOxWzkLyPsG/SO9OZ4K61WYhsxdx8RgnCe/UiIjea
	93V+38VRq1o91tVGigGkF9n7r6izkeYtGw==
X-Google-Smtp-Source: ABdhPJy/Cu3c3M4eXeQot2XygjTZGMrhfzaeyprRMLqVYiJSqhkjv2tutEuYBIurx5aqazHzBHtINA==
X-Received: by 2002:a62:84c1:0:b029:1ed:df18:bf16 with SMTP id k184-20020a6284c10000b02901eddf18bf16mr3917811pfd.10.1614140003779;
        Tue, 23 Feb 2021 20:13:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id jx20sm640681pjb.30.2021.02.23.20.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 20:13:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] go: Upgrade compiler to 1.16 major release
Date: Tue, 23 Feb 2021 20:13:18 -0800
Message-Id: <20210224041320.3968776-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert a CC/CXX check [1] which wont work with OE settings
Forward port needed patches forward

Details releaase notes are here [2]

[1] https://go-review.googlesource.com/c/go/+/228517/
[2] https://golang.org/doc/go1.16

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../go/{go-1.15.inc => go-1.16.inc}           |  7 +-
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  0
 ...ent-based-hash-generation-less-pedan.patch | 22 ++---
 ...-to-be-overridden-in-the-environment.patch |  0
 ...4-ld-add-soname-to-shareable-objects.patch | 12 +--
 ...de-CC-when-building-dist-and-go_boot.patch |  0
 ...dist-separate-host-and-target-builds.patch |  0
 ...d-go-make-GOROOT-precious-by-default.patch |  0
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  0
 ...go-make-sure-CC-and-CXX-are-absolute.patch | 95 +++++++++++++++++++
 ...ive_1.15.8.bb => go-binary-native_1.16.bb} |  4 +-
 ...dian_1.15.bb => go-cross-canadian_1.16.bb} |  0
 .../go/{go-cross_1.15.bb => go-cross_1.16.bb} |  0
 ...o-crosssdk_1.15.bb => go-crosssdk_1.16.bb} |  0
 .../{go-native_1.15.bb => go-native_1.16.bb}  |  0
 ...{go-runtime_1.15.bb => go-runtime_1.16.bb} |  0
 .../go/{go_1.15.bb => go_1.16.bb}             |  0
 18 files changed, 119 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/go/{go-1.15.inc => go-1.16.inc} (78%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0001-allow-CC-and-CXX-to-have-multiple-words.patch (100%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch (93%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0004-ld-add-soname-to-shareable-objects.patch (80%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0007-cmd-go-make-GOROOT-precious-by-default.patch (100%)
 rename meta/recipes-devtools/go/{go-1.15 => go-1.16}/0008-use-GOBUILDMODE-to-set-buildmode.patch (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
 rename meta/recipes-devtools/go/{go-binary-native_1.15.8.bb => go-binary-native_1.16.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.15.bb => go-cross-canadian_1.16.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.15.bb => go-cross_1.16.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.15.bb => go-crosssdk_1.16.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.15.bb => go-native_1.16.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.15.bb => go-runtime_1.16.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.15.bb => go_1.16.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 8df328dc0d..8e454f74a5 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.33"
 LINUXLIBCVERSION ?= "5.10%"
 QEMUVERSION ?= "5.2%"
-GOVERSION ?= "1.15%"
+GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "10.0.1"
diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.16.inc
similarity index 78%
rename from meta/recipes-devtools/go/go-1.15.inc
rename to meta/recipes-devtools/go/go-1.16.inc
index 7c8190f68c..1ebbbef833 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.16.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
-GO_BASEVERSION = "1.15"
-PV = "1.15.8"
+GO_BASEVERSION = "1.16"
+PV = "1.16"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -15,5 +15,6 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "540c0ab7781084d124991321ed1458e479982de94454a98afab6acadf38497c2"
+SRC_URI[main.sha256sum] = "7688063d55656105898f323d90a79a39c378d86fe89ae192eb3b7fc46347c95a"
diff --git a/meta/recipes-devtools/go/go-1.15/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.15/0001-allow-CC-and-CXX-to-have-multiple-words.patch
rename to meta/recipes-devtools/go/go-1.16/0001-allow-CC-and-CXX-to-have-multiple-words.patch
diff --git a/meta/recipes-devtools/go/go-1.15/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
similarity index 93%
rename from meta/recipes-devtools/go/go-1.15/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
rename to meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
index d0511c0c40..04d0e496c0 100644
--- a/meta/recipes-devtools/go/go-1.15/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go-1.16/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -63,8 +63,8 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -33,6 +33,8 @@ import (
- 	"cmd/go/internal/str"
+@@ -37,6 +37,8 @@ import (
+ 	"cmd/go/internal/trace"
  )
  
 +var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
@@ -72,7 +72,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  // actionList returns the list of actions in the dag rooted at root
  // as visited in a depth-first post-order traversal.
  func actionList(root *Action) []*Action {
-@@ -209,7 +211,7 @@ func (b *Builder) buildActionID(a *Actio
+@@ -228,7 +230,7 @@ func (b *Builder) buildActionID(a *Actio
  	// Assume b.WorkDir is being trimmed properly.
  	// When -trimpath is used with a package built from the module cache,
  	// use the module path and version instead of the directory.
@@ -81,7 +81,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		fmt.Fprintf(h, "dir %s\n", p.Dir)
  	} else if cfg.BuildTrimpath && p.Module != nil {
  		fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
-@@ -228,13 +230,13 @@ func (b *Builder) buildActionID(a *Actio
+@@ -247,13 +249,13 @@ func (b *Builder) buildActionID(a *Actio
  	}
  	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
  		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
@@ -99,7 +99,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  		}
  		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
  	}
-@@ -2298,33 +2300,48 @@ var (
+@@ -2401,33 +2403,48 @@ var (
  // gccCmd returns a gcc command line prefix
  // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
  func (b *Builder) GccCmd(incdir, workdir string) []string {
@@ -157,7 +157,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  }
  
  // compilerExe returns the compiler to use given an
-@@ -2333,11 +2350,16 @@ func (b *Builder) fcExe() []string {
+@@ -2436,11 +2453,16 @@ func (b *Builder) fcExe() []string {
  // of the compiler but can have additional arguments if they
  // were present in the environment value.
  // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
@@ -165,7 +165,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 +func (b *Builder) compilerExe(envValue string, def string, filtered bool) []string {
  	compiler := strings.Fields(envValue)
  	if len(compiler) == 0 {
- 		compiler = []string{def}
+ 		compiler = strings.Fields(def)
  	}
 +
 +	if filtered {
@@ -175,7 +175,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	return compiler
  }
  
-@@ -2510,7 +2532,7 @@ func envList(key, def string) []string {
+@@ -2620,7 +2642,7 @@ func envList(key, def string) []string {
  }
  
  // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
@@ -184,7 +184,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	defaults := "-g -O2"
  
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2529,6 +2551,14 @@ func (b *Builder) CFlags(p *load.Package
+@@ -2639,6 +2661,14 @@ func (b *Builder) CFlags(p *load.Package
  		return
  	}
  
@@ -199,7 +199,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	return
  }
  
-@@ -2543,7 +2573,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+@@ -2653,7 +2683,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
  
  func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
  	p := a.Package
@@ -208,7 +208,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -2902,7 +2932,7 @@ func (b *Builder) swigIntSize(objdir str
+@@ -3104,7 +3134,7 @@ func (b *Builder) swigIntSize(objdir str
  
  // Run SWIG on one SWIG input file.
  func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
diff --git a/meta/recipes-devtools/go/go-1.15/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.15/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
rename to meta/recipes-devtools/go/go-1.16/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
diff --git a/meta/recipes-devtools/go/go-1.15/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
similarity index 80%
rename from meta/recipes-devtools/go/go-1.15/0004-ld-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
index da29923920..cd875f1164 100644
--- a/meta/recipes-devtools/go/go-1.15/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go-1.16/0004-ld-add-soname-to-shareable-objects.patch
@@ -19,15 +19,15 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1446,6 +1446,7 @@ func (ctxt *Link) hostlink() {
+@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
 +			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
- 			if ctxt.HeadType != objabi.Hwindows {
- 				// Pass -z nodelete to mark the shared library as
- 				// non-closeable: a dlclose will do nothing.
-@@ -1457,6 +1458,7 @@ func (ctxt *Link) hostlink() {
+ 			if ctxt.HeadType == objabi.Hwindows {
+ 				if *flagAslr {
+ 					argv = addASLRargs(argv)
+@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -35,7 +35,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1465,6 +1467,7 @@ func (ctxt *Link) hostlink() {
+@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go-1.15/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.15/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
rename to meta/recipes-devtools/go/go-1.16/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
diff --git a/meta/recipes-devtools/go/go-1.15/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.15/0006-cmd-dist-separate-host-and-target-builds.patch
rename to meta/recipes-devtools/go/go-1.16/0006-cmd-dist-separate-host-and-target-builds.patch
diff --git a/meta/recipes-devtools/go/go-1.15/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.15/0007-cmd-go-make-GOROOT-precious-by-default.patch
rename to meta/recipes-devtools/go/go-1.16/0007-cmd-go-make-GOROOT-precious-by-default.patch
diff --git a/meta/recipes-devtools/go/go-1.15/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.15/0008-use-GOBUILDMODE-to-set-buildmode.patch
rename to meta/recipes-devtools/go/go-1.16/0008-use-GOBUILDMODE-to-set-buildmode.patch
diff --git a/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
new file mode 100644
index 0000000000..dcbdf58752
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.16/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
@@ -0,0 +1,95 @@
+From a983bc6cd48fb0da939e3329cac18d7a3b29ecf8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 22 Feb 2021 17:54:01 -0800
+Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
+
+OE uses CC/CXX values which consists of cmpiler and options together,
+secondly, the environment is canned so this check add little value to OE
+based builds
+
+Fixes go-runtime build issues
+
+go install: CXX environment variable is relative; must be absolute path: powerpc64le-yoe-linux-musl-g++ -mlittle-endian -mhard-float -m64 -mabi=elfv2 -mcpu=power9 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mnt/b/yoe/master/build/tmp/work/ppc64p9le-yoe-linux-musl/go/1.16-r0/recipe-sysroot
+
+This reverts commit aa161e799df7e1eba99d2be10271e76b6f758142.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cmd/go/internal/envcmd/env.go        |  5 -----
+ src/cmd/go/internal/work/init.go         |  7 -------
+ src/cmd/go/testdata/script/env_write.txt | 24 ------------------------
+ 3 files changed, 36 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 6937187522..29f9057c3f 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -427,11 +427,6 @@ func checkEnvWrite(key, val string) error {
+ 		if !filepath.IsAbs(val) && val != "" {
+ 			return fmt.Errorf("GOPATH entry is relative; must be absolute path: %q", val)
+ 		}
+-	// Make sure CC and CXX are absolute paths
+-	case "CC", "CXX":
+-		if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
+-			return fmt.Errorf("%s entry is relative; must be absolute path: %q", key, val)
+-		}
+ 	}
+ 
+ 	if !utf8.ValidString(val) {
+diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/work/init.go
+index ba7c7c2fbb..3a6df5f758 100644
+--- a/src/cmd/go/internal/work/init.go
++++ b/src/cmd/go/internal/work/init.go
+@@ -41,13 +41,6 @@ func BuildInit() {
+ 		cfg.BuildPkgdir = p
+ 	}
+ 
+-	// Make sure CC and CXX are absolute paths
+-	for _, key := range []string{"CC", "CXX"} {
+-		if path := cfg.Getenv(key); !filepath.IsAbs(path) && path != "" && path != filepath.Base(path) {
+-			base.Fatalf("go %s: %s environment variable is relative; must be absolute path: %s\n", flag.Args()[0], key, path)
+-		}
+-	}
+-
+ 	// For each experiment that has been enabled in the toolchain, define a
+ 	// build tag with the same name but prefixed by "goexperiment." which can be
+ 	// used for compiling alternative files for the experiment. This allows
+diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/testdata/script/env_write.txt
+index bda1e57826..c99aadb7f2 100644
+--- a/src/cmd/go/testdata/script/env_write.txt
++++ b/src/cmd/go/testdata/script/env_write.txt
+@@ -129,30 +129,6 @@ go env -w GOTMPDIR=
+ go env GOTMPDIR
+ stdout ^$
+ 
+-# go env -w rejects relative CC values
+-[!windows] go env -w CC=/usr/bin/clang
+-go env -w CC=clang
+-[!windows] ! go env -w CC=./clang
+-[!windows] ! go env -w CC=bin/clang
+-[!windows] stderr 'go env -w: CC entry is relative; must be absolute path'
+-
+-[windows] go env -w CC=$WORK\bin\clang
+-[windows] ! go env -w CC=.\clang
+-[windows] ! go env -w CC=bin\clang
+-[windows] stderr 'go env -w: CC entry is relative; must be absolute path'
+-
+-# go env -w rejects relative CXX values
+-[!windows] go env -w CC=/usr/bin/cpp
+-go env -w CXX=cpp
+-[!windows] ! go env -w CXX=./cpp
+-[!windows] ! go env -w CXX=bin/cpp
+-[!windows] stderr 'go env -w: CXX entry is relative; must be absolute path'
+-
+-[windows] go env -w CXX=$WORK\bin\cpp
+-[windows] ! go env -w CXX=.\cpp
+-[windows] ! go env -w CXX=bin\cpp
+-[windows] stderr 'go env -w: CXX entry is relative; must be absolute path'
+-
+ # go env -w/-u checks validity of GOOS/ARCH combinations
+ env GOOS=
+ env GOARCH=
+-- 
+2.30.1
+
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.8.bb b/meta/recipes-devtools/go/go-binary-native_1.16.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.16.bb
index df697e2781..155a475c95 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.16.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "d3379c32a90fdf9382166f8f48034c459a8cc433730bc9476d39d9082c94583b"
-SRC_URI[go_linux_arm64.sha256sum] = "0e31ea4bf53496b0f0809730520dee98c0ae5c530f3701a19df0ba0a327bf3d2"
+SRC_URI[go_linux_amd64.sha256sum] = "013a489ebb3e24ef3d915abe5b94c3286c070dfe0818d5bca8108f1d6e8440d2"
+SRC_URI[go_linux_arm64.sha256sum] = "3770f7eb22d05e25fbee8fb53c2a4e897da043eb83c69b9a14f8d98562cd8098"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.15.bb b/meta/recipes-devtools/go/go-cross-canadian_1.16.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.15.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.16.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.15.bb b/meta/recipes-devtools/go/go-cross_1.16.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.15.bb
rename to meta/recipes-devtools/go/go-cross_1.16.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.15.bb b/meta/recipes-devtools/go/go-crosssdk_1.16.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.15.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.16.bb
diff --git a/meta/recipes-devtools/go/go-native_1.15.bb b/meta/recipes-devtools/go/go-native_1.16.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.15.bb
rename to meta/recipes-devtools/go/go-native_1.16.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.15.bb b/meta/recipes-devtools/go/go-runtime_1.16.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.15.bb
rename to meta/recipes-devtools/go/go-runtime_1.16.bb
diff --git a/meta/recipes-devtools/go/go_1.15.bb b/meta/recipes-devtools/go/go_1.16.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.15.bb
rename to meta/recipes-devtools/go/go_1.16.bb
-- 
2.30.1

