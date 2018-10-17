Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3A360053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 02:43:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9H2h8pa017101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2018 19:43:18 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 16 Oct 2018 19:42:57 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 10:42:55 +0800
Message-ID: <1539744175-17058-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] ifupdown: fix issue for configuring loopback interface
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
X-List-Received-Date: Wed, 17 Oct 2018 02:43:28 -0000
Content-Type: text/plain

The patch inet-6-.defn-fix-inverted-checks-for-loopback.patch introduced
an issue that ifup/ifdown can not configure loopback interface:

$ cat /etc/network/interfaces
auto lo
iface lo inet loopback

$ ifconfig -s
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500 0         1      0      0 0            74      0      0 0 BMRU
lo        65536 0         2      0      0 0             2      0      0 0 LRU
$ ifdown lo
$ ifconfig -s
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500 0         1      0      0 0            74      0      0 0 BMRU
lo        65536 0         2      0      0 0             2      0      0 0 LRU

The original patch is for 0.7.x and the change is not needed for 0.8.x.
Update the patch to make the ifup/ifdown can configure lo interface:
$ ifconfig -s
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500 0         0      0      0 0            77      0      0 0 BMRU
lo        65536 0         2      0      0 0             2      0      0 0 LRU
$ ifdown lo
$ ifconfig -s
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500 0         0      0      0 0            80      0      0 0 BMRU
$ ifup lo
$ ifconfig -s
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500 0         0      0      0 0            81      0      0 0 BMRU
lo        65536 0         2      0      0 0             2      0      0 0 LRU

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-6-.defn-fix-inverted-checks-for-loopback.patch | 38 +++++++---------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
index 2013933..37a61c9 100644
--- a/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
+++ b/meta/recipes-core/ifupdown/files/inet-6-.defn-fix-inverted-checks-for-loopback.patch
@@ -1,4 +1,4 @@
-From d88af5aa0312ea18aac791d66661da79b7bcd032 Mon Sep 17 00:00:00 2001
+From 7efe4676747e4e4a056b9bfb4e9424c8354e9996 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Wed, 21 Dec 2016 15:32:07 +0200
 Subject: [PATCH] inet[6].defn: fix inverted checks for loopback
@@ -35,12 +35,13 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- inet.defn | 148 +++++++++++++++++++++++++++++++-------------------------------
- 1 file changed, 74 insertions(+), 74 deletions(-)
+ inet.defn | 140 +++++++++++++++++++++++++++++++-------------------------------
+ 1 file changed, 70 insertions(+), 70 deletions(-)
 
 diff --git a/inet.defn b/inet.defn
-index 75e6744..b5f5da2 100644
+index 75e6744..23c7756 100644
 --- a/inet.defn
 +++ b/inet.defn
 @@ -6,10 +6,10 @@ method loopback
@@ -48,11 +49,11 @@ index 75e6744..b5f5da2 100644
  
    up
 -    /bin/ip link set dev %iface% up if (!iface_is_lo())
-+    ip link set dev %iface% up if (iface_is_lo())
++    ip link set dev %iface% up if (!iface_is_lo())
  
    down
 -    /bin/ip link set dev %iface% down if (!iface_is_lo())
-+    ip link set dev %iface% down if (iface_is_lo())
++    ip link set dev %iface% down if (!iface_is_lo())
  
  method static
    description
@@ -211,23 +212,20 @@ index 75e6744..b5f5da2 100644
  
  architecture kfreebsd
  
-@@ -211,12 +211,12 @@ method loopback
+@@ -211,11 +211,11 @@ method loopback
      This method may be used to define the IPv4 loopback interface.
  
    up
 -    /sbin/ifconfig %iface% 127.0.0.1 up \
--	if (!iface_is_lo())
 +    ifconfig %iface% 127.0.0.1 up \
-+	if (iface_is_lo())
+ 	if (!iface_is_lo())
  
    down
 -    /sbin/ifconfig %iface% down \
--	if (!iface_is_lo())
 +    ifconfig %iface% down \
-+	if (iface_is_lo())
+ 	if (!iface_is_lo())
  
  method static
-   description
 @@ -238,15 +238,15 @@ method static
      hwaddress cleanup_hwaddress
  
@@ -339,20 +337,6 @@ index 75e6744..b5f5da2 100644
  architecture hurd
  
  method loopback
-@@ -367,11 +367,11 @@ method loopback
- 
-   up
-     inetutils-ifconfig --interface %iface% --address 127.0.0.1 --up \
--	if (!iface_is_lo())
-+	if (iface_is_lo())
- 
-   down
-     inetutils-ifconfig --interface %iface% --down \
--	if (!iface_is_lo())
-+	if (iface_is_lo())
- 
- method static
-   description
 @@ -432,23 +432,23 @@ method dhcp
  
    up
@@ -418,5 +402,5 @@ index 75e6744..b5f5da2 100644
 -    /usr/sbin/avahi-autoipd --kill %iface%
 +    avahi-autoipd --kill %iface%
 -- 
-2.4.0
+2.7.4
 
-- 
2.7.4


