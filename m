Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ScJSQ-0001yi-PV
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 18:51:42 +0200
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 37BC730409
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2012 12:41:12 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 09:41:02 -0700
Message-Id: <0cfc78b03c6a0e2c21c6a82ab9e78aa4a8b74949.1339000756.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339000756.git.scott.a.garman@intel.com>
References: <cover.1339000756.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339000756.git.scott.a.garman@intel.com>
References: <cover.1339000756.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 37BC730409.8A5BA
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] runqemu-ifup: enable arp proxying
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
X-List-Received-Date: Wed, 06 Jun 2012 16:51:42 -0000

This allows core-image-sato to access the WAN.

Thanks to Dexuan Cui for proposing this fix.

Fixes [YOCTO #2329]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu-ifup |    1 +
 1 file changed, 1 insertion(+)

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
1.7.9.5



