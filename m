Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QCqAE-0004DK-P2
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 11:27:06 +0200
Received: by wwb17 with SMTP id 17so1547685wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 02:24:43 -0700 (PDT)
Received: by 10.227.209.137 with SMTP id gg9mr4010204wbb.124.1303377883008;
	Thu, 21 Apr 2011 02:24:43 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id bs4sm1061700wbb.52.2011.04.21.02.24.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Apr 2011 02:24:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2011 11:24:29 +0200
Message-Id: <1303377869-7822-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] cronie 1.4.7: fix packaging
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
X-List-Received-Date: Thu, 21 Apr 2011 09:27:06 -0000

Syslog is full with entries like:

/usr/sbin/crond[773]: (CRON) STAT FAILED (/etc/cron.d): No such file or directory

Checking the package yields

Package cronie (1.4.6-r0) is installed on root and has the following files:
/usr/sbin/crond
/etc/init.d/crond
/usr/bin/crontab
/etc/sysconfig/crond

Which is missing most of what do_install_append installs, this commit fixes that

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/cronie/cronie_1.4.7.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.7.bb b/meta/recipes-extended/cronie/cronie_1.4.7.bb
index 7d6093a..6318d0e 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.7.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
 
 SECTION = "utils"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
@@ -37,13 +37,15 @@ do_install_append () {
 	# below are necessary for a complete cron environment
 	install -d ${D}${localstatedir}/spool/cron
 	install -m 0755 ${WORKDIR}/crontab ${D}${sysconfdir}/
-        mkdir -p ${D}${sysconfdir}/cron.d
+	mkdir -p ${D}${sysconfdir}/cron.d
 	mkdir -p ${D}${sysconfdir}/cron.hourly
 	mkdir -p ${D}${sysconfdir}/cron.daily
 	mkdir -p ${D}${sysconfdir}/cron.weekly
 	mkdir -p ${D}${sysconfdir}/cron.monthly
 }
 
+FILES_${PN} += "${sysconfdir}/cron*"
+
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ] ; then
 		exit 1
-- 
1.6.6.1



