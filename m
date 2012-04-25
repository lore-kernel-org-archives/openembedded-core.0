Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SMpyo-0006Mh-Sc
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 02:21:10 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 1EF402FF43
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 20:11:32 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Apr 2012 17:11:26 -0700
Message-Id: <49762500156a52102418293f3fe167b21e252d8a.1335312509.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1335312509.git.scott.a.garman@intel.com>
References: <cover.1335312509.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1335312509.git.scott.a.garman@intel.com>
References: <cover.1335312509.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 1EF402FF43.35CCB
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu-ifup: enable ip masquerading for QEMU NAT addresses
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
X-List-Received-Date: Wed, 25 Apr 2012 00:21:11 -0000

Fix the IP masquerading settings so that networked QEMU sessions can
reach external networks.

This is a partial fix for [YOCTO #2329].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-ifup |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

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
1.7.5.4



