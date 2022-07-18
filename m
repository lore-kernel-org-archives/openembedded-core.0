Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BF4C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:42 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.28250.1658155778552114127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TiP7sSnv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id g126so10836268pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x70jdLNfP0wjX4IuU+zSxMTN1n1uB7Aa6BIun9X+Hh0=;
        b=TiP7sSnvUXW12+0tUY82wZnsW9FbZAfYspfHcizPGjIcqeSo6gkEOpn3apGKPbn/P5
         FBARKMMn1vGO97pjo+KDNUo2jeJEhDE2WMC/5/q9azylniESd4GGpmvAsheDpJ4EtFmj
         q7X+D2fairUJmX1J4Q+88y9M6+REF6mSrKxnned08QZik9XNsoThe1v1Oa7jJmTiRiiu
         AwmDbeNDqc2RLwHwA7dY5Kvm+AczoWyLxThwRMA52dma2DO5S295hfmszPWX1+EoaM/U
         5wQaRpZtETWM/+6xctyoPOBjJh9VV/1oX2S4dN8gQ/LpJb7VNRRpq5JCGp9aaYfs8AC+
         X9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x70jdLNfP0wjX4IuU+zSxMTN1n1uB7Aa6BIun9X+Hh0=;
        b=ncUF2SnnIngRthG6chFG1glEtdkC3MIHdSnSE0B6U8SbOTLsFJaiNn2K2YQbqng753
         DdL7J/i2kpYJun3JE6iA6XZvnpeVT4DYmTnAfEnxj1HbnlHb6lxfNHyhuDzcAaN8EZOh
         gbl/s4kASwnzNcNyMPnlPtyndoDPpWJjy+1uq0jwuZ6xpg04aNybWIIQchhBdr3lEdi/
         PhqpjlDLrZ4ILygo4nHp8MKjZIYZsOqRjveJLeQtK6F2hBKbian/1oIecLOn+Oirvh7L
         F1m1sN/vEJbcZguOJ1OayOrGDDicZcDLIH55x3RjYKyIfLvg7NeQLBfHMWqZdh7inSc/
         T8yA==
X-Gm-Message-State: AJIora98IaP/dhQgGPj8K03uf9ZTwroVbqy7dFfq+1yJUhhFdyRQJn5Q
	AiDa2q5ey+Uif+K1dKSE/EHEfcqgOgIvH8hM
X-Google-Smtp-Source: 
 AGRyM1tlyus/4hou6Kh5OMDcggRHY9fdXPIK/C/XlHkLFdcEgmEWzsEwUTtpA6tmAxJeyImY9hlHCQ==
X-Received: by 2002:a63:f355:0:b0:419:8dfd:45d0 with SMTP id
 t21-20020a63f355000000b004198dfd45d0mr24768520pgj.226.1658155777474;
        Mon, 18 Jul 2022 07:49:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/35] udev-extraconf: force systemd-udevd to use
 shared MountFlags
Date: Mon, 18 Jul 2022 04:48:33 -1000
Message-Id: 
 <00ea4314feb51d82f9027bf53ff627541180daca.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168208

From: Muhammad Hamza <Muhammad_Hamza@mentor.com>

Automounting does not work cleanly in case systemd as well as
udev rules are being used simultaneously and in most cases
race conditions and unknown behavior can come up.
In case we're running on top of systemd we need to make sure
that systemd-udevd knows that udev is in play as well and
mounting should be done using shared flags. Also as we're
using mount from sources other than systemd-mount in current
scripts this is the most manageable fix to automounting
problems.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 1e770416b4c9a0468404fb64d55114d93e84763b)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../udev/udev-extraconf/systemd-udevd.service            | 3 +++
 meta/recipes-core/udev/udev-extraconf_1.1.bb             | 9 ++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/udev/udev-extraconf/systemd-udevd.service

diff --git a/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service b/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
new file mode 100644
index 0000000000..a9b86eb6e4
--- /dev/null
+++ b/meta/recipes-core/udev/udev-extraconf/systemd-udevd.service
@@ -0,0 +1,3 @@
+.include @systemd_unitdir@/system/systemd-udevd.service
+[Service]
+MountFlags=shared
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 8213c1a930..ef6019259e 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
        file://autonet.rules \
        file://network.sh \
        file://localextra.rules \
+       ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'file://systemd-udevd.service', '', d)} \
 "
 
 S = "${WORKDIR}"
@@ -35,9 +36,15 @@ do_install() {
     sed -i 's|@MOUNT_BASE@|${MOUNT_BASE}|g' ${D}${sysconfdir}/udev/scripts/mount.sh
 
     install -m 0755 ${WORKDIR}/network.sh ${D}${sysconfdir}/udev/scripts
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/systemd/system
+        install ${WORKDIR}/systemd-udevd.service ${D}${sysconfdir}/systemd/system/systemd-udevd.service
+        sed -i 's|@systemd_unitdir@|${systemd_unitdir}|g' ${D}${sysconfdir}/systemd/system/systemd-udevd.service
+    fi
 }
 
-FILES:${PN} = "${sysconfdir}/udev"
+FILES:${PN} = "${sysconfdir}/udev ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${sysconfdir}/systemd/system/systemd-udevd.service', '', d)}"
 RDEPENDS:${PN} = "udev util-linux-blkid"
 CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 
-- 
2.25.1


