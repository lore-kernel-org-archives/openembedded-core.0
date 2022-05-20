Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8DEC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 11:05:21 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.7363.1653044719694312719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 04:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24KB5BNd027517
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 May 2022 04:05:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 20 May 2022 04:05:10 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Fri, 20 May 2022 04:05:09 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kiernan@gmail.com>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH V2] eudev: create static-nodes in init script
Date: Fri, 20 May 2022 19:05:09 +0800
Message-ID: <20220520110509.1017128-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 11:05:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165925

From: Changqing Li <changqing.li@windriver.com>

dev in modules.devname should be populated in /dev on boot.  remove
create static mode from udevd will make these devices cannot be
populated. Since commit [1], when use sysVinit, devices like
/dev/net/tun will not be created.

more info:
udevd in systemd also remove create static mode in udevd, but using
service kmod-static-nodes.service and systemd-tmpfiles-setup-dev.service
in systemd to create these node, so systemd works well.

For sysV, parse kmod static-nodes and generate the device nodes in init

[1] https://gitweb.gentoo.org/proj/eudev.git/commit/?id=2b7abd5ec9cc47a8b895df6db77fb1537c6f1a39

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/udev/eudev/init      | 37 ++++++++++++++++++++++++++
 meta/recipes-core/udev/eudev_3.2.11.bb |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eudev/init
index c60dbbf6d5..477a525b21 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -23,6 +23,42 @@ kill_udevd () {
     [ -n "$pid" ] && kill $pid
 }
 
+make_static_nodes () {
+    [ -e /lib/modules/$(uname -r)/modules.devname ] || return 0
+    [ -x @KMOD@ ] || return 0
+
+    #output to /proc/self/fd/1 since /dev/stdout not created by udevd yet
+    @KMOD@ static-nodes --format=tmpfiles --output=/proc/self/fd/1 |
+    while read TTYPE TPATH TMODE TUSER TGROUP TAGE TARG; do
+    case "${TTYPE}" in
+    'd')
+            test -d "${TPATH}" || mkdir -p -m "${TMODE}" "${TPATH}"
+            ;;
+
+    'c!')
+            if [ ! -c "${TPATH}" ]; then
+                    old_ifs="${IFS}"
+                    IFS=:
+                    set -- ${TARG}
+                    IFS="${old_ifs}"
+                    mknod -m "${TMODE}" "${TPATH}" c "$@"
+            fi
+            ;;
+
+    *)
+            echo "Unparseable line (${TTYPE} ${TPATH} ${TMODE} ${TUSER} ${TGROUP} ${TAGE} ${TARG})"
+            return 1
+            ;;
+    esac
+    if [ "${TUSER}" != "-" ]; then
+            chown "${TUSER}" "${TPATH}"
+    fi
+    if [ "${TGROUP}" != "-" ]; then
+            chgrp "${TGROUP}" "${TPATH}"
+    fi
+    done
+}
+
 case "$1" in
   start)
     export ACTION=add
@@ -51,6 +87,7 @@ case "$1" in
     # make_extra_nodes
     kill_udevd > "/dev/null" 2>&1
 
+    make_static_nodes
     # trigger the sorted events
     [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hotplug
     @UDEVD@ -d
diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 841039f6d7..a0a19e501d 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -41,6 +41,7 @@ do_install:append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
+	sed -i s%@KMOD@%${base_bindir}/kmod% ${D}${sysconfdir}/init.d/udev
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
@@ -73,6 +74,7 @@ FILES:libudev = "${base_libdir}/libudev.so.*"
 FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
 
 RDEPENDS:eudev-hwdb += "eudev"
+RDEPENDS:eudev += "kmod"
 
 RPROVIDES:${PN} = "hotplug udev"
 RPROVIDES:eudev-hwdb += "udev-hwdb"
-- 
2.25.1


