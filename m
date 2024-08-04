Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF8CC3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 13:09:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.26198.1722776980894545275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 06:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bfaqF1Az;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3687ea0521cso6498972f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1722776979; x=1723381779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xsLAGwb2+BR3zcOhUxzqJZHB7Riwg5Q4Y9XwwY16xY=;
        b=bfaqF1AzP5dUK8MajgwM24WiwogPyt8fZOAcTr9fgs8h/IYQkj5sSv3az7TQyqG0MZ
         WVlWKLKBx1b6Rv+GM30d4qpEGAU6Gnu57cxELuqNiM2br8bfjAOOEHD8lQRqbVgF1yUo
         XRG5dMnw5qopp1mNJt+5S0aWeVKmzYvQitCek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722776979; x=1723381779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xsLAGwb2+BR3zcOhUxzqJZHB7Riwg5Q4Y9XwwY16xY=;
        b=l57Jc3SITQ8MqKWm14BxeLJDYNJSsJvbIhF00SHqdtJEvYx/YIP7F4Lll0cx0SxQTc
         L+odIlwr01XkO0CT7u3+yKbHtOJzJsP6szy+flARPrEGFIKNlK6YHqljBnW+jS+15VNv
         MW6nIhTXzFf6IYRSArf7rwIofrjsYdHT9tjSAkzm3SqUfppIUL3q4XHYDaphfVthikNg
         zakOyTEZgJ7dpPVvUNBOtAuAVf7h9khu3o5HNRmF9ebceXQJFw9Lz5lRPUwdbQKK5wlf
         JsHh1PyLNfwedmhiiaB6sITvvZiAH55lGZ9lodSDOBpa5ROFlYO4q2LCNbLSBMrSW2YJ
         sObQ==
X-Gm-Message-State: AOJu0YzoSgkWN6L4wapD5mRJyl2YZJdCtduAssf1vxznEIO1wgUVsL6c
	bUDCFqnx1QGifZhP1GfDRSkERTDYsdT4LeQ57ooby5FpFsGRHtZuBujHwBVTholX3TZ8fqgFmAt
	kiPo=
X-Google-Smtp-Source: AGHT+IF1ndXnEOlOUpBejbrnzO945t2MX6ra7vPgrC2iEMGkFF+Exw7bdRRTkIvH6YP7xPJ6EZ6Org==
X-Received: by 2002:a5d:4003:0:b0:368:31c7:19da with SMTP id ffacd0b85a97d-36bbc0dd4d3mr7882640f8f.13.1722776978872;
        Sun, 04 Aug 2024 06:09:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c970:9bdb:c2fc:595d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd26fad7sm6792449f8f.114.2024.08.04.06.09.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 06:09:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sdpx: Avoid loading of SPDX_LICENSE_DATA into global config
Date: Sun,  4 Aug 2024 14:09:36 +0100
Message-ID: <20240804130936.1339847-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
References: <20240804130936.1339847-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 13:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202947

Loading a load of json files into a memory structure and stashing in a bitbake
variable is relatively anti-social making bitbake -e output hard to read for
example as well as other potential performance issues.

Defer loading of that data until it is actually needed/used in a funciton
where it is now passed as a parameter.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/create-spdx-2.2.bbclass | 15 ++++++++-------
 meta/classes/spdx-common.bbclass     |  6 ------
 meta/lib/oe/sbom30.py                |  8 ++++----
 meta/lib/oe/spdx30_tasks.py          | 17 +++++++++++------
 meta/lib/oe/spdx_common.py           |  5 ++---
 5 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 509d3b58b6f..ff0cc14d0ac 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -44,11 +44,10 @@ def get_json_indent(d):
     return None
 
 
-def convert_license_to_spdx(lic, document, d, existing={}):
+def convert_license_to_spdx(lic, license_data, document, d, existing={}):
     from pathlib import Path
     import oe.spdx
 
-    license_data = d.getVar("SPDX_LICENSE_DATA")
     extracted = {}
 
     def add_extracted_license(ident, name):
@@ -385,10 +384,10 @@ def add_download_packages(d, doc, recipe):
             # but this should be sufficient for now
             doc.add_relationship(package, "BUILD_DEPENDENCY_OF", recipe)
 
-def get_license_list_version(d):
+def get_license_list_version(license_data, d):
     # Newer versions of the SPDX license list are SemVer ("MAJOR.MINOR.MICRO"),
     # but SPDX 2 only uses "MAJOR.MINOR".
-    return ".".join(d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"].split(".")[:2])
+    return ".".join(license_data["licenseListVersion"].split(".")[:2])
 
 
 python do_create_spdx() {
@@ -401,6 +400,8 @@ python do_create_spdx() {
     from contextlib import contextmanager
     import oe.cve_check
 
+    license_data = oe.spdx_common.load_spdx_license_data(d)
+
     @contextmanager
     def optional_tarfile(name, guard, mode="w"):
         import tarfile
@@ -432,7 +433,7 @@ python do_create_spdx() {
     doc.documentNamespace = get_namespace(d, doc.name)
     doc.creationInfo.created = creation_time
     doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
-    doc.creationInfo.licenseListVersion = get_license_list_version(d)
+    doc.creationInfo.licenseListVersion = get_license_list_version(license_data, d)
     doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
     doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
     doc.creationInfo.creators.append("Person: N/A ()")
@@ -451,7 +452,7 @@ python do_create_spdx() {
 
     license = d.getVar("LICENSE")
     if license:
-        recipe.licenseDeclared = convert_license_to_spdx(license, doc, d)
+        recipe.licenseDeclared = convert_license_to_spdx(license, license_data, doc, d)
 
     summary = d.getVar("SUMMARY")
     if summary:
@@ -549,7 +550,7 @@ python do_create_spdx() {
             spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
             spdx_package.name = pkg_name
             spdx_package.versionInfo = d.getVar("PV")
-            spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
+            spdx_package.licenseDeclared = convert_license_to_spdx(package_license, license_data, package_doc, d, found_licenses)
             spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
 
             package_doc.packages.append(spdx_package)
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index e1528b6d0b5..cd9cc0db987 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -39,12 +39,6 @@ SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
-python() {
-    import oe.spdx_common
-    oe.spdx_common.load_spdx_license_data(d)
-}
-
-
 python do_collect_spdx_deps() {
     # This task calculates the build time dependencies of the recipe, and is
     # required because while a task can deptask on itself, those dependencies
diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 27ed74f810f..2cea56ac3e6 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -558,8 +558,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             scope=scope,
         )
 
-    def new_license_expression(self, license_expression, license_text_map={}):
-        license_list_version = self.d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
+    def new_license_expression(self, license_expression, license_data, license_text_map={}):
+        license_list_version = license_data["licenseListVersion"]
         # SPDX 3 requires that the license list version be a semver
         # MAJOR.MINOR.MICRO, but the actual license version might be
         # MAJOR.MINOR on some older versions. As such, manually append a .0
@@ -607,14 +607,14 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
         return lic
 
-    def scan_declared_licenses(self, spdx_file, filepath):
+    def scan_declared_licenses(self, spdx_file, filepath, license_data):
         for e in spdx_file.extension:
             if isinstance(e, OELicenseScannedExtension):
                 return
 
         file_licenses = set()
         for extracted_lic in oe.spdx_common.extract_licenses(filepath):
-            file_licenses.add(self.new_license_expression(extracted_lic))
+            file_licenses.add(self.new_license_expression(extracted_lic, license_data))
 
         self.new_relationship(
             [spdx_file],
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9d5bbadc0f4..03dc47db029 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -28,8 +28,7 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
 
 
-def add_license_expression(d, objset, license_expression):
-    license_data = d.getVar("SPDX_LICENSE_DATA")
+def add_license_expression(d, objset, license_expression, license_data):
     simple_license_text = {}
     license_text_map = {}
     license_ref_idx = 0
@@ -120,7 +119,7 @@ def add_license_expression(d, objset, license_expression):
     )
     spdx_license_expression = " ".join(convert(l) for l in lic_split)
 
-    return objset.new_license_expression(spdx_license_expression, license_text_map)
+    return objset.new_license_expression(spdx_license_expression, license_data, license_text_map)
 
 
 def add_package_files(
@@ -129,6 +128,7 @@ def add_package_files(
     topdir,
     get_spdxid,
     get_purposes,
+    license_data,
     *,
     archive=None,
     ignore_dirs=[],
@@ -165,7 +165,7 @@ def add_package_files(
             spdx_files.add(spdx_file)
 
             if oe.spdx30.software_SoftwarePurpose.source in file_purposes:
-                objset.scan_declared_licenses(spdx_file, filepath)
+                objset.scan_declared_licenses(spdx_file, filepath, license_data)
 
             if archive is not None:
                 with filepath.open("rb") as f:
@@ -452,6 +452,8 @@ def create_spdx(d):
         if val:
             setattr(obj, name, val)
 
+    license_data = oe.spdx_common.load_spdx_license_data(d)
+
     deploydir = Path(d.getVar("SPDXDEPLOY"))
     deploy_dir_spdx = Path(d.getVar("DEPLOY_DIR_SPDX"))
     spdx_workdir = Path(d.getVar("SPDXWORK"))
@@ -508,7 +510,7 @@ def create_spdx(d):
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
 
-    recipe_spdx_license = add_license_expression(d, build_objset, d.getVar("LICENSE"))
+    recipe_spdx_license = add_license_expression(d, build_objset, d.getVar("LICENSE"), license_data)
     build_objset.new_relationship(
         source_files,
         oe.spdx30.RelationshipType.hasConcludedLicense,
@@ -527,6 +529,7 @@ def create_spdx(d):
                 "sourcefile", str(file_counter)
             ),
             lambda filepath: [oe.spdx30.software_SoftwarePurpose.source],
+            license_data,
             ignore_dirs=[".git"],
             ignore_top_level_dirs=["temp"],
             archive=None,
@@ -636,7 +639,7 @@ def create_spdx(d):
             package_license = d.getVar("LICENSE:%s" % package)
             if package_license and package_license != d.getVar("LICENSE"):
                 package_spdx_license = add_license_expression(
-                    d, build_objset, package_license
+                    d, build_objset, package_license, license_data
                 )
             else:
                 package_spdx_license = recipe_spdx_license
@@ -708,6 +711,7 @@ def create_spdx(d):
                 ),
                 # TODO: Can we know the purpose here?
                 lambda filepath: [],
+                license_data,
                 ignore_top_level_dirs=["CONTROL", "DEBIAN"],
                 archive=None,
             )
@@ -739,6 +743,7 @@ def create_spdx(d):
             d.expand("${COMPONENTS_DIR}/${PACKAGE_ARCH}/${PN}"),
             lambda file_counter: build_objset.new_spdxid("sysroot", str(file_counter)),
             lambda filepath: [],
+            license_data,
             archive=None,
         )
 
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index f23100fe03d..dfe90f96cf9 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -42,14 +42,13 @@ def is_work_shared_spdx(d):
 
 
 def load_spdx_license_data(d):
-    if d.getVar("SPDX_LICENSE_DATA"):
-        return
 
     with open(d.getVar("SPDX_LICENSES"), "r") as f:
         data = json.load(f)
         # Transform the license array to a dictionary
         data["licenses"] = {l["licenseId"]: l for l in data["licenses"]}
-        d.setVar("SPDX_LICENSE_DATA", data)
+
+    return data
 
 
 def process_sources(d):

