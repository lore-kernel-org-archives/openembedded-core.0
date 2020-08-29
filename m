Received: from p3plsmtpa08-10.prod.phx3.secureserver.net (p3plsmtpa08-10.prod.phx3.secureserver.net [173.201.193.111])
 by mx.groups.io with SMTP id smtpd.web10.20535.1598736393601647679
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 14:26:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pabigot.com, ip: 173.201.193.111, mailfrom: pab@pabigot.com)
Received: from tirzah.pab ([73.65.46.39])
	by :SMTPAUTH: with ESMTPSA
	id C8MqkZYZtxKPFC8Mqko2t3; Sat, 29 Aug 2020 14:26:33 -0700
X-CMAE-Analysis: v=2.3 cv=CZh2G4jl c=1 sm=1 tr=0
 a=G5fDw918NYv3KufUwDvNPg==:117 a=G5fDw918NYv3KufUwDvNPg==:17 a=tR03Z30jAAAA:8
 a=UxJ7PgdAM4fVDu7hk9sA:9 a=KfdqL2KK0gLj6ZZCE6RX:22
X-SECURESERVER-ACCT: pab@pabigot.com
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [PATCH] timezone: include leap second data in tzdata-core
Date: Sat, 29 Aug 2020 16:26:31 -0500
Message-Id: <20200829212631.1018922-1-pab@pabigot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEf0TBN5KV4gHzNs0P89E0rFyU2sLadHNffnBXDsC9lVsr46isd9XGRixAhN/Tqqc7IkubFsGEJ8Gcu7qO6lH0NErk6USyJ7v2wSPdRiIsQ/zsM+x0Jw
 VPyUn9gWYVfqsVFrtarwpK0uBQBeIwth9f0FErW5AjPRSr8RrpDEZ2FPXMkpHqNLosBgExKiKF9dWa3crLz7oSknnYVNxaVBR68=
Content-Transfer-Encoding: 8bit

Conversion between UTC and continuous time scales like TAI requires
information about leap seconds.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-extended/timezone/tzdata.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 1e2b440fb0e..6aac516f694 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -37,6 +37,8 @@ do_install () {
         cp -pP "${S}/zone.tab" ${D}${datadir}/zoneinfo
         cp -pP "${S}/zone1970.tab" ${D}${datadir}/zoneinfo
         cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
+        cp -pP "${S}/leapseconds" ${D}${datadir}/zoneinfo
+        cp -pP "${S}/leap-seconds.list" ${D}${datadir}/zoneinfo
 
         # Install default timezone
         if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
@@ -145,6 +147,8 @@ RPROVIDES_tzdata-misc = "tzdata-misc"
 FILES_tzdata-core += " \
                 ${sysconfdir}/localtime                  \
                 ${sysconfdir}/timezone                   \
+                ${datadir}/zoneinfo/leapseconds          \
+                ${datadir}/zoneinfo/leap-seconds.list    \
                 ${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/America/Anchorage    \
                 ${datadir}/zoneinfo/America/Los_Angeles  \
-- 
2.25.1

