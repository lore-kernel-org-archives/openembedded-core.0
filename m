Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6865E77382
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 21:35:31 +0000 (UTC)
Received: by wmdw130 with SMTP id w130so68371359wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Nov 2015 13:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iAXb+c3RF+FLcdqfhkxrec2VZT9+SsXTH830SIw5tkk=;
	b=M+ZzMqpMd8SA/rf8famPOFnjfIIjAWeTe0Ir4/ZpzGQ8pROwx3OGD+OaKedSbCoSLZ
	Z8ylWrFbALeqsgzxMJ7YxOjG7VGsWUVXJB5Phm1wqLGO+N8fdI/b1S+uQwCNKY2OXCTl
	EFMSzbpTQ53buG66J43Tyi1puns9ix40jdd/sXrsbv0w6N6wl8GGK7MF+uKxWWKM5g34
	GQi3WkbC0fENP7A7uRzNc5gc2n150CuHiTcWFkbpsVJveWPD/mxMUufqct7MSJKmV/2n
	7KACTxRixEXwfaf1yqKCMjxHhFAy+bXp0K1MJTbsZcQtMaehs0hhqkWjf23EtHCDSJXs
	lllg==
X-Received: by 10.194.7.97 with SMTP id i1mr33504089wja.87.1447536931883;
	Sat, 14 Nov 2015 13:35:31 -0800 (PST)
Received: from chl500346.lan.ffah.ch (c-82-192-248-24.customer.ggaweb.ch.
	[82.192.248.24]) by smtp.gmail.com with ESMTPSA id
	c4sm14784681wjs.36.2015.11.14.13.35.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Nov 2015 13:35:31 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Nov 2015 22:35:06 +0100
Message-Id: <1447536908-21449-2-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
References: <1447536908-21449-1-git-send-email-adrian.freihofer@gmail.com>
Subject: [meta-oe][PATCH 1/3] connman: fix qemu config
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
X-List-Received-Date: Sat, 14 Nov 2015 21:35:32 -0000

If a network interface is configured by kernel boot parameters
and the image is booted in qemu, connman takes the IP settings
from /proc/cmdline for this NIC.
The regex for parsing /proc/cmdline is invalid.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
index c46899e..4a61513 100644
--- a/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
+++ b/meta/recipes-connectivity/connman/connman-conf/qemuall/wired-setup
@@ -2,8 +2,10 @@
 
 CONFIGF=/var/lib/connman/wired.config
 
-# Extract wired network config from /proc/cmdline
-NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([^ ]*\):\([^ ]*\):\([^ ]*\):\([^ ]*\).*$/\1\/\4\/\3/p'`
+# Extract wired network config (IPv4 = <client-ip>/<netmask>/<gw-ip>) from /proc/cmdline
+# "ip=<client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:<dns0-ip>:<dns1-ip> "
+NET_CONF=`cat /proc/cmdline |sed -ne 's/^.*ip=\([0-9.]*\):\([0-9.]*\):\([0-9.]*\):\([0-9.]*\).*$/\1\/\4\/\3/p'`
+NET_CONF=${NET_CONF=%/}
 
 # Check if eth0 is already set via kernel cmdline
 if [ "x$NET_CONF" = "x" ]; then
-- 
2.4.3


