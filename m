Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22F166067C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Mar 2016 02:20:19 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2Q2KJtJ030923; Fri, 25 Mar 2016 21:20:19 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032521201942-229824 ;
	Fri, 25 Mar 2016 21:20:19 -0500 
Received: by ni.com (sSMTP sendmail emulation); Fri, 25 Mar 2016 21:20:18 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 21:20:05 -0500
Message-Id: <1458958806-30290-1-git-send-email-brad.mouring@ni.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
References: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/25/2016 09:20:20 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/25/2016 09:20:20 PM,
	Serialize complete at 03/25/2016 09:20:20 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-25_06:, , signatures=0
Cc: Joshua Lock <joshua.g.lock@intel.com>, Brad Mouring <brad.mouring@ni.com>
Subject: [fido][PATCH v2 1/2] busybox: Backport patch to fix zcip false-conflict
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
X-List-Received-Date: Sat, 26 Mar 2016 02:20:22 -0000

Busybox upstream fixed the issue where an incorrect comparison of
addresses led to bogus renegotiation of a new ll ip in 1.24. Backport
this change to 1.23.1.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 ...wrong-comparison-of-source-IP-with-our-IP.patch | 34 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.1.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch b/meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
new file mode 100644
index 0000000..83bd114
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
@@ -0,0 +1,34 @@
+From 4d15068d83054a9f82b3f8842706cd6deb401e25 Mon Sep 17 00:00:00 2001
+From: Vladislav Grishenko <themiron@mail.ru>
+Date: Thu, 19 Mar 2015 16:19:35 +0500
+Subject: [PATCH] zcip: fix wrong comparison of source IP with our IP
+
+Commit "zcip: fix link-local IP conflict detection" has introduced
+wrong comparsion of source IP with our IP. This leads to a new IP
+being picked unnecessarily on every incoming ARP packet.
+
+Signed-off-by: Vladislav Grishenko <themiron@mail.ru>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Brad Mouring <brad.mouring@ni.com>
+
+Upstream-Status: Backport (4d15068, added in 1.24)
+---
+ networking/zcip.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/networking/zcip.c b/networking/zcip.c
+index a3307c5..962ba2e 100644
+--- a/networking/zcip.c
++++ b/networking/zcip.c
+@@ -521,7 +521,7 @@ int zcip_main(int argc UNUSED_PARAM, char **argv)
+ 			target_ip_conflict = 0;
+ 
+ 			if (memcmp(&p.arp.arp_sha, &eth_addr, ETH_ALEN) != 0) {
+-				if (memcmp(p.arp.arp_spa, &ip.s_addr, sizeof(struct in_addr))) {
++				if (memcmp(p.arp.arp_spa, &ip.s_addr, sizeof(struct in_addr)) == 0) {
+ 					/* A probe or reply with source_ip == chosen ip */
+ 					source_ip_conflict = 1;
+ 				}
+-- 
+2.7.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.23.1.bb b/meta/recipes-core/busybox/busybox_1.23.1.bb
index 7c3ed84..2360fa9 100644
--- a/meta/recipes-core/busybox/busybox_1.23.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
+           file://0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch \
 "
 
 SRC_URI[tarball.md5sum] = "5c94d6301a964cd91619bd4d74605245"
-- 
2.7.3


