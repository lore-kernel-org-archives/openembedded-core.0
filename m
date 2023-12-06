Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84430C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 09:00:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.27194.1701853215181906784
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 01:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tLIsSlZY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0704bb62dd=narpat.mali@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B66UxIU005929
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 09:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=JM477
	++rdUy5216HFAQxhtHbXMyjaTRI8KC8RY/utFE=; b=tLIsSlZYBF8Cvz8iCbedT
	qjf1oPa8C0yoh4SL5kh/cnCGWau+mk/Q4NopM1X5zuZVTwP3Zahx7VrTo2eEEKC5
	SgbR9zY++ELOY67eDWr6/DNgzY93/XWBYbx+5jFLXr5EgrLSdQlD+RBB8aYtwzqU
	1Csrqe0WyMfwOTvES9N78i1qa4JCXCKWi1s4stzcf5ce+04MoLX6NykcgeYbm+ES
	dD1T1yi4jTAZY+a5frvp/QcDiYsXz7Xn83E8wVjzra4T/DMi0y64Df5zFfo1/KXs
	KX+1cSzCdrxvki2QepbceHwKe/79VW/yFjuMQi5KkdQLRyL+dE6tkaOroNCZBpt9
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53gbqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 09:00:14 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 01:00:15 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-cryptography: fix CVE-2023-49083
Date: Wed, 6 Dec 2023 08:59:00 +0000
Message-ID: <20231206085900.2432186-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: t7ZBErPisnlgz2AkF1wo5Z0qz2ZsDkBX
X-Proofpoint-GUID: t7ZBErPisnlgz2AkF1wo5Z0qz2ZsDkBX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxlogscore=801 mlxscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 09:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191875

From: Narpat Mali <narpat.mali@windriver.com>

cryptography is a package designed to expose cryptographic primitives
and recipes to Python developers. Calling `load_pem_pkcs7_certificates`
or `load_der_pkcs7_certificates` could lead to a NULL-pointer dereference
and segfault. Exploitation of this vulnerability poses a serious risk of
Denial of Service (DoS) for any application attempting to deserialize a
PKCS7 blob/certificate. The consequences extend to potential disruptions
in system availability and stability. This vulnerability has been patched
in version 41.0.6.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-49083
https://security-tracker.debian.org/tracker/CVE-2023-49083

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-cryptography/CVE-2023-49083.patch | 53 +++++++++++++++++++
 .../python/python3-cryptography_36.0.2.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch
new file mode 100644
index 0000000000..d398eea1d9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch
@@ -0,0 +1,53 @@
+From 627ac5e314303acc00a19d58f09eb1eabd029fd1 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Wed, 6 Dec 2023 08:04:53 +0000
+Subject: [PATCH] Fixed crash when loading a PKCS#7 bundle with no certificates
+ (#9926)
+
+CVE: CVE-2023-49083
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/1e7b4d074e14c4e694d3ce69ad6754a6039fd6ff]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ src/cryptography/hazmat/backends/openssl/backend.py | 5 ++++-
+ tests/hazmat/primitives/test_pkcs7.py               | 6 ++++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/backend.py b/src/cryptography/hazmat/backends/openssl/backend.py
+index 5606fe6..c43fea0 100644
+--- a/src/cryptography/hazmat/backends/openssl/backend.py
++++ b/src/cryptography/hazmat/backends/openssl/backend.py
+@@ -2189,9 +2189,12 @@ class Backend(BackendInterface):
+                 _Reasons.UNSUPPORTED_SERIALIZATION,
+             )
+
++        certs: list[x509.Certificate] = []
++        if p7.d.sign == self._ffi.NULL:
++            return certs
++
+         sk_x509 = p7.d.sign.cert
+         num = self._lib.sk_X509_num(sk_x509)
+-        certs = []
+         for i in range(num):
+             x509 = self._lib.sk_X509_value(sk_x509, i)
+             self.openssl_assert(x509 != self._ffi.NULL)
+diff --git a/tests/hazmat/primitives/test_pkcs7.py b/tests/hazmat/primitives/test_pkcs7.py
+index 91ac842..b98a9f1 100644
+--- a/tests/hazmat/primitives/test_pkcs7.py
++++ b/tests/hazmat/primitives/test_pkcs7.py
+@@ -81,6 +81,12 @@ class TestPKCS7Loading(object):
+                 mode="rb",
+             )
+
++    def test_load_pkcs7_empty_certificates(self):
++        der = b"\x30\x0B\x06\x09\x2A\x86\x48\x86\xF7\x0D\x01\x07\x02"
++
++        certificates = pkcs7.load_der_pkcs7_certificates(der)
++        assert certificates == []
++
+
+ # We have no public verification API and won't be adding one until we get
+ # some requirements from users so this function exists to give us basic
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index c3ae0c1ab9..c429c75e1b 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -18,6 +18,7 @@ SRC_URI += " \
     file://0002-Cargo.toml-edition-2018-2021.patch \
     file://fix-leak-metric.patch \
     file://CVE-2023-23931.patch \
+    file://CVE-2023-49083.patch \
 "
 
 inherit pypi python_setuptools3_rust
-- 
2.40.0


