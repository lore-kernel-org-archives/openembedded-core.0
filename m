Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762EE1090244
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 15:42:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14183.1773934950761541609
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 08:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=wNNeeJmT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 386061A2ED9;
	Thu, 19 Mar 2026 15:42:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07B685FDEB;
	Thu, 19 Mar 2026 15:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8354610450A6A;
	Thu, 19 Mar 2026 16:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773934948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HDbei4Dd0GC4aqlvGCfrkqDCqAy8+fgdbjr8qespxnk=;
	b=wNNeeJmTikiekN5J3g8yaPaWU36qtUvzJnUHAAa2NZ/4/cQiPx2k3qBjAFBV1YOxlS5DB4
	lACxZ43CPU2HkmJ5JSTak8XpB/Q1dhUcWZUhCbyUoeYtkdVcFGku+GTAKDbLXJ5435zN41
	IY4J4dv8RUa8kfCHeUTx1kbrEzhNZm5RSdUZG3+IcfuAfw/Mvh5+TrvKhjrPcOz10CWWj3
	rybb6jv5avRT7CP8fXIBYzPlShvmZ4c99qpogwIF6rTbgfKPe7SZP6FZuAnLDHqnKznqu6
	DA7RfBGUhX0MeclaQlN+NVHwuefm3DVcW8O7fQo8/P2zdx2vYjRPotqpksT5lw==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Thu, 19 Mar 2026 16:42:21 +0100
Subject: [PATCH v6] sbom-cve-check: Add class for post-build CVE analysis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260319-add-sbom-cve-check-v6-1-cfc657daa6b7@bootlin.com>
References: <20260319-add-sbom-cve-check-v6-0-cfc657daa6b7@bootlin.com>
In-Reply-To: <20260319-add-sbom-cve-check-v6-0-cfc657daa6b7@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, rybczynska@gmail.com, 
 ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 15:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233533

By default, the sbom-cve-check class generates these export files:
 - A JSON in `cve-check` format, named `${IMAGE_NAME}.cve-check.json`
 - An SPDX 3.0 SBOM, named `${IMAGE_NAME}.cve-check.spdx.json`.

A user can add or remove export file formats by using the
`SBOM_CVE_CHECK_EXPORT_VARS` variable.

By default, the CVE databases are downloaded using the following
recipes:
 - sbom-cve-check-update-cvelist-native.bb
 - sbom-cve-check-update-nvd-native.bb

The database fetch and deploy logic is implemented in
sbom-cve-check-update-db.inc. The CVE databases are stored in the
download directory (`DL_DIR`) by default. This can be configured by
the `SBOM_CVE_CHECK_DATABASES_DIR` variable defined in
meta/recipes-core/meta/sbom-cve-check-config.inc.

The CVE git databases are fetched using the Bitbake fetcher. Currently,
Bitbake fetcher does not support a shallow clone that can be updated.
While `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the
download directory, which is inefficient for updates. For now, the git
database is fully fetched.

The `SRCREV` of the git database is set to a fixed version. A user can
override this by specifying any other version, or `AUTOREV` can be
specified.

To simplify the activation and configuration of sbom-cve-check, a
configuration fragment is provided with recommended default values.

`sbom-cve-check` is configured to run without requiring network access.
If a user needs network access during execution (e.g., to download
annotation databases), they can set `SBOM_CVE_CHECK_ALLOW_NETWORK`
to "1".

The CVE analysis runs only if either the original SBOM changes or the
CVE databases are updated. In the two CVE database-fetching recipes, a
file in the sysroot is written, containing the Git revision of the
fetched CVE database.

`sbom-cve-check` is executed with the generated VEX manifest only if
enabled and if `SPDX_INCLUDE_VEX` is set to a value other than "all".
When `SPDX_INCLUDE_VEX=3Dall`, the SPDX 3.0 file already contains all the
necessary information for CVE analysis, making the VEX manifest
redundant.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass         | 121 +++++++++++++++=
++++++
 meta/conf/distro/include/maintainers.inc           |   2 +
 meta/conf/fragments/yocto/sbom-cve-check.conf      |  14 +++
 meta/recipes-core/meta/sbom-cve-check-config.inc   |   4 +
 .../meta/sbom-cve-check-update-cvelist-native.bb   |  12 ++
 .../recipes-core/meta/sbom-cve-check-update-db.inc |  28 +++++
 .../meta/sbom-cve-check-update-nvd-native.bb       |  12 ++
 7 files changed, 193 insertions(+)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
new file mode 100644
index 000000000000..32f92a0bab29
--- /dev/null
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: MIT
+
+# To enable this class, it is recommended to add this to local.conf
+# OE_FRAGMENTS +=3D "core/yocto/sbom-cve-check"
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
+    if not int(d.getVar("SBOM_CVE_CHECK_ALLOW_NETWORK")):
+        cmd_args.append("--disable-auto-updates")
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
index c7a646a643e6..c8f215188f83 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -789,6 +789,8 @@ RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <sim=
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
diff --git a/meta/conf/fragments/yocto/sbom-cve-check.conf b/meta/conf/fr=
agments/yocto/sbom-cve-check.conf
new file mode 100644
index 000000000000..a3f229acf28a
--- /dev/null
+++ b/meta/conf/fragments/yocto/sbom-cve-check.conf
@@ -0,0 +1,14 @@
+BB_CONF_FRAGMENT_SUMMARY =3D "This fragment enables sbom-cve-check with =
recommended default options"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Enables sbom-cve-check and applies the=
 following configurations: \
+ - Adds the sbom-cve-check class to IMAGE_CLASSES. \
+ - Configures CVE database recipes to fetch the latest git revision usin=
g AUTOREV. \
+ - Ensures generated SBOM includes all CVE annotations. \
+ - Configures the Linux kernel recipe to provide compiled sources, \
+   allowing CVEs to be excluded if the source is not compiled. \
+"
+
+IMAGE_CLASSES:append =3D " sbom-cve-check"
+SRCREV:pn-sbom-cve-check-update-nvd-native =3D "${AUTOREV}"
+SRCREV:pn-sbom-cve-check-update-cvelist-native =3D "${AUTOREV}"
+SPDX_INCLUDE_VEX =3D "all"
+SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
diff --git a/meta/recipes-core/meta/sbom-cve-check-config.inc b/meta/reci=
pes-core/meta/sbom-cve-check-config.inc
new file mode 100644
index 000000000000..a1a909e22250
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-config.inc
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: MIT
+
+SBOM_CVE_CHECK_DATABASES_DIR ??=3D "${DEPLOY_DIR}/sbom_cve_check/databas=
es"
+SBOM_CVE_CHECK_DATABASES_DIR[doc] =3D "Download directory path where to =
store the CVE databases"
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.=
bb b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
new file mode 100644
index 000000000000..ce204db6c51a
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-cvelist-native.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Updates the CVE List database"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
+
+HOMEPAGE =3D "https://github.com/CVEProject/cvelistV5"
+SRC_URI =3D "git://github.com/CVEProject/cvelistV5.git;branch=3Dmain;pro=
tocol=3Dhttps"
+SBOM_CVE_CHECK_DB_NAME =3D "cvelist"
+
+# 2026-03-19_baseline
+SRCREV =3D "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+
+require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-db.inc b/meta/r=
ecipes-core/meta/sbom-cve-check-update-db.inc
new file mode 100644
index 000000000000..5ecb79820247
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-db.inc
@@ -0,0 +1,28 @@
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
+DEPENDS +=3D "rsync-native"
+
+# Leverage BitBake's checksum computation for populated sysroot files to=
 determine
+# whether other recipe tasks dependent on this output need to be re-exec=
uted.
+do_compile() {
+    git -C "${S}" rev-parse --verify "HEAD^{object}" > "${WORKDIR}/${SBO=
M_CVE_CHECK_DB_NAME}.rev"
+}
+
+# In the install task, also deploy directly to ${DEPLOY_DIR} using rsync=
.
+# This is an hack, we are not using do_deploy to prevent multiple uneces=
sary copy of the CVE database.
+do_install() {
+    install -m 644 -D -t "${D}${datadir}/sbom_cve_check/databases/" "${W=
ORKDIR}/${SBOM_CVE_CHECK_DB_NAME}.rev"
+
+    dst=3D"${SBOM_CVE_CHECK_DATABASES_DIR}/${SBOM_CVE_CHECK_DB_NAME}"
+    mkdir -p "$dst"
+    rsync -aH --delete --link-dest=3D"${S}/" "${S}/" "${dst}/"
+}
diff --git a/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb b=
/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
new file mode 100644
index 000000000000..46c86952a164
--- /dev/null
+++ b/meta/recipes-core/meta/sbom-cve-check-update-nvd-native.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Updates the NVD CVE database"
+LICENSE =3D "cve-tou"
+LIC_FILES_CHKSUM =3D "file://LICENSES/cve-tou.md;md5=3Dbc5bbf146f01e20ec=
e63d83c8916d8fb"
+
+HOMEPAGE =3D "https://github.com/fkie-cad/nvd-json-data-feeds"
+SRC_URI =3D "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=3D=
main;protocol=3Dhttps"
+SBOM_CVE_CHECK_DB_NAME =3D "nvd-fkie"
+
+# v2026.03.19-010002
+SRCREV =3D "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
+
+require sbom-cve-check-update-db.inc

--=20
2.53.0


