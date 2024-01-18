Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A99CC47DB3
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 16:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18354.1705597192949888733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 08:59:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RZMWvy+J;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=174791ccb8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40IBlKcP018381;
	Thu, 18 Jan 2024 16:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=B4sOr
	EYpX4IUzZIVjiP703wekiO904NAMWT0xWB3Wsg=; b=RZMWvy+JBTaE1OaFa7kl0
	n47HFJbxn0RtWeuTc5zGtrGw0nTX4N6lNV5p7hAtmBwy/SDfBA9nKav5VCeOWiC1
	gP0y3D8pyCQnrF0cmJUptYKs3PNGcPkzLcejKXQ5hI+tsg5WE/2IQ+8dRj68bNGT
	mK+sur5r1hqvYvDdtyFS/pBy8qaJbSnz7raFas+JIfJaveniSXiKpBHJBVb62Wcd
	l6RSp2VyYZmQod82uh5p2JQRoPK3sHOmDjr6Smug92JVLROE9cnFDDF0dzT+FzDK
	/iJH24gRzq5VqTdd1hPdzQZ/POzoXe4f+jB7JadVID0Cg68juuP4Y2Yg5qV138Aj
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkfqxe2aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Jan 2024 16:59:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 08:59:47 -0800
Received: from pop-os.wrs.com (172.25.44.3) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Jan 2024 08:59:47 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <anuj.mittal@intel.com>
CC: <david.zuhn@sonos.com>
Subject: [PATCH] rng-tools: Revert "rng-tools: move to meta-oe"
Date: Thu, 18 Jan 2024 11:59:35 -0500
Message-ID: <20240118165935.1999929-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yizI0rQuY3ieBxg_Kl92k5TdJr3URfC0
X-Proofpoint-ORIG-GUID: yizI0rQuY3ieBxg_Kl92k5TdJr3URfC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_08,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 16:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193994

From: Randy MacLeod <Randy.MacLeod@windriver.com>

This reverts commit d2b445384da3f3e6dab8577b6c56648b5244a788.

Revert this commit since:

 - some systems using oe-core master may still be using kernels from
   before 5.6 pulled in the rng-tools algorithm, and

 - some hardware platforms may not have a hardware random number generator
   and could therefore need to run rngd to avoid long boot-time initialization
   due to a depleted entropy pool.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../rng-tools/rng-tools/default               |  1 +
 meta/recipes-support/rng-tools/rng-tools/init | 42 +++++++++++
 .../rng-tools/rng-tools/rng-tools.service     | 32 +++++++++
 .../rng-tools/rng-tools_6.16.bb               | 69 +++++++++++++++++++
 5 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/default
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/init
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tools.service
 create mode 100644 meta/recipes-support/rng-tools/rng-tools_6.16.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 31023021ac..8dc63b138e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -739,6 +739,7 @@ RECIPE_MAINTAINER:pn-repo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-resolvconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-rgb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
new file mode 100644
index 0000000000..b9f8e03635
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -0,0 +1 @@
+EXTRA_ARGS="-r /dev/hwrng"
diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
new file mode 100644
index 0000000000..13f0ecd37c
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/init
@@ -0,0 +1,42 @@
+#!/bin/sh
+#
+# This is an init script for openembedded
+# Copy it to @SYSCONFDIR@/init.d/rng-tools and type
+# > update-rc.d rng-tools defaults 60
+#
+
+rngd=@SBINDIR@/rngd
+test -x "$rngd" || exit 1
+
+[ -r @SYSCONFDIR@/default/rng-tools ] && . "@SYSCONFDIR@/default/rng-tools"
+
+case "$1" in
+  start)
+    echo -n "Starting random number generator daemon"
+    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
+    echo "."
+    ;;
+  stop)
+    echo -n "Stopping random number generator daemon"
+    start-stop-daemon -K -q -n rngd
+    echo "."
+    ;;
+  reload|force-reload)
+    echo -n "Signalling rng daemon restart"
+    start-stop-daemon -K -q -s 1 -x $rngd
+    start-stop-daemon -K -q -s 1 -x $rngd
+    ;;
+  restart)
+    echo -n "Stopping random number generator daemon"
+    start-stop-daemon -K -q -n rngd
+    echo "."
+    echo -n "Starting random number generator daemon"
+    start-stop-daemon -S -q -x $rngd -- $EXTRA_ARGS
+    echo "."
+    ;;
+  *)
+    echo "Usage: @SYSCONFDIR@/init.d/rng-tools {start|stop|reload|restart|force-reload}"
+    exit 1
+esac
+
+exit 0
diff --git a/meta/recipes-support/rng-tools/rng-tools/rng-tools.service b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
new file mode 100644
index 0000000000..5ae2fba215
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/rng-tools.service
@@ -0,0 +1,32 @@
+[Unit]
+Description=Hardware RNG Entropy Gatherer Daemon
+DefaultDependencies=no
+Conflicts=shutdown.target
+Before=sysinit.target shutdown.target
+ConditionVirtualization=!container
+
+[Service]
+EnvironmentFile=-@SYSCONFDIR@/default/rng-tools
+ExecStart=@SBINDIR@/rngd -f $EXTRA_ARGS
+CapabilityBoundingSet=CAP_SYS_ADMIN
+IPAddressDeny=any
+LockPersonality=yes
+MemoryDenyWriteExecute=yes
+NoNewPrivileges=yes
+PrivateTmp=yes
+ProtectControlGroups=yes
+ProtectHome=yes
+ProtectHostname=yes
+ProtectKernelModules=yes
+ProtectKernelLogs=yes
+ProtectSystem=strict
+RestrictAddressFamilies=AF_UNIX
+RestrictNamespaces=yes
+RestrictRealtime=yes
+RestrictSUIDSGID=yes
+SystemCallArchitectures=native
+SystemCallErrorNumber=EPERM
+SystemCallFilter=@system-service
+
+[Install]
+WantedBy=sysinit.target
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
new file mode 100644
index 0000000000..f0aa3ff93f
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -0,0 +1,69 @@
+SUMMARY = "Random number generator daemon"
+DESCRIPTION = "Check and feed random data from hardware device to kernel"
+HOMEPAGE = "https://github.com/nhorman/rng-tools"
+BUGTRACKER = "https://github.com/nhorman/rng-tools/issues"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "openssl libcap"
+
+SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
+           file://init \
+           file://default \
+           file://rng-tools.service \
+           "
+SRCREV = "e061c313b95890eb5fa0ada0cd6eec619dafdfe2"
+
+S = "${WORKDIR}/git"
+
+inherit autotools update-rc.d systemd pkgconfig
+
+EXTRA_OECONF = "--without-rtlsdr"
+
+PACKAGECONFIG ??= "libjitterentropy"
+PACKAGECONFIG:libc-musl = "libargp libjitterentropy"
+
+PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
+PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
+PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
+PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2"
+PACKAGECONFIG[qrypt] = "--with-qrypt,--without-qrypt,curl"
+
+INITSCRIPT_PACKAGES = "${PN}-service"
+INITSCRIPT_NAME:${PN}-service = "rng-tools"
+INITSCRIPT_PARAMS:${PN}-service = "start 03 2 3 4 5 . stop 30 0 6 1 ."
+
+SYSTEMD_PACKAGES = "${PN}-service"
+SYSTEMD_SERVICE:${PN}-service = "rng-tools.service"
+
+CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
+
+PACKAGES =+ "${PN}-service"
+
+FILES:${PN}-service += " \
+    ${sysconfdir}/init.d/rng-tools \
+    ${sysconfdir}/default/rng-tools \
+"
+
+# Refer autogen.sh in rng-tools
+do_configure:prepend() {
+    cp ${S}/README.md ${S}/README
+}
+
+do_install:append() {
+    install -Dm 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
+    install -Dm 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/rng-tools
+    install -Dm 0644 ${WORKDIR}/rng-tools.service \
+                     ${D}${systemd_system_unitdir}/rng-tools.service
+    sed -i \
+        -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+        -e 's,@SBINDIR@,${sbindir},g' \
+        ${D}${sysconfdir}/init.d/rng-tools \
+        ${D}${systemd_system_unitdir}/rng-tools.service
+
+    if [ "${@bb.utils.contains('PACKAGECONFIG', 'nistbeacon', 'yes', 'no', d)}" = "yes" ]; then
+        sed -i \
+            -e '/^IPAddressDeny=any/d' \
+            -e '/^RestrictAddressFamilies=/ s/$/ AF_INET AF_INET6/' \
+            ${D}${systemd_system_unitdir}/rng-tools.service
+    fi
+}
-- 
2.34.1


