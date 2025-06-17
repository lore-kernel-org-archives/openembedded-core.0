Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ADAC7115F
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:04:43 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.23242.1750176276239834216
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SBWYh+6/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so5578931a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176275; x=1750781075; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN2uSRla74aVupL1MLnJ2nyE6w29AFr9ILkf55gjbSc=;
        b=SBWYh+6/hg/V/wdEYEnyv6ScP4LQW3/MDz57pk90TT9VA61fAJKAIuNlasTssgpKnt
         5qYGRavz3Wuyq8m1uGebmhfJJzAKsEs9uxn840ne+tX2UQsRu0gX31VbvYJ8er879HTK
         01+ck/X3UnX8d5oIhjvbl75mbHhuB2olprlt91bCQ1X9W+aYk7B6nVF0sUokHAQVAidh
         0j0kXgTSQn4uzQzb70A/JWgf/cVi73Ddl9m0wq7YymSRUzx+YNSVhJl6wCIbEfw3BroD
         zsvHTmhnVT36NEQQrn/5qTLikpt5mv82qMpIRqvEQVR9sXXOM228IYB+Z5fwIEb1xVYY
         NkgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176275; x=1750781075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN2uSRla74aVupL1MLnJ2nyE6w29AFr9ILkf55gjbSc=;
        b=IWlJ/QJl1fnlb5oH3G4hiGX83XHlINgqmQmZQFWD9eGNVFZMj+SpeVW7/1nsPQeWxl
         9eWMg0EuNMkqIlwd2kHrSHNN93GRHV5QCyMLejd66Zk82GYsEJRosa5RKoykq0Bi3YMs
         +iyJdB/8MXzpWdrBzGWxOzOTdpzAvSoR3EMbW/QUP6UlzuofjFuP04QEVIUZzKNd6I+y
         dOdvZ4RKG9magVlAsiMvDit3/RF+2MLF1BTmGzhyL00xjF3GqW0WfS9rXF0AsbFKutQt
         DhEHLIfOPiC9FHwE36h+uWmEQWmJNooXGSUIRqEzureRxYTZQ6VQuwWdy7GqUVX5mq80
         d7wA==
X-Gm-Message-State: AOJu0YyYpwQeU1Q/fLNlEDqLsP7+kP8EGmdX6LR9gPlYlHS8wunQeqpk
	lYd7YztSPYKtdOPSA+FaZdhJR/IvMrxW3iSOGr/Z4x572GaNGQqeBQdOWFobvUR26dxGjLyghKr
	RXFft
X-Gm-Gg: ASbGnctsKJ5MT3XdHVustBj2MCVP3R5ZdHu0lTHIFVjtXBB6TMi4HNXmVp6dmVHfkGE
	N/KcB0sFsr73+Ic7q019YAxE98USdTt+awJc4RWeIhEO3plr6HZH1IU4n2TUCVb7AugJwrI6H0r
	Pen6Ng0GNxqP1AKKTXR2O7zVsUk0+nrY/ARfTBV+lYzr7jKkkv56UgLO7gSp7p6lLwNfTP/UOS8
	qXSSziFMultw/1dYqX7iGR9fdgeNFCgVFIbWSgEwOdhR/PlIDYoseCDs04bhE92rXrnF1syZoNS
	tW3Vg1A574CW36OZerdjh4RXke9QzjjzTM/ohM8OtFZlRRl7Cc+tYA==
X-Google-Smtp-Source: AGHT+IHAWGbFuWGIhHwip5SJ9Rqz3WEcO02pxz09toQ955nC43L77v7qA9oWsRzYQOUAe1nsEL2r8g==
X-Received: by 2002:a17:90a:e7c2:b0:312:639:a062 with SMTP id 98e67ed59e1d1-313f1daa971mr24516828a91.16.1750176275098;
        Tue, 17 Jun 2025 09:04:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf71sm82043365ad.217.2025.06.17.09.04.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:04:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/8] net-tools: patch CVE-2025-46836
Date: Tue, 17 Jun 2025 09:04:19 -0700
Message-ID: <352525443b1844cdfd28355dfc1444046bbb76e8.1750176125.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750176125.git.steve@sakoman.com>
References: <cover.1750176125.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:04:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218902

From: Peter Marko <peter.marko@siemens.com>

Backport patch for this CVE and also patch for its regression.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 33304297ec..c4d298181a 100644
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
-- 
2.43.0


