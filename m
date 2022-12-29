Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5089C4708D
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.208339.1672329682734305124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qFC8ifzB;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so13458256wms.4
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJdw9EERK7V2Gehj1f+SIlA66T5ydFE0zBORKr/xVPk=;
        b=qFC8ifzBiR4xEGururUoTTUasHYo+cfyLH/LIFEzlVKiz2N5sRyg3WCst96mOsiM12
         aUCQrBcyHZcQZU8Fl82QsSC3/6fmAYF/pjvhK9Tf9a+oeo7B9F9YIIy77JHopl+SknkZ
         VDzgsh1cJCV46zzFKbzvlg1ObsSqTJ8hih8nKdP1ZMJQcLoYY49gvruBR2r5OHasNaQC
         9aCoCzCDze7Ls2x/kVqR55AfEBxtt+K1bvxtnTAQZ1VGIDpecjRBWci1HVWEmuklANin
         5SVGoplxUqJ1TOWZ4J6loFX7JuJvbRUWWhRi+odZZpjklxaphIFZssBQoKP7kY9ILiYK
         OvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJdw9EERK7V2Gehj1f+SIlA66T5ydFE0zBORKr/xVPk=;
        b=HSsJIdKDuH8GDPIljMM5lID2MS/9ZEIw+OKr15MZKdS5HFA2uTHxpBIX86kN1ksA8a
         pjKXQqM58OlgCgE6NPnFy2qb3zCeOKEvJPNXypaxKRobRPff86p3l9F3B5Z/ptvLheRo
         HGwplIwWpdzcvIjOezD/l2p+e/pwvq0H0JKT85lmo+oKF7vtTTu13uZWX/rCAGbSLgeO
         2hkPUMuh0LLRcwCDmUESxklq9LdPBgLUogD/cRaRyOd3awpYqClsAnvEC/6PPy1zHD1Z
         rd7beq5trSyqQAbpxaRdHdK0jBlM8x8JF5J4n5I6NyGGxl5xjqSd/qjQ+LSPY9udd/BL
         UuZg==
X-Gm-Message-State: AFqh2kq1RMG0ElRUcbmF+DH3S/jwPGmihk+xaRvz4cwcgWu/3W4DAK4T
	R+u6sOlnn8G/erYj9h+gHqWdDHv34CU=
X-Google-Smtp-Source: AMrXdXuKFj1vMBqFe01NDhs/xOcGKI/ZnHBwWul5G4W0R1hG5eYr2oUaaik3/E/QpiGDvir0KfWbqA==
X-Received: by 2002:a05:600c:22d4:b0:3cf:82b9:2fe6 with SMTP id 20-20020a05600c22d400b003cf82b92fe6mr25768953wmg.8.1672329680853;
        Thu, 29 Dec 2022 08:01:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/10] go: update 1.19.3 -> 1.19.4
Date: Thu, 29 Dec 2022 17:01:05 +0100
Message-Id: <20221229160110.255775-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175111

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/go/{go-1.19.3.inc => go-1.19.4.inc}   | 2 +-
 ...o-binary-native_1.19.3.bb => go-binary-native_1.19.4.bb} | 6 +++---
 ...cross-canadian_1.19.3.bb => go-cross-canadian_1.19.4.bb} | 0
 .../go/{go-cross_1.19.3.bb => go-cross_1.19.4.bb}           | 0
 .../go/{go-crosssdk_1.19.3.bb => go-crosssdk_1.19.4.bb}     | 0
 .../go/{go-native_1.19.3.bb => go-native_1.19.4.bb}         | 0
 .../go/{go-runtime_1.19.3.bb => go-runtime_1.19.4.bb}       | 0
 meta/recipes-devtools/go/{go_1.19.3.bb => go_1.19.4.bb}     | 0
 8 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.19.3.inc => go-1.19.4.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.19.3.bb => go-binary-native_1.19.4.bb} (78%)
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
similarity index 78%
rename from meta/recipes-devtools/go/go-binary-native_1.19.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.19.4.bb
index 1eed2cde41..8dc8bdf8e2 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.19.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.19.4.bb
@@ -9,9 +9,9 @@ PROVIDES = "go-native"
 
 # Checksums available at https://go.dev/dl/
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "74b9640724fd4e6bb0ed2a1bc44ae813a03f1e72a4c76253e2d5c015494430ba"
-SRC_URI[go_linux_arm64.sha256sum] = "99de2fe112a52ab748fb175edea64b313a0c8d51d6157dba683a6be163fd5eab"
-SRC_URI[go_linux_ppc64le.sha256sum] = "741dad06e7b17fe2c9cd9586b4048cec087ca1f7a317389b14e89b26c25d3542"
+SRC_URI[go_linux_amd64.sha256sum] = "c9c08f783325c4cf840a94333159cc937f05f75d36a8b307951d5bd959cf2ab8"
+SRC_URI[go_linux_arm64.sha256sum] = "9df122d6baf6f2275270306b92af3b09d7973fb1259257e284dba33c0db14f1b"
+SRC_URI[go_linux_ppc64le.sha256sum] = "fbc6c7d1d169bbdc82223d861d2fadc6add01c126533d3efbba3fdca9b362035"
 
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
2.30.2


