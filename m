Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B56E77199
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:26 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.18137.1735998143172453642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rYD4huEL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216401de828so171988885ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998142; x=1736602942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJRPO82HNUfKmXNYR8vMJHvMGaPrdgIbYNvoqH2zbZY=;
        b=rYD4huELrHeKN/b9do9PtQAVVp/OkLGSp6sQdHOOCqwM0crAZ9wfFo+mo+XXN9KOQ9
         jtapoi4nLlVP0ZT/PpKw4WhNkq6mLixabrBoiZ2zNRYVl1SodYibtq/+AluWkzxg0vwJ
         977yxvqBYqyfdfRx7N7l3rF82B8YsP9Nt1CBtq4wUqQ97rRmFWn/osJM2qOYuLOx5IHn
         BwNfO8M6CGZ+N/TZe6Ivls0TfmpAl5WcvsTtDaqh4k1qOc4rrCqEkvolKyek7uTrfNZ1
         bQdys2oW2WsOTK0IMwGp8Q8YOTToivf7V44irfiN5/Y5MJt23B+/X3bGFnbV3y6CqmPh
         4hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998142; x=1736602942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJRPO82HNUfKmXNYR8vMJHvMGaPrdgIbYNvoqH2zbZY=;
        b=nu+UXNQ6BiNeGNp64e7R41XMi6ZwNtaEveevKTT0Au3IKxUngwjQ00aTn8TMfC/f/3
         b9AXB/pS4NjLDsdTGlsErsWysDx1Y9B92FM5We4EJ2oCQKJIcR4iW2qrlVl9UxBJCVVn
         mJkL07TK0l+T1cMG9NmfqtIaqUroj0PrCMkFcMAHCcbsNGBgcI22UR4yyAjQ1A7gpwl3
         EilvSeL1hpf1HiJo3dj6wBLvwreQuerEWrDvm6bhpkxtNaEphGXKl6lhKlUOTiEoV4fU
         p64sqp8ZPqDtfrln1SVu9/s8GqoeP2PYYrN2rCvEMHCJ9DSr7eCMbJrkFRA5JiUbwGkN
         tKJQ==
X-Gm-Message-State: AOJu0YwS6eOKFLK0GdqkP0LrnBRTIyQIWljTGcGQmdXN+D/apoZ+nexP
	DwRgagJtGeBeCFYhvG21u5eoybRk/4RRFcS5OZ5bXoaNuzhPdNKNvMKZNeqoIu+hLO7pxMnYSot
	C
X-Gm-Gg: ASbGncsmUpE6z2MsOPnjQm3Cp04WtD2deXj5HnPzJTaSG/Y6XN6VUtkKPLy1AjiQ9qK
	DfvCmZw91nTw0oOnLxZd3S2J2ocMP45j8+rpGZHwyycuSLkX5XZIzFLsX5h81jRJCEDuEYrNQRg
	WUNywKsJmq2iONDKPQa7LEbjYcTdbv/uV3fOcqBluDyxQFHncuq53nN+KAW0o3laOnCoRhPJtSm
	UQ+GUU72YevBuOaJK14Cvk8JSITlPtzwToEBt2TtsyxHg==
X-Google-Smtp-Source: AGHT+IFpPQc9LL0DwLeULAKEoZUkkYddJ98U/ttnAsdnbcsOCIvdW4i0evz9hta1orfNTfAA/LEMlw==
X-Received: by 2002:a05:6a21:2d05:b0:1e1:b883:3c56 with SMTP id adf61e73a8af0-1e5e049f2c6mr80052893637.23.1735998142380;
        Sat, 04 Jan 2025 05:42:22 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/25] gstreamer1.0-plugins-base: patch CVE-2024-47835
Date: Sat,  4 Jan 2025 05:41:39 -0800
Message-ID: <e9113fafef9cb2f060c9728d1e1bebdd76baad47.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209384

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8039

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...or-NULL-return-of-strchr-when-parsin.patch | 39 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch
new file mode 100644
index 0000000000..b778e7053b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch
@@ -0,0 +1,39 @@
+From 4c40f73b7002967e824ef34a5435282f4a0ea363 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 9 Oct 2024 11:23:47 -0400
+Subject: [PATCH] subparse: Check for NULL return of strchr() when parsing LRC
+ subtitles
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-263
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3892
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8039>
+
+CVE: CVE-2024-47835
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/4c40f73b7002967e824ef34a5435282f4a0ea363]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/subparse/gstsubparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gst/subparse/gstsubparse.c b/gst/subparse/gstsubparse.c
+index 8d925524a6..7d286ed318 100644
+--- a/gst/subparse/gstsubparse.c
++++ b/gst/subparse/gstsubparse.c
+@@ -1068,6 +1068,11 @@ parse_lrc (ParserState * state, const gchar * line)
+     return NULL;
+ 
+   start = strchr (line, ']');
++  // sscanf() does not check for the trailing ] but only up to the last
++  // placeholder, so there might be no ] at the end.
++  if (!start)
++    return NULL;
++
+   if (start - line == 9)
+     milli = 10;
+   else
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 982389d657..05cb956815 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch \
            file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
            file://0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch \
+           file://0012-subparse-Check-for-NULL-return-of-strchr-when-parsin.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.43.0


