Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1628C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 10:52:01 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.73392.1747133516284802080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 03:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QAaldMA3;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7410c18bb00so6269068b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747133515; x=1747738315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDZa7pik10N1bkpX2WDOrF+G2GxIiEdNUuHr9phAYgw=;
        b=QAaldMA3FqLea4gHY6zXVv0+TEThbsmm6kUWCjKSNOWkaghnaxCF7VAruI54vQMhzp
         A/YcI7hZhhJHjqivSQXF5X4jgmBEmOcIYEJg+zuaquqLZ35R1KMkRIvKVOiA4emOb19R
         g35n0HvtR7HNiaSHyChelxKVHeCRbUhdDyHAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133515; x=1747738315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDZa7pik10N1bkpX2WDOrF+G2GxIiEdNUuHr9phAYgw=;
        b=IClx/0fwoATGF/PdW0OUxYzOOQKesweqk0ixacwgdO7k8/sdw+Zz9FQ1hr7vrw7gXY
         ao4IoL/YP+lWoDvt2Z/HzPFYEcTB2kK7DfRlIUlR1or9pD4liHCPRlEjklA62v59fj2r
         0DHkAuyD7xw5w7kZimLzWL1oU36vyDJyrP5g+ftAgq7OkfFxMGvQbyM8OfuEhnOeuurc
         GmomIhnPqhGzgbWV15C747saRQjuhRUFpgSPr2KwARLnsGIqDoO11XDzlV0I78Ah2jGX
         60dVmpHdwgfd1XVk8JQqPQFpAQSMQ9Ee7/Zu9zE1+OQSadPVFOYU4RO8rV8/Bc4ixovJ
         R1nw==
X-Gm-Message-State: AOJu0YzfwA5nZIdgU7rNL4DM++1vL+aa0fBtHgiHk1Qe9AjKRh3VdBEK
	49j9cCvHBSm6eAZQ29WicJ6c5JI4hiP1LMkIrhHrV7bfSra0XhOcvg7y0wUJRGP/cODdpFnMw38
	9iaI=
X-Gm-Gg: ASbGncsH+LyNFo85YbXVJoXY0xNmd30453zvOnVbyvLhz6WVYd4VAU2e6ujnLrGJIT7
	KpPhdBKEu4ZhLxGcHko56Qa83zKc1XomRWvXl22a5xP+NZidVJ2dM6bFWnAoArN6VeRZJwEg6WP
	mZE0M3we3abd+ZHXOX2DU8iaJkSHG+YRtwPEd3srxtyce37oonw03v4WyeZ/eUVCUyLcHE2OBzL
	i/efEx/EX60TAqT0noKL+LYS94MVdFjx4hsEsQ87hNEiSoFAd95T/DY1uFPvzzId6qxk+FFW/LW
	0OeIWoHoAsoIpFtMucQ8VhJdRxzrWwcyTsUr626HDaYzm+qmWgL2CFn8nJHoPL0=
X-Google-Smtp-Source: AGHT+IEtoSqLLbJKRB2C/qRFccBIqSR7soYNAsnIywXtBZwJrJGjkl4EPB2dPVHdLfgenwvIkrVJ2A==
X-Received: by 2002:a05:6a00:190f:b0:740:9a42:a356 with SMTP id d2e1a72fcca58-7423bd5544cmr23168242b3a.11.1747133515204;
        Tue, 13 May 2025 03:51:55 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d861sm7796759b3a.147.2025.05.13.03.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:51:54 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 6/7] libsoup: Fix CVE-2025-32912
Date: Tue, 13 May 2025 16:21:28 +0530
Message-Id: <20250513105129.2284690-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513105129.2284690-1-vanusuri@mvista.com>
References: <20250513105129.2284690-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 10:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216415

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/cd077513f267e43ce4b659eb18a1734d8a369992
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/910ebdcd3dd82386717a201c13c834f3a63eed7f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


