Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2367CD63940
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 13:57:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.13833.1732111043349243045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 05:57:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nPjXCGXF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2ea68cd5780so2914132a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732111042; x=1732715842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zL8+XLybcTzCuyQblf9r5bfxdc0U6oUEkj48auYI1gQ=;
        b=nPjXCGXFSEpYJRP3wWaYsJHrkaewGinU06ymorpHk8dNaNiSQI0E8MPeT4ctRJNyLi
         wtbVuc2ERn3Yx5z1FR5LRUcLhBsBolL3jKiWSzm3kqW/MXnjGZ3EKLwO/s3DhCQwGP4d
         nRvT7DETfqZcr0D+/spNVdcagpbOcnI/1CSLtlzY80yDTdsD4+GZFIEvrqZ13Rw5jO2n
         6UTMIT9fpG15HovweqFB91JN5bLI/pnUDrwv56omU9N8YUsRjHLr/ufHg4GPNhdYAT+d
         CwdJ3bS5x6qSLNspXN5Wd2MbKlwqTaMZXYUDHR7KUbxDNe5455MvClvRYD9ybwqkn9zM
         D+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732111042; x=1732715842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zL8+XLybcTzCuyQblf9r5bfxdc0U6oUEkj48auYI1gQ=;
        b=KnC9FT5pgAadB/3A1gHpAZijWaI90PzpAZde6C1gCbYLeFrdlyveJQDSE7ZRNaHJa4
         ElZ4e6GngQaC7cr3hhyMeamJWJ7FWjULiD6OHZqzMzWmZaz73e0rv3H1SnFcEv3fqPz2
         QOy1nzkqhnpAjgeiwCWlyQvgSgT8sYetnAYszlei7CbpRsoPVtDnrj4CMlXp/aCyCGOM
         +Ci6y5Kgx02/VvGcmVWzI4wkfz/+hE4hFMvhBWu33sI6YHCw/l859iVaXlWwlNptwBbF
         M7mm1X04Y2c4q2yuwEjirf4JN05Y/nS5NNauPCyF8ISOwmpTSjy4cEw0lPmAhUHiGOKz
         AJgg==
X-Gm-Message-State: AOJu0YztUJnKZYWY/P0xVmU4HaaFWSIvgR6VzuaTG5wYYVrare3Vripr
	fSOZK3cmZgGTtvRDY/5VOcactY1TV8UFn+KQB/7QqxDBIg7QGkqjM+aU4DQJXZq/L3N0jkCU7vz
	W
X-Google-Smtp-Source: AGHT+IGaZElU8pucn6XaQm4RpFwVaiiiZnpkoP+VefDy1lJjwuLe0QnfMmbkd15pn+X5IJqkB3CBaQ==
X-Received: by 2002:a17:90b:5281:b0:2ea:9f38:9934 with SMTP id 98e67ed59e1d1-2eaca732f8emr2992263a91.21.1732111042533;
        Wed, 20 Nov 2024 05:57:22 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2127a4db5b3sm4658175ad.233.2024.11.20.05.57.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 05:57:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 07/31] go: upgrade 1.22.7 -> 1.22.8
Date: Wed, 20 Nov 2024 05:56:39 -0800
Message-Id: <5e33e88bfa2a30b1c661ce9a3ebf6a68140a5768.1732110892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732110892.git.steve@sakoman.com>
References: <cover.1732110892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 13:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207431

From: Peter Marko <peter.marko@siemens.com>

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.7..go1.22.8
aeccd613c8 (tag: go1.22.8) [release-branch.go1.22] go1.22.8
b4086b7c16 [release-branch.go1.22] syscall: skip TestAmbientCapsUserns when restricted, document
6fab4b9a9e [release-branch.go1.22] runtime: size maps.Clone destination bucket array safely
71655f14ce [release-branch.go1.22] cmd/cgo: correct padding required by alignment

[1] https://github.com/golang/go/compare/go1.22.7...go1.22.8

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 552b9913b25107d7a34611b499b7811896b5f098)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc}   | 2 +-
 ...o-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} | 6 +++---
 ...cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} | 0
 .../go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb}           | 0
 .../go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb}     | 0
 .../go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.7.inc => go-1.22.8.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.7.bb => go-binary-native_1.22.8.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.7.bb => go-cross-canadian_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.7.bb => go-cross_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.7.bb => go-crosssdk_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.7.bb => go-runtime_1.22.8.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.7.bb => go_1.22.8.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.7.inc b/meta/recipes-devtools/go/go-1.22.8.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.7.inc
rename to meta/recipes-devtools/go/go-1.22.8.inc
index e54a902741..542519b930 100644
--- a/meta/recipes-devtools/go/go-1.22.7.inc
+++ b/meta/recipes-devtools/go/go-1.22.8.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f"
+SRC_URI[main.sha256sum] = "df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.7.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.8.bb
index aba317fd38..98799eb503 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.7.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.8.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb"
-SRC_URI[go_linux_arm64.sha256sum] = "ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a"
+SRC_URI[go_linux_amd64.sha256sum] = "5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f"
+SRC_URI[go_linux_arm64.sha256sum] = "5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a"
+SRC_URI[go_linux_ppc64le.sha256sum] = "c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.7.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.7.bb b/meta/recipes-devtools/go/go-cross_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.7.bb
rename to meta/recipes-devtools/go/go-cross_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.7.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.7.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.7.bb b/meta/recipes-devtools/go/go-runtime_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.7.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.8.bb
diff --git a/meta/recipes-devtools/go/go_1.22.7.bb b/meta/recipes-devtools/go/go_1.22.8.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.7.bb
rename to meta/recipes-devtools/go/go_1.22.8.bb
-- 
2.34.1


