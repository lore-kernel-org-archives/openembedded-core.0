Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UE6t4-0005fM-Uj
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Mar 2013 00:39:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r28NN7vq019431
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Mar 2013 15:23:07 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 8 Mar 2013 15:23:07 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jeff.polk@windriver.com>
Date: Fri, 8 Mar 2013 15:23:07 -0800
Message-ID: <1362784987-27907-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] tzcode & tzdata: update to 2013a versions
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
X-List-Received-Date: Fri, 08 Mar 2013 23:39:59 -0000
Content-Type: text/plain

CQID: 407425

Create new tzcode and tzdata recipes for 2013a timezone
data.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-extended/tzcode/tzcode-native_2013a.bb |   26 +++
 meta/recipes-extended/tzdata/tzdata_2013a.bb       |  225 ++++++++++++++++++++
 2 files changed, 251 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2013a.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2013a.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2013a.bb b/meta/recipes-extended/tzcode/tzcode-native_2013a.bb
new file mode 100644
index 0000000..3047fef
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2013a.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d7a19b8c6d8a28785c4cd04ff2e46d27"
+
+# note that we allow for us to use data later than our code version
+#
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata2013a.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "5c5a640666fb3896af9eb4a52a01e264"
+SRC_URI[tzcode.sha256sum] = "c2be9f6c0449df21308df1ab17bfd88e7d0652961b0dcbc768c2829cab6331bc"
+SRC_URI[tzdata.md5sum] = "2a9b3208ed91652dd554e4d104662e67"
+SRC_URI[tzdata.sha256sum] = "ed9f273f52d5df9ec09fdcf6684176bbdc86d0fbafcbc27b97e5a9c103024afc"
+
+S = "${WORKDIR}"
+
+inherit native
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
diff --git a/meta/recipes-extended/tzdata/tzdata_2013a.bb b/meta/recipes-extended/tzdata/tzdata_2013a.bb
new file mode 100644
index 0000000..d2d4916
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2013a.bb
@@ -0,0 +1,225 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+DESCRIPTION = "Timezone data"
+HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
+SECTION = "base"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
+DEPENDS = "tzcode-native"
+
+PR = "r1"
+
+RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
+             timezone-arctic timezone-asia timezone-atlantic \
+             timezone-australia timezone-europe timezone-indian \
+             timezone-iso3166.tab timezone-pacific timezone-zone.tab"
+
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "2a9b3208ed91652dd554e4d104662e67"
+SRC_URI[tzdata.sha256sum] = "ed9f273f52d5df9ec09fdcf6684176bbdc86d0fbafcbc27b97e5a9c103024afc"
+
+S = "${WORKDIR}"
+
+DEFAULT_TIMEZONE ?= "Universal"
+
+TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
+         factory solar87 solar88 solar89 etcetera backward systemv \
+        "
+# pacificnew
+
+do_compile () {
+        for zone in ${TZONES}; do \
+            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
+                -y ${S}/yearistype.sh ${S}/${zone} ; \
+            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
+                -y ${S}/yearistype.sh ${S}/${zone} ; \
+            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
+                -y ${S}/yearistype.sh ${S}/${zone} ; \
+        done
+}
+
+do_install () {
+        install -d ${D}/$exec_prefix ${D}${datadir}/zoneinfo
+        cp -pPR ${S}/$exec_prefix ${D}/
+        # libc is removing zoneinfo files from package
+        cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
+        cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
+
+        # Install default timezone
+        install -d ${D}${sysconfdir}
+        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+
+        chown -R root:root ${D}
+}
+
+pkg_postinst_${PN} () {
+
+# code taken from Gentoo's tzdata ebuild
+
+	etc_lt="$D${sysconfdir}/localtime"
+	src="$D${sysconfdir}/timezone"
+
+	if [ -e ${src} ] ; then
+		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
+	else
+		tz="FUBAR"
+	fi
+	
+	if [ -z ${tz} ] ; then
+		return 0
+	fi
+	
+	if [ ${tz} = "FUBAR" ] ; then
+		echo "You do not have TIMEZONE set in ${src}."
+
+		if [ ! -e ${etc_lt} ] ; then
+			# if /etc/localtime is a symlink somewhere, assume they
+			# know what they're doing and they're managing it themselves
+			if [ ! -L ${etc_lt} ] ; then
+				cp -f "$D${datadir}/zoneinfo/Universal" "${etc_lt}"
+				echo "Setting ${etc_lt} to Universal."
+			else
+				echo "Assuming your ${etc_lt} symlink is what you want; skipping update."
+			fi
+		else
+			echo "Skipping auto-update of ${etc_lt}."
+		fi
+		return 0
+	fi
+
+	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
+		echo "You have an invalid TIMEZONE setting in ${src}"
+		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
+		tz="Universal"
+	fi
+	echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
+	if [ -L ${etc_lt} ] ; then
+		rm -f "${etc_lt}"
+	fi
+	cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
+}
+
+# Packages primarily organized by directory with a major city
+# in most time zones in the base package
+
+PACKAGES = "tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
+    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
+    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
+
+FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
+RPROVIDES_tzdata-africa = "tzdata-africa"
+
+FILES_tzdata-americas += "${datadir}/zoneinfo/America/*  \
+                ${datadir}/zoneinfo/US/*                \
+                ${datadir}/zoneinfo/Brazil/*            \
+                ${datadir}/zoneinfo/Canada/*            \
+                ${datadir}/zoneinfo/Mexico/*            \
+                ${datadir}/zoneinfo/Chile/*"
+RPROVIDES_tzdata-americas = "tzdata-americas"
+
+FILES_tzdata-antarctica += "${datadir}/zoneinfo/Antarctica/*"
+RPROVIDES_tzdata-antarctica = "tzdata-antarctica"
+
+FILES_tzdata-arctic += "${datadir}/zoneinfo/Arctic/*"
+RPROVIDES_tzdata-arctic = "tzdata-arctic"
+
+FILES_tzdata-asia += "${datadir}/zoneinfo/Asia/*        \
+                ${datadir}/zoneinfo/Indian/*            \
+                ${datadir}/zoneinfo/Mideast/*"
+RPROVIDES_tzdata-asia = "tzdata-asia"
+
+FILES_tzdata-atlantic += "${datadir}/zoneinfo/Atlantic/*"
+RPROVIDES_tzdata-atlantic = "tzdata-atlantic"
+
+FILES_tzdata-australia += "${datadir}/zoneinfo/Australia/*"
+RPROVIDES_tzdata-australia = "tzdata-australia"
+
+FILES_tzdata-europe += "${datadir}/zoneinfo/Europe/*"
+RPROVIDES_tzdata-europe = "tzdata-europe"
+
+FILES_tzdata-pacific += "${datadir}/zoneinfo/Pacific/*"
+RPROVIDES_tzdata-pacific = "tzdata-pacific"
+
+FILES_tzdata-posix += "${datadir}/zoneinfo/posix/*"
+RPROVIDES_tzdata-posix = "tzdata-posix"
+
+FILES_tzdata-right += "${datadir}/zoneinfo/right/*"
+RPROVIDES_tzdata-right = "tzdata-right"
+
+
+FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
+                ${datadir}/zoneinfo/Egypt                \
+                ${datadir}/zoneinfo/Eire                 \
+                ${datadir}/zoneinfo/Factory              \
+                ${datadir}/zoneinfo/GB-Eire              \
+                ${datadir}/zoneinfo/Hongkong             \
+                ${datadir}/zoneinfo/Iceland              \
+                ${datadir}/zoneinfo/Iran                 \
+                ${datadir}/zoneinfo/Israel               \
+                ${datadir}/zoneinfo/Jamaica              \
+                ${datadir}/zoneinfo/Japan                \
+                ${datadir}/zoneinfo/Kwajalein            \
+                ${datadir}/zoneinfo/Libya                \
+                ${datadir}/zoneinfo/Navajo               \
+                ${datadir}/zoneinfo/Poland               \
+                ${datadir}/zoneinfo/Portugal             \
+                ${datadir}/zoneinfo/Singapore            \
+                ${datadir}/zoneinfo/Turkey"
+RPROVIDES_tzdata-misc = "tzdata-misc"
+
+
+FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
+                ${datadir}/zoneinfo/America/Anchorage    \
+                ${datadir}/zoneinfo/America/Los_Angeles  \
+                ${datadir}/zoneinfo/America/Denver       \
+                ${datadir}/zoneinfo/America/Chicago      \
+                ${datadir}/zoneinfo/America/New_York     \
+                ${datadir}/zoneinfo/America/Caracas      \
+                ${datadir}/zoneinfo/America/Sao_Paulo    \
+                ${datadir}/zoneinfo/Europe/London        \
+                ${datadir}/zoneinfo/Europe/Paris         \
+                ${datadir}/zoneinfo/Africa/Cairo         \
+                ${datadir}/zoneinfo/Europe/Moscow        \
+                ${datadir}/zoneinfo/Asia/Dubai           \
+                ${datadir}/zoneinfo/Asia/Karachi         \
+                ${datadir}/zoneinfo/Asia/Dhaka           \
+                ${datadir}/zoneinfo/Asia/Bankok          \
+                ${datadir}/zoneinfo/Asia/Hong_Kong       \
+                ${datadir}/zoneinfo/Asia/Tokyo           \
+                ${datadir}/zoneinfo/Australia/Darwin     \
+                ${datadir}/zoneinfo/Australia/Adelaide   \
+                ${datadir}/zoneinfo/Australia/Brisbane   \
+                ${datadir}/zoneinfo/Australia/Sydney     \
+                ${datadir}/zoneinfo/Pacific/Noumea       \
+                ${datadir}/zoneinfo/CET                  \
+                ${datadir}/zoneinfo/CST6CDT              \
+                ${datadir}/zoneinfo/EET                  \
+                ${datadir}/zoneinfo/EST                  \
+                ${datadir}/zoneinfo/EST5EDT              \
+                ${datadir}/zoneinfo/GB                   \
+                ${datadir}/zoneinfo/GMT                  \
+                ${datadir}/zoneinfo/GMT+0                \
+                ${datadir}/zoneinfo/GMT-0                \
+                ${datadir}/zoneinfo/GMT0                 \
+                ${datadir}/zoneinfo/Greenwich            \
+                ${datadir}/zoneinfo/HST                  \
+                ${datadir}/zoneinfo/MET                  \
+                ${datadir}/zoneinfo/MST                  \
+                ${datadir}/zoneinfo/MST7MDT              \
+                ${datadir}/zoneinfo/NZ                   \
+                ${datadir}/zoneinfo/NZ-CHAT              \
+                ${datadir}/zoneinfo/PRC                  \
+                ${datadir}/zoneinfo/PST8PDT              \
+                ${datadir}/zoneinfo/ROC                  \
+                ${datadir}/zoneinfo/ROK                  \
+                ${datadir}/zoneinfo/UCT                  \
+                ${datadir}/zoneinfo/UTC                  \
+                ${datadir}/zoneinfo/Universal            \
+                ${datadir}/zoneinfo/W-SU                 \
+                ${datadir}/zoneinfo/WET                  \
+                ${datadir}/zoneinfo/Zulu                 \
+                ${datadir}/zoneinfo/zone.tab             \
+                ${datadir}/zoneinfo/iso3166.tab          \
+                ${datadir}/zoneinfo/Etc/*"
-- 
1.7.3.4



