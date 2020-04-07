Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.5428.1586248741421543241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2020 01:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0378d0P8003515
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Apr 2020 01:39:00 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Apr 2020 01:38:59 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] Revert "dhclient: not always skip the nfsroot interface"
Date: Tue, 7 Apr 2020 16:38:58 +0800
Message-ID: <1586248738-410774-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

This reverts commit[27aec88 dhclient: not always skip
the nfsroot interface] which used to address the IP
address renew issue when boot a system in a nfsroot fs
and altogether boot with ip=dhcp.

But reported by some tester, the above commit introduces
below issue when run ltp test on a nfsroot system which
boot with ip=dhcp:
nfs: server 192.168.100.1 not responding, still trying
nfs: server 192.168.100.1 not responding, still trying
[snip]

So revert the above commit now to avoid blocking test.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../dhcp/files/dhclient-systemd-wrapper            | 26 +---------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper b/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
index 87c60fa..7d0e224 100644
--- a/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
+++ b/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
@@ -1,19 +1,5 @@
 #!/bin/sh
 
-# Add an initial /var/lib/dhcp/dhclient.leases to make
-# sure the IP which dhclient try to renew is the same
-# with the IP which kernel got from dhcp server during
-# boot
-update_dhclient_leases()
-{
-    local addr=$1
-    local interface=$2
-    echo "lease {" >> /var/lib/dhcp/dhclient.leases
-    echo "  interface \"${addr}\";" >> /var/lib/dhcp/dhclient.leases
-    echo "  fixed-address ${interface:0:-3};" >> /var/lib/dhcp/dhclient.leases
-    echo "}" >> /var/lib/dhcp/dhclient.leases
-}
-
 # In case the interface is used for nfs, skip it.
 nfsroot=0
 interfaces=""
@@ -33,7 +19,6 @@ while read dev mtpt fstype rest; do
 done
 exec 0<&9 9<&-
 
-
 if [ $nfsroot -eq 0 ]; then
     interfaces="$INTERFACES"
 else
@@ -42,16 +27,7 @@ else
     fi
     for i in $INTERFACES; do
 	if test "x$i" = "x$nfs_iface"; then
-            interface_addr=`ip -4 address show $nfs_iface | grep 'inet '|sed 's/.*inet \(\S\+\).*/\1/'`
-            if [ "x$interface_addr" != "x" ] && cat /proc/cmdline | grep "ip=dhcp" > /dev/null ; then
-                # use to renew lease if needed
-                interfaces="$interfaces $i"
-                # use to update /var/lib/dhcp/dhclient.leases if needed
-                # when the ip got by kernel, we need use dhclient to renew the ip
-                update_dhclient_leases $nfs_iface $interface_addr
-            else
-                echo "dhclient skipping nfsroot interface $i"
-            fi
+            echo "dhclient skipping nfsroot interface $i"
 	else
 	    interfaces="$interfaces $i"
 	fi
-- 
2.7.4

