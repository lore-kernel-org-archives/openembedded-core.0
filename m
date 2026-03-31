Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056D1109B469
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:24:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19900.1774963475255890606
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 06:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=DxdBB+zF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1243495B
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:24:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 770183F7D8
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774963474; bh=2AnxErEhFWWEAFlBGg1A9GSsgLBXY1FXGII8twvH8R0=;
	h=From:To:Subject:Date:From;
	b=DxdBB+zFRIHHB1Mw+pgmXvviVBEAp/S0hjyZ6xtmYHDG9u3msTGFRwXJAl235K/I0
	 9icmCzKREufj5pc3Hbh6IXcL6akBENXBzGjOh4PceFaOj9hUEIoFUX/ud16ZPoVxnw
	 yiq0yAU9qROYyM2JeW4FotFNHfzHco1bk2Rl3BWk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] classes/vex: remove
Date: Tue, 31 Mar 2026 14:24:27 +0100
Message-ID: <20260331132430.781647-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 13:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234285

This class existed as a provider of information for external CVE tooling,
and uses a non-standard format that is OpenEmbedded-specific[1].

However, the SPDX 3 output can contain all of this needed information,
in a format that is standardised.

I'm unaware of any active users of this class beyond sbom-cve-check,
which can also read the data from the SPDX if SPDX_INCLUDE_VEX has been
set.

So that we don't have to maintain this class for the lifetime of the
Wrynose LTS, delete it.

[1] oe-core 6352ad93a72 ("vex.bbclass: add a new class")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/vex.bbclass | 303 ---------------------------------------
 1 file changed, 303 deletions(-)
 delete mode 100644 meta/classes/vex.bbclass

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
deleted file mode 100644
index c57b8209c23..00000000000
--- a/meta/classes/vex.bbclass
+++ /dev/null
@@ -1,303 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-# This class is used to generate metadata needed by external
-# tools to check for vulnerabilities, for example CVEs.
-#
-# In order to use this class just inherit the class in the
-# local.conf file and it will add the generate_vex task for
-# every recipe. If an image is build it will generate a report
-# in DEPLOY_DIR_IMAGE for all the packages used, it will also
-# generate a file for all recipes used in the build.
-#
-# Variables use CVE_CHECK prefix to keep compatibility with
-# the cve-check class
-#
-# Example:
-#   bitbake -c generate_vex openssl
-#   bitbake core-image-sato
-#   bitbake -k -c generate_vex universe
-#
-# The product name that the CVE database uses defaults to BPN, but may n=
eed to
-# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibtif=
f).
-CVE_PRODUCT ??=3D "${BPN}"
-CVE_VERSION ??=3D "${PV}"
-
-CVE_CHECK_SUMMARY_DIR ?=3D "${LOG_DIR}/cve"
-
-CVE_CHECK_SUMMARY_FILE_NAME_JSON =3D "cve-summary.json"
-CVE_CHECK_SUMMARY_INDEX_PATH =3D "${CVE_CHECK_SUMMARY_DIR}/cve-summary-i=
ndex.txt"
-
-CVE_CHECK_DIR ??=3D "${DEPLOY_DIR}/cve"
-CVE_CHECK_RECIPE_FILE_JSON ?=3D "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST_JSON ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.vex.json"
-
-# Skip CVE Check for packages (PN)
-CVE_CHECK_SKIP_RECIPE ?=3D ""
-
-# Replace NVD DB check status for a given CVE. Each of CVE has to be men=
tioned
-# separately with optional detail and description for this status.
-#
-# CVE_STATUS[CVE-1234-0001] =3D "not-applicable-platform: Issue only app=
lies on Windows"
-# CVE_STATUS[CVE-1234-0002] =3D "fixed-version: Fixed externally"
-#
-# Settings the same status and reason for multiple CVEs is possible
-# via CVE_STATUS_GROUPS variable.
-#
-# CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
-#
-# CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0003"
-# CVE_STATUS_WIN[status] =3D "not-applicable-platform: Issue only applie=
s on Windows"
-# CVE_STATUS_PATCHED =3D "CVE-1234-0002 CVE-1234-0004"
-# CVE_STATUS_PATCHED[status] =3D "fixed-version: Fixed externally"
-#
-# All possible CVE statuses could be found in cve-check-map.conf
-# CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
-# CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
-#
-# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
-# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
-CVE_CHECK_IGNORE ?=3D ""
-
-# Layers to be excluded
-CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
-
-# Layers to be included
-CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
-
-
-# set to "alphabetical" for version using single alphabetical character =
as increment release
-CVE_VERSION_SUFFIX ??=3D ""
-
-python () {
-    if bb.data.inherits_class("cve-check", d):
-        raise bb.parse.SkipRecipe("Skipping recipe: found incompatible c=
ombination of cve-check and vex enabled at the same time.")
-
-    from oe.cve_check import extend_cve_status
-    extend_cve_status(d)
-}
-
-def generate_json_report(d, out_path, link_path):
-    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
-        import json
-        from oe.cve_check import cve_check_merge_jsons, update_symlinks
-
-        bb.note("Generating JSON CVE summary")
-        index_file =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
-        summary =3D {"version":"1", "package": []}
-        with open(index_file) as f:
-            filename =3D f.readline()
-            while filename:
-                with open(filename.rstrip()) as j:
-                    data =3D json.load(j)
-                    cve_check_merge_jsons(summary, data)
-                filename =3D f.readline()
-
-        summary["package"].sort(key=3Dlambda d: d['name'])
-
-        with open(out_path, "w") as f:
-            json.dump(summary, f, indent=3D2)
-
-        update_symlinks(out_path, link_path)
-
-python vex_save_summary_handler () {
-    import shutil
-    import datetime
-    from oe.cve_check import update_symlinks
-
-    cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
-
-    bb.utils.mkdirhier(cvelogpath)
-    timestamp =3D datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-
-    json_summary_link_name =3D os.path.join(cvelogpath, d.getVar("CVE_CH=
ECK_SUMMARY_FILE_NAME_JSON"))
-    json_summary_name =3D os.path.join(cvelogpath, "cve-summary-%s.json"=
 % (timestamp))
-    generate_json_report(d, json_summary_name, json_summary_link_name)
-    bb.plain("Complete CVE JSON report summary created at: %s" % json_su=
mmary_link_name)
-}
-
-addhandler vex_save_summary_handler
-vex_save_summary_handler[eventmask] =3D "bb.event.BuildCompleted"
-
-python do_generate_vex () {
-    """
-    Generate metadata needed for vulnerability checking for
-    the current recipe
-    """
-    from oe.cve_check import get_patched_cves
-
-    try:
-        patched_cves =3D get_patched_cves(d)
-        cves_status =3D []
-        products =3D d.getVar("CVE_PRODUCT").split()
-        for product in products:
-            if ":" in product:
-                _, product =3D product.split(":", 1)
-            cves_status.append([product, False])
-
-    except FileNotFoundError:
-        bb.fatal("Failure in searching patches")
-
-    cve_write_data_json(d, patched_cves, cves_status)
-}
-
-addtask generate_vex before do_build
-
-python vex_cleanup () {
-    """
-    Delete the file used to gather all the CVE information.
-    """
-    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
-}
-
-addhandler vex_cleanup
-vex_cleanup[eventmask] =3D "bb.event.BuildCompleted"
-
-python vex_write_rootfs_manifest () {
-    """
-    Create VEX/CVE manifest when building an image
-    """
-
-    import json
-    from oe.rootfs import image_list_installed_packages
-    from oe.cve_check import cve_check_merge_jsons, update_symlinks
-
-    deploy_file_json =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-    if os.path.exists(deploy_file_json):
-        bb.utils.remove(deploy_file_json)
-
-    # Create a list of relevant recipies
-    recipies =3D set()
-    for pkg in list(image_list_installed_packages(d)):
-        pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR'),
-                                'runtime-reverse', pkg)
-        pkg_data =3D oe.packagedata.read_pkgdatafile(pkg_info)
-        recipies.add(pkg_data["PN"])
-
-    bb.note("Writing rootfs VEX manifest")
-    deploy_dir =3D d.getVar("IMGDEPLOYDIR")
-    link_name =3D d.getVar("IMAGE_LINK_NAME")
-
-    json_data =3D {"version":"1", "package": []}
-    text_data =3D ""
-
-    save_pn =3D d.getVar("PN")
-
-    for pkg in recipies:
-        # To be able to use the CVE_CHECK_RECIPE_FILE_JSON variable we h=
ave to evaluate
-        # it with the different PN names set each time.
-        d.setVar("PN", pkg)
-
-        pkgfilepath =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-        if os.path.exists(pkgfilepath):
-            with open(pkgfilepath) as j:
-                data =3D json.load(j)
-                cve_check_merge_jsons(json_data, data)
-        else:
-            bb.warn("Missing cve file for %s" % pkg)
-
-    d.setVar("PN", save_pn)
-
-    link_path =3D os.path.join(deploy_dir, "%s.vex.json" % link_name)
-    manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
-
-    with open(manifest_name, "w") as f:
-        json.dump(json_data, f, indent=3D2)
-
-    update_symlinks(manifest_name, link_path)
-    bb.plain("Image VEX JSON report stored in: %s" % manifest_name)
-}
-
-ROOTFS_POSTPROCESS_COMMAND:prepend =3D "vex_write_rootfs_manifest; "
-do_rootfs[recrdeptask] +=3D "do_generate_vex "
-do_populate_sdk[recrdeptask] +=3D "do_generate_vex "
-
-def cve_write_data_json(d, cve_data, cve_status):
-    """
-    Prepare CVE data for the JSON format, then write it.
-    Done for each recipe.
-    """
-
-    from oe.cve_check import get_cpe_ids
-    import json
-
-    output =3D {"version":"1", "package": []}
-    nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
-
-    fdir_name  =3D d.getVar("FILE_DIRNAME")
-    layer =3D fdir_name.split("/")[-3]
-
-    include_layers =3D d.getVar("CVE_CHECK_LAYER_INCLUDELIST").split()
-    exclude_layers =3D d.getVar("CVE_CHECK_LAYER_EXCLUDELIST").split()
-
-    if exclude_layers and layer in exclude_layers:
-        return
-
-    if include_layers and layer not in include_layers:
-        return
-
-    product_data =3D []
-    for s in cve_status:
-        p =3D {"product": s[0], "cvesInRecord": "Yes"}
-        if s[1] =3D=3D False:
-            p["cvesInRecord"] =3D "No"
-        product_data.append(p)
-    product_data =3D list({p['product']:p for p in product_data}.values(=
))
-
-    package_version =3D "%s%s" % (d.getVar("EXTENDPE"), d.getVar("PV"))
-    cpes =3D get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"=
))
-    package_data =3D {
-        "name" : d.getVar("PN"),
-        "layer" : layer,
-        "version" : package_version,
-        "products": product_data,
-        "cpes": cpes
-    }
-
-    cve_list =3D []
-
-    for cve in sorted(cve_data):
-        issue_link =3D "%s%s" % (nvd_link, cve)
-
-        cve_item =3D {
-            "id" : cve,
-            "status" : cve_data[cve]["abbrev-status"],
-            "link": issue_link,
-        }
-        if 'NVD-summary' in cve_data[cve]:
-            cve_item["summary"] =3D cve_data[cve]["NVD-summary"]
-            cve_item["scorev2"] =3D cve_data[cve]["NVD-scorev2"]
-            cve_item["scorev3"] =3D cve_data[cve]["NVD-scorev3"]
-            cve_item["scorev4"] =3D cve_data[cve]["NVD-scorev4"]
-            cve_item["vector"] =3D cve_data[cve]["NVD-vector"]
-            cve_item["vectorString"] =3D cve_data[cve]["NVD-vectorString=
"]
-        if 'status' in cve_data[cve]:
-            cve_item["detail"] =3D cve_data[cve]["status"]
-        if 'justification' in cve_data[cve]:
-            cve_item["description"] =3D cve_data[cve]["justification"]
-        if 'resource' in cve_data[cve]:
-            cve_item["patch-file"] =3D cve_data[cve]["resource"]
-        cve_list.append(cve_item)
-
-    package_data["issue"] =3D cve_list
-    output["package"].append(package_data)
-
-    deploy_file =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-
-    write_string =3D json.dumps(output, indent=3D2)
-
-    cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
-    index_path =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
-    bb.utils.mkdirhier(cvelogpath)
-    bb.utils.mkdirhier(os.path.dirname(deploy_file))
-    fragment_file =3D os.path.basename(deploy_file)
-    fragment_path =3D os.path.join(cvelogpath, fragment_file)
-    with open(fragment_path, "w") as f:
-        f.write(write_string)
-    with open(deploy_file, "w") as f:
-        f.write(write_string)
-    with open(index_path, "a+") as f:
-        f.write("%s\n" % fragment_path)
--=20
2.43.0


