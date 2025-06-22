Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2948EC7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.27805.1750604538043906090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tKlYfTfi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so2575298b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604537; x=1751209337; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oYW9m5R0yi0DyW5JScPErGdOsTYmw5tqQKjJjnRhIRU=;
        b=tKlYfTfioEwl9l2dLws7kyof+CD3bndQvmu2X8KMpKMo568e/BHfcilU+OeGZFmPE2
         /O6iEbED+y1YkK3yZDZDOx6u8rmeU8Dqxt6L+GdMO9kjEZSiRZx3gsPTvMJ2Z23fGRyR
         hUewfW4FPaavfpOdTtiqoQHH0AdS8bVo0jYcCVVsTbSHqQOHB0yt3boqZS59m8+NDA4u
         8YLWKeqAqfJsAQlLQaCL8dNgg4drvxoJWf/Inar6x+fuCChSG3Dlqlfl0Rj6n2X2NYpM
         tgWMm6YS9H0T0ApU4q1JBr8gRNuUjJmsSKPrjcfSdPHFHIBRMUjKKexrVc3GH8BUTe7O
         HyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604537; x=1751209337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oYW9m5R0yi0DyW5JScPErGdOsTYmw5tqQKjJjnRhIRU=;
        b=PqGSlNm1mGcyNxOJ+Yca46Ngyi7rEK4huDg+SHu79dDAI5nj1dJE1WtYIoUVbCGOu1
         xMSRZa4infCyiOlq2DHTRK4hqdrw8WShYqFWl4hxIeQ5g10dnff5E9SgJbguKxpAfH17
         y4TH4dMEvMSK7mDnp9x2Ld2BYawF4p5OCu3xUtzHsmBsrWC/Wl6FGUmiYVRIsvBKY4pZ
         VUeT3XDgS6cgkPv4JEXaw8mZ93pLTUEm/xiWE91lPDViQdh5BBAeqsROWa0Jlssdeeuz
         l5/SMMFLRB62yG/6dQMyq1B6iHcgr6FmMG7lwkSkcGRN9IkOZoBe1oiPxbxChMcLggf+
         3KwA==
X-Gm-Message-State: AOJu0YwrW7xCkfZu5UcDGbF6SKIXBoU8d5OQ5mUWJ/LywaOdAQd382Fq
	nX2DW5fRlTm8TTPgdfWcsLo5d/upM0sooY3JnW/Z9LR74XCPpsOq/KZ5HkeKzhGzkQXeYVwmOGF
	ly+Qt9yM=
X-Gm-Gg: ASbGncvpUqDUEYfR0Ub3WZf0l9eVF0iinmxUC1Zt4vgx+WYz88TMoFWlLaQpNqPTPLj
	FG3wwuiSWF4zzh+o0x5eceWQGH4tKVpxdxZ4wEvSvLBVmRVAVYX7kEpUe1KINEVyxvRDdpB/Xsd
	4WCDiQ4tuvp1UHiU9J6TbKr5n2lBcrQ2IQ/hfcjC0zpJndzLUBjhIAw67EhwVHqIdkGEi3fMYcm
	qYCXwZ99xqaGHxfSe8RKGV0n4RT4cJR4fo6hMYCShJd5g2YBrbJY12TaPI93COynZz264wj8JUU
	psYv9L7/OYKhZNrU60s35sGT/J/zzq2vikqFy4PFbrnyRdw9/tudbw==
X-Google-Smtp-Source: AGHT+IEUOfCxRBnmLrSJ3BxPt3GL5yxFC0ZLLf1csdNqZqKwFwr5BYpo7j2CirxZR4WJJlDK0SFQZw==
X-Received: by 2002:a05:6a00:8783:b0:746:1c67:f6cb with SMTP id d2e1a72fcca58-7490f4bebdbmr10718503b3a.5.1750604537205;
        Sun, 22 Jun 2025 08:02:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/14] libsoup: patch CVE-2025-4476
Date: Sun, 22 Jun 2025 07:59:56 -0700
Message-ID: <4cd294674ed05e1b72e722b46ac1e2b5f3603460.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219180

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/e64c221f9c7d09b48b610c5626b3b8c400f0907c]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4476.patch       | 38 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
new file mode 100644
index 0000000000..cd5619d620
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4476.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 67aa180612..83ed88e785 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32053.patch \
            file://CVE-2025-46420.patch \
+           file://CVE-2025-4476.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


