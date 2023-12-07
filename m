Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41958C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 11:58:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.82245.1701950318366701630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 03:58:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lUE0+FE3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0705de35e7=narpat.mali@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B7AqB8Q031603
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Dec 2023 11:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=h9xKd
	4a2NfnpY/0xzpGPN44NhD7oeM2u8vZ/3Jm57mg=; b=lUE0+FE3uXTJT87P7HXJ2
	Kj7U734V+Iv9rvdz/Umlb3Wic/kzaX2Ziu1XCd+jZY9nFZ64r8j7Fc5lgMplGJxV
	ZtVnbB0hBASLlgBD8oE+DGOXlHGypkW1zebeBqi0cae8CHPJVIQpIZBhmWbM5tjw
	gbyI5IJM3FdfeZRKLFRWmJM2eOCs56KwnXZaqE+t1dirK1uQvEgPOGDItOMB4rav
	mxeUMPJZ8s6Ed/H2mI0AoLtbafwP4HwSyGq2tpsK3vikp72jYnArmbSSTj8ltE5k
	juRpGKqhy9uasNg0z5csMdoVKvrs+mcLQGjz/2kcr/XcK/45qPZMBvHpaVW8ZAPm
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd53sm77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 11:58:37 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 03:58:38 -0800
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] python3-cryptography: fix CVE-2023-49083
Date: Thu, 7 Dec 2023 11:58:15 +0000
Message-ID: <20231207115815.532553-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: T6DHSAtDzOs7vYtBsWSSsSX3TCiQFOEJ
X-Proofpoint-ORIG-GUID: T6DHSAtDzOs7vYtBsWSSsSX3TCiQFOEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxlogscore=938 malwarescore=0 suspectscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312070097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 11:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191945

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
 .../python/python3-cryptography_39.0.2.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch
new file mode 100644
index 0000000000..3870529ecc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch
@@ -0,0 +1,53 @@
+From df089065abde07b9b2666693c10f4d5c96cd99a1 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Thu, 7 Dec 2023 09:33:46 +0000
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
+index 48f4265..7b949be 100644
+--- a/src/cryptography/hazmat/backends/openssl/backend.py
++++ b/src/cryptography/hazmat/backends/openssl/backend.py
+@@ -2466,9 +2466,12 @@ class Backend:
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
+index d879563..36ce031 100644
+--- a/tests/hazmat/primitives/test_pkcs7.py
++++ b/tests/hazmat/primitives/test_pkcs7.py
+@@ -89,6 +89,12 @@ class TestPKCS7Loading:
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
diff --git a/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
index 449e3ba1bc..b54c7e1719 100644
--- a/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
     file://check-memfree.py \
     file://run-ptest \
+    file://CVE-2023-49083.patch \
 "
 
 require ${BPN}-crates.inc
-- 
2.40.0


