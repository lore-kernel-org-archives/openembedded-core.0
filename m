Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B967476097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 18:58:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 29 Feb 2016 10:58:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,521,1449561600"; d="scan'208";a="926408036"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga002.fm.intel.com with ESMTP; 29 Feb 2016 10:58:54 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Feb 2016 18:58:55 +0000
Message-Id: <9c33b8eda938132b57d89713c9bd6721fc6438b0.1456772213.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1456772213.git.alejandro.hernandez@linux.intel.com>
References: <cover.1456772213.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] eudev: Fix for multilib builds
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
X-List-Received-Date: Mon, 29 Feb 2016 18:58:55 -0000

On multilib environments, either some of the conf files or the libraries get installed
on the wrong directory, this patch changes configuration options and fixes the issue
when suitable

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index 4afcfdb..cfacdb9 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -46,11 +46,11 @@ FILES_${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc \
                    ${includedir}/libudev.h ${libdir}/libudev.so \
                    ${includedir}/udev.h ${libdir}/libudev.la \
-                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc \
+                   ${libdir}/pkgconfig/libudev.pc \
 		   "
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
-EXTRA_OECONF = "--with-rootlibdir=${base_libdir} \
+EXTRA_OECONF = "--with-rootlibdir=${nonarch_base_libdir} \
 	     --sbindir=${base_sbindir} \
 	     --libexecdir=${nonarch_base_libdir} \
 	     --with-rootprefix= \
@@ -74,6 +74,13 @@ do_install_append(){
         # hid2hci has moved to bluez4. removed in udev as of version 169
         rm -f ${D}${base_libdir}/udev/hid2hci
 
+	# Fix for multilib systems where libs along with confs are installed on ${nonarch_base_libdir}
+	if ! [ -d ${D}${base_libdir} ]
+          then
+            install -d ${D}${base_libdir}
+	    mv ${D}${nonarch_base_libdir}/libudev.so* ${D}${base_libdir}/
+        fi
+
         echo 'udev_run="/var/run/udev"' >> ${D}${sysconfdir}/udev/udev.conf
 
         # Use classic network interface naming scheme
-- 
2.6.2


