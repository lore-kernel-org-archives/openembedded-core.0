Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB0CC369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:05:08 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.9764.1744898698996222566
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 07:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DIUn5D3H;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-224191d92e4so9130545ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744898698; x=1745503498; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC7WRHPQDY+TNetoSqfnDLWKhUXkQU8geJ6s2alr7KM=;
        b=DIUn5D3Hy6ZI5+PsHp4/Wp3RIsS5lgW65+waBm7YGLP2lGyQ/F1mAoDBWySpxwES27
         8mv7Qm2ioox3galzdfrXTRs8ab5h7UUR2glgUTPJW6d/FwZ4Cg/Om9VWBX/GTY/FH7zM
         EyQH5CBIT50QaM2lyfD/6n7PaSzyRI1klP8do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744898698; x=1745503498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CC7WRHPQDY+TNetoSqfnDLWKhUXkQU8geJ6s2alr7KM=;
        b=I5pWrz5IpJ3IyrYMKI+VZdqxjiEvJtQ3bsm29HDtChUZlLcNjgiloOOQBwRqu/GvSi
         r+Tbebtmj+X/4lNSV/uE6Gwc4A2V3RD47S23QMLbIly9JtfZ+1ZPGMFMkg3mcWZ+ek7U
         Hc63GPVnSw/VwUU4Kodtphy3joRrMWMAncW1CnLEONRr7+W87oIZmEmL4pPqQDml/1sQ
         n0iGKg2glFxb3u9c3hsGFnCbR+bQX/ifvFyFebX8/0ZgaV5g1byDnqzieYyKV3dPXKjX
         XYIKfBu1puTi9Nm8VsZSC0tXXdHqDSvjIyQ9tIGa7Y2KpzaZbE7k0yN6nq2IbsXioYnD
         FuxA==
X-Gm-Message-State: AOJu0YysB6sVt1sN1BoPBZ7nOpuqJ59/7xhGr7Dz3smWNZyqPtacVtED
	Pv+5h1Uop0U2od6h2PyAAVRtkOQRQHp93qShMgooqu+ak+8t2e2AxSZlOlcrKD+Q7etzp27ENap
	301c=
X-Gm-Gg: ASbGncuWocSO9CHdg/A++aCUtFzixOG2UTMtwS/t9Ha+KdnHJK9DrZsZoS7TyhAWTe9
	gMdHorL/Vob6yR9yr7iQRImPFJA2/5Z8YoD3W40jFWrsFMQiZkktV7H8WIK9OFyHyjs+arfiJuW
	W6xsRiVoVs7OQg4Q9jn5PqAjFia4NIT2eWxgfpbUEMKLOraQlYAL216RWoSXTUTjcnDSknVIGWu
	k9ouu41nj/tGBnbEuNAC30umIk9lXbdOXBtgSlg8OgODfUs1BnWJqBzehpl5HEHUzQgity8miMm
	A6NbEAr3U3e+A29txnhZXRLWgcSa/ma2tFYX9nhoucnOOuPFm2+M
X-Google-Smtp-Source: AGHT+IGkaomA/zbAnz1kDNrUMF/3YggbE8AlNfX1g2/X3gEDwu3lGQkoFacwyiynit/Rk7HqEW+Tog==
X-Received: by 2002:a17:902:fc86:b0:225:adf8:8634 with SMTP id d9443c01a7336-22c359913a1mr86220295ad.51.1744898697804;
        Thu, 17 Apr 2025 07:04:57 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73db4717bfasm1127812b3a.129.2025.04.17.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:04:57 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v3 4/5] libsoup: Fix CVE-2025-32912
Date: Thu, 17 Apr 2025 19:34:28 +0530
Message-Id: <20250417140429.136534-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417140429.136534-1-vanusuri@mvista.com>
References: <20250417140429.136534-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215082

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32912-1.patch      | 41 +++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32912-2.patch      | 30 ++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch
new file mode 100644
index 0000000000..c35c599502
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch
new file mode 100644
index 0000000000..ad6f3a8028
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32912-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 167163b91f..f62c657213 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -24,6 +24,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32909.patch \
            file://CVE-2025-32911_CVE-2025-32913-1.patch \
            file://CVE-2025-32911_CVE-2025-32913-2.patch \
+           file://CVE-2025-32912-1.patch \
+           file://CVE-2025-32912-2.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


