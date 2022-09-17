Return-Path: <liambeguin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC59ECAAA1
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 22:07:47 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.3333.1663452460255797423
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 15:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m1yWcO2i;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: liambeguin@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id g2so15385180qkk.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=K7LKWx/zzp0WX/svhDB4xsiNImVzNDH1w9kwsVPJUw8=;
        b=m1yWcO2iEy7yBEBJVQDtyuBGRSQkx2Ynso2VNnDbbUwUB6I52PpkNGwICZRJTc7Z4v
         krszuBQhKNna8EXf6ipA5EeS563tR2HSyECsjV3K6c+ZHK6vv4N2eY5AyFiFK9+HRucM
         7RMWvk464o81rjTjcgfuFxHembNemwMWv1uh5VXmKAGF3G2niEEqBjNoV5+6N59c8Kp4
         mRCcioj4fTeXe8VDdEr6sq49AIJEtJT+H9Rbyn4NSyd3m2WJKvyRvue/FMHaJ874E0AK
         OD19HYPtAckJHxEWua3+Q4OfkHDUITBXFCMHcV/mzWgxJITXYJwv1AJK9oqH/6FQ5Av7
         REuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=K7LKWx/zzp0WX/svhDB4xsiNImVzNDH1w9kwsVPJUw8=;
        b=wXl+8IRTnDh9ObVSE+MEo15khQ6Ajnh9PbQ/imJ7fUE5fg+esu5dNU6VmNjvq0AO8e
         5rYWbyG1O+Y/rlJcKe7taac0wOw6GeIoHgQWPFVn0GXkeX3ir4DJCoSlymqgyUt3hD4d
         ZRQ562kpYDcFO3jMWJvuiNRngr0V4MbOy0t/ganGX+huU3MxvWQJx87JnvJAYRRnpB6v
         oNX0uCgh0EVHEJ5mAj75bqq4wqA8mlfYEMCyZDFYWVIcQkcypWpypC7APLlzHfB/NV1S
         s60S36yk3Ftdqw1ZwNZ84bzNviFK09JFuaT3x0ZoJUlA6BFzl1EGNieCb2HddT1Uva1E
         nMLw==
X-Gm-Message-State: ACrzQf1oD4KGv8H8Kpcf+RUuT5VQ/enXB47EgG/OcV9EjD90titsDl/M
	L8e0QPbg2TRPOR7Ep1BnM2s=
X-Google-Smtp-Source: 
 AMsMyM6Wnr+c5hkH1yr+mbneIsQvuGk/+KM5tqxPK4hv6IHdO0oOJtPD6zqph7J76G70o02OArVvMw==
X-Received: by 2002:a05:620a:40d0:b0:6ce:bda8:e20a with SMTP id
 g16-20020a05620a40d000b006cebda8e20amr7941841qko.247.1663452459252;
        Sat, 17 Sep 2022 15:07:39 -0700 (PDT)
Received: from shaak.xiphos.ca (modemcable055.92-163-184.mc.videotron.ca.
 [184.163.92.55])
        by smtp.gmail.com with ESMTPSA id
 p17-20020a05620a22b100b006cdf38dd3f2sm8511164qkh.16.2022.09.17.15.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 15:07:38 -0700 (PDT)
From: Liam Beguin <liambeguin@gmail.com>
To: liambeguin@gmail.com,
	openembedded-core@lists.openembedded.org
Subject: [PATCH v1] meson: make wrapper options sub-command specific
Date: Sat, 17 Sep 2022 18:07:35 -0400
Message-Id: <20220917220735.4192854-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.37.1.223.g6a475b71f8c4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 22:07:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170842

The meson-wrapper adds setup options to facilitate cross-compilation.
The current options are exclusive to the setup sub-command and might
cause issues with other sub-commands.

Update the wrapper to make options sub-command specific.

Signed-off-by: Liam Beguin <liambeguin@gmail.com>
---
 .../meson/meson/meson-wrapper                 | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index c62007f5077e..fae9e167a325 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -13,7 +13,23 @@ fi
 # config is already in meson.cross.
 unset CC CXX CPP LD AR NM STRIP
 
+for arg in "${@}"; do
+    case ${arg} in
+    -*) continue ;;
+    *) SUBCMD=${arg}; break ;;
+    esac
+done
+
+case ${SUBCMD} in
+setup)
+    MESON_SUB_OPTS=" \
+        --cross-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
+        --native-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
+        "
+    ;;
+esac
+
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
-     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
-     "$@"
+    ${SUBCMD} \
+    ${MESON_SUB_OPTS} \
+    $(echo $@ | sed s/${SUBCMD}//)

base-commit: 09c1cac053c2892e3af3250cc6229e8da78e7a50
-- 
2.37.1.223.g6a475b71f8c4


