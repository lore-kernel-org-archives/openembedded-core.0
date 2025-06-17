Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAD6C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:44 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.31411.1750195238163860472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qeBWtDIF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7426c44e014so5211271b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195237; x=1750800037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dN2uSRla74aVupL1MLnJ2nyE6w29AFr9ILkf55gjbSc=;
        b=qeBWtDIF5dZP27hyL0bfHemHz9m/WLN2pAIU6Yjjy8+lQ3ljMDOREc6pGF6YFnmmlR
         pB4YD+eJbO4c2Cjo7Op7AkvYq4az6nKny2iAz+astPDTJaKD+SvKISyX8Kly9KqzYj1C
         toPYBfbljljmxRdJbLh9JYsJK9eq115rEX1PIs/WdYr+cc6n92YohAAP+pzoNXferddh
         iduan2JuC4PVd7QDNNzc8E6ul4ZoQbfLxQgUCqQIlxBe/pKIge8F/+GYZRO/GiEA2Tmy
         +urSsxdRBC7aD62iHW7w3PvfrPtGrlAoefBaltm7yxezFzs2OkNphT3Knychx/MDsuyH
         PwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195237; x=1750800037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dN2uSRla74aVupL1MLnJ2nyE6w29AFr9ILkf55gjbSc=;
        b=eiZE/NAfdh0o+0QhTVmACSfZEiYi2yKpQf8o7r8Z0nxui0g6vgB19AOTHBUm3h4/iW
         ersrW2YftRZVPVyPl5Xq4ltfkjNaBTOBSi0fZAueogtx5CLtg+CbJYJu5x/ScbpzlOSy
         o5zlI2eSF1QmLRVXv64Ny2lNmDJJNFcs780JDEMC88xUCjXEOWkThey0k/ffqknbRwkA
         sHDYe9XUlBOtZGWTi4A6xSKRmy3KJLWf1XOfgcQu+Z/dVAIiIsSVnc4Hpr2PF1PnHzSQ
         xvtA+g6fwQebtgm2o/DOjYZgogR2ETQj92cp3XmiwgWMnkBmsZBKEQWUENIxWfUet0Ks
         r+8g==
X-Gm-Message-State: AOJu0Yzli3bJjVD3WJzwYopg0N49mcCtk6HHcuxlK29d7/LIAT+UDWub
	fPZTGHKDIIz3hz8B5//UJ5pr9V9m2Odjh+n6YHSk/8fW6M5dqTl8LTEbRS+L6RnAFiFw5o4oPOF
	M2psD
X-Gm-Gg: ASbGncsCfDumRa/DvdC3GJ7MJ8jPyvYu9tISg1J163N0tH0D905sQdpmSbAJWtOrLkr
	uedPS2BPVN/gNCLm86EEZV3rIilDniQG1mgoY/CwC7s9GU5MhZLZ7Tas/UzZ1SJ5ZYVr0dpbCFL
	AcIYw8NkSqJ/uRi5tsHsugsTdZdJOt8n709OpCg8hQeMH1mvO0zzmqArPmzgNlO/tswQ/Dm0sgA
	MRFX1T+GmM+oSB6IQuyCeLPQhIX+dh6TOQRw1lW9PxFAaRXq3ECAVRT571z07LrQWWAvs6uK2q2
	5kJ6oa8vmoWmh/wQXUy9UAx/Sfs4Zlc1P4b4fgEx8aEvbcUNiX0yog==
X-Google-Smtp-Source: AGHT+IECGUHqo227gUSTgJN0cJ/wGcJadQX8xsIyZWUbeozl3iQmGJDeX2f4RrBdP9qpOG5nxotNHw==
X-Received: by 2002:a05:6a00:1823:b0:737:9b:582a with SMTP id d2e1a72fcca58-7489cfdb64bmr23023201b3a.24.1750195237254;
        Tue, 17 Jun 2025 14:20:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/27] net-tools: patch CVE-2025-46836
Date: Tue, 17 Jun 2025 14:20:00 -0700
Message-ID: <7f2ce7ea6bd3397e4a4f3f7bb6957d14838f66c5.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218920

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


