Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1URgZP-0000ur-3N
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:23:31 +0200
Received: from mail135-ch1-R.bigfish.com (10.43.68.232) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Mon, 15 Apr 2013 09:50:56 +0000
Received: from mail135-ch1 (localhost [127.0.0.1])	by
	mail135-ch1-R.bigfish.com (Postfix) with ESMTP id 788A8404A1	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:50:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 16
X-BigFish: VS16(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dh8275ch1b8612ihz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail135-ch1 (localhost.localdomain [127.0.0.1]) by mail135-ch1
	(MessageSwitch) id 1366019454451970_27518;
	Mon, 15 Apr 2013 09:50:54 +0000 (UTC)
Received: from CH1EHSMHS031.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.245])	by mail135-ch1.bigfish.com (Postfix) with ESMTP id
	5D07E4C019A	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:50:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS031.bigfish.com
	(10.43.70.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 15 Apr 2013 09:50:54 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 15 Apr 2013 09:50:53 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	r3F9oqPg018978; Mon, 15 Apr 2013 02:50:53 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2013 04:50:52 -0500
Message-ID: <1366019452-4265-2-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1366019452-4265-1-git-send-email-b28495@freescale.com>
References: <1366019452-4265-1-git-send-email-b28495@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 2/2] busybox: Add inetd related files
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
X-List-Received-Date: Mon, 15 Apr 2013 10:23:32 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Add back inetd and inetd.conf files which are needed if
CONFIG_INETD is enabled in the defconfig. Grabbed these
files from oe-classic

This patch is based on the previous patch for denzil:
http://patches.openembedded.org/patch/33235/

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-core/busybox/busybox.inc       |    1 +
 meta/recipes-core/busybox/busybox_1.20.2.bb |    6 +++--
 meta/recipes-core/busybox/files/inetd       |   33 +++++++++++++++++++++++++++
 meta/recipes-core/busybox/files/inetd.conf  |   20 ++++++++++++++++
 4 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/inetd
 create mode 100644 meta/recipes-core/busybox/files/inetd.conf

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index a2e83ec..0a235b9 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -208,6 +208,7 @@ do_install () {
 	fi
 	if grep "CONFIG_INETD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
+		sed -i "s:/usr/sbin/:${sbindir}/:" ${D}${sysconfdir}/init.d/inetd.${BPN}
 		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
 	fi
         if grep "CONFIG_MDEV=y" ${B}/.config; then
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index bb97044..1445a5e 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -32,7 +32,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-klogd.service.in \
            file://testsuite-du-du-k-works-fix-false-positive.patch \
            file://strict-atime.patch \
-           file://fail_on_no_media.patch"
+           file://fail_on_no_media.patch \
+           file://inetd.conf \
+           file://inetd"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
diff --git a/meta/recipes-core/busybox/files/inetd b/meta/recipes-core/busybox/files/inetd
new file mode 100644
index 0000000..cf50bcd
--- /dev/null
+++ b/meta/recipes-core/busybox/files/inetd
@@ -0,0 +1,33 @@
+#!/bin/sh
+#
+# start/stop inetd super server.
+
+if ! [ -x /usr/sbin/inetd ]; then
+	exit 0
+fi
+
+case "$1" in
+    start)
+	echo -n "Starting internet superserver:"
+	echo -n " inetd" ; start-stop-daemon -S -x /usr/sbin/inetd > /dev/null
+	echo "."
+	;;
+    stop)
+	echo -n "Stopping internet superserver:"
+	echo -n " inetd" ; start-stop-daemon -K -x /usr/sbin/inetd > /dev/null
+	echo "."
+	;;
+    restart)
+	echo -n "Restarting internet superserver:"
+	echo -n " inetd "
+	killall -HUP inetd
+	echo "."
+	;;
+    *)
+	echo "Usage: /etc/init.d/inetd {start|stop|restart}"
+	exit 1
+	;;
+esac
+
+exit 0
+
diff --git a/meta/recipes-core/busybox/files/inetd.conf b/meta/recipes-core/busybox/files/inetd.conf
new file mode 100644
index 0000000..b02fe85
--- /dev/null
+++ b/meta/recipes-core/busybox/files/inetd.conf
@@ -0,0 +1,20 @@
+# /etc/inetd.conf:  see inetd(8) for further informations.
+#
+# Internet server configuration database
+#
+# If you want to disable an entry so it isn't touched during
+# package updates just comment it out with a single '#' character.
+#
+# <service_name> <sock_type> <proto> <flags> <user> <server_path> <args>
+#
+#:INTERNAL: Internal services
+#echo		stream	tcp	nowait	root	internal
+#echo		dgram	udp	wait	root	internal
+#chargen	stream	tcp	nowait	root	internal
+#chargen	dgram	udp	wait	root	internal
+#discard		stream	tcp	nowait	root	internal
+#discard		dgram	udp	wait	root	internal
+#daytime		stream	tcp	nowait	root	internal
+#daytime	dgram	udp	wait	root	internal
+#time		stream	tcp	nowait	root	internal
+#time		dgram	udp	wait	root	internal
-- 
1.7.9.7




