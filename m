Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CE41B770C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:13:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Oct 2015 06:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,205,1444719600"; d="scan'208";a="588900725"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Oct 2015 06:13:46 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2015 15:16:40 +0200
Message-Id: <7b555e601010e2d4a670ec3585cf782e087f6994.1445951045.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445951045.git.jussi.kukkonen@intel.com>
References: <cover.1445951045.git.jussi.kukkonen@intel.com>
Subject: [jethro][master][PATCH 1/1] connman: Move wired-setup to ${datadir}
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
X-List-Received-Date: Tue, 27 Oct 2015 13:13:59 -0000

wired-setup script should not be in ${libdir} as it's not arch
dependent.

This also fixes (or works around) a practical issue where a multilib
build installs the wrong version of connman-conf and then connman
can't find the script.

[YOCTO #8550]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb | 6 +++---
 meta/recipes-connectivity/connman/connman.inc     | 4 ++--
 meta/recipes-connectivity/connman/connman/connman | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index bd4c28d..9254ed7 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -13,14 +13,14 @@ S = "${WORKDIR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILES_${PN} = "${localstatedir}/* ${libdir}/*"
+FILES_${PN} = "${localstatedir}/* ${datadir}/*"
 
 do_install() {
     #Configure Wired network interface in case of qemu* machines
     if test -e ${WORKDIR}/wired.config && test -e ${WORKDIR}/wired-setup; then
         install -d ${D}${localstatedir}/lib/connman
         install -m 0644 ${WORKDIR}/wired.config ${D}${localstatedir}/lib/connman
-        install -d ${D}${libdir}/connman
-        install -m 0755 ${WORKDIR}/wired-setup ${D}${libdir}/connman
+        install -d ${D}${datadir}/connman
+        install -m 0755 ${WORKDIR}/wired-setup ${D}${datadir}/connman
     fi
 }
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ab7f86d..afdb3f2 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -68,7 +68,7 @@ python __anonymous () {
 
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
-SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
+SYSTEMD_WIRED_SETUP = "ExecStartPre=-${datadir}/connman/wired-setup"
 
 do_compile_append() {
 	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${B}/src/connman.service
@@ -78,7 +78,7 @@ do_install_append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
-		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
+		sed -i s%@DATADIR@%${datadir}% ${D}${sysconfdir}/init.d/connman
 	fi
 
 	install -d ${D}${bindir}
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index bf7a94a..c64fa0d 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -49,8 +49,8 @@ do_start() {
 		fi
 	    fi
 	fi
-	if [ -f @LIBDIR@/connman/wired-setup ] ; then
-		. @LIBDIR@/connman/wired-setup
+	if [ -f @DATADIR@/connman/wired-setup ] ; then
+		. @DATADIR@/connman/wired-setup
 	fi
 	$DAEMON $EXTRA_PARAM
 }
-- 
2.1.4


