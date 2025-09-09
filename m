Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56880CAC583
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 14:31:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14951.1757428284821759556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 07:31:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D61091424
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 07:31:15 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C3CF43F66E
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Sep 2025 07:31:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] grub2: fix CVE-2024-56738
Date: Tue,  9 Sep 2025 15:31:18 +0100
Message-ID: <20250909143118.3819968-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909143118.3819968-1-ross.burton@arm.com>
References: <20250909143118.3819968-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 14:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223116

Backport an algorithmic change to grub_crypto_memcmp() so that it
completes in constant time and thus isn't susceptible to side-channel
attacks.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../grub/files/CVE-2024-56738.patch           | 75 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-56738.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-56738.patch b/meta/reci=
pes-bsp/grub/files/CVE-2024-56738.patch
new file mode 100644
index 00000000000..c7b64aa6edc
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-56738.patch
@@ -0,0 +1,75 @@
+From 4cef2fc7308b2132317ad166939994f098b41561 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 9 Sep 2025 14:23:14 +0100
+Subject: [PATCH] CVE-2024-56738
+
+Backport an algorithmic change to grub_crypto_memcmp() so that it comple=
tes in
+constant time and thus isn't susceptible to side-channel attacks.
+
+This is a partial backport of grub 0739d24cd
+("libgcrypt: Adjust import script, definitions and API users for libgcry=
pt 1.11")
+
+CVE: CVE-2024-56738
+Upstream-Status: Backport [0739d24cd]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ grub-core/lib/crypto.c | 23 ++++++++++++++++-------
+ include/grub/crypto.h  |  2 +-
+ 2 files changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c
+index 396f76410..19db7870a 100644
+--- a/grub-core/lib/crypto.c
++++ b/grub-core/lib/crypto.c
+@@ -433,19 +433,28 @@ grub_crypto_gcry_error (gcry_err_code_t in)
+   return GRUB_ACCESS_DENIED;
+ }
+=20
++/*
++ * Compare byte arrays of length LEN, return 1 if it's not same,
++ * 0, otherwise.
++ */
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n)
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len)
+ {
+-  register grub_size_t counter =3D 0;
+-  const grub_uint8_t *pa, *pb;
++  const grub_uint8_t *a =3D b1;
++  const grub_uint8_t *b =3D b2;
++  int ab, ba;
++  grub_size_t i;
+=20
+-  for (pa =3D a, pb =3D b; n; pa++, pb++, n--)
++  /* Constant-time compare. */
++  for (i =3D 0, ab =3D 0, ba =3D 0; i < len; i++)
+     {
+-      if (*pa !=3D *pb)
+-	counter++;
++      /* If a[i] !=3D b[i], either ab or ba will be negative. */
++      ab |=3D a[i] - b[i];
++      ba |=3D b[i] - a[i];
+     }
+=20
+-  return !!counter;
++  /* 'ab | ba' is negative when buffers are not equal, extract sign bit=
.  */
++  return ((unsigned int)(ab | ba) >> (sizeof(unsigned int) * 8 - 1)) & =
1;
+ }
+=20
+ #ifndef GRUB_UTIL
+diff --git a/include/grub/crypto.h b/include/grub/crypto.h
+index 31c87c302..20ad4c5f7 100644
+--- a/include/grub/crypto.h
++++ b/include/grub/crypto.h
+@@ -393,7 +393,7 @@ grub_crypto_pbkdf2 (const struct gcry_md_spec *md,
+ 		    grub_uint8_t *DK, grub_size_t dkLen);
+=20
+ int
+-grub_crypto_memcmp (const void *a, const void *b, grub_size_t n);
++grub_crypto_memcmp (const void *b1, const void *b2, grub_size_t len);
+=20
+ int
+ grub_password_get (char buf[], unsigned buf_size);
+--=20
+2.43.0
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub=
2.inc
index e87d2691704..b512cbeb458 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -36,6 +36,7 @@ SRC_URI =3D "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45778_CVE-2024-45779.patch \
            file://CVE-2025-0677_CVE-2025-0684_CVE-2025-0685_CVE-2025-068=
6_CVE-2025-0689.patch \
            file://CVE-2025-0678_CVE-2025-1125.patch \
+           file://CVE-2024-56738.patch \
 "
=20
 SRC_URI[sha256sum] =3D "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1=
e2b6f56154cb9c91"
--=20
2.43.0


