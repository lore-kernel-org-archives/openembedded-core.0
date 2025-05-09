Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862ECC3ABCE
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:03 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.1412.1746804235598954828
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XFveUe/H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-74019695377so1761017b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804235; x=1747409035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jGeDqAmI1ekiVOswGA8/1Gbgcyen4/yzIm6aSsib1U=;
        b=XFveUe/HO0eG6KRjxYERfwh4UgSY9OHpsNb7IdagX6R1gYkAY045irQEUhme+lN2Gm
         yg3FTmdZ+kk1mCrWFIhnqscUVO98lWWEMhyRpFzUf94LwfhUyVQuvBZHa28RtU4cTEGB
         GMgZmVVrSQOQ3x+GG285CJsggdEwiz5U7GhUi7Ld3IO1uxg21DH/efWpFQJmqgS2L/q4
         ZP4xeVynvPzF4Xtk5j5IdCiaTwtickpb1DBv68iYb19Y+STK4mMJtBtGmjO1r6b15MSh
         8NlSrCXs1T4DfTy99ZjaMvhQeak7guWGndp99TQR7uIsNOjFBeA52TdPc5LS3fStjN+a
         kWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804235; x=1747409035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jGeDqAmI1ekiVOswGA8/1Gbgcyen4/yzIm6aSsib1U=;
        b=OJUww8F9YYX0bTyBe3VoHOdVp8WlfnQ6izC45ZtuAnRcI4SxBFNiFrb6mhI5zOJOGw
         0XbVdtgGGFPSuiAiaFVTskHu1SWSRqElEoC+lLaoJLEImf0vQIzWhyk/BEF228/N9caP
         ZoV4Mrf7IUlNjHSO35zbkar2fuwjC4BW4gKe1jRD2eKQaK+uukPHN9S+IqMGKUHd1EFS
         BhZ5fhjLyRVMtTp4ergBTaExMey1J/EUSZNLdcwnq4w6K7MH1hX57mY1YlBVK2haYaBa
         d6N22gpvVEyIUfwFtMOtJRUhg/q6iea83hdbzU+KYu7F1P5klZhuawggnusY6RqIu7P/
         LZ3A==
X-Gm-Message-State: AOJu0Yw8vp6vrmNaQSZaKi0C4ojB4IJ6c3NFjHbsdqha+e5LO9h0mmo0
	6zfb8h7Qyl+Sm8spgeY/CHH12Y+j0XL2BB+hGU+Fd+Igevpcv+Is3K5NYqSimRxSv17hJrQ47R2
	Q
X-Gm-Gg: ASbGncuLT0noZYN8z6UlgYyu47R8oHOpxf+Rc4wuuYcF4S8uXZG6e8AVkSPJuKEDfgB
	BYz0IBiw6GbFcDNCI/13y1Gl2Zw6F6fBuG/GJAK8Uq4VmMRPC5EFfHe7HPQVDbkNJR5GuxWgF97
	no55WtpBwyD9Ha2TGieeDMd5mcc8gdhTVABiULDVRzrvQ3dkdGNS0j+OIadmt1vrmDIKuO2d0wG
	TZ9kkFnUEm2NhAvqBUQzE+KEt4sYmdTnlOFx7eP3ovkh/rACMZYAD3mm1z7nDgptWKKfHLzEro3
	qzVALfdcjGeqdMfcNKGwFlxI4i5Mw92m
X-Google-Smtp-Source: AGHT+IFTudoevm27Sp7KCQJ5ARNCUUhYPLOWD04OfntODtlBwJ88LUHiQxeWAM8dgSXbGws6bLgA/w==
X-Received: by 2002:a05:6a00:b4a:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-7423bc03870mr4732193b3a.1.1746804234749;
        Fri, 09 May 2025 08:23:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.23.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:23:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/17] libsoup-2.4: fix CVE-2025-32911
Date: Fri,  9 May 2025 08:23:18 -0700
Message-ID: <75f1c57a5171859d1bfc58d69b3923d017b14303.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216210

From: Changqing Li <changqing.li@windriver.com>

CVE-2025-32911:
A use-after-free type vulnerability was found in libsoup, in the
soup_message_headers_get_content_disposition() function. This flaw
allows a malicious HTTP client to cause memory corruption in the libsoup
server.

Backport patches to fix it

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-32911
[2] https://gitlab.gnome.org/GNOME/libsoup/-/issues/433

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/0001-CVE-2025-32911.patch     | 74 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
new file mode 100644
index 0000000000..9ef0643837
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
@@ -0,0 +1,74 @@
+From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Apr 2025 14:59:55 +0800
+Subject: [PATCH] CVE-2025-32911
+
+CVE: CVE-2025-32911
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c | 13 +++++++++----
+ tests/header-parsing-test.c    | 15 +++++++++++++++
+ 2 files changed, 24 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 39ad14a..78b2455 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
+ 	 */
+ 	if (params && g_hash_table_lookup_extended (*params, "filename",
+ 						    &orig_key, &orig_value)) {
+-		char *filename = strrchr (orig_value, '/');
+-
+-		if (filename)
+-			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
++                if (orig_value) {
++                        char *filename = strrchr (orig_value, '/');
++
++                        if (filename)
++                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup(filename + 1));
++                } else {
++                        /* filename with no value isn't valid. */
++                        g_hash_table_remove (*params, "filename");
++                }
+ 	}
+ 	return TRUE;
+ }
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 946f118..752196e 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
+ #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE  "filename=\"test.txt\""
+ #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=\"test.txt\"; foo=bar"
++#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
+ 
+ static void
+ do_content_disposition_tests (void)
+@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
+ 	g_assert_cmpstr (filename, ==, RFC5987_TEST_FALLBACK_FILENAME);
+         parameter2 = g_hash_table_lookup (params, "foo");
+         g_assert_cmpstr (parameter2, ==, "bar");
++	g_hash_table_destroy (params);
++
++	 /* Empty filename */
++	soup_message_headers_clear (hdrs);
++	soup_message_headers_append (hdrs, "Content-Disposition",
++								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
++	if (!soup_message_headers_get_content_disposition (hdrs,
++													   &disposition,
++													   &params)) {
++			soup_test_assert (FALSE, "empty filename decoding FAILED");
++			return;
++	}
++	g_free (disposition);
++	g_assert_false (g_hash_table_contains (params, "filename"));
+ 	g_hash_table_destroy (params);
+ 
+ 	soup_message_headers_free (hdrs);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index ee20530b64..25e0d7dcbc 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -12,7 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch"
+           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
+           file://0001-CVE-2025-32911.patch"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.43.0


