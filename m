Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD12BC52D1E
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 16:22:50 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.65423.1722010960775681089
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 09:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46QGMcnn026618
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 11:22:40 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 4/8] create-spdx-*: Support multilibs via SPDX_MULTILIB_SSTATE_ARCHS
Date: Fri, 26 Jul 2024 11:22:34 -0500
Message-Id: <1722010958-23635-4-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1722010958-23635-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 16:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202553

From: Mark Hatle <mark.hatle@amd.com>

When a create-spdx-* classes is processing documents, it needs to
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

Adding in the new SPDX_MULTILIB_SSTATE_ARCHS will provide a full
set of SSTATE_ARCHS including ones that contain the multilib
extension which will allow create-spdx-* to correctly find the
document it is looking for.  This would also be valuable to any
other function doing a similar search through SSTATE_ARCH that may
have been extended with multilib configurations.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit f1499c36c1054fc90f7b7268cc95285f2eca72f7)

spdx-3.0 items are not application and were removed.

spdx-common.bbclass item was moved into create-sdpx-2.2.bbclass.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes-recipe/populate_sdk_base.bbclass |  4 ++++
 meta/classes/create-spdx-2.2.bbclass          | 14 ++++++++------
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 81896d8..6cb43ad 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -6,6 +6,10 @@
 
 PACKAGES = ""
 
+# This exists as an optimization for SPDX processing to only run in image and
+# SDK processing context.  This class happens to be common to these usages.
+SPDX_MULTILIB_SSTATE_ARCHS = "${@all_multilib_tune_values(d, 'SSTATE_ARCHS')}"
+
 inherit image-postinst-intercepts image-artifact-names
 
 # Wildcards specifying complementary packages to install for every package that has been explicitly
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 4ea91f6..d104668 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -35,6 +35,8 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
+SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
+
 SPDX_ORG ??= "OpenEmbedded ()"
 SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
 SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
@@ -349,7 +351,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     dep_recipes = []
@@ -389,7 +391,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
-collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
+collect_dep_recipes[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -763,7 +765,7 @@ python do_create_runtime_spdx() {
 
     providers = collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     if not is_native:
@@ -869,7 +871,7 @@ python do_create_runtime_spdx() {
             oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SPDX_MULTILIB_SSTATE_ARCHS"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -1004,7 +1006,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import bb.compress.zstd
 
     providers = collect_package_providers(d)
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
@@ -1155,4 +1157,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
             tar.addfile(info, fileobj=index_str)
 
-combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_ARCHS"
+combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SPDX_MULTILIB_SSTATE_ARCHS"
-- 
1.8.3.1


