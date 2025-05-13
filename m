Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD94C3ABDA
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:44 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.84920.1747163315440972780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0pK6tbGp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22fb6eda241so63218725ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163315; x=1747768115; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ocYiPHNs1+3wJweKaHFLTTkJnUn+5dbuYF55N4pkvM=;
        b=0pK6tbGpROBzkE/HJP9mjjc7g3dH6b4gAA0/xrI4SS/IqUl4ZSuM2C9o7BjH8vfbuL
         9uAvy145MAylec6risAveTMwiBeoQU1dtoaaSbbWJNptivR+GQLmkRijbYysuKDHOJ6U
         QGxQ6CPuzqT0LBpEjACyEffkMGXbomvQRNEVlyQH1uMgN5UFuNCEtW4GvGijfXccnfM/
         JO+qfhwuT9HwsOXmbafQCMwrKGFyDhrrtoJho5kmZxuNzHpL7Z2CqhcofS7tZSNsfM2f
         u08o3Q8pOO3jylvt3EbmnNXAXEE9QqJNHy72LtfrKXmnGzUybHwG/KHRU3x5HUt2rbcf
         USFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163315; x=1747768115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ocYiPHNs1+3wJweKaHFLTTkJnUn+5dbuYF55N4pkvM=;
        b=GL9sVIaKD6RtfW/Sci9GLHNx0f9hjZSKDQgJKx1K5vhO75O+cif2tCmulIMBmmq08n
         u577zRv9NgtqaPgftxxG0N0q/8luV6/A+2YhMYwTIakj8slKSXrNaEvyGyi3eWNyawLT
         TdPvHNeOO8wew5qZA7hSE9415jmxMD8RmNO5uQQX/blCOZ++x3fN3bmVf8BaG9ryIsfF
         d20wNyBZa3d10S+jIMYDUjzJhzehZ/Fg4pS17mKrA/NgXk4uVzVeoglaBE14emM4uHcz
         R/DwnWA7DQvMwzZ4DbrVHHAfS+8DVBwErZPgxj8/jEht+4q4JtGJKy/kdaFRziCwtSTb
         4vgg==
X-Gm-Message-State: AOJu0YxWaacXrqatQrW/uMh2ki5N/d1eCxG5kni6XmjsAGCI12dcHjs9
	YD5Ry1cVx74UffUkVgxYqIMF0yERoF9WrF+TWc+z/nQ5pdi8bQCkpvVOK5n8tj8056Dccnspxu7
	z
X-Gm-Gg: ASbGncuFKWyEbJiTySUQApWOi6RGz5AdhLchLRsQjmKj1sDuDKA1MHelNnS3rjcLKGh
	miuHxANx9mwia8DKTC8jQ/OXvMw4XtGDcrKEr/jAucW7iGalujFP4EPL1uM2/cwimMI4rOlQzFG
	o3A+9nldWfKAdz2NJINmsMpZ2E4jAumkb/VGFBuX9MWpUzD5IzOBdUZhwdmKnpeyCTy7L3vNj4y
	Kd9tlYTtWXFY64vAL4MQTTHOuzZf/6gkp/ZeNBFmGcRlQjBP72WRf1cmAcJBqaZU61IRvWBQ/1C
	dHOXYBo4rVIV3OeHc6fx4UrcyGSpQbuOFfcqgapdPX8EI+IcT8/Idw==
X-Google-Smtp-Source: AGHT+IHyQ5GKzMUgCm4tT7ke08LICZwWaP2HvRNkHFz/JFQOM/AbOr4DfoPAf1grTwfxhR4BtUaOiw==
X-Received: by 2002:a17:903:1a27:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-23198138162mr9272475ad.19.1747163314633;
        Tue, 13 May 2025 12:08:34 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] libsoup: Fix CVE-2025-32912
Date: Tue, 13 May 2025 12:08:07 -0700
Message-ID: <7c709d985c4e732f6fedd56748b3de3e52869282.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216443

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32912-1.patch    | 41 +++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32912-2.patch    | 30 ++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32912-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32912-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32912-1.patch
new file mode 100644
index 0000000000..c35c599502
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32912-1.patch
@@ -0,0 +1,41 @@
+From cd077513f267e43ce4b659eb18a1734d8a369992 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 14:03:05 -0600
+Subject: [PATCH] auth-digest: Handle missing nonce
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992]
+CVE: CVE-2025-32912
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ tests/auth-test.c               | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index 9eb7fa0e..d69a4013 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -162,7 +162,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-        if (!soup_auth_get_realm (auth))
++        if (!soup_auth_get_realm (auth) || !g_hash_table_contains (auth_params, "nonce"))
+                 return FALSE;
+ 
+ 	g_free (priv->domain);
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index c651c7cd..484097f1 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1952,6 +1952,7 @@ main (int argc, char **argv)
+         g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
++        g_test_add_data_func ("/auth/missing-params/nonce-and-qop", "Digest realm=\"auth-test\"", do_missing_params_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32912-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32912-2.patch
new file mode 100644
index 0000000000..ad6f3a8028
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32912-2.patch
@@ -0,0 +1,30 @@
+From 910ebdcd3dd82386717a201c13c834f3a63eed7f Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Sat, 8 Feb 2025 12:30:13 -0600
+Subject: [PATCH] digest-auth: Handle NULL nonce
+
+`contains` only handles a missing nonce, `lookup` handles both missing and empty.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f]
+CVE: CVE-2025-32912
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index d69a4013..dc4dbfc5 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -162,7 +162,7 @@ soup_auth_digest_update (SoupAuth *auth, SoupMessage *msg,
+ 	guint qop_options;
+ 	gboolean ok = TRUE;
+ 
+-        if (!soup_auth_get_realm (auth) || !g_hash_table_contains (auth_params, "nonce"))
++        if (!soup_auth_get_realm (auth) || !g_hash_table_lookup (auth_params, "nonce"))
+                 return FALSE;
+ 
+ 	g_free (priv->domain);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index f5877c3419..dbf437c42f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -27,6 +27,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32910-3.patch \
            file://CVE-2025-32911_CVE-2025-32913-1.patch \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
+           file://CVE-2025-32912-1.patch \
+           file://CVE-2025-32912-2.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


