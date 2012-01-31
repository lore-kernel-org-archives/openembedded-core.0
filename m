Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rs5EG-0003hm-Ud
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 05:22:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2012 20:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112282295"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.89])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2012 20:13:55 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 20:13:43 -0800
Message-Id: <932a87f6b7d601f71b11894ae0d57e2a0bc771df.1327980240.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327980240.git.sgw@linux.intel.com>
References: <cover.1327980240.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/19] tzdata_2011n: provide pkg_postinst and timezone defaults
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
X-List-Received-Date: Tue, 31 Jan 2012 04:24:41 -0000

From: Andrea Adami <andrea.adami@gmail.com>

* Introduce DEFAULT_TIMEZONE variable ('Universal', present in base package)
* and add /etc/timezone during do_install.
* While there, fix hardcoded references to $exec_prefix (/usr).
* Add the pkg_postinst script (adapted from Gentoo).
* Create /etc/localtime during postinst.
* Bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2011n.bb |   62 ++++++++++++++++++++++++--
 1 files changed, 58 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb b/meta/recipes-extended/tzdata/tzdata_2011n.bb
index de9281a..9a41131 100644
--- a/meta/recipes-extended/tzdata/tzdata_2011n.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2011n.bb
@@ -5,7 +5,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r0"
+PR = "r1"
 
 RCONFLICTS= "timezones timezone-africa timezone-america timezone-antarctica \
              timezone-arctic timezone-asia timezone-atlantic \
@@ -19,6 +19,8 @@ SRC_URI[tzdata.sha256sum] = "a343e542486b2b8ebdeca474eed79f1c04f69420ca943c2b9bd
 
 S = "${WORKDIR}"
 
+DEFAULT_TIMEZONE ?= "Universal"
+
 TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
          factory solar87 solar88 solar89 etcetera backward systemv \
         "
@@ -36,12 +38,64 @@ do_compile () {
 }
 
 do_install () {
-        install -d ${D}/usr ${D}${datadir}/zoneinfo
-        cp -pPR ${S}/usr ${D}/
+        install -d ${D}/$exec_prefix ${D}${datadir}/zoneinfo
+        cp -pPR ${S}/$exec_prefix ${D}/
         # libc is removing zoneinfo files from package
         cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
         cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
-	chown -R root:root ${D}
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
 }
 
 # Packages primarily organized by directory with a major city
-- 
1.7.6.5



