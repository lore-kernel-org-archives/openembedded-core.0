Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF12CD6E79
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:05:28 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6723.1780661120155900063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 05:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iXuoupFP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202606051205189dcf96c9b5000207a0-7s2rku@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202606051205189dcf96c9b5000207a0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 05 Jun 2026 14:05:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Bk7VS2Ml0mSUR91zSJ2sDf8zknNWyM+P9Kw+/Zi4dcU=;
 b=iXuoupFPRYWeYps8V/7u7ouMXhKRYfnbH4b23wc9GQbY/yKs29E2HUEZPjzX8UL0T0uyfM
 VxliFtSP+8o0y2yAlPUX3tynMrjuaEc6OUDYHqesHZX+yeSWaP/OgOP96Uo+XcSdac3O6lo2
 e/xzQaTTWBbIGtWrbCUBRYEbqtyjb+XxP1YE9fr6TSZsZqMa9z9Ilc6/PQnm1UlM2rJqWbNx
 kytCVo6hUDnJqnSQp1iMMFHHUOr74LBTb5SRfZ4uve/RSCc35KR4vYag36cCHUX7FhePRxTj
 U3bEAoij2CJsaPl0RJLdoVFlmEDcF2lgVVYHPsOnqO+WPWE77ytiUU0g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] rootfs,spdx: handle removed packages
Date: Fri,  5 Jun 2026 14:04:56 +0200
Message-ID: <20260605120456.130264-2-peter.marko@siemens.com>
In-Reply-To: <20260605120456.130264-1-peter.marko@siemens.com>
References: <20260605120456.130264-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 12:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238166

From: Peter Marko <peter.marko@siemens.com>

SPDX should not list packages which were removed from rootfs as installed.

The list of installed packages does not contain them directly, but as
dependencies of other installed packages.

Siwtch them to "other" to keep them in SPDX as part of the build and
installation process.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass |  7 +++++++
 meta/lib/oe/rootfs.py                             |  6 ++++++
 meta/lib/oe/sbom30.py                             |  8 +++++++-
 meta/lib/oe/spdx30_tasks.py                       | 14 +++++++++++++-
 4 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 15a91e90e2..dfbd2961b3 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -6,6 +6,7 @@
 # SPDX image tasks
 
 SPDX_ROOTFS_PACKAGES = "${SPDXDIR}/rootfs-packages.json"
+SPDX_ROOTFS_REMOVED_PACKAGES = "${SPDXDIR}/rootfs-removed-packages.json"
 SPDXIMAGEDEPLOYDIR = "${SPDXDIR}/image-deploy"
 SPDXROOTFSDEPLOY = "${SPDXDIR}/rootfs-deploy"
 
@@ -15,14 +16,20 @@ python spdx_collect_rootfs_packages() {
     from oe.rootfs import image_list_installed_packages
 
     root_packages_file = Path(d.getVar("SPDX_ROOTFS_PACKAGES"))
+    root_removed_packages_file = Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
 
     packages = image_list_installed_packages(d)
     if not packages:
         packages = {}
 
+    removed_packages = (d.getVar("ROOTFS_REMOVED_PACKAGES") or "").split()
+
     root_packages_file.parent.mkdir(parents=True, exist_ok=True)
     with root_packages_file.open("w") as f:
         json.dump(packages, f)
+
+    with root_removed_packages_file.open("w") as f:
+        json.dump(removed_packages, f)
 }
 ROOTFS_POSTUNINSTALL_COMMAND =+ "spdx_collect_rootfs_packages"
 
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5eee48f587..b8830596ed 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -261,10 +261,13 @@ class Rootfs(object, metaclass=ABCMeta):
 
 
     def _uninstall_unneeded(self):
+        removed_pkgs = set()
+
         # Remove the run-postinsts package if no delayed postinsts are found
         delayed_postinsts = self._get_delayed_postinsts()
         if delayed_postinsts is None:
             if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts")) or os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_system_unitdir}/run-postinsts.service")):
+                removed_pkgs.add("run-postinsts")
                 self.pm.remove(["run-postinsts"])
 
         image_rorfs = bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
@@ -285,6 +288,7 @@ class Rootfs(object, metaclass=ABCMeta):
             # to be uninstalled or to be managed correctly otherwise.
             provider = self.d.getVar("VIRTUAL-RUNTIME_update-alternatives")
             pkgs_to_remove = sorted([pkg for pkg in pkgs_installed if pkg in unneeded_pkgs], key=lambda x: x == provider)
+            removed_pkgs.update(pkgs_to_remove)
 
             # update-alternatives provider is removed in its own remove()
             # call because all package managers do not guarantee the packages
@@ -296,6 +300,8 @@ class Rootfs(object, metaclass=ABCMeta):
             if len(pkgs_to_remove) > 0:
                 self.pm.remove([pkgs_to_remove[-1]], False)
 
+        self.d.setVar("ROOTFS_REMOVED_PACKAGES", " ".join(sorted(removed_pkgs)))
+
         if delayed_postinsts:
             self._save_postinsts()
             if image_rorfs:
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index b379ff947c..4fa32266fa 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -1122,7 +1122,7 @@ def find_by_spdxid(d, spdxid, *, required=False):
     return find_jsonld(d, *jsonld_hash_path(hash_id(spdxid)), required=required)
 
 
-def create_sbom(d, name, root_elements, add_objectsets=[]):
+def create_sbom(d, name, root_elements, add_objectsets=[], removed_packages=[]):
     objset = ObjectSet.new_objset(d, name)
 
     sbom = objset.add(
@@ -1142,6 +1142,12 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
             + "\n  ".join(sorted(list(missing_spdxids)))
         )
 
+    if removed_packages:
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.name in removed_packages and pkg.software_primaryPurpose == oe.spdx30.software_SoftwarePurpose.install:
+                pkg.software_primaryPurpose = oe.spdx30.software_SoftwarePurpose.other
+                bb.note("Reclassified removed package %s SPDX entry from install to other" % pkg.name)
+
     # Filter out internal extensions from final SBoMs
     objset.remove_internal_extensions()
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 7cc46d579b..18c68f47de 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -1532,6 +1532,7 @@ def create_image_sbom_spdx(d):
     image_link_name = d.getVar("IMAGE_LINK_NAME")
     imgdeploydir = Path(d.getVar("SPDXIMAGEDEPLOYDIR"))
     machine = d.getVar("MACHINE")
+    root_removed_packages_file = Path(d.getVar("SPDX_ROOTFS_REMOVED_PACKAGES"))
 
     spdx_path = imgdeploydir / (image_name + ".spdx.json")
 
@@ -1553,7 +1554,18 @@ def create_image_sbom_spdx(d):
     for o in image_objset.foreach_root(oe.spdx30.software_File):
         root_elements.append(oe.sbom30.get_element_link_id(o))
 
-    objset, sbom = oe.sbom30.create_sbom(d, image_name, root_elements)
+    try:
+        with root_removed_packages_file.open("r") as f:
+            removed_packages = json.load(f)
+    except FileNotFoundError:
+        removed_packages = []
+
+    objset, sbom = oe.sbom30.create_sbom(
+        d,
+        image_name,
+        root_elements,
+        removed_packages=removed_packages,
+    )
 
     # Set supplier on root elements if SPDX_IMAGE_SUPPLIER is defined
     supplier = objset.new_agent("SPDX_IMAGE_SUPPLIER", add=False)

