Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C7BC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:57:51 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.744.1739311068351502016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 13:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e7klD3b0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21f48ebaadfso103404955ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739311068; x=1739915868; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9H+yFWndYf4jBTmJCjs7yk9azGtD8nY+uDWhxBdQQaY=;
        b=e7klD3b0bDb3E0TufZ2wNG9d8UnH7nV77H1DuyI72eoA+KO/EsYjhU7K2D8DqVm2wi
         rZdHewoQiMZYpuVOIXZcEGFkz684o6uefSrcS7AwDm2Ob1le4CjUUjWwrUcu0LUa8F83
         O0k84QvevC2S6dEILN/mpGFWXAQpamvehwFEXiQO2rFZq+wuJAbonI8/IJ/Z5uKg70Ru
         nV5GziNa4h7iMcDbJoWIGsMO+gmKm2jOPfTtH0Vk0fKkow2NqXrFWtycY2AYKgMT6XyC
         ZHZkLtBnI3M17pkiuw+zGLZTmlSIZemcKUidEeJEDKMyQ6PhxdJ4W/4phA0KUGfVphWk
         JmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739311068; x=1739915868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9H+yFWndYf4jBTmJCjs7yk9azGtD8nY+uDWhxBdQQaY=;
        b=MHiWjdqeN43+IDK4/Bdwc+fCXWtHpJvV1QT9v4Op2CX2KzjwIHyDhKQhCDnv0R663O
         nVe+kEpKoyNdcTDUNvd5QVJpRs1yt3zF0o32iSivEwe3wlotr+vGbhbxFCpDoXtJ9lKm
         +r1pCyezhinSnmnmElCnsdLJ9bK1768KF5Fyv776CeHDb+qNNRHuib6vrIf/4TRF78y5
         jS22ltlris/jmX8oel7pCu7KZ/aLNf8fPMbCVWdjfJOe6/xaeiLzphMf1vpfgz4RCexq
         xhBpFt1FzSqcCcHdUAalig8DNjB56X8fzDP6uEBpu/UzwknpSa8bwhr1mS5gkwytLFi5
         jtDw==
X-Gm-Message-State: AOJu0YyZT6tn6BUMumPhevRiZ7BfyJh0K15WK5++tTey7SiKDvJ0hyRn
	nLLyLbZ5NVWuCYmCm/tPlvr75bAdqZLuadFxEAdcibNfR+DpnbLX065qC49Uu/qiZuG85sgWLo3
	d
X-Gm-Gg: ASbGncsc1t8JlPRFyeu8Q6IDUfndM130CeQw85rJ5dbeJ7pAXfNuuw3+zJWjQxIrqCz
	iJJmjizu421Uz8OqBCAI3AYLq4POSj/qc++Op/pyib4iAx0ss8yrO/eexrix0euM0tTiZcvoyjh
	Pr4BE0WYxqOifBp56e/iwze2PcClHjfw/a4QFTfvEgzYcvCIa0ciLDVw/Qleh0z3MAxf95sdOIK
	CRqSNiv/d5cZxpGyvoNtJTDpRcjG6Xl9DJHmw+uNeGXjwsYV32Io533+E8d1sP8Sy7qxM4IwpXG
	Xw1g
X-Google-Smtp-Source: AGHT+IGpRJdKiZ6U2hGbOau78vq/fihSikNUO+j3nPbi/KbHU2MO5HhXebOHID0tejne6WK36IFvOg==
X-Received: by 2002:a17:903:41c9:b0:215:8dd3:536a with SMTP id d9443c01a7336-220bbab102dmr12535925ad.4.1739311067589;
        Tue, 11 Feb 2025 13:57:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650e6aasm100210495ad.12.2025.02.11.13.57.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:57:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 3/4] go: upgrade 1.22.11 -> 1.22.12
Date: Tue, 11 Feb 2025 13:57:34 -0800
Message-ID: <ce999920af8c8ac6ce4c3f37edae348919e8a13b.1739310940.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739310940.git.steve@sakoman.com>
References: <cover.1739310940.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211192

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.11..go1.22.12
5817e65094 (tag: go1.22.12) [release-branch.go1.22] go1.22.12
0cc45e7ca6 [release-branch.go1.22] crypto/internal/fips140/nistec: make p256NegCond constant time on ppc64le
c3c6a50095 [release-branch.go1.22] cmd/go/internal/modfetch: do not trust server to send all tags in shallow fetch
e0a01acd04 [release-branch.go1.22] cmd/compile: fix write barrier coalescing

Fixes CVE-2025-22866

[1] https://github.com/golang/go/compare/go1.22.11...go1.22.12

(From OE-Core rev: 423ad5a67768738dac454b1e2aa27746f74511c5)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.11.inc => go-1.22.12.inc} | 2 +-
 ...binary-native_1.22.11.bb => go-binary-native_1.22.12.bb} | 6 +++---
 ...oss-canadian_1.22.11.bb => go-cross-canadian_1.22.12.bb} | 0
 .../go/{go-cross_1.22.11.bb => go-cross_1.22.12.bb}         | 0
 .../go/{go-crosssdk_1.22.11.bb => go-crosssdk_1.22.12.bb}   | 0
 .../go/{go-runtime_1.22.11.bb => go-runtime_1.22.12.bb}     | 0
 meta/recipes-devtools/go/{go_1.22.11.bb => go_1.22.12.bb}   | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.11.inc => go-1.22.12.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.11.bb => go-binary-native_1.22.12.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.11.bb => go-cross-canadian_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.11.bb => go-cross_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.11.bb => go-crosssdk_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.11.bb => go-runtime_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.11.bb => go_1.22.12.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.11.inc b/meta/recipes-devtools/go/go-1.22.12.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.11.inc
rename to meta/recipes-devtools/go/go-1.22.12.inc
index 21222bea4e..05aa3a95b6 100644
--- a/meta/recipes-devtools/go/go-1.22.11.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
+SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.11.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.11.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index a526cc88bc..747737ff94 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "0fc88d966d33896384fbde56e9a8d80a305dc17a9f48f1832e061724b1719991"
-SRC_URI[go_linux_arm64.sha256sum] = "9ebfcab26801fa4cf0627c6439db7a4da4d3c6766142a3dd83508240e4f21031"
-SRC_URI[go_linux_ppc64le.sha256sum] = "963a0ec973640b23ee8bb7a462cc415276fd8436111a03df8c34eb3b1ae29f12"
+SRC_URI[go_linux_amd64.sha256sum] = "4fa4f869b0f7fc6bb1eb2660e74657fbf04cdd290b5aef905585c86051b34d43"
+SRC_URI[go_linux_arm64.sha256sum] = "fd017e647ec28525e86ae8203236e0653242722a7436929b1f775744e26278e7"
+SRC_URI[go_linux_ppc64le.sha256sum] = "9573d30003b0796717a99d9e2e96c48fddd4fc0f29d840f212c503b03d7de112"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.11.bb b/meta/recipes-devtools/go/go-cross_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.11.bb
rename to meta/recipes-devtools/go/go-cross_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.11.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.11.bb b/meta/recipes-devtools/go/go-runtime_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.11.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.12.bb
diff --git a/meta/recipes-devtools/go/go_1.22.11.bb b/meta/recipes-devtools/go/go_1.22.12.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.11.bb
rename to meta/recipes-devtools/go/go_1.22.12.bb
-- 
2.43.0


