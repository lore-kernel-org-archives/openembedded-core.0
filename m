Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7380EC7EE2D
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 14:13:43 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.8866.1685974421636496825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 07:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gEWsOB/y;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685974419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D+N8YqE389KK8II3bgYspmoyKXMqSVaMQp/yeu8IMKs=;
	b=gEWsOB/yHhTpyO0UnjN9IDKBR3QvC7stv+f6PkrSYCj5oHw5C9w52TwVAie9jR0SR5yIWP
	krSVpKEvk++uiG6cLN9kda/wVdNdC1U5B9pkN0LJ5GQqDCMOV0uboyeoLCYaRGSfP3PkZm
	SfcqB+YAkAGHrfyXp1L0KCTSERxi6gDMhsyUr1sUNswVzWElrJ76WMY65t7+IozZFY/62t
	i8zQKrsHL4omSd3MpYky9CmD6RxO65e7g4zMyEF9LOWU5/dwkQ4KvPDekP/B7PgPRgFMmK
	ibf7D8SMw1zQRDNlu+4eKGcoTYZHcLUTf8LTVmtDjh/qdDw88w7gUUJEtyekYw==
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 7F80740010;
	Mon,  5 Jun 2023 14:13:39 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] kernel.bbclass: hoist up "unset S" bbfatal from kernel-yocto.bbclass to kernel.bbclass
Date: Mon,  5 Jun 2023 16:13:19 +0200
Message-Id: <20230605141319.532136-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 14:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182385

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Writing a simple recipe that inherits kernel.bbclass and downloads a kernel
tarball (e.g. a mainline release from kernel.org) via http or ftp fails
with either:

  ERROR: linux-acme-6.3.3-r0 do_configure: oe_runmake failed
  ...
  | make: *** No rule to make target 'oldnoconfig'.  Stop.

or (seen on a different setup, based on kirkstone):

  ... do_populate_lic: QA Issue: ... LIC_FILES_CHKSUM points to an invalid file: .../work-shared/.../kernel-source/COPYING [license-checksum]

This happens when not setting S in the recipe. In this case, kernel.bbclass
sets it to ${STAGING_KERNEL_DIR}
(${TMPDIR}/work-shared/${MACHINE}/kernel-source).  This means that in
do_symlink_kernsrc(), the 'if s != kernsrc' never triggers and thus the
kernel tree will not me moved into work/shared, which results in an empty
work-shared/.../kernel-source directory.

When downloading a tarball it is usually not required to set S in recipes,
so this is not obvious here and the error message does not point to the
problem or its solution.

There is such a check in kernel-yocto.bbclass though, so move it to
kernel.bbclass so that also kernel recipes not based on kernel-yocto can
benefit from it.

The check is moved:

 - from the beginning of do_kernel_checkout() in kernel-yocto
 - to the end of do_symlink_kernsrc() in kernel.bbclass

and since do_kernel_checkout is executed 'after do_symlink_kernsrc', the
code flow does not change in a relevant way when using linux-yocto.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 8 --------
 meta/classes-recipe/kernel.bbclass       | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 108b7e675212..ceb451b69969 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -394,16 +394,8 @@ do_kernel_checkout() {
 		# case: we have no git repository at all. 
 		# To support low bandwidth options for building the kernel, we'll just 
 		# convert the tree to a git repo and let the rest of the process work unchanged
-		
-		# if ${S} hasn't been set to the proper subdirectory a default of "linux" is 
-		# used, but we can't initialize that empty directory. So check it and throw a
-		# clear error
 
 	        cd ${S}
-		if [ ! -f "Makefile" ]; then
-			bberror "S is not set to the linux source directory. Check "
-			bbfatal "the recipe and set S to the proper extracted subdirectory"
-		fi
 		rm -f .gitignore
 		git init
 		check_git_config
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 9c8036f4df01..5ed4a2e03c72 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -195,6 +195,12 @@ python do_symlink_kernsrc () {
             import shutil
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
+
+    # When not using git, we cannot figure out automatically the extracted
+    # directory. So check it and throw a clear error.
+    if not os.path.isdir(os.path.join(d.getVar("WORKDIR"), "git")) and \
+       not os.path.exists(os.path.join(s, "Makefile")):
+        bb.fatal("S is not set to the linux source directory. Check the recipe and set S to the proper extracted subdirectory.")
 }
 # do_patch is normally ordered before do_configure, but
 # externalsrc.bbclass deletes do_patch, breaking the dependency of
-- 
2.34.1


