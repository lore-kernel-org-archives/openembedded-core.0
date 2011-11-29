Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVHnb-000367-4c
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 08:08:15 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so8947887bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 23:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=4/g2BWuaSMXsS21czfLNUwOZVFFA+gIWuBU162Mq7ug=;
	b=s7+YVvu1D5IumEm2D5QlgYz+5XuKqITiNoD82La87d7J7MeLM3uX7Aiy2xQkJkN9W5
	i3kvKU8V7U3FHawjZC/P6nuYisAXTm+m/6+xvq1ZG3q4Ov65hI/Vs/Zfn4Cxz5uONngd
	sKehgSncS8QYh+haUgbXGv0AdvP/9Hwxl1j3Y=
Received: by 10.204.152.87 with SMTP id f23mr49230739bkw.18.1322550092200;
	Mon, 28 Nov 2011 23:01:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e8sm34991790bkd.7.2011.11.28.23.01.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 23:01:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 08:00:54 +0100
Message-Id: <62c60424478e493bdee61e7f3853f77feef6421d.1322549636.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc3
In-Reply-To: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
References: <475348b418f9ebf0a395de9a0ec42ee91d541dc8.1322549636.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322549636.git.Martin.Jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
Subject: [oe-core 04/10] cronie: use useradd.bbclass instead of hardcoded groupadd calls
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
X-List-Received-Date: Tue, 29 Nov 2011 07:08:15 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/cronie/cronie_1.4.8.bb |   33 +++++++++++--------------
 1 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.4.8.bb b/meta/recipes-extended/cronie/cronie_1.4.8.bb
index 064347e..2d25627 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.8.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.8.bb
@@ -18,7 +18,7 @@ DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)}"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
@@ -31,7 +31,7 @@ PAM_SRC_URI = "file://crond_pam_config.patch"
 SRC_URI[md5sum] = "9b1d2ce6db8d1883e06635f437170657"
 SRC_URI[sha256sum] = "a3b910876f255712f1a5c364b74f34b0ceac9f6f3bbc45e854c5722785f513b3"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d useradd
 
 EXTRA_OECONF += "\
                 ${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam', '--without-pam', d)}"
@@ -39,6 +39,9 @@ EXTRA_OECONF += "\
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "crontab"
+
 do_install_append () {
 	install -d ${D}${sysconfdir}/sysconfig/
 	install -d ${D}${sysconfdir}/init.d/
@@ -54,25 +57,19 @@ do_install_append () {
 	mkdir -p ${D}${sysconfdir}/cron.weekly
 	mkdir -p ${D}${sysconfdir}/cron.monthly
 	touch ${D}${sysconfdir}/cron.deny
-}
-
-FILES_${PN} += "${sysconfdir}/cron*"
-
-pkg_postinst_${PN} () {
-	if [ "x$D" != "x" ] ; then
-		exit 1
-	fi
-
+	
 	# below setting is necessary to allow normal user using crontab
 
-	# add 'crontab' group and setgid for crontab binary
-	grep crontab /etc/group || addgroup crontab
-	chown root:crontab /usr/bin/crontab
-	chmod 2755 /usr/bin/crontab
+	# setgid for crontab binary
+	chown root:crontab ${D}/usr/bin/crontab
+	chmod 2755 ${D}/usr/bin/crontab
 
 	# allow 'crontab' group write to /var/spool/cron
-	chown root:crontab /var/spool/cron
-	chmod 770 /var/spool/cron
+	chown root:crontab ${D}/var/spool/cron
+	chmod 770 ${D}/var/spool/cron
 
-	chmod 600 /etc/crontab
+	chmod 600 ${D}/etc/crontab
 }
+
+FILES_${PN} += "${sysconfdir}/cron*"
+
-- 
1.7.8.rc3



