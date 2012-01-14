Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rm3SD-0008L8-J9
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jan 2012 14:15:29 +0100
Received: from mizar.localdomain (87.2.250.15) by smtp207.alice.it (8.6.023.02)
	id 4F05A66500E078BB; Sat, 14 Jan 2012 14:07:56 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Jan 2012 14:07:53 +0100
Message-Id: <1326546473-26329-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] tzdata_2011n: provide pkg_postinst and timezone defaults
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
X-List-Received-Date: Sat, 14 Jan 2012 13:15:29 -0000

* Take the extra bits in do_install from meta-openembedded
* and add pkg_postinst script (adapted from Gentoo).
* Default to 'Universal' timezone, present in the base package
* and allow override using DEFAULT_TIMEZONE variable.
* /etc/localtime and /etc/timezone are purposedly not packaged.
* Bump PR

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata_2011n.bb |   55 +++++++++++++++++++++++++-
 1 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2011n.bb b/meta/recipes-extended/tzdata/tzdata_2011n.bb
index de9281a..862a196 100644
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
@@ -41,7 +43,56 @@ do_install () {
         # libc is removing zoneinfo files from package
         cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
         cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
-	chown -R root:root ${D}
+
+        # Install defaults
+        install -d ${D}${sysconfdir}
+        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+        cp -pP ${S}/${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
+
+        chown -R root:root ${D}
+}
+
+pkg_postinst_${PN} () {
+
+# code taken from Gentoo's tzdata ebuild
+
+	etc_lt="${sysconfdir}/localtime"
+	src="${sysconfdir}/timezone"
+
+	if [[ -e ${src} ]] ; then
+		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
+	else
+		tz="FUBAR"
+	fi
+	
+	[[ -z ${tz} ]] && return 0
+
+	if [[ ${tz} == "FUBAR" ]] ; then
+		echo "You do not have TIMEZONE set in ${src}."
+
+		if [[ ! -e ${etc_lt} ]] ; then
+			# if /etc/localtime is a symlink somewhere, assume they
+			# know what they're doing and they're managing it themselves
+			if [[ ! -L ${etc_lt} ]] ; then
+				cp -f "${datadir}/zoneinfo/Universal" "${etc_lt}"
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
+	if [[ ! -e "${datadir}/zoneinfo/${tz}" ]] ; then
+		echo "You have an invalid TIMEZONE setting in ${src}"
+		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
+		tz="Universal"
+	fi
+	echo "Updating ${etc_lt} with ${datadir}/zoneinfo/${tz}"
+	[[ -L ${etc_lt} ]] && rm -f "${etc_lt}"
+	cp -f "${datadir}/zoneinfo/${tz}" "${etc_lt}"
 }
 
 # Packages primarily organized by directory with a major city
-- 
1.7.3.4



