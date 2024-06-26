Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DEBAC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 10:08:09 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.22458.1719396484679723513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 03:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YsQbPFpl;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so3931709e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 03:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719396482; x=1720001282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FaZn5FO9C09h4NsAV4L181UTiPSQY+10soA3Vadtvd0=;
        b=YsQbPFpl76crNI/6HEqC9wZDQznmVeOjAHBHI88L+EmvWliYfBgSW8VORiEcRB4LDe
         Sa/8JFiRyXgL1O/elGkwzsr9gIXVPwUh/iPMQ0mdo234C3pHeHufJSib7xlojbQGfZqg
         P9Rt6x1hsBPw3eE78PiyWBgeVzRGLpd4ltrjXDmJeWIpzWQH+8rZ/LeEgr7Al3tzsqMB
         Zy3iZ9gnxHGJMeKXCxmUUnO5NjpgHkVbM4mhKNfPXcEww5wIwRfIkji0rmZFF+llFbbe
         v8DIC3nU5a8UfEZb7AH4EEQrefgbH5W1Kf4v9US7igW/M4RwvldoUCnnJf2IE6UG9pGp
         NHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396482; x=1720001282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaZn5FO9C09h4NsAV4L181UTiPSQY+10soA3Vadtvd0=;
        b=rxmdzePk28xxAhv4f7Rw9iex5oOPQJoXD+PPRjTF7jd+0aCqpA/I4x+YjP/o9GRvMg
         M8NULZEBO4TC3XC9vHLlLESFGcU68Ur3OpNaCiNMCvm1OUE5DmAskpGfafQ2nEU8E6Pe
         zDi8N4cNTzTNVCQgUI37QZUoXNpvX/hqTI2iU56zmY5LYUiUBB5JiaD3sX0bU6hVSHjK
         qt0Ec1D8IdDO73UarjSRvaICQN6AJEIm3uwbr3jOf9l5RK4xYO7MXugNcIMB08e4MyhU
         9QBlqWYZVIQQSym0qs7/WwnAPNyF853bf1I9e9jLujcYR5AmWGauljTAdFurpvtgq4/W
         14CA==
X-Gm-Message-State: AOJu0Yw8tc6NahE29QOBN9CDDsFJxoOh2wDgxvdgIrroT3QOG/sVL1ve
	zeYOwOuvxjccesFWUMdGNWfbIHPPGnt/wSRZxjDYt5+QYh7GEBE59dqnFw==
X-Google-Smtp-Source: AGHT+IHWf0cw8QPqprAYioUZ//l5QW3J7wnu5uP2LbXM4W50IYJMfr+f50DUyAAO9BX8+e9tNZceWA==
X-Received: by 2002:ac2:43ab:0:b0:52c:e00c:d3a9 with SMTP id 2adb3069b0e04-52ce063d6a5mr6883262e87.1.1719396482133;
        Wed, 26 Jun 2024 03:08:02 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f6717sm15468969f8f.9.2024.06.26.03.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:08:01 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Jose Quaresma <jose.quaresma@foundries.io>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH 1/3] go: upgrade 1.22.2 -> 1.22.3
Date: Wed, 26 Jun 2024 11:07:50 +0100
Message-ID: <20240626100752.977-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 10:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201156

From: Jose Quaresma <quaresma.jose@gmail.com>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 18062def5b65e02d6dc0570734055c100445b6f2)
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
2.45.2


