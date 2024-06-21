Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD70C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 14:46:31 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.75031.1718981182082560889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 07:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=T7GHMzRp;
 spf=pass (domain: mvista.com, ip: 209.85.160.43, mailfrom: vanusuri@mvista.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2598abc6848so914954fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1718981180; x=1719585980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AHq0caUwPRaK/VE8NMNcq+Oa5rBVE8ZRskZvTxZLqwo=;
        b=T7GHMzRpSPWt1zAVWUFEbJftxL75oIJaV6rZ7SGsbKTeOlyqoXn8msPLxmEEfYOTEd
         FBtfVQQGOI2g0MscJf/MvnxOZnwqKpe0a2ud/lPsiaF+lVn6Ns9xuyl6Nm4IS9W+dZsg
         xcpBdfv1GqRvnmftadjVPEm+mi8/Kq7YPKqFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718981180; x=1719585980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AHq0caUwPRaK/VE8NMNcq+Oa5rBVE8ZRskZvTxZLqwo=;
        b=sKYDLju+bMtQab9qAxzcMSdcISzxBaDCQuEj6tpJwnfwfuiVMf6kdZnwk7HaMcd013
         7yB0r3RUo3u1U2Beg7Q5YWoInCTHoyceyPvxAiJyAMob+psVXuFwn7pw36o/eWWzOyj0
         9wV2UriduZc9wW/Wg3EDP98GWC2xvmh+u6zT8R18Lv0tlpNhtGkW6PSvjuKXxsBfatCJ
         hBo6r61PrBgzK9gG2AaA5UpNLJKUeNdx5kf/gR5q8xx6D6Sq3Do8mH3S+0KPRaKNKX08
         XDfuTXoNhy2VHSTg0UTPEKE3nef9Bv7KtP+pXe2pskBzUfU9eFKLmCzVxRjMvcNt1QZ6
         nBBw==
X-Gm-Message-State: AOJu0YzjMQg1RUmHSV13nDK17skRR/QksQmSRkTLGtG+mOQRk7WLY4V7
	VZaysgrc36WzpNSHBsUwB8XHgsQ3KYJknDS8YSFbMrL+5qt7X4pNlNXxA7HIzI8KBvZdstU1vAB
	E6kE=
X-Google-Smtp-Source: AGHT+IFmLcIea0anyT9QY1MJS6K90Cd/J9SlxWCchdBy+CXhBG+v6nmp4o0/nDazcqyB3nwlpzq0Ag==
X-Received: by 2002:a05:6871:452:b0:25c:ce8d:c4d4 with SMTP id 586e51a60fabf-25ceb47223fmr5346fac.4.1718981180320;
        Fri, 21 Jun 2024 07:46:20 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2405:201:c01c:798f:769d:4590:2924:7f50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b81746sm419341fac.44.2024.06.21.07.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:46:19 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] wget: Fix for CVE-2024-38428
Date: Fri, 21 Jun 2024 20:16:09 +0530
Message-Id: <20240621144609.151097-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 14:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201027

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


