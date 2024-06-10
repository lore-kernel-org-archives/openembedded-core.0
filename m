Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF449C27C4F
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 21:45:13 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.32287.1718055904818101741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 14:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QOMeBw/O;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6f99555c922so1156960a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718055903; x=1718660703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxjarFVFcpAj5EEhY+Yd3Dt9DEVjf5sJ2Mpu1us+grs=;
        b=QOMeBw/O2cc9MYev7Wpe7fSAvdPkN3bJgKeL2wawIKGwQQtUQmoAY628jsPzgNSgY4
         6KeBht/PwRuoZ+5Ux9hVpUNtcNpE7JUQ9oix2mQoe/cxNXGEONkXwRAUz1q3tEcS7z6q
         DDqrN/WGvn/YkcMhPEKCiLk+zQbmkv6BhlL0TBa4q1QVdvWjbuETWs8ck6d+jiueUayh
         zkG5TM73PwXJwDarhlhWr0c4rRT7fOiuIGOGkqLBa8SEuDtsRW43JdUueWcXakKz0ZFS
         yTK5zTlKBgExQVQBQxBE/Xq/ja6sG9V3X6wjoO8INEXp4sYVHJGh1BLpueRbQEUFQGQq
         yoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718055903; x=1718660703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxjarFVFcpAj5EEhY+Yd3Dt9DEVjf5sJ2Mpu1us+grs=;
        b=NHqWhqKhTJMxLQMGYxcK20OwK14DJB1HYUbNK8XxqKxRs0XpKVTZockWGhYUyBBgh6
         xtmWyBNFM8AI7mvHFXzFzzwxedSxHO06zHLM6ILzCbUCpabSf1Y9ujv1ZnR04yh7izfQ
         PvTn6kYBT3yoGQlub6LKWRVTiodc1Mbu7ibRu0WL/iW3uOWC1YDfxkHenyPzad/IfShp
         h1HGIEvUBmidGVL//YIwcE3eWB0VShgeJSAFixjvRwhmjsqIaFXV0zA7wsF4mIPiifyM
         1fLqXK4wV5R9pH7829oa7zolY5OyYnf7D9m6MEi7wE0xgSWAqOdM/HHhZlGlmrfctgpi
         /QhA==
X-Gm-Message-State: AOJu0YzHiyzLnLtuBJ31b9XdnbrbTVO2fzhVpoy2wDTOGcaTLeZ71kLu
	MIZK3qs1dfIE/VV2BSlVwzMKw4jl2Lg6R5MWUs2RJywDd7rC8t+TslB1mA==
X-Google-Smtp-Source: AGHT+IHb6T6tlxpxml0TI39x5gffnMe5ANIz1a4YOl/5XMoF8ymCoSVbxUIoUHupD9RbzORFi2YqHA==
X-Received: by 2002:a05:6830:3b09:b0:6f0:6420:35cb with SMTP id 46e09a7af769-6f95733721fmr11161641a34.29.1718055902229;
        Mon, 10 Jun 2024 14:45:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::2cec])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f94dc70d48sm1888631a34.5.2024.06.10.14.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 14:45:01 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/6] classes/spdx-common: Move common SPDX to new class
Date: Mon, 10 Jun 2024 15:41:48 -0600
Message-ID: <20240610214456.2757397-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610214456.2757397-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 21:45:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200486

Moves SPDX code that can be shared between different SPDX versions into
a common class

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 259 ++-------------------------
 meta/classes/spdx-common.bbclass     | 256 ++++++++++++++++++++++++++
 2 files changed, 266 insertions(+), 249 deletions(-)
 create mode 100644 meta/classes/spdx-common.bbclass

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 7c8a0b8b0f7..94a172fbc94 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -4,65 +4,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
-
-# The product name that the CVE database uses.  Defaults to BPN, but may need to
-# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
-CVE_PRODUCT ??= "${BPN}"
-CVE_VERSION ??= "${PV}"
-
-SPDXDIR ??= "${WORKDIR}/spdx"
-SPDXDEPLOY = "${SPDXDIR}/deploy"
-SPDXWORK = "${SPDXDIR}/work"
-SPDXIMAGEWORK = "${SPDXDIR}/image-work"
-SPDXSDKWORK = "${SPDXDIR}/sdk-work"
-SPDXDEPS = "${SPDXDIR}/deps.json"
-
-SPDX_TOOL_NAME ??= "oe-spdx-creator"
-SPDX_TOOL_VERSION ??= "1.0"
-
-SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
-
-SPDX_INCLUDE_SOURCES ??= "0"
-SPDX_ARCHIVE_SOURCES ??= "0"
-SPDX_ARCHIVE_PACKAGED ??= "0"
-
-SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
-SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
-SPDX_PRETTY ??= "0"
-
-SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
-
-SPDX_CUSTOM_ANNOTATION_VARS ??= ""
-
-SPDX_ORG ??= "OpenEmbedded ()"
-SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
-SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
-    this recipe. For SPDX documents create using this class during the build, this \
-    is the contact information for the person or organization who is doing the \
-    build."
-
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
-    return None
-
-def get_doc_namespace(d, doc):
+inherit spdx-common
+
+def get_namespace(d, name):
     import uuid
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
-    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), doc.name, str(uuid.uuid5(namespace_uuid, doc.name)))
+    return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), name, str(uuid.uuid5(namespace_uuid, name)))
+
 
 def create_annotation(d, comment):
     from datetime import datetime, timezone
@@ -80,26 +28,6 @@ def recipe_spdx_is_native(d, recipe):
       a.annotator == "Tool: %s - %s" % (d.getVar("SPDX_TOOL_NAME"), d.getVar("SPDX_TOOL_VERSION")) and
       a.comment == "isNative" for a in recipe.annotations)
 
-def is_work_shared_spdx(d):
-    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
-
-def get_json_indent(d):
-    if d.getVar("SPDX_PRETTY") == "1":
-        return 2
-    return None
-
-python() {
-    import json
-    if d.getVar("SPDX_LICENSE_DATA"):
-        return
-
-    with open(d.getVar("SPDX_LICENSES"), "r") as f:
-        data = json.load(f)
-        # Transform the license array to a dictionary
-        data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
-        d.setVar("SPDX_LICENSE_DATA", data)
-}
-
 def convert_license_to_spdx(lic, document, d, existing={}):
     from pathlib import Path
     import oe.spdx
@@ -172,34 +100,6 @@ def convert_license_to_spdx(lic, document, d, existing={}):
 
     return ' '.join(convert(l) for l in lic_split)
 
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
-
 def add_package_files(d, doc, spdx_pkg, topdir, get_spdxid, get_types, *, archive=None, ignore_dirs=[], ignore_top_level_dirs=[]):
     from pathlib import Path
     import oe.spdx
@@ -348,14 +248,12 @@ def collect_dep_recipes(d, doc, spdx_recipe):
     import oe.spdx
 
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
-    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
     package_archs = d.getVar("SSTATE_ARCHS").split()
     package_archs.reverse()
 
     dep_recipes = []
 
-    with spdx_deps_file.open("r") as f:
-        deps = json.load(f)
+    deps = get_spdx_deps(d)
 
     for dep_pn, dep_hashfn, in_taskhash in deps:
         # If this dependency is not calculated in the taskhash skip it.
@@ -468,51 +366,6 @@ def add_download_packages(d, doc, recipe):
             # but this should be sufficient for now
             doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
 
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
-    for dep_name in this_dep[3]:
-        dep_data = taskdepdata[dep_name]
-        if dep_data[1] == dep_task and dep_data[0] != pn:
-            deps.add((dep_data[0], dep_data[7], dep_name in this_dep[8]))
-
-    return sorted(deps)
-
-collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
-collect_direct_deps[vardeps] += "DEPENDS"
-
-python do_collect_spdx_deps() {
-    # This task calculates the build time dependencies of the recipe, and is
-    # required because while a task can deptask on itself, those dependencies
-    # do not show up in BB_TASKDEPDATA. To work around that, this task does the
-    # deptask on do_create_spdx and writes out the dependencies it finds, then
-    # do_create_spdx reads in the found dependencies when writing the actual
-    # SPDX document
-    import json
-    from pathlib import Path
-
-    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
-
-    deps = collect_direct_deps(d, "do_create_spdx")
-
-    with spdx_deps_file.open("w") as f:
-        json.dump(deps, f)
-}
-# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
-addtask do_collect_spdx_deps after do_unpack
-do_collect_spdx_deps[depends] += "${PATCHDEPENDENCY}"
-do_collect_spdx_deps[deptask] = "do_create_spdx"
-do_collect_spdx_deps[dirs] = "${SPDXDIR}"
 
 python do_create_spdx() {
     from datetime import datetime, timezone
@@ -551,7 +404,7 @@ python do_create_spdx() {
     doc = oe.spdx.SPDXDocument()
 
     doc.name = "recipe-" + d.getVar("PN")
-    doc.documentNamespace = get_doc_namespace(d, doc)
+    doc.documentNamespace = get_namespace(d, doc.name)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
     doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
@@ -655,7 +508,7 @@ python do_create_spdx() {
             package_doc = oe.spdx.SPDXDocument()
             pkg_name = d.getVar("PKG:%s" % package) or package
             package_doc.name = pkg_name
-            package_doc.documentNamespace = get_doc_namespace(d, package_doc)
+            package_doc.documentNamespace = get_namespace(d, package_doc.name)
             package_doc.creationInfo.created = creation_time
             package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
             package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
@@ -716,44 +569,6 @@ do_create_spdx[dirs] = "${SPDXWORK}"
 do_create_spdx[cleandirs] = "${SPDXDEPLOY} ${SPDXWORK}"
 do_create_spdx[depends] += "${PATCHDEPENDENCY}"
 
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
 python do_create_runtime_spdx() {
     from datetime import datetime, timezone
     import oe.sbom
@@ -800,7 +615,7 @@ python do_create_runtime_spdx() {
 
             runtime_doc = oe.spdx.SPDXDocument()
             runtime_doc.name = "runtime-" + pkg_name
-            runtime_doc.documentNamespace = get_doc_namespace(localdata, runtime_doc)
+            runtime_doc.documentNamespace = get_namespace(localdata, runtime_doc.name)
             runtime_doc.creationInfo.created = creation_time
             runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
             runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
@@ -891,60 +706,6 @@ do_create_runtime_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_runtime_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_runtime_spdx[rdeptask] = "do_create_spdx"
 
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
 do_rootfs[recrdeptask] += "do_create_spdx do_create_runtime_spdx"
 do_rootfs[cleandirs] += "${SPDXIMAGEWORK}"
 
@@ -1019,7 +780,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     doc = oe.spdx.SPDXDocument()
     doc.name = rootfs_name
-    doc.documentNamespace = get_doc_namespace(d, doc)
+    doc.documentNamespace = get_namespace(d, doc.name)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
     doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
new file mode 100644
index 00000000000..468a11ca3e2
--- /dev/null
+++ b/meta/classes/spdx-common.bbclass
@@ -0,0 +1,256 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
+
+# The product name that the CVE database uses.  Defaults to BPN, but may need to
+# be overriden per recipe (for example tiff.bb sets CVE_PRODUCT=libtiff).
+CVE_PRODUCT ??= "${BPN}"
+CVE_VERSION ??= "${PV}"
+
+SPDXDIR ??= "${WORKDIR}/spdx"
+SPDXDEPLOY = "${SPDXDIR}/deploy"
+SPDXWORK = "${SPDXDIR}/work"
+SPDXIMAGEWORK = "${SPDXDIR}/image-work"
+SPDXSDKWORK = "${SPDXDIR}/sdk-work"
+SPDXDEPS = "${SPDXDIR}/deps.json"
+
+SPDX_TOOL_NAME ??= "oe-spdx-creator"
+SPDX_TOOL_VERSION ??= "1.0"
+
+SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
+
+SPDX_INCLUDE_SOURCES ??= "0"
+SPDX_ARCHIVE_SOURCES ??= "0"
+SPDX_ARCHIVE_PACKAGED ??= "0"
+
+SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
+SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
+SPDX_PRETTY ??= "0"
+
+SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
+
+SPDX_CUSTOM_ANNOTATION_VARS ??= ""
+
+SPDX_ORG ??= "OpenEmbedded ()"
+SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
+SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
+    this recipe. For SPDX documents create using this class during the build, this \
+    is the contact information for the person or organization who is doing the \
+    build."
+
+def extract_licenses(filename):
+    import re
+
+    lic_regex = re.compile(rb'^\W*SPDX-License-Identifier:\s*([ \w\d.()+-]+?)(?:\s+\W*)?$', re.MULTILINE)
+
+    try:
+        with open(filename, 'rb') as f:
+            size = min(15000, os.stat(filename).st_size)
+            txt = f.read(size)
+            licenses = re.findall(lic_regex, txt)
+            if licenses:
+                ascii_licenses = [lic.decode('ascii') for lic in licenses]
+                return ascii_licenses
+    except Exception as e:
+        bb.warn(f"Exception reading {filename}: {e}")
+    return None
+
+def is_work_shared_spdx(d):
+    return bb.data.inherits_class('kernel', d) or ('work-shared' in d.getVar('WORKDIR'))
+
+def get_json_indent(d):
+    if d.getVar("SPDX_PRETTY") == "1":
+        return 2
+    return None
+
+python() {
+    import json
+    if d.getVar("SPDX_LICENSE_DATA"):
+        return
+
+    with open(d.getVar("SPDX_LICENSES"), "r") as f:
+        data = json.load(f)
+        # Transform the license array to a dictionary
+        data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
+        d.setVar("SPDX_LICENSE_DATA", data)
+}
+
+def process_sources(d):
+    pn = d.getVar('PN')
+    assume_provided = (d.getVar("ASSUME_PROVIDED") or "").split()
+    if pn in assume_provided:
+        for p in d.getVar("PROVIDES").split():
+            if p != pn:
+                pn = p
+                break
+
+    # glibc-locale: do_fetch, do_unpack and do_patch tasks have been deleted,
+    # so avoid archiving source here.
+    if pn.startswith('glibc-locale'):
+        return False
+    if d.getVar('PN') == "libtool-cross":
+        return False
+    if d.getVar('PN') == "libgcc-initial":
+        return False
+    if d.getVar('PN') == "shadow-sysroot":
+        return False
+
+    # We just archive gcc-source for all the gcc related recipes
+    if d.getVar('BPN') in ['gcc', 'libgcc']:
+        bb.debug(1, 'spdx: There is bug in scan of %s is, do nothing' % pn)
+        return False
+
+    return True
+
+def collect_direct_deps(d, dep_task):
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
+collect_direct_deps[vardepsexclude] += "BB_TASKDEPDATA"
+collect_direct_deps[vardeps] += "DEPENDS"
+
+python do_collect_spdx_deps() {
+    # This task calculates the build time dependencies of the recipe, and is
+    # required because while a task can deptask on itself, those dependencies
+    # do not show up in BB_TASKDEPDATA. To work around that, this task does the
+    # deptask on do_create_spdx and writes out the dependencies it finds, then
+    # do_create_spdx reads in the found dependencies when writing the actual
+    # SPDX document
+    import json
+    from pathlib import Path
+
+    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
+
+    deps = collect_direct_deps(d, "do_create_spdx")
+
+    with spdx_deps_file.open("w") as f:
+        json.dump(deps, f)
+}
+# NOTE: depending on do_unpack is a hack that is necessary to get it's dependencies for archive the source
+addtask do_collect_spdx_deps after do_unpack
+do_collect_spdx_deps[depends] += "${PATCHDEPENDENCY}"
+do_collect_spdx_deps[deptask] = "do_create_spdx"
+do_collect_spdx_deps[dirs] = "${SPDXDIR}"
+
+def get_spdx_deps(d):
+    import json
+    from pathlib import Path
+
+    spdx_deps_file = Path(d.getVar("SPDXDEPS"))
+
+    with spdx_deps_file.open("r") as f:
+        return json.load(f)
+
+def collect_package_providers(d):
+    from pathlib import Path
+    import oe.sbom
+    import oe.spdx
+    import json
+
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
+
+            pkg_data = oe.packagedata.read_subpkgdata_dict(pkg, localdata)
+            rprovides = set(n for n, _ in bb.utils.explode_dep_versions2(pkg_data.get("RPROVIDES", "")).items())
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
+collect_package_providers[vardepsexclude] += "BB_TASKDEPDATA"
+
+def spdx_get_src(d):
+    """
+    save patched source of the recipe in SPDX_WORKDIR.
+    """
+    import shutil
+    spdx_workdir = d.getVar('SPDXWORK')
+    spdx_sysroot_native = d.getVar('STAGING_DIR_NATIVE')
+    pn = d.getVar('PN')
+
+    workdir = d.getVar("WORKDIR")
+
+    try:
+        # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
+        if not is_work_shared_spdx(d):
+            # Change the WORKDIR to make do_unpack do_patch run in another dir.
+            d.setVar('WORKDIR', spdx_workdir)
+            # Restore the original path to recipe's native sysroot (it's relative to WORKDIR).
+            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
+
+            # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
+            # possibly requiring of the following tasks (such as some recipes's
+            # do_patch required 'B' existed).
+            bb.utils.mkdirhier(d.getVar('B'))
+
+            bb.build.exec_func('do_unpack', d)
+        # Copy source of kernel to spdx_workdir
+        if is_work_shared_spdx(d):
+            share_src = d.getVar('WORKDIR')
+            d.setVar('WORKDIR', spdx_workdir)
+            d.setVar('STAGING_DIR_NATIVE', spdx_sysroot_native)
+            src_dir = spdx_workdir + "/" + d.getVar('PN')+ "-" + d.getVar('PV') + "-" + d.getVar('PR')
+            bb.utils.mkdirhier(src_dir)
+            if bb.data.inherits_class('kernel',d):
+                share_src = d.getVar('STAGING_KERNEL_DIR')
+            cmd_copy_share = "cp -rf " + share_src + "/* " + src_dir + "/"
+            cmd_copy_shared_res = os.popen(cmd_copy_share).read()
+            bb.note("cmd_copy_shared_result = " + cmd_copy_shared_res)
+
+            git_path = src_dir + "/.git"
+            if os.path.exists(git_path):
+                shutils.rmtree(git_path)
+
+        # Make sure gcc and kernel sources are patched only once
+        if not (d.getVar('SRC_URI') == "" or is_work_shared_spdx(d)):
+            bb.build.exec_func('do_patch', d)
+
+        # Some userland has no source.
+        if not os.path.exists( spdx_workdir ):
+            bb.utils.mkdirhier(spdx_workdir)
+    finally:
+        d.setVar("WORKDIR", workdir)
+
+spdx_get_src[vardepsexclude] += "STAGING_KERNEL_DIR"
+
-- 
2.43.2


