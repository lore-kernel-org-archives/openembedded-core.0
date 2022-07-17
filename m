Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459A1CCA47B
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:15 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.15572.1658062626091943937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QGZ+lqEq;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id z25so15220295lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fazLW+vUsBaZ+k8iTO38IqHw1z5/fDopIJ15qR++uaU=;
        b=QGZ+lqEqk5JSp24ggaU3i4Gz1C7zXFDnLmWNTs7j2bRY93fjGUwLThbNDwRf0PvPqB
         y5TjYwEa11YH5XUK9ZzXSMrH/0UJkxlYbYZM+cvBjXy4ZTaSjhz0v1OBpLdJP/haKRtA
         bunSM/4nOHigYV9ECl832ps15PSZdvs40sG+MVhhjpcCJjvlBLkNapG5H834+O5TDj3Q
         OBbGJA3OXO2KRJMivsOiFAV9BPgvOX9HTHE9nExQnuOoz8tITv/rXZ4aHveH5OdxejDd
         LJbmBhgl8FmKq21PaL2+Cxi5M+xxcLw/pA1xYbjS/Z4e4eR1HAzTkZy7Tp6MBlohK//P
         jXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fazLW+vUsBaZ+k8iTO38IqHw1z5/fDopIJ15qR++uaU=;
        b=RPncMnO6KAWQlBGUuEOvHjk2a6/ZvH73HGWHXkeCv1slHPJ1FabtSSU6EpyeNQIDYt
         jrws55e/WzkK7jXeEff9auGmN08dF5+n86qfRo/xyZNirsS4eahA75Ws8qFTFl33xCwC
         LHvTKEp+xHLgua1mJ+iKKQfxGbfdFH5DVq+mR51FOSiqz8MinL7xG38QlcLrImEDDOP2
         JNLzO7xBuy7e44w5Kg0tbzChQSCaVbFqiuG2GbyOGcYDwmOwwXjB0N7lvd8CehUdUXVX
         2DBfhVs2h8FfjzLf4eLIxsPEWcmRNqnLPqBWB5PgrSoIZg1rpI4qN3PmjZbNxLeZ3xJq
         cA3A==
X-Gm-Message-State: AJIora/iGj+xQU8ulHlwtELervACcP4BPbzeaDACvZIpM5wrPMb0ZsGX
	HHjTpp4QlExzZDCJhZLI3ICn7YK0iIU=
X-Google-Smtp-Source: 
 AGRyM1sJCbgi6VR/0YT4nqsgrZGp4RFRDrMmZgekGBX/KSSkAQldb0I8lXxg79oA7w7xDhG2UWVw6Q==
X-Received: by 2002:a05:6512:3d8d:b0:489:de37:74c0 with SMTP id
 k13-20020a0565123d8d00b00489de3774c0mr12233906lfv.527.1658062623865;
        Sun, 17 Jul 2022 05:57:03 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:03 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 1/9]
  udev-extraconf/initrdscripts/parted: Rename mount.blacklist ->
 mount.ignorelist
Date: Sun, 17 Jul 2022 14:56:40 +0200
Message-Id: <20220717125648.2942046-2-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717125648.2942046-1-liu.ming50@gmail.com>
References: <20220717125648.2942046-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168149

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69e486ddb3059f80ba538e1f59c2ca8a8df0faf9)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 .../initrdscripts/files/init-install-efi-testfs.sh     |  2 +-
 .../initrdscripts/files/init-install-efi.sh            |  2 +-
 .../initrdscripts/files/init-install-testfs.sh         |  2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh  |  2 +-
 .../{mount.blacklist => mount.ignorelist}              |  0
 meta/recipes-core/udev/udev-extraconf/mount.sh         |  4 ++--
 meta/recipes-core/udev/udev-extraconf_1.1.bb           | 10 +++++-----
 meta/recipes-extended/parted/files/run-ptest           |  6 +++---
 8 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-core/udev/udev-extraconf/{mount.blacklist => mount.ignorelist} (100%)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index 1fcd29e54c..4bd6ace7b3 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -138,7 +138,7 @@ touch /ssd/etc/controllerimage
 if [ -d /ssd/etc/ ] ; then
     # We dont want udev to mount our root device while we're booting...
     if [ -d /ssd/etc/udev/ ] ; then
-        echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
+        echo "/dev/${device}" >> /ssd/etc/udev/mount.ignorelist
     fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f667518b89..ffd3870199 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -229,7 +229,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.ignorelist
     fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index 7b49001659..8ab74ddc5d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -164,7 +164,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.ignorelist
     fi
 fi
 umount /tgt_root
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index e71579631b..df33791ec7 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -261,7 +261,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "$bootdev              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.ignorelist
     fi
 fi
 umount /tgt_root
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.blacklist b/meta/recipes-core/udev/udev-extraconf/mount.ignorelist
similarity index 100%
rename from meta/recipes-core/udev/udev-extraconf/mount.blacklist
rename to meta/recipes-core/udev/udev-extraconf/mount.ignorelist
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index b23731870e..5ba66e98e2 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -26,11 +26,11 @@ fi
 
 PMOUNT="/usr/bin/pmount"
 
-for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
+for line in `grep -h -v ^# /etc/udev/mount.ignorelist /etc/udev/mount.ignorelist.d/*`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
 	then
-		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
+		logger "udev/mount.sh" "[$DEVNAME] is marked to ignore"
 		exit 0
 	fi
 done
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 2ba35b0df6..7da04379c0 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Extra machine specific configuration files"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-DESCRIPTION = "Extra machine specific configuration files for udev, specifically blacklist information."
+DESCRIPTION = "Extra machine specific configuration files for udev, specifically information on devices to ignore."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = " \
        file://automount.rules \
        file://mount.sh \
-       file://mount.blacklist \
+       file://mount.ignorelist \
        file://autonet.rules \
        file://network.sh \
        file://localextra.rules \
@@ -23,8 +23,8 @@ do_install() {
     install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
     install -m 0644 ${WORKDIR}/localextra.rules    ${D}${sysconfdir}/udev/rules.d/localextra.rules
 
-    install -d ${D}${sysconfdir}/udev/mount.blacklist.d
-    install -m 0644 ${WORKDIR}/mount.blacklist     ${D}${sysconfdir}/udev/
+    install -d ${D}${sysconfdir}/udev/mount.ignorelist.d
+    install -m 0644 ${WORKDIR}/mount.ignorelist     ${D}${sysconfdir}/udev/
 
     install -d ${D}${sysconfdir}/udev/scripts/
 
@@ -37,7 +37,7 @@ do_install() {
 
 FILES:${PN} = "${sysconfdir}/udev"
 RDEPENDS:${PN} = "udev"
-CONFFILES:${PN} = "${sysconfdir}/udev/mount.blacklist"
+CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 
 # to replace udev-extra-rules from meta-oe
 RPROVIDES:${PN} = "udev-extra-rules"
diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-extended/parted/files/run-ptest
index c3d6fca339..096078967f 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -1,7 +1,7 @@
 #!/bin/sh
 
-mkdir -p /etc/udev/mount.blacklist.d
-echo /dev/sda1 >> /etc/udev/mount.blacklist.d/parted-tmp
+mkdir -p /etc/udev/mount.ignorelist.d
+echo /dev/sda1 >> /etc/udev/mount.ignorelist.d/parted-tmp
 rm -f tests/*.log
 make -C tests test-suite.log
-rm /etc/udev/mount.blacklist.d/parted-tmp
+rm /etc/udev/mount.ignorelist.d/parted-tmp
-- 
2.25.1


