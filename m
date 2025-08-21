Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49018CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:36:09 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3129.1755758162809262241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X1kQvMxT;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2eb4a171so853770b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755758162; x=1756362962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYUPJn1P5weDVpGiacsovANLlPG0U7hwuSrF1hIqaPw=;
        b=X1kQvMxTnZrBnfN1tvOIujUQpHmzQ3NMm/X/dhqKrNYI1afjQE2dri4wUfwgRW5GAu
         feKB7imAPWUv7BbJZOzFsCQoVi33VXybxQVIZFWEPW1mCwOg45eNnWh5VkbKXzMgRKds
         Pu/9NECvr0xig7CWXVoLD0efcSp7WfBcM+fOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758162; x=1756362962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYUPJn1P5weDVpGiacsovANLlPG0U7hwuSrF1hIqaPw=;
        b=vRAK1XtoPOWBGeJ3q1UHSiM7jyiq+PPkJoe0E/sIVmvxpY42jkljpcztpoMKvADcAN
         Gu3ZNZgN6VB9lB0Nf0NpsPWP1RJJbEAfwQe2qcfR0PLJ7sLMjsDM43F+3jBjWGGlInBQ
         b8M4XJoqf0dCvYmimcSdvBDNMIHl1hkQ+P2sCfcfpt7CfBUaT2t6tsG4gbGQcBQXPthD
         cfGCljk3eqafg8Fb1Xbjd9e0H0rzwa9/kPgms22fQh2C15ue+dX0mQ4RsyRrmUR9ObJX
         X9jkYQCo0T+C1BuKm9rVP9IDE4kNXMLjoNL8hS4qN9+f5CVzFlFQ285nlBiTxH3mpGSm
         1Skg==
X-Gm-Message-State: AOJu0YwN4rLs/zPTzXH7CPcUOOl1kpFy0BvnoXy8JVvrN2oBJvDSDx13
	BZeos8nKbFr1dzSqqHhVtYJiTf/oQE014n8BLBr5ULzN/tTUHyzMSPVZuxD3+kC5y2Oy1a6b1M0
	WVjNE
X-Gm-Gg: ASbGncsv77r4D31mPsFfwS38Da9P1TFfSWoFiSbOhwstl8VY7EFQj1Qr1NTNesWXWH7
	G8TZY+GcKdVsi22rcM8raUqwNDwDSHrZx2JgqR7xmeC7CYhJ14rw9O/qEubdnLHwJl2wJ29Grmv
	hVi57KDFLw/FWPagyrocEe1yRRIDAxbYOUFEjM7zRqpaCxe6Rd/yYUYH4/+ZXWZ1UHyOwGGrruG
	kZ9VLO7xwbD/ZbqHnuUO/tG3batk3JqScql+rbXc/656KzNE+mm5ct+BFpzLL/FR0SAj4q0i84S
	MWh5c8HFZKgUqAIlvebBWtF1/XOtnegOV/BfOOL58rYSQgqVwt2zROCyajJEdPIh5Yd7MlMgeQQ
	SduAomS9Z1A2uaObrJnSX9quwuR2VucDPtbhb
X-Google-Smtp-Source: AGHT+IFkKCmBSMjQKVSwKsbfjQ1ZgsEXGetpp0f153McxQ1Qw2Qxb63gAv7Yr3zHi3Bcktw6QoS+ZA==
X-Received: by 2002:a05:6a00:1146:b0:76b:f828:34e4 with SMTP id d2e1a72fcca58-76ea30f0099mr1774858b3a.6.1755758161962;
        Wed, 20 Aug 2025 23:36:01 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0d22b8sm7380444b3a.4.2025.08.20.23.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:36:01 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] gstreamer1.0-plugins-base: fix CVE-2025-47807
Date: Thu, 21 Aug 2025 12:05:51 +0530
Message-ID: <20250821063551.39709-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222207

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9e2238adc1cad1fba5aad23bc8c2a6c2a65794d2

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.50.1


