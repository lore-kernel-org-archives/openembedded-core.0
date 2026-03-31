Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F89A109B46C
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 13:24:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20278.1774963476542099885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 06:24:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=S7T9r4E/;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31E6E499F
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:24:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C6493F7D8
	for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774963476; bh=Ek0SHEgRiIwhTERRdzt/GPXrplQgr3dT5OSA1dgNM0w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S7T9r4E/qkYXFw1QYAnjqLDHL1Ue+DiD68JcMOoagugdQZFjMXkd+CZ34l+TSY+F+
	 84RIvY0PJC06fu7FXxHKSeLuzWd7qhCkkRPqnp7TWH1O0TLkcVjdSE4c5bdDwsXxSr
	 CfFUNdmeRxswq3RnW4xoxn7Q2aByXWG2INyvEPVQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] classes/cve-check: remove class
Date: Tue, 31 Mar 2026 14:24:29 +0100
Message-ID: <20260331132430.781647-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331132430.781647-1-ross.burton@arm.com>
References: <20260331132430.781647-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 13:24:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234287

It's been long known that the cve-check class in oe-core is not that
usable in the real world, for more details see "Future of CVE scanning
in Yocto"[1].  This mail proposed an alternative direction that included
a CVE scanning tool that can be ran both during the build and afterwards,
so that periodic scans of a previously build image is possible.

Last year, Bootlin wrote sbom-cve-check[2] and I compared this to my
proposal in "Comparing cve-check with sbom-cve-check"[3], concluding
that this is likely the missing piece.

Support for sbom-cve-check has been merged into oe-core, and the
cve-check class is now obsolete. So that we don't have to maintain it for
the four-year lifecycle of the Wrynose release, delete it.

This patch also deletes the database fetcher recipes, and the test cases
that were specific to cve-check.  Note that the oe.cve_check library
still exists as this is used by the SPDX classes.

[1] https://lore.kernel.org/openembedded-core/7D6E419E-A7AE-4324-966C-355=
2C586E452@arm.com/
[2] https://github.com/bootlin/sbom-cve-check
[3] https://lore.kernel.org/openembedded-core/2CD10DD9-FB2A-4B10-B98A-859=
18EB6B4B7@arm.com/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass                | 570 ------------------
 meta/conf/distro/include/maintainers.inc      |   1 -
 meta/conf/documentation.conf                  |   2 -
 meta/lib/oeqa/selftest/cases/cve_check.py     | 172 ------
 .../recipes-core/meta/cve-update-db-native.bb | 421 -------------
 .../meta/cve-update-nvd2-native.bb            | 422 -------------
 6 files changed, 1588 deletions(-)
 delete mode 100644 meta/classes/cve-check.bbclass
 delete mode 100644 meta/recipes-core/meta/cve-update-db-native.bb
 delete mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbcl=
ass
deleted file mode 100644
index c63ebd56e16..00000000000
--- a/meta/classes/cve-check.bbclass
+++ /dev/null
@@ -1,570 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-# This class is used to check recipes against public CVEs.
-#
-# In order to use this class just inherit the class in the
-# local.conf file and it will add the cve_check task for
-# every recipe. The task can be used per recipe, per image,
-# or using the special cases "world" and "universe". The
-# cve_check task will print a warning for every unpatched
-# CVE found and generate a file in the recipe WORKDIR/cve
-# directory. If an image is build it will generate a report
-# in DEPLOY_DIR_IMAGE for all the packages used.
-#
-# Example:
-#   bitbake -c cve_check openssl
-#   bitbake core-image-sato
-#   bitbake -k -c cve_check universe
-#
-# DISCLAIMER
-#
-# This class/tool is meant to be used as support and not
-# the only method to check against CVEs. Running this tool
-# doesn't guarantee your packages are free of CVEs.
-
-# The product name that the CVE database uses defaults to BPN, but may n=
eed to
-# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=3Dlibtif=
f).
-CVE_PRODUCT ??=3D "${BPN}"
-CVE_VERSION ??=3D "${PV}"
-
-# Possible database sources: NVD1, NVD2, FKIE
-NVD_DB_VERSION ?=3D "FKIE"
-
-# Use different file names for each database source, as they synchronize=
 at different moments, so may be slightly different
-CVE_CHECK_DB_FILENAME ?=3D "${@'nvdcve_2-2.db' if d.getVar('NVD_DB_VERSI=
ON') =3D=3D 'NVD2' else 'nvdcve_1-3.db' if d.getVar('NVD_DB_VERSION') =3D=
=3D 'NVD1' else 'nvdfkie_1-1.db'}"
-CVE_CHECK_DB_FETCHER ?=3D "${@'cve-update-nvd2-native' if d.getVar('NVD_=
DB_VERSION') =3D=3D 'NVD2' else 'cve-update-db-native'}"
-CVE_CHECK_DB_DIR ?=3D "${STAGING_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?=3D "${CVE_CHECK_DB_DIR}/${CVE_CHECK_DB_FILENAME}"
-CVE_CHECK_DB_FILE_LOCK ?=3D "${CVE_CHECK_DB_FILE}.lock"
-
-CVE_CHECK_SUMMARY_DIR ?=3D "${LOG_DIR}/cve"
-CVE_CHECK_SUMMARY_FILE_NAME ?=3D "cve-summary"
-CVE_CHECK_SUMMARY_FILE_NAME_JSON =3D "cve-summary.json"
-CVE_CHECK_SUMMARY_INDEX_PATH =3D "${CVE_CHECK_SUMMARY_DIR}/cve-summary-i=
ndex.txt"
-
-CVE_CHECK_LOG_JSON ?=3D "${T}/cve.json"
-
-CVE_CHECK_DIR ??=3D "${DEPLOY_DIR}/cve"
-CVE_CHECK_RECIPE_FILE_JSON ?=3D "${CVE_CHECK_DIR}/${PN}_cve.json"
-CVE_CHECK_MANIFEST_JSON_SUFFIX ?=3D "json"
-CVE_CHECK_MANIFEST_JSON ?=3D "${IMGDEPLOYDIR}/${IMAGE_NAME}.${CVE_CHECK_=
MANIFEST_JSON_SUFFIX}"
-CVE_CHECK_COPY_FILES ??=3D "1"
-CVE_CHECK_CREATE_MANIFEST ??=3D "1"
-
-# Report Patched or Ignored CVEs
-CVE_CHECK_REPORT_PATCHED ??=3D "1"
-
-CVE_CHECK_SHOW_WARNINGS ??=3D "1"
-
-# Provide JSON output
-CVE_CHECK_FORMAT_JSON ??=3D "1"
-
-# Check for packages without CVEs (no issues or missing product name)
-CVE_CHECK_COVERAGE ??=3D "1"
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
-    from oe.cve_check import extend_cve_status
-    extend_cve_status(d)
-
-    nvd_database_type =3D d.getVar("NVD_DB_VERSION")
-    if nvd_database_type not in ("NVD1", "NVD2", "FKIE"):
-        bb.erroronce("Malformed NVD_DB_VERSION, must be one of: NVD1, NV=
D2, FKIE. Defaulting to NVD2")
-        d.setVar("NVD_DB_VERSION", "NVD2")
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
-python cve_save_summary_handler () {
-    import shutil
-    import datetime
-    from oe.cve_check import update_symlinks
-
-    cve_summary_name =3D d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
-    cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
-    bb.utils.mkdirhier(cvelogpath)
-
-    timestamp =3D datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-
-    if d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1":
-        json_summary_link_name =3D os.path.join(cvelogpath, d.getVar("CV=
E_CHECK_SUMMARY_FILE_NAME_JSON"))
-        json_summary_name =3D os.path.join(cvelogpath, "%s-%s.json" % (c=
ve_summary_name, timestamp))
-        generate_json_report(d, json_summary_name, json_summary_link_nam=
e)
-        bb.plain("Complete CVE JSON report summary created at: %s" % jso=
n_summary_link_name)
-}
-
-addhandler cve_save_summary_handler
-cve_save_summary_handler[eventmask] =3D "bb.event.BuildCompleted"
-
-python do_cve_check () {
-    """
-    Check recipe for patched and unpatched CVEs
-    """
-    from oe.cve_check import get_patched_cves
-
-    with bb.utils.fileslocked([d.getVar("CVE_CHECK_DB_FILE_LOCK")], shar=
ed=3DTrue):
-        if os.path.exists(d.getVar("CVE_CHECK_DB_FILE")):
-            try:
-                patched_cves =3D get_patched_cves(d)
-            except FileNotFoundError:
-                bb.fatal("Failure in searching patches")
-            cve_data, status =3D check_cves(d, patched_cves)
-            if len(cve_data) or (d.getVar("CVE_CHECK_COVERAGE") =3D=3D "=
1" and status):
-                get_cve_info(d, cve_data)
-                cve_write_data(d, cve_data, status)
-        else:
-            bb.note("No CVE database found, skipping CVE check")
-
-}
-
-addtask cve_check before do_build
-do_cve_check[depends] =3D "${CVE_CHECK_DB_FETCHER}:do_unpack"
-do_cve_check[nostamp] =3D "1"
-
-python cve_check_cleanup () {
-    """
-    Delete the file used to gather all the CVE information.
-    """
-    bb.utils.remove(e.data.getVar("CVE_CHECK_SUMMARY_INDEX_PATH"))
-}
-
-addhandler cve_check_cleanup
-cve_check_cleanup[eventmask] =3D "bb.event.BuildCompleted"
-
-python cve_check_write_rootfs_manifest () {
-    """
-    Create CVE manifest when building an image
-    """
-
-    import shutil
-    import json
-    from oe.rootfs import image_list_installed_packages
-    from oe.cve_check import cve_check_merge_jsons, update_symlinks
-
-    if d.getVar("CVE_CHECK_COPY_FILES") =3D=3D "1":
-        deploy_file_json =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-        if os.path.exists(deploy_file_json):
-            bb.utils.remove(deploy_file_json)
-
-    # Create a list of relevant recipies
-    recipies =3D set()
-    for pkg in list(image_list_installed_packages(d)):
-        pkg_info =3D os.path.join(d.getVar('PKGDATA_DIR'),
-                                'runtime-reverse', pkg)
-        pkg_data =3D oe.packagedata.read_pkgdatafile(pkg_info)
-        recipies.add(pkg_data["PN"])
-
-    bb.note("Writing rootfs CVE manifest")
-    deploy_dir =3D d.getVar("IMGDEPLOYDIR")
-    link_name =3D d.getVar("IMAGE_LINK_NAME")
-
-    json_data =3D {"version":"1", "package": []}
-    text_data =3D ""
-    enable_json =3D d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1"
-
-    save_pn =3D d.getVar("PN")
-
-    for pkg in recipies:
-        # To be able to use the CVE_CHECK_RECIPE_FILE_JSON variable we h=
ave to evaluate
-        # it with the different PN names set each time.
-        d.setVar("PN", pkg)
-
-        if enable_json:
-            pkgfilepath =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-            if os.path.exists(pkgfilepath):
-                with open(pkgfilepath) as j:
-                    data =3D json.load(j)
-                    cve_check_merge_jsons(json_data, data)
-
-    d.setVar("PN", save_pn)
-
-    if enable_json:
-        manifest_name_suffix =3D d.getVar("CVE_CHECK_MANIFEST_JSON_SUFFI=
X")
-        manifest_name =3D d.getVar("CVE_CHECK_MANIFEST_JSON")
-
-        with open(manifest_name, "w") as f:
-            json.dump(json_data, f, indent=3D2)
-
-        if link_name:
-            link_path =3D os.path.join(deploy_dir, "%s.%s" % (link_name,=
 manifest_name_suffix))
-            update_symlinks(manifest_name, link_path)
-
-        bb.plain("Image CVE JSON report stored in: %s" % manifest_name)
-}
-
-ROOTFS_POSTPROCESS_COMMAND:prepend =3D "${@'cve_check_write_rootfs_manif=
est ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
-do_rootfs[recrdeptask] +=3D "${@'do_cve_check' if d.getVar('CVE_CHECK_CR=
EATE_MANIFEST') =3D=3D '1' else ''}"
-do_populate_sdk[recrdeptask] +=3D "${@'do_cve_check' if d.getVar('CVE_CH=
ECK_CREATE_MANIFEST') =3D=3D '1' else ''}"
-
-def cve_is_ignored(d, cve_data, cve):
-    if cve not in cve_data:
-        return False
-    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
-        return True
-    return False
-
-def cve_is_patched(d, cve_data, cve):
-    if cve not in cve_data:
-        return False
-    if cve_data[cve]['abbrev-status'] =3D=3D "Patched":
-        return True
-    return False
-
-def cve_update(d, cve_data, cve, entry):
-    # If no entry, just add it
-    if cve not in cve_data:
-        cve_data[cve] =3D entry
-        return
-    # If we are updating, there might be change in the status
-    bb.debug(1, "Trying CVE entry update for %s from %s to %s" % (cve, c=
ve_data[cve]['abbrev-status'], entry['abbrev-status']))
-    if cve_data[cve]['abbrev-status'] =3D=3D "Unknown":
-        cve_data[cve] =3D entry
-        return
-    if cve_data[cve]['abbrev-status'] =3D=3D entry['abbrev-status']:
-        return
-    # Update like in {'abbrev-status': 'Patched', 'status': 'version-not=
-in-range'} to {'abbrev-status': 'Unpatched', 'status': 'version-in-range=
'}
-    if entry['abbrev-status'] =3D=3D "Unpatched" and cve_data[cve]['abbr=
ev-status'] =3D=3D "Patched":
-        if entry['status'] =3D=3D "version-in-range" and cve_data[cve]['=
status'] =3D=3D "version-not-in-range":
-            # New result from the scan, vulnerable
-            cve_data[cve] =3D entry
-            bb.debug(1, "CVE entry %s update from Patched to Unpatched f=
rom the scan result" % cve)
-            return
-    if entry['abbrev-status'] =3D=3D "Patched" and cve_data[cve]['abbrev=
-status'] =3D=3D "Unpatched":
-        if entry['status'] =3D=3D "version-not-in-range" and cve_data[cv=
e]['status'] =3D=3D "version-in-range":
-            # Range does not match the scan, but we already have a vulne=
rable match, ignore
-            bb.debug(1, "CVE entry %s update from Patched to Unpatched f=
rom the scan result - not applying" % cve)
-            return
-    # If we have an "Ignored", it has a priority
-    if cve_data[cve]['abbrev-status'] =3D=3D "Ignored":
-        bb.debug(1, "CVE %s not updating because Ignored" % cve)
-        return
-    bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve, cv=
e_data[cve], entry))
-
-def check_cves(d, cve_data):
-    """
-    Connect to the NVD database and find unpatched cves.
-    """
-    from oe.cve_check import Version, convert_cve_version, decode_cve_st=
atus
-
-    pn =3D d.getVar("PN")
-    real_pv =3D d.getVar("PV")
-    suffix =3D d.getVar("CVE_VERSION_SUFFIX")
-
-    cves_status =3D []
-    cves_in_recipe =3D False
-    # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
-    products =3D d.getVar("CVE_PRODUCT").split()
-    # If this has been unset then we're not scanning for CVEs here (for =
example, image recipes)
-    if not products:
-        return ([], [])
-    pv =3D d.getVar("CVE_VERSION").split("+git")[0]
-
-    # If the recipe has been skipped/ignored we return empty lists
-    if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
-        bb.note("Recipe has been skipped by cve-check")
-        return ([], [])
-
-    import sqlite3
-    db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
-    conn =3D sqlite3.connect(db_file, uri=3DTrue)
-
-    # For each of the known product names (e.g. curl has CPEs using curl=
 and libcurl)...
-    for product in products:
-        cves_in_product =3D False
-        if ":" in product:
-            vendor, product =3D product.split(":", 1)
-        else:
-            vendor =3D "%"
-
-        # Find all relevant CVE IDs.
-        cve_cursor =3D conn.execute("SELECT DISTINCT ID FROM PRODUCTS WH=
ERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor))
-        for cverow in cve_cursor:
-            cve =3D cverow[0]
-
-            # Write status once only for each product
-            if not cves_in_product:
-                cves_status.append([product, True])
-                cves_in_product =3D True
-                cves_in_recipe =3D True
-
-            if cve_is_ignored(d, cve_data, cve):
-                bb.note("%s-%s ignores %s" % (product, pv, cve))
-                continue
-            elif cve_is_patched(d, cve_data, cve):
-                bb.note("%s has been patched" % (cve))
-                continue
-
-            vulnerable =3D False
-            ignored =3D False
-
-            product_cursor =3D conn.execute("SELECT * FROM PRODUCTS WHER=
E ID IS ? AND PRODUCT IS ? AND VENDOR LIKE ?", (cve, product, vendor))
-            for row in product_cursor:
-                (_, _, _, version_start, operator_start, version_end, op=
erator_end) =3D row
-                #bb.debug(2, "Evaluating row " + str(row))
-                if cve_is_ignored(d, cve_data, cve):
-                    ignored =3D True
-
-                version_start =3D convert_cve_version(version_start)
-                version_end =3D convert_cve_version(version_end)
-
-                if (operator_start =3D=3D '=3D' and pv =3D=3D version_st=
art) or version_start =3D=3D '-':
-                    vulnerable =3D True
-                else:
-                    if operator_start:
-                        try:
-                            vulnerable_start =3D  (operator_start =3D=3D=
 '>=3D' and Version(pv,suffix) >=3D Version(version_start,suffix))
-                            vulnerable_start |=3D (operator_start =3D=3D=
 '>' and Version(pv,suffix) > Version(version_start,suffix))
-                        except:
-                            bb.warn("%s: Failed to compare %s %s %s for =
%s" %
-                                    (product, pv, operator_start, versio=
n_start, cve))
-                            vulnerable_start =3D False
-                    else:
-                        vulnerable_start =3D False
-
-                    if operator_end:
-                        try:
-                            vulnerable_end  =3D (operator_end =3D=3D '<=3D=
' and Version(pv,suffix) <=3D Version(version_end,suffix) )
-                            vulnerable_end |=3D (operator_end =3D=3D '<'=
 and Version(pv,suffix) < Version(version_end,suffix) )
-                        except:
-                            bb.warn("%s: Failed to compare %s %s %s for =
%s" %
-                                    (product, pv, operator_end, version_=
end, cve))
-                            vulnerable_end =3D False
-                    else:
-                        vulnerable_end =3D False
-
-                    if operator_start and operator_end:
-                        vulnerable =3D vulnerable_start and vulnerable_e=
nd
-                    else:
-                        vulnerable =3D vulnerable_start or vulnerable_en=
d
-
-                if vulnerable:
-                    if ignored:
-                        bb.note("%s is ignored in %s-%s" % (cve, pn, rea=
l_pv))
-                        cve_update(d, cve_data, cve, {"abbrev-status": "=
Ignored"})
-                    else:
-                        bb.note("%s-%s is vulnerable to %s" % (pn, real_=
pv, cve))
-                        cve_update(d, cve_data, cve, {"abbrev-status": "=
Unpatched", "status": "version-in-range"})
-                    break
-            product_cursor.close()
-
-            if not vulnerable:
-                bb.note("%s-%s is not vulnerable to %s" % (pn, real_pv, =
cve))
-                cve_update(d, cve_data, cve, {"abbrev-status": "Patched"=
, "status": "version-not-in-range"})
-        cve_cursor.close()
-
-        if not cves_in_product:
-            bb.note("No CVE records found for product %s, pn %s" % (prod=
uct, pn))
-            cves_status.append([product, False])
-
-    conn.close()
-
-    if not cves_in_recipe:
-        bb.note("No CVE records for products in recipe %s" % (pn))
-
-    if d.getVar("CVE_CHECK_SHOW_WARNINGS") =3D=3D "1":
-        unpatched_cves =3D [cve for cve in cve_data if cve_data[cve]["ab=
brev-status"] =3D=3D "Unpatched"]
-        if unpatched_cves:
-            bb.warn("Found unpatched CVE (%s)" % " ".join(unpatched_cves=
))
-
-    return (cve_data, cves_status)
-
-def get_cve_info(d, cve_data):
-    """
-    Get CVE information from the database.
-    """
-
-    import sqlite3
-
-    db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
-    conn =3D sqlite3.connect(db_file, uri=3DTrue)
-
-    for cve in cve_data:
-        cursor =3D conn.execute("SELECT * FROM NVD WHERE ID IS ?", (cve,=
))
-        for row in cursor:
-            # The CVE itdelf has been added already
-            if row[0] not in cve_data:
-                bb.note("CVE record %s not present" % row[0])
-                continue
-            #cve_data[row[0]] =3D {}
-            cve_data[row[0]]["NVD-summary"] =3D row[1]
-            cve_data[row[0]]["NVD-scorev2"] =3D row[2]
-            cve_data[row[0]]["NVD-scorev3"] =3D row[3]
-            cve_data[row[0]]["NVD-scorev4"] =3D row[4]
-            cve_data[row[0]]["NVD-modified"] =3D row[5]
-            cve_data[row[0]]["NVD-vector"] =3D row[6]
-            cve_data[row[0]]["NVD-vectorString"] =3D row[7]
-        cursor.close()
-    conn.close()
-
-def cve_check_write_json_output(d, output, direct_file, deploy_file, man=
ifest_file):
-    """
-    Write CVE information in the JSON format: to WORKDIR; and to
-    CVE_CHECK_DIR, if CVE manifest if enabled, write fragment
-    files that will be assembled at the end in cve_check_write_rootfs_ma=
nifest.
-    """
-
-    import json
-
-    write_string =3D json.dumps(output, indent=3D2)
-    with open(direct_file, "w") as f:
-        bb.note("Writing file %s with CVE information" % direct_file)
-        f.write(write_string)
-
-    if d.getVar("CVE_CHECK_COPY_FILES") =3D=3D "1":
-        bb.utils.mkdirhier(os.path.dirname(deploy_file))
-        with open(deploy_file, "w") as f:
-            f.write(write_string)
-
-    if d.getVar("CVE_CHECK_CREATE_MANIFEST") =3D=3D "1":
-        cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
-        index_path =3D d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
-        bb.utils.mkdirhier(cvelogpath)
-        fragment_file =3D os.path.basename(deploy_file)
-        fragment_path =3D os.path.join(cvelogpath, fragment_file)
-        with open(fragment_path, "w") as f:
-            f.write(write_string)
-        with open(index_path, "a+") as f:
-            f.write("%s\n" % fragment_path)
-
-def cve_write_data_json(d, cve_data, cve_status):
-    """
-    Prepare CVE data for the JSON format, then write it.
-    """
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
-    report_all =3D d.getVar("CVE_CHECK_REPORT_PATCHED") =3D=3D "1"
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
-
-    package_version =3D "%s%s" % (d.getVar("EXTENDPE"), d.getVar("PV"))
-    package_data =3D {
-        "name" : d.getVar("PN"),
-        "layer" : layer,
-        "version" : package_version,
-        "products": product_data
-    }
-
-    cve_list =3D []
-
-    for cve in sorted(cve_data):
-        if not report_all and (cve_data[cve]["abbrev-status"] =3D=3D "Pa=
tched" or cve_data[cve]["abbrev-status"] =3D=3D "Ignored"):
-            continue
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
-            cve_item["modified"] =3D cve_data[cve]["NVD-modified"]
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
-    direct_file =3D d.getVar("CVE_CHECK_LOG_JSON")
-    deploy_file =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
-    manifest_file =3D d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON")
-
-    cve_check_write_json_output(d, output, direct_file, deploy_file, man=
ifest_file)
-
-def cve_write_data(d, cve_data, status):
-    """
-    Write CVE data in each enabled format.
-    """
-
-    if d.getVar("CVE_CHECK_FORMAT_JSON") =3D=3D "1":
-        cve_write_data_json(d, cve_data, status)
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 1bd43211e23..a429320b88b 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -140,7 +140,6 @@ RECIPE_MAINTAINER:pn-cryptodev-module =3D "Robert Yan=
g <liezhi.yang@windriver.com>
 RECIPE_MAINTAINER:pn-cryptodev-tests =3D "Robert Yang <liezhi.yang@windr=
iver.com>"
 RECIPE_MAINTAINER:pn-cups =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-curl =3D "Robert Joslyn <robert.joslyn@redrectangle=
.org>"
-RECIPE_MAINTAINER:pn-cve-update-nvd2-native =3D "Ross Burton <ross.burto=
n@arm.com>"
 RECIPE_MAINTAINER:pn-db =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dbus =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-dbus-glib =3D "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 1853676fa06..9d429ba9a31 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -121,8 +121,6 @@ CONFLICT_MACHINE_FEATURES[doc] =3D "When a recipe inh=
erits the features_check clas
 CORE_IMAGE_EXTRA_INSTALL[doc] =3D "Specifies the list of packages to be =
added to the image. You should only set this variable in the conf/local.c=
onf file in the Build Directory."
 COREBASE[doc] =3D "Specifies the parent directory of the OpenEmbedded Co=
re Metadata layer (i.e. meta)."
 CONF_VERSION[doc] =3D "Tracks the version of local.conf.  Increased each=
 time build/conf/ changes incompatibly."
-CVE_CHECK_LAYER_EXCLUDELIST[doc] =3D "Defines which layers to exclude fr=
om cve-check scanning"
-CVE_CHECK_LAYER_INCLUDELIST[doc] =3D "Defines which layers to include du=
ring cve-check scanning"
=20
 #D
=20
diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/se=
lftest/cases/cve_check.py
index 511e4b81b41..891a7de3317 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -4,10 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import json
-import os
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, get_bb_vars
=20
 class CVECheck(OESelftestTestCase):
=20
@@ -325,172 +322,3 @@ class CVECheck(OESelftestTestCase):
             ),
             {"CVE-2019-6461", "CVE-2019-6462", "CVE-2019-6463", "CVE-201=
9-6464"},
         )
-
-    def test_recipe_report_json(self):
-        config =3D """
-INHERIT +=3D "cve-check"
-CVE_CHECK_FORMAT_JSON =3D "1"
-"""
-        self.write_config(config)
-
-        vars =3D get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMAR=
Y_FILE_NAME_JSON"])
-        summary_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], var=
s["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        recipe_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "m4-=
native_cve.json")
-
-        try:
-            os.remove(summary_json)
-            os.remove(recipe_json)
-        except FileNotFoundError:
-            pass
-
-        bitbake("m4-native -c cve_check")
-
-        def check_m4_json(filename):
-            with open(filename) as f:
-                report =3D json.load(f)
-            self.assertEqual(report["version"], "1")
-            self.assertEqual(len(report["package"]), 1)
-            package =3D report["package"][0]
-            self.assertEqual(package["name"], "m4-native")
-            found_cves =3D { issue["id"]: issue["status"] for issue in p=
ackage["issue"]}
-            self.assertIn("CVE-2008-1687", found_cves)
-            self.assertEqual(found_cves["CVE-2008-1687"], "Patched")
-
-        self.assertExists(summary_json)
-        check_m4_json(summary_json)
-        self.assertExists(recipe_json)
-        check_m4_json(recipe_json)
-
-
-    def test_image_json(self):
-        config =3D """
-INHERIT +=3D "cve-check"
-CVE_CHECK_FORMAT_JSON =3D "1"
-"""
-        self.write_config(config)
-
-        vars =3D get_bb_vars(["CVE_CHECK_DIR", "CVE_CHECK_SUMMARY_DIR", =
"CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        report_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], vars=
["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        print(report_json)
-        try:
-            os.remove(report_json)
-        except FileNotFoundError:
-            pass
-
-        bitbake("core-image-minimal-initramfs")
-        self.assertExists(report_json)
-
-        # Check that the summary report lists at least one package
-        with open(report_json) as f:
-            report =3D json.load(f)
-        self.assertEqual(report["version"], "1")
-        self.assertGreater(len(report["package"]), 1)
-
-        # Check that a random recipe wrote a recipe report to deploy/cve=
/
-        recipename =3D report["package"][0]["name"]
-        recipe_report =3D os.path.join(vars["CVE_CHECK_DIR"], recipename=
 + "_cve.json")
-        self.assertExists(recipe_report)
-        with open(recipe_report) as f:
-            report =3D json.load(f)
-        self.assertEqual(report["version"], "1")
-        self.assertEqual(len(report["package"]), 1)
-        self.assertEqual(report["package"][0]["name"], recipename)
-
-
-    def test_recipe_report_json_unpatched(self):
-        config =3D """
-INHERIT +=3D "cve-check"
-CVE_CHECK_FORMAT_JSON =3D "1"
-CVE_CHECK_REPORT_PATCHED =3D "0"
-"""
-        self.write_config(config)
-
-        vars =3D get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMAR=
Y_FILE_NAME_JSON"])
-        summary_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], var=
s["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        recipe_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "m4-=
native_cve.json")
-
-        try:
-            os.remove(summary_json)
-            os.remove(recipe_json)
-        except FileNotFoundError:
-            pass
-
-        bitbake("m4-native -c cve_check")
-
-        def check_m4_json(filename):
-            with open(filename) as f:
-                report =3D json.load(f)
-            self.assertEqual(report["version"], "1")
-            self.assertEqual(len(report["package"]), 1)
-            package =3D report["package"][0]
-            self.assertEqual(package["name"], "m4-native")
-            #m4 had only Patched CVEs, so the issues array will be empty
-            self.assertEqual(package["issue"], [])
-
-        self.assertExists(summary_json)
-        check_m4_json(summary_json)
-        self.assertExists(recipe_json)
-        check_m4_json(recipe_json)
-
-
-    def test_recipe_report_json_ignored(self):
-        config =3D """
-INHERIT +=3D "cve-check"
-CVE_CHECK_FORMAT_JSON =3D "1"
-CVE_CHECK_REPORT_PATCHED =3D "1"
-"""
-        self.write_config(config)
-
-        vars =3D get_bb_vars(["CVE_CHECK_SUMMARY_DIR", "CVE_CHECK_SUMMAR=
Y_FILE_NAME_JSON"])
-        summary_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], var=
s["CVE_CHECK_SUMMARY_FILE_NAME_JSON"])
-        recipe_json =3D os.path.join(vars["CVE_CHECK_SUMMARY_DIR"], "log=
rotate_cve.json")
-
-        try:
-            os.remove(summary_json)
-            os.remove(recipe_json)
-        except FileNotFoundError:
-            pass
-
-        bitbake("logrotate -c cve_check")
-
-        def check_m4_json(filename):
-            with open(filename) as f:
-                report =3D json.load(f)
-            self.assertEqual(report["version"], "1")
-            self.assertEqual(len(report["package"]), 1)
-            package =3D report["package"][0]
-            self.assertEqual(package["name"], "logrotate")
-            found_cves =3D {}
-            for issue in package["issue"]:
-                found_cves[issue["id"]] =3D {
-                    "status" : issue["status"],
-                    "detail" : issue["detail"] if "detail" in issue else=
 "",
-                    "description" : issue["description"] if "description=
" in issue else ""
-                }
-            # m4 CVE should not be in logrotate
-            self.assertNotIn("CVE-2008-1687", found_cves)
-            # logrotate has both Patched and Ignored CVEs
-            detail =3D "version-not-in-range"
-            self.assertIn("CVE-2011-1098", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1098"]["status"], "Pat=
ched")
-            self.assertEqual(found_cves["CVE-2011-1098"]["detail"], deta=
il)
-            self.assertEqual(len(found_cves["CVE-2011-1098"]["descriptio=
n"]), 0)
-            detail =3D "not-applicable-platform"
-            description =3D "CVE is debian, gentoo or SUSE specific on t=
he way logrotate was installed/used"
-            self.assertIn("CVE-2011-1548", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1548"]["status"], "Ign=
ored")
-            self.assertEqual(found_cves["CVE-2011-1548"]["detail"], deta=
il)
-            self.assertEqual(found_cves["CVE-2011-1548"]["description"],=
 description)
-            self.assertIn("CVE-2011-1549", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1549"]["status"], "Ign=
ored")
-            self.assertEqual(found_cves["CVE-2011-1549"]["detail"], deta=
il)
-            self.assertEqual(found_cves["CVE-2011-1549"]["description"],=
 description)
-            self.assertIn("CVE-2011-1550", found_cves)
-            self.assertEqual(found_cves["CVE-2011-1550"]["status"], "Ign=
ored")
-            self.assertEqual(found_cves["CVE-2011-1550"]["detail"], deta=
il)
-            self.assertEqual(found_cves["CVE-2011-1550"]["description"],=
 description)
-
-        self.assertExists(summary_json)
-        check_m4_json(summary_json)
-        self.assertExists(recipe_json)
-        check_m4_json(recipe_json)
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipe=
s-core/meta/cve-update-db-native.bb
deleted file mode 100644
index 01f942dcdbf..00000000000
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ /dev/null
@@ -1,421 +0,0 @@
-SUMMARY =3D "Updates the NVD CVE database"
-LICENSE =3D "MIT"
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-inherit native
-
-deltask do_patch
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
-
-NVDCVE_URL ?=3D "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
-FKIE_URL ?=3D "https://github.com/fkie-cad/nvd-json-data-feeds/releases/=
latest/download/CVE-"
-
-# CVE database update interval, in seconds. By default: once a day (23*6=
0*60).
-# Use 0 to force the update
-# Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?=3D "82800"
-
-# Timeout for blocking socket operations, such as the connection attempt=
.
-CVE_SOCKET_TIMEOUT ?=3D "60"
-
-CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENA=
ME}"
-CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
-CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
-
-python () {
-    if not bb.data.inherits_class("cve-check", d):
-        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is n=
ot loaded.")
-}
-
-python do_fetch() {
-    """
-    Update NVD database with json data feed
-    """
-    import bb.utils
-    import bb.progress
-    import shutil
-
-    bb.utils.export_proxies(d)
-
-    db_file =3D d.getVar("CVE_CHECK_DB_DLDIR_FILE")
-    db_dir =3D os.path.dirname(db_file)
-    db_tmp_file =3D d.getVar("CVE_CHECK_DB_TEMP_FILE")
-
-    cleanup_db_download(db_tmp_file)
-
-    # The NVD database changes once a day, so no need to update more fre=
quently
-    # Allow the user to force-update
-    try:
-        import time
-        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
-        if update_interval < 0:
-            bb.note("CVE database update skipped")
-            if not os.path.exists(db_file):
-                bb.error("CVE database %s not present, database fetch/up=
date skipped" % db_file)
-            return
-        curr_time =3D time.time()
-        database_time =3D os.path.getmtime(db_file)
-        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time)=
, time.ctime(database_time)))
-        if curr_time < database_time:
-            bb.warn("Database time is in the future, force DB update")
-        elif curr_time - database_time < update_interval:
-            bb.note("CVE database recently updated, skipping")
-            return
-
-    except OSError:
-        pass
-
-    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
-        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe =
uses CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable f=
etch or update")
-
-    bb.utils.mkdirhier(db_dir)
-    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
-    if os.path.exists(db_file):
-        shutil.copy2(db_file, db_tmp_file)
-
-    if update_db_file(db_tmp_file, d):
-        # Update downloaded correctly, we can swap files. To avoid poten=
tial
-        # NFS caching issues, ensure that the destination file has a new=
 inode
-        # number. We do this in two steps as the downloads directory may=
 be on
-        # a different filesystem to tmpdir we're working in.
-        new_file =3D "%s.new" % (db_file)
-        shutil.move(db_tmp_file, new_file)
-        os.rename(new_file, db_file)
-    else:
-        # Update failed, do not modify the database
-        bb.warn("CVE database update failed")
-        os.remove(db_tmp_file)
-}
-
-do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}"
-do_fetch[file-checksums] =3D ""
-do_fetch[vardeps] =3D ""
-
-python do_unpack() {
-    import shutil
-    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_C=
HECK_DB_FILE"))
-}
-do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FIL=
E_LOCK}"
-
-def cleanup_db_download(db_tmp_file):
-    """
-    Cleanup the download space from possible failed downloads
-    """
-
-    # Clean-up the temporary file downloads, we can remove both journal
-    # and the temporary database
-    if os.path.exists("{0}-journal".format(db_tmp_file)):
-        os.remove("{0}-journal".format(db_tmp_file))
-    if os.path.exists(db_tmp_file):
-        os.remove(db_tmp_file)
-
-def db_file_names(d, year, is_nvd):
-    if is_nvd:
-        year_url =3D d.getVar('NVDCVE_URL') + str(year)
-        meta_url =3D year_url + ".meta"
-        json_url =3D year_url + ".json.gz"
-        return json_url, meta_url
-    year_url =3D d.getVar('FKIE_URL') + str(year)
-    meta_url =3D year_url + ".meta"
-    json_url =3D year_url + ".json.xz"
-    return json_url, meta_url
-
-def host_db_name(d, is_nvd):
-    if is_nvd:
-        return "nvd.nist.gov"
-    return "github.com"
-
-def db_decompress(d, data, is_nvd):
-    import gzip, lzma
-
-    if is_nvd:
-        return gzip.decompress(data).decode('utf-8')
-    # otherwise
-    return lzma.decompress(data)
-
-def update_db_file(db_tmp_file, d):
-    """
-    Update the given database file
-    """
-    import bb.progress
-    import bb.utils
-    from datetime import date
-    import sqlite3
-    import urllib
-
-    YEAR_START =3D 2002
-    cve_socket_timeout =3D int(d.getVar("CVE_SOCKET_TIMEOUT"))
-    is_nvd =3D d.getVar("NVD_DB_VERSION") =3D=3D "NVD1"
-
-    # Connect to database
-    conn =3D sqlite3.connect(db_tmp_file)
-    initialize_db(conn)
-
-    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVa=
r("TMPDIR"), 'cve_check'), 'a') as cve_f:
-        total_years =3D date.today().year + 1 - YEAR_START
-        for i, year in enumerate(range(YEAR_START, date.today().year + 1=
)):
-            bb.note("Updating %d" % year)
-            ph.update((float(i + 1) / total_years) * 100)
-            json_url, meta_url =3D db_file_names(d, year, is_nvd)
-
-            # Retrieve meta last modified date
-            try:
-                response =3D urllib.request.urlopen(meta_url, timeout=3D=
cve_socket_timeout)
-            except urllib.error.URLError as e:
-                cve_f.write('Warning: CVE db update error, Unable to fet=
ch CVE data.\n\n')
-                bb.warn("Failed to fetch CVE data (%s)" % e)
-                import socket
-                result =3D socket.getaddrinfo(host_db_name(d, is_nvd), 4=
43, proto=3Dsocket.IPPROTO_TCP)
-                bb.warn("Host IPs are %s" % (", ".join(t[4][0] for t in =
result)))
-                return False
-
-            if response:
-                for line in response.read().decode("utf-8").splitlines()=
:
-                    key, value =3D line.split(":", 1)
-                    if key =3D=3D "lastModifiedDate":
-                        last_modified =3D value
-                        break
-                else:
-                    bb.warn("Cannot parse CVE metadata, update failed")
-                    return False
-
-            # Compare with current db last modified date
-            cursor =3D conn.execute("select DATE from META where YEAR =3D=
 ?", (year,))
-            meta =3D cursor.fetchone()
-            cursor.close()
-
-            if not meta or meta[0] !=3D last_modified:
-                bb.note("Updating entries")
-                # Clear products table entries corresponding to current =
year
-                conn.execute("delete from PRODUCTS where ID like ?", ('C=
VE-%d%%' % year,)).close()
-
-                # Update db with current year json file
-                try:
-                    response =3D urllib.request.urlopen(json_url, timeou=
t=3Dcve_socket_timeout)
-                    if response:
-                        update_db(d, conn, db_decompress(d, response.rea=
d(), is_nvd))
-                    conn.execute("insert or replace into META values (?,=
 ?)", [year, last_modified]).close()
-                except urllib.error.URLError as e:
-                    cve_f.write('Warning: CVE db update error, CVE data =
is outdated.\n\n')
-                    bb.warn("Cannot parse CVE data (%s), update failed" =
% e.reason)
-                    return False
-            else:
-                bb.debug(2, "Already up to date (last modified %s)" % la=
st_modified)
-            # Update success, set the date to cve_check file.
-            if year =3D=3D date.today().year:
-                cve_f.write('CVE database update : %s\n\n' % date.today(=
))
-
-        conn.commit()
-        conn.close()
-        return True
-
-def initialize_db(conn):
-    with conn:
-        c =3D conn.cursor()
-
-        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE,=
 DATE TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMA=
RY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, =
VECTOR TEXT, VECTORSTRING TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
-            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_STAR=
T TEXT, \
-            VERSION_END TEXT, OPERATOR_END TEXT)")
-        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS=
(ID);")
-
-        c.close()
-
-def parse_node_and_insert(conn, node, cveId, is_nvd):
-    # Parse children node if needed
-    for child in node.get('children', ()):
-        parse_node_and_insert(conn, child, cveId, is_nvd)
-
-    def cpe_generator(is_nvd):
-        match_string =3D "cpeMatch"
-        cpe_string =3D 'criteria'
-        if is_nvd:
-            match_string =3D "cpe_match"
-            cpe_string =3D 'cpe23Uri'
-
-        for cpe in node.get(match_string, ()):
-            if not cpe['vulnerable']:
-                return
-            cpe23 =3D cpe.get(cpe_string)
-            if not cpe23:
-                return
-            cpe23 =3D cpe23.split(':')
-            if len(cpe23) < 6:
-                return
-            vendor =3D cpe23[3]
-            product =3D cpe23[4]
-            version =3D cpe23[5]
-
-            if cpe23[6] =3D=3D '*' or cpe23[6] =3D=3D '-':
-                version_suffix =3D ""
-            else:
-                version_suffix =3D "_" + cpe23[6]
-
-            if version !=3D '*' and version !=3D '-':
-                # Version is defined, this is a '=3D' match
-                yield [cveId, vendor, product, version + version_suffix,=
 '=3D', '', '']
-            elif version =3D=3D '-':
-                # no version information is available
-                yield [cveId, vendor, product, version, '', '', '']
-            else:
-                # Parse start version, end version and operators
-                op_start =3D ''
-                op_end =3D ''
-                v_start =3D ''
-                v_end =3D ''
-
-                if 'versionStartIncluding' in cpe:
-                    op_start =3D '>=3D'
-                    v_start =3D cpe['versionStartIncluding']
-
-                if 'versionStartExcluding' in cpe:
-                    op_start =3D '>'
-                    v_start =3D cpe['versionStartExcluding']
-
-                if 'versionEndIncluding' in cpe:
-                    op_end =3D '<=3D'
-                    v_end =3D cpe['versionEndIncluding']
-
-                if 'versionEndExcluding' in cpe:
-                    op_end =3D '<'
-                    v_end =3D cpe['versionEndExcluding']
-
-                if op_start or op_end or v_start or v_end:
-                    yield [cveId, vendor, product, v_start, op_start, v_=
end, op_end]
-                else:
-                    # This is no version information, expressed differen=
tly.
-                    # Save processing by representing as -.
-                    yield [cveId, vendor, product, '-', '', '', '']
-
-    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"=
, cpe_generator(is_nvd)).close()
-
-def update_db_nvdjson(conn, jsondata):
-    import json
-    root =3D json.loads(jsondata)
-
-    for elt in root['CVE_Items']:
-        if not elt['impact']:
-            continue
-
-        accessVector =3D None
-        vectorString =3D None
-        cvssv2 =3D 0.0
-        cvssv3 =3D 0.0
-        cvssv4 =3D 0.0
-        cveId =3D elt['cve']['CVE_data_meta']['ID']
-        cveDesc =3D elt['cve']['description']['description_data'][0]['va=
lue']
-        date =3D elt['lastModifiedDate']
-        try:
-            accessVector =3D elt['impact']['baseMetricV2']['cvssV2']['ac=
cessVector']
-            vectorString =3D elt['impact']['baseMetricV2']['cvssV2']['ve=
ctorString']
-            cvssv2 =3D elt['impact']['baseMetricV2']['cvssV2']['baseScor=
e']
-        except KeyError:
-            cvssv2 =3D 0.0
-        try:
-            accessVector =3D accessVector or elt['impact']['baseMetricV3=
']['cvssV3']['attackVector']
-            vectorString =3D vectorString or elt['impact']['baseMetricV3=
']['cvssV3']['vectorString']
-            cvssv3 =3D elt['impact']['baseMetricV3']['cvssV3']['baseScor=
e']
-        except KeyError:
-            accessVector =3D accessVector or "UNKNOWN"
-            cvssv3 =3D 0.0
-
-        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, =
?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVec=
tor, vectorString]).close()
-
-        configurations =3D elt['configurations']['nodes']
-        for config in configurations:
-            parse_node_and_insert(conn, config, cveId, True)
-
-def get_metric_entry(metric):
-    primaries =3D [c for c in metric if c['type'] =3D=3D "Primary"]
-    secondaries =3D [c for c in metric if c['type'] =3D=3D "Secondary"]
-    if len(primaries) > 0:
-        return primaries[0]
-    elif len(secondaries) > 0:
-        return secondaries[0]
-    return None
-
-def update_db_fkie(conn, jsondata):
-    import json
-    root =3D json.loads(jsondata)
-
-    for elt in root['cve_items']:
-        if 'vulnStatus' not in elt or elt['vulnStatus'] =3D=3D 'Rejected=
':
-            continue
-
-        if 'configurations' not in elt:
-            continue
-
-        accessVector =3D None
-        vectorString =3D None
-        cvssv2 =3D 0.0
-        cvssv3 =3D 0.0
-        cvssv4 =3D 0.0
-        cveId =3D elt['id']
-        cveDesc =3D elt['descriptions'][0]['value']
-        date =3D elt['lastModified']
-        try:
-            if 'cvssMetricV2' in elt['metrics']:
-                entry =3D get_metric_entry(elt['metrics']['cvssMetricV2'=
])
-                if entry:
-                    accessVector =3D entry['cvssData']['accessVector']
-                    vectorString =3D entry['cvssData']['vectorString']
-                    cvssv2 =3D entry['cvssData']['baseScore']
-        except KeyError:
-            cvssv2 =3D 0.0
-        try:
-            if 'cvssMetricV30' in elt['metrics']:
-                entry =3D get_metric_entry(elt['metrics']['cvssMetricV30=
'])
-                if entry:
-                    accessVector =3D entry['cvssData']['attackVector']
-                    vectorString =3D entry['cvssData']['vectorString']
-                    cvssv3 =3D entry['cvssData']['baseScore']
-        except KeyError:
-            accessVector =3D accessVector or "UNKNOWN"
-            cvssv3 =3D 0.0
-        try:
-            if 'cvssMetricV31' in elt['metrics']:
-                entry =3D get_metric_entry(elt['metrics']['cvssMetricV31=
'])
-                if entry:
-                    accessVector =3D entry['cvssData']['attackVector']
-                    vectorString =3D entry['cvssData']['vectorString']
-                    cvssv3 =3D entry['cvssData']['baseScore']
-        except KeyError:
-            accessVector =3D accessVector or "UNKNOWN"
-            cvssv3 =3D 0.0
-        try:
-            if 'cvssMetricV40' in elt['metrics']:
-                entry =3D get_metric_entry(elt['metrics']['cvssMetricV40=
'])
-                if entry:
-                    accessVector =3D entry['cvssData']['attackVector']
-                    vectorString =3D entry['cvssData']['vectorString']
-                    cvssv4 =3D entry['cvssData']['baseScore']
-        except KeyError:
-            accessVector =3D accessVector or "UNKNOWN"
-            cvssv4 =3D 0.0
-
-        conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, =
?, ?, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVec=
tor, vectorString]).close()
-
-        for config in elt['configurations']:
-            # This is suboptimal as it doesn't handle AND/OR and negate,=
 but is better than nothing
-            for node in config.get("nodes") or []:
-                parse_node_and_insert(conn, node, cveId, False)
-
-def update_db(d, conn, jsondata):
-    if (d.getVar("NVD_DB_VERSION") =3D=3D "FKIE"):
-        return update_db_fkie(conn, jsondata)
-    else:
-        return update_db_nvdjson(conn, jsondata)
-
-do_fetch[nostamp] =3D "1"
-
-EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/reci=
pes-core/meta/cve-update-nvd2-native.bb
deleted file mode 100644
index 41c34ba0d01..00000000000
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ /dev/null
@@ -1,422 +0,0 @@
-SUMMARY =3D "Updates the NVD CVE database"
-LICENSE =3D "MIT"
-
-# Important note:
-# This product uses the NVD API but is not endorsed or certified by the =
NVD.
-
-INHIBIT_DEFAULT_DEPS =3D "1"
-
-inherit native
-
-deltask do_patch
-deltask do_configure
-deltask do_compile
-deltask do_install
-deltask do_populate_sysroot
-
-NVDCVE_URL ?=3D "https://services.nvd.nist.gov/rest/json/cves/2.0"
-
-# If you have a NVD API key (https://nvd.nist.gov/developers/request-an-=
api-key)
-# then setting this to get higher rate limits.
-NVDCVE_API_KEY ?=3D ""
-
-# CVE database update interval, in seconds. By default: once a day (23*6=
0*60).
-# Use 0 to force the update
-# Use a negative value to skip the update
-CVE_DB_UPDATE_INTERVAL ?=3D "82800"
-
-# CVE database incremental update age threshold, in seconds. If the data=
base is
-# older than this threshold, do a full re-download, else, do an incremen=
tal
-# update. By default: the maximum allowed value from NVD: 120 days (120*=
24*60*60)
-# Use 0 to force a full download.
-CVE_DB_INCR_UPDATE_AGE_THRES ?=3D "10368000"
-
-# Number of attempts for each http query to nvd server before giving up
-CVE_DB_UPDATE_ATTEMPTS ?=3D "5"
-
-CVE_CHECK_DB_DLDIR_FILE ?=3D "${DL_DIR}/CVE_CHECK2/${CVE_CHECK_DB_FILENA=
ME}"
-CVE_CHECK_DB_DLDIR_LOCK ?=3D "${CVE_CHECK_DB_DLDIR_FILE}.lock"
-CVE_CHECK_DB_TEMP_FILE ?=3D "${CVE_CHECK_DB_FILE}.tmp"
-
-python () {
-    if not bb.data.inherits_class("cve-check", d):
-        raise bb.parse.SkipRecipe("Skip recipe when cve-check class is n=
ot loaded.")
-}
-
-python do_fetch() {
-    """
-    Update NVD database with API 2.0
-    """
-    import bb.utils
-    import bb.progress
-    import shutil
-
-    bb.utils.export_proxies(d)
-
-    db_file =3D d.getVar("CVE_CHECK_DB_DLDIR_FILE")
-    db_dir =3D os.path.dirname(db_file)
-    db_tmp_file =3D d.getVar("CVE_CHECK_DB_TEMP_FILE")
-
-    cleanup_db_download(db_tmp_file)
-    # By default let's update the whole database (since time 0)
-    database_time =3D 0
-
-    # The NVD database changes once a day, so no need to update more fre=
quently
-    # Allow the user to force-update
-    try:
-        import time
-        update_interval =3D int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
-        if update_interval < 0:
-            bb.note("CVE database update skipped")
-            if not os.path.exists(db_file):
-                bb.error("CVE database %s not present, database fetch/up=
date skipped" % db_file)
-            return
-        curr_time =3D time.time()
-        database_time =3D os.path.getmtime(db_file)
-        bb.note("Current time: %s; DB time: %s" % (time.ctime(curr_time)=
, time.ctime(database_time)))
-        if curr_time < database_time:
-            bb.warn("Database time is in the future, force DB update")
-            database_time =3D 0
-        elif curr_time - database_time < update_interval:
-            bb.note("CVE database recently updated, skipping")
-            return
-
-    except OSError:
-        pass
-
-    if bb.utils.to_boolean(d.getVar("BB_NO_NETWORK")):
-        bb.error("BB_NO_NETWORK attempted to disable fetch, this recipe =
uses CVE_DB_UPDATE_INTERVAL to control download, set to '-1' to disable f=
etch or update")
-
-    bb.utils.mkdirhier(db_dir)
-    bb.utils.mkdirhier(os.path.dirname(db_tmp_file))
-    if os.path.exists(db_file):
-        shutil.copy2(db_file, db_tmp_file)
-
-    if update_db_file(db_tmp_file, d, database_time):
-        # Update downloaded correctly, we can swap files. To avoid poten=
tial
-        # NFS caching issues, ensure that the destination file has a new=
 inode
-        # number. We do this in two steps as the downloads directory may=
 be on
-        # a different filesystem to tmpdir we're working in.
-        new_file =3D "%s.new" % (db_file)
-        shutil.move(db_tmp_file, new_file)
-        os.rename(new_file, db_file)
-    else:
-        # Update failed, do not modify the database
-        bb.warn("CVE database update failed")
-        os.remove(db_tmp_file)
-}
-
-do_fetch[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK}"
-do_fetch[file-checksums] =3D ""
-do_fetch[vardeps] =3D ""
-
-python do_unpack() {
-    import shutil
-    shutil.copyfile(d.getVar("CVE_CHECK_DB_DLDIR_FILE"), d.getVar("CVE_C=
HECK_DB_FILE"))
-}
-do_unpack[lockfiles] +=3D "${CVE_CHECK_DB_DLDIR_LOCK} ${CVE_CHECK_DB_FIL=
E_LOCK}"
-
-def cleanup_db_download(db_tmp_file):
-    """
-    Cleanup the download space from possible failed downloads
-    """
-
-    # Clean-up the temporary file downloads, we can remove both journal
-    # and the temporary database
-    if os.path.exists("{0}-journal".format(db_tmp_file)):
-        os.remove("{0}-journal".format(db_tmp_file))
-    if os.path.exists(db_tmp_file):
-        os.remove(db_tmp_file)
-
-def nvd_request_wait(attempt, min_wait):
-    return min(((2 * attempt) + min_wait), 30)
-
-def nvd_request_next(url, attempts, api_key, args, min_wait):
-    """
-    Request next part of the NVD database
-    NVD API documentation: https://nvd.nist.gov/developers/vulnerabiliti=
es
-    """
-
-    import urllib.request
-    import urllib.parse
-    import gzip
-    import http
-    import time
-
-    request =3D urllib.request.Request(url + "?" + urllib.parse.urlencod=
e(args))
-    if api_key:
-        request.add_header("apiKey", api_key)
-    bb.note("Requesting %s" % request.full_url)
-
-    for attempt in range(attempts):
-        try:
-            r =3D urllib.request.urlopen(request)
-
-            if (r.headers['content-encoding'] =3D=3D 'gzip'):
-                buf =3D r.read()
-                raw_data =3D gzip.decompress(buf)
-            else:
-                raw_data =3D r.read().decode("utf-8")
-
-            r.close()
-
-        except Exception as e:
-            wait_time =3D nvd_request_wait(attempt, min_wait)
-            bb.note("CVE database: received error (%s)" % (e))
-            bb.note("CVE database: retrying download after %d seconds. a=
ttempted (%d/%d)" % (wait_time, attempt+1, attempts))
-            time.sleep(wait_time)
-            pass
-        else:
-            return raw_data
-    else:
-        # We failed at all attempts
-        return None
-
-def update_db_file(db_tmp_file, d, database_time):
-    """
-    Update the given database file
-    """
-    import bb.progress
-    import bb.utils
-    import datetime
-    import sqlite3
-    import json
-
-    # Connect to database
-    conn =3D sqlite3.connect(db_tmp_file)
-    initialize_db(conn)
-
-    req_args =3D {'startIndex': 0}
-
-    incr_update_threshold =3D int(d.getVar("CVE_DB_INCR_UPDATE_AGE_THRES=
"))
-    if database_time !=3D 0:
-        database_date =3D datetime.datetime.fromtimestamp(database_time,=
 tz=3Ddatetime.timezone.utc)
-        today_date =3D datetime.datetime.now(tz=3Ddatetime.timezone.utc)
-        delta =3D today_date - database_date
-        if incr_update_threshold =3D=3D 0:
-            bb.note("CVE database: forced full update")
-        elif delta < datetime.timedelta(seconds=3Dincr_update_threshold)=
:
-            bb.note("CVE database: performing partial update")
-            # The maximum range for time is 120 days
-            if delta > datetime.timedelta(days=3D120):
-                bb.error("CVE database: Trying to do an incremental upda=
te on a larger than supported range")
-            req_args['lastModStartDate'] =3D database_date.isoformat()
-            req_args['lastModEndDate'] =3D today_date.isoformat()
-        else:
-            bb.note("CVE database: file too old, forcing a full update")
-    else:
-        bb.note("CVE database: no preexisting database, do a full downlo=
ad")
-
-    with bb.progress.ProgressHandler(d) as ph, open(os.path.join(d.getVa=
r("TMPDIR"), 'cve_check'), 'a') as cve_f:
-
-        bb.note("Updating entries")
-        index =3D 0
-        url =3D d.getVar("NVDCVE_URL")
-        api_key =3D d.getVar("NVDCVE_API_KEY") or None
-        attempts =3D int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
-
-        # Recommended by NVD
-        wait_time =3D 6
-        if api_key:
-            wait_time =3D 2
-
-        while True:
-            req_args['startIndex'] =3D index
-            raw_data =3D nvd_request_next(url, attempts, api_key, req_ar=
gs, wait_time)
-            if raw_data is None:
-                # We haven't managed to download data
-                return False
-
-            # hack for json5 style responses
-            if raw_data[-3:] =3D=3D ',]}':
-                bb.note("Removing trailing ',' from nvd response")
-                raw_data =3D raw_data[:-3] + ']}'
-
-            data =3D json.loads(raw_data)
-
-            index =3D data["startIndex"]
-            total =3D data["totalResults"]
-            per_page =3D data["resultsPerPage"]
-            bb.note("Got %d entries" % per_page)
-            for cve in data["vulnerabilities"]:
-                update_db(conn, cve)
-
-            index +=3D per_page
-            ph.update((float(index) / (total+1)) * 100)
-            if index >=3D total:
-                break
-
-            # Recommended by NVD
-            time.sleep(wait_time)
-
-        # Update success, set the date to cve_check file.
-        cve_f.write('CVE database update : %s\n\n' % datetime.date.today=
())
-
-    conn.commit()
-    conn.close()
-    return True
-
-def initialize_db(conn):
-    with conn:
-        c =3D conn.cursor()
-
-        c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE,=
 DATE TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMA=
RY TEXT, \
-            SCOREV2 TEXT, SCOREV3 TEXT, SCOREV4 TEXT, MODIFIED INTEGER, =
VECTOR TEXT, VECTORSTRING TEXT)")
-
-        c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
-            VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_STAR=
T TEXT, \
-            VERSION_END TEXT, OPERATOR_END TEXT)")
-        c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_ID_IDX on PRODUCTS=
(ID);")
-
-        c.close()
-
-def parse_node_and_insert(conn, node, cveId):
-
-    def cpe_generator():
-        for cpe in node.get('cpeMatch', ()):
-            if not cpe['vulnerable']:
-                return
-            cpe23 =3D cpe.get('criteria')
-            if not cpe23:
-                return
-            cpe23 =3D cpe23.split(':')
-            if len(cpe23) < 6:
-                return
-            vendor =3D cpe23[3]
-            product =3D cpe23[4]
-            version =3D cpe23[5]
-
-            if cpe23[6] =3D=3D '*' or cpe23[6] =3D=3D '-':
-                version_suffix =3D ""
-            else:
-                version_suffix =3D "_" + cpe23[6]
-
-            if version !=3D '*' and version !=3D '-':
-                # Version is defined, this is a '=3D' match
-                yield [cveId, vendor, product, version + version_suffix,=
 '=3D', '', '']
-            elif version =3D=3D '-':
-                # no version information is available
-                yield [cveId, vendor, product, version, '', '', '']
-            else:
-                # Parse start version, end version and operators
-                op_start =3D ''
-                op_end =3D ''
-                v_start =3D ''
-                v_end =3D ''
-
-                if 'versionStartIncluding' in cpe:
-                    op_start =3D '>=3D'
-                    v_start =3D cpe['versionStartIncluding']
-
-                if 'versionStartExcluding' in cpe:
-                    op_start =3D '>'
-                    v_start =3D cpe['versionStartExcluding']
-
-                if 'versionEndIncluding' in cpe:
-                    op_end =3D '<=3D'
-                    v_end =3D cpe['versionEndIncluding']
-
-                if 'versionEndExcluding' in cpe:
-                    op_end =3D '<'
-                    v_end =3D cpe['versionEndExcluding']
-
-                if op_start or op_end or v_start or v_end:
-                    yield [cveId, vendor, product, v_start, op_start, v_=
end, op_end]
-                else:
-                    # This is no version information, expressed differen=
tly.
-                    # Save processing by representing as -.
-                    yield [cveId, vendor, product, '-', '', '', '']
-
-    conn.executemany("insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"=
, cpe_generator()).close()
-
-def update_db(conn, elt):
-    """
-    Update a single entry in the on-disk database
-    """
-
-    accessVector =3D None
-    vectorString =3D None
-    cveId =3D elt['cve']['id']
-    if elt['cve'].get('vulnStatus') =3D=3D "Rejected":
-        c =3D conn.cursor()
-        c.execute("delete from PRODUCTS where ID =3D ?;", [cveId])
-        c.execute("delete from NVD where ID =3D ?;", [cveId])
-        c.close()
-        return
-    cveDesc =3D ""
-    for desc in elt['cve']['descriptions']:
-        if desc['lang'] =3D=3D 'en':
-            cveDesc =3D desc['value']
-    date =3D elt['cve']['lastModified']
-
-    # Extract maximum CVSS scores from all sources (Primary and Secondar=
y)
-    cvssv2 =3D 0.0
-    try:
-        # Iterate through all cvssMetricV2 entries and find the maximum =
score
-        for metric in elt['cve']['metrics']['cvssMetricV2']:
-            score =3D metric['cvssData']['baseScore']
-            if score > cvssv2:
-                cvssv2 =3D score
-                accessVector =3D metric['cvssData']['accessVector']
-                vectorString =3D metric['cvssData']['vectorString']
-    except KeyError:
-        pass
-
-    cvssv3 =3D 0.0
-    try:
-        # Iterate through all cvssMetricV30 entries and find the maximum=
 score
-        for metric in elt['cve']['metrics']['cvssMetricV30']:
-            score =3D metric['cvssData']['baseScore']
-            if score > cvssv3:
-                cvssv3 =3D score
-                accessVector =3D accessVector or metric['cvssData']['att=
ackVector']
-                vectorString =3D vectorString or metric['cvssData']['vec=
torString']
-    except KeyError:
-        pass
-
-    try:
-        # Iterate through all cvssMetricV31 entries and find the maximum=
 score
-        for metric in elt['cve']['metrics']['cvssMetricV31']:
-            score =3D metric['cvssData']['baseScore']
-            if score > cvssv3:
-                cvssv3 =3D score
-                accessVector =3D accessVector or metric['cvssData']['att=
ackVector']
-                vectorString =3D vectorString or metric['cvssData']['vec=
torString']
-    except KeyError:
-        pass
-
-    cvssv4 =3D 0.0
-    try:
-        # Iterate through all cvssMetricV40 entries and find the maximum=
 score
-        for metric in elt['cve']['metrics']['cvssMetricV40']:
-            score =3D metric['cvssData']['baseScore']
-            if score > cvssv4:
-                cvssv4 =3D score
-                accessVector =3D accessVector or metric['cvssData']['att=
ackVector']
-                vectorString =3D vectorString or metric['cvssData']['vec=
torString']
-    except KeyError:
-        pass
-
-    accessVector =3D accessVector or "UNKNOWN"
-    vectorString =3D vectorString or "UNKNOWN"
-
-    conn.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?, ?=
, ?)",
-                [cveId, cveDesc, cvssv2, cvssv3, cvssv4, date, accessVec=
tor, vectorString]).close()
-
-    try:
-        # Remove any pre-existing CVE configuration. Even for partial da=
tabase
-        # update, those will be repopulated. This ensures that old
-        # configuration is not kept for an updated CVE.
-        conn.execute("delete from PRODUCTS where ID =3D ?", [cveId]).clo=
se()
-        for config in elt['cve']['configurations']:
-            # This is suboptimal as it doesn't handle AND/OR and negate,=
 but is better than nothing
-            for node in config["nodes"]:
-                parse_node_and_insert(conn, node, cveId)
-    except KeyError:
-        bb.note("CVE %s has no configurations" % cveId)
-
-do_fetch[nostamp] =3D "1"
-
-EXCLUDE_FROM_WORLD =3D "1"
--=20
2.43.0


