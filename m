Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FD7D24456
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 21:49:45 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.56685.1728596981563328104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 14:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49ALndgH015568
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 16:49:40 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap]PATCH] license: Fix directory layout issues
Date: Thu, 10 Oct 2024 16:49:38 -0500
Message-Id: <1728596978-32660-1-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 21:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205648

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are several issues:

a) pointless empty directories were being created as a path wasn't
   fixed in a previous commit
b) SSTATE_PKGARCH wasn't being captured into the task signature
   since it is in the ignore list by default. We want to capture
   the absolute value, not the dependencies
c) with those issues fixed, cross/native issues became apparent so
   those need to be fixed too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport from oe-core master: f68aed302a0e4b86fb8c16a6ef4e7295bed48b86

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
This is a backport from master to fix an issue with do_populate_lic.

do_populate_lic is not rerun when a package that is MACHINE_ARCH is
run with two different machines, the sstate-cache only contains the
entry for the first machine built.  This results in the tmp/deploy/license
being in the wrong directory and a possible QA warning from 'license-file-missing'.

 meta/classes-global/license.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/license.bbclass
index b2e0d3f..d7c5d08 100644
--- a/meta/classes-global/license.bbclass
+++ b/meta/classes-global/license.bbclass
@@ -18,8 +18,14 @@ LICENSE_CREATE_PACKAGE ??= "0"
 LICENSE_PACKAGE_SUFFIX ??= "-lic"
 LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
 
+LICENSE_DEPLOY_PATHCOMPONENT = "${SSTATE_PKGARCH}"
+LICENSE_DEPLOY_PATHCOMPONENT:class-cross = "native"
+LICENSE_DEPLOY_PATHCOMPONENT:class-native = "native"
+# Ensure the *value* of SSTATE_PKGARCH is captured as it is used in the output paths
+LICENSE_DEPLOY_PATHCOMPONENT[vardepvalue] += "${LICENSE_DEPLOY_PATHCOMPONENT}"
+
 addtask populate_lic after do_patch before do_build
-do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
+do_populate_lic[dirs] = "${LICSSTATEDIR}/${LICENSE_DEPLOY_PATHCOMPONENT}/${PN}"
 do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 
 python do_populate_lic() {
@@ -29,7 +35,7 @@ python do_populate_lic() {
     lic_files_paths = find_license_files(d)
 
     # The base directory we wrangle licenses to
-    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('SSTATE_PKGARCH'), d.getVar('PN'))
+    destdir = os.path.join(d.getVar('LICSSTATEDIR'), d.getVar('LICENSE_DEPLOY_PATHCOMPONENT'), d.getVar('PN'))
     copy_license_files(lic_files_paths, destdir)
     info = get_recipe_info(d)
     with open(os.path.join(destdir, "recipeinfo"), "w") as f:
-- 
1.8.3.1


