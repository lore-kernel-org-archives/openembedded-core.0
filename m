Return-Path: <liambeguin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 040B8C07E9D
	for <webhook@archiver.kernel.org>; Wed, 28 Sep 2022 02:52:16 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.3601.1664333532697110389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MmE1vkyw;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: liambeguin@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id y2so7162828qkl.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 19:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=7kLb7sLIrpbhLC/VsuzHoqLotwQwUlP+ymC3qdxC868=;
        b=MmE1vkywrVyG19mhsv5Xc1SJY2CmHUzTi/DSoKSrdUcP6U0S/KbOM24N7SY4WA7mcD
         y1SHZTEHNlRR6f2bqKP271NkE4HRnY9UicjCtcjGuK3jfX+kznZosxcMQd5J2+NnIXyp
         UvOEJM8aPBhXnQ/iBwWqv/aD8UscKs2lGgd72JLP4J9jcOkkp3kncQ/DpW6v5aSgkskw
         0NEf9rXO6BC/JcF7uaHOB0N2daDf+IOItYd2qCS7a5JvoDiPUyUONk5mtZB8RKExk1B0
         ldqwuhb0Fge0SwnvxT0P6zpiG23/bB3Jg+jq8xXUGeCxPTJzh3MihGHDUMU3d9VEwiwV
         ugAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=7kLb7sLIrpbhLC/VsuzHoqLotwQwUlP+ymC3qdxC868=;
        b=yLSr35/naCKN1xgmNz2lhBGKQtA4wkTk3MdGPKv7wC4u5bbQYcK+K1uIJOIzoSF+/Y
         HYcfhloWJ8Ldg51YV8JtMPiqs/jeAV03LXR5mg/j1uLkipiiQ0BAt6qo0747G/fjRzXx
         UwS41GwX7r9QOv09FhdpgRvfk2rF/6O8KvxVk8wkTHMsKVBXfNAGgi1UBUCqZWIRYNdU
         TdZ5RzCwD87vfMM6qjl1863lNv8ppylFaizlQ03YJjDV4nxIR93DUERbKPpPevzgiX+V
         ToXoqTqFp5ntyc3UxIefexnbFBNhugU3sH/4jQ74KU6UKed8hcoImKJUiaPHOAGcn/FO
         oAOw==
X-Gm-Message-State: ACrzQf1x4TtwuiBlJXHjMjPwQdbLrKz55+6BaM5eveUjfBaVZ5hY6VPM
	qwKH401H8pUwyzwZ5lDkBhM=
X-Google-Smtp-Source: 
 AMsMyM40z21jqJ6UPSF1B39fjDfbpEKlcTJ4N9fgEQ9lslxypqMQkaIvcCOfF0aCGeChK9REaBhxsQ==
X-Received: by 2002:a05:620a:8014:b0:6ce:3dcf:9c32 with SMTP id
 ee20-20020a05620a801400b006ce3dcf9c32mr19339546qkb.766.1664333531753;
        Tue, 27 Sep 2022 19:52:11 -0700 (PDT)
Received: from shaak.xiphos.ca (modemcable055.92-163-184.mc.videotron.ca.
 [184.163.92.55])
        by smtp.gmail.com with ESMTPSA id
 g19-20020a37e213000000b006b949afa980sm1925009qki.56.2022.09.27.19.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 19:52:11 -0700 (PDT)
From: Liam Beguin <liambeguin@gmail.com>
To: liambeguin@gmail.com,
	openembedded-core@lists.openembedded.org
Cc: alexandre.belloni@bootlin.com
Subject: [PATCH v2] meson: make wrapper options sub-command specific
Date: Tue, 27 Sep 2022 22:52:05 -0400
Message-Id: <20220928025205.1286043-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.37.1.223.g6a475b71f8c4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Sep 2022 02:52:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171137

The meson-wrapper adds setup options to facilitate cross-compilation.
The current options are exclusive to the setup sub-command and might
cause issues with other sub-commands.

Update the wrapper to make options sub-command specific.

Signed-off-by: Liam Beguin <liambeguin@gmail.com>
---
 .../meson/meson/meson-wrapper                 | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson/meson-wrapper b/meta/recipes-devtools/meson/meson/meson-wrapper
index c62007f5077e..866dc33cf4be 100755
--- a/meta/recipes-devtools/meson/meson/meson-wrapper
+++ b/meta/recipes-devtools/meson/meson/meson-wrapper
@@ -13,7 +13,20 @@ fi
 # config is already in meson.cross.
 unset CC CXX CPP LD AR NM STRIP
 
+for arg in "${@}"; do
+    case ${arg} in
+    -*) continue ;;
+    *) SUBCMD=${arg}; break ;;
+    esac
+done
+
+if [ "x${SUBCMD}" == "xsetup" ] || [ -d ${SUBCMD} ]; then
+    MESON_SUB_OPTS=" \
+        --cross-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
+        --native-file="${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
+        "
+fi
+
 exec "$OECORE_NATIVE_SYSROOT/usr/bin/meson.real" \
-     --cross-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/${TARGET_PREFIX}meson.cross" \
-     --native-file "${OECORE_NATIVE_SYSROOT}/usr/share/meson/meson.native" \
-     "$@"
+    "$@" \
+    ${MESON_SUB_OPTS}

base-commit: a2659cc2bf5d3f1cedf5c52c3b45e0427d40732d
-- 
2.37.1.223.g6a475b71f8c4


