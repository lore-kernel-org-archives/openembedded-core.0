Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B052C43219
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 15:35:39 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.53187.1638804938788681578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 07:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss+yocto@0leil.net)
Received: from localhost.localdomain (84-115-236-2.cable.dynamic.surfer.at
 [84.115.236.2])
	(Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPA id 14DCC240018;
	Mon,  6 Dec 2021 15:35:36 +0000 (UTC)
From: Quentin Schulz <foss+yocto@0leil.net>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <foss+yocto@0leil.net>
Subject: [PATCH 4/4] core: udev: udev-extraconf: rename mount.blacklist* to
 mount.blocklist.*
Date: Mon,  6 Dec 2021 16:35:11 +0100
Message-Id: <20211206153511.34838-5-foss+yocto@0leil.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211206153511.34838-1-foss+yocto@0leil.net>
References: <20211206153511.34838-1-foss+yocto@0leil.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 15:35:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159246

blocklist has a more obvious meaning than blacklist and is also not an
issue wrt inclusivity, so let's use that naming instead.

Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
---
 .../initrdscripts/files/init-install-efi-testfs.sh     |  2 +-
 .../initrdscripts/files/init-install-efi.sh            |  2 +-
 .../initrdscripts/files/init-install-testfs.sh         |  2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh  |  2 +-
 .../{mount.blacklist => mount.blocklist}               |  0
 meta/recipes-core/udev/udev-extraconf/mount.sh         |  4 ++--
 meta/recipes-core/udev/udev-extraconf_1.1.bb           | 10 +++++-----
 meta/recipes-extended/parted/files/run-ptest           |  6 +++---
 8 files changed, 14 insertions(+), 14 deletions(-)
 rename meta/recipes-core/udev/udev-extraconf/{mount.blacklist => mount.blocklist} (100%)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index 6f554f62967..9bf32e8cb4e 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -138,7 +138,7 @@ touch /ssd/etc/goldenimage
 if [ -d /ssd/etc/ ] ; then
     # We dont want udev to mount our root device while we're booting...
     if [ -d /ssd/etc/udev/ ] ; then
-        echo "/dev/${device}" >> /ssd/etc/udev/mount.blacklist
+        echo "/dev/${device}" >> /ssd/etc/udev/mount.blocklist
     fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f667518b895..97db4c753b9 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -229,7 +229,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "UUID=$boot_uuid              /boot            vfat       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.blocklist
     fi
 fi
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index df3a7767319..ea74806a7b7 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -164,7 +164,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "$bootfs              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blacklist
+	echo "/dev/${device}" >> /tgt_root/etc/udev/mount.blocklist
     fi
 fi
 umount /tgt_root
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index e71579631b5..1f7dab8a967 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -261,7 +261,7 @@ if [ -d /tgt_root/etc/ ] ; then
     echo "$bootdev              /boot            ext3       defaults              1  2" >> /tgt_root/etc/fstab
     # We dont want udev to mount our root device while we're booting...
     if [ -d /tgt_root/etc/udev/ ] ; then
-        echo "${device}" >> /tgt_root/etc/udev/mount.blacklist
+        echo "${device}" >> /tgt_root/etc/udev/mount.blocklist
     fi
 fi
 umount /tgt_root
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.blacklist b/meta/recipes-core/udev/udev-extraconf/mount.blocklist
similarity index 100%
rename from meta/recipes-core/udev/udev-extraconf/mount.blacklist
rename to meta/recipes-core/udev/udev-extraconf/mount.blocklist
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index b23731870ea..41b7c775c25 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -26,11 +26,11 @@ fi
 
 PMOUNT="/usr/bin/pmount"
 
-for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
+for line in `grep -h -v ^# /etc/udev/mount.blocklist /etc/udev/mount.blocklist.d/*`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
 	then
-		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
+		logger "udev/mount.sh" "[$DEVNAME] mounting is blocked, ignoring"
 		exit 0
 	fi
 done
diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 2ba35b0df69..42ba687ed8b 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -1,13 +1,13 @@
 SUMMARY = "Extra machine specific configuration files"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
-DESCRIPTION = "Extra machine specific configuration files for udev, specifically blacklist information."
+DESCRIPTION = "Extra machine specific configuration files for udev, specifically blocklist information."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 SRC_URI = " \
        file://automount.rules \
        file://mount.sh \
-       file://mount.blacklist \
+       file://mount.blocklist \
        file://autonet.rules \
        file://network.sh \
        file://localextra.rules \
@@ -23,8 +23,8 @@ do_install() {
     install -m 0644 ${WORKDIR}/autonet.rules       ${D}${sysconfdir}/udev/rules.d/autonet.rules
     install -m 0644 ${WORKDIR}/localextra.rules    ${D}${sysconfdir}/udev/rules.d/localextra.rules
 
-    install -d ${D}${sysconfdir}/udev/mount.blacklist.d
-    install -m 0644 ${WORKDIR}/mount.blacklist     ${D}${sysconfdir}/udev/
+    install -d ${D}${sysconfdir}/udev/mount.blocklist.d
+    install -m 0644 ${WORKDIR}/mount.blocklist     ${D}${sysconfdir}/udev/
 
     install -d ${D}${sysconfdir}/udev/scripts/
 
@@ -37,7 +37,7 @@ do_install() {
 
 FILES:${PN} = "${sysconfdir}/udev"
 RDEPENDS:${PN} = "udev"
-CONFFILES:${PN} = "${sysconfdir}/udev/mount.blacklist"
+CONFFILES:${PN} = "${sysconfdir}/udev/mount.blocklist"
 
 # to replace udev-extra-rules from meta-oe
 RPROVIDES:${PN} = "udev-extra-rules"
diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-extended/parted/files/run-ptest
index c3d6fca3391..1eee9f3b730 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -1,7 +1,7 @@
 #!/bin/sh
 
-mkdir -p /etc/udev/mount.blacklist.d
-echo /dev/sda1 >> /etc/udev/mount.blacklist.d/parted-tmp
+mkdir -p /etc/udev/mount.blocklist.d
+echo /dev/sda1 >> /etc/udev/mount.blocklist.d/parted-tmp
 rm -f tests/*.log
 make -C tests test-suite.log
-rm /etc/udev/mount.blacklist.d/parted-tmp
+rm /etc/udev/mount.blocklist.d/parted-tmp
-- 
2.33.1


