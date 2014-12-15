Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 112947255D
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 18:45:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2014 10:43:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,581,1413270000"; d="scan'208";a="637892714"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2014 10:43:51 -0800
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org, meta-intel@yoctoproject.org,
	richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	ross.burton@intel.com, paul.eggleton@linux.intel.com,
	tom.zanussi@intel.com, dvhart@linux.intel.com
Date: Mon, 15 Dec 2014 10:47:18 -0800
Message-Id: <c19c4fa44f4a0bfb2f97632680d8f2a161ab357e.1418667266.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <7cced157a79e0c7ca2a86eec64bc84a62ccbdf11.1418667266.git.nitin.a.kamble@intel.com>
References: <7cced157a79e0c7ca2a86eec64bc84a62ccbdf11.1418667266.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1418667266.git.nitin.a.kamble@intel.com>
References: <cover.1418667266.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] machinesetuptool: a new recipe for setup of a machine
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
X-List-Received-Date: Mon, 15 Dec 2014 18:45:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

a new recipe which recipe provides the ability to setup a BSP image for a
specific machine or platform at the boot time. The base recipe does not
provide any machine configuration files, those are provided by individual
BSP layer.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../machinesetuptool/machinesetuptool_git.bb       | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 meta/recipes-bsp/machinesetuptool/machinesetuptool_git.bb

diff --git a/meta/recipes-bsp/machinesetuptool/machinesetuptool_git.bb b/meta/recipes-bsp/machinesetuptool/machinesetuptool_git.bb
new file mode 100644
index 0000000..e901d12
--- /dev/null
+++ b/meta/recipes-bsp/machinesetuptool/machinesetuptool_git.bb
@@ -0,0 +1,55 @@
+SUMMARY = "Daemon to setup an image for a specific machine at boot time."
+SECTION = "base"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+RDEPENDS_${PN} = "sysvinit sed"
+
+PV = "1.0+git${SRCPV}"
+
+SRCREV = "b1a1f62f2f8748080131afa588dd7208bcf35635"
+
+SRC_URI = "git://git.yoctoproject.org/machinesetuptool.git"
+
+S = "${WORKDIR}/git"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+inherit autotools pkgconfig update-rc.d
+
+INITSCRIPT_NAME = "machinesetuptool"
+INITSCRIPT_PARAMS = "start 00 S . stop 20 0 1 6 ."
+
+# This variable is initialized to empty value now.
+# It needs to be populated with the desired machine configuration files
+# for each BSP in it's own layer.
+MACHINE_CONFIG_FILES ?= ""
+
+python __anonymous () {
+    src_uri = d.getVar('SRC_URI', True)
+    machine_config_files = (d.getVar('MACHINE_CONFIG_FILES', True) or "")
+    for file in machine_config_files.split():
+         src_uri += " file://" + file
+    d.setVar('SRC_URI', src_uri)
+}
+
+do_install_append() {
+
+	if [ -r ${WORKDIR}/defaults ]
+	then
+		install -m 0755 ${WORKDIR}/defaults ${D}/${sysconfdir}/${BPN}/
+	fi
+
+	if [ -r ${WORKDIR}/detect-machine ]
+	then
+		install -m 0755 ${WORKDIR}/detect-machine ${D}/${sysconfdir}/${BPN}/scripts/
+	fi
+
+
+	for file in ${MACHINE_CONFIG_FILES}
+	do
+		if ( [ "$file" != "defaults" ] && [ "$file" != "detect-machine" ] ); then
+			mkdir -p ${D}/${sysconfdir}/${BPN}/config/`dirname ${file}`
+			install -m 0644 ${S}/../${file} ${D}/${sysconfdir}/${BPN}/config/${file}
+		fi
+	done
+}
-- 
1.8.1.4


