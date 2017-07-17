Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2423C6FF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 03:44:04 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id w126so64101133wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jul 2017 20:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fgiddAc7fNVNGkj0eMpg5IlY9HhdcBd1eILCBVdD9jQ=;
	b=h/MQmL5ZNXCE6A9DU1vrsUW1LcI3tSggCjxmzqoKwQY8h12FhILWO432V9PTKPcUQK
	WNqttU/1Qk2XG731hicJRRBPginr10bvSbn4nTg9dfccPN+rb7F0mIJFNz1E2sJaipgh
	5i+O+x+MCQxOMmswQ1yO7gEEgheWulmsPCt7+wKU0hYN4bXnNj7I4jWen4zMGtzVuC/Y
	Y7iHFM91/zlPS0a6pv1aJ/CSOFunxXIPhNcWmo1UURwVOR99gnRWNkjRlRVLuKE9gOkO
	5ky6PK+qbCxsZ6Y9JYWrxCLfkBJmO7LpJLUpF23Kr3b2fP4g7ALKjipHBuOqkuPycByQ
	tMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fgiddAc7fNVNGkj0eMpg5IlY9HhdcBd1eILCBVdD9jQ=;
	b=Stl5GcE1i5yPiVdEW3RRFjcLdFOLfwTmRHrihMRPfapNrtOdZXO6UupZZUKg/1+KD6
	Ni94DyMNYXI7banheZOmGvwxaeav9uRsYODH2Xs1rXdmbWWV31etkGihUGaN1JGfZZAT
	0lEsfkJZ2JNY3cF7tdWGTlC4zi2mxMdEfD9EcISDuljWNjLqjhqGW+tUp1G2crjMtdYZ
	VdjDIkk7eWG36aWxaNa9jOJQc9RXRO+95imO5gNsfFCnVlXGOP1nfMmYDAGdtjMIsB0F
	c9TpDLqgqhgXvPT1yWHBMK/StDxA7aw2vTt9tCXtd6+qBrkzw6AjfcOjfR5ss096XfMG
	aLPg==
X-Gm-Message-State: AIVw111O/yMjG258/SkTnKQ/K+64hUwdOCAtrQ9RTe/zx9MyDs0fGPWw
	jSW7AO1qDSqMFzAh
X-Received: by 10.80.144.68 with SMTP id z4mr15873743edz.143.1500263045257;
	Sun, 16 Jul 2017 20:44:05 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.203.112]) by smtp.gmail.com with ESMTPSA id
	o36sm8855451edc.39.2017.07.16.20.44.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 16 Jul 2017 20:44:04 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org, mariano.lopez@linux.intel.com,
	ross.burton@intel.com
Date: Mon, 17 Jul 2017 05:43:47 +0200
Message-Id: <1500263027-5693-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: revise cve_check
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
X-List-Received-Date: Mon, 17 Jul 2017 03:44:05 -0000

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
 meta/classes/cve-check.bbclass                     | 122 ++++++++++++++-------
 .../cve-check-tool/cve-check-tool_5.6.4.bb         |   9 +-
 2 files changed, 85 insertions(+), 46 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6f5b0f5..ef0d2a8 100644
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
@@ -61,53 +75,85 @@ python do_cve_check () {
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
+do_cve_check_write_manifest[nostamp] = "1"
 
 def get_patches_cves(d):
     """
@@ -264,13 +310,9 @@ def cve_write_data(d, patched, unpatched, cve_data):
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


