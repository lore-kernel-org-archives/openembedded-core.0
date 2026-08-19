Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559EAC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10321.1787155065450343520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fZqVvZiX;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-481412f1828so471100f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155064; x=1787759864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EvyWTJXFkuwb4wpgbch+7qTOgJDi68Und1VkcYDre/U=;
        b=fZqVvZiXRWO8sTDTre3GqlAmco0f9gdMHkFh0vLPDDZdQSoIVdtPRyJQQVaJotnHv4
         BVuMGE1RaqjGJAHN3Fw/YjxzuCP1bbarnyLBhp1wdiG+EYc5KUQXkd3uQmZfQsDmdm/I
         A7mXRUCGir6jXCgrWwhmMutVxkUdWlpAbmNSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155064; x=1787759864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EvyWTJXFkuwb4wpgbch+7qTOgJDi68Und1VkcYDre/U=;
        b=o6MtNdjZCIRtlV57xnnTKZPUIkSmBsTxaKoJxJ3+AqiICKrzJf7W1QXTRYSDvCOwns
         8OmVwHxnY2OkgLHUf9k5Vz29ssMFCeaatLnyE3ZVkVt+FeXoloaXQ2dyR1NMqzetN0mJ
         plYrlZNAN0hCnp9GFmed+vR+IrvlpDLfzA9RvVFMchPNGoNU03UfG9KKHobrA1L4xBx8
         MkKvQuUqixcAfeT96wy2N8rS7Qu8VnfWBYVsTa0JStE/B1hVwKqs4WodICELKPnW5JFL
         6RZrZ/4IdRw+RE7ppapyJzXoX/ldNA0xgcmgcig3aPXj3WwiOCaZB04+AHI0zqt+J9jP
         YOBQ==
X-Gm-Message-State: AFuF++n22vCNaK4E8WXW5BK6+5q1OFmg6KvwrZ76tzNXCTtSm8VanKWD
	Bal2aQgp+8B0CpY8Hj0uvrDVJ3Gx633Bza5nb5TSTxhOHGVUhckkOxvTUb3URSg/JW9CQIs8O4R
	SmoBBA/A=
X-Gm-Gg: AR+sD13eC750tAoSfrQ6zwMIau261HFNvbKQCH/rh3m3E5AuNwKjhFil+ut9FSU0Gig
	Huanl8ufxGq4H0GzD9z2tKkQ+iBb9alUqchYdQIMbdprg1PF9xQZo6P0UGksTzl3SRuzLisvCa3
	ibZyOj0rfo+XY622UEts8cpcx+7qQi6gKNlZG5PyLK9kRlCPUVx8DPNXR00AwB9GKMiIJ/NUQ9W
	12bbS2fuKgDDIxQa7Rnj7Il7RHsvMgFgppAkHrKjJVQgW9zEBRZEzFFuZ5tC3NlgnFQtpLyvPLz
	8LN+sD7NNKRc8KJhLF9iYGDp4HP7oH8tXqp0+SO7jENgbWFCrDVDP7TvW50B7MowYuKGbb2FeY4
	yKuPEj3Iw66Jt7rMm+U4nNpy0Gl/X6L/xiZEcbzhEnWBNpgvHHzRb3y6OlBWPZZboRkpwFkA4fl
	D4e3fgYryR6GWbipSI5Apm+udzLwfKEMCoFBEsDWHxwwyY6y3kq+2RALtvxIX+QXNDXpjf7jNNa
	HExhnDXhK/nmR4KfRU0ZRUsu1OycVLoi3djEpS2vkY6LhrPuEMYJwHmP2UNzY0c7wkDL88jTYUM
	EXI7JQhz6xoDVqyXB2rhPfGUAqeTE0//OZnjdC0eY9vSMaya5ow=
X-Received: by 2002:a05:6000:382:b0:47f:6f6a:6a7f with SMTP id ffacd0b85a97d-482b1e91ccamr11092124f8f.8.1787155063704;
        Wed, 19 Aug 2026 08:57:43 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:43 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/37] expat: fix CVE-2026-56410
Date: Wed, 19 Aug 2026 17:56:42 +0200
Message-ID: <a6d0f23af3be49d0c155fae40caea2109a73002c.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243747

From: Deepak Rathore <deeratho@cisco.com>

These patches apply the upstream fixes shown in [1] and [2], as
referenced by [3].

[1] https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347
[2] https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-56410

(From OE-Core rev: 51d1871b3551deddd9f5fac85fdcd4b2793b94f0)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../expat/expat/CVE-2026-56410_p1.patch       | 46 +++++++++++++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 39 ++++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  2 +
 3 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
new file mode 100644
index 00000000000..6f906e682d3
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
@@ -0,0 +1,46 @@
+From b454931c42290c9f0faf2a01f9634d82db636bac Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Fri, 29 May 2026 17:51:25 +0530
+Subject: [PATCH 06/17] xmlwf: protect resolveSystemId from integer overflow
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347]
+
+Backport Changes:
+- Adapt the allocation hunk to Scarthgap 2.6.4's explicit cast and
+  include stdint.h so SIZE_MAX is available.
+
+(cherry picked from commit deeb97f7c88d17a16b0ea2521a13733abc283347)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index 9c4f7f8d..ad691b12 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -41,6 +41,7 @@
+ #include "expat_config.h"
+ 
+ #include <stdio.h>
++#include <stdint.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+ #include <string.h>
+@@ -130,8 +131,13 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
+ #endif
+   )
+     return systemId;
+-  *toFree = (XML_Char *)malloc((tcslen(base) + tcslen(systemId) + 2)
+-                               * sizeof(XML_Char));
++  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
++
++  /* Detect and prevent integer overflow */
++  if (charsRequired > SIZE_MAX / sizeof(XML_Char))
++    return systemId;
++
++  *toFree = malloc(charsRequired * sizeof(XML_Char));
+   if (! *toFree)
+     return systemId;
+   tcscpy(*toFree, base);
diff --git a/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
new file mode 100644
index 00000000000..148592ba9bc
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
@@ -0,0 +1,39 @@
+From 7e6230212ddc4ea74115218fdbe5717e8e1c0f2b Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Sat, 30 May 2026 11:28:51 +0530
+Subject: [PATCH 07/17] xmlwf: guard each operator in resolveSystemId length
+ sum
+
+CVE: CVE-2026-56410
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea]
+
+(cherry picked from commit cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlfile.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlfile.c b/expat/xmlwf/xmlfile.c
+index ad691b12..4d2e3220 100644
+--- a/expat/xmlwf/xmlfile.c
++++ b/expat/xmlwf/xmlfile.c
+@@ -131,9 +131,17 @@ resolveSystemId(const XML_Char *base, const XML_Char *systemId,
+ #endif
+   )
+     return systemId;
+-  const size_t charsRequired = tcslen(base) + tcslen(systemId) + 2;
++  const size_t baseLen = tcslen(base);
++  const size_t systemIdLen = tcslen(systemId);
+ 
+-  /* Detect and prevent integer overflow */
++  /* Detect and prevent integer overflow in the addition (without risking
++     underflow) */
++  if (baseLen > SIZE_MAX - systemIdLen || baseLen > SIZE_MAX - systemIdLen - 2)
++    return systemId;
++
++  const size_t charsRequired = baseLen + systemIdLen + 2;
++
++  /* Detect and prevent integer overflow in the multiplication */
+   if (charsRequired > SIZE_MAX / sizeof(XML_Char))
+     return systemId;
+ 
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index 6d71393b2a5..39e40befc44 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -66,6 +66,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56408.patch;striplevel=2 \
            file://CVE-2026-56404.patch;striplevel=2 \
            file://CVE-2026-56405.patch;striplevel=2 \
+           file://CVE-2026-56410_p1.patch;striplevel=2 \
+           file://CVE-2026-56410_p2.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

