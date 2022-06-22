Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C0FCCA485
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 10:33:51 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.5618.1655894023217512764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GxRhd9xx;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id pk21so10129540ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A+fGtxr4RkgxEb75XnxxvVSugypcXzihlwaNr7IqCKs=;
        b=GxRhd9xxfm+IKfvkaJLdUNwSratkhzlskdy/TMTz4YUCsej2hL027z/4Rl3oaMPWqp
         UM9lsc2YgL2xOYpwWaNeYgKIjVbYs7vgrUOrAviGHUsGsmCgGXUXG4tnVJmUDFnSaLkj
         qqhrVChikwnA+fo1i1LoLbcvaa78cTEzYg3Ua7oN4W2PgZQCOyEheIH8KnANSFD/Yrgb
         dXSau4NSReWUok7J+lSDkm5AikIytnXrhmm+amFQd+ZNBDiJ7HnGw9q8ycqrccQxG6Os
         oBHTCCBzDi9IBs+bO9egYWSn9/szTARPigL+5CRa0eEexKo05CvWJbtKDxJ4MsTtJsu1
         RqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A+fGtxr4RkgxEb75XnxxvVSugypcXzihlwaNr7IqCKs=;
        b=Wuje6JaVt/yfq/eULol+wDG6SulIztfejmSNVDK1cIfC1tZ5hzbaeAm8CM7f/IOlHf
         ADrLgcpNfpGpc+9SKMKWQdXKzPCL2+t2yj7PvnWxMBMfrjOHVLJqFiQiDycFof3dkrFk
         /yUs0+PnNNYPF683jI9x7vMgszeITQSSzR741LMh0F3Byjrj5PR4XerLCQiFm3MyFkNy
         98wp+5Zy2rdrH0PtPvuNbep80gAy3Y1fl3+KdBhVeKUldsi+FzcyqjRJ/4ePhZDw8js6
         0BJIuzL6Mz3F+nCEAZCzEG6+Yx9/2GiDuSySYCSn83s5yLkV9tUyL/VDghGCIjUkVY33
         1a4w==
X-Gm-Message-State: AJIora8gaA+Skh9E1YBIGFnG2tRr552cBq+/mHzff0/lK4XFQSUnF6jt
	jf2QUu+mRN2wcCywlMPNkPNd4WMNBJWhTg==
X-Google-Smtp-Source: 
 AGRyM1u0nz+1o6C+LvMap7Yrwxn8AGer31+fL8hl+6AfF8SDzGeBDbe05SQsZsPEIu3u1K4drCJgew==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr2609035ejc.755.1655894021790;
        Wed, 22 Jun 2022 03:33:41 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 lb21-20020a170907785500b007219c20dcd8sm6315826ejc.196.2022.06.22.03.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 03:33:41 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 1/6] toolchain-scripts.bbclass: adjust
 toolchain_create_tree_env_script to better replicate (e)SDK
Date: Wed, 22 Jun 2022 12:33:07 +0200
Message-Id: <20220622103312.1098389-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 10:33:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167227

Specifically:
1. Place the environment setup file into $B and not into $TMPDIR,
so that the recipe using the class can itself better decide what to do with the file.

2. Use global, unified sysroots (provided through build-sysroots recipe)
and not recipe-specific ones, as this allows flexible on-the-fly management of what
libraries are available to build applications, without having to modify any
recipes, similar to eSDK 'extensible' part.

3. Add a few missing settings that have been added to SDK environment files.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/toolchain-scripts.bbclass | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 1d7c703748..e46d27ebc7 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -63,22 +63,27 @@ toolchain_create_sdk_env_script () {
 	toolchain_shared_env_script
 }
 
-# This function creates an environment-setup-script in the TMPDIR which enables
+# This function creates an environment-setup-script in B which enables
 # a OE-core IDE to integrate with the build tree
 # Caller must ensure CONFIG_SITE is setup
 toolchain_create_tree_env_script () {
-	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
+	script=${B}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
+	echo 'standalone_sysroot_target="${STAGING_DIR}/${MACHINE}"' >> $script
+	echo 'standalone_sysroot_native="${STAGING_DIR}/${BUILD_ARCH}"' >> $script
 	echo 'orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR}; cd $orig' >> $script
-	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
-	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
-	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
+	echo 'export PATH=$standalone_sysroot_native/${bindir_native}:$standalone_sysroot_native/${bindir_native}/${TARGET_SYS}:$PATH' >> $script
+	echo 'export PKG_CONFIG_SYSROOT_DIR=$standalone_sysroot_target' >> $script
+	echo 'export PKG_CONFIG_PATH=$standalone_sysroot_target'"$libdir"'/pkgconfig:$standalone_sysroot_target'"$prefix"'/share/pkgconfig' >> $script
 	echo 'export CONFIG_SITE="${CONFIG_SITE}"' >> $script
-	echo 'export SDKTARGETSYSROOT=${STAGING_DIR_TARGET}' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
-	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
+	echo 'export SDKTARGETSYSROOT=$standalone_sysroot_target' >> $script
+	echo 'export OECORE_NATIVE_SYSROOT=$standalone_sysroot_native' >> $script
+	echo 'export OECORE_TARGET_SYSROOT=$standalone_sysroot_target' >> $script
+	echo 'export OECORE_ACLOCAL_OPTS="-I $standalone_sysroot_native/usr/share/aclocal"' >> $script
+	echo 'export OECORE_BASELIB="${baselib}"' >> $script
+	echo 'export OECORE_TARGET_ARCH="${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_TARGET_OS="${TARGET_OS}"' >>$script
 
 	toolchain_shared_env_script
 }
-- 
2.30.2


