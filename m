Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.3550.1585786484377758099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 17:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id v38so813861qvf.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2020 17:14:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=kIpor+jVLLyTvk0LBXLa8JVPcIZc8RwwsKHK5m6j3sQ=;
        b=oRrjhX5bsuHlVvI6UIPrEXDRV60I46WFMxuIILik/USNdWteg18LM4SinoqQMgq1ol
         33zFnfIblPTUxMgRAwUmf0tlLcB1ry5cPhT5GP402flFaefqB83xfGI0sioLL2p8BQQk
         pZoJUVEuLR5ln5jW2yCrq7935PZP646arGAoaL/JxhC4TKevjNra3F2vX0mPt4Ts5XLV
         dAJ02U3SwUkwCaJu/9KLyGc2UN3HEfDH5zooDVtDtQfC93o0Gf836TaPTbg7BKPh0N8b
         RxAS/2+wM8UMWmPCf1hZysphkqEoxTcuep1Y1+yXxK4TWOcXktB85i82PLkHMgHnQrP4
         0rxw==
X-Gm-Message-State: AGi0PuYDRAMqMhxvtyUx48K3vX4zzaabi94o1L0GouCrZKqoJtOKLidA
	SCCF2i3ZtzGjIVn2CR0+TEUCQVB0c6tWDA==
X-Google-Smtp-Source: APiQypI7Jr3r4k0vNZUQ4kEyFyy+p50TFBGLaXUyvRipewDuFLO6qt8nbAyB6x85gU0N9wQrFfl1Kw==
X-Received: by 2002:a0c:f684:: with SMTP id p4mr723027qvn.172.1585786483136;
        Wed, 01 Apr 2020 17:14:43 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.114.167])
        by smtp.gmail.com with ESMTPSA id z43sm2624042qtb.92.2020.04.01.17.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 17:14:42 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Stefano Babic <sbabic@denx.de>,
	Tom Rini <trini@konsulko.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3] u-boot: Restore valid default environment for running system
Date: Wed,  1 Apr 2020 21:14:31 -0300
Message-Id: <20200402001431.435999-1-otavio@ossystems.com.br>
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

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
This change is late in the cycle but it is critical in my opinion.

The lack of default environment as well as the configuration for the
tool is a regression from the previous release and this mitigates it.

Changes in v3:
- Remove rrecommends in libubootenv
- Add ${MACHINE} to the files following other binaries
- Change commit log

Changes in v2:
- Fix wrong path on do_install
- Change virtual/bootloader-env to u-boot-default-env (RP)
- Add Tom Rini and Stefano Babic to Cc

 meta/recipes-bsp/u-boot/u-boot.inc | 62 +++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index d4ab9c3222e..dc4f7884b82 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -134,6 +134,11 @@ do_compile () {
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
@@ -142,6 +147,9 @@ do_compile () {
         unset  i
     else
         oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
+
+        # Generate the uboot-initial-env
+        oe_runmake -C ${S} O=${B} u-boot-initial-env
     fi
 
 }
@@ -155,19 +163,28 @@ do_install () {
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
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${type}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${type}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
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
+        install -D -m 644 ${B}/u-boot-initial-env ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env-${MACHINE}
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} ${D}/${sysconfdir}/u-boot-initial-env
     fi
 
     if [ -n "${UBOOT_ELF}" ]
@@ -236,7 +253,16 @@ do_install () {
 
 }
 
-FILES_${PN} = "/boot ${sysconfdir} ${datadir}"
+PACKAGE_BEFORE_PN += "${PN}-env"
+
+RPROVIDES_${PN}-env += "u-boot-default-env"
+FILES_${PN}-env = " \
+    ${sysconfdir}/u-boot-initial-env* \
+    ${sysconfdir}/fw_env.config \
+"
+
+FILES_${PN} = "/boot ${datadir}"
+RDEPENDS_${PN} += "${PN}-env"
 
 do_deploy () {
     if [ -n "${UBOOT_CONFIG}" ]
@@ -247,25 +273,43 @@ do_deploy () {
                 j=$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -d ${DEPLOYDIR}
-                    install -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_SYMLINK}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}-${type}
                     ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UBOOT_BINARY}
+
+                    # Deploy the uboot-initial-env
+                    install -D -m 644 ${B}/${config}/u-boot-initial-env-${type} ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR}
+                    cd ${DEPLOYDIR}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${MACHINE}-${type}
+                    ln -sf u-boot-initial-env-${MACHINE}-${type}-${PV}-${PR} u-boot-initial-env-${type}
                 fi
             done
             unset  j
         done
         unset  i
     else
-        install -d ${DEPLOYDIR}
-        install -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+        install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
+
         cd ${DEPLOYDIR}
         rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
         ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}
+
+        # Deploy the uboot-initial-env
+        install -D -m 644 ${B}/u-boot-initial-env ${DEPLOYDIR}/u-boot-initial-env-${MACHINE}-${PV}-${PR}
+        cd ${DEPLOYDIR}
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env-${MACHINE}
+        ln -sf u-boot-initial-env-${MACHINE}-${PV}-${PR} u-boot-initial-env
+    fi
+
+    if [ -e ${WORKDIR}/fw_env.config ] ; then
+        install -D -m 644 ${WORKDIR}/fw_env.config ${DEPLOYDIR}/fw_env.config-${MACHINE}-${PV}-${PR}
+        cd ${DEPLOYDIR}
+        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config-${MACHINE}
+        ln -sf fw_env.config-${MACHINE}-${PV}-${PR} fw_env.config
     fi
 
     if [ -n "${UBOOT_ELF}" ]
-- 
2.26.0

