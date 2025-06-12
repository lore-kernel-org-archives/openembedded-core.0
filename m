Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB764C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 21:16:17 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.5895.1749762972489559958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 14:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=e4Mh1/7z;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025061221161027bc1587f2e9027b14-op6tb6@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025061221161027bc1587f2e9027b14
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Jun 2025 23:16:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hTvYncmwRJNKaiYV1hf0nDqELwp4Qj7vi0X0JXeXkVg=;
 b=e4Mh1/7zy6i+xKh2Z1l/6COkFfF2BkydX0PdOivRAh4MhrVyvPo7hAm0zYWIytqHfU5nzp
 TX5WVzC8d7kZObiA5TGaY2YPM20wd7olIpVv7/Xscca+tqjqdGbGPlNOXWhyftZ08JcI3xP8
 8Yv6oA9EbyU2UmHReg7JjaTmM2n1YqUgTtSJe22QioNXkoZnuEF8ta5+uAkaERJhsWyOLqB5
 cRX0OsZI0IdTOLhgog0tOEcIW5O6s6p9Lf5j7+EDvCZyHqk3OiNfEP2U6M6wiydIstJyGR6L
 XxetlhI+BFOly4jVJuNJxbriqXUGw3J30V4nRoD8NtasoZPVBXNdft8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] net-tools: patch CVE-2025-46836
Date: Thu, 12 Jun 2025 23:15:24 +0200
Message-Id: <20250612211524.3517991-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 21:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218540

From: Peter Marko <peter.marko@siemens.com>

Backport patch for this CVE and also patch for its regression.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../net-tools/CVE-2025-46836-01.patch         | 91 +++++++++++++++++++
 .../net-tools/CVE-2025-46836-02.patch         | 31 +++++++
 .../net-tools/net-tools_2.10.bb               |  2 +
 3 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-01.patch
 create mode 100644 meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-02.patch

diff --git a/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-01.patch b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-01.patch
new file mode 100644
index 0000000000..0d55512497
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-01.patch
@@ -0,0 +1,91 @@
+From 7a8f42fb20013a1493d8cae1c43436f85e656f2d Mon Sep 17 00:00:00 2001
+From: Zephkeks <zephyrofficialdiscord@gmail.com>
+Date: Tue, 13 May 2025 11:04:17 +0200
+Subject: [PATCH] CVE-2025-46836: interface.c: Stack-based Buffer Overflow in
+ get_name()
+
+Coordinated as GHSA-pfwf-h6m3-63wf
+
+CVE: CVE-2025-46836
+Upstream-Status: Backport [https://sourceforge.net/p/net-tools/code/ci/7a8f42fb20013a1493d8cae1c43436f85e656f2d/]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/interface.c | 63 ++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 39 insertions(+), 24 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index 71d4163..a054f12 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -211,32 +211,47 @@ out:
+ }
+ 
+ static const char *get_name(char *name, const char *p)
++/* Safe version — guarantees at most IFNAMSIZ‑1 bytes are copied
++   and the destination buffer is always NUL‑terminated.             */
+ {
+-    while (isspace(*p))
+-	p++;
+-    while (*p) {
+-	if (isspace(*p))
+-	    break;
+-	if (*p == ':') {	/* could be an alias */
+-		const char *dot = p++;
+- 		while (*p && isdigit(*p)) p++;
+-		if (*p == ':') {
+-			/* Yes it is, backup and copy it. */
+-			p = dot;
+-			*name++ = *p++;
+-			while (*p && isdigit(*p)) {
+-				*name++ = *p++;
+-			}
+-		} else {
+-			/* No, it isn't */
+-			p = dot;
+-	    }
+-	    p++;
+-	    break;
+-	}
+-	*name++ = *p++;
++    char       *dst = name;                 /* current write ptr          */
++    const char *end = name + IFNAMSIZ - 1;  /* last byte we may write     */
++
++    /* Skip leading white‑space. */
++    while (isspace((unsigned char)*p))
++        ++p;
++
++    /* Copy until white‑space, end of string, or buffer full. */
++    while (*p && !isspace((unsigned char)*p) && dst < end) {
++        if (*p == ':') {                    /* possible alias veth0:123:  */
++            const char *dot = p;            /* remember the colon         */
++            ++p;
++            while (*p && isdigit((unsigned char)*p))
++                ++p;
++
++            if (*p == ':') {                /* confirmed alias            */
++                p = dot;                    /* rewind and copy it all     */
++
++                /* copy the colon */
++                if (dst < end)
++                    *dst++ = *p++;
++
++                /* copy the digits */
++                while (*p && isdigit((unsigned char)*p) && dst < end)
++                    *dst++ = *p++;
++
++                if (*p == ':')              /* consume trailing colon     */
++                    ++p;
++            } else {              /* if so treat as normal */
++                p = dot;
++            }
++            break;                          /* interface name ends here   */
++        }
++
++        *dst++ = *p++;                      /* ordinary character copy    */
+     }
+-    *name++ = '\0';
++
++    *dst = '\0';                            /* always NUL‑terminate       */
+     return p;
+ }
+ 
diff --git a/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-02.patch b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-02.patch
new file mode 100644
index 0000000000..d2c3673a24
--- /dev/null
+++ b/meta/recipes-extended/net-tools/net-tools/CVE-2025-46836-02.patch
@@ -0,0 +1,31 @@
+From ddb0e375fb9ca95bb69335540b85bbdaa2714348 Mon Sep 17 00:00:00 2001
+From: Bernd Eckenfels <net-tools@lina.inka.de>
+Date: Sat, 17 May 2025 21:53:23 +0200
+Subject: [PATCH] Interface statistic regression after 7a8f42fb2
+
+CVE: CVE-2025-46836
+Upstream-Status: Backport [https://sourceforge.net/p/net-tools/code/ci/ddb0e375fb9ca95bb69335540b85bbdaa2714348/]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/interface.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/lib/interface.c b/lib/interface.c
+index a054f12..ca4adf1 100644
+--- a/lib/interface.c
++++ b/lib/interface.c
+@@ -239,12 +239,11 @@ static const char *get_name(char *name, const char *p)
+                 /* copy the digits */
+                 while (*p && isdigit((unsigned char)*p) && dst < end)
+                     *dst++ = *p++;
+-
+-                if (*p == ':')              /* consume trailing colon     */
+-                    ++p;
+             } else {              /* if so treat as normal */
+                 p = dot;
+             }
++            if (*p == ':')                  /* consume trailing colon */
++                ++p;
+             break;                          /* interface name ends here   */
+         }
+ 
diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recipes-extended/net-tools/net-tools_2.10.bb
index 7facc0cc8d..547079f4cf 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -11,6 +11,8 @@ SRC_URI = "git://git.code.sf.net/p/net-tools/code;protocol=https;branch=master \
     file://net-tools-config.h \
     file://net-tools-config.make \
     file://Add_missing_headers.patch \
+    file://CVE-2025-46836-01.patch \
+    file://CVE-2025-46836-02.patch \
 "
 
 S = "${WORKDIR}/git"

