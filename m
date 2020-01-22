Return-Path: <luca@lucaceresoli.net>
X-Greylist: delayed 984 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Jan 2020 16:50:56 UTC
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
	[89.40.174.40])
	by mail.openembedded.org (Postfix) with ESMTP id C30277FF02
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 16:50:56 +0000 (UTC)
Received: from [109.168.11.45] (port=40080 helo=pc-ceresoli.dev.aim)
	by hostingweb31.netsons.net with esmtpa (Exim 4.92)
	(envelope-from <luca@lucaceresoli.net>)
	id 1iuIxc-0004x6-Tb; Wed, 22 Jan 2020 17:34:32 +0100
From: Luca Ceresoli <luca@lucaceresoli.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 17:34:23 +0100
Message-Id: <20200122163423.17375-1-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
	luca+lucaceresoli.net/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] busybox: udhcpc: fix 'ip route add' with multiple interfaces on the same network
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
X-List-Received-Date: Wed, 22 Jan 2020 16:50:58 -0000
Content-Transfer-Encoding: 8bit

The udhcpc script fails to properly set a default route when:

 - 'ip' is present ($have_bin_ip -eq 1)
 - there are 2 or more interfaces connected to the same network
   (e.g. ethernet + wifi on the same home LAN / same DHCP server)

In this case, when the first interface gets an address from DHCP
(e.g. eth0), a default route is set correctly. When the second interface
(e.g. wlan0) gets its address, 'ip route add' without 'dev $interface' sets
the route on the other interface. The result looks like:

  # ip route
  default via 192.168.1.1 dev eth0  metric 5
  default via 192.168.1.1 dev eth0  metric 10          # wrong dev here
  192.168.1.0/24 dev eth0 scope link  src 192.168.1.20
  192.168.1.0/24 dev wlan0 scope link  src 192.168.1.30
  #

The situation might go unnoticed until eth0 is disconnected, because only
wlan0 is present but there is no route through wlan0.

Fix by explicitly passing "dev $interface" to 'ip route add'. Note that all
other 'ip' invocations already have "dev $interface" passed.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 meta/recipes-core/busybox/files/simple.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 6ed0293525c1..7bfa1526400f 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -59,7 +59,7 @@ case "$1" in
 			metric=10
 			for i in $router ; do
                                 if [ $have_bin_ip -eq 1 ]; then
-                                        /SBIN_DIR/ip route add default via $i metric $metric
+                                        /SBIN_DIR/ip route add default via $i metric $metric dev $interface
                                 else
                                         /SBIN_DIR/route add default gw $i dev $interface metric $metric 2>/dev/null
                                 fi
-- 
2.25.0


