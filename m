Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D26C3ABAC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.8210.1745981651794505936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l44ZfB9Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso6446772a91.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981651; x=1746586451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TN+HnO0mjM4osJm/o83W9d0py3Pb3VyKilP6+/D5ecc=;
        b=l44ZfB9ZD3B6AgSWtkAn/AsgbCKucB8iWbWWf03zI0ZdnP3JG7QnaC2ZmQpfEloNBV
         7L5/HRtINx4LpmAOHtMmVlF4Q9MJdlJJc0Eq+vAS2dgDt/c+UJO0wpQ5Ru2hc2tEwtou
         M2ZBP19u480fTzZ1DoRRdDlWM1gC+P2Y9GUM+UhhYBy1VtcW56VCU564RV71O0ICbIRc
         RuK+MsqkTdX9h2AGpZu5IdcKtS+kJEb0ljL72p7Dglg9F9Nz11ZQPY/mvPjqfR3Y4rCX
         Pcl+gydgYLvxlQalxVosWEPebFIxS67gZroBuZdPE+5RhE2NuIt228ju1MdLbW72Zk0N
         x6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981651; x=1746586451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TN+HnO0mjM4osJm/o83W9d0py3Pb3VyKilP6+/D5ecc=;
        b=tx7H12VhbEOIJKxoh8wSTd82oFnTUHxoKdWyeIp5WmxVV3JncewTjJFpyYl/SlX1K0
         SbICgQPYGyaKuOeN73JZTlHQshes/b8jOLKAh8cHmbr0sykbnezxPthx/N3WFXTr2pbm
         J/LtPVtXSpZ81lHnRULOUZiDGtI4IJgF1/3frjRD8IhnyD4z51V4S7XcjPhfJz2N2Nhr
         jXfPfTfNU5iyP3ohBQbmzg5Bb/7Hqj8KoTIoVpREBMXQJa4PHOihprEY1fe66JxAcUzP
         +ErVdfRedKIgC0l7ypWog+mevkLfASgm855A46MsyRbAciVdKwOJ2dXLfq87Il3t9hKr
         Lp5w==
X-Gm-Message-State: AOJu0YwNxaecgfR5gC8cj34cRwhCrU+CIpM5dhp/eGnVvxKC129whlrN
	YPzNNkkknKzcipOy8iVZHQQFAc28bgYINdG/j+OkACh5mCpjpBjRTVgPM4+Q+8DLLGlKCUuT2Tp
	o
X-Gm-Gg: ASbGncshuSAGiauzQx4GsEo9iQUQUt6p6y2Md2AAnrXIZD6RJA4nzfZhn0KHMGv0PN5
	lCqXSQ44Rp/h9An/2mQ3h6pDDKmXt+wkbM+DtFdrk7mMZoaxjVf6gf1GVyJ4pFhal7xUbMvhWNj
	YZJDfaX4P082SUCWASd5e/PhWKZiGigNU+FTr3km+2RJSVvHE46uOUAXeHh4DZISLi3SVCmQz66
	7gP9dvb/6xeR+AckOuy1BjL2TffnwWcetskSRZyzlx+8K0jHCyu6ZqhXo5pVZRdKrC8PxRjTPF5
	Ge/ki2+bRfRvnBAbRvByZgzGibF+SPk=
X-Google-Smtp-Source: AGHT+IGdweW3HSEEnnHgZVaq8I4OqWikXKYv/uA3QLOQso+U1jikZgjU/+zgpksNAKgz1LSpskZcHw==
X-Received: by 2002:a17:90a:c888:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-30a34450bdcmr1430887a91.28.1745981650766;
        Tue, 29 Apr 2025 19:54:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/14] glib-2.0: patch CVE-2025-3360
Date: Tue, 29 Apr 2025 19:53:33 -0700
Message-ID: <606cc539ab19ae2bceb366eda7d4872c3763400f.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215699

From: Peter Marko <peter.marko@siemens.com>

Backport commits from [1] fixing [2] for 2.82.x.

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4499
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3647x

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-3360-01.patch  | 57 ++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-02.patch  | 53 +++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-03.patch  | 36 +++++++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-04.patch  | 76 +++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-05.patch  | 57 ++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-3360-06.patch  | 50 ++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  6 ++
 7 files changed, 335 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-04.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-05.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-06.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-01.patch
new file mode 100644
index 0000000000..91ea6c3748
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-01.patch
@@ -0,0 +1,57 @@
+From fe6af80931c35fafc6a2cd0651b6de052d1bffae Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 18 Feb 2025 16:44:58 +0000
+Subject: [PATCH 1/6] gdatetime: Fix integer overflow when parsing very long
+ ISO8601 inputs
+
+This will only happen with invalid (or maliciously invalid) potential
+ISO8601 strings, but `g_date_time_new_from_iso8601()` needs to be robust
+against that.
+
+Prevent `length` overflowing by correctly defining it as a `size_t`.
+Similarly for `date_length`, but additionally track its validity in a
+boolean rather than as its sign.
+
+Spotted by chamalsl as #YWH-PGM9867-43.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-3360
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/fe6af80931c35fafc6a2cd0651b6de052d1bffae]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gdatetime.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index ad9c190b6..b33db2c20 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -1493,7 +1493,8 @@ parse_iso8601_time (const gchar *text, gsize length,
+ GDateTime *
+ g_date_time_new_from_iso8601 (const gchar *text, GTimeZone *default_tz)
+ {
+-  gint length, date_length = -1;
++  size_t length, date_length = 0;
++  gboolean date_length_set = FALSE;
+   gint hour = 0, minute = 0;
+   gdouble seconds = 0.0;
+   GTimeZone *tz = NULL;
+@@ -1504,11 +1505,14 @@ g_date_time_new_from_iso8601 (const gchar *text, GTimeZone *default_tz)
+   /* Count length of string and find date / time separator ('T', 't', or ' ') */
+   for (length = 0; text[length] != '\0'; length++)
+     {
+-      if (date_length < 0 && (text[length] == 'T' || text[length] == 't' || text[length] == ' '))
+-        date_length = length;
++      if (!date_length_set && (text[length] == 'T' || text[length] == 't' || text[length] == ' '))
++        {
++          date_length = length;
++          date_length_set = TRUE;
++        }
+     }
+ 
+-  if (date_length < 0)
++  if (!date_length_set)
+     return NULL;
+ 
+   if (!parse_iso8601_time (text + date_length + 1, length - (date_length + 1),
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-02.patch
new file mode 100644
index 0000000000..ca5ae2866c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-02.patch
@@ -0,0 +1,53 @@
+From 495c85278f9638fdf3ebf002c759e1bdccebaf2f Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 18 Feb 2025 16:51:36 +0000
+Subject: [PATCH 2/6] gdatetime: Fix potential integer overflow in timezone
+ offset handling
+
+This one is much harder to trigger than the one in the previous commit,
+but mixing `gssize` and `gsize` always runs the risk of the former
+overflowing for very (very very) long input strings.
+
+Avoid that possibility by not using the sign of the `tz_offset` to
+indicate its validity, and instead using the return value of the
+function.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-3360
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/495c85278f9638fdf3ebf002c759e1bdccebaf2f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gdatetime.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index b33db2c20..792c2ed15 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -1342,8 +1342,10 @@ parse_iso8601_date (const gchar *text, gsize length,
+     return FALSE;
+ }
+ 
++/* Value returned in tz_offset is valid if and only if the function return value
++ * is non-NULL. */
+ static GTimeZone *
+-parse_iso8601_timezone (const gchar *text, gsize length, gssize *tz_offset)
++parse_iso8601_timezone (const gchar *text, gsize length, size_t *tz_offset)
+ {
+   gint i, tz_length, offset_hours, offset_minutes;
+   gint offset_sign = 1;
+@@ -1411,11 +1413,11 @@ static gboolean
+ parse_iso8601_time (const gchar *text, gsize length,
+                     gint *hour, gint *minute, gdouble *seconds, GTimeZone **tz)
+ {
+-  gssize tz_offset = -1;
++  size_t tz_offset = 0;
+ 
+   /* Check for timezone suffix */
+   *tz = parse_iso8601_timezone (text, length, &tz_offset);
+-  if (tz_offset >= 0)
++  if (*tz != NULL)
+     length = tz_offset;
+ 
+   /* hh:mm:ss(.sss) */
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-03.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-03.patch
new file mode 100644
index 0000000000..25eb0c6fdd
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-03.patch
@@ -0,0 +1,36 @@
+From 5e8a3c19fcad2936dc5e070cf0767a5c5af907c5 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 18 Feb 2025 16:55:18 +0000
+Subject: [PATCH 3/6] gdatetime: Track timezone length as an unsigned size_t
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It’s guaranteed to be in (0, length] by the calculations above.
+
+This avoids the possibility of integer overflow through `gssize` not
+being as big as `size_t`.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-3360
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/5e8a3c19fcad2936dc5e070cf0767a5c5af907c5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gdatetime.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index 792c2ed15..6335bcbe2 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -1347,7 +1347,8 @@ parse_iso8601_date (const gchar *text, gsize length,
+ static GTimeZone *
+ parse_iso8601_timezone (const gchar *text, gsize length, size_t *tz_offset)
+ {
+-  gint i, tz_length, offset_hours, offset_minutes;
++  size_t tz_length;
++  gint i, offset_hours, offset_minutes;
+   gint offset_sign = 1;
+   GTimeZone *tz;
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-04.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-04.patch
new file mode 100644
index 0000000000..e62604d600
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-04.patch
@@ -0,0 +1,76 @@
+From 804a3957720449dcfac601da96bd5f5db2b71ef1 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 18 Feb 2025 17:07:24 +0000
+Subject: [PATCH 4/6] gdatetime: Factor out some string pointer arithmetic
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Makes the following code a little clearer, but doesn’t introduce any
+functional changes.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-3360
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/804a3957720449dcfac601da96bd5f5db2b71ef1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gdatetime.c | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index 6335bcbe2..de5dd7af0 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -1351,6 +1351,7 @@ parse_iso8601_timezone (const gchar *text, gsize length, size_t *tz_offset)
+   gint i, offset_hours, offset_minutes;
+   gint offset_sign = 1;
+   GTimeZone *tz;
++  const char *tz_start;
+ 
+   /* UTC uses Z suffix  */
+   if (length > 0 && text[length - 1] == 'Z')
+@@ -1368,34 +1369,35 @@ parse_iso8601_timezone (const gchar *text, gsize length, size_t *tz_offset)
+       }
+   if (i < 0)
+     return NULL;
++  tz_start = text + i;
+   tz_length = length - i;
+ 
+   /* +hh:mm or -hh:mm */
+-  if (tz_length == 6 && text[i+3] == ':')
++  if (tz_length == 6 && tz_start[3] == ':')
+     {
+-      if (!get_iso8601_int (text + i + 1, 2, &offset_hours) ||
+-          !get_iso8601_int (text + i + 4, 2, &offset_minutes))
++      if (!get_iso8601_int (tz_start + 1, 2, &offset_hours) ||
++          !get_iso8601_int (tz_start + 4, 2, &offset_minutes))
+         return NULL;
+     }
+   /* +hhmm or -hhmm */
+   else if (tz_length == 5)
+     {
+-      if (!get_iso8601_int (text + i + 1, 2, &offset_hours) ||
+-          !get_iso8601_int (text + i + 3, 2, &offset_minutes))
++      if (!get_iso8601_int (tz_start + 1, 2, &offset_hours) ||
++          !get_iso8601_int (tz_start + 3, 2, &offset_minutes))
+         return NULL;
+     }
+   /* +hh or -hh */
+   else if (tz_length == 3)
+     {
+-      if (!get_iso8601_int (text + i + 1, 2, &offset_hours))
++      if (!get_iso8601_int (tz_start + 1, 2, &offset_hours))
+         return NULL;
+       offset_minutes = 0;
+     }
+   else
+     return NULL;
+ 
+-  *tz_offset = i;
+-  tz = g_time_zone_new_identifier (text + i);
++  *tz_offset = tz_start - text;
++  tz = g_time_zone_new_identifier (tz_start);
+ 
+   /* Double-check that the GTimeZone matches our interpretation of the timezone.
+    * This can fail because our interpretation is less strict than (for example)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-05.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-05.patch
new file mode 100644
index 0000000000..4d633aaba0
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-05.patch
@@ -0,0 +1,57 @@
+From 4c56ff80344e0d8796eb2307091f7b24ec198aa9 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 18 Feb 2025 17:28:33 +0000
+Subject: [PATCH 5/6] gdatetime: Factor out an undersized variable
+
+For long input strings, it would have been possible for `i` to overflow.
+Avoid that problem by using the `tz_length` instead, so that we count up
+rather than down.
+
+This commit introduces no functional changes (outside of changing
+undefined behaviour), and can be verified using the identity
+`i === length - tz_length`.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-3360
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/4c56ff80344e0d8796eb2307091f7b24ec198aa9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gdatetime.c | 13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/glib/gdatetime.c b/glib/gdatetime.c
+index de5dd7af0..2f8c864a1 100644
+--- a/glib/gdatetime.c
++++ b/glib/gdatetime.c
+@@ -1348,7 +1348,7 @@ static GTimeZone *
+ parse_iso8601_timezone (const gchar *text, gsize length, size_t *tz_offset)
+ {
+   size_t tz_length;
+-  gint i, offset_hours, offset_minutes;
++  gint offset_hours, offset_minutes;
+   gint offset_sign = 1;
+   GTimeZone *tz;
+   const char *tz_start;
+@@ -1361,16 +1361,15 @@ parse_iso8601_timezone (const gchar *text, gsize length, size_t *tz_offset)
+     }
+ 
+   /* Look for '+' or '-' of offset */
+-  for (i = length - 1; i >= 0; i--)
+-    if (text[i] == '+' || text[i] == '-')
++  for (tz_length = 1; tz_length <= length; tz_length++)
++    if (text[length - tz_length] == '+' || text[length - tz_length] == '-')
+       {
+-        offset_sign = text[i] == '-' ? -1 : 1;
++        offset_sign = text[length - tz_length] == '-' ? -1 : 1;
+         break;
+       }
+-  if (i < 0)
++  if (tz_length > length)
+     return NULL;
+-  tz_start = text + i;
+-  tz_length = length - i;
++  tz_start = text + length - tz_length;
+ 
+   /* +hh:mm or -hh:mm */
+   if (tz_length == 6 && tz_start[3] == ':')
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-06.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-06.patch
new file mode 100644
index 0000000000..2452b69e2e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-3360-06.patch
@@ -0,0 +1,50 @@
+From 7f6d81130ec05406a8820bc753ed03859e88daea Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 18 Feb 2025 18:20:56 +0000
+Subject: [PATCH 6/6] tests: Add some missing GDateTime ISO8601 parsing tests
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This improves test coverage, adding coverage for some lines which I
+spotted were not covered while testing the preceding commits.
+
+It doesn’t directly test the preceding commits, though.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-3360
+Upstream-Status: Backport [https://github.com/GNOME/glib/commit/7f6d81130ec05406a8820bc753ed03859e88daea]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/tests/gdatetime.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/glib/tests/gdatetime.c b/glib/tests/gdatetime.c
+index 9e1acd097..94dd028a3 100644
+--- a/glib/tests/gdatetime.c
++++ b/glib/tests/gdatetime.c
+@@ -857,6 +857,23 @@ test_GDateTime_new_from_iso8601 (void)
+    * NaN */
+   dt = g_date_time_new_from_iso8601 ("0005306 000001,666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666600080000-00", NULL);
+   g_assert_null (dt);
++
++  /* Various invalid timezone offsets which look like they could be in
++   * `+hh:mm`, `-hh:mm`, `+hhmm`, `-hhmm`, `+hh` or `-hh` format */
++  dt = g_date_time_new_from_iso8601 ("2025-02-18T18:14:00+01:xx", NULL);
++  g_assert_null (dt);
++  dt = g_date_time_new_from_iso8601 ("2025-02-18T18:14:00+xx:00", NULL);
++  g_assert_null (dt);
++  dt = g_date_time_new_from_iso8601 ("2025-02-18T18:14:00+xx:xx", NULL);
++  g_assert_null (dt);
++  dt = g_date_time_new_from_iso8601 ("2025-02-18T18:14:00+01xx", NULL);
++  g_assert_null (dt);
++  dt = g_date_time_new_from_iso8601 ("2025-02-18T18:14:00+xx00", NULL);
++  g_assert_null (dt);
++  dt = g_date_time_new_from_iso8601 ("2025-02-18T18:14:00+xxxx", NULL);
++  g_assert_null (dt);
++  dt = g_date_time_new_from_iso8601 ("2025-02-18T18:14:00+xx", NULL);
++  g_assert_null (dt);
+ }
+ 
+ typedef struct {
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index b8c75eaa49..cebd84dd50 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -54,6 +54,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://gdatetime-test-fail-0001.patch \
            file://gdatetime-test-fail-0002.patch \
            file://gdatetime-test-fail-0003.patch \
+           file://CVE-2025-3360-01.patch \
+           file://CVE-2025-3360-02.patch \
+           file://CVE-2025-3360-03.patch \
+           file://CVE-2025-3360-04.patch \
+           file://CVE-2025-3360-05.patch \
+           file://CVE-2025-3360-06.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.43.0


