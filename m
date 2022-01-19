Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06937C4321E
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.4637.1642588898452326552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nSw1mWrB;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id c66so4453531wma.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T6Cbch/TL6D+wv2q6meok7NzejyJMZH775tvf0YDSeI=;
        b=nSw1mWrBe2n0TFqUqqczid6mBWUEyGEu0qgVFV7zhPBI8+KnbynH9Xz9eYZrNPxse/
         50E3RhBD3if/DEXY5VdEDWUP4L83AuqrygsCZusNOya0u7W2KeBrLKV4e/EsNxhiFpgU
         ifZDEtg4gvgreV4zYbn/buUyiJGhPFLlPlxrIuyHogJumzEIJ+rRgIO2KQB7tc9944uR
         yp7+QVIDIpGoNhkcEM9vLYWvSpLryhqrtZ5v0xyyEYBqjLxk4CNZ3xbE3Le2Yt7B3OQK
         de7e7AF65MxCOFcg8sxK/HWw7V7bPpu75uE9ZdlQNEeKuMhPYyBvB1M9wbgwQIZhWYiO
         FHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T6Cbch/TL6D+wv2q6meok7NzejyJMZH775tvf0YDSeI=;
        b=LRsRM+Iv2ZkJ/v3YIkjdo5RqfdVvbh0tJVx/yHkWcj9YRLjUP4DEzgXSIeLce+fqci
         MVHN8RFrggMHxM/7+EUZvcpTcMzINvCSSzqxXv9CuNRlniHuDgasWga7ZRYwXpcNz/im
         5iHIEYnnRPV6SPDwiLkuCO61ulNFttQvFtD+92gLm8yCOPSeSHDwC1FwhphZ+e+YXPM+
         0FLjCQRp8x8QkBnV32vf4EKyy9bMM11mR+F5MGgF8/dUSsI/Eeo0moMkFkPJTJASaKRk
         5N87gChxwQogc1iyd8WPXbYJSL063lRhRcouyBtrCC79/gjaoIw/Pjfshicdw3LSK2q3
         8GDQ==
X-Gm-Message-State: AOAM5301K3JIGVARVk49pl4PY+j1WUety3Yh82bQclE6ZPTYF0vYKQPA
	mUFYi5OEqpD3VWC8qdiZeoyg7jBMijI=
X-Google-Smtp-Source: 
 ABdhPJzChQBJY2i/LRG575DIfjX7vEQGmlLn8P7dwgennRHS7dzH9NMIpaOkSHCwsjxk2/uKu8HoLg==
X-Received: by 2002:adf:f683:: with SMTP id v3mr5565955wrp.306.1642588897094;
        Wed, 19 Jan 2022 02:41:37 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:36 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/39] go: upgrade 1.17.5 -> 1.17.6
Date: Wed, 19 Jan 2022 11:40:54 +0100
Message-Id: <20220119104117.2120127-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160707

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/{go-1.17.5.inc => go-1.17.6.inc}     | 2 +-
 ...{go-binary-native_1.17.5.bb => go-binary-native_1.17.6.bb} | 4 ++--
 ...o-cross-canadian_1.17.5.bb => go-cross-canadian_1.17.6.bb} | 0
 .../go/{go-cross_1.17.5.bb => go-cross_1.17.6.bb}             | 0
 .../go/{go-crosssdk_1.17.5.bb => go-crosssdk_1.17.6.bb}       | 0
 .../go/{go-native_1.17.5.bb => go-native_1.17.6.bb}           | 0
 .../go/{go-runtime_1.17.5.bb => go-runtime_1.17.6.bb}         | 0
 meta/recipes-devtools/go/{go_1.17.5.bb => go_1.17.6.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.5.inc => go-1.17.6.inc} (92%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.5.bb => go-binary-native_1.17.6.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.5.bb => go-cross-canadian_1.17.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.5.bb => go-cross_1.17.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.5.bb => go-crosssdk_1.17.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.5.bb => go-native_1.17.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.5.bb => go-runtime_1.17.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.5.bb => go_1.17.6.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.5.inc b/meta/recipes-devtools/go/go-1.17.6.inc
similarity index 92%
rename from meta/recipes-devtools/go/go-1.17.5.inc
rename to meta/recipes-devtools/go/go-1.17.6.inc
index 56957f7c6e..3ea23e0320 100644
--- a/meta/recipes-devtools/go/go-1.17.5.inc
+++ b/meta/recipes-devtools/go/go-1.17.6.inc
@@ -17,7 +17,7 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d"
+SRC_URI[main.sha256sum] = "4dc1bbf3ff61f0c1ff2b19355e6d88151a70126268a47c761477686ef94748c8"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.5.bb b/meta/recipes-devtools/go/go-binary-native_1.17.6.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.6.bb
index f07d299b40..674f9176af 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.6.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "bd78114b0d441b029c8fe0341f4910370925a4d270a6a590668840675b0c653e"
-SRC_URI[go_linux_arm64.sha256sum] = "6f95ce3da40d9ce1355e48f31f4eb6508382415ca4d7413b1e7a3314e6430e7e"
+SRC_URI[go_linux_amd64.sha256sum] = "231654bbf2dab3d86c1619ce799e77b03d96f9b50770297c8f4dff8836fc8ca2"
+SRC_URI[go_linux_arm64.sha256sum] = "82c1a033cce9bc1b47073fd6285233133040f0378439f3c4659fe77cc534622a"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.5.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.5.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.6.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.5.bb b/meta/recipes-devtools/go/go-cross_1.17.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.5.bb
rename to meta/recipes-devtools/go/go-cross_1.17.6.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.5.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.5.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.6.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.5.bb b/meta/recipes-devtools/go/go-native_1.17.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.5.bb
rename to meta/recipes-devtools/go/go-native_1.17.6.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.5.bb b/meta/recipes-devtools/go/go-runtime_1.17.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.5.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.6.bb
diff --git a/meta/recipes-devtools/go/go_1.17.5.bb b/meta/recipes-devtools/go/go_1.17.6.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.5.bb
rename to meta/recipes-devtools/go/go_1.17.6.bb
-- 
2.20.1


