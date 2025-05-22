Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7036C54ED1
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:00:58 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.20538.1747908050577646018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aNh3WkSp;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c9563fd9so4063313b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 03:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747908049; x=1748512849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzftsR8YtwP4iIPzSvvkc5FEwRWxGRA701zFLcfHcG0=;
        b=aNh3WkSpAHFESUJRf48tcUn+sn0+CPCnv6rZlEJbboP+YrXDLVPyHGPZytqil+56Np
         qlSQV53kDryTErxlv5n792k2hUb4MHG4tO4imqZvbhhQdYNzrtqpc3DdwH8XgCjrlVoV
         eu5KrLsmpT7NFp8Oeb2ShMSxxn1srUQaAugrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747908049; x=1748512849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzftsR8YtwP4iIPzSvvkc5FEwRWxGRA701zFLcfHcG0=;
        b=eG+Q+3Yh2xXG4HRGJFhW9wC83qVLEq9Z4X0+jn96MSVv4zbTy7vEIcPl7SofphqwBj
         WmhTXIvleWsCyqc7nd89FzYo7eZnYVBoHJg5xvEncSJsLc93qh737BK+Zv9/f86jOVJ8
         5NO9A8k962PCOD/Y94/j8zNgwAqlMFK00po0sFPu5zeCoFIdLnIPRzOXtNOYDdGyWzMp
         IVeRpuzA+YiIgVsABH/6NQyP1nH1ESatKiAvUW1pEK+MoygkaDHizuQGwYLY62hjWde2
         R2pSZMuyYEASbGekjnyMX4qcGY6sxQunycA+NA3KVtU5sTmsVD+pWjI6dspPAr27/MhQ
         4jMw==
X-Gm-Message-State: AOJu0YxIfSkX7jlPkBRl6fxKPVBX9z4nCJrdnkjt4YP+aOQYb36Nnq2A
	u42JX85JUlZLTv28uyrQIpUrYngXnB3l/nqfZWeVvkxPcv5/jmvC7t1O77LEWkhpGmLacU+Cr/y
	coIQrUI0=
X-Gm-Gg: ASbGncsk42tANGag/zTLnu+tA6AMDN9eOOujAEIcC3P2Nf9Cd5p2yqemnVQF+pnW7An
	5sfKMqrrhrKQxcPTEaFalxnGZAhZ/jcjxHk7wSuwBQrCfuOKOvWPCMXBcRWayWpW6XIvqdx9k2a
	k3xkG45mo/xNlGV7E+NR+KV7kKUZv9lMdRPgyPButAf0zTAmdt4tlVdjyPUpcAeRszJpIeETqoh
	AG1WJ0ziibeh1VdVPD+L+5k1+xHl3wErJ9v/yzb0wWL3itKsDw52iNIsDUZQxbQrr5wCP6Aod0e
	idaNf6rYKDljuowGZuUrFejCAG8r+iPUf+M+iz4mf/TAEEMy11V/mbQ1jvUzIOg=
X-Google-Smtp-Source: AGHT+IEmqQf6snxF8X1bchV73c3bs9ri68CC7oZTsbZFyo/8swiFE95DC8qH70yC4RndPuk4CikC2Q==
X-Received: by 2002:a05:6a00:278f:b0:742:acb6:b7c3 with SMTP id d2e1a72fcca58-742acce03bfmr30377427b3a.12.1747908049050;
        Thu, 22 May 2025 03:00:49 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b80asm11001814b3a.116.2025.05.22.03.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:00:48 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/4] libsoup-2.4: Fix CVE-2025-32912
Date: Thu, 22 May 2025 15:30:27 +0530
Message-Id: <20250522100028.76782-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250522100028.76782-1-vanusuri@mvista.com>
References: <20250522100028.76782-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:00:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217077

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


