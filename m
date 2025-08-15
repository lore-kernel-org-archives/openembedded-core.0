Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5135CA0EE4
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 16:45:16 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.16350.1755276313365925890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 09:45:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=W5aFvuZL;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32326e7baa1so1881857a91.3
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 09:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755276312; x=1755881112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DplriiJS67WQVdYhU/ZYoPAywlKtblD1gEtiAJM+0cw=;
        b=W5aFvuZLn7p54klTQEnBof4BBakmjjwC0Jk4TbATYlPqdeEPmDPJio/RlwMyAO+O1v
         msJPzbLQs9lZ6W1bujfHcHaw4lx2Kddr+ffPzj3/mEBRF3lyYj/XWqzZ/hrGyHv6Hm9n
         uvVie37PiDDCtBXeTlABbgxxGrgve/u3ijGvCrNfcm8dNnY2f3lruUFIDyRsWsexXxzR
         Z5kAjaU8/KIQACgwxD6Sx193i6AWX1UX96a0hJxbMRdcT/z6VRi31CPNRx92gZW7XUsU
         5dNg3SEjWECB5ketFIrWnjaT1dfS5gS2SChVWD7lt7Yo4c7z/KkNYkfAOSe5FhDAjUPS
         s7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755276312; x=1755881112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DplriiJS67WQVdYhU/ZYoPAywlKtblD1gEtiAJM+0cw=;
        b=Dx85KdqcezrrXV3aJBHKTyFHJ4m7+KxOUiZpl3UnvQGiek+wgNAXUHYxfI/mgTJ8NT
         YwWD2q3prx1ZZtMIBe+dQYIFFM42v7qc/nBRVbuyNDarOmiUZ9BmurmaUvENKKogYfpC
         hdNCdFX7o76VBD7CIx2JvSAnrj9ZYpfxK5TIm75WAZSCxTlfaRmmHkrpimENol12KqVd
         hO2A88Cfy85nBc/Wnhmjc/gtofvlEf00dbQx9x6w0v1OjyYLc2JSySplyMbGf7uctBYZ
         3LQr1HiUA6yXzZuvrJLkThQMVDq4g6tc9jkNxzPlm2Fe/YTJQmsYAlZg+WkD4sCL06ue
         7CPw==
X-Gm-Message-State: AOJu0YwN4wgnyfiWewAeieTaoLq8WGm/wygOsOveaN7wQuVII5mGldkk
	HF6i8u1ptvdUW1BoG8BS2Rwnrtz7aukErkP4jIF1Goruszj/FWtyPeuIH3wjCqA1zxDifvy/HOH
	pdn7A
X-Gm-Gg: ASbGncuUgHr+v8opMOT0Ju/tLsumYdHL0gr9dXbm48DAko1Pdbz4fPh7TVWigXbLWsK
	BNf7v50Utw6ivoxLv+XozPCDa11Ktps/wg6f5C50qWFPaiaUZl4MjCv/rk1MgP9PhA8PGzcbLCg
	eT3v8LZv0OJS2hSfYEyr/F7IPbGPV8xREteuDuJTwaahVy9sJJiiLWX4Rupu7HCnl/Jfc8qQuCC
	MR7BF5hJxM7UfyWp6mLMnE+pRKAmPeLmDgWelhlo3+aBMyQlau/hZsK5xBOhK8glE3kdu8vVM5M
	0XWVBjw5ljMpNLGLXb1gd36Tm5Ef7SvWglf67wTaE0sWMsyKpTALWM9KbvUQLPb/Z04g0mM/O3q
	igwJZ3L5kP8y5Gw==
X-Google-Smtp-Source: AGHT+IGbW/D3l3wJuhP+o0I001R3cHKhdQ2IVAKaF/ISGnAz6sXoy7ep+ZAvEXRJ5/XSJMvSeDV7xQ==
X-Received: by 2002:a17:90b:3c06:b0:311:eb85:96df with SMTP id 98e67ed59e1d1-3234214780emr4643294a91.17.1755276312516;
        Fri, 15 Aug 2025 09:45:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ec5:7840:3390:1caa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c9ab2asm1554476a91.30.2025.08.15.09.45.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 09:45:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/9] gstreamer1.0-plugins-base: fix CVE-2025-47806
Date: Fri, 15 Aug 2025 09:44:56 -0700
Message-ID: <fbe8dd2aa6160530b84d3a174f3f8fc14f9fbab5.1755276097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755276097.git.steve@sakoman.com>
References: <cover.1755276097.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 16:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221985

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/da4380c4df0e00f8d0bad569927bfc7ea35ec37d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


