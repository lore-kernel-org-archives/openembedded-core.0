Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9936B60017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 01:42:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96827325"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jun 2015 09:46:38 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5B1eodt016526
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:40:50 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 11 Jun 2015 09:42:33 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 09:42:19 +0800
Message-ID: <1433986939-1704-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] bind: add systemd file bind-chroot.service
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
X-List-Received-Date: Thu, 11 Jun 2015 01:42:24 -0000
Content-Type: text/plain

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../bind/bind/bind-chroot.service                  | 26 ++++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.10.2.bb      | 13 +++++++----
 2 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/bind-chroot.service

diff --git a/meta/recipes-connectivity/bind/bind/bind-chroot.service b/meta/recipes-connectivity/bind/bind/bind-chroot.service
new file mode 100644
index 0000000..f204d11
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/bind-chroot.service
@@ -0,0 +1,26 @@
+[Unit]
+Description=Berkeley Internet Name Domain (DNS)
+Wants=nss-lookup.target
+Before=nss-lookup.target
+After=network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-/etc/sysconfig/named
+Environment=KRB5_KTNAME=/etc/named.keytab
+PIDFile=/var/named/chroot/var/run/named/named.pid
+
+ExecStartPre=@BASE_BINDIR@/mkdir -p /var/cache/bind
+ExecStartPre=@SBINDIR@/rndc-confgen -a -t /var/named/chroot -k rndckey
+ExecStartPre=@SBINDIR@/named-checkconf -t /var/named/chroot -z /etc/bind/named.conf
+ExecStart=@SBINDIR@/named -t /var/named/chroot $OPTIONS
+
+ExecReload=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc reload > /dev/null 2>&1 || @BASE_BINDIR@/kill -HUP $MAINPID'
+
+ExecStop=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc stop > /dev/null 2>&1 || @BASE_BINDIR@/kill -TERM $MAINPID'
+
+PrivateTmp=true
+
+[Install]
+WantedBy=multi-user.target
+
diff --git a/meta/recipes-connectivity/bind/bind_9.10.2.bb b/meta/recipes-connectivity/bind/bind_9.10.2.bb
index 1dc15a9..bb1be24 100644
--- a/meta/recipes-connectivity/bind/bind_9.10.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.10.2.bb
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://init.d-add-support-for-read-only-rootfs.patch \
            file://bind-confgen-build-unix.o-once.patch \
            file://0001-build-use-pkg-config-to-find-libxml2.patch \
+           file://bind-chroot.service \
            "
 
 SRC_URI[md5sum] = "dca7a9967947bffa98547fca6130fc04"
@@ -45,7 +46,7 @@ USERADD_PARAM_${PN} = "--system --home /var/cache/bind --no-create-home \
 INITSCRIPT_NAME = "bind"
 INITSCRIPT_PARAMS = "defaults"
 
-SYSTEMD_SERVICE_${PN} = "named.service"
+SYSTEMD_SERVICE_${PN} = "named.service bind-chroot.service"
 
 PARALLEL_MAKE = ""
 
@@ -81,10 +82,15 @@ do_install_append() {
 	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
 	install -d ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/bind-chroot.service ${D}${systemd_unitdir}/system
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/named.service
-
+	       ${D}${systemd_unitdir}/system/*.service
+	install -d "${D}${localstatedir}/named/chroot/${sysconfdir}/bind"
+	install -d "${D}${localstatedir}/named/chroot/${localstatedir}/named"
+	install -d "${D}${localstatedir}/named/chroot/${localstatedir}/cache/bind"
+	install -d "${D}${localstatedir}/named/chroot/${localstatedir}/run/named"
+	install -m 644 ${S}/conf/* "${D}${localstatedir}/named/chroot/${sysconfdir}/bind/"
 	install -d ${D}${sysconfdir}/default
 	install -m 0644 ${WORKDIR}/bind9 ${D}${sysconfdir}/default
 }
@@ -99,4 +105,3 @@ CONFFILES_${PN} = " \
 	${sysconfdir}/bind/db.local \
 	${sysconfdir}/bind/db.root \
 	"
-
-- 
1.8.4.2


