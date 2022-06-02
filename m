Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][dunfell 09/11] cve-check: Add helper for symlink handling
Date: Wed,  1 Jun 2022 16:30:49 -1000
Message-Id: <8a178a728f2318c55d5ecaef0ef9e0fd8ebc333b.1654136888.git.steve@sakoman.com>
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Ernst Sjöstrand <ernstp@gmail.com>

Signed-off-by: Ernst Sjöstrand <ernstp@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5046d54df2c3057be2afa4143a2833183fca0d67)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index f7ed2a6ae9..3cae0e8eb2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -75,6 +75,12 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
+def update_symlinks(target_path, link_path):
+    if link_path != target_path and os.path.exists(target_path):
+        if os.path.exists(os.path.realpath(link_path)):
+            os.remove(link_path)
+        os.symlink(os.path.basename(target_path), link_path)
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
@@ -94,10 +100,7 @@ def generate_json_report(d, out_path, link_path):
         with open(out_path, "w") as f:
             json.dump(summary, f, indent=2)
 
-        if link_path != out_path:
-            if os.path.exists(os.path.realpath(link_path)):
-                os.remove(link_path)
-            os.symlink(os.path.basename(out_path), link_path)
+        update_symlinks(out_path, link_path)
 
 python cve_save_summary_handler () {
     import shutil
@@ -114,14 +117,9 @@ python cve_save_summary_handler () {
 
     if os.path.exists(cve_tmp_file):
         shutil.copyfile(cve_tmp_file, cve_summary_file)
-
-        if cve_summary_file and os.path.exists(cve_summary_file):
-            cvefile_link = os.path.join(cvelogpath, cve_summary_name)
-            # if the paths are the same don't create the link
-            if cvefile_link != cve_summary_file:
-                if os.path.exists(os.path.realpath(cvefile_link)):
-                    os.remove(cvefile_link)
-                os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+        cvefile_link = os.path.join(cvelogpath, cve_summary_name)
+        update_symlinks(cve_summary_file, cvefile_link)
+        bb.plain("Complete CVE report summary created at: %s" % cvefile_link)
 
     if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
         json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
@@ -193,15 +191,9 @@ python cve_check_write_rootfs_manifest () {
         bb.utils.mkdirhier(os.path.dirname(manifest_name))
         shutil.copyfile(cve_tmp_file, manifest_name)
 
-        if manifest_name and os.path.exists(manifest_name):
-            manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
-            # if they are the same don't create the link
-            if manifest_link != manifest_name:
-                # If we already have another manifest, update symlinks
-                if os.path.exists(os.path.realpath(manifest_link)):
-                    os.remove(manifest_link)
-                os.symlink(os.path.basename(manifest_name), manifest_link)
-            bb.plain("Image CVE report stored in: %s" % manifest_name)
+        manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
+        update_symlinks(manifest_name, manifest_link)
+        bb.plain("Image CVE report stored in: %s" % manifest_name)
 
         if d.getVar("CVE_CHECK_FORMAT_JSON") == "1":
             link_path = os.path.join(deploy_dir, "%s.json" % link_name)
-- 
2.25.1

