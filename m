Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40168C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 17:06:39 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.728.1634317598268998021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:06:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gtsST7b+;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso2869786wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=41vS1YEL2DO64BIrSL8TGKIF950z7esOQeontjpP8f0=;
        b=gtsST7b+9ZNrHWwCGsatKT6sKk7ss7OR/WQ4Oo19SQEjBHIs/VzjYpaQfYXbxqqRkZ
         y0Nc8Wgdzr7A/zuUcDUsNCTWtulbN+RXecEG3CNO+yv9gG/lJhWPP2++2+6DxUFgmvc5
         WTXbwUJpy20qZVHSfltjs7OdKTVDmT2Q86bDPb7wqhRDTBKn8IaoH12BG8/UNMBdvMwO
         TfEuSrPxg/ZuU6U5ixgD8918sLV30Utm9lmYTKc4DwHs+S34EjLV3X+RHriH4PT/twPg
         EjhvQqDBQUG9m3GdDDfq0jt8/oyeg3/COYGJmWcAf6nyy6BXmvpnI6tg2OiaZFn/D96y
         0peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=41vS1YEL2DO64BIrSL8TGKIF950z7esOQeontjpP8f0=;
        b=0Srt03kYZRc919iAXSZUKwVZbvanEPWLW6P/wM+RKXRKlbvNdUZcZi/AiaBj8shUwI
         /WEbuZaY4eAGCO2X9h80sIqRDtoYdaYCfQO/1ZfWdx6wWqYRwjWLjbnId2v8jhtVIsYe
         yJcfIXupu1pTR/BS9XSb8Ej45cdZrY4pSIhAnX2ReZb1QXU35vUs5ijPGLsAr1lqNGlr
         jAB3aE6WhmmtbDn2OthUgCPTa8agxlqK4vBxpT5uYMp4bkJhcXI3fGjXpYL6DyvC6LQz
         gqYIcalqC52SbNFfpDt4ObPpNh9pafFH35q4Tm5i6U2JW30rMm4RDTSMXSgTOWEhTXTi
         cIsg==
X-Gm-Message-State: AOAM530qenwyHHPUChEfVLYjDccE4pqH9Yt2xHcYyWyi1MAso2fm7L0B
	YKTb9azqMCgAilDMQB8E2/n1CSuzRr0=
X-Google-Smtp-Source: 
 ABdhPJwdme+lJxIZKsEJPCAN+rECCbRrkxg+I9TxW3GdLO/XS/N+IQ9hag8+3VmDYtUsss+N4JjEYg==
X-Received: by 2002:a1c:3584:: with SMTP id c126mr14026965wma.0.1634317596753;
        Fri, 15 Oct 2021 10:06:36 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 e1sm5669765wru.26.2021.10.15.10.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:06:36 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH] populate_sdk_base: add support for zstd compression (and
 default to it)
Date: Fri, 15 Oct 2021 19:06:30 +0200
Message-Id: <20211015170630.1069043-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 17:06:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157004

This allows significantly faster do_populate_sdk() (5 min -> 3 min for
the sato sdk on my machine) and decompression, at the cost of SDK file
taking up more disk space.

If that's a significant concern, it's possible to increase the zstd
compression level or even go back to xz compression.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/populate_sdk_base.bbclass | 10 ++++++++--
 meta/files/toolchain-shar-extract.sh   |  9 ++++-----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 49e166e697..92a23e2325 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -50,17 +50,23 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 # Default archived SDK's suffix
-SDK_ARCHIVE_TYPE ?= "tar.xz"
+SDK_ARCHIVE_TYPE ?= "tar.zst"
 SDK_XZ_COMPRESSION_LEVEL ?= "-9"
 SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
 
-# To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
+SDK_ZSTD_COMPRESSION_LEVEL ?= ""
+SDK_ZSTD_OPTIONS ?= "-T${ZSTD_THREADS} ${SDK_ZSTD_COMPRESSION_LEVEL}"
+
+# To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip, tar.zst and tar.xz
 python () {
     if d.getVar('SDK_ARCHIVE_TYPE') == 'zip':
        d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
        # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
        # recommand to cd into input dir first to avoid archive with buildpath
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
+    elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.zst':
+       d.setVar('SDK_ARCHIVE_DEPENDS', 'zstd-native')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | zstd ${SDK_ZSTD_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
     else:
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 4386b985bb..4b8892af79 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -51,11 +51,6 @@ if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
 	fi
 fi
 
-if ! xz -V > /dev/null 2>&1; then
-	echo "Error: xz is required for installation of this SDK, please install it first"
-	exit 1
-fi
-
 SDK_BUILD_PATH="@SDKPATH@"
 DEFAULT_INSTALL_DIR="@SDKPATHINSTALL@"
 SUDO_EXEC=""
@@ -121,6 +116,8 @@ if [ "$listcontents" = "1" ] ; then
         else
             rm sdk.zip && exit 1
         fi
+    elif [ @SDK_ARCHIVE_TYPE@ = "tar.zst" ]; then
+        tail -n +$payload_offset "$0"| tar tv --zstd || exit 1
     else
         tail -n +$payload_offset "$0"| tar tvJ || exit 1
     fi
@@ -249,6 +246,8 @@ if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
     else
         rm sdk.zip && exit 1
     fi
+elif [ @SDK_ARCHIVE_TYPE@ = "tar.zst" ]; then
+    tail -n +$payload_offset "$0"| $SUDO_EXEC tar mx -I "pzstd -p 8" -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 else
     tail -n +$payload_offset "$0"| $SUDO_EXEC tar mxJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 fi
-- 
2.20.1


