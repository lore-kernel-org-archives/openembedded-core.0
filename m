Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F24FC71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.91284.1749571750085435427
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bTLaH0jK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ea292956so55156035ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571749; x=1750176549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7UDAlDQU+brDhvPccoRU85lRS5WpxShNqHlHAgGNrww=;
        b=bTLaH0jKkVQPSHwAKFtftoabolVQfhe/6++yhMOirWV7PJkwQ7C+s1tXFo0PcPRDqM
         YqxS3yiSZzEJpseHZn0mf23RKo6jG/Z9/sJ4WmaHHfGRCuxF60kn7mbr7c3jzsjWuVn4
         f+6UCUWGiiPZiU9UxElArgkkKED4QmnQ5Bo6tKonyLNh3tf52vQD05h6pv1Fj/tWm3Q/
         Zusgjgu3hEoZJ93UvDc0+pzVxlAoxoVL96cN86mEi15nO8JNhWg9tXg2UvyPuf4OfgqV
         +RujqSc887U4vNZ96LxIL3trwxUtXfnENc0ECscPUTIIMpR5xvQSejrPdnbrT0ByxJ5i
         x6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571749; x=1750176549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7UDAlDQU+brDhvPccoRU85lRS5WpxShNqHlHAgGNrww=;
        b=u2PeMMAuLz4zK/rHF3ugmFSGX0llizN+7U2UDJBm5ch0/9GpsMsuTgPAkydCaiA0o9
         wsQ0DPGUsz41ia/Yy89dC7G9Iq2KBL4R595SgfDSaUav8c7pqPICn2rDcX/vdRmhOopW
         vvnbS04UWf4BO3PvPgQRO9RumbmyFobYbSRBjFLDTEy6o31GVhEi78nGM7Gkld5aKOSm
         jNARfE9tHQmfx+Un6N/74+u/OtzniIXglUH8dDWrk7KC/viIDkviB7iqyp3k62W229wb
         gTZ0Wb+vAo1+LHRy+6btillbukyYEdlqRp4S3FAolvosM0UpVXj/qLn8w4G5jx+HTfRo
         GsJA==
X-Gm-Message-State: AOJu0YyvSghgie6Q5T7jeWVus58pDFFKf3xrX0QzoC0Wz18hTX+OY1H8
	d6qJVETyhC952aT3U4+a6A5S+GmXVRC1iWex2WxMwSHdY2r9gphxOVwMLWsz6CoHvewJyEBHf2N
	h+Ygs
X-Gm-Gg: ASbGncsHd+X8Z0mMk5WQfIrFAB7rVumpzVZ1wkzLfw4oXrJUg5Cfn53H8G+aFuqpULj
	XZPcD4KBwkQX4RQzez2a66jx7EyEvB4GI2o92YtdnTyB0vq7Ark3lMs8j8YY5Anxua9npX7rnPq
	sRARhqEy5FNlXjeBZxNWvljuM0hoZxZvfm9KPZjGM0U+7Ngs549cyAIQdcpDsaZa/6b4+RWJt/U
	D2JCjwHJpWAJcshhGp/O5j4TGvaOhI8j1o43Mdxq5P1xXaQZAbGDWzrOeJw38pJb1I995ibosAT
	S2DbFDMtTtDNVUkBCSYKlLyGSwWSXM59+zMiUXXope4JHLJgCgg+HA==
X-Google-Smtp-Source: AGHT+IHIxMkU5rYtXcgEZx1g5J2UxU2VgldpcLsPBfmO6h/67eRGzr8hILK19rK8SopXfmuLDkQ7eA==
X-Received: by 2002:a17:903:2291:b0:234:8c52:1f9b with SMTP id d9443c01a7336-23601dcf407mr269162215ad.43.1749571749215;
        Tue, 10 Jun 2025 09:09:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/32] libsoup-2.4: fix CVE-2025-32910
Date: Tue, 10 Jun 2025 09:08:25 -0700
Message-ID: <1ecca7b624a7f33513d5e585bedec6438acef3e8.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218381

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/432

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2025-32910-1.patch        | 32 +++++++
 .../libsoup-2.4/CVE-2025-32910-2.patch        | 94 +++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32910-3.patch        | 28 ++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 +
 4 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
new file mode 100644
index 0000000000..c1dc6860f2
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-1.patch
@@ -0,0 +1,32 @@
+From a7e711d0f162c6edc8acad2a96981d4890784ea3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 12 May 2025 17:02:55 +0800
+Subject: [PATCH] auth-digest: Handle missing realm/nonce in authenticate
+ header
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=e40df6d48a1cbab56f5d15016cc861a503423cfe]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c |  3 +++
+ 1 files changed, 3 insertions(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index e8ba990..0ab3499 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -142,6 +142,9 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
++	 if (!soup_auth_get_realm (auth))
++		return FALSE;
++
+ 	g_free (priv->domain);
+ 	g_free (priv->nonce);
+ 	g_free (priv->opaque);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
new file mode 100644
index 0000000000..019a35e3be
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-2.patch
@@ -0,0 +1,94 @@
+From eccfca1074fc485a0b60dfb9c8385429a226bf73 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:19:38 +0800
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=405a8a34597a44bd58c4759e7d5e23f02c3b556a]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 45 ++++++++++++++++++++++++++++----------
+ 1 files changed, 28 insertions(+), 10 deletions(-)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 0ab3499..10a8591 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -132,6 +132,19 @@ soup_auth_digest_get_qop (SoupAuthDigestQop qop)
+ 	return g_string_free (out, FALSE);
+ }
+ 
++static gboolean
++validate_params (SoupAuthDigest *auth_digest)
++{
++	SoupAuthDigestPrivate *priv = soup_auth_digest_get_instance_private (auth_digest);
++
++	if (priv->qop || priv->algorithm == SOUP_AUTH_DIGEST_ALGORITHM_MD5_SESS) {
++		if (!priv->nonce)
++			return FALSE;
++	}
++
++	return TRUE;
++}
++
+ static gboolean
+ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 			 GHashTable *auth_params)
+@@ -169,17 +182,22 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	if (priv->algorithm == -1)
+ 		ok = FALSE;
+ 
+-	stale = g_hash_table_lookup (auth_params, "stale");
+-	if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
+-		recompute_hex_a1 (priv);
+-	else {
+-		g_free (priv->user);
+-		priv->user = NULL;
+-		g_free (priv->cnonce);
+-		priv->cnonce = NULL;
+-		memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+-		memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-        }
++	if (!validate_params (auth_digest))
++		ok = FALSE;
++
++	if (ok) {
++		stale = g_hash_table_lookup (auth_params, "stale");
++		if (stale && !g_ascii_strcasecmp (stale, "TRUE") && *priv->hex_urp)
++			recompute_hex_a1 (priv);
++		else {
++			g_free (priv->user);
++			priv->user = NULL;
++			g_free (priv->cnonce);
++			priv->cnonce = NULL;
++			memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
++			memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
++		}
++	}
+ 
+ 	return ok;
+ }
+@@ -359,6 +377,8 @@ soup_auth_digest_compute_response (const char        *method,
+ 	if (qop) {
+ 		char tmp[9];
+ 
++		g_assert (cnonce);
++
+ 		g_snprintf (tmp, 9, "%.8x", nc);
+ 		g_checksum_update (checksum, (guchar *)tmp, strlen (tmp));
+ 		g_checksum_update (checksum, (guchar *)":", 1);
+@@ -422,6 +442,9 @@ soup_auth_digest_get_authorization (SoupAuth *auth, SoupMessage *msg)
+ 	g_return_val_if_fail (uri != NULL, NULL);
+ 	url = soup_uri_to_string (uri, TRUE);
+ 
++	g_assert (priv->nonce);
++	g_assert (!priv->qop || priv->cnonce);
++
+ 	soup_auth_digest_compute_response (msg->method, url, priv->hex_a1,
+ 					   priv->qop, priv->nonce,
+ 					   priv->cnonce, priv->nc,
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
new file mode 100644
index 0000000000..bdf4d64ca3
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32910-3.patch
@@ -0,0 +1,28 @@
+From 74c95d54fe42041fe161cb74c76d942ffd37a5dd Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 16 May 2025 13:21:43 +0800
+Subject: [PATCH] auth-digest: Fix leak
+
+CVE: CVE-2025-32910
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/417/diffs?commit_id=ea16eeacb052e423eb5c3b0b705e5eab34b13832]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-auth-digest.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libsoup/soup-auth-digest.c b/libsoup/soup-auth-digest.c
+index 10a8591..6d965d2 100644
+--- a/libsoup/soup-auth-digest.c
++++ b/libsoup/soup-auth-digest.c
+@@ -66,6 +66,7 @@ soup_auth_digest_finalize (GObject *object)
+ 	g_free (priv->nonce);
+ 	g_free (priv->domain);
+ 	g_free (priv->cnonce);
++	g_free (priv->opaque);
+ 
+ 	memset (priv->hex_urp, 0, sizeof (priv->hex_urp));
+ 	memset (priv->hex_a1, 0, sizeof (priv->hex_a1));
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 510d1128db..b8b7bc1df7 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -27,6 +27,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-32910-1.patch \
+           file://CVE-2025-32910-2.patch \
+           file://CVE-2025-32910-3.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


