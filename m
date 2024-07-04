Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAFCCC31D97
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:32:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8988.1720096340183869644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:32:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pXtetvp7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fab03d2eecso4003465ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096339; x=1720701139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1rPyCz04l1wi9w+whzIXVVHYQDS/dTHQ0yNcyOmUUg=;
        b=pXtetvp7mnQitwaP4u8uiHplJFfdANIZdc6GCTSNWtVowpvsu9quV63IQxiZhuYWR1
         CUhBMcziENx1slWsd+vIskHwiBm15O275In8Y1yH6L2Zh4pJ0cuJ4xc9G+wCGRq9e7IZ
         Bmvf3PPB8OOme4f4oVMeFvPtFd9AXCbuFoG/U99Fdm3sCqRuhXu8dn4zPSo2S2t0XeAE
         3r9SrygITmVpKdIsJvGzmwjrnKvuRQNbMtA9RDGDLYg04BUHe4IGp/uAoK9LUtfPFo/i
         cmSb0AHomffSldWValvwMmHd2ylMcuuz+WJqfB0HOln4ZVVf9n04VJOMWw+kuR87bVSQ
         veng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096339; x=1720701139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1rPyCz04l1wi9w+whzIXVVHYQDS/dTHQ0yNcyOmUUg=;
        b=uw2eHBpaDsZJfDQO47TtkUjzxQIjTrm+FIm22yQ4d40PeAgf2hparUUr5XuW49YV9b
         hKTW5oqWTOhTr3y0ihUlYoeIYOKCzZiBhFq0aycUrqXd7O8b2q+MJvM9faiYvnT4XEtZ
         xHAnszFXF9wPTqhuQJpJPjMLtK4aSrPpgPyu03m3WsI812uJ6ufwgcaiHIYIJXL7h9CQ
         +zlN/Oes5GA3yYKqDmlhbSVIn+KC1lpIdNP1j7cnJkLejvYIpbzSB9KAVlWMnm6en7Rd
         JPTTe92wfehs9nVcfGN0aEtvwmJTKIEsowz5DQdTtHaibZdOGT9GV0GVaMIyf930OFDF
         HlkQ==
X-Gm-Message-State: AOJu0YxTyVffrO6oBWEDtNbQWiYisS9eboXyiNIwC2HmkP3/LT4ccpmZ
	tT5pebxhkTF6L7aRMmutweKqH6tgrSupL2ZO3lizzeI0PR7jSFEtmPbrhemRr+YxjZbksAFPnFs
	U
X-Google-Smtp-Source: AGHT+IGTcPAfxUvE/JbvRO2/5oJrg0ZYwxFu53QNAQ09qY22gwp5m3bcFUzemRkGqlvpjpvbpkr02g==
X-Received: by 2002:a17:902:f645:b0:1f7:1ba3:b91c with SMTP id d9443c01a7336-1fb33e05759mr11194565ad.1.1720096339256;
        Thu, 04 Jul 2024 05:32:19 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d337sm121034095ad.284.2024.07.04.05.32.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:32:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] wget: Fix for CVE-2024-38428
Date: Thu,  4 Jul 2024 05:32:06 -0700
Message-Id: <4f7fb1cf937b0cefa5b0079417859b56c3171c0a.1720096173.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720096173.git.steve@sakoman.com>
References: <cover.1720096173.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201567

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


