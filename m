Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7334160796
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 10:19:55 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3qmYSV4rDdz3hjNk;
	Fri, 15 Apr 2016 12:19:54 +0200 (CEST)
X-Auth-Info: fPFKU3wrF2CKm4O5JhEWBbQ8sCVQKhDUcQyWJa+dGMI=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3qmYSV1CvQzvdWQ;
	Fri, 15 Apr 2016 12:19:54 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 12:19:46 +0200
Message-Id: <1460715586-4930-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] kernel: fitimage: Fix do_deploy taskhash mismatch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2016 10:19:58 -0000

The kernel_do_deploy_append() uses DATETIME variable , so the taskhash
of the kernel_do_deploy() function changes if fitImage is used. The
buildsystem will complain accordingly:

ERROR: linux-yocto-4.4.3+gitAUTOINC+bcc6509084_1a72cec834-r0 do_deploy: Taskhash mismatch 49a5899a6895dcebd311dcb59870f370 verses 37c8dd3aae44134492a876f21c1b641b for /Yocto/poky/meta/recipes-kernel/linux/linux-yocto_4.4.bb.do_deploy
ERROR: Taskhash mismatch 49a5899a6895dcebd311dcb59870f370 verses 37c8dd3aae44134492a876f21c1b641b for /Yocto/poky/meta/recipes-kernel/linux/linux-yocto_4.4.bb.do_deploy

Fix this by excluding the DATETIME variable from the checksum.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f1b409c..e5b75ed 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -215,6 +215,7 @@ do_assemble_fitimage() {
 
 addtask assemble_fitimage before do_install after do_compile
 
+kernel_do_deploy[vardepsexclude] = "DATETIME"
 kernel_do_deploy_append() {
 	# Update deploy directory
 	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
-- 
2.7.0


