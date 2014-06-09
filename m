Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C0C1365EB4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 14:33:06 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2014 07:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="352497456"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.194])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2014 07:29:19 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 07:33:05 -0700
Message-Id: <1402324385-13568-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH RFC - WIP] conf-files: New recipe to create single recipe for config files
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
X-List-Received-Date: Mon, 09 Jun 2014 14:33:13 -0000

This recipe will create 1 package for config files, we could optionally add
a bbclass file to ensure consistency with RRECOMMENDS_ = =conf

This is a work in progress, the do_install might even beable to automagically
generated.  We don't want to create a bbclass for these since it will cause
the actual recipe/packaging to become machine specific, using this recipe will
ioslate that.

[YOCTO #4011]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/conf-files/conf-files_1.0.bb | 81 +++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 meta/recipes-bsp/conf-files/conf-files_1.0.bb

diff --git a/meta/recipes-bsp/conf-files/conf-files_1.0.bb b/meta/recipes-bsp/conf-files/conf-files_1.0.bb
new file mode 100644
index 0000000..c6f6000
--- /dev/null
+++ b/meta/recipes-bsp/conf-files/conf-files_1.0.bb
@@ -0,0 +1,81 @@
+SUMMARY = "Configuartion files master recipe"
+DESCRIPTION = "This package provides Configuration files for different packages that may need some kind of customization on a BSP level"
+
+LICENSE = "BSD || MIT || GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+SRC_URI = ""
+S = "${WORKDIR}"
+
+PACKAGES = ""
+
+CONF_PACKAGES = "formfactor apmd alsa-state"
+#                 apmd \
+#                 alsa-state \
+#                 bluez5 \
+#                 connman \
+#                 formfactor \
+#                 init-ifupdown \
+#                 keymap \
+#                 pointercal \
+#                 tslib \
+#                 xinput-calibrator \
+#                 xorg-xf86-config \
+#                "
+
+FILESEXTRAPATH =. "${FILE_DIRNAME}/default"
+
+CONF_PACKAGES[apmd] = "${datadir/apmd apmd_proxy.conf"
+CONF_PACKAGES[alsa-state] = "${sysconfdir} asound.conf"
+CONF_PACKAGES[bluez4] = "bluetooth.conf"
+CONF_PACKAGES[bluez5] = "bluetooth.conf"
+CONF_PACKAGES[connman] = "connman.conf"
+CONF_PACKAGES[formfactor] = "${sysconfdir}/formfactor machconfig"
+CONF_PACKAGES[init-ifupdown] = "interfaces"
+CONF_PACKAGES[keymap] = "keymap"
+CONF_PACKAGES[pointercal] = "pointercal"
+CONF_PACKAGES[tslib] = "tslib.conf"
+CONF_PACKAGES[xinput-calibrator] = "pointercal.xinput"
+CONF_PACKAGES[xorg-xf86-config] = "xorg.conf"
+CONF_PACKAGES_NOAPPEND[xorg-xf86-config] = "1"
+
+python __anonymous() {
+
+    packages = (d.getVar('CONF_PACKAGES', True) or "").split()
+    for pn in packages:
+        if not d.getVarFlag('CONF_PACKAGES_NOAPPEND', pn):
+            pn_conf = pn + "-conf"
+        else:
+            pn_conf = pn
+
+        d.appendVar('PACKAGES', pn_conf + " ")
+        conf_file = d.getVarFlag('CONF_PACKAGES', pn, True).split()
+        conf_path = conf_file[0] + "/" + conf_file[1]
+        d.setVar('FILES_' + pn_conf, conf_path)
+        d.appendVar('SRC_URI', 'file://' + conf_file[1] + " ")
+        d.setVar('CONFFILES_' + pn_conf, conf_path)
+
+}
+
+do_install() {
+
+	install -d ${D}${sysconfdir}
+
+        # apmd_proxy.conf
+	if [ -s "${S}/apmd_proxy.conf" ]; then
+		install -d ${D}${datadir}/apmd
+		install -m 0644 ${S}/apmd_proxy.conf ${D}${datadir}/apmd
+	fi
+
+        # asound.conf
+	if [ -s "${S}/asound.conf" ]; then
+		install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
+	fi
+
+        # machconfig
+	if [ -s "${S}/machconfig" ]; then
+		install -d ${D}${sysconfdir}/formfactor/
+		install -m 0644 ${S}/machconfig ${D}${sysconfdir}/formfactor/
+	fi
+}
+
-- 
1.8.3.2


