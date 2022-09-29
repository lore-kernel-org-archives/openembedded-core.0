Return-Path: <liambeguin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3E82C32771
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 02:51:22 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.6224.1664419881236205334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FboMqeiQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.174,
 mailfrom: liambeguin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id u28so112112qku.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 19:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VY7sfGUD/5v67B5/yUiVdPr/oq5eUjec6ZrGHsUzBnY=;
        b=FboMqeiQQTZsuKGicyv9NTWXQeFSyPDSV9kz++ahreSBpvCsXUUaGltG6y+OYBJQTJ
         L3Q8kNK5kV7IN/LwhuFv8XldNE+agjlcuPQstAtQqlsYci9SLS3bBQ6wMc+AWU0Aypen
         JFb7n6PXqaLCUukL8cPVPZ1dX8lCL2jsTNn8GuHFG3odUFPxFDhmFeNL4S66/+TapzQh
         AR+kuH3P6Ee0nId7+x+PLDj2M88ScOLGYHuYJe/NQ47Ca6i+BUFq5vJreLtZziYmH3hm
         RI35iaijAPVW9eAMCLSbcyXBhcnUYo8UkyyB1kr5S9awk9QWi+sHxcwNwKw4++no5Xao
         tMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VY7sfGUD/5v67B5/yUiVdPr/oq5eUjec6ZrGHsUzBnY=;
        b=jIcIHrmnFzzHeorkK+w+nZOnK7XQ1uMppxGjueQbjtU7jz/UjHmcVhh+j6t/pTRkkJ
         +RY2VevB3DUZc89RgJhJTB9szndrxqgAoD71v8ndFflb4/J+JBA99coctqfCw8rHvjAU
         rPiA3GZJm6xhWQ7elksmNz1ZF8DgDo6hVkBn3Qv7u+ypG1+C0T6mNXFGn1M2YxrdlHve
         C/V1EGU36f7uHghU6HPwHN0zr1XQUABiFm9foFPS/Y0MBXa6WaC9zJpj/BtPoAPPM8Id
         CJPUoDr7slt178uS/5FGpVzGh9qPcDUpPqXbZdWi3IsPKMHnqhL2Pc0CDPwT464TTvfb
         1VKA==
X-Gm-Message-State: ACrzQf3/ytlLBb+lW7LsWMae19II7gKfsH7ZRxqFjqr3HXugyL4axUf+
	xqsTEgr0oiEtXJyHHRqB388=
X-Google-Smtp-Source: 
 AMsMyM7AaRBuzFJI3FecWBD/WGWG3ollKgS3dFLGFq4owAcEFyIEra90XRtdZFHrpOm9Qc1EW2saew==
X-Received: by 2002:a05:620a:2005:b0:6ce:3f31:e02d with SMTP id
 c5-20020a05620a200500b006ce3f31e02dmr774529qka.678.1664419880301;
        Wed, 28 Sep 2022 19:51:20 -0700 (PDT)
Received: from shaak.xiphos.ca (modemcable055.92-163-184.mc.videotron.ca.
 [184.163.92.55])
        by smtp.gmail.com with ESMTPSA id
 f7-20020a05620a408700b006ce3f1af120sm4909322qko.44.2022.09.28.19.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 19:51:19 -0700 (PDT)
From: Liam Beguin <liambeguin@gmail.com>
To: liambeguin@gmail.com,
	openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com,
	peter.kjellerstedt@axis.com
Subject: [PATCH v3] meson: make wrapper options sub-command specific
Date: Wed, 28 Sep 2022 22:50:56 -0400
Message-Id: <20220929025056.2799287-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.37.1.223.g6a475b71f8c4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 02:51:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171164

The meson-wrapper adds setup options to facilitate cross-compilation.
The current options are exclusive to the setup sub-command and might
cause issues with other sub-commands.

Update the wrapper to make options sub-command specific.

Signed-off-by: Liam Beguin <liambeguin@gmail.com>
---
 .../meson/meson/meson-wrapper                 | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index c62007f5077e..fca64a569299 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -5,7 +5,7 @@ if [ -z "$OECORE_NATIVE_SYSROOT" ]; then
 fi
 
 if [ -z "$SSL_CERT_DIR" ]; then
-    export SSL_CERT_DIR="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/"
+    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/etc/ssl/certs/"
 fi
 
 # If these are set to a cross-compile path, meson will get confused and try to
@@ -13,7 +13,20 @@ fi
 # config is already in meson.cross.
 unset CC CXX CPP LD AR NM STRIP
 
+for arg in "$@"; do
+    case "$arg" in
+    -*) continue ;;
+    *) SUBCMD="$arg"; break ;;
+    esac
+done
+
+if [ "$SUBCMD" = "setup" ] || [ -d "$SUBCMD" ]; then
+    MESON_SUB_OPTS=" \
+        --cross-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/${TARGET_PREFIX}meson.cross" \
+        --native-file="$OECORE_NATIVE_SYSROOT/usr/share/meson/meson.native" \
+        "
+fi
+
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
-     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
-     "$@"
+    "$@" \
+    $MESON_SUB_OPTS

base-commit: a2659cc2bf5d3f1cedf5c52c3b45e0427d40732d
-- 
2.37.1.223.g6a475b71f8c4


