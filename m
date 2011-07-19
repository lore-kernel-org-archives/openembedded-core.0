Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjB3c-0001do-3F
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:13:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jul 2011 07:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,228,1309762800"; d="scan'208";a="29396967"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2011 07:09:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 23:51:08 -0700
Message-Id: <7f8f9c23eb8e26fa0e23f641ebd32683c42c5ce1.1311058024.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311058024.git.sgw@linux.intel.com>
References: <cover.1311058024.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/22] gcc-package-target: don't fail if the .la files we try to delete are not there to start with
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
X-List-Received-Date: Tue, 19 Jul 2011 14:14:01 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

This fixes:

| rm: cannot remove `/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r39.1+svnr175127/image/usr/libexec/gcc/arm-angstrom-linux-gnueabi/4.5.4/*.la': No such file or directory
| ERROR: Function 'do_install' failed (see /OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/gcc-4.5-r39.1+svnr175127/temp/log.do_install.19514 for further information)
NOTE: package gcc-4.5-r39.1+svnr175127: task do_install: Failed

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-devtools/gcc/gcc-package-target.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index 9a91a7f..e6105da 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -84,7 +84,7 @@ do_install () {
 	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
 	rm -r ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
 	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/install-tools
-	rm -r ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
+	rm -rf ${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/*.la
 
 	# Hack around specs file assumptions
 	test -f ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs && sed -i -e '/^*cross_compile:$/ { n; s/1/0/; }' ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/specs
-- 
1.7.3.4



