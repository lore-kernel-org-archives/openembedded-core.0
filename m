Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9B4CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:44:56 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.64676.1756215887112600139
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f7MXjgrV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b47173749dbso3926593a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215886; x=1756820686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FQ7BE10iOq1+Twz43DUUFVt24UFKk5zf78xNTy9vRM=;
        b=f7MXjgrVZAC6HKJwhvM7F4ddLZsVV9IC1NdNoUOUtOdvQTUwTfJyP9EVoYibpM2Cmu
         oVLEIUDVJEwmknE95wQICc1zh8u2YpUGwI6mani99GBh6t2cTGpY/LzDgA0DyZiySLJ4
         wcDS3s4P1jN181DdFpVutrq4XrG9tW9knm0GTCLBkA9JnDO7Qz/K+GLAU4+zWTwRf5zI
         PnWPQGjVwbXgTTFZNRgX+fT9GmIvh7MDmuDPOl/UnDWxSHd5Rq7l7721Nzkri92X+vqr
         DynXJOQTPgfDnU/sAANL0DERBwfoCLbd+KWlrGVlMGSoOOy01PW4YkVW/aV6+GyTlBOs
         Wt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215886; x=1756820686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/FQ7BE10iOq1+Twz43DUUFVt24UFKk5zf78xNTy9vRM=;
        b=gt+a2N2U+vbhtjLgwEDsJQBWRW10G+zc/WWD10ZscmoWYWzeu26W4Dzw+rDO37tkH2
         PARyo8ViCLpQD0x3y3mxdw/61n0GPa7lImgNIEB6D+cDn23n6BcJDf1rJVFSGNg/y7LF
         DuPK1IKcf3Vm7RjVDQh1+7MMSdauMUhLcgjoP229rUyQA72bV3dvSp6OPuOKnxEEVaRd
         MjUneiQlwSdRwqBQ7pkFBB8WNRW9SvV0POUkonNZtHdJX6Q8KrGyEgbjIdFK7KYi8Yvj
         B/QvzsYJ9gIyeC+UMa7rheoyj6XdwDHNLc3e5zQptxi57+W8QleUNaI0s7kAS52kAuQl
         Rdiw==
X-Gm-Message-State: AOJu0YzOP/qIN459w9c7J1M/Uk+kPsM5/fnHRK7Plg0hgrx1+AVk5gdp
	zQmSldKjr0eZr95iEW1uozQOqlq3RQS336nRXf8YlaJTsYf2gZt2TGXUboIViAJxCKjJibkHgek
	jU/Mm
X-Gm-Gg: ASbGnctgn0EsI7myIfra/SiNq7i1OkJdm2pw5nPzVeZETG2W2Iog7NjMMGRqDIQ4oKj
	4hf3wKSQRde/k0ukzIuwNiJTmX+8/3+Ev0+VcS72sovBzWCsr1WTUYuL+sEt6LLxFmKjDuGjG7m
	SryhkrHyYgbulih9FfkTNZJo989ao8r/oNaJEOzXv9BgTXFE1wCgMor1tRXHxaZR69oGvr3fuM6
	7OfD+6fWqBZMuSMRtkcr36jthiLtCXAYhdvm+r1eKoqfQA2TCvTyI9k75dG2ea/x3aPq1dWv7t8
	J1HFcWyH8dI8xeCfkmHJhfTksr8wNO6MGcNqIwGgdRI2OQY/E8Q0vwDZtRwRa223mOuG9cTDjqs
	Goal+eqJbkJL+UQ==
X-Google-Smtp-Source: AGHT+IFWYEGl73bUawFto/VvLo6ksEnMs2p1RtZHzHlgN/XVYeptnSIHFjktMKzyO3xDa73+0NNiqA==
X-Received: by 2002:a17:903:13c8:b0:248:6d1a:430f with SMTP id d9443c01a7336-2486d1a46b2mr24718465ad.25.1756215886288;
        Tue, 26 Aug 2025 06:44:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779fa9sm96941595ad.27.2025.08.26.06.44.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:44:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/9] gstreamer1.0-plugins-base: fix CVE-2025-47807
Date: Tue, 26 Aug 2025 06:44:27 -0700
Message-ID: <8452fbdee00d27f2390dafa9d2ef14e7458baa70.1756215756.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215756.git.steve@sakoman.com>
References: <cover.1756215756.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222466

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9e2238adc1cad1fba5aad23bc8c2a6c2a65794d2

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-47807.patch                      | 49 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.20.7.bb       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch
new file mode 100644
index 0000000000..03a5d938b5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch
@@ -0,0 +1,49 @@
+From 9e2238adc1cad1fba5aad23bc8c2a6c2a65794d2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 8 May 2025 09:14:15 +0300
+Subject: [PATCH] subparse: Check for valid UTF-8 before cleaning up lines and
+ check for regex replace errors
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4418
+Fixes CVE-2025-47807
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9132>
+
+CVE: CVE-2025-47807
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9e2238adc1cad1fba5aad23bc8c2a6c2a65794d2]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/subparse/gstsubparse.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
+index 81a7f65..5e8769c 100644
+--- a/gst/subparse/gstsubparse.c
++++ b/gst/subparse/gstsubparse.c
+@@ -666,6 +666,12 @@ subrip_unescape_formatting (gchar * txt, gconstpointer allowed_tags_ptr,
+   res = g_regex_replace (tag_regex, txt, strlen (txt), 0,
+       replace_pattern, 0, NULL);
+ 
++  /* Replacing can fail. Return an empty string in that case. */
++  if (!res) {
++    strcpy (txt, "");
++    return;
++  }
++
+   /* res will always be shorter than the input or identical, so this
+    * copy is OK */
+   strcpy (txt, res);
+@@ -1046,6 +1052,10 @@ parse_subrip (ParserState * state, const gchar * line)
+         g_string_append_c (state->buf, '\n');
+       g_string_append (state->buf, line);
+       if (strlen (line) == 0) {
++        if (!g_utf8_validate (state->buf->str, state->buf->len, NULL)) {
++          g_string_truncate (state->buf, 0);
++          return NULL;
++        }
+         ret = g_markup_escape_text (state->buf->str, state->buf->len);
+         g_string_truncate (state->buf, 0);
+         state->state = 0;
+-- 
+2.50.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index 05d58e83b0..6bffd2a872 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://CVE-2024-47835.patch \
            file://CVE-2025-47806.patch \
            file://CVE-2025-47808.patch \
+           file://CVE-2025-47807.patch \
            "
 SRC_URI[sha256sum] = "fde6696a91875095d82c1012b5777c28ba926047ffce08508e12c1d2c66f0057"
 
-- 
2.43.0


