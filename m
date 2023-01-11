Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E02C67871
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:22:01 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.28309.1673454113545639169
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:21:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=hIQJemz6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so20585439pjj.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZ7UZnxwHmYzFwARJhvRKEVvH+Un3EwdKoUt9jtOUmQ=;
        b=hIQJemz6AdBqWMGOYzXIelQfkMkXi+rD500wIpKP6lsQoGUBWViiuqDZOZUvaqkZvz
         5W7MKtJYUOPpAC0h7Dx9g9pc4gCrBTTVjMDNwrwvWEvTwiaI/4tCcDB00jp2m6C2dPPL
         EpJ0mq2+0b7crthMidfw6Xvyd8ccN/ATGYle2YX1MMj0A1kTniur+IsiyrmS/qngyf9M
         uTbFtrqSPkpCD669efHLs3yxxhQfIWD2Zwp3FmRDYJGMyhA1x5CM0BDYxPKgF7ZVD+Si
         DiXtKNK5IFuknCao3NLZMsM4FBry+nKoAMnkgUF+KftXxdo+AO/gcDtEhyW9kdHwgWYa
         YIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZ7UZnxwHmYzFwARJhvRKEVvH+Un3EwdKoUt9jtOUmQ=;
        b=gQGTBUYhExJ8uxkXzU7pIBKa18AGXvrkrbmGKsnQafyN0kk/jNbV7m7bNlxTiJtMXb
         kfFeanv9PFcUuf7Ex0o5nhyYGBNVFX+taIlaexdOihNWKmHcsdhi22+LueJ3lWyVSYnO
         QvcS9CvVOKnR1caTIgoiSaZ+POrDaiA7W1Bj/62laV+VMC/Gez90JwIAXGyhvZnaZtJs
         FTpDM2sRMaRujGhvVZHAYMAikkXpYdR25nJ5fCNzIDWghXeYScABpTI7M7eD9eQohLlo
         RdE01hazUr9a8xiW3qakFBEalXsIMGDBzfB5hLp0OOeTZ37v6ix6J3fqTPFxHkxb7Ysn
         /AfA==
X-Gm-Message-State: AFqh2koZtFNo9W6Df15gVyqyCeRwsWhk2zjmDGPkDJaVssDgaWCCz67B
	7QzRxKqrlmYLGI9smhvGHrCvIf3/R6XB+3AGXFc=
X-Google-Smtp-Source: AMrXdXsgmioBK8ttzh3HuIAKdrawrGTfg0QQFofiJHnOl1Uu9VzT0sTmn4vhpjM3KbVxw5+yHKycfA==
X-Received: by 2002:a17:90a:ead2:b0:226:f8dc:b237 with SMTP id ev18-20020a17090aead200b00226f8dcb237mr14379426pjb.31.1673454112489;
        Wed, 11 Jan 2023 08:21:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/11] go: update 1.19.3 -> 1.19.4
Date: Wed, 11 Jan 2023 06:21:31 -1000
Message-Id: <e07f253e14a3651dd4e3d0e4d75c546f40bea8c1.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175761

From: Alexander Kanavin <alex.kanavin@gmail.com>

go1.19.4 (released 2022-12-06) includes security fixes to the net/http
and os packages, as well as bug fixes to the compiler, the runtime,
and the crypto/x509, os/exec, and sync/atomic packages.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 67301425ac2696ccc07d6f47856336d6336382fb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.19.3.inc => go-1.19.4.inc}     | 2 +-
 ...{go-binary-native_1.19.3.bb => go-binary-native_1.19.4.bb} | 4 ++--
 ...o-cross-canadian_1.19.3.bb => go-cross-canadian_1.19.4.bb} | 0
 .../go/{go-cross_1.19.3.bb => go-cross_1.19.4.bb}             | 0
 .../go/{go-crosssdk_1.19.3.bb => go-crosssdk_1.19.4.bb}       | 0
 .../go/{go-native_1.19.3.bb => go-native_1.19.4.bb}           | 0
 .../go/{go-runtime_1.19.3.bb => go-runtime_1.19.4.bb}         | 0
 meta/recipes-devtools/go/{go_1.19.3.bb => go_1.19.4.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.3.inc => go-1.19.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.3.bb => go-binary-native_1.19.4.bb} (84%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.3.bb => go-cross-canadian_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.3.bb => go-cross_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.3.bb => go-crosssdk_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.3.bb => go-native_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.3.bb => go-runtime_1.19.4.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.3.bb => go_1.19.4.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.3.inc b/meta/recipes-devtools/go/go-1.19.4.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.19.3.inc
rename to meta/recipes-devtools/go/go-1.19.4.inc
index 1245faba93..49349ba6ec 100644
--- a/meta/recipes-devtools/go/go-1.19.3.inc
+++ b/meta/recipes-devtools/go/go-1.19.4.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212"
+SRC_URI[main.sha256sum] = "eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.3.bb b/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
similarity index 84%
rename from meta/recipes-devtools/go/go-binary-native_1.19.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.4.bb
index 334f63b30b..f1208d183a 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
@@ -9,8 +9,8 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "74b9640724fd4e6bb0ed2a1bc44ae813a03f1e72a4c76253e2d5c015494430ba"
-SRC_URI[go_linux_arm64.sha256sum] = "99de2fe112a52ab748fb175edea64b313a0c8d51d6157dba683a6be163fd5eab"
+SRC_URI[go_linux_amd64.sha256sum] = "c9c08f783325c4cf840a94333159cc937f05f75d36a8b307951d5bd959cf2ab8"
+SRC_URI[go_linux_arm64.sha256sum] = "9df122d6baf6f2275270306b92af3b09d7973fb1259257e284dba33c0db14f1b"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.3.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.3.bb b/meta/recipes-devtools/go/go-cross_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.3.bb
rename to meta/recipes-devtools/go/go-cross_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.3.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.3.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.3.bb b/meta/recipes-devtools/go/go-native_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.3.bb
rename to meta/recipes-devtools/go/go-native_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.3.bb b/meta/recipes-devtools/go/go-runtime_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.3.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.4.bb
diff --git a/meta/recipes-devtools/go/go_1.19.3.bb b/meta/recipes-devtools/go/go_1.19.4.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.3.bb
rename to meta/recipes-devtools/go/go_1.19.4.bb
-- 
2.25.1


