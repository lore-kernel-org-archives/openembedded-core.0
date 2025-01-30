Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6052C02195
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:36 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.7677.1738205489572623949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BbqQS2d9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so2290533a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205489; x=1738810289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xy8mtGeejVADMOrxbcig/qW7Uzokw47RXb7URxtK2lA=;
        b=BbqQS2d9hjjiz86gQt1UHRu98DBKCmyyFQGT68jdLN4gogW9GkyYSkifYQc1WSIxOq
         Y7oGQ21RAsqFCWUR/DsypuYgI+ttjyt7N/6CXQuwvOq9+e6Ja8N6oDgs6e7GWFC+78Km
         NbCKu6Stuiyyt1U4a6NEHdKs/OUMFJcgEKWP7HDHAXYnspqqqtnXXoGmUIxJfoatIBFP
         odiekkboJBLNJ9BTYuTE5afRvjxVn/qoBEcJF6iISXaWyBzG5FhNIISxG13qYToTpxy+
         GZ+83uPPb8+Qzn2kGmxv78TEbq+uIy4cHXMx0fxyMh05+7WRQZ6643YMxoIEltX9KAtG
         Sz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205489; x=1738810289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xy8mtGeejVADMOrxbcig/qW7Uzokw47RXb7URxtK2lA=;
        b=RufPXBNmQa/PrfwM8W0eNDOoEWI+u8JlV1Je6pF7M/CYuP7T8kUr0MBSh87OJ/zM+1
         Z27wWWO1apJrk0sWKxYRnpokcf0ciC5g3vrbHDveMaC+pzqd6bIMLjcJM8AkYnSqrmgo
         pWOL+RKx7GtGX5WwXUTzo300jb9bvE1+vDfONvkOSspmgT7ynd1XeBLn+n6E/kpTy9qy
         8QgvxxLo8TfX2OYdqpJCXKjI/fDe++qJAYG7+E3a67mAwGU/zXlPB4C513oEaF6aSrGJ
         zXTSBlTl8BYOlWkw3fFzzTkBO0fVpr7nBVUm15IRgDiNQ9N2Fs5RjVWRVthfsuZ78Ns9
         O1OQ==
X-Gm-Message-State: AOJu0Ywz3eRpWhohsrPK0JK2Dx253tMMHkGGodZoANx5uXuUv4qUYVdi
	aunsERxYIuPVHN9P97mZnZIH5g+QK7o1qFf4aE2t3lY60Df0eS56tl2/jSqhg38HUgflnKGvK4h
	rzPk=
X-Gm-Gg: ASbGnctTEd7C1kg9rJ1k/S9X1vsbGGg3BFI3ILlczyu60TIO+o15gQzqGTxOE1xriQL
	Iee8XoLPVjMG4zW+Smrke2UJQl7biBAzpMq4Wkjlbz2hZ15PAXR+wX2Y7+Vwg51kVA2RCvO7Meu
	Z5G5oucc2T5adhspprN+h6UWcwEaYBLdTJVyxwv2ejfDqogNjIR/tZ1DcPNvqdnLvrZhWNlFSb2
	Zdd1c3s2iyoHyYCfAxli01dt7QOOUOf9ami0lZZ5MDf5Uf0/H/K0Ma3CJvV+5yO0JdBwytyb2gJ
	xlDb
X-Google-Smtp-Source: AGHT+IGKb+CYIDTEy0Y+nVkhupMhioAfuB/8Fb3MZcOreDHCbRSY1RBmmizEx6tvUkQHq34WmlASOA==
X-Received: by 2002:a62:b605:0:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-72fe2d8c1fdmr2543688b3a.8.1738205488631;
        Wed, 29 Jan 2025 18:51:28 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/12] go: upgrade 1.22.9 -> 1.22.10
Date: Wed, 29 Jan 2025 18:51:05 -0800
Message-ID: <4d35279eed634f5e2b25c23dddbfb213c4943c30.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210425

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.9..go1.22.10
8f3f22eef8 (tag: go1.22.10) [release-branch.go1.22] go1.22.10
6d7a95abca [release-branch.go1.22] runtime: reserve 4kB for system stack on windows-386
6f05fa7a4f [release-branch.go1.22] syscall: mark SyscallN as noescape
3355db9690 [release-branch.go1.22] time: accept "+01" in TestLoadFixed on OpenBSD

[1] https://github.com/golang/go/compare/go1.22.9...go1.22.10

(From OE-Core rev: e357c93b39df938dc36195dbd779a58b2951b8e6)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.9.inc => go-1.22.10.inc}  | 2 +-
 ...-binary-native_1.22.9.bb => go-binary-native_1.22.10.bb} | 6 +++---
 ...ross-canadian_1.22.9.bb => go-cross-canadian_1.22.10.bb} | 0
 .../go/{go-cross_1.22.9.bb => go-cross_1.22.10.bb}          | 0
 .../go/{go-crosssdk_1.22.9.bb => go-crosssdk_1.22.10.bb}    | 0
 .../go/{go-runtime_1.22.9.bb => go-runtime_1.22.10.bb}      | 0
 meta/recipes-devtools/go/{go_1.22.9.bb => go_1.22.10.bb}    | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.9.inc => go-1.22.10.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.9.bb => go-binary-native_1.22.10.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.9.bb => go-cross-canadian_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.9.bb => go-cross_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.9.bb => go-crosssdk_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.9.bb => go-runtime_1.22.10.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.9.bb => go_1.22.10.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.9.inc b/meta/recipes-devtools/go/go-1.22.10.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.9.inc
rename to meta/recipes-devtools/go/go-1.22.10.inc
index 8fe2a8e39c..2abe7d0f3e 100644
--- a/meta/recipes-devtools/go/go-1.22.9.inc
+++ b/meta/recipes-devtools/go/go-1.22.10.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "e81a362f51aee2125722b018e46714e6a055a1954283414c0f937e737013db22"
+SRC_URI[main.sha256sum] = "1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d339bf2462bc97b64ca4c1037"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.9.bb b/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.9.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.10.bb
index 040091be79..8c8fe5bff9 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.9.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "84a8f05b7b969d8acfcaf194ce9298ad5d3ddbfc7034930c280006b5c85a574c"
-SRC_URI[go_linux_arm64.sha256sum] = "5beec5ef9f019e1779727ef0d9643fa8bf2495e7222014d2fc4fbfce5999bf01"
-SRC_URI[go_linux_ppc64le.sha256sum] = "dcee55b402eaf46e7ffb2018b9e30b27ae5e821367697d8f8ff1ed1cecfd7948"
+SRC_URI[go_linux_amd64.sha256sum] = "736ce492a19d756a92719a6121226087ccd91b652ed5caec40ad6dbfb2252092"
+SRC_URI[go_linux_arm64.sha256sum] = "5213c5e32fde3bd7da65516467b7ffbfe40d2bb5a5f58105e387eef450583eec"
+SRC_URI[go_linux_ppc64le.sha256sum] = "db05b9838f69d741fb9a5301220b1a62014aee025b0baf341aba3d280087b981"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.9.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.9.bb b/meta/recipes-devtools/go/go-cross_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.9.bb
rename to meta/recipes-devtools/go/go-cross_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.9.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.9.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.9.bb b/meta/recipes-devtools/go/go-runtime_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.9.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.10.bb
diff --git a/meta/recipes-devtools/go/go_1.22.9.bb b/meta/recipes-devtools/go/go_1.22.10.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.9.bb
rename to meta/recipes-devtools/go/go_1.22.10.bb
-- 
2.43.0


