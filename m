Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA3FC3DA7E
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 23:39:33 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.24267.1721864362749319609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 16:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org.net (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 46ONdIs9026133;
	Wed, 24 Jul 2024 18:39:19 -0500
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Cc: mark.hatle@amd.com
Subject: [PATCH 2/2] create-spdx-*: Support multilibs via SPDX_MULTILIB_SSTATE_ARCHS
Date: Wed, 24 Jul 2024 18:39:18 -0500
Message-Id: <1721864358-26583-3-git-send-email-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721864358-26583-1-git-send-email-mark.hatle@kernel.crashing.org>
References: <1721864358-26583-1-git-send-email-mark.hatle@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 23:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202490

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
---
 meta/classes-recipe/populate_sdk_base.bbclass |  4 ++++
 meta/classes/create-spdx-2.2.bbclass          | 12 ++++++------
 meta/classes/create-spdx-3.0.bbclass          |  4 ++--
 meta/classes/spdx-common.bbclass              |  2 ++
 meta/lib/oe/sbom30.py                         |  2 +-
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 8d79d88ebe..61a8b5e300 100644
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
index 12b78cb3f6..509d3b58b6 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -267,7 +267,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     import oe.spdx_common
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     dep_recipes = []
@@ -312,7 +312,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     return dep_recipes
 
-collect_dep_recipes[vardepsexclude] = "SSTATE_ARCHS"
+collect_dep_recipes[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
 
 def collect_dep_sources(d, dep_recipes):
     import oe.sbom
@@ -610,7 +610,7 @@ python do_create_runtime_spdx() {
 
     providers = oe.spdx_common.collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     if not is_native:
@@ -716,7 +716,7 @@ python do_create_runtime_spdx() {
             oe.sbom.write_doc(d, runtime_doc, pkg_arch, "runtime", spdx_deploy, indent=get_json_indent(d))
 }
 
-do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
+do_create_runtime_spdx[vardepsexclude] += "OVERRIDES SPDX_MULTILIB_SSTATE_ARCHS"
 
 addtask do_create_runtime_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_runtime_spdx"
@@ -798,7 +798,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import bb.compress.zstd
 
     providers = oe.spdx_common.collect_package_providers(d)
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
@@ -950,4 +950,4 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
             tar.addfile(info, fileobj=index_str)
 
-combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SSTATE_ARCHS"
+combine_spdx[vardepsexclude] += "BB_NUMBER_THREADS SPDX_MULTILIB_SSTATE_ARCHS"
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 41840d9d1a..2eb44ba808 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -118,7 +118,7 @@ IMAGE_CLASSES:append = " create-spdx-image-3.0"
 
 oe.spdx30_tasks.set_timestamp_now[vardepsexclude] = "SPDX_INCLUDE_TIMESTAMPS"
 oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] += "STAGING_KERNEL_DIR"
-oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SSTATE_ARCHS"
+oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
 
 
 
@@ -164,7 +164,7 @@ python do_create_package_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_package_spdx(d)
 }
-do_create_package_spdx[vardepsexclude] += "OVERRIDES SSTATE_ARCHS"
+do_create_package_spdx[vardepsexclude] += "OVERRIDES SPDX_MULTILIB_SSTATE_ARCHS"
 
 addtask do_create_package_spdx after do_create_spdx before do_build do_rm_work
 SSTATETASKS += "do_create_package_spdx"
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index d3110a9bdb..e1528b6d0b 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,6 +37,8 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
+SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
+
 python() {
     import oe.spdx_common
     oe.spdx_common.load_spdx_license_data(d)
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 2532d19dad..27ed74f810 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -921,7 +921,7 @@ def load_jsonld_by_arch(d, arch, subdir, name, *, required=False):
 
 
 def find_jsonld(d, subdir, name, *, required=False):
-    package_archs = d.getVar("SSTATE_ARCHS").split()
+    package_archs = d.getVar("SPDX_MULTILIB_SSTATE_ARCHS").split()
     package_archs.reverse()
 
     for arch in package_archs:
-- 
2.34.1


