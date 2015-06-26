Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id BA9AD75A06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 08:51:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97784212"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2015 16:55:58 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5Q8oHwx011505
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 16:50:17 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Jun 2015 16:51:55 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jun 2015 16:51:47 +0800
Message-ID: <1435308707-1834-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] init-ifupdown: modify init script and add systemd support
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
X-List-Received-Date: Fri, 26 Jun 2015 08:51:56 -0000
Content-Type: text/plain

1) when the Root file system using the method of NFS,
the networking service can not start successfully,so modify
the init script.
2) add systemd service file networking.service.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../init-ifupdown/init-ifupdown-1.0/init           | 68 ++++++++++++++++++----
 .../init-ifupdown-1.0/networking.service           | 13 +++++
 .../init-ifupdown/init-ifupdown-1.0/niccheck       | 34 +++++++++++
 .../init-ifupdown/init-ifupdown_1.0.bb             | 15 ++++-
 4 files changed, 117 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/networking.service
 create mode 100644 meta/recipes-core/init-ifupdown/init-ifupdown-1.0/niccheck

diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
index fb31c63..673b1ce 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/init
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          networking
 # Required-Start:    mountvirtfs $local_fs
@@ -55,36 +55,82 @@ check_network_swap() {
     exec 0<&9 9<&-
 }
 
-case "$1" in
-start)
+fix_if_state() {
+	[ ! -e "/var/run/ifstate" ] && touch /var/run/ifstate
+
+	exec 9<&0 < /var/run/ifstate
+	while read NICSTATE; do
+		NIC=`echo $NICSTATE | awk -F '=' '{print $1}'`
+		ifconfig | grep $NIC > /dev/null
+		if [ "$?" -ne "0" ]; then
+			sed -i 's/$NICSTATE//g' /var/run/ifstate
+		fi
+	done
+	exec 0<&9 9<&-
+
+	NICLIST=`ifconfig | grep -v "^ " | awk '{print $1}'`
+	for NIC in $NICLIST; do
+		grep "$NIC=$NIC" /var/run/ifstate >/dev/null
+		if [ "$?" -ne "0" ]; then
+			echo "$NIC=$NIC" >> /var/run/ifstate
+		fi
+	done
+}
+
+start_net() {
+	fix_if_state
 	echo -n "Configuring network interfaces... "
-	sysctl -e -p /etc/sysctl.conf >/dev/null 2>&1
 	ifup -a
-	echo "done."
-	;;
+}
 
-stop)
+stop_net() {
+	fix_if_state
 	check_network_file_systems
 	check_network_swap
 
 	echo -n "Deconfiguring network interfaces... "
 	ifdown -a
+}
+
+RETVAL=0
+case "$1" in
+start)
+	start_net
+	RETVAL=$?
+	echo "done."
+	;;
+
+stop)
+	stop_net
+	RETVAL=$?
 	echo "done."
 	;;
 
 force-reload|restart)
 	echo "Running $0 $1 is deprecated because it may not enable again some interfaces"
 	echo "Reconfiguring network interfaces... "
-	ifdown -a || true
-	ifup -a
+	stop_net
+	RETVAL=$?
+	if [ "$RETVAL" -eq "0" ]; then
+		start_net
+		RETVAL=$?
+	fi
 	echo "done."
 	;;
 
+status)
+        echo $"Configured devices:"
+        echo $(grep iface /etc/network/interfaces | awk '{print $2}')
+
+        echo $"Currently active devices:"
+        echo $(ip -o link show up | awk -F ": " '{ print $2 }')
+        ;;
+
 *)
-	echo "Usage: /etc/init.d/networking {start|stop}"
+	echo "Usage: /etc/init.d/networking {start|stop|status}"
 	exit 1
 	;;
 esac
 
-exit 0
+exit $RETVAL
 
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/networking.service b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/networking.service
new file mode 100644
index 0000000..bd48598
--- /dev/null
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/networking.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Networking
+Wants=network.target
+Before=network.target
+
+[Service]
+Type=oneshot
+ExecStart=@libexecdir@/networking start
+ExecStop=@libexecdir@/networking stop
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/niccheck b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/niccheck
new file mode 100644
index 0000000..6162b18
--- /dev/null
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/niccheck
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+check_nic_status()
+{
+	NIC=$1
+
+	ifconfig | grep ^$NIC > /dev/null
+	LOISUP="$?"
+
+	grep "$NIC=$NIC" /var/run/ifstate  > /dev/null
+	LOISSIGN="$?"
+
+	if [ "$LOISUP" -ne "0" -a "$LOISSIGN" -eq "0" ]; then
+		echo "========================================================"
+		echo "$NIC is down, but it's signed up"
+		echo "Try the following command to fix this error"
+		echo " # sed -i 's/$NIC=$NIC//g' /var/run/ifstate"
+		echo "========================================================"
+		return 1
+	elif [ "$LOISUP" -eq "0" -a "$LOISSIGN" -ne "0" ]; then
+		echo "========================================================"
+		echo "$NIC is up, but it had not beed writed to /var/run/ifstate"
+		echo "Reconfigure it will catch a error "
+		echo "Try the following command to fix this error"
+		echo "  # echo "$NIC=$NIC" >> /var/run/ifstate"
+		echo "========================================================"
+		return 1
+	fi
+}
+
+check_nic_status $IFACE
+
+exit 0
+
diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
index 733ae41..fb579f1 100644
--- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
+++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
 PR = "r7"
 
-inherit update-rc.d
+inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "networking"
 INITSCRIPT_PARAMS = "start 01 2 3 4 5 . stop 80 0 6 1 ."
@@ -14,7 +14,10 @@ INITSCRIPT_PARAMS = "start 01 2 3 4 5 . stop 80 0 6 1 ."
 SRC_URI = "file://copyright \
            file://init \
            file://interfaces \
-           file://nfsroot"
+           file://nfsroot \
+           file://networking.service \
+           file://niccheck \
+          "
 
 S = "${WORKDIR}"
 
@@ -27,6 +30,12 @@ do_install () {
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
 	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
 	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
+install -d ${D}/${systemd_unitdir}/system
+install -m 644 ${WORKDIR}/networking.service ${D}/${systemd_unitdir}/system
+sed -i -e 's,@libexecdir@,${libexecdir},g' ${D}/${systemd_unitdir}/system/networking.service
+install -d ${D}/${libexecdir}
+install -m 755 ${WORKDIR}/init ${D}/${libexecdir}/networking
+install -m 755 ${WORKDIR}/niccheck ${D}${sysconfdir}/network/if-pre-up.d/
 }
 
 do_install_append_qemuall () {
@@ -39,3 +48,5 @@ RDEPENDS_${PN} = "netbase"
 RCONFLICTS_${PN} = "netbase (< 1:5.0)"
 
 CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
+
+SYSTEMD_SERVICE_${PN} = "networking.service"
-- 
1.8.4.2


