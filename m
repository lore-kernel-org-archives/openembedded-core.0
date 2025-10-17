Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7690CCD1A7
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:43 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3124.1760733580057762683
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c0G3vB5V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-794e300e20dso2852997b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733579; x=1761338379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8KPmGz9691S/NJ+yk0ZmMO7x7aG/lSU71l8FHk4Q8U=;
        b=c0G3vB5VnksrkxspkYxkDjf/2Y76gbIQv27A/SDisvg6seclJ4RDfmx05ihSlx2MQy
         hlP6F/hVK1/HCjZMmFyQq1DoNjsGXqC0aoJiX1wgi5cBttiWwcWYHtUelMD4PQbFLp1m
         j4CQctyeOAlvuLE2ioT8rCGuH1BEmGHChSaFbHXbPUpXDikRrpPqyMlW8jdRhxAFq/TS
         uK0omf66aTfF1oAfWV9woFyghV6NJ597P19HR4BCkRTAN7+6yPKeQyAJSP4NBjYNxdqA
         WPposIp/4Ow5q7JXTb4vel8QtaUNbi+GYrZZiZnjry2Zo4ckSofjElh+0S/5/1BrwTps
         STFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733579; x=1761338379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8KPmGz9691S/NJ+yk0ZmMO7x7aG/lSU71l8FHk4Q8U=;
        b=D8QyJzE9P0gwMJE0D/0Q7Do54LtuNpthduDWPUR8j198wAVZEHiG3+uESGySXXKnlP
         DcnwPeijpHf0PFYkqv28gHgUacpgOcJ6aqGJ3h4+g8tIn+qifXfFx15jBeOIoCitYEVD
         UnACNYklqZXGAWJMLy0ql/RnZNvcpZb+dNQLqSbnVZk/s3FdGeJmFxyg0wW46K0KirRW
         WExj6qmDTriJy8bu7cQwMp0zD24gTziyZzi31UP/zeiS6tGlO6s4AdceEkxur2T3s8NQ
         DjIO3Anw4HQyXXQhAR3lTfUKIfRuakHW4PPDXhE3SHL5eibCV4C2cqkSBupZJyNa6aVp
         8vDQ==
X-Gm-Message-State: AOJu0Yz2ReQ84UKES40SviHYH6ZA7JIqDHgXQQOYPjCDo4j7Efg2hxCZ
	Ty51C7KXmFdrg6i23pVpfHS0UidwXFED6Wbd3OecnnrsMKlA11sFEF7OEHCUTbHFzNUnX2dnzRy
	eu+BdJVw=
X-Gm-Gg: ASbGnctYQBc0poFLZruapr6Dy7EqIE1IRqjKxuWArkHdAWdF2WcjVCee+cCo5AO+bVi
	mO4dxi2sbOyUBa2mw493Sgpkv1Dvl1WWxRoWO7yDMZh36Tr1mql6VFRt36/upU7kzW4fPeDcsY/
	oW7A79pLscfhFuTvaJ6aodijKGHhWv2o8TlvhPWG2CT3mst8XhUvjecaQi9SpAgcll7f88KqDC9
	ZJHgCaDTVxmcft3PNByPo+g0TCdH/zOCd/p7e5RubN5+Vxp4U1U5LBfkKrOZLf4k8m7bhkgzK8R
	Tr7BVREfgGkmeYFpKJqGXrtnVxxEcayWPAz/mXsMS8+06tIEMz1MyFqwVtq3xXQ0Tq7zoZxuv+Y
	Qr4esBkSvTHXlgbvN92ND7IyCcazvEgzBCtt+7DDxBTaIXlaWLz5S7uXNFK3Zc5IZEu7sTBTUVK
	Cu
X-Google-Smtp-Source: AGHT+IFY5QsjqHGHzkkMTZcm3lZpkT/2eKZfedMoiJOYqW3WNTLocMUwlcX95Z/pburEfN+f0NGo3Q==
X-Received: by 2002:a05:6a20:3d84:b0:278:bc13:d83e with SMTP id adf61e73a8af0-334a787d9c2mr6942082637.11.1760733579113;
        Fri, 17 Oct 2025 13:39:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/26] glib-networking: fix CVE-2025-60019
Date: Fri, 17 Oct 2025 13:38:53 -0700
Message-ID: <8c44478c92a8b3d859c7fcecc734ac6bb399277e.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225044

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
 .../glib-networking/CVE-2025-60019.patch      | 147 ++++++++++++++++++
 .../glib-networking/glib-networking_2.78.1.bb |   1 +
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
new file mode 100644
index 0000000000..07d64bf2dc
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60019.patch
@@ -0,0 +1,147 @@
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
+ tls/openssl/gtlscertificate-openssl.c | 42 ++++++++++++++++++++-------
+ 1 file changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscertificate-openssl.c
+index b536559..4fa5286 100644
+--- a/tls/openssl/gtlscertificate-openssl.c
++++ b/tls/openssl/gtlscertificate-openssl.c
+@@ -166,6 +166,9 @@ export_privkey_to_der (GTlsCertificateOpenssl  *openssl,
+     goto err;
+
+   bio = BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto err;
++
+   if (i2d_PKCS8_PRIV_KEY_INFO_bio (bio, pkcs8) == 0)
+     goto err;
+
+@@ -199,6 +202,9 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl)
+     return NULL;
+
+   bio = BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto out;
++
+   ret = PEM_write_bio_PKCS8PrivateKey (bio, openssl->key, NULL, NULL, 0, NULL, NULL);
+   if (ret == 0)
+     goto out;
+@@ -211,7 +217,7 @@ export_privkey_to_pem (GTlsCertificateOpenssl *openssl)
+   result = g_strdup (data);
+
+ out:
+-  BIO_free_all (bio);
++  g_clear_pointer (&bio, BIO_free_all);
+   return result;
+ }
+
+@@ -232,6 +238,9 @@ maybe_import_pkcs12 (GTlsCertificateOpenssl *openssl)
+     return;
+
+   bio = BIO_new (BIO_s_mem ());
++  if (!bio)
++    goto import_failed;
++
+   status = BIO_write (bio, openssl->pkcs12_data->data, openssl->pkcs12_data->len);
+   if (status <= 0)
+     goto import_failed;
+@@ -323,7 +332,7 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+   guint8 *data;
+   BIO *bio;
+   GByteArray *byte_array;
+-  char *certificate_pem;
++  const char *certificate_pem;
+   long size;
+
+   const ASN1_TIME *time_asn1;
+@@ -362,12 +371,12 @@ g_tls_certificate_openssl_get_property (GObject    *object,
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
+@@ -407,6 +416,8 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+
+     case PROP_SUBJECT_NAME:
+       bio = BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name = X509_get_subject_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
+           BIO_write (bio, "\0", 1) != 1)
+@@ -421,6 +432,8 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+
+     case PROP_ISSUER_NAME:
+       bio = BIO_new (BIO_s_mem ());
++      if (!bio)
++        break;
+       name = X509_get_issuer_name (openssl->cert);
+       if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
+           BIO_write (bio, "\0", 1) != 1)
+@@ -533,8 +546,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+         break;
+       CRITICAL_IF_CERTIFICATE_INITIALIZED ("certificate-pem");
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
+@@ -554,8 +570,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+       CRITICAL_IF_KEY_INITIALIZED ("private-key");
+
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
+@@ -575,8 +594,11 @@ g_tls_certificate_openssl_set_property (GObject      *object,
+       CRITICAL_IF_KEY_INITIALIZED ("private-key-pem");
+
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
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
index 22ca90724f..ffbdf46162 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
@@ -32,6 +32,7 @@ inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 SRC_URI += "file://run-ptest"
 SRC_URI += "file://eagain.patch"
 SRC_URI += "file://CVE-2025-60018.patch"
+SRC_URI += "file://CVE-2025-60019.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.43.0


