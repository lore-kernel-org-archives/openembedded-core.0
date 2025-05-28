Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D76BC5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:28 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.17585.1748443406850528698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EXQfGQ64;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b9dfb842so14767795ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443406; x=1749048206; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCZb+XlXEchNmrzOVu+nDXdy6z9c+9K14oZmiIgy6aY=;
        b=EXQfGQ64ZZ9+C+v1cNI2yieOkCPS9B2BlaNafN3WFr/qVpHima9khD5Wq0D6O1163C
         qO45P7tKN9VMubyWDexJ/UL1gu6cMlKvjmx3h4bRp8wUg2gYmMwkD1WY2aTWF7qM4XYf
         jqsJs4NSgRPI5HGyZoXvZbjSRJHgCceMEEibRelnKihBqV2hxq7Mw+sV/0HkfH+3nKzl
         Mt/9ooVUr3MvNjLd1RHA6NHsBirAT0v0ygn1myvuMcZz7ZxeleBxCg8ba4muBcwfLsE7
         talfBVikbNcQnSxl/xOygtXCurbwNFsBVRXYWzXFtD1j1zwKX5Sll62b0Mt7D0xpcGy/
         yqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443406; x=1749048206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCZb+XlXEchNmrzOVu+nDXdy6z9c+9K14oZmiIgy6aY=;
        b=gQDKrQjOc+SAHDXFI+FYRmRD0fYJBVXGeJSL9FuSeqZMuI69qSHXU1kblP8GmE29cp
         4W8mMhtqu+jVBldbfJM1i5WmAkn0AxR5/t9P1APXHs98Ki5n7ouPQrX0ww/sLU30vo8v
         Gy15xZk5qXBScxecQ5vfk5/eYIiFd6WtpddF9bU62eg/TfxGBOITMzdHqVBhAf0yqBRt
         awoLx+oKyfyV7DxIw7ApF2Rg6jUQI1UYP5nxqpDiGkRW9YAnOX9/e7qbMUulusfkbLGk
         sk612DWKnwyB76HC3v7g8jeiMIKqnDqTnfU15ow5vSMlo7wTW3SRWlFx4hlD52kT7q83
         ecxQ==
X-Gm-Message-State: AOJu0YxwvhROyVW2R365KcHAjpIYYTXopqWQRnkB186n6wlp6KbVUfKN
	NHbSL/nKMUtEaY3wki7M19Rar+X1egpn7t8lhZpm8IAUWCe8MxSoFpEBFe20zK6EwyTiuuD7j88
	N+Dak
X-Gm-Gg: ASbGncs5M+1uRnpVQZU4ftJHYdSI+C8RxsEn+jxb98bGERQjc7yuXbznyYjfPxDYTaS
	Kt1dY6yGcV/Yqu09UMcLrARHrPzqIye7193QYQvrwt88Ie+62aMmM0oi77te0dVnGLw4gP/+EyU
	zpfAQVKsxxC1VzuUSNr00p0+X1qrnQVCWmCTNVFCSr+j/oWPxlDesXDCpsZ1+qnHNL8YZREEYpz
	X45G8Nw1kdGglpVhCptca1TCJayCtQol8afGAEb5cMjL6d7XYukzDFPMgSg3LtcqFc29NtKyBqd
	6kixJ4y6pYOpztjuGEkNkj/5FjxptMxLufGYOuUQbnw=
X-Google-Smtp-Source: AGHT+IEt4F8i8NYj+wOqtx6gii/Y55rPy3CMG8MUk8Z7TCcP5FAzoquEcWHd7rcdMQw2tm+KMCH4jA==
X-Received: by 2002:a17:902:f786:b0:234:a734:4ab1 with SMTP id d9443c01a7336-234a7344c4cmr82458735ad.3.1748443406049;
        Wed, 28 May 2025 07:43:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/11] libsoup-2.4: Fix CVE-2025-32912
Date: Wed, 28 May 2025 07:43:06 -0700
Message-ID: <c45c8ad64aafd1f8a447f4fce6a2e7c0f22ef5f0.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217355

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2025-32912-1.patch        | 41 +++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32912-2.patch        | 30 ++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
new file mode 100644
index 0000000000..2a6f37cb58
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-1.patch
@@ -0,0 +1,41 @@
+From cd077513f267e43ce4b659eb18a1734d8a369992 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 14:03:05 -0600
+Subject: [PATCH 1/2] auth-digest: Handle missing nonce
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992]
+CVE: CVE-2025-32912
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ tests/auth-test.c          | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index a1db188..f0edb81 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-        if (!soup_auth_get_realm (auth))
++        if (!soup_auth_get_realm (auth) || !g_hash_table_contains (auth_params, "nonce"))
+                 return FALSE;
+ 
+ 	g_free (priv->domain);
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index 6fb1e4a..343d7a5 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1629,6 +1629,7 @@ main (int argc, char **argv)
+         g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
++	g_test_add_data_func ("/auth/missing-params/nonce-and-qop", "Digest realm=\"auth-test\"", do_missing_params_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-2.patch
new file mode 100644
index 0000000000..4898068115
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32912-2.patch
@@ -0,0 +1,30 @@
+From 910ebdcd3dd82386717a201c13c834f3a63eed7f Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 8 Feb 2025 12:30:13 -0600
+Subject: [PATCH 2/2] digest-auth: Handle NULL nonce
+
+`contains` only handles a missing nonce, `lookup` handles both missing and empty.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
+CVE: CVE-2025-32912
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index f0edb81..c49ffd9 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -156,7 +156,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-        if (!soup_auth_get_realm (auth) || !g_hash_table_contains (auth_params, "nonce"))
++        if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
+                 return FALSE;
+ 
+ 	g_free (priv->domain);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 8d974c2d59..509026c4ff 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -28,6 +28,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-3.patch \
            file://CVE-2025-32911_CVE-2025-32913-1.patch \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
+           file://CVE-2025-32912-1.patch \
+           file://CVE-2025-32912-2.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


