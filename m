Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 703106D073
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 07:46:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I7kYVS021215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 00:46:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 18 Oct 2013 00:46:34 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2013 15:47:11 +0800
Message-ID: <83310635c381d335c132da1665c5568515dff386.1382082297.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382082297.git.Qi.Chen@windriver.com>
References: <cover.1382082297.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image_types.bbclass: add --numeric-owner option to tar command
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
X-List-Received-Date: Fri, 18 Oct 2013 07:46:33 -0000
Content-Type: text/plain

From: Chen Qi <qi.chen@windriver.com>

If the same username exists on both target and the build host, but
the uids differ, and we start target via NFS, then the uid for the
user will be incorrect on target.

For example, if postfix's uid on host is 119 and on target is 1024,
then if we start target via NFS, the uid for postfix will be 119.

The root cause is that when we use runqemu-extract-sdk to generate
the NFS rootfs for later use, the tar command will respect the username
instead of uid. So if PSEUDO_PASSWD environment is not set correctly,
the host /etc/passwd will be used, resulting in wrong uids.

The situation for gid is completely analogous to that of uid.

It's almost impossible for the runqemu-extract-sdk to guess the correct
location of the needed password file merely based on the target tarball
name.

This patch solves this problem by adding the '--numeric-owner' option
to the tar command so that the username/groupname is not recorded in
the tarball. In this situation, we'll always get the correct uid/gid
after extracting the tarball.

[YOCTO #5364]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image_types.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9ead059..234c9ff 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -171,7 +171,7 @@ IMAGE_CMD_btrfs () {
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
-IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
+IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar --numeric-owner -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
 
 CPIO_TOUCH_INIT () {
 	if [ ! -L ${IMAGE_ROOTFS}/init ]
-- 
1.7.9.5


