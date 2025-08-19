Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8B1CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:50:05 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.4427.1755636602664617496
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aFA1VnMu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2445806c2ddso49790725ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755636602; x=1756241402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/ZroI2TG50qnCIiepaOWjdBIkqpWEwJEiB1f7oZ5bY=;
        b=aFA1VnMuggt5giM0lTJ7v5F1JZIklkbFv5mU7tWtBRr98/dYJ0b4w/EHTfHL9OkWWj
         GWBqLum01/2AR8B6hR5dr6SlQ65Iq9sO+wuJuFzkg/IR4l2GMsOQiVtFIiAbTWfu/ZEL
         TLjIb7zOTG1AL6ibtram0X/N/+GHoOVKSfnlCbMTzhAI5xYklX1xxGrTLvDPaZEB1ucV
         vR5UeAmj6CxoT8HsEj3ykr5+6BpYuaAJxCC2BvC0AORn3qpPg7uSnzAB+jEEmt9PKE9d
         KlHBEZq4kLohtFHR97hp9GHXqOXAGmFUb/aCCm9evOpOctjYcgzbkRsyp6/OrvdnH9RY
         zl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755636602; x=1756241402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m/ZroI2TG50qnCIiepaOWjdBIkqpWEwJEiB1f7oZ5bY=;
        b=T5iX/jOn+BkbfSsZ25SsIUd0tApVXYkKUm6qnYOgSLs8oXtp6+0Eu1R9IozZ+swzKJ
         L6lnGoioxzFG6nGwrDuSipkzhKDD0peJkmlYu9EJA3G43ZCA1ELnSjcOSHN5DWNBYY6x
         dopbte+Ff6+Bop27UsiXcrSFFbH4sP2KCcgBemiuVZbJFkJUinzha11xgVRkHBafnclt
         s0LWiuxZEJF5R/x1bmClwPJBSkZ5B0eXFVSsT28NF/yGcvakEjnyRrd0VIU6Ob9mem1W
         Tj+h/HT2lJxv8Lw0seLjDHxOwu60FhzYoOw+0zhIoVaT/IXrh4HazNsQUgnPHjn4Qp99
         D75A==
X-Gm-Message-State: AOJu0Yy8h/EQ+eIxlMmOHhoGe69s2dFSm7oieKSe/Cf5iD0jzRgmV28m
	pA7M0uTWHyVLd1tR7+HbY9c8J41BNMp52aen5bNH0+N6Tp8qjsVkseXpjzKLSw8Wom1Xak4new5
	p9s1u
X-Gm-Gg: ASbGncsTzJ9WBj7dgp5bdrUa+/pitS8+5hJQJuVuHNeCN9gak6ICzcwPcH3ZjPhtrdx
	Noq5Elymg9XmiE0m1gnBQqYI07TTa7D2AfceGZgH5dGUVqw0O2SNWZAYuDLRKoYKi8vSgaUZVE/
	jNx2C5OCIHqZ4zJ7is6TM/prbnrEtVXyp3KOmuc2VIxDTr7Sp3qYPZ2BgxFgwsYVL3HZjeKVgtB
	3T4pgWYApt/mnD2kmQRVUpJ5rZkLAXNfshJpE5188dyU3skWqkw1QKs1WDNazHVWHcYuXO8szXM
	4d2J4VKRsLDgSiPlSY+Y59CpEIjrcSyKxJBsL8nXh4UCD1ZP7azke5R2noyLTNfK0atXHq7r+ho
	QJNnRfB+816AP2w==
X-Google-Smtp-Source: AGHT+IFx0b+qWRQ+QOZWpTZhTlnw/1leuGHTzVz/+yV9JyDYJ7nPK8NLzT1Fg7qYY/DEU+IsJ30QfA==
X-Received: by 2002:a17:903:1a45:b0:240:ce24:20a0 with SMTP id d9443c01a7336-245ef0da78bmr3938105ad.11.1755636601872;
        Tue, 19 Aug 2025 13:50:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed33af50sm6179675ad.2.2025.08.19.13.50.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:50:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/9] gstreamer1.0-plugins-base: fix CVE-2025-47806 & CVE-2025-47808
Date: Tue, 19 Aug 2025 13:49:41 -0700
Message-ID: <974670b83970f78edcb9f7d09ba34ec3a327320a.1755636489.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755636489.git.steve@sakoman.com>
References: <cover.1755636489.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222141

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:

* CVE-2025-47806 - Upstream-Status: Backport from  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/da4380c4df0e00f8d0bad569927bfc7ea35ec37d
* CVE-2025-47808 - Upstream-Status: Backport from  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6b19f117518a765a25c99d1c4b09f2838a8ed0c9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2025-47806.patch                      | 50 +++++++++++++++++++
 .../CVE-2025-47808.patch                      | 36 +++++++++++++
 .../gstreamer1.0-plugins-base_1.20.7.bb       |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch
new file mode 100644
index 0000000000..530d579231
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch
@@ -0,0 +1,50 @@
+From da4380c4df0e00f8d0bad569927bfc7ea35ec37d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 8 May 2025 12:46:40 +0300
+Subject: [PATCH] subparse: Make sure that subrip time string is not too long
+ before zero-padding
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4419
+Fixes CVE-2025-47806
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9135>
+
+CVE: CVE-2025-47806
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/da4380c4df0e00f8d0bad569927bfc7ea35ec37d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/subparse/gstsubparse.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
+index 1d8fa51..81a7f65 100644
+--- a/gst/subparse/gstsubparse.c
++++ b/gst/subparse/gstsubparse.c
+@@ -850,7 +850,7 @@ parse_subrip_time (const gchar * ts_string, GstClockTime * t)
+   g_strdelimit (s, " ", '0');
+   g_strdelimit (s, ".", ',');
+ 
+-  /* make sure we have exactly three digits after he comma */
++  /* make sure we have exactly three digits after the comma */
+   p = strchr (s, ',');
+   if (p == NULL) {
+     /* If there isn't a ',' the timestamp is broken */
+@@ -859,6 +859,15 @@ parse_subrip_time (const gchar * ts_string, GstClockTime * t)
+     return FALSE;
+   }
+ 
++  /* Check if the comma is too far into the string to avoid
++   * stack overflow when zero-padding the sub-second part.
++   *
++   * Allow for 3 digits of hours just in case. */
++  if ((p - s) > sizeof ("hhh:mm:ss,")) {
++    GST_WARNING ("failed to parse subrip timestamp string '%s'", s);
++    return FALSE;
++  }
++
+   ++p;
+   len = strlen (p);
+   if (len > 3) {
+-- 
+2.50.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch
new file mode 100644
index 0000000000..5b9fefc321
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch
@@ -0,0 +1,36 @@
+From 6b19f117518a765a25c99d1c4b09f2838a8ed0c9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 8 May 2025 09:04:52 +0300
+Subject: [PATCH] tmplayer: Don't append NULL + 1 to the string buffer when
+ parsing lines without text
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4417
+Fixes CVE-2025-47808
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/9132>
+
+CVE: CVE-2025-47808
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6b19f117518a765a25c99d1c4b09f2838a8ed0c9]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ gst/subparse/tmplayerparse.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/gst/subparse/tmplayerparse.c b/gst/subparse/tmplayerparse.c
+index 807e332..a9225d3 100644
+--- a/gst/subparse/tmplayerparse.c
++++ b/gst/subparse/tmplayerparse.c
+@@ -125,7 +125,9 @@ tmplayer_parse_line (ParserState * state, const gchar * line, guint line_num)
+        * durations from the start times anyway, so as long as the parser just
+        * forwards state->start_time by duration after it pushes the line we
+        * are about to return it will all be good. */
+-      g_string_append (state->buf, text_start + 1);
++      if (text_start) {
++        g_string_append (state->buf, text_start + 1);
++      }
+     } else if (line_num > 0) {
+       GST_WARNING ("end of subtitle unit but no valid start time?!");
+     }
+-- 
+2.50.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index fc9afff628..05d58e83b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
@@ -20,6 +20,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://CVE-2024-47615-1.patch \
            file://CVE-2024-47615-2.patch \
            file://CVE-2024-47835.patch \
+           file://CVE-2025-47806.patch \
+           file://CVE-2025-47808.patch \
            "
 SRC_URI[sha256sum] = "fde6696a91875095d82c1012b5777c28ba926047ffce08508e12c1d2c66f0057"
 
-- 
2.43.0


