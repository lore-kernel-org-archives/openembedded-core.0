Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B321F7770B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 08:28:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u878SfBQ025783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2016 01:28:41 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 7 Sep 2016 01:28:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2016 01:28:36 -0700
Message-ID: <dc8634c6bed6f83632ce9d9f3ce2858203005553.1473236857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1473236857.git.liezhi.yang@windriver.com>
References: <cover.1473236857.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] pciutils: fix PACKAGECONFIG
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
X-List-Received-Date: Wed, 07 Sep 2016 08:28:40 -0000
Content-Type: text/plain

The PACKAGECONFIG's value doens't go into EXTRA_OECONF, but
PACKAGECONFIG_CONFARGS.

Fixed:
pciutils-3.5.1: libpci rdepends on libudev, but it isn't a build dependency, missing eudev in DEPENDS or PACKAGECONFIG? [build-deps]
pciutils-3.5.1: pciutils rdepends on libudev, but it isn't a build dependency, missing eudev in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils_3.5.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
index a84efd9..d32b119 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.5.1.bb
@@ -27,9 +27,9 @@ PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes"
 do_configure () {
 	(
 	  cd lib && \
-	  # EXTRA_OECONF for this recipe could only possibly contain 'HWDB=yes/no', so we put it
-	  # before ./configure
-	  ${PCI_CONF_FLAG} ${EXTRA_OECONF} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
+	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain 'HWDB=yes/no',
+	  # so we put it before ./configure
+	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
 	)
 }
 
-- 
2.9.0


