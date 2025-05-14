Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B18CC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:31 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.106296.1747238301568760253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XEHO5Gmc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-af6a315b491so6124117a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238301; x=1747843101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Es/e7GDEu5OW49ARjDrNVt8p0YTeTR/WPliFT432p0=;
        b=XEHO5GmcNmDKbJgi12JbKgUOM5qRboP1EWnl1L43+NTyS6vPeyMqTKgODFZLBchwWe
         08pazCs5oZESqXjoNUQjB1sa2eYz3PeSJQqQQZzA+V1qn9AtE/6FIB/WZYyOi3lak1hJ
         Oda8Ky1k/ZZ0fmkR5usB7//5oERCEq7dSyv/xXvO/uryO0Az8i2MHQX+l4yZRhLVNWoZ
         rAbhf5kly3Fn4Jq3/a7yVSoQJ10832sFzU8dE8bS5q9VMU/VKQ4FlyyKuHp10WtAN7e9
         XL4iUdK+dmLnDavbUU087DEFnIK24SYbZiJcu+XD7uFCsp+RlNEcf6sU7/GhXgYYcNwJ
         l+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238301; x=1747843101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Es/e7GDEu5OW49ARjDrNVt8p0YTeTR/WPliFT432p0=;
        b=d5fneCIo2/oaBlRZSHPjUJU7G2U7rrHqTWdOoROcMYkSe08jY5aCq4kMqaEOk2HSS9
         nQRHGID0/7NCA5Q2BUVUaHuxnmvCHj22qDBEebkWIm5YrtgVKd7Z47bxxyAEOWHaV/dD
         8BaRBpy4f5TZrUUvhMCp0xA/0v4FsHYz8Ry3mCeLdrMBlBgqjOo4Mk+KTT7rJ1+8WIaM
         +zVSBMt7kZeRun4qzdoslXpVceESQwRyp9CxMl0hD6O/twGr26ys8INrYCkegIbfjPoH
         kGEkuE0JOCVMGHHqcFrmj4DHWIA3j/489ITa9GKDtk22zlM3w/2cMxDkfwIt+mAqL17r
         AUAA==
X-Gm-Message-State: AOJu0YxBJOJW3WSjiQif/mw/BR1/ArrKOIYwqbYGzqXK1kU3I9RziJGK
	WK52Kyf5EB4HnAl3fOOQuWg6+/hDR8WVuER09v27h2gVKYDDCHME0e0rCYRBSp+5EHjx42wyxIG
	O
X-Gm-Gg: ASbGncuzU/UPoItAxzWwYasb6cxLIlC9QjN/24UpMN/bgCWb3AC/JwPuiFTxZRc0GUt
	9Ztdj/3Gs+d4vzNuVMiOwBSilFyF6kVfDIaubWh1BMS8VidcRiePa9fplWkW4l1XdqLBPCZa5RL
	wYrjMCM223cNX1RRE3W6JHS03+pN+3EFbol8szin6G+WmUn1tKa+hF4YeZNFb6fh6Si7+3X7cJL
	LvTh8nZcBApUeyv2Zzd+mCRUs9KTXL00Bj+HV0WXJDJiFhSZzSMDQEul1lUL/mzk+4Sqmv7Lt+F
	nv9x3SiyymQU1VILf9f1rsfCPvPfXWOhWWi7C8xn
X-Google-Smtp-Source: AGHT+IF64yCpxWNWR8ASE0mtpPoe3sT6ZCdENcJq99kueNk+gj9zQR4xCwornfBcLZyHXokdFrUbUA==
X-Received: by 2002:a17:903:944:b0:22e:4b74:5f67 with SMTP id d9443c01a7336-2319815e33dmr57937485ad.31.1747238300681;
        Wed, 14 May 2025 08:58:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 08/12] go: upgrade 1.24.2 -> 1.24.3
Date: Wed, 14 May 2025 08:57:56 -0700
Message-ID: <f53e4b16d1b4e4a25f9cd9118d17c52f096fbae2.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216512

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 65ef93e2e0..af56dc9111 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.24.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.24.3.bb
@@ -9,10 +9,10 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
+SRC_URI[go_linux_amd64.sha256sum] = "3333f6ea53afa971e9078895eaa4ac7204a8c6b5c68c10e6bc9a33e8e391bdd8"
+SRC_URI[go_linux_arm64.sha256sum] = "a463cb59382bd7ae7d8f4c68846e73c4d589f223c589ac76871b66811ded7836"
+SRC_URI[go_linux_ppc64le.sha256sum] = "341a749d168f47b1d4dad25e32cae70849b7ceed7c290823b853c9e6b0df0856"
 
-SRC_URI[go_linux_amd64.sha256sum] = "68097bd680839cbc9d464a0edce4f7c333975e27a90246890e9f1078c7e702ad"
-SRC_URI[go_linux_arm64.sha256sum] = "756274ea4b68fa5535eb9fe2559889287d725a8da63c6aae4d5f23778c229f4b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "5fff857791d541c71d8ea0171c73f6f99770d15ff7e2ad979104856d01f36563"
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
-- 
2.43.0


