Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D187C3ABC3
	for <webhook@archiver.kernel.org>; Sun, 11 May 2025 17:41:37 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.33161.1746985287609708159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 May 2025 10:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Y0WkM0T1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250511174123d58dad9f0756b525c7-qh93sq@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250511174123d58dad9f0756b525c7
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 May 2025 19:41:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xa/7wdMdXxhFXJwB1nld0uQJUbvJ9TQnwwy3g1BMWmM=;
 b=Y0WkM0T1vDsLoL9EJGhDXcGsHZWCfqUZn+KVDpO5C8YhnnxF5g+BbtUED23xLeJnG/vEgG
 1qB6wuqEv3MCcGdBmas8xmvF0VBSOHVUWKdjSKuhf++fuSQZRbZRrB6aVYa5oY4RSK1KmiLV
 fPfjSeRvqvAKMjXIB3gWGoXnbrbsAdQ/VH5h6znjI5A1+DIZAQXkX4vFTHKKhA0yEWjBLnyr
 Nbvnb9fBBPk+c8segQI4OhaPupoKZ9W9cgF97gboSa2u8NWF8CCs3S1WN2IAWvBEFxuYPMVe
 vclGbscQBeNO7fNsm7rQM2qz6fM+h6E+iWo+dAoW++KYvDv7rLT7QqWA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] go: upgrade 1.24.2 -> 1.24.3
Date: Sun, 11 May 2025 19:40:37 +0200
Message-Id: <20250511174037.259654-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 May 2025 17:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216288

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.24.x release [1]:

$ git --no-pager log --oneline go1.24.2..go1.24.3
34c8b14ca9 (release-branch.go1.24) [release-branch.go1.24] go1.24.3
8947f3395e [release-branch.go1.24] os: avoid escape from Root via paths ending in ../
06fd2f115b [release-branch.go1.24] cmd/compile: remove no-longer-necessary recursive inlining checks
f66ab6521c [release-branch.go1.24] cmd/internal/obj/wasm: use i64 for large return addr
c1f9c2c7b0 [release-branch.go1.24] cmd/go/internal/load: join incompatible and dirty build specifiers with .
0ab64e2caa [release-branch.go1.24] runtime: cleanup M vgetrandom state before dropping P
56eb99859d [release-branch.go1.24] internal/runtime/maps: pass proper func PC to race.WritePC/race.ReadPC
43130aff52 [release-branch.go1.24] runtime: fix 9-arg syscall on darwin/amd64
b2c005e7b2 [release-branch.go1.24] crypto/tls: fix ECH compatibility
a9d9b55709 [release-branch.go1.24] cmd/link: choose one with larger size for duplicated BSS symbols
fa7217f74d [release-branch.go1.24] os: avoid panic in Root when symlink references the root

Fixes CVE-2025-22873

[1] https://github.com/golang/go/compare/go1.24.2...go1.24.3

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.24.2.inc => go-1.24.3.inc}   | 2 +-
 ...o-binary-native_1.24.2.bb => go-binary-native_1.24.3.bb} | 6 +++---
 ...cross-canadian_1.24.2.bb => go-cross-canadian_1.24.3.bb} | 0
 .../go/{go-cross_1.24.2.bb => go-cross_1.24.3.bb}           | 0
 .../go/{go-crosssdk_1.24.2.bb => go-crosssdk_1.24.3.bb}     | 0
 .../go/{go-runtime_1.24.2.bb => go-runtime_1.24.3.bb}       | 0
 meta/recipes-devtools/go/{go_1.24.2.bb => go_1.24.3.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.24.2.inc => go-1.24.3.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.2.bb => go-binary-native_1.24.3.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.2.bb => go-cross-canadian_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.2.bb => go-cross_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.2.bb => go-crosssdk_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.2.bb => go-runtime_1.24.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.2.bb => go_1.24.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.24.2.inc b/meta/recipes-devtools/go/go-1.24.3.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.24.2.inc
rename to meta/recipes-devtools/go/go-1.24.3.inc
index cb4ae9ef80..78e26146b5 100644
--- a/meta/recipes-devtools/go/go-1.24.2.inc
+++ b/meta/recipes-devtools/go/go-1.24.3.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
-SRC_URI[main.sha256sum] = "9dc77ffadc16d837a1bf32d99c624cb4df0647cee7b119edd9e7b1bcc05f2e00"
+SRC_URI[main.sha256sum] = "229c08b600b1446798109fae1f569228102c8473caba8104b6418cb5bc032878"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.24.2.bb b/meta/recipes-devtools/go/go-binary-native_1.24.3.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.24.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.24.3.bb
index 690b8546cb..af56dc9111 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.3.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "68097bd680839cbc9d464a0edce4f7c333975e27a90246890e9f1078c7e702ad"
-SRC_URI[go_linux_arm64.sha256sum] = "756274ea4b68fa5535eb9fe2559889287d725a8da63c6aae4d5f23778c229f4b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "5fff857791d541c71d8ea0171c73f6f99770d15ff7e2ad979104856d01f36563"
+SRC_URI[go_linux_amd64.sha256sum] = "3333f6ea53afa971e9078895eaa4ac7204a8c6b5c68c10e6bc9a33e8e391bdd8"
+SRC_URI[go_linux_arm64.sha256sum] = "a463cb59382bd7ae7d8f4c68846e73c4d589f223c589ac76871b66811ded7836"
+SRC_URI[go_linux_ppc64le.sha256sum] = "341a749d168f47b1d4dad25e32cae70849b7ceed7c290823b853c9e6b0df0856"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.24.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.24.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.24.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.24.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.24.2.bb b/meta/recipes-devtools/go/go-cross_1.24.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.24.2.bb
rename to meta/recipes-devtools/go/go-cross_1.24.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.24.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.24.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.24.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.24.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.24.2.bb b/meta/recipes-devtools/go/go-runtime_1.24.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.24.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.24.3.bb
diff --git a/meta/recipes-devtools/go/go_1.24.2.bb b/meta/recipes-devtools/go/go_1.24.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.24.2.bb
rename to meta/recipes-devtools/go/go_1.24.3.bb

