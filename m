Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B3E62773DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 15:19:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 21 Dec 2016 07:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,384,1477983600"; d="scan'208";a="1102528029"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2016 07:19:09 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id D61C26A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 07:18:19 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2016 17:20:28 +0200
Message-Id: <1482333628-15689-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1482333628-15689-1-git-send-email-maxin.john@intel.com>
References: <1482333628-15689-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/3] ifupdown: upgrade to 0.8.16
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
X-List-Received-Date: Wed, 21 Dec 2016 15:19:08 -0000

Refreshed the following patch:
 * inet-6-.defn-fix-inverted-checks-for-loopback.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-6-.defn-fix-inverted-checks-for-loopback.patch | 395 +++++++++++++++++++--
 .../{ifupdown_0.8.2.bb => ifupdown_0.8.16.bb}      |   4 +-
 2 files changed, 359 insertions(+), 40 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.2.bb => ifupdown_0.8.16.bb} (95%)

diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
index bff352e..2013933 100644
--- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
+++ b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
@@ -1,7 +1,7 @@
-From 74152ac74a3e1ea0f3be292aa1eeca5ad1fe69c0 Mon Sep 17 00:00:00 2001
-From: Paul Gortmaker <paul.gortmaker@windriver.com>
-Date: Wed, 6 Aug 2014 15:12:11 -0400
-Subject: [PATCH 2/2] inet[6].defn: fix inverted checks for loopback
+From d88af5aa0312ea18aac791d66661da79b7bcd032 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Wed, 21 Dec 2016 15:32:07 +0200
+Subject: [PATCH] inet[6].defn: fix inverted checks for loopback
 
 Compared to the hurd link.defn for loopback, we see these
 are inverted, meaning that you would only be able to configure
@@ -11,60 +11,335 @@ The result was that we'd update /run/network/ifstate for "lo"
 but never actually do anything for up/down, as shown below:
 
 root@localhost:~# ifconfig -s
-Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
-eth0       1500 0   7736329      0   2016 0       5289422      0      0      0 BMRU
-lo        65536 0        18      0      0 0            18      0      0      0 LRU
+Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR  TX-OK TX-ERR TX-DRP TX-OVR Flg
+eth0       1500 0   7736329      0   2016 0 5289422      0      0      0 BMRU
+lo        65536 0        18      0      0 0      18      0      0      0 LRU
 root@localhost:~# ifdown lo
 root@localhost:~# echo $?
 0
 root@localhost:~# ifconfig -s
-Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
-eth0       1500 0   7736406      0   2016 0       5289455      0      0      0 BMRU
-lo        65536 0        18      0      0 0            18      0      0      0 LRU
+Iface   MTU Met   RX-OK RX-ERR RX-DRP  RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
+eth0       1500 0   7736406      0  2016 0   5289455      0      0      0 BMRU
+lo        65536 0        18      0   0 0            18    0    0    0     LRU
 root@localhost:~# ifconfig lo down
 root@localhost:~# ifconfig -s
 Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
-eth0       1500 0   7736474      0   2016 0       5289481      0      0      0 BMRU
+eth0       1500 0   7736474 0   2016 0       5289481      0     0      0 BMRU
 root@localhost:~#
 
+Also reverted the commit:
+commit 80b878497663dae08f70b4d3cffe127b57a3cfc
+which uses absolute paths to binaries called by ifup/ifdown.
+
+Upstream-Status: Inappropriate [OE specific]
+
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
- inet.defn  | 12 ++++++------
- inet6.defn |  8 ++++----
- 2 files changed, 10 insertions(+), 10 deletions(-)
+ inet.defn | 148 +++++++++++++++++++++++++++++++-------------------------------
+ 1 file changed, 74 insertions(+), 74 deletions(-)
 
 diff --git a/inet.defn b/inet.defn
-index b176ab4ed03e..5fdfb14a0e1c 100644
+index 75e6744..b5f5da2 100644
 --- a/inet.defn
 +++ b/inet.defn
 @@ -6,10 +6,10 @@ method loopback
      This method may be used to define the IPv4 loopback interface.
  
    up
--    ip link set dev %iface% up if (!iface_is_lo())
+-    /bin/ip link set dev %iface% up if (!iface_is_lo())
 +    ip link set dev %iface% up if (iface_is_lo())
  
    down
--    ip link set dev %iface% down if (!iface_is_lo())
+-    /bin/ip link set dev %iface% down if (!iface_is_lo())
 +    ip link set dev %iface% down if (iface_is_lo())
  
  method static
    description
-@@ -212,11 +212,11 @@ method loopback
+@@ -36,17 +36,17 @@ method static
+     broadcast compute_v4_broadcast
+ 
+   up
+-    /bin/ip addr add %address%[[/%netmask%]] [[broadcast %broadcast%]] \
++    ip addr add %address%[[/%netmask%]] [[broadcast %broadcast%]] \
+ 	[[peer %pointopoint%]] [[scope %scope%]] dev %iface% label %iface%
+-    /bin/ip link set dev %iface% [[mtu %mtu%]] [[address %hwaddress%]] up
++    ip link set dev %iface% [[mtu %mtu%]] [[address %hwaddress%]] up
+ 
+-    [[ /bin/ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
++    [[ ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
+ 
+   down
+-    [[ /bin/ip route del default via %gateway% [[metric %metric%]] dev %iface% 2>&1 1>/dev/null || true ]]
+-    /bin/ip addr del %address%[[/%netmask%]] [[broadcast %broadcast%]] \
++    [[ ip route del default via %gateway% [[metric %metric%]] dev %iface% 2>&1 1>/dev/null || true ]]
++    ip addr del %address%[[/%netmask%]] [[broadcast %broadcast%]] \
+ 	[[peer %pointopoint%]] [[scope %scope%]] dev %iface% label %iface%
+-    /bin/ip link set dev %iface% down \
++    ip link set dev %iface% down \
+ 		if (iface_is_link())
+ 
+ method manual
+@@ -63,12 +63,12 @@ method manual
+     hwaddress cleanup_hwaddress
+ 
+   up
+-    [[/bin/ip link set dev %iface% mtu %mtu%]]
+-    [[/bin/ip link set dev %iface% address %hwaddress%]]
+-    /bin/ip link set dev %iface% up 2>/dev/null || true
++    [[ip link set dev %iface% mtu %mtu%]]
++    [[ip link set dev %iface% address %hwaddress%]]
++    ip link set dev %iface% up 2>/dev/null || true
+ 
+   down
+-    /bin/ip link set dev %iface% down 2>/dev/null || true \
++    ip link set dev %iface% down 2>/dev/null || true \
+         if (iface_is_link() && !do_all)
+ 
+ method dhcp
+@@ -93,33 +93,33 @@ method dhcp
+     hwaddress cleanup_hwaddress
+ 
+   up
+-    [[/bin/ip link set dev %iface% address %hwaddress%]]
+-    /sbin/dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    [[ip link set dev %iface% address %hwaddress%]]
++    dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+ 	[[-e IF_METRIC=%metric%]] \
+         if (execable("/sbin/dhclient"))
+-    /sbin/pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
++    pump -i %iface% [[-h %hostname%]] [[-l %leasehours%]] \
+         elsif (execable("/sbin/pump"))
+-    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x hostname:%hostname%]] \
++    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-x hostname:%hostname%]] \
+         elsif (execable("/sbin/udhcpc"))
+-    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
++    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
+            [[-l %leasetime%]] [[-m %metric%]] %iface% \
+         elsif (execable("/sbin/dhcpcd"))
+     echo 'No DHCP client software found!' >/dev/stderr; false \
+         elsif (1)
+ 
+   down
+-    /sbin/dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+-    /sbin/pump -i %iface% -r \
++    pump -i %iface% -r \
+         elsif (execable("/sbin/pump"))
+-    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
++    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(cat /run/udhcpc.%iface%.pid); kill -TERM $(cat /run/udhcpc.%iface%.pid); fi \
+         elsif (execable("/sbin/udhcpc"))
+-    /sbin/dhcpcd -k %iface% \
++    dhcpcd -k %iface% \
+         elsif (execable("/sbin/dhcpcd"))
+     echo 'No DHCP client software found!' >/dev/stderr; false \
+         elsif (1)
+ 
+-    /bin/ip link set dev %iface% down \
++    ip link set dev %iface% down \
+ 		if (iface_is_link())
+ 
+ method bootp
+@@ -134,11 +134,11 @@ method bootp
+                       whatever it really is.
+ 
+   up
+-    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
++    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
+            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
+ 
+   down
+-    /bin/ip link set dev %iface% down \
++    ip link set dev %iface% down \
+         if (iface_is_link())
+ 
+ method tunnel
+@@ -158,13 +158,13 @@ method tunnel
+     ttl time              -- TTL setting
+     mtu size              -- MTU size
+   up
+-    /bin/ip tunnel add %iface% mode %mode% remote %endpoint% [[local %local%]] \
++    ip tunnel add %iface% mode %mode% remote %endpoint% [[local %local%]] \
+        [[ttl %ttl%]]
+-    /bin/ip link set %iface% up [[mtu %mtu%]]
+-    /bin/ip addr add %address%/%netmask% dev %iface% [[peer %dstaddr%]]
+-    [[ /bin/ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
++    ip link set %iface% up [[mtu %mtu%]]
++    ip addr add %address%/%netmask% dev %iface% [[peer %dstaddr%]]
++    [[ ip route add default via %gateway% [[metric %metric%]] dev %iface% onlink ]]
+   down
+-    /bin/ip tunnel del %iface%
++    ip tunnel del %iface%
+ 
+ method ppp
+   description
+@@ -175,9 +175,9 @@ method ppp
+     unit number    -- Use /number/ as the ppp unit number.
+     options string -- Pass /string/ as additional options to pon.
+   up
+-    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
++    pon [[%provider%]] [[unit %unit%]] [[%options%]]
+   down
+-    /usr/bin/poff [[%provider%]]
++    poff [[%provider%]]
+ 
+ method wvdial
+   description
+@@ -186,10 +186,10 @@ method wvdial
+   options
+     provider name  -- Use /name/ as the provider (from /etc/wvdial.conf).
+   up
+-    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
++    start-stop-daemon --start -x /usr/bin/wvdial \
+                       -p /run/wvdial.%iface%.pid -b -m -- [[ %provider% ]]
+   down
+-    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
++    start-stop-daemon --stop -x /usr/bin/wvdial \
+                       -p /run/wvdial.%iface%.pid -s 2
+ 
+ 
+@@ -200,9 +200,9 @@ method ipv4ll
+     known as APIPA or IPAC, and often colloquially referred to
+     as "Zeroconf address".
+   up
+-    /usr/sbin/avahi-autoipd -D %iface%
++    avahi-autoipd -D %iface%
+   down
+-    /usr/sbin/avahi-autoipd --kill %iface%
++    avahi-autoipd --kill %iface%
+ 
+ architecture kfreebsd
+ 
+@@ -211,12 +211,12 @@ method loopback
+     This method may be used to define the IPv4 loopback interface.
  
    up
-     ifconfig %iface% 127.0.0.1 up \
+-    /sbin/ifconfig %iface% 127.0.0.1 up \
 -	if (!iface_is_lo())
++    ifconfig %iface% 127.0.0.1 up \
 +	if (iface_is_lo())
  
    down
-     ifconfig %iface% down \
+-    /sbin/ifconfig %iface% down \
 -	if (!iface_is_lo())
++    ifconfig %iface% down \
 +	if (iface_is_lo())
  
  method static
    description
-@@ -371,11 +371,11 @@ method loopback
+@@ -238,15 +238,15 @@ method static
+     hwaddress cleanup_hwaddress
+ 
+   up
+-    [[ /sbin/ifconfig %iface% link %hwaddress%]]
+-    /sbin/ifconfig %iface% %address% [[netmask %netmask%]] [[broadcast %broadcast%]] \
++    [[ ifconfig %iface% link %hwaddress%]]
++    ifconfig %iface% %address% [[netmask %netmask%]] [[broadcast %broadcast%]] \
+ 	[[pointopoint %pointopoint%]] [[media %media%]] [[mtu %mtu%]] \
+ 	up
+-    [[ /sbin/route add default %gateway% ]]
++    [[ route add default %gateway% ]]
+ 
+   down
+-    [[ /sbin/route del default %gateway% 2>&1 1>/dev/null || true ]]
+-    /sbin/ifconfig %iface% down
++    [[ route del default %gateway% 2>&1 1>/dev/null || true ]]
++    ifconfig %iface% down
+ 
+ method manual
+   description
+@@ -279,30 +279,30 @@ method dhcp
+     hwaddress cleanup_hwaddress
+ 
+   up
+-    [[/sbin/ifconfig %iface% link %hwaddress%]]
+-    /sbin/dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    [[ifconfig %iface% link %hwaddress%]]
++    dhclient -v -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+ 	[[-e IF_METRIC=%metric%]] \
+         if (execable("/sbin/dhclient"))
+-    /sbin/udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H %hostname%]] \
++    udhcpc -n -p /run/udhcpc.%iface%.pid -i %iface% [[-H %hostname%]] \
+            [[-c %client%]] \
+         elsif (execable("/sbin/udhcpc"))
+-    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
++    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
+            [[-l %leasetime%]] %iface% \
+         elsif (execable("/sbin/dhcpcd"))
+     echo 'No DHCP client software found!' >/dev/stderr; false \
+         elsif (1)
+ 
+   down
+-    /sbin/dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
++    dhclient -v -r -pf /run/dhclient.%iface%.pid -lf /var/lib/dhcp/dhclient.%iface%.leases -I -df /var/lib/dhcp/dhclient6.%iface%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+-    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface%.pid); fi \
++    if test -f /run/udhcpc.%iface%.pid; then kill -USR2 $(cat /run/udhcpc.%iface%.pid); kill -TERM $(cat /run/udhcpc.%iface%.pid); fi \
+         elsif (execable("/sbin/udhcpc"))
+-    /sbin/dhcpcd -k %iface% \
++    dhcpcd -k %iface% \
+         elsif (execable("/sbin/dhcpcd"))
+     echo 'No DHCP client software found!' >/dev/stderr; false \
+         elsif (1)
+ 
+-    /sbin/ifconfig %iface% down
++    ifconfig %iface% down
+ 
+ method bootp
+   description
+@@ -316,11 +316,11 @@ method bootp
+                       whatever it really is.
+ 
+   up
+-    /sbin/bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
++    bootpc [[--bootfile %bootfile%]] --dev %iface% [[--server %server%]] \
+            [[--hwaddr %hwaddr%]] --returniffail --serverbcast
+ 
+   down
+-    /sbin/ifconfig %iface% down
++    ifconfig %iface% down
+ 
+ method ppp
+   description
+@@ -331,9 +331,9 @@ method ppp
+     unit number    -- Use /number/ as the ppp unit number.
+     options string -- Pass /string/ as additional options to pon.
+   up
+-    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
++    pon [[%provider%]] [[unit %unit%]] [[%options%]]
+   down
+-    /usr/bin/poff [[%provider%]]
++    poff [[%provider%]]
+ 
+ method wvdial
+   description
+@@ -342,10 +342,10 @@ method wvdial
+   options
+     provider name  -- Use /name/ as the provider (from /etc/wvdial.conf).
+   up
+-    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
++    start-stop-daemon --start -x /usr/bin/wvdial \
+                       -p /run/wvdial.%iface%.pid -b -m -- [[ %provider% ]]
+   down
+-    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
++    start-stop-daemon --stop -x /usr/bin/wvdial \
+                       -p /run/wvdial.%iface%.pid -s 2
+ 
+ 
+@@ -356,9 +356,9 @@ method ipv4ll
+     known as APIPA or IPAC, and often colloquially referred to
+     as "Zeroconf address".
+   up
+-    /usr/sbin/avahi-autoipd -D %iface%
++    avahi-autoipd -D %iface%
+   down
+-    /usr/sbin/avahi-autoipd --kill %iface%
++    avahi-autoipd --kill %iface%
+ architecture hurd
+ 
+ method loopback
+@@ -367,11 +367,11 @@ method loopback
  
    up
      inetutils-ifconfig --interface %iface% --address 127.0.0.1 --up \
@@ -78,26 +353,70 @@ index b176ab4ed03e..5fdfb14a0e1c 100644
  
  method static
    description
-diff --git a/inet6.defn b/inet6.defn
-index 09325539cd01..4df64aff38cc 100644
---- a/inet6.defn
-+++ b/inet6.defn
-@@ -33,11 +33,11 @@ method loopback
-   description
-     This method may be used to define the IPv6 loopback interface.
+@@ -432,23 +432,23 @@ method dhcp
+ 
    up
--    -ip link set dev %iface% up 2>/dev/null if (!iface_is_lo())
--    -ip addr add dev %iface% ::1 2>/dev/null if (!iface_is_lo())
-+    -ip link set dev %iface% up 2>/dev/null if (iface_is_lo())
-+    -ip addr add dev %iface% ::1 2>/dev/null if (iface_is_lo())
+     [[Warning: Option hwaddress: %hwaddress% not yet supported]]
+-    /sbin/dhclient -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
++    dhclient -v -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+-    /sbin/udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H %hostname%]] \
++    udhcpc -n -p /run/udhcpc.%iface///.%.pid -i %iface% [[-H %hostname%]] \
+            [[-c %client%]] \
+         elsif (execable("/sbin/udhcpc"))
+-    /sbin/dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
++    dhcpcd [[-h %hostname%]] [[-i %vendor%]] [[-I %client%]] \
+            [[-l %leasetime%]] %iface% \
+         elsif (execable("/sbin/dhcpcd"))
+     echo 'No DHCP client software found!' >/dev/stderr; false \
+         elsif (1)
+ 
+   down
+-    /sbin/dhclient -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
++    dhclient -v -r -pf /run/dhclient.%iface///.%.pid -lf /var/lib/dhcp/dhclient.%iface///.%.leases -I -df /var/lib/dhcp/dhclient6.%iface///.%.leases %iface% \
+         if (execable("/sbin/dhclient"))
+-    if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2 $(/bin/cat /run/udhcpc.%iface///.%.pid); kill -TERM $(/bin/cat /run/udhcpc.%iface///.%.pid); fi \
++    if test -f /run/udhcpc.%iface///.%.pid; then kill -USR2 $(cat /run/udhcpc.%iface///.%.pid); kill -TERM $(cat /run/udhcpc.%iface///.%.pid); fi \
+         elsif (execable("/sbin/udhcpc"))
+-    /sbin/dhcpcd -k %iface% \
++    dhcpcd -k %iface% \
+         elsif (execable("/sbin/dhcpcd"))
+     echo 'No DHCP client software found!' >/dev/stderr; false \
+         elsif (1)
+@@ -482,9 +482,9 @@ method ppp
+     unit number    -- Use /number/ as the ppp unit number.
+     options string -- Pass /string/ as additional options to pon.
+   up
+-    /usr/bin/pon [[%provider%]] [[unit %unit%]] [[%options%]]
++    pon [[%provider%]] [[unit %unit%]] [[%options%]]
    down
--    -ip addr del dev %iface% ::1 2>/dev/null if (!iface_is_lo())
--    -ip link set dev %iface% down 2>/dev/null if (!iface_is_lo())
-+    -ip addr del dev %iface% ::1 2>/dev/null if (iface_is_lo())
-+    -ip link set dev %iface% down 2>/dev/null if (iface_is_lo())
+-    /usr/bin/poff [[%provider%]]
++    poff [[%provider%]]
  
- method static
+ method wvdial
    description
+@@ -493,10 +493,10 @@ method wvdial
+   options
+     provider name  -- Use /name/ as the provider (from /etc/wvdial.conf).
+   up
+-    /sbin/start-stop-daemon --start -x /usr/bin/wvdial \
++    start-stop-daemon --start -x /usr/bin/wvdial \
+                       -p /run/wvdial.%iface///.%.pid -b -m -- [[ %provider% ]]
+   down
+-    /sbin/start-stop-daemon --stop -x /usr/bin/wvdial \
++    start-stop-daemon --stop -x /usr/bin/wvdial \
+                       -p /run/wvdial.%iface///.%.pid -s 2
+ 
+ 
+@@ -507,6 +507,6 @@ method ipv4ll
+     known as APIPA or IPAC, and often colloquially referred to
+     as "Zeroconf address".
+   up
+-    /usr/sbin/avahi-autoipd -D %iface%
++    avahi-autoipd -D %iface%
+   down
+-    /usr/sbin/avahi-autoipd --kill %iface%
++    avahi-autoipd --kill %iface%
 -- 
-1.9.1
+2.4.0
 
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
similarity index 95%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
index 9de01f9..eb8426c 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.2.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.16.bb
@@ -6,12 +6,12 @@ the file /etc/network/interfaces."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "git://anonscm.debian.org/git/collab-maint/ifupdown.git;protocol=https \
+SRC_URI = "git://anonscm.debian.org/git/collab-maint/ifupdown.git \
 	   file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
 	   file://inet-6-.defn-fix-inverted-checks-for-loopback.patch \
 	   file://99_network \
 	  "
-SRCREV = "05ea2fd4f49bb1201aeef2a42efbcff8f336112f"
+SRCREV = "11b9f99f7ecc7052497e6786156cfed531f11823"
 
 S = "${WORKDIR}/git"
 
-- 
2.4.0


