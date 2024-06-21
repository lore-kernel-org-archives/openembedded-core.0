Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE679C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 06:49:27 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.67121.1718952557587911184
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 23:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=A8bnLrHD;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-704090c11easo1355971b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 23:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718952556; x=1719557356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ADp6gHUV/SJ8z1mvHY27vHz9/QQNv/gKrtAWjPxHwX4=;
        b=A8bnLrHDq1u/cJSms6v56803mqFPOiVxH4S+xuisnhrPFEgxy0WyBKUTQLLRvTCuXI
         ZBuBYNRj9scT3RI6Azu52KRAawwpguaGHnVq+Nm2Aif24EkKoOlnaLNYyC+HbKs7qg51
         ly1rKxOZ6MgYET/QH+YpwnA7l2BgfTnD6qk8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718952556; x=1719557356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ADp6gHUV/SJ8z1mvHY27vHz9/QQNv/gKrtAWjPxHwX4=;
        b=XiQqQyZlC+co4JxRk0x13oyNaJyuleyI5cmLPLxuDlxCE/H11VgrObDGQ2zNifi7yc
         b+qASPXOicKhYR8vA2uoofDR4evyrV0WUsdvCrZtf7KLW3oXbFJ+l4e4yNhNj2u7M7bf
         VjCGmLd5T4oVUwyX6nDSbY4Vn7HTMyxaFLnZRzMAISo9hMpOqdWgMXHI/WKWtAGfQof7
         JeJM9gH5+88hpoJfAeI3UMGPnecJA2PI2NmduWhAUKqEFEXFojiXJhTYtIF+hyfhnd9g
         jgzm8X111xfzapFDnCeIDCKhABO7Fq8DTIZHHDn0lBUMqfej3Vj54wKLCL57I1P4HiAX
         2QBQ==
X-Gm-Message-State: AOJu0YxqY8L8QopJEzsU2Hxr+x/F9S+x1P8aUZ7gWwulHf+QR11ui+dR
	TTgo4UNl7TQGgarKeyg/zOo7re/UgRHCdBJK15+uzPdeVOg627SqT+i9X6XL08Hf3aszHSyjL5Q
	zPmo=
X-Google-Smtp-Source: AGHT+IG4Ccw+4SKxlpkIf3Vwhl4R7LkbZ0Cf5PHuHkhwpGlLcd9XxNVOmX7X2Ppfte9a3snjDcYKxA==
X-Received: by 2002:a05:6a00:124f:b0:706:3ba3:a192 with SMTP id d2e1a72fcca58-7063ba3a6c5mr6240982b3a.22.1718952555733;
        Thu, 20 Jun 2024 23:49:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:882e:b65b:f1c5:a0b5:3175:f39a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706512656fesm687183b3a.139.2024.06.20.23.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:49:15 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][PATCH] wget: Fix for CVE-2024-38428
Date: Fri, 21 Jun 2024 12:19:04 +0530
Message-Id: <20240621064904.1250032-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 06:49:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200997

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.savannah.gnu.org/cgit/wget.git/commit/?id=ed0c7c7e0e8f7298352646b2fd6e06a11e242ace]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wget/wget/CVE-2024-38428.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.24.5.bb     |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2024-38428.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2024-38428.patch b/meta/recipes-extended/wget/wget/CVE-2024-38428.patch
new file mode 100644
index 0000000000..ed99a05464
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2024-38428.patch
@@ -0,0 +1,79 @@
+From ed0c7c7e0e8f7298352646b2fd6e06a11e242ace Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Sun, 2 Jun 2024 12:40:16 +0200
+Subject: Properly re-implement userinfo parsing (rfc2396)
+
+* src/url.c (url_skip_credentials): Properly re-implement userinfo parsing (rfc2396)
+
+The reason why the implementation is based on RFC 2396, an outdated standard,
+is that the whole file is based on that RFC, and mixing standard here might be
+dangerous.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/wget.git/commit/?id=ed0c7c7e0e8f7298352646b2fd6e06a11e242ace]
+CVE: CVE-2024-38428
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/url.c | 40 ++++++++++++++++++++++++++++++++++------
+ 1 file changed, 34 insertions(+), 6 deletions(-)
+
+diff --git a/src/url.c b/src/url.c
+index 69e948b..07c3bc8 100644
+--- a/src/url.c
++++ b/src/url.c
+@@ -41,6 +41,7 @@ as that of the covered work.  */
+ #include "url.h"
+ #include "host.h"  /* for is_valid_ipv6_address */
+ #include "c-strcase.h"
++#include "c-ctype.h"
+ 
+ #ifdef HAVE_ICONV
+ # include <iconv.h>
+@@ -526,12 +527,39 @@ scheme_leading_string (enum url_scheme scheme)
+ static const char *
+ url_skip_credentials (const char *url)
+ {
+-  /* Look for '@' that comes before terminators, such as '/', '?',
+-     '#', or ';'.  */
+-  const char *p = (const char *)strpbrk (url, "@/?#;");
+-  if (!p || *p != '@')
+-    return url;
+-  return p + 1;
++  /*
++   * This whole file implements https://www.rfc-editor.org/rfc/rfc2396 .
++   * RFC 2396 is outdated since 2005 and needs a rewrite or a thorough re-visit.
++   *
++   * The RFC says
++   * server        = [ [ userinfo "@" ] hostport ]
++   * userinfo      = *( unreserved | escaped | ";" | ":" | "&" | "=" | "+" | "$" | "," )
++   * unreserved    = alphanum | mark
++   * mark          = "-" | "_" | "." | "!" | "~" | "*" | "'" | "(" | ")"
++   */
++  static const char *allowed = "-_.!~*'();:&=+$,";
++
++  for (const char *p = url; *p; p++)
++    {
++      if (c_isalnum(*p))
++        continue;
++
++      if (strchr(allowed, *p))
++        continue;
++
++      if (*p == '%' && c_isxdigit(p[1]) && c_isxdigit(p[2]))
++        {
++          p += 2;
++          continue;
++        }
++
++      if (*p == '@')
++        return p + 1;
++
++      break;
++    }
++
++  return url;
+ }
+ 
+ /* Parse credentials contained in [BEG, END).  The region is expected
+-- 
+cgit v1.1
+
diff --git a/meta/recipes-extended/wget/wget_1.24.5.bb b/meta/recipes-extended/wget/wget_1.24.5.bb
index 64e6ee80af..602fc9e627 100644
--- a/meta/recipes-extended/wget/wget_1.24.5.bb
+++ b/meta/recipes-extended/wget/wget_1.24.5.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2024-38428.patch \
           "
 
 SRC_URI[sha256sum] = "fa2dc35bab5184ecbc46a9ef83def2aaaa3f4c9f3c97d4bd19dcb07d4da637de"
-- 
2.25.1


