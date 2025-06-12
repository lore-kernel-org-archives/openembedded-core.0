Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51820C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 04:43:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5362.1749703403607701105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 21:43:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258012de4=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3vP71018246
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 04:43:21 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2n683-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 04:43:20 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 11 Jun 2025 21:43:19 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 11 Jun 2025 21:43:18 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH V2 1/1] python3-cryptography: fix ptest failure caused by CVE-2024-26130 fix
Date: Thu, 12 Jun 2025 10:13:16 +0530
Message-ID: <20250612044316.1385701-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzNCBTYWx0ZWRfX/yxu6OpFN5Kj h6W2m6ZYZBg49GdXQsPPvpDCNt/lJA0oWl2Iza1jYSKgoxOKlH2SynYjacoBQ8C7Uvmb/BZ8Bhq ATTR7pi+cVOc9uZ7HSYxdjpV5lgfJMxpJPJMJKRUZNE2wwAXcTdvnNvyiJy1FfHOe9btomopAVP
 CbpL3nQjfIa10BeSjtXcvH/AWU/yQtl/dIU7j02hc85HWORn2YqXhVd8O8fgIQDtfUZySK6QorJ WgEdJsdMOtSwWXZusxFk31Tgd2qJcY3e7zzGt4oDsWFUttfK1vKd6afw6O2qWSPs1BeUuo/b+F3 aczYgLwXhYsOTJmg+9pGbt5k1j1UaQQqRl5DGUJrmQsHqdUHGBQ3+znVZOFECmQenfbIxC5fDDR
 v4aYlVAhE+1Ost16s1R5EfRz8JNxFKRtET0B6xJuZf9ve4zNCWIadtxaa3xVx2zVJaM6cAdl
X-Proofpoint-GUID: TUxwLwGeYAaFJckzKuP29nvvMuVXFJ2a
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=684a5ae8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=pwiSL_CrTg9_fvnJRv4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: TUxwLwGeYAaFJckzKuP29nvvMuVXFJ2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_02,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=544
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506120034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 04:43:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218477

From: Archana Polampalli <archana.polampalli@windriver.com>

fixes:

   File "/usr/lib/python3-cryptography/ptest/tests/hazmat/primitives/test_pkcs12.py", line 28
       pytest.mark.supported(
   IndentationError: unexpected indent

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 ...st_pkcs12.py-correct-the-Indentation.patch | 62 +++++++++++++++++++
 .../python/python3-cryptography_36.0.2.bb     |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch b/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch
new file mode 100644
index 0000000000..f6813fcdc8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-test_pkcs12.py-correct-the-Indentation.patch
@@ -0,0 +1,62 @@
+From b737b6609cd6394c895258e0ae9b341650747918 Mon Sep 17 00:00:00 2001
+From: Archana Polampalli <archana.polampalli@windriver.com>
+Date: Tue, 10 Jun 2025 11:52:53 +0530
+Subject: [PATCH] test_pkcs12.py: correct the Indentation
+
+CVE: CVE-2024-26130
+
+Upstream-Status: Pending
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ tests/hazmat/primitives/test_pkcs12.py | 34 +++++++++++++-------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/tests/hazmat/primitives/test_pkcs12.py b/tests/hazmat/primitives/test_pkcs12.py
+index 8af4c93..1084038 100644
+--- a/tests/hazmat/primitives/test_pkcs12.py
++++ b/tests/hazmat/primitives/test_pkcs12.py
+@@ -25,23 +25,23 @@ from ...doubles import DummyKeySerializationEncryption
+ from ...utils import load_vectors_from_file
+ 
+ 
+-   @pytest.mark.supported(
+-       only_if=lambda backend: backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
+-       skip_message="Requires OpenSSL with PKCS12_set_mac",
+-   )
+-   def test_set_mac_key_certificate_mismatch(self, backend):
+-       cacert, _ = _load_ca(backend)
+-       key = ec.generate_private_key(ec.SECP256R1())
+-       encryption = (
+-           serialization.PrivateFormat.PKCS12.encryption_builder()
+-           .hmac_hash(hashes.SHA256())
+-           .build(b"password")
+-       )
+-
+-       with pytest.raises(ValueError):
+-           serialize_key_and_certificates(
+-               b"name", key, cacert, [], encryption
+-           )
++    @pytest.mark.supported(
++        only_if=lambda backend: backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
++        skip_message="Requires OpenSSL with PKCS12_set_mac",
++    )
++    def test_set_mac_key_certificate_mismatch(self, backend):
++        cacert, _ = _load_ca(backend)
++        key = ec.generate_private_key(ec.SECP256R1())
++        encryption = (
++            serialization.PrivateFormat.PKCS12.encryption_builder()
++            .hmac_hash(hashes.SHA256())
++            .build(b"password")
++        )
++
++        with pytest.raises(ValueError):
++            serialize_key_and_certificates(
++                b"name", key, cacert, [], encryption
++            )
+ 
+ @pytest.mark.skip_fips(
+     reason="PKCS12 unsupported in FIPS mode. So much bad crypto in it."
+-- 
+2.40.0
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index 83381f225c..173e47b463 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -20,6 +20,7 @@ SRC_URI += " \
     file://CVE-2023-23931.patch \
     file://CVE-2023-49083.patch \
     file://CVE-2024-26130.patch \
+    file://0001-test_pkcs12.py-correct-the-Indentation.patch \
 "
 
 inherit pypi python_setuptools3_rust
-- 
2.40.0


