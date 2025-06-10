Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D64C71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.91294.1749571767063396065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uuj9UYGH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235a3dd4f0dso39154005ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571766; x=1750176566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfARp/cjMYY+cmOQVPMhHspBTdM62bixLhapwQ6Vbxg=;
        b=uuj9UYGH2haNzRTgXKwpg7qlPP1Z8E9vvlbxfKHv2+oaZpaJcuAfxkfEIOXUvCcaZX
         yxDHSKT6nlX7ttxmmKqyFsDpyWI/x0yLMgx0+WXOY/GIZcECKQ67Wnqu+4QEfk7J2f7B
         g2iarxAXliHu58ev3vvwT9damtGFv2lnMwubzSh6WssCdSefnpEzCSP+9yNcriRBTijj
         k0YjF39kDR1kdqrXKpGMODGT5eo2wH2DJkADQQxErY70by0VnBLN0a3BrGWIGfcoYRNW
         toJNEyMt5qjt/PiiNTmUFRHsdzoeoqnWFYRQ9qzxMbZgiDZouBovKHl18Fcb5drXEgMc
         nVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571766; x=1750176566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfARp/cjMYY+cmOQVPMhHspBTdM62bixLhapwQ6Vbxg=;
        b=F7p3B2uY52WoLcuUZqWaLmLKwVXkGzCR5YsjN9mcQeYYbi4OBWA1RPFQvCy+7sfpVC
         ShHJiwtZ1MmF6D7l11vwpzCt5xs36v+JCMF68HC6capMNsvzH+alCyyVHTS54IYTGVTD
         HV+4nCfDz6Ht82BbA947n3l2NEUVrMRElmjbK7rMQGeQFkQDRDBTYaG23uAlYVZFklUy
         OetaY3mjmPQVKen8CP7LChd6+Cs6BlC/LS/tDX09cNw8cRzcrt3eLondCHuP0suZejlF
         ROSUMrASxj9YzABdShq8HlaL1x/KNWD/MQpaFzgPrpgzUaELmidNF0bvBSSANjiI1Awl
         rWpg==
X-Gm-Message-State: AOJu0YwqOY/TIFEcmRjsotRMOU8pRECo9yJbtaq0Ig6ifUpB6ipa6kJ8
	TZcHiVjQXh0oblcCdzb0D4r7OvE8EU9E490vclm1eA+BpQobkyLuFIaXLzx/j/jAry8RgcQV2Hc
	3J7qk
X-Gm-Gg: ASbGncsIZ4CW/rnyyHaEEzoG9QCg1XhnpVeXhc84DLLHx0rSc9UBOgefT04eK3cvDk8
	nduufUeHJcD9AqLB1IrLqvJnsoS1VVv0S7S2f+7Mn0hp7TqvV9/MDTmnNhLFkDmjutQhq5JNyYb
	jNa9wizB1RLbn7PrjgtcQjDXYrjPHfTBhmMYfmb0PGKWPxPGEzgi03/XcukQJxuCtPbuZO1Pb8M
	OnMbUUW3ymPlzNIkqiin6JuUmWUUmVHZpaRLG+fvBa+oWZAIyH9DGnOwo16CFsSaOuRPuhoohxI
	cycRay0glP77nh35F+cqXoTJiTvNGew/rxpbSyJjy8o4q3SXKCSjRA==
X-Google-Smtp-Source: AGHT+IHz1ZbqDsMU2M/rI8VEDQXjc/O7UJNp27zs0CTd9NpIKyj6sFAOGqh0WXqYdWxojqBto8/Qfw==
X-Received: by 2002:a17:902:cec6:b0:235:6e1:3edf with SMTP id d9443c01a7336-23640cce164mr6335425ad.34.1749571766072;
        Tue, 10 Jun 2025 09:09:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 21/32] libsoup: fix CVE-2025-4476
Date: Tue, 10 Jun 2025 09:08:34 -0700
Message-ID: <0b93d8cedfd102fcd723786b975a5cf684c2b0e8.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218390

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/440

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4476.patch       | 39 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |  3 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
new file mode 100644
index 0000000000..d0b1f12709
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
@@ -0,0 +1,39 @@
+From 71d33e37139fee6216ad2bf4e926f987076a6cff Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2025-4476
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/457/diffs?commit_id=e64c221f9c7d09b48b610c5626b3b8c400f0907c]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.c
+---
+ libsoup/auth/soup-auth-digest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/auth/soup-auth-digest.c b/libsoup/auth/soup-auth-digest.c
+index d8bb291..292f204 100644
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
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 2faf50c223..2bed009e0a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -12,7 +12,8 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://CVE-2025-32914.patch"
+           file://CVE-2025-32914.patch \
+           file://CVE-2025-4476.patch"
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
-- 
2.43.0


