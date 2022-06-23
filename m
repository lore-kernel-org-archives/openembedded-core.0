Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A607C43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 19:01:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.990.1656010896257088844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 12:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FNlMxBvf;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id t25so553995lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 12:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdPYBSJQXW5Sz0xUC1y4Ca/r1f7hkqum0kDwe64O+TE=;
        b=FNlMxBvfwLG7PmmLvBvEJGtYm7JkaxzAdT/desfs6PdCbp1QtL1EacG4sscjHJhSSv
         Tt/XgqMti+80Ifx43IzzLKe9JsmaWB9Sk/hd1j//cmt0hHWPILFTqlKsPceEWdTy42k8
         N3+0ncGwsvEf5CGyEUIevXLm66XWNITNrTi/PhJMCuYexIK7w71psLoSUGvFOhw0GJhc
         g/LOdmRMLbJyCaeoURc4nnXB27rfXbXg+YbQhfel+gqunGF3DH0Foo4HyP1owRic3Mv1
         QMBOQlP+eeqZ5vK0tZhyxROz6/2FnnnNvCoasjHFf0MdGOojKK/T/U86MZmGW+Nk3tvh
         WV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZdPYBSJQXW5Sz0xUC1y4Ca/r1f7hkqum0kDwe64O+TE=;
        b=m5gPr93/P2ORZ07+so3ypbxhTdWteqFFwV0lTUgi/lvmdXpFmcvO77LgxPcGMCh76n
         rejQTUmVtCnn+7twJOBWOfUU5eWQ9XvIBoH/GQB1X0eMYulElLPWUdMs4Ru/O6DLdNX5
         Sw4O3YJm8Xr2pqPZ+UJZJW7yLQuTMDB7vJCrr5Q16goB2YVpwEa/SZI4OIUqF5f/uHDD
         E18w4PPkje6bgkIbCue3KmLd1G0pdSSlEsbhB2Tz2hGM1HKLX3LvF2h1V6Vram5DMfQA
         Xc9E5+ncXtybKdfxYMkPQiq5CwYgoccV5yfBUuaoqtA3oNJqbtJc24js8p2GC34AysAd
         V2mQ==
X-Gm-Message-State: AJIora8mRGQUNcfiZxSZ/AUzfHBAj8gEcAsqey7LK0sHozktIhBDeKWR
	pKohiYmHFcbZ1/Vdz5iH6ZJLLgE1zVk=
X-Google-Smtp-Source: 
 AGRyM1sMXJcjCYs6JrMpd7S/cEnWkkZBL+PZFy/ZruOLhrLZhfWDITIZa0x39L8oIpjHp77Lf9273w==
X-Received: by 2002:a19:ca1a:0:b0:47f:6a76:b4c9 with SMTP id
 a26-20020a19ca1a000000b0047f6a76b4c9mr6481518lfg.108.1656010893968;
        Thu, 23 Jun 2022 12:01:33 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74d:c493:7187:a36f:5cc2:3fe3])
        by smtp.gmail.com with ESMTPSA id
 2-20020a2e1542000000b0025a475f69c9sm13803ljv.81.2022.06.23.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 12:01:33 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [PATCH] udev-extraconf: fix some systemd automount issues
Date: Thu, 23 Jun 2022 21:01:27 +0200
Message-Id: <20220623190127.2519287-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 19:01:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167283

From: Ming Liu <liu.ming50@gmail.com>

The '.include' syntax has been dropped from latest systemd releases,
we need drop the systemd-udevd.service here, introduce a postinst
function to add "MountFlags=shared" to systemd-udevd.service.

Also lsblk binary is being called in mount.sh automount_systemd
function, add it to RDEPENDS.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../udev/udev-extraconf/systemd-udevd.service |  3 ---
 meta/recipes-core/udev/udev-extraconf_1.1.bb  | 20 +++++++++++--------
 2 files changed, 12 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-core/udev/udev-extraconf/systemd-udevd.service

diff --git a/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service b/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
deleted file mode 100644
index a9b86eb6e4..0000000000
--- a/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
+++ /dev/null
@@ -1,3 +0,0 @@
-.include @systemd_unitdir@/system/systemd-udevd.service
-[Service]
-MountFlags=shared
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index ef6019259e..30f1fe76d0 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -11,7 +11,6 @@ SRC_URI = " \
        file://autonet.rules \
        file://network.sh \
        file://localextra.rules \
-       ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://systemd-udevd.service', '', d)} \
 "
 
 S = "${WORKDIR}"
@@ -36,16 +35,21 @@ do_install() {
     sed -i 's|@MOUNT_BASE@|${MOUNT_BASE}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
 
     install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
+}
+
+pkg_postinst:${PN} () {
+	if [ -e $D${systemd_unitdir}/system/systemd-udevd.service ]; then
+		sed -i "/\[Service\]/aMountFlags=shared" $D${systemd_unitdir}/system/systemd-udevd.service
+	fi
+}
 
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/systemd/system
-        install ${WORKDIR}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/systemd-udevd.service
-        sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' ${D}${sysconfdir}/systemd/system/systemd-udevd.service
-    fi
+pkg_postrm:${PN} () {
+	if [ -e $D${systemd_unitdir}/system/systemd-udevd.service ]; then
+		sed -i "/MountFlags=shared/d" $D${systemd_unitdir}/system/systemd-udevd.service
+	fi
 }
 
-FILES:${PN} = "${sysconfdir}/udev ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${sysconfdir}/systemd/system/systemd-udevd.service', '', d)}"
-RDEPENDS:${PN} = "udev util-linux-blkid"
+RDEPENDS:${PN} = "udev util-linux-blkid ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'util-linux-lsblk', '', d)}"
 CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 
 # to replace udev-extra-rules from meta-oe
-- 
2.25.1


