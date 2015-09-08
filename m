Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id C6CBC76EBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:52:54 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id C089BD4035F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:45 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 756B3D40356
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from rhein2.am93.sysmocom.de
	(ip18863918.dynamic.kabel-deutschland.de [24.134.57.24])
	by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 17:47:44 +0200 (CEST)
From: Henning Heinold <henning@itconsulting-heinold.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:47:34 +0200
Message-Id: <1441727255-16829-2-git-send-email-henning@itconsulting-heinold.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441727255-16829-1-git-send-email-henning@itconsulting-heinold.de>
References: <1441727255-16829-1-git-send-email-henning@itconsulting-heinold.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [RFC 0/2] busybox:udhcpc: add option for modify resolv.conf
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
X-List-Received-Date: Tue, 08 Sep 2015 15:52:57 -0000

* add a default file for udhcpc which is sourced
  in simple.script
* add a configuration option to the default file
  and simple.script for enable/disable the
  modification of /etc/resolv.conf
* the default behavior was not changed

This work was sponsored by sysmocom GmbH

Signed-off-by: Henning Heinold <henning@itconsulting-heinold.de>
---
 meta/recipes-core/busybox/busybox.inc          |  4 +++-
 meta/recipes-core/busybox/busybox_1.23.2.bb    |  1 +
 meta/recipes-core/busybox/busybox_git.bb       |  1 +
 meta/recipes-core/busybox/files/simple.script  | 28 +++++++++++++++-----------
 meta/recipes-core/busybox/files/udhcpc.default |  2 ++
 5 files changed, 23 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/udhcpc.default

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index ed8f9fe..71605be 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -25,7 +25,7 @@ FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
 FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
-FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
+FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc ${datadir}/default/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
 
 INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
@@ -259,8 +259,10 @@ do_install () {
 	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
 		install -d ${D}${sysconfdir}/udhcpc.d
 		install -d ${D}${datadir}/udhcpc
+		install -d ${D}${sysconfdir}/default
                 install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.d/50default
 		install -m 0755 ${WORKDIR}/default.script ${D}${datadir}/udhcpc/default.script
+		install -m 0644 ${WORKDIR}/udhcpc.default ${D}${sysconfdir}/default/udhcpc
 	fi
 	if grep "CONFIG_INETD=y" ${B}/.config; then
 		install -m 0755 ${WORKDIR}/inetd ${D}${sysconfdir}/init.d/inetd.${BPN}
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 8a4bae6..b904cf7 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-udhcpd \
            file://default.script \
            file://simple.script \
+           file://udhcpc.default \
            file://hwclock.sh \
            file://mount.busybox \
            file://syslog \
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index ade72f4..4c04557 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://busybox-udhcpd \
            file://default.script \
            file://simple.script \
+           file://udhcpc.default \
            file://hwclock.sh \
            file://mount.busybox \
            file://syslog \
diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 22168b0..216a56f 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -4,6 +4,8 @@
 
 [ -z "$1" ] && echo "Error: should be called from udhcpc" && exit 1
 
+[ -r /etc/default/udhcpc ] && . /etc/default/udhcpc
+
 RESOLV_CONF="/etc/resolv.conf"
 [ -n "$subnet" ] && NETMASK="netmask $subnet"
 
@@ -67,22 +69,24 @@ case "$1" in
 			done
 		fi
 
-		# Update resolver configuration file
-		R=""
-		[ -n "$domain" ] && R="domain $domain
+		if [ "$STATIC_DNS" != "yes" ]; then
+			# Update resolver configuration file
+			R=""
+			[ -n "$domain" ] && R="domain $domain
 "
-		for i in $dns; do
-			echo "$0: Adding DNS $i"
-			R="${R}nameserver $i
+			for i in $dns; do
+				echo "$0: Adding DNS $i"
+				R="${R}nameserver $i
 "
-		done
+			done
 
-		if [ -x /sbin/resolvconf ]; then
-			echo -n "$R" | /sbin/resolvconf -a "${interface}.udhcpc"
-		else
-			echo -n "$R" > "$RESOLV_CONF"
+			if [ -x /sbin/resolvconf ]; then
+				echo -n "$R" | /sbin/resolvconf -a "${interface}.udhcpc"
+			else
+				echo -n "$R" > "$RESOLV_CONF"
+			fi
+			;;
 		fi
-		;;
 esac
 
 exit 0
diff --git a/meta/recipes-core/busybox/files/udhcpc.default b/meta/recipes-core/busybox/files/udhcpc.default
new file mode 100644
index 0000000..2c42cf0
--- /dev/null
+++ b/meta/recipes-core/busybox/files/udhcpc.default
@@ -0,0 +1,2 @@
+# Uncomment the following line, if udhcpc should not touch /etc/resolv.conf
+#STATIC_DNS="yes"
-- 
1.9.1

