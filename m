Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66D8E9A764
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:28:55 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16735.1774348133818205516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=nmG/u/9Z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 363551A2FBD;
	Tue, 24 Mar 2026 10:28:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BEA16011D;
	Tue, 24 Mar 2026 10:28:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77A2E10451138;
	Tue, 24 Mar 2026 11:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774348131; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=00SduyIix3eQXIhhvibeRfaaTDH91j0qu/D3kk7rtTE=;
	b=nmG/u/9Zq5pctlCW3cPqvfMQq2dlUi296Mye/Lz4H1KvfEf7cC8K8UzG1cmnv7cJx81WEU
	E3G2V8MKu717E+jF5RbmYOGmBBz2bP/Y8GCu7c1N3Od1/E9T3ptg8OqUxdquwtbq14CPVh
	S4TVt2YJ9Nq4GI5E++hMQorUrfuGZSRRNcNGVEXACy/wgRvHCvAqFOl8IRi+H0f0iLkk9X
	a+Du1rKVT3mOQYmyugpWJhoWdWe22o6DZCusAFRrrAr+4cKxkcoa2Hi3qWgizRSX5Pw0hI
	aW9pkF+8fYRww8HV2KE9flFm+az5gpTwVFXmsyEGcbmXHr2INneAGh71EutTHQ==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Tue, 24 Mar 2026 11:28:36 +0100
Subject: [PATCH v8 1/2] sbom-cve-check: Add class for post-build CVE
 analysis
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260324-add-sbom-cve-check-v8-1-6c2e84e637ad@bootlin.com>
References: <20260324-add-sbom-cve-check-v8-0-6c2e84e637ad@bootlin.com>
In-Reply-To: <20260324-add-sbom-cve-check-v8-0-6c2e84e637ad@bootlin.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 10:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233784

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
sbom-cve-check-update-db.inc. The CVE databases are deployed in
`${DEPLOY_DIR}/sbom-cve-check/databases/`. This can be configured
by the `SBOM_CVE_CHECK_DEPLOY_DB_DIR` variable defined in
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
 meta/classes-recipe/sbom-cve-check.bbclass         | 115 +++++++++++++++=
++++++
 meta/conf/distro/include/maintainers.inc           |   2 +
 meta/conf/fragments/yocto/sbom-cve-check.conf      |  14 +++
 .../sbom-cve-check/sbom-cve-check-config.inc       |   5 +
 .../sbom-cve-check-update-cvelist-native.bb        |  12 +++
 .../sbom-cve-check/sbom-cve-check-update-db.inc    |  21 ++++
 .../sbom-cve-check-update-nvd-native.bb            |  12 +++
 7 files changed, 181 insertions(+)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
new file mode 100644
index 000000000000..3a23888ed6b4
--- /dev/null
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: MIT
+
+# It is recommended to enable this class through the sbom-cve-check frag=
ment:
+# bitbake-config-build enable-fragment core/yocto/sbom-cve-check
+#
+# Or it is possible to add this line in local.conf:
+# OE_FRAGMENTS +=3D "core/yocto/sbom-cve-check"
+
+require recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc
+
+SBOM_CVE_CHECK_DEPLOYDIR =3D "${WORKDIR}/sbom-cve-check/image-deploy"
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
+    with the following name: ${IMAGE_NAME}.sbom-cve-check.spdx.json \
+"
+SBOM_CVE_CHECK_EXPORT_SPDX3[type] ?=3D "spdx3"
+SBOM_CVE_CHECK_EXPORT_SPDX3[ext] ?=3D ".sbom-cve-check.spdx.json"
+
+SBOM_CVE_CHECK_EXPORT_CVECHECK[doc] =3D "Export configuration to generat=
e a JSON manifest \
+    in the same format as the cve-check class, with the following name: =
\
+    ${IMAGE_NAME}.sbom-cve-check.json \
+"
+SBOM_CVE_CHECK_EXPORT_CVECHECK[type] ?=3D "yocto-cve-check-manifest"
+SBOM_CVE_CHECK_EXPORT_CVECHECK[ext] ?=3D ".sbom-cve-check.yocto.json"
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
+    dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
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
+        "--disable-auto-updates"
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
+    sbom-cve-check-update-cvelist-native:do_unpack \
+    sbom-cve-check-update-nvd-native:do_unpack \
+"
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
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.i=
nc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc
new file mode 100644
index 000000000000..d337cef2355c
--- /dev/null
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-config.inc
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: MIT
+
+SBOM_CVE_CHECK_DEPLOY_DB_DIR ??=3D "${DEPLOY_DIR}/sbom-cve-check/databas=
es"
+SBOM_CVE_CHECK_DEPLOY_DB_DIR[doc] =3D "Path to the directory where the C=
VE databases, \
+    fetched by the sbom-cve-check-update-* recipes, are extracted for us=
e."
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-c=
velist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-up=
date-cvelist-native.bb
new file mode 100644
index 000000000000..ce204db6c51a
--- /dev/null
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-=
native.bb
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
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-d=
b.inc b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
new file mode 100644
index 000000000000..4e9cef96e8ea
--- /dev/null
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-db.inc
@@ -0,0 +1,21 @@
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
+    The git repository will be stored in ${SBOM_CVE_CHECK_DEPLOY_DB_DIR)=
/"
+
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+# Directly unpack the fetched CVE database to the deploy directory.
+UNPACKDIR =3D "${SBOM_CVE_CHECK_DEPLOY_DB_DIR}"
+S =3D "${UNPACKDIR}"
+BB_GIT_DEFAULT_DESTSUFFIX =3D "${SBOM_CVE_CHECK_DB_NAME}"
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-n=
vd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update=
-nvd-native.bb
new file mode 100644
index 000000000000..30c7868b2ae7
--- /dev/null
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-nati=
ve.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Updates the NVD CVE database"
+LICENSE =3D "cve-tou"
+LIC_FILES_CHKSUM =3D "file://${SBOM_CVE_CHECK_DB_NAME}/LICENSES/cve-tou.=
md;md5=3Dbc5bbf146f01e20ece63d83c8916d8fb"
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


