Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237A0C64ED6
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3840.1676835069722976077
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bk/VlU6e;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id s7-20020a05600c45c700b003dc52fed235so779809wmo.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkofDsrzhxlfu0Rvzl7St1m3L2hq5clkbxNIuV2UeRk=;
        b=bk/VlU6ejC0/7yE8FSFEBA7SWEuSmHHWuy9fk4zH1rUaXky06zLUHgkTICAxdew8Qe
         UfD/rERp/xERf963GmDT+VSYyNA0xdkhByAGJdV4YIyjEs4xMG76Z4FyDUmwmr4celfW
         Sr4vNTaOwc+PscQ8Jcf7wVGzP1R6uwT0IISzx8JPY3ny2P3JEnY8qpQXzE//1PapWZFU
         ihz9+N6FOlO2KySsAsuUTT24nqLnPe0T7PmMmZzyJeC/Y6WCtGl9PWSJNNaww0rJymTI
         6OTVnukeF2gPLoUFplf1it+IyObSpdot8j6ousD3lwf2HiohzcY4lOJ/o9zssA0jz4B1
         rtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkofDsrzhxlfu0Rvzl7St1m3L2hq5clkbxNIuV2UeRk=;
        b=YvGZj9eM+O9yVO9RJSG2gTwRB6SZkQDUOxDfAvOkLztmI6MrXe89XZ9T1aS9/s7ona
         gFRh90I7TDDZ8Jim9uZJ/SI9rsDu2FxkxLlKYgcvivzTc4K02CN6/qCAhoe+s4wlATxW
         cmfuigGcocqE359pUraHb+vhwAxsm+v11tYNB3ivHEXVWWBuY6aKwzgy9CMk+2NWAAXB
         RbKSukPV2Byi2yuK3U70rIxgVg7x1HkJIVdRmyTLcw5jdVcCWrm9TNaH/0jwm1b5UuJu
         tu47L3Wju2EohKAqoBLNYrPIO+48W7fsMi9bU5cK/n91LncmVC9I6KflBy9jyLhacI5Q
         xWQw==
X-Gm-Message-State: AO0yUKVM21/nykaY3tM4Ab5SQs4g2b7fPYtSu2Wz4BPU1R/USKUkGLOO
	Aw1SM9wOE3Tlci8J8oem6Hgr/eevdRg=
X-Google-Smtp-Source: AK7set86C/YAoN/nlfN9lOUYtbhF1YBWWxoMQISjk5m3HhRHP3h51CKJzydk6gc9brgNQAsjTvq2jA==
X-Received: by 2002:a05:600c:3414:b0:3e2:153e:6940 with SMTP id y20-20020a05600c341400b003e2153e6940mr9146236wmp.3.1676835068069;
        Sun, 19 Feb 2023 11:31:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/39] go: update 1.20 -> 1.20.1
Date: Sun, 19 Feb 2023 20:30:28 +0100
Message-Id: <20230219193101.338397-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177349

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.20.inc => go-1.20.1.inc}     | 2 +-
 ...{go-binary-native_1.20.bb => go-binary-native_1.20.1.bb} | 6 +++---
 ...o-cross-canadian_1.20.bb => go-cross-canadian_1.20.1.bb} | 0
 .../go/{go-cross_1.20.bb => go-cross_1.20.1.bb}             | 0
 .../go/{go-crosssdk_1.20.bb => go-crosssdk_1.20.1.bb}       | 0
 .../go/{go-native_1.20.bb => go-native_1.20.1.bb}           | 0
 .../go/{go-runtime_1.20.bb => go-runtime_1.20.1.bb}         | 0
 meta/recipes-devtools/go/{go_1.20.bb => go_1.20.1.bb}       | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.20.inc => go-1.20.1.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.bb => go-binary-native_1.20.1.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.bb => go-cross-canadian_1.20.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.bb => go-cross_1.20.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.bb => go-crosssdk_1.20.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.bb => go-native_1.20.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.bb => go-runtime_1.20.1.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.bb => go_1.20.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.20.inc b/meta/recipes-devtools/go/go-1.20.1.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.20.inc
rename to meta/recipes-devtools/go/go-1.20.1.inc
index 139f8d1f3c..aa3e2dadf1 100644
--- a/meta/recipes-devtools/go/go-1.20.inc
+++ b/meta/recipes-devtools/go/go-1.20.1.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
 "
-SRC_URI[main.sha256sum] = "3a29ff0421beaf6329292b8a46311c9fbf06c800077ceddef5fb7f8d5b1ace33"
+SRC_URI[main.sha256sum] = "b5c1a3af52c385a6d1c76aed5361cf26459023980d0320de7658bae3915831a2"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.20.bb b/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.20.bb
rename to meta/recipes-devtools/go/go-binary-native_1.20.1.bb
index ee6b84c4f5..3eb80fdcce 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.20.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.20.1.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "5a9ebcc65c1cce56e0d2dc616aff4c4cedcfbda8cc6f0288cc08cda3b18dcbf1"
-SRC_URI[go_linux_arm64.sha256sum] = "17700b6e5108e2a2c3b1a43cd865d3f9c66b7f1c5f0cec26d3672cc131cc0994"
-SRC_URI[go_linux_ppc64le.sha256sum] = "bccbf89c83e0aab2911e57217159bf0fc49bb07c6eebd2c23ae30af18fc5368b"
+SRC_URI[go_linux_amd64.sha256sum] = "000a5b1fca4f75895f78befeb2eecf10bfff3c428597f3f1e69133b63b911b02"
+SRC_URI[go_linux_arm64.sha256sum] = "5e5e2926733595e6f3c5b5ad1089afac11c1490351855e87849d0e7702b1ec2e"
+SRC_URI[go_linux_ppc64le.sha256sum] = "85cfd4b89b48c94030783b6e9e619e35557862358b846064636361421d0b0c52"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.20.bb b/meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.20.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.20.1.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.20.bb b/meta/recipes-devtools/go/go-cross_1.20.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.20.bb
rename to meta/recipes-devtools/go/go-cross_1.20.1.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.20.bb b/meta/recipes-devtools/go/go-crosssdk_1.20.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.20.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.20.1.bb
diff --git a/meta/recipes-devtools/go/go-native_1.20.bb b/meta/recipes-devtools/go/go-native_1.20.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.20.bb
rename to meta/recipes-devtools/go/go-native_1.20.1.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.20.bb b/meta/recipes-devtools/go/go-runtime_1.20.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.20.bb
rename to meta/recipes-devtools/go/go-runtime_1.20.1.bb
diff --git a/meta/recipes-devtools/go/go_1.20.bb b/meta/recipes-devtools/go/go_1.20.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.20.bb
rename to meta/recipes-devtools/go/go_1.20.1.bb
-- 
2.30.2


