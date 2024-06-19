Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A525BC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 15:48:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.24460.1718812119278012767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 08:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tn1pZI7R;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dc1d8867eso5336895f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 08:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718812117; x=1719416917; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jDUwl7TfiF393hyeUSpFXrewwdns9TqqTJT6Uq1DO54=;
        b=Tn1pZI7R/4stYU6ZER7tB7USnL9hxlDVVYvPxNCgz1uq1OV057drT9H5EUrQVwx3fK
         qim8M6RBZZi3Eo1n6rpXEv1DwUS9Z/WSgaHFhpcvjP4fNtm7q1rBotN+4b0EgJXt8eB8
         YXDw1s8Q9x4YuqGzhDZ0SgKXa2EyFXqozxFcSJHknlGbTtL6uAeI1jzOzJr/UgbW1TvO
         GRL5xg+F4qwp/DVpRRC1vWx7LD6zPRbLP+AJ190wFB9pWyof5Z4D/sSyohOsMPL8j+1t
         yl6fZg1Jve2Wr+NaqWGHzXBSa3wHsiNjW7lllwlaQ7o8rN5RHJkwWAYuy8eXdZ3Gaydk
         lQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718812117; x=1719416917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDUwl7TfiF393hyeUSpFXrewwdns9TqqTJT6Uq1DO54=;
        b=tRXqMeonCNzVgUL7XXS0wm+F0KeJvfRDl7cDRYbUatk8u71yQY4FwZzM8t+9KIFxdh
         yJFz38t+VOY5e9dDh7ht/P6aL9e4XZcE50VMAvCTECW1vDFmwOw64U4h6LCBkWhG16Ma
         VrML6OOyANXuxJ2WiI2n0oRcwKwkMZXyu3klU1Iqf4dFG0hWqWlU8yDeL8NxgpqKMoGS
         AC0x7KLRl6GkRl8YW7WotTAipViwMdupmrrfhAbvP3ElzLdyauAxfZFPH2D95nKHb21b
         R07bEk7yWAdpm6kh4eXqz0xc5S7XAWSwlp+m1KQjpB4143cJ6TY1107EgAgWey+VWDn5
         4gpQ==
X-Gm-Message-State: AOJu0YzNUNLdRA1RFWfC/zycdl6f3TShs79jGPSDnrp55b/N6xt4uIgp
	kMe9y3hvv9exKBMh706cECZOlGWvzVvxoUW6qWtWhWVUiC7WBqRG3eBbLX9G
X-Google-Smtp-Source: AGHT+IHbFcAjWRBMgc85lgFPWWx+X8aTKDPaRGEUuuwMsrSyR2cxh5DoXwg6wPPSlY2HwWYmuRD8FA==
X-Received: by 2002:a5d:53c3:0:b0:362:def2:3949 with SMTP id ffacd0b85a97d-363175b8d4emr2420034f8f.22.1718812117189;
        Wed, 19 Jun 2024 08:48:37 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36077536f78sm17341798f8f.7.2024.06.19.08.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 08:48:36 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][PATCH v2 3/3] go: move to a single bootstrap option which is the binary
Date: Wed, 19 Jun 2024 16:47:45 +0100
Message-ID: <20240619154744.381373-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619154744.381373-1-jose.quaresma@foundries.io>
References: <20240619154744.381373-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200921

With the drop of the old 1.4 bootstrap C version we can
move the go-binary-native to go-native and drop the PREFERRED_PROVIDER

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---

v2: rewrite the commit

 meta/conf/distro/include/tcmode-default.inc                   | 4 ----
 .../go/{go-binary-native_1.22.4.bb => go-native_1.22.4.bb}    | 2 --
 2 files changed, 6 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.4.bb => go-native_1.22.4.bb} (98%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4fb6e47b7f..a9724d7621 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -62,10 +62,6 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
 PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
 PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 
-# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
-# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
-# go-native.
-PREFERRED_PROVIDER_go-native ?= "go-binary-native"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb b/meta/recipes-devtools/go/go-native_1.22.4.bb
similarity index 98%
rename from meta/recipes-devtools/go/go-binary-native_1.22.4.bb
rename to meta/recipes-devtools/go/go-native_1.22.4.bb
index 61da51be3a..ee094435a7 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.4.bb
+++ b/meta/recipes-devtools/go/go-native_1.22.4.bb
@@ -5,8 +5,6 @@ HOMEPAGE = " http://golang.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
-PROVIDES = "go-native"
-
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
 SRC_URI[go_linux_amd64.sha256sum] = "ba79d4526102575196273416239cca418a651e049c2b099f3159db85e7bade7d"
-- 
2.45.2


