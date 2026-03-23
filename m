Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD109F46108
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:04:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16995.1774271048497939897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CmjFboeO;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486ff201041so22328345e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271046; x=1774875846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDQxLScqZKXohsUO3mnrxhgmZBi7yiiKmXklkYW8G+4=;
        b=CmjFboeOP5T1PaqX4G8eYkJB1TnF9omNKzhNy8Et36SN//CLVysj/hXaRwX1JHGPn+
         FnSEDtxtngHEXbOrAzNHHb63Pu19S/UcGEM8iLuaa/bSPjffNMNhuahhXfpPnBZTaofW
         oaE3+xNNYf2AWFX3LdGeSPJSmBJOQbZ1ngBzvGPcD7OUhJOFNmzn2HMfUjdLyEKR4oFp
         xtMobmtwDxGxM+XkViBUta7RDth0LIRPXaaSDTG+MytGBtbsnV93ryB873qIdbXRfj+Z
         06k/4LuIYjvjclMgGAeZSM4Jjb4fZhiYL08FblATWc7mdHwTctpmb503AJaWPB8kjw3d
         XIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271046; x=1774875846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rDQxLScqZKXohsUO3mnrxhgmZBi7yiiKmXklkYW8G+4=;
        b=LTChN6L8TsDzsi21ZT+yvn8YP9EdVu6/Ncu3shO5e5pwkqWIPIQRZwbPiJdScaVBYe
         RdEMCcrlS6eJguUEtUK4moLkACp7uRF1aTsSqgqJmq2+CvkwSieliaghr5ZMHcPr2NOa
         6uPJutGhORJnjX4O2s+9cFkNj8UOkhwyKU4DAvPEnHF0DnqGFNaeGoJmyUvW4ede5sTh
         Ux/s+MraJ7ktFEELuNtyxaH0Ft3BkVsaDks5h0j70er2T4y99GKskynO8NYomHZkZkHY
         0nOfDLk6qMS7Gfnbad8pE0yUakZvDDEtbYQ5UEf32Y+B1yGLMsJSg07hZv4Vgxqse8t1
         yKrQ==
X-Gm-Message-State: AOJu0YxK6tEShFDrrG6EDIcDiTpfuXdtiHw7vzOnqdyNYbAmazice034
	OkggxBneol3XZFtTZfhn3JX4jau2j/bDi1icArJJm4xbNSyzJEzPytUwBXXCRKik
X-Gm-Gg: ATEYQzw5qGiLp7aod5jkwPw3A+X0jb8oH4MYcfxKESMpC6iFG+ndzrFrlOg1REv47mk
	qteIuAUsfL4eKYuQFNyotDvOzFgy9QTB/4KzwCWa42+3qv004u8HY04BhjY0/hZlf+zt4YVlaHW
	3qTy/FKfq7p30OWoM5wjo96RGCpPt02uR8QWcydvE1l2h391s23L1DhbwRmrGV24Y67n3zYZObZ
	ANG/l+qYBXS8rc7+vd42jE/DIeOACDMtaTAFgeDFpCYMO9VoswyPZNE4DnAFvwHdMxzmUDeHi9g
	ZvDCyPEh1v3i46AtfmFh1bfI7QJYhvX8BmzcWb/ffDgAfWMixpCiGdWKm2usQg0tYVTpy1upJJ/
	mrsLVq78AtxC9kTVH3Ph22ImMJqLRFNuxubQnvah6QtUOPbprD9Ggpt1gz778JuNjw2e3orqMIB
	kSxXw4b7ABzQk8DROxoOu461aFGHXjP4j7fxWWxYB85j83C0GGJ6Mg
X-Received: by 2002:a05:600c:a08:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-486fee2b3e1mr172207215e9.29.1774271045471;
        Mon, 23 Mar 2026 06:04:05 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7e2665sm324609665e9.6.2026.03.23.06.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:04:04 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v12 3/4] spdx30: Enrich source downloads with version and PURL
Date: Mon, 23 Mar 2026 14:03:49 +0100
Message-ID: <20260323130350.1177721-4-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
References: <20260321131826.1401671-1-stondo@gmail.com>
 <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233716

Add version extraction, PURL generation, and external references
to source download packages in SPDX 3.0 SBOMs:

- Extract version from SRCREV for Git sources (full SHA-1)
- Generate PURLs for Git sources on github.com by default
- Support custom mappings via SPDX_GIT_PURL_MAPPINGS variable
  (format: "domain:purl_type", split(':', 1) for parsing)
- Use ecosystem PURLs from SPDX_PACKAGE_URLS for non-Git
- Add VCS external references for Git downloads
- Add distribution external references for tarball downloads
- Parse Git URLs using urllib.parse
- Extract logic into _generate_git_purl() and
  _enrich_source_package() helpers

For non-Git sources, version is not set from PV since the recipe
version does not necessarily reflect the version of individual
downloaded files. Ecosystem PURLs (which include version) from
SPDX_PACKAGE_URLS are still used when available.

The SPDX_GIT_PURL_MAPPINGS variable allows configuring PURL
generation for self-hosted Git services (e.g., GitLab).
github.com is always mapped to pkg:github by default.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass |   7 +
 meta/lib/oe/spdx30_tasks.py          | 444 +++++++++++++++++----------
 2 files changed, 293 insertions(+), 158 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 9a6606dce6..265dc525bc 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -156,6 +156,13 @@ SPDX_RECIPE_SBOM_NAME ?= "${PN}-recipe-sbom"
 SPDX_RECIPE_SBOM_NAME[doc] = "The name of output recipe SBoM when using \
     create_recipe_sbom"
 
+SPDX_GIT_PURL_MAPPINGS ??= ""
+SPDX_GIT_PURL_MAPPINGS[doc] = "A space separated list of domain:purl_type \
+    mappings to configure PURL generation for Git source downloads. \
+    For example, "gitlab.example.com:pkg:gitlab" maps repositories hosted \
+    on gitlab.example.com to the pkg:gitlab PURL type. \
+    github.com is always mapped to pkg:github by default."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index bb814bbd57..6f0bdba975 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -34,7 +34,9 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
 
 
-def add_license_expression(d, objset, license_expression, license_data):
+def add_license_expression(
+    d, objset, license_expression, license_data, search_objsets=[]
+):
     simple_license_text = {}
     license_text_map = {}
     license_ref_idx = 0
@@ -46,14 +48,15 @@ def add_license_expression(d, objset, license_expression, license_data):
         if name in simple_license_text:
             return simple_license_text[name]
 
-        lic = objset.find_filter(
-            oe.spdx30.simplelicensing_SimpleLicensingText,
-            name=name,
-        )
+        for o in [objset] + search_objsets:
+            lic = o.find_filter(
+                oe.spdx30.simplelicensing_SimpleLicensingText,
+                name=name,
+            )
 
-        if lic is not None:
-            simple_license_text[name] = lic
-            return lic
+            if lic is not None:
+                simple_license_text[name] = lic
+                return lic
 
         lic = objset.add(
             oe.spdx30.simplelicensing_SimpleLicensingText(
@@ -147,37 +150,58 @@ def add_package_files(
     ignore_dirs=[],
     ignore_top_level_dirs=[],
 ):
-            if os.path.isdir(image_path):
-                a, _ = add_package_files(
-                    d,
-                    objset,
-                    image_path,
-                    lambda file_counter: objset.new_spdxid(
-                        "imagefile", str(file_counter)
-                    ),
-                    lambda filepath: [],
-                    license_data=None,
-                    ignore_dirs=[],
-                    ignore_top_level_dirs=[],
-                    archive=None,
-                )
+    source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
+    if source_date_epoch:
+        source_date_epoch = int(source_date_epoch)
+
+    spdx_files = set()
+
+    file_counter = 1
+    if not os.path.exists(topdir):
+        bb.note(f"Skip {topdir}")
+        return spdx_files, set()
+
+    check_compiled_sources = d.getVar("SPDX_INCLUDE_COMPILED_SOURCES") == "1"
+    if check_compiled_sources:
+        compiled_sources, types = oe.spdx_common.get_compiled_sources(d)
+        bb.debug(1, f"Total compiled files: {len(compiled_sources)}")
+
+    exclude_patterns = [
+        re.compile(pattern)
+        for pattern in (d.getVar("SPDX_FILE_EXCLUDE_PATTERNS") or "").split()
+    ]
+    excluded_files = set()
+
+    for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
+        dirs[:] = [directory for directory in dirs if directory not in ignore_dirs]
+        if subdir == str(topdir):
+            dirs[:] = [
+                directory
+                for directory in dirs
+                if directory not in ignore_top_level_dirs
+            ]
+
+        dirs.sort()
+        files.sort()
+        for file in files:
+            filepath = Path(subdir) / file
             if filepath.is_symlink() or not filepath.is_file():
                 continue
 
             filename = str(filepath.relative_to(topdir))
 
-            # Apply file exclusion filtering
-            if exclude_patterns:
-                if any(p.search(filename) for p in exclude_patterns):
-                    excluded_files.add(filename)
-                    continue
+            if exclude_patterns and any(
+                pattern.search(filename) for pattern in exclude_patterns
+            ):
+                excluded_files.add(filename)
+                continue
 
             file_purposes = get_purposes(filepath)
 
-            # Check if file is compiled
-            if check_compiled_sources:
-                if not oe.spdx_common.is_compiled_source(filename, compiled_sources, types):
-                    continue
+            if check_compiled_sources and not oe.spdx_common.is_compiled_source(
+                filename, compiled_sources, types
+            ):
+                continue
 
             spdx_file = objset.new_file(
                 get_spdxid(file_counter),
@@ -300,17 +324,14 @@ def get_package_sources_from_debug(
     return dep_source_files
 
 
-def collect_dep_objsets(d, build):
-    deps = oe.spdx_common.get_spdx_deps(d)
-
+def collect_dep_objsets(d, direct_deps, subdir, fn_prefix, obj_type, **attr_filter):
     dep_objsets = []
-    dep_builds = set()
+    dep_objs = set()
 
-    dep_build_spdxids = set()
-    for dep in deps:
+    for dep in direct_deps:
         bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
-        dep_build, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
-            d, "recipes", "recipe-" + dep.pn, oe.spdx30.build_Build
+        dep_obj, dep_objset = oe.sbom30.find_root_obj_in_jsonld(
+            d, subdir, fn_prefix + dep.pn, obj_type, **attr_filter
         )
         # If the dependency is part of the taskhash, return it to be linked
         # against. Otherwise, it cannot be linked against because this recipe
@@ -318,10 +339,10 @@ def collect_dep_objsets(d, build):
         if dep.in_taskhash:
             dep_objsets.append(dep_objset)
 
-        # The build _can_ be linked against (by alias)
-        dep_builds.add(dep_build)
+        # The object _can_ be linked against (by alias)
+        dep_objs.add(dep_obj)
 
-    return dep_objsets, dep_builds
+    return dep_objsets, dep_objs
 
 
 def index_sources_by_hash(sources, dest):
@@ -585,6 +606,201 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
     ]
 
 
+def set_purls(spdx_package, purls):
+    if purls:
+        spdx_package.software_packageUrl = purls[0]
+
+    for p in sorted(set(purls)):
+        spdx_package.externalIdentifier.append(
+            oe.spdx30.ExternalIdentifier(
+                externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
+                identifier=p,
+            )
+        )
+
+
+def get_is_native(d):
+    return bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
+
+
+def create_recipe_spdx(d):
+    deploydir = Path(d.getVar("SPDXRECIPEDEPLOY"))
+    pn = d.getVar("PN")
+
+    license_data = oe.spdx_common.load_spdx_license_data(d)
+
+    include_vex = d.getVar("SPDX_INCLUDE_VEX")
+    if not include_vex in ("none", "current", "all"):
+        bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'")
+
+    recipe_objset = oe.sbom30.ObjectSet.new_objset(d, "static-" + pn)
+
+    recipe = recipe_objset.add_root(
+        oe.spdx30.software_Package(
+            _id=recipe_objset.new_spdxid("recipe", pn),
+            creationInfo=recipe_objset.doc.creationInfo,
+            name=d.getVar("PN"),
+            software_packageVersion=d.getVar("PV"),
+            software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.specification,
+            software_sourceInfo=json.dumps(
+                {
+                    "FILENAME": os.path.basename(d.getVar("FILE")),
+                    "FILE_LAYERNAME": d.getVar("FILE_LAYERNAME"),
+                },
+                separators=(",", ":"),
+            ),
+        )
+    )
+
+    if get_is_native(d):
+        ext = oe.sbom30.OERecipeExtension()
+        ext.is_native = True
+        recipe.extension.append(ext)
+
+    set_purls(recipe, (d.getVar("SPDX_PACKAGE_URLS") or "").split())
+
+    if val := d.getVar("HOMEPAGE"):
+        recipe.software_homePage = val
+
+    if val := d.getVar("SUMMARY"):
+        recipe.summary = val
+
+    if val := d.getVar("DESCRIPTION"):
+        recipe.description = val
+
+    for cpe_id in oe.cve_check.get_cpe_ids(
+        d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION")
+    ):
+        recipe.externalIdentifier.append(
+            oe.spdx30.ExternalIdentifier(
+                externalIdentifierType=oe.spdx30.ExternalIdentifierType.cpe23,
+                identifier=cpe_id,
+            )
+        )
+
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_recipe_spdx")
+
+    dep_objsets, dep_recipes = collect_dep_objsets(
+        d, direct_deps, "static", "static-", oe.spdx30.software_Package
+    )
+
+    if dep_recipes:
+        recipe_objset.new_scoped_relationship(
+            [recipe],
+            oe.spdx30.RelationshipType.dependsOn,
+            oe.spdx30.LifecycleScopeType.build,
+            sorted(oe.sbom30.get_element_link_id(dep) for dep in dep_recipes),
+        )
+
+    cve_by_status = {}
+    if include_vex != "none":
+        patched_cves = oe.cve_check.get_patched_cves(d)
+        for cve, patched_cve in patched_cves.items():
+            mapping = patched_cve["abbrev-status"]
+            detail = patched_cve["status"]
+            description = patched_cve.get("justification", None)
+            resources = patched_cve.get("resource", [])
+
+            if include_vex != "all" and detail in (
+                "fixed-version",
+                "cpe-stable-backport",
+            ):
+                bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
+                continue
+
+            spdx_cve = recipe_objset.new_cve_vuln(cve)
+
+            cve_by_status.setdefault(mapping, {})[cve] = (
+                spdx_cve,
+                detail,
+                description,
+                resources,
+            )
+
+    all_cves = set()
+    for status, cves in cve_by_status.items():
+        for cve, items in cves.items():
+            spdx_cve, detail, description, resources = items
+            spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
+
+            all_cves.add(spdx_cve)
+
+            if status == "Patched":
+                spdx_vex = recipe_objset.new_vex_patched_relationship(
+                    [spdx_cve_id], [recipe]
+                )
+                patches = []
+                for idx, filepath in enumerate(resources):
+                    patches.append(
+                        recipe_objset.new_file(
+                            recipe_objset.new_spdxid(
+                                "patch", str(idx), os.path.basename(filepath)
+                            ),
+                            os.path.basename(filepath),
+                            filepath,
+                            purposes=[oe.spdx30.software_SoftwarePurpose.patch],
+                            hashfile=os.path.isfile(filepath),
+                        )
+                    )
+
+                if patches:
+                    recipe_objset.new_scoped_relationship(
+                        spdx_vex,
+                        oe.spdx30.RelationshipType.patchedBy,
+                        oe.spdx30.LifecycleScopeType.build,
+                        patches,
+                    )
+
+            elif status == "Unpatched":
+                recipe_objset.new_vex_unpatched_relationship([spdx_cve_id], [recipe])
+            elif status == "Ignored":
+                spdx_vex = recipe_objset.new_vex_ignored_relationship(
+                    [spdx_cve_id],
+                    [recipe],
+                    impact_statement=description,
+                )
+
+                vex_just_type = d.getVarFlag("CVE_CHECK_VEX_JUSTIFICATION", detail)
+                if vex_just_type:
+                    if (
+                        vex_just_type
+                        not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
+                    ):
+                        bb.fatal(
+                            f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
+                        )
+
+                    for v in spdx_vex:
+                        v.security_justificationType = (
+                            oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
+                                vex_just_type
+                            ]
+                        )
+
+            elif status == "Unknown":
+                bb.note(f"Skipping {cve} with status 'Unknown'")
+            else:
+                bb.fatal(f"Unknown {cve} status '{status}'")
+
+    if all_cves:
+        recipe_objset.new_relationship(
+            [recipe],
+            oe.spdx30.RelationshipType.hasAssociatedVulnerability,
+            sorted(list(all_cves)),
+        )
+
+    oe.sbom30.write_recipe_jsonld_doc(d, recipe_objset, "static", deploydir)
+
+
+def load_recipe_spdx(d):
+    return oe.sbom30.find_root_obj_in_jsonld(
+        d,
+        "static",
+        "static-" + d.getVar("PN"),
+        oe.spdx30.software_Package,
+    )
+
+
 def create_spdx(d):
     def set_var_field(var, obj, name, package=None):
         val = None
@@ -599,19 +815,15 @@ def create_spdx(d):
 
     license_data = oe.spdx_common.load_spdx_license_data(d)
 
+    pn = d.getVar("PN")
     deploydir = Path(d.getVar("SPDXDEPLOY"))
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
     include_sources = d.getVar("SPDX_INCLUDE_SOURCES") == "1"
-    pkg_arch = d.getVar("SSTATE_PKGARCH")
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
-        "cross", d
-    )
-    include_vex = d.getVar("SPDX_INCLUDE_VEX")
-    if not include_vex in ("none", "current", "all"):
-        bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'")
+    is_native = get_is_native(d)
+
+    recipe, recipe_objset = load_recipe_spdx(d)
 
-    build_objset = oe.sbom30.ObjectSet.new_objset(d, "recipe-" + d.getVar("PN"))
+    build_objset = oe.sbom30.ObjectSet.new_objset(d, "build-" + pn)
 
     build = build_objset.new_task_build("recipe", "recipe")
     build_objset.set_element_alias(build)
@@ -629,47 +841,13 @@ def create_spdx(d):
 
     build_inputs = set()
 
-    # Add CVEs
-    cve_by_status = {}
-    if include_vex != "none":
-        patched_cves = oe.cve_check.get_patched_cves(d)
-        for cve, patched_cve in patched_cves.items():
-            decoded_status = {
-                "mapping": patched_cve["abbrev-status"],
-                "detail": patched_cve["status"],
-                "description": patched_cve.get("justification", None)
-            }
-
-            # If this CVE is fixed upstream, skip it unless all CVEs are
-            # specified.
-            if (
-                include_vex != "all"
-                and "detail" in decoded_status
-                and decoded_status["detail"]
-                in (
-                    "fixed-version",
-                    "cpe-stable-backport",
-                )
-            ):
-                bb.debug(1, "Skipping %s since it is already fixed upstream" % cve)
-                continue
-
-            spdx_cve = build_objset.new_cve_vuln(cve)
-            build_objset.set_element_alias(spdx_cve)
-
-            cve_by_status.setdefault(decoded_status["mapping"], {})[cve] = (
-                spdx_cve,
-                decoded_status["detail"],
-                decoded_status["description"],
-            )
-
     cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
 
     recipe_spdx_license = add_license_expression(
-        d, build_objset, d.getVar("LICENSE"), license_data
+        d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
     )
     build_objset.new_relationship(
         source_files,
@@ -698,7 +876,11 @@ def create_spdx(d):
         build_inputs |= files
         index_sources_by_hash(files, dep_sources)
 
-    dep_objsets, dep_builds = collect_dep_objsets(d, build)
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+
+    dep_objsets, dep_builds = collect_dep_objsets(
+        d, direct_deps, "builds", "build-", oe.spdx30.build_Build
+    )
     if dep_builds:
         build_objset.new_scoped_relationship(
             [build],
@@ -768,16 +950,7 @@ def create_spdx(d):
                 or ""
             ).split()
 
-            if purls:
-                spdx_package.software_packageUrl = purls[0]
-
-            for p in sorted(set(purls)):
-                spdx_package.externalIdentifier.append(
-                    oe.spdx30.ExternalIdentifier(
-                        externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
-                        identifier=p,
-                    )
-                )
+            set_purls(spdx_package, purls)
 
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
@@ -786,6 +959,13 @@ def create_spdx(d):
                 [spdx_package],
             )
 
+            pkg_objset.new_scoped_relationship(
+                [oe.sbom30.get_element_link_id(recipe)],
+                oe.spdx30.RelationshipType.generates,
+                oe.spdx30.LifecycleScopeType.build,
+                [spdx_package],
+            )
+
             for cpe_id in cpe_ids:
                 spdx_package.externalIdentifier.append(
                     oe.spdx30.ExternalIdentifier(
@@ -819,7 +999,11 @@ def create_spdx(d):
             package_license = d.getVar("LICENSE:%s" % package)
             if package_license and package_license != d.getVar("LICENSE"):
                 package_spdx_license = add_license_expression(
-                    d, build_objset, package_license, license_data
+                    d,
+                    build_objset,
+                    package_license,
+                    license_data,
+                    [recipe_objset],
                 )
             else:
                 package_spdx_license = recipe_spdx_license
@@ -844,59 +1028,6 @@ def create_spdx(d):
                     [oe.sbom30.get_element_link_id(concluded_spdx_license)],
                 )
 
-            # NOTE: CVE Elements live in the recipe collection
-            all_cves = set()
-            for status, cves in cve_by_status.items():
-                for cve, items in cves.items():
-                    spdx_cve, detail, description = items
-                    spdx_cve_id = oe.sbom30.get_element_link_id(spdx_cve)
-
-                    all_cves.add(spdx_cve_id)
-
-                    if status == "Patched":
-                        pkg_objset.new_vex_patched_relationship(
-                            [spdx_cve_id], [spdx_package]
-                        )
-                    elif status == "Unpatched":
-                        pkg_objset.new_vex_unpatched_relationship(
-                            [spdx_cve_id], [spdx_package]
-                        )
-                    elif status == "Ignored":
-                        spdx_vex = pkg_objset.new_vex_ignored_relationship(
-                            [spdx_cve_id],
-                            [spdx_package],
-                            impact_statement=description,
-                        )
-
-                        vex_just_type = d.getVarFlag(
-                            "CVE_CHECK_VEX_JUSTIFICATION", detail
-                        )
-                        if vex_just_type:
-                            if (
-                                vex_just_type
-                                not in oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS
-                            ):
-                                bb.fatal(
-                                    f"Unknown vex justification '{vex_just_type}', detail '{detail}', for ignored {cve}"
-                                )
-
-                            for v in spdx_vex:
-                                v.security_justificationType = oe.spdx30.security_VexJustificationType.NAMED_INDIVIDUALS[
-                                    vex_just_type
-                                ]
-
-                    elif status == "Unknown":
-                        bb.note(f"Skipping {cve} with status 'Unknown'")
-                    else:
-                        bb.fatal(f"Unknown {cve} status '{status}'")
-
-            if all_cves:
-                pkg_objset.new_relationship(
-                    [spdx_package],
-                    oe.spdx30.RelationshipType.hasAssociatedVulnerability,
-                    sorted(list(all_cves)),
-                )
-
             bb.debug(1, "Adding package files to SPDX for package %s" % pkg_name)
             package_files, excluded_files = add_package_files(
                 d,
@@ -982,20 +1113,17 @@ def create_spdx(d):
 
             bb.note(f"Added PACKAGECONFIG entries: {len(enabled)} enabled, {len(disabled)} disabled")
 
-    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
+    oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "builds", deploydir)
 
 
 def create_package_spdx(d):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
-    is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class(
-        "cross", d
-    )
-
-    providers = oe.spdx_common.collect_package_providers(d)
+    direct_deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
+    providers = oe.spdx_common.collect_package_providers(d, direct_deps)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
-    if is_native:
+    if get_is_native(d):
         return
 
     bb.build.exec_func("read_subpackage_metadata", d)
-- 
2.53.0


