Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)
	id 1Suqsm-0006fe-Mx for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 22:11:33 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6RJnYP9017423
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 14:49:34 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6RJnYqW016969
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 14:49:34 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 27 Jul 2012 14:49:34 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q6RJnYcE014178;	Fri, 27 Jul 2012 14:49:34 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1SuqZw-0007Rv-W4; Fri, 27 Jul 2012 14:52:04 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 14:52:03 -0500
Message-ID: <1343418723-28606-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH] busybox: Add inetd related files
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
X-List-Received-Date: Fri, 27 Jul 2012 20:11:33 -0000
X-Groupsio-MsgNum: 26411
Content-Type: multipart/mixed; boundary="------------1.7.0.4"

--------------1.7.0.4
Content-Type: text/plain; charset="UTF-8"; format=fixed
Content-Transfer-Encoding: 8bit


* Add back inetd and inetd.conf files which are needed if
  CONFIG_INETD is enabled in the defconfig. Grabbed these files
  from oe-classic

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 meta/recipes-core/busybox/busybox_1.19.4.bb |    4 ++-
 meta/recipes-core/busybox/files/inetd       |   33 +++++++++++++++++++++++++++
 meta/recipes-core/busybox/files/inetd.conf  |   20 ++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100755 meta/recipes-core/busybox/files/inetd
 create mode 100644 meta/recipes-core/busybox/files/inetd.conf


--------------1.7.0.4
Content-Type: text/x-patch;
	name="0001-busybox-Add-inetd-related-files.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
	filename="0001-busybox-Add-inetd-related-files.patch"

diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index ad8297e..f87cb5f 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -24,7 +24,9 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mdev \
            file://mdev.conf \
            file://umount.busybox \
-           file://defconfig"
+           file://defconfig \
+           file://inetd.conf \
+           file://inetd"
 
 SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
 SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"
diff --git a/meta/recipes-core/busybox/files/inetd b/meta/recipes-core/busybox/files/inetd
new file mode 100755
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

--------------1.7.0.4--
