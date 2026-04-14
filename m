Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CCBF9D0E2
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 16:15:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.563.1776183333699194472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 09:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=plDWisfD;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9600A445E
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:15:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DC03D3F641
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 09:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776183333; bh=aKpq9Ad9CE5I3u3tUMzLsEqoJL0PIfooLILrQjyDETQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=plDWisfDHiU2Gl34pBX/GdNWNdsvZptguCgmSzxrGWlNfLMsH3/5zQWGKuAQlbIZD
	 rEyBKk++BmYJIkdOQUDVbCwOrtdDGCOIagydMQirbcODH8i/hIT/+dWRkPZUtVJHKE
	 5qzsJ20h+a1mmfdbUO9yFCRl9Ko7NEuuzZp6jRgY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] glib-networking: backport fixes for CVE-2025-60018 and CVE-2025-60019
Date: Tue, 14 Apr 2026 17:15:30 +0100
Message-ID: <20260414161530.1279308-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414161530.1279308-1-ross.burton@arm.com>
References: <20260414161530.1279308-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 16:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235169

CVE-2025-60018:

  glib-networking's OpenSSL backend fails to properly check the return
  value of a call to BIO_write(), resulting in an out of bounds read.

CVE-2205-60019:

  glib-networking's OpenSSL backend fails to properly check the return
  value of memory allocation routines. An out of memory condition could
  potentially result in writing to an invalid memory location.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-check-return-value-when-writing-to-.patch |  82 ++++++++++
 ...heck-return-value-of-g_tls_bio_alloc.patch |  42 +++++
 ...enssl-check-return-values-of-BIO_new.patch | 146 ++++++++++++++++++
 .../glib-networking/glib-networking_2.80.1.bb |   5 +-
 4 files changed, 274 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/000=
1-openssl-properly-check-return-value-when-writing-to-.patch
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/000=
2-openssl-check-return-value-of-g_tls_bio_alloc.patch
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/000=
3-openssl-check-return-values-of-BIO_new.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-opens=
sl-properly-check-return-value-when-writing-to-.patch b/meta/recipes-core=
/glib-networking/glib-networking/0001-openssl-properly-check-return-value=
-when-writing-to-.patch
new file mode 100644
index 00000000000..72f0c0c61ef
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0001-openssl-prop=
erly-check-return-value-when-writing-to-.patch
@@ -0,0 +1,82 @@
+From 330f59dcb39386b3d640ce94fcd3f75e1668ad88 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 4 Aug 2025 15:10:21 -0500
+Subject: [PATCH 1/3] openssl: properly check return value when writing t=
o BIO
+ objects
+
+In particular, we will read out of bounds, and then write the invalid
+memory, if BIO_write() fails when getting the PROP_CERTIFICATE_PEM
+property. Here we attempt to check the return value, but the check is
+not correct.
+
+This also fixes a leak of the BIO in the same place.
+
+Also add error checking to PROP_SUBJECT_NAME and PROP_ISSUER_NAME, for
+good measure.
+
+Fixes #226
+
+CVE: CVE-2025-60018
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tls/openssl/gtlscertificate-openssl.c | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscer=
tificate-openssl.c
+index 648f3e8..b536559 100644
+--- a/tls/openssl/gtlscertificate-openssl.c
++++ b/tls/openssl/gtlscertificate-openssl.c
+@@ -362,15 +362,12 @@ g_tls_certificate_openssl_get_property (GObject   =
 *object,
+     case PROP_CERTIFICATE_PEM:
+       bio =3D BIO_new (BIO_s_mem ());
+=20
+-      if (!PEM_write_bio_X509 (bio, openssl->cert) || !BIO_write (bio, =
"\0", 1))
+-        certificate_pem =3D NULL;
+-      else
++      if (PEM_write_bio_X509 (bio, openssl->cert) =3D=3D 1 && BIO_write=
 (bio, "\0", 1) =3D=3D 1)
+         {
+           BIO_get_mem_data (bio, &certificate_pem);
+           g_value_set_string (value, certificate_pem);
+-
+-          BIO_free_all (bio);
+         }
++      BIO_free_all (bio);
+       break;
+=20
+     case PROP_PRIVATE_KEY:
+@@ -411,8 +408,12 @@ g_tls_certificate_openssl_get_property (GObject    =
*object,
+     case PROP_SUBJECT_NAME:
+       bio =3D BIO_new (BIO_s_mem ());
+       name =3D X509_get_subject_name (openssl->cert);
+-      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
+-      BIO_write (bio, "\0", 1);
++      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0=
 ||
++          BIO_write (bio, "\0", 1) !=3D 1)
++        {
++          BIO_free_all (bio);
++          break;
++        }
+       BIO_get_mem_data (bio, (char **)&name_string);
+       g_value_set_string (value, name_string);
+       BIO_free_all (bio);
+@@ -421,9 +422,13 @@ g_tls_certificate_openssl_get_property (GObject    =
*object,
+     case PROP_ISSUER_NAME:
+       bio =3D BIO_new (BIO_s_mem ());
+       name =3D X509_get_issuer_name (openssl->cert);
+-      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
+-      BIO_write (bio, "\0", 1);
+-      BIO_get_mem_data (bio, &name_string);
++      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0=
 ||
++          BIO_write (bio, "\0", 1) !=3D 1)
++        {
++          BIO_free_all (bio);
++          break;
++        }
++      BIO_get_mem_data (bio, (char **)&name_string);
+       g_value_set_string (value, name_string);
+       BIO_free_all (bio);
+       break;
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/glib-networking/glib-networking/0002-opens=
sl-check-return-value-of-g_tls_bio_alloc.patch b/meta/recipes-core/glib-n=
etworking/glib-networking/0002-openssl-check-return-value-of-g_tls_bio_al=
loc.patch
new file mode 100644
index 00000000000..9c3d19f373d
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0002-openssl-chec=
k-return-value-of-g_tls_bio_alloc.patch
@@ -0,0 +1,42 @@
+From b5a3a8b28b7616403d5454f5f1816c933c34cdac Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 21 Aug 2025 16:58:54 -0500
+Subject: [PATCH 2/3] openssl: check return value of g_tls_bio_alloc()
+
+This function may fail, in which case the parameter remains
+uninitialized. We'd better not dereference it in that case.
+
+CVE: CVE-2025-60019
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tls/openssl/gtlsbio.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/tls/openssl/gtlsbio.c b/tls/openssl/gtlsbio.c
+index 0f603fe..1e54943 100644
+--- a/tls/openssl/gtlsbio.c
++++ b/tls/openssl/gtlsbio.c
+@@ -370,7 +370,8 @@ g_tls_bio_new_from_iostream (GIOStream *io_stream)
+   GTlsBio *gbio;
+=20
+   ret =3D g_tls_bio_alloc (&gbio);
+-  gbio->io_stream =3D g_object_ref (io_stream);
++  if (ret)
++    gbio->io_stream =3D g_object_ref (io_stream);
+=20
+   return ret;
+ }
+@@ -382,7 +383,8 @@ g_tls_bio_new_from_datagram_based (GDatagramBased *s=
ocket)
+   GTlsBio *gbio;
+=20
+   ret =3D g_tls_bio_alloc (&gbio);
+-  gbio->socket =3D g_object_ref (socket);
++  if (ret)
++    gbio->socket =3D g_object_ref (socket);
+=20
+   return ret;
+ }
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/glib-networking/glib-networking/0003-opens=
sl-check-return-values-of-BIO_new.patch b/meta/recipes-core/glib-networki=
ng/glib-networking/0003-openssl-check-return-values-of-BIO_new.patch
new file mode 100644
index 00000000000..1e925da980c
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0003-openssl-chec=
k-return-values-of-BIO_new.patch
@@ -0,0 +1,146 @@
+From 9c22e08b41255543bc15017123ed6c64b97b9b7c Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 21 Aug 2025 17:21:01 -0500
+Subject: [PATCH 3/3] openssl: check return values of BIO_new()
+
+We probably need to check even more return values of even more OpenSSL
+functions, but these ones allocate memory and that's particularly
+important to get right.
+
+CVE: CVE-2025-60019
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tls/openssl/gtlscertificate-openssl.c | 42 ++++++++++++++++++++-------
+ 1 file changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscer=
tificate-openssl.c
+index b536559..4fa5286 100644
+--- a/tls/openssl/gtlscertificate-openssl.c
++++ b/tls/openssl/gtlscertificate-openssl.c
+@@ -166,6 +166,9 @@ export_privkey_to_der (GTlsCertificateOpenssl  *open=
ssl,
+     goto err;
+=20
+   bio =3D BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto err;
++
+   if (i2d_PKCS8_PRIV_KEY_INFO_bio (bio, pkcs8) =3D=3D 0)
+     goto err;
+=20
+@@ -199,6 +202,9 @@ export_privkey_to_pem (GTlsCertificateOpenssl *opens=
sl)
+     return NULL;
+=20
+   bio =3D BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto out;
++
+   ret =3D PEM_write_bio_PKCS8PrivateKey (bio, openssl->key, NULL, NULL,=
 0, NULL, NULL);
+   if (ret =3D=3D 0)
+     goto out;
+@@ -211,7 +217,7 @@ export_privkey_to_pem (GTlsCertificateOpenssl *opens=
sl)
+   result =3D g_strdup (data);
+=20
+ out:
+-  BIO_free_all (bio);
++  g_clear_pointer (&bio, BIO_free_all);
+   return result;
+ }
+=20
+@@ -232,6 +238,9 @@ maybe_import_pkcs12 (GTlsCertificateOpenssl *openssl=
)
+     return;
+=20
+   bio =3D BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto import_failed;
++
+   status =3D BIO_write (bio, openssl->pkcs12_data->data, openssl->pkcs1=
2_data->len);
+   if (status <=3D 0)
+     goto import_failed;
+@@ -323,7 +332,7 @@ g_tls_certificate_openssl_get_property (GObject    *=
object,
+   guint8 *data;
+   BIO *bio;
+   GByteArray *byte_array;
+-  char *certificate_pem;
++  const char *certificate_pem;
+   long size;
+=20
+   const ASN1_TIME *time_asn1;
+@@ -362,12 +371,12 @@ g_tls_certificate_openssl_get_property (GObject   =
 *object,
+     case PROP_CERTIFICATE_PEM:
+       bio =3D BIO_new (BIO_s_mem ());
+=20
+-      if (PEM_write_bio_X509 (bio, openssl->cert) =3D=3D 1 && BIO_write=
 (bio, "\0", 1) =3D=3D 1)
++      if (bio && PEM_write_bio_X509 (bio, openssl->cert) =3D=3D 1 && BI=
O_write (bio, "\0", 1) =3D=3D 1)
+         {
+           BIO_get_mem_data (bio, &certificate_pem);
+           g_value_set_string (value, certificate_pem);
+         }
+-      BIO_free_all (bio);
++      g_clear_pointer (&bio, BIO_free_all);
+       break;
+=20
+     case PROP_PRIVATE_KEY:
+@@ -407,6 +416,8 @@ g_tls_certificate_openssl_get_property (GObject    *=
object,
+=20
+     case PROP_SUBJECT_NAME:
+       bio =3D BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name =3D X509_get_subject_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0=
 ||
+           BIO_write (bio, "\0", 1) !=3D 1)
+@@ -421,6 +432,8 @@ g_tls_certificate_openssl_get_property (GObject    *=
object,
+=20
+     case PROP_ISSUER_NAME:
+       bio =3D BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name =3D X509_get_issuer_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0=
 ||
+           BIO_write (bio, "\0", 1) !=3D 1)
+@@ -533,8 +546,11 @@ g_tls_certificate_openssl_set_property (GObject    =
  *object,
+         break;
+       CRITICAL_IF_CERTIFICATE_INITIALIZED ("certificate-pem");
+       bio =3D BIO_new_mem_buf ((gpointer)string, -1);
+-      openssl->cert =3D PEM_read_bio_X509 (bio, NULL, NULL, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->cert =3D PEM_read_bio_X509 (bio, NULL, NULL, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->cert)
+         openssl->have_cert =3D TRUE;
+       else if (!openssl->construct_error)
+@@ -554,8 +570,11 @@ g_tls_certificate_openssl_set_property (GObject    =
  *object,
+       CRITICAL_IF_KEY_INITIALIZED ("private-key");
+=20
+       bio =3D BIO_new_mem_buf (bytes->data, bytes->len);
+-      openssl->key =3D d2i_PrivateKey_bio (bio, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->key =3D d2i_PrivateKey_bio (bio, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->key)
+         openssl->have_key =3D TRUE;
+       else if (!openssl->construct_error)
+@@ -575,8 +594,11 @@ g_tls_certificate_openssl_set_property (GObject    =
  *object,
+       CRITICAL_IF_KEY_INITIALIZED ("private-key-pem");
+=20
+       bio =3D BIO_new_mem_buf ((gpointer)string, -1);
+-      openssl->key =3D PEM_read_bio_PrivateKey (bio, NULL, NULL, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->key =3D PEM_read_bio_PrivateKey (bio, NULL, NULL, NU=
LL);
++          BIO_free (bio);
++        }
+       if (openssl->key)
+         openssl->have_key =3D TRUE;
+       else if (!openssl->construct_error)
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
index 8bdbab03a6a..44e3b0c0b3d 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.80.1.bb
@@ -29,7 +29,10 @@ PACKAGECONFIG[gnomeproxy] =3D "-Dgnome_proxy=3Denabled=
,-Dgnome_proxy=3Ddisabled,gsetti
=20
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptes=
t-gnome
=20
-SRC_URI +=3D "file://run-ptest"
+SRC_URI +=3D "file://0001-openssl-properly-check-return-value-when-writi=
ng-to-.patch \
+            file://0002-openssl-check-return-value-of-g_tls_bio_alloc.pa=
tch \
+            file://0003-openssl-check-return-values-of-BIO_new.patch \
+            file://run-ptest"
=20
 FILES:${PN} +=3D "\
                 ${libdir}/gio/modules/libgio*.so \
--=20
2.43.0


