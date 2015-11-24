Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F79762131
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 21:33:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 24 Nov 2015 13:33:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,339,1444719600"; d="scan'208";a="606550510"
Received: from bmlong-mobl.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.252.141.111])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Nov 2015 13:33:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 24 Nov 2015 13:33:02 -0800
Message-Id: <1448400782-1258-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] sysvinit-inittab: Add wrapper script to verify console exists
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
X-List-Received-Date: Tue, 24 Nov 2015 21:33:05 -0000

Add a wrapper script around getty to check if a given console exists, this
allows for multiple Console ttys to be specified for various boards without
having additional BSP types just for different console types.

[YOCTO #8689]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty |  5 +++++
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb  | 11 +++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
new file mode 100644
index 0000000..6eaeb7a
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -0,0 +1,5 @@
+#!/bin/sh
+if [ -c /dev/$2 ]
+then 
+	/sbin/getty -L $1 $2
+fi
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 49b1326..f539da8 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=80
 
 PR = "r10"
 
-SRC_URI = "file://inittab"
+SRC_URI = "file://inittab \
+           file://start_getty"
 
 S = "${WORKDIR}"
 
@@ -15,8 +16,10 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}
+    install -d ${D}${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
+    install -m 0755 ${WORKDIR}/start_getty ${D}${sysconfdir}/init.d/start_getty
 
     set -x
     tmp="${SERIAL_CONSOLES}"
@@ -24,7 +27,7 @@ do_install() {
     do
 	j=`echo ${i} | sed s/\;/\ /g`
 	label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
-	echo "$label:12345:respawn:${base_sbindir}/getty -L ${j}" >> ${D}${sysconfdir}/inittab
+	echo "$label:12345:respawn:${sysconfdir}/init.d/start_getty ${j}" >> ${D}${sysconfdir}/inittab
     done
 
     if [ "${USE_VT}" = "1" ]; then
@@ -73,7 +76,7 @@ fi
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILES_${PN} = "${sysconfdir}/inittab"
+FILES_${PN} = "${sysconfdir}/inittab ${sysconfdir}/init.d/start_getty"
 CONFFILES_${PN} = "${sysconfdir}/inittab"
 
 USE_VT ?= "1"
-- 
2.1.4


