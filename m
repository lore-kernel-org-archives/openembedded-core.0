Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D3FC7EE24
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.36190.1683386715299535090
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=bRaLt5G1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6439e6f5a33so1223680b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386714; x=1685978714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xNmJ8rwR5q/FDTrbhYDyn1vCAUFgL+/6jDS7NxE8z8s=;
        b=bRaLt5G1k99yDao0zikeb/kWL1CrmyCx1UzDpMJonzI/a88QDRHhn/rEtFsbkdm7i1
         QN6isc7aXQtNsJy5FmWFoAHl7S7k1VH+WXyUQT7VGBIyQNUdGLr1Y4YR/Gg9mAE1HAv1
         lKDad/awDBTnk8PBj39QLCIcSbl+k5a3XU2aRY1K8PhFNHCTVB6Et8OMy0WLxz74E3r+
         Erp9UEY8jZ/BM1DbruFJ00u3qZyIp7tmrOlqmgy+tuUytjYs/a2sVzP9Y5lewlC9XYcK
         BO0bBUKsnmLjH6P5C5EXHAgDPQuySViMLbGosdvSgj9wAaQlvh7mZz4x4O6qPLKbmCFl
         qBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386714; x=1685978714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNmJ8rwR5q/FDTrbhYDyn1vCAUFgL+/6jDS7NxE8z8s=;
        b=azFIfZdjQUup7s8bRrnAu2RgZEwCEfKXFRmpE3itbzXVNnzF/3QBVBERk6o6Uim1P5
         ekIqCJSJhEPdEe9Nw+8nUAuJFwvGItUMKz+j7v6okGZungAWlTXBY5Cw7TWTP4v3BB45
         2QVmb2dm28LVGIVnVBPJxR2aMnINYUlPwH31qDn1RkvZM6GOF9z93jfMzPsi+T4zQojD
         zj9RfYVPNfLWu/djGCUbkVixVVxwd7A+LxxXNLBWTM6pu44jLTtIOHnng/RuEhRDDxiY
         6QY2eVTy3YbZjs8MzXx9wNuAqMZf2w72N/c6Ds5WoM3r/1+6MQ4D23oKzBzQBuheUHDM
         5CZw==
X-Gm-Message-State: AC+VfDwdEU+tmmcYUfBEfssNvAfqhLxXZURRZtxhvi7SCiXDbEkAN6WI
	mLJogcBfge+BZnHvyjhjH0YubqPS/au9znBspB0=
X-Google-Smtp-Source: ACHHUZ6SagUgYENvaB1YAcdBjn2znKd9mAw0YIYmlmjsUt3rZanE0GvsQ6EnqjMCR8pzAjZa730a9A==
X-Received: by 2002:a05:6a00:2343:b0:644:d775:60bb with SMTP id j3-20020a056a00234300b00644d77560bbmr545103pfj.20.1683386714238;
        Sat, 06 May 2023 08:25:14 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/15] python3-cryptography: fix for CVE-2023-23931
Date: Sat,  6 May 2023 05:24:41 -1000
Message-Id: <368e450c2d800790a05924519f34c579e28e9cbb.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180994

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


