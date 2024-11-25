Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CB9D3B7F1
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 08:15:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14552.1732522504090782885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 00:15:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1059dd1ea8=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP76maP031692;
	Mon, 25 Nov 2024 08:15:02 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4336189qve-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 25 Nov 2024 08:15:02 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 25 Nov 2024 00:15:00 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 25 Nov 2024 00:15:00 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [oe-core][PATCH V3 1/3] sbom30/spdx30: add link prefix to the namespace of spdxId and alias
Date: Mon, 25 Nov 2024 00:14:58 -0800
Message-ID: <20241125081500.4048680-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241125081500.4048680-1-hongxu.jia@windriver.com>
References: <20241125081500.4048680-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FhhzZivhFhRl7tSB9h_zD-_Ken43eDgh
X-Proofpoint-GUID: FhhzZivhFhRl7tSB9h_zD-_Ken43eDgh
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=67443206 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=M7lxqswjPBWPblf4S0MA:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-25_05,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411250069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 08:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207723

In order to simple reference the SPDX ID to instead of making jsonld hash
path for each element, only creating one symlink for one file and referencing
it multiple times, add link prefix and name to the namespace of spdxId and alias
to replace ${PN} to avoid namespace conflict between recipe, packages and images.

Take recipe shadow, package shadow and package shadow-src for example:
Without this commit, spdxId and alias in recipe and package jsonld have the same
namespace

    spdxId: http://spdx.org/spdxdocs/shadow-xxx/...
    alias: http://spdx.org/spdxdocs/openembedded-alias/shadow/UNIHASH/...

After apply this commit, the namespace of spdxId in recipe and package jsonld differs:
In recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json

    spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
    alias: http://spdx.org/spdxdocs/openembedded-alias/recipe-shadow/UNIHASH/...

In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.json

    spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
    alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow/UNIHASH/...

In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json

    spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
    alias: http://spdx.org/spdxdocs/openembedded-alias/package-shadow-src/UNIHASH/...

Then will use namespace of spdxId and alias to create link for jsonld file,
one symlink for one jsonld file, referenced by elements multiple times

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py       | 29 ++++++++++++++++++-----------
 meta/lib/oe/spdx30_tasks.py | 13 +++++++------
 2 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0a7b4c05fb..28d251a7ac 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -217,9 +217,11 @@ def to_list(l):
 
 
 class ObjectSet(oe.spdx30.SHACLObjectSet):
-    def __init__(self, d):
+    def __init__(self, d, name=None, link_prefix=None):
         super().__init__()
         self.d = d
+        self.name = name
+        self.link_prefix = link_prefix
 
     def create_index(self):
         self.by_sha256_hash = {}
@@ -322,6 +324,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             uuid.NAMESPACE_DNS, self.d.getVar("SPDX_UUID_NAMESPACE")
         )
         pn = self.d.getVar("PN")
+        if self.link_prefix and self.name:
+            pn = "%s-%s" % (self.link_prefix, self.name)
         return "%s/%s-%s" % (
             self.d.getVar("SPDX_NAMESPACE_PREFIX"),
             pn,
@@ -341,12 +345,15 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             elif namespace not in e._id:
                 bb.warn(f"Namespace {namespace} not found in {e._id}")
             else:
+                pn = self.d.getVar("PN")
+                if self.link_prefix and self.name:
+                    pn = "%s-%s" % (self.link_prefix, self.name)
                 alias_ext = set_alias(
                     e,
                     e._id.replace(unihash, "UNIHASH").replace(
                         namespace,
-                        "http://spdx.org/spdxdocs/openembedded-alias/"
-                        + self.d.getVar("PN"),
+                        f"{self.d.getVar('SPDX_NAMESPACE_PREFIX')}/openembedded-alias/"
+                        + pn,
                     ),
                 )
 
@@ -805,8 +812,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         )
 
     @classmethod
-    def new_objset(cls, d, name, copy_from_bitbake_doc=True):
-        objset = cls(d)
+    def new_objset(cls, d, name, copy_from_bitbake_doc=True, link_prefix=None):
+        objset = cls(d, name=name, link_prefix=link_prefix)
 
         document = oe.spdx30.SpdxDocument(
             _id=objset.new_spdxid("document", name),
@@ -887,9 +894,9 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         return missing_spdxids
 
 
-def load_jsonld(d, path, required=False):
+def load_jsonld(d, path, required=False, name=None, link_prefix=None):
     deserializer = oe.spdx30.JSONLDDeserializer()
-    objset = ObjectSet(d)
+    objset = ObjectSet(d, name=name, link_prefix=link_prefix)
     try:
         with path.open("rb") as f:
             deserializer.read(f, objset)
@@ -918,9 +925,9 @@ def jsonld_hash_path(_id):
     return Path("by-spdxid-hash") / h[:2], h
 
 
-def load_jsonld_by_arch(d, arch, subdir, name, *, required=False):
+def load_jsonld_by_arch(d, arch, subdir, name, *, required=False, link_prefix=None):
     path = jsonld_arch_path(d, arch, subdir, name)
-    objset = load_jsonld(d, path, required=required)
+    objset = load_jsonld(d, path, required=required, name=name, link_prefix=link_prefix)
     if objset is not None:
         return (objset, path)
     return (None, None)
@@ -1049,8 +1056,8 @@ def find_root_obj_in_jsonld(d, subdir, fn_name, obj_type, **attr_filter):
     return spdx_obj, objset
 
 
-def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, **attr_filter):
-    objset, fn = load_jsonld_by_arch(d, arch, subdir, fn_name, required=True)
+def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, link_prefix=None, **attr_filter):
+    objset, fn = load_jsonld_by_arch(d, arch, subdir, fn_name, required=True, link_prefix=link_prefix)
 
     spdx_obj = objset.find_filter(obj_type, **attr_filter)
     if not spdx_obj:
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 5aeed5cd6f..ef829fbbf1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -461,7 +461,7 @@ def create_spdx(d):
     if not include_vex in ("none", "current", "all"):
         bb.fatal("SPDX_INCLUDE_VEX must be one of 'none', 'current', 'all'")
 
-    build_objset = oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"))
+    build_objset = oe.sbom30.ObjectSet.new_objset(d, d.getVar("PN"), link_prefix="recipe")
 
     build = build_objset.new_task_build("recipe", "recipe")
     build_objset.set_element_alias(build)
@@ -574,7 +574,7 @@ def create_spdx(d):
 
             bb.debug(1, "Creating SPDX for package %s" % pkg_name)
 
-            pkg_objset = oe.sbom30.ObjectSet.new_objset(d, pkg_name)
+            pkg_objset = oe.sbom30.ObjectSet.new_objset(d, pkg_name, link_prefix="package")
 
             spdx_package = pkg_objset.add_root(
                 oe.spdx30.software_Package(
@@ -793,7 +793,7 @@ def create_package_spdx(d):
     # Any element common to all packages that need to be referenced by ID
     # should be written into this objset set
     common_objset = oe.sbom30.ObjectSet.new_objset(
-        d, "%s-package-common" % d.getVar("PN")
+        d, "%s-package-common" % d.getVar("PN"), link_prefix="package"
     )
 
     pkgdest = Path(d.getVar("PKGDEST"))
@@ -812,6 +812,7 @@ def create_package_spdx(d):
             "packages-staging",
             pkg_name,
             oe.spdx30.software_Package,
+            link_prefix="package",
             software_primaryPurpose=oe.spdx30.software_SoftwarePurpose.install,
         )
 
@@ -1002,7 +1003,7 @@ def create_rootfs_spdx(d):
     with root_packages_file.open("r") as f:
         packages = json.load(f)
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename, machine))
+    objset = oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename, machine), link_prefix="rootfs")
 
     rootfs = objset.add_root(
         oe.spdx30.software_Package(
@@ -1037,7 +1038,7 @@ def create_image_spdx(d):
     image_basename = d.getVar("IMAGE_BASENAME")
     machine = d.getVar("MACHINE")
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename, machine))
+    objset = oe.sbom30.ObjectSet.new_objset(d, "%s-%s" % (image_basename, machine), link_prefix="image")
 
     with manifest_path.open("r") as f:
         manifest = json.load(f)
@@ -1150,7 +1151,7 @@ def sdk_create_spdx(d, sdk_type, spdx_work_dir, toolchain_outputname):
     sdk_name = toolchain_outputname + "-" + sdk_type
     sdk_packages = oe.sdk.sdk_list_installed_packages(d, sdk_type == "target")
 
-    objset = oe.sbom30.ObjectSet.new_objset(d, sdk_name)
+    objset = oe.sbom30.ObjectSet.new_objset(d, sdk_name, link_prefix="sdk")
 
     sdk_rootfs = objset.add_root(
         oe.spdx30.software_Package(
-- 
2.25.1


