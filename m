Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1ShqZO-0001P1-66
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 01:13:46 +0200
Received: from mizar.localdomain (87.14.251.158) by smtp208.alice.it
	(8.6.023.02) id 4FE1E6F6002F80E2; Fri, 22 Jun 2012 00:57:06 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 00:57:03 +0200
Message-Id: <1340319423-24865-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] mtd-utils: do not stage headers in sysroot
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
X-List-Received-Date: Thu, 21 Jun 2012 23:13:46 -0000

* Headers are included in the package for compatibility
* but have not yet been synched with linux 3.0
* The actual issue was that ubi-user.h in sysroot
* was overwritten by the older version.
* Unfortunately one ioctl was renamed:
* http://lists.infradead.org/pipermail/linux-mtd/
* 2011-March/034419.html
* Note: the recipe will still use its own older header,
* following upstream.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
index daa3554..1a9d4d3 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
@@ -11,16 +11,12 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=ca39eb1d98e736
 
 S = "${WORKDIR}/git/"
 
-PR = "r0"
+PR = "r1"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-	install -d ${D}${includedir}/mtd/
-	for f in ${S}/include/mtd/*.h; do
-		install -m 0644 $f ${D}${includedir}/mtd/
-	done
 }
 
 PARALLEL_MAKE = ""
-- 
1.7.3.4



