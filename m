Return-Path: <alb3rt0.m3rciai@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975DBC61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 09:04:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.15206.1700643847531449185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 01:04:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lT/EOkGW;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alb3rt0.m3rciai@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-32f7abbb8b4so4382117f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 01:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700643845; x=1701248645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C9VcyGIY4TVin+fEB91k6pdv3FODhzX6BQgcLrYRvVY=;
        b=lT/EOkGWpEEnA+JFSlmBbRFkp8m+/YYpFZiBSdEDw6Vfyd1SJxa/qLhh7TdNO2gmZw
         c6S2qNlaWud609GtQDaTJnLAUOjb1OwPVF+7mmTufuVNHqHpEj5GTDPaB7+PbJNrwraz
         SeEn3Sn8xdicghMtd6mcIvHB8qq/9fSxCaAYuDJ8Ql/IMKyXzcqxmd3m37Yx71pNG8Op
         wDPKSLBOEOjGqmpclby+H4d5OE0GQJyb4Garg/rS3QM/GtVCjBODo0HwwY9VLua37xko
         H4YFsEfJ6TXJMWKyskv1szqHk8P0he6VtsO7t7owzZaOwQeV9Cw7lmi0Hwc2+82hgIIf
         fQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700643845; x=1701248645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C9VcyGIY4TVin+fEB91k6pdv3FODhzX6BQgcLrYRvVY=;
        b=nQzMrFKESFvdaaBCZxwN0LGL4DX68UrQCpvq0VM/S2pGtbe0gxCbse0elmka5Du8GY
         VR4q39PXVlOruy0uDzn4hNhtCeAtm5u9Ve9ABTR54jMNe9n0Pnya6CTT4oFnABbR1SnT
         /iybujmZQEVs0b9AeFVlVypzvEaqKkSw+u9hA5qhz11QPe4JGv7Gc1/Jt8JDC2qiSFKl
         OInfM6KwbZhnfG1sFfSswD7hQ3OUxpFp125hjyVNVJs0vK0281rWeQHtbIZIEj9vMxTM
         KmioDeIbUypABcqSOLJUU2PMTtpI+ui5+9yHRuxaIUZCvUDmvFn/lrzk7ZfFVDf8G4zQ
         2Maw==
X-Gm-Message-State: AOJu0Yy5nYcclfgPMwXhT/NCznVINswvM2b8J7bfAyCflqK8G4NKMT7c
	67Pt2VpicfK6hQYSDugoPtITbtzbx2c=
X-Google-Smtp-Source: AGHT+IEWOSM/rOWCGXN3vStYZXqLX5DBzDN/R3DW2Y8rYMCiXkcTDf7VLhry/lbgCq3Ae/H4d/ePNg==
X-Received: by 2002:a5d:610c:0:b0:32d:8357:42dd with SMTP id v12-20020a5d610c000000b0032d835742ddmr941916wrt.68.1700643845218;
        Wed, 22 Nov 2023 01:04:05 -0800 (PST)
Received: from alb3rt0-ThinkPad-P15-Gen-1.it.abb.com (host-81-118-90-13.business.telecomitalia.it. [81.118.90.13])
        by smtp.gmail.com with ESMTPSA id x5-20020adfffc5000000b0032fb17c65desm16536350wrs.19.2023.11.22.01.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 01:04:04 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: alb3rt0.m3rciai@gmail.com,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] poky: kirkstone: eSDK: fix build-in eSDK environment file generation
Date: Wed, 22 Nov 2023 10:04:02 +0100
Message-Id: <20231122090402.7643-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 09:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191034

From: amerciai <alb3rt0.m3rciai@gmail.com>

- Following Setting up the Extensible SDK environment directly in a Yocto build
  https://docs.yoctoproject.org/4.0.14/sdk-manual/extensible.html#setting-up-the-extensible-sdk-environment-directly-in-a-yocto-build
  The generated environment file does not point to the
  correct sysroot folder, then the end user is not able
  to cross-compile by sourcing the file.

- The same for kirkstone-4.0.10

- By analyzing
  https://lore.kernel.org/all/20220622103312.1098389-3-alex@linutronix.de/T/#m7eadf6c722410f5b233ebba9fc700a895af9f052
  I found that changes apllied to
  meta/classes/toolchain-scripts.bbclass
  solve the issue.

Suggested-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index d735d434e6..ec50a1efa0 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -70,15 +70,23 @@ toolchain_create_tree_env_script () {
 	script=${TMPDIR}/environment-setup-${REAL_MULTIMACH_TARGET_SYS}
 	rm -f $script
 	touch $script
+	echo 'standalone_sysroot_target="${STAGING_DIR}/${MACHINE}"' >> $script
+	echo 'standalone_sysroot_native="${STAGING_DIR}/${BUILD_ARCH}"' >> $script
 	echo 'orig=`pwd`; cd ${COREBASE}; . ./oe-init-build-env ${TOPDIR}; cd $orig' >> $script
-	echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${STAGING_BINDIR_TOOLCHAIN}:$PATH' >> $script
-	echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
-	echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
+
+	echo 'export PATH=$standalone_sysroot_native/${bindir_native}:$standalone_sysroot_native/${bindir_native}/${TARGET_SYS}:$PATH' >> $script
+	echo 'export PKG_CONFIG_SYSROOT_DIR=$standalone_sysroot_target' >> $script
+	echo 'export PKG_CONFIG_PATH=$standalone_sysroot_target'"$libdir"'/pkgconfig:$standalone_sysroot_target'"$prefix"'/share/pkgconfig' >> $script
+
 	echo 'export CONFIG_SITE="${CONFIG_SITE}"' >> $script
-	echo 'export SDKTARGETSYSROOT=${STAGING_DIR_TARGET}' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${STAGING_DIR_NATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="${STAGING_DIR_TARGET}"' >> $script
-	echo 'export OECORE_ACLOCAL_OPTS="-I ${STAGING_DIR_NATIVE}/usr/share/aclocal"' >> $script
+
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
2.34.1


