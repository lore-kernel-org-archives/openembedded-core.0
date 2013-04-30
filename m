Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UXE5W-0003AN-Je
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 19:11:43 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 30 Apr 2013 09:53:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="295525223"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.12.98])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2013 09:53:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 17:53:01 +0100
Message-Id: <3ea5089011e316a994deffa881981ad855914998.1367340369.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1367340369.git.paul.eggleton@linux.intel.com>
References: <cover.1367340369.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/5] systemd-serialgetty: change to handle SERIAL_CONSOLES
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
X-List-Received-Date: Tue, 30 Apr 2013 17:13:48 -0000

SERIAL_CONSOLES is now set from SERIAL_CONSOLE if not already set.

This is a little bit gnarly because we have to create a separate service
file for each different baud rate; assume that the first baud rate is
the default, thus preserving the previous behaviour in the event there
is only one baud rate in use.

This change also installs the service file before modifying it in place,
allowing do_install to re-execute properly; additionally the service
file now has the correct permissions (i.e. no execute bit set).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/systemd/systemd-serialgetty.bb | 45 ++++++++++++------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty.bb b/meta/recipes-core/systemd/systemd-serialgetty.bb
index 96cbf31..37c49b1 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty.bb
+++ b/meta/recipes-core/systemd/systemd-serialgetty.bb
@@ -8,37 +8,38 @@ SERIAL_CONSOLE ?= "115200 ttyS0"
 
 SRC_URI = "file://serial-getty@.service"
 
-def get_serial_console_value(d, index):
-    c = d.getVar('SERIAL_CONSOLE', True)
-
-    if len(c):
-        return c.split()[index]
-
-    return ""
-
-def get_baudrate(d):
-    return get_serial_console_value(d, 0)
-
-def get_console(d):
-    return get_serial_console_value(d, 1)
-
 do_install() {
-	if [ ! ${@get_baudrate(d)} = "" ]; then
-		sed -i -e s/\@BAUDRATE\@/${@get_baudrate(d)}/g ${WORKDIR}/serial-getty@.service
+	if [ ! -z "${SERIAL_CONSOLES}" ] ; then
+		default_baudrate=`echo "${SERIAL_CONSOLES}" | sed 's/\;.*//'`
 		install -d ${D}${systemd_unitdir}/system/
 		install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/
-		install ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
-
-		# enable the service
-		ln -sf ${systemd_unitdir}/system/serial-getty@.service \
-			${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@${@get_console(d)}.service
+		install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/
+		sed -i -e s/\@BAUDRATE\@/$default_baudrate/g ${D}${systemd_unitdir}/system/serial-getty@.service
+
+		tmp="${SERIAL_CONSOLES}"
+		for entry in $tmp ; do
+			baudrate=`echo $entry | sed 's/\;.*//'`
+			ttydev=`echo $entry | sed -e 's/^[0-9]*\;//' -e 's/\;.*//'`
+			if [ "$baudrate" = "$default_baudrate" ] ; then
+				# enable the service
+				ln -sf ${systemd_unitdir}/system/serial-getty@.service \
+					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty@$ttydev.service
+			else
+				# install custom service file for the non-default baudrate
+				install -m 0644 ${WORKDIR}/serial-getty@.service ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
+				sed -i -e s/\@BAUDRATE\@/$baudrate/g ${D}${systemd_unitdir}/system/serial-getty$baudrate@.service
+				# enable the service
+				ln -sf ${systemd_unitdir}/system/serial-getty$baudrate@.service \
+					${D}${sysconfdir}/systemd/system/getty.target.wants/serial-getty$baudrate@$ttydev.service
+			fi
+		done
 	fi
 }
 
 RDEPENDS_${PN} = "systemd"
 
 # This is a machine specific file
-FILES_${PN} = "${systemd_unitdir}/system/serial-getty@.service ${sysconfdir}"
+FILES_${PN} = "${systemd_unitdir}/system/*.service ${sysconfdir}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # As this package is tied to systemd, only build it when we're also building systemd.
-- 
1.8.1.2



