Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01E5C0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:05:17 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.19358.1738173913978823132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BEvhdm5o;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21680814d42so119908515ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 10:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738173913; x=1738778713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xy8mtGeejVADMOrxbcig/qW7Uzokw47RXb7URxtK2lA=;
        b=BEvhdm5oWglSkAOao40Onm6ukesz6N0hODAYQ4gu2L+0/2r8wqgiBnBOIbw9moUvPu
         dlZurFgQ+GU7uGv1p/I19fMvINfveAsLFjRnJnNlTN/EHlN6RMLvHgkJ9GVRmJ0WAi/e
         UoI7FGdXr7HN+CjREDg5tf+5XzofVfx4HhS4WSn7bvmnnFEfdvBcxA0JIWbvNmeI9b1H
         bd4LKKMwxvbW+yNRke4L4+jmht3mPiAKp2wItK3pFyAKDqhjgUX6SMu0frhaKf3/qZeM
         aObLWvIrpwyzfRA5AIaWC/kW0OcgeSDIr7afKh6//1EeJWavjZJbPjpRc0xv7zPBMdr2
         uZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738173913; x=1738778713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xy8mtGeejVADMOrxbcig/qW7Uzokw47RXb7URxtK2lA=;
        b=f+88ttaLdzrkxqsbhvmj29UW+tlqa4SoXwivWnBdGotZCE57NSSQTmjfkN2YWgRrnw
         0CsE91AB3OrC2goVnKFKFzUI7ndEDpH3Ulitr84dC3l8zz82/wSt6+Ca1qZRUbj0jkqi
         GZV93wH7T7hPICXoFn7O3EhizVqYUqgiB7VMuPbzorJotH28yORs2sJh8clhPlQ6PvDD
         H+LDk4lCU55+ompln0/ocCuVxiKYz5Ac6VgbjfVoVe5echCB/yyJ+R6E390Ja/MhVFxx
         YKATthCC4chxPDlmeENijVHD4lkKBWPt+7ojptUXFyEfGL2w6X8fRAShHqH+dnrJx/QB
         l0mg==
X-Gm-Message-State: AOJu0YwKA9lfws/vB37lJurtSu4peHQGinZpICkWHanrCqnbYAONvuF/
	2M3Gf8OyO3JTT8Q9EqOYfH5X05+4Mcow8Ob9P0h2DGy13UjsDk54D+8JrnVyp6uYg/F+oiKo83E
	tmNw=
X-Gm-Gg: ASbGncuVb5vBGQimUIKSOVOX/5APKdADznhNp9sFplpFTlDHDqXD/2ERJudZDq1Ec1I
	eAgMYWu3TsZmygCESrTmTeMxCp2FpF5e5HrdIobnhjthU4bnSoj3yA+8R/dNliU5bPZIdMm1D+q
	XwgJCzbP1PdZpxEDNyReqpsQLHGVV0Ds53YBj00NbrxarJgEhY0rCclV7pcQUWxDBq+moyCAsgf
	eIb+bbyfwPhGD9Cw4P4SVlfbp0Tfzy+4oXb9rh8gurbZ6f6uYYKeuglRmBjnMW4d0r9RtGj2nyT
	BMRh
X-Google-Smtp-Source: AGHT+IFdFV41KbqZVT58nODh38zQpVHXw0ppTyXOVMAj/FzR8FRs+6Kec0lA07eZpDRbG70+jb74IA==
X-Received: by 2002:a05:6a21:3388:b0:1e1:6ec8:fc63 with SMTP id adf61e73a8af0-1ed7a5f4207mr5492749637.11.1738173913186;
        Wed, 29 Jan 2025 10:05:13 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69fb24sm11496435b3a.8.2025.01.29.10.05.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:05:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 2/8] go: upgrade 1.22.9 -> 1.22.10
Date: Wed, 29 Jan 2025 10:04:51 -0800
Message-ID: <d723fa3573d02cc815ad9706aafd7510eb54eac6.1738173760.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738173760.git.steve@sakoman.com>
References: <cover.1738173760.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210396

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


