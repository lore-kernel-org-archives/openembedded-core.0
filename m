Return-Path: <Muhammad_Hamza@mentor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9957C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 14:01:14 +0000 (UTC)
Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web12.43629.1655820064397633794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 07:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: muhammad_hamza@mentor.com)
X-IronPort-AV: E=Sophos;i="5.92,209,1650960000";
   d="scan'208";a="77612455"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 21 Jun 2022 06:01:03 -0800
IronPort-SDR: 
 ApXrtw1dBo1+5VvrS2Zo2LWzjhum6/UbGHQlDkrV7foU6kL3p0y7gXy8tzT3Z6nBtEgpEZKiQP
 r1Sm2KNFJdiIjbrjb9SBrSWXsvySYjBTdj2tEg7OmVmyWnhjqS31uYZ17UdOAtIodOxI8oalPW
 /EcztOHDtWcSafiiuabEI6nNFmGVDsiKwjq5efyJahTbe1WyFoumjdChFp0WXsfakkVqtiDScO
 bfOIEa03XdY6qJIzwL+9XZtFrlp3hBspQlYUicjRv86SrgTEpKOkD6y7wy6gFwz1bQZTbiyF92
 gWo=
From: Muhammad Hamza <muhammad_hamza@mentor.com>
To: <openembedded-core@lists.openembedded.org>
CC: Muhammad Hamza <muhammad_hamza@mentor.com>, Srikanth Krishnakar
	<Srikanth_Krishnakar@mentor.com>
Subject: [PATCH] connman: implement network interface management techniques
Date: Tue, 21 Jun 2022 19:00:45 +0500
Message-ID: <20220621140045.3318362-1-muhammad_hamza@mentor.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 14:01:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167151

This is required to obtain a managed network interface before connman
tries to call cleanup_devices function, this will let connman
create new routing table without bringing down the ethernet interface.

Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
---
 ...t-network-interface-management-techn.patch | 31 +++++++++++++++++++
 .../connman/connman_1.41.bb                   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-connman-implement-network-interface-management-techn.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman-implement-network-interface-management-techn.patch b/meta/recipes-connectivity/connman/connman/0001-connman-implement-network-interface-management-techn.patch
new file mode 100644
index 0000000000..06695ea566
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-connman-implement-network-interface-management-techn.patch
@@ -0,0 +1,31 @@
+From e6dedb531096f29825bddaf428ca8d3c4ad1df26 Mon Sep 17 00:00:00 2001
+From: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
+Date: Tue, 1 Jul 2014 23:47:15 +0530
+Subject: [PATCH] connman: implement network interface management techniques
+
+This is required to obtain a managed network interface before connman
+tries to call cleanup_devices function, this will let connman
+create new routing table without bringing down the ethernet interface.
+
+Signed-off-by: Srikanth Krishnakar <Srikanth_Krishnakar@mentor.com>
+
+---
+ src/connman.service.in | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/connman.service.in b/src/connman.service.in
+index 79e75d6..0e7275a 100644
+--- a/src/connman.service.in
++++ b/src/connman.service.in
+@@ -12,7 +12,10 @@ Conflicts=systemd-resolved.service
+ Type=dbus
+ BusName=net.connman
+ Restart=on-failure
+-ExecStart=@sbindir@/connmand -n
++EnvironmentFile=-/tmp/connman.env
++ExecStartPre=/bin/sh -c "if grep 'nfsroot\|ip=' /proc/cmdline; then ETH_IFACE=$(ip addr | grep 'eth[0-9]:' | grep 'UP' | sed -e 's,\(eth[0-9]\)\(.*\),\1,' -e 's,^.*: ,,' ); NET_ADDR=$(cat /proc/cmdline | sed -ne 's/^.*ip=\([^ :]*\).*$/\1/p'); echo -e 'OPT=-I '$ETH_IFACE'\nOPT2='$ETH_IFACE'\nNET_ADDR='$NET_ADDR' ' > /tmp/connman.env; fi "
++ExecStart=/bin/sh -c "if [ \"$NET_ADDR\" = \"off\" ] || [ \"$NET_ADDR\" = \"none\" ]; then /usr/sbin/connmand -n; else /usr/sbin/connmand -n $OPT; fi"
++ExecStartPost=/bin/sh -c "if [ ! -z \"$OPT\" ] && [ \"$NET_ADDR\" = \"dhcp\" ]; then /sbin/udhcpc -i $OPT2; fi"
+ StandardOutput=null
+ CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_NET_RAW CAP_SYS_TIME CAP_SYS_MODULE CAP_SYS_ADMIN
+ ProtectHome=true
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
index 736b78eaeb..9c09a71f46 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -5,6 +5,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
            file://no-version-scripts.patch \
+           file://0001-connman-implement-network-interface-management-techn.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.25.1


