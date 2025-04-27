Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4F1C369D1
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 18:31:00 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.31267.1745778650578969291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 11:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HJLwPLcG;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025042718304758bda2b8a709b552a0-bdak54@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025042718304758bda2b8a709b552a0
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 20:30:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fwRdCNhD3CzrEf8+lwZdgAUXMbYaNpNbeFOs1BX5M3g=;
 b=HJLwPLcGFAO0mZdG8Y4IUT50kDT3AnapXetkZFuWOtEh/OUy9rKgUMkULQn0QVOUNUeawz
 z0rVjcDmAq1J14I9oKZth9bgX+3j+ux8R6qXvzY17uhknqphDQA6+RaxapxIQULm4vMDk0dS
 vE5D7jAfyRz3OswP+O64/NKLJ47zKqFqNgzZiTVJzDXl/5zT4I1tpgGyzTX/UTP+owp7mr3Q
 s/cOvdaQGeQgwne6i8HC2YiriYkcOa/CWas0AnbyDfCEVHmFKN+rAW/q3KMYIaQnPR/Ch8ko
 RzLbcvZjdMHAohFFGsm/lCp6uvPoBQ+djXSkE5TXrTbCE05DHab/XSxQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glib-2.0: patch CVE-2025-3360
Date: Sun, 27 Apr 2025 20:30:01 +0200
Message-Id: <20250427183001.1755434-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 18:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215566

From: Peter Marko <peter.marko@siemens.com>

Backport commits from [1] fixing [2] for 2.82.x.

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4499
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3647x

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
 

