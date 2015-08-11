Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3AC497693F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 08:45:12 +0000 (UTC)
Received: by iodb91 with SMTP id b91so135400714iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 01:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=X7y14uUSr1IOciJXdFkLFCZEuKsycbiMuYNBq1ys+XY=;
	b=ZWLNofQxY/RLfyiKMd91sHOHGGuv2TV2KUlKh8b90vKjWJ1JO2YePqc+JKZ5Uu8/sa
	VJOZEWOa3OD5MYL0sTwafQV+udhG9gfcROTYwXBXKw3KBs9NrePL7Zeq0VTVDDgCp3Aa
	63vIctpKNSVD7yjzfJqeaojXTA/sFm47MsLgMatKxORKu8A1BzWb6GuoIlIXcn9FXu7I
	PsQrqbbpsXR+okw4ijh9PYDNxsdZ6Mfxo1cv2DN70ED0rh4W/lJElvP6g2/rdK+uzvzT
	6IRVAniEAO2PEcl7WU5mFuYgokZ3qUea1Qij07z8THkTJtJGqWory6j62sEM/1IfFeGG
	MhIw==
X-Gm-Message-State: ALoCoQkO3CXXi8ilxBAs4q+NI4Y4wHAo9IWFadYpM+nbvGU9XrxRI3bLTpNDoFhM8hNKmmhYoGti
X-Received: by 10.107.149.11 with SMTP id x11mr25245735iod.141.1439282712578; 
	Tue, 11 Aug 2015 01:45:12 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C212.dip0.t-ipconnect.de.
	[93.232.194.18]) by smtp.gmail.com with ESMTPSA id
	bd7sm7684942igb.19.2015.08.11.01.45.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Aug 2015 01:45:12 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 10:44:59 +0200
Message-Id: <3e27eaba418540afdc4266a37fbb148cc05c7bbb.1439281753.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
Subject: [PATCH 2/3] image_types.bbclass: allow replacing tar command
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
X-List-Received-Date: Tue, 11 Aug 2015 08:45:12 -0000

Usually, the host's tar command is sufficient. However, special cases
like archiving xattrs depend on a modern GNU tar version. The new
IMAGE_CMD_TAR makes that possible, with xattrs given as example.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image_types.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index cc789fc..752fd52 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -71,7 +71,18 @@ IMAGE_CMD_btrfs () {
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
-IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
+
+# By default, tar from the host is used, which can be quite old. If
+# you need special parameters (like --xattrs) which are only supported
+# by GNU tar upstream >= 1.27, then override that default:
+# IMAGE_CMD_TAR = "tar-native --xattrs --xattrs-include=*"
+# IMAGE_DEPENDS_tar_append = " tar-replacement-native"
+#
+# The GNU documentation does not specify whether --xattrs-include is necessary.
+# In practice, it turned out to be not needed when creating archives and
+# required when extracting, but it seems prudent to use it in both cases.
+IMAGE_CMD_TAR ?= "tar"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
 
 do_rootfs[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.1.4


