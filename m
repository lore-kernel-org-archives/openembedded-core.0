Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E07D7975E
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5005.1769846219982458519
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pVsY5j9h;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4801eb2c0a5so26677735e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846218; x=1770451018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKzSL3pDQUCWAVGN3g6daZ1PqLh0/g0DGVl298jnMGk=;
        b=pVsY5j9hnCOsAuEaINFuDp8TgOHn+QXgoz9LMEBYMKUttVNldFMJaI1oh5q5NEpEWv
         QM2fsvbdzuvBEDfXcRlEaVtM9BzVwVBgr6XV8w3NxziLBYLtkIa3JHxLqyXSEcILx8qc
         S2axi+C9VB8BBJnfUKSF6JN/Qf8yBIvGvbAZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846218; x=1770451018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AKzSL3pDQUCWAVGN3g6daZ1PqLh0/g0DGVl298jnMGk=;
        b=txjfPAfPT0OrdyAWvkiwb05SNafJp4dFU9nxiBA3k5Iw8z/QyH4nZjsMCq9WK1naf3
         7DrdVfnSTNd5HAakFVa7Kzr/srodjjz1fC5KGr/oWvZsc70+mb/5ey6Oksr6rmn15wli
         Z2C7wsk1vCxHV0KdkjIwDQi/Q5J+jjnz9N6akK20QBq/jvJSQ8NqWhSal0ckfh+s27lO
         3lSohpre9u6qS0ob2pEIPi2h9VQ6Pwb9K3MjM7uOYbHq1tO9LhKYw3t15ES2lfu/bntG
         K1nhY/lBE25YmVRucqsHAQey4j0rzMUgiQCWtvzwuklTF7kUtjZfPJkiyhhoIO0E9QTK
         Nrqg==
X-Gm-Message-State: AOJu0YzChxph8FaplHj1mYN2skJe8eAxmGxdYMc327IYzLbWFHUS5UJs
	j342np7p6Bpu7MM0WHdT98fDWTlexC46cGsveDq0oKXgo6Z2tjTvnKB96pqIcPdd1VFWF04Kv63
	RMIPfZII=
X-Gm-Gg: AZuq6aI2LqBnqiqaGTKBP39DU0wjxfTSrpCuiSMiqf21RGTQ6LYIkg/0qnm1KW4gkFQ
	kPNDSKpJP1qDgrATehLzE8C+O9DKjcdYHxeFlI7/CixRWpQJ/J08dW4vYuaxRfilmnfdBYs512Y
	LAaXstYNS5ZO89iT3p5uDRkVJEDYIs1m8Gkyn9XAglVKtcdMan42/2E0qrazNGF+XHz3ij17VhM
	hprBb5h4cx1LDB9jvOWXqr161JVDHdCBLzkwpRECaSDaf8BY5CmFLP+8eX+6jqZt/DhbgWhzjvS
	t+OTR8vep/nI5idP6+L6nDtDtxkPC2zNGexZF3rNTwzHMz/yadoi9EueUpi5YNtVa9KfKkzXMOP
	RNy+dqSxUOKl2cNRZQP9mCpyTDFrDn4l8mjoZwlgnIGXe1NtwtgTPOOl8sfzWK9/lrlldCz8bnw
	iRuZ27yA6RD4Xo9GPghr9t3+mko6jrCLR2Ro4mSN8MtipekPHyfR6chyDpG0qKQtfERMcxzLhSb
	pIGPtw4LHO729/e
X-Received: by 2002:a05:600c:6206:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-482db44d215mr65769895e9.3.1769846218003;
        Fri, 30 Jan 2026 23:56:58 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:57 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 06/22] go: upgrade 1.25.5 -> 1.25.6
Date: Sat, 31 Jan 2026 08:56:17 +0100
Message-ID: <ff065e48e1e14fc2dadfeb6e8f2e26c7d785a4dc.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230211

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
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3e4f89552a90897691bdd00ffd0413e65023a2c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index 47d5c3912c0..2c31c4a235d 100644
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
index 5ecbca6d17d..6429bb385b5 100644
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
index b55ad1e7873..6d75266cbe6 100644
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
index 33e3b033a14..d27809a7f49 100644
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
index 51173794442..15ffdb3cf38 100644
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

