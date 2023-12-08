Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925BAC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:49 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.11147.1702002820348704445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=T4suMkI1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ce33234fd7so1071089b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002819; x=1702607619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOWUF9CrjFpMqfpQZd74Z2yCVLyL06QID4ULmUiFuk4=;
        b=T4suMkI1XZnOJTpJxgdv7yQVnjrh/75PtkmvnXn/qgWPwKORQjobWJLZ7jZ+5NZLX4
         Ruglj8ryVcreKK6Iwi32NlLbfSmbK2C4ZO3iD0LedbmrZY/34zK/3xCsNdUOpLKlT0dG
         zmv/HfV6kqXJh2KyhOfzN5UO871bacn6rUbjM/0xkWhrtvaSY3IL+zkzuExjdEicVJdk
         JNwiKZ4FnTNC57yG5mHHz65GWVrm0WUL6BEKMMLRLoQ1sEjf1/j7coMYRqiTB6R4lNs4
         Jdrh3VbJZnVgl/YDJnHGfd4uR4QndyCTe5LYcsZ8ee9apCgk1JlcfJtugK/eNQdPocjQ
         oKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002819; x=1702607619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOWUF9CrjFpMqfpQZd74Z2yCVLyL06QID4ULmUiFuk4=;
        b=qAbher+J3ydEBW0sk2w4pWCeO8ugQ5U3rK0bl4EW0hbPZ2ppgbso7/Kqr968o/Zupt
         6FUOYawNvQFORc9ykAZCwTtynnZXrc4p89dFDNX6GCmSVbiE7nKQP+pY5y5i/utXFU8p
         sBi7ZpfK/V7exayu4SF+S5zScgB5ksvjbhIG8QgwrpA/Se0aZGs1nRhEyEY5ekOePORp
         sKhqiM7N6PewQKAVrOqLhmus4C6bTVLZCoay+bsqROGLjlco2EzEDSyAHRc3O7hfGNxU
         6eUivp7uuaujJcl8NiIgeS2znQPqicl/0UYatXAKjvu5gT/Yx5LGiMb7fHK9P0UIxAuk
         ge7A==
X-Gm-Message-State: AOJu0YzXRmgEZ3NcTBtRJ+zicUw0u8UTuMhx65+2bji8J6wJGHb8xKy/
	NzOXkTUEMvR8PpHfnGsvUlttEC3fWyBcZzA7eC8=
X-Google-Smtp-Source: AGHT+IFWT4frA2jhPsugYavpJbIsGft0FM1dvV4E11Z5rfWabTn0X600GE/IjwNXwtCfXMcQRHPCNw==
X-Received: by 2002:a05:6a20:8e18:b0:190:fca:72d7 with SMTP id y24-20020a056a208e1800b001900fca72d7mr1792077pzj.90.1702002819055;
        Thu, 07 Dec 2023 18:33:39 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:38 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] python3-cryptography: fix CVE-2023-49083
Date: Thu,  7 Dec 2023 16:33:09 -1000
Message-Id: <2d104f78cd13a10640bc284c7fc8358bf305279c.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191995

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


