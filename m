Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBZna-0002Ps-EG
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 00:18:49 +0200
Received: from mail43-db3-R.bigfish.com (10.3.81.245) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 22:13:11 +0000
Received: from mail43-db3 (localhost.localdomain [127.0.0.1])	by
	mail43-db3-R.bigfish.com (Postfix) with ESMTP id E7D3CCE83AD	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 22:13:10 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail43-db3 (localhost.localdomain [127.0.0.1]) by mail43-db3
	(MessageSwitch) id 1317852790762666_15248;
	Wed,  5 Oct 2011 22:13:10 +0000 (UTC)
Received: from DB3EHSMHS013.bigfish.com (unknown [10.3.81.245])	by
	mail43-db3.bigfish.com (Postfix) with ESMTP id B52EB14F804E	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 22:13:10 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS013.bigfish.com
	(10.3.87.113) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 22:13:10 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 5 Oct 2011 17:13:10 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id
	p95MD9uR002139	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Oct 2011 17:13:09 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Oct 2011 17:13:08 -0500
Message-ID: <1317852788-16690-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v3 1/6] Fix mdadm for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 22:18:49 -0000
Content-Type: text/plain

This takes an upstream fix for compiling on powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../0001-mdadm-fix-build-failures-ppc64.patch      |   50 ++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    6 ++-
 2 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
new file mode 100644
index 0000000..931ecbc
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
@@ -0,0 +1,50 @@
+From 19986c721c9ac4b353c8592998d70d0dc8860bfd Mon Sep 17 00:00:00 2001
+From: Milan Broz <mbroz@redhat.com>
+Date: Thu, 14 Jul 2011 13:58:36 +1000
+Subject: [PATCH] mdadm: fix build failures (ppc64)
+
+This patch fixes these build issues:
+
+super-intel.c: In function 'getinfo_super_imsm_volume':
+super-intel.c:2327:4: error: format '%llu' expects argument of type 'long long
+unsigned int', but argument 3 has type '__u64' [-Werror=format]
+
+super-intel.c: In function 'imsm_reshape_super':
+super-intel.c:8665:7: error: 'devnum' may be used uninitialized in this function [-Werror=uninitialized]
+
+Signed-off-by: Milan Broz <mbroz@redhat.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+---
+ super-intel.c |    9 ++++++---
+ 1 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/super-intel.c b/super-intel.c
+index 5ea3b36..70cf993 100644
+--- a/super-intel.c
++++ b/super-intel.c
+@@ -2326,7 +2326,9 @@ static void getinfo_super_imsm_volume(struct supertype *st, struct mdinfo *info,
+ 
+ 			dprintf("IMSM: General Migration checkpoint : %llu "
+ 			       "(%llu) -> read reshape progress : %llu\n",
+-				units, blocks_per_unit, info->reshape_progress);
++				(unsigned long long)units,
++				(unsigned long long)blocks_per_unit,
++				info->reshape_progress);
+ 
+ 			used_disks = imsm_num_data_members(dev, 1);
+ 			if (used_disks > 0) {
+@@ -8661,8 +8663,9 @@ static int imsm_reshape_super(struct supertype *st, long long size, int level,
+ 		dprintf("imsm: info: Volume operation\n");
+ 		/* find requested device */
+ 		while (dev) {
+-			imsm_find_array_minor_by_subdev(dev->index, st->container_dev, &devnum);
+-			if (devnum == geo.dev_id)
++			if (imsm_find_array_minor_by_subdev(
++				    dev->index, st->container_dev, &devnum) == 0
++			    && devnum == geo.dev_id)
+ 				break;
+ 			dev = dev->next;
+ 		}
+-- 
+1.7.6.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
index 5d29ae7..492cc8e 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.2.2.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://mdmon.c;beginline=4;endline=18;md5=af7d8444d9c4d3e5c7caac0d9d34039d \
                     file://mdadm.h;beglinlne=4;endline=22;md5=462bc9936ac0d3da110191a3f9994161"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.bz2 \
+	    file://0001-mdadm-fix-build-failures-ppc64.patch \
+	  "
 
 SRC_URI[md5sum] = "12ee2fbf3beddb60601fb7a4c4905651"
 SRC_URI[sha256sum] = "0d1a04e688b082bc88846e3f524abd50bc782b6ffc06123140f7d358c8f9b906"
-- 
1.7.6.1




