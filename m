Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDCAC4450D
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:08 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140024.1783291379767676045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hYplUU7h;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1306149f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291378; x=1783896178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5Ve0bh1V4bbd4dAZ3Y3Es63tvgNHJNmYorivr8jtDs=;
        b=hYplUU7hA3HhsLJnGiNXWCLDjEbpENQNLK9KlBVhJ427rG13VH0Y908+2UrYD9MVQ2
         MVlPceKDHpttDTqUS4eqJ45JBQyZ8SywvXFtHp1OQEEqEzVGoaC/m301L/IqKVsFOpHO
         J3wvzo9kgSIKt0jvDNeC2GU+zNRwTFa7kh1Hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291378; x=1783896178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R5Ve0bh1V4bbd4dAZ3Y3Es63tvgNHJNmYorivr8jtDs=;
        b=J/MT/w6BmAY/QHiwiE7fo4UBEodbsCWO286vD9C/+/FmaYRgVC0FyZCSbI8a9zHoDj
         ERtv+vlZ2Z4FMsN/+IJmQxuxexjuA/n1YVJp3p6X+yKvuE6LeV7F0+LdzDhZfSAw9Ntd
         l91hbkILkgH/Rfvkz0LEply1EoUIcENaoPw+hjQEopwwnsARffYTEevmXV0DhqEMrNVM
         Y6f8T/fi76+j+EwDncJ4T8AUnpYTSBOlLwrcTHgKXmDezGbn5GFLzr/n66+OYlNCcZUz
         2kWAxb0o/C0mFbjJVNRuvJFBus3A5WW5+8lnchLcnYaHjxvGDrP6Cpg7gtwBEpmxOvhB
         iUPA==
X-Gm-Message-State: AOJu0Ywr8oIiTTgoDkvl+MBUvog046M4EBC7pZnkMxDj25ALvPVrx133
	JZGE68yKae4ia1SNvnA3pHXPT7wGoqnbZX5uxyHZ0Q7FH+A0oe06pSBv9W/EYiHVDHbhcRBicdg
	ACTzkxHk=
X-Gm-Gg: AfdE7cnTFMnAJ7Zd/84DUhFzrffgEIwhzLsBBNltKxC4hyXMh7uDqHhew/ECesBKzK6
	75wvkJyqjN6G2y+5RDTcC5haosMcaxNsuyoL0eD56/GntfMnJtHvj3KBBy+JlwE9ckFVJzAYO03
	7RAh98Ae4zd0WB70nlt1Qj66CP4VblPZOj31Aa6om5Nb+PzlFDY6kjA9UtgbAQ4Im8xa365S4cy
	XmY84btIvTg81/X2uuHRozDw/zJwdfa5IujulNUvcA9gyIjl9cAlouyBp+4GaU2OXJVwrlA7LWZ
	kDrhymPg6k2wFzM7s/l5NKWYCLoB35na7egEta70Uer/q1GSxCH8vBYDmUqxHT2QFQ9MNwjxKXD
	iSpQs1OkfXSocqUTJJdY1ivxiMQcVzx/9852NaOPNR4QaKpCE4vn1jl74X98fXH0ibNU+SvJaHL
	FI2fexjLMcHklpwOWPRi6JCEOochtGKjxLAlFo
X-Received: by 2002:a05:6000:2283:b0:46a:168c:3795 with SMTP id ffacd0b85a97d-47aa9b77caamr9616955f8f.16.1783291377948;
        Sun, 05 Jul 2026 15:42:57 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:57 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 26/55] cups: fix CVE-2026-41079
Date: Mon,  6 Jul 2026 00:41:16 +0200
Message-ID: <2d6bd6fa911d92f39f37fdcc60c61f0af0a31e76.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240180

From: Anil Dongare <adongare@cisco.com>

Pick the upstream fix [1] for CVE-2026-41079 as referenced by Debian [2].

[1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080
[2] https://security-tracker.debian.org/tracker/CVE-2026-41079

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-41079.patch            | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 49b828506a1..9f5d5fe7261 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447.patch \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
+           file://CVE-2026-41079.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
new file mode 100644
index 00000000000..2392a77311e
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
@@ -0,0 +1,73 @@
+From a331e93e2f9baf411715ef69ae19b73827da23d7 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 13 Apr 2026 11:50:23 -0400
+Subject: [PATCH] Limit num_bytes for SNMP string values.
+
+CVE: CVE-2026-41079
+
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080]
+
+(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ cups/snmp-private.h | 6 +++---
+ cups/snmp.c         | 8 ++++++--
+ 2 files changed, 9 insertions(+), 5 deletions(-)
+
+diff --git a/cups/snmp-private.h b/cups/snmp-private.h
+index 52b8740..015f53e 100644
+--- a/cups/snmp-private.h
++++ b/cups/snmp-private.h
+@@ -1,7 +1,7 @@
+ /*
+  * Private SNMP definitions for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2014 by Apple Inc.
+  * Copyright © 2006-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -58,9 +58,9 @@ typedef enum cups_asn1_e cups_asn1_t;	/**** ASN1 request/object types ****/
+ 
+ typedef struct cups_snmp_string_s	/**** String value ****/
+ {
+-  unsigned char	bytes[CUPS_SNMP_MAX_STRING];
+-					/* Bytes in string */
+   unsigned	num_bytes;		/* Number of bytes */
++  unsigned char	bytes[CUPS_SNMP_MAX_STRING + 1];
++					/* Bytes in string */
+ } cups_snmp_string_t;
+ 
+ union cups_snmp_value_u			/**** Object value ****/
+diff --git a/cups/snmp.c b/cups/snmp.c
+index 54e348f..2fcb38d 100644
+--- a/cups/snmp.c
++++ b/cups/snmp.c
+@@ -1,7 +1,7 @@
+ /*
+  * SNMP functions for CUPS.
+  *
+- * Copyright © 2020-2024 by OpenPrinting.
++ * Copyright © 2020-2026 by OpenPrinting.
+  * Copyright © 2007-2019 by Apple Inc.
+  * Copyright © 2006-2007 by Easy Software Products, all rights reserved.
+  *
+@@ -1042,10 +1042,14 @@ asn1_decode_snmp(unsigned char *buffer,	/* I - Buffer */
+ 	        case CUPS_ASN1_OCTET_STRING :
+ 	        case CUPS_ASN1_BIT_STRING :
+ 	        case CUPS_ASN1_HEX_STRING :
+-		    packet->object_value.string.num_bytes = length;
+ 		    asn1_get_string(&bufptr, bufend, length,
+ 		                    (char *)packet->object_value.string.bytes,
+ 				    sizeof(packet->object_value.string.bytes));
++
++                    if (length >= sizeof(packet->object_value.string.bytes))
++		      packet->object_value.string.num_bytes = sizeof(packet->object_value.string.bytes) - 1;
++                    else
++		      packet->object_value.string.num_bytes = length;
+ 	            break;
+ 
+ 	        case CUPS_ASN1_OID :
+-- 
+2.43.7
+

