Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B046EC02194
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 02:51:36 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.7727.1738205490767270676
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 18:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l3QjKrJ1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-215770613dbso3418575ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738205490; x=1738810290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIUUXzA6Bs30r6F0wxrFz+H7jxSWchng2i8h7gBhsLk=;
        b=l3QjKrJ19G8hGuZsiW6MOhDs+pof8Hw1b0+d2hBVjmSMC7bW+NaCoR0qxxSSkMp/lk
         74YEpDSneFGaUpFgr9ux5A3wgobeQSPNs4vZiFtw4hVdvJFCZ9Zc/vCZVrcTq9zb6gD3
         s6jMhqN5tHRECejVHMmbPKMu7bhjtcVdhdnwKgdA810O//TD5OyvXSebJoQ+ln6xSEnz
         S8qZDuJqpkXhO35DR73/qmLY32/bOlYfrlWUCSQwCcsP+TU9KfY4lI+DB+KhI7bGvzzp
         1mQbk83tgBB/+LkdjOiRU2frBUv2d30PwzQBGoDbn9dKcmrO0877iOk6LQcjUIK30n54
         0YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738205490; x=1738810290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIUUXzA6Bs30r6F0wxrFz+H7jxSWchng2i8h7gBhsLk=;
        b=Q8AEbwdVTtSlA65gYijxQepBIHSxX4PxoolxTUaxO6mfFtpBGwU/ejXLrlcosf9zlK
         UQ/Hw6vHj3vHonCvmMiSqIbd3CEkttGxWqkUAv0Mc8ft3bs15oRNWEzzSdeY4cfbD/ij
         9EfKb/jqA7QZgusnSozBIymkn5a1+n1K3ewQktpqjgw4bWLcRLIwBzcBiyCjM0zvb1zp
         7hJ6Z/XrqsoGVakc48ml+Wisl+C0IFLMOXLg6YmLJd6mlRBxmG9Juw8m0MRWEXCIWKpm
         lxkXlbMlfdN7Iq/Do8TcPviguJdORvMMhRUc60Hip2rte5QXXlVKkppfYHThQbSf6BQD
         xEng==
X-Gm-Message-State: AOJu0Yw7Yp5+X4jF+e1v/zFQSqJH0tfqU9wzPYlhK6Ydx2ZLiBwquJ3i
	swZNagT3k1A8rfbjtO+FRbgaHJEJD103JxVQgGuM0C+Y8CaNPEfZIfjWjB+L9A+rxkFQ/mVyaaP
	Ml6A=
X-Gm-Gg: ASbGnctmGZ5Zux9I2YlHOd2hLoJLacsJNOqihSd/amYdIoazZ2lMzIALaZDsZFcKAZP
	PrTVjeFSoaGEQWjTKsmgmhAnezQpRxZjJb6kUO+OzTJ196YlY/bSWlDitS0+akNRgrHtT2Dru+U
	EXnyQ0KAd3tfTY5JtKmBuvV0vB7JZe/dIxhGi1UMYDHR9OLW9EsCz4UdCzV3qPlSwxgpu0nrmYA
	KAsqKJ29UJZrIWSlyQpr+LxBRDCVy40KlHyOnmkN+nuKkgBAKbe6qknFcrdh4Np1CjOH76V68LG
	xfWA
X-Google-Smtp-Source: AGHT+IHGEsUiow6eV87DwpSfLQ26KPdgnb+m5lv9A7/7uQAB7mxXvyYqiOQ6OA+oaAt6EU6nI0pN9Q==
X-Received: by 2002:a05:6a21:6da4:b0:1e1:b727:1801 with SMTP id adf61e73a8af0-1ed7a5ef9demr7867740637.27.1738205490030;
        Wed, 29 Jan 2025 18:51:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec04794a4sm249726a12.60.2025.01.29.18.51.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 18:51:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/12] go: upgrade 1.22.10 -> 1.22.11
Date: Wed, 29 Jan 2025 18:51:06 -0800
Message-ID: <35bf053cd41d53a764ef3a2de3e7cb1e6c81109f.1738205405.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738205405.git.steve@sakoman.com>
References: <cover.1738205405.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 02:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210426

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.10..go1.22.11
f072884354 (tag: go1.22.11) [release-branch.go1.22] go1.22.11
b72d56f98d [release-branch.go1.22] net/http: persist header stripping across repeated redirects
19d2103415 [release-branch.go1.22] crypto/x509: properly check for IPv6 hosts in URIs
ae9996f965 [release-branch.go1.22] runtime: hold traceAcquire across casgstatus in injectglist
223260bc63 [release-branch.go1.22] crypto/tls: fix Config.Time in tests using expired certificates

Fixes CVE-2024-45336 and CVE-2024-45341

[1] https://github.com/golang/go/compare/go1.22.10...go1.22.11

(From OE-Core rev: 4589986602319f9ed61e381b333bb53b731eb8d8)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.10.inc => go-1.22.11.inc} | 2 +-
 ...binary-native_1.22.10.bb => go-binary-native_1.22.11.bb} | 6 +++---
 ...oss-canadian_1.22.10.bb => go-cross-canadian_1.22.11.bb} | 0
 .../go/{go-cross_1.22.10.bb => go-cross_1.22.11.bb}         | 0
 .../go/{go-crosssdk_1.22.10.bb => go-crosssdk_1.22.11.bb}   | 0
 .../go/{go-runtime_1.22.10.bb => go-runtime_1.22.11.bb}     | 0
 meta/recipes-devtools/go/{go_1.22.10.bb => go_1.22.11.bb}   | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.10.inc => go-1.22.11.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.10.bb => go-binary-native_1.22.11.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.10.bb => go-cross-canadian_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.10.bb => go-cross_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.10.bb => go-crosssdk_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.10.bb => go-runtime_1.22.11.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.10.bb => go_1.22.11.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.10.inc b/meta/recipes-devtools/go/go-1.22.11.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.10.inc
rename to meta/recipes-devtools/go/go-1.22.11.inc
index 2abe7d0f3e..21222bea4e 100644
--- a/meta/recipes-devtools/go/go-1.22.10.inc
+++ b/meta/recipes-devtools/go/go-1.22.11.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "1e94fd48be750d1fafb4d9b3b6dd31a6e9d2735d339bf2462bc97b64ca4c1037"
+SRC_URI[main.sha256sum] = "a60c23dec95d10a2576265ce580f57869d5ac2471c4f4aca805addc9ea0fc9fe"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.10.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.11.bb
index 8c8fe5bff9..a526cc88bc 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.10.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.11.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "736ce492a19d756a92719a6121226087ccd91b652ed5caec40ad6dbfb2252092"
-SRC_URI[go_linux_arm64.sha256sum] = "5213c5e32fde3bd7da65516467b7ffbfe40d2bb5a5f58105e387eef450583eec"
-SRC_URI[go_linux_ppc64le.sha256sum] = "db05b9838f69d741fb9a5301220b1a62014aee025b0baf341aba3d280087b981"
+SRC_URI[go_linux_amd64.sha256sum] = "0fc88d966d33896384fbde56e9a8d80a305dc17a9f48f1832e061724b1719991"
+SRC_URI[go_linux_arm64.sha256sum] = "9ebfcab26801fa4cf0627c6439db7a4da4d3c6766142a3dd83508240e4f21031"
+SRC_URI[go_linux_ppc64le.sha256sum] = "963a0ec973640b23ee8bb7a462cc415276fd8436111a03df8c34eb3b1ae29f12"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.10.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.10.bb b/meta/recipes-devtools/go/go-cross_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.10.bb
rename to meta/recipes-devtools/go/go-cross_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.10.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.10.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.10.bb b/meta/recipes-devtools/go/go-runtime_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.10.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.11.bb
diff --git a/meta/recipes-devtools/go/go_1.22.10.bb b/meta/recipes-devtools/go/go_1.22.11.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.10.bb
rename to meta/recipes-devtools/go/go_1.22.11.bb
-- 
2.43.0


