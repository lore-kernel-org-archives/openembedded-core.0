Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qij3o-0004zV-CA
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 10:20:16 +0200
Received: by wyg30 with SMTP id 30so2113577wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 01:16:12 -0700 (PDT)
Received: by 10.216.142.6 with SMTP id h6mr2691208wej.19.1310976972566;
	Mon, 18 Jul 2011 01:16:12 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id r48sm2173292weq.2.2011.07.18.01.16.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 01:16:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 10:16:07 +0200
Message-Id: <1310976967-7251-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] gcc-package-target: don't fail if the .la files we try to delete are not there to start with
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
X-List-Received-Date: Mon, 18 Jul 2011 08:20:16 -0000

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
1.6.6.1



