Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UPFD8-0000KO-T1
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 18:46:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Apr 2013 09:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="283193273"
Received: from dell-desktop.rb.intel.com ([10.237.105.59])
	by azsmga001.ch.intel.com with ESMTP; 08 Apr 2013 09:29:05 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 19:29:15 +0300
Message-Id: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] udev: Move udevd back to /sbin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 16:46:29 -0000

Along with v182 upgrade udevd was moved to ${base_libdir}
making scripts like init-live.sh to fail in finding udevd

Fixes [Yocto #4046]

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 meta/recipes-core/udev/udev.inc    |    3 ++-
 meta/recipes-core/udev/udev_182.bb |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index e358d2d..c4d2ce4 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -40,7 +40,7 @@ EXTRA_OECONF = "--disable-introspection \
                 ac_cv_file__usr_share_hwdata_pci_ids=no \
                 ac_cv_file__usr_share_misc_pci_ids=yes \
                 --sbindir=${base_sbindir} \
-                --libexecdir=${base_libdir} \
+                --libexecdir=${base_sbindir} \
                 --with-rootlibdir=${base_libdir} \
                 --with-rootprefix= \
                "
@@ -61,6 +61,7 @@ RRECOMMENDS_${PN} += "udev-utils"
 FILES_${PN}-dbg += "${libexecdir}/.debug"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/"
 FILES_${PN}-dbg += "${base_libdir}/udev/.debug/*"
+FILES_${PN}-dbg += "${base_sbindir}/udev/.debug/*"
 FILES_${PN}-dev = "${datadir}/pkgconfig/udev.pc"
 FILES_libudev = "${base_libdir}/libudev.so.*"
 FILES_libudev-dbg = "${base_libdir}/.debug/libudev.so.*"
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index 42b4d08..d66292e 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r6"
+PR = "r7"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.7.9.5



