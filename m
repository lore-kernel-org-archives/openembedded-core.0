Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B639B731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:28:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6P7Sea5022119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 00:28:40 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 00:28:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 00:28:34 -0700
Message-ID: <70c603726afe20cdac2a78a9fad9fc1038d4e463.1469431638.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431638.git.liezhi.yang@windriver.com>
References: <cover.1469431638.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] eudev: don't move udev directory
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2016 07:28:41 -0000
Content-Type: text/plain

The code did "mv ${D}${base_libdir}/udev ${D}${nonarch_base_libdir}"
which is not needed any more, eudev can work with ${base_libdir}/udev.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/udev/eudev_3.2.bb | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.bb b/meta/recipes-core/udev/eudev_3.2.bb
index 6270617..ac4285b 100644
--- a/meta/recipes-core/udev/eudev_3.2.bb
+++ b/meta/recipes-core/udev/eudev_3.2.bb
@@ -27,7 +27,6 @@ inherit autotools update-rc.d qemu
 
 EXTRA_OECONF = " \
     --sbindir=${base_sbindir} \
-    --libexecdir=${nonarch_base_libdir} \
     --with-rootlibdir=${base_libdir} \
     --with-rootprefix= \
 "
@@ -53,13 +52,6 @@ do_install_append() {
 	# Use classic network interface naming scheme
 	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
 
-	# Fix for multilib systems where libs along with confs are installed incorrectly
-	if ! [ -d ${D}${nonarch_base_libdir}/udev ]
-	then
-		install -d ${D}${nonarch_base_libdir}/udev
-		mv ${D}${base_libdir}/udev ${D}${nonarch_base_libdir}
-	fi
-
 	# hid2hci has moved to bluez4. removed in udev as of version 169
 	rm -f ${D}${base_libdir}/udev/hid2hci
 }
@@ -75,7 +67,7 @@ PACKAGES =+ "udev-cache"
 PACKAGES =+ "eudev-hwdb"
 
 
-FILES_${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
+FILES_${PN} += "${libexecdir} ${base_libdir}/udev ${bindir}/udevadm"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
                    ${includedir}/libudev.h ${libdir}/libudev.so \
                    ${includedir}/udev.h ${libdir}/libudev.la \
-- 
2.9.0


