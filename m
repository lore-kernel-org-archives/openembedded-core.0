Return-Path: <matt@madison.systems>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8A5178A86
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 21:09:43 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id u13-v6so8543206plq.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 13:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NOEgtO5zvgEL4zO253m4S57ai1aoE4y+Kie+pJ3/Y0M=;
	b=bqyhAxIgcS7apHQJrr6UWS9G8wpBR+K/mmlaTpjeIveH2z+XKwNjDHV0AFe1KCBrGQ
	bwXufRCwXHlyvrMLQtH5ECARXRTJKCcceTL5LN2qQNFOHcPXuSGdqqx15fYMFmecQTkH
	i1O5cBMCAE218Gos2wMH0iWAe13lGjfYP0TZ7jsS+QmqYEXF/G4jBVwz/99hg8o9Wtlp
	jDmc/h/TvHdlj3KGcpEyfDS4R/loZ8Ww337w7ViISahv8THeONsiJZ5FeJAmHFWfvlMo
	8oqCDYbqA9gAOTXuHSZyC6zt039kI/Oq3i9WYbGrh42o8tGsy8qUQJaUVCyDFykr0lsB
	mvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NOEgtO5zvgEL4zO253m4S57ai1aoE4y+Kie+pJ3/Y0M=;
	b=SBXXoaNGGYszGyrgYsTl40BWgqFDUMeXP1/LjT3HKIE1DiR/EksYlUCeXSu2pTJ58m
	pUfuG/w+LKQpeSrGZJRM3KrfQ4zq8EiEVwkY77OpFdMtgIYix47bAZsegRzKt4jfBkyi
	pbkM7D2CerIg6A1k7BXMALbNRR7EASZCaR56rnDcujdNoR+qdqt2crVa/4Gnqr4lJGP3
	Gc+uhi0G8yVguj8iy5JyV8qe4+K3f7O/w4WIGAPbiFBNF31BpP4hpRwgZlkil6hQNGA2
	2tYd5OIAQZSJXru+NSSiTlrFiFsTNDvZ4Rv6shQQUIzSwB7tbTnfWjlBeP32bdZx2vgM
	Kyog==
X-Gm-Message-State: APf1xPBMZGJUzkfoqRGs8ojxpq/Ct9tGPg5pJvpxo+T2fFtJcSpR4UUn
	SBPtlIa3d6EXAcQFwd7mga5BOv/s
X-Google-Smtp-Source: AG47ELtGxE8iuJZk5UhuIyPtlf8iPI3WBPhGUOku2VQuwIekEDxuDF/THndDT83HCkDVH2bMIVK2Hg==
X-Received: by 2002:a17:902:424:: with SMTP id
	33-v6mr11205631ple.433.1520197783018; 
	Sun, 04 Mar 2018 13:09:43 -0800 (PST)
Received: from workhorse.athrat.org (c-67-170-200-185.hsd1.ca.comcast.net.
	[67.170.200.185]) by smtp.gmail.com with ESMTPSA id
	x123sm18594829pgb.5.2018.03.04.13.09.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 13:09:41 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 13:09:25 -0800
Message-Id: <20180304210937.29727-2-matt@madison.systems>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
References: <20180304210937.29727-1-matt@madison.systems>
Subject: [PATCH v5 01/13] go: update go 1.9 -> go 1.10
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
X-List-Received-Date: Sun, 04 Mar 2018 21:09:43 -0000

* Patches and recipes reworked for go 1.10's significant
  changes to its bootstrap and build steps.

* Update go1.4 source tarball used for go-native
  bootstrapping to the version recommended
  in the current go documentation

* Remove test data from installed sources to eliminate
  some packaging QA warnings

* Set GOCACHE to 'off' to disable 1.10's build caching
  in the go recipes and bbclass

* Update go_do_compile to compile both static and
  dynamic objects dynamic linking is in use, since
  go1.10's build tool is pickier about this

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/go.bbclass                            |   6 +
 meta/recipes-devtools/go/go-1.10.inc               |  22 ++
 ...1-allow-CC-and-CXX-to-have-multiple-words.patch |  33 +++
 ...-content-based-hash-generation-less-pedan.patch | 220 ++++++++++++++++
 ...OLDIR-to-be-overridden-in-the-environment.patch |  64 +++++
 .../0004-ld-add-soname-to-shareable-objects.patch  |  47 ++++
 ...verride-CC-when-building-dist-and-go_boot.patch |  40 +++
 ...-cmd-dist-separate-host-and-target-builds.patch | 277 +++++++++++++++++++++
 ...07-cmd-go-make-GOROOT-precious-by-default.patch | 108 ++++++++
 ...l-obj-arm64-fix-branch-too-far-with-TBZ-l.patch |  58 +++++
 ...ld-replace-glibc-dynamic-linker-with-musl.patch | 130 ++++++++++
 meta/recipes-devtools/go/go-common.inc             |   2 +
 meta/recipes-devtools/go/go-cross-canadian.inc     |  27 +-
 meta/recipes-devtools/go/go-cross-canadian_1.10.bb |   2 +
 meta/recipes-devtools/go/go-cross-canadian_1.9.bb  |  10 +
 meta/recipes-devtools/go/go-cross.inc              |  55 ++--
 meta/recipes-devtools/go/go-cross_1.10.bb          |   2 +
 meta/recipes-devtools/go/go-cross_1.9.bb           |   8 +
 meta/recipes-devtools/go/go-crosssdk.inc           |  16 +-
 meta/recipes-devtools/go/go-crosssdk_1.10.bb       |   2 +
 meta/recipes-devtools/go/go-crosssdk_1.9.bb        |   9 +
 meta/recipes-devtools/go/go-native.inc             |  26 +-
 meta/recipes-devtools/go/go-native_1.10.bb         |   2 +
 meta/recipes-devtools/go/go-native_1.9.bb          |   2 +
 meta/recipes-devtools/go/go-runtime.inc            |  58 +++--
 meta/recipes-devtools/go/go-runtime_1.10.bb        |   2 +
 meta/recipes-devtools/go/go-runtime_1.9.bb         |  21 ++
 meta/recipes-devtools/go/go-target.inc             |  21 +-
 meta/recipes-devtools/go/go_1.10.bb                |   2 +
 meta/recipes-devtools/go/go_1.9.bb                 |  15 ++
 30 files changed, 1183 insertions(+), 104 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.10.inc
 create mode 100644 meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch
 create mode 100644 meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-cross_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-native_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go-runtime_1.10.bb
 create mode 100644 meta/recipes-devtools/go/go_1.10.bb

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 7ecd8c9254..a01b28bccd 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -24,6 +24,7 @@ GO_LINKMODE ?= ""
 GO_LINKMODE_class-nativesdk = "--linkmode=external"
 GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS}"
+export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
 export GOPTESTFLAGS ?= "-test.v"
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
@@ -47,6 +48,7 @@ GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 export GOPATH = "${B}"
+export GOCACHE = "off"
 GO_TMPDIR ?= "${WORKDIR}/go-tmp"
 GO_TMPDIR[vardepvalue] = ""
 
@@ -88,6 +90,10 @@ go_do_compile() {
 	export TMPDIR="${GO_TMPDIR}"
 	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
+		if [ -n "${GO_LINKSHARED}" ]; then
+			${GO} install ${GOBUILDFLAGS} `go_list_packages`
+			rm -rf ${B}/bin
+		fi
 		${GO} install ${GO_LINKSHARED} ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
diff --git a/meta/recipes-devtools/go/go-1.10.inc b/meta/recipes-devtools/go/go-1.10.inc
new file mode 100644
index 0000000000..08d1ba6551
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10.inc
@@ -0,0 +1,22 @@
+require go-common.inc
+
+GO_BASEVERSION = "1.10"
+FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+
+SRC_URI += "\
+    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
+    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
+    file://0004-ld-add-soname-to-shareable-objects.patch \
+    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+    file://0006-cmd-dist-separate-host-and-target-builds.patch \
+    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+    file://0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch \
+"
+
+SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
+
+SRC_URI[main.md5sum] = "07cbb9d0091b846c6aea40bf5bc0cea7"
+SRC_URI[main.sha256sum] = "f3de49289405fda5fd1483a8fe6bd2fa5469e005fd567df64485c4fa000c7f24"
diff --git a/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
new file mode 100644
index 0000000000..3bb33b0146
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0001-allow-CC-and-CXX-to-have-multiple-words.patch
@@ -0,0 +1,33 @@
+From 7a7de46129fa6859fb6311096eb9f54c53c7fe2f Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Mon, 19 Feb 2018 08:49:33 -0800
+Subject: [PATCH 1/9] allow CC and CXX to have multiple words
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/envcmd/env.go | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 603f7b5060..f891123f9c 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -82,11 +82,11 @@ func MkEnv() []cfg.EnvVar {
+ 
+ 	cc := cfg.DefaultCC(cfg.Goos, cfg.Goarch)
+ 	if env := strings.Fields(os.Getenv("CC")); len(env) > 0 {
+-		cc = env[0]
++		cc = strings.Join(env, " ")
+ 	}
+ 	cxx := cfg.DefaultCXX(cfg.Goos, cfg.Goarch)
+ 	if env := strings.Fields(os.Getenv("CXX")); len(env) > 0 {
+-		cxx = env[0]
++		cxx = strings.Join(env, " ")
+ 	}
+ 	env = append(env, cfg.EnvVar{Name: "CC", Value: cc})
+ 	env = append(env, cfg.EnvVar{Name: "CXX", Value: cxx})
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
new file mode 100644
index 0000000000..74f37a99ef
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0002-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -0,0 +1,220 @@
+From 8b2feaee81d7a16adc59e61d06c1e7314d3a5408 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Mon, 19 Feb 2018 08:50:59 -0800
+Subject: [PATCH 2/9] cmd/go: make content-based hash generation less pedantic
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
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/envcmd/env.go |  2 +-
+ src/cmd/go/internal/work/exec.go  | 63 ++++++++++++++++++++++++++++-----------
+ 2 files changed, 46 insertions(+), 19 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index f891123f9c..ebacfbfdbc 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -113,7 +113,7 @@ func findEnv(env []cfg.EnvVar, name string) string {
+ func ExtraEnvVars() []cfg.EnvVar {
+ 	var b work.Builder
+ 	b.Init()
+-	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
++	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
+ 	if err != nil {
+ 		// Should not happen - b.CFlags was given an empty package.
+ 		fmt.Fprintf(os.Stderr, "go: invalid cflags: %v\n", err)
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index c4c1500eb2..b0f6b45647 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -173,6 +173,8 @@ func (b *Builder) Do(root *Action) {
+ 	wg.Wait()
+ }
+ 
++var omitGopath = os.Getenv("GOPATH_OMIT_IN_ACTIONID") != ""
++
+ // buildActionID computes the action ID for a build action.
+ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	p := a.Package
+@@ -189,7 +191,7 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	// but it does not hide the exact value of $GOPATH.
+ 	// Include the full dir in that case.
+ 	// Assume b.WorkDir is being trimmed properly.
+-	if !p.Goroot && !strings.HasPrefix(p.Dir, b.WorkDir) {
++	if !p.Goroot && !omitGopath && !strings.HasPrefix(p.Dir, b.WorkDir) {
+ 		fmt.Fprintf(h, "dir %s\n", p.Dir)
+ 	}
+ 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
+@@ -197,13 +199,13 @@ func (b *Builder) buildActionID(a *Action) cache.ActionID {
+ 	fmt.Fprintf(h, "omitdebug %v standard %v local %v prefix %q\n", p.Internal.OmitDebug, p.Standard, p.Internal.Local, p.Internal.LocalPrefix)
+ 	if len(p.CgoFiles)+len(p.SwigFiles) > 0 {
+ 		fmt.Fprintf(h, "cgo %q\n", b.toolID("cgo"))
+-		cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p)
+-		fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(), cppflags, cflags)
++		cppflags, cflags, cxxflags, fflags, _, _ := b.CFlags(p, true)
++		fmt.Fprintf(h, "CC=%q %q %q\n", b.ccExe(true), cppflags, cflags)
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
+@@ -1731,33 +1733,33 @@ var (
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
+-	return b.compilerExe(os.Getenv("FC"), "gfortran")
++func (b *Builder) fcExe(filtered bool) []string {
++	return b.compilerExe(os.Getenv("FC"), "gfortran", filtered)
+ }
+ 
+ // compilerExe returns the compiler to use given an
+@@ -1766,11 +1768,14 @@ func (b *Builder) fcExe() []string {
+ // of the compiler but can have additional arguments if they
+ // were present in the environment value.
+ // For example if CC="gcc -DGOPHER" then the result is ["gcc", "-DGOPHER"].
+-func (b *Builder) compilerExe(envValue string, def string) []string {
++func (b *Builder) compilerExe(envValue string, def string, filtered bool) []string {
+ 	compiler := strings.Fields(envValue)
+ 	if len(compiler) == 0 {
+ 		compiler = []string{def}
+ 	}
++	if filtered {
++		return append(compiler[0:1], filterCompilerFlags(compiler[1:])...)
++	}
+ 	return compiler
+ }
+ 
+@@ -1920,8 +1925,23 @@ func envList(key, def string) []string {
+ 	return strings.Fields(v)
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
+@@ -1939,6 +1959,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
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
+@@ -1954,7 +1981,7 @@ var cgoRe = regexp.MustCompile(`[/\\:]`)
+ 
+ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, gxxfiles, mfiles, ffiles []string) (outGo, outObj []string, err error) {
+ 	p := a.Package
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, cgoFFLAGS, cgoLDFLAGS, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return nil, nil, err
+ 	}
+@@ -2306,7 +2333,7 @@ func (b *Builder) swigIntSize(objdir string) (intsize string, err error) {
+ 
+ // Run SWIG on one SWIG input file.
+ func (b *Builder) swigOne(a *Action, p *load.Package, file, objdir string, pcCFLAGS []string, cxx bool, intgosize string) (outGo, outC string, err error) {
+-	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p)
++	cgoCPPFLAGS, cgoCFLAGS, cgoCXXFLAGS, _, _, err := b.CFlags(p, false)
+ 	if err != nil {
+ 		return "", "", err
+ 	}
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
new file mode 100644
index 0000000000..818fe66700
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
@@ -0,0 +1,64 @@
+From acd179b49f1fc8d6f7f69e569fb4a56039c725a1 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 05:24:20 -0800
+Subject: [PATCH 3/9] allow GOTOOLDIR to be overridden in the environment
+
+to allow for split host/target build roots
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/dist/build.go          | 4 +++-
+ src/cmd/go/internal/cfg/cfg.go | 6 +++++-
+ src/go/build/build.go          | 2 +-
+ 3 files changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index 49ed80033e..afc615b5c2 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -220,7 +220,9 @@ func xinit() {
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
+index 1de4f0dc79..4f6010d660 100644
+--- a/src/cmd/go/internal/cfg/cfg.go
++++ b/src/cmd/go/internal/cfg/cfg.go
+@@ -96,7 +96,11 @@ func init() {
+ 	// as the tool directory does not move based on environment variables.
+ 	// This matches the initialization of ToolDir in go/build,
+ 	// except for using GOROOT rather than runtime.GOROOT().
+-	build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++	if s := os.Getenv("GOTOOLDIR"); s != "" {
++		build.ToolDir = filepath.Clean(s)
++	} else {
++		build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++	}
+ }
+ 
+ func findGOROOT() string {
+diff --git a/src/go/build/build.go b/src/go/build/build.go
+index 68fb423983..81b1b32270 100644
+--- a/src/go/build/build.go
++++ b/src/go/build/build.go
+@@ -1594,7 +1594,7 @@ func init() {
+ }
+ 
+ // ToolDir is the directory containing build tools.
+-var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
+ 
+ // IsLocalImport reports whether the import path is
+ // a local import path, like ".", "..", "./foo", or "../foo".
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
new file mode 100644
index 0000000000..c23ca94290
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0004-ld-add-soname-to-shareable-objects.patch
@@ -0,0 +1,47 @@
+From 85252f0bd8743223eb778edbe9fb31dff17a23d8 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 06:26:10 -0800
+Subject: [PATCH 4/9] ld: add soname to shareable objects
+
+so that OE's shared library dependency handling
+can find them.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/link/internal/ld/lib.go | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
+index 6dcaf64122..11cbb8a8bb 100644
+--- a/src/cmd/link/internal/ld/lib.go
++++ b/src/cmd/link/internal/ld/lib.go
+@@ -1134,6 +1134,7 @@ func (ctxt *Link) hostlink() {
+ 				argv = append(argv, "-Wl,-z,relro")
+ 			}
+ 			argv = append(argv, "-shared")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 			if ctxt.HeadType != objabi.Hwindows {
+ 				// Pass -z nodelete to mark the shared library as
+ 				// non-closeable: a dlclose will do nothing.
+@@ -1145,6 +1146,8 @@ func (ctxt *Link) hostlink() {
+ 			argv = append(argv, "-Wl,-z,relro")
+ 		}
+ 		argv = append(argv, "-shared")
++		argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
++
+ 	case BuildModePlugin:
+ 		if ctxt.HeadType == objabi.Hdarwin {
+ 			argv = append(argv, "-dynamiclib")
+@@ -1153,6 +1156,7 @@ func (ctxt *Link) hostlink() {
+ 				argv = append(argv, "-Wl,-z,relro")
+ 			}
+ 			argv = append(argv, "-shared")
++			argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
+ 		}
+ 	}
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
new file mode 100644
index 0000000000..67a93939f5
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
@@ -0,0 +1,40 @@
+From 16124d84648f4dfdfa4738c5660b5400b30bf9da Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 06:32:45 -0800
+Subject: [PATCH 5/9] make.bash: override CC when building dist and
+ go_bootstrap
+
+for handling OE cross-canadian builds.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/make.bash | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/make.bash b/src/make.bash
+index 93a5c43d11..3a63682bc4 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -162,7 +162,7 @@ if [ "$GOROOT_BOOTSTRAP" = "$GOROOT" ]; then
+ 	exit 1
+ fi
+ rm -f cmd/dist/dist
+-GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
++CC="${BUILD_CC:-${CC}}" GOROOT="$GOROOT_BOOTSTRAP" GOOS="" GOARCH="" "$GOROOT_BOOTSTRAP/bin/go" build -o cmd/dist/dist ./cmd/dist
+ 
+ # -e doesn't propagate out of eval, so check success by hand.
+ eval $(./cmd/dist/dist env -p || echo FAIL=true)
+@@ -193,7 +193,7 @@ fi
+ # Run dist bootstrap to complete make.bash.
+ # Bootstrap installs a proper cmd/dist, built with the new toolchain.
+ # Throw ours, built with Go 1.4, away after bootstrap.
+-./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
++CC="${BUILD_CC:-${CC}}" ./cmd/dist/dist bootstrap $buildall $vflag $GO_DISTFLAGS "$@"
+ rm -f ./cmd/dist/dist
+ 
+ # DO NOT ADD ANY NEW CODE HERE.
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
new file mode 100644
index 0000000000..9fe6996284
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0006-cmd-dist-separate-host-and-target-builds.patch
@@ -0,0 +1,277 @@
+From 2f07af34697c61decdcfa5b11434451fbcf37704 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sat, 17 Feb 2018 10:03:48 -0800
+Subject: [PATCH 6/9] cmd/dist: separate host and target builds
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
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+
+more dist cleanup
+---
+ src/cmd/dist/build.go | 149 +++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 111 insertions(+), 38 deletions(-)
+
+diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
+index afc615b5c2..36262665b2 100644
+--- a/src/cmd/dist/build.go
++++ b/src/cmd/dist/build.go
+@@ -38,6 +38,7 @@ var (
+ 	goldflags        string
+ 	workdir          string
+ 	tooldir          string
++	build_tooldir	 string
+ 	oldgoos          string
+ 	oldgoarch        string
+ 	exe              string
+@@ -49,6 +50,7 @@ var (
+ 
+ 	rebuildall   bool
+ 	defaultclang bool
++	crossBuild   bool
+ 
+ 	vflag int // verbosity
+ )
+@@ -223,6 +225,8 @@ func xinit() {
+ 	if tooldir = os.Getenv("GOTOOLDIR"); tooldir == "" {
+ 		tooldir = pathf("%s/pkg/tool/%s_%s", goroot, gohostos, gohostarch)
+ 	}
++	build_tooldir = pathf("%s/pkg/tool/native_native", goroot)
++
+ }
+ 
+ // compilerEnv returns a map from "goos/goarch" to the
+@@ -252,7 +256,6 @@ func compilerEnv(envName, def string) map[string]string {
+ 		if gohostos != goos || gohostarch != goarch {
+ 			m[gohostos+"/"+gohostarch] = m[""]
+ 		}
+-		m[""] = env
+ 	}
+ 
+ 	for _, goos := range okgoos {
+@@ -479,8 +482,10 @@ func setup() {
+ 	// We keep it in pkg/, just like the object directory above.
+ 	if rebuildall {
+ 		xremoveall(tooldir)
++		xremoveall(build_tooldir)
+ 	}
+ 	xmkdirall(tooldir)
++	xmkdirall(build_tooldir)
+ 
+ 	// Remove tool binaries from before the tool/gohostos_gohostarch
+ 	xremoveall(pathf("%s/bin/tool", goroot))
+@@ -1130,11 +1135,29 @@ func cmdbootstrap() {
+ 
+ 	var noBanner bool
+ 	var debug bool
++	var hostOnly bool
++	var targetOnly bool
++	var toBuild = []string { "std", "cmd" }
++
+ 	flag.BoolVar(&rebuildall, "a", rebuildall, "rebuild all")
+ 	flag.BoolVar(&debug, "d", debug, "enable debugging of bootstrap process")
+ 	flag.BoolVar(&noBanner, "no-banner", noBanner, "do not print banner")
++	flag.BoolVar(&hostOnly, "host-only", hostOnly, "build only host binaries, not target")
++	flag.BoolVar(&targetOnly, "target-only", targetOnly, "build only target binaries, not host")
+ 
+-	xflagparse(0)
++	xflagparse(-1)
++
++	if (hostOnly && targetOnly) {
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
+ 
+ 	if debug {
+ 		// cmd/buildid is used in debug mode.
+@@ -1182,8 +1205,13 @@ func cmdbootstrap() {
+ 		xprintf("\n")
+ 	}
+ 
+-	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
+-	goldflags = os.Getenv("GO_LDFLAGS")
++	// For split host/target cross/cross-canadian builds, we don't
++	// want to be setting these flags until after we have compiled
++	// the toolchain that runs on the build host.
++	if ! crossBuild {
++		gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
++		goldflags = os.Getenv("GO_LDFLAGS")
++	}
+ 	goBootstrap := pathf("%s/go_bootstrap", tooldir)
+ 	cmdGo := pathf("%s/go", gobin)
+ 	if debug {
+@@ -1212,7 +1240,11 @@ func cmdbootstrap() {
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
+@@ -1249,45 +1281,82 @@ func cmdbootstrap() {
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
+ 		}
+-		xprintf("Building packages and commands for host, %s/%s.\n", goos, goarch)
+ 		goInstall(goBootstrap, "std", "cmd")
+ 		checkNotStale(goBootstrap, "std", "cmd")
+ 		checkNotStale(cmdGo, "std", "cmd")
+-
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
+-	goInstall(goBootstrap, "std", "cmd")
+-	checkNotStale(goBootstrap, "std", "cmd")
+-	checkNotStale(cmdGo, "std", "cmd")
+-	if debug {
+-		run("", ShowOutput|CheckExit, pathf("%s/compile", tooldir), "-V=full")
+-		run("", ShowOutput|CheckExit, pathf("%s/buildid", tooldir), pathf("%s/pkg/%s_%s/runtime/internal/sys.a", goroot, goos, goarch))
+-		checkNotStale(goBootstrap, append(toolchain, "runtime/internal/sys")...)
+-		copyfile(pathf("%s/compile4", tooldir), pathf("%s/compile", tooldir), writeExec)
+ 	}
+ 
+ 	// Check that there are no new files in $GOROOT/bin other than
+@@ -1305,7 +1374,11 @@ func cmdbootstrap() {
+ 	}
+ 
+ 	// Remove go_bootstrap now that we're done.
+-	xremove(pathf("%s/go_bootstrap", tooldir))
++	// Except that for split host/target cross-builds, we need to
++	// keep it.
++	if ! crossBuild {
++		xremove(pathf("%s/go_bootstrap", tooldir))
++	}
+ 
+ 	// Print trailing banner unless instructed otherwise.
+ 	if !noBanner {
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
new file mode 100644
index 0000000000..72427627bc
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0007-cmd-go-make-GOROOT-precious-by-default.patch
@@ -0,0 +1,108 @@
+From f98aa287941417226a6e4f78759f8a5e19732cde Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Fri, 2 Mar 2018 06:00:20 -0800
+Subject: [PATCH 7/9] cmd/go: make GOROOT precious by default
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
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/work/action.go |  3 +++
+ src/cmd/go/internal/work/build.go  |  5 +++++
+ src/cmd/go/internal/work/exec.go   | 25 +++++++++++++++++++++++++
+ 3 files changed, 33 insertions(+)
+
+diff --git a/src/cmd/go/internal/work/action.go b/src/cmd/go/internal/work/action.go
+index 9f1f8f8a50..a382880474 100644
+--- a/src/cmd/go/internal/work/action.go
++++ b/src/cmd/go/internal/work/action.go
+@@ -563,6 +563,9 @@ func (b *Builder) addTransitiveLinkDeps(a, a1 *Action, shlib string) {
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
+index 57b7b00879..e2ba95420e 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -143,6 +143,7 @@ See also: go install, go get, go clean.
+ }
+ 
+ const concurrentGCBackendCompilationEnabledByDefault = true
++var goRootPrecious bool = true
+ 
+ func init() {
+ 	// break init cycle
+@@ -156,6 +157,10 @@ func init() {
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
+index b0f6b45647..c8f266a8ad 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -371,6 +371,23 @@ func (b *Builder) build(a *Action) (err error) {
+ 		return fmt.Errorf("missing or invalid binary-only package")
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
++		if b.ComputeStaleOnly {
++			a.Package.Stale = true
++			a.Package.StaleReason = "missing or invalid GOROOT-resident package"
++			return nil
++		}
++	}
++
+ 	if err := b.Mkdir(a.Objdir); err != nil {
+ 		return err
+ 	}
+@@ -1097,6 +1114,14 @@ func BuildInstallFunc(b *Builder, a *Action) (err error) {
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
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch b/meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch
new file mode 100644
index 0000000000..1e754178d5
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0008-cmd-internal-obj-arm64-fix-branch-too-far-with-TBZ-l.patch
@@ -0,0 +1,58 @@
+From 41b90ed7af10a071ccfeede6a429e0d80518436d Mon Sep 17 00:00:00 2001
+From: Cherry Zhang <cherryyz@google.com>
+Date: Sat, 17 Feb 2018 10:31:39 -0500
+Subject: [PATCH 8/9] cmd/internal/obj/arm64: fix branch-too-far with TBZ like
+ instructions
+
+The compiler now emits TBZ like instructions, but the assembler's
+too-far-branch patch code didn't include that case. Add it.
+
+Fixes #23889.
+
+Change-Id: Ib75f9250c660b9fb652835fbc83263a5d5073dc5
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ src/cmd/internal/obj/arm64/asm7.go     | 11 +++++++++--
+ src/cmd/internal/obj/arm64/asm_test.go |  1 +
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/internal/obj/arm64/asm7.go b/src/cmd/internal/obj/arm64/asm7.go
+index ca81238c93..b1ee552489 100644
+--- a/src/cmd/internal/obj/arm64/asm7.go
++++ b/src/cmd/internal/obj/arm64/asm7.go
+@@ -696,9 +696,16 @@ func span7(ctxt *obj.Link, cursym *obj.LSym, newprog obj.ProgAlloc) {
+ 			o = c.oplook(p)
+ 
+ 			/* very large branches */
+-			if (o.type_ == 7 || o.type_ == 39) && p.Pcond != nil { // 7: BEQ and like, 39: CBZ and like
++			if (o.type_ == 7 || o.type_ == 39 || o.type_ == 40) && p.Pcond != nil { // 7: BEQ and like, 39: CBZ and like, 40: TBZ and like
+ 				otxt := p.Pcond.Pc - pc
+-				if otxt <= -(1<<18)+10 || otxt >= (1<<18)-10 {
++				var toofar bool
++				switch o.type_ {
++				case 7, 39: // branch instruction encodes 19 bits
++					toofar = otxt <= -(1<<20)+10 || otxt >= (1<<20)-10
++				case 40: // branch instruction encodes 14 bits
++					toofar = otxt <= -(1<<15)+10 || otxt >= (1<<15)-10
++				}
++				if toofar {
+ 					q := c.newprog()
+ 					q.Link = p.Link
+ 					p.Link = q
+diff --git a/src/cmd/internal/obj/arm64/asm_test.go b/src/cmd/internal/obj/arm64/asm_test.go
+index 369c48f510..3e0c9c13a6 100644
+--- a/src/cmd/internal/obj/arm64/asm_test.go
++++ b/src/cmd/internal/obj/arm64/asm_test.go
+@@ -52,6 +52,7 @@ func TestLarge(t *testing.T) {
+ // gen generates a very large program, with a very far conditional branch.
+ func gen(buf *bytes.Buffer) {
+ 	fmt.Fprintln(buf, "TEXT f(SB),0,$0-0")
++	fmt.Fprintln(buf, "TBZ $5, R0, label")
+ 	fmt.Fprintln(buf, "CBZ R0, label")
+ 	fmt.Fprintln(buf, "BEQ label")
+ 	for i := 0; i < 1<<19; i++ {
+-- 
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch b/meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
new file mode 100644
index 0000000000..06b00b3cc2
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.10/0009-ld-replace-glibc-dynamic-linker-with-musl.patch
@@ -0,0 +1,130 @@
+From f575d85c4bd9b2903223d6c0dcc38a12775d582f Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Sun, 18 Feb 2018 08:24:05 -0800
+Subject: [PATCH 9/9] ld: replace glibc dynamic linker with musl
+
+Rework of patch by Khem Raj <raj.khem@gmail.com>
+for go 1.10.  Should be applied conditionally on
+musl being the system C library.
+
+Upstream-Status: Inappropriate [Real fix should be portable across libcs]
+
+Signed-off-by: Matt Madison <matt@madison.systems>
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
+index 87e809166a..f522a63034 100644
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
+index da16f92345..fd14940ede 100644
+--- a/src/cmd/link/internal/arm/obj.go
++++ b/src/cmd/link/internal/arm/obj.go
+@@ -58,7 +58,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Gentext:          gentext,
+ 		Machoreloc1:      machoreloc1,
+ 
+-		Linuxdynld:     "/lib/ld-linux.so.3", // 2 for OABI, 3 for EABI
++		Linuxdynld:     "/lib/ld-musl-armhf.so.1",
+ 		Freebsddynld:   "/usr/libexec/ld-elf.so.1",
+ 		Openbsddynld:   "/usr/libexec/ld.so",
+ 		Netbsddynld:    "/libexec/ld.elf_so",
+diff --git a/src/cmd/link/internal/arm64/obj.go b/src/cmd/link/internal/arm64/obj.go
+index 6b386ad737..99863712cc 100644
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
+ 		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/mips/obj.go b/src/cmd/link/internal/mips/obj.go
+index c5d3451c39..fd85e6368d 100644
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
+index 83974e5b56..097224f6da 100644
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
+index 273d9b42cb..a503abe8ea 100644
+--- a/src/cmd/link/internal/ppc64/obj.go
++++ b/src/cmd/link/internal/ppc64/obj.go
+@@ -62,7 +62,7 @@ func Init() (*sys.Arch, ld.Arch) {
+ 		Machoreloc1:      machoreloc1,
+ 
+ 		// TODO(austin): ABI v1 uses /usr/lib/ld.so.1,
+-		Linuxdynld: "/lib64/ld64.so.1",
++		Linuxdynld: "/lib64/ld-musl-powerpc64le.so.1",
+ 
+ 		Freebsddynld:   "XXX",
+ 		Openbsddynld:   "XXX",
+diff --git a/src/cmd/link/internal/s390x/obj.go b/src/cmd/link/internal/s390x/obj.go
+index 9ac7eb8217..3825ff7abe 100644
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
+index 6a744dc04e..d81f392549 100644
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
+2.14.1
+
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 37138b51ed..611775b2cc 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -22,6 +22,8 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 SSTATE_SCAN_CMD = "true"
 
+export GOROOT_OVERRIDE = "1"
+
 do_compile_prepend() {
 	BUILD_CC=${BUILD_CC}
 }
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 8afda6b2ce..e22914e7aa 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -7,34 +7,33 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOHOSTOS_CROSS = "${HOST_GOOS}"
-export GOHOSTARCH_CROSS = "${HOST_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
-export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
-CC = "${HOST_PREFIX}gcc"
-export CGO_CFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${CFLAGS}"
-export CGO_LDFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"
-export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"'
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
+export CGO_CFLAGS = "${CFLAGS}"
+export CGO_LDFLAGS = "${LDFLAGS}"
+export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_HOST} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
+	export CC_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+	export CXX_FOR_${HOST_GOOS}_${HOST_GOARCH}="${HOST_PREFIX}gxx --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
 	cd src
 	./make.bash --host-only --no-banner
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 
 make_wrapper() {
-    rm -f ${D}${bindir}/$2
-    cat <<END >${D}${bindir}/$2
+	rm -f ${D}${bindir}/$2
+	cat <<END >${D}${bindir}/$2
 #!/bin/sh
 here=\`dirname \$0\`
 native_goroot=\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
@@ -46,7 +45,7 @@ export GOTOOLDIR="\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
 test -n "\$GOROOT" || export GOROOT="\$OECORE_TARGET_SYSROOT/${target_libdir}/go"
 \$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
 END
-    chmod +x ${D}${bindir}/$2
+	chmod +x ${D}${bindir}/$2
 }
 
 do_install() {
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.10.bb
new file mode 100644
index 0000000000..7ac9449e47
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross-canadian_1.10.bb
@@ -0,0 +1,2 @@
+require go-cross-canadian.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
index 7ac9449e47..0306fdf684 100644
--- a/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
+++ b/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
@@ -1,2 +1,12 @@
 require go-cross-canadian.inc
 require go-${PV}.inc
+
+export GOHOSTOS_CROSS = "${HOST_GOOS}"
+export GOHOSTARCH_CROSS = "${HOST_GOARCH}"
+export CC_FOR_TARGET = "${HOST_PREFIX}gcc --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+export CXX_FOR_TARGET = "${HOST_PREFIX}g++ --sysroot=${STAGING_DIR_HOST}${SDKPATHNATIVE}"
+
+do_compile_prepend() {
+	export GOBIN="${B}/bin"
+	export TMPDIR="$GOTMPDIR"
+}
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 3ac7211bc3..fe92651581 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -1,7 +1,7 @@
 inherit cross
 
 PROVIDES = "virtual/${TARGET_PREFIX}go"
-DEPENDS += "go-native"
+DEPENDS = "go-native"
 
 PN = "go-cross-${TARGET_ARCH}"
 
@@ -13,26 +13,27 @@ export GOARM = "${TARGET_GOARM}"
 export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
-export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 do_configure[noexec] = "1"
 
 do_compile() {
-    export GOBIN="${B}/bin"
-    rm -rf ${GOBIN} ${B}/pkg
-    mkdir ${GOBIN}
-    cd src
-    ./make.bash --host-only
-    cd ${B}
+	export CC_FOR_${GOOS}_${GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	export CXX_FOR_${GOOS}_${GOARCh}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+	cd src
+	./make.bash --host-only --no-banner
+	cd ${B}
 }
-
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 make_wrapper() {
-    rm -f ${D}${bindir}/$2
-    cat <<END >${D}${bindir}/$2
+	rm -f ${D}${bindir}/$2
+	cat <<END >${D}${bindir}/$2
 #!/bin/bash
 here=\`dirname \$0\`
 export GOARCH="${TARGET_GOARCH}"
@@ -41,22 +42,22 @@ export GOARM="\${GOARM:-${TARGET_GOARM}}"
 export GO386="\${GO386:-${TARGET_GO386}}"
 \$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
 END
-    chmod +x ${D}${bindir}/$2
+	chmod +x ${D}${bindir}/$2
 }
 
 do_install() {
-    install -d ${D}${libdir}/go
-    cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
-    install -d ${D}${libdir}/go/src
-    (cd ${S}/src; for d in *; do \
-        [ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
-    done)
-    rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
-    install -d ${D}${bindir} ${D}${libdir}/go/bin
-    for f in ${B}/bin/*
-    do
-        base=`basename $f`
-        install -m755 $f ${D}${libdir}/go/bin
-        make_wrapper $base ${TARGET_PREFIX}$base
-    done
+	install -d ${D}${libdir}/go
+	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
+	install -d ${D}${libdir}/go/src
+	(cd ${S}/src; for d in *; do \
+		[ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
+	done)
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
+	install -d ${D}${bindir} ${D}${libdir}/go/bin
+	for f in ${B}/bin/*
+	do
+		base=`basename $f`
+		install -m755 $f ${D}${libdir}/go/bin
+		make_wrapper $base ${TARGET_PREFIX}$base
+	done
 }
diff --git a/meta/recipes-devtools/go/go-cross_1.10.bb b/meta/recipes-devtools/go/go-cross_1.10.bb
new file mode 100644
index 0000000000..80b5a03f6c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross_1.10.bb
@@ -0,0 +1,2 @@
+require go-cross.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-cross_1.9.bb b/meta/recipes-devtools/go/go-cross_1.9.bb
index 80b5a03f6c..4739c7d5c4 100644
--- a/meta/recipes-devtools/go/go-cross_1.9.bb
+++ b/meta/recipes-devtools/go/go-cross_1.9.bb
@@ -1,2 +1,10 @@
 require go-cross.inc
 require go-${PV}.inc
+
+export CC_FOR_TARGET = "${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+export CXX_FOR_TARGET = "${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+
+do_compile_prepend() {
+	export GOBIN="${B}/bin"
+	export TMPDIR="$GOTMPDIR"
+}
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index f67e4b92a0..05ca62eba8 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -11,21 +11,21 @@ export GOARCH = "${TARGET_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
-export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
-export GO_INSTALL = "cmd"
-CC = "${@d.getVar('BUILD_CC').strip()}"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
+	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
+	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}${SDKPATHNATIVE}"
 	cd src
-	./make.bash --host-only
+	./make.bash --host-only --no-banner
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 make_wrapper() {
     rm -f ${D}${bindir}/$2
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.10.bb
new file mode 100644
index 0000000000..1857c8a577
--- /dev/null
+++ b/meta/recipes-devtools/go/go-crosssdk_1.10.bb
@@ -0,0 +1,2 @@
+require go-crosssdk.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.9.bb
index 1857c8a577..3ac629bd41 100644
--- a/meta/recipes-devtools/go/go-crosssdk_1.9.bb
+++ b/meta/recipes-devtools/go/go-crosssdk_1.9.bb
@@ -1,2 +1,11 @@
 require go-crosssdk.inc
 require go-${PV}.inc
+
+export CC_FOR_TARGET = "${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+export CXX_FOR_TARGET = "${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+export GO_INSTALL = "cmd"
+
+do_compile_prepend() {
+	export GOBIN="${B}/bin"
+	export TMPDIR="$GOTMPDIR"
+}
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 95db1c2b7c..35561768df 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -4,34 +4,34 @@ nonstaging_libdir := "${libdir}"
 
 inherit native
 
-SRC_URI_append = " http://golang.org/dl/go1.4.3.src.tar.gz;name=bootstrap;subdir=go1.4"
-SRC_URI[bootstrap.md5sum] = "dfb604511115dd402a77a553a5923a04"
-SRC_URI[bootstrap.sha256sum] = "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959"
+SRC_URI_append = " https://dl.google.com/go/go1.4-bootstrap-20171003.tar.gz;name=bootstrap;subdir=go1.4"
+SRC_URI[bootstrap.md5sum] = "dbf727a4b0e365bf88d97cbfde590016"
+SRC_URI[bootstrap.sha256sum] = "f4ff5b5eb3a3cae1c993723f3eab519c5bae18866b5e5f96fe1102f0cb5c3e52"
 
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 CC = "${@d.getVar('BUILD_CC').strip()}"
 
 export CGO_ENABLED = "1"
+GOMAKEARGS ?= "--no-banner"
 
 do_configure() {
-    cd ${WORKDIR}/go1.4/go/src
-    CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
+	cd ${WORKDIR}/go1.4/go/src
+	CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
 }
 
 do_compile() {
-	export GOBIN="${B}/bin"
 	export GOROOT_FINAL="${nonstaging_libdir}/go"
 	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
-	rm -rf ${GOBIN}
-	mkdir ${GOBIN}
-
-	export TMPDIR=${WORKDIR}/build-tmp
-	mkdir -p ${WORKDIR}/build-tmp
 
 	cd src
-	./make.bash --host-only
+	./make.bash ${GOMAKEARGS}
+	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin"
 
 make_wrapper() {
 	rm -f ${D}${bindir}/$2$3
@@ -51,7 +51,7 @@ do_install() {
 	(cd ${S}/src; for d in *; do \
 		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
 	done)
-	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	install -d ${D}${bindir} ${D}${libdir}/go/bin
 	for f in ${B}/bin/*
 	do
diff --git a/meta/recipes-devtools/go/go-native_1.10.bb b/meta/recipes-devtools/go/go-native_1.10.bb
new file mode 100644
index 0000000000..bbf3c0dd73
--- /dev/null
+++ b/meta/recipes-devtools/go/go-native_1.10.bb
@@ -0,0 +1,2 @@
+require ${PN}.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-native_1.9.bb b/meta/recipes-devtools/go/go-native_1.9.bb
index bbf3c0dd73..8621e1df32 100644
--- a/meta/recipes-devtools/go/go-native_1.9.bb
+++ b/meta/recipes-devtools/go/go-native_1.9.bb
@@ -1,2 +1,4 @@
 require ${PN}.inc
 require go-${PV}.inc
+
+GOMAKEARGS = "--host-only --no-banner"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 29ae86e4ee..7a3b415b3f 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -10,11 +10,18 @@ export GOARM = "${TARGET_GOARM}"
 export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
-export GO_TARGET_INSTALL = "std"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET="${CC}"
-export CXX_FOR_TARGET="${CXX}"
-export GOROOT_OVERRIDE = "1"
+export CGO_CFLAGS = "${CFLAGS}"
+export CGO_CPPFLAGS = "${CPPFLAGS}"
+export CGO_CXXFLAGS = "${CXXFLAGS}"
+export CGO_LDFLAGS = "${LDFLAGS}"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
+GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
+GO_LINKMODE ?= ""
+GO_LINKMODE_class-nativesdk = "--linkmode=external"
+GO_LDFLAGS ?= '-ldflags="${GO_LINKMODE} -extldflags '${GO_EXTLDFLAGS}'"'
 
 do_configure() {
 	:
@@ -25,21 +32,20 @@ do_configure_libc-musl() {
 }
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	export CC="${@d.getVar('BUILD_CC').strip()}"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
+	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
+	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
+
 	cd src
-	./make.bash --host-only
-	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
-	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
-	./make.bash --target-only
+	./make.bash --target-only --no-banner std
 	if [ -n "${GO_DYNLINK}" ]; then
-		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
-		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash --target-only
+		export GOTOOLDIR="${B}/pkg/tool/native_native"
+		CC="$CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}" GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
+			$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=shared ${GO_LDFLAGS} std
 	fi
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 do_install() {
 	install -d ${D}${libdir}/go/src
@@ -54,20 +60,10 @@ do_install() {
 	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
 		cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
 	done
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	rm -f ${D}${libdir}/go/src/cmd/dist/dist
 }
 
-# Remove test binaries that cannot be relocated
-do_install_append_class-nativesdk() {
-	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
-}
-
-# These testdata directories aren't needed for builds and contain binaries
-# that can cause errors in sysroot_strip(), so just remove them.
-sysroot_stage_all_append() {
-	find ${SYSROOT_DESTDIR}${libdir}/go/src -depth -type d -name 'testdata' -exec rm -rf {} \;
-}
-
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN} = "${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*${SOLIBSDEV}"
 FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include \
@@ -78,8 +74,6 @@ FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*.shlibname \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.shlibname \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.shlibname \
-"
-FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*.a \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*.a \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*.a \
@@ -88,11 +82,15 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*.a \
                    ${libdir}/go/pkg/${TARGET_GOTUPLE}_dynlink/*/*/*/*/*/*/*.a \
 "
-# The testdata directories in the source tree include some binaries for various
-# architectures, scripts, and .a files
-INSANE_SKIP_${PN}-dev = "staticdev ldflags file-rdeps arch"
+FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE}"
+
+# Go sources include some scripts and pre-built binaries for
+# multiple architectures.  The static .a files for dynamically-linked
+# runtime are also required in -dev.
+INSANE_SKIP_${PN}-dev = "staticdev file-rdeps arch"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_SYSROOT_STRIP = "1"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/go/go-runtime_1.10.bb b/meta/recipes-devtools/go/go-runtime_1.10.bb
new file mode 100644
index 0000000000..43b68b4e46
--- /dev/null
+++ b/meta/recipes-devtools/go/go-runtime_1.10.bb
@@ -0,0 +1,2 @@
+require go-${PV}.inc
+require go-runtime.inc
diff --git a/meta/recipes-devtools/go/go-runtime_1.9.bb b/meta/recipes-devtools/go/go-runtime_1.9.bb
index 43b68b4e46..a99cc30f63 100644
--- a/meta/recipes-devtools/go/go-runtime_1.9.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.9.bb
@@ -1,2 +1,23 @@
 require go-${PV}.inc
 require go-runtime.inc
+
+export GO_TARGET_INSTALL = "std"
+export CC_FOR_TARGET = "${CC}"
+export CXX_FOR_TARGET = "${CXX}"
+
+do_compile() {
+	export GOBIN="${B}/bin"
+	export TMPDIR="$GOTMPDIR"
+	export CC=$BUILD_CC
+
+	cd src
+	./make.bash --host-only
+	cp ${B}/pkg/tool/${BUILD_GOTUPLE}/go_bootstrap ${B}
+	rm -rf ${B}/pkg/${TARGET_GOTUPLE}
+	./make.bash --target-only
+	if [ -n "${GO_DYNLINK}" ]; then
+		cp ${B}/go_bootstrap ${B}/pkg/tool/${BUILD_GOTUPLE}
+		GO_FLAGS="-buildmode=shared" GO_LDFLAGS="-extldflags \"${LDFLAGS}\"" ./make.bash --target-only
+	fi
+	cd ${B}
+}
diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index cac5d78227..a53a314c78 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -11,10 +11,9 @@ export GO386 = "${TARGET_GO386}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET = "${CC}"
-export CXX_FOR_TARGET = "${CXX}"
-export GO_TARGET_INSTALL = "cmd"
-export GO_FLAGS = "-a"
+export GOCACHE = "off"
+export GOTMPDIR ?= "${WORKDIR}/go-tmp"
+GOTMPDIR[vardepvalue] = ""
 GO_LDFLAGS = ""
 GO_LDFLAGS_class-nativesdk = "-linkmode external"
 export GO_LDFLAGS
@@ -25,24 +24,22 @@ SECURITY_LDFLAGS = ""
 do_configure[noexec] = "1"
 
 do_compile() {
-	export GOBIN="${B}/bin"
-	export CC="${@d.getVar('BUILD_CC').strip()}"
-	rm -rf ${GOBIN} ${B}/pkg
-	mkdir ${GOBIN}
-
-	export TMPDIR=${WORKDIR}/build-tmp
-	mkdir -p ${WORKDIR}/build-tmp
+	export CC_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CC}"
+	export CXX_FOR_${TARGET_GOOS}_${TARGET_GOARCH}="${CXX}"
 
 	cd src
-	./make.bash
+	./make.bash --target-only --no-banner
 	cd ${B}
 }
+do_compile[dirs] =+ "${GOTMPDIR} ${B}/bin ${B}/pkg"
+do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
 
 do_install() {
 	install -d ${D}${libdir}/go/pkg/tool
 	cp --preserve=mode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
 	install -d ${D}${libdir}/go/src
 	cp --preserve=mode,timestamps -R ${S}/src/cmd ${D}${libdir}/go/src/
+	find ${D}${libdir}/go/src -depth -type d -name testdata -exec rm -rf {} \;
 	install -d ${D}${libdir}/go/bin
 	install -d ${D}${bindir}
 	for f in ${B}/${GO_BUILD_BINDIR}/*; do
diff --git a/meta/recipes-devtools/go/go_1.10.bb b/meta/recipes-devtools/go/go_1.10.bb
new file mode 100644
index 0000000000..c67e2cb050
--- /dev/null
+++ b/meta/recipes-devtools/go/go_1.10.bb
@@ -0,0 +1,2 @@
+require go-${PV}.inc
+require go-target.inc
diff --git a/meta/recipes-devtools/go/go_1.9.bb b/meta/recipes-devtools/go/go_1.9.bb
index c67e2cb050..ec5a314e7d 100644
--- a/meta/recipes-devtools/go/go_1.9.bb
+++ b/meta/recipes-devtools/go/go_1.9.bb
@@ -1,2 +1,17 @@
 require go-${PV}.inc
 require go-target.inc
+
+export GO_TARGET_INSTALL = "cmd"
+export GO_FLAGS = "-a"
+export CC_FOR_TARGET = "${CC}"
+export CXX_FOR_TARGET = "${CXX}"
+
+do_compile() {
+	export GOBIN="${B}/bin"
+	export TMPDIR="$GOTMPDIR"
+	export CC=$BUILD_CC
+
+	cd src
+	./make.bash
+	cd ${B}
+}
-- 
2.14.1


