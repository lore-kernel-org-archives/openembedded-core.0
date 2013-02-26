Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UAFut-00078v-Fh
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 09:29:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q8DJiJ006940
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 00:13:19 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 26 Feb 2013 00:13:17 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 16:14:28 +0800
Message-ID: <64e6ba7beecab3af5aa91ce492024a6668e7b2af.1361866257.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361866256.git.kai.kang@windriver.com>
References: <cover.1361866256.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 4/5] rootfs_rpm: move run-postinsts scripts to rpm recipe
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
X-List-Received-Date: Tue, 26 Feb 2013 08:29:41 -0000
Content-Type: text/plain

Move run-postinsts scripts from rootfs_rpm.bbclass to rpm recipe. That
is the same way for dpkg and opkg to deal the post install scripts.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/classes/rootfs_rpm.bbclass        |   23 -----------------------
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |   23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 9dc2bf9..3442d48 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -29,11 +29,6 @@ do_rootfs[vardepsexclude] += "BUILDNAME"
 RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; "
 RPM_POSTPROCESS_COMMANDS = "rpm_setup_smart_target_config; "
 
-# 
-# Allow distributions to alter when [postponed] package install scripts are run
-#
-POSTINSTALL_INITPOSITION ?= "98"
-
 rpmlibdir = "/var/lib/rpm"
 opkglibdir = "${localstatedir}/lib/opkg"
 
@@ -114,24 +109,6 @@ fakeroot rootfs_rpm_do_rootfs () {
 		fi
 	done
 
-	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
-	# Stop $i getting expanded below...
-	i=\$i
-	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
-#!/bin/sh
-for i in \`ls /etc/rpm-postinsts/\`; do
-	i=/etc/rpm-postinsts/$i
-	echo "Running postinst $i..."
-	if [ -f $i ] && $i; then
-		rm $i
-	else
-		echo "ERROR: postinst $i failed."
-	fi
-done
-rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-EOF
-	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
-
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 39b0481..0b014b6 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -369,6 +369,11 @@ do_configure() {
 	oe_runconf
 }
 
+#
+# Allow distributions to alter when [postponed] package install scripts are run
+#
+POSTINSTALL_INITPOSITION ?= "98"
+
 do_install_append() {
 	sed -i -e 's,%__check_files,#%%__check_files,' ${D}/${libdir}/rpm/macros
 	sed -i -e 's,%__scriptlet_requires,#%%__scriptlet_requires,' ${D}/${libdir}/rpm/macros
@@ -445,6 +450,24 @@ do_install_append() {
 
 	rm -rf ${D}/var/lib/wdj ${D}/var/cache/wdj
 	rm -f ${D}/${libdir}/rpm/bin/api-sanity-checker.pl
+
+	install -d ${D}/${sysconfdir}/rcS.d
+	# Stop $i getting expanded below...
+	i=\$i
+	cat > ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << EOF
+#!/bin/sh
+for i in \`ls /etc/rpm-postinsts/\`; do
+	i=/etc/rpm-postinsts/$i
+	echo "Running postinst $i..."
+	if [ -f $i ] && $i; then
+		rm $i
+	else
+		echo "ERROR: postinst $i failed."
+	fi
+done
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
+EOF
+	chmod 0755 ${D}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
 }
 
 do_install_append_class-native() {
-- 
1.7.5.4



