Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF30C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 23:39:59 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web12.1069.1648597198257285270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pGYbdDob;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id w7so14580815pfu.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 16:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22PiTOXPiq6+DAr5QhlV0qCRtQoTrFiq90Q6IibVo14=;
        b=pGYbdDob7gllLDXWBlqCZ5jRWzmTnKI/NREIosRq/+CAn0crpWPw6/m4jed4p2VQ6U
         6ATlIRdNx6H8hr9iKqWippGW8fCOrXdhhVQOVV+tTvrXH04k5sPzevctfEcvFubO01MJ
         n1HeNHcFo1lzc1znU32X7Me3523pzWX4jddJj8WMWfeu0BoYRUcXT7AshYkd5ueuf999
         +QHJgM3ovNb+rH9swqxOkZuYPlFbF9CE6XpsBQzM5m/c2olB6eCLb4N4DS0VFfbSfgZU
         SH6WufwCflKurWbTh8uIQs242U0i9SJGrD7AFvdGUagN2/MGOFKkZLZLxTG/fspdwgco
         3XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=22PiTOXPiq6+DAr5QhlV0qCRtQoTrFiq90Q6IibVo14=;
        b=nzAdEoboFJh4Hp70mv4b7biPH0ZZYRP8pK/ME/swuNqlHiRKfnGmKil/dS6ddoznjR
         rvoV+u8y0zgIN9e70Ew3t+jP/6eHjAu8trHBpPKUOsqXU5bXq/UeZGalLFbHvBNl1uwE
         o0gT3auUeC9My4/GjmWaMg1NgVleTaqBw8WKBI1cWZj+3TvWtoEQ12QcMkT23PTo4DaK
         Ax+dwpCzDav+2LSsu7OlszC986LQPFs3a8O4ZhpRbrBqaLzPaKcuFwyqX/zleBOVgpCT
         aAwcHTuITX10/R5HzSFHqWoG+Q0SStTRfx/fRZVDPfzQNT5zxx/Bgpux5ptkQ1GAzN5W
         uchQ==
X-Gm-Message-State: AOAM532ooqEgSTuIWZXBouF9B2oDGTirjGnwb+QYoWIIts2D5rLlJGl+
	7W3/UE5MB2yB07r3wN3oTjAwzPn3n1c=
X-Google-Smtp-Source: 
 ABdhPJzhKoT4ZxNDcBs00ojCxYEtbun93xmDIoBvBoRNB72Eo5H/0EnYS1TVwgp02uFSL232i/O9WA==
X-Received: by 2002:a05:6a00:114e:b0:4c8:55f7:faad with SMTP id
 b14-20020a056a00114e00b004c855f7faadmr30437454pfm.86.1648597196191;
        Tue, 29 Mar 2022 16:39:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa784ce000000b004fa79973c94sm20010387pfn.165.2022.03.29.16.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:39:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 1/4] go: Upgrade to 1.18
Date: Tue, 29 Mar 2022 16:39:50 -0700
Message-Id: <20220329233953.3039842-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 23:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163760

1.18 is a major release brings in long awaited new features e.g.
generics, fuzzing

Detailed list is here [1]

Drop patches to manipulate multiword CC/CXX as go has fixed it
differently [2]

Drop cgo portion of patch to hack hash generation logic
either we should find a way to not use it or redo it,
in current form its not upstreamable and its
altering core features of go compiler, it can not be maintained as is

Do not emit linkinfo into the actionID

Drop ignoring CVE-2021-29923 its already addressed in go >= 1.17

[1] https://go.dev/doc/go1.18
[2] https://groups.google.com/g/golang-codereviews/c/fUhCbpYG7HE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Ignore modinfo from actionID

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../go/{go-1.17.8.inc => go-1.18.inc}         |  11 +-
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  33 ---
 ...ent-based-hash-generation-less-pedan.patch | 158 ++++++++++++
 ...not-write-linker-flags-into-buildids.patch |   9 +-
 ...ldgo.go-do-not-hardcode-host-compile.patch |   2 -
 ...ent-based-hash-generation-less-pedan.patch | 237 ------------------
 ...-to-be-overridden-in-the-environment.patch |  10 +-
 ...4-ld-add-soname-to-shareable-objects.patch |   6 +-
 ...de-CC-when-building-dist-and-go_boot.patch |   6 +-
 ...dist-separate-host-and-target-builds.patch |  38 ++-
 ...d-go-make-GOROOT-precious-by-default.patch |  10 +-
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |   2 +-
 ...go-make-sure-CC-and-CXX-are-absolute.patch |  94 -------
 ...ive_1.17.8.bb => go-binary-native_1.18.bb} |   4 +-
 ...an_1.17.8.bb => go-cross-canadian_1.18.bb} |   0
 .../{go-cross_1.17.8.bb => go-cross_1.18.bb}  |   0
 ...crosssdk_1.17.8.bb => go-crosssdk_1.18.bb} |   0
 ...{go-native_1.17.8.bb => go-native_1.18.bb} |   0
 ...o-runtime_1.17.8.bb => go-runtime_1.18.bb} |   0
 .../go/{go_1.17.8.bb => go_1.18.bb}           |   0
 21 files changed, 197 insertions(+), 425 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.8.inc => go-1.18.inc} (58%)
 delete mode 100644 meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
 rename meta/recipes-devtools/go/{go-binary-native_1.17.8.bb => go-binary-native_1.18.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.8.bb => go-cross-canadian_1.18.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.8.bb => go-cross_1.18.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.8.bb => go-crosssdk_1.18.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.8.bb => go-native_1.18.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.8.bb => go-runtime_1.18.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.8.bb => go_1.18.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index d362bd76c6f..cc542db7364 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -23,7 +23,7 @@ GDBVERSION ?= "11.%"
 GLIBCVERSION ?= "2.35"
 LINUXLIBCVERSION ?= "5.16%"
 QEMUVERSION ?= "6.2%"
-GOVERSION ?= "1.17%"
+GOVERSION ?= "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "13.0.1"
diff --git a/meta/recipes-devtools/go/go-1.17.8.inc b/meta/recipes-devtools/go/go-1.18.inc
similarity index 58%
rename from meta/recipes-devtools/go/go-1.17.8.inc
rename to meta/recipes-devtools/go/go-1.18.inc
index 649c09ec1d0..99ce70b346a 100644
--- a/meta/recipes-devtools/go/go-1.17.8.inc
+++ b/meta/recipes-devtools/go/go-1.18.inc
@@ -5,21 +5,14 @@ FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.18:"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
 SRC_URI += "\
-    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
-    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+    file://0001-cmd-go-make-content-based-hash-generation-less-pedan.patch \
     file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
     file://0004-ld-add-soname-to-shareable-objects.patch \
     file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a"
-
-# Upstream don't believe it is a signifiant real world issue and will only
-# fix in 1.17 onwards where we can drop this.
-# https://github.com/golang/go/issues/30999#issuecomment-910470358
-CVE_CHECK_IGNORE += "CVE-2021-29923"
+SRC_URI[main.sha256sum] = "38f423db4cc834883f2b52344282fa7a39fbb93650dc62a11fdf0be6409bdad6"
diff --git a/meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-to-have-multiple-words.patch
deleted file mode 100644
index 5f4823be22b..00000000000
--- a/meta/recipes-devtools/go/go-1.18/0001-allow-CC-and-CXX-to-have-multiple-words.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001
-From: Alex Kube <alexander.j.kube@gmail.com>
-Date: Wed, 23 Oct 2019 21:01:13 +0430
-Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
-
-Upstream-Status: Inappropriate [OE specific]
-
-Adapted to Go 1.13 from patches originally submitted to
-the meta/recipes-devtools/go tree by
-Matt Madison <matt@madison.systems>.
-
-Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
-
----
- src/cmd/go/internal/envcmd/env.go | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/cmd/go/internal/envcmd/env.go
-+++ b/src/cmd/go/internal/envcmd/env.go
-@@ -103,11 +103,11 @@ func MkEnv() []cfg.EnvVar {
- 
- 	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
- 	if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
--		cc = env[0]
-+		cc = strings.Join(env, " ")
- 	}
- 	cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
- 	if env := strings.Fields(cfg.Getenv("CXX")); len(env) > 0 {
--		cxx = env[0]
-+		cxx = strings.Join(env, " ")
- 	}
- 	env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
- 	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
diff --git a/meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
new file mode 100644
index 00000000000..f9db5df4eb9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -0,0 +1,158 @@
+From 61de6067f5ad127d246543527947a357647f95e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 28 Mar 2022 10:59:03 -0700
+Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
+
+Go 1.10's build tool now uses content-based hashes to
+determine when something should be built or re-built.
+This same mechanism is used to maintain a built-artifact
+cache for speeding up builds.
+
+However, the hashes it generates include information that
+doesn't work well with OE, nor with using a shared runtime
+library.
+
+First, it embeds path names to source files, unless
+building within GOROOT.  This prevents the building
+of a package in GOPATH for later staging into GOROOT.
+
+This patch adds support for the environment variable
+GOPATH_OMIT_IN_ACTIONID.  If present, path name
+embedding is disabled.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
+Signed-off-by: Matt Madison <matt@madison.systems>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cmd/go/internal/envcmd/env.go |  2 +-
+ src/cmd/go/internal/work/exec.go  | 42 +++++++++++++++++++++++++------
+ 2 files changed, 35 insertions(+), 9 deletions(-)
+
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -169,7 +169,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+ func ExtraEnvVarsCostly() []cfg.EnvVar {
+ 	var b work.Builder
+ 	b.Init()
+-	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
++	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
+ 	if err != nil {
+ 		// Should not happen - b.CFlags was given an empty package.
+ 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -213,6 +213,8 @@ func (b *Builder) Do(ctx context.Context
+ 	writeActionGraph()
+ }
+ 
++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
++
+ // buildActionID computes the action ID for a build action.
+ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	p := a.Package
+@@ -234,7 +236,7 @@ func (b *Builder) buildActionID(a *Actio
+ 		if p.Module != nil {
+ 			fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
+ 		}
+-	} else if p.Goroot {
++	} else if p.Goroot || omitGopath {
+ 		// The Go compiler always hides the exact value of $GOROOT
+ 		// when building things in GOROOT.
+ 		//
+@@ -266,9 +268,9 @@ func (b *Builder) buildActionID(a *Actio
+ 	}
+ 	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
+ 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
+-		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
++		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
+ 
+-		ccExe := b.ccExe()
++		ccExe := filterCompilerFlags(b.ccExe())
+ 		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
+ 		// Include the C compiler tool ID so that if the C
+ 		// compiler changes we rebuild the package.
+@@ -281,14 +283,14 @@ func (b *Builder) buildActionID(a *Actio
+ 			}
+ 		}
+ 		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
+-			cxxExe := b.cxxExe()
++			cxxExe := filterCompilerFlags(b.cxxExe())
+ 			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
+ 			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
+ 				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
+ 			}
+ 		}
+ 		if len(p.FFiles) > 0 {
+-			fcExe := b.fcExe()
++			fcExe := filterCompilerFlags(b.fcExe())
+ 			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
+ 			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
+ 				fmt.Fprintf(h, "FC ID=%q\n", fcID)
+@@ -304,7 +306,7 @@ func (b *Builder) buildActionID(a *Actio
+ 			fmt.Fprintf(h, "fuzz %q\n", fuzzFlags)
+ 		}
+ 	}
+-	fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
++	//fmt.Fprintf(h, "modinfo %q\n", p.Internal.BuildInfo)
+ 
+ 	// Configuration specific to compiler toolchain.
+ 	switch cfg.BuildToolchainName {
+@@ -2679,8 +2681,23 @@ func envList(key, def string) []string {
+ 	return args
+ }
+ 
++var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
++
++func filterCompilerFlags(flags []string) []string {
++	var newflags []string
++	if !filterFlags {
++		return flags
++	}
++	for _, flag := range flags {
++		if strings.HasPrefix(flag, "-m") {
++			newflags = append(newflags, flag)
++		}
++	}
++	return newflags
++}
++
+ // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
+-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
+ 	defaults := "-g -O2"
+ 
+ 	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
+@@ -2698,6 +2715,13 @@ func (b *Builder) CFlags(p *load.Package
+ 	if ldflags, err = buildFlags("LDFLAGS", defaults, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
+ 		return
+ 	}
++	if filtered {
++		cppflags = filterCompilerFlags(cppflags)
++		cflags = filterCompilerFlags(cflags)
++		cxxflags = filterCompilerFlags(cxxflags)
++		fflags = filterCompilerFlags(fflags)
++		ldflags = filterCompilerFlags(ldflags)
++	}
+ 
+ 	return
+ }
+@@ -2713,7 +2737,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+ 
+ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
+ 	p := a.Package
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
+@@ -3174,7 +3198,7 @@ func (b *Builder) swigIntSize(objdir str
+ 
+ // Run SWIG on one SWIG input file.
+ func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return "", "", err
+ 	}
diff --git a/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
index 20b6636f659..f117152f2a3 100644
--- a/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ b/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
@@ -14,11 +14,9 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  src/cmd/go/internal/work/exec.go | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 696db23..727d40b 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1136,7 +1136,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1274,7 +1274,7 @@ func (b *Builder) linkActionID(a *Action
  	}
  
  	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
@@ -27,7 +25,7 @@ index 696db23..727d40b 100644
  
  	// Input files.
  	for _, a1 := range a.Deps {
-@@ -1418,7 +1418,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
+@@ -1568,7 +1568,7 @@ func (b *Builder) linkSharedActionID(a *
  	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
  
  	// Toolchain-dependent configuration, shared with b.linkActionID.
@@ -36,6 +34,3 @@ index 696db23..727d40b 100644
  
  	// Input files.
  	for _, a1 := range a.Deps {
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
index 257454a67d8..ef1cc6716a9 100644
--- a/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
+++ b/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
@@ -13,8 +13,6 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  src/cmd/dist/buildgo.go | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/src/cmd/dist/buildgo.go b/src/cmd/dist/buildgo.go
-index caafc13..4eb1c96 100644
 --- a/src/cmd/dist/buildgo.go
 +++ b/src/cmd/dist/buildgo.go
 @@ -34,8 +34,8 @@ func mkzdefaultcc(dir, file string) {
diff --git a/meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
deleted file mode 100644
index 42cd568ef98..00000000000
--- a/meta/recipes-devtools/go/go-1.18/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ /dev/null
@@ -1,237 +0,0 @@
-From c403b45995c5daa6747ac4d95b39bc9a6feb2cda Mon Sep 17 00:00:00 2001
-From: Alex Kube <alexander.j.kube@gmail.com>
-Date: Wed, 23 Oct 2019 21:14:22 +0430
-Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
-
-Upstream-Status: Inappropriate [OE specific]
-
-Go 1.10's build tool now uses content-based hashes to
-determine when something should be built or re-built.
-This same mechanism is used to maintain a built-artifact
-cache for speeding up builds.
-
-However, the hashes it generates include information that
-doesn't work well with OE, nor with using a shared runtime
-library.
-
-First, it embeds path names to source files, unless
-building within GOROOT.  This prevents the building
-of a package in GOPATH for later staging into GOROOT.
-
-This patch adds support for the environment variable
-GOPATH_OMIT_IN_ACTIONID.  If present, path name
-embedding is disabled.
-
-Second, if cgo is enabled, the build ID for cgo-related
-packages will include the current value of the environment
-variables for invoking the compiler (CC, CXX, FC) and
-any CGO_xxFLAGS variables.  Only if the settings used
-during a compilation exactly match, character for character,
-the values used for compiling runtime/cgo or any other
-cgo-enabled package being imported, will the tool
-decide that the imported package is up-to-date.
-
-This is done to help ensure correctness, but is overly
-simplistic and effectively prevents the reuse of built
-artifacts that use cgo (or shared runtime, which includes
-runtime/cgo).
-
-This patch filters out all compiler flags except those
-beginning with '-m'.  The default behavior can be restored
-by setting the CGO_PEDANTIC environment variable.
-
-Adapted to Go 1.13 from patches originally submitted to
-the meta/recipes-devtools/go tree by
-Matt Madison <matt@madison.systems>.
-
-Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
----
- src/cmd/go/internal/envcmd/env.go |  2 +-
- src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
- 2 files changed, 49 insertions(+), 19 deletions(-)
-
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 20d0587..ff6f0d8 100644
---- a/src/cmd/go/internal/envcmd/env.go
-+++ b/src/cmd/go/internal/envcmd/env.go
-@@ -160,7 +160,7 @@ func ExtraEnvVars() []cfg.EnvVar {
- func ExtraEnvVarsCostly() []cfg.EnvVar {
- 	var b work.Builder
- 	b.Init()
--	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
-+	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
- 	if err != nil {
- 		// Should not happen - b.CFlags was given an empty package.
- 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 5a225fb..a37872e 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -38,6 +38,8 @@ import (
- 	"cmd/go/internal/trace"
- )
- 
-+var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
-+
- // actionList returns the list of actions in the dag rooted at root
- // as visited in a depth-first post-order traversal.
- func actionList(root *Action) []*Action {
-@@ -229,7 +231,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 	// Assume b.WorkDir is being trimmed properly.
- 	// When -trimpath is used with a package built from the module cache,
- 	// use the module path and version instead of the directory.
--	if !p.Goroot && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir, b.WorkDir) {
-+	if !p.Goroot && !omitGopath && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir, b.WorkDir) {
- 		fmt.Fprintf(h, "dir %s\n", p.Dir)
- 	} else if cfg.BuildTrimpath && p.Module != nil {
- 		fmt.Fprintf(h, "module %s@%s\n", p.Module.Path, p.Module.Version)
-@@ -248,9 +250,9 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 	}
- 	if len(p.CgoFiles)+len(p.SwigFiles)+len(p.SwigCXXFiles) > 0 {
- 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
--		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
-+		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
- 
--		ccExe := b.ccExe()
-+		ccExe := b.ccExe(true)
- 		fmt.Fprintf(h, "CC=%q %q %q %q\n", ccExe, cppflags, cflags, ldflags)
- 		// Include the C compiler tool ID so that if the C
- 		// compiler changes we rebuild the package.
-@@ -263,14 +265,14 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
- 			}
- 		}
- 		if len(p.CXXFiles)+len(p.SwigCXXFiles) > 0 {
--			cxxExe := b.cxxExe()
-+			cxxExe := b.cxxExe(true)
- 			fmt.Fprintf(h, "CXX=%q %q\n", cxxExe, cxxflags)
- 			if cxxID, err := b.gccToolID(cxxExe[0], "c++"); err == nil {
- 				fmt.Fprintf(h, "CXX ID=%q\n", cxxID)
- 			}
- 		}
- 		if len(p.FFiles) > 0 {
--			fcExe := b.fcExe()
-+			fcExe := b.fcExe(true)
- 			fmt.Fprintf(h, "FC=%q %q\n", fcExe, fflags)
- 			if fcID, err := b.gccToolID(fcExe[0], "f95"); err == nil {
- 				fmt.Fprintf(h, "FC ID=%q\n", fcID)
-@@ -2438,33 +2440,48 @@ var (
- // gccCmd returns a gcc command line prefix
- // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
- func (b *Builder) GccCmd(incdir, workdir string) []string {
--	return b.compilerCmd(b.ccExe(), incdir, workdir)
-+	return b.compilerCmd(b.ccExe(false), incdir, workdir)
- }
- 
- // gxxCmd returns a g++ command line prefix
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
- func (b *Builder) GxxCmd(incdir, workdir string) []string {
--	return b.compilerCmd(b.cxxExe(), incdir, workdir)
-+	return b.compilerCmd(b.cxxExe(false), incdir, workdir)
- }
- 
- // gfortranCmd returns a gfortran command line prefix.
- func (b *Builder) gfortranCmd(incdir, workdir string) []string {
--	return b.compilerCmd(b.fcExe(), incdir, workdir)
-+	return b.compilerCmd(b.fcExe(false), incdir, workdir)
- }
- 
- // ccExe returns the CC compiler setting without all the extra flags we add implicitly.
--func (b *Builder) ccExe() []string {
--	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
-+func (b *Builder) ccExe(filtered bool) []string {
-+	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch), filtered)
- }
- 
- // cxxExe returns the CXX compiler setting without all the extra flags we add implicitly.
--func (b *Builder) cxxExe() []string {
--	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
-+func (b *Builder) cxxExe(filtered bool) []string {
-+	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch), filtered)
- }
- 
- // fcExe returns the FC compiler setting without all the extra flags we add implicitly.
--func (b *Builder) fcExe() []string {
--	return b.compilerExe(cfg.Getenv("FC"), "gfortran")
-+func (b *Builder) fcExe(filtered bool) []string {
-+	return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
-+}
-+
-+var filterFlags = os.Getenv("CGO_PEDANTIC") == ""
-+
-+func filterCompilerFlags(flags []string) []string {
-+	var newflags []string
-+	if !filterFlags {
-+		return flags
-+	}
-+	for _, flag := range flags {
-+		if strings.HasPrefix(flag, "-m") {
-+			newflags = append(newflags, flag)
-+		}
-+	}
-+	return newflags
- }
- 
- // compilerExe returns the compiler to use given an
-@@ -2473,11 +2490,16 @@ func (b *Builder) fcExe() []string {
- // of the compiler but can have additional arguments if they
- // were present in the environment value.
- // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
--func (b *Builder) compilerExe(envValue string, def string) []string {
-+func (b *Builder) compilerExe(envValue string, def string, filtered bool) []string {
- 	compiler := strings.Fields(envValue)
- 	if len(compiler) == 0 {
- 		compiler = strings.Fields(def)
- 	}
-+
-+	if filtered {
-+		return append(compiler[0:1], filterCompilerFlags(compiler[1:])...)
-+	}
-+
- 	return compiler
- }
- 
-@@ -2667,7 +2689,7 @@ func envList(key, def string) []string {
- }
- 
- // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
--func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
-+func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
- 	defaults := "-g -O2"
- 
- 	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
-@@ -2686,6 +2708,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
- 		return
- 	}
- 
-+	if filtered {
-+		cppflags = filterCompilerFlags(cppflags)
-+		cflags = filterCompilerFlags(cflags)
-+		cxxflags = filterCompilerFlags(cxxflags)
-+		fflags = filterCompilerFlags(fflags)
-+		ldflags = filterCompilerFlags(ldflags)
-+	}
-+
- 	return
- }
- 
-@@ -2700,7 +2730,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
- 
- func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
- 	p := a.Package
--	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
-+	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
- 	if err != nil {
- 		return nil, nil, err
- 	}
-@@ -3151,7 +3181,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
- 
- // Run SWIG on one SWIG input file.
- func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
--	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
-+	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
- 	if err != nil {
- 		return "", "", err
- 	}
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
index 2a86bdccf30..c3ccffc3e95 100644
--- a/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
+++ b/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -18,11 +18,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/go/internal/cfg/cfg.go | 6 +++++-
  2 files changed, 8 insertions(+), 2 deletions(-)
 
-diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index bec1769..d82f612 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -248,7 +248,9 @@ func xinit() {
+@@ -251,7 +251,9 @@ func xinit() {
  	}
  	xatexit(rmworkdir)
  
@@ -33,11 +31,9 @@ index bec1769..d82f612 100644
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
-index 57a3c1f..825d8c7 100644
 --- a/src/cmd/go/internal/cfg/cfg.go
 +++ b/src/cmd/go/internal/cfg/cfg.go
-@@ -67,7 +67,11 @@ func defaultContext() build.Context {
+@@ -76,7 +76,11 @@ func defaultContext() build.Context {
  		// variables. This matches the initialization of ToolDir in
  		// go/build, except for using ctxt.GOROOT rather than
  		// runtime.GOROOT.
@@ -49,4 +45,4 @@ index 57a3c1f..825d8c7 100644
 +		}
  	}
  
- 	ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
+ 	ctxt.GOPATH = envOr("GOPATH", gopath(ctxt))
diff --git a/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
index cd875f1164d..058fa64225a 100644
--- a/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
@@ -19,7 +19,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1343,6 +1343,7 @@ func (ctxt *Link) hostlink() {
+@@ -1347,6 +1347,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
@@ -27,7 +27,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  			if ctxt.HeadType == objabi.Hwindows {
  				if *flagAslr {
  					argv = addASLRargs(argv)
-@@ -1358,6 +1359,7 @@ func (ctxt *Link) hostlink() {
+@@ -1364,6 +1365,7 @@ func (ctxt *Link) hostlink() {
  			argv = append(argv, "-Wl,-z,relro")
  		}
  		argv = append(argv, "-shared")
@@ -35,7 +35,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	case BuildModePlugin:
  		if ctxt.HeadType == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1366,6 +1368,7 @@ func (ctxt *Link) hostlink() {
+@@ -1372,6 +1374,7 @@ func (ctxt *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
index 2845d21382e..a6937672f58 100644
--- a/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
+++ b/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -17,11 +17,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/make.bash | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/make.bash b/src/make.bash
-index 7986125..dd67029 100755
 --- a/src/make.bash
 +++ b/src/make.bash
-@@ -181,7 +181,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+@@ -195,7 +195,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ];
  	exit 1
  fi
  rm -f cmd/dist/dist
@@ -30,7 +28,7 @@ index 7986125..dd67029 100755
  
  # -e doesn't propagate out of eval, so check success by hand.
  eval $(./cmd/dist/dist env -p || echo FAIL=true)
-@@ -206,7 +206,7 @@ fi
+@@ -220,7 +220,7 @@ fi
  # Run dist bootstrap to complete make.bash.
  # Bootstrap installs a proper cmd/dist, built with the new toolchain.
  # Throw ours, built with Go 1.4, away after bootstrap.
diff --git a/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
index 68e8efc1d2c..ee743ab9900 100644
--- a/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -39,11 +39,9 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  src/cmd/dist/build.go | 156 ++++++++++++++++++++++++++++++------------
  1 file changed, 113 insertions(+), 43 deletions(-)
 
-diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index d82f612..5c8459c 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -43,6 +43,7 @@ var (
+@@ -44,6 +44,7 @@ var (
  	goexperiment     string
  	workdir          string
  	tooldir          string
@@ -51,7 +49,7 @@ index d82f612..5c8459c 100644
  	oldgoos          string
  	oldgoarch        string
  	exe              string
-@@ -55,6 +56,7 @@ var (
+@@ -54,6 +55,7 @@ var (
  
  	rebuildall   bool
  	defaultclang bool
@@ -59,7 +57,7 @@ index d82f612..5c8459c 100644
  
  	vflag int // verbosity
  )
-@@ -251,6 +253,8 @@ func xinit() {
+@@ -254,6 +256,8 @@ func xinit() {
  	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
  		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
  	}
@@ -68,7 +66,7 @@ index d82f612..5c8459c 100644
  }
  
  // compilerEnv returns a map from "goos/goarch" to the
-@@ -496,8 +500,10 @@ func setup() {
+@@ -499,8 +503,10 @@ func setup() {
  	p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
  	if rebuildall {
  		xremoveall(p)
@@ -79,7 +77,7 @@ index d82f612..5c8459c 100644
  
  	if goos != gohostos || goarch != gohostarch {
  		p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
-@@ -1267,17 +1273,35 @@ func cmdbootstrap() {
+@@ -1252,17 +1258,35 @@ func cmdbootstrap() {
  
  	var noBanner, noClean bool
  	var debug bool
@@ -116,7 +114,7 @@ index d82f612..5c8459c 100644
  	// Set GOPATH to an internal directory. We shouldn't actually
  	// need to store files here, since the toolchain won't
  	// depend on modules outside of vendor directories, but if
-@@ -1345,8 +1369,13 @@ func cmdbootstrap() {
+@@ -1330,8 +1354,13 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  
@@ -132,7 +130,7 @@ index d82f612..5c8459c 100644
  	goBootstrap := pathf("%s/go_bootstrap", tooldir)
  	cmdGo := pathf("%s/go", gobin)
  	if debug {
-@@ -1375,7 +1404,11 @@ func cmdbootstrap() {
+@@ -1360,7 +1389,11 @@ func cmdbootstrap() {
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
@@ -145,7 +143,7 @@ index d82f612..5c8459c 100644
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
  	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
-@@ -1414,50 +1447,84 @@ func cmdbootstrap() {
+@@ -1399,50 +1432,84 @@ func cmdbootstrap() {
  	}
  	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
  
@@ -197,8 +195,6 @@ index d82f612..5c8459c 100644
 -		timelog("build", "host toolchain")
 -		if vflag > 0 {
 -			xprintf("\n")
--		}
--		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
 +
 +		if goos == oldgoos && goarch == oldgoarch {
 +			// Common case - not setting up for cross-compilation.
@@ -230,7 +226,8 @@ index d82f612..5c8459c 100644
 +			os.Setenv("GOARCH", goarch)
 +			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
 +			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
-+		}
+ 		}
+-		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
  		goInstall(goBootstrap, "std", "cmd")
  		checkNotStale(goBootstrap, "std", "cmd")
  		checkNotStale(cmdGo, "std", "cmd")
@@ -238,12 +235,7 @@ index d82f612..5c8459c 100644
 -		timelog("build", "target toolchain")
 -		if vflag > 0 {
 -			xprintf("\n")
-+		if debug {
-+			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
-+			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
-+			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
-+			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
- 		}
+-		}
 -		goos = oldgoos
 -		goarch = oldgoarch
 -		os.Setenv("GOOS", goos)
@@ -264,10 +256,16 @@ index d82f612..5c8459c 100644
 -		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
 -		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
 -		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
++		if debug {
++			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
++			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
++			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
++			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
++		}
  	}
  
  	// Check that there are no new files in $GOROOT/bin other than
-@@ -1474,8 +1541,11 @@ func cmdbootstrap() {
+@@ -1459,8 +1526,11 @@ func cmdbootstrap() {
  		}
  	}
  
diff --git a/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
index 4b4d0d4f3da..534d4310456 100644
--- a/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -29,7 +29,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/go/internal/work/action.go
 +++ b/src/cmd/go/internal/work/action.go
-@@ -670,6 +670,9 @@ func (b *Builder) addTransitiveLinkDeps(
+@@ -673,6 +673,9 @@ func (b *Builder) addTransitiveLinkDeps(
  			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
  				continue
  			}
@@ -41,7 +41,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  			// we'll end up building an overall library or executable that depends at runtime
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -167,6 +167,8 @@ See also: go install, go get, go clean.
+@@ -197,6 +197,8 @@ See also: go install, go get, go clean.
  
  const concurrentGCBackendCompilationEnabledByDefault = true
  
@@ -50,7 +50,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  func init() {
  	// break init cycle
  	CmdBuild.Run = runBuild
-@@ -179,6 +181,10 @@ func init() {
+@@ -209,6 +211,10 @@ func init() {
  
  	AddBuildFlags(CmdBuild, DefaultBuildFlags)
  	AddBuildFlags(CmdInstall, DefaultBuildFlags)
@@ -63,7 +63,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  // Note that flags consulted by other parts of the code
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -468,6 +468,23 @@ func (b *Builder) build(a *Action) (err
+@@ -535,6 +535,23 @@ func (b *Builder) build(ctx context.Cont
  		return errors.New("binary-only packages are no longer supported")
  	}
  
@@ -87,7 +87,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
  	if err := b.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1520,6 +1537,14 @@ func BuildInstallFunc(b *Builder, a *Act
+@@ -1585,6 +1602,14 @@ func (b *Builder) linkShared(ctx context
  		return err
  	}
  
diff --git a/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch
index 4e5d5021d64..0ede623af97 100644
--- a/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch
+++ b/meta/recipes-devtools/go/go-1.18/0008-use-GOBUILDMODE-to-set-buildmode.patch
@@ -25,7 +25,7 @@ Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
 
 --- a/src/cmd/go/internal/work/build.go
 +++ b/src/cmd/go/internal/work/build.go
-@@ -254,7 +254,13 @@ func AddBuildFlags(cmd *base.Command, ma
+@@ -283,7 +283,13 @@ func AddBuildFlags(cmd *base.Command, ma
  
  	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
  	cmd.Flag.Var(buildCompiler{}, "compiler", "")
diff --git a/meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch b/meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
deleted file mode 100644
index f857b722347..00000000000
--- a/meta/recipes-devtools/go/go-1.18/0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 66a45dae3af140662e17ef85c2e6fe40270a2553 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 Feb 2021 17:54:01 -0800
-Subject: [PATCH] Revert "cmd/go: make sure CC and CXX are absolute"
-
-OE uses CC/CXX values which consists of cmpiler and options together,
-secondly, the environment is canned so this check add little value to OE
-based builds
-
-Fixes go-runtime build issues
-
-go install: CXX environment variable is relative; must be absolute path: powerpc64le-yoe-linux-musl-g++ -mlittle-endian -mhard-float -m64 -mabi=elfv2 -mcpu=power9 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/mnt/b/yoe/master/build/tmp/work/ppc64p9le-yoe-linux-musl/go/1.16-r0/recipe-sysroot
-
-This reverts commit aa161e799df7e1eba99d2be10271e76b6f758142.
-
-Upstream-Status: Inappropriate [OE-Specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cmd/go/internal/envcmd/env.go        |  5 -----
- src/cmd/go/internal/work/init.go         |  6 ------
- src/cmd/go/testdata/script/env_write.txt | 24 ------------------------
- 3 files changed, 35 deletions(-)
-
-diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index ff6f0d8..43b94e7 100644
---- a/src/cmd/go/internal/envcmd/env.go
-+++ b/src/cmd/go/internal/envcmd/env.go
-@@ -457,11 +457,6 @@ func checkEnvWrite(key, val string) error {
- 		if !filepath.IsAbs(val) && val != "" {
- 			return fmt.Errorf("GOPATH entry is relative; must be absolute path: %q", val)
- 		}
--	// Make sure CC and CXX are absolute paths
--	case "CC", "CXX", "GOMODCACHE":
--		if !filepath.IsAbs(val) && val != "" && val != filepath.Base(val) {
--			return fmt.Errorf("%s entry is relative; must be absolute path: %q", key, val)
--		}
- 	}
- 
- 	if !utf8.ValidString(val) {
-diff --git a/src/cmd/go/internal/work/init.go b/src/cmd/go/internal/work/init.go
-index 37a3e2d..316b0cf 100644
---- a/src/cmd/go/internal/work/init.go
-+++ b/src/cmd/go/internal/work/init.go
-@@ -39,12 +39,6 @@ func BuildInit() {
- 		cfg.BuildPkgdir = p
- 	}
- 
--	// Make sure CC and CXX are absolute paths
--	for _, key := range []string{"CC", "CXX"} {
--		if path := cfg.Getenv(key); !filepath.IsAbs(path) && path != "" && path != filepath.Base(path) {
--			base.Fatalf("go %s: %s environment variable is relative; must be absolute path: %s\n", flag.Args()[0], key, path)
--		}
--	}
- }
- 
- func instrumentInit() {
-diff --git a/src/cmd/go/testdata/script/env_write.txt b/src/cmd/go/testdata/script/env_write.txt
-index b5e9739..566c876 100644
---- a/src/cmd/go/testdata/script/env_write.txt
-+++ b/src/cmd/go/testdata/script/env_write.txt
-@@ -129,30 +129,6 @@ go env -w GOTMPDIR=
- go env GOTMPDIR
- stdout ^$
- 
--# go env -w rejects relative CC values
--[!windows] go env -w CC=/usr/bin/clang
--go env -w CC=clang
--[!windows] ! go env -w CC=./clang
--[!windows] ! go env -w CC=bin/clang
--[!windows] stderr 'go env -w: CC entry is relative; must be absolute path'
--
--[windows] go env -w CC=$WORK\bin\clang
--[windows] ! go env -w CC=.\clang
--[windows] ! go env -w CC=bin\clang
--[windows] stderr 'go env -w: CC entry is relative; must be absolute path'
--
--# go env -w rejects relative CXX values
--[!windows] go env -w CC=/usr/bin/cpp
--go env -w CXX=cpp
--[!windows] ! go env -w CXX=./cpp
--[!windows] ! go env -w CXX=bin/cpp
--[!windows] stderr 'go env -w: CXX entry is relative; must be absolute path'
--
--[windows] go env -w CXX=$WORK\bin\cpp
--[windows] ! go env -w CXX=.\cpp
--[windows] ! go env -w CXX=bin\cpp
--[windows] stderr 'go env -w: CXX entry is relative; must be absolute path'
--
- # go env -w/-u checks validity of GOOS/ARCH combinations
- env GOOS=
- env GOARCH=
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb b/meta/recipes-devtools/go/go-binary-native_1.18.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.18.bb
index 1b85cd50d61..500bb4ddcc0 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.18.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "980e65a863377e69fd9b67df9d8395fd8e93858e7a24c9f55803421e453f4f99"
-SRC_URI[go_linux_arm64.sha256sum] = "57a9171682e297df1a5bd287be056ed0280195ad079af90af16dcad4f64710cb"
+SRC_URI[go_linux_amd64.sha256sum] = "e85278e98f57cdb150fe8409e6e5df5343ecb13cebf03a5d5ff12bd55a80264f"
+SRC_URI[go_linux_arm64.sha256sum] = "7ac7b396a691e588c5fb57687759e6c4db84a2a3bbebb0765f4b38e5b1c5b00e"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.18.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.18.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.8.bb b/meta/recipes-devtools/go/go-cross_1.18.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.8.bb
rename to meta/recipes-devtools/go/go-cross_1.18.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.18.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.18.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.8.bb b/meta/recipes-devtools/go/go-native_1.18.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.8.bb
rename to meta/recipes-devtools/go/go-native_1.18.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.8.bb b/meta/recipes-devtools/go/go-runtime_1.18.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.18.bb
diff --git a/meta/recipes-devtools/go/go_1.17.8.bb b/meta/recipes-devtools/go/go_1.18.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.8.bb
rename to meta/recipes-devtools/go/go_1.18.bb
-- 
2.35.1


