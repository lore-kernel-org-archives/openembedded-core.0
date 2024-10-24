Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C6DACE8E86
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 14:48:58 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.16421.1729781331184409611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 07:48:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=drfWS/7Q;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37ece998fe6so111930f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729781329; x=1730386129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCKQWGarc/I1TFQnt2IPnyOeVWDQO6XF3STVfKtNA8o=;
        b=drfWS/7QSWSmKalOrlwRQ76WbTTOQd0D0juzeAaVDdVHvUst1hkMueVDo/mCNqMPzm
         ov1BO/KS9tjKegaSDgSCjOtPQod97XzqucdoCQisRwbRr51hDLDLr1zz+jEpnCCBkE6A
         EPG2VuAW3NPC3WdjYE+oqg4fLdAy7vOOpuSO3e72qshvtYnPS1alr/F9ngHCS2R/vaV7
         6SmETgMFxKQIioRGJLxGr0j3dtSu2FehvVoGc3nvxroeJlIDIxxeSv3cDVhAK1fb5bVk
         b6XwrgEME/W85gnI8F6wnYKaCbnLhTm8f0CHVYCg0uSx8WO16bh5D+OUGLy1dRcjKk8A
         ehGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729781329; x=1730386129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCKQWGarc/I1TFQnt2IPnyOeVWDQO6XF3STVfKtNA8o=;
        b=AFDdwfpXjPS/U+r9eol6qMlmLDqN5FTodQJIoYvW1IDB4qbgXQ/fabttutBMZJPeFN
         5J1mSx2oBKCcyRKXz3WKKlx2w4U8g6fjRyvLH4iHn1paPhDXBg/h+XW8CvOGGMPFzIx6
         DIH8pXcpPF1O6w3AVyCYlK1HbJzYIztcCK7EhG3IqLOCT417M80Ob51PEooMgJdY3/Q8
         1dX5UaC2olTsibN9AcEuOXRp0jnTPZdNcF4lKonYdkwhiNYgmS3443Exh0FOHaPnnvKE
         HvcuU90WsJbpyIRsSWGceAayqPqoJZSMsOD0jCf+9qH7AUJyZSwiPhwtJ2r9r6UyuWtM
         El9A==
X-Gm-Message-State: AOJu0YxdwoFe0643VQqzm+uK/XBlsyCgd7b3peNQck5WKg6PR45gBgDE
	vroTXYDJ/RyEBmhMLX6TY423BLfyIou7AornKEulHalaBiPxM4QBmadJdw==
X-Google-Smtp-Source: AGHT+IH0mXVvg/WckVPXc0+U2gFQtN2MhpWjjUq0pec3nVAeRHv67rRfa+5KKsnHaNJELq6w/SC0Gg==
X-Received: by 2002:a5d:47c2:0:b0:374:cc10:bb42 with SMTP id ffacd0b85a97d-37efcef323fmr2063106f8f.2.1729781328832;
        Thu, 24 Oct 2024 07:48:48 -0700 (PDT)
Received: from hbox.local (178.72-31-62.static.virginmediabusiness.co.uk. [62.31.72.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a583edsm11459790f8f.49.2024.10.24.07.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 07:48:48 -0700 (PDT)
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sreejith Ravi <sreejith.ravi087@gmail.com>
Subject: [PATCH] packagedata.py : Fix RDEPENDS Version issue with AUTOINC
Date: Thu, 24 Oct 2024 15:48:45 +0100
Message-ID: <20241024144845.43504-1-sreejith.ravi087@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 14:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206299

Currently, RDEPENDS for -staticdev and -dev is set using EXTENDPKGV
in meta/conf/bitbake.conf:
----------------------------------
EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
DEV_PKG_DEPENDENCY = "${PN} (= ${EXTENDPKGV})"
RDEPENDS:${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
----------------------------------

During the do_package task, AUTOINC is replaced in PKGV
(via package_setup_pkgv), which is used for creating the package name.
However, Yocto sets RDEPENDS with PKGV during the recipe parsing stage,
resulting in the RDEPENDS field in the IPK control data containing AUTOINC.

As the IPK name is generated with the updated PKGV, but the version in
RDEPENDS still uses AUTOINC, this mismatch leads to installation failures.

Example: libnsl
install libnsl-staticdev throws the error,  nothing provides
libnsl-dev = 1.2.0+gitAUTOINC+4a062cf418-r0
----------------------------------
IPKs available:
libnsl2_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-src_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-dbg_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-staticdev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk
libnsl-dev_1.2.0+git0+4a062cf418-r0_armv7at2hf-neon.ipk

control data: libnsl-staticdev
Package: libnsl-staticdev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl-dev (= 1.2.0+gitAUTOINC+4a062cf418-r0)
Provides: libnsl2-staticdev
Source: libnsl2_git.bb

control data: libnsl-dev
Package: libnsl-dev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl2 (= 1.2.0+gitAUTOINC+4a062cf418-r0), libtirpc-dev
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
Provides: libnsl2-dev
Source: libnsl2_git.bb
----------------------------------

This patch fixes the RDEPENDS versions set using EXTENDPKGV in the -dev and
-staticdev packages. It replaces AUTOINC before generating the package control data.

Updated control data:
----------------------------------
Package: libnsl-dev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl2 (= 1.2.0+git0+4a062cf418-r0), libtirpc-dev
Recommends: gcc-runtime-dev, glibc-dev, libtirpc-dev
Provides: libnsl2-dev
Source: libnsl2_git.bb

Package: libnsl-staticdev
Version: 1.2.0+git0+4a062cf418-r0
----
----
Depends: libnsl-dev (= 1.2.0+git0+4a062cf418-r0)
Provides: libnsl2-staticdev
Source: libnsl2_git.bb
----------------------------------

Signed-off-by: Sreejith Ravi <sreejith.ravi087@gmail.com>
---
 meta/classes-global/package.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 6cd8c0140f..066a7ff835 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -325,6 +325,15 @@ python package_setup_pkgv() {
     # Adjust pkgv as necessary...
     if 'AUTOINC' in pkgv:
         d.setVar("PKGV", pkgv.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
+
+    # Adjust dependencies that are statically set with EXTENDPKGV
+    vars = ["RDEPENDS","RPROVIDES","RRECOMMENDS","RSUGGESTS","RREPLACES","RCONFLICTS"]
+    packages = d.getVar('PACKAGES').split()
+    for var in vars:
+        for pkg in packages:
+            val = d.getVar("%s_%s"%(var,pkg))
+            if val and 'AUTOINC' in val:
+                d.setVar("%s_%s"%(var,pkg), val.replace("AUTOINC", "${PRSERV_PV_AUTOINC}"))
 }
 
 
-- 
2.43.0


