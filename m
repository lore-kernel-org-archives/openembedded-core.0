Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AC3C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 17:19:17 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web08.378.1657214352977225548
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: otavio.salvador@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id j65so1644865vsc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 10:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gPJ5uA6z95TScfa7IO9PfH66G5gRBDfHL7pSJrKqZ3U=;
        b=tY+RxqERBQaiFt1QhY7yn9CUBHacOZvTLEFXuhhFWA3uv1NgdqBQkeWoKTJ+mgHM1z
         SAjH6zU/e+SHvMPa0z9KijvQEYhsE1jhlELtT/CCxaU51srG7ctFMwyEQj5Xa0h55IfK
         sm3PHKXT0BAGBPBS3RKAApKnXv3THzHq5JHYVDxpw3ug3RAeCnpTTwC/repQzmtCTEcc
         AcH+vyVHQP8YJqcJSU26/0t+MxBM9PIXtu3MPgRgpqbWy5XljZUyfJAZMTfrcay15iDi
         YXUooFOTxcFr9T8H2T1hgjclEw9yMs7QQSBAel78YD4TuD9h8/MtrJsGqQx1C2cmkaqx
         okqA==
X-Gm-Message-State: AJIora/eJyeICipKrUZfBsGXlgpzOEV5eMhVF2G4V/5tFcFmECVOohXl
	gx3P0ehGP5+24oCyaQCb+F2jmZsxX+9UZLan
X-Google-Smtp-Source: 
 AGRyM1ueJdr1Ts2S/FEmNw5egMoJXV13tdW9Rmkvxnj9qV26VcOrkSAbeDltQ+7Zg/s9P3T9/ESuCQ==
X-Received: by 2002:a67:eb90:0:b0:356:511:ac46 with SMTP id
 e16-20020a67eb90000000b003560511ac46mr27541011vso.72.1657214351734;
        Thu, 07 Jul 2022 10:19:11 -0700 (PDT)
Received: from localhost (177-4-253-164.user3p.brasiltelecom.net.br.
 [177.4.253.164])
        by smtp.gmail.com with ESMTPSA id
 f3-20020a056102212300b00354582d95desm10427958vsg.4.2022.07.07.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 10:19:11 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] cargo-cross-canadian: Use SDK's flags during target
 linking
Date: Thu,  7 Jul 2022 14:19:03 -0300
Message-Id: <20220707171904.338441-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707171904.338441-1-otavio@ossystems.com.br>
References: <20220707171904.338441-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 17:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167795

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../cargo/cargo-cross-canadian.inc            | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
index 7fc22a4128..01ba151d0a 100644
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
@@ -39,6 +39,18 @@ do_compile:prepend () {
 	PKG_CONFIG_PATH="${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
 }
 
+create_sdk_wrapper () {
+        file="$1"
+        shift
+
+        cat <<- EOF > "${file}"
+		#!/bin/sh
+		\$$1 \$@
+		EOF
+
+        chmod +x "$file"
+}
+
 do_install () {
     SYS_BINDIR=$(dirname ${D}${bindir})
     install -d "${SYS_BINDIR}"
@@ -47,6 +59,9 @@ do_install () {
 	chrpath -r "\$ORIGIN/../lib" ${i}
     done
 
+    # Uses SDK's CC as linker so linked binaries works out of box.
+    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld" "CC"
+
     ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
     mkdir "${ENV_SETUP_DIR}"
     ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
@@ -58,7 +73,10 @@ do_install () {
 		touch "\$CARGO_HOME/config"
 		echo "[build]" >> "\$CARGO_HOME/config"
 		echo 'target = "'${TARGET_SYS}'"' >> "\$CARGO_HOME/config"
-        fi
+		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
+		echo '[target.'${TARGET_SYS}']' >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
 
 	# Keep the below off as long as HTTP/2 is disabled.
 	export CARGO_HTTP_MULTIPLEXING=false
-- 
2.36.1


