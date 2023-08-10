Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9A0C04A6A
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:04:57 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.21264.1691683489770227091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=e5tONajO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-686f8614ce5so933874b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683489; x=1692288289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjMZM0ZexH4jWUvPIXSci2iH0MW87YRA4bGUMcPOfSQ=;
        b=e5tONajONuss3CMZ4hIYV1IJBRkH6tJTHe2bxI/jXHKJSwmTbywFkcrweFVZWaYrbT
         Pb25hLZG7iFHa/kptbCIDZYq7jpO5Vdue23/YX1H+1lFyVB2NPIPABTZN4y5fZPSmvk4
         Uxg39nfQjOZjYimiK8DqCyaLvAnYxWpBvuHDlP/3xulZ1C0QT3R6wE9ADZzAsSKvD7KR
         VaJPs97yZrJ26B8EspMEcHYHcA9poxfEnZO2ABI4uGvAGeWkkUuzm9JoaZ4IhfFa0sh1
         vKz7/EVjv86gxiN5u+BbrvbVp60nRnUjAEmVmp6waigSyFRVjyA7O6oqtjWd1IztuHo9
         RiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683489; x=1692288289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjMZM0ZexH4jWUvPIXSci2iH0MW87YRA4bGUMcPOfSQ=;
        b=E9pxNPidMg+qJ9p2wPtlCuY+sPK5tYuNHVSA3M5uUaDU6Qhpm/m2GqNpw3Ek0pTvzh
         GbJhqS1BdjiioZXmwg3YFt3Sj2e4B1vsHyHMgs5Dr+55f8tGLyipBQJKDzHQqQJTqEOc
         66QiXh25qEB2hSliXNL0eLJyqBr3GFvsVdC9TpSUGEarbC11M1K9YQxvUGsJYzTQAfvu
         +pLCBXkG4rNLV/kf/rYHT/RSidUzp+PI2eHeQZgteA9+Y6LqMFbhWog2OcMjau4kFHr9
         iWJUwTMJ/OnEbUE6qqXTnvi7i8tiE8SMA42aCjohsoA4JIBeof1QadtndnRNcMtZk4Gt
         X87g==
X-Gm-Message-State: AOJu0YxVCwA9/ztyAnEtTeQliqDQOQ44Y9/FHcHw8IyXoG7eplumVBbY
	82sDtLoq+QVzkWC6n6F6NNevXCs8u8dxO8uke10=
X-Google-Smtp-Source: AGHT+IFV5XgzsiiuLOQqqWgamUwdlp8WuRNUutpKWbzvTO7PBuYyYn8LvAW6qy3I1HCecYtBOJje5g==
X-Received: by 2002:a05:6a20:96c2:b0:141:d640:794a with SMTP id hq2-20020a056a2096c200b00141d640794amr2769264pzc.39.1691683488750;
        Thu, 10 Aug 2023 09:04:48 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.04.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:04:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/37] go: update 1.20.5 -> 1.20.6
Date: Thu, 10 Aug 2023 06:04:02 -1000
Message-Id: <944b186eeb6821654ce6ef56df7ac0f2829696f5.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185765

From: Jose Quaresma <quaresma.jose@gmail.com>

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.5..go1.20.6 origin/release-branch.go1.20
2c358ffe97 (tag: go1.20.6, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.6
312920c00a [release-branch.go1.20] net/http: validate Host header before sending
4db13d762b [release-branch.go1.20] runtime: set raceignore to zero when starting a new goroutine
08a58dd8b6 [release-branch.go1.20] runtime: allow for 5 more threads in TestWindowsStackMemory*
65092835c5 [release-branch.go1.20] cmd/go: skip TestScript/gccgo_link_ldflags on aix/ppc64
bca817594c [release-branch.go1.20] crypto/x509: tolerate multiple matching chains in testVerify
b8e67d1ddd [release-branch.go1.20] cmd/go/internal/test: don't wait for previous test actions when interrupted
3db4f8146c [release-branch.go1.20] runtime: resolve checkdead panic by refining `startm` lock handling in caller context
6b45fb7b73 [release-branch.go1.20] runtime: fallback to TEB arbitrary pointer when TLS slots are full
be30960e58 [release-branch.go1.20] runtime: use 1-byte load for address checking in racecallatomic
b59efe6c34 [release-branch.go1.20] net/mail: permit more characters in mail headers
c32f1afb41 [release-branch.go1.20] all: make safe for new vet analyzer
c7b145655b [release-branch.go1.20] cmd/go: fix tests for new builder environment
03063101a2 [release-branch.go1.20] text/template: set variables correctly in range assignment
d51e322a3f [release-branch.go1.20] go/printer: error out of Fprint when it would write a '//line' directive with a multiline file path
49594244d3 [release-branch.go1.20] cmd/cover: error out if a requested source file contains a newline
4719048211 [release-branch.go1.20] cmd/cgo: error out if the source path used in line directives would contain a newline
6c606fc191 [release-branch.go1.20] cmd/go: fix TestScript/build_cwd_newline with CGO_ENABLED=0
63ad2b5811 [release-branch.go1.20] cmd/compile: do not report division by error during typecheck
95f377daad [release-branch.go1.20] cmd/go: retain extra roots to disambiguate imports in 'go mod tidy'
a7a48fad7e [release-branch.go1.20] crypto/ecdsa: properly truncate P-521 hashes
f5172dcd38 [release-branch.go1.20] go/build: check for invalid import paths again
8b3acefcbe [release-branch.go1.20] cmd/go: omit checksums for go.mod files needed for go version lines more often in pre-1.21 modules
1008486a9f [release-branch.go1.20] cmd/cgo: correct _cgo_flags output

[1] https://github.com/golang/go/compare/go1.20.5...go1.20.6

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d8216d8c4d37cc0d9508eb644653f94fff8989c)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc}   | 2 +-
 ...o-binary-native_1.20.5.bb => go-binary-native_1.20.6.bb} | 6 +++---
 ...cross-canadian_1.20.5.bb => go-cross-canadian_1.20.6.bb} | 0
 .../go/{go-cross_1.20.5.bb => go-cross_1.20.6.bb}           | 0
 .../go/{go-crosssdk_1.20.5.bb => go-crosssdk_1.20.6.bb}     | 0
 .../go/{go-native_1.20.5.bb => go-native_1.20.6.bb}         | 0
 .../go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.5.inc => go-1.20.6.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.5.bb => go-binary-native_1.20.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.5.bb => go-cross-canadian_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.5.bb => go-cross_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.5.bb => go-crosssdk_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.5.bb => go-native_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.5.bb => go-runtime_1.20.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.5.bb => go_1.20.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.5.inc b/meta/recipes-devtools/go/go-1.20.6.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.20.5.inc
rename to meta/recipes-devtools/go/go-1.20.6.inc
index 9cc79a8073..6277020fec 100644
--- a/meta/recipes-devtools/go/go-1.20.5.inc
+++ b/meta/recipes-devtools/go/go-1.20.6.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
 "
-SRC_URI[main.sha256sum] = "9a15c133ba2cfafe79652f4815b62e7cfc267f68df1b9454c6ab2a3ca8b96a88"
+SRC_URI[main.sha256sum] = "62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.5.bb b/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.6.bb
index a98be4af1b..5b2f8f4352 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "d7ec48cde0d3d2be2c69203bc3e0a44de8660b9c09a6e85c4732a3f7dc442612"
-SRC_URI[go_linux_arm64.sha256sum] = "aa2fab0a7da20213ff975fa7876a66d47b48351558d98851b87d1cfef4360d09"
-SRC_URI[go_linux_ppc64le.sha256sum] = "049b8ab07d34077b90c0642138e10207f6db14bdd1743ea994a21e228f8ca53d"
+SRC_URI[go_linux_amd64.sha256sum] = "b945ae2bb5db01a0fb4786afde64e6fbab50b67f6fa0eb6cfa4924f16a7ff1eb"
+SRC_URI[go_linux_arm64.sha256sum] = "4e15ab37556e979181a1a1cc60f6d796932223a0f5351d7c83768b356f84429b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "a1b91a42a40bba54bfd5c96c23d72250e0c424038d0d2b5c7950b828b4905822"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.5.bb b/meta/recipes-devtools/go/go-cross_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.5.bb
rename to meta/recipes-devtools/go/go-cross_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.5.bb b/meta/recipes-devtools/go/go-native_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.5.bb
rename to meta/recipes-devtools/go/go-native_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.5.bb b/meta/recipes-devtools/go/go-runtime_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.6.bb
diff --git a/meta/recipes-devtools/go/go_1.20.5.bb b/meta/recipes-devtools/go/go_1.20.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.5.bb
rename to meta/recipes-devtools/go/go_1.20.6.bb
-- 
2.34.1


