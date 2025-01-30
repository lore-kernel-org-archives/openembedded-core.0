Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC1FC0218D
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:36 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.7675.1738205488060005125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DGzPjaxy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2164b662090so5392705ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205487; x=1738810287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fOc+JNn/BxN1hUpxRNh0mTxm73MZUCUwBexXwOSDAM=;
        b=DGzPjaxy0U3JlFSUBEqQ3tTYVhXH4fqZpYnYYVFvs6SeGoakr0vBmkOgZUTEUL8Mpn
         k8n+LD8rH0xdXar+tunzafcPt7jRGnUBX6p+OlMi8NbHVTViOxMZuflZGdcEdkdkH7dG
         qqX8u/pm9YAkpYYKZv805rasCdFcBHaqwRYSX8kmQnoHTnavItKymVjJAK+Ux15Lumqt
         +N85E3ZN780zhqgf2tqWDfOSGHmVO2pOJmqFUs3ZYgSAbvtPm963YBlm3TBJGp1hbUM3
         fjZGewxLpK18uS4zwV8sllT7ZOMgKo6vcAn86u6jS8zwrwExqwhNjgB3biH4m4h1zsCh
         Kxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205487; x=1738810287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fOc+JNn/BxN1hUpxRNh0mTxm73MZUCUwBexXwOSDAM=;
        b=QCzghrApHbe41twZ5rHQX8l7wM25vFBKoxhmchHzRYZTh8wh6cRzcYO0dexvp3gLcI
         6z/c8rGaeipg5i7lHHyc6pl7FPRqzwA4IIbMXrVIyXbTCQI4n6FVyiqFEWLphY++IVau
         rnrig3IHwrAAZhVeezCEbbRqg0JmBsBJmS8f5kLvNcUlv7q3bSrsr/gh6s/16zk/foaO
         N6El6VB4PMGfqkXkr+P0ofEUY04QSDE1/dmre94Qc4+EfA4Sza02wIS/UiIHsQaYQV/k
         lhylRsigrgUUFqVksJjriDn7ucM/KgEtGlBDV3CrvkK1FacBEvGj/od+c1aRnZIKiS1b
         aXlQ==
X-Gm-Message-State: AOJu0YwlQXP0NBpfsT3xLrA0VQSG8XVB+nyajnuEYoCw3Ww52X0PkCf/
	sKXgzADaNltQp0/ASrVGvfk0WmhTHPABnKq/q082Z764XvkqBjkcOam37kcx64I293ZI/nw81qX
	Syms=
X-Gm-Gg: ASbGncuWM1kGgZbbNaEMeqZevk9Ok9Phd0kR3oVA848J5miFIpUc+ZVHUfFkWJ0/2FV
	O9jRRJRL0kxwkcnjpUVKEmwalB661tfe1zCZFqVUfCqg6v3Yf5I/QEBMk/HpUHeiKeP/OHHbKZG
	YkIPUQVhTlCjCOGKyGTG+m/l3SrP2ITNQsACHhXjcLz8/x9MeZZDt8OUo5c5K6Vz5d8ryxLTqU8
	L0TQVN1lyg7rfAANo+WTx4yQp8BqSFJJQmaTqDztgMYu1yJZhSWDtxJQITaGfC++jdIzBD7zTNm
	3wL4
X-Google-Smtp-Source: AGHT+IG0WU1QUXJgx4c50lP0k61wegR3w4Is5HLNuseAOC7RErp+HGtD4zaBVQb/DSFNwAuzvd3E/Q==
X-Received: by 2002:a17:903:24d:b0:215:4d90:4caf with SMTP id d9443c01a7336-21dd7c57af8mr89671535ad.14.1738205487313;
        Wed, 29 Jan 2025 18:51:27 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/12] go: upgrade 1.22.8 -> 1.22.9
Date: Wed, 29 Jan 2025 18:51:04 -0800
Message-ID: <a424422df978e267f21938bb290f35035e658d0a.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210424

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.8..go1.22.9
8af39d30a4 (tag: go1.22.9) [release-branch.go1.22] go1.22.9
c19e5887f4 [release-branch.go1.22] cmd/cgo/internal/testcarchive: remove 1-minute timeout
e3fd4ba7f9 [release-branch.go1.22] cmd/link: generate Mach-O UUID when -B flag is specified
29252e4c5a [release-branch.go1.22] runtime: fix TestGdbAutotmpTypes on gdb version 15

[1] https://github.com/golang/go/compare/go1.22.8...go1.22.9

(From OE-Core rev: 4f2f202506bcefb4d6c46a11738e159e261a4a4b)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.9.inc}   | 2 +-
 ...o-binary-native_1.22.8.bb => go-binary-native_1.22.9.bb} | 6 +++---
 ...cross-canadian_1.22.8.bb => go-cross-canadian_1.22.9.bb} | 0
 .../go/{go-cross_1.22.8.bb => go-cross_1.22.9.bb}           | 0
 .../go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.9.bb}     | 0
 .../go/{go-runtime_1.22.8.bb => go-runtime_1.22.9.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.9.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.8.inc => go-1.22.9.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.8.bb => go-binary-native_1.22.9.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.8.bb => go-cross-canadian_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.8.bb => go-cross_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.8.bb => go-crosssdk_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.8.bb => go-runtime_1.22.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.8.bb => go_1.22.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.8.inc b/meta/recipes-devtools/go/go-1.22.9.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.8.inc
rename to meta/recipes-devtools/go/go-1.22.9.inc
index 542519b930..8fe2a8e39c 100644
--- a/meta/recipes-devtools/go/go-1.22.8.inc
+++ b/meta/recipes-devtools/go/go-1.22.9.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
+SRC_URI[main.sha256sum] = "e81a362f51aee2125722b018e46714e6a055a1954283414c0f937e737013db22"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.8.bb b/meta/recipes-devtools/go/go-binary-native_1.22.9.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.8.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.9.bb
index 98799eb503..040091be79 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.9.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
-SRC_URI[go_linux_arm64.sha256sum] = "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
-SRC_URI[go_linux_ppc64le.sha256sum] = "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
+SRC_URI[go_linux_amd64.sha256sum] = "84a8f05b7b969d8acfcaf194ce9298ad5d3ddbfc7034930c280006b5c85a574c"
+SRC_URI[go_linux_arm64.sha256sum] = "5beec5ef9f019e1779727ef0d9643fa8bf2495e7222014d2fc4fbfce5999bf01"
+SRC_URI[go_linux_ppc64le.sha256sum] = "dcee55b402eaf46e7ffb2018b9e30b27ae5e821367697d8f8ff1ed1cecfd7948"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.8.bb b/meta/recipes-devtools/go/go-cross_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.8.bb
rename to meta/recipes-devtools/go/go-cross_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.8.bb b/meta/recipes-devtools/go/go-runtime_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.9.bb
diff --git a/meta/recipes-devtools/go/go_1.22.8.bb b/meta/recipes-devtools/go/go_1.22.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.8.bb
rename to meta/recipes-devtools/go/go_1.22.9.bb
-- 
2.43.0


