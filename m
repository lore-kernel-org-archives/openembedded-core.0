Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A6CC369D8
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:47 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.8565.1745414440230191941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 06:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g4PEEwXD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso5781069b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745414439; x=1746019239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4b9jAmriJnk7HskC2wO2AHiMvrB8pd/V/xIpmUcDY4=;
        b=g4PEEwXD0Ng5cIDZZGCY9ktODSjwiA4cR9iCg6ebG6MPXX4LBYvRopXCs6yEPp9CXL
         cKVSjDHNDhWXxNY00O4QG9qmh83X5X9OWfTytJPrAfi+bhEtNu1Sv/UWMaYG0h5maZCT
         tv92US/okNiX6hdnV3AEyYIpygaYy/inkLF0LJkXns8NPphzZFyCSaK2lKT34bTP5VmU
         ObOvmFZUTl489ZAMAQWYQF0uCgcW3IfstWQLA87Pa7qMgICB7W0FY2MGUyvv5+fbqZoJ
         fhAQ+QDxtEN8/xhjNatuTEbqr1By+QE7xRK/dtCKvpAZYrauTRD92JzqFuLnx9D8YTpx
         zEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745414439; x=1746019239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4b9jAmriJnk7HskC2wO2AHiMvrB8pd/V/xIpmUcDY4=;
        b=NVsiSB/41jzXMr4Zx1C03UmmfhJvG9eal+K4ei7YLu3qnUUGwOWMsHcSO8D0SI8VpO
         d3nQxk1ijGFZKD+rdMSBcnRVG8mFli93ib3eA6UD25n6lPQ8F/mB1IYmjqlR+6/qUaWc
         KfbbhM7bire7O/cCZgSRN1Vm3Hhn77sUiOehtpqd4wq9Ec5iHWe0Cv8vnWc6f6c4T+VN
         Z0XrQcMTyqiNPpr9T+LkbvFskfogF/+IJeRvZzbqaxBEobm30lxVwOyKSb380EFa44hb
         O/CJpITlQJLQPaU0Pw5Vm5D/cE68D39t4HQt6ZjfZAbVOZCzrI+3HipbALAajZqlr+iu
         98jQ==
X-Gm-Message-State: AOJu0Yx2wmp8XKUBwxCdiqCNvl1aDsn3wbL8VbGcn+bxp26GsNDxn91Q
	8bxvdCPnfYcDrR1lnuYj0mCOSqm4rTUNOeUo0tFT3iJZxqhXVIUo5Ky5+SbptJp4++1WStJlPCl
	R
X-Gm-Gg: ASbGncsW9KWgUMgJwzDg+Ym0fPEBqvFyUGPPrYuKi2nkbMyIbSkx9rmFGVhrZK1itqW
	IPXjb1uU5UdxCyFnyei2I7VQb/Ces2GLEjCIMEadwKqzkUCZPAnFPw/w8XVKiRHzUgenlygK57w
	SyK38toVjmXhLp9BH8ja3vCGApxho2l8ulbUqLXu1Awz0Kjt2K/atecjXfGJUxs2v+FJW4CDxPl
	BznmvsF7r0ICzTGWY8jO7V9pFfUafeqqSOz0dNsu/UBliHycIfmDoh+vR2O1NR95VYpIrDdRuSj
	5PAdJ8naXmE5kR6fKO5CpexE6/4kfUUeT722yoOEtw==
X-Google-Smtp-Source: AGHT+IFRcDse5ITZEqvQHTIanFemiw4gGrKrFdVjVByp/1Jlhq7YhrP4/Rbj+PW5/horHbYnspZA8A==
X-Received: by 2002:a05:6a21:b8b:b0:201:2834:6c62 with SMTP id adf61e73a8af0-203cbc72f79mr28315148637.25.1745414439412;
        Wed, 23 Apr 2025 06:20:39 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:371e:10cb:f3ce:33f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e510bsm10898037b3a.66.2025.04.23.06.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:20:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/14] libsoup: Fix CVE-2025-32912
Date: Wed, 23 Apr 2025 06:20:15 -0700
Message-ID: <f18f762edd7ffa02ead1f382856066d2157015ed.1745356684.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745356684.git.steve@sakoman.com>
References: <cover.1745356684.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 13:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215297

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


