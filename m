Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294C8EB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 13:50:54 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.8350.1687787451388301244
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 06:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JU54QFig;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687787448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I7uMP0c0CjJ78g/RL8sHuCPnu3t0bba2mhyANXPqS3g=;
	b=JU54QFigFARXoE980p4Wk0NFB6843rM7M2ldT2xQcx9ssNS8aYTKIuyJRZ2+CQZ1bRah1j
	xbYwBor0n9hGJz1pof5l33Q6PzyN9EPqYtLqs5iNaQ+tCO08KlgvKWLeQu5PcHhgz3Ftn3
	4VPUNZEbfFBlZAsm5Mfjj9lFx/KWc1QXlFyJ0HW2F4pENXqgdFkgGG+aFX69J43D7DsnAm
	R/kv8ltT7zzAXiCXTh3VuxuYicBjnI6R8rgwnDhToLSwPJjsaItT8hui9Nm296zashUWH8
	AbNueTQ8mSez3Dw6OIJqEoiyjInsFeqW3PEzAl60sJvv96PFa5dtHZt9GcLW+g==
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 9D9C0240009;
	Mon, 26 Jun 2023 13:50:40 +0000 (UTC)
From: luca.ceresoli@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2] kernel.bbclass: hoist up "unset S" bbfatal from kernel-yocto.bbclass to kernel.bbclass
Date: Mon, 26 Jun 2023 15:50:24 +0200
Message-Id: <20230626135024.34405-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 13:50:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183420

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
kernel tree will not be moved into work-shared, which results in an empty
work-shared/.../kernel-source directory.

Setting S in recipes is usually not required when downloading a tarball, so
it is not obvious here and the error message does not point to the problem
or its solution.

There is such a check in kernel-yocto.bbclass though. Move it to
kernel.bbclass so that even kernel recipes not based on kernel-yocto can
benefit from it.

The check is moved:

 - from the beginning of do_kernel_checkout() in kernel-yocto
 - to the end of do_symlink_kernsrc() in kernel.bbclass

and since do_kernel_checkout is executed 'after do_symlink_kernsrc', the
code flow does not change in a relevant way when using linux-yocto.

As an additional benefit, the check is now taking place both when
downloading a tarball and when downloading from git, so even when using git
the recipe writer will be presented the explanatory error message.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v2:
 - don't check for WORKDIR/git dir existence (Suggested by Richard)
---
 meta/classes-recipe/kernel-yocto.bbclass | 8 --------
 meta/classes-recipe/kernel.bbclass       | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 4ac977b12207..3f2ce17aeb88 100644
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
index e82b696d1a14..75f43cb1134e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -195,6 +195,12 @@ python do_symlink_kernsrc () {
             import shutil
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
+
+    # Setting S is required with this class when fetching a tarball because
+    # we cannot figure out automatically the extracted directory name. The
+    # check is beneficial even when using git so don't check for git here.
+    if not os.path.exists(os.path.join(s, "Makefile")):
+        bb.fatal("S is not set to the linux source directory. Check the recipe and set S to the proper extracted subdirectory.")
 }
 # do_patch is normally ordered before do_configure, but
 # externalsrc.bbclass deletes do_patch, breaking the dependency of
-- 
2.34.1


