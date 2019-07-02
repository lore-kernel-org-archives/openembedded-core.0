Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BC107E815
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 09:01:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6291Z2S014483
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 02:01:35 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Jul 2019 02:01:34 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jul 2019 16:43:49 +0800
Message-ID: <1562057030-238757-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sysstat:The sysstat.service in source should be installed for cron with systemd
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
X-List-Received-Date: Tue, 02 Jul 2019 09:01:36 -0000
Content-Type: text/plain

The sysstat.service script in source launchs sysstat-collect and sysstat-summary
services when cron is installed with systemd. At this time, the upstream
sysstat.service must be installed.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 4e29721..592cbf4 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -20,6 +20,7 @@ inherit autotools-brokensep gettext systemd upstream-version-is-even
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
 PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
+PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
 
 EXTRA_OECONF += "--disable-stripping"
 
@@ -44,11 +45,13 @@ do_install() {
 	        install -d ${D}${sysconfdir}/tmpfiles.d
 	        echo "d ${localstatedir}/log/sa - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
-	fi
 
-	install -d ${D}${systemd_unitdir}/system
-	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
-	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron', 'false', 'true', d)}; then
+			install -d ${D}${systemd_unitdir}/system
+			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
+			sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+	        fi
+	fi
 }
 
 pkg_postinst_${PN} () {
-- 
1.9.1


