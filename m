Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F318CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3336.1760733857694548507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IBAZ3wJ2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a226a0798cso854736b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733857; x=1761338657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aw2hBO6s2p2AMWLTFf4KWmnJEGMf1XMDBe3oyLQz2aE=;
        b=IBAZ3wJ2b5gr7yUFeigxyYQXfs6BFXlu5lfa22yd96CPM7/L2uPTu/knUUlsCibMG9
         v974i+6SryzgvORAmK7ohSqrYt69zLu/15f6MUWnbwSHka2363MIoceua6+Qavyx6BNS
         QofXXi+/YTJNE+2H82CvE+HYmlAYpmETmnQ3r4h/S2syrTS57a9JwKVxAuotxLwttrfR
         WG5SsfJC2eqO+DA7oyLpw6UiREEqkm7FgTdNtrH29/6mlhEBWrwyp+APJUZ+LCc5/nr9
         AferMG9SUldaN79iuZi7hPW9gWUT9VU/pbwTMrnQreXtE7pvOTQpA6xGetKnOcZkLDu/
         LAzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733857; x=1761338657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aw2hBO6s2p2AMWLTFf4KWmnJEGMf1XMDBe3oyLQz2aE=;
        b=cLvuI960PYAbcx4tJAbB0CfRO4CbeWEQEldgwpXemXFfO1Q9G8zVe2CJvGycsgEBbX
         eqCuQyHcxDo1ILQFSUT+wlpJEt21vCgIXEcAcJu1DNUG28N3zUdSSOiP51+9b/3sRsbC
         Vw0WJds7AJsd5Raa/aU9HLnADEgxIgQjVSGqDlHa6R3qcpItqrTUkFxFz+sQMnGCEGrP
         H5A4iLOkweWZstOb7F5sKpPVGbfsxMSohuPpybctmGBOsham7W0DidNpolrJ3NvDkdDs
         ZKcVZ+VHCaRrs47Ax/2U0+Y7xaVH+I2tG/WMo3TmCfeaLaN8waLEJmR8Liqi13iX+p3N
         KdHw==
X-Gm-Message-State: AOJu0YzlK7iAA5aYzFr5ig0kzNL2wCOUXQ47bNFz4n6wT4zlKc4xDsk1
	uIl3/pylYZ1tWpokfLbZnZYwi7VlNLI8JHDw9KuYCKB6/+fyjuWzIjlAeT2oWGJEv2uDQ91IH5z
	L8JSM+F0=
X-Gm-Gg: ASbGnctJsABLnfc+SrZIKMhJA3qVK2pnpSsRnuJtFXT+kaD9PvfsAA/2QLUuVbpmUdi
	lP2Egw5heeTPpxYK8Dep2oTfbiJB1PEqS1vrJCu8cdFoZWYZ3Mb/x9gow+lNLO+LRF5x2QyHS3C
	mRSk2GOP5Up6cEodX8G00Tf0PXTl0R3pW3MgfKwnfbrQf0xfJQl97lu65hWR4IicI0SGeK3q54n
	hIZH1iBqXh3eIkxKi26FC4F1xFqpl86mC0YTiG9+PvyDXAzZ/VDSG+xlDLEjI6FpBfWJn8p8j1Z
	lN7VzWmvXtt1vtMDQCkdsS5MKT/rorBixtXr8XIVHn3Zn/e2KxXv23eOe3a/QbwcQ5CygaPruvw
	NQ+lkV1JF5VxTs/FBgHouaBhFVXY4v5rms+yUhVwWuoWbqGicwn1d8KGASH2fW9ZCdrR91N70T6
	Nc
X-Google-Smtp-Source: AGHT+IF/vjrXvEoq9J0H6wWyHbuf6tW9oDscssqLQw2DZDExQ+8mOS7OlYx83mnEZ7ncC6QX2HpPSQ==
X-Received: by 2002:a05:6a20:3945:b0:2e3:a914:aacd with SMTP id adf61e73a8af0-334a8524354mr7207928637.2.1760733856925;
        Fri, 17 Oct 2025 13:44:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/8] glib-networking: fix CVE-2025-60019
Date: Fri, 17 Oct 2025 13:44:01 -0700
Message-ID: <eda5838fcbb8c725e6e39d6e72b63c33f6c44446.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225063

From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>

glib-networking's OpenSSL backend fails to properly check the return
value of memory allocation routines. An out of memory condition could
potentially result in writing to an invalid memory location.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-60019

Upstream-patch:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/70df675dd4f5e4a593b2f95406c1aac031aa8bc7

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-networking/CVE-2025-60019.patch      | 137 ++++++++++++++++++
 .../glib-networking/glib-networking_2.72.2.bb |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
new file mode 100644
index 0000000000..cc0a8f1edc
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
@@ -0,0 +1,137 @@
+From 70df675dd4f5e4a593b2f95406c1aac031aa8bc7 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 21 Aug 2025 17:21:01 -0500
+Subject: [PATCH] openssl: check return values of BIO_new()
+
+We probably need to check even more return values of even more OpenSSL
+functions, but these ones allocate memory and that's particularly
+important to get right.
+
+CVE: CVE-2025-60019
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib-networking/-/commit/70df675dd4f5e4a593b2f95406c1aac031aa8bc7]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ tls/openssl/gtlscertificate-openssl.c | 39 ++++++++++++++++++++-------
+ 1 file changed, 29 insertions(+), 10 deletions(-)
+
+diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscertificate-openssl.c
+index 8f828a7..f7fde51 100644
+--- a/tls/openssl/gtlscertificate-openssl.c
++++ b/tls/openssl/gtlscertificate-openssl.c
+@@ -156,6 +156,9 @@ export_privkey_to_der (GTlsCertificateOpenssl  *openssl,
+     goto err;
+
+   bio = BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto err;
++
+   if (i2d_PKCS8_PRIV_KEY_INFO_bio (bio, pkcs8) == 0)
+     goto err;
+
+@@ -189,6 +192,9 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl)
+     return NULL;
+
+   bio = BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto out;
++
+   ret = PEM_write_bio_PKCS8PrivateKey (bio, openssl->key, NULL, NULL, 0, NULL, NULL);
+   if (ret == 0)
+     goto out;
+@@ -201,7 +207,7 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl)
+   result = g_strdup (data);
+
+ out:
+-  BIO_free_all (bio);
++  g_clear_pointer (&bio, BIO_free_all);
+   return result;
+ }
+
+@@ -216,7 +222,7 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+   guint8 *data;
+   BIO *bio;
+   GByteArray *byte_array;
+-  char *certificate_pem;
++  const char *certificate_pem;
+   long size;
+
+   const ASN1_TIME *time_asn1;
+@@ -251,12 +257,12 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_CERTIFICATE_PEM:
+       bio = BIO_new (BIO_s_mem ());
+
+-      if (PEM_write_bio_X509 (bio, openssl->cert) == 1 && BIO_write (bio, "\0", 1) == 1)
++      if (bio && PEM_write_bio_X509 (bio, openssl->cert) == 1 && BIO_write (bio, "\0", 1) == 1)
+         {
+           BIO_get_mem_data (bio, &certificate_pem);
+           g_value_set_string (value, certificate_pem);
+         }
+-      BIO_free_all (bio);
++      g_clear_pointer (&bio, BIO_free_all);
+       break;
+
+     case PROP_PRIVATE_KEY:
+@@ -296,6 +302,8 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+
+     case PROP_SUBJECT_NAME:
+       bio = BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name = X509_get_subject_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
+           BIO_write (bio, "\0", 1) != 1)
+@@ -310,6 +318,8 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+
+     case PROP_ISSUER_NAME:
+       bio = BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name = X509_get_issuer_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
+           BIO_write (bio, "\0", 1) != 1)
+@@ -377,8 +387,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+         break;
+       g_return_if_fail (openssl->have_cert == FALSE);
+       bio = BIO_new_mem_buf ((gpointer)string, -1);
+-      openssl->cert = PEM_read_bio_X509 (bio, NULL, NULL, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->cert = PEM_read_bio_X509 (bio, NULL, NULL, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->cert)
+         openssl->have_cert = TRUE;
+       else if (!openssl->construct_error)
+@@ -397,8 +410,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+         break;
+       g_return_if_fail (openssl->have_key == FALSE);
+       bio = BIO_new_mem_buf (bytes->data, bytes->len);
+-      openssl->key = d2i_PrivateKey_bio (bio, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->key = d2i_PrivateKey_bio (bio, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->key)
+         openssl->have_key = TRUE;
+       else if (!openssl->construct_error)
+@@ -417,8 +433,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+         break;
+       g_return_if_fail (openssl->have_key == FALSE);
+       bio = BIO_new_mem_buf ((gpointer)string, -1);
+-      openssl->key = PEM_read_bio_PrivateKey (bio, NULL, NULL, NULL);
+-      BIO_free (bio);
++      if (bio)
++        {
++          openssl->key = PEM_read_bio_PrivateKey (bio, NULL, NULL, NULL);
++          BIO_free (bio);
++        }
+       if (openssl->key)
+         openssl->have_key = TRUE;
+       else if (!openssl->construct_error)
+--
+2.48.1
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
index 32d50135bb..65a4a3a22f 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
@@ -25,6 +25,7 @@ inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
 SRC_URI += "file://CVE-2025-60018.patch"
+SRC_URI += "file://CVE-2025-60019.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.43.0


