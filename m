Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56108C44506
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38586.1782742830007536254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PDTtIUxs;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46ee68c3b7aso2892292f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742828; x=1783347628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUxj24+ewkYyKmnI56d56ri3XU9iJPknrJYvnSwWAiQ=;
        b=PDTtIUxsezZREv0tK3W1nSgLwB/J8pF7pt0dzoCAICNBS2L8jR8H6ePI/uNz+h2Ru8
         Nqhy5BVsN3UdvLWMs3YZJNaHRk6y/RSYZlVZBQq1BNeg6rMER9EOlRSLYWwRICCZBEFB
         pAomEMQGaJY5CG59EFUyAvMF5vO/YQnRjbeHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742828; x=1783347628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DUxj24+ewkYyKmnI56d56ri3XU9iJPknrJYvnSwWAiQ=;
        b=cnEfGYH/v/54NmY7POsF/Tpg4JzcF0x6vLWBNkGRngZqnHYGlCgr7vX2yAoJZr9KiJ
         kZQ+vcFflZxfHLu55rspGlqQuKxlMvxyyi28gr3S5+0BV6rW6i+z5p3mHN2vCtf2/m5l
         6LayyjqgCaWwkSVXwITaff2oW8XkrAJol9l14nfDy6C5egiw3acx/JkELSZDz7jy8eLS
         0eQnJqJWo7Cvpm4Jk0WWs360u5Ad7u5qRvia929PnxGwOviiKuPo3DgR+IuG88+FEMoH
         sORo+lzPW3+0JTA3dpmvKv4WKjZccqtxCRKK83nlL8J7zHg3AII1FLrm8zuukwlcwIzz
         vF6w==
X-Gm-Message-State: AOJu0Yw8yJOIsYFJIzrJPdVf+4ywmH1StcXjwKYhJEWMbl1Xo0YoydB+
	DUtnuRQ0O30p1S9yfMbaLu532ldVrt0GX3AiDbdZu982cJ/qgGnJDJI7h3oXqigwjkpTItFNJeB
	Xgxzzai4=
X-Gm-Gg: AfdE7cnCozsRtJGOYP6dxDX0DCwh5y5ofsErLtTQg6A3sn3yhW4/xGUyvrkX0NtSR0f
	A0H2w4ivGvFtfx+jiHMblxMc7NCbfKTVamq75eygXv6iNof+8oCBDgKG6P85CiGwW0+XoMDvgBQ
	yf/bJlo+H2pEdiZRZC29/uQUWOMsaa+jCsfw/sdRvq1sHwYLvZZULDjQD56sXOOtJnLGrQNKmtV
	EEZuy9RpsT+egXRrDk6WBhzD2+EuYB9gUthZYFPRDKXGjwuV66URor1dgzuvDH7g3G2zBKQV0Kr
	k6z9oQo7bTqP5j9vnt/n6qXRFU3Axx4NWmWAEhfi9oliDSemN3Vq4hkWOgPNmU7F5RNMbDSPXKi
	SMdAaAjblUQn7jJFbjuy7whHaaqkL0irz4czhy4rPdKOluCmBH7msp2jfEeJTJIOgMW86fa0T+h
	7DHBOxyduBCAbpU6T8oHdnAIhcolz8vC94OAXSEDkD8/IMEm+FgmgQfhep8mO732JbdJWZNaU+C
	FbiEpqWliOh1K2pUbaXuew=
X-Received: by 2002:a5d:5f8b:0:b0:46a:bcab:3c2 with SMTP id ffacd0b85a97d-46dc18a453fmr24226812f8f.34.1782742828116;
        Mon, 29 Jun 2026 07:20:28 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/19] libsoup: fix for CVE-2025-11021
Date: Mon, 29 Jun 2026 16:19:50 +0200
Message-ID: <f360fdedfb500cecf6d4e860d599c57b11d6e31d.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239793

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] also mentioned at Debian report in [2]

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/9e1a427d2f047439d0320defe1593e6352595788
[2] https://security-tracker.debian.org/tracker/CVE-2025-11021

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
[YC: The CVE fixing patch is d010b0bbd in 3.6.6 (current master/wrynose)]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsoup-3.4.4/CVE-2025-11021.patch        | 57 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch
new file mode 100644
index 00000000000..9bba0929b7d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-11021.patch
@@ -0,0 +1,57 @@
+From 9e1a427d2f047439d0320defe1593e6352595788 Mon Sep 17 00:00:00 2001
+From: Alynx Zhou <alynx.zhou@gmail.com>
+Date: Sat, 11 Oct 2025 15:52:47 +0800
+Subject: [PATCH] cookies: Avoid expires attribute if date is invalid
+
+According to CVE-2025-11021, we may get invalid on processing date
+string with timezone offset, this commit will ignore it.
+
+Closes #459
+
+CVE: CVE-2025-11021
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9e1a427d2f047439d0320defe1593e6352595788]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/cookies/soup-cookie.c | 9 +++++----
+ libsoup/soup-date-utils.c     | 3 +++
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/cookies/soup-cookie.c b/libsoup/cookies/soup-cookie.c
+index 7c41b1d..5af154d 100644
+--- a/libsoup/cookies/soup-cookie.c
++++ b/libsoup/cookies/soup-cookie.c
+@@ -726,12 +726,13 @@ serialize_cookie (SoupCookie *cookie, GString *header, gboolean set_cookie)
+ 
+ 	if (cookie->expires) {
+ 		char *timestamp;
+-
+-		g_string_append (header, "; expires=");
+ 		timestamp = soup_date_time_to_string (cookie->expires,
+ 						      SOUP_DATE_COOKIE);
+-		g_string_append (header, timestamp);
+-		g_free (timestamp);
++                if (timestamp) {
++                        g_string_append (header, "; expires=");
++                        g_string_append (header, timestamp);
++                        g_free (timestamp);
++                }
+ 	}
+ 	if (cookie->path) {
+ 		g_string_append (header, "; path=");
+diff --git a/libsoup/soup-date-utils.c b/libsoup/soup-date-utils.c
+index 34ca995..ae5504d 100644
+--- a/libsoup/soup-date-utils.c
++++ b/libsoup/soup-date-utils.c
+@@ -95,6 +95,9 @@ soup_date_time_to_string (GDateTime      *date,
+                 char *date_format;
+                 char *formatted_date;
+ 
++                if (!utcdate)
++                        return NULL;
++
+                 // We insert days/months ourselves to avoid locale specific formatting
+                 if (format == SOUP_DATE_HTTP) {
+ 			/* "Sun, 06 Nov 1994 08:49:37 GMT" */
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index fc4a286dcf0..8fe3775e1e4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -51,6 +51,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32049-2.patch \
            file://CVE-2025-32049-3.patch \
            file://CVE-2025-32049-4.patch \
+           file://CVE-2025-11021.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 

