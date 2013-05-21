Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id DD3E160897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 07:39:04 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 May 2013 00:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,713,1363158000"; d="scan'208";a="244495374"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 21 May 2013 00:38:50 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 10:38:40 +0300
Message-Id: <4038377c71573129009473c15599e3d40b6b66a4.1369121729.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369121729.git.laurentiu.palcu@intel.com>
References: <cover.1369121729.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1369121729.git.laurentiu.palcu@intel.com>
References: <cover.1369121729.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/1] runqemu: fix networking issues
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
X-List-Received-Date: Tue, 21 May 2013 07:39:05 -0000

After switching from ifconfig to ip, networking stopped working. This
commit contains the following fixes:

 * set a decent broadcast address for the tap device;
 * bring up the device;
 * add the route using ip tool instead of the old route tool;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/runqemu-ifup |   15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 8948153..5f6a437 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -80,16 +80,6 @@ if [ ! -x "$IFCONFIG" ]; then
 	exit 1
 fi
 
-ROUTE=`which route`
-if [ "x$ROUTE" = "x" ]; then
-	# better than nothing...
-	ROUTE=/sbin/route
-fi
-if [ ! -x "$ROUTE" ]; then
-	echo "$ROUTE cannot be executed"
-	exit 1
-fi
-
 IPTABLES=`which iptables 2> /dev/null`
 if [ "x$IPTABLES" = "x" ]; then
 	IPTABLES=/sbin/iptables
@@ -100,10 +90,11 @@ if [ ! -x "$IPTABLES" ]; then
 fi
 
 n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-$IFCONFIG addr add 192.168.7.$n/32 dev $TAP
+$IFCONFIG addr add 192.168.7.$n/32 broadcast 192.168.7.255 dev $TAP
+$IFCONFIG link set dev $TAP up
 
 dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
-$ROUTE add -host 192.168.7.$dest $TAP
+$IFCONFIG route add to 192.168.7.$dest dev $TAP
 
 # setup NAT for tap0 interface to have internet access in QEMU
 $IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
-- 
1.7.9.5


