Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE126601A5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 09:35:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v289ZqKH030839
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Mar 2017 01:35:55 -0800
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 8 Mar 2017 01:35:51 -0800
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Mar 2017 17:27:30 +0800
Message-ID: <1488965251-11171-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] busybox: ifupdown:pass interface device name for ipv6 route command
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
X-List-Received-Date: Wed, 08 Mar 2017 09:35:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

IPv6 routes need the device argument for link-local routes, or they
cannot be used at all. E.g. "gateway fe80::def" seems to be used in
some places, but kernel refuses to insert the route unless device
name is explicitly specified in the route addition.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 ...ss-interface-device-name-for-ipv6-route-c.patch | 52 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch

diff --git a/meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch b/meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch
new file mode 100644
index 0000000..2c9e5ae
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.24.1/ifupdown-pass-interface-device-name-for-ipv6-route-c.patch
@@ -0,0 +1,52 @@
+From 06fcf98f6ca40dc6b823d7d6231a240a1794ef2d Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Tue, 28 Feb 2017 10:40:37 +0800
+Subject: [PATCH] ifupdown: pass interface device name for ipv6 route commands
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 028524317d8d0011ed38e86e507a06738a5b5a97 from upstream
+
+IPv6 routes need the device argument for link-local routes, or they
+cannot be used at all. E.g. "gateway fe80::def" seems to be used in
+some places, but kernel refuses to insert the route unless device
+name is explicitly specified in the route addition.
+
+Signed-off-by: Timo Teräs <timo.teras@iki.fi>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ networking/ifupdown.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/networking/ifupdown.c b/networking/ifupdown.c
+index 17bc4e9..a00f68d 100644
+--- a/networking/ifupdown.c
++++ b/networking/ifupdown.c
+@@ -394,8 +394,8 @@ static int FAST_FUNC static_up6(struct interface_defn_t *ifd, execfn *exec)
+ # if ENABLE_FEATURE_IFUPDOWN_IP
+ 	result = execute("ip addr add %address%/%netmask% dev %iface%[[ label %label%]]", ifd, exec);
+ 	result += execute("ip link set[[ mtu %mtu%]][[ addr %hwaddress%]] %iface% up", ifd, exec);
+-	/* Was: "[[ ip ....%gateway% ]]". Removed extra spaces w/o checking */
+-	result += execute("[[ip route add ::/0 via %gateway%]][[ metric %metric%]]", ifd, exec);
++	/* Reportedly, IPv6 needs "dev %iface%", but IPv4 does not: */
++	result += execute("[[ip route add ::/0 via %gateway% dev %iface%]][[ metric %metric%]]", ifd, exec);
+ # else
+ 	result = execute("ifconfig %iface%[[ media %media%]][[ hw %hwaddress%]][[ mtu %mtu%]] up", ifd, exec);
+ 	result += execute("ifconfig %iface% add %address%/%netmask%", ifd, exec);
+@@ -421,7 +421,8 @@ static int FAST_FUNC v4tunnel_up(struct interface_defn_t *ifd, execfn *exec)
+ 			"%endpoint%[[ local %local%]][[ ttl %ttl%]]", ifd, exec);
+ 	result += execute("ip link set %iface% up", ifd, exec);
+ 	result += execute("ip addr add %address%/%netmask% dev %iface%", ifd, exec);
+-	result += execute("[[ip route add ::/0 via %gateway%]]", ifd, exec);
++	/* Reportedly, IPv6 needs "dev %iface%", but IPv4 does not: */
++	result += execute("[[ip route add ::/0 via %gateway% dev %iface%]]", ifd, exec);
+ 	return ((result == 4) ? 4 : 0);
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index afb69d1..41fc641 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -54,6 +54,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://commit-applet_tables-fix-commit-0dddbc1.patch \
            file://makefile-libbb-race.patch \
            file://0001-libiproute-handle-table-ids-larger-than-255.patch \
+           file://ifupdown-pass-interface-device-name-for-ipv6-route-c.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
1.9.1


