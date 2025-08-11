Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFE3C87FD2
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 12:49:46 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.47276.1754916577233972002
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 05:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J/m1Nef8;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76bd7676e60so3564762b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1754916576; x=1755521376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENQkbfGY6G8uKK/flRMnSJPcSVy5bGx+aeFR7YgAqLE=;
        b=J/m1Nef83k78ryUiocTcaxPAyHRt6R5gyKH2no95qY/l6RTpyTmRMv4n5zyvNakKHF
         3VqWLaSqPDrFg5uahXkzWh5OLa05V8DyGivkGj1DSS1RNUKgPd4U6QxGnHkWLsJY0V5R
         gCy0z8B1TGYPEvhq+9ziNUzHYH7rGrAER6MzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754916576; x=1755521376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ENQkbfGY6G8uKK/flRMnSJPcSVy5bGx+aeFR7YgAqLE=;
        b=t6VtghCjyrZq0k287G2OtAC2wZ5vP5/c4Gk/2ko7Bs3xUnevCnRu/2INZZEQADGJNZ
         5sdb63uwnADzoDnODi0aWyQM4/5s8YfYjz5rFzOhzpzftugDKU8q6Pl0Mt41XZlSSE/D
         iFJTVNXrKMPQ50tMnSyAUbWOP8Bk6ok6Pm90ZKW7VDOGimlHlH4znIRQEgMCZcdCnxor
         MVM+PzM5KEL4j/DEh/jIvzpnhVRL4zu9VYJ8fs6qEy2VK38XBsqSPZ1TZN7Y17NfZUKY
         LPAHLVfM64uuT+/ePvtp1iHyazKDLpCz34ahVaM5ICXwrLGIaI5m+awGqIlj+5bhwaSc
         Ssqw==
X-Gm-Message-State: AOJu0Yz7r4RZz7znDT9Ajc2yeC21PMyKRaWjKh2nC2Tpjifuph2kf9hj
	Z1uQVwfUWGlePYKSNcCg2nwFhYR86g0QUJlX6wvNqO/CMs6WCOxRv0GF2I8cjhitDjxVL/IoplO
	yrE61
X-Gm-Gg: ASbGncuaNMITmZLNds5gRNRo25krgHAcFENndiAyLYK+XeoGPHrEVLT23iQxpjAq/Bt
	MNeh+jGcLJ3LqabX+YYZY3R/fETaxYK9WcssvFd99MgKoFcChyWXlro5gFAzPCLJJ9fF1B7+Kv9
	xOFNs8cNwcrUApMt1vPkmes4d7p6JZYXSIb2rKBZbCKdVelucboUUxAy62UbyIHGp17HsEx5twg
	B72K2RjIuEu26NOOeJ37lyZL3E5tKJB3CCpomnsY8ndyKu5jSHsUReKQy4UX/OtjbfVo088GEmA
	JKJHvnPycttlDG7fx48Yxg86r7Xu8sGESW0ddqW0Xsulh5f2PWlPdWplS8tIbFkzuhngA2AHKNg
	qvgyYh2o6zekZVq06XN/3rlK0wF5Rbh9gAozO
X-Google-Smtp-Source: AGHT+IH4ow8BhuK9YbTXtNfP7UIAXePgnfXlxtr/sRfZUXWHFfl6vVbKEX8lLyC8Tu36ZpRZGwN8Pw==
X-Received: by 2002:a05:6a21:998b:b0:23d:ac50:3339 with SMTP id adf61e73a8af0-24055160436mr20143862637.29.1754916576315;
        Mon, 11 Aug 2025 05:49:36 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.211])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7b2700sm23366809a12.15.2025.08.11.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:49:35 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] gstreamer1.0-plugins-base: fix CVE-2025-47808
Date: Mon, 11 Aug 2025 18:19:24 +0530
Message-ID: <20250811124924.170002-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 12:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221737

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/6b19f117518a765a25c99d1c4b09f2838a8ed0c9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../CVE-2025-47808.patch                      | 36 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2025-47808.patch

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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 05cb956815..44ecdc0b55 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
            file://0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch \
            file://0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch \
+           file://CVE-2025-47808.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.50.1


