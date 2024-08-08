Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BEEC52D71
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:55:27 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.57237.1723114522844053053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iPxa53F0;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f0271b0ae9so7573281fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723114521; x=1723719321; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8Oh6n9sHBvDb5JtIPc4DCSmq0nHc9HdIy8Hz8FPdbs=;
        b=iPxa53F0UNkJH2p1ugAMKPUPL6yAMovrC/896DFOGA/Akz+rzL6ZU9SNoUJ4MJ6OEz
         PBnVHkmyonWHCTDy1Xowzi9EQFOtoxrIBpxrR8kyxgj7SJEBVU8+ljNjFr9p/36dRtSU
         TtWS5PDdvKUV8T11AQNyn/L6aA5j4MbLSnLQzFDWqEVMbzESrRMPOPbYnOlkzMXtS4+F
         4DIq8PB+XIF5iRhPNHLDNDycWPcV4++NpM9xVdonctIedljoAQHUkKxUt3+dbF8nkkQ8
         xoc/JaDj2ruh2R2FQiwwFFb95dYFleS1DYyfzZ7E+VfCbGOIx1FaV8GC5UB3n9yMNyjO
         j2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723114521; x=1723719321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Oh6n9sHBvDb5JtIPc4DCSmq0nHc9HdIy8Hz8FPdbs=;
        b=OPqdt17CVWtmzwNJxHbImADd08DGe88ljU/JShDO9YvMdjtizieEXtJ3VnaU0wsGwk
         gYjia949MAKxSp8q2+kSZtIiPqPLf3Er+BqkOHvuJ7qLfQz9Qk1svZiUMJjgOD3rlprR
         Zcs0f7yuuIruH+WPz13d9NkQrlZn4tJWngL8Pxhno1WCOjCJGqeCNEbxhry6RT4hI1MH
         Rt7UesPyfQ9JCUNXsTlV2oOaP5vVhkAHPgvwkGsymfv+pe4Dobc+3+Frn+rcpY2t5XMi
         mS7Zo2ZgqCOwksMEeyy1OoWUFeDnQqU5xfmnkvk5zdTM1b9IvYPWnid/Sw8zIVZXBcm3
         qkhw==
X-Gm-Message-State: AOJu0YwIfMe74DeOEuQC7jT8dVE9wLwLNOVEGwzLg2TA30QR4lIqJPEp
	MAmQKiksLqWZDo3k9Z3/QsdQT7eH0QjSSg5h/iRssDtS3/THA/YPcYNqQw==
X-Google-Smtp-Source: AGHT+IFNZQ8vOY47CljDFKKSjyt55BdsK9jaNICZnlggyhAiMmC7XOwioJLqo5F4NJDM15OOaMwPTg==
X-Received: by 2002:a2e:4c11:0:b0:2ef:2b06:e554 with SMTP id 38308e7fff4ca-2f19de283e5mr10068141fa.15.1723114520160;
        Thu, 08 Aug 2024 03:55:20 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738e0csm17600815e9.16.2024.08.08.03.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:55:19 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go: upgrade 1.22.5 -> 1.22.6
Date: Thu,  8 Aug 2024 11:55:15 +0100
Message-ID: <20240808105515.850524-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 10:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203129

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.5..go1.22.6
cb4eee693c (tag: go1.22.6, origin/release-branch.go1.22) [release-branch.go1.22] go1.22.6
8c8adffd53 [release-branch.go1.22] cmd/compile: add 0-sized-value simplification to copyelim
70a1aae67f [release-branch.go1.22] cmd/trace/v2: make the -pprof actually useful
2c88c1d599 [release-branch.go1.22] cmd/trace/v2: handle the -pprof flag
4c50f9162c [release-branch.go1.22] cmd/internal/cov: close counter data files eagerly
9e148a4150 [release-branch.go1.22] internal/bytealg: extend memchr result correctly on wasm
4b27560db9 [release-branch.go1.22] go/types: fix assertion failure when range over int is not permitted
4e548f2c8e [release-branch.go1.22] cmd/link: don't let dsymutil delete our temp directory
45f9ded1df [release-branch.go1.22] cmd/compile: don't elide zero extension on top of signed values
49906f9575 [release-branch.go1.22] cmd/go: fix build config before creating actions for 'go list -cover'
ea96074191 [release-branch.go1.22] os/exec: only use cachedLookExtensions if Cmd.Path is unmodified

[1] https://github.com/golang/go/compare/go1.22.5...go1.22.6

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.22.5.inc => go-1.22.6.inc}   | 2 +-
 ...o-binary-native_1.22.5.bb => go-binary-native_1.22.6.bb} | 6 +++---
 ...cross-canadian_1.22.5.bb => go-cross-canadian_1.22.6.bb} | 0
 .../go/{go-cross_1.22.5.bb => go-cross_1.22.6.bb}           | 0
 .../go/{go-crosssdk_1.22.5.bb => go-crosssdk_1.22.6.bb}     | 0
 .../go/{go-runtime_1.22.5.bb => go-runtime_1.22.6.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.5.bb => go_1.22.6.bb}     | 0
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.5.inc => go-1.22.6.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.5.bb => go-binary-native_1.22.6.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.5.bb => go-cross-canadian_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.5.bb => go-cross_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.5.bb => go-crosssdk_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.5.bb => go-runtime_1.22.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.5.bb => go_1.22.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.5.inc b/meta/recipes-devtools/go/go-1.22.6.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.5.inc
rename to meta/recipes-devtools/go/go-1.22.6.inc
index 7f7d8377ca..834debaf9b 100644
--- a/meta/recipes-devtools/go/go-1.22.5.inc
+++ b/meta/recipes-devtools/go/go-1.22.6.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "ac9c723f224969aee624bc34fd34c9e13f2a212d75c71c807de644bb46e112f6"
+SRC_URI[main.sha256sum] = "9e48d99d519882579917d8189c17e98c373ce25abaebb98772e2927088992a51"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.5.bb b/meta/recipes-devtools/go/go-binary-native_1.22.6.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.6.bb
index b00857f001..ea4577f20a 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.6.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "904b924d435eaea086515bc63235b192ea441bd8c9b198c507e85009e6e4c7f0"
-SRC_URI[go_linux_arm64.sha256sum] = "8d21325bfcf431be3660527c1a39d3d9ad71535fabdf5041c826e44e31642b5a"
-SRC_URI[go_linux_ppc64le.sha256sum] = "5312bb420ac0b59175a58927e70b4660b14ab7319aab54398b6071fabcbfbb09"
+SRC_URI[go_linux_amd64.sha256sum] = "999805bed7d9039ec3da1a53bfbcafc13e367da52aa823cb60b68ba22d44c616"
+SRC_URI[go_linux_arm64.sha256sum] = "c15fa895341b8eaf7f219fada25c36a610eb042985dc1a912410c1c90098eaf2"
+SRC_URI[go_linux_ppc64le.sha256sum] = "9d99fce3f6f72a76630fe91ec0884dfe3db828def4713368424900fa98bb2bd6"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.5.bb b/meta/recipes-devtools/go/go-cross_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.5.bb
rename to meta/recipes-devtools/go/go-cross_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.5.bb b/meta/recipes-devtools/go/go-runtime_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.6.bb
diff --git a/meta/recipes-devtools/go/go_1.22.5.bb b/meta/recipes-devtools/go/go_1.22.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.5.bb
rename to meta/recipes-devtools/go/go_1.22.6.bb
-- 
2.46.0


