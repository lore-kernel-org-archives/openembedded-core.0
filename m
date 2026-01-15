Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D735AD47CAB
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 23:51:00 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.912.1768521059757391171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 15:51:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=O/WjKl+c;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202601152350573f7a33124700020715-py9i4j@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202601152350573f7a33124700020715
        for <openembedded-core@lists.openembedded.org>;
        Fri, 16 Jan 2026 00:50:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pnxU4pTuE1CCDOwmjBtsdB64nGvKfmGIwkv96xyGX1Q=;
 b=O/WjKl+c6Wfzq6JrVFE3td50OZdncBwQ26XKnKg+LOBgrhxZVHL6mGE/5VPN1Cx4hXH4tX
 4hx8IJWciOwtxbrHep0+edLuxEv/IX+egdjGUIG/GYcFjw7HDH04OCs9C3j01TjpBAr1Wvvx
 I4S5z4vBrF8yoIf2p+X/4HKbN+VF/+BCr1TLmcq2F2klDU3MvcCFCQE21YhMWv+LKXQm9S/C
 SvIAwfINlZVYmQ+QpfhSbq1I6zC/UgtId238zwd0ybLQycNxcM8si6mZtBuZBOX0IkLrE0f3
 uc0a6qletk66L/+meJPQJIM/1BWCTFkD23d6toMXjATsDBKQ3m5h8Jfg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] go: upgrade 1.25.5 -> 1.25.6
Date: Fri, 16 Jan 2026 00:50:54 +0100
Message-Id: <20260115235054.1782313-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 23:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229443

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.5..go1.25.6
69801b25b9 (tag: go1.25.6) [release-branch.go1.25] go1.25.6
9d497df196 [release-branch.go1.25] archive/zip: reduce CPU usage in index construction
afa9b66ac0 [release-branch.go1.25] net/url: add urlmaxqueryparams GODEBUG to limit the number of query parameters
2526187481 [release-branch.go1.25] cmd/go/internal/work: sanitize flags before invoking 'pkg-config'
082365aa55 [release-branch.go1.25] cmd/go: update VCS commands to use safer flag/argument syntax
4be38528a6 [release-branch.go1.25] crypto/tls: don't copy auto-rotated session ticket keys in Config.Clone
525dd85363 [release-branch.go1.25] crypto/tls: reject trailing messages after client/server hello
ddcf27fc8c [release-branch.go1.25] Revert "errors: optimize errors.Join for single unwrappable errors"
14f50f6e3e [release-branch.go1.25] cmd/compile: handle propagating an out-of-range jump table index
4e531b2f14 [release-branch.go1.25] runtime: mark getfp as nosplit
6f07a57145 [release-branch.go1.25] runtime/race: set missing argument frame for ppc64x atomic And/Or wrappers
ea603eea37 [release-branch.go1.25] os: allow direntries to have zero inodes on Linux
93f5d1c27e [release-branch.go1.25] os,internal/poll: don't call IsNonblock for consoles and Stdin
d5bfdcbc47 [release-branch.go1.25] crypto/tls: use inner hello for earlyData when using QUIC and ECH

Fixes CVE-2025-61728, CVE-2025-61726, CVE-2025-68121, CVE-2025-61731,
      CVE-2025-68119 and CVE-2025-61730.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.5...go1.25.6
[2] https://groups.google.com/g/golang-announce/c/Vd2tYVM8eUc

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.25.5.inc => go-1.25.6.inc} | 2 +-
 ...binary-native_1.25.5.bb => go-binary-native_1.25.6.bb} | 6 +++---
 ...oss-canadian_1.25.5.bb => go-cross-canadian_1.25.6.bb} | 0
 .../go/{go-cross_1.25.5.bb => go-cross_1.25.6.bb}         | 0
 .../go/{go-crosssdk_1.25.5.bb => go-crosssdk_1.25.6.bb}   | 0
 .../go/{go-runtime_1.25.5.bb => go-runtime_1.25.6.bb}     | 0
 ...go-make-content-based-hash-generation-less-pedan.patch | 8 ++++----
 ...ime-when-using-cgo-on-386-call-C-sigaction-funct.patch | 4 ++--
 .../go/0006-cmd-go-make-GOROOT-precious-by-default.patch  | 2 +-
 meta/recipes-devtools/go/{go_1.25.5.bb => go_1.25.6.bb}   | 0
 10 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.5.inc => go-1.25.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb => go-binary-native_1.25.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.5.bb => go-cross-canadian_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.5.bb => go-cross_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.5.bb => go-crosssdk_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.5.bb => go-runtime_1.25.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.5.bb => go_1.25.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.5.inc b/meta/recipes-devtools/go/go-1.25.6.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.5.inc
rename to meta/recipes-devtools/go/go-1.25.6.inc
index 47d5c3912c..2c31c4a235 100644
--- a/meta/recipes-devtools/go/go-1.25.5.inc
+++ b/meta/recipes-devtools/go/go-1.25.6.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "22a5fd0a91efcd28a1b0537106b9959b2804b61f59c3758b51e8e5429c1a954f"
+SRC_URI[main.sha256sum] = "58cbf771e44d76de6f56d19e33b77d745a1e489340922875e46585b975c2b059"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb b/meta/recipes-devtools/go/go-binary-native_1.25.6.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.6.bb
index 5ecbca6d17..6429bb385b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9e9b755d63b36acf30c12a9a3fc379243714c1c6d3dd72861da637f336ebb35b"
-SRC_URI[go_linux_arm64.sha256sum] = "b00b694903d126c588c378e72d3545549935d3982635ba3f7a964c9fa23fe3b9"
-SRC_URI[go_linux_ppc64le.sha256sum] = "f0904b647b5b8561efc5d48bb59a34f2b7996afab83ccd41c93b1aeb2c0067e4"
+SRC_URI[go_linux_amd64.sha256sum] = "f022b6aad78e362bcba9b0b94d09ad58c5a70c6ba3b7582905fababf5fe0181a"
+SRC_URI[go_linux_arm64.sha256sum] = "738ef87d79c34272424ccdf83302b7b0300b8b096ed443896089306117943dd5"
+SRC_URI[go_linux_ppc64le.sha256sum] = "bee02dbe034b12b839ae7807a85a61c13bee09ee38f2eeba2074bd26c0c0ab73"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.5.bb b/meta/recipes-devtools/go/go-cross_1.25.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.5.bb
rename to meta/recipes-devtools/go/go-cross_1.25.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.5.bb b/meta/recipes-devtools/go/go-runtime_1.25.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.6.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index b55ad1e787..6d75266cbe 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -109,7 +109,7 @@ index 7b073165d5..1f618be0bb 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2631,8 +2633,25 @@ func envList(key, def string) []string {
+@@ -2639,8 +2641,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -136,7 +136,7 @@ index 7b073165d5..1f618be0bb 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2648,6 +2667,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2656,6 +2675,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", DefaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -150,7 +150,7 @@ index 7b073165d5..1f618be0bb 100644
  
  	return
  }
-@@ -2665,7 +2691,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+@@ -2673,7 +2699,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
  	p := a.Package
  	sh := b.Shell(a)
  
@@ -159,7 +159,7 @@ index 7b073165d5..1f618be0bb 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3229,7 +3255,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+@@ -3237,7 +3263,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
  	p := a.Package
  	sh := b.Shell(a)
  
diff --git a/meta/recipes-devtools/go/go/0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch b/meta/recipes-devtools/go/go/0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch
index 33e3b033a1..d27809a7f4 100644
--- a/meta/recipes-devtools/go/go/0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch
+++ b/meta/recipes-devtools/go/go/0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch
@@ -168,7 +168,7 @@ diff --git a/src/runtime/os_linux.go b/src/runtime/os_linux.go
 index c9d25a5be8..f9fe1b5f33 100644
 --- a/src/runtime/os_linux.go
 +++ b/src/runtime/os_linux.go
-@@ -486,7 +486,8 @@ func setsig(i uint32, fn uintptr) {
+@@ -487,7 +487,8 @@ func setsig(i uint32, fn uintptr) {
  	sigfillset(&sa.sa_mask)
  	// Although Linux manpage says "sa_restorer element is obsolete and
  	// should not be used". x86_64 kernel requires it. Only use it on
@@ -178,7 +178,7 @@ index c9d25a5be8..f9fe1b5f33 100644
  	if GOARCH == "386" || GOARCH == "amd64" {
  		sa.sa_restorer = abi.FuncPCABI0(sigreturn__sigaction)
  	}
-@@ -562,6 +563,21 @@ func sysSigaction(sig uint32, new, old *sigactiont) {
+@@ -563,6 +564,21 @@ func sysSigaction(sig uint32, new, old *sigactiont) {
  //go:noescape
  func rt_sigaction(sig uintptr, new, old *sigactiont, size uintptr) int32
  
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 5117379444..15ffdb3cf3 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -94,7 +94,7 @@ index 1f618be0bb..651fa64582 100644
  	if err := sh.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1731,6 +1748,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1739,6 +1756,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
diff --git a/meta/recipes-devtools/go/go_1.25.5.bb b/meta/recipes-devtools/go/go_1.25.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.5.bb
rename to meta/recipes-devtools/go/go_1.25.6.bb

