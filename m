Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170F1CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:44:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3284.1760733855527399295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NIXUYTXf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so2297358b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733855; x=1761338655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1Bc1PsSE17OaPJkCBHYCMwacLqz6/88EwoNkA3pTAE=;
        b=NIXUYTXfUdGpX2lR5Xr6h1SqS7xMRBvNHhuGeZXC4UcY6F6X2+w6MwqZMO45dLlvVL
         4fh02ubzGseIeJSLZQy5dwNo8CIRMGy4EgQH15pYwcX2E49xPhqV/Qxpf6ImC+nhUQfn
         XzkulhXn6M42/Bdbwei1KfAaiHmAzLR6EZLhZHardhWydAR0uOg7uc1bG8+FNSeN2CQd
         qufOTWBYnxdgCChFuJqIwyoviTWjSBm7gXbqVm4r0zhA8j20QcAsMF/z9bqdynnmL+xN
         LRVDygWBNFLqlDrREVFnYtSItThpnh2zRRlGmLOxzmI06mpuHfrWIgVlGd9BwDGIRzB6
         rP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733855; x=1761338655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1Bc1PsSE17OaPJkCBHYCMwacLqz6/88EwoNkA3pTAE=;
        b=MOHWyUFCTEgm2w+2MmUYwxEVksFaTqxW3Fh6CSYzP+rNpXmPXWCNvjBe12RP20Ipjj
         xXwtB1uBm7/m8uEHErg48uzG6UHtrB+6hhml6+hkbyaKAHU3OE1pHQbsdAoJUEB0jItg
         w8L+3aQP0dyP6ujp4MB3Z9ZzJxLk6BSysdlGOfEay3rOCjw+7B58DmQqx1NLR4wnYeqq
         hwEC7EyrsmU5FWRElN8DsjaP8gPuB1wOQSEOCFQOYczxH2rpx3GZZtoMm+a0fAPyTRHz
         dQU19Q72Fvzmp500Yw9QmGbnHO8HuQXZ22saGa24JcIC+WJhu5OMedYpgKg4I9iE4rAm
         wsKA==
X-Gm-Message-State: AOJu0YxVXjGECuthwB7NGt4pdwlOiadOENUEaSk4OM/D/TOrcczEnjb5
	FO8eMpm6Mp5UpaPN0rAAyqpqjkmrDy7jhc3Bd6UogvIEvrs2ijb/NGUhu1/uPm8fBPDnzPLOx8r
	8piZaZ10=
X-Gm-Gg: ASbGncvkXyAoip4JdRNtCu4pNoKZbseLjqIqbFlZJY/AJDJ6/8it59atSJrwEM0s23u
	Ip2tkPH9WnbBM9y2wdpiBwcKynStFjspOfPbLI8KvEcJ4TTnvr/WNnNQOS4Sg7oQVpaJ1n9wDzp
	KI1Fj+2Z8tRZb93e9LA10y5oydbAmD7EAJE/lP4NiaKqI5Q3KtvXcKzJN6Oxq0M4TddEDLTRlGr
	X0cO5P1yuWe2ww09QXNqAZMiJPDC+KZjeiah/l95ItAfBynzxQALK0KKcOP+WJyXy3BULEsDrZM
	4xKl4T+tJ1iXLnEuUWJbvyjUH9aJryu7JrJxwcA6rCPYaWO1Txpc5igvgSTBSlFk7cNHe3wrFTl
	TN3/nqdtcCf3yPBgCqPV4Zj9WTCsugchot30Z8gueQJb6rJe1YPGvwSm+Z3wpCHgFHCGYTITlon
	2I
X-Google-Smtp-Source: AGHT+IGMgxDUwKERW64UUF4jVmif9mQqsDg7k1c3LWb5ggW4G23Q49Gde770abqYDQjULNc7sSlb8w==
X-Received: by 2002:a05:6a20:939d:b0:327:957:f915 with SMTP id adf61e73a8af0-334a7930a37mr6579494637.24.1760733854740;
        Fri, 17 Oct 2025 13:44:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a230121ebfsm477066b3a.70.2025.10.17.13.44.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:44:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] glib-networking: fix CVE-2025-60018
Date: Fri, 17 Oct 2025 13:44:00 -0700
Message-ID: <bd11f18909b5946e4570e0eba9b3cb9b47791dc1.1760733724.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733724.git.steve@sakoman.com>
References: <cover.1760733724.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225062

From: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>

glib-networking's OpenSSL backend fails to properly check the return
value of a call to BIO_write(), resulting in an out of bounds read.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-60018

Upstream-patch:
https://gitlab.gnome.org/GNOME/glib-networking/-/commit/4dd540505d40babe488404f3174ec39f49a84485

Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-networking/CVE-2025-60018.patch      | 83 +++++++++++++++++++
 .../glib-networking/glib-networking_2.72.2.bb |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch
new file mode 100644
index 0000000000..4ccf1cd43b
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/CVE-2025-60018.patch
@@ -0,0 +1,83 @@
+From 4dd540505d40babe488404f3174ec39f49a84485 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 4 Aug 2025 15:10:21 -0500
+Subject: [PATCH] openssl: properly check return value when writing to BIO
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
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib-networking/-/commit/4dd540505d40babe488404f3174ec39f49a84485]
+
+Signed-off-by: Rajeshkumar Ramasamy <rajeshkumar.ramasamy@windriver.com>
+---
+ tls/openssl/gtlscertificate-openssl.c | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/tls/openssl/gtlscertificate-openssl.c b/tls/openssl/gtlscertificate-openssl.c
+index 648f3e8..b536559 100644
+--- a/tls/openssl/gtlscertificate-openssl.c
++++ b/tls/openssl/gtlscertificate-openssl.c
+@@ -362,15 +362,12 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_CERTIFICATE_PEM:
+       bio = BIO_new (BIO_s_mem ());
+
+-      if (!PEM_write_bio_X509 (bio, openssl->cert) || !BIO_write (bio, "\0", 1))
+-        certificate_pem = NULL;
+-      else
++      if (PEM_write_bio_X509 (bio, openssl->cert) == 1 && BIO_write (bio, "\0", 1) == 1)
+         {
+           BIO_get_mem_data (bio, &certificate_pem);
+           g_value_set_string (value, certificate_pem);
+-
+-          BIO_free_all (bio);
+         }
++      BIO_free_all (bio);
+       break;
+
+     case PROP_PRIVATE_KEY:
+@@ -411,8 +408,12 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_SUBJECT_NAME:
+       bio = BIO_new (BIO_s_mem ());
+       name = X509_get_subject_name (openssl->cert);
+-      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
+-      BIO_write (bio, "\0", 1);
++      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
++          BIO_write (bio, "\0", 1) != 1)
++        {
++          BIO_free_all (bio);
++          break;
++        }
+       BIO_get_mem_data (bio, (char **)&name_string);
+       g_value_set_string (value, name_string);
+       BIO_free_all (bio);
+@@ -421,9 +422,13 @@ g_tls_certificate_openssl_get_property (GObject    *object,
+     case PROP_ISSUER_NAME:
+       bio = BIO_new (BIO_s_mem ());
+       name = X509_get_issuer_name (openssl->cert);
+-      X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS);
+-      BIO_write (bio, "\0", 1);
+-      BIO_get_mem_data (bio, &name_string);
++      if (X509_NAME_print_ex (bio, name, 0, XN_FLAG_SEP_COMMA_PLUS) < 0 ||
++          BIO_write (bio, "\0", 1) != 1)
++        {
++          BIO_free_all (bio);
++          break;
++        }
++      BIO_get_mem_data (bio, (char **)&name_string);
+       g_value_set_string (value, name_string);
+       BIO_free_all (bio);
+       break;
+--
+2.48.1
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
index 746d1bc39c..32d50135bb 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.72.2.bb
@@ -24,6 +24,7 @@ GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
+SRC_URI += "file://CVE-2025-60018.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.43.0


