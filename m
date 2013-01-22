Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxY7f-0004R2-W9
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 08:18:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0M72Y1t017610
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 23:02:34 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 21 Jan 2013 23:02:33 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 15:02:42 +0800
Message-ID: <b00f3f4100032d6ae83ed4c6de2a09ddf91970ec.1358838027.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1358838027.git.Qi.Chen@windriver.com>
References: <cover.1358838027.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 1/1] sysvinit & initscripts: use update-rc.d
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
X-List-Received-Date: Tue, 22 Jan 2013 07:18:22 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Update-rc.d provides a cleaner interface for creating links for init scripts.
So we use update-rc.d to replace the redundant 'ln -sf xxx' statements.

[YOCTO #3708]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb |   57 +++++++++-------------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb   |   15 +++---
 2 files changed, 32 insertions(+), 40 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 6e15f88..69b9bfb 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -37,6 +37,7 @@ SRC_URI_append_arm = " file://alignment.sh"
 KERNEL_VERSION = ""
 
 inherit update-alternatives
+DEPENDS_append = " update-rc.d-native"
 
 ALTERNATIVE_PRIORITY = "90"
 ALTERNATIVE_${PN} = "functions"
@@ -64,6 +65,8 @@ do_install () {
 	install -d ${D}${sysconfdir}/rc6.d
 	install -d ${D}${sysconfdir}/default
 	install -d ${D}${sysconfdir}/default/volatiles
+	# Holds state information pertaining to urandom
+	install -d ${D}/var/lib/urandom
 
 	install -m 0644    ${WORKDIR}/functions		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/bootmisc.sh	${D}${sysconfdir}/init.d
@@ -84,6 +87,7 @@ do_install () {
 	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
+
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
 	fi
@@ -92,44 +96,29 @@ do_install () {
 #
 	install -m 0755 ${WORKDIR}/banner.sh	${D}${sysconfdir}/init.d/banner.sh
 	install -m 0755 ${WORKDIR}/umountfs	${D}${sysconfdir}/init.d/umountfs
+	install -m 0755		${WORKDIR}/device_table.txt		${D}${sysconfdir}/device_table
 #
 # Create runlevel links
 #
-	ln -sf		../init.d/rmnologin.sh	${D}${sysconfdir}/rc2.d/S99rmnologin.sh
-	ln -sf		../init.d/rmnologin.sh	${D}${sysconfdir}/rc3.d/S99rmnologin.sh
-	ln -sf		../init.d/rmnologin.sh	${D}${sysconfdir}/rc4.d/S99rmnologin.sh
-	ln -sf		../init.d/rmnologin.sh	${D}${sysconfdir}/rc5.d/S99rmnologin.sh
-	ln -sf		../init.d/sendsigs	${D}${sysconfdir}/rc6.d/S20sendsigs
-#	ln -sf		../init.d/urandom	${D}${sysconfdir}/rc6.d/S30urandom
-	ln -sf		../init.d/umountnfs.sh	${D}${sysconfdir}/rc6.d/S31umountnfs.sh
-	ln -sf		../init.d/umountfs	${D}${sysconfdir}/rc6.d/S40umountfs
-	# udev will run at S55 if installed
-	ln -sf		../init.d/reboot	${D}${sysconfdir}/rc6.d/S90reboot
-	ln -sf		../init.d/sendsigs	${D}${sysconfdir}/rc0.d/S20sendsigs
-#	ln -sf		../init.d/urandom	${D}${sysconfdir}/rc0.d/S30urandom
-	ln -sf		../init.d/umountnfs.sh	${D}${sysconfdir}/rc0.d/S31umountnfs.sh
-	ln -sf		../init.d/umountfs	${D}${sysconfdir}/rc0.d/S40umountfs
-	# udev will run at S55 if installed
-	ln -sf		../init.d/halt		${D}${sysconfdir}/rc0.d/S90halt
-	ln -sf		../init.d/save-rtc.sh	${D}${sysconfdir}/rc0.d/S25save-rtc.sh
-	ln -sf		../init.d/save-rtc.sh	${D}${sysconfdir}/rc6.d/S25save-rtc.sh
-	ln -sf		../init.d/banner.sh	${D}${sysconfdir}/rcS.d/S02banner.sh
-	ln -sf		../init.d/checkroot.sh	${D}${sysconfdir}/rcS.d/S10checkroot.sh
-#	ln -sf		../init.d/checkfs.sh	${D}${sysconfdir}/rcS.d/S30checkfs.sh
-	ln -sf		../init.d/mountall.sh	${D}${sysconfdir}/rcS.d/S35mountall.sh
-	ln -sf		../init.d/hostname.sh	${D}${sysconfdir}/rcS.d/S39hostname.sh
-	ln -sf		../init.d/mountnfs.sh	${D}${sysconfdir}/rcS.d/S45mountnfs.sh
-	ln -sf		../init.d/bootmisc.sh	${D}${sysconfdir}/rcS.d/S55bootmisc.sh
-#	ln -sf		../init.d/urandom	${D}${sysconfdir}/rcS.d/S55urandom
-	ln -sf		../init.d/sysfs.sh	${D}${sysconfdir}/rcS.d/S02sysfs.sh
-	# udev will run at S03 if installed
-	ln -sf		../init.d/populate-volatile.sh	${D}${sysconfdir}/rcS.d/S37populate-volatile.sh
-	ln -sf		../init.d/devpts.sh	${D}${sysconfdir}/rcS.d/S38devpts.sh
+	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
+	update-rc.d -r ${D} sendsigs start 20 0 6 .
+	update-rc.d -r ${D} urandom start 30 S 0 6 .
+	update-rc.d -r ${D} umountnfs.sh start 31 0 6 .
+	update-rc.d -r ${D} umountfs start 40 0 6 .
+	update-rc.d -r ${D} reboot start 90 6 .
+	update-rc.d -r ${D} halt start 90 0 .
+	update-rc.d -r ${D} save-rtc.sh start 25 0 6 .
+	update-rc.d -r ${D} banner.sh start 02 S .
+	update-rc.d -r ${D} checkroot.sh start 10 S .
+	update-rc.d -r ${D} mountall.sh start 35 S .
+	update-rc.d -r ${D} hostname.sh start 39 S .
+	update-rc.d -r ${D} mountnfs.sh start 45 S .
+	update-rc.d -r ${D} bootmisc.sh start 55 S .
+	update-rc.d -r ${D} sysfs.sh start 02 S .
+	update-rc.d -r ${D} populate-volatile.sh start 37 S .
+	update-rc.d -r ${D} devpts.sh start 38 S .
 	if [ "${TARGET_ARCH}" = "arm" ]; then
-		ln -sf	../init.d/alignment.sh	${D}${sysconfdir}/rcS.d/S06alignment.sh
+	        update-rc.d -r ${D} alignment.sh start 06 S .
 	fi
 
-	install -m 0755		${WORKDIR}/device_table.txt		${D}${sysconfdir}/device_table
-	# Holds state information pertaining to urandom
-	install -d ${D}/var/lib/urandom
 }
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index de073b8..39c97ac 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -26,6 +26,7 @@ S = "${WORKDIR}/sysvinit-${PV}"
 B = "${S}/src"
 
 inherit update-alternatives
+DEPENDS_append = " update-rc.d-native"
 
 ALTERNATIVE_${PN} = "init mountpoint halt reboot runlevel shutdown poweroff last mesg utmpdump wall"
 
@@ -63,18 +64,20 @@ EXTRA_OEMAKE += "'base_bindir=${base_bindir}' \
 
 do_install () {
 	oe_runmake 'ROOT=${D}' install
+
 	install -d ${D}${sysconfdir} \
 		   ${D}${sysconfdir}/default \
 		   ${D}${sysconfdir}/init.d
+	for level in S 0 1 2 3 4 5 6; do
+		install -d ${D}${sysconfdir}/rc$level.d
+	done
+
 	install -m 0644    ${WORKDIR}/rcS-default	${D}${sysconfdir}/default/rcS
 	install -m 0755    ${WORKDIR}/rc		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/rcS		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
 	ln -sf bootlogd ${D}${sysconfdir}/init.d/stop-bootlogd
-	install -d ${D}${sysconfdir}/rcS.d
-	ln -sf ../init.d/bootlogd ${D}${sysconfdir}/rcS.d/S07bootlogd
-	for level in 2 3 4 5; do
-		install -d ${D}${sysconfdir}/rc$level.d
-		ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
-	done
+
+        update-rc.d -r ${D} bootlogd start 07 S .
+        update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
 }
-- 
1.7.9.5



