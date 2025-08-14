Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE861CA0ED1
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 04:40:19 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.15615.1755146411223101829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 21:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Kdhio1CP;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e2e8ec73bso669916b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755146410; x=1755751210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4VoFXrBp+49v8NMyjNjt1e1aPiiPBZUZvCp93G8bVqQ=;
        b=Kdhio1CPvpmXBfXEd59JmoluwerJW9DylHoo+s104wgmMHrWjtfDidgIbcuq0QweMp
         AZBAC+c0RomQD51mEUm/oWisXRMzs/+0mb6dGBODSo0ac+b8k4zrCpEwmUN7GULk4OwL
         iDyDx1dC9Njf0mazMBaqEkohBPWMMQGnOwMMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755146410; x=1755751210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VoFXrBp+49v8NMyjNjt1e1aPiiPBZUZvCp93G8bVqQ=;
        b=rRBAuobPbG7J9PAWPqlkdROVbeSCGWhljbrl8U2IyxUZnPyuf/KDmgixq2lpQBujvD
         sTkLJTG172FalbZSOULZvYxGaDGRRXQB4O8C6kd+h10F6fvyfynwm6IO2fq9tQS7OYTK
         p47TbTuvRkeY8FrG8hHIidm0Je/4xX2PwK6DLqEuQXIj0EpFmr7w9X5if/lyyHQ5dsiF
         PNKs6O0pgeRGp0EURGD5C4+JZ0pgbKwymRhOggAd4jGU4NoWlHm3O2qAR0P2TkzVDBvR
         c6be61Y4lvgMjf+UeyzymFXRx4tEuKXznRy0a+YcfJ32/UEZ1tylsX/N5YSnrecXXrrN
         eENw==
X-Gm-Message-State: AOJu0YyrpfJEi5WsXM/3kASiUenXNSKLWUzcOcYKP/YdbxpXH+uU0KyN
	UD+gvG6QXo7m0QqMcXoS63e0mIcZ6PBZN7qJtIcazPFTiddL1mJAaacOlZw03+1wKGH8dOGXM++
	XiWS0
X-Gm-Gg: ASbGncu6DxKSDzyy0S3dEkKdQ3ctWswcVg3V3ffsYO1cfbrDeBJzyQz+5+0uW1jKM1c
	Bh2hxJsg4xoL0jOh7ud96V7PYm/5eRmv5fTFHwkJOepOkf6VlUmnkDDILJn5FD4AxOFhl+E2q19
	wTGvMseyUjbcSzt+QFPLp6agoCvenU0+TPnwfJeyESN9gFrnFz4fSSLpVb0tFdbX+dgVdAPX+gI
	Jt0LwlgGKA0gcH2f78OM7pq3GnJ0A+L8ePNa62iKU6PVKrNP6A3e00fiu6w/RsA/en77uTX0BqJ
	qtxTQ7tN2fLo7mkMmDmnhzzc/DCTYWFJo80rfRE+wGEEGeZXsISJSFElhCExT5PdJhZyf+dWJFx
	Y69caU2XkHxp6oHkvJ5TFuWrE62FDtDXJrpU=
X-Google-Smtp-Source: AGHT+IGA5b3WgejY1nnH6UMU3F7gSvh+1aKsk+7MiHiQ9yBYM1QseRXxdJJ+T+SYm65999Sb9Aenxg==
X-Received: by 2002:a05:6a21:9999:b0:23d:8af5:13b9 with SMTP id adf61e73a8af0-240bcfbc65fmr2645330637.2.1755146410389;
        Wed, 13 Aug 2025 21:40:10 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2efd89aesm19197358b3a.106.2025.08.13.21.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 21:40:09 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] gstreamer1.0-plugins-base: fix CVE-2025-47806
Date: Thu, 14 Aug 2025 10:10:00 +0530
Message-ID: <20250814044000.106092-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 04:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221850

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/da4380c4df0e00f8d0bad569927bfc7ea35ec37d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2025-47806.patch                      | 50 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47806.patch
new file mode 100644
index 0000000000..632a5fb38e
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
+index 4ea4ec6..035068d 100644
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 44ecdc0b55..bfc6bb65ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch \
            file://0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch \
            file://CVE-2025-47808.patch \
+           file://CVE-2025-47806.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.50.1


