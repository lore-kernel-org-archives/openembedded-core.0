Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 82B3965CD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 05:56:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2014 22:51:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,462,1400050800"; d="scan'208";a="556147323"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2014 22:56:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jun 2014 22:56:20 -0700
Message-Id: <37280175766b34129a22d2602f057511e90263b1.1402552609.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
In-Reply-To: <cover.1402552609.git.sgw@linux.intel.com>
References: <cover.1402552609.git.sgw@linux.intel.com>
Subject: [RFC - WIP v2 01/10] conf-files: New recipe to create single recipe for config files
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
X-List-Received-Date: Thu, 12 Jun 2014 05:56:34 -0000

This recipe will create 1 package for config files, we could optionally add
a bbclass file to ensure consistency with RRECOMMENDS_ = =conf

This is a work in progress, the do_install might even beable to automagically
generated.  We don't want to create a bbclass for these since it will cause
the actual recipe/packaging to become machine specific, using this recipe will
ioslate that.

[YOCTO #4011]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/conf-files.bbclass               |  3 +
 meta/recipes-bsp/conf-files/conf-files_1.0.bb | 84 +++++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 meta/classes/conf-files.bbclass
 create mode 100644 meta/recipes-bsp/conf-files/conf-files_1.0.bb

diff --git a/meta/classes/conf-files.bbclass b/meta/classes/conf-files.bbclass
new file mode 100644
index 0000000..b937268
--- /dev/null
+++ b/meta/classes/conf-files.bbclass
@@ -0,0 +1,3 @@
+
+
+RRECOMMENDS_${PN} = "${PN}-conf"
diff --git a/meta/recipes-bsp/conf-files/conf-files_1.0.bb b/meta/recipes-bsp/conf-files/conf-files_1.0.bb
new file mode 100644
index 0000000..de7d893
--- /dev/null
+++ b/meta/recipes-bsp/conf-files/conf-files_1.0.bb
@@ -0,0 +1,84 @@
+SUMMARY = "Configuartion files master recipe"
+DESCRIPTION = "This package provides Configuration files for different packages that may need some kind of customization on a BSP level"
+
+LICENSE = "BSD || MIT || GPLv2"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+SRC_URI = ""
+S = "${WORKDIR}"
+
+
+CONF_PACKAGES = " \
+                 apmd \
+                 alsa-state \
+                 connman \
+                 formfactor \
+                 init-ifupdown \
+                 pointercal \
+                 xinput-calibrator \
+                 xorg-xf86-config \
+                "
+
+#                 bluze4 \
+#                 bluez5 \
+#                 keymaps \
+#                 tslib \
+#
+
+CONF_PACKAGES[apmd] = "${datadir}/apmd/apmd_proxy.conf"
+CONF_SUMMARY[apmd] = ""
+CONF_DESCRIPTION[apmd] = ""
+CONF_PACKAGES[alsa-state] = "${sysconfdir}/asound.conf"
+CONF_PACKAGES[bluez4] = "${sysconfdir}/dbus-1/system.d/bluetooth.conf"
+CONF_PACKAGES[bluez5] = "${sysconfdir}/dbus-1/system.d/bluetooth.conf"
+CONF_PACKAGES[connman] = "${localstatedir}/lib/connman/wired.config ${libdir}/connman/wired-setup"
+CONF_PACKAGES[formfactor] = "${sysconfdir}/formfactor/machconfig"
+CONF_PACKAGES[init-ifupdown] = "${sysconfdir}/network/interfaces"
+CONF_PACKAGES[pointercal] = "${sysconfdir}/pointercal"
+CONF_PACKAGES[tslib] = "${sysconfdir}/ts.conf"
+DEBIAN_NORENAME = "1"
+
+CONF_PACKAGES[xinput-calibrator] = "${sysconfdir}/pointercal.xinput"
+RCONFLICTS_xinput-calibrator = "pointercal.xinput"
+RPROVIDES_xinput-calibrator = "pointercal.xinput"
+RREPLACES_xinput-calibrator = "pointercal.xinput"
+
+CONF_PACKAGES[xorg-xf86-config] = "${sysconfdir}/X11/xorg.conf"
+CONF_PACKAGES_NOAPPEND[xorg-xf86-config] = "1"
+
+PACKAGES = ""
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+INHIBIT_DEFAULT_DEPS = "1"
+
+python __anonymous() {
+
+    do_install_cmd = ""
+    packages = (d.getVar('CONF_PACKAGES', True) or "").split()
+    for pn in packages:
+        if not d.getVarFlag('CONF_PACKAGES_NOAPPEND', pn):
+            pn_conf = pn + "-conf"
+        else:
+            pn_conf = pn
+
+        d.appendVar('PACKAGES', pn_conf + " ")
+        d.setVar('ALLOW_EMPTY_' + pn_conf, "1")
+        d.setVar('FILES_' + pn_conf, "")
+        d.setVar('CONFFILES_' + pn_conf, "")
+        conf_paths = (d.getVarFlag('CONF_PACKAGES', pn, True) or "").split()
+        print("conf_paths: %s" % (conf_paths))
+        for conf_path in conf_paths:
+            print("conf_path: %s" % (conf_path))
+            conf_dir = os.path.dirname(conf_path)
+            conf_file = os.path.basename(conf_path)
+            d.appendVar('SRC_URI', 'file://' + conf_file + " ")
+            d.appendVar('FILES_' + pn_conf, conf_path + " ")
+            d.appendVar('CONFFILES_' + pn_conf, conf_path + " ")
+
+            # Build do_install() fragment for each config file, only if it exists
+            do_install_cmd = do_install_cmd + "if test -s ${S}/" + conf_file + "; then\n"
+            do_install_cmd = do_install_cmd + "\tinstall -d ${D}" + conf_dir + "\n"
+            do_install_cmd = do_install_cmd + "\tinstall -m 0644 ${S}/" + conf_file + " ${D}" + conf_dir + "\n"
+            do_install_cmd = do_install_cmd + "fi\n"
+
+    d.setVar('do_install', do_install_cmd)
+}
-- 
1.8.3.2


