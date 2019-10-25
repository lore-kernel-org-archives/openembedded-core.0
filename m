Return-Path: <>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 825ED7FA75
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:58:58 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 6so4367985wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=h5nT9OTXv5OiI1Tul/RXkvEkE+5kRJNYOPFuSulen8g=;
	b=hoblKDN1byKbdK3rFOPbUA9Uy29zTQmGeUIji/RkPdJo5bmMDGHRXZx8csGvZTxORJ
	LQmTDHnNct5AcdLbK9LR4Sk2NiprBNHu4FJlVpoForh1wM2K1IEK5yJO1kFUpCEjbpXU
	kPW78qtImj6Bt1upDmBo7Mb8I0VSHOQpM45vPDeSTcD9ErLO/uyIc0yIEbxWPAD0Zg1r
	I9+2H8zyVPbxVadg0Yx/gsxoSokLG5noI2RtnpetPolqv47uvFbnAbVvSnPzSeJToMIO
	EWFTlb5fea2Ii2qlPRGAN+UareofvxMFa2sk6t27n7CWXp4SNtOr8ochtyXsjOwwTeJ6
	fMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h5nT9OTXv5OiI1Tul/RXkvEkE+5kRJNYOPFuSulen8g=;
	b=tPmGoXsAXtuEey+fGD6aDEx96Cj/lvpOXkL+y+HxxMLw/0SEagVK6nu8UMOvNoGixW
	YIqb50DDCudBTGMuBCYFPH9SRYeMzjsh73szYspz+N0oivNce1YmAElGfKXJTIoWRTK9
	YBu7QXsvHBxiJ70OxQeo3EAzepiloG20f0qMwig6MT6+zJnJoyzql8YIUsG9a+/QORgy
	ZVc38MM2lBGAECSwhlODPFMuFc50b0IlVWpAWsetyjf64WOEM0STjiEis2HLPn4Yl5Fe
	xLRsCBEsvup9Ot7B9fP0PhPhhxpk5HcUzE1CWMb23bxNXu7sWGEkR6yxY/2/IqY23+ta
	TaDg==
X-Gm-Message-State: APjAAAUBYnLq6BJEohtgABExYIfcuAOprdXNOiuywu0gsD+EOKVinU+d
	IqJlk6UvlsZQRnFcTU3FALdLmUeS
X-Google-Smtp-Source: APXvYqwL+/l5jPz7Dm4H0w0uF3MAOSaxqrTOjcMAGz82udw3XGdIXbuNoSZdzTOSLNAm09aZ0I2Khg==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr3830042wmk.52.1572011937205; 
	Fri, 25 Oct 2019 06:58:57 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	w22sm2380726wmc.16.2019.10.25.06.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 06:58:56 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 18:28:44 +0430
Message-Id: <20191025135847.77492-1-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
Subject: [PATCH v4 1/4] go: Refactor patches for 1.13.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Oct 2019 13:58:59 -0000

From: Alex Kube <alexander.j.kube@gmail.com>

Signed-off-by: Alex Kube <alexander.j.kube@gmail.com>
---
 ...ow-CC-and-CXX-to-have-multiple-words.patch |  38 +++
 ...ent-based-hash-generation-less-pedan.patch | 226 ++++++++++++++
 ...-to-be-overridden-in-the-environment.patch |  54 ++++
 ...4-ld-add-soname-to-shareable-objects.patch |  50 ++++
 ...de-CC-when-building-dist-and-go_boot.patch |  44 +++
 ...dist-separate-host-and-target-builds.patch | 279 ++++++++++++++++++
 ...d-go-make-GOROOT-precious-by-default.patch | 113 +++++++
 ...008-use-GOBUILDMODE-to-set-buildmode.patch |  47 +++
 ...place-glibc-dynamic-linker-with-musl.patch | 134 +++++++++
 9 files changed, 985 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
 create mode 100644 meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch

diff --git a/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
new file mode 100644
index 0000000000..ddfd5e41d1
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0001-allow-CC-and-CXX-to-have-multiple-words.patch
@@ -0,0 +1,38 @@
+From 9e3dc44cdfa58d96504d0a789dc82617dd5bef55 Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:01:13 +0430
+Subject: [PATCH 1/9] cmd/go: Allow CC and CXX to have multiple words
+
+Upstream-Status: Inappropriate [OE specific]
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+
+---
+ src/cmd/go/internal/envcmd/env.go | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 17852de..7b5ec5e 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -100,11 +100,11 @@ func MkEnv() []cfg.EnvVar {
+ 
+ 	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
+ 	if env := strings.Fields(cfg.Getenv("CC")); len(env) > 0 {
+-		cc = env[0]
++		cc = strings.Join(env, " ")
+ 	}
+ 	cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
+ 	if env := strings.Fields(cfg.Getenv("CXX")); len(env) > 0 {
+-		cxx = env[0]
++		cxx = strings.Join(env, " ")
+ 	}
+ 	env = append(env, cfg.EnvVar{Name: "AR", Value: envOr("AR", "ar")})
+ 	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
new file mode 100644
index 0000000000..4eddd39809
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -0,0 +1,226 @@
+From a13ae484e41139094505d2834437e9262a5315f7 Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:14:22 +0430
+Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedantic
+
+Upstream-Status: Inappropriate [OE specific]
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
+Second, if cgo is enabled, the build ID for cgo-related
+packages will include the current value of the environment
+variables for invoking the compiler (CC, CXX, FC) and
+any CGO_xxFLAGS variables.  Only if the settings used
+during a compilation exactly match, character for character,
+the values used for compiling runtime/cgo or any other
+cgo-enabled package being imported, will the tool
+decide that the imported package is up-to-date.
+
+This is done to help ensure correctness, but is overly
+simplistic and effectively prevents the reuse of built
+artifacts that use cgo (or shared runtime, which includes
+runtime/cgo).
+
+This patch filters out all compiler flags except those
+beginning with '-m'.  The default behavior can be restored
+by setting the CGO_PEDANTIC environment variable.
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/cmd/go/internal/envcmd/env.go |  2 +-
+ src/cmd/go/internal/work/exec.go  | 66 ++++++++++++++++++++++---------
+ 2 files changed, 49 insertions(+), 19 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 7b5ec5e..292f117 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -154,7 +154,7 @@ func ExtraEnvVars() []cfg.EnvVar {
+ func ExtraEnvVarsCostly() []cfg.EnvVar {
+ 	var b work.Builder
+ 	b.Init()
+-	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
++	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
+ 	if err != nil {
+ 		// Should not happen - b.CFlags was given an empty package.
+ 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 7dd9a90..ccebaf8 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -32,6 +32,8 @@ import (
+ 	"time"
+ )
+ 
++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
++
+ // actionList returns the list of actions in the dag rooted at root
+ // as visited in a depth-first post-order traversal.
+ func actionList(root *Action) []*Action {
+@@ -205,7 +207,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	// The compiler hides the exact value of $GOROOT
+ 	// when building things in GOROOT.
+ 	// Assume b.WorkDir is being trimmed properly.
+-	if !p.Goroot && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir, b.WorkDir) {
++	if !p.Goroot && !omitGopath && !cfg.BuildTrimpath && !strings.HasPrefix(p.Dir, b.WorkDir) {
+ 		fmt.Fprintf(h, "dir %s\n", p.Dir)
+ 	}
+ 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
+@@ -219,13 +221,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	}
+ 	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
+ 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
+-		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p)
+-		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(), cppflags, cflags, ldflags)
++		cppflags, cflags, cxxflags, fflags, ldflags, _ := b.CFlags(p, true)
++		fmt.Fprintf(h, "CC=%q %q %q %q\n", b.ccExe(true), cppflags, cflags, ldflags)
+ 		if len(p.CXXFiles)+len(p.SwigFiles) > 0 {
+-			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(), cxxflags)
++			fmt.Fprintf(h, "CXX=%q %q\n", b.cxxExe(true), cxxflags)
+ 		}
+ 		if len(p.FFiles) > 0 {
+-			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(), fflags)
++			fmt.Fprintf(h, "FC=%q %q\n", b.fcExe(true), fflags)
+ 		}
+ 		// TODO(rsc): Should we include the SWIG version or Fortran/GCC/G++/Objective-C compiler versions?
+ 	}
+@@ -2229,33 +2231,48 @@ var (
+ // gccCmd returns a gcc command line prefix
+ // defaultCC is defined in zdefaultcc.go, written by cmd/dist.
+ func (b *Builder) GccCmd(incdir, workdir string) []string {
+-	return b.compilerCmd(b.ccExe(), incdir, workdir)
++	return b.compilerCmd(b.ccExe(false), incdir, workdir)
+ }
+ 
+ // gxxCmd returns a g++ command line prefix
+ // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
+ func (b *Builder) GxxCmd(incdir, workdir string) []string {
+-	return b.compilerCmd(b.cxxExe(), incdir, workdir)
++	return b.compilerCmd(b.cxxExe(false), incdir, workdir)
+ }
+ 
+ // gfortranCmd returns a gfortran command line prefix.
+ func (b *Builder) gfortranCmd(incdir, workdir string) []string {
+-	return b.compilerCmd(b.fcExe(), incdir, workdir)
++	return b.compilerCmd(b.fcExe(false), incdir, workdir)
+ }
+ 
+ // ccExe returns the CC compiler setting without all the extra flags we add implicitly.
+-func (b *Builder) ccExe() []string {
+-	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch))
++func (b *Builder) ccExe(filtered bool) []string {
++	return b.compilerExe(origCC, cfg.DefaultCC(cfg.Goos, cfg.Goarch), filtered)
+ }
+ 
+ // cxxExe returns the CXX compiler setting without all the extra flags we add implicitly.
+-func (b *Builder) cxxExe() []string {
+-	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch))
++func (b *Builder) cxxExe(filtered bool) []string {
++	return b.compilerExe(origCXX, cfg.DefaultCXX(cfg.Goos, cfg.Goarch), filtered)
+ }
+ 
+ // fcExe returns the FC compiler setting without all the extra flags we add implicitly.
+-func (b *Builder) fcExe() []string {
+-	return b.compilerExe(cfg.Getenv("FC"), "gfortran")
++func (b *Builder) fcExe(filtered bool) []string {
++	return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
++}
++
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
+ }
+ 
+ // compilerExe returns the compiler to use given an
+@@ -2264,11 +2281,16 @@ func (b *Builder) fcExe() []string {
+ // of the compiler but can have additional arguments if they
+ // were present in the environment value.
+ // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
+-func (b *Builder) compilerExe(envValue string, def string) []string {
++func (b *Builder) compilerExe(envValue string, def string, filtered bool) []string {
+ 	compiler := strings.Fields(envValue)
+ 	if len(compiler) == 0 {
+ 		compiler = []string{def}
+ 	}
++
++	if filtered {
++		return append(compiler[0:1], filterCompilerFlags(compiler[1:])...)
++	}
++
+ 	return compiler
+ }
+ 
+@@ -2429,7 +2451,7 @@ func envList(key, def string) []string {
+ }
+ 
+ // CFlags returns the flags to use when invoking the C, C++ or Fortran compilers, or cgo.
+-func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
++func (b *Builder) CFlags(p *load.Package, filtered bool) (cppflags, cflags, cxxflags, fflags, ldflags []string, err error) {
+ 	defaults := "-g -O2"
+ 
+ 	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
+@@ -2448,6 +2470,14 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+ 		return
+ 	}
+ 
++	if filtered {
++		cppflags = filterCompilerFlags(cppflags)
++		cflags = filterCompilerFlags(cflags)
++		cxxflags = filterCompilerFlags(cxxflags)
++		fflags = filterCompilerFlags(fflags)
++		ldflags = filterCompilerFlags(ldflags)
++	}
++
+ 	return
+ }
+ 
+@@ -2462,7 +2492,7 @@ var cgoRe = lazyregexp.New(`[/\\:]`)
+ 
+ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
+ 	p := a.Package
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
+@@ -2821,7 +2851,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+ 
+ // Run SWIG on one SWIG input file.
+ func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return "", "", err
+ 	}
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
new file mode 100644
index 0000000000..9aa0119ae9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -0,0 +1,54 @@
+From 28ada8896b76d620240bafc22aa395071d601482 Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:15:37 +0430
+Subject: [PATCH 3/9] cmd/go: Allow GOTOOLDIR to be overridden in the environment
+
+to allow for split host/target build roots
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/cmd/dist/build.go          | 4 +++-
+ src/cmd/go/internal/cfg/cfg.go | 6 +++++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 9e50311..683ca6f 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -244,7 +244,9 @@ func xinit() {
+ 	workdir = xworkdir()
+ 	xatexit(rmworkdir)
+ 
+-	tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
++	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
++		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
++	}
+ }
+ 
+ // compilerEnv returns a map from "goos/goarch" to the
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
+index a3277a6..db96350 100644
+--- a/src/cmd/go/internal/cfg/cfg.go
++++ b/src/cmd/go/internal/cfg/cfg.go
+@@ -60,7 +60,11 @@ func defaultContext() build.Context {
+ 		// variables. This matches the initialization of ToolDir in
+ 		// go/build, except for using ctxt.GOROOT rather than
+ 		// runtime.GOROOT.
+-		build.ToolDir = filepath.Join(ctxt.GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++		if s := os.Getenv("GOTOOLDIR"); s != "" {
++			build.ToolDir = filepath.Clean(s)
++		} else {
++			build.ToolDir = filepath.Join(ctxt.GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++		}
+ 	}
+ 
+ 	ctxt.GOPATH = envOr("GOPATH", ctxt.GOPATH)
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
new file mode 100644
index 0000000000..40763ad5b1
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0004-ld-add-soname-to-shareable-objects.patch
@@ -0,0 +1,50 @@
+From bf5cf5301ae5914498454c87293d1df2e1d8489f Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:16:32 +0430
+Subject: [PATCH 4/9] ld: add soname to shareable objects
+
+so that OE's shared library dependency handling
+can find them.
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/cmd/link/internal/ld/lib.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
+index 3fa258d..f96fb02 100644
+--- a/src/cmd/link/internal/ld/lib.go
++++ b/src/cmd/link/internal/ld/lib.go
+@@ -1215,6 +1215,7 @@ func (ctxt *Link) hostlink() {
+ 				argv = append(argv, "-Wl,-z,relro")
+ 			}
+ 			argv = append(argv, "-shared")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 			if ctxt.HeadType != objabi.Hwindows {
+ 				// Pass -z nodelete to mark the shared library as
+ 				// non-closeable: a dlclose will do nothing.
+@@ -1226,6 +1227,7 @@ func (ctxt *Link) hostlink() {
+ 			argv = append(argv, "-Wl,-z,relro")
+ 		}
+ 		argv = append(argv, "-shared")
++		argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 	case BuildModePlugin:
+ 		if ctxt.HeadType == objabi.Hdarwin {
+ 			argv = append(argv, "-dynamiclib")
+@@ -1234,6 +1236,7 @@ func (ctxt *Link) hostlink() {
+ 				argv = append(argv, "-Wl,-z,relro")
+ 			}
+ 			argv = append(argv, "-shared")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 		}
+ 	}
+ 
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
new file mode 100644
index 0000000000..4f2a46c6ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -0,0 +1,44 @@
+From f05ef3ded52b98537c10efd0b15cd9612471524d Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:17:16 +0430
+Subject: [PATCH 5/9] make.bash: override CC when building dist and
+ go_bootstrap
+
+for handling OE cross-canadian builds.
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/make.bash | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/make.bash b/src/make.bash
+index 92d1481..0c2822f 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -177,7 +177,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+ 	exit 1
+ fi
+ rm -f cmd/dist/dist
+-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" GO111MODULE=off "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
+ 
+ # -e doesn't propagate out of eval, so check success by hand.
+ eval $(./cmd/dist/dist env -p || echo FAIL=true)
+@@ -208,7 +208,7 @@ fi
+ # Run dist bootstrap to complete make.bash.
+ # Bootstrap installs a proper cmd/dist, built with the new toolchain.
+ # Throw ours, built with Go 1.4, away after bootstrap.
+-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
+ rm -f ./cmd/dist/dist
+ 
+ # DO NOT ADD ANY NEW CODE HERE.
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
new file mode 100644
index 0000000000..354aaca3a1
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -0,0 +1,279 @@
+From 10735bb84df17ba657f76835f483cd8543a879c1 Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:18:12 +0430
+Subject: [PATCH 6/9] cmd/dist: separate host and target builds
+
+Upstream-Status: Inappropriate [OE specific]
+
+Change the dist tool to allow for OE-style cross-
+and cross-canadian builds:
+
+ - command flags --host-only and --target only are added;
+   if one is present, the other changes mentioned below
+   take effect, and arguments may also be specified on
+   the command line to enumerate the package(s) to be
+   built.
+
+ - for OE cross builds, go_bootstrap is always built for
+   the current build host, and is moved, along with the supporting
+   toolchain (asm, compile, etc.) to a separate 'native_native'
+   directory under GOROOT/pkg/tool.
+
+ - go_bootstrap is not automatically removed after the build,
+   so it can be reused later (e.g., building both static and
+   shared runtime).
+
+Note that for --host-only builds, it would be nice to specify
+just the "cmd" package to build only the go commands/tools,
+the staleness checks in the dist tool will fail if the "std"
+library has not also been built.  So host-only builds have to
+build everything anyway.
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/cmd/dist/build.go | 155 ++++++++++++++++++++++++++++++------------
+ 1 file changed, 112 insertions(+), 43 deletions(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 683ca6f..0ad082b 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -41,6 +41,7 @@ var (
+ 	goldflags        string
+ 	workdir          string
+ 	tooldir          string
++	build_tooldir    string
+ 	oldgoos          string
+ 	oldgoarch        string
+ 	exe              string
+@@ -53,6 +54,7 @@ var (
+ 
+ 	rebuildall   bool
+ 	defaultclang bool
++	crossBuild   bool
+ 
+ 	vflag int // verbosity
+ )
+@@ -247,6 +249,8 @@ func xinit() {
+ 	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
+ 		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
+ 	}
++
++	build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
+ }
+ 
+ // compilerEnv returns a map from "goos/goarch" to the
+@@ -478,8 +482,10 @@ func setup() {
+ 	p := pathf("%s/pkg/%s_%s", goroot, gohostos, gohostarch)
+ 	if rebuildall {
+ 		xremoveall(p)
++		xremoveall(build_tooldir)
+ 	}
+ 	xmkdirall(p)
++	xmkdirall(build_tooldir)
+ 
+ 	if goos != gohostos || goarch != gohostarch {
+ 		p := pathf("%s/pkg/%s_%s", goroot, goos, goarch)
+@@ -1207,12 +1213,29 @@ func cmdbootstrap() {
+ 
+ 	var noBanner bool
+ 	var debug bool
++	var hostOnly bool
++	var targetOnly bool
++	var toBuild = []string{"std", "cmd"}
++
+ 	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
+ 	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
+ 	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
++	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
++	flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
+ 
+-	xflagparse(0)
++	xflagparse(-1)
+ 
++	if hostOnly && targetOnly {
++		fatalf("specify only one of --host-only or --target-only\n")
++	}
++	crossBuild = hostOnly || targetOnly
++	if flag.NArg() > 0 {
++		if crossBuild {
++			toBuild = flag.Args()
++		} else {
++			fatalf("package names not permitted without --host-only or --target-only\n")
++		}
++	}
+ 	// Set GOPATH to an internal directory. We shouldn't actually
+ 	// need to store files here, since the toolchain won't
+ 	// depend on modules outside of vendor directories, but if
+@@ -1266,8 +1289,13 @@ func cmdbootstrap() {
+ 		xprintf("\n")
+ 	}
+ 
+-	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
+-	goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
++	// For split host/target cross/cross-canadian builds, we don't
++	// want to be setting these flags until after we have compiled
++	// the toolchain that runs on the build host.
++	if !crossBuild {
++		gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
++		goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
++	}
+ 	goBootstrap := pathf("%s/go_bootstrap", tooldir)
+ 	cmdGo := pathf("%s/go", gobin)
+ 	if debug {
+@@ -1296,7 +1324,11 @@ func cmdbootstrap() {
+ 		xprintf("\n")
+ 	}
+ 	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
+-	os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++	if crossBuild {
++		os.Setenv("CC", defaultcc[""])
++	} else {
++		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++	}
+ 	goInstall(goBootstrap, append([]string{"-i"}, toolchain...)...)
+ 	if debug {
+ 		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
+@@ -1333,50 +1365,84 @@ func cmdbootstrap() {
+ 	}
+ 	checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
+ 
+-	if goos == oldgoos && goarch == oldgoarch {
+-		// Common case - not setting up for cross-compilation.
+-		timelog("build", "toolchain")
+-		if vflag > 0 {
+-			xprintf("\n")
++	if crossBuild {
++		gogcflags = os.Getenv("GO_GCFLAGS")
++		goldflags = os.Getenv("GO_LDFLAGS")
++		tool_files, _ := filepath.Glob(pathf("%s/*", tooldir))
++		for _, f := range tool_files {
++			copyfile(pathf("%s/%s", build_tooldir, filepath.Base(f)), f, writeExec)
++			xremove(f)
++		}
++		os.Setenv("GOTOOLDIR", build_tooldir)
++		goBootstrap = pathf("%s/go_bootstrap", build_tooldir)
++		if hostOnly {
++			timelog("build", "host toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			xprintf("Building %s for host, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
++			goInstall(goBootstrap, toBuild...)
++			checkNotStale(goBootstrap, toBuild...)
++			// Skip cmdGo staleness checks here, since we can't necessarily run the cmdGo binary
++
++			timelog("build", "target toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++		} else if targetOnly {
++			goos = oldgoos
++			goarch = oldgoarch
++			os.Setenv("GOOS", goos)
++			os.Setenv("GOARCH", goarch)
++			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++			xprintf("Building %s for target, %s/%s.\n", strings.Join(toBuild, ","), goos, goarch)
++			goInstall(goBootstrap, toBuild...)
++			checkNotStale(goBootstrap, toBuild...)
++			// Skip cmdGo staleness checks here, since we can't run the target's cmdGo binary
+ 		}
+-		xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
+ 	} else {
+-		// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
+-		// Finish GOHOSTOS/GOHOSTARCH installation and then
+-		// run GOOS/GOARCH installation.
+-		timelog("build", "host toolchain")
+-		if vflag > 0 {
+-			xprintf("\n")
+-		}
+-		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
++
++		if goos == oldgoos && goarch == oldgoarch {
++			// Common case - not setting up for cross-compilation.
++			timelog("build", "toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			xprintf("Building packages and commands for %s/%s.\n", goos, goarch)
++		} else {
++			// GOOS/GOARCH does not match GOHOSTOS/GOHOSTARCH.
++			// Finish GOHOSTOS/GOHOSTARCH installation and then
++			// run GOOS/GOARCH installation.
++			timelog("build", "host toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
++			goInstall(goBootstrap, "std", "cmd")
++			checkNotStale(goBootstrap, "std", "cmd")
++			checkNotStale(cmdGo, "std", "cmd")
++
++			timelog("build", "target toolchain")
++			if vflag > 0 {
++				xprintf("\n")
++			}
++			goos = oldgoos
++			goarch = oldgoarch
++			os.Setenv("GOOS", goos)
++			os.Setenv("GOARCH", goarch)
++			os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
++			xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
++		}
+ 		goInstall(goBootstrap, "std", "cmd")
+ 		checkNotStale(goBootstrap, "std", "cmd")
+ 		checkNotStale(cmdGo, "std", "cmd")
+ 
+-		timelog("build", "target toolchain")
+-		if vflag > 0 {
+-			xprintf("\n")
++		if debug {
++			run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
++			run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
++			checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
++			copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 		}
+-		goos = oldgoos
+-		goarch = oldgoarch
+-		os.Setenv("GOOS", goos)
+-		os.Setenv("GOARCH", goarch)
+-		os.Setenv("CC", compilerEnvLookup(defaultcc, goos, goarch))
+-		xprintf("Building packages and commands for target, %s/%s.\n", goos, goarch)
+-	}
+-	targets := []string{"std", "cmd"}
+-	if goos == "js" && goarch == "wasm" {
+-		// Skip the cmd tools for js/wasm. They're not usable.
+-		targets = targets[:1]
+-	}
+-	goInstall(goBootstrap, targets...)
+-	checkNotStale(goBootstrap, targets...)
+-	checkNotStale(cmdGo, targets...)
+-	if debug {
+-		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
+-		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
+-		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
+-		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 	}
+ 
+ 	// Check that there are no new files in $GOROOT/bin other than
+@@ -1393,8 +1459,11 @@ func cmdbootstrap() {
+ 		}
+ 	}
+ 
+-	// Remove go_bootstrap now that we're done.
+-	xremove(pathf("%s/go_bootstrap", tooldir))
++	// Except that for split host/target cross-builds, we need to
++	// keep it.
++	if !crossBuild {
++		xremove(pathf("%s/go_bootstrap", tooldir))
++	}
+ 
+ 	if goos == "android" {
+ 		// Make sure the exec wrapper will sync a fresh $GOROOT to the device.
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
new file mode 100644
index 0000000000..e232c79199
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -0,0 +1,113 @@
+From 9ba507e076c744f4d394418e4a849e68cd426a4a Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:18:56 +0430
+Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
+
+Upstream-Status: Inappropriate [OE specific]
+
+The go build tool normally rebuilds whatever it detects is
+stale.  This can be a problem when GOROOT is intended to
+be read-only and the go runtime has been built as a shared
+library, since we don't want every application to be rebuilding
+the shared runtime - particularly in cross-build/packaging
+setups, since that would lead to 'abi mismatch' runtime errors.
+
+This patch prevents the install and linkshared actions from
+installing to GOROOT unless overridden with the GOROOT_OVERRIDE
+environment variable.
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/cmd/go/internal/work/action.go |  3 +++
+ src/cmd/go/internal/work/build.go  |  6 ++++++
+ src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
+ 3 files changed, 34 insertions(+)
+
+diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
+index 33b7818..7617b4c 100644
+--- a/src/cmd/go/internal/work/action.go
++++ b/src/cmd/go/internal/work/action.go
+@@ -662,6 +662,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
+ 			if p1 == nil || p1.Shlib == "" || haveShlib[filepath.Base(p1.Shlib)] {
+ 				continue
+ 			}
++			if goRootPrecious && (p1.Standard || p1.Goroot) {
++				continue
++			}
+ 			haveShlib[filepath.Base(p1.Shlib)] = true
+ 			// TODO(rsc): The use of ModeInstall here is suspect, but if we only do ModeBuild,
+ 			// we'll end up building an overall library or executable that depends at runtime
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 9305b2d..6560317 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -155,6 +155,8 @@ See also: go install, go get, go clean.
+ 
+ const concurrentGCBackendCompilationEnabledByDefault = true
+ 
++var goRootPrecious bool = true
++
+ func init() {
+ 	// break init cycle
+ 	CmdBuild.Run = runBuild
+@@ -167,6 +169,10 @@ func init() {
+ 
+ 	AddBuildFlags(CmdBuild)
+ 	AddBuildFlags(CmdInstall)
++
++	if x := os.Getenv("GOROOT_OVERRIDE"); x != "" {
++		goRootPrecious = false
++	}
+ }
+ 
+ // Note that flags consulted by other parts of the code
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index ccebaf8..59450d7 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -455,6 +455,23 @@ func (b *Builder) build(a *Action) (err error) {
+ 		return errors.New("binary-only packages are no longer supported")
+ 	}
+ 
++	if goRootPrecious && (a.Package.Standard || a.Package.Goroot) {
++		_, err := os.Stat(a.Package.Target)
++		if err == nil {
++			a.built = a.Package.Target
++			a.Target = a.Package.Target
++			a.buildID = b.fileHash(a.Package.Target)
++			a.Package.Stale = false
++			a.Package.StaleReason = "GOROOT-resident package"
++			return nil
++		}
++		a.Package.Stale = true
++		a.Package.StaleReason = "missing or invalid GOROOT-resident package"
++		if b.IsCmdList {
++			return nil
++		}
++	}
++
+ 	if err := b.Mkdir(a.Objdir); err != nil {
+ 		return err
+ 	}
+@@ -1499,6 +1516,14 @@ func BuildInstallFunc(b *Builder, a *Action) (err error) {
+ 		return nil
+ 	}
+ 
++	if goRootPrecious && a.Package != nil {
++		p := a.Package
++		if p.Standard || p.Goroot {
++			err := fmt.Errorf("attempting to install package %s into read-only GOROOT", p.ImportPath)
++			return err
++		}
++	}
++
+ 	if err := b.Mkdir(a.Objdir); err != nil {
+ 		return err
+ 	}
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch b/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
new file mode 100644
index 0000000000..68e132f30a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0008-use-GOBUILDMODE-to-set-buildmode.patch
@@ -0,0 +1,47 @@
+From 971b5626339ce0c4d57f9721c9a81af566c5a044 Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:19:26 +0430
+Subject: [PATCH 8/9] cmd/go: Use GOBUILDMODE to set buildmode
+
+Upstream-Status: Denied [upstream choose antoher solution: `17a256b
+cmd/go: -buildmode=pie for android/arm']
+
+While building go itself, the go build system does not support
+to set `-buildmode=pie' from environment.
+
+Add GOBUILDMODE to support it which make PIE executables the default
+build mode, as PIE executables are required as of Yocto
+
+Refers: https://groups.google.com/forum/#!topic/golang-dev/gRCe5URKewI
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Hongxu Jia <hongxu.jia@windriver.com>
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/cmd/go/internal/work/build.go | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 6560317..5f3a988 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -231,7 +231,13 @@ func AddBuildFlags(cmd *base.Command) {
+ 
+ 	cmd.Flag.Var(&load.BuildAsmflags, "asmflags", "")
+ 	cmd.Flag.Var(buildCompiler{}, "compiler", "")
+-	cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
++
++	if bm := os.Getenv("GOBUILDMODE"); bm != "" {
++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", bm, "")
++	} else {
++		cmd.Flag.StringVar(&cfg.BuildBuildmode, "buildmode", "default", "")
++	}
++
+ 	cmd.Flag.Var(&load.BuildGcflags, "gcflags", "")
+ 	cmd.Flag.Var(&load.BuildGccgoflags, "gccgoflags", "")
+ 	cmd.Flag.StringVar(&cfg.BuildMod, "mod", "", "")
+-- 
+2.17.1 (Apple Git-112)
+
diff --git a/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
new file mode 100644
index 0000000000..4bb1106f09
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.13/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
@@ -0,0 +1,134 @@
+From 973251ae0c69a35721f6115345d3f57b2847979f Mon Sep 17 00:00:00 2001
+From: Alex Kube <alexander.j.kube@gmail.com>
+Date: Wed, 23 Oct 2019 21:20:13 +0430
+Subject: [PATCH 9/9] ld: replace glibc dynamic linker with musl
+
+Rework of patch by Khem Raj <raj.khem@gmail.com>
+for go 1.10.  Should be applied conditionally on
+musl being the system C library.
+
+Adapted to Go 1.13 from patches originally submitted to
+the meta/recipes-devtools/go tree by
+Matt Madison <matt@madison.systems>.
+
+Upstream-Status: Inappropriate [Real fix should be portable across libcs]
+
+Signed-off-by: Alexander J Kube <alexander.j.kube@gmail.com>
+---
+ src/cmd/link/internal/amd64/obj.go  | 2 +-
+ src/cmd/link/internal/arm/obj.go    | 2 +-
+ src/cmd/link/internal/arm64/obj.go  | 2 +-
+ src/cmd/link/internal/mips/obj.go   | 2 +-
+ src/cmd/link/internal/mips64/obj.go | 2 +-
+ src/cmd/link/internal/ppc64/obj.go  | 2 +-
+ src/cmd/link/internal/s390x/obj.go  | 2 +-
+ src/cmd/link/internal/x86/obj.go    | 2 +-
+ 8 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/src/cmd/link/internal/amd64/obj.go b/src/cmd/link/internal/amd64/obj.go
+index 23741eb..8e74576 100644
+--- a/src/cmd/link/internal/amd64/obj.go
++++ b/src/cmd/link/internal/amd64/obj.go
+@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		PEreloc1:         pereloc1,
+ 		TLSIEtoLE:        tlsIEtoLE,
+ 
+-		Linuxdynld:     "/lib64/ld-linux-x86-64.so.2",
++		Linuxdynld:     "/lib64/ld-musl-x86-64.so.1",
+ 		Freebsddynld:   "/libexec/ld-elf.so.1",
+ 		Openbsddynld:   "/usr/libexec/ld.so",
+ 		Netbsddynld:    "/libexec/ld.elf_so",
+diff --git a/src/cmd/link/internal/arm/obj.go b/src/cmd/link/internal/arm/obj.go
+index 45a406e..724d3e3 100644
+--- a/src/cmd/link/internal/arm/obj.go
++++ b/src/cmd/link/internal/arm/obj.go
+@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Machoreloc1:      machoreloc1,
+ 		PEreloc1:         pereloc1,
+ 
+-		Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for EABI
++		Linuxdynld:     "/lib/ld-musl-armhf.so.1",
+ 		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
+ 		Openbsddynld:   "/usr/libexec/ld.so",
+ 		Netbsddynld:    "/libexec/ld.elf_so",
+diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/arm64/obj.go
+index 7c66623..d8b1db1 100644
+--- a/src/cmd/link/internal/arm64/obj.go
++++ b/src/cmd/link/internal/arm64/obj.go
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld: "/lib/ld-linux-aarch64.so.1",
++		Linuxdynld: "/lib/ld-musl-aarch64.so.1",
+ 
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "/usr/libexec/ld.so",
+diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/mips/obj.go
+index 231e1ff..631dd7a 100644
+--- a/src/cmd/link/internal/mips/obj.go
++++ b/src/cmd/link/internal/mips/obj.go
+@@ -60,7 +60,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld: "/lib/ld.so.1",
++		Linuxdynld: "/lib/ld-musl-mipsle.so.1",
+ 
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/mips64/obj.go b/src/cmd/link/internal/mips64/obj.go
+index 9604208..5ef3ffc 100644
+--- a/src/cmd/link/internal/mips64/obj.go
++++ b/src/cmd/link/internal/mips64/obj.go
+@@ -59,7 +59,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld:     "/lib64/ld64.so.1",
++		Linuxdynld:     "/lib64/ld-musl-mips64le.so.1",
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+ 		Netbsddynld:    "XXX",
+diff --git a/src/cmd/link/internal/ppc64/obj.go b/src/cmd/link/internal/ppc64/obj.go
+index 51d1791..b15da85 100644
+--- a/src/cmd/link/internal/ppc64/obj.go
++++ b/src/cmd/link/internal/ppc64/obj.go
+@@ -63,7 +63,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Xcoffreloc1:      xcoffreloc1,
+ 
+ 		// TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
+-		Linuxdynld: "/lib64/ld64.so.1",
++		Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
+ 
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/s390x/obj.go
+index 3454476..42cc346 100644
+--- a/src/cmd/link/internal/s390x/obj.go
++++ b/src/cmd/link/internal/s390x/obj.go
+@@ -57,7 +57,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld: "/lib64/ld64.so.1",
++		Linuxdynld: "/lib64/ld-musl-s390x.so.1",
+ 
+ 		// not relevant for s390x
+ 		Freebsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/x86/obj.go b/src/cmd/link/internal/x86/obj.go
+index f1fad20..d2ca10c 100644
+--- a/src/cmd/link/internal/x86/obj.go
++++ b/src/cmd/link/internal/x86/obj.go
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Machoreloc1:      machoreloc1,
+ 		PEreloc1:         pereloc1,
+ 
+-		Linuxdynld:   "/lib/ld-linux.so.2",
++		Linuxdynld:   "/lib/ld-musl-i386.so.1",
+ 		Freebsddynld: "/usr/libexec/ld-elf.so.1",
+ 		Openbsddynld: "/usr/libexec/ld.so",
+ 		Netbsddynld:  "/usr/libexec/ld.elf_so",
+-- 
+2.17.1 (Apple Git-112)
+
-- 
2.17.1 (Apple Git-112)


