Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5189C43219
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:58:55 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.3487.1652871533048666129
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dEvryWWE;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id kq17so3054973ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EFsC523jtgQ3EfLEurpXLNRIN/1++Y799xbsyquCkg0=;
        b=dEvryWWEyePOUlaWlABhGcBarnOSLtI12EgVZf9/GpJQIj2yXrHYuoqeS0SYLY4Xl1
         3Ig/Rfz5tfilEhPaDfMVHhIZFuVGyp70Sz9ud/07tIYnXSQvy+jgIB5ZMWOpg5TpMSfU
         ifovLYv1yiYiEnci4BJKx4StqwUENYAo109Aev4OgFGZMWSxCZF3a214LEdp0hn0kxHy
         b2fGZRsscpxibr2x+z8kt6C1fMve7q+rwNlJ2ACdExnX1/rxR5A6AHFhmJ+Y6Ca4tohS
         Ew2qP4Lfpm/CPFfO+zRQ1GyEmKkYFlwkUr7C3AmDEE2iuobSW82lIbV8edmuuW81q+r/
         EUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EFsC523jtgQ3EfLEurpXLNRIN/1++Y799xbsyquCkg0=;
        b=OrxXgEsdwRJduNeKLYPDj4NWcgqF7vdgN3vhWsifz7bsBtqH1eatICaUbdTDViyj7l
         i7BIpWxBHoiJQlVSuKd3RRX+ZWVWlDgLg/olwdOLU3XOpVr2P1Dg5H0TZFV/tzPTjKjP
         wMb9mQjizmYrhFExQj+xm7hDJfVRWNg/79vFqshif0n8DCTuhc/Be0FteVk2opFjWDtL
         WEKOFDc4YffCkl3o4BlscZKw0oZ6sbMcYsbhTixPhItNKl/oRynhj7TU5b3A0ToExOMc
         vaiSC4+E8rJ+rJb/xdVXOD3TVvoYJG2My2j9o9aomMmhemkJAd7HN172Wsb+iXdIChbI
         qoVA==
X-Gm-Message-State: AOAM530KriIeCHus1z3zawUvxyBvd52qH/ovf3NIPPBaqtFi4EWLIxGb
	N9t1Ivtjb7tm5w/3bbzdITiE6vAr3RM=
X-Google-Smtp-Source: 
 ABdhPJysuxc1x2lBLtXuaOkWpuBJGnF2nNKbIW23ProGhPH0nmGO/bW/RIvEZzcSbuzOX5muMZIHrw==
X-Received: by 2002:a17:906:9b8b:b0:6fe:55db:14e with SMTP id
 dd11-20020a1709069b8b00b006fe55db014emr9296159ejc.327.1652871531649;
        Wed, 18 May 2022 03:58:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:58:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/49] go: upgrade 1.18.1 -> 1.18.2
Date: Wed, 18 May 2022 12:57:58 +0200
Message-Id: <20220518105843.3299331-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:58:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165801

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.18.1.inc => go-1.18.2.inc}     | 2 +-
 ...{go-binary-native_1.18.1.bb => go-binary-native_1.18.2.bb} | 4 ++--
 ...o-cross-canadian_1.18.1.bb => go-cross-canadian_1.18.2.bb} | 0
 .../go/{go-cross_1.18.1.bb => go-cross_1.18.2.bb}             | 0
 .../go/{go-crosssdk_1.18.1.bb => go-crosssdk_1.18.2.bb}       | 0
 .../go/{go-native_1.18.1.bb => go-native_1.18.2.bb}           | 0
 .../go/{go-runtime_1.18.1.bb => go-runtime_1.18.2.bb}         | 0
 meta/recipes-devtools/go/{go_1.18.1.bb => go_1.18.2.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.18.1.inc => go-1.18.2.inc} (88%)
 rename meta/recipes-devtools/go/{go-binary-native_1.18.1.bb => go-binary-native_1.18.2.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.18.1.bb => go-cross-canadian_1.18.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.18.1.bb => go-cross_1.18.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.18.1.bb => go-crosssdk_1.18.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.18.1.bb => go-native_1.18.2.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.18.1.bb => go-runtime_1.18.2.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.18.1.bb => go_1.18.2.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.18.1.inc b/meta/recipes-devtools/go/go-1.18.2.inc
similarity index 88%
rename from meta/recipes-devtools/go/go-1.18.1.inc
rename to meta/recipes-devtools/go/go-1.18.2.inc
index 64426471df..8f4f47db9e 100644
--- a/meta/recipes-devtools/go/go-1.18.1.inc
+++ b/meta/recipes-devtools/go/go-1.18.2.inc
@@ -14,4 +14,4 @@ SRC_URI += "\
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
 "
-SRC_URI[main.sha256sum] = "efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088"
+SRC_URI[main.sha256sum] = "2c44d03ea2c34092137ab919ba602f2c261a038d08eb468528a3f3a28e5667e2"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.18.1.bb b/meta/recipes-devtools/go/go-binary-native_1.18.2.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.18.1.bb
rename to meta/recipes-devtools/go/go-binary-native_1.18.2.bb
index da9f39f428..c5514c5fdf 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.18.1.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.18.2.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "b3b815f47ababac13810fc6021eb73d65478e0b2db4b09d348eefad9581a2334"
-SRC_URI[go_linux_arm64.sha256sum] = "56a91851c97fb4697077abbca38860f735c32b38993ff79b088dac46e4735633"
+SRC_URI[go_linux_amd64.sha256sum] = "e54bec97a1a5d230fc2f9ad0880fcbabb5888f30ed9666eca4a91c5a32e86cbc"
+SRC_URI[go_linux_arm64.sha256sum] = "fc4ad28d0501eaa9c9d6190de3888c9d44d8b5fb02183ce4ae93713f67b8a35b"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb b/meta/recipes-devtools/go/go-cross-canadian_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.18.2.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.18.1.bb b/meta/recipes-devtools/go/go-cross_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.18.1.bb
rename to meta/recipes-devtools/go/go-cross_1.18.2.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.18.1.bb b/meta/recipes-devtools/go/go-crosssdk_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.18.1.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.18.2.bb
diff --git a/meta/recipes-devtools/go/go-native_1.18.1.bb b/meta/recipes-devtools/go/go-native_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.18.1.bb
rename to meta/recipes-devtools/go/go-native_1.18.2.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.18.1.bb b/meta/recipes-devtools/go/go-runtime_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.18.1.bb
rename to meta/recipes-devtools/go/go-runtime_1.18.2.bb
diff --git a/meta/recipes-devtools/go/go_1.18.1.bb b/meta/recipes-devtools/go/go_1.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.18.1.bb
rename to meta/recipes-devtools/go/go_1.18.2.bb
-- 
2.30.2


