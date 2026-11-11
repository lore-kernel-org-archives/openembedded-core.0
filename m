Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3149.1794427818244401370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 12:10:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=bhWrhGn3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202611112010162ac391a59300020705-g_oiou@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202611112010162ac391a59300020705
        for <openembedded-core@lists.openembedded.org>;
        Wed, 11 Nov 2026 21:10:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XbGwK7XL6rhZhHit1lACf4R6I+SzQvKi4uJxN2tv2Y8=;
 b=bhWrhGn3ODG0rUS6OfJTVkNWXuLfDHtzzj/ld7Jb7kuUVlLzsO5Wm8+3VCd1HfHbBIO+l5
 PsEMCJUrWaT8t9eUUFnUKWpBPjoHTkAVFqzc/VM7mgH5a6Y7noHCfaitG+QVd5VBc63YgqWu
 0caVOYe8cvnLTBdsh6KqvkXEpr1m9b9vqR82FsxAG5JC1XPdyFS67X0+3xt6axdhwXlr9C/J
 KOEM62RJNUz8D2EM43dITbDAVp3LjYEkHrl7G5RzNm50RHi+cIM2qmzavlZC7GrEUlBo4LBi
 CHBsRTYhIztKKlXKBVnAM7ROL6FPdMOqEnTr9/F1U7RjKpJZGWUI2ItA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] go: upgrade 1.26.10 -> 1.26.11
Date: Wed, 11 Nov 2026 21:09:46 +0100
Message-ID: <20261111200946.2475630-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250054
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.10..go1.26.11
26b4433366 (tag: go1.26.11) [release-branch.go1.26] go1.26.11
0e6d155b1a [release-branch.go1.26] net/http: prevent HTTP/1 server crash due to MaxBytesReader header race
e9bc401e71 [release-branch.go1.26] cmd/go, cmd/compile: unquote //go:cgo_ldflag and bound slice removal
29cb161249 [release-branch.go1.26] cmd/cgo, cmd/compile, cmd/link: validate cgo_import_dynamic library names
820b5f3d5e [release-branch.go1.26] cmd/compile, cmd/link: validate cgo symbol names and prevent export overwrite
c8fc310648 [release-branch.go1.26] cmd/go, cmd/link: reject .syso files with Go object or unrecognized formats
616afe1c2c [release-branch.go1.26] cmd/go: disallow pkg-config local .pc paths and inspect cgoCPPFLAGS
1fa5bc200a [release-branch.go1.26] cmd/go: validate .syso and linker input files against scripts and embedded options
8d42fafae9 [release-branch.go1.26] cmd/go: validate split -Wl, next-arg flags and linker script targets
0e2c832156 [release-branch.go1.26] cmd/go: disallow separated -l flag followed by to_library
b164497298 [release-branch.go1.26] cmd/go: disallow -gen-* and -gnat* in flag allowlists
faaa8b62d6 [release-branch.go1.26] cmd/go: reject GCC spec files in linker search directories
c4a70ad796 [release-branch.go1.26] cmd/go: disallow --sysroot and -target, validate -isysroot/-syslibroot, and restrict -x
b9d636bd94 [release-branch.go1.26] cmd/compile: use a 32-bit type for rewritten rotate amounts
1216ba432c [release-branch.go1.26] net/http: clear io.EOF when Close drains a server request body
bdd49b5785 [release-branch.go1.26] net/http: don't rely on server request body not changing
cd900eea2a [release-branch.go1.26] crypto/internal/fips140/sha3: record legacy Keccak as non-approved
0fbac84598 [release-branch.go1.26] cmd/compile: fix misscompile in rewrite generic rules
ca2f246241 [release-branch.go1.26] crypto/internal/fips140/tls12: record SHA-384 as approved in MasterSecret
906c7c2145 [release-branch.go1.26] crypto/hkdf: remove unnecessary HMAC key length allowance for HKDF-Expand
5590d8160e [release-branch.go1.26] crypto/rsa: apply FIPS 140-3 approved checks to MGF hash in OAEP
9afe9975f6 [release-branch.go1.26] crypto/internal/fips140: run CASTs when generating keys
151dad5ced [release-branch.go1.26] net: fix zero value address handling in Dialer.Dial{TCP,UDP,IP}
c7bed29e83 [release-branch.go1.26] cmd/compile: teach deadstore about CondSelect
71f3ac6b69 [release-branch.go1.26] Revert "runtime: fix timespec definition on 32bits systems"
6eb58b4551 [release-branch.go1.26] cmd/internal/obj/x86: clear forward-jump list on PCALIGN
eec68d7a47 [release-branch.go1.26] cmd/dist: fix GOFIPS140 toolchain compilation

Fixes CVE-2026-97054, CVE-2026-97033, CVE-2026-97034, CVE-2026-97035,
      CVE-2026-97036, CVE-2026-97037, CVE-2026-97038, CVE-2026-97039,
      CVE-2026-97040, CVE-2026-97041, CVE-2026-97042, CVE-2026-97043.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.10...go1.26.11
[2] https://groups.google.com/g/golang-announce/c/iY8TY0wWgbM

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../go/{go-1.26.10.inc => go-1.26.11.inc}            |  2 +-
 ...native_1.26.10.bb => go-binary-native_1.26.11.bb} |  6 +++---
 ...adian_1.26.10.bb => go-cross-canadian_1.26.11.bb} |  0
 .../go/{go-cross_1.26.10.bb => go-cross_1.26.11.bb}  |  0
 ...go-crosssdk_1.26.10.bb => go-crosssdk_1.26.11.bb} |  0
 .../{go-runtime_1.26.10.bb => go-runtime_1.26.11.bb} |  0
 ...ke-content-based-hash-generation-less-pedan.patch | 12 ++++++------
 ...0006-cmd-go-make-GOROOT-precious-by-default.patch |  2 +-
 ...ilter-out-build-specific-paths-from-linker-.patch |  4 ++--
 ...ear-GOROOT-for-func-ldShared-when-trimpath-.patch |  2 +-
 .../go/{go_1.26.10.bb => go_1.26.11.bb}              |  0
 11 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.10.inc => go-1.26.11.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.10.bb => go-binary-native_1.26.11.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.10.bb => go-cross-canadian_1.26.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.10.bb => go-cross_1.26.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.10.bb => go-crosssdk_1.26.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.10.bb => go-runtime_1.26.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.10.bb => go_1.26.11.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.10.inc b/meta/recipes-devtools/go/go-1.26.11.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.26.10.inc
rename to meta/recipes-devtools/go/go-1.26.11.inc
index 035da371f2..5d47387487 100644
--- a/meta/recipes-devtools/go/go-1.26.10.inc
+++ b/meta/recipes-devtools/go/go-1.26.11.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
 "
-SRC_URI[main.sha256sum] = "fd63e883ba2f2bfca93c1646b31ebef63e2b1e4d2b317c9789d976a68d81f36f"
+SRC_URI[main.sha256sum] = "d44101b0ff27ed2a4c75ad46c17b9c74359209e2eb2ca7c9df6cb4fdb68e1969"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.10.bb b/meta/recipes-devtools/go/go-binary-native_1.26.11.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.11.bb
index 67201c8b74..7c02d98b69 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.11.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ccfe7ae822d2c2f41f4fe7c956199967a4dac22d0ee0d2b2bfdb440aab3b20c5"
-SRC_URI[go_linux_arm64.sha256sum] = "3f4227ce7b206a513e794f1393adb473a07b46e94d18bd15d1c684bbb7319797"
-SRC_URI[go_linux_ppc64le.sha256sum] = "4492031a19657de3bd7e4c48dce9d9e5aa7b668300f7c2c98e620b9ac0ee84ee"
+SRC_URI[go_linux_amd64.sha256sum] = "9849f4e04ee35303714e34fbc3ac8ab44ea3e448a95aa182f91e3b9b79c710ec"
+SRC_URI[go_linux_arm64.sha256sum] = "6c2f29b458b5add0835f18b776f69c8881a6d88428f1484a6da55755e620757e"
+SRC_URI[go_linux_ppc64le.sha256sum] = "d0e8ef5248235b37c8eeac5af51b6cf114db3640226ed82b44d4af0d6341a490"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.11.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.10.bb b/meta/recipes-devtools/go/go-cross_1.26.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.10.bb
rename to meta/recipes-devtools/go/go-cross_1.26.11.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.11.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.10.bb b/meta/recipes-devtools/go/go-runtime_1.26.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.11.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index cd61571e2c..45950a20b7 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -109,7 +109,7 @@ index 7b073165d5..1f618be0bb 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2805,8 +2807,25 @@ func envList(key, def string) []string {
+@@ -2811,8 +2813,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -136,9 +136,9 @@ index 7b073165d5..1f618be0bb 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2822,6 +2841,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
- 	if ldflags, err = buildFlags("LDFLAGS", DefaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
- 		return
+@@ -2833,6 +2852,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+ 			return
+ 		}
  	}
 +	if filtered {
 +		cppflags = filterCompilerFlags(cppflags, false)
@@ -150,7 +150,7 @@ index 7b073165d5..1f618be0bb 100644
  
  	return
  }
-@@ -2910,7 +2936,7 @@ func (b *Builder) runCgo(ctx context.Context, a *Action) error {
+@@ -2921,7 +2947,7 @@ func (b *Builder) runCgo(ctx context.Context, a *Action) error {
  	cgoExe := base.Tool("cgo")
  	cgofiles = mkAbsFiles(p.Dir, cgofiles)
  
@@ -159,7 +159,7 @@ index 7b073165d5..1f618be0bb 100644
  	if err != nil {
  		return err
  	}
-@@ -3463,7 +3489,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+@@ -3484,7 +3510,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
  	p := a.Package
  	sh := b.Shell(a)
  
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 70e16a1d57..a144632d10 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -94,7 +94,7 @@ index 1f618be0bb..651fa64582 100644
  	if err := sh.Mkdir(buildAction.Objdir); err != nil {
  		return nil, err
  	}
-@@ -1889,6 +1906,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1895,6 +1912,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
index a620a9cb63..324b49bbf9 100644
--- a/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
+++ b/meta/recipes-devtools/go/go/0007-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -19,7 +19,7 @@ diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
 index 651fa64582..586079afb4 100644
 --- a/src/cmd/go/internal/work/exec.go
 +++ b/src/cmd/go/internal/work/exec.go
-@@ -1564,6 +1564,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+@@ -1570,6 +1570,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
  	return h.Sum()
  }
  
@@ -49,7 +49,7 @@ index 651fa64582..586079afb4 100644
  // printLinkerConfig prints the linker config into the hash h,
  // as part of the computation of a linker-related action ID.
  func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
-@@ -1574,7 +1597,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+@@ -1580,7 +1603,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
  	case "gc":
  		fmt.Fprintf(h, "link %s %q %s\n", b.toolID("link"), forcedLdflags, ldBuildmode)
  		if p != nil {
diff --git a/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch b/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch
index 33e91bb04e..90e7620669 100644
--- a/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch
+++ b/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch
@@ -30,7 +30,7 @@ diff --git a/src/cmd/go/internal/work/gc.go b/src/cmd/go/internal/work/gc.go
 index 3a173efee8..8b7a44e031 100644
 --- a/src/cmd/go/internal/work/gc.go
 +++ b/src/cmd/go/internal/work/gc.go
-@@ -717,6 +717,12 @@ func (gcToolchain) ldShared(b *Builder, root *Action, toplevelactions []*Action,
+@@ -721,6 +721,12 @@ func (gcToolchain) ldShared(b *Builder, root *Action, toplevelactions []*Action,
  	// the output file path is recorded in the .gnu.version_d section.
  	dir, targetPath := filepath.Split(targetPath)
  
diff --git a/meta/recipes-devtools/go/go_1.26.10.bb b/meta/recipes-devtools/go/go_1.26.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.10.bb
rename to meta/recipes-devtools/go/go_1.26.11.bb
