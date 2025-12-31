Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABCBEE6420
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 09:55:20 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82856.1767174913728501275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 01:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=h2LuCmng;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2025123109551060e2f1cfc000020728-2ymigz@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2025123109551060e2f1cfc000020728
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 10:55:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XF6ibA892xrRNetSR/n36ocbCTp+2nGFwlw+tWBblK0=;
 b=h2LuCmngX9YgbDbBQjKFPfGSCUkPTsplpRU3kuwyEo6pzckYb8ZdXd09Aw/4fr0WzkclU5
 0rr2VYznnl+AxBFKgEPzh2kVK8e+1em4TfRzLHPLoP747fVRtVD0TfAKJg7YnQE52eW9/kWB
 axQbrQGlqTh4sz6V6c9wxSPHbZmTwGtw1LYy+BCcbE2ZkDaJ7FxN4MIfWMUVNidWaFYv0rF3
 /afAV6RXzSImdFzOBwgkKqt9brkvjt4Ll2+ZXDpaOVjTkDCyrwq/i6m0AyhpC2gif05jOlqB
 yNEdJoTefVY+ad7EJEo8rqMfZUHMJ7GSKB1yl8mcSvjXb3ANDl54ugog==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/3] glib-2.0: patch CVE-2025-13601
Date: Wed, 31 Dec 2025 10:54:47 +0100
Message-Id: <20251231095449.920180-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 09:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228725

From: Peter Marko <peter.marko@siemens.com>

Pick commits from [1] per [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4914
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-13601

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-13601-01.patch | 125 +++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-13601-02.patch | 128 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   2 +
 3 files changed, 255 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
new file mode 100644
index 00000000000..ae788325790
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
index 00000000000..75c4955316b
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
index 9f93655739b..e80ddab4d67 100644
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

