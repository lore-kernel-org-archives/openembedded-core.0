Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE1EC54E90
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:53:57 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.7386.1747821227461331097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 02:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=AeMpw39j;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73c17c770a7so7116154b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747821226; x=1748426026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsCzspfX8wbHiSSdRhdUui5rYfTlFV6XR2q9/7RCfHg=;
        b=AeMpw39jO1ImRvW7/taYoaaGqBGEHEn5MNkYZymixW9NawrUeh6BnlxKMQOuoFYhTY
         vrmP/FgQfVTyIhwCtPbpUAPVYNVPtqygfk81ySqKyUTC6yoY2mCogbio7JlbUTJxa0D9
         YDc4my58/FiEHOufjfh4nc8W53aXXABizLQNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821226; x=1748426026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsCzspfX8wbHiSSdRhdUui5rYfTlFV6XR2q9/7RCfHg=;
        b=vqr8uf1b7BG06BUJiCDV0hTPQbmmLmtbegpTufUH66qG1ShlS/C1Z8dcDOTkRAwYOz
         OFDWsltMlqrYlqpVoawVRH/EDoKAzLm1AlkCaD8JlwvhTEhIMSt4vAaK5/Kno8BHxeZU
         8nwvxzfRi9njSZPAww10Si9+pjfxaUKM9Srs52c89SE6BQsDok06vtyyo84ip+38z5zR
         SFu2TSZcizHGq7E+EPxBQaMTcGDW5uHoOvTbTRUED72Ek4o5OqGUDj/yRwT4EIS6diWS
         zqRhrtPbxv33V955iWrLlqS2qtU23Z4KXmQcCPn/ExmVM3zs2yfnEtxbpIsHUhBv0H7a
         t7QA==
X-Gm-Message-State: AOJu0YyEGy9w30+anEG9fpNRcWtMZnvMmMj0R6+Ot6QvOCSux0OJiKTx
	viStefzMrVTFzoJSb0uxbWMHBr6grZb/0vQFaSA0r9OdwRC6ioGlfgQ152V61GS3KLVRoHSoixK
	ORonusgI=
X-Gm-Gg: ASbGncsG3O2nqbrujN9fHHU0FYlvV+tKnHsTfVWlgwlMT83ipBkdzT9mJTb90yJIxIG
	HzFZr8LsgfYsUkrEFf1JrNiCqHrmS5HMuD3gvyPqQYdJjyRdlMTPCtZOmB29S0FWlxMNInjewzr
	Notu7kg+Yujgr1Hnhgwrq6ZWy1rLSgoE+zuxKyPDmNZ5mDENYbj48coXVNIs6kBrC37QN9c4X2b
	v5Fc3jH9Xvw/81HpBjRZ9ExdMguPwljXKQlsAnBxutxLKlOVhlydnnJhXSTsbeb1Bk2ObvQDB0c
	8CvI+kUx22Nx3crqpyFkpOc6QApZ6clrIzmXNMeKFQy1/Qc0EStotBMYV8jf8Tf5/hRxgFV6G1I
	DBuoYEwTw
X-Google-Smtp-Source: AGHT+IFTuPO01fekHuhSbuWboRWdiMM4lQTCMP0qqwAfkCMtFpE24IY1mQuFgCdxZtokDkQc/YQ0PA==
X-Received: by 2002:a05:6a00:2da5:b0:73f:f816:dd78 with SMTP id d2e1a72fcca58-742a98b2e69mr25533543b3a.15.1747821225883;
        Wed, 21 May 2025 02:53:45 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.212.152])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829cb7sm9241325b3a.111.2025.05.21.02.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:53:45 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 3/4] libsoup-2.4: Fix CVE-2025-32912
Date: Wed, 21 May 2025 15:23:23 +0530
Message-Id: <20250521095324.92028-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250521095324.92028-1-vanusuri@mvista.com>
References: <20250521095324.92028-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 09:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217014

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


