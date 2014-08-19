Return-Path: <fahad.usman@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5E5AB65D56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 18:40:11 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lf10so10568827pab.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 11:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=74f73PikKZhGy35ZfIQUhD4L8dtaWECzHNlNVMc8dn4=;
	b=h3EzDSm3/WxD6sEyAVAONzWV4k8E6NgAEr9VLfKZGfbvPuIrHsMNGl+WtCpkoId5B1
	ZdRy74DGFfXmJmYULmAcQlm03nIwxPj5cPlpflKq/sHUWyHxk26UoLhMwbfwqnFiREJu
	1B2iQC3uyx2bf0RbsOw3GW9qE6ueQrOpuA0N+OMZTqGekx0GjGPf+riLKF+DsMLT0JSc
	JPyS1ZymxrYEbl7YIswQCpQEkQ8dE9K9wtnc9B7dWBI/ULzyP5LPPO292XdV+amPccfE
	gNZANi0QX62mbtN8OwPGzv2RiHjhZEYIb1YDPDR9Svlg5XSgPdTjldEd+y++6mA4k6RS
	E/nw==
X-Received: by 10.70.140.139 with SMTP id rg11mr53326115pdb.13.1408473613291; 
	Tue, 19 Aug 2014 11:40:13 -0700 (PDT)
Received: from fahad-M4700.mgc.mentorg.com ([39.42.87.49])
	by mx.google.com with ESMTPSA id
	nn3sm29622927pdb.58.2014.08.19.11.40.11 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Aug 2014 11:40:12 -0700 (PDT)
From: Fahad Usman <fahad.usman@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Aug 2014 23:39:57 +0500
Message-Id: <1408473597-13093-1-git-send-email-fahad.usman@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dhcp: do not use ifconfig/route in dhclient-script
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
X-List-Received-Date: Tue, 19 Aug 2014 18:40:17 -0000

The original patch was submitted on ISC's mailing list but it didn't get merged
for some reason, it can be found here;

https://lists.isc.org/pipermail/dhcp-users/2011-January/012910.html

"The ISC DHCP's dhclient-script for Linux still uses the legacy commands
'ifconfig' & 'route' to manage IPv4 network addresses & routes,
while it uses iproute2's new "ip" command to manage IPv6 network data.

This requires users & distributions to have both types of commands installed

The attached patch tries to improve the situation by replacing the
old "ifconfig" resp. "route" commands with their "ip" counterparts.

It even improves the logic a bit by only flushing the IPv4 addresses
instead of taking down the whole interface, which may still have active IPv6
connections."

Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
---
 .../dhcp/dhcp/replace-ifconfig-route.patch         | 176 +++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb       |   1 +
 2 files changed, 177 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch b/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
new file mode 100644
index 0000000..61dd6a7
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/replace-ifconfig-route.patch
@@ -0,0 +1,176 @@
+Found this patch here:
+https://lists.isc.org/pipermail/dhcp-users/2011-January/012910.html
+
+and made some adjustments/updates to make it work with this version.
+Wasn't able to find that why this patch was not accepted by ISC DHCP developers.
+
+Upstream-Status: Pending
+
+Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
+
+--- dhcp-4.2.5-P1/client/scripts/linux.orig	2013-09-04 12:22:55.000000000 +0500
++++ dhcp-4.2.5-P1/client/scripts/linux	2013-09-04 12:52:19.068761518 +0500
+@@ -103,17 +103,11 @@
+ if [ x$old_broadcast_address != x ]; then
+   old_broadcast_arg="broadcast $old_broadcast_address"
+ fi
+-if [ x$new_subnet_mask != x ]; then
+-  new_subnet_arg="netmask $new_subnet_mask"
+-fi
+-if [ x$old_subnet_mask != x ]; then
+-  old_subnet_arg="netmask $old_subnet_mask"
+-fi
+-if [ x$alias_subnet_mask != x ]; then
+-  alias_subnet_arg="netmask $alias_subnet_mask"
++if [ -n "$new_subnet_mask" ]; then
++    new_mask="/$new_subnet_mask"
+ fi
+-if [ x$new_interface_mtu != x ]; then
+-  mtu_arg="mtu $new_interface_mtu"
++if [ -n "$alias_subnet_mask" ]; then
++    alias_mask="/$alias_subnet_mask"
+ fi
+ if [ x$IF_METRIC != x ]; then
+   metric_arg="metric $IF_METRIC"
+@@ -127,9 +121,9 @@
+ if [ x$reason = xPREINIT ]; then
+   if [ x$alias_ip_address != x ]; then
+     # Bring down alias interface. Its routes will disappear too.
+-    ifconfig $interface:0- inet 0
++    ${ip} -4 addr flush dev ${interface} label ${interface}:0
+   fi
+-  ifconfig $interface 0 up
++  ${ip} link set dev ${interface} up
+ 
+   # We need to give the kernel some time to get the interface up.
+   sleep 1
+@@ -156,25 +150,30 @@
+   if [ x$old_ip_address != x ] && [ x$alias_ip_address != x ] && \
+ 		[ x$alias_ip_address != x$old_ip_address ]; then
+     # Possible new alias. Remove old alias.
+-    ifconfig $interface:0- inet 0
++    ${ip} -4 addr flush dev ${interface} label ${interface}:0
+   fi
+   if [ x$old_ip_address != x ] && [ x$old_ip_address != x$new_ip_address ]; then
+     # IP address changed. Bringing down the interface will delete all routes,
+     # and clear the ARP cache.
+-    ifconfig $interface inet 0 down
++    ${ip} -4 addr flush dev ${interface} label ${interface}
+ 
+   fi
+   if [ x$old_ip_address = x ] || [ x$old_ip_address != x$new_ip_address ] || \
+      [ x$reason = xBOUND ] || [ x$reason = xREBOOT ]; then
+ 
+-    ifconfig $interface inet $new_ip_address $new_subnet_arg \
+-					$new_broadcast_arg $mtu_arg
++    ${ip} -4 addr add ${new_ip_address}${new_mask} ${new_broadcast_arg} \
++                dev ${interface} label ${interface}
++    if [ -n "$new_interface_mtu" ]; then
++      # set MTU
++      ${ip} link set dev ${interface} mtu ${new_interface_mtu}
++    fi
+     # Add a network route to the computed network address.
+     for router in $new_routers; do
+       if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
+-	route add -host $router dev $interface
++        ${ip} -4 route add ${router} dev $interface >/dev/null 2>&1
+       fi
+-      route add default gw $router $metric_arg dev $interface
++      ${ip} -4 route add default via ${router} dev ${interface} \
++        ${metric_arg} >/dev/null 2>&1
+     done
+   else
+     # we haven't changed the address, have we changed other options           
+@@ -182,21 +181,23 @@
+     if [ x$new_routers != x ] && [ x$new_routers != x$old_routers ] ; then
+       # if we've changed routers delete the old and add the new.
+       for router in $old_routers; do
+-        route del default gw $router
++        ${ip} -4 route delete default via ${router}
+       done
+       for router in $new_routers; do
+         if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
+-	  route add -host $router dev $interface
+-	fi
+-	route add default gw $router $metric_arg dev $interface
++	      ${ip} -4 route add ${router} dev $interface >/dev/null 2>&1
++	    fi
++        ${ip} -4 route add default via ${router} dev ${interface} \
++          ${metric_arg} >/dev/null 2>&1
+       done
+     fi
+   fi
+   if [ x$new_ip_address != x$alias_ip_address ] && [ x$alias_ip_address != x ];
+    then
+-    ifconfig $interface:0- inet 0
+-    ifconfig $interface:0 inet $alias_ip_address $alias_subnet_arg
+-    route add -host $alias_ip_address $interface:0
++    ${ip} -4 addr flush dev ${interface} label ${interface}:0
++    ${ip} -4 addr add ${alias_ip_address}${alias_mask} \
++        dev ${interface} label ${interface}:0
++    ${ip} -4 route add ${alias_ip_address} dev ${interface} >/dev/null 2>&1
+   fi
+   make_resolv_conf
+   exit_with_hooks 0
+@@ -206,42 +207,49 @@
+    || [ x$reason = xSTOP ]; then
+   if [ x$alias_ip_address != x ]; then
+     # Turn off alias interface.
+-    ifconfig $interface:0- inet 0
++    ${ip} -4 addr flush dev ${interface} label ${interface}:0
+   fi
+   if [ x$old_ip_address != x ]; then
+     # Shut down interface, which will delete routes and clear arp cache.
+-    ifconfig $interface inet 0 down
++    ${ip} -4 addr flush dev ${interface} label ${interface}
+   fi
+   if [ x$alias_ip_address != x ]; then
+-    ifconfig $interface:0 inet $alias_ip_address $alias_subnet_arg
+-    route add -host $alias_ip_address $interface:0
++    ${ip} -4 addr add ${alias_ip_address}${alias_network_arg} \
++        dev ${interface} label ${interface}:0
++    ${ip} -4 route add ${alias_ip_address} dev ${interface} >/dev/null 2>&1
+   fi
+   exit_with_hooks 0
+ fi
+ 
+ if [ x$reason = xTIMEOUT ]; then
+   if [ x$alias_ip_address != x ]; then
+-    ifconfig $interface:0- inet 0
++    ${ip} -4 addr flush dev ${interface} label ${interface}:0
++  fi
++  ${ip} -4 addr add ${new_ip_address}${new_mask} ${new_broadcast_arg} \
++            dev ${interface} label ${interface}
++  if [ -n "$new_interface_mtu" ]; then
++    # set MTU
++    ip link set dev ${interface} mtu ${new_interface_mtu}
+   fi
+-  ifconfig $interface inet $new_ip_address $new_subnet_arg \
+-					$new_broadcast_arg $mtu_arg
+   set $new_routers
+   if ping -q -c 1 $1; then
+     if [ x$new_ip_address != x$alias_ip_address ] && \
+ 			[ x$alias_ip_address != x ]; then
+-      ifconfig $interface:0 inet $alias_ip_address $alias_subnet_arg
+-      route add -host $alias_ip_address dev $interface:0
++      ${ip} -4 addr add ${alias_ip_address}${alias_mask} \
++            dev ${interface} label ${interface}:0
++      ${ip} -4 route add ${alias_ip_address} dev ${interface} >/dev/null 2>&1
+     fi
+     for router in $new_routers; do
+       if [ "x$new_subnet_mask" = "x255.255.255.255" ] ; then
+-	route add -host $router dev $interface
++	    ${ip} -4 route add ${router} dev $interface >/dev/null 2>&1
+       fi
+-      route add default gw $router $metric_arg dev $interface
++      ${ip} -4 route add default via ${router} dev ${interface} \
++        ${metric_arg} >/dev/null 2>&1
+     done
+     make_resolv_conf
+     exit_with_hooks 0
+   fi
+-  ifconfig $interface inet 0 down
++  ${ip} -4 addr flush dev ${interface}
+   exit_with_hooks 1
+ fi
+ 
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
index 6da28fa..13bcceb 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.0.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://link-with-lcrypto.patch \
             file://fixsepbuild.patch \
             file://dhclient-script-drop-resolv.conf.dhclient.patch \
+            file://replace-ifconfig-route.patch \
            "
 
 SRC_URI[md5sum] = "1020d77e1a4c1f01b76279caff9beb80"
-- 
1.9.1


