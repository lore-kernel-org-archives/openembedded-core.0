Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD28BC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 16:00:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.23005.1750176004758316578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 09:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D49PE/Vr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-313f928718eso2684597a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 09:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750176004; x=1750780804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBvA8gaIIAnsWtOoQTpxnpLNRcKsr/M6LDE2vKBiqKs=;
        b=D49PE/VrBPS0IK+InF9O0gAb5cKiap+v/a63I6G6vQeMS8eLCkhqIBf1YP83xbon80
         wxaXIfE7AtzLVJGvEuWUtOeD3MiWFGJ3uGhojK+OSKjboKUimmZ4sWGFN0umlhIgWYKv
         XmdmcxBiJXIS+1MvSqAF9YMitUBnj+svWbSF3DTgoxphg8f7shaAjLyP5bU/9xS75/u+
         gNC2NR3RFQHB8wGZ/1XYx+JejZhAasnGZxSEY0Xbks0ZKo7gZCXhUKz2+6qNHxy3vepa
         PkRjIcFTiqfRpaqmjhQwDEyvKh2sUFnHiD9lPvBOX5X4YhaJQANam4ubRZzfFLghVLFB
         uIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176004; x=1750780804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBvA8gaIIAnsWtOoQTpxnpLNRcKsr/M6LDE2vKBiqKs=;
        b=s9DG+x62aDs0Z+gXBNcnWWVVg1dJQ8MepF25NxGcYsSb3O6y75Tc00D+unD884PwiP
         ZXd7bcYDhpvbWZhelHUyXF9YRvA6PeVapNbhT/JN/+pCzMbCCq3WUeTsuxaP1Luv0Iuh
         vXci2CmWbknbUTqGAiDL0p/Oou+Ccri+cTkcz2LnJHrj7Idyau2LuK71zYBkBV8U+0Bh
         0eNH6lVrxeLvwWLifN9it8phIzm4MRkLzLsFmm1jcBVTo1bdw101Yi0SzNTKUynZYeeW
         h+qtuWMqTTydz9Lv/6xFv5C4iwuqCCpmyKlzK60U7MJRtLaLbAq4eVUD6QFKx5B/LH4u
         mWdw==
X-Gm-Message-State: AOJu0Yy3VAlOwVFIkek6tYL0u9kAyX0QoOpN5k/KO55KG6LdptDkbiRp
	35Yo0gKoCcZEjPQyNfCAfXEym4TUnv3SYxZNd6o++Fj66QDChDAc2VMD4DEUlPbtDQKF7iJx9gw
	esqCY
X-Gm-Gg: ASbGnctoOBGvKvThNv3Tbo9Cto6GTxeioOrXNtm6b4mexyIh/+WBS2meOq6nQ5A55S5
	0Al5rbE4o3ZE1IwiVpE7K8qdrcMHAHxdnGSEgwRRxtJAer7kUCMA7nY0Ptu09CuhUZ21OeoZhHs
	J6XmjlB+u5eLxJBQPe0QnsmqovEmhxG49MZ0Vat5k5qO9Ga/aHfXTMEujIMCBfLuewJ5vK7T9L2
	6Y7rkgIojUCXyZXZm8553BpSnhe+/aVrbvW33L0dZxFxj6cmmxEm5zHNW5wC4xW0BYB31vTgvEM
	4miKBgxEsGbGdICcWIkPH05YxdbOZlO2A1LChfF+l7BJwKzNKegdww==
X-Google-Smtp-Source: AGHT+IGrKAmaAIdOLait/uA1FmK34AARvG2R9SGLknHEgID5DhFwG+o+YbQwUMN5MKewsQdFVcndIQ==
X-Received: by 2002:a17:90b:278d:b0:311:c970:c9bc with SMTP id 98e67ed59e1d1-313f1d0734dmr20645071a91.30.1750176003805;
        Tue, 17 Jun 2025 09:00:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm81475515ad.146.2025.06.17.09.00.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:00:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/12] net-tools: patch CVE-2025-46836
Date: Tue, 17 Jun 2025 08:59:42 -0700
Message-ID: <0d880cdb51e47f78387b63063727fe6df1b009e6.1750175857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750175857.git.steve@sakoman.com>
References: <cover.1750175857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 16:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218890

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
-- 
2.43.0


