Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E28CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:39:33 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.3207.1760733572895506808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=con+CebP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-78f3bfe3f69so2188008b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760733572; x=1761338372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yZuZgiAXnIxebgTk1XanzxHN1DhYNcYS9azwmXa86A=;
        b=con+CebPF73VpJsSPFwCX0EhYv9ZzXYN1vPnsRfaL3iNYGOY271Hs1n/vDvXQdcwPL
         FxrVquAAW8y1QAgLUfaw7tvHU4VA7J3PuTkP6l9XTXOSxkHzcChHEhGpYH2mgUKcBqRb
         AppteYRtB4uRSGUwwEQ5AtOrdYRYgHH/fYM9vtZSiPNCKlUE1fRn5ozQ+lLEXDI7Ruow
         dIRZdLXfkxkQPHzkOSYgybxMHp13q3itY9kpAONEB1VcfrEuax9J0S+cb9yHE4RfzwTE
         tTZl6vu0O8AxKGf6KFYnM7GeXJuVhg859csBezV7+3swZ94jqwgfy51507r6bhlI9SVm
         bWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733572; x=1761338372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yZuZgiAXnIxebgTk1XanzxHN1DhYNcYS9azwmXa86A=;
        b=F3BhoOX78Urk7xKJdD+oyz8YovsK3Npsn40s8E1smB3Bcl58sEK+5d/Og0X69zsOL6
         kGEmTEuFVF5x+wE98rabBCZfgNMs03QuLmMrTFbQ3tZZpZsLLzsW98OEa2J1EGeIbSmi
         4xK+Hz0UOf7Ob2AQteK6az/RpY6CEKqis7ql3b5uFYst4yM094CbL5L1+DHpgoTkM0yW
         tVSagj15MPbmUuLjEWNJBtUdROutdN9bD6eE3YZY/o3/RRHr9+oYYFSez0K8ycPFeoBb
         MbDnXi4KOrAc76AC+1Lva++dGdq81lyrwXBKaZFGC9v2K/TkbQkWg8DkxEkNmOst15Va
         1w8A==
X-Gm-Message-State: AOJu0YzdssH+i8DCKUjJUkZvXq7HWklEb1z89vG2V+Qnk9g1WJkckyzD
	CHzYjEMkUhDEdoGJCPhNoTNlBsBFU7tWZzDrkRjd7pgrHDYV/cVmkIvHzw3agC9Duvo5CZU8K/M
	HW2ctaRY=
X-Gm-Gg: ASbGncs+nPbGPBobgIFUYjmX/+UtrDNzK8DV3DIm5QKkPZytoqCJbxUS78Lpw5akVlA
	U+DIohjUer9+c6tDlR72GsC5NGtTqOwehU8EpzSyw2Dlvr3syFwSl2OUZg23fU2xKvyzZeXkM1+
	HG1sZZknNjKt+NF/QRka1jjiEZXkfCTrV1YACmzoFhACYiSXC9xrLKpfl+dsqdKAa8B0fL1c0Sb
	84H0TbmYWL6G4ZssVeRXFMCAWUUtiCeGXYKmwpSC4ajmORyimMl1cBxASyB0YMU+66mczBc5s4i
	YDaqJMmQ9lqwY59RlTt2GBcG785Onzs6/dRGIF/lDzwWpc49Gt3GqIEBv+bCwWTdtc/GVeiUikf
	StdS+6RgF0N2Qf/2yo4FYWz1ZTSy0zbG7q9JriaRndRACVQXSNudg2fGJDDoBKFJbtjai4VVnFl
	ju
X-Google-Smtp-Source: AGHT+IH929wBqM8eB8GFV3RQI8ORF1D4zn4UCKEHa19Y9L2MLtgI1wpwCXr6Uv3MTbNA7yRKACMcAw==
X-Received: by 2002:a05:6a20:244b:b0:334:7e45:e6b0 with SMTP id adf61e73a8af0-334a86142ecmr6120810637.50.1760733572116;
        Fri, 17 Oct 2025 13:39:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:aaee:e640:34cd:6f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f254esm477061b3a.45.2025.10.17.13.39.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:39:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/26] glib-networking: fix CVE-2025-60018
Date: Fri, 17 Oct 2025 13:38:49 -0700
Message-ID: <e5ef6337416135d3c9d311c870ee72928aa75620.1760733431.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760733431.git.steve@sakoman.com>
References: <cover.1760733431.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 20:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225040

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
 .../glib-networking/glib-networking_2.78.1.bb |  1 +
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
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
index 5060d9fd7a..22ca90724f 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.1.bb
@@ -31,6 +31,7 @@ inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
 SRC_URI += "file://eagain.patch"
+SRC_URI += "file://CVE-2025-60018.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.43.0


