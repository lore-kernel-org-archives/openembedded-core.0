Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A77FD8FDA
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 17:02:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74948.1772125319174455010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 09:01:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=uDiQBNIi;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A792B1A1577;
	Thu, 26 Feb 2026 17:01:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7179C5FDE9;
	Thu, 26 Feb 2026 17:01:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2643110369405;
	Thu, 26 Feb 2026 18:01:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772125314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S39Ozp0RUOVaHqXoLtnsAe3rB/X3kPqrr7u8eOK7kak=;
	b=uDiQBNIijuC5OArwlQH0zHmklHqaBZxKDBC1Xz4LcnyHOuD3zpJ9uJoBAtrOymmjPXOwP5
	4ur3TRo6ryP9DIPksvT7I3K+1Esyew2yrNgx1e0fMXmfPFWvCmAQulDqZQoKEGKuBlJ2KL
	oxdIYQGQfLBwsi716dR0QUeIqmBW4AElRYFLCmfbri5lFfFnA1E1/237aJ5TlGeo/Z/Vlq
	/YuL++Vg4QgcRwnwaPmDgBUTJ/qhGpBRpZWOrK8bkRc98bV7BN55ejj80SdA+z6QTCCean
	tSghEwhUV2BlLVbOx22xEAUAseZhoPoXZuSlHhmKQfuuu2jQZqlAwXiGGxQD3w==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Thu, 26 Feb 2026 18:01:20 +0100
Subject: [PATCH v3 6/6] sbom-cve-check.bbclass: Add class for post-build
 CVE analysis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260226-add-sbom-cve-check-v3-6-2e60423f4d35@bootlin.com>
References: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
In-Reply-To: <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 17:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232045

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
 .../sbom-cve-check-update-db.bbclass               | 87 ++++++++++++++++=
++++
 meta/classes-recipe/sbom-cve-check.bbclass         | 96 ++++++++++++++++=
++++++
 meta/conf/distro/include/maintainers.inc           |  2 +
 .../meta/sbom-cve-check-update-cvelist-native.bb   |  7 ++
 .../meta/sbom-cve-check-update-nvd-native.bb       |  7 ++
 5 files changed, 199 insertions(+)

diff --git a/meta/classes-recipe/sbom-cve-check-update-db.bbclass b/meta/=
classes-recipe/sbom-cve-check-update-db.bbclass
new file mode 100644
index 000000000000..4f62c831eb72
--- /dev/null
+++ b/meta/classes-recipe/sbom-cve-check-update-db.bbclass
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: MIT
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit native
+
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+SBOM_CVE_CHECK_FETCH_PATH[doc] =3D "Path to the Git repository to be dow=
nloaded. \
+    Should be prefixed by {DL_DIR}/sbom_cve_check/databases/"
+
+SBOM_CVE_CHECK_FETCH_URL[doc] =3D "Git clone URL of the CVE database"
+
+SBOM_CVE_CHECK_FETCH_INTERVAL ?=3D "57600"
+SBOM_CVE_CHECK_FETCH_INTERVAL[doc] =3D "\
+    CVE database update interval, in seconds. By default every 16 hours.=
 \
+    Use 0 to force the update. Use a negative value to skip the update. =
\
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
+    fetch_interval =3D int(d.get("SBOM_CVE_CHECK_FETCH_INTERVAL"))
+    git_url =3D d.getVar("SBOM_CVE_CHECK_FETCH_URL")
+    git_dir =3D pathlib.Path(d.getVar("SBOM_CVE_CHECK_FETCH_PATH"))
+    git_dir.mkdir(parents=3DTrue, exist_ok=3DTrue)
+
+    def _exec_git_cmd(args):
+        cmd =3D ["git"]
+        cmd.extend(args)
+        return subprocess.run(
+            cmd,
+            input=3D"",
+            capture_output=3DTrue,
+            check=3DTrue,
+            cwd=3Dgit_dir,
+            encoding=3D"utf-8",
+        )
+
+    # Lock the git directory: take an exclusive lock
+    lock_fd =3D os.open(git_dir, os.O_RDONLY | os.O_NOCTTY)
+    try:
+        fcntl.flock(lock_fd, fcntl.LOCK_EX)
+
+        # Clone the git repository if it does not exist
+        if not git_dir.joinpath(".git", "HEAD").is_file():
+            _exec_git_cmd(["clone", "--depth", "1", "--single-branch", g=
it_url, "."])
+            return
+
+        # Check if an updated is necessary
+        if fetch_interval < 0:
+            return
+
+        if fetch_interval > 0:
+            # Get date of last commit
+            r =3D _exec_git_cmd(["show", "-s", "--format=3D%ct", "HEAD"]=
)
+            commit_date =3D datetime.fromtimestamp(int(r.stdout.strip())=
, tz=3Dtimezone.utc)
+            delta_last_commit =3D datetime.now(timezone.utc) - commit_da=
te
+            if delta_last_commit < timedelta(seconds=3Dfetch_interval):
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
+do_fetch[file-checksums] =3D ""
+do_fetch[vardeps] =3D " \
+    SBOM_CVE_CHECK_FETCH_PATH \
+    SBOM_CVE_CHECK_FETCH_URL \
+    SBOM_CVE_CHECK_FETCH_INTERVAL \
+"
+do_fetch[nostamp] =3D "1"
diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
new file mode 100644
index 000000000000..86e06bdf7c23
--- /dev/null
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: MIT
+
+SBOM_CVE_CHECK_WORKDIR ??=3D "${WORKDIR}/sbom_cve_check"
+SBOM_CVE_CHECK_DEPLOYDIR =3D "${SBOM_CVE_CHECK_WORKDIR}/image-deploy"
+
+SBOM_CVE_CHECK_EXTRA_ARGS[doc] =3D "Allow to specify extra arguments to =
sbom-cve-check. For example to add filtering"
+SBOM_CVE_CHECK_EXTRA_ARGS ?=3D ""
+
+SBOM_CVE_CHECK_EXPORT_VARS[doc] =3D "List of variables that declare expo=
rt files to generate. Each variable must have a 'type' and an 'ext' flag =
set"
+SBOM_CVE_CHECK_EXPORT_VARS ?=3D "SBOM_CVE_CHECK_EXPORT_FILE"
+
+SBOM_CVE_CHECK_EXPORT_FILE[doc] =3D "Default configuration of generated =
export file"
+SBOM_CVE_CHECK_EXPORT_FILE[type] ?=3D "spdx3"
+SBOM_CVE_CHECK_EXPORT_FILE[ext] ?=3D ".cve-check.spdx.json"
+
+SBOM_CVE_CHECK_ALLOW_NETWORK[doc] =3D "Set to 1 to enable network usage.=
"
+SBOM_CVE_CHECK_ALLOW_NETWORK ?=3D "0"
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
+        bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 =
inherit.")
+
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
+    vex_manifest_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAM=
E}.json")
+    dl_db_dir =3D d.expand("${DL_DIR}/sbom_cve_check/databases")
+    deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
+    img_link_name =3D d.getVar("IMAGE_LINK_NAME")
+    img_name =3D d.getVar("IMAGE_NAME")
+
+    export_files =3D []
+    for export_var in d.getVar("SBOM_CVE_CHECK_EXPORT_VARS").split():
+        export_ext =3D d.getVarFlag(export_var, "ext")
+        export_path =3D f"{deploy_dir}/{img_name}{export_ext}"
+        export_link =3D f"{deploy_dir}/{img_link_name}{export_ext}"
+        export_type =3D d.getVarFlag(export_var, "type")
+        export_files.append((export_type, export_path, export_link))
+
+    cmd_env =3D os.environ.copy()
+    cmd_env["SBOM_CVE_CHECK_DATABASES_DIR"] =3D dl_db_dir
+
+    cmd_args =3D [
+        d.expand("${STAGING_BINDIR_NATIVE}/sbom-cve-check"),
+        "--sbom-path",
+        sbom_path,
+        "--yocto-vex-manifest",
+        vex_manifest_path,
+    ]
+
+    for export_file in export_files:
+        cmd_args.extend(
+            ["--export-type", export_file[0], "--export-path", export_fi=
le[1]]
+        )
+
+    cmd_args.extend(d.getVar("SBOM_CVE_CHECK_EXTRA_ARGS").split())
+
+    try:
+        bb.note("Running: {}".format(" ".join(cmd_args)))
+        bb.process.run(cmd_args, env=3Dcmd_env)
+    except bb.process.ExecutionError as e:
+        bb.fatal(
+            f"sbom-cve-check failed with exit code {e.exitcode}\n{e.stdo=
ut}\n{e.stderr}"
+        )
+        return
+
+    for export_file in export_files:
+        bb.note(f"sbom-cve-check exported: {export_file[1]}")
+        update_symlinks(export_file[1], export_file[2])
+}
+
+addtask do_sbom_cve_check after do_create_image_sbom_spdx before do_buil=
d
+
+SSTATETASKS +=3D "do_sbom_cve_check"
+SSTATE_SKIP_CREATION:task-sbom-cve-check =3D "1"
+do_sbom_cve_check[cleandirs] =3D "${SBOM_CVE_CHECK_DEPLOYDIR}"
+do_sbom_cve_check[sstate-inputdirs] =3D "${SBOM_CVE_CHECK_DEPLOYDIR}"
+do_sbom_cve_check[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
+do_sbom_cve_check[recrdeptask] +=3D "do_create_image_sbom_spdx"
+do_sbom_cve_check[depends] +=3D " \
+    python3-sbom-cve-check-native:do_populate_sysroot \
+    ${@oe.utils.conditional('SBOM_CVE_CHECK_ALLOW_NETWORK','0',' \
+        sbom-cve-check-update-cvelist-native:do_fetch \
+        sbom-cve-check-update-nvd-native:do_fetch \
+    ','',d)} \
+"
+
+do_sbom_cve_check[network] =3D "${SBOM_CVE_CHECK_ALLOW_NETWORK}"
+do_sbom_cve_check[nostamp] =3D "1"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index c43107ccdccd..a48db2df7b2f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -787,6 +787,8 @@ RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <sim=
one.p.weiss@posteo.com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
 RECIPE_MAINTAINER:pn-sbc =3D "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-sbom-cve-check-update-cvelist-native =3D "Benjamin =
Robin <benjamin.robin@bootlin.com>"
+RECIPE_MAINTAINER:pn-sbom-cve-check-update-nvd-native =3D "Benjamin Robi=
n <benjamin.robin@bootlin.com>"
 RECIPE_MAINTAINER:pn-scdoc =3D "Alex Kiernan <alex.kiernan@gmail.com>"
 RECIPE_MAINTAINER:pn-screen =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-seatd =3D "Unassigned <unassigned@yoctoproject.org>=
"
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.=
bb b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
new file mode 100644
index 000000000000..cd5ed680b4dd
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
@@ -0,0 +1,7 @@
+SUMMARY =3D "Updates the CVE List database"
+LICENSE =3D "MIT"
+
+SBOM_CVE_CHECK_FETCH_PATH =3D "${DL_DIR}/sbom_cve_check/databases/cvelis=
t"
+SBOM_CVE_CHECK_FETCH_URL =3D "https://github.com/CVEProject/cvelistV5.gi=
t"
+
+inherit sbom-cve-check-update-db
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb b=
/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
new file mode 100644
index 000000000000..7add8e6bfba5
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
@@ -0,0 +1,7 @@
+SUMMARY =3D "Updates the NVD CVE database"
+LICENSE =3D "MIT"
+
+SBOM_CVE_CHECK_FETCH_PATH =3D "${DL_DIR}/sbom_cve_check/databases/nvd-fk=
ie"
+SBOM_CVE_CHECK_FETCH_URL =3D "https://github.com/fkie-cad/nvd-json-data-=
feeds.git"
+
+inherit sbom-cve-check-update-db

--=20
2.53.0


