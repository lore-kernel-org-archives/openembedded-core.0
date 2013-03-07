Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UDjLY-00077L-Sh
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 23:31:34 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r27MAuEj025046
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Mar 2013 16:10:57 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r27MAtE2017542
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Mar 2013 03:40:55 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 8 Mar 2013 03:40:54 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r27MAqug019295;
	Fri, 8 Mar 2013 03:40:53 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2013 16:10:48 -0600
Message-ID: <1362694248-15573-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [RFC] kernel bbclass: return to original directory in do_deploy
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
X-List-Received-Date: Thu, 07 Mar 2013 22:31:38 -0000
Content-Type: text/plain

All,

The below patch is just one way to fix the issue of dtb files
not being copied into the deploy directory by the linux-dtb.inc
file.  The details below show why this failed.  The reason I am
marking this as an RFC is because I'm not sure this is the *best*
way to fix the issue.  What I'm concerned about is whether others
have already adapted their do_deploy_append functions to work
around the directory location that the script is in after running
the kernel_do_deploy step.  For example in the meta-ti layer
the multi-kernel.inc file first changes directory to ${S} in
the do_deploy_append function.

It seems likely that if anyone has adapted to this then they are
probably just doing a cd into ${S} but I wanted to get feedback
on whether to fix the generic kernel_do_deploy function or just
fix the do_deploy_append function in linux-dtb.inc.

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
index 0a0430e..d57d1f5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -352,6 +352,7 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+	cd -
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 
-- 
1.7.0.4



