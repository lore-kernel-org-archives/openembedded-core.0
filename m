Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhS-0006sq-Rw
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443355"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:27 -0700
Message-Id: <eecd65f188ba2c924626b7e1bf5c8e2eb51e9b59.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/30] sysvinit-inittab_2.88dsf.bb: Allow multiple serial port consoles to be defined
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:07 -0000

From: Matthew McClintock <msm@freescale.com>

Set SERIAL_CONSOLES if you want to define multiple serial consoles, also if
you need to check for the presence of the serial consoles you can also define
SERIAL_CONSOLES_CHECK to determine if these are present when you boot. This
will prevent error message that pop up when the serial port is not present.

SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1 115200;ttyEHV0"
SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"

The above lines in machine.conf or elsewhere will have the effect of having
two serial consoles and removing any that are not present at boot

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   22 ++++++++++++++++++-
 1 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 9bd087c..1089edb 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Inittab for sysvinit"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "file://inittab"
 
@@ -26,7 +26,8 @@ do_install() {
     for i in $tmp
     do
 	j=`echo ${i} | sed s/\;/\ /g`
-        echo "${idx}:2345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+	echo "${idx}:12345:respawn:${base_sbindir}/getty ${j}" >> ${D}${sysconfdir}/inittab
+
 	idx=`expr $idx + 1`
     done
 
@@ -51,6 +52,23 @@ EOF
     fi
 }
 
+pkg_postinst_${PN} () {
+# run this on the target
+if [ "x$D" == "x" ]; then
+	tmp="${SERIAL_CONSOLES_CHECK}"
+	for i in $tmp
+	do
+		j=`echo ${i} | sed s/^.*\;//g`
+		if [ -z "`cat /proc/consoles | grep ${j}`" ]; then
+			sed -i /^.*${j}$/d /etc/inittab
+		fi
+	done
+	kill -HUP 1
+else
+	exit 1
+fi
+}
+
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.7.6



