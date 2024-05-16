Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F045CC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 10:23:36 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10162.1715855010534676667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 03:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TNdOgNgD;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34dc8d3fbf1so6456582f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715855008; x=1716459808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifXTgUu2pfHf/LLRFGynJOu7EVSK0SvCl0/HUPBBX8Y=;
        b=TNdOgNgDiGw7cuKNSJvLU6PEgIx5D0Se7nhMp11Aq/p4cuBVDi7SQK6A4sV83KD4IY
         /8J54XamCRpzWmr04eC5fGuF+PPxGoWTk1NY9X7Ga2bwQznI1yfpvj30cSYdJfjc0eUE
         00UfgJ8uOCaOJyKAztQ++6nLvA6rKci70EDBgXQpOaGVTJwOtZRbqYjwuPEgK5bWstMy
         XA96+gQy3JJtsVCNUzzHvD+hrlKXZ4NuzknSohJ/Tp/SXjmtRaj4fY1Y+7CrR9N9auVk
         O2LYWC53EelZDaujaycfLUGPYpR4qBVM6EE3CMyrGn0mw4hzZpb2OTnLih9Bgbbqbn4C
         +NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715855008; x=1716459808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifXTgUu2pfHf/LLRFGynJOu7EVSK0SvCl0/HUPBBX8Y=;
        b=d+jUoWdnNUDOPKxJKu5aM8/mZ8uIwM54tgFJg6pyG0VgFxya3zBwU9R6yxKtXVzuk9
         AnT3jfldxkoU9Y7B/jf8s6AOwwGbFioh1rew3nO3RY1S9vySXWOcSsoucjzu04C282WM
         UH206Yvb2u5PhLJ7tTI9IkGtysDjB3G0yqGb6qdjMXZE+EgXEI+c3qtorznNsauk6fJW
         As6pWDCjl+qq4IQLpSTbhUwv01GBTi6W0Rl2jO7BU5JSP5DzOfgt3x4/+Be6wLNsabfu
         bOlkl04xThYMX/hvlXp7icu3NKsDQcAAVsApPCPmzcuuMCkR97emTGAP9r8nYch4vx73
         3hRA==
X-Gm-Message-State: AOJu0YxwAD5TTKBKOygvBTNEU6uec2jhJLCICIv1FXiuEXZvnBm5CrOu
	1BS1H26mSRJtodvUoDLXlFjSXaoYYnO9ry2YEwvR5hhIagezA2shw/aCbRPp
X-Google-Smtp-Source: AGHT+IFa0nOapg+0lZKZG9AoVcbY2DW1VPGNzqTzMfl99hMzBnOZnjDDzkrjAOfBWivP8DkC413BJw==
X-Received: by 2002:adf:e586:0:b0:34f:7b5a:4289 with SMTP id ffacd0b85a97d-3504a96a387mr11572576f8f.68.1715855008367;
        Thu, 16 May 2024 03:23:28 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b8a78e8sm18817272f8f.61.2024.05.16.03.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 03:23:27 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH] go: upgrade 1.22.2 -> 1.22.3
Date: Thu, 16 May 2024 11:23:22 +0100
Message-ID: <20240516102322.301064-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 10:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199450

Upgrade to latest 1.22.x release [1]:

$ git --no-pager log --oneline go1.22.2..go1.22.3
adbfb672ba (tag: go1.22.3) [release-branch.go1.22] go1.22.3
fa0292d252 [release-branch.go1.22] cmd/go: disallow -lto_library in LDFLAGS
947e43e371 [release-branch.go1.22] Revert "cmd/compile: don't combine loads in generated equality functions"
9d2e28501c [release-branch.go1.22] cmd/compile: don't combine loads in generated equality functions
93d8777d24 [release-branch.go1.22] net: check SkipAdditional error result
3f4af1ff0e [release-branch.go1.22] runtime: use bootstrapRand to initialize hashkey
a7ff78d585 [release-branch.go1.22] cmd/compile: bail PGO method lookup on interface types
12c1177045 [release-branch.go1.22] cmd/internal/obj/ppc64: fix incorrect int to int64 conversion when checking MOVD opcodes
d6c972ad41 [release-branch.go1.22] net/http: update bundled golang.org/x/net/http2
a65a2bbd8e [release-branch.go1.22] all: tidy dependency versioning after release

[1] https://github.com/golang/go/compare/go1.22.2...go1.22.3

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta/recipes-devtools/go/{go-1.22.2.inc => go-1.22.3.inc}   | 2 +-
 ...o-binary-native_1.22.2.bb => go-binary-native_1.22.3.bb} | 6 +++---
 ...cross-canadian_1.22.2.bb => go-cross-canadian_1.22.3.bb} | 0
 .../go/{go-cross_1.22.2.bb => go-cross_1.22.3.bb}           | 0
 .../go/{go-crosssdk_1.22.2.bb => go-crosssdk_1.22.3.bb}     | 0
 .../go/{go-native_1.22.2.bb => go-native_1.22.3.bb}         | 0
 .../go/{go-runtime_1.22.2.bb => go-runtime_1.22.3.bb}       | 0
 meta/recipes-devtools/go/{go_1.22.2.bb => go_1.22.3.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.2.inc => go-1.22.3.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.2.bb => go-binary-native_1.22.3.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.2.bb => go-cross-canadian_1.22.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.2.bb => go-cross_1.22.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.2.bb => go-crosssdk_1.22.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.22.2.bb => go-native_1.22.3.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.2.bb => go-runtime_1.22.3.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.2.bb => go_1.22.3.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.22.2.inc b/meta/recipes-devtools/go/go-1.22.3.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.22.2.inc
rename to meta/recipes-devtools/go/go-1.22.3.inc
index b399207311..34703bc1fa 100644
--- a/meta/recipes-devtools/go/go-1.22.2.inc
+++ b/meta/recipes-devtools/go/go-1.22.3.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9"
+SRC_URI[main.sha256sum] = "80648ef34f903193d72a59c0dff019f5f98ae0c9aa13ade0b0ecbff991a76f68"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.2.bb b/meta/recipes-devtools/go/go-binary-native_1.22.3.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.22.2.bb
rename to meta/recipes-devtools/go/go-binary-native_1.22.3.bb
index 0f00509f03..b67d97608d 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.2.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.3.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5901c52b7a78002aeff14a21f93e0f064f74ce1360fce51c6ee68cd471216a17"
-SRC_URI[go_linux_arm64.sha256sum] = "36e720b2d564980c162a48c7e97da2e407dfcc4239e1e58d98082dfa2486a0c1"
-SRC_URI[go_linux_ppc64le.sha256sum] = "251a8886c5113be6490bdbb955ddee98763b49c9b1bf4c8364c02d3b482dab00"
+SRC_URI[go_linux_amd64.sha256sum] = "8920ea521bad8f6b7bc377b4824982e011c19af27df88a815e3586ea895f1b36"
+SRC_URI[go_linux_arm64.sha256sum] = "6c33e52a5b26e7aa021b94475587fce80043a727a54ceb0eee2f9fc160646434"
+SRC_URI[go_linux_ppc64le.sha256sum] = "04b7b05283de30dd2da20bf3114b2e22cc727938aed3148babaf35cc951051ac"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.22.2.bb b/meta/recipes-devtools/go/go-cross-canadian_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.22.2.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.22.3.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.22.2.bb b/meta/recipes-devtools/go/go-cross_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.22.2.bb
rename to meta/recipes-devtools/go/go-cross_1.22.3.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.22.2.bb b/meta/recipes-devtools/go/go-crosssdk_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.22.2.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.22.3.bb
diff --git a/meta/recipes-devtools/go/go-native_1.22.2.bb b/meta/recipes-devtools/go/go-native_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.22.2.bb
rename to meta/recipes-devtools/go/go-native_1.22.3.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.22.2.bb b/meta/recipes-devtools/go/go-runtime_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.22.2.bb
rename to meta/recipes-devtools/go/go-runtime_1.22.3.bb
diff --git a/meta/recipes-devtools/go/go_1.22.2.bb b/meta/recipes-devtools/go/go_1.22.3.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.22.2.bb
rename to meta/recipes-devtools/go/go_1.22.3.bb
-- 
2.45.1


