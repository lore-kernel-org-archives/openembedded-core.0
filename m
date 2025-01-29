Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3A1C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:17 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.19357.1738173912426474604
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y7+q8Del;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-216281bc30fso11531565ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173912; x=1738778712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fOc+JNn/BxN1hUpxRNh0mTxm73MZUCUwBexXwOSDAM=;
        b=y7+q8DelD27ShzJEFkdhjbumcK2Spf03btSO1GXltTS12hyKV0AaTJUhIKjoN8NNCC
         gdY9Bfb3raM1ELcLYX0M8HW/YXy7LVQkK83j0YvvIgQV8MtoOZa6xprlM5HRS98Cv1jJ
         w5qCo+V3wcj/m8KW019kRIDy+VjSqZFOOdPCk93JUX7pLo9sA2rlDRW/jwdyfFtdDiFi
         mNKBPLjJ/jbtZQ9Ti4cvzRsAnGwZ8rtyjm/WJknxwSUolio1JolUXlDycY2nQx5RO1Iz
         izJACubtx5erdS2vEk3Ocznq25Sx5UyUL3nLg/oefeaAkvYfrQIAVUNIwzdB1m+ajMrn
         Czhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173912; x=1738778712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fOc+JNn/BxN1hUpxRNh0mTxm73MZUCUwBexXwOSDAM=;
        b=DsdJ458uXKeniTEnuuM498unTnp0oeXT9pAUa8Q6/uRsJVGx9up4ObM+3pUSn2q5Nn
         MpMd1G0pFdYB4Arc6lGCzmHRZiO6QZ4N3UD9FuKhKHUuF8RdEOW4BSp6AQQDTPUgCddE
         kvxlo/EYM3epGENlC/D3ZQpSm1xaYU0dT0fioJcVuMAvawOKj5ac41VEeB2BAWtVKdw2
         yCd0Vbtgj6HVqYIo17VUQGrlMnepXImQQuIXp2P1JwxsTk/T3esW1ZzRUq+okmNozeTS
         hMyDIyhoiachLZqJHCs8SCVw8UZ6f8kFEg2RXGWIA/KdMt0/UpYe/b7VKCOu/V/ZqPMA
         Hxjw==
X-Gm-Message-State: AOJu0YxMu+yFl1J0nIpv59uW8/8qbuguFUg/Yl3wx4AcVwf0ZGLCOXC9
	oQ400qAhwcJo7KIXCTjWO8v1Ehf3QyesB7qVNg2ZmYwP8kfmLeunSi7VaZrP2fSLWZoNQgOXe8o
	O4V8=
X-Gm-Gg: ASbGncvOQnzScPfQqqWw3ToNqbqaMzajm8hLTooFwJa2fnq00vSgN5iRUmpI9h3J8sg
	kbGyWmRf7hwS8Rh1fq3+jUuiH547LwxNG/gr8nJZRqgJalAwVLno6cXo3H/LDTjMN/mZT6/QPMW
	pDuFyCHCvBmrracDkwF7GxF1xBigzGZiVykOhbJscN/EUh4mvGaUoSjH5er+mizm7CIlHPvDIFg
	pbj2+JhRaqh2mB/pHMHiA2iI3zXtxAde0XuEYQUIWwjah/QffPJw698r0vi63MwQpEgbHbkXEIX
	OE6w
X-Google-Smtp-Source: AGHT+IHDVtFAMIc4gK1ihe9+++wADBZrsgHmZMshl8B8lh/XOOhs6fpD9dtSIbI6R0OCRJaN+O/ZSw==
X-Received: by 2002:a05:6a21:3a8a:b0:1e1:ab03:8653 with SMTP id adf61e73a8af0-1ed7a49a2cdmr7038827637.9.1738173907292;
        Wed, 29 Jan 2025 10:05:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 1/8] go: upgrade 1.22.8 -> 1.22.9
Date: Wed, 29 Jan 2025 10:04:50 -0800
Message-ID: <3425dd4ba1723fb9c660b3941fd92209c3141dd3.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738173760.git.steve@sakoman.com>
References: <cover.1738173760.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210395

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


