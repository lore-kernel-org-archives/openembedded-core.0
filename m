Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DA6D6E2C0
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 05:50:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7046.1732081839156248587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 21:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10542b79f7=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK5hTS6025002;
	Tue, 19 Nov 2024 21:50:38 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xqj7utm6-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 19 Nov 2024 21:50:37 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 19 Nov 2024 21:50:36 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 19 Nov 2024 21:50:36 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>,
        <hongxu.jia@windriver.com>
Subject: [oe-core][PATCH V2 2/3] sbom30.py: reduce redundant spdxid symlinks to save inode on host
Date: Tue, 19 Nov 2024 21:50:35 -0800
Message-ID: <20241120055036.1002075-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120055036.1002075-1-hongxu.jia@windriver.com>
References: <20241120055036.1002075-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: cefB0Krl6iVNWTtkKhbVQWSZ8lbgOv06
X-Proofpoint-GUID: cefB0Krl6iVNWTtkKhbVQWSZ8lbgOv06
X-Authority-Analysis: v=2.4 cv=Sb6ldeRu c=1 sm=1 tr=0 ts=673d78ad cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=spbkX35iY5P8FYnuM4IA:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-20_02,2024-11-20_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411200041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 05:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207413

In order to support all in-scope SPDX data within a single
JSON-LD file for SPDX 3.0.1, Yocto's SBOM:
- In native/target/nativesdk recipe, created spdxid-hash symlink
  for each element to point to the JSON-LD file that contains
  element details;
- In image recipe, use spdxid-hash symlink to collect element
  details from varies of JSON-LD files

While SPDX_INCLUDE_SOURCES = "1", it adds sources to JSON-LD file
and create 2N+ spdxid-hash symlinks for N source files.
(N for software_File, N for hasDeclaredLicense's Relationship)

For large numbers of source files, adding an extra symlink -> real file
will occupy one more inode (per file), which will need a slot in
the OS's inode cache. In this situation, disk performance is slow
and inode is used up quickly

After commit [sbom30/spdx30: add link prefix and name to namespace
of spdxId and alias] applied, the namespace of spdxId and alias in
recipe and package jsonld differs. Use it to create symlink to jsonld,
take recipe shadow, package shadow and package shadow-src for example:

For recipe jsonld tmp/deploy/spdx/3.0.1/core2-64/recipes/shadow.spdx.json

    spdxId: http://spdx.org/spdxdocs/recipe-shadow-xxx/...
    alias: recipe-shadow/UNIHASH/...
    symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/recipe-shadow.spdx.json -> ../recipes/shadow.spdx.json

For package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow.spdx.json

    spdxId: http://spdx.org/spdxdocs/package-shadow-xxx/...
    alias: package-shadow/UNIHASH/...
    symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shadow.spdx.json -> ../packages/shadow.spdx.json

In package jsonld tmp/deploy/spdx/3.0.1/core2-64/packages/shadow-src.spdx.json

    spdxId: http://spdx.org/spdxdocs/package-shadow-src-xxx/...
    alias: package-shadow-src/UNIHASH/...
    symlink: tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-link/package-shadow-src.spdx.json -> ../packages/shadow-src.spdx.json

Build core-image-minimal with/without this commit, comparing the spdxid-link
number, 7 281 824 -> 6 043

echo 'SPDX_INCLUDE_SOURCES = "1"' >> local.conf

Without this commit:
$ time bitbake core-image-minimal
real    100m17.769s
user    0m24.516s
sys     0m4.334s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
7281824

With this commit:
$ time bitbake core-image-minimal
real    85m12.994s
user    0m20.423s
sys     0m4.228s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-link -name "*.json" |wc -l
6043

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 7033bcdf5b..bad12a64d9 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -917,10 +917,23 @@ def jsonld_arch_path(d, arch, subdir, name, deploydir=None):
     return deploydir / arch / subdir / (name + ".spdx.json")
 
 
-def jsonld_hash_path(_id):
-    h = hashlib.sha256(_id.encode("utf-8")).hexdigest()
+def jsonld_link_path(_id, d):
+    spdx_namespace_prefix = d.getVar("SPDX_NAMESPACE_PREFIX")
+    m = re.match(f"^{spdx_namespace_prefix}/([^/]+)/", _id)
+    if m:
+        # Parse spdxId
+        # http://spdx.org/spdxdocs/recipe-shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/55a7286167e0c1a871d49da1af6070709d52370a5b52fdea03d248452f919aaa/source/4 -> recipe-shadow
+        link_path = m.group(1)[0:-len(str(uuid.NAMESPACE_DNS))-1]
+    else:
+        m = re.match(r"([^/]+)/UNIHASH/", _id)
+        if m:
+            # Parse alias
+            # recipe-shadow/UNIHASH/license/3_24_0/BSD-3-Clause -> recipe-shadow
+            link_path = m.group(1)
+        else:
+            bb.fatal("Invalid id %s, neither SPDX ID or alias" % _id)
 
-    return Path("by-spdxid-hash") / h[:2], h
+    return Path("by-spdxid-link"), link_path
 
 
 def load_jsonld_by_arch(d, arch, subdir, name, *, required=False, link_prefix=None):
@@ -991,7 +1004,7 @@ def write_recipe_jsonld_doc(
     dest = jsonld_arch_path(d, pkg_arch, subdir, objset.doc.name, deploydir=deploydir)
 
     def link_id(_id):
-        hash_path = jsonld_hash_path(_id)
+        hash_path = jsonld_link_path(_id, d)
 
         link_name = jsonld_arch_path(
             d,
@@ -999,6 +1012,11 @@ def write_recipe_jsonld_doc(
             *hash_path,
             deploydir=deploydir,
         )
+
+        # Return if expected symlink exists
+        if link_name.is_symlink() and link_name.resolve() == dest:
+            return hash_path[-1]
+
         try:
             link_name.parent.mkdir(exist_ok=True, parents=True)
             link_name.symlink_to(os.path.relpath(dest, link_name.parent))
@@ -1065,7 +1083,7 @@ def load_obj_in_jsonld(d, arch, subdir, fn_name, obj_type, link_prefix=None, **a
 
 
 def find_by_spdxid(d, spdxid, *, required=False):
-    return find_jsonld(d, *jsonld_hash_path(spdxid), required=required)
+    return find_jsonld(d, *jsonld_link_path(spdxid, d), required=required)
 
 
 def create_sbom(d, name, root_elements, add_objectsets=[]):
-- 
2.25.1


