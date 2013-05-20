Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UeNK3-0004tn-H6
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 12:28:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2013 03:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,707,1363158000"; d="scan'208";a="340142649"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 20 May 2013 03:09:45 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 13:09:44 +0300
Message-Id: <1369044584-6053-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] runqemu: fix networking issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 10:28:27 -0000

After switching from ifconfig to ip, networking stopped working. This
commit contains the following fixes:

 * set a decent broadcast address for the tap device;
 * bring up the device;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
Apparently, the autobuilder has some magic into it because all the sanity tests
succeeded... So, I don't know why AB tests succeeded but on my machine, and several
others, networking was broken and couldn't connect into the qemu image. If I'm
missing something, please, do not hesitate to correct me. This patch fixes the
issue for me though.

Thanks,
Laurentiu

 scripts/runqemu-ifup |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 8948153..108d9a4 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -100,7 +100,8 @@ if [ ! -x "$IPTABLES" ]; then
 fi
 
 n=$[ (`echo $TAP | sed 's/tap//'` * 2) + 1 ]
-$IFCONFIG addr add 192.168.7.$n/32 dev $TAP
+$IFCONFIG addr add 192.168.7.$n/32 broadcast 192.168.7.255 dev $TAP
+$IFCONFIG link set dev $TAP up
 
 dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
 $ROUTE add -host 192.168.7.$dest $TAP
-- 
1.7.9.5



