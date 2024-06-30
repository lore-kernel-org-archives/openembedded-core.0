Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89790C3065C
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:08 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.4230.1719778082044978230
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gasl7DH0;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.46, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-25c4d8ae511so1184413fac.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778081; x=1720382881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiBFSFbzhEjGXGMF4PVsxMM0EixnMBoaaJw4eOtz/9c=;
        b=gasl7DH09wMHUj+uuJB2Wu4eshy26KzZVn4C9feFwaKW80b+U9XBaqFuW4lrDYNWg5
         x458LjDb/kgWM1zIfHdU2wg6d6Nhnv527q6OZjymX5mTMctYAPObIH6cjfARLYBMXuSa
         G4YnWR/wtzQlNGnac6k/0iiAz4ttxrGnPkKD0AW6F/QDcnuTC+60ldNs/1rB04SECW1c
         bkQNZf1al+UJ+AN5ENyaEyZBJL5Q/OOB2YkG32HYHSBeXOoh18k7tdzR+xJqXxX8hyAR
         ksGSTTAYrYUDR8eaNhFFQABXq9yRjyceu9ZcI72UDK5GvPZi7N2ECL6AbT5d2lfWo/7n
         7Zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778081; x=1720382881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiBFSFbzhEjGXGMF4PVsxMM0EixnMBoaaJw4eOtz/9c=;
        b=EJGrsL+jDLE/n1Ff1c0JgbySENbMW+bPyQoV8JfDJR2sAzy5vq1NDc2j6bCyeRJ5uH
         CKWp8jHyuYPHpnHtpunyYgqw5ngcLWFTXMSbHjmWQ7NX0hXfwKoCJOIwMk05XNJbnJ9k
         EkmPEPvPWMTuH3qKOjt9IPAWQRfPWr2V8MbnuRvY4Gw4U6GdrLs2r27wVDyoerP3gTcf
         Dv59zREEjaNT6B8nPoLTBb19wEizOqptpTVrpfTKeOLFahQiPGsm6l3Fks2eXmOLWSKB
         VUYbl7XL58JxC9Gw8Kd/bNgh0O/kwxIURozorIYiiNAFzEdY5Pu47Pii2ZRYmEZy93ky
         kQAQ==
X-Gm-Message-State: AOJu0YzHf8Hx2TreDQMXLHPpWazvE5wFUxFVR9FgERvAXj03RuEylKHq
	RTbD4FW+iTpT96tlx8Dj2qYYWIhciOSERvle56SsvxagZ/Chtiwxn8sE5W3QDnO3IW/uDL1+7lN
	4stc=
X-Google-Smtp-Source: AGHT+IFyDh/VI04m9CeQh2U0vHq/kmF8t4nw94l4IoV97KLF6zDAQiNxxSvKk6FIfGaR45qPs9hpIw==
X-Received: by 2002:a05:6870:164b:b0:25d:7896:e2a1 with SMTP id 586e51a60fabf-25db361da14mr4086724fac.50.1719778081167;
        Sun, 30 Jun 2024 13:08:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.08.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:08:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/35] go: upgrade 1.22.2 -> 1.22.3
Date: Sun, 30 Jun 2024 13:07:17 -0700
Message-Id: <980e6d082a60d7ffac087b2fac9e7821dddf2933.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201242

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


