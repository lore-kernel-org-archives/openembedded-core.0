Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC5AC83F0A
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 18:08:56 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.3905.1752084525615691303
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 11:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WK7xi3v3;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202507091808391760589503b403ed08-ixevh5@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202507091808391760589503b403ed08
        for <openembedded-core@lists.openembedded.org>;
        Wed, 09 Jul 2025 20:08:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0Edx2ttM2dGR4Vh+V3Z76RBhm/LwxD+DreReVIjqCpE=;
 b=WK7xi3v3p7r5Huyi/Fu11f/hM5SvoO2fM6iuZpzbd462wYIw7ajMtzMPpbnpHAMoMq8W9f
 e2Plz6N0U5B0BKSAlbx/lcDnjUeMaPbgtO7nMs6zqxulZbd04+hXMDBP8xL8EmKXef5YzD8r
 MO5fWP81fx+bDvVEl/KosV/0rX4dpoY6IeJihJeZDYtRdNFrBLUxyBMQDCI6SvLRtQYvtsvf
 5dBFbrBFuRSff6XX/MFrb5WaEzMNikb7W936Q9SZFQ+2fzYjRPBE2VW8IEZU6Zy3Ds77l65N
 qaYhA0o1jbJPpEQzNux23I+Q2EVqSUMXQG3wV6s1yDhC/ue2Yci0xgAQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] go: upgrade 1.24.4 -> 1.24.5
Date: Wed,  9 Jul 2025 20:07:52 +0200
Message-Id: <20250709180752.1985342-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 18:08:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220106

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.24.x release [1]:

$ git --no-pager log --oneline go1.24.4..go1.24.5
9d828e80fa (tag: go1.24.5) [release-branch.go1.24] go1.24.5
825eeee3f7 [release-branch.go1.24] cmd/go: disable support for multiple vcs in one module
dbf30d88f3 [release-branch.go1.24] cmd/link: permit a larger size BSS reference to a smaller DATA symbol
6b51660c8c [release-branch.go1.24] runtime: set mspan limit field early and eagerly
cc604130c8 [release-branch.go1.24] runtime: prevent mutual deadlock between GC stopTheWorld and suspendG
21b488bb60 [release-branch.go1.24] runtime: handle system goroutines later in goroutine profiling
e038690847 [release-branch.go1.24] cmd/go/internal/fips140: ignore GOEXPERIMENT on error
1575127ef8 [release-branch.go1.24] runtime: add missing unlock in sysReserveAlignedSbrk
7d08a16fba [release-branch.go1.24] cmd/compile/internal/ssa: fix PPC64 merging of (AND (S[RL]Dconst ...)
5f2cbe1f64 [release-branch.go1.24] cmd/compile: do nil check before calling duff functions, on arm64 and amd64

Fixes CVE-2025-4674 [2].

[1] https://github.com/golang/go/compare/go1.24.4...go1.24.5
[2] https://groups.google.com/g/golang-announce/c/gTNJnDXmn34

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.24.4.inc => go-1.24.5.inc}   | 2 +-
 ...o-binary-native_1.24.4.bb => go-binary-native_1.24.5.bb} | 6 +++---
 ...cross-canadian_1.24.4.bb => go-cross-canadian_1.24.5.bb} | 0
 .../go/{go-cross_1.24.4.bb => go-cross_1.24.5.bb}           | 0
 .../go/{go-crosssdk_1.24.4.bb => go-crosssdk_1.24.5.bb}     | 0
 .../go/{go-runtime_1.24.4.bb => go-runtime_1.24.5.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.4.bb => go_1.24.5.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.4.inc => go-1.24.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.4.bb => go-binary-native_1.24.5.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.4.bb => go-cross-canadian_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.4.bb => go-cross_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.4.bb => go-crosssdk_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.4.bb => go-runtime_1.24.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.4.bb => go_1.24.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.4.inc b/meta/recipes-devtools/go/go-1.24.5.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.4.inc
rename to meta/recipes-devtools/go/go-1.24.5.inc
index eff3f2f605..fae0d3f333 100644
--- a/meta/recipes-devtools/go/go-1.24.4.inc
+++ b/meta/recipes-devtools/go/go-1.24.5.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "5a86a83a31f9fa81490b8c5420ac384fd3d95a3e71fba665c7b3f95d1dfef2b4"
+SRC_URI[main.sha256sum] = "74fdb09f2352e2b25b7943e56836c9b47363d28dec1c8b56c4a9570f30b8f59f"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb b/meta/recipes-devtools/go/go-binary-native_1.24.5.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.24.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.5.bb
index ae85d3e266..f052c44566 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.5.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "77e5da33bb72aeaef1ba4418b6fe511bc4d041873cbf82e5aa6318740df98717"
-SRC_URI[go_linux_arm64.sha256sum] = "d5501ee5aca0f258d5fe9bfaed401958445014495dc115f202d43d5210b45241"
-SRC_URI[go_linux_ppc64le.sha256sum] = "9ca4afef813a2578c23843b640ae0290aa54b2e3c950a6cc4c99e16a57dec2ec"
+SRC_URI[go_linux_amd64.sha256sum] = "10ad9e86233e74c0f6590fe5426895de6bf388964210eac34a6d83f38918ecdc"
+SRC_URI[go_linux_arm64.sha256sum] = "0df02e6aeb3d3c06c95ff201d575907c736d6c62cfa4b6934c11203f1d600ffa"
+SRC_URI[go_linux_ppc64le.sha256sum] = "00bdfb16d1094e78473b681d2d09d42c19c886d4dfed743853769f1665c7a552"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.4.bb b/meta/recipes-devtools/go/go-cross_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.4.bb
rename to meta/recipes-devtools/go/go-cross_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.4.bb b/meta/recipes-devtools/go/go-runtime_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.5.bb
diff --git a/meta/recipes-devtools/go/go_1.24.4.bb b/meta/recipes-devtools/go/go_1.24.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.4.bb
rename to meta/recipes-devtools/go/go_1.24.5.bb

