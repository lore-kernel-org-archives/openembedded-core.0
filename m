Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFBFC43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:25 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.15413.1658062634644719731
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PUWuykKw;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id u13so15205907lfn.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YzxWEU+SXambC1HOawBB3qXjMr15PQqjLlwsEgJ0rAE=;
        b=PUWuykKwyOx3AC6bLosy1mWJ29Pq3gPXjm+WG/haJBVX/iJ6hC1xuJYmffqmChqKGI
         ZHsoWIKRGAmtx0XmdS68SApY7ODfXqe0D1JUN4aU/g57azNI5Vh6qfC9yYQHCiRFIPzV
         7vqtgSk3StIMtzJcnMFDY5SIxyOCxTGbPKPec3NO8ryWjUICNvViSs8Gn6M7Ug61HZYp
         6M8YArZrEaW+HDTLup8Ib1rxHRut0icJAo85KsY8bzGsCfdZ8jSF3QOsGhOycSgRDOCa
         IcMvhy0WwL28t3tTe0+9Mlz92K4QCPrvT9dUbdsKgvjXwHXHmcYOAsQ6nbP/2mFqr5qN
         NO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YzxWEU+SXambC1HOawBB3qXjMr15PQqjLlwsEgJ0rAE=;
        b=iMZxO3XQZV+d8NBah/K9Dx3IbdI9Rq8GDiAJFbT+HIiU/QpGterjKXwKRrDlu20pDA
         drBdnd5hLXobkWUAxg6bGz6cvdD0yRj2KGvzxHVafjeEvMsjMmHCtmauNDBZubjm2ro5
         vWeqg6qjh9MKmH9x+fcDdjrgZHA8euuehky0fgESkYLPc3Q3uyF+kKPmkm8i/WYeSkuW
         81XWQt01+O/S7KYb8XBFdCqFNFrpHStwLo2v5Q5gMnBNp1qfqsWxLIVEjzrTZmq7B0Et
         jST8/A0BDGTKYv9zeiee1Dk/lsL2rycjEYRy7q2aDg/bdsdVyVDkgE+3Di+v9jcCkVCb
         e6Rw==
X-Gm-Message-State: AJIora845ZQ3UvaGhVw6hXN3nuy9LXgKzf1UfzNhSsOoqqmdeoZQLqlc
	2Dy2JFwSs3VjZSWxNBrzMxS6Sb10yLU=
X-Google-Smtp-Source: 
 AGRyM1vB/YDMKWfhxonNKbYHrIxP/WUzXLhNNpIBCLQKz1uzq8DSXPT9yHoXydnkEVffZW2AK9PMTw==
X-Received: by 2002:a05:6512:3406:b0:489:deab:e516 with SMTP id
 i6-20020a056512340600b00489deabe516mr12125089lfr.609.1658062632487;
        Sun, 17 Jul 2022 05:57:12 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:11 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Muhammad Hamza <Muhammad_Hamza@mentor.com>,
	Awais Belal <awais_belal@mentor.com>,
	Muhammad Hamza <muhammad_hamza@mentor.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 6/9] udev-extraconf: force systemd-udevd
 to use shared MountFlags
Date: Sun, 17 Jul 2022 14:56:45 +0200
Message-Id: <20220717125648.2942046-7-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717125648.2942046-1-liu.ming50@gmail.com>
References: <20220717125648.2942046-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168154

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


