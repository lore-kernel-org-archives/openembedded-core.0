Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SkgD8-0007Hu-7x
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 20:46:30 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5TIZXtt002916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 11:35:33 -0700 (PDT)
Received: from yow-pgortmak-d2.corp.ad.wrs.com (128.224.146.165) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 29 Jun 2012 11:35:33 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 14:35:15 -0400
Message-ID: <1340994915-14947-4-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.7.9.6
In-Reply-To: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
References: <1340994915-14947-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] u-boot: make sure CROSS_COMPILE is passed into build
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
X-List-Received-Date: Fri, 29 Jun 2012 18:46:30 -0000
Content-Type: text/plain

The u-boot build system expects this, otherwise it will
choose from its own internal defaults.  In the case of
powerpc, we'll see it look for "ppc_8xx-gcc" and fail.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
index 25cc8c9..b37fe01 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb
@@ -26,3 +26,6 @@ SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
 S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# u-boot expects this to indicate what toolchain to use
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX}"
-- 
1.7.9.6



