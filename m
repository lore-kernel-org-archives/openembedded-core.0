Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9883373174
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 23:04:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7FN4rkm014800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 16:04:54 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 15 Aug 2016 16:04:53 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2016 16:04:53 -0700
Message-ID: <1471302293-16339-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd-compat-units: pkg_postinst() does not work
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
X-List-Received-Date: Mon, 15 Aug 2016 23:04:56 -0000
Content-Type: text/plain

The test for various files is wrong and will always be
true, even if init.d does not exist.

Exit if init.d does not exist, and correctly test for
file existence otherwise.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb |   19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 0b8ff09..8ad10ae 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -3,7 +3,7 @@ SUMMARY = "Enhances systemd compatilibity with existing SysVinit scripts"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
-PR = "r29"
+PR = "r30"
 
 DEPENDS = "systemd-systemctl-native"
 
@@ -23,21 +23,24 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
 "
 
 pkg_postinst_${PN} () {
-	cd $D${sysconfdir}/init.d
 
-	echo "Disabling the following sysv scripts: "
+	cd $D${sysconfdir}/init.d  ||  exit 0
 
-	OPTS=""
+	echo "Disabling the following sysv scripts: "
 
 	if [ -n "$D" ]; then
 		OPTS="--root=$D"
+	else
+		OPTS=""
 	fi
 
 	for i in ${SYSTEMD_DISABLED_SYSV_SERVICES} ; do
-		if [ \( -e $i -o $i.sh \) -a ! \( -e $D${sysconfdir}/systemd/system/$i.service -o  -e $D${systemd_unitdir}/system/$i.service \) ] ; then
-			echo -n "$i: " ; systemctl ${OPTS} mask $i.service
+		if [ -e $i -o -e $i.sh ]  &&   ! [ -e $D${sysconfdir}/systemd/system/$i.service -o -e $D${systemd_unitdir}/system/$i.service ] ; then
+			echo -n "$i: "
+			systemctl $OPTS mask $i.service
 		fi
-	done ; echo
+	done
+	echo
 }
 
-RDPEPENDS_${PN} = "systemd"
+RDEPENDS_${PN} = "systemd"
-- 
1.7.9.5


