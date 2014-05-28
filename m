Return-Path: <akuster808@gmail.com>
Received: from mail-pb0-f43.google.com (unknown [209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 50C716FAA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 21:21:43 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id up15so11863331pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7Fp65NQ5ed1bTd75qnq6B3JHV0uN8h+hiYeJ10Js4zc=;
	b=nposh35wKPrlKGyvCR7ROBq8T3EExFQDKb6no1HStEnqAn/UFf7wx/nMB9zvicZ/tn
	PJZn4uJs4cELSUdqJmXZ6WMbHhCCmu8lMQ86IC3f68bLo2SVmaBh9xIbvAKtrOtM/Gkn
	KnKrm4f/aoOk/7d4nyOei6U9jOdCmjot1AdUA/cddk5gsGEAqPMh7AhI4JS9Bpdd47Xt
	1PxFTxKRdlLK6xf+srz1A43z7xhVf/SVPxfqk6+uybaWbB7NxjgiFd5ImiK/bsAdOZYp
	Sfue0qUG3/iM/L8aqttk2UaiCzuUOuvEyXhk/Jz0QH+A079fZjzhDnc94bko1OxHxlok
	yKDQ==
X-Received: by 10.66.246.229 with SMTP id xz5mr2754425pac.119.1401312105045;
	Wed, 28 May 2014 14:21:45 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.195.ptr.us.xo.net. [64.2.3.195])
	by mx.google.com with ESMTPSA id
	ie9sm93807694pad.29.2014.05.28.14.21.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 14:21:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 14:21:38 -0700
Message-Id: <1401312099-4247-2-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401312099-4247-1-git-send-email-akuster@mvista.com>
References: <1401312099-4247-1-git-send-email-akuster@mvista.com>
Subject: [PATCH 1/2 V2] Update tzdata to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 21:21:44 -0000

Removed solar-time experiment  as per
http://mm.icann.org/pipermail/tz/2013-November/020488.html

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/tzdata/tzdata_2013i.bb | 206 ---------------------------
 meta/recipes-extended/tzdata/tzdata_2014c.bb | 205 ++++++++++++++++++++++++++
 2 files changed, 205 insertions(+), 206 deletions(-)
 delete mode 100644 meta/recipes-extended/tzdata/tzdata_2013i.bb
 create mode 100644 meta/recipes-extended/tzdata/tzdata_2014c.bb

diff --git a/meta/recipes-extended/tzdata/tzdata_2013i.bb b/meta/recipes-extended/tzdata/tzdata_2013i.bb
deleted file mode 100644
index 4179b44..0000000
--- a/meta/recipes-extended/tzdata/tzdata_2013i.bb
+++ /dev/null
@@ -1,206 +0,0 @@
-SUMMARY = "Timezone database"
-HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
-SECTION = "base"
-LICENSE = "PD & BSD"
-LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234 \
-                    file://README;md5=0b7570113550eb5d30aa4bd220964b8f"
-DEPENDS = "tzcode-native"
-
-inherit allarch
-
-RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
-             timezone-arctic timezone-asia timezone-atlantic \
-             timezone-australia timezone-europe timezone-indian \
-             timezone-iso3166.tab timezone-pacific timezone-zone.tab"
-
-SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
-
-SRC_URI[tzdata.md5sum] = "8bc69eb75bea496ebe1d5a9ab576702d"
-SRC_URI[tzdata.sha256sum] = "1cd56a6ee964143ef0c65229968a5093988335b95e9115235b5e7b7e45e67dda"
-
-S = "${WORKDIR}"
-
-DEFAULT_TIMEZONE ?= "Universal"
-
-TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
-         factory etcetera backward systemv \
-        "
-# pacificnew 
-
-do_compile () {
-        for zone in ${TZONES}; do \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
-                -y ${S}/yearistype.sh ${S}/${zone} ; \
-        done
-}
-
-do_install () {
-        install -d ${D}/$exec_prefix ${D}${datadir}/zoneinfo
-        cp -pPR ${S}/$exec_prefix ${D}/
-        # libc is removing zoneinfo files from package
-        cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
-        cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
-
-        # Install default timezone
-        if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
-            install -d ${D}${sysconfdir}
-            echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
-            ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
-        else
-            bberror "DEFAULT_TIMEZONE is set to an invalid value."
-            exit 1
-        fi
-
-        chown -R root:root ${D}
-}
-
-pkg_postinst_${PN} () {
-	etc_lt="$D${sysconfdir}/localtime"
-	src="$D${sysconfdir}/timezone"
-
-	if [ -e ${src} ] ; then
-		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
-	fi
-	
-	if [ -z ${tz} ] ; then
-		return 0
-	fi
-	
-	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
-		echo "You have an invalid TIMEZONE setting in ${src}"
-		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
-		tz="Universal"
-		echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
-		if [ -L ${etc_lt} ] ; then
-			rm -f "${etc_lt}"
-		fi
-		ln -s "${datadir}/zoneinfo/${tz}" "${etc_lt}"
-	fi
-}
-
-# Packages primarily organized by directory with a major city
-# in most time zones in the base package
-
-PACKAGES = "tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
-    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
-    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
-
-FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
-RPROVIDES_tzdata-africa = "tzdata-africa"
-
-FILES_tzdata-americas += "${datadir}/zoneinfo/America/*  \
-                ${datadir}/zoneinfo/US/*                \
-                ${datadir}/zoneinfo/Brazil/*            \
-                ${datadir}/zoneinfo/Canada/*            \
-                ${datadir}/zoneinfo/Mexico/*            \
-                ${datadir}/zoneinfo/Chile/*"
-RPROVIDES_tzdata-americas = "tzdata-americas"
-
-FILES_tzdata-antarctica += "${datadir}/zoneinfo/Antarctica/*"
-RPROVIDES_tzdata-antarctica = "tzdata-antarctica"
-
-FILES_tzdata-arctic += "${datadir}/zoneinfo/Arctic/*"
-RPROVIDES_tzdata-arctic = "tzdata-arctic"
-
-FILES_tzdata-asia += "${datadir}/zoneinfo/Asia/*        \
-                ${datadir}/zoneinfo/Indian/*            \
-                ${datadir}/zoneinfo/Mideast/*"
-RPROVIDES_tzdata-asia = "tzdata-asia"
-
-FILES_tzdata-atlantic += "${datadir}/zoneinfo/Atlantic/*"
-RPROVIDES_tzdata-atlantic = "tzdata-atlantic"
-
-FILES_tzdata-australia += "${datadir}/zoneinfo/Australia/*"
-RPROVIDES_tzdata-australia = "tzdata-australia"
-
-FILES_tzdata-europe += "${datadir}/zoneinfo/Europe/*"
-RPROVIDES_tzdata-europe = "tzdata-europe"
-
-FILES_tzdata-pacific += "${datadir}/zoneinfo/Pacific/*"
-RPROVIDES_tzdata-pacific = "tzdata-pacific"
-
-FILES_tzdata-posix += "${datadir}/zoneinfo/posix/*"
-RPROVIDES_tzdata-posix = "tzdata-posix"
-
-FILES_tzdata-right += "${datadir}/zoneinfo/right/*"
-RPROVIDES_tzdata-right = "tzdata-right"
-
-
-FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
-                ${datadir}/zoneinfo/Egypt                \
-                ${datadir}/zoneinfo/Eire                 \
-                ${datadir}/zoneinfo/Factory              \
-                ${datadir}/zoneinfo/GB-Eire              \
-                ${datadir}/zoneinfo/Hongkong             \
-                ${datadir}/zoneinfo/Iceland              \
-                ${datadir}/zoneinfo/Iran                 \
-                ${datadir}/zoneinfo/Israel               \
-                ${datadir}/zoneinfo/Jamaica              \
-                ${datadir}/zoneinfo/Japan                \
-                ${datadir}/zoneinfo/Kwajalein            \
-                ${datadir}/zoneinfo/Libya                \
-                ${datadir}/zoneinfo/Navajo               \
-                ${datadir}/zoneinfo/Poland               \
-                ${datadir}/zoneinfo/Portugal             \
-                ${datadir}/zoneinfo/Singapore            \
-                ${datadir}/zoneinfo/Turkey"
-RPROVIDES_tzdata-misc = "tzdata-misc"
-
-
-FILES_${PN} += "${datadir}/zoneinfo/Pacific/Honolulu     \
-                ${datadir}/zoneinfo/America/Anchorage    \
-                ${datadir}/zoneinfo/America/Los_Angeles  \
-                ${datadir}/zoneinfo/America/Denver       \
-                ${datadir}/zoneinfo/America/Chicago      \
-                ${datadir}/zoneinfo/America/New_York     \
-                ${datadir}/zoneinfo/America/Caracas      \
-                ${datadir}/zoneinfo/America/Sao_Paulo    \
-                ${datadir}/zoneinfo/Europe/London        \
-                ${datadir}/zoneinfo/Europe/Paris         \
-                ${datadir}/zoneinfo/Africa/Cairo         \
-                ${datadir}/zoneinfo/Europe/Moscow        \
-                ${datadir}/zoneinfo/Asia/Dubai           \
-                ${datadir}/zoneinfo/Asia/Karachi         \
-                ${datadir}/zoneinfo/Asia/Dhaka           \
-                ${datadir}/zoneinfo/Asia/Bankok          \
-                ${datadir}/zoneinfo/Asia/Hong_Kong       \
-                ${datadir}/zoneinfo/Asia/Tokyo           \
-                ${datadir}/zoneinfo/Australia/Darwin     \
-                ${datadir}/zoneinfo/Australia/Adelaide   \
-                ${datadir}/zoneinfo/Australia/Brisbane   \
-                ${datadir}/zoneinfo/Australia/Sydney     \
-                ${datadir}/zoneinfo/Pacific/Noumea       \
-                ${datadir}/zoneinfo/CET                  \
-                ${datadir}/zoneinfo/CST6CDT              \
-                ${datadir}/zoneinfo/EET                  \
-                ${datadir}/zoneinfo/EST                  \
-                ${datadir}/zoneinfo/EST5EDT              \
-                ${datadir}/zoneinfo/GB                   \
-                ${datadir}/zoneinfo/GMT                  \
-                ${datadir}/zoneinfo/GMT+0                \
-                ${datadir}/zoneinfo/GMT-0                \
-                ${datadir}/zoneinfo/GMT0                 \
-                ${datadir}/zoneinfo/Greenwich            \
-                ${datadir}/zoneinfo/HST                  \
-                ${datadir}/zoneinfo/MET                  \
-                ${datadir}/zoneinfo/MST                  \
-                ${datadir}/zoneinfo/MST7MDT              \
-                ${datadir}/zoneinfo/NZ                   \
-                ${datadir}/zoneinfo/NZ-CHAT              \
-                ${datadir}/zoneinfo/PRC                  \
-                ${datadir}/zoneinfo/PST8PDT              \
-                ${datadir}/zoneinfo/ROC                  \
-                ${datadir}/zoneinfo/ROK                  \
-                ${datadir}/zoneinfo/UCT                  \
-                ${datadir}/zoneinfo/UTC                  \
-                ${datadir}/zoneinfo/Universal            \
-                ${datadir}/zoneinfo/W-SU                 \
-                ${datadir}/zoneinfo/WET                  \
-                ${datadir}/zoneinfo/Zulu                 \
-                ${datadir}/zoneinfo/zone.tab             \
-                ${datadir}/zoneinfo/iso3166.tab          \
-                ${datadir}/zoneinfo/Etc/*"
diff --git a/meta/recipes-extended/tzdata/tzdata_2014c.bb b/meta/recipes-extended/tzdata/tzdata_2014c.bb
new file mode 100644
index 0000000..457f145
--- /dev/null
+++ b/meta/recipes-extended/tzdata/tzdata_2014c.bb
@@ -0,0 +1,205 @@
+DESCRIPTION = "Timezone data"
+HOMEPAGE = "ftp://elsie.nci.nih.gov/pub/"
+SECTION = "base"
+LICENSE = "PD & BSD"
+LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
+DEPENDS = "tzcode-native"
+
+inherit allarch
+
+RCONFLICTS_${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
+             timezone-arctic timezone-asia timezone-atlantic \
+             timezone-australia timezone-europe timezone-indian \
+             timezone-iso3166.tab timezone-pacific timezone-zone.tab"
+
+SRC_URI = "ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzdata.md5sum] = "fa7f3dc1c6f6238253a6f2b850467e2e"
+SRC_URI[tzdata.sha256sum] = "aa2924e012644de3a6cc3160ffff690cb3afecf350af435daefa43bb669fb8f1"
+
+S = "${WORKDIR}"
+
+DEFAULT_TIMEZONE ?= "Universal"
+
+TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
+         factory etcetera backward systemv \
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
+        if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
+            install -d ${D}${sysconfdir}
+            echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+            ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
+        else
+            bberror "DEFAULT_TIMEZONE is set to an invalid value."
+            exit 1
+        fi
+
+        chown -R root:root ${D}
+}
+
+pkg_postinst_${PN} () {
+	etc_lt="$D${sysconfdir}/localtime"
+	src="$D${sysconfdir}/timezone"
+
+	if [ -e ${src} ] ; then
+		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
+	fi
+	
+	if [ -z ${tz} ] ; then
+		return 0
+	fi
+	
+	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
+		echo "You have an invalid TIMEZONE setting in ${src}"
+		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
+		tz="Universal"
+		echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
+		if [ -L ${etc_lt} ] ; then
+			rm -f "${etc_lt}"
+		fi
+		ln -s "${datadir}/zoneinfo/${tz}" "${etc_lt}"
+	fi
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
1.9.1


