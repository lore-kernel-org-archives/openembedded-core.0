Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F36BC4707E
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.2677.1639608050498031445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i0kq3uOQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id s1so6595449wrg.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2SI0JN/wAL0tAonDScOnNwg7QZ8YjFoWNRIXjqdIS0c=;
        b=i0kq3uOQ2BZWvgXg4tCFs2OF6Qt2Q052xqc7uG8bmHAc6KirEcgW3WwT+zCs6JUVw+
         6xLUWSKYYCPj8tGEWvet0m1LPcI2QukNcGICl18LKX20v4hUdKazoxEzMydR+xmC1tP4
         Ybv9+peLFnIUjl8GASSPZf5rDy3LvRc6NozTdcR7yFGRMR5gnntZ0CUjFsM6+bDj/bMF
         gP8EBcw7wtFBF82O799zNffZQP8G19MHhDcQ7QnPavYcNWd2fq45cf6HuJLQI5NQRQBi
         cZEnckPD8oqzCky70ci+J8NusPWdspOmlI5jRzoDcacbBLtjzyUtSWTrSLk8kL/TjC35
         JwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2SI0JN/wAL0tAonDScOnNwg7QZ8YjFoWNRIXjqdIS0c=;
        b=zaouD8yVMu2P0D9AlToDxLFpOZzTHl5bW2R8GR+DHe29CMynZxNUd+x5VepXWUzE5U
         ePJTNLRQGxvmIbbg4fgRAgGYK0+dllR0cK4k10EOSzM/swvKxgekWAqWRNQlu/jutXkB
         cPFiF7Uj5mpXK6jQ/L8RHnJsdDkrJEVriUZ4NyVkxufMI11BlfVtoqpYLC1UwO8hloDA
         RQGYUyvifXPqxjHHrEUkRZF829vBLqoUz84enerrSQwrW4XIbHpQTZ0EsqcvYg6u7IgO
         N99+knq4PLNA1/LyPt6+qA2ZR1Le1P//aGSeJZal1ed7V3X4dartWzUpdFsyrBl0Sh6a
         Xr1w==
X-Gm-Message-State: AOAM532pgjzmzryCPm3z/uoHoRU2klFfPSQuJPrLrS7aSeskL+QFtOKU
	MwIGgfk+qh4o0gJBm4SRSUL0XWaOKm216Q==
X-Google-Smtp-Source: 
 ABdhPJzYDK5uvM7RhZW4fvAVs+o0himYwes1FCADr9eEfK+wzy8ZEYcJurKz9+eedD/pYu6cKx/e1Q==
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr6380724wri.510.1639608049159;
        Wed, 15 Dec 2021 14:40:49 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/26] go: upgrade 1.17.4 -> 1.17.5
Date: Wed, 15 Dec 2021 23:40:24 +0100
Message-Id: <20211215224034.1814148-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159758

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/go/{go-1.17.4.inc => go-1.17.5.inc}     | 2 +-
 ...{go-binary-native_1.17.4.bb => go-binary-native_1.17.5.bb} | 4 ++--
 ...o-cross-canadian_1.17.4.bb => go-cross-canadian_1.17.5.bb} | 0
 .../go/{go-cross_1.17.4.bb => go-cross_1.17.5.bb}             | 0
 .../go/{go-crosssdk_1.17.4.bb => go-crosssdk_1.17.5.bb}       | 0
 .../go/{go-native_1.17.4.bb => go-native_1.17.5.bb}           | 0
 .../go/{go-runtime_1.17.4.bb => go-runtime_1.17.5.bb}         | 0
 meta/recipes-devtools/go/{go_1.17.4.bb => go_1.17.5.bb}       | 0
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/go/{go-1.17.4.inc => go-1.17.5.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.17.4.bb => go-binary-native_1.17.5.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.17.4.bb => go-cross-canadian_1.17.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.17.4.bb => go-cross_1.17.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.17.4.bb => go-crosssdk_1.17.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.17.4.bb => go-native_1.17.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.17.4.bb => go-runtime_1.17.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.17.4.bb => go_1.17.5.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.17.4.inc b/meta/recipes-devtools/go/go-1.17.5.inc
similarity index 91%
rename from meta/recipes-devtools/go/go-1.17.4.inc
rename to meta/recipes-devtools/go/go-1.17.5.inc
index 5c4423ac18..baddd3b215 100644
--- a/meta/recipes-devtools/go/go-1.17.4.inc
+++ b/meta/recipes-devtools/go/go-1.17.5.inc
@@ -15,7 +15,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
-SRC_URI[main.sha256sum] = "4bef3699381ef09e075628504187416565d710660fec65b057edf1ceb187fc4b"
+SRC_URI[main.sha256sum] = "3defb9a09bed042403195e872dcbc8c6fae1485963332279668ec52e80a95a2d"
 
 # Upstream don't believe it is a signifiant real world issue and will only
 # fix in 1.17 onwards where we can drop this.
diff --git a/meta/recipes-devtools/go/go-binary-native_1.17.4.bb b/meta/recipes-devtools/go/go-binary-native_1.17.5.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.17.4.bb
rename to meta/recipes-devtools/go/go-binary-native_1.17.5.bb
index 8d8142ce1d..f07d299b40 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.17.4.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.17.5.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "adab2483f644e2f8a10ae93122f0018cef525ca48d0b8764dae87cb5f4fd4206"
-SRC_URI[go_linux_arm64.sha256sum] = "617a46bd083e59877bb5680998571b3ddd4f6dcdaf9f8bf65ad4edc8f3eafb13"
+SRC_URI[go_linux_amd64.sha256sum] = "bd78114b0d441b029c8fe0341f4910370925a4d270a6a590668840675b0c653e"
+SRC_URI[go_linux_arm64.sha256sum] = "6f95ce3da40d9ce1355e48f31f4eb6508382415ca4d7413b1e7a3314e6430e7e"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.17.4.bb b/meta/recipes-devtools/go/go-cross-canadian_1.17.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.17.4.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.17.5.bb
diff --git a/meta/recipes-devtools/go/go-cross_1.17.4.bb b/meta/recipes-devtools/go/go-cross_1.17.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.17.4.bb
rename to meta/recipes-devtools/go/go-cross_1.17.5.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.17.4.bb b/meta/recipes-devtools/go/go-crosssdk_1.17.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.17.4.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.17.5.bb
diff --git a/meta/recipes-devtools/go/go-native_1.17.4.bb b/meta/recipes-devtools/go/go-native_1.17.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.17.4.bb
rename to meta/recipes-devtools/go/go-native_1.17.5.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.17.4.bb b/meta/recipes-devtools/go/go-runtime_1.17.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.17.4.bb
rename to meta/recipes-devtools/go/go-runtime_1.17.5.bb
diff --git a/meta/recipes-devtools/go/go_1.17.4.bb b/meta/recipes-devtools/go/go_1.17.5.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.17.4.bb
rename to meta/recipes-devtools/go/go_1.17.5.bb
-- 
2.20.1


