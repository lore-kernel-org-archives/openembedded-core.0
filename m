Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 38E9E71B1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 04:48:21 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l81so16272709wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 21:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2pFHcfSjOHKA7z+XPXmpcZ2cSnbw1Jmw6Wvepk57Px8=;
	b=U91wo2Hl/mH/d+aPkkM0MQf3tzJC9oOMJvQZry9tLWRoJ/1hV1hrkJESPS5yutrNFp
	q+dBXvC5juZneVdMQkyOf10TpiEDNCnewRyk0O/TN6wMeue2+imbGllzzKMbsmT2zmdU
	/bsx/4JQ/GoiBE04zcmx8dNEp8UNnDJzgc7ho8UjKXQtPYPL7rpUIrQcuYg9LUy8+j0l
	XGm3YmM9GuSzCzsKcNk1ZeHheVID0/i8rvJuYqqItAvyE39Y58D+oJSXd0dc5ButHMcn
	inhIR94JWYiZ1bw/noGegmfztxvJ9W5yBUKGkVrr8CoVvN6AjULgdFxl74o8PXAFjVNO
	89sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2pFHcfSjOHKA7z+XPXmpcZ2cSnbw1Jmw6Wvepk57Px8=;
	b=X1iXofMi9YoZtWfLR78Hqz/+jswPRqcBWukOSAcR2zkwaElm4VYrDtYJlv+qGWEjt9
	icnzR3FSMVQJPwi04RPVX8fjxsAyC3kazTsd5sp/JAvDzfmRmJ1nHIlefKH2Oz+M630O
	HVT6ocKCVg8UpwaLNJuZxkeNDMTYpY+Tm9Mdl9CF6RkxygGg2Pt2/kcVOPjxsM7wkfVc
	p3uEXZO1Po3hgrzPVtFmHU3KLfi4nrLyaWr08+ss7QgwxQBOvbz2hTX1AvzGF3ws4XYy
	o1aWls72fLjEa0MQmULviU5ZE/AI4VKUQ2E6V4aqjfhECEeNqbNeHnNivo26cuM/xg/p
	ILcw==
X-Gm-Message-State: AIVw1137XQQBX5TdgdX7ccdqqCrmrEBbU/D7puHDDPFYNWmx7KQeEvsZ
	3MFCTBt3ikRghJY7
X-Received: by 10.80.130.2 with SMTP id 2mr11700712edf.233.1500871701939;
	Sun, 23 Jul 2017 21:48:21 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.119.192.124]) by smtp.gmail.com with ESMTPSA id
	t25sm7252036edd.67.2017.07.23.21.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jul 2017 21:48:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jul 2017 06:47:59 +0200
Message-Id: <1500871679-31914-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] meta: revise cve_check
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 04:48:21 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The current cve_check has some drawbacks:
- cve_check_write_rootfs_manifest is being added to
  ROOTFS_POSTPROCESS_COMMAND, but it actually has nothing to do related
  to generating a rootfs, but just deploying cve reports to DEPLOY_DIR,
  this leads do_rootfs/do_image unnecessarily rerun when the task hash
  changed of cve_check_write_rootfs_manifest.
- The generated cve manifest should be image specific, but it does not
  work in that way so far, for instance, if the users bitbake two
  images at the same time, both of them will have all CVE reports even
  though the recipes are not being depended neither at run time nor at
  build time by a image, for instance, if a user run:
  "bitbake core-image-minimal-initramfs core-image-minimal", he/she
  will find the cve manifest of core-image-minimal-initramfs cantians
  some recipe names depended by core-image-minimal but not by itself.
- do_cve_check should be excluded for image recipes, it does not make
  sense to be run for image.
- There is a code snippet checking and cleaning cve-check recipe result
  before re-building, introduced by following commit 85b4941c:
  [ cve-check: clean cve-check recipe result before re-building ]
  this checking is necessary which I agree with the author, but the
  code snippet was put into cve_check_write_rootfs_manifest which
  supposes to run in ROOTFS_POSTPROCESS_COMMAND, and it's trying to
  locate the cve reports by PN, then how could it work since the PN is
  always the image recipe name?

So this patch mainly aims to fix the above drawbacks, by:
- Add a inter-task do_cve_check_write_manifest to image recipes,
  detecting do_cve_check dependencies from BB_TASKDEPDATA, this ensures
  all the cve-check reports in the generated manifest are really
  related to a specific image build.
- Add do_cve_check task only for non-image recipes.
- Move the "cleaning cve-check recipe result before re-building" logic
  to do_cve_check.
- Drop the CVE_CHECK_TMP_FILE and related processes, I think it's sort
  of tricky to have to delete it in a bb.cooker.CookerExit handler, we
  can use CVE_CHECK_DB_FILE to determine if the database had been
  updated correctly or not.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/cve-check.bbclass                     | 123 ++++++++++++++-------
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |   9 +-
 2 files changed, 86 insertions(+), 46 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6f5b0f5..2860afe 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -29,7 +29,6 @@ CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
 
 CVE_CHECK_LOCAL_DIR ?= "${WORKDIR}/cve"
 CVE_CHECK_LOCAL_FILE ?= "${CVE_CHECK_LOCAL_DIR}/cve.log"
-CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
 
 CVE_CHECK_DIR ??= "${DEPLOY_DIR}/cve"
 CVE_CHECK_MANIFEST ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cve"
@@ -46,12 +45,27 @@ CVE_CHECK_CVE_WHITELIST = "{\
     'CVE-2014-2524': ('6.3','5.2',), \
 }"
 
+python () {
+    if bb.data.inherits_class('image', d):
+        bb.build.addtask('do_cve_check_write_manifest', 'do_build', None, d)
+    else:
+        bb.build.addtask('do_cve_check', None, 'do_unpack', d)
+        bb.build.addtask('do_cve_checkall', 'do_build', 'do_cve_check', d)
+}
+
 python do_cve_check () {
     """
     Check recipe for patched and unpatched CVEs
     """
 
-    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
+    # Remove the cve report in previous build to prevent old cves kept in
+    # CVE_CHECK_DIR in case there is no result for current one, which can
+    # happen on version upgrading or when cve/recipe is whitelisted.
+    old_cve_file = os.path.join(d.getVar("CVE_CHECK_DIR"), d.getVar("PN"))
+    if os.path.exists(old_cve_file):
+        bb.utils.remove(old_cve_file)
+
+    if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
         patched_cves = get_patches_cves(d)
         patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
@@ -61,53 +75,86 @@ python do_cve_check () {
         bb.note("Failed to update CVE database, skipping CVE check")
 }
 
-addtask cve_check after do_unpack before do_build
 do_cve_check[depends] = "cve-check-tool-native:do_populate_sysroot cve-check-tool-native:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
-python cve_check_cleanup () {
-    """
-    Delete the file used to gather all the CVE information.
-    """
-
-    bb.utils.remove(e.data.getVar("CVE_CHECK_TMP_FILE"))
+# Dependency placeholder
+do_cve_checkall () {
+	:
 }
 
-addhandler cve_check_cleanup
-cve_check_cleanup[eventmask] = "bb.cooker.CookerExit"
+do_cve_checkall[recrdeptask] = "do_cve_checkall do_cve_check"
+do_cve_checkall[noexec] = "1"
 
-python cve_check_write_rootfs_manifest () {
+python do_cve_check_write_manifest () {
     """
     Create CVE manifest when building an image
     """
 
-    import shutil
-
-    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-        deploy_file = os.path.join(d.getVar("CVE_CHECK_DIR"), d.getVar("PN"))
-        if os.path.exists(deploy_file):
-            bb.utils.remove(deploy_file)
-
-    if os.path.exists(d.getVar("CVE_CHECK_TMP_FILE")):
-        bb.note("Writing rootfs CVE manifest")
+    if d.getVar("CVE_CHECK_CREATE_MANIFEST") != "1":
+        return
+
+    from datetime import datetime
+
+    depends = set()
+    rdepends = set()
+    cve_dir = d.getVar("CVE_CHECK_DIR")
+    manifest_name = d.getVar("CVE_CHECK_MANIFEST")
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+    for taskdep in taskdepdata:
+        if taskdepdata[taskdep][1] == "do_cve_check_write_manifest":
+            for dep in taskdepdata[taskdep][3]:
+                if taskdepdata[dep][1] == "do_cve_check":
+                    pn = taskdepdata[dep][0]
+                    # Skip the recipes do not have cve report
+                    if not os.path.exists(os.path.join(cve_dir, pn)):
+                        continue
+                    if pn.find('-native') != -1 or pn.find('-cross') != -1:
+                        depends.add(pn)
+                    else:
+                        rdepends.add(pn)
+
+    # Sort the results
+    depends = sorted(depends)
+    rdepends = sorted(rdepends)
+
+    bb.note("Writing CVE manifest")
+    if rdepends or depends:
+        utctime = datetime.utcfromtimestamp(os.path.getmtime(d.getVar("CVE_CHECK_DB_FILE")))
+        summary = "CVE database was updated on %s UTC\n" % utctime
+        summary += "Patched/Unpatched CVEs found in target recipes: %s\n" % " ".join(rdepends) if rdepends else ""
+        summary += "Patched/Unpatched CVEs found in native/cross recipes: %s\n" % " ".join(depends) if depends else ""
+        summary += "Check out the details below\n\n"
+        with open(manifest_name, 'a') as f:
+            f.write(summary)
+
+    # First, write CVEs impacting target system, then write CVEs impacting build system
+    for pn in rdepends + depends:
+        cve_file = os.path.join(cve_dir, pn)
+        if os.path.exists(cve_file):
+            with open(cve_file, 'r') as input:
+                cve_text = input.read()
+                with open(manifest_name, 'a') as output:
+                    output.write(cve_text)
+
+    if manifest_name and os.path.exists(manifest_name):
         deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
         link_name = d.getVar("IMAGE_LINK_NAME")
-        manifest_name = d.getVar("CVE_CHECK_MANIFEST")
-        cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
-
-        shutil.copyfile(cve_tmp_file, manifest_name)
-
-        if manifest_name and os.path.exists(manifest_name):
-            manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
-            # If we already have another manifest, update symlinks
-            if os.path.exists(os.path.realpath(manifest_link)):
-                os.remove(manifest_link)
-            os.symlink(os.path.basename(manifest_name), manifest_link)
-            bb.plain("Image CVE report stored in: %s" % manifest_name)
+        manifest_link = os.path.join(deploy_dir, "%s.cve" % link_name)
+        # If we already have another manifest, update symlinks
+        if os.path.exists(os.path.realpath(manifest_link)):
+            os.remove(manifest_link)
+        os.symlink(os.path.basename(manifest_name), manifest_link)
+        bb.plain("Image CVE report stored in: %s" % manifest_name)
+
+    if d.getVar("CVE_CHECK_COPY_FILES") != "1":
+        bb.utils.remove(d.getVar('CVE_CHECK_DIR'), True)
 }
 
-ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
-do_rootfs[recrdeptask] += "${@'do_cve_check' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
+do_cve_check_write_manifest[vardepsexclude] = "BB_TASKDEPDATA"
+do_cve_check_write_manifest[recrdeptask] = "do_cve_checkall do_cve_check"
+do_cve_check_write_manifest[dirs] = "${DEPLOY_DIR_IMAGE}"
+do_cve_check_write_manifest[nostamp] = "1"
 
 def get_patches_cves(d):
     """
@@ -264,13 +311,9 @@ def cve_write_data(d, patched, unpatched, cve_data):
         bb.note("Writing file %s with CVE information" % cve_file)
         f.write(write_string)
 
-    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+    if d.getVar("CVE_CHECK_COPY_FILES") == "1" or d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
         cve_dir = d.getVar("CVE_CHECK_DIR")
         bb.utils.mkdirhier(cve_dir)
         deploy_file = os.path.join(cve_dir, d.getVar("PN"))
         with open(deploy_file, "w") as f:
             f.write(write_string)
-
-    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
-            f.write("%s" % write_string)
diff --git a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
index 4829b11..55fe690 100644
--- a/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
+++ b/meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.4.bb
@@ -36,20 +36,17 @@ do_populate_cve_db() {
 
     # In case we don't inherit cve-check class, use default values defined in the class.
     cve_dir="${CVE_CHECK_DB_DIR}"
-    cve_file="${CVE_CHECK_TMP_FILE}"
-
     [ -z "${cve_dir}" ] && cve_dir="${DL_DIR}/CVE_CHECK"
-    [ -z "${cve_file}" ] && cve_file="${TMPDIR}/cve_check"
 
     bbdebug 2 "Updating cve-check-tool database located in $cve_dir"
     # --cacert works around curl-native not finding the CA bundle
-    if cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
-        printf "CVE database was updated on %s UTC\n\n" "$(LANG=C date --utc +'%F %T')" > "$cve_file"
-    else
+    if ! cve-check-update --cacert ${sysconfdir}/ssl/certs/ca-certificates.crt -d "$cve_dir" ; then
         bbwarn "Error in executing cve-check-update"
         if [ "${@'1' if bb.data.inherits_class('cve-check', d) else '0'}" -ne 0 ] ; then
             bbwarn "Failed to update cve-check-tool database, CVEs won't be checked"
         fi
+        # Clean up leftovers of a unsuccessful updating
+        rm -rf $cve_dir/*
     fi
 }
 
-- 
2.7.4


