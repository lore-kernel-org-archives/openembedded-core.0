Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EF8C3F6B0
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.470.1660894068364851799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H8e8z1Yv;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k16so4155796wrx.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=APLQS2qRkjww//L6CrMTAEK7/sYWSBiaq5NqZhGYqA4=;
        b=H8e8z1YvnQgkY4g+BPQlSpXbQlygzQqlRJuJ8djE7NtLDTDi39sN5D7TSWYCNRTKU1
         3f2LWYqMfrLIs+wqFTMuDZOOP83kL1F7tIRozQhK4KldkXFOZTlRjFsYr4EWQ0WgV5Yv
         JAiznKeVSIwLHN+SWtt93466kSQeDj57KNcPpcAmeXEEEukViFyp+yjRwDBXzEOCQ3M/
         VbkHp/743Dpx/t1+6Ru75jcyWre+AtLVoSJMs1/O4iC5K6QpkLCT9yAHoq7Ccg30wqru
         VkvlgQOtARKdoYMADjsu3re+0iBJpLLNDtm8BcIkyxaBgwe4H+q2qyev92/6Xah5sOC0
         Nx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=APLQS2qRkjww//L6CrMTAEK7/sYWSBiaq5NqZhGYqA4=;
        b=A2G04VvjE18Ot+2GDA8HzaZHZLxc3DlKZaLCjhOnyejU97abjIEzRiuwReDAdrEegG
         PkemGiijPXSNzxdLjFvU16j1THeegIdB3K9BNq3J+V1vSnoZKfBpj1TFMCxQeVlQOHPm
         9nEnOvca6jLO1h8sfxVPRzj1JlA7X/ZYB8mgvSmQde+IZUsjzySDE973vLHVctb2UtrD
         IrO9TS6JUIplvO9y61Ua9Zov6sPh8VI6CVOJVRDgj7eXc2u2VllvjjEF/t0RCJAZRypy
         uoiHKjKo9OAHpuuHgboI1UwSWyvA0EptqnXCiDIef0hTlEp/7Rlc3P1GNf8eJOZBPmli
         LRfg==
X-Gm-Message-State: ACgBeo1VZd5B2TfogAXxO2jax40cGLPBI6ThzBFhdoVFg5bCsDH3Ud1l
	bhGylLokhhqX52cGqt/0Bh964yhEFps=
X-Google-Smtp-Source: 
 AA6agR6IXCWOWx2JlBIuqVSuyh8LGntZ4ZiPHrAkDgYtly9oX6tGzuyhslDpLYd653TGUsIcfxycGg==
X-Received: by 2002:a05:6000:1379:b0:21f:c4d:957a with SMTP id
 q25-20020a056000137900b0021f0c4d957amr3443597wrz.210.1660894066461;
        Fri, 19 Aug 2022 00:27:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/42] nfs-utils: upgrade 2.6.1 -> 2.6.2
Date: Fri, 19 Aug 2022 09:26:46 +0200
Message-Id: <20220819072727.2236928-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169572

/usr/sbin/rpcctl is written in python, so add it as a separate package
with python3 RDEPENDS.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../nfs-utils/{nfs-utils_2.6.1.bb => nfs-utils_2.6.2.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.1.bb => nfs-utils_2.6.2.bb} (95%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
similarity index 95%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
index bbed5aea59..57aac8c60b 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb
@@ -31,7 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            "
-SRC_URI[sha256sum] = "60dfcd94a9f3d72a12bc7058d811787ec87a6d593d70da2123faf9aad3d7a1df"
+SRC_URI[sha256sum] = "5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
@@ -70,7 +70,9 @@ PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmap
 # keyutils is available in meta-oe
 PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
 
-PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats"
+PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-rpcctl ${PN}-stats"
+
+FILES:${PN} += "${nonarch_libdir}/modprobe.d"
 
 CONFFILES:${PN}-client += "${localstatedir}/lib/nfs/etab \
 			   ${localstatedir}/lib/nfs/rmtab \
@@ -90,6 +92,9 @@ RDEPENDS:${PN}-client = "${PN}-mount rpcbind"
 
 FILES:${PN}-mount = "${base_sbindir}/*mount.nfs*"
 
+FILES:${PN}-rpcctl = "${sbindir}/rpcctl"
+RDEPENDS:${PN}-rpcctl = "python3-core"
+
 FILES:${PN}-stats = "${sbindir}/mountstats ${sbindir}/nfsiostat ${sbindir}/nfsdclnts"
 RDEPENDS:${PN}-stats = "python3-core"
 
-- 
2.30.2


