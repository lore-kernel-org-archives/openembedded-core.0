Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63254C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:23 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.49393.1710951022087685045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mekZMEo7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dddad37712so65445705ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951021; x=1711555821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EXhLd/iVuf6BbUPbwbmG7VDiGkrVBa4+BXubz2tSDhY=;
        b=mekZMEo7XS0/y0Z016tW8ihYEJGXlSl+ifVCTl1vY7V4pCxJ+2rY+6PPWjBboRyXJM
         MLP9wnCoC1HR/HJRHQSG1yc9+iB58i3EHaiyb5wv5CSFgy2CrZCce7fMJoqScciYby6J
         OyFk5RtLUcWAnITapbNUAD0QrXQFkNZzlL87e6PXYxjqOl75wGmv5dhFeme6ejfAgGOx
         0Ana5QFT9tiZT8OtoE+vFkcXFvudSCoewAmuBbM93vfl6MQNo4fIcTcQhEuOxKK9wEmh
         8po3UmJeDugzxIkCtIIshCirs45nO+pAReIZzZ24lLVPeC5NmuTWhqleSEMKNSqJVAFw
         5OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951021; x=1711555821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXhLd/iVuf6BbUPbwbmG7VDiGkrVBa4+BXubz2tSDhY=;
        b=RzMhcK7TyfDEpNOOe6rT5P9ulrb9DZ8B1kch37GcjTSLEyVpV11Y0Zns919PWTHmMf
         n8Q+rnSIubcZYl4sq52y29l6FWnhmp4V3HbwgW5+Li8VOUu+MCIBPRL8wbERWluvOdka
         RKW6bjqKQ57xlWgvjwDalvzlOpCehMbi/k284ejDdiJz5HgOiwBfzX6wvMefzmmovlWa
         DktUeXUuQJrXaEWBOe4iVcgYD/JzL/0zGbNZRORyHoWflFHLGvcGK5uu+fB4VFSd/Z82
         l9LyxJOWqrIlTTqW29+sbZhJX6pdLUnq45ReR/CZtcqDmVdF2eLvCW8oAEBtZw8D4o2n
         JVwQ==
X-Gm-Message-State: AOJu0Yy5EdO0lwU9ScvQs7QPZ5pjOqMjxVilQwzhalfPajZLmbW1eCNj
	IpbWkOn6WI6l93b4gJBlRdZ15703eGQ3GZRYi/SmO4ug8hW5dJ4LLzm70A+nm/2GpjgRJdb0kpP
	UNo4=
X-Google-Smtp-Source: AGHT+IHseYCdjlb4dSVq6j7Q7VLP7v5H3nX8vIJ7t2m/ZqYbe0EKdivleoaF7puv4LZ4lVwk7RKbQw==
X-Received: by 2002:a17:902:e74d:b0:1dd:6414:3c5d with SMTP id p13-20020a170902e74d00b001dd64143c5dmr26243646plf.7.1710951021395;
        Wed, 20 Mar 2024 09:10:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] python3-cryptography: Backport fix for CVE-2024-26130
Date: Wed, 20 Mar 2024 06:09:41 -1000
Message-Id: <7864c4605cde4851df644dd1d2867bd28d155710.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197374

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/pyca/cryptography/commit/97d231672763cdb5959a3b191e692a362f1b9e55

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


