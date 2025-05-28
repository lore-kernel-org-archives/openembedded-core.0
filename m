Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B5BC5B54E
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 14:43:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.17593.1748443414351109290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 07:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g81DuBNO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2341814895bso36413425ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748443413; x=1749048213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WMrM9TsXwBuW+aYuAoHbQ2WsdPLOlBZrutw229olbY=;
        b=g81DuBNOyllrS5koKI/7HUEVcc/Smx2qtSPexH8nHUU3tJR4UrCECH5c5y0npiHGVh
         HPUxHnjj/zjfia80jWVzKC7qchF5dkhrx6p5M5tFb02VauN9IGlDxEM71q9E6af6KEjq
         EEpUtw4zSJiyJnQWsVxUQ59lGDMlhSgpUHYYRzFmE/og4h6tYQZ695EYG25thTGQ3bs1
         suhAmDZmRtVjoJ6MReu7JoJK1peYhOen7EfuMprq2HNPwKecO5c7NF2g/7Es31yMM/RB
         UzMMNvavhEzlMG8RNJXQ7lnE+y1NznZuiAfP4C1LJTlK8Q5GHtvpIRAvftZXhlx5LNM9
         Ggwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748443413; x=1749048213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WMrM9TsXwBuW+aYuAoHbQ2WsdPLOlBZrutw229olbY=;
        b=dCDNB94ScAANcaPSya68n3GP+57ASzN1AUkffyk6ZgP5Sh5+JmB2vxnmSQ4edQKraE
         G4sEdJg1R3xRQLQiDTr892dsZ92YpA54PKRXvQRrd03LuLPqrHKd1bIv/EnvNInIdNsQ
         r78XX7hzw7XArkhIKGS2ABv+mcmDi01vpmn4ibtZRzSKwotXtZPKJj6/MaCne8KnOrVh
         KY12IwJeBBtK41S5Brv87v+8OyQm82ZDoC6rvHeclM06D2HiThhK2ewTspq1ggtXapPE
         h0Bkmm17Q/KCYGRDnUE+TuNX/a2IcMq4KFajIp/tIgF8ISHHVca8sNrr/Un5cS5CCVix
         2OsQ==
X-Gm-Message-State: AOJu0Yxz9EgSGduUjHRzka3976NUbiCCaCXQQ8tGpnL0vPSygRv6Bppx
	TR9jnQzc2kmgGElyT++d0rC0qCoMNNqMGGjM+o+8LoKw+Dk0YRMeaoJMmmt2JObvY6HCKzvn2C5
	XkzNz
X-Gm-Gg: ASbGncu/gVf5bNikDCv6qu9yiVI/Nbwq6b0ccorNJzlB+4NWIaCWDssh3gXiPlgQHcY
	OOUJqfFbjUDr9EY13ARvECxMgDxl8vwLMUXoCMmiY4TqUop2O0SVq/IdvVcXbUI0BZFk9nQRfoC
	N7nz0o0rauXoHJc1iGLCz9HFh6sKH6l67urYoMDkEI8qQ3JS8qZP3lfE/2YEL6NZxvNOayqKZXW
	5i5a285w3i1JrjNvuUhi/B5dOnwX3ThLJ8pgG/IjOIoau+v9sWtT+Bgz1PivG3kDCS8/Yrvd5pY
	O8uMngliS9kX30GGBz6s0dk8OaW9Obar/z+jbD7bI0U=
X-Google-Smtp-Source: AGHT+IF4msbJpcMFJ8Z9rNsXfcNa5UCKIKew6akjaoOpS4xIyU1PYQhz0LfBFTe3Dpm5HA2bO+dWvw==
X-Received: by 2002:a17:902:ea05:b0:234:e3b7:5d0f with SMTP id d9443c01a7336-234e3b75fabmr21459375ad.0.1748443413555;
        Wed, 28 May 2025 07:43:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d358f1e2sm12626285ad.140.2025.05.28.07.43.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:43:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/11] libsoup: patch CVE-2025-4476
Date: Wed, 28 May 2025 07:43:10 -0700
Message-ID: <91231813d04680f93a08cb29540073bb4749e22f.1748443238.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748443238.git.steve@sakoman.com>
References: <cover.1748443238.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 14:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217359

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4476.patch | 38 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch
new file mode 100644
index 0000000000..cd5619d620
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4476.patch
@@ -0,0 +1,38 @@
+From e64c221f9c7d09b48b610c5626b3b8c400f0907c Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 8 May 2025 09:27:01 -0500
+Subject: [PATCH] auth-digest: fix crash in
+ soup_auth_digest_get_protection_space()
+
+We need to validate the Domain parameter in the WWW-Authenticate header.
+
+Unfortunately this crash only occurs when listening on default ports 80
+and 443, so there's no good way to test for this. The test would require
+running as root.
+
+Fixes #440
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c]
+CVE: CVE-2025-4476
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index d8bb2910..292f2045 100644
+--- a/libsoup/auth/soup-auth-digest.c
++++ b/libsoup/auth/soup-auth-digest.c
+@@ -220,7 +220,7 @@ soup_auth_digest_get_protection_space (SoupAuth *auth, GUri *source_uri)
+ 			if (uri &&
+                             g_strcmp0 (g_uri_get_scheme (uri), g_uri_get_scheme (source_uri)) == 0 &&
+ 			    g_uri_get_port (uri) == g_uri_get_port (source_uri) &&
+-			    !strcmp (g_uri_get_host (uri), g_uri_get_host (source_uri)))
++			    !g_strcmp0 (g_uri_get_host (uri), g_uri_get_host (source_uri)))
+ 				dir = g_strdup (g_uri_get_path (uri));
+ 			else
+ 				dir = NULL;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 8cca980faf..d3a0840044 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -30,6 +30,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-46420.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-4476.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


