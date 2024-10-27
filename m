Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF14D10C1B
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 10:43:42 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.27519.1730025817956064959
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 03:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rd3JpFdb;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb49510250so33022841fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 03:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730025816; x=1730630616; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzZsmEhB3rNU7V30Dk9TM6DiEt0mouUp/JooeZqPx8o=;
        b=Rd3JpFdbDa5+ia4bdSI51onAyZNo5fvdnVKiE8MbLD0XhsEJfLgQ/tNUHtduHp4GBi
         xc7UOiFKzG0iZK7SgfOK8Ihz+G6pHehvvmvqmN2wedhL9synJJcMovtnjui/yfJKAdOV
         Psyrphk5IhTniJrdO1rCYiwsh+wBCAgMURysm4tZNtU62ipIfzMnsSgJJ+LAsJ1HHUSc
         iGKMKviu74fOYMQl4qpX3k2GZah49n91tJ+prWLAiR9sL79jecgJl3PSeV/FavaLqzR4
         tmPDRD0hzLeat0SdJYUqFAd+5BTikVuJ8sYQbfxfLNydrHyn2wJfRkSD5mG1TewOoTCD
         Rn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730025816; x=1730630616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzZsmEhB3rNU7V30Dk9TM6DiEt0mouUp/JooeZqPx8o=;
        b=RqCZxKMHzmKWaDQfUSLmQ7rsdHaCkHJ4c1WjnbthasoX6j3vscxBz//9Re6lfYgyU2
         UuoEhS7h+dr0tLkC75dDP/naPPYmE3XmOzXSzaSN1M2XnCbtlDy6iwk44pPpqEJSEHZM
         wcVvDA1QKTcibI+ErCxPa/ozDkW8J/vi9ubMmaC0FP5R1h3RGkaGRzXe1gwCLOUOzelF
         W0UMUVnA0w7WcJp4Gavlx4lt3Bfck9nr8mnRPlfH/1hjG7a1s6EklHB5PQIReiq/mNfb
         c3aASoIdR7ZZfSohWz41JavkMX4ir8c3ZWfd9akp9lhMdzyVmJFRy50GdFMMWPqJ1Orc
         jkKA==
X-Forwarded-Encrypted: i=1; AJvYcCXToNg179dCPWcaEjTqGyqSwME0CB7DZNXme1zTwLCPl+73fe4+SqbuRjTYS+tLZecy5P6WzJQ3LDBRKWF00Or18w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+7ErHDaRGjcusgZtgejzU/RE523GlnuoK930f8jgvuk6wbinF
	B3OC9fl5xzVnuuLExo74w0VQjFRJ6ID1/GPE2DlbAoqvnXf16lKzvUcQICut
X-Google-Smtp-Source: AGHT+IEz+NTRnrhTsL6WXQlgRdUEulB8dWjBz1OO3hEr7mpQZ1HBL4COLmMVyUd7Id5CEIu/2vEZQA==
X-Received: by 2002:a2e:9fca:0:b0:2fa:cd7e:3b40 with SMTP id 38308e7fff4ca-2fcbdf76eefmr13513141fa.11.1730025815640;
        Sun, 27 Oct 2024 03:43:35 -0700 (PDT)
Received: from peterliu-Precision-5680.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4617007sm8089771fa.126.2024.10.27.03.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 03:43:33 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: ross.burton@arm.com,
	openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH V3 3/3] meta: support tar.zst SDK_ARCHIVE_TYPE
Date: Sun, 27 Oct 2024 11:43:18 +0100
Message-ID: <20241027104318.8326-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241027104318.8326-1-liu.ming50@gmail.com>
References: <20241027104318.8326-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206396

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
index 8368a81196..a5c5d0444e 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -255,6 +255,12 @@ if [ @SDK_ARCHIVE_TYPE@ = "zip" ]; then
     else
         rm sdk.zip && exit 1
     fi
+elif [ @SDK_ARCHIVE_TYPE@ = "tar.zst" ]; then
+    if [ -z "$(command -v zstd)" ]; then
+        echo "Aborted, zstd is required to extract the SDK archive, please make sure it's installed on your system!"
+        exit 1
+    fi
+    tail -n +$payload_offset "$0"| zstd -T0 -dc | $SUDO_EXEC tar mx -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 else
     if [ -z "$(command -v xz)" ]; then
         echo "Aborted, xz is required to extract the SDK archive, please make sure it's installed on your system!"
-- 
2.43.0


