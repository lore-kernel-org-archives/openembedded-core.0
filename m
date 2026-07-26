Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88876C54F54
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7383.1785054619717742711
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xznm/IcN;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954aff6088so14425045e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054618; x=1785659418; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DO0UCDvA8DKIfRnK095G3X5vbsFR3/TpwECtuG44dVs=;
        b=xznm/IcNuGWMdYa5J3KRh8csIPdUy24WH9iNZpIs5PPXvZDg86/0Vvy+n0i/pYtwoV
         K2hQXmRySGbHs7LklQNXZEtnTLGU9KHz0XaRGfv/Lh9wWRfLES2DYLNg2lVtiCJyoaKY
         eNxp2QGJGSd3JNQnvLN0Javqt9ycnCgQvlscI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054618; x=1785659418;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DO0UCDvA8DKIfRnK095G3X5vbsFR3/TpwECtuG44dVs=;
        b=VmDIpPiXKDHZspo5rcvTyb2OYvjFz+iIs4R/XBMWA7905OMP2Bh+EXQJNVWh6pnR1Y
         F3WhhgnwK0HQ/nAyXnTgxz8A5Wg6kCVPuKpBfljQFTKYTJEAnP7/st+cfKqVV94pvQET
         ois+wYte7X/s8eO2OF2bhfl/FZOFA41/xSb/QF/aX+5uf1GWdaxw965mSj08gkUGEYJd
         h27L/MBQlATT2SgHQfg020RuPmd7y617uhrMCb3eZAAZc+rOeDzkwwsNW38R33qQ2h5s
         Ir/9NfOPMMHUgOMFvNuRjUj9Tb5LYISRp94ZojSxbB1ZzspTPxOaQggm1AdfYDRemrTr
         jzrA==
X-Gm-Message-State: AOJu0YyJYEfV4RbThgt1JsqI6eA+Jb+7WEfAMF9FGXTxqurWrfDQ3JTV
	l1w/IdY/5C+zsgv7cPIuph7eGx2CYEu+s5Kp/qIJwAMvT8VZbiAXWTkSirz1qtY4yfy7nQHaPGl
	HVdg8iSI=
X-Gm-Gg: AR+sD12GWp0FbhKB0aOpooCE/8u4QAIuNeIl3ny0LLFObsUhUWouBMGU70rvvxvjzwt
	GEkTghmEkA2ajtHRKDTZ11LBIa1+bBkmnnjcN7I96RlS+hPsu2DowRjlAFK6tIX/HKY8ggeX3PQ
	jnStwV06cGUQ66SuHBRknCfXQvnCz7QxTu4A86jvJ1TrI9UEgfDupwtFyKRYuE8hNznlqApoJFv
	jxtyAFsYm3Ze3McMwm10mIQlzWTIOh78zKr4GypO6s4Gn2CCXO73htu/iqt9/w+zr0I1zlxiJRx
	/KCPePf0E7tvJem8YjZmUYIEKw3jUAAkhzp0IIsPoDNbV3/+oYWlONOxCiIHbUwGeS8rqzO5fqh
	I3keytoK5Yyf7Z4GNCU3kNZuV3p5w4llqfpDQhPdzxrGyxOLHhfH2TACQlPCLRkZMvplz4ZNtLa
	pTYJ1lsvtAlaNeFD6gsAw2G4o7KAcowmUDLzZgZACMN22I+X5Td9xT+nI5aF4ldQwDmnsYB2wGm
	pPxIw==
X-Received: by 2002:a05:600c:190b:b0:493:bcba:46a4 with SMTP id 5b1f17b1804b1-496b570dbb0mr55243515e9.20.1785054617958;
        Sun, 26 Jul 2026 01:30:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/31] cups: fix CVE-2026-41079
Date: Sun, 26 Jul 2026 10:29:38 +0200
Message-ID: <bdb4178b04dabbdba1c1f32aa34bb50ee1a8aedf.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241996

From: Deepak Rathore <deeratho@cisco.com>

Pick the upstream fix [1] for CVE-2026-41079 as referenced by Debian [2].

[1] https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080
[2] https://security-tracker.debian.org/tracker/CVE-2026-41079

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
[YC: reverted modified indentation in imported patch]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-41079.patch            | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index ec9392b73dd..f74bcaffab5 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -23,6 +23,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-27447.patch \
            file://CVE-2026-27447-regression_p1.patch \
            file://CVE-2026-27447-regression_p2.patch \
+           file://CVE-2026-41079.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-41079.patch b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
new file mode 100644
index 00000000000..87a7e42316b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-41079.patch
@@ -0,0 +1,71 @@
+From a331e93e2f9baf411715ef69ae19b73827da23d7 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Mon, 13 Apr 2026 11:50:23 -0400
+Subject: [PATCH] Limit num_bytes for SNMP string values.
+
+CVE: CVE-2026-41079
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/b7c2525a885f528d243c3a92197ca99609b3f080]
+
+(cherry picked from commit b7c2525a885f528d243c3a92197ca99609b3f080)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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

