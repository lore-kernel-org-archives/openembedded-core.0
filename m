Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B229C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 16:54:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.859.1683305659609546109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 09:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oAe7fwjm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4489571367=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345En5vK014700
	for <openembedded-core@lists.openembedded.org>; Fri, 5 May 2023 09:54:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=5ele8rQQzagGqWRnniHmbPybMMyoFvX7P8rbKTRAfPA=;
 b=oAe7fwjmRUW/2dergBY2ppynFrNpF6vOg4TmNJqH/Jr6e3FgLLRfy9Of/CwqMQhNcM9o
 3+DQME4KM921zA4eJsXZx9tIXV2qOUJQXksM+8DzlDovA0xjSzlM7vzL+gxenqzPYVz9
 2G52KsIRZjuGu413YgrXAmFJ3ZEMlCvEzjldGzf2BnKhowcHjbUdKnzdDqqgjBHBBL7h
 UKnmqlC9zXCv7pn6exOuPS7RLT0jXRg1xiN2Z+LIF18r11h0Q5OLBP9kgaVGN6Flnz1N
 L+w26qFI0x2nuhc+2Xxdzto+86GEKt8JDq/LIYvoYqd/FWdTo33SRdgYtR54uRYMvlKE tg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q8xh5nvat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 09:54:18 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 09:54:16 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] python3-cryptography: fix for CVE-2023-23931
Date: Fri, 5 May 2023 16:53:53 +0000
Message-ID: <20230505165353.324575-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: _zUyprFICtJZ0kknb5cOu7TYEq6BPsCj
X-Proofpoint-GUID: _zUyprFICtJZ0kknb5cOu7TYEq6BPsCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_23,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=671 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 16:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180958

From: Narpat Mali <narpat.mali@windriver.com>

cryptography is a package designed to expose cryptographic primitives
and recipes to Python developers. In affected versions `Cipher.update_into`
would accept Python objects which implement the buffer protocol, but
provide only immutable buffers. This would allow immutable objects
(such as `bytes`) to be mutated, thus violating fundamental rules of
Python and resulting in corrupted output. This now correctly raises
an exception. This issue has been present since `update_into` was
originally introduced in cryptography 1.8.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../python3-cryptography/CVE-2023-23931.patch | 49 +++++++++++++++++++
 .../python/python3-cryptography_36.0.2.bb     |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch
new file mode 100644
index 0000000000..5fc4878978
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2023-23931.patch
@@ -0,0 +1,49 @@
+From 9fbf84efc861668755ab645530ec7be9cf3c6696 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Tue, 7 Feb 2023 11:34:18 -0500
+Subject: [PATCH] Don't allow update_into to mutate immutable objects (#8230)
+
+CVE: CVE-2023-23931
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/9fbf84efc861668755ab645530ec7be9cf3c6696]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ src/cryptography/hazmat/backends/openssl/ciphers.py | 2 +-
+ tests/hazmat/primitives/test_ciphers.py             | 8 ++++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/ciphers.py b/src/cryptography/hazmat/backends/openssl/ciphers.py
+index 286583f93..075d68fb9 100644
+--- a/src/cryptography/hazmat/backends/openssl/ciphers.py
++++ b/src/cryptography/hazmat/backends/openssl/ciphers.py
+@@ -156,7 +156,7 @@ class _CipherContext:
+         data_processed = 0
+         total_out = 0
+         outlen = self._backend._ffi.new("int *")
+-        baseoutbuf = self._backend._ffi.from_buffer(buf)
++        baseoutbuf = self._backend._ffi.from_buffer(buf, require_writable=True)
+         baseinbuf = self._backend._ffi.from_buffer(data)
+
+         while data_processed != total_data_len:
+diff --git a/tests/hazmat/primitives/test_ciphers.py b/tests/hazmat/primitives/test_ciphers.py
+index 02127dd9c..bf3b047de 100644
+--- a/tests/hazmat/primitives/test_ciphers.py
++++ b/tests/hazmat/primitives/test_ciphers.py
+@@ -318,6 +318,14 @@ class TestCipherUpdateInto:
+         with pytest.raises(ValueError):
+             encryptor.update_into(b"testing", buf)
+
++    def test_update_into_immutable(self, backend):
++        key = b"\x00" * 16
++        c = ciphers.Cipher(AES(key), modes.ECB(), backend)
++        encryptor = c.encryptor()
++        buf = b"\x00" * 32
++        with pytest.raises((TypeError, BufferError)):
++            encryptor.update_into(b"testing", buf)
++
+     @pytest.mark.supported(
+         only_if=lambda backend: backend.cipher_supported(
+             AES(b"\x00" * 16), modes.GCM(b"\x00" * 12)
+--
+2.40.0
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index 9ef5ff39c8..c3ae0c1ab9 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -17,6 +17,7 @@ SRC_URI += " \
     file://0001-Cargo.toml-specify-pem-version.patch \
     file://0002-Cargo.toml-edition-2018-2021.patch \
     file://fix-leak-metric.patch \
+    file://CVE-2023-23931.patch \
 "
 
 inherit pypi python_setuptools3_rust
-- 
2.40.0


