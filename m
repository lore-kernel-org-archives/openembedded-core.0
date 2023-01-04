Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA78FC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 15:30:13 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.14968.1672846204097915216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 07:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nGXWPVi6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 62C4440007;
	Wed,  4 Jan 2023 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672846201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vrnJswstvWpfRMl9We6SGG7G32N9iVwvEBP2EmgaBQY=;
	b=nGXWPVi6g7I2x1KJjaOTkpP9VAXCqx7ewz/jMm0yDaWJsCFaofVeBQtFbjgeIAM7T5KqDg
	uRwA1ejIYbME55V2QWniQ7aoo2IgaUvKULGs0sQWIk/2JwZtzoRrRhoaNY9T0gnMRKRaIw
	ifEcKU2zt0pjEOk86SHtSCWxM8vYs9B3zD4sjIFf3Q0SmMJkyehg7tDESicZgpF1pOoQES
	/NlgZGt+TNBVGkF7OXzCUJdjejm05nXwvi7JYTkZnSpKxTgLbrspdCELSCIP3VFMhE+JZv
	snbrryOIU2LrI2Kx0d7zHc0dJhAuYINpEQo9ohJQEAdzmdM5z+/KjXs+TXgCdQ==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH] meta/classes-global: remove package_tar.bbclass
Date: Wed,  4 Jan 2023 16:29:58 +0100
Message-Id: <20230104152958.13559-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 15:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175487

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Remove package_tar.bbclass, which is no longer in use in oe-core
and meta-oe, and which the document reports as broken and unsupported.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta/classes-global/package_tar.bbclass | 77 -------------------------
 1 file changed, 77 deletions(-)
 delete mode 100644 meta/classes-global/package_tar.bbclass

diff --git a/meta/classes-global/package_tar.bbclass b/meta/classes-global/package_tar.bbclass
deleted file mode 100644
index de995f9747..0000000000
--- a/meta/classes-global/package_tar.bbclass
+++ /dev/null
@@ -1,77 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-inherit package
-
-IMAGE_PKGTYPE ?= "tar"
-
-python do_package_tar () {
-    import subprocess
-
-    oldcwd = os.getcwd()
-
-    workdir = d.getVar('WORKDIR')
-    if not workdir:
-        bb.error("WORKDIR not defined, unable to package")
-        return
-
-    outdir = d.getVar('DEPLOY_DIR_TAR')
-    if not outdir:
-        bb.error("DEPLOY_DIR_TAR not defined, unable to package")
-        return
-
-    dvar = d.getVar('D')
-    if not dvar:
-        bb.error("D not defined, unable to package")
-        return
-
-    packages = d.getVar('PACKAGES')
-    if not packages:
-        bb.debug(1, "PACKAGES not defined, nothing to package")
-        return
-
-    pkgdest = d.getVar('PKGDEST')
-
-    bb.utils.mkdirhier(outdir)
-    bb.utils.mkdirhier(dvar)
-
-    for pkg in packages.split():
-        localdata = bb.data.createCopy(d)
-        root = "%s/%s" % (pkgdest, pkg)
-
-        overrides = localdata.getVar('OVERRIDES', False)
-        localdata.setVar('OVERRIDES', '%s:%s' % (overrides, pkg))
-
-        bb.utils.mkdirhier(root)
-        basedir = os.path.dirname(root)
-        tarfn = localdata.expand("${DEPLOY_DIR_TAR}/${PKG}-${PKGV}-${PKGR}.tar.gz")
-        os.chdir(root)
-        dlist = os.listdir(root)
-        if not dlist:
-            bb.note("Not creating empty archive for %s-%s-%s" % (pkg, localdata.getVar('PKGV'), localdata.getVar('PKGR')))
-            continue
-        args = "tar -cz --exclude=CONTROL --exclude=DEBIAN -f".split()
-        ret = subprocess.call(args + [tarfn] + dlist)
-        if ret != 0:
-            bb.error("Creation of tar %s failed." % tarfn)
-
-    os.chdir(oldcwd)
-}
-
-python () {
-    if d.getVar('PACKAGES') != '':
-        deps = ' tar-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot'
-        d.appendVarFlag('do_package_write_tar', 'depends', deps)
-        d.setVarFlag('do_package_write_tar', 'fakeroot', "1")
-}
-
-
-python do_package_write_tar () {
-    bb.build.exec_func("read_subpackage_metadata", d)
-    bb.build.exec_func("do_package_tar", d)
-}
-do_package_write_tar[dirs] = "${D}"
-addtask package_write_tar before do_build after do_packagedata do_package
-- 
2.37.2


