Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CCEEE7C712
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:34 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13356.1770113967938080641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n8kLLraJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so54593495e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113966; x=1770718766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKzSL3pDQUCWAVGN3g6daZ1PqLh0/g0DGVl298jnMGk=;
        b=n8kLLraJZ7mQ6M6q5VdRC7VpiG8kCBWudF3p2NGtXPALG5jh5TIufmA88LFrvYdG53
         KexxPto6fjHY92DR9EP9z+UEH69WRKKTAOI8XCzy2rr6UYqeSQrte/jSj9tSjwvDMA4v
         yA5GHXVDr8/O/y4dc18NIHKjxnS3AFmBijpS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113966; x=1770718766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AKzSL3pDQUCWAVGN3g6daZ1PqLh0/g0DGVl298jnMGk=;
        b=F/jbAcCNztXsgoNqqBpRKSpV0lfDTXg+yexKiMY8odi9JYNQimjVT3CJBkmRW/iaJr
         ka+OXscHEUQRw82a9GA26IC3PxBmNMNTsC1SwRfKfJgyoZk88LLlu3PGmq/zIJq3xJ9J
         wlwhplU9eUIEmvEqbeXC+P2Z51JUXfXhlxSqv7QeunYvuNGB+RByC3q0Xs6VIFjQ0kdJ
         atytKnGyevy/fImOpJiwSCaYicyExJxs+8Ej61HXA36VzQOm6Vz6fibAMYMbuFXIogN9
         cMwGgSSVTtTNave1dFex31kNmYRa+IdxI3XmLK98RKaEJ1iiWYXKr4KXa+BWY8MtEOr8
         4j5Q==
X-Gm-Message-State: AOJu0YxxVRHMMFTkEZlZMnjOkEPtu4+fvANHnIIWdHwPcfFee3KELoAW
	gFzjFPxUg3eKr7iv5GPr6pZEg5nNuVTT2Pk6jMfKkxH51AEAGZYOlN/s74JAwiTiAcZpE5XhSfQ
	Qzr7I/3I=
X-Gm-Gg: AZuq6aICoXyYwV+eXSODtA3DAjNMnJLCmJU1jR/JVJAm1rB8iKb9L+TNumvwSf/Uokw
	MgjynYWCpi8ZjAbz/BbRR/Zu/tNm+Xdn406QP1/t/i9eOcTtzyAQ27tMPW1jQRfrke5IsRuq/QK
	2iBDAsR8aCxfax6e4zgC0DNxZsmHFium00fbHq1OVndVoCn3hP8bclq/zwDHcFxIpwRd1mNzLGK
	mulrT/qFWcggCv7flkPUyLEL9/F0ZfECDQEJtBO7LHWSVA1pCrXaHQkulsk8oEZK2uHSguQOiLE
	kMBLWOaG+NsLQlwdyimsHDRkUDsir3HcGN0G5kZ0arpXvySkCjgq1+PAUpqr/LZL+ZtR7l+4j63
	fyxy4o47xuyQWy5HVcB2GrK40NGXztlQAYYoVMUDxzgcJVf+7gklBk6lpOT/mjyuKwQDhpyVu0Z
	n9XABeIJu5ltE/42DUZeyLi0vbYbNyvvz2ozHLoV5v9wJpq6yox2nkO48qZMBrvipDlhGuUhgLe
	nMoYM04PyRxB7s=
X-Received: by 2002:a05:600c:5297:b0:483:887:59b0 with SMTP id 5b1f17b1804b1-483088759f8mr20475405e9.35.1770113965869;
        Tue, 03 Feb 2026 02:19:25 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:25 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 05/22] go: upgrade 1.25.5 -> 1.25.6
Date: Tue,  3 Feb 2026 11:16:34 +0100
Message-ID: <879500d40991777692f6569c4ef3232a4d48f6f2.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230433

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

