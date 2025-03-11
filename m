Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA78C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 20:23:34 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.20764.1741724609566067983
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 13:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZYtJNsOR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250311202326189fee779e4fdc22d4-ilsorf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250311202326189fee779e4fdc22d4
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Mar 2025 21:23:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=aJtOHSEV/pA1dsjE1NxPDhM37xPfgjCXgC3nLmqfMpI=;
 b=ZYtJNsORLl+tr6dKfBxwzhu8eJhTqib48ykoP+jzojquvynXsTCO0IZq1Ol39gFCN33NWD
 a4wtKNBR0d/6TCdLgAyTq+KdF6Bo6req4Ex28ElyV1Ai6YfO1gvGtuST9nUQh0Q91f66R8n9
 VVJ0jVuD8jSTD0agehWjxr+gqG+n0gHl2m5kxUMYCJoLceVVUkr/EkCwgBFZsAwvZWbuVV/4
 5fL9mBONI6u8pDDvKNRNQ/4fS3UeP+KP2QWHZDtiMBWbIKJg81/fHZ1oO9MzjMeH6GQoziRT
 /S9N5mJCJYOYjwlW5EvcDvfBaf7l1i2HEXkNFFDxoRH8A+5xb0AYDU6w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] go; upgrade 1.24.0 -> 1.24.1
Date: Tue, 11 Mar 2025 21:22:39 +0100
Message-Id: <20250311202239.1661186-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 20:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212630

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.24.x release [1]:

$ git --no-pager log --oneline go1.24.0..go1.24.1
339c903a75 (tag: go1.24.1) [release-branch.go1.24] go1.24.1
334de7982f [release-branch.go1.24] all: updated vendored x/net with security fix
5d6920842b [release-branch.go1.24] runtime/cgo: avoid errors from -Wdeclaration-after-statement
949eae84df [release-branch.go1.24] cmd/compile: don't pull constant offsets out of pointer arithmetic
0bfde51e0d [release-branch.go1.24] runtime: document that cleanups can run concurrently with each other
45a52718e3 [release-branch.go1.24] runtime/cgo: avoid errors from -Wdeclaration-after-statement
7f375e2c22 [release-branch.go1.24] reflect: let Value.Seq return the iteration value correct type
4070531920 [release-branch.go1.24] syscall: disable O_DIRECTORY on Windows for js/wasm
5ffdb9c88b [release-branch.go1.24] reflect: correctly handle method values in Seq
becc17ebcd [release-branch.go1.24] runtime: use WCLONE when waiting on pidfd test child
d418e224ae [release-branch.go1.24] syscall: don't send child signal when testing pidfd
456eaf5c29 [release-branch.go1.24] cmd/compile: don't report newLimit discovered when unsat happens multiple times
e4ef83383e [release-branch.go1.24] debug/buildinfo: base64-encode test binaries
4e6d3468cc [release-branch.go1.24] cmd/compile: ensure we don't reuse temporary register
f5c388313f [release-branch.go1.24] internal/godebugs: add fips140 as an opaque godebug setting
af236716b2 [release-branch.go1.24] cmd/compile, runtime: use deferreturn as target PC for recover from deferrangefunc
0f7b7600fb [release-branch.go1.24] doc/godebug: mention GODEBUG=fips140
eb58df7dbf [release-branch.go1.24] cmd/compile: avoid infinite recursion when inlining closures
30f4d9e117 [release-branch.go1.24] syscall: don't truncate newly created files on Windows
bb0e5c2045 [release-branch.go1.24] runtime: fix usleep on s390x/linux
cd0e528d3d [release-branch.go1.24] runtime: add some linknames back for `github.com/bytedance/sonic`
80e2e474b8 [release-branch.go1.24] cmd/go: initialize req.Header when loading git credential

Fixes CVE-2025-22870

[1] https://github.com/golang/go/compare/go1.24.0...go1.24.1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.24.0.inc => go-1.24.1.inc}   | 2 +-
 ...o-binary-native_1.24.0.bb => go-binary-native_1.24.1.bb} | 6 +++---
 ...cross-canadian_1.24.0.bb => go-cross-canadian_1.24.1.bb} | 0
 .../go/{go-cross_1.24.0.bb => go-cross_1.24.1.bb}           | 0
 .../go/{go-crosssdk_1.24.0.bb => go-crosssdk_1.24.1.bb}     | 0
 .../go/{go-runtime_1.24.0.bb => go-runtime_1.24.1.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.0.bb => go_1.24.1.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.0.inc => go-1.24.1.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.0.bb => go-binary-native_1.24.1.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.0.bb => go-cross-canadian_1.24.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.0.bb => go-cross_1.24.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.0.bb => go-crosssdk_1.24.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.0.bb => go-runtime_1.24.1.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.0.bb => go_1.24.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.0.inc b/meta/recipes-devtools/go/go-1.24.1.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.0.inc
rename to meta/recipes-devtools/go/go-1.24.1.inc
index a52dd19e76..4cf66e705a 100644
--- a/meta/recipes-devtools/go/go-1.24.0.inc
+++ b/meta/recipes-devtools/go/go-1.24.1.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "d14120614acb29d12bcab72bd689f257eb4be9e0b6f88a8fb7e41ac65f8556e5"
+SRC_URI[main.sha256sum] = "8244ebf46c65607db10222b5806aeb31c1fcf8979c1b6b12f60c677e9a3c0656"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.0.bb b/meta/recipes-devtools/go/go-binary-native_1.24.1.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.24.0.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.1.bb
index d9eebb9c37..ffe3d50b7b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.0.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.1.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "dea9ca38a0b852a74e81c26134671af7c0fbe65d81b0dc1c5bfe22cf7d4c8858"
-SRC_URI[go_linux_arm64.sha256sum] = "c3fa6d16ffa261091a5617145553c71d21435ce547e44cc6dfb7470865527cc7"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a871a43de7d26c91dd90cb6e0adacb214c9e35ee2188c617c91c08c017efe81a"
+SRC_URI[go_linux_amd64.sha256sum] = "cb2396bae64183cdccf81a9a6df0aea3bce9511fc21469fb89a0c00470088073"
+SRC_URI[go_linux_arm64.sha256sum] = "8df5750ffc0281017fb6070fba450f5d22b600a02081dceef47966ffaf36a3af"
+SRC_URI[go_linux_ppc64le.sha256sum] = "0fb522efcefabae6e37e69bdc444094e75bfe824ea6d4cc3cbc70c7ae1b16858"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.0.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.0.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.1.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.0.bb b/meta/recipes-devtools/go/go-cross_1.24.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.0.bb
rename to meta/recipes-devtools/go/go-cross_1.24.1.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.0.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.0.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.1.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.0.bb b/meta/recipes-devtools/go/go-runtime_1.24.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.0.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.1.bb
diff --git a/meta/recipes-devtools/go/go_1.24.0.bb b/meta/recipes-devtools/go/go_1.24.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.0.bb
rename to meta/recipes-devtools/go/go_1.24.1.bb

