Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B709FEE8004
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:47:27 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.39146.1694180844209815704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EXKIm4mz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a41035828so1783662b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694180843; x=1694785643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c50OZQHuzoVEWxigOk8WH5TAmj4ZkSGGATeWlF3nkU0=;
        b=EXKIm4mzN/9dCXaeU/s31/RieWVtgnlWg5fejCe3oqK6w+LU024oV1kVZNnysN52/G
         2Z1ohHBViGUOA+XVbf3IUJuIBbU0N9KkVpzxo06hlYaVTYHurAi0RAjxIvAtJpP0v5G1
         0Cafc0TExFq0b8xKy6Z8NzaMP89IyzJgpPkh2ZTwAeNt0qyet05s9ReRXKJaZWaSEL5Y
         SL5D5viidnDStbMROqyCkYyKpkazHx886E0lomAMaL+SG4hRChYO4D3MmiZ5RBjdNEnu
         ciHbs1X7cyA3KVjjZCtcFiI/XMYjEaSXT7drGsPqAsu25B8yfidiZSGVi54q9Ek1VRsl
         7m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180843; x=1694785643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c50OZQHuzoVEWxigOk8WH5TAmj4ZkSGGATeWlF3nkU0=;
        b=jEU7ns92DBNxevpMIBBnzGeVsY2UJR6T1tay+F8/obL7LyeiDWaAJz/1Bh8ySfqCDe
         Yb0/3QvH6dwgyoBpRen1G3XHiIxcBTsj39jXSaFVlmo07mDAJhhk4tbU55nagE0x5z40
         DxOwE1qDoTw4am51Tg5E/dgthdAUeFl3lZTHICNqFoX0XY2Xw5uXRH6ocNIk1dLVFKD+
         pSG7rSqZXVeOjjIkRKqp+MSZVHw4+BJFIpQPkUsCaXoC0RSOSnvH0nCr5OpORmftqlLk
         7rDrrlpwBpex/SCkuKH4f8EthJdh/rp81mwGByWOQVb7eEzpqMatURQJm8PD6bbuRRMi
         xfxQ==
X-Gm-Message-State: AOJu0YzzyPRj3WhRn9iVwkM4WRzoEtdDgMMgrg4dg4Wxk0tDsOJMErF1
	bj0hxrMovgHj7U+c3NAL476XoEyw+nk3KDHoaA0=
X-Google-Smtp-Source: AGHT+IEdL2QHsD8lemy2ymotFLXOktIvX6RSp3CjaY3pkl68fW28fxbKDM0E6NNO2SXFbrGs8W8xuQ==
X-Received: by 2002:a05:6a20:8e16:b0:14e:429e:b0e3 with SMTP id y22-20020a056a208e1600b0014e429eb0e3mr3078991pzj.52.1694180843191;
        Fri, 08 Sep 2023 06:47:23 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b00653fe2d527esm1344828pfv.32.2023.09.08.06.47.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 06:47:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 8/9] go: upgrade 1.20.6 -> 1.20.7
Date: Fri,  8 Sep 2023 03:46:59 -1000
Message-Id: <8397964d5a8d995a06c5c2a34883047546edc077.1694179812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694179812.git.steve@sakoman.com>
References: <cover.1694179812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:47:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187430

From: Sakib Sajal <sakib.sajal@windriver.com>

Upgrade to latest 1.20.x release [1]:

$ git log --oneline go1.20.6..go1.20.7 origin/release-branch.go1.20
adb775e309 (tag: go1.20.7, origin/release-branch.go1.20) [release-branch.go1.20] go1.20.7
659f2a2207 [release-branch.go1.20] crypto/tls: restrict RSA keys in certificates to <= 8192 bits
10d85fa0f6 [release-branch.go1.20] cmd/asm, cmd/internal/obj: generate proper atomic ops for riscv64
bd3a1f24e7 [release-branch.go1.20] net: tolerate permission errors in interface tests
6211a024b4 [release-branch.go1.20] cmd/compile: on PPC64, fix sign/zero extension when masking

[1] https://github.com/golang/go/compare/go1.20.6...go1.20.7

Upgrade include fix for CVE-2023-29409 CVE-2023-39533

(cherry picked from commit 039324d917ed124228a14ac1effdd66b27d9e82b)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.20.6.inc => go-1.20.7.inc}   | 2 +-
 ...o-binary-native_1.20.6.bb => go-binary-native_1.20.7.bb} | 6 +++---
 ...cross-canadian_1.20.6.bb => go-cross-canadian_1.20.7.bb} | 0
 .../go/{go-cross_1.20.6.bb => go-cross_1.20.7.bb}           | 0
 .../go/{go-crosssdk_1.20.6.bb => go-crosssdk_1.20.7.bb}     | 0
 .../go/{go-native_1.20.6.bb => go-native_1.20.7.bb}         | 0
 .../go/{go-runtime_1.20.6.bb => go-runtime_1.20.7.bb}       | 0
 meta/recipes-devtools/go/{go_1.20.6.bb => go_1.20.7.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.6.inc => go-1.20.7.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.6.bb => go-binary-native_1.20.7.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.6.bb => go-cross-canadian_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.6.bb => go-cross_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.6.bb => go-crosssdk_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.6.bb => go-native_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.6.bb => go-runtime_1.20.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.6.bb => go_1.20.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.6.inc b/meta/recipes-devtools/go/go-1.20.7.inc
similarity index 90%
rename from meta/recipes-devtools/go/go-1.20.6.inc
rename to meta/recipes-devtools/go/go-1.20.7.inc
index 6277020fec..009a67e89e 100644
--- a/meta/recipes-devtools/go/go-1.20.6.inc
+++ b/meta/recipes-devtools/go/go-1.20.7.inc
@@ -17,4 +17,4 @@ SRC_URI += "\
     file://CVE-2023-24531_1.patch \
     file://CVE-2023-24531_2.patch \
 "
-SRC_URI[main.sha256sum] = "62ee5bc6fb55b8bae8f705e0cb8df86d6453626b4ecf93279e2867092e0b7f70"
+SRC_URI[main.sha256sum] = "2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.6.bb b/meta/recipes-devtools/go/go-binary-native_1.20.7.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.6.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.7.bb
index 5b2f8f4352..3decde1954 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.6.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.7.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "b945ae2bb5db01a0fb4786afde64e6fbab50b67f6fa0eb6cfa4924f16a7ff1eb"
-SRC_URI[go_linux_arm64.sha256sum] = "4e15ab37556e979181a1a1cc60f6d796932223a0f5351d7c83768b356f84429b"
-SRC_URI[go_linux_ppc64le.sha256sum] = "a1b91a42a40bba54bfd5c96c23d72250e0c424038d0d2b5c7950b828b4905822"
+SRC_URI[go_linux_amd64.sha256sum] = "f0a87f1bcae91c4b69f8dc2bc6d7e6bfcd7524fceec130af525058c0c17b1b44"
+SRC_URI[go_linux_arm64.sha256sum] = "44781ae3b153c3b07651d93b6bc554e835a36e2d72a696281c1e4dad9efffe43"
+SRC_URI[go_linux_ppc64le.sha256sum] = "6318a1db307c12b8afe68808bd6fae4fba1e558a85b958216096869ed506dcb3"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.6.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.6.bb b/meta/recipes-devtools/go/go-cross_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.6.bb
rename to meta/recipes-devtools/go/go-cross_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.6.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.6.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.6.bb b/meta/recipes-devtools/go/go-native_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.6.bb
rename to meta/recipes-devtools/go/go-native_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.6.bb b/meta/recipes-devtools/go/go-runtime_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.6.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.7.bb
diff --git a/meta/recipes-devtools/go/go_1.20.6.bb b/meta/recipes-devtools/go/go_1.20.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.6.bb
rename to meta/recipes-devtools/go/go_1.20.7.bb
-- 
2.34.1


