Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D269670EE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 02:59:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9U2xL2B004728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 19:59:21 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Wed, 29 Oct 2014 19:59:20 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Oct 2014 10:59:18 +0800
Message-ID: <1414637958-32273-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH] pciutils: Fix multilib header conflict - pci/config.h
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
X-List-Received-Date: Thu, 30 Oct 2014 02:59:22 -0000
Content-Type: text/plain

pci/config.h conflicts between 32-bit and 64-bit versions.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.2.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
index 852a93e..6e29953 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.2.1.bb
@@ -17,6 +17,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "425b1acad6854cc2bbb06ac8e48e76fc"
 SRC_URI[sha256sum] = "12d52b19042e2fd058af12e7d877bbbce72213cb3a0b5ec7ff0703ac09e3dcde"
 
+inherit multilib_header
+
 PARALLEL_MAKE = ""
 
 PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
@@ -49,6 +51,8 @@ do_install () {
 
 	install -d ${D}${bindir}
 	ln -s ../sbin/lspci ${D}${bindir}/lspci
+
+	oe_multilib_header pci/config.h
 }
 
 PACKAGES =+ "${PN}-ids libpci libpci-dev libpci-dbg"
-- 
1.8.4.1


