Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC69105D98A
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 21:03:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92012.1775595786882766928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 14:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ldtr1fXt;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6694353C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 24EAA3F7D8
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Apr 2026 14:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775595786; bh=chD1RUaqMszHl1o44dvkeveGqrI4rhO93VUbugXT8qI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ldtr1fXtlPUtNcz0uSf/AYLhUjbJtMm7/02fxx0Nq7TbtACYwLzX8pv39x+R98XMD
	 SAJfl4GVpvsUxfX1Ae1DcxP6w8jEBW6lLuHJdwqcUnzmP0LrYOvEipegQcI1diHopu
	 T6BXxizs+XgXFwCseMT2f04cZS6mfRf7nDVRCwFo=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 6/7] classes/sbom-cve-check: extract common functionality to a -common.bbclass
Date: Tue,  7 Apr 2026 22:02:25 +0100
Message-ID: <20260407210226.2375631-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407210226.2375631-1-ross.burton@arm.com>
References: <20260407210226.2375631-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 21:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234785

Extract the common configuration variables and run_sbom_cve_check() that
actually invokes sbom-cve-check to a separate class, so that other
classes that are not tied to image generation can use the same logic.

No code changes, just movement.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 93 +--------------------
 meta/classes/sbom-cve-check-common.bbclass | 95 ++++++++++++++++++++++
 2 files changed, 98 insertions(+), 90 deletions(-)
 create mode 100644 meta/classes/sbom-cve-check-common.bbclass

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
index c861a7965f..fe145a2212 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -1,101 +1,14 @@
 # SPDX-License-Identifier: MIT
=20
+# Perform CVE analysis on image SBOMs using sbom-cve-check.
+#
 # It is recommended to enable this class through the sbom-cve-check frag=
ment:
 # bitbake-config-build enable-fragment core/yocto/sbom-cve-check
 #
 # Or it is possible to add this line in local.conf:
 # OE_FRAGMENTS +=3D "core/yocto/sbom-cve-check"
=20
-require conf/sbom-cve-check-config.inc
-
-SBOM_CVE_CHECK_DEPLOYDIR =3D "${WORKDIR}/sbom-cve-check/image-deploy"
-
-SBOM_CVE_CHECK_EXTRA_ARGS[doc] =3D "Allow to specify extra arguments to =
sbom-cve-check. \
-    For example to add export flags for filtering (e.g., only export vul=
nerable CVEs). \
-"
-SBOM_CVE_CHECK_EXTRA_ARGS ??=3D ""
-
-SBOM_CVE_CHECK_EXPORT_VARS[doc] =3D "List of variables that declare expo=
rt files to generate. \
-    Each variable must have a 'type' and an 'ext' flag set. \
-    The 'type' flag contains the value that is passed to the --export-ty=
pe command flags. \
-    The 'ext' flag contains the filename extension (suffix). The output =
filename is going \
-    to be ${IMAGE_NAME}${ext} \
-"
-SBOM_CVE_CHECK_EXPORT_VARS ?=3D "SBOM_CVE_CHECK_EXPORT_SPDX3 SBOM_CVE_CH=
ECK_EXPORT_CVECHECK"
-
-SBOM_CVE_CHECK_EXPORT_SPDX3[doc] =3D "Export configuration to generate a=
n SPDX3 SBOM file, \
-    with the following name: ${IMAGE_NAME}.sbom-cve-check.spdx.json \
-"
-SBOM_CVE_CHECK_EXPORT_SPDX3[type] ?=3D "spdx3"
-SBOM_CVE_CHECK_EXPORT_SPDX3[ext] ?=3D ".sbom-cve-check.spdx.json"
-
-SBOM_CVE_CHECK_EXPORT_CVECHECK[doc] =3D "Export configuration to generat=
e a JSON manifest \
-    in the same format as the cve-check class, with the following name: =
\
-    ${IMAGE_NAME}.sbom-cve-check.json \
-"
-SBOM_CVE_CHECK_EXPORT_CVECHECK[type] ?=3D "yocto-cve-check-manifest"
-SBOM_CVE_CHECK_EXPORT_CVECHECK[ext] ?=3D ".sbom-cve-check.yocto.json"
-
-SBOM_CVE_CHECK_EXPORT_SUMMARY[doc] =3D "Export configuration to generate=
 a human-readable \
-    summary report, with the following name: \
-    ${IMAGE_NAME}.cve.txt \
-"
-SBOM_CVE_CHECK_EXPORT_SUMMARY[type] ?=3D "summary"
-SBOM_CVE_CHECK_EXPORT_SUMMARY[ext] ?=3D ".cve.txt"
-
-SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?=3D " \
-    sbom-cve-check-update-cvelist-native:do_patch \
-    sbom-cve-check-update-nvd-native:do_patch \
-"
-
-def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=3D=
None):
-    import os
-    import bb
-    from oe.cve_check import update_symlinks
-
-    if not bb.data.inherits_class("create-spdx-3.0", d):
-        bb.fatal("Cannot execute sbom-cve-check: missing create-spdx-3.0=
 inherit.")
-
-    dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
-    out_deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
-
-    export_files =3D []
-    for export_var in d.getVar("SBOM_CVE_CHECK_EXPORT_VARS").split():
-        export_ext =3D d.getVarFlag(export_var, "ext")
-        export_path =3D f"{out_deploy_dir}/{export_base_name}{export_ext=
}"
-        export_link =3D f"{out_deploy_dir}/{export_link_name}{export_ext=
}" if export_link_name else None
-        export_type =3D d.getVarFlag(export_var, "type")
-        export_files.append((export_type, export_path, export_link))
-
-    cmd_env =3D os.environ.copy()
-    cmd_env["SBOM_CVE_CHECK_DATABASES_DIR"] =3D dl_db_dir
-
-    cmd_args =3D [
-        d.expand("${STAGING_BINDIR_NATIVE}/sbom-cve-check"),
-        "--sbom-path",
-        sbom_path,
-        "--disable-auto-updates"
-    ]
-
-    for export_type, export_file, export_link in export_files:
-        cmd_args.extend(
-            ["--export-type", export_type, "--export-path", export_file]
-        )
-
-    cmd_args.extend(d.getVar("SBOM_CVE_CHECK_EXTRA_ARGS").split())
-
-    try:
-        bb.note("Running: {}".format(" ".join(cmd_args)))
-        bb.process.run(cmd_args, env=3Dcmd_env)
-    except bb.process.ExecutionError as e:
-        bb.error(f"sbom-cve-check failed: {e}")
-        return
-
-    for export_type, export_file, export_link in export_files:
-        bb.note(f"sbom-cve-check exported: {export_file}")
-        if export_link:
-            update_symlinks(export_file, export_link)
-
+inherit sbom-cve-check-common
=20
 python do_sbom_cve_check() {
     """
diff --git a/meta/classes/sbom-cve-check-common.bbclass b/meta/classes/sb=
om-cve-check-common.bbclass
new file mode 100644
index 0000000000..3db189d60d
--- /dev/null
+++ b/meta/classes/sbom-cve-check-common.bbclass
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: MIT
+
+# Common functionality for the sbom-cve-check classes.
+
+require conf/sbom-cve-check-config.inc
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
+SBOM_CVE_CHECK_EXPORT_SUMMARY[doc] =3D "Export configuration to generate=
 a human-readable \
+    summary report, with the following name: \
+    ${IMAGE_NAME}.cve.txt \
+"
+SBOM_CVE_CHECK_EXPORT_SUMMARY[type] ?=3D "summary"
+SBOM_CVE_CHECK_EXPORT_SUMMARY[ext] ?=3D ".cve.txt"
+
+SBOM_CVE_CHECK_UPDATE_DB_DEPENDENCIES ?=3D " \
+    sbom-cve-check-update-cvelist-native:do_patch \
+    sbom-cve-check-update-nvd-native:do_patch \
+"
+
+def run_sbom_cve_check(d, sbom_path, export_base_name, export_link_name=3D=
None):
+    import os
+    import bb
+    from oe.cve_check import update_symlinks
+
+    if not bb.data.inherits_class("create-spdx-3.0", d):
+        bb.fatal("Cannot execute sbom-cve-check: missing create-spdx-3.0=
 inherit.")
+
+    dl_db_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOY_DB_DIR")
+    out_deploy_dir =3D d.getVar("SBOM_CVE_CHECK_DEPLOYDIR")
+
+    export_files =3D []
+    for export_var in d.getVar("SBOM_CVE_CHECK_EXPORT_VARS").split():
+        export_ext =3D d.getVarFlag(export_var, "ext")
+        export_path =3D f"{out_deploy_dir}/{export_base_name}{export_ext=
}"
+        export_link =3D f"{out_deploy_dir}/{export_link_name}{export_ext=
}" if export_link_name else None
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
+    for export_type, export_file, export_link in export_files:
+        cmd_args.extend(
+            ["--export-type", export_type, "--export-path", export_file]
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
+    for export_type, export_file, export_link in export_files:
+        bb.note(f"sbom-cve-check exported: {export_file}")
+        if export_link:
+            update_symlinks(export_file, export_link)
+
+
--=20
2.43.0


