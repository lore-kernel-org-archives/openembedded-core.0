Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD17D5E392
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 03:07:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30167.1731208064053570605
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Nov 2024 19:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10446b0cf6=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AA30C05012513;
	Sat, 9 Nov 2024 19:07:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42t84prdk8-2
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
Subject: [PATCH 2/3] sbom30.py: use file-license-relationship as spdxid_name of hasDeclaredLicense relationship
Date: Sat, 9 Nov 2024 19:07:40 -0800
Message-ID: <20241110030741.4108407-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241110030741.4108407-1-hongxu.jia@windriver.com>
References: <20241110030741.4108407-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrVMc6/g c=1 sm=1 tr=0 ts=6730237e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VlfZXiiP6vEA:10 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=EHEOu2Xr1FpDUlZMKjkA:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 8mt3IKimH_5tCh-boe2ScYqIk8AxBtkV
X-Proofpoint-GUID: 8mt3IKimH_5tCh-boe2ScYqIk8AxBtkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-09_25,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 mlxscore=0 mlxlogscore=822 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411100026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 03:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206913

In order to distinguish the spdxId of hasDeclaredLicense relationship
with other relationship, use file-license-relationship as spdxid_name,
and filter it out for spdxid-hash symlink creation

While SPDX_INCLUDE_SOURCES = "1", N hasDeclaredLicense's Relationship
for N source files in one recipe will share one spdxid-hash symlink

- spdxId of hasDeclaredLicense relationship:
http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/file-license-relationship/00395f9e72c7f872e29a4a5e6a22981e

- spdxId of other relationship:
http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/0838759b8d71923d250a0813dda7356ffd309576115bbf8ed7e266cf4aed86a5/relationship/1808c755cc8a41ddaa39d708a4de1022

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 4efeaae3a0..64b357ea92 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -548,8 +548,8 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
         return ret
 
-    def new_relationship(self, from_, typ, to):
-        return self._new_relationship(oe.spdx30.Relationship, from_, typ, to)
+    def new_relationship(self, from_, typ, to, spdxid_name="relationship"):
+        return self._new_relationship(oe.spdx30.Relationship, from_, typ, to, spdxid_name=spdxid_name)
 
     def new_scoped_relationship(self, from_, typ, scope, to):
         return self._new_relationship(
@@ -624,6 +624,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             [spdx_file],
             oe.spdx30.RelationshipType.hasDeclaredLicense,
             file_licenses,
+            spdxid_name="file-license-relationship"
         )
         spdx_file.extension.append(OELicenseScannedExtension())
 
@@ -912,7 +913,7 @@ def jsonld_arch_path(d, arch, subdir, name, deploydir=None):
 
 def jsonld_hash_path(_id):
     # For the spdId added by add_package_files, remove suffix count number
-    if re.match(r".*/(sourcefile|sysroot|file)/\w+$", _id):
+    if re.match(r".*/(sourcefile|sysroot|file|file-license-relationship)/\w+$", _id):
         _id = os.path.dirname(_id)
 
     h = hashlib.sha256(_id.encode("utf-8")).hexdigest()
-- 
2.25.1


