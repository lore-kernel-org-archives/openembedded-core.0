Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QzPgU-0003UF-Cl
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:05:10 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Sep 2011 02:00:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,317,1312182000"; d="scan'208";a="44987079"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 02 Sep 2011 02:00:11 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:03:34 +0800
Message-Id: <4959b5dd8cbbed8bbbd6aace139e93b9ced52f80.1314953755.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/5] hal: Remove build time dependency of virtual/kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Sep 2011 09:05:10 -0000

hal has runtime dependency on kernel, but not build time. Remove it from
"DEPENDS" list.

Also fix a wrong PACKAGE_ARCH setting when building multilib lib32-hal,
because ":=" will be extended immediately which is not the right value.
Using TUNE_PKGARCH instead.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-support/hal/hal.inc |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/hal/hal.inc b/meta/recipes-support/hal/hal.inc
index d276d46..b00455b 100644
--- a/meta/recipes-support/hal/hal.inc
+++ b/meta/recipes-support/hal/hal.inc
@@ -6,7 +6,7 @@ SECTION = "unknown"
 LICENSE = "GPLv2+ | AFL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b5ffd59fbb7c2fff6de76c94177af31"
 
-DEPENDS = "virtual/kernel dbus-glib udev util-linux intltool intltool-native expat libusb gperf-native"
+DEPENDS = "dbus-glib udev util-linux intltool intltool-native expat libusb gperf-native"
 RDEPENDS_${PN} += "udev hal-info"
 
 SRC_URI = "http://hal.freedesktop.org/releases/hal-${PV}.tar.gz \
@@ -30,9 +30,8 @@ EXTRA_OECONF = "--with-hwdata=${datadir}/hwdata \
                 ${@base_contains('MACHINE_FEATURES', 'acpi', '--enable-acpi', '--disable-acpi',d)} \
                "
 
-MY_ARCH := "${PACKAGE_ARCH}"
-PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'acpi', '${MACHINE_ARCH}', '${MY_ARCH}',d)}"
-PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'pci', '${MACHINE_ARCH}', '${MY_ARCH}',d)}"
+PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'acpi', '${MACHINE_ARCH}', '${TUNE_PKGARCH}',d)}"
+PACKAGE_ARCH = "${@base_contains('MACHINE_FEATURES', 'pci', '${MACHINE_ARCH}', '${TUNE_PKGARCH}',d)}"
 
 do_install_append() {
         install -d ${D}/etc/dbus-1/event.d
-- 
1.7.1



