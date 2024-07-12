Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 608B3C3DA52
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 16:03:33 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.11480.1720800205762156326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 09:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q3K/l2Jl;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-260209df55dso1030097fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720800204; x=1721405004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWoDgZ1K0QP0HN08F4ewTMnYzS1aixFyRNVKKv3KFq8=;
        b=Q3K/l2Jl3l488Qze2UZKwkSVZ6nDfKJeTKYkCuGhOAm0ND/v7zZUGJhj71EhnqzrJJ
         0oMEsC8QVbGAHbkyZfGF3/eOqxbsxl2IJ3tWBvYYxEu/TDycQtEAVTvqp0pnLq7W3Nc8
         FkbL1z3CysA1d1LMPkY8RexNfP/5g0d9ZoNtpqkrMHtBS13iNJmO0YFq5EsvUwzv02BC
         Bops+8Bm9BsjMYek37gW9nIaf/gkLAyU7/98koyEDbIFsDBYMxm1r7mo4vSwNn2awn1v
         8VtI+6BHrFGL2XecbUOEjvcZ4sK4OW8bFZD7H2i0yOPTUbyKapOm/u3a56llUqOa9SIZ
         YjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720800204; x=1721405004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWoDgZ1K0QP0HN08F4ewTMnYzS1aixFyRNVKKv3KFq8=;
        b=HUclYHqEvVwe+50b8OXFCqXI06IMMYK5jvwK05ebbOf2PMGlR1Ey3NgAewIP/38JLa
         036R0FxI1Mbpj7hhm/5PC+FGZ67B3StVEQHEiI4F7qL10WZtd/guM8aRTdhXtN7MGT/4
         kLMlNSfbCX7sp2X09An7n0ydXreP6zAjFn7+YokQ5aC3N8MKIYQc3BQS6FVo0sTo0QqS
         Lxkd3SsPb6skq03rnaU88rUUI0E7PsvqlTPn+V4cBDw7nYbmWkR4gari+Dj5RvQqgXp0
         QmfSMUfujBinc6uzvTzlwXyGygHMF1SuJFrYaTUE9az98rfflBUg84UIAHuBt+gh9MT2
         vA9w==
X-Gm-Message-State: AOJu0Yyx9p6UVc25cI3XnqBFnSfL3cKqB3pA9ASjzJWHkykn854Aeutx
	EZBwt+aNrVEK/0C74R2lBBDNB6n2t9nSwS9e7XXF27zHIpdjo2lY5UidmA==
X-Google-Smtp-Source: AGHT+IFQn63r9s23JT88obt4vARsaC8TtB9h++NQeDa/n1v/ayTASeRG9GYFtVQ8viNBNUk2fIsBKQ==
X-Received: by 2002:a05:6870:7083:b0:258:3455:4b37 with SMTP id 586e51a60fabf-25eaeca2647mr9915166fac.59.1720800203664;
        Fri, 12 Jul 2024 09:03:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4a71])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa29d16dsm2267694fac.53.2024.07.12.09.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:03:22 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 09/12] classes/spdx-common: Move to library
Date: Fri, 12 Jul 2024 09:58:19 -0600
Message-ID: <20240712160304.3514496-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712160304.3514496-1-JPEWhacker@gmail.com>
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 16:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201843

Moves the bulk of the code in the spdx-common bbclass into library code

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass       |  23 ++-
 meta/classes/create-spdx-3.0.bbclass       |  22 +-
 meta/classes/create-spdx-image-3.0.bbclass |   3 +-
 meta/classes/spdx-common.bbclass           | 197 +-----------------
 meta/lib/oe/sbom30.py                      |  21 +-
 meta/lib/oe/spdx_common.py                 | 228 +++++++++++++++++++++
 6 files changed, 270 insertions(+), 224 deletions(-)
 create mode 100644 meta/lib/oe/spdx_common.py

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 3bcde1acc84..0382e4cc51a 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -38,6 +38,12 @@ def recipe_spdx_is_native(d, recipe):
       a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
       a.comment == "isNative" for a in recipe.annotations)
 
+def get_json_indent(d):
+    if d.getVar("SPDX_PRETTY") == "1":
+        return 2
+    return None
+
+
 def convert_license_to_spdx(lic, document, d, existing={}):
     from pathlib import Path
     import oe.spdx
@@ -113,6 +119,7 @@ def convert_license_to_spdx(lic, document, d, existing={}):
 def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archive=None, ignore_dirs=[], ignore_top_level_dirs=[]):
     from pathlib import Path
     import oe.spdx
+    import oe.spdx_common
     import hashlib
 
     source_date_epoch = d.getVar("SOURCE_DATE_EPOCH")
@@ -165,7 +172,7 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archiv
                     ))
 
                 if "SOURCE" in spdx_file.fileTypes:
-                    extracted_lics = extract_licenses(filepath)
+                    extracted_lics = oe.spdx_common.extract_licenses(filepath)
                     if extracted_lics:
                         spdx_file.licenseInfoInFiles = extracted_lics
 
@@ -256,6 +263,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     from pathlib import Path
     import oe.sbom
     import oe.spdx
+    import oe.spdx_common
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     package_archs = d.getVar("SSTATE_ARCHS").split()
@@ -263,7 +271,7 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     dep_recipes = []
 
-    deps = get_spdx_deps(d)
+    deps = oe.spdx_common.get_spdx_deps(d)
 
     for dep_pn, dep_hashfn, in_taskhash in deps:
         # If this dependency is not calculated in the taskhash skip it.
@@ -386,6 +394,7 @@ python do_create_spdx() {
     from datetime import datetime, timezone
     import oe.sbom
     import oe.spdx
+    import oe.spdx_common
     import uuid
     from pathlib import Path
     from contextlib import contextmanager
@@ -478,10 +487,10 @@ python do_create_spdx() {
 
     add_download_packages(d, doc, recipe)
 
-    if process_sources(d) and include_sources:
+    if oe.spdx_common.process_sources(d) and include_sources:
         recipe_archive = deploy_dir_spdx / "recipes" / (doc.name + ".tar.zst")
         with optional_tarfile(recipe_archive, archive_sources) as archive:
-            spdx_get_src(d)
+            oe.spdx_common.get_patched_src(d)
 
             add_package_files(
                 d,
@@ -588,6 +597,7 @@ python do_create_runtime_spdx() {
     from datetime import datetime, timezone
     import oe.sbom
     import oe.spdx
+    import oe.spdx_common
     import oe.packagedata
     from pathlib import Path
 
@@ -597,7 +607,7 @@ python do_create_runtime_spdx() {
 
     creation_time = datetime.now(tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")
 
-    providers = collect_package_providers(d)
+    providers = oe.spdx_common.collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
     package_archs = d.getVar("SSTATE_ARCHS").split()
     package_archs.reverse()
@@ -778,6 +788,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import os
     import oe.spdx
     import oe.sbom
+    import oe.spdx_common
     import io
     import json
     from datetime import timezone, datetime
@@ -785,7 +796,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
     import tarfile
     import bb.compress.zstd
 
-    providers = collect_package_providers(d)
+    providers = oe.spdx_common.collect_package_providers(d)
     package_archs = d.getVar("SSTATE_ARCHS").split()
     package_archs.reverse()
 
diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 51168e4876c..a930ea81152 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -350,20 +350,21 @@ def collect_dep_objsets(d, build):
     from pathlib import Path
     import oe.sbom30
     import oe.spdx30
+    import oe.spdx_common
 
-    deps = get_spdx_deps(d)
+    deps = oe.spdx_common.get_spdx_deps(d)
 
     dep_objsets = []
     dep_builds = set()
 
     dep_build_spdxids = set()
-    for dep_pn, _, in_taskhash  in deps:
-        bb.debug(1, "Fetching SPDX for dependency %s" % (dep_pn))
-        dep_build, dep_objset = oe.sbom30.find_root_obj_in_jsonld(d, "recipes", dep_pn, oe.spdx30.build_Build)
+    for dep in deps:
+        bb.debug(1, "Fetching SPDX for dependency %s" % (dep.pn))
+        dep_build, dep_objset = oe.sbom30.find_root_obj_in_jsonld(d, "recipes", dep.pn, oe.spdx30.build_Build)
         # If the dependency is part of the taskhash, return it to be linked
         # against. Otherwise, it cannot be linked against because this recipe
         # will not rebuilt if dependency changes
-        if in_taskhash:
+        if dep.in_taskhash:
             dep_objsets.append(dep_objset)
 
         # The build _can_ be linked against (by alias)
@@ -519,6 +520,7 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
 python do_create_spdx() {
     import oe.sbom30
     import oe.spdx30
+    import oe.spdx_common
     from pathlib import Path
     from contextlib import contextmanager
     import oe.cve_check
@@ -593,9 +595,9 @@ python do_create_spdx() {
         [recipe_spdx_license],
     )
 
-    if process_sources(d) and include_sources:
+    if oe.spdx_common.process_sources(d) and include_sources:
         bb.debug(1, "Adding source files to SPDX")
-        spdx_get_src(d)
+        oe.spdx_common.get_patched_src(d)
 
         build_inputs |= add_package_files(
             d,
@@ -844,6 +846,7 @@ do_create_spdx[depends] += "${PATCHDEPENDENCY}"
 python do_create_package_spdx() {
     import oe.sbom30
     import oe.spdx30
+    import oe.spdx_common
     import oe.packagedata
     from pathlib import Path
 
@@ -851,7 +854,7 @@ python do_create_package_spdx() {
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
     is_native = bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d)
 
-    providers = collect_package_providers(d)
+    providers = oe.spdx_common.collect_package_providers(d)
     pkg_arch = d.getVar("SSTATE_PKGARCH")
 
     if not is_native:
@@ -957,6 +960,7 @@ do_create_package_spdx[rdeptask] = "do_create_spdx"
 python spdx30_build_started_handler () {
     import oe.spdx30
     import oe.sbom30
+    import oe.spdx_common
     import os
     from pathlib import Path
     from datetime import datetime, timezone
@@ -966,7 +970,7 @@ python spdx30_build_started_handler () {
     d = e.data.createCopy()
     d.setVar("PN", "bitbake")
     d.setVar("BB_TASKHASH", "bitbake")
-    load_spdx_license_data(d)
+    oe.spdx_common.load_spdx_license_data(d)
 
     deploy_dir_spdx = Path(e.data.getVar("DEPLOY_DIR_SPDX"))
 
diff --git a/meta/classes/create-spdx-image-3.0.bbclass b/meta/classes/create-spdx-image-3.0.bbclass
index bda11d54d40..467719555d6 100644
--- a/meta/classes/create-spdx-image-3.0.bbclass
+++ b/meta/classes/create-spdx-image-3.0.bbclass
@@ -10,7 +10,8 @@ SPDXIMAGEDEPLOYDIR = "${SPDXDIR}/image-deploy"
 SPDXROOTFSDEPLOY = "${SPDXDIR}/rootfs-deploy"
 
 def collect_build_package_inputs(d, objset, build, packages):
-    providers = collect_package_providers(d)
+    import oe.spdx_common
+    providers = oe.spdx_common.collect_package_providers(d)
 
     build_deps = set()
 
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 6dfc1fd9e4c..d3110a9bdb0 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,96 +37,11 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
-def extract_licenses(filename):
-    import re
-
-    lic_regex = re.compile(rb'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
-
-    try:
-        with open(filename, 'rb') as f:
-            size = min(15000, os.stat(filename).st_size)
-            txt = f.read(size)
-            licenses = re.findall(lic_regex, txt)
-            if licenses:
-                ascii_licenses = [lic.decode('ascii') for lic in licenses]
-                return ascii_licenses
-    except Exception as e:
-        bb.warn(f"Exception reading {filename}: {e}")
-    return []
-
-def is_work_shared_spdx(d):
-    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
-
-def get_json_indent(d):
-    if d.getVar("SPDX_PRETTY") == "1":
-        return 2
-    return None
-
-def load_spdx_license_data(d):
-    import json
-    if d.getVar("SPDX_LICENSE_DATA"):
-        return
-
-    with open(d.getVar("SPDX_LICENSES"), "r") as f:
-        data = json.load(f)
-        # Transform the license array to a dictionary
-        data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
-        d.setVar("SPDX_LICENSE_DATA", data)
-
 python() {
-    load_spdx_license_data(d)
+    import oe.spdx_common
+    oe.spdx_common.load_spdx_license_data(d)
 }
 
-def process_sources(d):
-    pn = d.getVar('PN')
-    assume_provided = (d.getVar("ASSUME_PROVIDED") or "").split()
-    if pn in assume_provided:
-        for p in d.getVar("PROVIDES").split():
-            if p != pn:
-                pn = p
-                break
-
-    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been deleted,
-    # so avoid archiving source here.
-    if pn.startswith('glibc-locale'):
-        return False
-    if d.getVar('PN') == "libtool-cross":
-        return False
-    if d.getVar('PN') == "libgcc-initial":
-        return False
-    if d.getVar('PN') == "shadow-sysroot":
-        return False
-
-    # We just archive gcc-source for all the gcc related recipes
-    if d.getVar('BPN') in ['gcc', 'libgcc']:
-        bb.debug(1, 'spdx: There is bug in scan of %s is, do nothing' % pn)
-        return False
-
-    return True
-
-def collect_direct_deps(d, dep_task):
-    current_task = "do_" + d.getVar("BB_CURRENTTASK")
-    pn = d.getVar("PN")
-
-    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
-
-    for this_dep in taskdepdata.values():
-        if this_dep[0] == pn and this_dep[1] == current_task:
-            break
-    else:
-        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdata")
-
-    deps = set()
-
-    for dep_name in this_dep.deps:
-        dep_data = taskdepdata[dep_name]
-        if dep_data.taskname == dep_task and dep_data.pn != pn:
-            deps.add((dep_data.pn, dep_data.hashfn, dep_name in this_dep.taskhash_deps))
-
-    return sorted(deps)
-
-collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
-collect_direct_deps[vardeps] += "DEPENDS"
 
 python do_collect_spdx_deps() {
     # This task calculates the build time dependencies of the recipe, and is
@@ -136,11 +51,12 @@ python do_collect_spdx_deps() {
     # do_create_spdx reads in the found dependencies when writing the actual
     # SPDX document
     import json
+    import oe.spdx_common
     from pathlib import Path
 
     spdx_deps_file = Path(d.getVar("SPDXDEPS"))
 
-    deps = collect_direct_deps(d, "do_create_spdx")
+    deps = oe.spdx_common.collect_direct_deps(d, "do_create_spdx")
 
     with spdx_deps_file.open("w") as f:
         json.dump(deps, f)
@@ -151,104 +67,7 @@ do_collect_spdx_deps[depends] += "${PATCHDEPENDENCY}"
 do_collect_spdx_deps[deptask] = "do_create_spdx"
 do_collect_spdx_deps[dirs] = "${SPDXDIR}"
 
-def get_spdx_deps(d):
-    import json
-    from pathlib import Path
-
-    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
-
-    with spdx_deps_file.open("r") as f:
-        return json.load(f)
-
-def collect_package_providers(d):
-    from pathlib import Path
-    import oe.sbom
-    import oe.spdx
-    import json
-
-    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-
-    providers = {}
-
-    deps = collect_direct_deps(d, "do_create_spdx")
-    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True))
-
-    for dep_pn, dep_hashfn, _ in deps:
-        localdata = d
-        recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
-        if not recipe_data:
-            localdata = bb.data.createCopy(d)
-            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
-            recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
-
-        for pkg in recipe_data.get("PACKAGES", "").split():
-
-            pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, localdata)
-            rprovides = set(n for n, _ in bb.utils.explode_dep_versions2(pkg_data.get("RPROVIDES", "")).items())
-            rprovides.add(pkg)
-
-            if "PKG" in pkg_data:
-                pkg = pkg_data["PKG"]
-                rprovides.add(pkg)
-
-            for r in rprovides:
-                providers[r] = (pkg, dep_hashfn)
-
-    return providers
-
-collect_package_providers[vardepsexclude] += "BB_TASKDEPDATA"
-
-def spdx_get_src(d):
-    """
-    save patched source of the recipe in SPDX_WORKDIR.
-    """
-    import shutil
-    spdx_workdir = d.getVar('SPDXWORK')
-    spdx_sysroot_native = d.getVar('STAGING_DIR_NATIVE')
-    pn = d.getVar('PN')
-
-    workdir = d.getVar("WORKDIR")
-
-    try:
-        # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
-        if not is_work_shared_spdx(d):
-            # Change the WORKDIR to make do_unpack do_patch run in another dir.
-            d.setVar('WORKDIR', spdx_workdir)
-            # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
-            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
-
-            # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-            # possibly requiring of the following tasks (such as some recipes's
-            # do_patch required 'B' existed).
-            bb.utils.mkdirhier(d.getVar('B'))
-
-            bb.build.exec_func('do_unpack', d)
-        # Copy source of kernel to spdx_workdir
-        if is_work_shared_spdx(d):
-            share_src = d.getVar('WORKDIR')
-            d.setVar('WORKDIR', spdx_workdir)
-            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
-            src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
-            bb.utils.mkdirhier(src_dir)
-            if bb.data.inherits_class('kernel',d):
-                share_src = d.getVar('STAGING_KERNEL_DIR')
-            cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
-            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
-            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
-
-            git_path = src_dir + "/.git"
-            if os.path.exists(git_path):
-                shutils.rmtree(git_path)
-
-        # Make sure gcc and kernel sources are patched only once
-        if not (d.getVar('SRC_URI') == "" or is_work_shared_spdx(d)):
-            bb.build.exec_func('do_patch', d)
-
-        # Some userland has no source.
-        if not os.path.exists( spdx_workdir ):
-            bb.utils.mkdirhier(spdx_workdir)
-    finally:
-        d.setVar("WORKDIR", workdir)
-
-spdx_get_src[vardepsexclude] += "STAGING_KERNEL_DIR"
-
+oe.spdx_common.collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
+oe.spdx_common.collect_direct_deps[vardeps] += "DEPENDS"
+oe.spdx_common.collect_package_providers[vardepsexclude] += "BB_TASKDEPDATA"
+oe.spdx_common.get_patched_src[vardepsexclude] += "STAGING_KERNEL_DIR"
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 771e87be796..2532d19dad2 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -12,6 +12,7 @@ import re
 import hashlib
 import uuid
 import os
+import oe.spdx_common
 from datetime import datetime, timezone
 
 OE_SPDX_BASE = "https://rdf.openembedded.org/spdx/3.0/"
@@ -205,24 +206,6 @@ def get_alias(obj):
     return None
 
 
-def extract_licenses(filename):
-    lic_regex = re.compile(
-        rb"^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$", re.MULTILINE
-    )
-
-    try:
-        with open(filename, "rb") as f:
-            size = min(15000, os.stat(filename).st_size)
-            txt = f.read(size)
-            licenses = re.findall(lic_regex, txt)
-            if licenses:
-                ascii_licenses = [lic.decode("ascii") for lic in licenses]
-                return ascii_licenses
-    except Exception as e:
-        bb.warn(f"Exception reading {filename}: {e}")
-    return []
-
-
 def to_list(l):
     if isinstance(l, set):
         l = sorted(list(l))
@@ -630,7 +613,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 return
 
         file_licenses = set()
-        for extracted_lic in extract_licenses(filepath):
+        for extracted_lic in oe.spdx_common.extract_licenses(filepath):
             file_licenses.add(self.new_license_expression(extracted_lic))
 
         self.new_relationship(
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
new file mode 100644
index 00000000000..f23100fe03d
--- /dev/null
+++ b/meta/lib/oe/spdx_common.py
@@ -0,0 +1,228 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import bb
+import collections
+import json
+import oe.packagedata
+import re
+import shutil
+
+from pathlib import Path
+
+
+LIC_REGEX = re.compile(
+    rb"^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$",
+    re.MULTILINE,
+)
+
+
+def extract_licenses(filename):
+    """
+    Extract SPDX License identifiers from a file
+    """
+    try:
+        with open(filename, "rb") as f:
+            size = min(15000, os.stat(filename).st_size)
+            txt = f.read(size)
+            licenses = re.findall(LIC_REGEX, txt)
+            if licenses:
+                ascii_licenses = [lic.decode("ascii") for lic in licenses]
+                return ascii_licenses
+    except Exception as e:
+        bb.warn(f"Exception reading {filename}: {e}")
+    return []
+
+
+def is_work_shared_spdx(d):
+    return bb.data.inherits_class("kernel", d) or ("work-shared" in d.getVar("WORKDIR"))
+
+
+def load_spdx_license_data(d):
+    if d.getVar("SPDX_LICENSE_DATA"):
+        return
+
+    with open(d.getVar("SPDX_LICENSES"), "r") as f:
+        data = json.load(f)
+        # Transform the license array to a dictionary
+        data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
+        d.setVar("SPDX_LICENSE_DATA", data)
+
+
+def process_sources(d):
+    """
+    Returns True if the sources for this recipe should be included in the SPDX
+    or False if not
+    """
+    pn = d.getVar("PN")
+    assume_provided = (d.getVar("ASSUME_PROVIDED") or "").split()
+    if pn in assume_provided:
+        for p in d.getVar("PROVIDES").split():
+            if p != pn:
+                pn = p
+                break
+
+    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been deleted,
+    # so avoid archiving source here.
+    if pn.startswith("glibc-locale"):
+        return False
+    if d.getVar("PN") == "libtool-cross":
+        return False
+    if d.getVar("PN") == "libgcc-initial":
+        return False
+    if d.getVar("PN") == "shadow-sysroot":
+        return False
+
+    # We just archive gcc-source for all the gcc related recipes
+    if d.getVar("BPN") in ["gcc", "libgcc"]:
+        bb.debug(1, "spdx: There is bug in scan of %s is, do nothing" % pn)
+        return False
+
+    return True
+
+
+Dep = collections.namedtuple("Dep", ["pn", "hashfn", "in_taskhash"])
+
+
+def collect_direct_deps(d, dep_task):
+    """
+    Find direct dependencies of current task
+
+    Returns the list of recipes that have a dep_task that the current task
+    depends on
+    """
+    current_task = "do_" + d.getVar("BB_CURRENTTASK")
+    pn = d.getVar("PN")
+
+    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
+
+    for this_dep in taskdepdata.values():
+        if this_dep[0] == pn and this_dep[1] == current_task:
+            break
+    else:
+        bb.fatal(f"Unable to find this {pn}:{current_task} in taskdepdata")
+
+    deps = set()
+
+    for dep_name in this_dep.deps:
+        dep_data = taskdepdata[dep_name]
+        if dep_data.taskname == dep_task and dep_data.pn != pn:
+            deps.add((dep_data.pn, dep_data.hashfn, dep_name in this_dep.taskhash_deps))
+
+    return sorted(deps)
+
+
+def get_spdx_deps(d):
+    """
+    Reads the SPDX dependencies JSON file and returns the data
+    """
+    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
+
+    deps = []
+    with spdx_deps_file.open("r") as f:
+        for d in json.load(f):
+            deps.append(Dep(*d))
+    return deps
+
+
+def collect_package_providers(d):
+    """
+    Returns a dictionary where each RPROVIDES is mapped to the package that
+    provides it
+    """
+    deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
+
+    providers = {}
+
+    deps = collect_direct_deps(d, "do_create_spdx")
+    deps.append((d.getVar("PN"), d.getVar("BB_HASHFILENAME"), True))
+
+    for dep_pn, dep_hashfn, _ in deps:
+        localdata = d
+        recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
+        if not recipe_data:
+            localdata = bb.data.createCopy(d)
+            localdata.setVar("PKGDATA_DIR", "${PKGDATA_DIR_SDK}")
+            recipe_data = oe.packagedata.read_pkgdata(dep_pn, localdata)
+
+        for pkg in recipe_data.get("PACKAGES", "").split():
+            pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, localdata)
+            rprovides = set(
+                n
+                for n, _ in bb.utils.explode_dep_versions2(
+                    pkg_data.get("RPROVIDES", "")
+                ).items()
+            )
+            rprovides.add(pkg)
+
+            if "PKG" in pkg_data:
+                pkg = pkg_data["PKG"]
+                rprovides.add(pkg)
+
+            for r in rprovides:
+                providers[r] = (pkg, dep_hashfn)
+
+    return providers
+
+
+def get_patched_src(d):
+    """
+    Save patched source of the recipe in SPDX_WORKDIR.
+    """
+    spdx_workdir = d.getVar("SPDXWORK")
+    spdx_sysroot_native = d.getVar("STAGING_DIR_NATIVE")
+    pn = d.getVar("PN")
+
+    workdir = d.getVar("WORKDIR")
+
+    try:
+        # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
+        if not is_work_shared_spdx(d):
+            # Change the WORKDIR to make do_unpack do_patch run in another dir.
+            d.setVar("WORKDIR", spdx_workdir)
+            # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
+
+            # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
+            # possibly requiring of the following tasks (such as some recipes's
+            # do_patch required 'B' existed).
+            bb.utils.mkdirhier(d.getVar("B"))
+
+            bb.build.exec_func("do_unpack", d)
+        # Copy source of kernel to spdx_workdir
+        if is_work_shared_spdx(d):
+            share_src = d.getVar("WORKDIR")
+            d.setVar("WORKDIR", spdx_workdir)
+            d.setVar("STAGING_DIR_NATIVE", spdx_sysroot_native)
+            src_dir = (
+                spdx_workdir
+                + "/"
+                + d.getVar("PN")
+                + "-"
+                + d.getVar("PV")
+                + "-"
+                + d.getVar("PR")
+            )
+            bb.utils.mkdirhier(src_dir)
+            if bb.data.inherits_class("kernel", d):
+                share_src = d.getVar("STAGING_KERNEL_DIR")
+            cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
+            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
+
+            git_path = src_dir + "/.git"
+            if os.path.exists(git_path):
+                shutils.rmtree(git_path)
+
+        # Make sure gcc and kernel sources are patched only once
+        if not (d.getVar("SRC_URI") == "" or is_work_shared_spdx(d)):
+            bb.build.exec_func("do_patch", d)
+
+        # Some userland has no source.
+        if not os.path.exists(spdx_workdir):
+            bb.utils.mkdirhier(spdx_workdir)
+    finally:
+        d.setVar("WORKDIR", workdir)
-- 
2.45.2


