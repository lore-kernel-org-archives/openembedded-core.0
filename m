Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQQ-00047k-56
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149733187"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 16:37:02 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbFrR006535 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:15 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbFZi006534
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:15 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:36:56 -0700
Message-Id: <590d3c5ed0812ef579ba4aed3ee019e2037937d6.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 08/22] runqemu-ifup: enable arp proxying
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2012 23:47:34 -0000

From: Scott Garman <scott.a.garman@intel.com>

This allows core-image-sato to access the WAN.

Thanks to Dexuan Cui for proposing this fix.

Fixes [YOCTO #2329]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 scripts/runqemu-ifup |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index e4c3daf..0926faf 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -109,6 +109,7 @@ $ROUTE add -host 192.168.7.$dest $TAP
 $IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
 $IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
 echo 1 > /proc/sys/net/ipv4/ip_forward
+echo 1 > /proc/sys/net/ipv4/conf/$TAP/proxy_arp
 $IPTABLES -P FORWARD ACCEPT
 
 echo $TAP
-- 
1.7.5.4



