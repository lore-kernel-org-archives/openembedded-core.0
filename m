Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF64C761AF
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.44311.1679494915715090239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:21:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ubvypXQk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id q23so5385170pfs.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sZlkAwq0miCmi/0wk4dSavdMLZ8GnMCjZ6zjn/Naxsc=;
        b=ubvypXQkKK0zt1cQUCgo5BKl4rsm+RUtJJy2UsBcgblXoTrUZbIpufXaL8HXM5E37v
         iNCDVbwepyTR7ewpo15snT0/EkVrsPrGRz4GBhOee10vkBiP/3X6I3GA1Nei1Vjv/afG
         z6KKf08rbcUYhKgsxPekAGMwuGsvgLJ3VKnszey978ruJGOqObOb7Aonno56xFdEn/7l
         U+F5NChhdcfH8Xlrj24VlbaFo03MJwmrjMeXg1D5r3iwaU9y0fl2Fugts4hihn62DCAT
         ITewu1K9iq4Lmf/oQWACW8BTFIVtywZ6rQRN82bx/Si81oO8aNxF2LciRxoecfxnGvjY
         XE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZlkAwq0miCmi/0wk4dSavdMLZ8GnMCjZ6zjn/Naxsc=;
        b=l2Zq/AHjPO2Qok7k2XV3ohiH/jHk1mjxo3cQYjhlcobUsI8p9j7EeXgb2NMzk8BNWz
         ty9iAV4eqN5K1WZPEBqFuWq4e8xgPKAzJg0Yx6ANCKJXwVRLz1h8QwARIT0BamNy1x4M
         4LNIjv46VG7l/vxmwE0Tept+izMhIjdhxLtMI8bDgfoUNGipyhuy4RcdpndQEIykNlK+
         VOnfebZBKw1vDtsKOdOOHbjg3xAKc/t/GFPu3bWaBhDAwL0OHgdoLNttve+/olbHgtY0
         rQsUVpZE5Q7aNzx7o3GDO6aI0qt4yGSS0a0PaIy2+HG7kEoCJHmZrlg7PzbJVn2Df1G4
         JBXw==
X-Gm-Message-State: AO0yUKX85V6YiLiFSsfE3EvnYoKIfVhIOtAsZmizwd8qdLTVFFpcOi8a
	jlpgTGeVAunOyUOSGjIjNr/DZ07LCfziOmlcL1o=
X-Google-Smtp-Source: AK7set9oNE6zKmLGDHGWCAEsZh9eors2jEMdXAdu+I74bzQj+frxQG9I1iFyY48uqKPS8Jw7CgGxpw==
X-Received: by 2002:aa7:9423:0:b0:627:f0b9:d5c1 with SMTP id y3-20020aa79423000000b00627f0b9d5c1mr3186188pfo.17.1679494914742;
        Wed, 22 Mar 2023 07:21:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.21.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:21:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/21] go: upgrade to 1.19.7
Date: Wed, 22 Mar 2023 04:21:22 -1000
Message-Id: <3bee5e8c76f7da2d967ac01dbd5e7ed8d00589d3.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178928

From: Chee Yang Lee <chee.yang.lee@intel.com>

upgrade include fix for CVE-2022-41722 CVE-2022-41723 CVE-2022-41724
CVE-2022-41725 CVE-2023-24532

Release notes:

go1.19.5 (released 2023-01-10) includes fixes to the compiler, the
linker, and the crypto/x509, net/http, sync/atomic, and syscall
packages. See the Go 1.19.5 milestone on our issue tracker for details.

go1.19.6 (released 2023-02-14) includes security fixes to the
crypto/tls, mime/multipart, net/http, and path/filepath packages, as
well as bug fixes to the go command, the linker, the runtime, and the
crypto/x509, net/http, and time packages. See the Go 1.19.6 milestone on
our issue tracker for details.

go1.19.7 (released 2023-03-07) includes a security fix to the
crypto/elliptic package, as well as bug fixes to the linker, the
runtime, and the crypto/x509 and syscall packages. See the Go 1.19.7
milestone on our issue tracker for details.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/{go-1.19.4.inc => go-1.19.7.inc}     | 2 +-
 ...{go-binary-native_1.19.4.bb => go-binary-native_1.19.7.bb} | 4 ++--
 ...o-cross-canadian_1.19.4.bb => go-cross-canadian_1.19.7.bb} | 0
 .../go/{go-cross_1.19.4.bb => go-cross_1.19.7.bb}             | 0
 .../go/{go-crosssdk_1.19.4.bb => go-crosssdk_1.19.7.bb}       | 0
 .../go/{go-native_1.19.4.bb => go-native_1.19.7.bb}           | 0
 .../go/{go-runtime_1.19.4.bb => go-runtime_1.19.7.bb}         | 0
 meta/recipes-devtools/go/{go_1.19.4.bb => go_1.19.7.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.4.inc => go-1.19.7.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.4.bb => go-binary-native_1.19.7.bb} (84%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.19.4.bb => go-cross-canadian_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.19.4.bb => go-cross_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.19.4.bb => go-crosssdk_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.19.4.bb => go-native_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.19.4.bb => go-runtime_1.19.7.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.19.4.bb => go_1.19.7.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.19.4.inc b/meta/recipes-devtools/go/go-1.19.7.inc
similarity index 89%
rename from meta/recipes-devtools/go/go-1.19.4.inc
rename to meta/recipes-devtools/go/go-1.19.7.inc
index 49349ba6ec..7d76f34bdf 100644
--- a/meta/recipes-devtools/go/go-1.19.4.inc
+++ b/meta/recipes-devtools/go/go-1.19.7.inc
@@ -15,4 +15,4 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://filter-build-paths.patch \
 "
-SRC_URI[main.sha256sum] = "eda74db4ac494800a3e66ee784e495bfbb9b8e535df924a8b01b1a8028b7f368"
+SRC_URI[main.sha256sum] = "775bdf285ceaba940da8a2fe20122500efd7a0b65dbcee85247854a8d7402633"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.19.4.bb b/meta/recipes-devtools/go/go-binary-native_1.19.7.bb
similarity index 84%
rename from meta/recipes-devtools/go/go-binary-native_1.19.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.7.bb
index f1208d183a..0e2c8f1b24 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.7.bb
@@ -9,8 +9,8 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "c9c08f783325c4cf840a94333159cc937f05f75d36a8b307951d5bd959cf2ab8"
-SRC_URI[go_linux_arm64.sha256sum] = "9df122d6baf6f2275270306b92af3b09d7973fb1259257e284dba33c0db14f1b"
+SRC_URI[go_linux_amd64.sha256sum] = "7a75720c9b066ae1750f6bcc7052aba70fa3813f4223199ee2a2315fd3eb533d"
+SRC_URI[go_linux_arm64.sha256sum] = "071ea7bf386fdd08df524859b878d99fc359e491e7ad65c1c1cc55b67972c882"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.19.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.19.4.bb b/meta/recipes-devtools/go/go-cross_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.19.4.bb
rename to meta/recipes-devtools/go/go-cross_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.19.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.19.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-native_1.19.4.bb b/meta/recipes-devtools/go/go-native_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.19.4.bb
rename to meta/recipes-devtools/go/go-native_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.19.4.bb b/meta/recipes-devtools/go/go-runtime_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.19.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.19.7.bb
diff --git a/meta/recipes-devtools/go/go_1.19.4.bb b/meta/recipes-devtools/go/go_1.19.7.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.19.4.bb
rename to meta/recipes-devtools/go/go_1.19.7.bb
-- 
2.34.1


