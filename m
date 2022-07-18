Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6542C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:52 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.28030.1658155782734633224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cZn8EUJZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id j12so9226189plj.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=iOJjmfxzG1vJGby0CkXuT78T42u+krUtsbxEObVS2WY=;
        b=cZn8EUJZad4V0FCpJnPK4gXEz4Ej9WxX62X3lIVklRY4z+j6HZmD/JOM6IvQSZbvk/
         W0vOhClCzWIgleh11QO2uWFgVGtbltI4hamwsaLs45tq/jir/gyRXAjQRj/iF32G7qUE
         SJG26k66A9yLJ7KEEFc+Rh4Z+4+UsAZvVbhXnY/psFp9UVmwFCa3NFSmbFtc5T16C218
         yKluZbQnqZwaW14e9MhSjCkzElruY9ptwpSh8RBFHUTWQ4EyjHeTmoyaCb7UmnlIWapE
         AVu8orrFPf9cGxFbfQZR2VDThvcVUaahW7NABeI35+aye8AIO3enRn3HC5aNGcIPtvpH
         JYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iOJjmfxzG1vJGby0CkXuT78T42u+krUtsbxEObVS2WY=;
        b=f24EoTBmhr6A5nL0ZO6MW2ZFYqnB2g4PInDnenvc0AqRVyGBymHVeS0Cmd27h16nXh
         TQYv1qp6thcnPq9esW90XBdHZUSPxMD2WTEEfD4ut9zR6WyoFlMP7A8jGhHD3AJYMnXA
         J/zoPD9ogFyZm3GI5wgtmXVNiw3rbdZXqKyUVC3vV/6y/Hq9XYWBcIj/03VREfWjvhCz
         NBaeMVaQfYgJsf1a8VsvinNd5BY2y0N2UU/Mkenl/ykxAyQfFo6JGeU8xaWklU39GmnA
         8gznMMC0gTEZsH6YNASeiXzPGOJ/0yq0UdLrjVCBUmZZGKQmHL36jj3Vt+F1ald56w3Q
         0dbg==
X-Gm-Message-State: AJIora/25QhGQYPW+oBLYO9UY4jcYQDMX18LQ1njP3Zp2xkMDUtwFwI0
	PTxUmbkwKOVMMLnTp1JzoI337USGCif6ZNfM
X-Google-Smtp-Source: 
 AGRyM1tRssHqDXGLE2/TWknXEjHrtJSlbCE2AQT4FeQVVLyJqfwNVo4s9dHBtcIqNwOuHV+FkSDH0A==
X-Received: by 2002:a17:903:281:b0:16c:4ccf:e46b with SMTP id
 j1-20020a170903028100b0016c4ccfe46bmr28208359plr.36.1658155781633;
        Mon, 18 Jul 2022 07:49:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/35] udev-extraconf: fix some systemd automount
 issues
Date: Mon, 18 Jul 2022 04:48:35 -1000
Message-Id: 
 <a3c93ec301a34413f91e3edb70c16454ebcdcdf2.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168210

From: Ming Liu <liu.ming50@gmail.com>

The '.include' syntax has been dropped from latest systemd releases,
we need drop the systemd-udevd.service here, introduce a postinst
function to add "MountFlags=shared" to systemd-udevd.service.

Also lsblk binary is being called in mount.sh automount_systemd
function, add it to RDEPENDS.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 356520d60b9429c6f62124821e42468ff2b7b1d6)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


