Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1332F8DFE5
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:15 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28256.1776378791700917064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X1GJObsr;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a041eae5so266385e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378790; x=1776983590; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3uz/IBC8WoEl6OgkTCty9zioKhFMNZuwF2w6RxRGuE=;
        b=X1GJObsr+KmY2/c+1U+mqAbSv6C+yxHayrlOiI3mE9cuKl9/hUxftKQ+aRN3Uuvz3D
         DjeTVtXGpcv8njmJ81ybPYxvcGXw/So6yTYTXI7d8fTNPNmSZbK0qEOq+I33LhSVQiLD
         hnjXX9YQf1hjzSUjMocBnszssAYJihYH7RTBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378790; x=1776983590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r3uz/IBC8WoEl6OgkTCty9zioKhFMNZuwF2w6RxRGuE=;
        b=eDrCQjCZ1UwqRTwoMTSAQaWg504Edquqp3i0HhBJTl75odWT81fmhVccGmIMbHI+c8
         CpGTLx/wlPtUnj4asn+Ye0jl8EirW1ZrkxfnuSPmSh2+EJFWjnF+tDpP1VipXJ+Z02rR
         m4+5UKg0IuBfxDe6J6BomGeTGiK3BY69mwmLs3TysBZ6qMNoLCL57nz09qpHcxgifFHv
         6QKfB+TMB00i88esAiiWOptxUUULom3IgS6bc4t4Zh10IOKm93Kn2+1vv4CBmSswaof8
         all7y4UmNYKVtHTPWLeZZN09nzW3zmu83uAbZbgh419lLh9mdgCJ+IrhzZBbzC6W1St4
         ZAdw==
X-Gm-Message-State: AOJu0YxNXX4SwD+QDi17ZulIur1DQ3tO5MLUf53iEUkq8q0ySRqkyk9a
	1/kkbzvNGxVs1p/+XBjiW1pVGU4NqHaeNHNfAu8JaEuVKJdp7fOhiio5VyDd/T/Mp1AeUhPnsR9
	vzcL7DUrKkCg/
X-Gm-Gg: AeBDietSkHWG1nlZ9vD1KQYsdkn0czG4tqqZoJ5VWX/U1prl57oDyFwGqCNJbccvqAW
	62xYEHFIU9ywJvx/TKUnw4KNAnemxhZT0XGmnODL0z0tEDRXvsZYv7ASPm7IcDATV6iGTsaANF8
	QX/51h45nrjIXk6F0jFo4GnRSAMANn53WBfyH9/LdKpozILcAZ5uVje/RK3DzbUUZXGI+yJyQZ1
	eX4bB2c30vkiq5nRw6CGQ1HLmCyzXebrsAGmtDfvc0JWgKrRXFdPWlkmZx54ZsHciLSMCHuHRr0
	t5trvtsLJmqib2GMtN3YFJOEbs/HMNk2iKw8ie2MaJ+BjFmb0YDWC3K0sxFbGSX8Sa+DxB8IahB
	+IfjYyWX9AReVxqZ4ebrfFT6K8MaAMzXICSCMDE5ajJPwuNPq+8i9i9tzF0QhhVJKJ5OYUdJlk5
	v8HpIWiDtLtklglsVc6UDIICv46ftBcoRIVaFP6BSixujS9RbPhE9qlWDKBC1lAiIJtWbSBuu1u
	vXsz189TD6NO0BVrbmwMf9O3/r5pCWw6zjS6g==
X-Received: by 2002:a05:600c:c0db:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-488fb73b259mr4354755e9.3.1776378789710;
        Thu, 16 Apr 2026 15:33:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:09 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 17/51] go: upgrade 1.25.8 -> 1.25.9
Date: Fri, 17 Apr 2026 00:30:00 +0200
Message-ID: <3be4eeea60a52b8694ae0688d794bb44991ae634.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235446

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.8..go1.25.9
7076e01d9d (tag: go1.25.9) [release-branch.go1.25] go1.25.9
abaa0cbb25 [release-branch.go1.25] cmd/go: disallow cgo trust boundary bypass
02f574a830 [release-branch.go1.25] crypto/tls: prevent deadlock when client sends multiple key update messages
82b0cdb741 [release-branch.go1.25] archive/tar: limit the number of old GNU sparse format entries
7d2dd3488c [release-branch.go1.25] cmd/compile: fix loopbce overflow check logic
72cc33629a [release-branch.go1.25] cmd/compile: fix mem access overlap detection
3ed3169244 [release-branch.go1.25] html/template: properly track JS template literal brace depth across contexts
4c79c4223e [release-branch.go1.25] internal/syscall/unix: properly support AT_SYMLINK_NOFOLLOW on Linux
edc1e4a5f2 [release-branch.go1.25] crypto/x509: fix signature checking limit
210b8112b1 [release-branch.go1.25] crypto/x509: hoist policy pruning out of loop
93a4f03ed8 [release-branch.go1.25] runtime/race: apply LLVM zero-initialization fix
cff64a5cf3 [release-branch.go1.25] cmd/go: tests: rename git-min-vers->git-sha256
7301bd39d1 [release-branch.go1.25] cmd/go: skip git sha256 tests if git < 2.29
f9532f001a [release-branch.go1.25] test/fixedbugs: remove issue46234 test timeout
4f81fbf332 [release-branch.go1.25] doc: remove template use in godebug.md
aed39507b1 [release-branch.go1.25] cmd/go/internal/cache: update trim timestamp before trimming
9a6627a5db [release-branch.go1.25] crypto/x509: fix wildcard domain exclusions.
19c660de6b [release-branch.go1.25] cmd/compile/internal/typecheck: simplify tcSliceHeader
b02c84a684 [release-branch.go1.25] cmd/internal/testdir: pass -buildid to link command
814b540c17 [release-branch.go1.25] cmd/internal/testdir: unify link command
de86eaeb0f [release-branch.go1.25] cmd/cgo/internal/test: use (syntactic) constant for C array bound

Fixes CVE-2026-32282, CVE-2026-32289, CVE-2026-27144, CVE-2026-27143,
      CVE-2026-32288, CVE-2026-32283, CVE-2026-27140, CVE-2026-32280 and
      CVE-2026-32281.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.25.8...go1.25.9
[2] https://groups.google.com/g/golang-announce/c/0uYbvbPZRWU

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/{go-1.25.8.inc => go-1.25.9.inc} | 2 +-
 ...binary-native_1.25.8.bb => go-binary-native_1.25.9.bb} | 6 +++---
 ...oss-canadian_1.25.8.bb => go-cross-canadian_1.25.9.bb} | 0
 .../go/{go-cross_1.25.8.bb => go-cross_1.25.9.bb}         | 0
 .../go/{go-crosssdk_1.25.8.bb => go-crosssdk_1.25.9.bb}   | 0
 .../go/{go-runtime_1.25.8.bb => go-runtime_1.25.9.bb}     | 0
 ...go-make-content-based-hash-generation-less-pedan.patch | 8 ++++----
 .../go/0006-cmd-go-make-GOROOT-precious-by-default.patch  | 2 +-
 meta/recipes-devtools/go/{go_1.25.8.bb => go_1.25.9.bb}   | 0
 9 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.8.inc => go-1.25.9.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.8.bb => go-binary-native_1.25.9.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.8.bb => go-cross-canadian_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.8.bb => go-cross_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.8.bb => go-crosssdk_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.8.bb => go-runtime_1.25.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.8.bb => go_1.25.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.8.inc b/meta/recipes-devtools/go/go-1.25.9.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.8.inc
rename to meta/recipes-devtools/go/go-1.25.9.inc
index 5db1b1c04cb..9a96f6f1704 100644
--- a/meta/recipes-devtools/go/go-1.25.8.inc
+++ b/meta/recipes-devtools/go/go-1.25.9.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "e988d4a2446ac7fe3f6daa089a58e9936a52a381355adec1c8983230a8d6c59e"
+SRC_URI[main.sha256sum] = "0ec9ef8ebcea097aac37decae9f09a7218b451cd96be7d6ed513d8e4bcf909cf"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.8.bb b/meta/recipes-devtools/go/go-binary-native_1.25.9.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.9.bb
index df6cb542fb6..b11b822c946 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.9.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "ceb5e041bbc3893846bd1614d76cb4681c91dadee579426cf21a63f2d7e03be6"
-SRC_URI[go_linux_arm64.sha256sum] = "7d137f59f66bb93f40a6b2b11e713adc2a9d0c8d9ae581718e3fad19e5295dc7"
-SRC_URI[go_linux_ppc64le.sha256sum] = "28ed144a945e4d7188c93f8d85fb772a98ed18f8f9f8d3a650696b739f8cc57c"
+SRC_URI[go_linux_amd64.sha256sum] = "00859d7bd6defe8bf84d9db9e57b9a4467b2887c18cd93ae7460e713db774bc1"
+SRC_URI[go_linux_arm64.sha256sum] = "ec342e7389b7f489564ed5463c63b16cf8040023dabc7861256677165a8c0e2b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "b0c41c7da1fc8d39020d65296a0dc54167afd9f76d67064e22c31ce3d839a739"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.8.bb b/meta/recipes-devtools/go/go-cross_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.8.bb
rename to meta/recipes-devtools/go/go-cross_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.8.bb b/meta/recipes-devtools/go/go-runtime_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.9.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 6d75266cbe6..921e59c4a20 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -109,7 +109,7 @@ index 7b073165d5..1f618be0bb 100644
  	}
  
  	// Configuration specific to compiler toolchain.
-@@ -2639,8 +2641,25 @@ func envList(key, def string) []string {
+@@ -2636,8 +2638,25 @@ func envList(key, def string) []string {
  	return args
  }
  
@@ -136,7 +136,7 @@ index 7b073165d5..1f618be0bb 100644
  	if cppflags, err = buildFlags("CPPFLAGS", "", p.CgoCPPFLAGS, checkCompilerFlags); err != nil {
  		return
  	}
-@@ -2656,6 +2675,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
+@@ -2653,6 +2672,13 @@ func (b *Builder) CFlags(p *load.Package) (cppflags, cflags, cxxflags, fflags, l
  	if ldflags, err = buildFlags("LDFLAGS", DefaultCFlags, p.CgoLDFLAGS, checkLinkerFlags); err != nil {
  		return
  	}
@@ -150,7 +150,7 @@ index 7b073165d5..1f618be0bb 100644
  
  	return
  }
-@@ -2673,7 +2699,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+@@ -2670,7 +2696,7 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
  	p := a.Package
  	sh := b.Shell(a)
  
@@ -159,7 +159,7 @@ index 7b073165d5..1f618be0bb 100644
  	if err != nil {
  		return nil, nil, err
  	}
-@@ -3237,7 +3263,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
+@@ -3238,7 +3264,7 @@ func (b *Builder) swigOne(a *Action, file, objdir string, pcCFLAGS []string, cxx
  	p := a.Package
  	sh := b.Shell(a)
  
diff --git a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
index 15ffdb3cf38..4ac478be851 100644
--- a/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
+++ b/meta/recipes-devtools/go/go/0006-cmd-go-make-GOROOT-precious-by-default.patch
@@ -94,7 +94,7 @@ index 1f618be0bb..651fa64582 100644
  	if err := sh.Mkdir(a.Objdir); err != nil {
  		return err
  	}
-@@ -1739,6 +1756,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
+@@ -1736,6 +1753,14 @@ func (b *Builder) linkShared(ctx context.Context, a *Action) (err error) {
  		return err
  	}
  
diff --git a/meta/recipes-devtools/go/go_1.25.8.bb b/meta/recipes-devtools/go/go_1.25.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.8.bb
rename to meta/recipes-devtools/go/go_1.25.9.bb

