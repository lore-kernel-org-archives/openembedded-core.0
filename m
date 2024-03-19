Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD515C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 12:32:29 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.14142.1710851539998978420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 05:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IvKayt6l;
 spf=pass (domain: mvista.com, ip: 209.85.214.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1dddbe47ac1so36204735ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1710851538; x=1711456338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMG6r0eEkyhNm/Z7pB6Co77E+DcS1uMsBON3y5YvPok=;
        b=IvKayt6l68s1IYKiTlPGecADxCYHsxxwEVE6UCIyKF294Y6PH+evdNyyUkm2idi6t8
         QJMcOyzB/frHvim7jkGpWwJnKo03hfx/SoCnjTReRvq8RyeHov7+PdPKkTa9pyD7q8N8
         rUJ1BKIEjL/RxzIN7kD62rFjeSf3dnY0eOdaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710851538; x=1711456338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMG6r0eEkyhNm/Z7pB6Co77E+DcS1uMsBON3y5YvPok=;
        b=JjVuMHvVIaCNT9ScRm03O0j2i90WLhKF7NlysVp9JP2BUVKBL7nKxIsKN8jAtRDL3F
         +oqz7LaqQroAJH5c9WeUOzfhJIE9eUHaBGtX54NqRGFYJXBicHpNDejjizfsPYYVoEve
         JMRXs++z7VK2aeArwWVbX6qHGROV8g9PxocAgJ3t34wdtFjfnzbgsAHbZgDyhztyVAYW
         oED40Pg1o+G+Hv6YaVt2d2wutnI9imHFumxA/SIz+nKCUuJeBKg3LfNBbkO7i9LYj7w/
         6LKWAbO+QKv+1i2OCJGx1o+b+qhxcQUcpq4t8g2cGLxUn6HQbnkwCPtMNwQtZRFhhpXy
         NZQg==
X-Gm-Message-State: AOJu0YxFup7JUZf6bwBCuUFLEoBbNC3QAOm7n8NYXeTjDFM+z0zblVQW
	GITryJqKUK/321uyB9eitapbCPbP9q35JlcrmYB1QbLsgXMEV/nvYJoe5JNqdTsNQD3NM5oRNWC
	Y
X-Google-Smtp-Source: AGHT+IFW574GAaM4JTDAiftXtgUfx+oye0PeJWvCLOLFGo4w6AC1aNjp4ArUF85vPE/aUg0idklJ2Q==
X-Received: by 2002:a17:902:e808:b0:1e0:26f1:8cb3 with SMTP id u8-20020a170902e80800b001e026f18cb3mr4061812plg.20.1710851538429;
        Tue, 19 Mar 2024 05:32:18 -0700 (PDT)
Received: from MVIN00020.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902ec8e00b001e00e17c4e0sm5268606plg.49.2024.03.19.05.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 05:32:17 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] python3-cryptography: Backport fix for CVE-2024-26130
Date: Tue, 19 Mar 2024 18:02:09 +0530
Message-Id: <20240319123209.13330-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 12:32:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197321

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/pyca/cryptography/commit/97d231672763cdb5959a3b191e692a362f1b9e55

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../python3-cryptography/CVE-2024-26130.patch | 66 +++++++++++++++++++
 .../python/python3-cryptography_36.0.2.bb     |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch b/meta/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch
new file mode 100644
index 0000000000..ff113e8cc7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/CVE-2024-26130.patch
@@ -0,0 +1,66 @@
+From 97d231672763cdb5959a3b191e692a362f1b9e55 Mon Sep 17 00:00:00 2001
+From: Alex Gaynor <alex.gaynor@gmail.com>
+Date: Mon, 19 Feb 2024 11:50:28 -0500
+Subject: [PATCH] Fixes #10422 -- don't crash when a PKCS#12 key and cert don't
+ match (#10423)
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/97d231672763cdb5959a3b191e692a362f1b9e55]
+CVE: CVE-2024-26130
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../hazmat/backends/openssl/backend.py         |  9 +++++++++
+ tests/hazmat/primitives/test_pkcs12.py         | 18 ++++++++++++++++++
+ 2 files changed, 27 insertions(+)
+
+diff --git a/src/cryptography/hazmat/backends/openssl/backend.py b/src/cryptography/hazmat/backends/openssl/backend.py
+index c43fea0..d687931 100644
+--- a/src/cryptography/hazmat/backends/openssl/backend.py
++++ b/src/cryptography/hazmat/backends/openssl/backend.py
+@@ -2131,6 +2131,15 @@ class Backend(BackendInterface):
+                     mac_iter,
+                     0,
+                 )
++                if p12 == self._ffi.NULL:
++                    errors = self._consume_errors()
++                    raise ValueError(
++                        (
++                            "Failed to create PKCS12 (does the key match the "
++                            "certificate?)"
++                        ),
++                        errors,
++                    )
+ 
+         self.openssl_assert(p12 != self._ffi.NULL)
+         p12 = self._ffi.gc(p12, self._lib.PKCS12_free)
+diff --git a/tests/hazmat/primitives/test_pkcs12.py b/tests/hazmat/primitives/test_pkcs12.py
+index c5cfbc0..8af4c93 100644
+--- a/tests/hazmat/primitives/test_pkcs12.py
++++ b/tests/hazmat/primitives/test_pkcs12.py
+@@ -25,6 +25,24 @@ from ...doubles import DummyKeySerializationEncryption
+ from ...utils import load_vectors_from_file
+ 
+ 
++   @pytest.mark.supported(
++       only_if=lambda backend: backend._lib.Cryptography_HAS_PKCS12_SET_MAC,
++       skip_message="Requires OpenSSL with PKCS12_set_mac",
++   )
++   def test_set_mac_key_certificate_mismatch(self, backend):
++       cacert, _ = _load_ca(backend)
++       key = ec.generate_private_key(ec.SECP256R1())
++       encryption = (
++           serialization.PrivateFormat.PKCS12.encryption_builder()
++           .hmac_hash(hashes.SHA256())
++           .build(b"password")
++       )
++
++       with pytest.raises(ValueError):
++           serialize_key_and_certificates(
++               b"name", key, cacert, [], encryption
++           )
++
+ @pytest.mark.skip_fips(
+     reason="PKCS12 unsupported in FIPS mode. So much bad crypto in it."
+ )
+-- 
+2.35.7
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index c429c75e1b..83381f225c 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -19,6 +19,7 @@ SRC_URI += " \
     file://fix-leak-metric.patch \
     file://CVE-2023-23931.patch \
     file://CVE-2023-49083.patch \
+    file://CVE-2024-26130.patch \
 "
 
 inherit pypi python_setuptools3_rust
-- 
2.25.1


