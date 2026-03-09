Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7082DEF3718
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 11:57:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12479.1773057445416412658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 04:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HSiA6gBW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD20E4E425DE;
	Mon,  9 Mar 2026 11:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD2685FFB8;
	Mon,  9 Mar 2026 11:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EBA010369A00;
	Mon,  9 Mar 2026 12:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773057443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F4PeZhl2NlKOf7FXdVTm2n74TGRWudM5AdDZvqqU91E=;
	b=HSiA6gBWGeaCB95IPjNvk48YHr96QBOqH4bQU3Hm/afNcWZMyrd569DeUbiaOp5Aj4abU2
	Mqe1yB6HT5a2Q882NCxn830k587hrLkzkvzsub7jp/z+9LbF3Cc871RKI8grGcU9EYAvj3
	OkFReJ1/lFWeePoQ9ber0gSHkjKBWLsOiY44C9yME1fZJOCjH/FtJlU+WiQGvxYvqLhtfN
	8/dOEGs7/ZvTKFdhqzzHCnfb1gigbU3QcMA9NeJ9PaIPbCN8jfnyaaDS2MXuSvassVEzZc
	vxNwuoy5iNn6c/JRsmWHtjzluoWwKu4ZigcoB8wBsfyUxuHHaFlUkHatemI/hA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Mon, 09 Mar 2026 12:57:10 +0100
Subject: [PATCH RFC 1/2] sbom-cve-check: Download CVE DB using BitBake
 fetcher
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-add-sbom-cve-check-p2b-v1-1-09165cddfcf1@bootlin.com>
References: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
In-Reply-To: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 11:57:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232700

Use BitBake's internal fetcher to download the CVE databases and fix
task dependencies to ensure the CVE analysis runs only if either the
original SBOM changes or the CVE databases are updated.
To achieve this:

- Remove the `nostamp` flag from the `do_sbom_cve_check` task.
- Remove the unnecessary "recrdeptask" on `do_create_image_sbom_spdx`.
  The only required dependency is to run after the
  `do_create_image_sbom_spdx` task of the image recipe.
- Add the `do_sbom_cve_check_setscene` task.
- Update the dependency for the two CVE database-fetching recipes: the
  `do_sbom_cve_check` task now runs after their `do_populate_sysroot`.
- In the two CVE database-fetching recipes, directly copy the downloaded
  Git repository to the deploy directory using `rsync` from the
  `do_install` task. While this is an hack, it is the fastest solution
  I found for deploying the downloaded CVE database. The `do_install`
  task is only executed when `SRCREV` actually changes.

Additional improvements include:

- Add missing `HOMEPAGE` links to `sbom-cve-check-update-*-native.bb`.
- Move the code in `sbom-cve-check-update-db.bbclass` to a simple
  include file. Other layers that may want to add a new recipe to
  download another database can still include it using:
  `require recipes-core/meta/sbom-cve-check-update-db.inc`.
- Rename configuration variables for clarity.
- Add `SBOM_CVE_CHECK_DATABASES_DIR` to define the base directory for
  CVE databases, allowing users to configure an alternate storage
  location.
- Improve documentation for all configuration variables.
- By default, the class now generates a JSON file in the `cve-check`
  format in addition to the exported SPDX 3.0 output.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check-update-db.bbclass               | 87 ----------------------
 meta/classes-recipe/sbom-cve-check.bbclass         | 53 ++++++++-----
 meta/recipes-core/meta/sbom-cve-check-config.inc   |  4 +
 .../meta/sbom-cve-check-update-cvelist-native.bb   | 11 ++-
 .../recipes-core/meta/sbom-cve-check-update-db.inc | 28 +++++++
 .../meta/sbom-cve-check-update-nvd-native.bb       | 11 ++-
 6 files changed, 83 insertions(+), 111 deletions(-)

diff --git a/meta/classes-recipe/sbom-cve-check-update-db.bbclass b/meta/classes-recipe/sbom-cve-check-update-db.bbclass
deleted file mode 100644
index 4f62c831eb72..000000000000
--- a/meta/classes-recipe/sbom-cve-check-update-db.bbclass
+++ /dev/null
@@ -1,87 +0,0 @@
-# SPDX-License-Identifier: MIT
-
-INHIBIT_DEFAULT_DEPS = "1"
-EXCLUDE_FROM_WORLD = "1"
-
-inherit native
-
-deltask do_patch
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
-
-SBOM_CVE_CHECK_FETCH_PATH[doc] = "Path to the Git repository to be downloaded. \
-    Should be prefixed by {DL_DIR}/sbom_cve_check/databases/"
-
-SBOM_CVE_CHECK_FETCH_URL[doc] = "Git clone URL of the CVE database"
-
-SBOM_CVE_CHECK_FETCH_INTERVAL ?= "57600"
-SBOM_CVE_CHECK_FETCH_INTERVAL[doc] = "\
-    CVE database update interval, in seconds. By default every 16 hours. \
-    Use 0 to force the update. Use a negative value to skip the update. \
-"
-
-python do_fetch() {
-    from datetime import datetime, timezone, timedelta
-    import fcntl
-    import os
-    import pathlib
-    import subprocess
-
-    bb.utils.export_proxies(d)
-
-    fetch_interval = int(d.get("SBOM_CVE_CHECK_FETCH_INTERVAL"))
-    git_url = d.getVar("SBOM_CVE_CHECK_FETCH_URL")
-    git_dir = pathlib.Path(d.getVar("SBOM_CVE_CHECK_FETCH_PATH"))
-    git_dir.mkdir(parents=True, exist_ok=True)
-
-    def _exec_git_cmd(args):
-        cmd = ["git"]
-        cmd.extend(args)
-        return subprocess.run(
-            cmd,
-            input="",
-            capture_output=True,
-            check=True,
-            cwd=git_dir,
-            encoding="utf-8",
-        )
-
-    # Lock the git directory: take an exclusive lock
-    lock_fd = os.open(git_dir, os.O_RDONLY | os.O_NOCTTY)
-    try:
-        fcntl.flock(lock_fd, fcntl.LOCK_EX)
-
-        # Clone the git repository if it does not exist
-        if not git_dir.joinpath(".git", "HEAD").is_file():
-            _exec_git_cmd(["clone", "--depth", "1", "--single-branch", git_url, "."])
-            return
-
-        # Check if an updated is necessary
-        if fetch_interval < 0:
-            return
-
-        if fetch_interval > 0:
-            # Get date of last commit
-            r = _exec_git_cmd(["show", "-s", "--format=%ct", "HEAD"])
-            commit_date = datetime.fromtimestamp(int(r.stdout.strip()), tz=timezone.utc)
-            delta_last_commit = datetime.now(timezone.utc) - commit_date
-            if delta_last_commit < timedelta(seconds=fetch_interval):
-                return
-
-        _exec_git_cmd(["pull"])
-    except subprocess.SubprocessError as e:
-        bb.error(f"{e.cmd} failed:\n{e.stdout}\n---\n{e.stderr}\n")
-    finally:
-        # Release the exclusive lock
-        os.close(lock_fd)
-}
-
-do_fetch[file-checksums] = ""
-do_fetch[vardeps] = " \
-    SBOM_CVE_CHECK_FETCH_PATH \
-    SBOM_CVE_CHECK_FETCH_URL \
-    SBOM_CVE_CHECK_FETCH_INTERVAL \
-"
-do_fetch[nostamp] = "1"
diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
index 86e06bdf7c23..2ab29001008a 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -1,17 +1,34 @@
 # SPDX-License-Identifier: MIT
 
-SBOM_CVE_CHECK_WORKDIR ??= "${WORKDIR}/sbom_cve_check"
-SBOM_CVE_CHECK_DEPLOYDIR = "${SBOM_CVE_CHECK_WORKDIR}/image-deploy"
+require recipes-core/meta/sbom-cve-check-config.inc
 
-SBOM_CVE_CHECK_EXTRA_ARGS[doc] = "Allow to specify extra arguments to sbom-cve-check. For example to add filtering"
-SBOM_CVE_CHECK_EXTRA_ARGS ?= ""
+SBOM_CVE_CHECK_DEPLOYDIR = "${WORKDIR}/sbom_cve_check/image-deploy"
 
-SBOM_CVE_CHECK_EXPORT_VARS[doc] = "List of variables that declare export files to generate. Each variable must have a 'type' and an 'ext' flag set"
-SBOM_CVE_CHECK_EXPORT_VARS ?= "SBOM_CVE_CHECK_EXPORT_FILE"
+SBOM_CVE_CHECK_EXTRA_ARGS[doc] = "Allow to specify extra arguments to sbom-cve-check. \
+    For example to add export flags for filtering (e.g., only export vulnerable CVEs). \
+"
+SBOM_CVE_CHECK_EXTRA_ARGS ??= ""
 
-SBOM_CVE_CHECK_EXPORT_FILE[doc] = "Default configuration of generated export file"
-SBOM_CVE_CHECK_EXPORT_FILE[type] ?= "spdx3"
-SBOM_CVE_CHECK_EXPORT_FILE[ext] ?= ".cve-check.spdx.json"
+SBOM_CVE_CHECK_EXPORT_VARS[doc] = "List of variables that declare export files to generate. \
+    Each variable must have a 'type' and an 'ext' flag set. \
+    The 'type' flag contains the value that is passed to the --export-type command flags. \
+    The 'ext' flag contains the filename extension (suffix). The output filename is going \
+    to be ${IMAGE_NAME}${ext} \
+"
+SBOM_CVE_CHECK_EXPORT_VARS ?= "SBOM_CVE_CHECK_EXPORT_SPDX3 SBOM_CVE_CHECK_EXPORT_CVECHECK"
+
+SBOM_CVE_CHECK_EXPORT_SPDX3[doc] = "Export configuration to generate an SPDX3 SBOM file, \
+    with the following name: ${IMAGE_NAME}.cve-check.spdx.json \
+"
+SBOM_CVE_CHECK_EXPORT_SPDX3[type] ?= "spdx3"
+SBOM_CVE_CHECK_EXPORT_SPDX3[ext] ?= ".cve-check.spdx.json"
+
+SBOM_CVE_CHECK_EXPORT_CVECHECK[doc] = "Export configuration to generate a JSON manifest \
+    in the same format as the cve-check class, with the following name: \
+    ${IMAGE_NAME}.cve-check.json \
+"
+SBOM_CVE_CHECK_EXPORT_CVECHECK[type] ?= "yocto-cve-check-manifest"
+SBOM_CVE_CHECK_EXPORT_CVECHECK[ext] ?= ".cve-check.json"
 
 SBOM_CVE_CHECK_ALLOW_NETWORK[doc] = "Set to 1 to enable network usage."
 SBOM_CVE_CHECK_ALLOW_NETWORK ?= "0"
@@ -31,7 +48,7 @@ python do_sbom_cve_check() {
 
     sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.json")
     vex_manifest_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.json")
-    dl_db_dir = d.expand("${DL_DIR}/sbom_cve_check/databases")
+    dl_db_dir = d.getVar("SBOM_CVE_CHECK_DATABASES_DIR")
     deploy_dir = d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
     img_link_name = d.getVar("IMAGE_LINK_NAME")
     img_name = d.getVar("IMAGE_NAME")
@@ -66,9 +83,7 @@ python do_sbom_cve_check() {
         bb.note("Running: {}".format(" ".join(cmd_args)))
         bb.process.run(cmd_args, env=cmd_env)
     except bb.process.ExecutionError as e:
-        bb.fatal(
-            f"sbom-cve-check failed with exit code {e.exitcode}\n{e.stdout}\n{e.stderr}"
-        )
+        bb.error(f"sbom-cve-check failed: {e}")
         return
 
     for export_file in export_files:
@@ -79,18 +94,20 @@ python do_sbom_cve_check() {
 addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_build
 
 SSTATETASKS += "do_sbom_cve_check"
-SSTATE_SKIP_CREATION:task-sbom-cve-check = "1"
 do_sbom_cve_check[cleandirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
 do_sbom_cve_check[sstate-inputdirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
 do_sbom_cve_check[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
-do_sbom_cve_check[recrdeptask] += "do_create_image_sbom_spdx"
 do_sbom_cve_check[depends] += " \
     python3-sbom-cve-check-native:do_populate_sysroot \
     ${@oe.utils.conditional('SBOM_CVE_CHECK_ALLOW_NETWORK','0',' \
-        sbom-cve-check-update-cvelist-native:do_fetch \
-        sbom-cve-check-update-nvd-native:do_fetch \
+        sbom-cve-check-update-cvelist-native:do_populate_sysroot \
+        sbom-cve-check-update-nvd-native:do_populate_sysroot \
     ','',d)} \
 "
 
 do_sbom_cve_check[network] = "${SBOM_CVE_CHECK_ALLOW_NETWORK}"
-do_sbom_cve_check[nostamp] = "1"
+
+python do_sbom_cve_check_setscene() {
+    sstate_setscene(d)
+}
+addtask do_sbom_cve_check_setscene
diff --git a/meta/recipes-core/meta/sbom-cve-check-config.inc b/meta/recipes-core/meta/sbom-cve-check-config.inc
new file mode 100644
index 000000000000..a1a909e22250
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-config.inc
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: MIT
+
+SBOM_CVE_CHECK_DATABASES_DIR ??= "${DEPLOY_DIR}/sbom_cve_check/databases"
+SBOM_CVE_CHECK_DATABASES_DIR[doc] = "Download directory path where to store the CVE databases"
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
index cd5ed680b4dd..fb213e238ed1 100644
--- a/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
@@ -1,7 +1,12 @@
 SUMMARY = "Updates the CVE List database"
 LICENSE = "MIT"
 
-SBOM_CVE_CHECK_FETCH_PATH = "${DL_DIR}/sbom_cve_check/databases/cvelist"
-SBOM_CVE_CHECK_FETCH_URL = "https://github.com/CVEProject/cvelistV5.git"
+HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
+SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https"
+SRCREV = "${AUTOREV}"
+SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-inherit sbom-cve-check-update-db
+# FIXME
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-db.inc b/meta/recipes-core/meta/sbom-cve-check-update-db.inc
new file mode 100644
index 000000000000..5ecb79820247
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-db.inc
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: MIT
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit native
+require sbom-cve-check-config.inc
+
+SBOM_CVE_CHECK_DB_NAME[doc] = "Database name, which is the Git repository directory name. \
+    The git repository will be stored in ${SBOM_CVE_CHECK_DATABASES_DIR)/"
+
+DEPENDS += "rsync-native"
+
+# Leverage BitBake's checksum computation for populated sysroot files to determine
+# whether other recipe tasks dependent on this output need to be re-executed.
+do_compile() {
+    git -C "${S}" rev-parse --verify "HEAD^{object}" > "${WORKDIR}/${SBOM_CVE_CHECK_DB_NAME}.rev"
+}
+
+# In the install task, also deploy directly to ${DEPLOY_DIR} using rsync.
+# This is an hack, we are not using do_deploy to prevent multiple unecessary copy of the CVE database.
+do_install() {
+    install -m 644 -D -t "${D}${datadir}/sbom_cve_check/databases/" "${WORKDIR}/${SBOM_CVE_CHECK_DB_NAME}.rev"
+
+    dst="${SBOM_CVE_CHECK_DATABASES_DIR}/${SBOM_CVE_CHECK_DB_NAME}"
+    mkdir -p "$dst"
+    rsync -aH --delete --link-dest="${S}/" "${S}/" "${dst}/"
+}
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
index 7add8e6bfba5..2ed52f7a518a 100644
--- a/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
@@ -1,7 +1,12 @@
 SUMMARY = "Updates the NVD CVE database"
 LICENSE = "MIT"
 
-SBOM_CVE_CHECK_FETCH_PATH = "${DL_DIR}/sbom_cve_check/databases/nvd-fkie"
-SBOM_CVE_CHECK_FETCH_URL = "https://github.com/fkie-cad/nvd-json-data-feeds.git"
+HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
+SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https"
+SRCREV = "${AUTOREV}"
+SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-inherit sbom-cve-check-update-db
+# FIXME
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+require sbom-cve-check-update-db.inc

-- 
2.53.0


