Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UHeIF-0003ze-90
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 18:57:03 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2IHdPIY002964
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 12:39:26 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IHdOUJ029263
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 23:09:25 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 18 Mar 2013 23:09:24 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2IHdLRg019728;
	Mon, 18 Mar 2013 23:09:23 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2013 12:39:19 -0500
Message-ID: <1363628359-18023-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH][for-danny] kernel bbclass: return to original directory in do_deploy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Mar 2013 17:57:12 -0000
Content-Type: text/plain

* During the base kernel_do_deploy function the directory is
  changed to DEPLOYDIR in order to do some cleanup and symlinking.
  However, the directory is not changed back to the original
  starting directory ${S} at the end.  For append functions this
  means that the starting directory is not ${S} as expected but
  instead ${DEPLOYDIR}.

  For functions like the do_deploy_append in
  recipes-kernel/linux/linux-dtb.inc there is an assumption that
  you are still in the source directory and not the DEPLOYDIR.
  Without this change the .dtb files are not copied because the
  check for the existence of ${DTS_FILE} which is a relative
  path from the ${S} directory fails.  This means that the .dtb
  files are not copied into the deploy directory and subsequently
  the deploy/images directory.

  In the log.do_deploy file you will see lines like:

    Warning: arch/arm/boot/dts/xxxxx.dts is not available!

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 88ce561..9691c25 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -529,6 +529,7 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+	cd -
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 
-- 
1.7.0.4



