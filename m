Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693D7FD3755
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 12:37:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44226.1772023013544869206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 04:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=RVuO6iMb;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDE904E4111D;
	Wed, 25 Feb 2026 12:36:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A05C5FDE6;
	Wed, 25 Feb 2026 12:36:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F095C10368F91;
	Wed, 25 Feb 2026 13:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772023010; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E4TIDxTF8IauJZiTMNW4O/dPoefhxFJ30eZDsQM79C4=;
	b=RVuO6iMbI4qz8Vxbs7vFiaBYD/PzZa+C67nh/FsE6FuqSMBw1iveVsj+7jf+AUy7ueDTCL
	q/3JX7XiFesdRDV4Lvuuh2ORYqkm2cKm1zhJsSmjo8dllfxnXaFKAeflKuWy2Joxk08WvH
	eD6DZZ9rHEpGIcmYRGLDoPkShNnxFujZonf0+GG2WqaJRTPXVPmmPfqmfZ+nsMM+QfpkhG
	tYuN5y3XUHom3grVP9Hx6ILaPrWe19Gxg/nCmuQZUt79nU8AhO5Xxyv3v3apfcXXDHqwQ8
	zifK1k/A2VwjbK6yGlcztAHcJFkZTMjxB2xg68NhlH6Vn46GKj+sIg3f1MZuHw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 25 Feb 2026 13:36:34 +0100
Subject: [PATCH v2 6/6] sbom-cve-check.bbclass: Add class for post-build
 CVE analysis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-add-sbom-cve-check-v2-6-eeffa285b901@bootlin.com>
References: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
In-Reply-To: <20260225-add-sbom-cve-check-v2-0-eeffa285b901@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 12:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231962

By default, the CVE databases are downloaded using the following
recipes:
 - sbom-cve-check-update-cvelist-native.bb
 - sbom-cve-check-update-nvd-native.bb

The database download logic is implemented in
sbom-cve-check-update-db.bbclass. The CVE databases are stored in the
download directory (`DL_DIR`). Access to the database is managed using
an exclusive file lock (`flock`) on the directory. During CVE analysis,
sbom-cve-check acquires a shared lock, allowing multiple analyses to
run in parallel. However, if the database is being updated, any
ongoing CVE analysis is temporarily paused.

This design ensures that, under normal circumstances, sbom-cve-check
can run without requiring network access. If a user needs network
access during execution (e.g., to download annotation databases),
they can set `SBOM_CVE_CHECK_ALLOW_NETWORK` to "1".

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check-update-db.bbclass               | 87 ++++++++++++++++++++
 meta/classes-recipe/sbom-cve-check.bbclass         | 96 ++++++++++++++++++++++
 .../meta/sbom-cve-check-update-cvelist-native.bb   |  7 ++
 .../meta/sbom-cve-check-update-nvd-native.bb       |  7 ++
 4 files changed, 197 insertions(+)

diff --git a/meta/classes-recipe/sbom-cve-check-update-db.bbclass b/meta/classes-recipe/sbom-cve-check-update-db.bbclass
new file mode 100644
index 000000000000..4f62c831eb72
--- /dev/null
+++ b/meta/classes-recipe/sbom-cve-check-update-db.bbclass
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: MIT
+
+INHIBIT_DEFAULT_DEPS = "1"
+EXCLUDE_FROM_WORLD = "1"
+
+inherit native
+
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+SBOM_CVE_CHECK_FETCH_PATH[doc] = "Path to the Git repository to be downloaded. \
+    Should be prefixed by {DL_DIR}/sbom_cve_check/databases/"
+
+SBOM_CVE_CHECK_FETCH_URL[doc] = "Git clone URL of the CVE database"
+
+SBOM_CVE_CHECK_FETCH_INTERVAL ?= "57600"
+SBOM_CVE_CHECK_FETCH_INTERVAL[doc] = "\
+    CVE database update interval, in seconds. By default every 16 hours. \
+    Use 0 to force the update. Use a negative value to skip the update. \
+"
+
+python do_fetch() {
+    from datetime import datetime, timezone, timedelta
+    import fcntl
+    import os
+    import pathlib
+    import subprocess
+
+    bb.utils.export_proxies(d)
+
+    fetch_interval = int(d.get("SBOM_CVE_CHECK_FETCH_INTERVAL"))
+    git_url = d.getVar("SBOM_CVE_CHECK_FETCH_URL")
+    git_dir = pathlib.Path(d.getVar("SBOM_CVE_CHECK_FETCH_PATH"))
+    git_dir.mkdir(parents=True, exist_ok=True)
+
+    def _exec_git_cmd(args):
+        cmd = ["git"]
+        cmd.extend(args)
+        return subprocess.run(
+            cmd,
+            input="",
+            capture_output=True,
+            check=True,
+            cwd=git_dir,
+            encoding="utf-8",
+        )
+
+    # Lock the git directory: take an exclusive lock
+    lock_fd = os.open(git_dir, os.O_RDONLY | os.O_NOCTTY)
+    try:
+        fcntl.flock(lock_fd, fcntl.LOCK_EX)
+
+        # Clone the git repository if it does not exist
+        if not git_dir.joinpath(".git", "HEAD").is_file():
+            _exec_git_cmd(["clone", "--depth", "1", "--single-branch", git_url, "."])
+            return
+
+        # Check if an updated is necessary
+        if fetch_interval < 0:
+            return
+
+        if fetch_interval > 0:
+            # Get date of last commit
+            r = _exec_git_cmd(["show", "-s", "--format=%ct", "HEAD"])
+            commit_date = datetime.fromtimestamp(int(r.stdout.strip()), tz=timezone.utc)
+            delta_last_commit = datetime.now(timezone.utc) - commit_date
+            if delta_last_commit < timedelta(seconds=fetch_interval):
+                return
+
+        _exec_git_cmd(["pull"])
+    except subprocess.SubprocessError as e:
+        bb.error(f"{e.cmd} failed:\n{e.stdout}\n---\n{e.stderr}\n")
+    finally:
+        # Release the exclusive lock
+        os.close(lock_fd)
+}
+
+do_fetch[file-checksums] = ""
+do_fetch[vardeps] = " \
+    SBOM_CVE_CHECK_FETCH_PATH \
+    SBOM_CVE_CHECK_FETCH_URL \
+    SBOM_CVE_CHECK_FETCH_INTERVAL \
+"
+do_fetch[nostamp] = "1"
diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-recipe/sbom-cve-check.bbclass
new file mode 100644
index 000000000000..86e06bdf7c23
--- /dev/null
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: MIT
+
+SBOM_CVE_CHECK_WORKDIR ??= "${WORKDIR}/sbom_cve_check"
+SBOM_CVE_CHECK_DEPLOYDIR = "${SBOM_CVE_CHECK_WORKDIR}/image-deploy"
+
+SBOM_CVE_CHECK_EXTRA_ARGS[doc] = "Allow to specify extra arguments to sbom-cve-check. For example to add filtering"
+SBOM_CVE_CHECK_EXTRA_ARGS ?= ""
+
+SBOM_CVE_CHECK_EXPORT_VARS[doc] = "List of variables that declare export files to generate. Each variable must have a 'type' and an 'ext' flag set"
+SBOM_CVE_CHECK_EXPORT_VARS ?= "SBOM_CVE_CHECK_EXPORT_FILE"
+
+SBOM_CVE_CHECK_EXPORT_FILE[doc] = "Default configuration of generated export file"
+SBOM_CVE_CHECK_EXPORT_FILE[type] ?= "spdx3"
+SBOM_CVE_CHECK_EXPORT_FILE[ext] ?= ".cve-check.spdx.json"
+
+SBOM_CVE_CHECK_ALLOW_NETWORK[doc] = "Set to 1 to enable network usage."
+SBOM_CVE_CHECK_ALLOW_NETWORK ?= "0"
+
+python do_sbom_cve_check() {
+    """
+    Task: Run sbom-cve-check analysis on SBOM.
+    """
+    import os
+    import bb
+    from oe.cve_check import update_symlinks
+
+    if not bb.data.inherits_class("vex", d):
+        bb.fatal("Cannot execute sbom-cve-check missing vex inherit.")
+    if not bb.data.inherits_class("create-spdx-3.0", d):
+        bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 inherit.")
+
+    sbom_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.json")
+    vex_manifest_path = d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.json")
+    dl_db_dir = d.expand("${DL_DIR}/sbom_cve_check/databases")
+    deploy_dir = d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
+    img_link_name = d.getVar("IMAGE_LINK_NAME")
+    img_name = d.getVar("IMAGE_NAME")
+
+    export_files = []
+    for export_var in d.getVar("SBOM_CVE_CHECK_EXPORT_VARS").split():
+        export_ext = d.getVarFlag(export_var, "ext")
+        export_path = f"{deploy_dir}/{img_name}{export_ext}"
+        export_link = f"{deploy_dir}/{img_link_name}{export_ext}"
+        export_type = d.getVarFlag(export_var, "type")
+        export_files.append((export_type, export_path, export_link))
+
+    cmd_env = os.environ.copy()
+    cmd_env["SBOM_CVE_CHECK_DATABASES_DIR"] = dl_db_dir
+
+    cmd_args = [
+        d.expand("${STAGING_BINDIR_NATIVE}/sbom-cve-check"),
+        "--sbom-path",
+        sbom_path,
+        "--yocto-vex-manifest",
+        vex_manifest_path,
+    ]
+
+    for export_file in export_files:
+        cmd_args.extend(
+            ["--export-type", export_file[0], "--export-path", export_file[1]]
+        )
+
+    cmd_args.extend(d.getVar("SBOM_CVE_CHECK_EXTRA_ARGS").split())
+
+    try:
+        bb.note("Running: {}".format(" ".join(cmd_args)))
+        bb.process.run(cmd_args, env=cmd_env)
+    except bb.process.ExecutionError as e:
+        bb.fatal(
+            f"sbom-cve-check failed with exit code {e.exitcode}\n{e.stdout}\n{e.stderr}"
+        )
+        return
+
+    for export_file in export_files:
+        bb.note(f"sbom-cve-check exported: {export_file[1]}")
+        update_symlinks(export_file[1], export_file[2])
+}
+
+addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_build
+
+SSTATETASKS += "do_sbom_cve_check"
+SSTATE_SKIP_CREATION:task-sbom-cve-check = "1"
+do_sbom_cve_check[cleandirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
+do_sbom_cve_check[sstate-inputdirs] = "${SBOM_CVE_CHECK_DEPLOYDIR}"
+do_sbom_cve_check[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_sbom_cve_check[recrdeptask] += "do_create_image_sbom_spdx"
+do_sbom_cve_check[depends] += " \
+    python3-sbom-cve-check-native:do_populate_sysroot \
+    ${@oe.utils.conditional('SBOM_CVE_CHECK_ALLOW_NETWORK','0',' \
+        sbom-cve-check-update-cvelist-native:do_fetch \
+        sbom-cve-check-update-nvd-native:do_fetch \
+    ','',d)} \
+"
+
+do_sbom_cve_check[network] = "${SBOM_CVE_CHECK_ALLOW_NETWORK}"
+do_sbom_cve_check[nostamp] = "1"
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
new file mode 100644
index 000000000000..cd5ed680b4dd
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
@@ -0,0 +1,7 @@
+SUMMARY = "Updates the CVE List database"
+LICENSE = "MIT"
+
+SBOM_CVE_CHECK_FETCH_PATH = "${DL_DIR}/sbom_cve_check/databases/cvelist"
+SBOM_CVE_CHECK_FETCH_URL = "https://github.com/CVEProject/cvelistV5.git"
+
+inherit sbom-cve-check-update-db
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
new file mode 100644
index 000000000000..7add8e6bfba5
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
@@ -0,0 +1,7 @@
+SUMMARY = "Updates the NVD CVE database"
+LICENSE = "MIT"
+
+SBOM_CVE_CHECK_FETCH_PATH = "${DL_DIR}/sbom_cve_check/databases/nvd-fkie"
+SBOM_CVE_CHECK_FETCH_URL = "https://github.com/fkie-cad/nvd-json-data-feeds.git"
+
+inherit sbom-cve-check-update-db

-- 
2.53.0


