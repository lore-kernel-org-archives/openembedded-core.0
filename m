Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2EF1CDDE7D
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 15:11:42 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.11705.1729696298204481493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 08:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GSoXtWHk;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a99f646ff1bso829590666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 08:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729696296; x=1730301096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfMGMEa2xg/EQ3Sic8skDGmWwVjoMfpbXE0OCQKjpr8=;
        b=GSoXtWHkx2l9qKoe1APawOrERQX3xuoP2P2sHhKnAIpo3ZMrVBz9f0AC2/l6XmTsFQ
         HqpnyvZjTXnGYfdSMdqyAtToGLDTR5BNfJ4u/0OUnPZDSTuL+KYDn6DfC/+fD0qhFHAj
         z3sWY4/u+06o7OSzQp+AT4wnwUICmYNcn4o9lFJ3wSRHNG6XxuWBHp7Tbk9J1rEdx3eH
         BcPyF05/7xawEYquphDANFDr/mYw8p9uWEaP4uSORHRDARUEXo5cP/P/orE6X0sBzk9N
         U3bF+eIXnJaBKyO2oPk2kG6woP9anC0IecTi05ULgqlgw8o5fZRi5vBNW4h3W7bUGqtQ
         qwRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729696296; x=1730301096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfMGMEa2xg/EQ3Sic8skDGmWwVjoMfpbXE0OCQKjpr8=;
        b=RZjDrSGnJdSRPFsk7BXr8hSshDVayblmJAZ8LnlaRvYT84KfEpheM0PKGpeqmRsldm
         pXVs4SD+YNxueDk6Yd1Xip89jTXQrVolKl24Pl2R+naLIBXFBXN/ab2QDq9M7bUrJDux
         DrbEjFM4maYt92s05O9oxH300kKqJJ1y6laHdDlWL7o5Ipa3B6EZ2NaQcnNeVOJ1MsCO
         B/2bpf2Q2KXcr+viyyH75de4OXRbJE3jtUQzAeZZ3C64+B6Jp8lLVq4Dp/TsX2aj/j/y
         RWoc9jfGMdFtvIP9hPU1m1OPVJBsgC06yJa4sQ1v1Jc5+sYnMnM8G0IOtZHwrWihzNd0
         +WPA==
X-Gm-Message-State: AOJu0YzyUAUFsPu83S0GTQflSWK8V8GsZQB8vzDWRWxslsP/rpNrLw+H
	BRZA2NxEbjSTDxkv7dT5vPWILbe3Lb3l6lPmZku0Ii6GrVvOI4A6EoTB+Q==
X-Google-Smtp-Source: AGHT+IHrWqqO0tI6sCsqmoia2qSvI+F87dA2cxU+rbmfqasxjR1L6L0q9Uxgu90svbfnT7mE7dwdvw==
X-Received: by 2002:a17:907:960b:b0:a9a:e2b:170a with SMTP id a640c23a62f3a-a9abf52b269mr311589566b.0.1729696295527;
        Wed, 23 Oct 2024 08:11:35 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6312sm489090566b.2.2024.10.23.08.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 08:11:33 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V2 2/2] meta: support tar.zst SDK_ARCHIVE_TYPE
Date: Wed, 23 Oct 2024 17:11:27 +0200
Message-ID: <20241023151127.3611757-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023151127.3611757-1-liu.ming50@gmail.com>
References: <20241023151127.3611757-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 15:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206249

zst is much faster than the default xz, test result on my Precision
5680 machine:

Installing a tar.xz SDK takes 37 seconds while tar.zst only takes 17
seconds.

Let's introduce support for tar.zst.

Also add a sanity check for supported archive types.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 12 ++++++++++--
 meta/files/toolchain-shar-extract.sh          |  6 ++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 16013d5872..031c65f05f 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -84,6 +84,7 @@ SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
 SDK_ZIP_OPTIONS ?= "-y"
 SDK_7ZIP_OPTIONS ?= "-mx=9 -mm=BZip2"
 SDK_7ZIP_TYPE ?= "7z"
+SDK_ZSTD_COMPRESSION_LEVEL = "-17"
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {
@@ -95,9 +96,16 @@ python () {
     elif d.getVar('SDK_ARCHIVE_TYPE') == '7zip':
        d.setVar('SDK_ARCHIVE_DEPENDS', 'p7zip-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; 7za a -r ${SDK_7ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_7ZIP_TYPE} .')
-    else:
+    elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.zst':
+       d.setVar('SDK_ARCHIVE_DEPENDS', 'zstd-native')
+       d.setVar('SDK_ARCHIVE_CMD',
+         'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | zstd -f -k -T0 -c ${SDK_ZSTD_COMPRESSION_LEVEL} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+    elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.xz':
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
-       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+       d.setVar('SDK_ARCHIVE_CMD',
+         'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+    else:
+        bb.fatal("Invalid SDK_ARCHIVE_TYPE: %s, the supported SDK archive types are: zip, 7z, tar.xz, tar.zst" % d.getVar('SDK_ARCHIVE_TYPE'))
 }
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 9b72499ccf..208afaa4ae 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -255,6 +255,12 @@ if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
     else
         rm sdk.zip && exit 1
     fi
+elif [ @SDK_ARCHIVE_TYPE@ = "tar.zst" ]; then
+    if [ -z "$(which zstd)" ]; then
+        echo "Aborted, zstd is required to extract the SDK archive, please make sure it's installed on your system!"
+        exit 1
+    fi
+    tail -n +$payload_offset "$0"| zstd -T0 -dc | $SUDO_EXEC tar mx -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 else
     if [ -z "$(which xz)" ]; then
         echo "Aborted, xz is required to extract the SDK archive, please make sure it's installed on your system!"
-- 
2.43.0


