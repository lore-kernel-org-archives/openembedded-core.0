Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D0C71151
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:04 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.8138.1650033488360646772
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 07:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23FEc6oS005918
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 07:38:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 15 Apr 2022 07:38:06 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 15 Apr 2022 07:38:05 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] update_udev_hwdb: fix multilib issue with systemd
Date: Fri, 15 Apr 2022 22:38:03 +0800
Message-ID: <20220415143803.13980-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164429

From: Kai Kang <kai.kang@windriver.com>

It duplicates udevadm in systemd recipe to make it could run
update_udev_hwdb with multilib enabled. Since systemd last update,
it deploys a shared library libsystemd-shared-250.so in /lib/systemd/.
The library will be overwritten when multilib enabled. Then if both
udev-hwdb and lib32-udev-hwdb are installed, it fails to run the
multilib version postinstall intercept update_udev_hwdb:

| /path/to/build/tmp-glibc/work/intel_x86_64-wrs-linux/wrlinux-image-small/1.0-r1/rootfs/usr/libexec/lib32-udevadm:
    error while loading shared libraries: libsystemd-shared-250.so: wrong ELF class: ELFCLASS64

`udevadm hwdb --update` just concatenates .hwdb files in dirs
/etc/udev/hwdb.d and /lib/udev/hwdb.d. The output file hwdb.bin is
identical with the one created by lib32-udevadm. So do NOT duplicate
lib32-udevadm in systemd and eudev. And update intercept script
update_udev_hwdb that re-run udevadm with same arch qemuwrapper if run
${binprefix}qemuwrapper failed.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/systemd/systemd_250.4.bb   | 5 -----
 meta/recipes-core/udev/eudev_3.2.10.bb       | 4 ----
 scripts/postinst-intercepts/update_udev_hwdb | 5 ++++-
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_250.4.bb b/meta/recipes-core/systemd/systemd_250.4.bb
index 2b346113b59..15e2185dff2 100644
--- a/meta/recipes-core/systemd/systemd_250.4.bb
+++ b/meta/recipes-core/systemd/systemd_250.4.bb
@@ -337,10 +337,6 @@ do_install() {
 	# create link for existing udev rules
 	ln -s ${base_bindir}/udevadm ${D}${base_sbindir}/udevadm
 
-	# duplicate udevadm for postinst script
-	install -d ${D}${libexecdir}
-	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
-
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
@@ -718,7 +714,6 @@ FILES:udev += "${base_sbindir}/udevd \
                ${base_bindir}/systemd-hwdb \
                ${base_bindir}/udevadm \
                ${base_sbindir}/udevadm \
-               ${libexecdir}/${MLPREFIX}udevadm \
                ${datadir}/bash-completion/completions/udevadm \
                ${systemd_system_unitdir}/systemd-hwdb-update.service \
               "
diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.10.bb
index dec16be046c..ccc66ae1313 100644
--- a/meta/recipes-core/udev/eudev_3.2.10.bb
+++ b/meta/recipes-core/udev/eudev_3.2.10.bb
@@ -51,10 +51,6 @@ do_install:append() {
 
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
-
-	# duplicate udevadm for postinst script
-	install -d ${D}${libexecdir}
-	ln ${D}${bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
 }
 
 do_install:prepend:class-target () {
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index 8076b8ae6f1..8b3f5de791f 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -9,14 +9,17 @@ case "${PREFERRED_PROVIDER_udev}" in
 	systemd)
 		UDEV_EXTRA_ARGS="--usr"
 		UDEVLIBDIR="${rootlibexecdir}"
+		UDEVADM="${base_bindir}/udevadm"
 		;;
 
 	*)
 		UDEV_EXTRA_ARGS=""
 		UDEVLIBDIR="${sysconfdir}"
+		UDEVADM="${bindir}/udevadm"
 		;;
 esac
 
 rm -f $D${UDEVLIBDIR}/udev/hwdb.bin
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $D ${UDEV_EXTRA_ARGS} ||
+	PSEUDO_UNLOAD=1 qemuwrapper -L $D $D${UDEVADM} hwdb --update --root $D ${UDEV_EXTRA_ARGS}
 chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
-- 
2.17.1


