Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774BF1049515
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:20:08 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17905.1773224402795268239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Sk9edmGT;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8FD704E42616;
	Wed, 11 Mar 2026 10:20:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66B9C60004;
	Wed, 11 Mar 2026 10:20:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B7DBE10369CBA;
	Wed, 11 Mar 2026 11:19:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773224399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k6FSRcEQgCOD1NdA9N1Qg3Eb6PsZ6ZEh46C2HEF3lkA=;
	b=Sk9edmGTuzk5uYko27Y/3gZG6yWhNlwd2qKC1vI72RB9l9JlgQUJ7RMADyP9Rty2QrrlTQ
	IbK0HvAER86RCEsKY8vu5pgERqSW8B4f+e50Kx3M6ChBoVkG0uZ0G7rMfGbt6w3x4QipUj
	fpzOqi9J+hE0SqcuRRYD05lVXHLYycd7WD/lcJde7w2rOO4PJ4hRxSRoLvHr6/oM9ov/cw
	q+j8UbJ3NZ+5hRpxu7sWNPOPFTYGfuHMTzIjhYcK0OxI51mNjdNY6Nw+czO1Uv46EF+BGC
	EjUWc+GZ+Y9W/ioVd05bZWs4JYl7RhpVfKBdsZjkfEU+Q35a88tc7lBbJvnhVg==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 11 Mar 2026 11:19:42 +0100
Subject: [PATCH v4] sbom-cve-check: Add class for post-build CVE analysis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260311-add-sbom-cve-check-v4-1-f4e6c4cee8ca@bootlin.com>
References: <20260311-add-sbom-cve-check-v4-0-f4e6c4cee8ca@bootlin.com>
In-Reply-To: <20260311-add-sbom-cve-check-v4-0-f4e6c4cee8ca@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 10:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232862

By default, the sbom-cve-check class generates these export files:
 - A JSON in `cve-check` format, named `${IMAGE_NAME}.cve-check.json`
 - An SPDX 3.0 SBOM, named `${IMAGE_NAME}.cve-check.spdx.json`.

An user can add or remove export file formats by using the
`SBOM_CVE_CHECK_EXPORT_VARS` variables.

By default, the CVE databases are downloaded using the following
recipes:
 - sbom-cve-check-update-cvelist-native.bb
 - sbom-cve-check-update-nvd-native.bb

The database download logic is implemented in sbom-cve-check-update-db.in=
c
The CVE databases are stored in the download directory (`DL_DIR`) by
default. This can be configured by the `SBOM_CVE_CHECK_DATABASES_DIR`
variable.

Access to the database is managed using an exclusive file lock (`flock`)
on the directory. During CVE analysis, sbom-cve-check acquires a shared
lock, allowing multiple analyses to run in parallel. However, if the
database is being updated, any ongoing CVE analysis is temporarily
paused.

This design ensures that, under normal circumstances, `sbom-cve-check`
can run without requiring network access. If a user needs network
access during execution (e.g., to download annotation databases),
they can set `SBOM_CVE_CHECK_ALLOW_NETWORK` to "1".

The CVE analysis runs only if either the original SBOM changes or the
CVE databases are updated. In the two CVE database-fetching recipes,
a file in the sysroot is written, containing the Git revision of the
fetched CVE database. This leverages BitBake's checksum computation for
sysroot files to determine if dependent tasks need re-execution.

Execute `sbom-cve-check` with the generated VEX manifest only if
enabled and if `SPDX_INCLUDE_VEX` is set to a value other than "all".
When `SPDX_INCLUDE_VEX=3Dall`, the SPDX 3.0 file already contains all
the necessary information for CVE analysis, making the VEX manifest
redundant.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass         | 115 +++++++++++++++=
++++++
 meta/conf/distro/include/maintainers.inc           |   2 +
 meta/recipes-core/meta/sbom-cve-check-config.inc   |   4 +
 .../meta/sbom-cve-check-update-cvelist-native.bb   |   8 ++
 .../recipes-core/meta/sbom-cve-check-update-db.inc |  98 +++++++++++++++=
+++
 .../meta/sbom-cve-check-update-nvd-native.bb       |   8 ++
 6 files changed, 235 insertions(+)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
new file mode 100644
index 000000000000..3709fa98d97e
--- /dev/null
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: MIT
+
+require recipes-core/meta/sbom-cve-check-config.inc
+
+SBOM_CVE_CHECK_DEPLOYDIR =3D "${WORKDIR}/sbom_cve_check/image-deploy"
+
+SBOM_CVE_CHECK_EXTRA_ARGS[doc] =3D "Allow to specify extra arguments to =
sbom-cve-check. \
+    For example to add export flags for filtering (e.g., only export vul=
nerable CVEs). \
+"
+SBOM_CVE_CHECK_EXTRA_ARGS ??=3D ""
+
+SBOM_CVE_CHECK_EXPORT_VARS[doc] =3D "List of variables that declare expo=
rt files to generate. \
+    Each variable must have a 'type' and an 'ext' flag set. \
+    The 'type' flag contains the value that is passed to the --export-ty=
pe command flags. \
+    The 'ext' flag contains the filename extension (suffix). The output =
filename is going \
+    to be ${IMAGE_NAME}${ext} \
+"
+SBOM_CVE_CHECK_EXPORT_VARS ?=3D "SBOM_CVE_CHECK_EXPORT_SPDX3 SBOM_CVE_CH=
ECK_EXPORT_CVECHECK"
+
+SBOM_CVE_CHECK_EXPORT_SPDX3[doc] =3D "Export configuration to generate a=
n SPDX3 SBOM file, \
+    with the following name: ${IMAGE_NAME}.cve-check.spdx.json \
+"
+SBOM_CVE_CHECK_EXPORT_SPDX3[type] ?=3D "spdx3"
+SBOM_CVE_CHECK_EXPORT_SPDX3[ext] ?=3D ".cve-check.spdx.json"
+
+SBOM_CVE_CHECK_EXPORT_CVECHECK[doc] =3D "Export configuration to generat=
e a JSON manifest \
+    in the same format as the cve-check class, with the following name: =
\
+    ${IMAGE_NAME}.cve-check.json \
+"
+SBOM_CVE_CHECK_EXPORT_CVECHECK[type] ?=3D "yocto-cve-check-manifest"
+SBOM_CVE_CHECK_EXPORT_CVECHECK[ext] ?=3D ".cve-check.json"
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
+    if not bb.data.inherits_class("create-spdx-3.0", d):
+        bb.fatal("Cannot execute sbom-cve-check missing create-spdx-3.0 =
inherit.")
+
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.=
json")
+    vex_manifest_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAM=
E}.json")
+    dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DATABASES_DIR")
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
+    ]
+
+    # Assume that SPDX_INCLUDE_VEX is set globally to "all", and not onl=
y for the
+    # image recipe, which is very unlikely. This is not an issue to incl=
ude the
+    # VEX manifest even if not needed.
+    if bb.data.inherits_class("vex", d) and d.getVar("SPDX_INCLUDE_VEX")=
 !=3D "all":
+        cmd_args.extend(["--yocto-vex-manifest", vex_manifest_path])
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
+        bb.error(f"sbom-cve-check failed: {e}")
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
+do_sbom_cve_check[cleandirs] =3D "${SBOM_CVE_CHECK_DEPLOYDIR}"
+do_sbom_cve_check[sstate-inputdirs] =3D "${SBOM_CVE_CHECK_DEPLOYDIR}"
+do_sbom_cve_check[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
+do_sbom_cve_check[depends] +=3D " \
+    python3-sbom-cve-check-native:do_populate_sysroot \
+    ${@oe.utils.conditional('SBOM_CVE_CHECK_ALLOW_NETWORK','0',' \
+        sbom-cve-check-update-cvelist-native:do_populate_sysroot \
+        sbom-cve-check-update-nvd-native:do_populate_sysroot \
+    ','',d)} \
+"
+
+do_sbom_cve_check[network] =3D "${SBOM_CVE_CHECK_ALLOW_NETWORK}"
+
+python do_sbom_cve_check_setscene() {
+    sstate_setscene(d)
+}
+addtask do_sbom_cve_check_setscene
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 3c7fc4974de3..71e5d77cb7d6 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -790,6 +790,8 @@ RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <sim=
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
diff --git a/meta/recipes-core/meta/sbom-cve-check-config.inc b/meta/reci=
pes-core/meta/sbom-cve-check-config.inc
new file mode 100644
index 000000000000..a2a645825878
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-config.inc
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: MIT
+
+SBOM_CVE_CHECK_DATABASES_DIR ??=3D "${DL_DIR}/sbom_cve_check/databases"
+SBOM_CVE_CHECK_DATABASES_DIR[doc] =3D "Download directory path where to =
store the CVE databases"
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.=
bb b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
new file mode 100644
index 000000000000..75f7370839e6
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
@@ -0,0 +1,8 @@
+SUMMARY =3D "Updates the CVE List database"
+LICENSE =3D "MIT"
+
+HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
+SBOM_CVE_CHECK_DB_NAME =3D "cvelist"
+SBOM_CVE_CHECK_FETCH_URL =3D "https://github.com/CVEProject/cvelistV5.gi=
t"
+
+require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-db.inc b/meta/r=
ecipes-core/meta/sbom-cve-check-update-db.inc
new file mode 100644
index 000000000000..8f384fa80d47
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-db.inc
@@ -0,0 +1,98 @@
+# SPDX-License-Identifier: MIT
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+EXCLUDE_FROM_WORLD =3D "1"
+
+inherit native
+require sbom-cve-check-config.inc
+
+SBOM_CVE_CHECK_DB_NAME[doc] =3D "Database name, which is the Git reposit=
ory directory name. \
+    The git repository will be stored in ${SBOM_CVE_CHECK_DATABASES_DIR)=
/"
+
+SBOM_CVE_CHECK_FETCH_URL[doc] =3D "Git clone URL of the CVE database"
+
+SBOM_CVE_CHECK_FETCH_INTERVAL ??=3D "57600"
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
+    git_name =3D d.getVar("SBOM_CVE_CHECK_DB_NAME")
+    git_dir =3D pathlib.Path(d.getVar("SBOM_CVE_CHECK_DATABASES_DIR")).j=
oinpath(git_name)
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
+        # Check if an update is necessary
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
+do_fetch[vardeps] +=3D " \
+    SBOM_CVE_CHECK_DATABASES_DIR \
+    SBOM_CVE_CHECK_DB_NAME \
+    SBOM_CVE_CHECK_FETCH_URL \
+    SBOM_CVE_CHECK_FETCH_INTERVAL \
+"
+
+do_fetch[nostamp] =3D "1"
+
+# Leverage BitBake's checksum computation for populated sysroot files to=
 determine
+# whether other recipe tasks dependent on this output need to be re-exec=
uted.
+# This serves as a workaround to avoid unnecessary runs of `sbom-cve-che=
ck` when
+# the database remains unchanged, given that `do_fetch[nostamp] =3D "1"`=
 is set.
+do_compile() {
+    git_dir=3D"${SBOM_CVE_CHECK_DATABASES_DIR}/${SBOM_CVE_CHECK_DB_NAME}=
"
+    git -C "${git_dir}" rev-parse --verify "HEAD^{object}" > "${S}/${SBO=
M_CVE_CHECK_DB_NAME}.rev"
+}
+
+do_install() {
+    install -m 644 -D -t "${D}${datadir}/sbom_cve_check/databases/" "${S=
}/${SBOM_CVE_CHECK_DB_NAME}.rev"
+}
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb b=
/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
new file mode 100644
index 000000000000..fb7b304ac7e7
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
@@ -0,0 +1,8 @@
+SUMMARY =3D "Updates the NVD CVE database"
+LICENSE =3D "MIT"
+
+HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-feeds"
+SBOM_CVE_CHECK_DB_NAME =3D "nvd-fkie"
+SBOM_CVE_CHECK_FETCH_URL =3D "https://github.com/fkie-cad/nvd-json-data-=
feeds.git"
+
+require sbom-cve-check-update-db.inc

--=20
2.53.0


