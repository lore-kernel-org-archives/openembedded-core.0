Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1C3C30659
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:07:58 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.4342.1719778075733421509
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EumtBytW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70aaab1cb72so1008593b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778075; x=1720382875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1rPyCz04l1wi9w+whzIXVVHYQDS/dTHQ0yNcyOmUUg=;
        b=EumtBytWRZVkEJi+8ed7U/cwxV5zYNoZoZ3RKohMM1Q2U6yOB8QFvzxssy0Hy6O5pR
         jk6PiiU5jHn3BugTCUF4OFOaFa5nz2/S3aj/TJwW8nsbocPpxE5a7GcDe00aYcvfil5P
         TtXrArbCUyUXrrXTGmStYNUaRA/pVN1BWNB+Rv0AVA814lGmf76V8T5s/Fr685GNpyl2
         k4XetPGUSlhip/ukpAdzvyZsOJUFSlasUY2MwMGzJMLig3/BLFD6E0HwhDEudlAP6P7x
         j77oSFGsFAbVncUFRRJ6ZjEbUs1smMK/pTc3bBDAHUGFfji9hiZC4SLFPeP3BWziTHjg
         hEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778075; x=1720382875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1rPyCz04l1wi9w+whzIXVVHYQDS/dTHQ0yNcyOmUUg=;
        b=Ihq5BUi/MngCZoPXBEcDHpxOCPLuR+4d4Vqjx/7QOmtf2SacsmrX/pSdrcQbEp0Him
         SrlEyW48sjrGH/K9wq9sMf5fK9CTxwi0rKCmew2egWZ1D7c0j/OFofDYD4q8vH2dLvb6
         Hk0zZXbURKj90mBnVAYZHcaUKzE/XPPtr+jpmnVzNo/q6ppGsfbt+WUwD7gqLrSCg9GQ
         Xayvasqgq2L0n2ZTrvyJfOFGXqUiElt1bRGaplySOyMqhx6aBkQofbvV/f/YYLdI8/yM
         f3ElrzuTBCbdGQsrVfz6VWAiqgjL4FhisGHwfJS/2kB5FRtjAVZoMw5Wq7HzwC7nLDxy
         qgLw==
X-Gm-Message-State: AOJu0YwyeUEG8DhNX64btT9iylzpkUE4Rc3xUQSg7pYL8QsldoblGldW
	NSHNw/GSC67oaF14PB4/yZ1RcIyPyczqthUEsOpGxAPeho91TJW/Kb9HfzKdLNkrCxRoNtNEG0T
	27gE=
X-Google-Smtp-Source: AGHT+IGe6NnZ2zLS0NBh7t//hH6YrcE6C5cStK9uxvksjjlW4vCSIqRZYLgW2s1cBzUgD53nOkfSHg==
X-Received: by 2002:a05:6a00:807:b0:706:7943:b9aa with SMTP id d2e1a72fcca58-70aaad2a1bfmr6648630b3a.5.1719778074632;
        Sun, 30 Jun 2024 13:07:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.07.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:07:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/35] wget: Fix for CVE-2024-38428
Date: Sun, 30 Jun 2024 13:07:13 -0700
Message-Id: <3c6e147f57e44d473fbd5fe5a11746150e561937.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201238

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://git.savannah.gnu.org/cgit/wget.git/commit/?id=ed0c7c7e0e8f7298352646b2fd6e06a11e242ace]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


