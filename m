Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B469CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 17:14:12 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.22104.1760721250042323326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 10:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=cIR/JNAy;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20251017171406df9fd4c6f50002076d-uvxied@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251017171406df9fd4c6f50002076d
        for <openembedded-core@lists.openembedded.org>;
        Fri, 17 Oct 2025 19:14:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=gzx2hPO7/LxdUp4C+RJnUm4exnz5UELY18jaMEvNy7Q=;
 b=cIR/JNAyEqPpqcQR/nAErPogsZCY4+J35bW6SEErVEu/vxw/ZVAA0gp+vejHM656JEfZLN
 x9GO1REapxC1hC0n1/6z6lDr0vqA5gu/m5DdLb0O5L2eLdKqiOPj3zdcjQ9K9QaZm7+6Mq9e
 hlbYJPE7EnM00YLvJcUJxPzQK13IYrrCgkdsut/zJGv/4guR391Osrc0p7Zu6ub6whjkSqha
 /Ghjma/uu38gjbY6wRuQo8UQUBGMlpZA+X4hohlKRhLSBCLjZq0gTffwc0kZ0kf499OrNgfH
 UyNNStB99L87QunPGAhb7fjCjC+fX6qu8N935XdbfEQOEJtoz0/eFJpw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] go: upgrade 1.25.2 -> 1.25.3
Date: Fri, 17 Oct 2025 19:14:02 +0200
Message-Id: <20251017171402.166115-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 17:14:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225029

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.25.x release [1]:

$ git --no-pager log --oneline go1.25.2..go1.25.3
28622c1959 (tag: go1.25.3) [release-branch.go1.25] go1.25.3
e05b2c92d9 [release-branch.go1.25] crypto/x509: rework fix for CVE-2025-58187
79ec0c94f3 [release-branch.go1.25] spec: update spec date to match release date

This release addresses breakage caused by a security patch included in Go 1.25.2
and 1.24.8, which enforced overly restrictive validation on the parsing of X.509
certificates. We've removed those restrictions while maintaining the security
fix that the initial release addressed [2].

[1] https://github.com/golang/go/compare/go1.25.2...go1.25.3
[2] https://groups.google.com/g/golang-announce/c/YEyj6FUNbik

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/{go-1.25.2.inc => go-1.25.3.inc}   | 2 +-
 ...o-binary-native_1.25.2.bb => go-binary-native_1.25.3.bb} | 6 +++---
 ...cross-canadian_1.25.2.bb => go-cross-canadian_1.25.3.bb} | 0
 .../go/{go-cross_1.25.2.bb => go-cross_1.25.3.bb}           | 0
 .../go/{go-crosssdk_1.25.2.bb => go-crosssdk_1.25.3.bb}     | 0
 .../go/{go-runtime_1.25.2.bb => go-runtime_1.25.3.bb}       | 0
 meta/recipes-devtools/go/{go_1.25.2.bb => go_1.25.3.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.25.2.inc => go-1.25.3.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.25.2.bb => go-binary-native_1.25.3.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.25.2.bb => go-cross-canadian_1.25.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.25.2.bb => go-cross_1.25.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.25.2.bb => go-crosssdk_1.25.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.25.2.bb => go-runtime_1.25.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.25.2.bb => go_1.25.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.25.2.inc b/meta/recipes-devtools/go/go-1.25.3.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.25.2.inc
rename to meta/recipes-devtools/go/go-1.25.3.inc
index 9d1cf696700..c29f4d6ecee 100644
--- a/meta/recipes-devtools/go/go-1.25.2.inc
+++ b/meta/recipes-devtools/go/go-1.25.3.inc
@@ -18,4 +18,4 @@ SRC_URI += "\
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch \
     file://0001-runtime-when-using-cgo-on-386-call-C-sigaction-funct.patch \
 "
-SRC_URI[main.sha256sum] = "3711140cfb87fce8f7a13f7cd860df041e6c12f7610f40cac6ec6fa2b65e96e4"
+SRC_URI[main.sha256sum] = "a81a4ba593d0015e10c51e267de3ff07c7ac914dfca037d9517d029517097795"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.25.2.bb b/meta/recipes-devtools/go/go-binary-native_1.25.3.bb
similarity index 79%
rename from meta/recipes-devtools/go/go-binary-native_1.25.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.25.3.bb
index fbdef1b695c..b1d9522cb6f 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.25.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.25.3.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "d7fa7f8fbd16263aa2501d681b11f972a5fd8e811f7b10cb9b26d031a3d7454b"
-SRC_URI[go_linux_arm64.sha256sum] = "9aaeb044bf8dbf50ca2fbf0edc5ebc98b90d5bda8c6b2911526df76f61232919"
-SRC_URI[go_linux_ppc64le.sha256sum] = "91dd35ac3f33baa642d9bac22b626bdb5ee0372cf80e7d782994337f81f34417"
+SRC_URI[go_linux_amd64.sha256sum] = "0335f314b6e7bfe08c3d0cfaa7c19db961b7b99fb20be62b0a826c992ad14e0f"
+SRC_URI[go_linux_arm64.sha256sum] = "1d42ebc84999b5e2069f5e31b67d6fc5d67308adad3e178d5a2ee2c9ff2001f5"
+SRC_URI[go_linux_ppc64le.sha256sum] = "68d1a08bf3567f330717d821b266a0be1c5080bd05dc238b5a43a24ca0c47d7c"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.25.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.25.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.25.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.25.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.25.2.bb b/meta/recipes-devtools/go/go-cross_1.25.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.25.2.bb
rename to meta/recipes-devtools/go/go-cross_1.25.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.25.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.25.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.25.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.25.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.25.2.bb b/meta/recipes-devtools/go/go-runtime_1.25.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.25.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.25.3.bb
diff --git a/meta/recipes-devtools/go/go_1.25.2.bb b/meta/recipes-devtools/go/go_1.25.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.25.2.bb
rename to meta/recipes-devtools/go/go_1.25.3.bb

