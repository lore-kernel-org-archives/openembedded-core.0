Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF1073166
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 09:40:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2S9eYKA012783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 02:40:34 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 28 Mar 2016 02:40:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Mar 2016 02:40:24 -0700
Message-ID: <60bad322f6e6ff0d0f124e0f5143f4b2034e3041.1459157937.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459157937.git.liezhi.yang@windriver.com>
References: <cover.1459157937.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] busybox-1.23: Backport patch to fix zcip false-conflict
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
X-List-Received-Date: Mon, 28 Mar 2016 09:40:34 -0000
Content-Type: text/plain

From: Brad Mouring <brad.mouring@ni.com>

Busybox upstream fixed the issue where an incorrect comparison of
addresses led to bogus renegotiation of a new ll ip in 1.24. Backport
this change to 1.23.2.

Signed-off-by: Brad Mouring <brad.mouring@ni.com>
---
 ...wrong-comparison-of-source-IP-with-our-IP.patch | 38 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch b/meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
new file mode 100644
index 0000000..dec5eb5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
@@ -0,0 +1,38 @@
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
+
+This change was picked from Busybox without modification
+(git://git.busybox.net/busybox, commit 4d15068)
+
+Upstream-Status: Backport (added in 1.24)
+Signed-off-by: Brad Mouring <brad.mouring@ni.com>
+
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
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index 7258df0..5edcbfd 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
            file://0002-Passthrough-r-to-linker.patch \
            file://0001-randconfig-fix.patch \
+           file://0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch \
            file://mount-via-label.cfg \
            file://sha1sum.cfg \
            file://sha256sum.cfg \
-- 
2.7.4


