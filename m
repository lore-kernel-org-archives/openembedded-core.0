Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B1FC27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 06:51:47 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.67034.1718952697909248451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 23:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gNqyU7z5;
 spf=pass (domain: mvista.com, ip: 209.85.167.176, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3c9d70d93dbso1104338b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 23:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718952696; x=1719557496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AHq0caUwPRaK/VE8NMNcq+Oa5rBVE8ZRskZvTxZLqwo=;
        b=gNqyU7z59B6LSbJnx8nO88c/CVyiootwes6tnC1Uv8eyV7pMFjjO+ryDNblDtiSM/B
         CVwoYw1NG+S1NmrHlooywpzGrNay74PTIb9a5XRMfm4TQ0IT5TbOmf0iyBSMtQ2w+pzP
         GSofGLvTMSsGiRoBMSJvIr8XsrsOeAVGoVAgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718952696; x=1719557496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHq0caUwPRaK/VE8NMNcq+Oa5rBVE8ZRskZvTxZLqwo=;
        b=ADrejJkz+2+ji2hFQ3ByK3CdWQJVM1F9qmBrEEvD6ADNvmvkwUMNAP/UDzcUnfFaS4
         syfEYmy1RZJd79XfHG6nWbAuS1X4fcXGhblGyG8ZRYZdS5mxBRjxZPYDVv9pQBaPxRtE
         lE7lmuLhelILE1D6dp7Ni00kQZfmgt5VVh3kg5SybvZN/5NjbeM2TOuhSDwgK4R/kJLz
         tnCrmObGoMaqhbtZ6K9BzJmRU9KcBVIdmLqoPrvCzH3WxLhlZxChhtyTmu3squgDvvI0
         lWCl8LtVqTmMeBjjFgZmkUs37JrxJmQdDsTQa7anvnpU1wIVP+ZpyFSj1ZhF/8FBDfBg
         Z/1g==
X-Gm-Message-State: AOJu0Yw+YUoLAAZvZIjs8/rFAe+FSeRV8iPI0jXcQH+c+Q3nXyiyKSZG
	jf6T+6B6J7hXAUiq68vflDTFwiZtsSWMdvah+m0oB1qsKp83DZTpBW/9qwdbZrncqejz75CSbaP
	cIjM=
X-Google-Smtp-Source: AGHT+IFwAgFhfMkPEp5+WN94FYLOw5Efm6Ps7QYr+87xLLD+7QEfmpFJudrLp3BXmNhnHKCnVwIueQ==
X-Received: by 2002:a05:6808:3089:b0:3d2:19a5:94a8 with SMTP id 5614622812f47-3d51b965564mr7634752b6e.1.1718952696206;
        Thu, 20 Jun 2024 23:51:36 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:882e:b65b:f1c5:a0b5:3175:f39a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70651299ca9sm693342b3a.155.2024.06.20.23.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:51:35 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH] wget: Fix for CVE-2024-38428
Date: Fri, 21 Jun 2024 12:21:27 +0530
Message-Id: <20240621065127.1250234-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 06:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200998

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.savannah.gnu.org/cgit/wget.git/commit/?id=ed0c7c7e0e8f7298352646b2fd6e06a11e242ace]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wget/wget/CVE-2024-38428.patch            | 79 +++++++++++++++++++
 meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
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
diff --git a/meta/recipes-extended/wget/wget_1.21.4.bb b/meta/recipes-extended/wget/wget_1.21.4.bb
index 1d31b0116d..bc65a8f7c8 100644
--- a/meta/recipes-extended/wget/wget_1.21.4.bb
+++ b/meta/recipes-extended/wget/wget_1.21.4.bb
@@ -1,5 +1,6 @@
 SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0002-improve-reproducibility.patch \
+           file://CVE-2024-38428.patch \
           "
 
 SRC_URI[sha256sum] = "81542f5cefb8faacc39bbbc6c82ded80e3e4a88505ae72ea51df27525bcde04c"
-- 
2.25.1


