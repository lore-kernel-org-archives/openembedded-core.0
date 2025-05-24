Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940B1C5AE59
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:54 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.7110.1748093809174083029
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cFEO6VVA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26f01c638fso630639a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093808; x=1748698608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bvdJO3RFH1UIteeFpiIJ1YjvZn+naqavHea28C+hAo8=;
        b=cFEO6VVAcugeP9QshagZsX3JEC2TeJYEGUOkZXUtqZX24XOT5NjbIdhS0ksScLiWFQ
         vCqniJVFbg5DKDYUK2gbtwM2uTMS9ZZ/71RdcytRoV7baVBqRHHV5NE6uzf9jgww1sxU
         BMHGvfr7Za078YKNRFhzoc0dE9lzK1NewnVZpgIWkgGvXAza4FIzvc/X0waao6k/6fav
         P/Ib4qDn1Khq9pdB+3LktyZQliEDXiKWo/+/GcRXSzIc3dfLsXkETd7CH1rRuI/jxm7K
         +nwEl1ztPcxlcGMBr6G9m+ODbZ8yq8uU7H4kLVWHpEedm5kbTGBZpiwi9qfVd2M8Us76
         KGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093808; x=1748698608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvdJO3RFH1UIteeFpiIJ1YjvZn+naqavHea28C+hAo8=;
        b=UogVI5apF0I9tHXvDhajeqZwKR3TcSB59rqMVEs4+R0fsHNPY3PDlnnPd2BaMzyT1K
         nXNCnV4Hh6PJDrhhkTHr/Y+JdNC9Ks3XabCxzcdg4DaBtMO0lEnLBleJ+4X9Qx6AXDoX
         nCLmPUZREjW69ptPvKy1sXzgQSftkdNAlsEIRE634HNho2wAwyLubr/QT9twaQvWVtAc
         OlJXeFh1cIuVL1REyY/v0WR/+AH3Z+q466GrGXf8IoKTbO7FVlqLwYMhp4C04l8y0S1l
         dmgqvBFrNspig9v/rWtVJPpwgxfptryyFd+W6cE/p7/rBH469wbXyzb4vnLciUXvT7mT
         id6g==
X-Gm-Message-State: AOJu0Yx7x+Q1iyAqJmjAMtW2+4LR6AcWppKQfIqaqb3qeLZZQ8yXgxrK
	5YqhEdCkhA3K76I7ZNGAw792BblIiG7VxJf+B+lb6KlycrHYEUybV7DpSFGkh7SQixoXCSc+pj0
	y4hTd
X-Gm-Gg: ASbGncu0WBuDlD4F+0aOAmWwLGgZgrAk6ZSK3xcL5rz/d7WiS+74C9fiDC0esciTkq2
	lGmMR+5CQGGJuWw9SXX7txh7BpfjKc9Su1XQ24S0pknxhP7fqyoMZIpA7XJDyXohxfhdzUVR/eR
	cxt3kzz697YBWw6UJ26X+IuuzVwqMfJKdh+EfEhxECrANCJhYSGXi0Vjs+y1wVAnZDIIgEt9QLw
	5ag1YTuaZShQ4bR4xa80tBmFEBpyyI+ZDPeV9WJsxbTL4Y/ihjvvFlx5EmLDcJFpZROee4It1i8
	kvrpL1w/2AH27o/wc2Dp1C59UdEx0u2zGqpIogwhn9EoLld1cO0W9g==
X-Google-Smtp-Source: AGHT+IEtRSHBnAoO1fk2QB47HJDmQNRkigS1j61Oq7PyBYg2zVFoEbt3FhFBrL89lfO4qESC94EcQA==
X-Received: by 2002:a17:902:fc84:b0:231:cec7:34f8 with SMTP id d9443c01a7336-23414fe5583mr43052535ad.47.1748093808329;
        Sat, 24 May 2025 06:36:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/12] libsoup-2.4: Fix CVE-2025-32912
Date: Sat, 24 May 2025 06:36:23 -0700
Message-ID: <e66218f6cda7de046bace6880ea5052900fd6605.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217232

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2025-32912-1.patch        | 41 +++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32912-2.patch        | 30 ++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  2 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 4e7667402b..848ea6eb54 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -28,6 +28,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-3.patch \
            file://CVE-2025-32911_CVE-2025-32913-1.patch \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
+           file://CVE-2025-32912-1.patch \
+           file://CVE-2025-32912-2.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


