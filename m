Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 06/26] cve-check: Only include installed packages for rootfs manifest
Date: Thu,  2 Jun 2022 06:51:38 -1000
Message-Id: <65498411d73e8008d5550c2d0a1148f990717587.1654188574.git.steve@sakoman.com>
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Ernst Sjöstrand <ernstp@gmail.com>

Before this the rootfs manifest and the summary were identical.
We should separate the summary and rootfs manifest more clearly,
now the summary is for all CVEs and the rootfs manifest is only for
things in that image. This is even more useful if you build multiple
images.

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3b8cc6fc45f0ea5677729ee2b1819bdc7a441ab1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 69 ++++++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 15 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0ab7ec7ae6..3bb924ba34 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -176,6 +176,8 @@ python cve_check_write_rootfs_manifest () {
     """
 
     import shutil
+    import json
+    from oe.rootfs import image_list_installed_packages
     from oe.cve_check import cve_check_merge_jsons
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
@@ -186,26 +188,63 @@ python cve_check_write_rootfs_manifest () {
         if os.path.exists(deploy_file_json):
             bb.utils.remove(deploy_file_json)
 
-    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
-        bb.note("Writing rootfs CVE manifest")
-        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
-        link_name = d.getVar("IMAGE_LINK_NAME")
+    # Create a list of relevant recipies
+    recipies = set()
+    for pkg in list(image_list_installed_packages(d)):
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR'),
+                                'runtime-reverse', pkg)
+        pkg_data = oe.packagedata.read_pkgdatafile(pkg_info)
+        recipies.add(pkg_data["PN"])
+
+    bb.note("Writing rootfs CVE manifest")
+    deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
+    link_name = d.getVar("IMAGE_LINK_NAME")
+
+    json_data = {"version":"1", "package": []}
+    text_data = ""
+    enable_json = d.getVar("CVE_CHECK_FORMAT_JSON") == "1"
+    enable_text = d.getVar("CVE_CHECK_FORMAT_TEXT") == "1"
+
+    save_pn = d.getVar("PN")
+
+    for pkg in recipies:
+        # To be able to use the CVE_CHECK_RECIPE_FILE variable we have to evaluate
+        # it with the different PN names set each time.
+        d.setVar("PN", pkg)
+        if enable_text:
+            pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE")
+            if os.path.exists(pkgfilepath):
+                with open(pkgfilepath) as pfile:
+                    text_data += pfile.read()
+
+        if enable_json:
+            pkgfilepath = d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+            if os.path.exists(pkgfilepath):
+                with open(pkgfilepath) as j:
+                    data = json.load(j)
+                    cve_check_merge_jsons(json_data, data)
+
+    d.setVar("PN", save_pn)
+
+    if enable_text:
+        link_path = os.path.join(deploy_dir, "%s.cve" % link_name)
         manifest_name = d.getVar("CVE_CHECK_MANIFEST")
-        cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
-        bb.utils.mkdirhier(os.path.dirname(manifest_name))
-        shutil.copyfile(cve_tmp_file, manifest_name)
+        with open(manifest_name, "w") as f:
+            f.write(text_data)
 
-        manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
-        update_symlinks(manifest_name, manifest_link)
+        update_symlinks(manifest_name, link_path)
         bb.plain("Image CVE report stored in: %s" % manifest_name)
 
-        if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
-            link_path = os.path.join(deploy_dir, "%s.json" % link_name)
-            manifest_path = d.getVar("CVE_CHECK_MANIFEST_JSON")
-            bb.note("Generating JSON CVE manifest")
-            generate_json_report(d, manifest_path, link_path)
-            bb.plain("Image CVE JSON report stored in: %s" % link_path)
+    if enable_json:
+        link_path = os.path.join(deploy_dir, "%s.json" % link_name)
+        manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
+
+        with open(manifest_name, "w") as f:
+            json.dump(json_data, f, indent=2)
+
+        update_symlinks(manifest_name, link_path)
+        bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
 }
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
-- 
2.25.1

