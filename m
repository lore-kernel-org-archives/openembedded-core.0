Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2663.1589363399478292999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 02:49:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04D9ncXm003757
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 02:49:48 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Wed, 13 May 2020 02:49:27 -0700
From: "Changqing Li" <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 4/6] initscripts: respect VOLATILE_DIR
Date: Wed, 13 May 2020 17:48:45 +0800
Message-ID: <20200513094847.14326-5-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513094847.14326-1-changqing.li@windriver.com>
References: <20200513094847.14326-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

respect VOLATILE_DIR to support persistent /var/tmp too

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/volatiles | 3 ---
 meta/recipes-core/initscripts/initscripts_1.0.bb        | 8 +++++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index cd8a4be05f..eeeb8905da 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -24,11 +24,8 @@
 # a link will be created at /var/test pointing to /tmp/testfile and due to this
 # link the file defined as /var/test will actually be created as /tmp/testfile.
 d root root 1777 /run/lock none
-d root root 0755 /var/volatile/log none
-d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
 l root root 0755 /var/run /run
-l root root 1777 /var/tmp /var/volatile/tmp
 l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1a59b82fbf..ba6dc068c9 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -104,8 +104,14 @@ do_install () {
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+		echo "d root root 0755 /var/volatile/log none" >> ${D}${sysconfdir}/default/volatiles/00_core
+		echo "d root root 1777 /var/volatile/tmp none" >> ${D}${sysconfdir}/default/volatiles/00_core
 		echo "l root root 0755 /var/log /var/volatile/log" >> ${D}${sysconfdir}/default/volatiles/00_core
+		echo "l root root 0755 /var/tmp /var/volatile/tmp" >> ${D}${sysconfdir}/default/volatiles/00_core
+	else
+		sed -i -e 's;TMPROOT="${ROOT_DIR}/var/volatile/tmp";TMPROOT="${ROOT_DIR}/var/tmp";g' \
+                    ${D}${sysconfdir}/init.d/populate-volatile.sh
 	fi
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
-- 
2.17.1

