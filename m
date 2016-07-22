Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B5DD260290
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 03:11:15 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i6so6467544pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 20:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CXGWdUElQ+VEpigdKEZO5RveLvAjpZO4w6HTrPnNMJc=;
	b=CEfHJ2RkB6Mv07siWJPGI5croy1FanhvOYXjvgleqeB/LfxXRvzKs4ySPLlJ7zoWHq
	JV1U7gyA6TpEI6SYD4HzY9+vtggI5zK4iMFFXI/Vj6phEfTFTnywOfDfWcd4h7kb2pJb
	ARri3UXd3ECj1EbQ/YukSXal4chs1rucD3ome+nqYZ2iqI79WEaNvyrpzd9KHEMDcgPf
	0anfiq/Y1yiCDi4gwSI+7TubzIp1Em8wgaOrj1x18r1Mke8hYnauJWoypU4FQiNnLCGN
	OXIgs/r5wmKl8Uil1x6eCC6iAEmpXB2nzK1PYukSJwPVKSq5qgedSiPj8lzpxKsMPBCw
	k9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CXGWdUElQ+VEpigdKEZO5RveLvAjpZO4w6HTrPnNMJc=;
	b=kxva9Ta0onjTqSu/MrWwDTf1wVtkJyR9ywbYMfbBdUFQZ3xQ9lU4pwZC16lP9Kf0+H
	vqOkSAS8jiIkPC0eWHvHZ/fLlhDdj7a0i/RLG2sCm9Ybck8OYwAnQqzenuWelmF0zNxY
	7kxWGUSoNOkdOj3uP9B7e6gYW4f4yH/d/IvgFYDZQu/H4g4ytU0eH6Mo/dcb/VeJ6J2j
	Ddm/jE2kESGWagNUUgFNLRP7sFn68RkAOb1wJsDXVkIHtDr9d+gPDC56Is5Ss6dCXQu0
	ZNIBSn79l2ETkmSpiYppYj+TOl24XzQtMegg0PFXKJxVuGw922BHCrNRO3wO7L5hbH0p
	kQXA==
X-Gm-Message-State: AEkoousS4UbT6agDhnONcYw7G0VBZandV3LlK2g8+vKzqCTNgAMniFVlHG4AbRzXJ7AFXQ==
X-Received: by 10.98.66.209 with SMTP id h78mr2558290pfd.11.1469157076325;
	Thu, 21 Jul 2016 20:11:16 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	s12sm8710646pfj.73.2016.07.21.20.11.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jul 2016 20:11:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2016 20:11:04 -0700
Message-Id: <1469157064-1819-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dhcp: remove dhclient-script bash dependency
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
X-List-Received-Date: Fri, 22 Jul 2016 03:11:17 -0000

Take the dash compatible IPv6 link-local address test from the Debian
version of dhclient-script.

Note that although "echo -e" in the OE version of dhclient-script is
technically bash specific too, it is supported by Busybox echo when
Busybox is configured with CONFIG_FEATURE_FANCY_ECHO enabled (which
is the default in the OE Busybox defconfig) therefore leave as-is.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/dhcp/dhcp.inc            |  1 -
 .../remove-dhclient-script-bash-dependency.patch   | 55 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb       |  1 +
 3 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
index d237d58..421221f 100644
--- a/meta/recipes-connectivity/dhcp/dhcp.inc
+++ b/meta/recipes-connectivity/dhcp/dhcp.inc
@@ -95,7 +95,6 @@ FILES_${PN}-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhc
 FILES_${PN}-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
 
 FILES_${PN}-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
-RDEPENDS_${PN}-client = "bash"
 
 FILES_${PN}-omshell = "${bindir}/omshell"
 
diff --git a/meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch b/meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch
new file mode 100644
index 0000000..2a085e3
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/remove-dhclient-script-bash-dependency.patch
@@ -0,0 +1,55 @@
+From 8aed2a9ff09cb0d584ad0a7340fe3a596879d9b1 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Thu, 21 Jul 2016 19:07:02 -0700
+Subject: [PATCH] remove dhclient-script bash dependency
+
+Take the dash compatible IPv6 link-local address test from the Debian
+version of dhclient-script.
+
+Note that although "echo -e" in the OE version of dhclient-script is
+technically bash specific too, it is supported by Busybox echo when
+Busybox is configured with CONFIG_FEATURE_FANCY_ECHO enabled (which
+is the default in the OE Busybox defconfig) therefore leave as-is.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ client/scripts/linux | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 232a0aa..1383f46 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # dhclient-script for Linux. Dan Halbert, March, 1997.
+ # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
+ # No guarantees about this. I'm a novice at the details of Linux
+@@ -47,11 +47,11 @@ make_resolv_conf() {
+     if [ "x${new_dhcp6_domain_search}" != x ] ; then
+       resolv_conf="search ${new_dhcp6_domain_search}\n"
+     fi
+-    shopt -s nocasematch 
+     for nameserver in ${new_dhcp6_name_servers} ; do
+       # If the nameserver has a link-local address
+       # add a <zone_id> (interface name) to it.
+-      if  [[ "$nameserver" =~ ^fe80:: ]]
++      if [ "${nameserver##fe80::}" != "$nameserver" ] ||
++         [ "${nameserver##FE80::}" != "$nameserver" ]
+       then
+ 	zone_id="%$interface"
+       else
+@@ -59,7 +59,6 @@ make_resolv_conf() {
+       fi
+       resolv_conf="${resolv_conf}nameserver ${nameserver}$zone_id\n"
+     done
+-    shopt -u nocasematch 
+ 
+     echo -e "${resolv_conf}" > /etc/resolv.conf
+   fi
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
index 9e08291..4151eb1 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.4.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://0001-site.h-enable-gentle-shutdown.patch \
             file://libxml2-configure-argument.patch \
             file://tweak-to-support-external-bind.patch \
+            file://remove-dhclient-script-bash-dependency.patch \
            "
 
 SRC_URI[md5sum] = "0138319fe2b788cf4bdf34fbeaf9ff54"
-- 
1.9.1


