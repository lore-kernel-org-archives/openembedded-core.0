Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.9819.1585664146748957946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2020 07:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id t9so18364294qto.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2020 07:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=IPsLJgXN60liveEUYJaoKo8Xgv9XRp+ojW/Wx1av5tU=;
        b=UEOKJ2eMZgHhpWw2Kmj4u/to60mlrQ1ashgzGs9EBnJ7duoUw/0rNdRsY88n5EFlOT
         HXTpnBsLlnfd77oswiUeUuHjIFt5jXLw+JTFKQkzRvgFzgI9JimY7TmnqFb7QNICJE8W
         X4x3eBM1IzEklgr7QFmCPQOHVZWpXMD26+OfdghfjlBRjeaLTF6aBBsiGMTyD95Payuo
         kfeiu6HlKESCooJ8Nz5BrI4kRfxAQx6veshLfCfgMxG/ITgOw2LttGvxS9G6ffgBfBYa
         T3zhW22LvOm68bC97zyrwiEMhjXOv3UgR0mnSW4pIDoxzCOsE5oVhlQ5vRXRvYvXDRyv
         U2/w==
X-Gm-Message-State: ANhLgQ3U0IijtW3BhNZSP8zuUvXnlOx/gnMk6PnlRWpU9ni7yk8YnCmN
	XmY3Q+slr54XLlb8Dt2i3dF6x4u6tBQ=
X-Google-Smtp-Source: ADFU+vsYQoJtngedZIJ5eayNv8BU3UBcEPpUAQkSrKEM29mrVWQSunZzc3p9ySCF6G6H/3M3IIEgpQ==
X-Received: by 2002:ac8:22b9:: with SMTP id f54mr5364181qta.173.1585664145242;
        Tue, 31 Mar 2020 07:15:45 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.114.167])
        by smtp.gmail.com with ESMTPSA id d201sm12539348qke.59.2020.03.31.07.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 07:15:42 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] u-boot: Restore valid default environment for running system
Date: Tue, 31 Mar 2020 11:15:31 -0300
Message-Id: <20200331141531.985944-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

One significant change from previous OE-Core releases was the move from
u-boot-fw-utils to libubootenv which offers a generic and not machine
specific alternative. However, it is not fully functional as currently
we don't provide the default environment nor the required configuration
file to be used by it.

This change address this and include on the default u-boot.inc the
needed code to generate, install and deploy the default environment.

The side effect of this change are:

- new ${PN}-env
- u-boot-initial-env on deploy
- fw_env.config on deploy

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
This change is late in the cycle but it is critical in my opinion.

The lack of default environment as well as the configuration for the
tool is a regression from the previous release and this mitigates it.

 meta/recipes-bsp/u-boot/libubootenv_0.2.bb |  1 +
 meta/recipes-bsp/u-boot/u-boot.inc         | 54 ++++++++++++++++++----
 2 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index 7a7ec4c8856..89e0c4f8df7 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -23,5 +23,6 @@ EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
 PROVIDES += "u-boot-fw-utils"
 RPROVIDES_${PN}-bin += "u-boot-fw-utils"
+RRECOMMENDS_${PN}-bin += "virtual/bootloader-env"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 648298da0bf..e7e1ce10c62 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -122,6 +122,11 @@ do_compile () {
                             cp ${B}/${config}/${binary} ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX}
                         fi
                     done
+
+                    # Generate the uboot-initial-env
+                    oe_runmake -C ${S} O=${B}/${config} u-boot-initial-env
+                    cp ${B}/${config}/u-boot-initial-env ${B}/${config}/u-boot-initial-env-${type}
+
                     unset k
                 fi
             done
@@ -130,6 +135,9 @@ do_compile () {
         unset  i
     else
         oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
+
+        # Generate the uboot-initial-env
+        oe_runmake -C ${S} O=${B} u-boot-initial-env
     fi
 
 }
@@ -143,19 +151,26 @@ do_install () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -d ${D}/boot
-                    install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARY}
+
+                    # Install the uboot-initial-env
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${type}-${PV}-${PR}
+                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
+                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
                 fi
             done
             unset  j
         done
         unset  i
     else
-        install -d ${D}/boot
-        install -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
+        install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
         ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
+
+        # Install the uboot-initial-env
+        install -D -m 644 ${B}/${config}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${PV}-${PR}
+        ln -sf u-boot-initial-env-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -224,7 +239,16 @@ do_install () {
 
 }
 
-FILES_${PN} = "/boot ${sysconfdir} ${datadir}"
+PACKAGE_BEFORE_PN += "${PN}-env"
+
+RPROVIDES_${PN}-env += "virtual/bootloader-env"
+FILES_${PN}-env = " \
+    ${sysconfdir}/u-boot-initial-env* \
+    ${sysconfdir}/fw_env.config \
+"
+
+FILES_${PN} = "/boot ${datadir}"
+RDEPENDS_${PN} += "${PN}-env"
 
 do_deploy () {
     if [ -n "${UBOOT_CONFIG}" ]
@@ -235,25 +259,37 @@ do_deploy () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -d ${DEPLOYDIR}
-                    install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${type}-${PV}-${PR}
+
                     cd ${DEPLOYDIR}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+
+                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} u-boot-initial-env-${type}
+                    ln -sf u-boot-initial-env-${type}-${PV}-${PR} u-boot-initial-env
                 fi
             done
             unset  j
         done
         unset  i
     else
-        install -d ${DEPLOYDIR}
-        install -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        install -D -m 644 ${B}/${config}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${PV}-${PR}
         cd ${DEPLOYDIR}
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+
+        ln -sf u-boot-initial-env-${PV}-${PR} u-boot-initial-env
+    fi
+
+    if [ -e ${WORKDIR}/fw_env.config ] ; then
+        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${PV}-${PR}
+        cd ${DEPLOYDIR}
+        ln -sf fw_env.config-${PV}-${PR} fw_env.config
     fi
 
     if [ -n "${UBOOT_ELF}" ]
-- 
2.26.0

