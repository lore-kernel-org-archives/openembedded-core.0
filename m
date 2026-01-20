Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8AAD2ED1C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5040.1768910957370183235
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=j/NndLk7;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4358fb60802so333489f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910955; x=1769515755; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ZLDwqE1n+QcrP7b7razpqFHWPthUb+Ua4LZfNS4D2Y=;
        b=j/NndLk7Eh5vp+4d8l9tH0zc1AfqhkNh1IH9Et0R/p2MQQYBSEOC7xJEINuzXjPlGo
         CeG39RuWbYq5edMy8BCuw6eFlvm7cVv8X3n4Ccw5hFQBKNSstbq8bcqZf+BMGdBzpuRw
         ECeakK4xVtEm7kGIO+0fD1WhwEqdzKqjNS0Hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910955; x=1769515755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZLDwqE1n+QcrP7b7razpqFHWPthUb+Ua4LZfNS4D2Y=;
        b=XnqncrG1cTzb72VN/H8CfgSSVs+4zPleZKkcrIHX4TpRmef/eqml+u79/jBK+j7CCh
         1bzUtV4XQqwI6TZH/lht7lDxca0Aeqe+fRmRmyWOmbpFBReNfxVWT1oFwcSvnmvU/z/T
         +iwxHIB4bpUgRvx6RM0CzH3NL1t1OrgHNWAyYDoEC2Y3Zsr6PFVZN+7U0VFE7f6cwPN8
         RsP2oqBssY99zVzFrc1TwbG+GgDiFpfwiV4mkGt2V/LT0Y7MmlkV9BQQtk5fjr4Mi1Dt
         ujeys1RCQznsSLl9ndFDE2LVFfxhbCq9XOmr+CaU5uB5EKg6fpE+OFoShQx0WZ8jz2S3
         BvSQ==
X-Gm-Message-State: AOJu0YyLHSVtdvyXfsik8KX7tOiE5aD6UKvdvLPec+lRbJuFoR41OayV
	3Hix9SRFS15COw5y7bguiA89CMyUC0TKY4VD4zAl1eyXaM9fDyOp8vm31/wJljaqLoeS1vImyKN
	qnd1e
X-Gm-Gg: AZuq6aKRrxSVx5V2DFk0CWlJLHTbHvzhvGNjRs4DsbjN5aiSRlWheGIbObWNAbQjpEt
	hoCQI2aeC4tRn+Zxpf7R+12d+9SPNVkEdyxC/uQxzJMqoVhFvGqNp5z/3KCR3fUaRUBliT/UqY6
	7ztgwK5sXNFRCXSGDpNIMQseBFocG65SPsS6R6JRBfOjFNliW97Zw2QcuU5Fhj+OT7USn1xHWnS
	W0ZzaZ2YN7iwU+1kYx65XKt9jC8ZRr7yMLUgHtuowMjPuT9OrfBGiOS/O8/Ie750eOqRa+citvU
	ip30kcgTCyB+80YDv9geaSih/6iSMJ80UGQZ+hl32YNQa2tZer9MTR6m0wcuMXWIu8rxKh8inwJ
	/d0F0B46vZEg9IayhicW/DBg9U7jgBjJwjd/4iA6sF3j16Jk4Q4NPIeAfQstDr0Px4QK5HC4NyC
	eY4ielWmR+SkAEiC+4rQ0t/tM2YHYLUbBTs6zPY+5hRddefm5N4BVgB1MqDxol7MdC4FuvjD0Rg
	gyxzXGTDt6waYCSIo70Vg==
X-Received: by 2002:a05:6000:2505:b0:432:88c4:e180 with SMTP id ffacd0b85a97d-434d75c16a2mr26586159f8f.15.1768910955247;
        Tue, 20 Jan 2026 04:09:15 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:14 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/22] glib-2.0: patch CVE-2025-13601
Date: Tue, 20 Jan 2026 13:08:19 +0100
Message-ID: <78a28bc320878736978ee72045b6a83fb1085522.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229683

From: Peter Marko <peter.marko@siemens.com>

Pick commits from [1] per [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4914
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-13601

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-13601-01.patch | 125 +++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-13601-02.patch | 128 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   2 +
 3 files changed, 255 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
new file mode 100644
index 0000000000..ae78832579
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
@@ -0,0 +1,125 @@
+From f28340ee62c655487972ad3c632d231ee098fb7f Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 13 Nov 2025 18:27:22 +0000
+Subject: [PATCH] gconvert: Error out if g_escape_uri_string() would overflow
+
+If the string to escape contains a very large number of unacceptable
+characters (which would need escaping), the calculation of the length of
+the escaped string could overflow, leading to a potential write off the
+end of the newly allocated string.
+
+In addition to that, the number of unacceptable characters was counted
+in a signed integer, which would overflow to become negative, making it
+easier for an attacker to craft an input string which would cause an
+out-of-bounds write.
+
+Fix that by validating the allocation length, and using an unsigned
+integer to count the number of unacceptable characters.
+
+Spotted by treeplus. Thanks to the Sovereign Tech Resilience programme
+from the Sovereign Tech Agency. ID: #YWH-PGM9867-134
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3827
+
+CVE: CVE-2025-13601
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/f28340ee62c655487972ad3c632d231ee098fb7f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gconvert.c | 36 +++++++++++++++++++++++++-----------
+ 1 file changed, 25 insertions(+), 11 deletions(-)
+
+diff --git a/glib/gconvert.c b/glib/gconvert.c
+index b066dd5a8..a02d2ea73 100644
+--- a/glib/gconvert.c
++++ b/glib/gconvert.c
+@@ -1428,8 +1428,9 @@ static const gchar hex[] = "0123456789ABCDEF";
+ /* Note: This escape function works on file: URIs, but if you want to
+  * escape something else, please read RFC-2396 */
+ static gchar *
+-g_escape_uri_string (const gchar *string, 
+-		     UnsafeCharacterSet mask)
++g_escape_uri_string (const gchar         *string,
++                     UnsafeCharacterSet   mask,
++                     GError             **error)
+ {
+ #define ACCEPTABLE(a) ((a)>=32 && (a)<128 && (acceptable[(a)-32] & use_mask))
+ 
+@@ -1437,7 +1438,7 @@ g_escape_uri_string (const gchar *string,
+   gchar *q;
+   gchar *result;
+   int c;
+-  gint unacceptable;
++  size_t unacceptable;
+   UnsafeCharacterSet use_mask;
+   
+   g_return_val_if_fail (mask == UNSAFE_ALL
+@@ -1454,7 +1455,14 @@ g_escape_uri_string (const gchar *string,
+       if (!ACCEPTABLE (c)) 
+ 	unacceptable++;
+     }
+-  
++
++  if (unacceptable >= (G_MAXSIZE - (p - string)) / 2)
++    {
++      g_set_error_literal (error, G_CONVERT_ERROR, G_CONVERT_ERROR_BAD_URI,
++                           _("The URI is too long"));
++      return NULL;
++    }
++
+   result = g_malloc (p - string + unacceptable * 2 + 1);
+   
+   use_mask = mask;
+@@ -1479,12 +1487,13 @@ g_escape_uri_string (const gchar *string,
+ 
+ 
+ static gchar *
+-g_escape_file_uri (const gchar *hostname,
+-		   const gchar *pathname)
++g_escape_file_uri (const gchar  *hostname,
++                   const gchar  *pathname,
++                   GError      **error)
+ {
+   char *escaped_hostname = NULL;
+-  char *escaped_path;
+-  char *res;
++  char *escaped_path = NULL;
++  char *res = NULL;
+ 
+ #ifdef G_OS_WIN32
+   char *p, *backslash;
+@@ -1505,10 +1514,14 @@ g_escape_file_uri (const gchar *hostname,
+ 
+   if (hostname && *hostname != '\0')
+     {
+-      escaped_hostname = g_escape_uri_string (hostname, UNSAFE_HOST);
++      escaped_hostname = g_escape_uri_string (hostname, UNSAFE_HOST, error);
++      if (escaped_hostname == NULL)
++        goto out;
+     }
+ 
+-  escaped_path = g_escape_uri_string (pathname, UNSAFE_PATH);
++  escaped_path = g_escape_uri_string (pathname, UNSAFE_PATH, error);
++  if (escaped_path == NULL)
++    goto out;
+ 
+   res = g_strconcat ("file://",
+ 		     (escaped_hostname) ? escaped_hostname : "",
+@@ -1516,6 +1529,7 @@ g_escape_file_uri (const gchar *hostname,
+ 		     escaped_path,
+ 		     NULL);
+ 
++out:
+ #ifdef G_OS_WIN32
+   g_free ((char *) pathname);
+ #endif
+@@ -1849,7 +1863,7 @@ g_filename_to_uri (const gchar *filename,
+     hostname = NULL;
+ #endif
+ 
+-  escaped_uri = g_escape_file_uri (hostname, filename);
++  escaped_uri = g_escape_file_uri (hostname, filename, error);
+ 
+   return escaped_uri;
+ }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch
new file mode 100644
index 0000000000..75c4955316
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch
@@ -0,0 +1,128 @@
+From 7bd3fc372040cdf8eada7f65c32c30da52a7461d Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 13 Nov 2025 18:31:43 +0000
+Subject: [PATCH] fuzzing: Add fuzz tests for g_filename_{to,from}_uri()
+
+These functions could be called on untrusted input data, and since they
+do URI escaping/unescaping, they have non-trivial string handling code.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+See: #3827
+
+CVE: CVE-2025-13601
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7bd3fc372040cdf8eada7f65c32c30da52a7461d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ fuzzing/fuzz_filename_from_uri.c | 40 ++++++++++++++++++++++++++++++++
+ fuzzing/fuzz_filename_to_uri.c   | 40 ++++++++++++++++++++++++++++++++
+ fuzzing/meson.build              |  2 ++
+ 3 files changed, 82 insertions(+)
+ create mode 100644 fuzzing/fuzz_filename_from_uri.c
+ create mode 100644 fuzzing/fuzz_filename_to_uri.c
+
+diff --git a/fuzzing/fuzz_filename_from_uri.c b/fuzzing/fuzz_filename_from_uri.c
+new file mode 100644
+index 000000000..9b7a715f0
+--- /dev/null
++++ b/fuzzing/fuzz_filename_from_uri.c
+@@ -0,0 +1,40 @@
++/*
++ * Copyright 2025 GNOME Foundation, Inc.
++ *
++ * SPDX-License-Identifier: LGPL-2.1-or-later
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
++ */
++
++#include "fuzz.h"
++
++int
++LLVMFuzzerTestOneInput (const unsigned char *data, size_t size)
++{
++  unsigned char *nul_terminated_data = NULL;
++  char *filename = NULL;
++  GError *local_error = NULL;
++
++  fuzz_set_logging_func ();
++
++  /* ignore @size (g_filename_from_uri() doesn’t support it); ensure @data is nul-terminated */
++  nul_terminated_data = (unsigned char *) g_strndup ((const char *) data, size);
++  filename = g_filename_from_uri ((const char *) nul_terminated_data, NULL, &local_error);
++  g_free (nul_terminated_data);
++
++  g_free (filename);
++  g_clear_error (&local_error);
++
++  return 0;
++}
+diff --git a/fuzzing/fuzz_filename_to_uri.c b/fuzzing/fuzz_filename_to_uri.c
+new file mode 100644
+index 000000000..acb319203
+--- /dev/null
++++ b/fuzzing/fuzz_filename_to_uri.c
+@@ -0,0 +1,40 @@
++/*
++ * Copyright 2025 GNOME Foundation, Inc.
++ *
++ * SPDX-License-Identifier: LGPL-2.1-or-later
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
++ */
++
++#include "fuzz.h"
++
++int
++LLVMFuzzerTestOneInput (const unsigned char *data, size_t size)
++{
++  unsigned char *nul_terminated_data = NULL;
++  char *uri = NULL;
++  GError *local_error = NULL;
++
++  fuzz_set_logging_func ();
++
++  /* ignore @size (g_filename_to_uri() doesn’t support it); ensure @data is nul-terminated */
++  nul_terminated_data = (unsigned char *) g_strndup ((const char *) data, size);
++  uri = g_filename_to_uri ((const char *) nul_terminated_data, NULL, &local_error);
++  g_free (nul_terminated_data);
++
++  g_free (uri);
++  g_clear_error (&local_error);
++
++  return 0;
++}
+diff --git a/fuzzing/meson.build b/fuzzing/meson.build
+index addbe9071..05f936eeb 100644
+--- a/fuzzing/meson.build
++++ b/fuzzing/meson.build
+@@ -22,6 +22,8 @@ fuzz_targets = [
+   'fuzz_date_parse',
+   'fuzz_date_time_new_from_iso8601',
+   'fuzz_dbus_message',
++  'fuzz_filename_from_uri',
++  'fuzz_filename_to_uri',
+   'fuzz_inet_address_mask_new_from_string',
+   'fuzz_inet_address_new_from_string',
+   'fuzz_inet_socket_address_new_from_string',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 9f93655739..e80ddab4d6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -33,6 +33,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-6052-01.patch \
            file://CVE-2025-6052-02.patch \
            file://CVE-2025-6052-03.patch \
+           file://CVE-2025-13601-01.patch \
+           file://CVE-2025-13601-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

