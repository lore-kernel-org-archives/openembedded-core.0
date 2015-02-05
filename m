Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB6372E6B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:34 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so8545793pdb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Tjv6zk/Wn7GI3LJVILmM/mXFGDRzRmeA6kceMzqfCh8=;
	b=tQTlk5wGpzLIbmqY0dG7pjpPOh9Ysq8FxGT3AjYUhFw3I8hY3H2rFV4EH3TmQBrOMo
	auqecLNZK9BySLcs3juYhQi4+gxk/96BiUlf6mpEvGErymN9vzhItKab3XxTvVvRMt5A
	vLNBq7El6sLBMz7m1Xwvgc249S3bwyxVNneniva9ivZSrkjZ95M1tnCkzXeJpU1dUKCO
	/E1JRtqsVYoMYMbcwryUdX1W4P4T8w4kUO7uICFxnxE5Tn6g8HDzUVaugaPIxZvdYBXQ
	JKWNK/cLYe2ZDUhdNGfQLiFNzbCrKA53WZjJFEOFPWqls/zVuh8zXDjVZ01eyghz/mif
	L3ig==
X-Received: by 10.70.48.33 with SMTP id i1mr6465776pdn.153.1423152336353;
	Thu, 05 Feb 2015 08:05:36 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.34
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:49 -0800
Message-Id: <9c326c4d53784bbd1b91bdc3a20ea3b3c940639a.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 41/61] image_types.bbclass: fixed 'init' creation for cpio images
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:35 -0000

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

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

(From OE-Core rev: 2aa5d2880ee3578f4965f245addd365fb7b1c1ca)

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8e33214..650c2f8 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -68,9 +68,9 @@ IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAG
 
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
1.9.1


