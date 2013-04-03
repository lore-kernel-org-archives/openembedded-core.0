Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UNWrJ-0000dp-2b
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Apr 2013 01:12:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2013 15:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,403,1363158000"; d="scan'208";a="312009346"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.19])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2013 15:55:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 15:55:35 -0700
Message-Id: <1365029735-15471-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] rpm-postinsts: Split out run-postinsts
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
X-List-Received-Date: Wed, 03 Apr 2013 23:12:51 -0000

This patch allows for the run-postinsts script to be provided outside
of the rpm package itself and not pull in all the associated build
dependencies.

[YOCTO 4175]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb |   50 ++++++++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb     |   30 +----------------
 2 files changed, 51 insertions(+), 29 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm-postinsts.bb

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
new file mode 100644
index 0000000..27ef2aa
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
@@ -0,0 +1,50 @@
+DESCRIPTION = "RPM postinstall script"
+SECTION = "core"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
+
+RDEPENDS_${PN} = "base-files"
+
+inherit update-rc.d allarch
+#
+# Allow distributions to alter when [postponed] package install scripts are run
+#
+POSTINSTALL_INITPOSITION ?= "98"
+
+INITSCRIPT_NAME = "run-postinsts"
+INITSCRIPT_PARAMS = "start ${{POSTINSTALL_INITPOSITION} S ."
+
+POSTLOG ?= "/var/log/postinstall.log"
+REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>>${POSTLOG} 2>&1', '', d)}"
+
+do_fetch() {
+	:
+}
+
+do_configure() {
+	:
+}
+
+do_compile() {
+	:
+}
+
+do_install() {
+	install -d ${D}/${sysconfdir}/rcS.d
+	# Stop $i getting expanded below...
+	i=\$i
+	cat > ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
+#!/bin/sh
+for i in \`ls /etc/rpm-postinsts/\`; do
+	i=/etc/rpm-postinsts/$i
+	echo "Running postinst $i..."
+	if [ -f $i ] && $i ${REDIRECT_CMD}; then
+		rm $i
+	else
+		echo "ERROR: postinst $i failed."
+	fi
+done
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
+EOF
+	chmod 0755 ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
+}
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 7c3897c..c7d21e8 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -200,7 +200,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale ${PN}-postinsts"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
 
 SOLIBS = "5.4.so"
 
@@ -228,9 +228,6 @@ FILES_${PN} =  "${bindir}/rpm \
 
 RDEPENDS_${PN} += "${PN}-postinsts"
 
-FILES_${PN}-postinsts = "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
-                "
-
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 		${libdir}/rpm/bin/.debug \
 		"
@@ -375,14 +372,6 @@ do_configure() {
 	oe_runconf
 }
 
-#
-# Allow distributions to alter when [postponed] package install scripts are run
-#
-POSTINSTALL_INITPOSITION ?= "98"
-
-POSTLOG ?= "/var/log/postinstall.log"
-REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>>${POSTLOG} 2>&1', '', d)}"
-
 do_install_append() {
 	sed -i -e 's,%__check_files,#%%__check_files,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
@@ -460,23 +449,6 @@ do_install_append() {
 	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
 	rm -f ${D}/${libdir}/rpm/bin/api-sanity-checker.pl
 
-	install -d ${D}/${sysconfdir}/rcS.d
-	# Stop $i getting expanded below...
-	i=\$i
-	cat > ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
-#!/bin/sh
-for i in \`ls /etc/rpm-postinsts/\`; do
-	i=/etc/rpm-postinsts/$i
-	echo "Running postinst $i..."
-	if [ -f $i ] && $i ${REDIRECT_CMD}; then
-		rm $i
-	else
-		echo "ERROR: postinst $i failed."
-	fi
-done
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-EOF
-	chmod 0755 ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 }
 
 do_install_append_class-native() {
-- 
1.7.10.4



