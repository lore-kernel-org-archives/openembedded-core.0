Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qtbzu-0007W5-Ij
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 11:01:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 Aug 2011 01:56:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38552740"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2011 01:56:34 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 16:57:05 +0800
Message-Id: <e215221ef45e5507ea4b52908f4094f9232132d7.1313571326.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1313571326.git.dongxiao.xu@intel.com>
References: <cover.1313571326.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1313571326.git.dongxiao.xu@intel.com>
References: <cover.1313571326.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/2] busybox: Change ${PN} to ${BPN} in file names
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
X-List-Received-Date: Wed, 17 Aug 2011 09:01:14 -0000

Some files in busybox are named with ${PN}. In multilib case, ${PN}
will be prefixed with "lib32-" or "lib64-". Use ${BPN} instead.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-core/busybox/busybox.inc       |   30 +++++++++++++-------------
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index d46c135..3f93358 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -29,7 +29,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 06 S ."
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
 INITSCRIPT_NAME_${PN}-udhcpc = "busybox-udhcpc" 
-CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${PN}"
+CONFFILES_${PN}-syslog = "${sysconfdir}/syslog.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
 RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
@@ -152,24 +152,24 @@ do_install () {
 		install -d ${D}${libdir} ${D}${bindir} ${D}${sbindir}
 		cat busybox.links | while read FILE; do
 			NAME=`basename "$FILE"`
-			install -m 0755 "0_lib/$NAME" "${D}$FILE.${PN}"
+			install -m 0755 "0_lib/$NAME" "${D}$FILE.${BPN}"
 		done
 		# add suid bit where needed
 		for i in `grep -E "APPLET.*_BB_SUID_((MAYBE|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | cut -f 1 -d ','`; do
-			find ${D} -name $i.${PN} -exec chmod a+s {} \;
+			find ${D} -name $i.${BPN} -exec chmod a+s {} \;
 		done
 		install -m 0755 0_lib/libbusybox.so.${PV} ${D}${libdir}/libbusybox.so.${PV}
-		ln -sf sh.${PN} ${D}${base_bindir}/sh
-		ln -sf ln.${PN} ${D}${base_bindir}/ln
-		ln -sf test.${PN} ${D}${bindir}/test
-		if [ -f ${D}/linuxrc.${PN} ]; then
-			mv ${D}/linuxrc.${PN} ${D}/linuxrc
+		ln -sf sh.${BPN} ${D}${base_bindir}/sh
+		ln -sf ln.${BPN} ${D}${base_bindir}/ln
+		ln -sf test.${BPN} ${D}${bindir}/test
+		if [ -f ${D}/linuxrc.${BPN} ]; then
+			mv ${D}/linuxrc.${BPN} ${D}/linuxrc
 		fi
 	fi
 
 	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
-		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${PN}
-		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf.${PN}
+		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
+		install -m 644 ${WORKDIR}/syslog.conf ${D}${sysconfdir}/syslog.conf.${BPN}
 	fi
 	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
@@ -193,7 +193,7 @@ do_install () {
 		install -m 0755 ${WORKDIR}/busybox-udhcpc ${D}${sysconfdir}/init.d/
 	fi
 	if grep "CONFIG_INETD=y" ${WORKDIR}/defconfig; then
-		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${PN}
+		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
 		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
         if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
@@ -217,8 +217,8 @@ pkg_postinst_${PN} () {
 }
 
 pkg_postinst_${PN}-syslog () {
-	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
-	update-alternatives --install ${sysconfdir}/syslog.conf syslog-conf syslog.conf.${PN} 50
+	update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${BPN} 50
+	update-alternatives --install ${sysconfdir}/syslog.conf syslog-conf syslog.conf.${BPN} 50
 }
 
 pkg_prerm_${PN} () {
@@ -260,6 +260,6 @@ pkg_prerm_${PN}-syslog () {
 		fi
 	fi
 
-	update-alternatives --remove syslog-init syslog.${PN}
-	update-alternatives --remove syslog-conf syslog.conf.${PN}
+	update-alternatives --remove syslog-init syslog.${BPN}
+	update-alternatives --remove syslog-conf syslog.conf.${BPN}
 }
diff --git a/meta/recipes-core/busybox/busybox_1.18.4.bb b/meta/recipes-core/busybox/busybox_1.18.4.bb
index b4681a4..b2053ee 100644
--- a/meta/recipes-core/busybox/busybox_1.18.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.18.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.1



