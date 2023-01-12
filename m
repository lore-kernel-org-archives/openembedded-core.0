Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7C0C54EBD
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 14:56:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.56935.1673535361933872351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jan 2023 06:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rzIm6a2/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03766437ad=narpat.mali@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30CCmNTS016293
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 06:56:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=9IxNq1J0uLc4z5CIpzupzPAp2HtRZswXJvtLTqfvw3s=;
 b=rzIm6a2/gNj7Ci9nScjwR3bwB/WFRu21QtmGDbaZt3+lePS8EYdoaGrzS1iLc74zGBaP
 YkB5brHOAHNY02LDmWPhnt/ulc/lQaAQ7zwa1j5M4sHLaaF5fKO146jkslz8q2aPu5so
 rpOTkn2hOuTYnfsaRkt5/Ar2JnebZGi1RRJ2LHMI0gnK0APdLRtIEXm8YrJnhEGKlY7x
 39BBh0Xs071EtJAJDJnPvL/zYk8INRxp8mcxhbrea0Mm1VdaJ1pFvHzNDJSXecwAAcWe
 uWYpkjWbK3bE1kuwAoWSloE3dLnJK01nvFsccu02NnCMkJodR7hYm+k+dSlVfMUWwTLP Qg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5the5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 06:56:01 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 06:56:00 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 06:55:59 -0800
From: Narpat Mali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <archana.polampalli@windriver.com>, <hari.gpillai@windriver.com>,
        "Narpat
 Mali" <narpat.mali@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-wheel: fix for CVE-2022-40898
Date: Thu, 12 Jan 2023 14:55:32 +0000
Message-ID: <20230112145532.3686926-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eU73LUbUuNTqKAvHiRRGJh93ayWZcr6o
X-Proofpoint-ORIG-GUID: eU73LUbUuNTqKAvHiRRGJh93ayWZcr6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_08,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301120109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jan 2023 14:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175797

An issue discovered in Python Packaging Authority (PyPA) Wheel 0.37.1
and earlier allows remote attackers to cause a denial of service via
attacker controlled input to wheel cli.

CVE: CVE-2022-40898

Upstream-Status: Backport [https://github.com/pypa/wheel/commit/88f02bc335d5404991e532e7f3b0fc80437bf4e0]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...tential-DoS-attack-via-WHEEL_INFO_RE.patch | 32 +++++++++++++++++++
 .../python/python3-wheel_0.37.1.bb            |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch

diff --git a/meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch b/meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch
new file mode 100644
index 0000000000..bdaae7dd10
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch
@@ -0,0 +1,32 @@
+From a9a0d67a663f20b69903751c23851dd4cd6b49d4 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 11 Jan 2023 07:45:57 +0000
+Subject: [PATCH] Fixed potential DoS attack via WHEEL_INFO_RE
+
+CVE: CVE-2022-40898
+
+Upstream-Status: Backport [https://github.com/pypa/wheel/commit/88f02bc335d5404991e532e7f3b0fc80437bf4e0]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ src/wheel/wheelfile.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/wheel/wheelfile.py b/src/wheel/wheelfile.py
+index 21e7361..ff06edf 100644
+--- a/src/wheel/wheelfile.py
++++ b/src/wheel/wheelfile.py
+@@ -27,8 +27,8 @@ else:
+ # Non-greedy matching of an optional build number may be too clever (more
+ # invalid wheel filenames will match). Separate regex for .dist-info?
+ WHEEL_INFO_RE = re.compile(
+-    r"""^(?P<namever>(?P<name>.+?)-(?P<ver>.+?))(-(?P<build>\d[^-]*))?
+-     -(?P<pyver>.+?)-(?P<abi>.+?)-(?P<plat>.+?)\.whl$""",
++    r"""^(?P<namever>(?P<name>[^-]+?)-(?P<ver>[^-]+?))(-(?P<build>\d[^-]*))?
++     -(?P<pyver>[^-]+?)-(?P<abi>[^-]+?)-(?P<plat>[^.]+?)\.whl$""",
+     re.VERBOSE)
+ 
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
index 2f7dd122ba..3ee03ddd36 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -8,7 +8,9 @@ SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d495
 
 inherit python_flit_core pypi
 
-SRC_URI += " file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
+SRC_URI += "file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch \
+            file://0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch \
+           "
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


