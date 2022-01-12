Return-Path: <abeltran@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21A2C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 19:40:18 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.2325.1642016417580804312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 11:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=az9UgDt2;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: abeltran@linux.microsoft.com)
Received: from
 abeltran-ubuntu18-dev.memva0x40hnu5lyn52qddymqwe.xx.internal.cloudapp.net
 (unknown [20.94.235.175])
	by linux.microsoft.com (Postfix) with ESMTPSA id C37B120B7179;
	Wed, 12 Jan 2022 11:40:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C37B120B7179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1642016416;
	bh=X527zVG5wKK5GHUGiKkkoP2Qar15Xr3yJYC4m53g6Q8=;
	h=From:To:Cc:Subject:Date:From;
	b=az9UgDt2Tqkb0ps2npgfZGKkxpapGNROvmkxoRy2x0/7Twt8Dc9NlhYQuIp5dIACq
	 QhWHVJYptf0V0qh6QKnV/brcto55TCkXfc/99jRUQPyzLChOMUnC946ymdMXkQ4XHS
	 HbsSHsc8skq+bceuLDwxHAp++/nhsc0qIf4r4Vyc=
From: Andres Beltran <abeltran@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>
Subject: [PATCH] create-spdx: add support for SDKs
Date: Wed, 12 Jan 2022 19:40:12 +0000
Message-Id: <20220112194012.873-1-abeltran@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 19:40:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160500

Currently, SPDX SBOMs are only created for images. Add support for
SDKs. Fix json indent when outputting SBOMs for better readability.

Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>
---
 meta/classes/create-spdx.bbclass | 95 +++++++++++++++++++++-----------
 meta/lib/oe/sbom.py              |  6 +-
 2 files changed, 68 insertions(+), 33 deletions(-)

diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
index e44a204a8fc..d0f987315ee 100644
--- a/meta/classes/create-spdx.bbclass
+++ b/meta/classes/create-spdx.bbclass
@@ -556,7 +556,7 @@ python do_create_spdx() {
             oe.sbom.write_doc(d, package_doc, "packages")
 }
 # NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_create_spdx after do_package do_packagedata do_unpack before do_build do_rm_work
+addtask do_create_spdx after do_package do_packagedata do_unpack before do_populate_sdk do_build do_rm_work
 
 SSTATETASKS += "do_create_spdx"
 do_create_spdx[sstate-inputdirs] = "${SPDXDEPLOY}"
@@ -788,28 +788,77 @@ def spdx_get_src(d):
 do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
 
 ROOTFS_POSTUNINSTALL_COMMAND =+ "image_combine_spdx ; "
+
+do_populate_sdk[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
+POPULATE_SDK_POST_HOST_COMMAND_append_task-populate-sdk = " sdk_host_combine_spdx; "
+POPULATE_SDK_POST_TARGET_COMMAND_append_task-populate-sdk = " sdk_target_combine_spdx; "
+
 python image_combine_spdx() {
+    import os
+    import oe.sbom
+    from pathlib import Path
+    from oe.rootfs import image_list_installed_packages
+
+    image_name = d.getVar("IMAGE_NAME")
+    image_link_name = d.getVar("IMAGE_LINK_NAME")
+    imgdeploydir = Path(d.getVar("IMGDEPLOYDIR"))
+    img_spdxid = oe.sbom.get_image_spdxid(image_name)
+    packages = image_list_installed_packages(d)
+
+    combine_spdx(d, image_name, imgdeploydir, img_spdxid, packages)
+
+    if image_link_name:
+        image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
+        image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
+        image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
+
+    def make_image_link(target_path, suffix):
+        if image_link_name:
+            link = imgdeploydir / (image_link_name + suffix)
+            link.symlink_to(os.path.relpath(target_path, link.parent))
+
+    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
+    make_image_link(spdx_tar_path, ".spdx.tar.zst")
+    spdx_index_path = imgdeploydir / (image_name + ".spdx.index.json")
+    make_image_link(spdx_index_path, ".spdx.index.json")
+}
+
+python sdk_host_combine_spdx() {
+    sdk_combine_spdx(d, "host")
+}
+
+python sdk_target_combine_spdx() {
+    sdk_combine_spdx(d, "target")
+}
+
+def sdk_combine_spdx(d, sdk_type):
+    import oe.sbom
+    from pathlib import Path
+    from oe.sdk import sdk_list_installed_packages
+
+    sdk_name = d.getVar("SDK_NAME") + "-" + sdk_type
+    sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
+    sdk_spdxid = oe.sbom.get_sdk_spdxid(sdk_name)
+    sdk_packages = sdk_list_installed_packages(d, sdk_type == "target")
+    combine_spdx(d, sdk_name, sdk_deploydir, sdk_spdxid, sdk_packages)
+
+def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
     import os
     import oe.spdx
     import oe.sbom
     import io
     import json
-    from oe.rootfs import image_list_installed_packages
     from datetime import timezone, datetime
     from pathlib import Path
     import tarfile
     import bb.compress.zstd
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
-    image_name = d.getVar("IMAGE_NAME")
-    image_link_name = d.getVar("IMAGE_LINK_NAME")
-
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    imgdeploydir = Path(d.getVar("IMGDEPLOYDIR"))
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
 
     doc = oe.spdx.SPDXDocument()
-    doc.name = image_name
+    doc.name = rootfs_name
     doc.documentNamespace = get_doc_namespace(d, doc)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
@@ -821,14 +870,12 @@ python image_combine_spdx() {
     image = oe.spdx.SPDXPackage()
     image.name = d.getVar("PN")
     image.versionInfo = d.getVar("PV")
-    image.SPDXID = oe.sbom.get_image_spdxid(image_name)
+    image.SPDXID = rootfs_spdxid
 
     doc.packages.append(image)
 
     spdx_package = oe.spdx.SPDXPackage()
 
-    packages = image_list_installed_packages(d)
-
     for name in sorted(packages.keys()):
         pkg_spdx_path = deploy_dir_spdx / "packages" / (name + ".spdx.json")
         pkg_doc, pkg_doc_sha1 = oe.sbom.read_doc(pkg_spdx_path)
@@ -856,7 +903,6 @@ python image_combine_spdx() {
         runtime_ref.checksum.algorithm = "SHA1"
         runtime_ref.checksum.checksumValue = runtime_doc_sha1
 
-        # "OTHER" isn't ideal here, but I can't find a relationship that makes sense
         doc.externalDocumentRefs.append(runtime_ref)
         doc.add_relationship(
             image,
@@ -865,14 +911,10 @@ python image_combine_spdx() {
             comment="Runtime dependencies for %s" % name
         )
 
-    image_spdx_path = imgdeploydir / (image_name + ".spdx.json")
+    image_spdx_path = rootfs_deploydir / (rootfs_name + ".spdx.json")
 
     with image_spdx_path.open("wb") as f:
-        doc.to_json(f, sort_keys=True)
-
-    if image_link_name:
-        image_spdx_link = imgdeploydir / (image_link_name + ".spdx.json")
-        image_spdx_link.symlink_to(os.path.relpath(image_spdx_path, image_spdx_link.parent))
+        doc.to_json(f, sort_keys=True, indent=4)
 
     num_threads = int(d.getVar("BB_NUMBER_THREADS"))
 
@@ -880,7 +922,7 @@ python image_combine_spdx() {
 
     index = {"documents": []}
 
-    spdx_tar_path = imgdeploydir / (image_name + ".spdx.tar.zst")
+    spdx_tar_path = rootfs_deploydir / (rootfs_name + ".spdx.tar.zst")
     with bb.compress.zstd.open(spdx_tar_path, "w", num_threads=num_threads) as f:
         with tarfile.open(fileobj=f, mode="w|") as tar:
             def collect_spdx_document(path):
@@ -930,7 +972,7 @@ python image_combine_spdx() {
 
             index["documents"].sort(key=lambda x: x["filename"])
 
-            index_str = io.BytesIO(json.dumps(index, sort_keys=True).encode("utf-8"))
+            index_str = io.BytesIO(json.dumps(index, sort_keys=True, indent=4).encode("utf-8"))
 
             info = tarfile.TarInfo()
             info.name = "index.json"
@@ -942,17 +984,6 @@ python image_combine_spdx() {
 
             tar.addfile(info, fileobj=index_str)
 
-    def make_image_link(target_path, suffix):
-        if image_link_name:
-            link = imgdeploydir / (image_link_name + suffix)
-            link.symlink_to(os.path.relpath(target_path, link.parent))
-
-    make_image_link(spdx_tar_path, ".spdx.tar.zst")
-
-    spdx_index_path = imgdeploydir / (image_name + ".spdx.index.json")
+    spdx_index_path = rootfs_deploydir / (rootfs_name + ".spdx.index.json")
     with spdx_index_path.open("w") as f:
-        json.dump(index, f, sort_keys=True)
-
-    make_image_link(spdx_index_path, ".spdx.index.json")
-}
-
+        json.dump(index, f, sort_keys=True, indent=4)
diff --git a/meta/lib/oe/sbom.py b/meta/lib/oe/sbom.py
index 848812c0b7d..a975a3c9fc0 100644
--- a/meta/lib/oe/sbom.py
+++ b/meta/lib/oe/sbom.py
@@ -28,6 +28,10 @@ def get_image_spdxid(img):
     return "SPDXRef-Image-%s" % img
 
 
+def get_sdk_spdxid(sdk):
+    return "SPDXRef-SDK-%s" % sdk
+
+
 def write_doc(d, spdx_doc, subdir, spdx_deploy=None):
     from pathlib import Path
 
@@ -37,7 +41,7 @@ def write_doc(d, spdx_doc, subdir, spdx_deploy=None):
     dest = spdx_deploy / subdir / (spdx_doc.name + ".spdx.json")
     dest.parent.mkdir(exist_ok=True, parents=True)
     with dest.open("wb") as f:
-        doc_sha1 = spdx_doc.to_json(f, sort_keys=True)
+        doc_sha1 = spdx_doc.to_json(f, sort_keys=True, indent=4)
 
     l = spdx_deploy / "by-namespace" / spdx_doc.documentNamespace.replace("/", "_")
     l.parent.mkdir(exist_ok=True, parents=True)
-- 
2.17.1


