Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6698C021A5
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:47 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.3293.1739304579574317442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yySFl0+v;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f78b1fb7dso50010605ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304579; x=1739909379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9H+yFWndYf4jBTmJCjs7yk9azGtD8nY+uDWhxBdQQaY=;
        b=yySFl0+vpFPWm9pJfp4OkGhKuYLYZK4DEV69ySMuzYHADbbr9xjobohHg9/kLiPU+T
         /g0xHLCrKwPSuksL627V82iwc9sfVbiozXZs0955gq0xx9FCF/EnImYHs9KvqICbzQal
         o29orUvDj3Vs5wZIo4y4qRiST0C2H1YLQTvjmMQ5JZ11mVRJWFQ6HgkewlubBwEOXw9/
         qrjzNAydERA9a4MK2Eu+3KcWlcRmcH0+6xGvmyzaFamE8pXXEHXPkQwwBPUR6DW5Ndh4
         HlgGNsDrbKtcnYRNYEYNy/b9uEnCvLVNh3He0iV1w1/o1AEw33YEexh5UxOBBfVVvMfr
         N92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304579; x=1739909379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9H+yFWndYf4jBTmJCjs7yk9azGtD8nY+uDWhxBdQQaY=;
        b=ScSkqKidWplwKTLjTCYetNEuX9KYD5lGpPKv9Xwr4pCmVbYkZDnT8tRkaEVv8VtirT
         8sbbKUJpKJAYLxfJbKEt9MVG9HTypDLxJGNR4OC10AjIwOumyCopNCEU/YLmCb99DiUO
         hPFIkOTrpRnxF7iyuMF+AR6mldRaAURfDvjUwqAHDG0stjIGsHwlIKTtt/ttYl0GjlkB
         tMppKwuH1iK5z4slgXCzsLiexbHPIfwYW65fMBWF25UK+lcYeWDHWvUeVMNOvsxtywQQ
         4g2/HvCk6FjyJEKSQaxNsmj/MGZMFgx4LXhw0SwHTSL0BaToN1KB+WOLlQonBb7jnM12
         7FDA==
X-Gm-Message-State: AOJu0YxkrRXDRFCr1zjHuBG5JLyQMKfU+/rPyUmhNPhWqWSxSwLSaEAJ
	2zcM5683KcNG1rqeSevtjopuCKho/zy5w9wE8kpwZUYZzjfpBNRarVFMm4ECKyoj6ZtehpK6Acw
	K
X-Gm-Gg: ASbGncuTQkJSC6GwD+fdJBFXWob7cEayPr9R3u2yxTU6jCraydaMKZdtxqowhdVVryx
	ZZIg6OjZ3qYzg/2d0yTlZevnjW9HdV4thbzeY8QpLgH+1HUZdJ6UCSuNXenqjDT6GA3Dnle+nhH
	SA6IJsw0KCi0TcSk1awf7/SQpvogFOW9oIrtV1LCbAm+hOMU9Qi/ONMpKIArpYCKup8Me82Ult8
	T4zZVCdfIoPjLJJML3jFzRo79mBj4N3+/3ib/U57NyfOLJ+vB3G+HKFcT1QCpbSNnjpskufi1fh
	eXpN
X-Google-Smtp-Source: AGHT+IEk0dmbk85jFvit+GhJMz8XJVYzNVgiu6excTE1fnkL81fi+SdXIsstaFvPrjSOQ7y8WITJaQ==
X-Received: by 2002:a17:902:e848:b0:21f:14e3:165d with SMTP id d9443c01a7336-220bbca9c47mr10840925ad.44.1739304578730;
        Tue, 11 Feb 2025 12:09:38 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/14] go: upgrade 1.22.11 -> 1.22.12
Date: Tue, 11 Feb 2025 12:09:10 -0800
Message-ID: <9862cb44ad0f85eebbd9c7f6bcbf22df9cc10d0f.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211180

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


