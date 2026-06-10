Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C5ECD98D8
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33655.1781132125981939896
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xVe6qo1+;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b64c8311so80565505e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132124; x=1781736924; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVukOoyDYi6iUC/PF1cRIj7v2P47GIJe8liNIEcDvB4=;
        b=xVe6qo1+ZnorJrz0+JSb4jeGpnoRX6nlvfujNDJf1EWskh7J+hBfN+84FGHc+uLbpY
         Gg308eRKWlLi8VLbXK1H+6Knk0HMX35d0X/9dmNunyT9Iu5GbUHAlTM4FHxBMIVpHZxI
         xGYOkoLbpQ3/+Bm/VA0Watcr1EhE5kA/AH8Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132124; x=1781736924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pVukOoyDYi6iUC/PF1cRIj7v2P47GIJe8liNIEcDvB4=;
        b=ccI9bAwOqp7fo+kECeUia2Q19ggMMS4rgjz9UwkF60AGaY56C/IEcRQO1shkjFcPMH
         BhnmkA3Sp/ZlHFD09oH8bgDWW6frKqh9BwCnhPQrcv4dVFXh31fW8Ax9JL2VKDfVDwhT
         I2ncVZJN/pYHJYa/9cm7jItHteAIsEfu12Ou9A32NcTxOLZxLW6j7FbSvDCwf4NYJvGx
         m2wMTrRE8GwR4Gv2x8i0b9f0BBdIJ8Fg2hGDYLfnq9lCjEN9O2zZcxTsDWZHlrWAA9Uz
         Hzuq0Xg1vKjK40kB9MO2SPBeMS0e0l3JLprxCTCMBvpdqzdWSr0CzhlHLjmV/TquPt7G
         5Qrg==
X-Gm-Message-State: AOJu0YxZc/9nXxCuHohW4QnD/3rPagZ9Ude/1zNFdZ+Yy3OIflpGXUoI
	Khbxpu96NMnN8jUTlXGMumhKXcWk6yGyhxAOPHIPGPh5NzEeXj/rxTpmTdwT9x6R5MQLHMPJVe4
	f0OnV
X-Gm-Gg: Acq92OG2uv+54kL7laL4WjAVNvkAR+YjsUOHp1OVUf19/WOFz+VSRShw/f1VdZNdVSG
	DtlRrZ0sYwhbOyQNm/bMHxv2duCEUF9KlWo/Vc4VBxqHJ+sJIcN+4Aj9wjP+/Cdp0Bbprv8UaPX
	H/spA7tZ4LWiqQPSrfJXAxU0a5twIBDcLyWF24zjgdpXdNDjqRf1B1GNh0e45/sVoKKlB9zZ4Mj
	Ihdwj946GOwq0OSFmeO6KUxn0EEpTSXCS0tMY07j0fqBB5uzi/lHI1PqPWVrahCLx/3n7rV/eLe
	QDh3X3FMYaUKBSsG6vGO/f9tEXG2OQMf32x04NQjAtLozao0cXl0+8d65Cw8ZRmMYGenhByVogl
	mu1OUAaOnhImHlId/OWNbh/WJ8kNs3GrOs88DR924ZHUVhmb80XTF5nIRVjVv6Msfdf7pnc23pB
	HwiqAYGgyQBOW6JpDDpqG89bhRQ92e4pE1UPzAco3lc8K5rSdZWx7Epw2G7CS++6zMxQGUapUhs
	LtPfGxJcZTayTOe/YxGKNRCzJAfG0jOIjSbQNoM7W1kaZ/wzw==
X-Received: by 2002:a05:600c:5248:b0:490:cb90:3e00 with SMTP id 5b1f17b1804b1-490cb903f1emr284042675e9.14.1781132124178;
        Wed, 10 Jun 2026 15:55:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/21] go: upgrade 1.26.2 -> 1.26.3
Date: Thu, 11 Jun 2026 00:55:05 +0200
Message-ID: <53dba55eb47db7f3a7f458cdf934709e7a9b4728.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238410

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.2..go1.26.3
2dc996f71b (tag: go1.26.3) [release-branch.go1.26] go1.26.3
8282c628a0 [release-branch.go1.26] cmd/go: reject sumdb response lacking module hash
3baf3eec3b [release-branch.go1.26] all: avoid unsafe StringToUTF16Ptr on Windows
0bec63330d [release-branch.go1.26] net/mail: fix quadratic consumePhrase behavior
7136366ebf [release-branch.go1.26] cmd/go: invalidate test cache when -coverpkg dependencies change
722b68ceca [release-branch.go1.26] cmd/compile: keep blank nodes alive in b.loop
3ae315a8cd [release-branch.go1.26] os: avoid panic when RemoveAll fails to remove a symlink
c9f97f50c4 [release-branch.go1.26] html/template: fix escaping of URLs in meta content attributes
40fa774fff [release-branch.go1.26] cmd/pack: refuse to extract files with directory components
d9389d318b [release-branch.go1.26] net/mail: fix quadratic complexity in consumeComment
dd29b59a2b [release-branch.go1.26] cmd/compile: fix loopvar version detection with line directives
18fa391f45 [release-branch.go1.26] crypto/fips140: add package docs
e0f5c054cb [release-branch.go1.26] net: avoid double-free of cgo pointer when handling large DNS response
2992086cf8 [release-branch.go1.26] lib/fips140: add certified pointing to v1.0.0-c2097c7c
f43caf8712 [release-branch.go1.26] lib/fips140: update inprocess to v1.26.0
19d2ce3401 [release-branch.go1.26] runtime: fix timespec definition on 32bits systems
e9df527f06 [release-branch.go1.26] crypto/tls: wrap ML-KEM hybrids in fips140.WithoutEnforcement
73f417a37c [release-branch.go1.26] go/types, types2: handle unconstrained type parameters correctly in a few places
50856a181c [release-branch.go1.26] cmd/go: use MkdirTemp to create temp directory for "go bug"
e137885d68 [release-branch.go1.26] cmd/compile/internal/devirtualize: use pointer identity for type comparison
c9712872cc [release-branch.go1.26] crypto/internal/fips140/drbg: build tag out entropy generation on Wasm
cb994d85ff [release-branch.go1.26] cmd/fix: change -diff to exit 1 if diffs exist
95470667eb [release-branch.go1.26] net/http/httputil: reencode queries with many parameters in proxy
9b01c04815 [release-branch.go1.26] html/template: fix escaper bypass by treating empty script type as JavaScript
be12fe151c [release-branch.go1.26] runtime: use uname version check for 64-bit time on 32-bit arch codepaths
ec5ebece41 [release-branch.go1.26] all: update x/net to 705de46f
710f29a758 [release-branch.go1.26] runtime: add sysUnreserve to undo sysReserve
efdc0fb354 [release-branch.go1.26] cmd/compile: handle min integer step in loop
ba4554f03b [release-branch.go1.26] cmd/go: specify full path to go command when running go tool covdata
f4e425d342 [release-branch.go1.26] fix incorrect loop trip counts
0b4d5f85e6 [release-branch.go1.26] cmd/link: use bfd ld 2.36+ on linux/arm64 instead of gold

Fixes CVE-2026-42501, CVE-2026-39825, CVE-2026-39836, CVE-2026-42499,
      CVE-2026-39820, CVE-2026-39819, CVE-2026-39817, CVE-2026-33814,
      CVE-2026-39826, CVE-2026-33811 and CVE-2026-39823.

Drop patch handling gold linker as upstream implemented gold linker
availability autodetection with [3].

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.2...go1.26.3
[2] https://groups.google.com/g/golang-announce/c/qcCIEXso47M
[3] https://github.com/golang/go/commit/0b4d5f85e68ea79b61de9989f9f37a984eb11289

(From OE-Core rev: 3d8258a8d3d96dc1225172c2ff9e889fd12cf6bc)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../go/{go-1.26.2.inc => go-1.26.3.inc}       |  3 +-
 ...e_1.26.2.bb => go-binary-native_1.26.3.bb} |  6 +-
 ..._1.26.2.bb => go-cross-canadian_1.26.3.bb} |  0
 ...{go-cross_1.26.2.bb => go-cross_1.26.3.bb} |  0
 ...osssdk_1.26.2.bb => go-crosssdk_1.26.3.bb} |  0
 ...runtime_1.26.2.bb => go-runtime_1.26.3.bb} |  0
 ...rcing-binutils-gold-dependency-on-aa.patch | 55 -------------------
 .../go/{go_1.26.2.bb => go_1.26.3.bb}         |  0
 8 files changed, 4 insertions(+), 60 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.2.inc => go-1.26.3.inc} (83%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.2.bb => go-binary-native_1.26.3.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.2.bb => go-cross-canadian_1.26.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.2.bb => go-cross_1.26.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.2.bb => go-crosssdk_1.26.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.2.bb => go-runtime_1.26.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch
 rename meta/recipes-devtools/go/{go_1.26.2.bb => go_1.26.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.2.inc b/meta/recipes-devtools/go/go-1.26.3.inc
similarity index 83%
rename from meta/recipes-devtools/go/go-1.26.2.inc
rename to meta/recipes-devtools/go/go-1.26.3.inc
index 8bb10bc89fe..db7b18ed2d2 100644
--- a/meta/recipes-devtools/go/go-1.26.2.inc
+++ b/meta/recipes-devtools/go/go-1.26.3.inc
@@ -15,6 +15,5 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
-    file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
 "
-SRC_URI[main.sha256sum] = "2e91ebb6947a96e9436fb2b3926a8802efe63a6d375dffec4f82aa9dbd6fd43b"
+SRC_URI[main.sha256sum] = "1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.2.bb b/meta/recipes-devtools/go/go-binary-native_1.26.3.bb
similarity index 80%
rename from meta/recipes-devtools/go/go-binary-native_1.26.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.3.bb
index d9006373f6d..135c7fbf5ee 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.3.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "990e6b4bbba816dc3ee129eaeaf4b42f17c2800b88a2166c265ac1a200262282"
-SRC_URI[go_linux_arm64.sha256sum] = "c958a1fe1b361391db163a485e21f5f228142d6f8b584f6bef89b26f66dc5b23"
-SRC_URI[go_linux_ppc64le.sha256sum] = "62b7645dd2404052535617c59e91cf03c7aa28e332dbaddbe4c0d7de7bcc6736"
+SRC_URI[go_linux_amd64.sha256sum] = "2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556"
+SRC_URI[go_linux_arm64.sha256sum] = "9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565"
+SRC_URI[go_linux_ppc64le.sha256sum] = "dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.2.bb b/meta/recipes-devtools/go/go-cross_1.26.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.2.bb
rename to meta/recipes-devtools/go/go-cross_1.26.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.2.bb b/meta/recipes-devtools/go/go-runtime_1.26.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.3.bb
diff --git a/meta/recipes-devtools/go/go/0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch b/meta/recipes-devtools/go/go/0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch
deleted file mode 100644
index dda0f2bb715..00000000000
--- a/meta/recipes-devtools/go/go/0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 6d265b008e3d106b2706645e5a88cd8e2fb98953 Mon Sep 17 00:00:00 2001
-From: Dirk Müller <dirk@dmllr.de>
-Date: Wed, 09 Mar 2022 17:47:23 +0100
-Subject: [PATCH 11/11] cmd/link: stop forcing binutils-gold dependency on
-  aarch64
-
-The bfd linker appears to be working just fine at least in version
-2.41 or above. Reject the known broken one instead, which
-avoids an architecture specific linker dependency that
-is cumbersome for distributions.
-
-Fixes #22040.
-
-Change-Id: I9f377e47c22ef20497479c0978c053ed5de46a38
-
-Upstream-Status: Submitted [https://go-review.googlesource.com/c/go/+/391115]
----
- src/cmd/link/internal/ld/lib.go | 21 ---------------------
- 1 file changed, 21 deletions(-)
-
-diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index dfc72e02c0..2a2a304113 100644
---- a/src/cmd/link/internal/ld/lib.go
-+++ b/src/cmd/link/internal/ld/lib.go
-@@ -1701,27 +1701,6 @@ func (ctxt *Link) hostlink() {
- 			// Use lld to avoid errors from default linker (issue #38838)
- 			altLinker = "lld"
- 		}
--
--		if ctxt.Arch.InFamily(sys.ARM64) && buildcfg.GOOS == "linux" {
--			// On ARM64, the GNU linker will fail with
--			// -znocopyreloc if it thinks a COPY relocation is
--			// required. Switch to gold.
--			// https://sourceware.org/bugzilla/show_bug.cgi?id=19962
--			// https://go.dev/issue/22040
--			altLinker = "gold"
--
--			// If gold is not installed, gcc will silently switch
--			// back to ld.bfd. So we parse the version information
--			// and provide a useful error if gold is missing.
--			name, args := flagExtld[0], flagExtld[1:]
--			args = append(args, "-fuse-ld=gold", "-Wl,--version")
--			cmd := exec.Command(name, args...)
--			if out, err := cmd.CombinedOutput(); err == nil {
--				if !bytes.Contains(out, []byte("GNU gold")) {
--					log.Fatalf("ARM64 external linker must be gold (issue #15696, 22040), but is not: %s", out)
--				}
--			}
--		}
- 	}
- 	if ctxt.Arch.Family == sys.ARM64 && buildcfg.GOOS == "freebsd" {
- 		// Switch to ld.bfd on freebsd/arm64.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/go/go_1.26.2.bb b/meta/recipes-devtools/go/go_1.26.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.2.bb
rename to meta/recipes-devtools/go/go_1.26.3.bb

