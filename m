Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+vdsfBGTwrHX/gOQtoLpJWNMq/XykuCnM=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qp38c-0000KU-Gz
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 20:59:22 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p74IsxoF027093
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 13:54:59 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 13:54:59 -0500
Message-Id: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] gcc: use ${base_lib} to match gcc default configuration
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
X-List-Received-Date: Thu, 04 Aug 2011 18:59:23 -0000

Rather than tweaking MULTILIB_DIRNAMES & MULTILIB_OSDIRNAMES like is
done for x86-64 via 64bithack.patch.  We can just go with gcc defaults
and utilize ${base_lib} for where to find gcc libs.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../gcc/gcc-cross-intermediate.inc                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index df5958a..7b1bb38 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -34,7 +34,7 @@ do_compile () {
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${target_base_libdir}/
-	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/* ${D}${target_base_libdir}/
+	mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* ${D}${target_base_libdir}/
 
 	# We don't really need this (here shares/ contains man/, info/, locale/).
 	rm -rf ${D}${datadir}/
-- 
1.7.3.4



