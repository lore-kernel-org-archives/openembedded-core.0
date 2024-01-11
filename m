Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685AFC47422
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:42 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.15718.1704990457775866100
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2GD2fDAX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3ed1ca402so49896245ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990457; x=1705595257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZjGnurVt4vB+Q8xyJWGjTb9AleOBNPpRkGhdg4RGSGo=;
        b=2GD2fDAXYAex+CPfcVDLbDtLozVJ+0sP/Suly2iEzvtBekC5GMmJUX5jDQOt6pyVve
         86gHqW4VEYPYDh+BIKKs1d5K/pPy+3n1a+zXE1julSoU6Cxmp2qJdWKfifF/GUdvleqW
         BYdl0hiA1v0a5b+A0QvVOZyeA6hiyIZjhiR0O62XFTsjbXx9dM+vkUW05eLXi4rY5Qp9
         qC6jp1GV3sQqCMDZ996E+KmIYuvbnGpbEgTx0cDkHe1yTUrH1XGiepfgmknyJRuMLP5D
         iG8gIq2W777cN6Q5MvsNGyWEMBJve+6bKqlk7Ii4GJRWRWCz61M3PbS7+vuiz2212hCo
         gprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990457; x=1705595257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjGnurVt4vB+Q8xyJWGjTb9AleOBNPpRkGhdg4RGSGo=;
        b=sxzqZZhVPFHxGVGJNYkacgMiR0geau0EQlf+OUIYp0rr1YL12Uxqb+jFMcEFTVGKou
         qtO1YC4rk9UlbZNFMXma2vV9E5RzuWmw3reEACI7J1n6g8PhKdHsNNEDIiMd88X1Blgm
         VMomtPU2iVZroUadSQWWXw7k3U87tFGXhH3oHdOd30q8WE5Vzeigolth/0hoNjE9I8PE
         ztZ4e3z5C6P4wMPcFq9ryLLkcpz5YgpVbcGqcddfx2rPinx44uCimgIiKIsT7vwqop7k
         jTA3g4087TlniflXIlut5Sir63zWaVnqCSlGPpryFZf6ssX3L3V7WCiqPenBGJFCreoZ
         sTFg==
X-Gm-Message-State: AOJu0YwPGdmvgW85EwU/TghXImvKJKjFdALz6doFWW/tCodBY101jAO6
	PYkUUDdr+0vbVIovxhvhod/fxkCX9acp1suCQvn3UU3zKFUoPg==
X-Google-Smtp-Source: AGHT+IE7rSK5fYbHAaTKNWx+Lu0RrLFKwygxXb2/K/jPkoObQrR4NVgrxurVfltmQZzGup4YCzoSZw==
X-Received: by 2002:a17:902:bb10:b0:1d3:a0b8:c4dd with SMTP id im16-20020a170902bb1000b001d3a0b8c4ddmr1492336plb.118.1704990456637;
        Thu, 11 Jan 2024 08:27:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/12] go: update 1.20.10 -> 1.20.11
Date: Thu, 11 Jan 2024 06:27:16 -1000
Message-Id: <0ff60c9bf0332a9b6305e082a6ecae7c963d367e.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193551

From: Jose Quaresma <quaresma.jose@gmail.com>

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.10..go1.20.11
1d0d4b149c (tag: go1.20.11) [release-branch.go1.20] go1.20.11
46fb781685 [release-branch.go1.20] path/filepath: fix various issues in parsing Windows paths
998fdce3ae [release-branch.go1.20] net/http: pull http2 underflow fix from x/net/http2
d48639094b [release-branch.go1.20] cmd/link: split text sections for arm 32-bit
c8fdffb790 [release-branch.go1.20] all: tidy dependency versioning after release

[1] https://github.com/golang/go/compare/go1.20.10...go1.20.11

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 09fb378fb9c60c383f0ac068bbe3692f047aa617)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.20.10.inc => go-1.20.11.inc} | 2 +-
 ...binary-native_1.20.10.bb => go-binary-native_1.20.11.bb} | 6 +++---
 ...oss-canadian_1.20.10.bb => go-cross-canadian_1.20.11.bb} | 0
 .../go/{go-cross_1.20.10.bb => go-cross_1.20.11.bb}         | 0
 .../go/{go-crosssdk_1.20.10.bb => go-crosssdk_1.20.11.bb}   | 0
 .../go/{go-native_1.20.10.bb => go-native_1.20.11.bb}       | 0
 .../go/{go-runtime_1.20.10.bb => go-runtime_1.20.11.bb}     | 0
 meta/recipes-devtools/go/{go_1.20.10.bb => go_1.20.11.bb}   | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.10.inc => go-1.20.11.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.10.bb => go-binary-native_1.20.11.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.10.bb => go-cross-canadian_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.10.bb => go-cross_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.10.bb => go-crosssdk_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.10.bb => go-native_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.10.bb => go-runtime_1.20.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.10.bb => go_1.20.11.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.10.inc b/meta/recipes-devtools/go/go-1.20.11.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.10.inc
rename to meta/recipes-devtools/go/go-1.20.11.inc
index 39509ed986..2f510b1791 100644
--- a/meta/recipes-devtools/go/go-1.20.10.inc
+++ b/meta/recipes-devtools/go/go-1.20.11.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "72d2f51805c47150066c103754c75fddb2c19d48c9219fa33d1e46696c841dbb"
+SRC_URI[main.sha256sum] = "d355c5ae3a8f7763c9ec9dc25153aae373958cbcb60dd09e91a8b56c7621b2fc"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.10.bb b/meta/recipes-devtools/go/go-binary-native_1.20.11.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.11.bb
index 691670c31e..bf91067971 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.11.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "80d34f1fd74e382d86c2d6102e0e60d4318461a7c2f457ec1efc4042752d4248"
-SRC_URI[go_linux_arm64.sha256sum] = "fb3c7e15fc4413c5b81eb9f26dbd7cd4faedd5c720b30fa8e2ff77457f74cab6"
-SRC_URI[go_linux_ppc64le.sha256sum] = "ebac6e713810174f9ffd7f48c17c373fbf359d50d8e6233b1dfbbdebd524fd1c"
+SRC_URI[go_linux_amd64.sha256sum] = "ef79a11aa095a08772d2a69e4f152f897c4e96ee297b0dc20264b7dec2961abe"
+SRC_URI[go_linux_arm64.sha256sum] = "7908a49c6ce9d48af9b5ba76ccaa0769da45d8b635259a01065b3739acef4ada"
+SRC_URI[go_linux_ppc64le.sha256sum] = "e04676e1aeafe7c415176f330322d43a4be5ea6deb14aca49905bd1449dc7072"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.10.bb b/meta/recipes-devtools/go/go-cross_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.10.bb
rename to meta/recipes-devtools/go/go-cross_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.10.bb b/meta/recipes-devtools/go/go-native_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.10.bb
rename to meta/recipes-devtools/go/go-native_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.10.bb b/meta/recipes-devtools/go/go-runtime_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.11.bb
diff --git a/meta/recipes-devtools/go/go_1.20.10.bb b/meta/recipes-devtools/go/go_1.20.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.10.bb
rename to meta/recipes-devtools/go/go_1.20.11.bb
-- 
2.34.1


