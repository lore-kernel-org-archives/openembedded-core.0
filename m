Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1URgo1-0002Tt-KO
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:38:38 +0200
Received: from mail157-ch1-R.bigfish.com (10.43.68.235) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Mon, 15 Apr 2013 09:50:55 +0000
Received: from mail157-ch1 (localhost [127.0.0.1])	by
	mail157-ch1-R.bigfish.com (Postfix) with ESMTP id 7AC9A3600EE	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:50:55 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275chz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail157-ch1 (localhost.localdomain [127.0.0.1]) by mail157-ch1
	(MessageSwitch) id 1366019454207618_7306;
	Mon, 15 Apr 2013 09:50:54 +0000 (UTC)
Received: from CH1EHSMHS031.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.238])	by mail157-ch1.bigfish.com (Postfix) with ESMTP id
	3078A2A0064	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:50:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS031.bigfish.com
	(10.43.70.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 15 Apr 2013 09:50:54 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 15 Apr 2013 09:50:53 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r3F9oqPf018978; Mon, 15 Apr 2013 02:50:52 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2013 04:50:51 -0500
Message-ID: <1366019452-4265-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 1/2] busybox: detects customized configs when do_install
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
X-List-Received-Date: Mon, 15 Apr 2013 10:38:51 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

After using 'bitbake -c menuconfig busybox' to customize defconfig,
do_install fail to detect the changes. Grep configs in ${B}/.config
instead of ${WORKDIR}/defconfig.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-core/busybox/busybox.inc       |   26 +++++++++++++-------------
 meta/recipes-core/busybox/busybox_1.20.2.bb |    2 +-
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 655cb3c..a2e83ec 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -153,14 +153,14 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/init.d
 
-	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${WORKDIR}/defconfig; then
+	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${B}/.config; then
 		# Install /bin/busybox, and the /bin/sh link so the postinst script
 		# can run. Let update-alternatives handle the rest.
 		install -d ${D}${base_bindir}
-		if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
-			install -m 4755 ${S}/busybox ${D}${base_bindir}
+		if grep -q "CONFIG_FEATURE_SUID=y" ${B}/.config; then
+			install -m 4755 ${B}/busybox ${D}${base_bindir}
 		else
-			install -m 0755 ${S}/busybox ${D}${base_bindir}
+			install -m 0755 ${B}/busybox ${D}${base_bindir}
 		fi
 		ln -sf busybox ${D}${base_bindir}/sh
 	else
@@ -183,36 +183,36 @@ do_install () {
 		fi
 	fi
 
-	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
+	if grep -q "CONFIG_SYSLOGD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
 		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf.${BPN}
 	fi
-	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_CROND=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HTTPD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_HTTPD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
 		install -d ${D}/srv/www
 	fi
-	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_UDHCPD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
                 install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 	fi
-	if grep "CONFIG_INETD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_INETD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
 		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
-        if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
+        if grep "CONFIG_MDEV=y" ${B}/.config; then
                install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
-               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
+               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${B}/.config; then
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
                fi
 	fi
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 401c1eb..bb97044 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
-- 
1.7.9.7




