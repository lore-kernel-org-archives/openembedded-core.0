Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4888ACA0FF7
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:29:59 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.6624.1756330192869050956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3BOCyx1m;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2449978aceaso2338505ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330192; x=1756934992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jy7uYL21o8BIuRvRldGJU5+7Fs6VfwtbXPBD9iW3z9Y=;
        b=3BOCyx1m13Av6fugk0vjMdFbc7A5CxP4wU40CL4nxL92pEGFUNhkdBOltzHBwzO+/i
         lx7OL4PGGq2yzPhL5g1G9uXE2G7WkQK/Arh9OsCQoRPSIg7wHd4Bx3E3vs4Yku/NmhHs
         TJKezTkRaAuwUP0qziWaxCSagLxs9WWeTAOUqfE1QDz2NxOxj3mdhAffoKN6XToh+eXL
         vKN8yNe/sAgI5YbAxqQKoQ2QBzKBlv86gLxRRv+YxqY9hiPzPiGckHhG0wtY03dss31F
         XRZBVA2PIQ7gj9hr7Yf7+d+s171G2d1hHujddl3tVj/mPC3zPbZY1lOE9NRwXmT/vRHP
         37Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330192; x=1756934992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy7uYL21o8BIuRvRldGJU5+7Fs6VfwtbXPBD9iW3z9Y=;
        b=pmwrXmPdTqGQPj/vR1yO8Wd068GwZhPG5WyzOxZZujsPuRQoqv2x0HW9iYdKMTBf/o
         5VXzJuEX9Okxwh4ltG8Zmi7TiFB2lxul/UikW/C/he/9orr4OuVHlBLdjduQH+0Q+dAP
         SH8wA1+fnNwB1rvb8jFRyHM8aLUDBjHrP87cYg8wJtTJl6bfep7bjmnjDTO6Zz2++bkF
         KT5h16goyPokhG+thO4Ve5PqH+F8INHZGQOvMaAJ36mafKZtUtFmeXCMb2XLOoQDnfuC
         KDSH7ZIgBNyTcZH8PBn3a8U9qjU3x+5SA3XAo9T+Y7jZdmn4lcUpacIf+UXJtK3hGuLc
         YSdg==
X-Gm-Message-State: AOJu0YxkeppY7UboIjg/no6onGOmpMxZLKeQvMTMhOYAS4xdJXFAN+fH
	6lwC6ElVGkZ3anhRMHdk97pO5DOvPq2esOgHVTSsXpxXn2EJGCaaTitzxcvrn4sJO5zYkTXFuT+
	ZX0kV
X-Gm-Gg: ASbGncsHboVaBooUG5Y4htnrtoopmJUo3tKJgExvC+4RR0bPOcO113oQxYS0rmzwuSI
	HTpu5/1zVzr8DT91+jBdmf0BeBdFaHBSmTBrptGZ7e3P6Pi0SdpR5wV7P0RTKbnBjvlIVZsiwDW
	juUYa5jvQ0KoS8H79rvFL0Rd33KwH/FUPMb9829n6F3plQaBzdFSvniDGPV7ShP1EpLBsLQy4Oe
	ePAjForI1njO6BR20Zh45HxivnxF4AihaDRKzPHVbHr78ElCJGOE/I5G2F9toHoOXdypdyW+Ftx
	5A/5CD/nqT8cHJ1HOQYHVBWJ0YUXUx2Ui7sec2C7yRQA0UULQSENbsXyUfNrclUcsX86OjgWKcZ
	7y2gHbLTas2kBDw==
X-Google-Smtp-Source: AGHT+IFHPBL3frXu8HAe/U5DBcWjTmfG3K34DJYlHk2kyMY1SX/gH/yKUAVYJBYIJaQOzOIefS6jtA==
X-Received: by 2002:a17:902:ef06:b0:244:9c27:9829 with SMTP id d9443c01a7336-2462ee0c6edmr242385415ad.10.1756330192112;
        Wed, 27 Aug 2025 14:29:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.29.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:29:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/33] gstreamer1.0-plugins-base: fix CVE-2025-47807
Date: Wed, 27 Aug 2025 14:29:09 -0700
Message-ID: <19eca5d7373667dbacd02a2c1dd8c9de8101cd34.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222510

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9e2238adc1cad1fba5aad23bc8c2a6c2a65794d2

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-47807.patch                      | 49 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47807.patch
new file mode 100644
index 0000000000..11a4d49583
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
+index 035068d..72bf104 100644
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index bfc6bb65ef..2eff864022 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch \
            file://CVE-2025-47808.patch \
            file://CVE-2025-47806.patch \
+           file://CVE-2025-47807.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.43.0


