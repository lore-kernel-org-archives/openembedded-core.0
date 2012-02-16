Received: from elite.brightsigndigital.co.uk ([81.142.160.137])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>) id 1Ry39Z-0002ih-KR
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 16:21:49 +0100
Received: from [172.30.1.25] (helo=chuckie.brightsign)
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Ry31d-0006TQ-OY; Thu, 16 Feb 2012 15:13:37 +0000
Received: from mac by chuckie.brightsign with local (Exim 4.72)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1Ry31d-0002MK-NZ; Thu, 16 Feb 2012 15:13:37 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2012 15:13:35 +0000
Message-Id: <1329405215-9037-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.7.9
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] e2fsprogs: Cope with ${libdir} and ${base_libdir} being the same
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
X-List-Received-Date: Thu, 16 Feb 2012 15:21:49 -0000

${libdir} and ${base_libdir} may be the same. If they are don't try and
move files onto themselves.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index 2289211..9647e51 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4"
@@ -32,9 +32,11 @@ do_install () {
 
 do_install_append () {
 	# e2initrd_helper and the pkgconfig files belong in libdir
-	install -d ${D}${libdir}
-	mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
-	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
+		install -d ${D}${libdir}
+		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
+		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
+	fi
 }
 
 # blkid used to be part of e2fsprogs but is useful outside, add it
-- 
1.7.9



