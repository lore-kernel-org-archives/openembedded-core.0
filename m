Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52B2C41513
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:56:12 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.947.1721073371903687881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46FJu7tE023758;
	Mon, 15 Jul 2024 14:56:08 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 2/2] package.bbclass: Add ALL_MULTILIB_SSTATE_ARCHS
Date: Mon, 15 Jul 2024 14:56:07 -0500
Message-Id: <1721073367-2668-3-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721073367-2668-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721073367-2668-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202068

From: Mark Hatle <mark.hatle@amd.com>

When create-spdx-2.2 class is processing documents, it needs to
find the document in a path that is related to the SSTATE_ARCH
when a packge is generated.  The SSTATE_ARCH can be affected by
multilib configurations, resulting is something like armv8a-mlib.

When the image (or SDK) is being generated and the components are
collected, the system has no knowledge of the multilib arch and
will fail to find it, such as:

  ERROR: meta-toolchain-1.0-r0 do_populate_sdk: No SPDX file found
   for package libilp32-libgcc-dbg,
   False sstate:libilp32-libgcc:armv8a-ilp32-mllibilp32-elf:14.1.0:r0:armv8a-ilp32:12:
   sstate:libilp32-libgcc::14.1.0:r0::12:

Adding in the new ALL_MULTILIB_SSTATE_ARCHS will provide a full
set of SSTATE_ARCHS including ones that contain the multilib
extension which will allow create-spdx-2.2 to correctly find the
document it is looking for.  This would also be valuable to any
other function doing a similar search through SSTATE_ARCH that may
have been extended with multilib configurations.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes-global/package.bbclass  |  1 +
 meta/classes/create-spdx-2.2.bbclass | 12 ++++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
index 6cd8c01..5869fe9 100644
--- a/meta/classes-global/package.bbclass
+++ b/meta/classes-global/package.bbclass
@@ -55,6 +55,7 @@ PKGDEST = "${WORKDIR}/packages-split"
 LOCALE_SECTION ?= ''
 
 ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
+ALL_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
 
 # rpm is used for the per-file dependency identification
 # dwarfsrcfiles is used to determine the list of debug source files
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 13d2aa1..d2cbec8 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -259,7 +259,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     import oe.spdx
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("ALL_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     dep_recipes = []
@@ -304,7 +304,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
-collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
+collect_dep_recipes[vardepsexclude] = "ALL_MULTILIB_SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -600,7 +600,7 @@ python do_create_runtime_spdx() {
 
     providers = collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("ALL_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     if not is_native:
@@ -706,7 +706,7 @@ python do_create_runtime_spdx() {
             oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES ALL_MULTILIB_SSTATE_ARCHS"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -787,7 +787,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import bb.compress.zstd
 
     providers = collect_package_providers(d)
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("ALL_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
@@ -939,4 +939,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
             tar.addfile(info, fileobj=index_str)
 
-combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_ARCHS"
+combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS ALL_MULTILIB_SSTATE_ARCHS"
-- 
1.8.3.1


