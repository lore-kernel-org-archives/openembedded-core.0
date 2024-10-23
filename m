Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D49CDDE64
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 11:11:40 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.6214.1729681892730173187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 04:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j/CIkMcv;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: liu.ming50@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso802429566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729681891; x=1730286691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+ip9qCC/q5H0Xj4Mqo3oY2PNk2r/BVr6y6RBfsfx4M=;
        b=j/CIkMcv1MEHczm8ouTUSbW4fj88b/2BgVPv62h2tH6zEOn9fNfnyKRM/Z/iw0PLx2
         bgR5Fz4/1oeEjId9Vec1foqt/OvZzVlwgU5lIh/spQk8kbnE/Z6NMNVktoBNEUYElwkI
         +DbXKnJwDgJ5SFNpb+NAFU81NG1Zk4yVJEndlLvekV/FluvVXqG1qQ1iTTRoFcyoQLJv
         1cGWMQii08cetBiumOZysyid69hwr5xpSs3Phzl+kp5RyoDXP8AOiyH1RfYPN+qC4Nuk
         qKSyblW0+mNVtUZgq9UTXgirVzCDOgnkhGqbjsdWTcB073RVLSlKZJqzT8MA7UBnxWp5
         3CWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729681891; x=1730286691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+ip9qCC/q5H0Xj4Mqo3oY2PNk2r/BVr6y6RBfsfx4M=;
        b=xNN049G29ZGn66x7ITMc6dZSEpTY7pXHiJRgktNvFBa8okNCq68EFLak9zgnxJtB7J
         bD25Hq8nIpX1dF8L3EOBKbXar4pv1qQseps/G8y1CmgkzPplvwz3ZfiCBlp2Fdy8a3FH
         GKjC9XYkRRju0I5lgrwDpl1dbNun6UzJ4Z+9t/3nsrsXVysfnFk666QWP04aV9mndvmM
         NWxD96TpCTXefA+hwRBN6NMXrN5LzXiQIoxcVQl9UEQpVNtSr+dXFhcxw93dvrp802jL
         0LNr3dKfsnOjynaJNz54mHvXy3/aqkuIoBiWvAFoS5xXcKL3pvdV9dD7XVOmwjEMlc9Z
         zN+g==
X-Gm-Message-State: AOJu0Yz5G+Q2oPT2kjOQb1pXRMTutwkFX6+XdYEvoLnsVQNR8mwDSjb2
	gzVjccQeg3Jr9EyqtnIVE8gCnM4WCMUZsH/WiKI5u2TBRgcueOKWjKbDqg==
X-Google-Smtp-Source: AGHT+IEFG8H0DZbhir/ixOEMOM7mgBPwmteH1G1c6FaEGDVptv3vu9pmDxFLEpP/mkj5qsvNhISHmw==
X-Received: by 2002:a17:907:a4c:b0:a9a:e9c:1d8d with SMTP id a640c23a62f3a-a9abf8664aamr180774766b.17.1729681890416;
        Wed, 23 Oct 2024 04:11:30 -0700 (PDT)
Received: from peterliu-Precision-5680.atlascopco.group (static-212-247-106-195.cust.tele2.se. [212.247.106.195])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6267sm463392366b.32.2024.10.23.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:11:29 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH 2/2] meta: support tar.zst SDK_ARCHIVE_TYPE
Date: Wed, 23 Oct 2024 13:11:21 +0200
Message-ID: <20241023111121.3437045-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023111121.3437045-1-liu.ming50@gmail.com>
References: <20241023111121.3437045-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 11:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206197

zst is much faster than the default xz, test result on my Precision
5680 machine:

Installing a tar.xz SDK takes 37 seconds while tar.zst only takes 17
seconds.

Let's introduce support for tar.zst.

Also add a sanity check for supported archive types.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 8 +++++++-
 meta/files/toolchain-shar-extract.sh          | 6 ++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 16013d5872..562f80d211 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -84,6 +84,7 @@ SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
 SDK_ZIP_OPTIONS ?= "-y"
 SDK_7ZIP_OPTIONS ?= "-mx=9 -mm=BZip2"
 SDK_7ZIP_TYPE ?= "7z"
+SDK_ZSTD_COMPRESSION_LEVEL = "-17"
 
 # To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
 python () {
@@ -95,9 +96,14 @@ python () {
     elif d.getVar('SDK_ARCHIVE_TYPE') == '7zip':
        d.setVar('SDK_ARCHIVE_DEPENDS', 'p7zip-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; 7za a -r ${SDK_7ZIP_OPTIONS} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_7ZIP_TYPE} .')
-    else:
+    elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.zst':
+       d.setVar('SDK_ARCHIVE_DEPENDS', 'zstd-native')
+       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | zstd -f -k -T0 -c ${SDK_ZSTD_COMPRESSION_LEVEL} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
+    elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.xz':
        d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
        d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
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


