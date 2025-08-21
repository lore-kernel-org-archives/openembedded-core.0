Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B534CCA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:27 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.713.1755790821308639681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mJwB5qDV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b476c67c5easo808923a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790820; x=1756395620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIfJ1F9Gy0TUcBrvWp+MnVVECUxFK7nwMeaI8G8EruY=;
        b=mJwB5qDVye6VX01vUMspdXhqgcWsMPy/7tY9Y/9sEu8Y1tqgsleBbQkKF2nTFHzlGV
         ZI4HD3JGCbScKbh7M2Ca0vAwEpvCc50S0urllSa3z9KP+TPHO+MxLqfRcNdvviQIDfsW
         BY04WTgpxj7YiUIUEUl0NKSeUayXzFLhfSWxaCn38UWkVfKqh7yssf9Sq2Uiab2rQAfh
         ucCOvGhP3cve1jiI54Aw6zVFjQNbvWFnH0PFnQUuBE3pAhxhghaj3HIoN93AIomLkfgK
         wkXmLqUmBwlDpsdRfHJENmmRyg44Zorsl/AgaV0iG2AG9+/KEshQ2LpmTjjHn391EhYm
         i9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790820; x=1756395620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIfJ1F9Gy0TUcBrvWp+MnVVECUxFK7nwMeaI8G8EruY=;
        b=aF0agivQdAQdx47IXv5utYBvpiKb9AcF/nnhvIjno+JPaDQiB1UOEENQZ6DMeN/wmR
         XjssrEWUbjfSVhM072DZS82fT//pj/GvY1UursMJvI+6XxROporcgZXMMq1kCKXXl4l/
         5Zfu/hWm3N4oIlhnK0VwsYU4Seo4KZs0Em4/g2MxyUn4ok1AhIdCTUH058M1FNEIxL4x
         3fy/aO7utblN+9DKwXU/eLCQZ1CXk/C+1x9yDhRD5HIWKjh51BNlEC7SwpJDCK2MmL2h
         pdRSvfBetce+if9I4IPo0gku1D43Msubt9xWmbG2rjxzkFAVw02xnCVRQsKJY+iebVFF
         IX0g==
X-Gm-Message-State: AOJu0YwZhll0xSFZiCKU/GQP7jZFOVoucObjT7EIbOMOQ47jyZXB05ID
	bQCTsQss+xgnUkW3eNULHtschl2rVOhiyQYUjmlNgW8O62CMw/8WmKbOsrQRVXLnCM2T35q9hXq
	IJPkp
X-Gm-Gg: ASbGnctqYhTU+V2naI7C8raogCy+RKpZXYQMXqhtq4fo8odVsMzKfwtJfVKFDEwZF7F
	beIjRsaCS+9n3n+ujpkm1GJipsrMQJIoQsrdEpqq/aK9ynjzaLXUwTF9cJn9NLH5YKIYHxEv/JX
	oGQoVXXC9OA2tOR8gfUqm0rrdLih9nHGdxWt6EyxoHMcdjguy7C+5cmDABrWfbw0oRNfoIRgImD
	wbA/oEhSAfKSQ2BgpuNAPw9Ku9/G4i0ZL4F28fuTaHfngENV3qZ93t0aTPj3LmASgn/4DnFtnOC
	Z6P2kOJbMX3NWk07sdJbyItMNt9ed0yZrKdmnPo1Uzxdm9PtWPW5nLjVKk0RAi/2bYWb1C0BAfB
	thUHf7eCR1CJS9w==
X-Google-Smtp-Source: AGHT+IFwkV7o/WoMmYgf4EOz1fd53yhq/tsCZWIZXI8VgKcDhRxeue1Q2/cFTsnTBqClo5FmRoUKAw==
X-Received: by 2002:a17:903:1c9:b0:240:8381:45b9 with SMTP id d9443c01a7336-246061bd07emr33960855ad.8.1755790820356;
        Thu, 21 Aug 2025 08:40:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/15] glib-2.0: patch CVE-2025-6052
Date: Thu, 21 Aug 2025 08:39:51 -0700
Message-ID: <a96c84cb861cb550ddcabd2396a74b00f0035ba4.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222259

From: Peter Marko <peter.marko@siemens.com>

Backport commits from [1] which references this CVE.

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4681

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/files/CVE-2025-6052-1.patch      | 97 +++++++++++++++++++
 .../glib-2.0/files/CVE-2025-6052-2.patch      | 35 +++++++
 meta/recipes-core/glib-2.0/glib.inc           |  4 +-
 3 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
new file mode 100644
index 0000000000..a344735ee4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
@@ -0,0 +1,97 @@
+From 6aa97beda32bb337370858862f4efe2f3372619f Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 7 Jul 2025 20:52:24 +0200
+Subject: [PATCH] gstring: Fix g_string_sized_new segmentation fault
+
+If glib is compiled with -Dglib_assert=false, i.e. no asserts
+enabled, then g_string_sized_new(G_MAXSIZE) leads to a segmentation
+fault due to an out of boundary write.
+
+This happens because the overflow check was moved into
+g_string_maybe_expand which is not called by g_string_sized_new.
+
+By assuming that string->allocated_len is always larger than
+string->len (and the code would be in huge trouble if that is not true),
+the G_UNLIKELY check in g_string_maybe_expand can be rephrased to
+avoid a potential G_MAXSIZE overflow.
+
+This in turn leads to 150-200 bytes smaller compiled library
+depending on gcc and clang versions, and one less check for the most
+common code paths.
+
+Reverts https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655 and
+reorders internal g_string_maybe_expand check to still fix
+CVE-2025-6052.
+
+CVE: CVE-2025-6052
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/6aa97beda32bb337370858862f4efe2f3372619f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gstring.c      | 10 +++++-----
+ glib/tests/string.c | 18 ++++++++++++++++++
+ 2 files changed, 23 insertions(+), 5 deletions(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index 010a8e976..24c4bfb40 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -68,6 +68,10 @@ static void
+ g_string_expand (GString *string,
+                  gsize    len)
+ {
++  /* Detect potential overflow */
++  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
++    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
++
+   string->allocated_len = g_nearest_pow (string->len + len + 1);
+   /* If the new size is bigger than G_MAXSIZE / 2, only allocate enough
+    * memory for this string and don't over-allocate.
+@@ -82,11 +86,7 @@ static inline void
+ g_string_maybe_expand (GString *string,
+                        gsize    len)
+ {
+-  /* Detect potential overflow */
+-  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
+-    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
+-
+-  if (G_UNLIKELY (string->len + len >= string->allocated_len))
++  if (G_UNLIKELY (len >= string->allocated_len - string->len))
+     g_string_expand (string, len);
+ }
+ 
+diff --git a/glib/tests/string.c b/glib/tests/string.c
+index aa363c57a..e3bc4a02e 100644
+--- a/glib/tests/string.c
++++ b/glib/tests/string.c
+@@ -767,6 +767,23 @@ test_string_new_take_null (void)
+   g_string_free (g_steal_pointer (&string), TRUE);
+ }
+ 
++static void
++test_string_sized_new (void)
++{
++
++  if (g_test_subprocess ())
++    {
++      GString *string = g_string_sized_new (G_MAXSIZE);
++      g_string_free (string, TRUE);
++    }
++  else
++    {
++      g_test_trap_subprocess (NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
++      g_test_trap_assert_failed ();
++      g_test_trap_assert_stderr ("*string would overflow*");
++    }
++}
++
+ int
+ main (int   argc,
+       char *argv[])
+@@ -796,6 +813,7 @@ main (int   argc,
+   g_test_add_func ("/string/test-string-steal", test_string_steal);
+   g_test_add_func ("/string/test-string-new-take", test_string_new_take);
+   g_test_add_func ("/string/test-string-new-take/null", test_string_new_take_null);
++  g_test_add_func ("/string/sized-new", test_string_sized_new);
+ 
+   return g_test_run();
+ }
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
new file mode 100644
index 0000000000..703dfdf46c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
@@ -0,0 +1,35 @@
+From 3752760c5091eaed561ec11636b069e529533514 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 7 Jul 2025 20:57:41 +0200
+Subject: [PATCH] gstring: Improve g_string_append_len_inline checks
+
+Use the same style for the G_LIKELY check here as in g_string_sized_new.
+The check could overflow on 32 bit systems.
+
+Also improve the memcpy/memmove check to use memcpy if val itself is
+adjacent to end + len_unsigned, which means that no overlapping exists.
+
+CVE: CVE-2025-6052
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/3752760c5091eaed561ec11636b069e529533514]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gstring.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gstring.h b/glib/gstring.h
+index e817176c9..c5e64b33a 100644
+--- a/glib/gstring.h
++++ b/glib/gstring.h
+@@ -232,10 +232,10 @@ g_string_append_len_inline (GString    *gstring,
+   else
+     len_unsigned = (gsize) len;
+ 
+-  if (G_LIKELY (gstring->len + len_unsigned < gstring->allocated_len))
++  if (G_LIKELY (len_unsigned < gstring->allocated_len - gstring->len))
+     {
+       char *end = gstring->str + gstring->len;
+-      if (G_LIKELY (val + len_unsigned <= end || val > end + len_unsigned))
++      if (G_LIKELY (val + len_unsigned <= end || val >= end + len_unsigned))
+         memcpy (end, val, len_unsigned);
+       else
+         memmove (end, val, len_unsigned);
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c171598bed..b967b9402f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -229,8 +229,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
+           file://CVE-2025-6052-1.patch \
+           file://CVE-2025-6052-2.patch \
            "
-SRC_URI:append:class-native = " file://relocate-modules.patch \ 
+SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 
-- 
2.43.0


