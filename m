Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.999.1585808772298406088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2020 23:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0326QBGa026826
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Apr 2020 23:26:11 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Apr 2020 23:26:10 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] dhclient: not always skip the nfsroot interface
Date: Thu, 2 Apr 2020 14:26:08 +0800
Message-ID: <1585808769-176932-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Don't skip the nfsroot interface when use dhcp
to get the address for nfsroot interface as the
nfsroot interface may need dhclient to renew
the lease.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../dhcp/files/dhclient-systemd-wrapper            | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper b/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
index 7d0e224..87c60fa 100644
--- a/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
+++ b/meta/recipes-connectivity/dhcp/files/dhclient-systemd-wrapper
@@ -1,5 +1,19 @@
 #!/bin/sh
 
+# Add an initial /var/lib/dhcp/dhclient.leases to make
+# sure the IP which dhclient try to renew is the same
+# with the IP which kernel got from dhcp server during
+# boot
+update_dhclient_leases()
+{
+    local addr=$1
+    local interface=$2
+    echo "lease {" >> /var/lib/dhcp/dhclient.leases
+    echo "  interface \"${addr}\";" >> /var/lib/dhcp/dhclient.leases
+    echo "  fixed-address ${interface:0:-3};" >> /var/lib/dhcp/dhclient.leases
+    echo "}" >> /var/lib/dhcp/dhclient.leases
+}
+
 # In case the interface is used for nfs, skip it.
 nfsroot=0
 interfaces=""
@@ -19,6 +33,7 @@ while read dev mtpt fstype rest; do
 done
 exec 0<&9 9<&-
 
+
 if [ $nfsroot -eq 0 ]; then
     interfaces="$INTERFACES"
 else
@@ -27,7 +42,16 @@ else
     fi
     for i in $INTERFACES; do
 	if test "x$i" = "x$nfs_iface"; then
-            echo "dhclient skipping nfsroot interface $i"
+            interface_addr=`ip -4 address show $nfs_iface | grep 'inet '|sed 's/.*inet \(\S\+\).*/\1/'`
+            if [ "x$interface_addr" != "x" ] && cat /proc/cmdline | grep "ip=dhcp" > /dev/null ; then
+                # use to renew lease if needed
+                interfaces="$interfaces $i"
+                # use to update /var/lib/dhcp/dhclient.leases if needed
+                # when the ip got by kernel, we need use dhclient to renew the ip
+                update_dhclient_leases $nfs_iface $interface_addr
+            else
+                echo "dhclient skipping nfsroot interface $i"
+            fi
 	else
 	    interfaces="$interfaces $i"
 	fi
-- 
2.7.4

