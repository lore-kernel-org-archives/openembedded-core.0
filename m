Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfua-0002zm-4z
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:36 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125519"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:49 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:30 -0700
Message-Id: <78c7a82a2e3214eaec3c559269e3cc6c219759c0.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 19/32] runqemu-ifup: enable ip masquerading for QEMU NAT addresses
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
X-List-Received-Date: Thu, 24 May 2012 21:49:36 -0000

Fix the IP masquerading settings so that networked QEMU sessions can
reach external networks.

This is a partial fix for [YOCTO #2329].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu-ifup |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 3bd9980..f80538f 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -100,7 +100,8 @@ dest=$[ (`echo $TAP | sed 's/tap//'` * 2) + 2 ]
 $ROUTE add -host 192.168.7.$dest $TAP
 
 # setup NAT for tap0 interface to have internet access in QEMU
-$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.0/24
+$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
+$IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
 echo 1 > /proc/sys/net/ipv4/ip_forward
 $IPTABLES -P FORWARD ACCEPT
 
-- 
1.7.9.5



