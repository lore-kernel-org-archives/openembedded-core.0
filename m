Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2DACA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 06:22:19 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.2972.1755757327952907235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 23:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hKobTqyY;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32326e5f058so486838a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 23:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755757327; x=1756362127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7V+OAkUF/hg4VBId4mS7zweW1hnST7k1DpU7OB1VpQ=;
        b=hKobTqyYMZlxnHN5Z4DgXqLxkou89FWcHy8d1qEr1najLayyylIAbZu3E8wheLjV96
         buaoCmI+1K/7bkvHXxnncqduG0lNqi+BQASPw1MNUrvNbcjNnptQ45pbSiXQlWKSrny2
         5wPzRP010/iLAD84JjT0n87jaDnnAHbqXORko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755757327; x=1756362127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7V+OAkUF/hg4VBId4mS7zweW1hnST7k1DpU7OB1VpQ=;
        b=fMM/KintaOH+eWry4Z+ZJVMFPmH08xdIUa+r8hk0ZrZ2cj7fGLwzintJhaK7w5gHpf
         d6qZWMhsWJsFqeKTNjqZU2TAekbgXBh6BEhznoFcVVWIzRLZwzYa14s//LraRsvPVFFv
         TrqPyFP7f+LhMJFANbB7mb1XlP1488dGTTU4Rj6s6r2r9LlIjnKYV3W3sCbl4QMdL3ra
         HwARNMmF9eazlmZgHNiPIpMvChrXzKsGffDIcubvzmNqX3ZNWm25L5TGB3WeCk67GNqw
         J9q3uRqsu0KVSkM3KpJH2Bi2bdd9KGm9aDQO4d143N4M2GvPCnuDASeBrUR3MeE9bMc0
         HMFw==
X-Gm-Message-State: AOJu0YyFAzcpMQ3P97PSbtncE+PmEVENUsHKv2Qoniy1yTUSwvrkDQ18
	1ALu50maYGh3RSxQtOVe1oMAOdoGXc6Epf6T8ETjIUEKQv7BNWhL2KiweifNiAk5zlEa4Yr0Lgs
	gUds1
X-Gm-Gg: ASbGnctCd1mun7njamgWwiindRSJ7x1J7RgYlHSHu2lIxPP/4wKPuXXw5Zfya8elNIR
	kLf46wkWKYQK377DPthyhj/lXPaA/XoVkoYP5AIx0iKfUrw9au/r8Be3K66ttT+zBIuEdsHQj4x
	4z7x0EO84JUF6AphovfWiRa4IqhqKW7RAk8GLd5JokJy5SmbI00rQl5Ln0kXdar3mVI6Vk9F2vq
	1H8fJS7v7HmK3tAI2zLqJ4Ufxbn7D/8ER1IRugo24fiw5q/OVi9MKWYhPpgJTpKzr+FVD6jE8P3
	AdnIOtuT7X1mFlh2XNm7pfRsc/iN5Qwd82YfQ4rHLudqukGopIdiCCrdJuvVYdPW3YOg4rYIHJa
	tnenrm7J4+/82G7rEfu00jIAbQMg45tzeL3p8
X-Google-Smtp-Source: AGHT+IHc3UKRLrhqipwzb7KDDjH9rDls8sZIu94TM91eQOpqZDnsmrY65+MvdvCkEQI7bG1wxYS8mA==
X-Received: by 2002:a17:90b:3d0b:b0:31f:150:e045 with SMTP id 98e67ed59e1d1-324ed14d319mr1902586a91.32.1755757326965;
        Wed, 20 Aug 2025 23:22:06 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324f92d74b7sm298952a91.3.2025.08.20.23.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 23:22:06 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] gstreamer1.0-plugins-base: fix CVE-2025-47807
Date: Thu, 21 Aug 2025 11:51:49 +0530
Message-ID: <20250821062149.26678-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 06:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222206

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/9e2238adc1cad1fba5aad23bc8c2a6c2a65794d2

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.50.1


