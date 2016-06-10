Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id B596A60620
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:11:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r5so18663365wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yXYXYm7qNAMLW8/KR4RZicnXKtroWvkM/VRCnWMkSoo=;
	b=T07WyS8Nf5qCgdE6oSd5ytkE3QACtIVTWiMXdJCKJxLAKtLHhddeg78ooUNDueM9dF
	ZISa/5CfYSs52bW0TtUZvPRDeIf+8yQja0v9BFwXKO0A70RDg4BC6oLtkVcEankoZYLT
	rwlEQtpLWz7yCDFbRuLqmYJX3vfcTtgmKTcWhGbqBSJ1M+wl57i0JZm+HO7bcjTZrDHK
	KDV1bb4E8X9tkG0bk1A58H5YoSqF9eLrUw4HKZI9g4fZhe7gV0lGrKdIK/RTFWlpQgZ1
	oAsTAQjC3Hkm3fjtK6abjxJyj0/HYXzUnf9Vj2Sk9OyBPcU/6aBRGWpgFcb+o1QSBdsF
	Wxtg==
X-Gm-Message-State: ALyK8tI6lma1zj+j15AzQI8ztCQyCYZiZO3wZPJKxekMqNPRQS0yng+cZdtGxyltHdaeEw==
X-Received: by 10.28.181.148 with SMTP id e142mr3178089wmf.38.1465571501394;
	Fri, 10 Jun 2016 08:11:41 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.66])
	by smtp.gmail.com with ESMTPSA id
	124sm36160793wml.12.2016.06.10.08.11.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2016 08:11:40 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 16:11:38 +0100
Message-Id: <1465571498-21466-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] image/image_types.bbclass: fix fatal error during cpio debugfs creation
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
X-List-Received-Date: Fri, 10 Jun 2016 15:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

If /init is just a symlink to /sbin/init, debugfs creation
fails with the following error:

ERROR: Error: The image creation script '<...>/debugfs.create_image.cpio' returned 1:
touch: cannot touch '<...>/cpio_append/init': Permission denied
WARNING: exit code 1 from a shell command.

ERROR: Function failed: do_rootfs

The reason is that IMAGE_CMD_cpio() is run twice on the same
WORKDIR. The first run creates a symlink in WORKDIR/cpio_append/init
to point to /sbin/init, while the 2nd run then tries to 'touch'
that link, which will fail, of course since /sbin/init is not
usually writable by non-root users.

Fix this by providing knowledge to the IMAGE_CMD_xxx() scripts
with regards to the fact that they are being executed in the
context of debugfs creation. The IMAGE_CMD_cpio() can now be
intelligent in the sense that it can avoid all additional symlink
handling during the debugfs run. The symlinks do not need to
be part of the debugfs, so we can skip that part altogether
in that case.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/image.bbclass       |  1 +
 meta/classes/image_types.bbclass | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9f4c83f..65ce6bb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -287,6 +287,7 @@ def setup_debugfs_variables(d):
     d.appendVar('IMAGE_ROOTFS', '-dbg')
     d.appendVar('IMAGE_LINK_NAME', '-dbg')
     d.appendVar('IMAGE_NAME','-dbg')
+    d.setVar('IMAGE_BUILDING_DEBUGFS', 'true')
     debugfs_image_fstypes = d.getVar('IMAGE_FSTYPES_DEBUGFS', True)
     if debugfs_image_fstypes:
         d.setVar('IMAGE_FSTYPES', debugfs_image_fstypes)
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ea45809..72e8ed3 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -101,13 +101,20 @@ IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
 	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
-	if [ ! -L ${IMAGE_ROOTFS}/init -a ! -e ${IMAGE_ROOTFS}/init ]; then
-		if [ -L ${IMAGE_ROOTFS}/sbin/init -o -e ${IMAGE_ROOTFS}/sbin/init ]; then
-			ln -sf /sbin/init ${WORKDIR}/cpio_append/init
-		else
-			touch ${WORKDIR}/cpio_append/init
+	# We only need the /init symlink if we're building the real
+	# image. The -dbg image doesn't need it! By being clever
+	# about this we also avoid 'touch' below failing, as it
+	# might be trying to touch /sbin/init on the host since both
+	# the normal and the -dbg image share the same WORKDIR
+	if [ "${IMAGE_BUILDING_DEBUGFS}" != "true" ]; then
+		if [ ! -L ${IMAGE_ROOTFS}/init ] && [ ! -e ${IMAGE_ROOTFS}/init ]; then
+			if [ -L ${IMAGE_ROOTFS}/sbin/init ] || [ -e ${IMAGE_ROOTFS}/sbin/init ]; then
+				ln -sf /sbin/init ${WORKDIR}/cpio_append/init
+			else
+				touch ${WORKDIR}/cpio_append/init
+			fi
+			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 		fi
-		(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 	fi
 }
 
-- 
2.8.1


