Received: from outbound.icp-qv1-irony-out1.iinet.net.au ([203.59.1.106])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S2EEs-0003Yz-2Z
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 05:00:35 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwEAGKdSE/LO4Se/2dsb2JhbABCsw+BB4JFAS0ogSmIBaoIAY0ijgUTBgMChH8HWAwggx4EiE2Sbox8
X-IronPort-AV: E=Sophos;i="4.73,494,1325433600"; d="scan'208";a="838505897"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-qv1-irony-out1.iinet.net.au with ESMTP;
	28 Feb 2012 11:48:57 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 11:49:06 +0800
Message-Id: <1330400946-22941-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] mtd-utils: Don't use host 'ranlib' or 'ar'.
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
X-List-Received-Date: Tue, 28 Feb 2012 04:00:35 -0000

If ranlib, ar, or cc are not supplied to make, it attempts to use ${CROSS}xxx.
Since ${CROSS} is not set, host ranlib may run, producing an unusable .a file on some platforms.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
index 519472c..4228b51 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.9.bb
@@ -11,9 +11,9 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=995cfe51b0a3cf
 
 S = "${WORKDIR}/git/"
 
-PR = "r0"
+PR = "r1"
 
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-- 
1.7.3.4



