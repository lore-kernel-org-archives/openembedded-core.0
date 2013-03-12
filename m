Received: from am1ehsobe005.messaging.microsoft.com ([213.199.154.208]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1UFNn4-00084s-Cb
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 12:54:46 +0100
Received: from mail25-am1-R.bigfish.com (10.3.201.239) by
	AM1EHSOBE003.bigfish.com (10.3.204.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 12 Mar 2013 10:52:56 +0000
Received: from mail25-am1 (localhost [127.0.0.1])	by mail25-am1-R.bigfish.com
	(Postfix) with ESMTP id 94E5D2C01F1	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 10:52:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275ch17326ah8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail25-am1 (localhost.localdomain [127.0.0.1]) by mail25-am1
	(MessageSwitch) id 1363085574675304_8855;
	Tue, 12 Mar 2013 10:52:54 +0000 (UTC)
Received: from AM1EHSMHS001.bigfish.com (unknown [10.3.201.229])	by
	mail25-am1.bigfish.com (Postfix) with ESMTP id A275E20058	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2013 10:52:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS001.bigfish.com
	(10.3.207.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 12 Mar 2013 10:52:54 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 12 Mar 2013 10:52:52 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r2CAqndf003473;	Tue, 12 Mar 2013 03:52:50 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Mar 2013 18:52:46 +0800
Message-ID: <1363085567-5474-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 1/2] busybox: detects customized configs when do_install
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
X-List-Received-Date: Tue, 12 Mar 2013 11:54:48 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

After using 'bitbake -c menuconfig busybox' to customize defconfig,
do_install fail to detect the changes. Grep configs in ${S}/.config
instead of defconfig.

Change-Id: I958c232eb9f8096e4113a1c3a2748f5f2eccdeb5
Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-core/busybox/busybox.inc       |   22 +++++++++++-----------
 meta/recipes-core/busybox/busybox_1.20.2.bb |    3 ++-
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index fc6ca91..093bf2e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -149,11 +149,11 @@ do_install () {
 
 	install -d ${D}${sysconfdir}/init.d
 
-	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${WORKDIR}/defconfig; then
+	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=y" ${S}/.config; then
 		# Install /bin/busybox, and the /bin/sh link so the postinst script
 		# can run. Let update-alternatives handle the rest.
 		install -d ${D}${base_bindir}
-		if grep -q "CONFIG_FEATURE_SUID=y" ${WORKDIR}/defconfig; then
+		if grep -q "CONFIG_FEATURE_SUID=y" ${S}/.config; then
 			install -m 4755 ${S}/busybox ${D}${base_bindir}
 		else
 			install -m 0755 ${S}/busybox ${D}${base_bindir}
@@ -179,36 +179,36 @@ do_install () {
 		fi
 	fi
 
-	if grep -q "CONFIG_SYSLOGD=y" ${WORKDIR}/defconfig; then
+	if grep -q "CONFIG_SYSLOGD=y" ${S}/.config; then
 		install -m 0755 ${WORKDIR}/syslog ${D}${sysconfdir}/init.d/syslog.${BPN}
 		install -m 644 ${WORKDIR}/syslog-startup.conf ${D}${sysconfdir}/syslog-startup.conf.${BPN}
 	fi
-	if grep "CONFIG_CROND=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_CROND=y" ${S}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-cron ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HTTPD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_HTTPD=y" ${S}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-httpd ${D}${sysconfdir}/init.d/
 		install -d ${D}/srv/www
 	fi
-	if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_UDHCPD=y" ${S}/.config; then
 		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_HWCLOCK=y" ${S}/.config; then
 		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
 	fi
-	if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_UDHCPC=y" ${S}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
                 install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
 	fi
-	if grep "CONFIG_INETD=y" ${WORKDIR}/defconfig; then
+	if grep "CONFIG_INETD=y" ${S}/.config; then
 		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
 		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
-        if grep "CONFIG_MDEV=y" ${WORKDIR}/defconfig; then
+        if grep "CONFIG_MDEV=y" ${S}/.config; then
                install -m 0755 ${WORKDIR}/mdev ${D}${sysconfdir}/init.d/mdev
-               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${WORKDIR}/defconfig; then
+               if grep "CONFIG_FEATURE_MDEV_CONF=y" ${S}/.config; then
                        install -m 644 ${WORKDIR}/mdev.conf ${D}${sysconfdir}/mdev.conf
                fi
 	fi
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 783261e..255d56c 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -30,6 +30,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://stat-usr-bin.patch \
            file://testsuite-du-du-k-works-fix-false-positive.patch"
 
+
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
 
-- 
1.7.5.4




