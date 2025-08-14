Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E565CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 11:26:12 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.20488.1755170771106804907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LS+JSmVc;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326e202e0so752771a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755170770; x=1755775570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kIrVjvVhn0u6h3FNJTk+TVYnH2jpJPKt8FxbtvbEk/E=;
        b=LS+JSmVcCBoAM5k6WYL99UyVF8ro9q/K1ZEJg9AE28+lCCQBPahoczX/704mt/3A1D
         8nHqw2IT9A3e2qenUGwjX0d0c4ph3KCNBIQbIpGEg6Gypnc995D27IDVftkt4mUd8Um/
         ujba47/yql5N2sXwfpCWyW/csxzojDo2FvftE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755170770; x=1755775570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kIrVjvVhn0u6h3FNJTk+TVYnH2jpJPKt8FxbtvbEk/E=;
        b=GTiOaN/Lbj+qNof4aUaXAoDUwrsBDY49LOAwLM3EBQ+UZfYaH8zRSlO9UqIvREKdXt
         W0eP/KfMFXq6QSaY1bzJhrkdTv6FEjLJ6nt9InP6Z73E7gw9d6EgaxgZWkjEnYpvblsJ
         rISiSGV5ivr6CI3O1kAPLa49jRjgYsBAO/J+Y0Nsr61g9TQtmXAQCBiwLGZ12ENB4dky
         Tg/0LMImK250n0peBp+SDHULsnXWxTCpc/xb1aopXGBVT04zj1952pZceex9WWzCV3Cx
         Ca4JhKZW25nr4teLNayzOmoPPl/HXF/wWObQWJVQts6Mf5qxIxpMudR64hay4MXV4m4F
         9SmQ==
X-Gm-Message-State: AOJu0YzkqZlnfaXTKvAjH8LrUt+94KBxvsoJdRDK7qxoLJK2ulmV/JOt
	PJaIrMZB/amjqy73G4ubsUXMupI0uoSSYxh8TUgD7y/x49KXyNo6p3rqrF2AyGF5AxP4SQ40l9k
	Qxywa
X-Gm-Gg: ASbGncvckDZDl/hVx/7moapidtVH6Nsz1wfUlNzjiwM4Mq9Q2P4br/Po3ffjUSwvr/3
	xSsWcU3wkRQnYlCNfe+zSFR80Kb3a5c5pOEeXKhsPghzTXM+28nZ4HTInXfUEaG6JaipkhOrm38
	8AwyscjoM4ZPkMJus0veLIVU9r1aOVrEtAlL015LVIrJTjibsS/CwR2bIcj4dih3lWv/NyAHnpJ
	4InwGe4Ys5Rj6ctb+YGjN8NXuPJRFUn3N/3lbSxChfGIlvOkZE1itGyB8dPOsAihH4OhyQ1q6d/
	cZLykmoeFNm5EgVf0Rsy64IGli+N/8vakoijQpPZvBzUi9HQJDO9N312QPWE5jiBFiSvm5xyxFG
	oWDEFk10KpgjC9I3AMvIs3A==
X-Google-Smtp-Source: AGHT+IHljyHBGhp9ynKs43wu6umegPKZ02ukh+23XrpgxXZxN1OpKyqZGSwqpe95r3MJbL4zWmv7PQ==
X-Received: by 2002:a17:90a:f94e:b0:321:38e0:d591 with SMTP id 98e67ed59e1d1-32327a53262mr5029543a91.17.1755170770037;
        Thu, 14 Aug 2025 04:26:10 -0700 (PDT)
Received: from MVIN00016 ([103.250.136.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32331097831sm1553464a91.33.2025.08.14.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:26:09 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] gstreamer1.0-plugins-base: fix CVE-2025-47806 & CVE-2025-47808
Date: Thu, 14 Aug 2025 16:55:52 +0530
Message-ID: <20250814112552.555568-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 11:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221858

Backport fixes for:

* CVE-2025-47806 - Upstream-Status: Backport from  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/da4380c4df0e00f8d0bad569927bfc7ea35ec37d
* CVE-2025-47808 - Upstream-Status: Backport from  https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6b19f117518a765a25c99d1c4b09f2838a8ed0c9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.50.1


