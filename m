Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 116A0FA3743
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:30 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.2192.1666901787311117763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f3fIrQYo;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id sc25so7839724ejc.12
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm+RPZXhkQJdqxqVUTkT7mbWzcNFY+SjMGh7A03hUJM=;
        b=f3fIrQYoqiWKgeEmmTm4OeNldk79NtqesHwjCVBrOXdNzRJknF6NqIznvTPbQ82ymX
         pk4uFYBMclEYT7vfd1tbKduhp19LbtO2q4nDPOQn+cxAvytl/0JQ+Sn1YZrV+HQC2Efv
         YyieJs66tdpBk6ara8YswWJMscvMhfxr2IFcB6BD8z7CnOgOV3Gsnznf596VDXJ8e7qD
         hf/HPQXvAnxWpsOgpTXjznc+Mc9bssfdPaLPUro2bGwsr5DB/4OT2hEGCno11SMCx+QE
         OZvty6ZPad2EJJNCst65ymZ3hQxWvmAUvX9QUrVXzej4asLwWZ7itEK3/jCN34Lct5S8
         JQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm+RPZXhkQJdqxqVUTkT7mbWzcNFY+SjMGh7A03hUJM=;
        b=Uscau/O2DG1CtrSMeZv5jk8eyKTo+kLoIdkMoNWPOqh6RFSK2Z3c6U4+wJbRzzYKKn
         n/KVAmCw7X3gXLDDOGQddi9vH6aKn2a6cYupMJqu/N2FtJ2Sb+4Flj+WFIhwoea8gCkr
         zNxKr55C/9Hpobw1ZUAtJukqHuyg3P9sHpIwUhGZiVjuDMY0tgRrN7/TNP3I8FvNFx8y
         WdT4hF2qODdkCB39RbLzi9BCi3tYB/mOqy1XgPRoIx+hNxwyUc4k8PI1LCVkt2PTnTgo
         gqId9XlpQXfSitqfZrTn3Cu0D/wZpWUhXjHxhO+TAOJHyOL55YVpaXZ+j3gM2QZnv21B
         +9Eg==
X-Gm-Message-State: ACrzQf3quFwuOTMsu15mVDA5HLMVf3fRNa8puLo92o2EQSvFG7dtmhcX
	l4aXhWhVV4/OSkkblCdRx5X+UQh8Oo+oiQ==
X-Google-Smtp-Source: AMsMyM507pstYXXaBkmhrr5XFsZU4lx+aXTZ6z6Scs7pKLyWl6fwaSwgfOa5Lwo9cTNxai5XdkPZSQ==
X-Received: by 2002:a17:907:96a3:b0:790:65a:3a0a with SMTP id hd35-20020a17090796a300b00790065a3a0amr45041374ejc.728.1666901785523;
        Thu, 27 Oct 2022 13:16:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/23] go: update 1.19 -> 1.19.1
Date: Thu, 27 Oct 2022 22:15:51 +0200
Message-Id: <20221027201611.3644334-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172207

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.19.inc => go-1.19.1.inc}   | 2 +-
 ...o-binary-native_1.19.bb => go-binary-native_1.19.1.bb} | 4 ++--
 ...cross-canadian_1.19.bb => go-cross-canadian_1.19.1.bb} | 0
 .../go/{go-cross_1.19.bb => go-cross_1.19.1.bb}           | 0
 .../go/{go-crosssdk_1.19.bb => go-crosssdk_1.19.1.bb}     | 0
 .../go/{go-native_1.19.bb => go-native_1.19.1.bb}         | 0
 .../go/{go-runtime_1.19.bb => go-runtime_1.19.1.bb}       | 0
 ...go-make-content-based-hash-generation-less-pedan.patch | 8 ++++----
 meta/recipes-devtools/go/{go_1.19.bb => go_1.19.1.bb}     | 0
 9 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.inc => go-1.19.1.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.bb => go-binary-native_1.19.1.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.bb => go-cross-canadian_1.19.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.bb => go-cross_1.19.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.bb => go-crosssdk_1.19.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.bb => go-native_1.19.1.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.bb => go-runtime_1.19.1.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.bb => go_1.19.1.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.inc b/meta/recipes-devtools/go/go-1.19.1.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.19.inc
rename to meta/recipes-devtools/go/go-1.19.1.inc
index f733a807b4..48140f1c2b 100644
--- a/meta/recipes-devtools/go/go-1.19.inc
+++ b/meta/recipes-devtools/go/go-1.19.1.inc
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://filter-build-paths.patch \
     file://stack-protector.patch \
 "
-SRC_URI[main.sha256sum] = "9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9"
+SRC_URI[main.sha256sum] = "27871baa490f3401414ad793fba49086f6c855b1c584385ed7771e1204c7e179"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.bb b/meta/recipes-devtools/go/go-binary-native_1.19.1.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.19.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.1.bb
index ca424a66b8..e67457b86c 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.1.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "464b6b66591f6cf055bc5df90a9750bf5fbc9d038722bb84a9d56a2bea974be6"
-SRC_URI[go_linux_arm64.sha256sum] = "efa97fac9574fc6ef6c9ff3e3758fb85f1439b046573bf434cccb5e012bd00c8"
+SRC_URI[go_linux_amd64.sha256sum] = "acc512fbab4f716a8f97a8b3fbaa9ddd39606a28be6c2515ef7c6c6311acffde"
+SRC_URI[go_linux_arm64.sha256sum] = "49960821948b9c6b14041430890eccee58c76b52e2dbaafce971c3c38d43df9f"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.1.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.bb b/meta/recipes-devtools/go/go-cross_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.bb
rename to meta/recipes-devtools/go/go-cross_1.19.1.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.1.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.bb b/meta/recipes-devtools/go/go-native_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.bb
rename to meta/recipes-devtools/go/go-native_1.19.1.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.bb b/meta/recipes-devtools/go/go-runtime_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.1.bb
diff --git a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
index 8cbed93017..17fa9d9831 100644
--- a/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
+++ b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
@@ -1,4 +1,4 @@
-From a3db4da51df37d163ff9e8c1e1057280c648c545 Mon Sep 17 00:00:00 2001
+From fb22e586871cc6be0b7041e86d2daceee06ea568 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 28 Mar 2022 10:59:03 -0700
 Subject: [PATCH] cmd/go: make content-based hash generation less pedantic
@@ -32,13 +32,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 34 insertions(+), 10 deletions(-)
 
 diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
-index 529351d..df791b0 100644
+index 81ee859..2db3898 100644
 --- a/src/cmd/go/internal/envcmd/env.go
 +++ b/src/cmd/go/internal/envcmd/env.go
 @@ -176,7 +176,7 @@ func ExtraEnvVars() []cfg.EnvVar {
  func ExtraEnvVarsCostly() []cfg.EnvVar {
- 	var b work.Builder
- 	b.Init()
+ 	b := work.NewBuilder("")
+ 
 -	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{})
 +	cppflags, cflags, cxxflags, fflags, ldflags, err := b.CFlags(&load.Package{}, false)
  	if err != nil {
diff --git a/meta/recipes-devtools/go/go_1.19.bb b/meta/recipes-devtools/go/go_1.19.1.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.bb
rename to meta/recipes-devtools/go/go_1.19.1.bb
-- 
2.30.2


