Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SiC8A-0007hH-RT
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Jun 2012 00:15:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Jun 2012 15:04:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115173235"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Jun 2012 15:04:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2012 15:00:44 -0700
Message-Id: <a8ed32964c9cc331d52d264bf7448c89b7e3a2f4.1340402353.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340402353.git.sgw@linux.intel.com>
References: <cover.1340402353.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 03/17] mtd-utils: do not stage headers in sysroot
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
X-List-Received-Date: Fri, 22 Jun 2012 22:15:07 -0000

From: Andrea Adami <andrea.adami@gmail.com>

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
1.7.7.6



