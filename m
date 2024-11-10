Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643D5D5E390
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 03:07:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30296.1731208064088616583
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 19:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10446b0cf6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AA30C04012513;
	Sat, 9 Nov 2024 19:07:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84prdk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 09 Nov 2024 19:07:42 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 9 Nov 2024 19:07:41 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 9 Nov 2024 19:07:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [PATCH 1/3] sbom30.py: reduce redundant spdxid-hash symlinks to save inode on host
Date: Sat, 9 Nov 2024 19:07:39 -0800
Message-ID: <20241110030741.4108407-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6730237e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=CDkeZTuGm8h2x8QjWH8A:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QXQZjLCUMt1z4rFaPfzYHiI9YpE76Jlz
X-Proofpoint-GUID: QXQZjLCUMt1z4rFaPfzYHiI9YpE76Jlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-09_25,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411100026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 03:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206912

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

While using function add_package_files to add source files to JSON-LD file,
the spdxid-hash symlinks for source files point to the same JSON-LD file,
then according to the format of spdxId

- spdxId of souce file:
http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/sourcefile/1

Remove the count number ('/1') from spdxId suffix, then all
source files in one recipe will share one spdxid-hash symlink.

The same reason to sysroot and package files

- spdxId of sysroot file:
http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/sysroot/1

- spdxId of pacakge file:
http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/package/shadow-src/file/1

Build core-image-minimal with/without this commit, comparing the spdxid-hash number, 7 281 824 -> 70 508

echo 'SPDX_INCLUDE_SOURCES = "1"' >> local.conf

With this commit:
$ time bitbake core-image-minimal
real    95m6.960s
user    0m22.832s
sys     0m4.087s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash/ -name "*.spdx.json" |wc -l
70508

Without this commit:
$ time bitbake core-image-minimal
real    100m17.769s
user    0m24.516s
sys     0m4.334s

$ find tmp/deploy/spdx/3.0.1/*/by-spdxid-hash -name "*.json" |wc -l
7281824

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index e3a9428668..4efeaae3a0 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -911,6 +911,10 @@ def jsonld_arch_path(d, arch, subdir, name, deploydir=None):
 
 
 def jsonld_hash_path(_id):
+    # For the spdId added by add_package_files, remove suffix count number
+    if re.match(r".*/(sourcefile|sysroot|file)/\w+$", _id):
+        _id = os.path.dirname(_id)
+
     h = hashlib.sha256(_id.encode("utf-8")).hexdigest()
 
     return Path("by-spdxid-hash") / h[:2], h
@@ -992,6 +996,11 @@ def write_recipe_jsonld_doc(
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
-- 
2.25.1


