Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178FCF5141C
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 22:34:16 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.713.1772836450119995448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 14:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=egEb2AJ7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026030622340756bd3d4bbe0002070a-bd3udl@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026030622340756bd3d4bbe0002070a
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Mar 2026 23:34:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=H9jmqGiax6WzDDOAhKjJUXyntYMd2nX2tmsEGYRp4zk=;
 b=egEb2AJ7jjNtRMcahQvF8gwCwVyuIx0bRyUn1zBrbjQ85YSQxv9SDACSO+gR8OVWrGPzqf
 5V5al6vUmITnfNyHdrhzBoykmLqn/qtAXOJ6Uk/3IByd3F+wr51N5sWBNeK+3M/SvLRk1kWF
 9QPc3JJPYln9O/EduCYlQOHKRCcP3wpX1k8hYphEmI2LFZf4a5LgIJm4w6v6dzxUT/YoFEox
 nOHr2TRJLSv/nZtx1/YskLBOw8KWc2Ir8/0F4mFBqWlL+agVM6verh0kwg/XpUDcc0IC8bfp
 Hgkfob3Er7YTl0KmXIP9GzSIdnZM4uE4nbyVT3KYoh2F19bbVDWnu/Ow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] go: upgrade 1.26.0 -> 1.26.1
Date: Fri,  6 Mar 2026 23:34:02 +0100
Message-Id: <20260306223402.2004446-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 22:34:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232600

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.26.x release [1]:

$ git --no-pager log --oneline go1.26.0..go1.26.1
e87b10ea2a (tag: go1.26.1) [release-branch.go1.26] go1.26.1
e792d6aa95 [release-branch.go1.26] crypto/x509: fix name constraint checking panic
a761c9ff70 [release-branch.go1.26] crypto/x509: fix full email constraint matching
994692847a [release-branch.go1.26] html/template: properly escape URLs in meta content attributes
65c7d7a9fb [release-branch.go1.26] net/url: reject IPv6 literal not at start of host
e28ac674af [release-branch.go1.26] cmd/go: revert update default go directive in mod or work init
4d1051fdc9 [release-branch.go1.26] cmd: re-vendor x/tools for Go 1.26.1
8cce3ab20c [release-branch.go1.26] os: avoid escape from Root via ReadDir or Readdir
ef041913a8 [release-branch.go1.26] cmd/compile: ensure StructMake/ArrayMake1 of direct interfaces are unwrapped
155c25e249 [release-branch.go1.26] cmd/compile: pointer-shaped types are SSAable even if lots of 0-sized fields
c5723195a6 [release-branch.go1.26] net/smtp: prevent test failures due to expired test certificate
f67a1f4c76 [release-branch.go1.26] cmd/go: fix pkg-config flag sanitization
4659d630da [release-branch.go1.26] cmd/compile: avoid folding 64-bit integers into 32-bit constants
6fb3df88d4 [release-branch.go1.26] go/analysis/passes/modernize: add vendored code
85050c90ee [release-branch.go1.26] cmd/compile: fix mis-compilation for static array initialization
12c0690eeb [release-branch.go1.26] cmd/compile: don't drop same register twice
e8df1a6697 [release-branch.go1.26] reflect: use &zeroVal[0] instead of nil for data field for zero-sized payloads
167ef716ba [release-branch.go1.26] cmd/compile: rewriteFixedLoad: ensure AuxInt is sign-extended
495e6c6b09 [release-branch.go1.26] internal/syscall/windows: correct some enums and syscall signatures
29618c4439 [release-branch.go1.26] cmd/link: don't pass -Wl,-S on illumos
c283d1f762 [release-branch.go1.26] os: support deleting inaccessible files in RemoveAll

Fixes CVE-2026-27137, CVE-2026-27138, CVE-2026-27142, CVE-2026-25679 and
      CVE-2026-27139.

Release information: [2]

[1] https://github.com/golang/go/compare/go1.26.0...go1.26.1
[2] https://groups.google.com/g/golang-announce/c/EdhZqrQ98hk

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.26.0.inc => go-1.26.1.inc}   | 2 +-
 ...o-binary-native_1.26.0.bb => go-binary-native_1.26.1.bb} | 6 +++---
 ...cross-canadian_1.26.0.bb => go-cross-canadian_1.26.1.bb} | 0
 .../go/{go-cross_1.26.0.bb => go-cross_1.26.1.bb}           | 0
 .../go/{go-crosssdk_1.26.0.bb => go-crosssdk_1.26.1.bb}     | 0
 .../go/{go-runtime_1.26.0.bb => go-runtime_1.26.1.bb}       | 0
 meta/recipes-devtools/go/{go_1.26.0.bb => go_1.26.1.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.26.0.inc => go-1.26.1.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.0.bb => go-binary-native_1.26.1.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.0.bb => go-cross-canadian_1.26.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.0.bb => go-cross_1.26.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.0.bb => go-crosssdk_1.26.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.0.bb => go-runtime_1.26.1.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.26.0.bb => go_1.26.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.26.0.inc b/meta/recipes-devtools/go/go-1.26.1.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.26.0.inc
rename to meta/recipes-devtools/go/go-1.26.1.inc
index 7d8a68e3b2..2e3464ec3b 100644
--- a/meta/recipes-devtools/go/go-1.26.0.inc
+++ b/meta/recipes-devtools/go/go-1.26.1.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
 "
-SRC_URI[main.sha256sum] = "c9132a8a1f6bd2aa4aad1d74b8231d95274950483a4950657ee6c56e6e817790"
+SRC_URI[main.sha256sum] = "3172293d04b209dc1144698e7ba13f0477f6ba8c5ffd0be66c20fdbc9785dfbb"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.26.0.bb b/meta/recipes-devtools/go/go-binary-native_1.26.1.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.26.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.26.1.bb
index 2785c233e0..0e054add70 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.26.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.26.1.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "aac1b08a0fb0c4e0a7c1555beb7b59180b05dfc5a3d62e40e9de90cd42f88235"
-SRC_URI[go_linux_arm64.sha256sum] = "bd03b743eb6eb4193ea3c3fd3956546bf0e3ca5b7076c8226334afe6b75704cd"
-SRC_URI[go_linux_ppc64le.sha256sum] = "3066b2284b554da76cf664d217490792ba6f292ec0fc20bf9615e173cc0d2800"
+SRC_URI[go_linux_amd64.sha256sum] = "031f088e5d955bab8657ede27ad4e3bc5b7c1ba281f05f245bcc304f327c987a"
+SRC_URI[go_linux_arm64.sha256sum] = "a290581cfe4fe28ddd737dde3095f3dbeb7f2e4065cab4eae44dfc53b760c2f7"
+SRC_URI[go_linux_ppc64le.sha256sum] = "f56eed002998f5f51fa07fd4ed0c5de5e02d51cec7a4007f771c7576620d9d45"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.26.0.bb b/meta/recipes-devtools/go/go-cross-canadian_1.26.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.26.0.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.26.1.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.26.0.bb b/meta/recipes-devtools/go/go-cross_1.26.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.26.0.bb
rename to meta/recipes-devtools/go/go-cross_1.26.1.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.26.0.bb b/meta/recipes-devtools/go/go-crosssdk_1.26.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.26.0.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.26.1.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.26.0.bb b/meta/recipes-devtools/go/go-runtime_1.26.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.26.0.bb
rename to meta/recipes-devtools/go/go-runtime_1.26.1.bb
diff --git a/meta/recipes-devtools/go/go_1.26.0.bb b/meta/recipes-devtools/go/go_1.26.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.26.0.bb
rename to meta/recipes-devtools/go/go_1.26.1.bb

