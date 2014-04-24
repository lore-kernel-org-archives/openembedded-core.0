Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7602165DCD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 02:06:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3O26NDr028406
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Apr 2014 19:06:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 23 Apr 2014 19:06:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Apr 2014 10:07:27 +0800
Message-ID: <beffc306e85e59dd666c42c258c093994c7b797d.1398305029.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1398305029.git.Qi.Chen@windriver.com>
References: <cover.1398305029.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/4] bind: add systemd support
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
X-List-Received-Date: Thu, 24 Apr 2014 02:06:22 -0000
Content-Type: text/plain

Add systemd support for bind.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../bind/bind/generate-rndc-key.sh                 |    7 +++++++
 meta/recipes-connectivity/bind/bind/named.service  |   22 ++++++++++++++++++++
 meta/recipes-connectivity/bind/bind_9.9.5.bb       |   17 ++++++++++++++-
 3 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
 create mode 100644 meta/recipes-connectivity/bind/bind/named.service

diff --git a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
new file mode 100644
index 0000000..db20127
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+
+if [ ! -s /etc/bind/rndc.key ]; then
+    echo -n "Generating /etc/bind/rndc.key:"
+    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
+    chmod 0640 /etc/bind/rndc.key
+fi
diff --git a/meta/recipes-connectivity/bind/bind/named.service b/meta/recipes-connectivity/bind/bind/named.service
new file mode 100644
index 0000000..1792e41
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/named.service
@@ -0,0 +1,22 @@
+[Unit]
+Description=Berkeley Internet Name Domain (DNS)
+Wants=nss-lookup.target
+Before=nss-lookup.target
+After=network.target
+
+[Service]
+Type=forking
+EnvironmentFile=-/etc/sysconfig/named
+PIDFile=/run/named/named.pid
+
+ExecStartPre=@SBINDIR@/generate-rndc-key.sh
+ExecStart=@SBINDIR@/named $OPTIONS
+
+ExecReload=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc reload > /dev/null 2>&1 || @BASE_BINDIR@/kill -HUP $MAINPID'
+
+ExecStop=@BASE_BINDIR@/sh -c '@SBINDIR@/rndc stop > /dev/null 2>&1 || @BASE_BINDIR@/kill -TERM $MAINPID'
+
+PrivateTmp=true
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta/recipes-connectivity/bind/bind_9.9.5.bb b/meta/recipes-connectivity/bind/bind_9.9.5.bb
index 604deb6..053c352 100644
--- a/meta/recipes-connectivity/bind/bind_9.9.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.9.5.bb
@@ -13,6 +13,8 @@ SRC_URI = "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://make-etc-initd-bind-stop-work.patch \
            file://mips1-not-support-opcode.diff \
            file://dont-test-on-host.patch \
+           file://generate-rndc-key.sh \
+           file://named.service \
 	   "
 
 SRC_URI[md5sum] = "e676c65cad5234617ee22f48e328c24e"
@@ -27,11 +29,13 @@ EXTRA_OECONF = " ${ENABLE_IPV6} --with-randomdev=/dev/random --disable-threads \
                  --with-openssl=${STAGING_LIBDIR}/.. --with-libxml2=${STAGING_LIBDIR}/.. \
                  --enable-exportlib --with-export-includedir=${includedir} --with-export-libdir=${libdir} \
                "
-inherit autotools-brokensep update-rc.d
+inherit autotools-brokensep update-rc.d systemd
 
 INITSCRIPT_NAME = "bind"
 INITSCRIPT_PARAMS = "defaults"
 
+SYSTEMD_SERVICE_${PN} = "named.service"
+
 PARALLEL_MAKE = ""
 
 RDEPENDS_${PN} = "python-core"
@@ -39,6 +43,7 @@ RDEPENDS_${PN} = "python-core"
 PACKAGES_prepend = " ${PN}-utils "
 FILES_${PN}-utils = "${bindir}/host ${bindir}/dig"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
+FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
 
 do_install_append() {
 	rm "${D}${bindir}/nslookup"
@@ -50,6 +55,16 @@ do_install_append() {
 	install -m 644 ${S}/conf/* "${D}${sysconfdir}/bind/"
 	install -m 755 "${S}/init.d" "${D}${sysconfdir}/init.d/bind"
 	sed -i -e '1s,#!.*python,#! /usr/bin/env python,' ${D}${sbindir}/dnssec-coverage ${D}${sbindir}/dnssec-checkds
+
+	# Install systemd related files
+	install -d ${D}${localstatedir}/cache/bind
+	install -d ${D}${sbindir}
+	install -m 755 ${WORKDIR}/generate-rndc-key.sh ${D}${sbindir}
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/named.service ${D}${systemd_unitdir}/system
+	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
+	       -e 's,@SBINDIR@,${sbindir},g' \
+	       ${D}${systemd_unitdir}/system/named.service
 }
 
 CONFFILES_${PN} = " \
-- 
1.7.9.5


