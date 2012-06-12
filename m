Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SeY0C-0002Qz-Q3
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 22:47:48 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id F184B2FE88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 16:37:10 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jun 2012 13:36:42 -0700
Message-Id: <680a94c378f20c00e8bee0575b8922bccc008fec.1339533128.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1339533128.git.scott.a.garman@intel.com>
References: <cover.1339533128.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: F184B2FE88.F1135
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 11/16] runqemu-ifup: enable arp proxying
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
X-List-Received-Date: Tue, 12 Jun 2012 20:47:49 -0000

This allows core-image-sato to access the WAN.

Thanks to Dexuan Cui for proposing this fix.

Fixes [YOCTO #2329]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu-ifup |    1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index f80538f..1f1b4c8 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -103,6 +103,7 @@ $ROUTE add -host 192.168.7.$dest $TAP
 $IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$n/32
 $IPTABLES -A POSTROUTING -t nat -j MASQUERADE -s 192.168.7.$dest/32
 echo 1 > /proc/sys/net/ipv4/ip_forward
+echo 1 > /proc/sys/net/ipv4/conf/$TAP/proxy_arp
 $IPTABLES -P FORWARD ACCEPT
 
 echo $TAP
-- 
1.7.9.5



