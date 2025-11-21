Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415D3CFA766
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 09:54:35 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8129.1763718864699962199
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 01:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=V1NDbj/O;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C868DC1019A;
	Fri, 21 Nov 2025 09:54:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F1EF60719;
	Fri, 21 Nov 2025 09:54:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F1E210371E6A;
	Fri, 21 Nov 2025 10:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763718862; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HCKCARQmHoiZT82rO2fEkwRgoDp4LzjOHPO2vhPo/lA=;
	b=V1NDbj/OMjQ0KDQhoTZ/MIzPf/2dMUyC4s8QZcNr6/Bq6fX2b9mRRfx81xCXDsQbpu1WL3
	2f2ZWaHUTbDhrmqJEu+jxpm2cSY0SvVaat2idoUnTT1UrH8GKih9lKeQ2CsBgM28Hi/oOI
	hRVZ+dcoIwBawGwVj7sPf2Nh1t1T6xszRPXg7Db1m84sPbWC1Iqcsu01fg4BRSoKeykXcz
	WlJ4Ty9oDdSd1qbWD/Z9yaDLX9lMJzL+Mfu+y9k8cIe2yx1PbwECLDoFpzjzNpNFHorEBw
	5vuF6373XVErhrdaFeJsvNTw0Y0ySGfRwF2O9uMQNTN/RebqA3TR8R2Gktfq7g==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	mathieu.dubois-briand@bootlin.com,
	miquel.raynal@bootlin.com,
	antonin.godard@bootlin.com,
	kamel.bouhara@bootlin.com,
	pascal.eberhard@se.com,
	jpewhacker@gmail.com,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>,
	Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap v2 2/5] vex.bbclass: add a new class
Date: Fri, 21 Nov 2025 10:54:10 +0100
Message-ID: <20251121095415.288301-3-benjamin.robin@bootlin.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251121095415.288301-1-benjamin.robin@bootlin.com>
References: <20251121095415.288301-1-benjamin.robin@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226659

The "vex" class generates the minimum information that is necessary
for VEX generation by an external CVE checking tool. It is a drop-in
replacement of "cve-check". It uses the same variables from recipes
to make the migration and backporting easier.

The goal of this class is to allow generation of the CVE list of
an image or distribution on-demand, including the latest information
from vulnerability databases. Vulnerability data changes every day,
so a status generated at build becomes out-of-date very soon.

Research done for this work shows that the current VEX formats (CSAF
and OpenVEX) do not provide enough information to generate such
rolling information. Instead, we extract the needed data from recipe
annotations (package names, CPEs, versions, CVE patches applied...)
and store for later use in the format that is an extension of the
CVE-check JSON output format.

This output can be then used (separately or with SPDX of the same
build) by an external tool to generate the vulnerability annotation
and VEX statements in standard formats.

When back-porting this feature, the do_generate_vex() had to be modified
to use the "old" get_patched_cves() API.

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6352ad93a72e67d6dfa82e870222518a97c426fa)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
---
 meta/classes/vex.bbclass | 327 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 327 insertions(+)
 create mode 100644 meta/classes/vex.bbclass

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
new file mode 100644
index 000000000000..73dd9338a1d5
--- /dev/null
+++ b/meta/classes/vex.bbclass
@@ -0,0 +1,327 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# This class is used to generate metadata needed by external
+# tools to check for vulnerabilities, for example CVEs.
+#
+# In order to use this class just inherit the class in the
+# local.conf file and it will add the generate_vex task for
+# every recipe. If an image is build it will generate a report
+# in DEPLOY_DIR_IMAGE for all the packages used, it will also
+# generate a file for all recipes used in the build.
+#
+# Variables use CVE_CHECK prefix to keep compatibility with
+# the cve-check class
+#
+# Example:
+#   bitbake -c generate_vex openssl
+#   bitbake core-image-sato
+#   bitbake -k -c generate_vex universe
+#
+# The product name that the CVE database uses defaults to BPN, but may n=
eed to
+# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibtif=
f).
+CVE_PRODUCT ??=3D "${BPN}"
+CVE_VERSION ??=3D "${PV}"
+
+CVE_CHECK_SUMMARY_DIR ?=3D "${LOG_DIR}/cve"
+
+CVE_CHECK_SUMMARY_FILE_NAME_JSON =3D "cve-summary.json"
+CVE_CHECK_SUMMARY_INDEX_PATH =3D "${CVE_CHECK_SUMMARY_DIR}/cve-summary-i=
ndex.txt"
+
+CVE_CHECK_DIR ??=3D "${DEPLOY_DIR}/cve"
+CVE_CHECK_RECIPE_FILE_JSON ?=3D "${CVE_CHECK_DIR}/${PN}_cve.json"
+CVE_CHECK_MANIFEST_JSON ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.json"
+
+# Skip CVE Check for packages (PN)
+CVE_CHECK_SKIP_RECIPE ?=3D ""
+
+# Replace NVD DB check status for a given CVE. Each of CVE has to be men=
tioned
+# separately with optional detail and description for this status.
+#
+# CVE_STATUS[CVE-1234-0001] =3D "not-applicable-platform: Issue only app=
lies on Windows"
+# CVE_STATUS[CVE-1234-0002] =3D "fixed-version: Fixed externally"
+#
+# Settings the same status and reason for multiple CVEs is possible
+# via CVE_STATUS_GROUPS variable.
+#
+# CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
+#
+# CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0003"
+# CVE_STATUS_WIN[status] =3D "not-applicable-platform: Issue only applie=
s on Windows"
+# CVE_STATUS_PATCHED =3D "CVE-1234-0002 CVE-1234-0004"
+# CVE_STATUS_PATCHED[status] =3D "fixed-version: Fixed externally"
+#
+# All possible CVE statuses could be found in cve-check-map.conf
+# CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
+# CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
+#
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
+CVE_CHECK_IGNORE ?=3D ""
+
+# Layers to be excluded
+CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
+
+# Layers to be included
+CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
+
+
+# set to "alphabetical" for version using single alphabetical character =
as increment release
+CVE_VERSION_SUFFIX ??=3D ""
+
+python () {
+    if bb.data.inherits_class("cve-check", d):
+        raise bb.parse.SkipRecipe("Skipping recipe: found incompatible c=
ombination of cve-check and vex enabled at the same time.")
+
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
+        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
+            d.setVarFlag("CVE_STATUS", cve, "ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional de=
tail or description at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split(=
):
+        cve_group =3D d.getVar(cve_status_group)
+        if cve_group is not None:
+            for cve in cve_group.split():
+                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_=
group, "status"))
+        else:
+            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" %=
 cve_status_group)
+}
+
+def generate_json_report(d, out_path, link_path):
+    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
+        import json
+        from oe.cve_check import cve_check_merge_jsons, update_symlinks
+
+        bb.note("Generating JSON CVE summary")
+        index_file =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+        summary =3D {"version":"1", "package": []}
+        with open(index_file) as f:
+            filename =3D f.readline()
+            while filename:
+                with open(filename.rstrip()) as j:
+                    data =3D json.load(j)
+                    cve_check_merge_jsons(summary, data)
+                filename =3D f.readline()
+
+        summary["package"].sort(key=3Dlambda d: d['name'])
+
+        with open(out_path, "w") as f:
+            json.dump(summary, f, indent=3D2)
+
+        update_symlinks(out_path, link_path)
+
+python vex_save_summary_handler () {
+    import shutil
+    import datetime
+    from oe.cve_check import update_symlinks
+
+    cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
+
+    bb.utils.mkdirhier(cvelogpath)
+    timestamp =3D datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+
+    json_summary_link_name =3D os.path.join(cvelogpath, d.getVar("CVE_CH=
ECK_SUMMARY_FILE_NAME_JSON"))
+    json_summary_name =3D os.path.join(cvelogpath, "cve-summary-%s.json"=
 % (timestamp))
+    generate_json_report(d, json_summary_name, json_summary_link_name)
+    bb.plain("Complete CVE JSON report summary created at: %s" % json_su=
mmary_link_name)
+}
+
+addhandler vex_save_summary_handler
+vex_save_summary_handler[eventmask] =3D "bb.event.BuildCompleted"
+
+python do_generate_vex () {
+    """
+    Generate metadata needed for vulnerability checking for
+    the current recipe
+    """
+    from oe.cve_check import get_patched_cves, decode_cve_status
+
+    cves_status =3D []
+    products =3D d.getVar("CVE_PRODUCT").split()
+    for product in products:
+        if ":" in product:
+            _, product =3D product.split(":", 1)
+        cves_status.append([product, False])
+
+    patched_cves =3D get_patched_cves(d)
+    cve_data =3D {}
+    for cve_id in (d.getVarFlags("CVE_STATUS") or {}):
+        mapping, detail, description =3D decode_cve_status(d, cve_id)
+        if not mapping or not detail:
+            bb.warn(f"Skipping {cve_id} =E2=80=94 missing or unknown CVE=
 status")
+            continue
+        cve_data[cve_id] =3D {
+            "abbrev-status": mapping,
+            "status": detail,
+            "justification": description
+        }
+        patched_cves.discard(cve_id)
+
+    # decode_cve_status is decoding CVE_STATUS, so patch files need to b=
e hardcoded
+    for cve_id in patched_cves:
+        # fix-file-included is not available in scarthgap
+        cve_data[cve_id] =3D {
+            "abbrev-status": "Patched",
+            "status": "backported-patch",
+        }
+
+    cve_write_data_json(d, cve_data, cves_status)
+}
+
+addtask generate_vex before do_build
+
+python vex_cleanup () {
+    """
+    Delete the file used to gather all the CVE information.
+    """
+    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
+}
+
+addhandler vex_cleanup
+vex_cleanup[eventmask] =3D "bb.event.BuildCompleted"
+
+python vex_write_rootfs_manifest () {
+    """
+    Create VEX/CVE manifest when building an image
+    """
+
+    import json
+    from oe.rootfs import image_list_installed_packages
+    from oe.cve_check import cve_check_merge_jsons, update_symlinks
+
+    deploy_file_json =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+    if os.path.exists(deploy_file_json):
+        bb.utils.remove(deploy_file_json)
+
+    # Create a list of relevant recipies
+    recipies =3D set()
+    for pkg in list(image_list_installed_packages(d)):
+        pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR'),
+                                'runtime-reverse', pkg)
+        pkg_data =3D oe.packagedata.read_pkgdatafile(pkg_info)
+        recipies.add(pkg_data["PN"])
+
+    bb.note("Writing rootfs VEX manifest")
+    deploy_dir =3D d.getVar("IMGDEPLOYDIR")
+    link_name =3D d.getVar("IMAGE_LINK_NAME")
+
+    json_data =3D {"version":"1", "package": []}
+    text_data =3D ""
+
+    save_pn =3D d.getVar("PN")
+
+    for pkg in recipies:
+        # To be able to use the CVE_CHECK_RECIPE_FILE_JSON variable we h=
ave to evaluate
+        # it with the different PN names set each time.
+        d.setVar("PN", pkg)
+
+        pkgfilepath =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+        if os.path.exists(pkgfilepath):
+            with open(pkgfilepath) as j:
+                data =3D json.load(j)
+                cve_check_merge_jsons(json_data, data)
+
+    d.setVar("PN", save_pn)
+
+    link_path =3D os.path.join(deploy_dir, "%s.json" % link_name)
+    manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
+
+    with open(manifest_name, "w") as f:
+        json.dump(json_data, f, indent=3D2)
+
+    update_symlinks(manifest_name, link_path)
+    bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
+}
+
+ROOTFS_POSTPROCESS_COMMAND:prepend =3D "vex_write_rootfs_manifest; "
+do_rootfs[recrdeptask] +=3D "do_generate_vex "
+do_populate_sdk[recrdeptask] +=3D "do_generate_vex "
+
+def cve_write_data_json(d, cve_data, cve_status):
+    """
+    Prepare CVE data for the JSON format, then write it.
+    Done for each recipe.
+    """
+
+    from oe.cve_check import get_cpe_ids
+    import json
+
+    output =3D {"version":"1", "package": []}
+    nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
+
+    fdir_name  =3D d.getVar("FILE_DIRNAME")
+    layer =3D fdir_name.split("/")[-3]
+
+    include_layers =3D d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
+    exclude_layers =3D d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
+
+    if exclude_layers and layer in exclude_layers:
+        return
+
+    if include_layers and layer not in include_layers:
+        return
+
+    product_data =3D []
+    for s in cve_status:
+        p =3D {"product": s[0], "cvesInRecord": "Yes"}
+        if s[1] =3D=3D False:
+            p["cvesInRecord"] =3D "No"
+        product_data.append(p)
+    product_data =3D list({p['product']:p for p in product_data}.values(=
))
+
+    package_version =3D "%s%s" % (d.getVar("EXTENDPE"), d.getVar("PV"))
+    cpes =3D get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"=
))
+    package_data =3D {
+        "name" : d.getVar("PN"),
+        "layer" : layer,
+        "version" : package_version,
+        "products": product_data,
+        "cpes": cpes
+    }
+
+    cve_list =3D []
+
+    for cve in sorted(cve_data):
+        issue_link =3D "%s%s" % (nvd_link, cve)
+
+        cve_item =3D {
+            "id" : cve,
+            "status" : cve_data[cve]["abbrev-status"],
+            "link": issue_link,
+        }
+        if 'NVD-summary' in cve_data[cve]:
+            cve_item["summary"] =3D cve_data[cve]["NVD-summary"]
+            cve_item["scorev2"] =3D cve_data[cve]["NVD-scorev2"]
+            cve_item["scorev3"] =3D cve_data[cve]["NVD-scorev3"]
+            cve_item["vector"] =3D cve_data[cve]["NVD-vector"]
+            cve_item["vectorString"] =3D cve_data[cve]["NVD-vectorString=
"]
+        if 'status' in cve_data[cve]:
+            cve_item["detail"] =3D cve_data[cve]["status"]
+        if 'justification' in cve_data[cve]:
+            cve_item["description"] =3D cve_data[cve]["justification"]
+        if 'resource' in cve_data[cve]:
+            cve_item["patch-file"] =3D cve_data[cve]["resource"]
+        cve_list.append(cve_item)
+
+    package_data["issue"] =3D cve_list
+    output["package"].append(package_data)
+
+    deploy_file =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
+
+    write_string =3D json.dumps(output, indent=3D2)
+
+    cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
+    index_path =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+    bb.utils.mkdirhier(cvelogpath)
+    fragment_file =3D os.path.basename(deploy_file)
+    fragment_path =3D os.path.join(cvelogpath, fragment_file)
+    with open(fragment_path, "w") as f:
+        f.write(write_string)
+    with open(index_path, "a+") as f:
+        f.write("%s\n" % fragment_path)
--=20
2.51.2


