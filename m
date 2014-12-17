Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 481AA72644
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Dec 2014 07:24:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBH7OOBx026095
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 23:24:24 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 16 Dec 2014 23:24:23 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Dec 2014 15:24:23 +0800
Message-ID: <9692a31b1c3aba614d1d26dc26abfb0d029466e2.1418800947.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1418800947.git.Qi.Chen@windriver.com>
References: <cover.1418800947.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] dhcp: add dhclient.service
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
X-List-Received-Date: Wed, 17 Dec 2014 07:24:23 -0000
Content-Type: text/plain

Add dhclient.service. This service file mainly comes from meta-systemd,
with modifications to take nfs boot into consideration.

While using eth0 as the nfsboot interface, we'd like dhclient service
to skip it like what ifup and connman do in sysvinit.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            | 16 ++++++---
 .../dhcp/files/dhclient-systemd-wrapper            | 39 ++++++++++++++++++++++
 .../dhcp/files/dhclient.service                    | 13 ++++++++
 3 files changed, 64 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
 create mode 100644 meta/recipes-connectivity/dhcp/files/dhclient.service

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index 4949e02..258ef8f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -17,17 +17,21 @@ SRC_URI = "ftp://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://init-relay file://default-relay \
            file://init-server file://default-server \
            file://dhclient.conf file://dhcpd.conf \
-           file://dhcpd.service file://dhcrelay.service"
+           file://dhcpd.service file://dhcrelay.service file://dhclient.service \
+           file://dhclient-systemd-wrapper"
 
 inherit autotools systemd
 
-SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay"
+SYSTEMD_PACKAGES = "${PN}-server ${PN}-relay ${PN}-client"
 SYSTEMD_SERVICE_${PN}-server = "dhcpd.service"
 SYSTEMD_AUTO_ENABLE_${PN}-server = "disable"
 
 SYSTEMD_SERVICE_${PN}-relay = "dhcrelay.service"
 SYSTEMD_AUTO_ENABLE_${PN}-relay = "disable"
 
+SYSTEMD_SERVICE_${PN}-client = "dhclient.service"
+SYSTEMD_AUTO_ENABLE_${PN}-client = "disable"
+
 TARGET_CFLAGS += "-D_GNU_SOURCE"
 EXTRA_OECONF = "--with-srv-lease-file=${localstatedir}/lib/dhcp/dhcpd.leases \
                 --with-srv6-lease-file=${localstatedir}/lib/dhcp/dhcpd6.leases \
@@ -62,10 +66,14 @@ do_install_append () {
 
 	# Install systemd unit files
 	install -d ${D}${systemd_unitdir}/system
+	install -d ${D}${base_sbindir}
+	install -m 0755 ${WORKDIR}/dhclient-systemd-wrapper ${D}${base_sbindir}/dhclient-systemd-wrapper
 	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcpd.service ${D}${systemd_unitdir}/system/dhcrelay.service
-	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd.service
+	sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcpd.service ${D}${systemd_unitdir}/system/dhclient.service
+	sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/system/dhclient.service
 }
 
 PACKAGES += "dhcp-server dhcp-server-config dhcp-client dhcp-relay dhcp-omshell"
@@ -81,7 +89,7 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
 
 FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
-FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
+FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf ${base_sbindir}/dhclient-systemd-wrapper"
 RDEPENDS_dhcp-client = "bash"
 
 FILES_dhcp-omshell = "${bindir}/omshell"
diff --git a/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper b/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
new file mode 100644
index 0000000..08afd30
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
+    /sbin/dhclient -cf /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases $interfaces
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


