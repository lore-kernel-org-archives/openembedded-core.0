Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD85AC433FE
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:43:26 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.41627.1639581647907889282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 07:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ARAn7D4Z;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639581648;
  x=1671117648;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fZP6w71oqGklEDaE/c9R7RHZ1HOw72U0yms8LM+729Y=;
  b=ARAn7D4ZdSrG6HxyQsBzQ6U/DkjiuDvj34IZDbTdzB3b1SFFzMgNBvXY
   iBpAJLuSO8i6wkAkfCyxvxCeX9eyEH9bfT686a/m6+YmvNQS3dJNa6XUB
   uQMWJ3qHkeBt+62aOsfxm0zwb6qQo+zRafj4aPI4xZ9zJD+b4lyQ6LOn6
   WukXjcI1+MKLRD7SzGjgQo84FTI0UjDDSTXfvtNcn12jJlmPUtTi1jVrf
   2s4loZ0WCzlPg0QCHg5l9KMmOjIyBTlFIhCuXGEneRZ5UZtPVenMVY+3O
   AIGmaaf/EoSRoYo8+7mcNmeXgMewocL9A+oNeGGopRSO3LEVTmvYRaQqc
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] tzdata: Clean up
Date: Wed, 15 Dec 2021 16:20:41 +0100
Message-ID: <20211215152041.21726-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211215152041.21726-1-pkj@axis.com>
References: <20211215152041.21726-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:43:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159730

* Whitespace and indentation clean up.
* Change shell variables from "${foo}" to "$foo".
* Remove "/*" from directories specified in FILES.
* Move RCONFLICTS:${PN} to the end of the recipe.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 305 ++++++++++++-----------
 1 file changed, 156 insertions(+), 149 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 64135ef8aa..cc1caff124 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -4,199 +4,206 @@ DEPENDS = "tzcode-native"
 
 inherit allarch
 
-RCONFLICTS:${PN} = "timezones timezone-africa timezone-america timezone-antarctica \
-             timezone-arctic timezone-asia timezone-atlantic \
-             timezone-australia timezone-europe timezone-indian \
-             timezone-iso3166.tab timezone-pacific timezone-zone.tab"
-
 S = "${WORKDIR}"
 
 DEFAULT_TIMEZONE ?= "Universal"
 INSTALL_TIMEZONE_FILE ?= "1"
 
-TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
-         factory etcetera backward \
-        "
-# pacificnew 
+TZONES = " \
+    africa antarctica asia australasia europe northamerica southamerica \
+    factory etcetera backward \
+"
+# pacificnew
 
 # "slim" is the default since 2020b
 # "fat" is needed by e.g. MariaDB's mysql_tzinfo_to_sql
 ZIC_FMT ?= "slim"
 
-do_compile () {
-        for zone in ${TZONES}; do \
-            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
-                ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
-                ${S}/${zone} ; \
-            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
-                ${S}/${zone} ; \
-        done
+do_compile() {
+	for zone in ${TZONES}; do
+		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null ${S}/${zone}
+		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null ${S}/${zone}
+		${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds ${S}/${zone}
+	done
 }
 
-do_install () {
-        install -d ${D}$exec_prefix ${D}${datadir}/zoneinfo
-        cp -pPR ${WORKDIR}$exec_prefix ${D}${base_prefix}
-        # libc is removing zoneinfo files from package
-        cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
-        cp -pP "${S}/zone1970.tab" ${D}${datadir}/zoneinfo
-        cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
-        cp -pP "${S}/leapseconds" ${D}${datadir}/zoneinfo
-        cp -pP "${S}/leap-seconds.list" ${D}${datadir}/zoneinfo
-
-        # Install default timezone
-        if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
-            install -d ${D}${sysconfdir}
-            if [ "${INSTALL_TIMEZONE_FILE}" = "1" ]; then
-                echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
-            fi
-            ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
-        else
-            bberror "DEFAULT_TIMEZONE is set to an invalid value."
-            exit 1
-        fi
-
-        chown -R root:root ${D}
+do_install() {
+	install -d ${D}$exec_prefix ${D}${datadir}/zoneinfo
+	cp -pPR ${WORKDIR}$exec_prefix ${D}${base_prefix}
+	# libc is removing zoneinfo files from package
+	cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
+	cp -pP "${S}/zone1970.tab" ${D}${datadir}/zoneinfo
+	cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
+	cp -pP "${S}/leapseconds" ${D}${datadir}/zoneinfo
+	cp -pP "${S}/leap-seconds.list" ${D}${datadir}/zoneinfo
+
+	# Install default timezone
+	if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
+		install -d ${D}${sysconfdir}
+		if [ "${INSTALL_TIMEZONE_FILE}" = "1" ]; then
+			echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+		fi
+		ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
+	else
+		bberror "DEFAULT_TIMEZONE is set to an invalid value."
+		exit 1
+	fi
+
+	chown -R root:root ${D}
 }
 
-pkg_postinst:${PN} () {
+pkg_postinst:${PN}() {
 	etc_lt="$D${sysconfdir}/localtime"
 	src="$D${sysconfdir}/timezone"
 
-	if [ -e ${src} ] ; then
-		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
+	if [ -e "$src" ]; then
+		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "$src")
 	fi
 
-	if [ ! -z "${tz}" -a ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
-		echo "You have an invalid TIMEZONE setting in ${src}"
-		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
+	if [ ! -z "$tz" -a ! -e "$D${datadir}/zoneinfo/$tz" ]; then
+		echo "You have an invalid TIMEZONE setting in $src"
+		echo "Your $etc_lt has been reset to Universal; enjoy!"
 		tz="Universal"
-		echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
-		if [ -L ${etc_lt} ] ; then
-			rm -f "${etc_lt}"
+		echo "Updating $etc_lt with $D${datadir}/zoneinfo/$tz"
+		if [ -L "$etc_lt" ]; then
+			rm -f "$etc_lt"
 		fi
-		ln -s "${datadir}/zoneinfo/${tz}" "${etc_lt}"
+		ln -s "${datadir}/zoneinfo/$tz" "$etc_lt"
 	fi
 }
 
-# Packages primarily organized by directory with a major city
-# in most time zones in the base package
-
+# Packages are primarily organized by directory with a major city in most time
+# zones in the base package
 TZ_PACKAGES = " \
     tzdata-core tzdata-misc tzdata-posix tzdata-right tzdata-africa \
     tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
-    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
+    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific \
+"
 PACKAGES = "${TZ_PACKAGES} ${PN}"
 
-FILES:tzdata-africa += "${datadir}/zoneinfo/Africa/*"
+FILES:tzdata-africa += "${datadir}/zoneinfo/Africa"
 
-FILES:tzdata-americas += "${datadir}/zoneinfo/America/*  \
-                ${datadir}/zoneinfo/US/*                \
-                ${datadir}/zoneinfo/Brazil/*            \
-                ${datadir}/zoneinfo/Canada/*            \
-                ${datadir}/zoneinfo/Mexico/*            \
-                ${datadir}/zoneinfo/Chile/*"
+FILES:tzdata-americas += " \
+    ${datadir}/zoneinfo/America \
+    ${datadir}/zoneinfo/US \
+    ${datadir}/zoneinfo/Brazil \
+    ${datadir}/zoneinfo/Canada \
+    ${datadir}/zoneinfo/Mexico \
+    ${datadir}/zoneinfo/Chile \
+"
 
-FILES:tzdata-antarctica += "${datadir}/zoneinfo/Antarctica/*"
+FILES:tzdata-antarctica += "${datadir}/zoneinfo/Antarctica"
 
-FILES:tzdata-arctic += "${datadir}/zoneinfo/Arctic/*"
+FILES:tzdata-arctic += "${datadir}/zoneinfo/Arctic"
 
-FILES:tzdata-asia += "${datadir}/zoneinfo/Asia/*        \
-                ${datadir}/zoneinfo/Indian/*            \
-                ${datadir}/zoneinfo/Mideast/*"
+FILES:tzdata-asia += " \
+    ${datadir}/zoneinfo/Asia \
+    ${datadir}/zoneinfo/Indian \
+    ${datadir}/zoneinfo/Mideast \
+"
 
-FILES:tzdata-atlantic += "${datadir}/zoneinfo/Atlantic/*"
+FILES:tzdata-atlantic += "${datadir}/zoneinfo/Atlantic"
 
-FILES:tzdata-australia += "${datadir}/zoneinfo/Australia/*"
+FILES:tzdata-australia += "${datadir}/zoneinfo/Australia"
 
-FILES:tzdata-europe += "${datadir}/zoneinfo/Europe/*"
+FILES:tzdata-europe += "${datadir}/zoneinfo/Europe"
 
-FILES:tzdata-pacific += "${datadir}/zoneinfo/Pacific/*"
+FILES:tzdata-pacific += "${datadir}/zoneinfo/Pacific"
 
-FILES:tzdata-posix += "${datadir}/zoneinfo/posix/*"
+FILES:tzdata-posix += "${datadir}/zoneinfo/posix"
 
-FILES:tzdata-right += "${datadir}/zoneinfo/right/*"
+FILES:tzdata-right += "${datadir}/zoneinfo/right"
 
-FILES:tzdata-misc += "${datadir}/zoneinfo/Cuba           \
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
+FILES:tzdata-misc += " \
+    ${datadir}/zoneinfo/Cuba \
+    ${datadir}/zoneinfo/Egypt \
+    ${datadir}/zoneinfo/Eire \
+    ${datadir}/zoneinfo/Factory \
+    ${datadir}/zoneinfo/GB-Eire \
+    ${datadir}/zoneinfo/Hongkong \
+    ${datadir}/zoneinfo/Iceland \
+    ${datadir}/zoneinfo/Iran \
+    ${datadir}/zoneinfo/Israel \
+    ${datadir}/zoneinfo/Jamaica \
+    ${datadir}/zoneinfo/Japan \
+    ${datadir}/zoneinfo/Kwajalein \
+    ${datadir}/zoneinfo/Libya \
+    ${datadir}/zoneinfo/Navajo \
+    ${datadir}/zoneinfo/Poland \
+    ${datadir}/zoneinfo/Portugal \
+    ${datadir}/zoneinfo/Singapore \
+    ${datadir}/zoneinfo/Turkey \
+"
 
 FILES:tzdata-core += " \
-                ${sysconfdir}/localtime                  \
-                ${sysconfdir}/timezone                   \
-                ${datadir}/zoneinfo/leapseconds          \
-                ${datadir}/zoneinfo/leap-seconds.list    \
-                ${datadir}/zoneinfo/Pacific/Honolulu     \
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
-                ${datadir}/zoneinfo/Asia/Bangkok         \
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
-                ${datadir}/zoneinfo/zone1970.tab         \
-                ${datadir}/zoneinfo/iso3166.tab          \
-                ${datadir}/zoneinfo/Etc/*"
+    ${sysconfdir}/localtime \
+    ${sysconfdir}/timezone \
+    ${datadir}/zoneinfo/leapseconds \
+    ${datadir}/zoneinfo/leap-seconds.list \
+    ${datadir}/zoneinfo/Pacific/Honolulu \
+    ${datadir}/zoneinfo/America/Anchorage \
+    ${datadir}/zoneinfo/America/Los_Angeles \
+    ${datadir}/zoneinfo/America/Denver \
+    ${datadir}/zoneinfo/America/Chicago \
+    ${datadir}/zoneinfo/America/New_York \
+    ${datadir}/zoneinfo/America/Caracas \
+    ${datadir}/zoneinfo/America/Sao_Paulo \
+    ${datadir}/zoneinfo/Europe/London \
+    ${datadir}/zoneinfo/Europe/Paris \
+    ${datadir}/zoneinfo/Africa/Cairo \
+    ${datadir}/zoneinfo/Europe/Moscow \
+    ${datadir}/zoneinfo/Asia/Dubai \
+    ${datadir}/zoneinfo/Asia/Karachi \
+    ${datadir}/zoneinfo/Asia/Dhaka \
+    ${datadir}/zoneinfo/Asia/Bangkok \
+    ${datadir}/zoneinfo/Asia/Hong_Kong \
+    ${datadir}/zoneinfo/Asia/Tokyo \
+    ${datadir}/zoneinfo/Australia/Darwin \
+    ${datadir}/zoneinfo/Australia/Adelaide \
+    ${datadir}/zoneinfo/Australia/Brisbane \
+    ${datadir}/zoneinfo/Australia/Sydney \
+    ${datadir}/zoneinfo/Pacific/Noumea \
+    ${datadir}/zoneinfo/CET \
+    ${datadir}/zoneinfo/CST6CDT \
+    ${datadir}/zoneinfo/EET \
+    ${datadir}/zoneinfo/EST \
+    ${datadir}/zoneinfo/EST5EDT \
+    ${datadir}/zoneinfo/GB \
+    ${datadir}/zoneinfo/GMT \
+    ${datadir}/zoneinfo/GMT+0 \
+    ${datadir}/zoneinfo/GMT-0 \
+    ${datadir}/zoneinfo/GMT0 \
+    ${datadir}/zoneinfo/Greenwich \
+    ${datadir}/zoneinfo/HST \
+    ${datadir}/zoneinfo/MET \
+    ${datadir}/zoneinfo/MST \
+    ${datadir}/zoneinfo/MST7MDT \
+    ${datadir}/zoneinfo/NZ \
+    ${datadir}/zoneinfo/NZ-CHAT \
+    ${datadir}/zoneinfo/PRC \
+    ${datadir}/zoneinfo/PST8PDT \
+    ${datadir}/zoneinfo/ROC \
+    ${datadir}/zoneinfo/ROK \
+    ${datadir}/zoneinfo/UCT \
+    ${datadir}/zoneinfo/UTC \
+    ${datadir}/zoneinfo/Universal \
+    ${datadir}/zoneinfo/W-SU \
+    ${datadir}/zoneinfo/WET \
+    ${datadir}/zoneinfo/Zulu \
+    ${datadir}/zoneinfo/zone.tab \
+    ${datadir}/zoneinfo/zone1970.tab \
+    ${datadir}/zoneinfo/iso3166.tab \
+    ${datadir}/zoneinfo/Etc \
+"
 
 CONFFILES:tzdata-core = "${sysconfdir}/localtime ${sysconfdir}/timezone"
 
 ALLOW_EMPTY:${PN} = "1"
+
 RDEPENDS:${PN} = "${TZ_PACKAGES}"
+RCONFLICTS:${PN} = " \
+    timezones timezone-africa timezone-america timezone-antarctica \
+    timezone-arctic timezone-asia timezone-atlantic timezone-australia \
+    timezone-europe timezone-indian timezone-iso3166.tab timezone-pacific \
+    timezone-zone.tab \
+"

