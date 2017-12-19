Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 5DB917841B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 13:09:59 +0000 (UTC)
Received: from linuxdev2.toradex.int (unknown [46.140.72.82])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id A42B85C39DD;
	Tue, 19 Dec 2017 14:03:49 +0100 (CET)
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:09:50 +0100
Message-Id: <20171219130950.36548-1-stefan@agner.ch>
X-Mailer: git-send-email 2.13.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513688629; bh=tCV5/D8j88KBsryDPp0jAvslfwRhXM2Gystc0LbJySo=;
	h=From:To:Cc:Subject:Date:Message-Id;
	b=sn4ypGTC50992GNtGYUgo6YILvCeoSPnGwjbHAlvZoqs6C3bjJs3hJWHOO+H7A1PkKe+PesVhUdujmcUULjO7Wbuc5lEkp+a0adw5q8Gf9b7MnXp56kLm0IIf17t4PWzrqyTO56pm3CaZfTySha+PM71lLyVRmtEZep6Hz5CLhc=
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH] busybox: udhcpc: fix IPv6 support when using udhcpc
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
X-List-Received-Date: Tue, 19 Dec 2017 13:09:59 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The udhcpc script calls ip addr flush .. which flushes addresses
of any address family, including IPv6. However, busybox udhcpc is
IPv4 only and should not influence IPv6 addressing. Hence use ip
addr flush with family constrait.

The script particularly broke IPv6 SLAAC: Typically when udhcpc
calls the script the kernel already assigned the IPv6 link-local
address. The flush removes the link-local IPv6 address again and
prohibits proper IPv6 operation such as SLAAC since neighbor
discovery protocol relies on IPv6 link-local addressing.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/recipes-core/busybox/files/simple.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/files/simple.script b/meta/recipes-core/busybox/files/simple.script
index 6ed0293525..8b5eb53633 100644
--- a/meta/recipes-core/busybox/files/simple.script
+++ b/meta/recipes-core/busybox/files/simple.script
@@ -28,7 +28,7 @@ case "$1" in
 		fi
 		if ! root_is_nfs ; then
                         if [ $have_bin_ip -eq 1 ]; then
-                                /SBIN_DIR/ip addr flush dev $interface
+                                /SBIN_DIR/ip -4 addr flush dev $interface
                                 /SBIN_DIR/ip link set dev $interface up
                         else
                                 /SBIN_DIR/ifconfig $interface 0.0.0.0
-- 
2.13.6


