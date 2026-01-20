Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FA0D2ED1E
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6476.1768916286577835040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=s83eexXc;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so28343105e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916285; x=1769521085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8JYF2cyHUfWDJey2loykvzrNeiUKjbtVyGlK5PJGUQ=;
        b=s83eexXctnurW9+wz5PvFru4eZBi2TWhIrzRsYTR44DQ6BN1WmaoeMmxvEaB5t/ge+
         GYXHI85QPKvehR8ABb6JXOpTijDdrAcApXnN67/1leouZk/jl5VHlKtU6iApXB0RIs2M
         ouNLzfH0S0J+EgFayCfPuXhhKGj8boCjBdLw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916285; x=1769521085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z8JYF2cyHUfWDJey2loykvzrNeiUKjbtVyGlK5PJGUQ=;
        b=Xwx7kf1O9NSU4OWjth2tqgiPPkb/sX4W7RRtf/jh+EBmJUMAGrggYLMGNDsDiCL2Zi
         43pJB8po7aKH8PkPrm78BguHrVY2ToKnluku2h0RsVjBIfSUeNdM7qbbJkJoO+Dk3/49
         gIB9wOAtvqNGdfvF/wxg/uib1obIk2sUUrt+pxwzr4xaZLcFd4/jNHSmxtLTkTIc8Guq
         q5XgNXWQQUl24EolIlbhgDZ5SaJt4jOkWVh1cyoa9tEw1LM/gEY6VUyd5SA/s/Ex6crE
         +bXPYDUQN4gKneYLK6OenyYpTRFOcDBDPv55mV9EQORZ+BMnzW8Nxm2clJnNidUwqhrG
         gbVA==
X-Gm-Message-State: AOJu0YybwoYm4Dt3kgdOBUXadLrOZU9ei62DYrkKnmI8Bh/4Ene4YwVn
	T3RjJIf6njsk4QSsUVn3FalTpUyCnu5+eegSJeYcn5BtiSP//hFbYSeUrMmdcXIU5MSSi+6y+fN
	ahc9O
X-Gm-Gg: AY/fxX7Z8qyMFA9g9+2AxAtzi+goMety90Awi4WhItgfkL6EiR/wIA/zsf9c6AaWRnK
	AVpUkwwEJ9NhH/VJISK7uMNYGG8SgosQfD94RAmOrCA5Y67LhMhfE8zSusH0nxmig6MzCAm6Yon
	STSXpkFirfqZiDG4UxVNsw04U+Twn0+ICWOgYNvTcHfaKp5+syvBCDBADsQ6JmZR7VCZnc1YzsY
	8IOxnyeFfJCQe96+qIXxfFMG8mAwVdobR2HLq0sLBgHW1YpCirYbyPYWb3gy5uIkowowNm+BIDO
	TrZjqCrWEmStoQuNXIlgXZ23RWKNDT5pw+yacd3XKzloPoUkog3BFI979P5nTWigzSfcACz5xuo
	kt7rItfKCVaA1/Gzmo7zXh5Lc4vQJ5/mSZWH3SmpaO0yqc3N+4Z1idTGdPQUJ69+DhEL36ZbZXW
	u5iBt0FWPH8jN8ZonMqVg0U6TpPmy8/MKcsbsbkgimH2vZppn6fh/zow4A4xpZ6Rao4oLilL5o8
	KR9VjqkY7AR2grp/Fk22g==
X-Received: by 2002:a05:600c:3b84:b0:47e:e575:a33e with SMTP id 5b1f17b1804b1-4801eb14eb8mr179416945e9.33.1768916284451;
        Tue, 20 Jan 2026 05:38:04 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/26] glib-2.0: patch CVE-2025-13601
Date: Tue, 20 Jan 2026 14:37:24 +0100
Message-ID: <d8d0ea03dc1a67ebb9ab055426728e37e476ba3d.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229708

From: Peter Marko <peter.marko@siemens.com>

Pick commits from [1] per [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4914
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-13601

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2025-13601-01.patch | 125 +++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-13601-02.patch | 128 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   2 +
 3 files changed, 255 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
new file mode 100644
index 0000000000..7046d2405e
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
+@@ -1425,8 +1425,9 @@ static const gchar hex[] = "0123456789ABCDEF";
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
+@@ -1434,7 +1435,7 @@ g_escape_uri_string (const gchar *string,
+   gchar *q;
+   gchar *result;
+   int c;
+-  gint unacceptable;
++  size_t unacceptable;
+   UnsafeCharacterSet use_mask;
+   
+   g_return_val_if_fail (mask == UNSAFE_ALL
+@@ -1451,7 +1452,14 @@ g_escape_uri_string (const gchar *string,
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
+@@ -1476,12 +1484,13 @@ g_escape_uri_string (const gchar *string,
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
+@@ -1502,10 +1511,14 @@ g_escape_file_uri (const gchar *hostname,
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
+@@ -1513,6 +1526,7 @@ g_escape_file_uri (const gchar *hostname,
+ 		     escaped_path,
+ 		     NULL);
+ 
++out:
+ #ifdef G_OS_WIN32
+   g_free ((char *) pathname);
+ #endif
+@@ -1832,7 +1846,7 @@ g_filename_to_uri (const gchar *filename,
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
index 0000000000..4be8d0d947
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
+@@ -4,6 +4,8 @@ fuzz_targets = [
+   'fuzz_date_parse',
+   'fuzz_date_time_new_from_iso8601',
+   'fuzz_dbus_message',
++  'fuzz_filename_from_uri',
++  'fuzz_filename_to_uri',
+   'fuzz_inet_address_mask_new_from_string',
+   'fuzz_inet_address_new_from_string',
+   'fuzz_inet_socket_address_new_from_string',
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 7ba52b5c79..1c4c21614a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -64,6 +64,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-4373-02.patch \
            file://CVE-2025-7039-01.patch \
            file://CVE-2025-7039-02.patch \
+           file://CVE-2025-13601-01.patch \
+           file://CVE-2025-13601-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

