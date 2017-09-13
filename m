Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9E59678458
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 06:02:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8D622lO008897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 23:02:02 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 12 Sep 2017 23:02:01 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:01:07 +0800
Message-ID: <1505282467-17830-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] busybox: using ip instead of ifconfig for ifup/ifdown
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
X-List-Received-Date: Wed, 13 Sep 2017 06:02:01 -0000
Content-Type: text/plain

There is an issue for requesting dynamic IP with ifup/ifdown command
when using dhclient.

Steps to reproduce:
1. Build a full-cmdline image and install dhcp-client as the default DHCP client.
2. Configure a static IP for eth0 in /etc/networking/interfaces and reboot.
    $ ifconfig eth0
    eth0      inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
    $ ifdown eth0
3. Modify /etc/networking/interfaces to configure a dynamic IP for eth0
    $ ifup eth0
    $ ifconfig eth0
    eth0      inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0

You could see the eth0 still has a static IP. But actually it also has a
dynamic IP:
    $ ip addr show eth0
    eth0:
        inet 192.168.1.2/24 brd 192.168.1.255 scope global eth0
        inet 128.224.162.173/23 brd 128.224.163.255 scope global eth0

The root cause is the ifdown invokes "ifconfig" to down the eth0 but
doesn't remove its IP. The dhclient would invoke "ip" to configure the
interface. It can not remove an IP from down interface with "ip addr
flush" and "ip addr add" command can set multiple IPs on one interface.

To fix this issue, we should use the "ip" command to implement
ifup/ifdown, rather than using the older "ifconfig". It will flush the
IP before down the interface.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 54202ef..cc68bea 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -820,9 +820,9 @@ CONFIG_FEATURE_IFCONFIG_HW=y
 # CONFIG_IFPLUGD is not set
 CONFIG_IFUPDOWN=y
 CONFIG_IFUPDOWN_IFSTATE_PATH="/var/run/ifstate"
-# CONFIG_FEATURE_IFUPDOWN_IP is not set
-# CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
-CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN=y
+CONFIG_FEATURE_IFUPDOWN_IP=y
+CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN=y
+# CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
 CONFIG_FEATURE_IFUPDOWN_IPV4=y
 CONFIG_FEATURE_IFUPDOWN_IPV6=y
 CONFIG_FEATURE_IFUPDOWN_MAPPING=y
-- 
2.7.4


