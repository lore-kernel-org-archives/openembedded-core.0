Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C2FC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 18:33:33 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.652.1657737206625771523
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=chdJVr5l;
 spf=pass (domain: gmail.com, ip: 209.85.219.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id l2so5448596qvt.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 11:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZ3sXGrX1t29l5IZIY6+DKCQpZYLsBwyfn3AOUBHqKk=;
        b=chdJVr5l1qGQr0CeFMiwbGnVbkOOsOIYhGLkd83JZF4kOGObe4jG/+co53gAcrFOgo
         wuNsOK8POIczs0lnkWPzIvuNIN5r16+GUSp28JqYHteZIlCV3dBkqnxoPOdNth6WegWT
         8M0nO6miZWNiOZMbI9gmtu8NHxrWsdmvDHOpvWGoMTiNSfZSrjG2MLBd4Vo4dqetBBLA
         aRlJQW/OfM1RB84SuHh9/XrgJoQiRI4RJ7bl0YrithiTtjBaVfeRbKpT+ULfrGddkT4u
         7f9B0oSgOpVQnXOBsjLWjDe97Acqj86y7nigF1qdbdIY9naCBg+KUYuHJc9i848X9G78
         zJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dZ3sXGrX1t29l5IZIY6+DKCQpZYLsBwyfn3AOUBHqKk=;
        b=AhvkgUk0sln7ysKdtLmy3mVN2LNWeU2Ny603DjvFjnghekWO28w+scEsdf3cYs09pV
         lBu6Ugi5fPWgRx0oLjTIvR2uk4FRK9N4hsQTcIAgbhoRo4Fr6+/gQGgXwQzI5QOhkRpB
         oJQiuiro8nO3+ZpHt+6zhwAgRs+rX5K/sOn9GzKe2N/VvvcdDT+a1uf6hsZZh/DNYNPk
         NeDXc2QMGni48lfdziy8613C/osYMIcDBRtsToEfmSU43HUXHCsJxLyZPoxkaDYnILLN
         vMUsjX7sYRVMIQvFBi6B+vq9+v/1+IRXqs7IqpQgRZ238DANRD6FaM4JJu7tD3qRuszb
         MFaw==
X-Gm-Message-State: AJIora+jKFDPgEC+DqDIvPjUUsmsVLbnHfppf90+fRWRQ1ZVqS1Cmmee
	DVw00PyZIkfjD8snMZVyqgg=
X-Google-Smtp-Source: 
 AGRyM1us9sKyVgCRgEyhWVIsjOutqhwpZGOMVtrru7bb4NcDm4AAkQtHkqc8lv2rK24PqOQJJAF43A==
X-Received: by 2002:a05:6214:c81:b0:46e:4f35:b097 with SMTP id
 r1-20020a0562140c8100b0046e4f35b097mr4421078qvr.50.1657737205528;
        Wed, 13 Jul 2022 11:33:25 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 a23-20020ac87217000000b0031eceadc86fsm736851qtp.81.2022.07.13.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 11:33:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/5.10: fix buildpaths issue with
 gen-mach-types
Date: Wed, 13 Jul 2022 14:33:22 -0400
Message-Id: <20220713183323.24706-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 18:33:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167981

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    80f5207b5abd tools: use basename to identify file in gen-mach-types

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index a695740976..c705b7c07a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f481ff6adf4be55c3ab89d0cf7243bbca69205c9"
+SRCREV_machine ?= "2f72685aa16ee5e1c8c53df03457b223a6996540"
 SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 41cad3d37e..6336ef544f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "cab1bb0e702f93b16762fc560d6be582fbf86a6a"
-SRCREV_machine ?= "5239dc7bbd53a3d4d5e31f8631612c2eb6cee0b8"
+SRCREV_machine:qemuarm ?= "3b951d9995d83be4e2985d6aa904d59cb9ac7692"
+SRCREV_machine ?= "f2b78db2b548501a7b0b17f76b9ee2f09978fb30"
 SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 94b3dd2473..d8bda5657b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -15,16 +15,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "952586297dec710cba21ccf7f6fe4a1aadde0a5d"
-SRCREV_machine:qemuarm64 ?= "268aa738ea2454a1293dcb6c829c88552a5768d2"
-SRCREV_machine:qemumips ?= "bb9cabbe92165b556329cb0eed12ab67d2dee7a7"
-SRCREV_machine:qemuppc ?= "88ee9e4c24d32b6d0ec90756f0c7729954d3feae"
-SRCREV_machine:qemuriscv64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemuriscv32 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemux86 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemux86-64 ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
-SRCREV_machine:qemumips64 ?= "1a760ff71146a87cb5b7de87aed88db07a907ef1"
-SRCREV_machine ?= "4d201ec392f149ecce321186ea5494a6e25e28f4"
+SRCREV_machine:qemuarm ?= "8b54878acc1161bdcfa3a1153cb2fff39c675b89"
+SRCREV_machine:qemuarm64 ?= "2db48159f4444dcfa0c0dab5804769ea528bb6ed"
+SRCREV_machine:qemumips ?= "fc5fb9c35b8c52a3b1b2348a56237b6f1bb7fc6b"
+SRCREV_machine:qemuppc ?= "736b1667a61f21d7a1b8c88e8cedb648e79e687b"
+SRCREV_machine:qemuriscv64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemuriscv32 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemux86 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemux86-64 ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
+SRCREV_machine:qemumips64 ?= "2105a97021e3d0c565d84947e5cd45dd77be07e3"
+SRCREV_machine ?= "80f5207b5abddf0dae8eeaa5e3bcfe0e23538e62"
 SRCREV_meta ?= "2f79722c50ad61cf055b40e8ba6d6f48e8dc6db0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-- 
2.19.1


