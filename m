Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 43EEF72C42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:13:21 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	t0MGDGqk022535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 17:13:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1421943199;
	bh=4HROEiTIPTX57RKr/MPbXrFcirJiVmn7hDaOuOYLa6o=;
	h=From:To:Cc:Subject:Date:Message-Id:Sender;
	b=kRvBoJ6GXglgUAO702DMxQLgIzGup9DU/mPS8eVSYTUStQvKHWqbTrvrnYKIT5M8l
	xDBymPN8Ojs38l3u8UhYWiwHQNoKRrxWpxGZ+HF7MnClSQ4jYWa+wfODTKIYNP3b7h
	mOfLXyNx3uiVFaOFEDn9rYR141ntlcLCLho9ozjk=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id t0MGD7jH025896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 22 Jan 2015 17:13:09 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1YEKNX-0008NB-D4; Thu, 22 Jan 2015 17:13:07 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:13:00 +0100
Message-Id: <1421943181-32153-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.9.3
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
Subject: [PATCH 1/2] image_types.bbclass: fixed 'init' creation for cpio images
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

When /init is a dangling symlink or a symlink to a file which can not be
stated on the build system (e.g. due to SELinux restrictions), the '[ !
-e .../init ]' test will succeed which causes the manual creation of
/init.

E.g. here:

| $ ls -la cpio_append/init
| lrwxrwxrwx. 1 ensc ensc 10 22. Jan 16:26 cpio_append/init -> /sbin/init
|
| $ strace /bin/test -e  cpio_append/init
| stat("cpio_append/init", 0x7fff374a9db0) = -1 EACCES (Permission denied)
| exit_group(1)                           = ?

To test for the existence of a file, both '-L' and '-e' checks must be
executed and to prevent SELinux noise, the '-L' should happen before
'-e'.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 6fb7482..59fba32 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -70,9 +70,9 @@ IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAG
 
 IMAGE_CMD_cpio () {
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
-	if [ ! -e ${IMAGE_ROOTFS}/init ]; then
+	if [ ! -L ${IMAGE_ROOTFS}/init -a ! -e ${IMAGE_ROOTFS}/init ]; then
 		mkdir -p ${WORKDIR}/cpio_append
-		if [ -e ${IMAGE_ROOTFS}/sbin/init -o -L ${IMAGE_ROOTFS}/sbin/init ]; then
+		if [ -L ${IMAGE_ROOTFS}/sbin/init -o -e ${IMAGE_ROOTFS}/sbin/init ]; then
 			ln -sf /sbin/init ${WORKDIR}/cpio_append/init
 		else
 			touch ${WORKDIR}/cpio_append/init
-- 
1.9.3


