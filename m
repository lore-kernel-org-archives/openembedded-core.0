Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5AAC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 21:53:11 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7905.1790027587756551756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 14:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=p+4Wv0Tk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-1329275-20260921215304ecc93d2595000207d4-w8gvbm@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260921215304ecc93d2595000207d4
        for <openembedded-core@lists.openembedded.org>;
        Mon, 21 Sep 2026 23:53:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=rid+0aApCuOYkNGe3YA7dm781ZBYjz/TCHFFU6jgzTY=;
 b=p+4Wv0Tk3QVRjws52SAZdWFvECfZ+YEwTF0idEBUPm+h6tFbarLBDXyLQ6SDGAc6cFxRCz
 Xa9iUPrmfqlLw2IoNauRxFRj5PuHAnK8T5Oigx4X9T8jkM6L2hsuNIOFXHEe29Nk3spcLowW
 PdsQbu5BawdE6WLEqZpQCYvd4i/53pgtuDj8znJN76oxbyj6uQAGazzPVUEqRgIAJZzeUZyU
 5oIT5Z26ZmG95tsj95EcEa7I+MIJ8Na6ZvGpLiB1yrw5SUcxpvt4TSaq/+K7t4Dexh4JOBWv
 5lC/quUokAKEL9+PEEXgt8UFKNDo1F8Myoo6kOxRBFXUxW9bp7bVlElQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/2] package: introduce PACKAGE_BASENAME for consistent kernel -src naming
Date: Mon, 21 Sep 2026 23:50:58 +0200
Message-ID: <20260921215300.582692-2-adrian.freihofer@siemens.com>
In-Reply-To: <20260921215300.582692-1-adrian.freihofer@siemens.com>
References: <20260921215300.582692-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 21:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246363

From: Adrian Freihofer <adrian.freihofer@siemens.com>

populate_packages() always names the auto-generated -src package after
PN. kernel.bbclass instead names all its other sub-packages
(kernel-dbg, kernel-dev, kernel-modules, ...) after KERNEL_PACKAGE_NAME,
so the kernel recipe ended up with a lone -src package (linux-yocto-src)
that did not match the rest of the kernel-* family (e.g. kernel-dbg).

The complementary package install logic (oe-pkgdata-util) cannot find
packages that are not named after PN (${PN}-src, ${PN}-dbg, etc). For
the kernel recipe this meant linux-yocto-src was picked up, but
kernel-dbg, kernel-dev, etc. were not, which was inconsistent.

This commit introduces a generic PACKAGE_BASENAME variable
(default "${PN}") that a recipe/bbclass can override to declare the base
name its sub-packages should share. populate_packages() now uses it for
-src naming, and kernel.bbclass sets it to "${KERNEL_PACKAGE_NAME}". As
a result the kernel packages are now named kernel-dbg, kernel-src and so
on.
Changing the kernel's -src package to kernel-src also means this package
is longer found either by the complementary package installation and not
installed anymore.

If kernel packages should be installed via complementary package install
logic is left for a follow up commit. This commit only aligns the
package naming also for the -src package.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel.bbclass | 3 +++
 meta/conf/bitbake.conf             | 6 ++++++
 meta/lib/oe/package.py             | 4 +++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 0a6d754108..16745557f7 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -679,6 +679,9 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
 # kernel-base becomes kernel-${KERNEL_VERSION}
 # kernel-image becomes kernel-image-${KERNEL_VERSION}
 PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
+# Keep the auto-generated -src package (see populate_packages() in oe/package.py) named,
+# and resolvable by tools like oe-pkgdata-util, consistently with the rest of the kernel-* family.
+PACKAGE_BASENAME = "${KERNEL_PACKAGE_NAME}"
 FILES:${PN} = ""
 FILES:${KERNEL_PACKAGE_NAME}-base = "${KERNEL_MODULE_INSTALL_PREFIX}/modules.order ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin ${KERNEL_MODULE_INSTALL_PREFIX}/modules.builtin.modinfo"
 FILES:${KERNEL_PACKAGE_NAME}-image = ""
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d353a7cd2c..f82ee0f039 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -334,6 +334,12 @@ SOLIBSDEV:mingw32 = ".dll"
 
 PACKAGE_DEBUG_SPLIT_STYLE ?= "debug-with-srcpkg"
 
+# The base name recipe sub-packages (-dbg, -dev, -src etc.) are derived from.
+# Recipes/bbclasses that name their packages after something other than PN
+# (e.g. kernel.bbclass and KERNEL_PACKAGE_NAME) should override this so that
+# tooling (e.g. oe-pkgdata-util) can still map generic package globs to them.
+PACKAGE_BASENAME ??= "${PN}"
+
 PACKAGE_BEFORE_PN ?= ""
 PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index b7030643d2..4afd047905 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -1391,7 +1391,9 @@ def populate_packages(d):
     # If debug-with-srcpkg mode is enabled then add the source package if it
     # doesn't exist and add the source file contents to the source package.
     if split_source_package:
-        src_package_name = ('%s-src' % d.getVar('PN'))
+        # PACKAGE_BASENAME lets bbclasses (e.g. kernel.bbclass via KERNEL_PACKAGE_NAME)
+        # that name their other sub-packages differently from PN keep -src consistent with them.
+        src_package_name = ('%s-src' % (d.getVar('PACKAGE_BASENAME') or pn))
         if not src_package_name in packages:
             packages.append(src_package_name)
         d.setVar('FILES:%s' % src_package_name, '/usr/src/debug')
-- 
2.55.0


