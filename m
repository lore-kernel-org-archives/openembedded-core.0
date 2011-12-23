Received: from db3ehsobe005.messaging.microsoft.com ([213.199.154.143]
	helo=DB3EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Rdvfp-0002ac-8T
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 04:19:57 +0100
Received: from mail4-db3-R.bigfish.com (10.3.81.246) by
	DB3EHSOBE005.bigfish.com (10.3.84.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 23 Dec 2011 02:57:35 +0000
Received: from mail4-db3 (localhost [127.0.0.1])	by mail4-db3-R.bigfish.com
	(Postfix) with ESMTP id 04A6C500530	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 02:58:14 +0000 (UTC)
X-SpamScore: -5
X-BigFish: VS-5(zz1432Nzz1202hzz8275bhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail4-db3 (localhost.localdomain [127.0.0.1]) by mail4-db3
	(MessageSwitch) id 1324609056825524_3313;
	Fri, 23 Dec 2011 02:57:36 +0000 (UTC)
Received: from DB3EHSMHS007.bigfish.com (unknown [10.3.81.244])	by
	mail4-db3.bigfish.com (Postfix) with ESMTP id C5038680045	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 02:57:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS007.bigfish.com
	(10.3.87.107) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 23 Dec 2011 02:56:57 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 22 Dec 2011 20:57:08 -0600
Received: from localhost.localdomain (bjsimics-desktop.ap.freescale.net
	[10.192.208.197])	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP
	id pBN2v5Yl029577;	Thu, 22 Dec 2011 20:57:06 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Dec 2011 11:00:24 +0800
Message-ID: <1324609224-28618-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 oe-core] linux-dtb: add dtb into deploy cache package
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
X-List-Received-Date: Fri, 23 Dec 2011 03:19:57 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    > current dtb is not included in the deploy cache package, dtb is missing
      when build kernel from caches

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 7ec7584..e537d86 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -25,3 +25,11 @@ do_install_append() {
     fi
 }
 
+do_deploy_append() {
+    if test -n "${KERNEL_DEVICETREE}"; then
+        install -d ${DEPLOYDIR}
+        install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
+        cd ${DEPLOYDIR}
+        ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
+    fi
+}
-- 
1.7.0.4




