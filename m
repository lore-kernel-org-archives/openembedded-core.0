Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181CBD5808D
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:02:04 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.17238.1732536116378753920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d134lym+;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso39601745e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536115; x=1733140915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3MaceYXMTTWpdpRbRHpbKarErqfZJELCRywK9RA5xM=;
        b=d134lym+f1YEDmk2d/bikxKWNcNmKa3HgdygUxcJt7pPzlCdNvbAt/C6vjM44jZQJH
         OqtjYmOwTlH7J8Nd5N5n7gwzE0qZW1C/F062kNviTVQWZ7hIMZvzfudKOsQyAC5JaBm7
         Ek+yItSuM5D0TzuxXPpBzbvApwP7CU4hVEnaFFDbYLjacF20W7wTLkksyVKV0zZAWvQs
         Ule/UH3m//TRJYkyC91WbqjDTD2d+42Ra8PyQEXQ/CvfTi+rS3Dt/WNk8cPKvAWhCnjt
         cnXLbkzOP1l/WqIVTvcbF6Z0uzreli7+uUlwFDpQm83TL+J3toBKEDjAKuM7qJsKxYV1
         JZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536115; x=1733140915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3MaceYXMTTWpdpRbRHpbKarErqfZJELCRywK9RA5xM=;
        b=kpdMx64LzslAOaY78IxPocf7TLtKhJp1niRbOFrjD7d4XXRJW0Oy7btDoOoPbI0n4f
         HYo3BWNN89CA/uH4QpYU7yk2lyxyASwREsTYOc/xHNiO8RAadA3I0fIeL5kii70mTZDC
         6ZieRgsFmboACJRtno9s8Xi7iZtWnZQV0lTDvVdjlVtQ0/IdfOUu7SFBQ4dWs3uyS+8H
         NmPH9AIn9jm/Sy2Wtrt6PPDc+lrh5pSM/mvGOzDHn4VpLkH0/Z9d79aUILaaCfN+twGw
         oW8H4twXKkjUSCqvQIvmwPuE4rfs8X3sorwbTQzbUZjUoa0USYTiRH5wvCkY3k+Sn6Bt
         cvLg==
X-Gm-Message-State: AOJu0Yzr5UBIZ6cdw6tjA0Svu+VImg6iKZpnn+t2UEQWjYvOc9htZkQP
	mUcZ9VTpU8cNqzSpWeU9Ha1xaP4DSJxcv86MPs5SJr4ux2/rVl9PhAYXBw==
X-Gm-Gg: ASbGnct7JBHGgGCPaqC6bt+S5w8gCZ7F0b9CTAT3j7dLPZR+/pymgfFqCKeYvcMvWUF
	RAY72cxDFrKGzqkYC5pUe5Bdrsjcmqx7OFbZQdgtt+l1VrYCBNdIXGJPqj6oufiO6IvBy9zNB8V
	ABN0WJz3JtwgJ77SlG3ChyftaYPej4zTY27/sJrdr5t9CnZLWesm8cUxapGbysJJ4mkwBlEF2tR
	YqYU5Tpib2QOr7ZUj2ZbkpL6EZVZ0gqdn3UHao2frZVYTdrXDY7bXNV+3EerF2B3/CS1tMfsxeq
	cOpAkuhYAeg=
X-Google-Smtp-Source: AGHT+IHkP60FbyuA4DgS2XNlO3HZneGFHppo7RHN3KB/rb0Ifs2fAe8uwdETPbSBb5Elk9O3FvBwKg==
X-Received: by 2002:a05:600c:3ca9:b0:431:40ca:ce5d with SMTP id 5b1f17b1804b1-433ce4912a3mr93594945e9.23.1732536114554;
        Mon, 25 Nov 2024 04:01:54 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 32/35] wget: upgrade 1.24.5 -> 1.25.0
Date: Mon, 25 Nov 2024 13:01:24 +0100
Message-Id: <20241125120127.2205232-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207779

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../wget/0002-improve-reproducibility.patch   |  6 +-
 .../wget/wget/CVE-2024-38428.patch            | 79 -------------------
 meta/recipes-extended/wget/wget_1.24.5.bb     |  8 --
 meta/recipes-extended/wget/wget_1.25.0.bb     |  7 ++
 4 files changed, 10 insertions(+), 90 deletions(-)
 delete mode 100644 meta/recipes-extended/wget/wget/CVE-2024-38428.patch
 delete mode 100644 meta/recipes-extended/wget/wget_1.24.5.bb
 create mode 100644 meta/recipes-extended/wget/wget_1.25.0.bb

diff --git a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
index 5438bafdcbd..6ecb9ef289f 100644
--- a/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
+++ b/meta/recipes-extended/wget/wget/0002-improve-reproducibility.patch
@@ -1,4 +1,4 @@
-From b86e57b68363d108fe77c6fd588a275d2696cabe Mon Sep 17 00:00:00 2001
+From 304f55a3e2689154d829938d29e43d808ca6298a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 10 Jan 2018 14:43:20 +0800
 Subject: [PATCH] src/Makefile.am: improve reproducibility
@@ -44,10 +44,10 @@ Signed-off-by: Joe Slater <jslater@windriver.com>
  1 file changed, 4 insertions(+)
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index 18ec622..38d252d 100644
+index 86be533..721a401 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -108,9 +108,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
+@@ -126,9 +126,13 @@ version.c:  $(wget_SOURCES) ../lib/libgnu.a
  	echo '#include "version.h"' >> $@
  	echo 'const char *version_string = "@VERSION@";' >> $@
  	echo 'const char *compilation_string = "'$(COMPILE)'";' \
diff --git a/meta/recipes-extended/wget/wget/CVE-2024-38428.patch b/meta/recipes-extended/wget/wget/CVE-2024-38428.patch
deleted file mode 100644
index ed99a05464f..00000000000
--- a/meta/recipes-extended/wget/wget/CVE-2024-38428.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From ed0c7c7e0e8f7298352646b2fd6e06a11e242ace Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Sun, 2 Jun 2024 12:40:16 +0200
-Subject: Properly re-implement userinfo parsing (rfc2396)
-
-* src/url.c (url_skip_credentials): Properly re-implement userinfo parsing (rfc2396)
-
-The reason why the implementation is based on RFC 2396, an outdated standard,
-is that the whole file is based on that RFC, and mixing standard here might be
-dangerous.
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/wget.git/commit/?id=ed0c7c7e0e8f7298352646b2fd6e06a11e242ace]
-CVE: CVE-2024-38428
-Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
----
- src/url.c | 40 ++++++++++++++++++++++++++++++++++------
- 1 file changed, 34 insertions(+), 6 deletions(-)
-
-diff --git a/src/url.c b/src/url.c
-index 69e948b..07c3bc8 100644
---- a/src/url.c
-+++ b/src/url.c
-@@ -41,6 +41,7 @@ as that of the covered work.  */
- #include "url.h"
- #include "host.h"  /* for is_valid_ipv6_address */
- #include "c-strcase.h"
-+#include "c-ctype.h"
- 
- #ifdef HAVE_ICONV
- # include <iconv.h>
-@@ -526,12 +527,39 @@ scheme_leading_string (enum url_scheme scheme)
- static const char *
- url_skip_credentials (const char *url)
- {
--  /* Look for '@' that comes before terminators, such as '/', '?',
--     '#', or ';'.  */
--  const char *p = (const char *)strpbrk (url, "@/?#;");
--  if (!p || *p != '@')
--    return url;
--  return p + 1;
-+  /*
-+   * This whole file implements https://www.rfc-editor.org/rfc/rfc2396 .
-+   * RFC 2396 is outdated since 2005 and needs a rewrite or a thorough re-visit.
-+   *
-+   * The RFC says
-+   * server        = [ [ userinfo "@" ] hostport ]
-+   * userinfo      = *( unreserved | escaped | ";" | ":" | "&" | "=" | "+" | "$" | "," )
-+   * unreserved    = alphanum | mark
-+   * mark          = "-" | "_" | "." | "!" | "~" | "*" | "'" | "(" | ")"
-+   */
-+  static const char *allowed = "-_.!~*'();:&=+$,";
-+
-+  for (const char *p = url; *p; p++)
-+    {
-+      if (c_isalnum(*p))
-+        continue;
-+
-+      if (strchr(allowed, *p))
-+        continue;
-+
-+      if (*p == '%' && c_isxdigit(p[1]) && c_isxdigit(p[2]))
-+        {
-+          p += 2;
-+          continue;
-+        }
-+
-+      if (*p == '@')
-+        return p + 1;
-+
-+      break;
-+    }
-+
-+  return url;
- }
- 
- /* Parse credentials contained in [BEG, END).  The region is expected
--- 
-cgit v1.1
-
diff --git a/meta/recipes-extended/wget/wget_1.24.5.bb b/meta/recipes-extended/wget/wget_1.24.5.bb
deleted file mode 100644
index 602fc9e6274..00000000000
--- a/meta/recipes-extended/wget/wget_1.24.5.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-           file://0002-improve-reproducibility.patch \
-           file://CVE-2024-38428.patch \
-          "
-
-SRC_URI[sha256sum] = "fa2dc35bab5184ecbc46a9ef83def2aaaa3f4c9f3c97d4bd19dcb07d4da637de"
-
-require wget.inc
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
new file mode 100644
index 00000000000..93fefc90926
--- /dev/null
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -0,0 +1,7 @@
+SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+           file://0002-improve-reproducibility.patch \
+           "
+
+SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
+
+require wget.inc
-- 
2.39.5


