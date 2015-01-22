Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 4528B72CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:13:21 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	t0MGDGwr022534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 17:13:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1421943199;
	bh=Q4dfjGpwoGL17j57HMHOU8TSsbJdpBg6kCg95BvpNQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=UVAtKkhHptUz1ySrlVxmP9F9SymjRJGZoZhDaOodMPetVKZULUszToir1iQWg4s2O
	pPEXtAqe/6ZD85gu++Foy64l4IC7B45Nm67i4miXJHLqr0rKnPMO8EcubzWTRrHHPm
	w9EsobJ0VlWOFDMBD7FmDB9l8tAfex61dAA1hx7c=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id t0MGD84k025902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Jan 2015 17:13:09 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1YEKNY-0008NG-BJ; Thu, 22 Jan 2015 17:13:08 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:13:01 +0100
Message-Id: <1421943181-32153-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1421943181-32153-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1421943181-32153-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.9
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, SPF_NEUTRAL, T_RP_MATCHES_RCVD,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.75
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/2] image_types.bbclass: manage 'cpio_append' directory
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
X-List-Received-Date: Thu, 22 Jan 2015 16:13:32 -0000

For cpio images, do_rootfs() can operate on a dirty '${WORKDIR}/cpio_append'
directory which contains e.g. files from previous builds.  This can cause
unwanted files in the image or can break the build.

E.g. when there is a cpio_append/init -> /sbin/init symlink symlink, the
'ln -sf' can fail due to SELinux restrictions:

| $ ls -la cpio_append/init
| lrwxrwxrwx. 1 ensc ensc 10 22. Jan 16:26 cpio_append/init -> /sbin/init
|
| $ strace ln -sf /sbin/init cpio_append/init
| ...
| stat("cpio_append/init", 0x7fffbb9ca310) = -1 EACCES (Permission denied)
| exit_group(1)                           = ?

Patch cleans up 'cpio_append' before executing the 'do_rootfs' task by
adding it to 'cleandirs'.  An alternative implementation (which avoids
creation of this empty dir for non-cpio images) might remove it within
IMAGE_CMD_cpio, but this might break builds where people rely on the
existence of this directory (e.g. to add local files).

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 59fba32..24052ac 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -68,10 +68,10 @@ IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
 IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
 
+do_rootfs[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
 	if [ ! -L ${IMAGE_ROOTFS}/init -a ! -e ${IMAGE_ROOTFS}/init ]; then
-		mkdir -p ${WORKDIR}/cpio_append
 		if [ -L ${IMAGE_ROOTFS}/sbin/init -o -e ${IMAGE_ROOTFS}/sbin/init ]; then
 			ln -sf /sbin/init ${WORKDIR}/cpio_append/init
 		else
-- 
1.9.3


