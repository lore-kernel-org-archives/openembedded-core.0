Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 958807828E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:29:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K7Txu7018625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 00:30:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 20 Jul 2017 00:29:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Jul 2017 15:33:58 +0800
Message-ID: <bbaefec1cc7d78a0ba7989b4795f469d388f6afe.1500535946.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1500535946.git.Qi.Chen@windriver.com>
References: <cover.1500535946.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dhcp: add dhclient.service
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
X-List-Received-Date: Thu, 20 Jul 2017 07:29:59 -0000
Content-Type: text/plain

Add dhclient.service. This service file mainly comes from meta-systemd,
with modifications to take nfs boot into consideration.

While using eth0 as the nfsboot interface, we'd like dhclient service
to skip it like what ifup and connman do in sysvinit.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            | 21 ++++++++++--
 .../dhcp/files/dhclient-systemd-wrapper            | 39 ++++++++++++++++++++++
 .../dhcp/files/dhclient.service                    | 13 ++++++++
 3 files changed, 70 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient.service

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 292f192..db4a963 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -17,6 +17,8 @@ SRC_URI = "http://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
+           file://dhclient-systemd-wrapper \
+           file://dhclient.service \
            file://dhcpd.service file://dhcrelay.service \
            file://dhcpd6.service \
            file://search-for-libxml2.patch "
@@ -29,13 +31,16 @@ inherit autotools systemd useradd update-rc.d
 USERADD_PACKAGES = "${PN}-server"
 USERADD_PARAM_${PN}-server = "--system --no-create-home --home-dir /var/run/${PN} --shell /bin/false --user-group ${PN}"
 
-SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay"
+SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay ${PN}-client"
 SYSTEMD_SERVICE_${PN}-server = "dhcpd.service dhcpd6.service"
 SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
 
 SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
 SYSTEMD_AUTO_ENABLE_${PN}-relay = "disable"
 
+SYSTEMD_SERVICE_${PN}-client = "dhclient.service"
+SYSTEMD_AUTO_ENABLE_${PN}-client = "disable"
+
 INITSCRIPT_PACKAGES = "dhcp-server"
 INITSCRIPT_NAME_dhcp-server = "dhcp-server"
 INITSCRIPT_PARAMS_dhcp-server = "defaults"
@@ -79,7 +84,13 @@ do_install_append () {
 	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
 	sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
 	sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir}/system/dhcpd*.service
-       sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+
+	install -d ${D}${base_sbindir}
+	install -m 0755 ${WORKDIR}/dhclient-systemd-wrapper ${D}${base_sbindir}/dhclient-systemd-wrapper
+	install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhclient.service
+	sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/dhclient.service
 }
 
 PACKAGES += "dhcp-libs dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
@@ -97,7 +108,11 @@ FILES_${PN}-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhc
 
 FILES_${PN}-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_${PN}-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
+FILES_${PN}-client = "${base_sbindir}/dhclient \
+                      ${base_sbindir}/dhclient-script \
+                      ${sysconfdir}/dhcp/dhclient.conf \
+                      ${base_sbindir}/dhclient-systemd-wrapper \
+                     "
 
 FILES_${PN}-omshell = "${bindir}/omshell"
 
diff --git a/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper b/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
new file mode 100644
index 0000000..7d0e224
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+# In case the interface is used for nfs, skip it.
+nfsroot=0
+interfaces=""
+exec 9<&0 < /proc/mounts
+while read dev mtpt fstype rest; do
+    if test $mtpt = "/" ; then
+        case $fstype in
+            nfs | nfs4)
+                nfsroot=1
+                nfs_addr=`echo $rest | sed -e 's/^.*addr=\([0-9.]*\).*$/\1/'`
+                break
+                ;;
+            *)
+                ;;
+        esac
+    fi
+done
+exec 0<&9 9<&-
+
+if [ $nfsroot -eq 0 ]; then
+    interfaces="$INTERFACES"
+else
+    if [ -x /bin/ip -o -x /sbin/ip ] ; then
+	nfs_iface=`ip route get $nfs_addr | grep dev | sed -e 's/^.*dev \([-a-z0-9.]*\).*$/\1/'`
+    fi
+    for i in $INTERFACES; do
+	if test "x$i" = "x$nfs_iface"; then
+            echo "dhclient skipping nfsroot interface $i"
+	else
+	    interfaces="$interfaces $i"
+	fi
+    done
+fi
+
+if test "x$interfaces" != "x"; then
+    /sbin/dhclient -d -cf /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases $interfaces
+fi
diff --git a/meta/recipes-connectivity/dhcp/files/dhclient.service b/meta/recipes-connectivity/dhcp/files/dhclient.service
new file mode 100644
index 0000000..9ddb4d1
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/files/dhclient.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Dynamic Host Configuration Protocol (DHCP)
+Wants=network.target
+Before=network.target
+After=systemd-udevd.service
+
+[Service]
+EnvironmentFile=-@SYSCONFDIR@/default/dhcp-client
+ExecStart=@BASE_SBINDIR@/dhclient-systemd-wrapper
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
1.9.1


