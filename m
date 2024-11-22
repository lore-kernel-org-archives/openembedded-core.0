Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274CEE69191
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 20:16:38 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.34220.1732306589790061830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 12:16:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zd/tbkv/;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-297078d8eaeso1669188fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 12:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732306588; x=1732911388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzw8ub7anGkxH2oJXkyj9ENow9/Qy+leHUoUjAMMyVo=;
        b=Zd/tbkv/5Fqs59/XGZbtoekuO8RHK5CXLObg92iR/upA+UeNMIp8WnnjYsjVkXWYI3
         2I+p34Hek6Z2jE4zGpxZ+jd560uREj+SJBC1rIbSLLl4pYp2uaCP70dYKoMwI7BBS996
         qTa7+BnWGDJ9YHaRM+CDaxXWvDXGFSmZ25fs5LIJIopsv+yEwK8z+oPw3T6p7FlC5ouz
         ZPCVDZ3EXbFa/7vti/lqjJ0ncuU3DbwpoLHjCpRvIq//uiDadO2yEVFCM4z98czBT2Xg
         mE3gY9PGCCVvXUpJaMQ2RemvlYE6x0KZmzCTOc4/ZT5SLIopR7iZYaolP7sFaqTCnrBj
         qocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732306588; x=1732911388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzw8ub7anGkxH2oJXkyj9ENow9/Qy+leHUoUjAMMyVo=;
        b=CTAxBKYDcbyn6sCMc/FI0R+AasfFWbIeEPRgei9t9HCiZ8SHZzLJM5lSNtSYlJL3Qj
         vhIXIfNFefFTMM457U7rx1qm4E/a1TO88F1NeopA7aum+/PzmSg9QRzDItYsPh4U2zTb
         oFwTboqFb8h4yDe2ASJFw2r9YAi1Pwdn/JTTpyDpiPA+QpcUQGzdTpF4pN67FmywOD4H
         dtdW2Hz+lee/A94feuANrO0XsUKMVgPoBaqitEZf07RiS9XyKQec6SBxESIBsrMj80k8
         c+vhAXyYOz6jhWC+uZT2rYeiTmHnjK9NATQSxPz9ePRSpEhYPxiOEybCRZ7CfnklPSBS
         R7Fw==
X-Gm-Message-State: AOJu0YxP0VO5bhNR3o/VVlnLau4f/a2+VOHEh6NNt3pxp4Jqsbt6jrQ8
	2KOTvOIFsH8+Qe+kJq3syiaxSPUd3N8iXw0DFT3aWaR4LpB88N7fOHO1mA==
X-Gm-Gg: ASbGncsIGN0TW+09DGDEeI+CXLP9jboiSBtJvgKiJnuHmtqgagWHdbHTSwvFRvpsT2q
	v8bDXnUWIyekbOYJx1X2f3RgAyxW/6i9CfR+8GVdRwwHPCVuU7V4/NDfcGYGtPhV4xoGB2YzowQ
	wOUZcmY9hC9eug/8366x4DQn30TxGafvnNClZhuRC/XJutprDKrHk2GSnMM7vMa/48Y4TB+Kq3E
	dbuvBFYaxP171r44zvTOxzxdzKI0OHe0ExdPgboWqQiPcxY
X-Google-Smtp-Source: AGHT+IEXBJRC6j6wc+Y8uNJji6QujlFVs4JHVgG83qchvWdq0K3K6pXPZT3hEWMRwBNqIyXvjXw6jw==
X-Received: by 2002:a05:6871:818b:b0:277:c113:5b26 with SMTP id 586e51a60fabf-29720c5df28mr5159301fac.7.1732306588286;
        Fri, 22 Nov 2024 12:16:28 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::dc1a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2971d5e5147sm795744fac.22.2024.11.22.12.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 12:16:26 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] spdx: Add do_deploy_build_sbom_spdx
Date: Fri, 22 Nov 2024 13:16:23 -0700
Message-ID: <20241122201623.2247149-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 20:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207647

Adds a task that can be used to generate a stand alone SBoM for a given
build of a recipe. This SBoM includes the inputs and output for the
build, as well as the build and runtime dependencies. The dependencies
however will be added as unresolved imports to the OE SPDX alias, so as
to avoid pulling in the entire dependency tree (that is, the generated
SBoM is focused on just the specific recipe, not the entire build
dependency tree).

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 25 ++++++++++++
 meta/lib/oe/sbom30.py                | 55 ++++++++++++++++----------
 meta/lib/oe/spdx30_tasks.py          | 59 ++++++++++++++++++++++++++--
 meta/lib/oeqa/selftest/cases/spdx.py | 20 +++++++++-
 4 files changed, 133 insertions(+), 26 deletions(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 640f5490bda..3b421bfda67 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -117,6 +117,8 @@ SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
+SPDXRECIPEBUILDDEPLOYDIR = "${SPDXDIR}/recipe-build-deploy"
+
 oe.spdx30_tasks.set_timestamp_now[vardepsexclude] = "SPDX_INCLUDE_TIMESTAMPS"
 oe.spdx30_tasks.get_package_sources_from_debug[vardepsexclude] += "STAGING_KERNEL_DIR"
 oe.spdx30_tasks.collect_dep_objsets[vardepsexclude] = "SPDX_MULTILIB_SSTATE_ARCHS"
@@ -179,6 +181,29 @@ do_create_package_spdx[dirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[cleandirs] = "${SPDXRUNTIMEDEPLOY}"
 do_create_package_spdx[rdeptask] = "do_create_spdx"
 
+python do_deploy_build_sbom_spdx() {
+    import oe.spdx30_tasks
+    from pathlib import Path
+
+    deploydir = Path(d.getVar("SPDXRECIPEBUILDDEPLOYDIR"))
+    spdx_path = deploydir / (d.getVar("PN") + "-build.spdx.json")
+
+    oe.spdx30_tasks.create_build_sbom(d, spdx_path)
+}
+addtask do_deploy_build_sbom_spdx after do_create_spdx do_create_package_spdx
+SSTATETASKS += "do_deploy_build_sbom_spdx"
+SSTATE_SKIP_CREATION:task-create-recipe-sbom = "1"
+do_deploy_build_sbom_spdx[sstate-inputdirs] = "${SPDXRECIPEBUILDDEPLOYDIR}"
+do_deploy_build_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
+do_deploy_build_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
+do_deploy_build_sbom_spdx[cleandirs] = "${SPDXRECIPEBUILDDEPLOYDIR}"
+do_deploy_build_sbom_spdx[file-checksums] += "${SPDX3_LIB_DEP_FILES}"
+
+python do_deploy_build_sbom_spdx_setscene() {
+    sstate_setscene(d)
+}
+addtask do_deploy_build_sbom_spdx_setscene
+
 python spdx30_build_started_handler () {
     import oe.spdx30_tasks
     d = e.data.createCopy()
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 8433637de80..56cdd7ba4c6 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -824,32 +824,29 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
         return objset
 
-    def expand_collection(self, *, add_objectsets=[]):
+    def merge_doc(self, other):
+        imports = {e.externalSpdxId: e for e in self.doc.import_}
+
+        for e in other.doc.import_:
+            if e.externalSpdxId not in imports:
+                imports[e.externalSpdxId] = e
+
+        self.objects |= other.objects
+        self.doc.import_ = sorted(imports.values(), key=lambda e: e.externalSpdxId)
+
+    def expand_collection(self):
         """
         Expands a collection to pull in all missing elements
 
         Returns the set of ids that could not be found to link into the document
         """
         missing_spdxids = set()
-        imports = {e.externalSpdxId: e for e in self.doc.import_}
-
-        def merge_doc(other):
-            nonlocal imports
-
-            for e in other.doc.import_:
-                if not e.externalSpdxId in imports:
-                    imports[e.externalSpdxId] = e
-
-            self.objects |= other.objects
-
-        for o in add_objectsets:
-            merge_doc(o)
 
         needed_spdxids = self.link()
         provided_spdxids = set(self.obj_by_id.keys())
 
         while True:
-            import_spdxids = set(imports.keys())
+            import_spdxids = set(e.externalSpdxId for e in self.doc.import_)
             searching_spdxids = (
                 needed_spdxids - provided_spdxids - missing_spdxids - import_spdxids
             )
@@ -869,7 +866,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                     bb.fatal(f"{spdxid} not found in {dep_path}")
                 provided_spdxids |= dep_provided
                 needed_spdxids |= dep_objset.missing_ids
-                merge_doc(dep_objset)
+                self.merge_doc(dep_objset)
             else:
                 missing_spdxids.add(spdxid)
 
@@ -880,8 +877,6 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
                 f"Linked document doesn't match missing SPDX ID list. Got: {missing}\nExpected: {missing_spdxids}"
             )
 
-        self.doc.import_ = sorted(imports.values(), key=lambda e: e.externalSpdxId)
-
         return missing_spdxids
 
 
@@ -1061,7 +1056,14 @@ def find_by_spdxid(d, spdxid, *, required=False):
     return find_jsonld(d, *jsonld_hash_path(spdxid), required=required)
 
 
-def create_sbom(d, name, root_elements, add_objectsets=[]):
+def create_sbom(
+    d,
+    name,
+    root_elements,
+    add_objectsets=[],
+    expand=True,
+    import_missing=False,
+):
     objset = ObjectSet.new_objset(d, name)
 
     sbom = objset.add(
@@ -1074,8 +1076,19 @@ def create_sbom(d, name, root_elements, add_objectsets=[]):
         )
     )
 
-    missing_spdxids = objset.expand_collection(add_objectsets=add_objectsets)
-    if missing_spdxids:
+    for o in add_objectsets:
+        objset.merge_doc(o)
+
+    if expand:
+        missing_spdxids = objset.expand_collection()
+    else:
+        missing_spdxids = objset.link()
+
+    if import_missing:
+        for m in missing_spdxids:
+            objset.doc.import_.append(oe.spdx30.ExternalMap(externalSpdxId=m))
+
+    elif missing_spdxids:
         bb.warn(
             "The following SPDX IDs were unable to be resolved:\n  "
             + "\n  ".join(sorted(list(missing_spdxids)))
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5aeed5cd6fc..2a2031bab3b 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -773,6 +773,14 @@ def create_spdx(d):
     oe.sbom30.write_recipe_jsonld_doc(d, build_objset, "recipes", deploydir)
 
 
+def get_package_data(d, package):
+    localdata = bb.data.createCopy(d)
+    pkg_name = d.getVar("PKG:%s" % package) or package
+    localdata.setVar("PKG", pkg_name)
+    localdata.setVar("OVERRIDES", d.getVar("OVERRIDES", False) + ":" + package)
+    return localdata
+
+
 def create_package_spdx(d):
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     deploydir = Path(d.getVar("SPDXRUNTIMEDEPLOY"))
@@ -798,10 +806,8 @@ def create_package_spdx(d):
 
     pkgdest = Path(d.getVar("PKGDEST"))
     for package in d.getVar("PACKAGES").split():
-        localdata = bb.data.createCopy(d)
         pkg_name = d.getVar("PKG:%s" % package) or package
-        localdata.setVar("PKG", pkg_name)
-        localdata.setVar("OVERRIDES", d.getVar("OVERRIDES", False) + ":" + package)
+        localdata = get_package_data(d, package)
 
         if not oe.packagedata.packaged(package, localdata):
             continue
@@ -1146,6 +1152,53 @@ def create_image_sbom_spdx(d):
     make_image_link(spdx_path, ".spdx.json")
 
 
+def create_build_sbom(d, dest):
+    pn = d.getVar("PN")
+    deploydir = Path(d.getVar("SPDXRECIPEBUILDDEPLOYDIR"))
+    pkg_arch = d.getVar("SSTATE_PKGARCH")
+
+    spdx_path = deploydir / (pn + "-build.spdx.json")
+
+    add_objsets = []
+
+    build, build_objset = oe.sbom30.find_root_obj_in_jsonld(
+        d,
+        "recipes",
+        pn,
+        oe.spdx30.build_Build,
+    )
+    add_objsets.append(build_objset)
+
+    bb.build.exec_func("read_subpackage_metadata", d)
+
+    for package in d.getVar("PACKAGES").split():
+        pkg_name = d.getVar("PKG:%s" % package) or package
+        localdata = get_package_data(d, package)
+
+        if not oe.packagedata.packaged(package, localdata):
+            continue
+
+        pkg_objset, _ = oe.sbom30.load_jsonld_by_arch(
+            d,
+            pkg_arch,
+            "packages",
+            pkg_name,
+            required=True,
+        )
+        add_objsets.append(pkg_objset)
+
+    sbom_objset, _ = oe.sbom30.create_sbom(
+        d,
+        pn + "-build",
+        [build],
+        add_objectsets=add_objsets,
+        expand=False,
+        import_missing=True,
+    )
+
+    oe.sbom30.write_jsonld_doc(d, sbom_objset, dest)
+
+
 def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
     sdk_name = toolchain_outputname + "-" + sdk_type
     sdk_packages = oe.sdk.sdk_list_installed_packages(d, sdk_type == "target")
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 83840702199..5e104b0c668 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -120,7 +120,15 @@ class SPDX3CheckBase(object):
         return self.check_spdx_file(filename)
 
     def check_objset_missing_ids(self, objset):
-        if objset.missing_ids:
+        import oe.spdx30
+
+        missing = objset.missing_ids
+
+        for doc in objset.foreach_type(oe.spdx30.SpdxDocument):
+            for i in doc.import_:
+                missing.discard(i.externalSpdxId)
+
+        if missing:
             self.assertTrue(
                 False,
                 "The following SPDXIDs are unresolved:\n  "
@@ -137,7 +145,6 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
             "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/packages/base-files.spdx.json",
         )
 
-
     def test_gcc_include_source(self):
         import oe.spdx30
 
@@ -197,3 +204,12 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
         # Document should be fully linked
         self.check_objset_missing_ids(objset)
+
+    def test_deploy_build_sbom_spdx_bash(self):
+        objset = self.check_recipe_spdx(
+            "bash",
+            "{DEPLOY_DIR_IMAGE}/bash-build.spdx.json",
+            task="deploy_build_sbom_spdx",
+        )
+
+        self.check_objset_missing_ids(objset)
-- 
2.47.0


