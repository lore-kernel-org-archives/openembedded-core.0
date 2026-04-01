Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBD710F9311
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 00:39:10 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2426.1775003948669381030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 17:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RfuetI06;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c160cb021cso6504091eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 17:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775003948; x=1775608748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yplRVVE2I7EuY0lGjhMKs1kBZtEhKCHjgRTOFyT/hhk=;
        b=RfuetI060yGSvu5iPN2jhXOh3JHGCFeUKcDQBVMtJ14pvOPHUGUIJbLuh72SUXtvlM
         ZUMPu5LqWHUrFtg/tjyW/2dUUJkjk1xbX+mObEo49Rk1Zvv3hs+EBUkOw0y7ZWrj8cxo
         WBcMzEnn/bGtCmMVxC9GUOOVbT/Hi+rrQr6rL+JRGL12xAU932JY4oVfIud8EkTJDqVM
         smIVpHTTcs2s5NAe1CtoyfqhIDTI4KAhyJoKheGIaO5ILC0cRlBbyEFWLzL8jyD1C8eP
         lVuixchOZMSvZWLq4Dcy3ABMVp9DxT+on56s2OrDuO4vNd3pfTwWzee+pz2FTVEb4Gkd
         p9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775003948; x=1775608748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yplRVVE2I7EuY0lGjhMKs1kBZtEhKCHjgRTOFyT/hhk=;
        b=VthpCYccdkVwlim1HKDw2abInyqslccvZ9EG9Y6bCqpY9oIRZhOGWVE0HZAj836bun
         6bvcjDs8azE+e2H6/slBcw8p4e2F49CnBxQd4BYE8UtfMngc2COiA9bjPFegfsR44NPj
         7Yvb5MQCl2TS3aqQZpYXE2jy6vOa/ZdGK8vhEI3EV6d/FhNcJxuCDTwlypOYKyfQzdPk
         ZE3HL4eLe6L8uebHP1geY/k+zEeyvyjHqvbEV0JnswBjP+cH4xPPkq8Lam2dK93dlFxe
         /x6tq0H7m8ZVITvZXMEnGQQNlKsp9tIr0v5u1xXkSy0tAJQc6fi2xqs8fdyhm25JAmpI
         XeKg==
X-Gm-Message-State: AOJu0YzoPDUwDAhAnL+sgfFrawrGpm7tqA32BV/KuAbq7e9DvqavhJfo
	P9c0aGrcdOHk+kCbdhbwq9nEwvJUnlRUIAbQNaDNuzi1UPlu3ZFv6NK6gafSRyND
X-Gm-Gg: ATEYQzwH6NhKM9e1tbGWqXiJ8ticVieoaaw4brYYoBDq/YcrvLZdZ9sQeWsCs91qfZS
	NMYXJ9M/GnFgbDT3AX+acg4eFUCwbkAx+8/E2khiBlw66bX4VJcDFr+BclK6x3i0CS+D/DpzB3L
	TMVf+r1TbHwhIZpWPMFYiIRBIKVDYWYKD0M5klH5vYgVfVImsEwWNczIBJlFqGmstTRredgQplN
	fSdjxI4ZHV1cnRd+y7MjXAX45m29mNWmoeDRviy0yRsjAB52Q7n8pwGfOJjn+M87SAHNdCOBK0m
	kAaUPMxn8rXfBfeB8fA/E90MUPWRBMT6GGjuPYcnvUB3PZXcNSZJ6CvuXadir8KnU7j4OwGOhfg
	/p2J/vh19V+vosD5arBG3tEAQrKrkDJobPCbYJlggdFqEsHjjTDT5C31tV45+cyMP9CCxWJtoOo
	D+Rn2YLmH/p8DrLQjFBWeCKnhEFRedZyQ5E2+M2cGA+Ltidk7g68csdoRH+12Z20yzTAGxZAmEj
	UdED9HPnsbu9CXrQ/JWQVQ81OEZjMLrPPZEpvX3P5EiyFnuqtoIbZgmNxF0
X-Received: by 2002:a05:7300:5707:b0:2c7:3a7:c7b1 with SMTP id 5a478bee46e88-2c930b80368mr875281eec.1.1775003947717;
        Tue, 31 Mar 2026 17:39:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c3bda147sm11464721eec.5.2026.03.31.17.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 17:39:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] m4: Ensure ISO C23 compliance with clang 22
Date: Tue, 31 Mar 2026 17:39:04 -0700
Message-ID: <20260401003904.3245438-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 00:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234321

From: Khem Raj <raj.khem@gmail.com>

fixes

| ../../sources/m4-1.4.20/tests/test-float-h.c:39:5: error: use of undeclared identifier 'FLT_IS_IEC_60559'
|    39 |     FLT_IS_IEC_60559 /* added in ISO C 23 */
|       |     ^~~~~~~~~~~~~~~~
| ../../sources/m4-1.4.20/tests/test-float-h.c:60:5: error: use of undeclared identifier 'DBL_IS_IEC_60559'
|    60 |     DBL_IS_IEC_60559 /* added in ISO C 23 */
|       |     ^~~~~~~~~~~~~~~~
| ../../sources/m4-1.4.20/tests/test-float-h.c:81:5: error: use of undeclared identifier 'LDBL_IS_IEC_60559'
|    81 |     LDBL_IS_IEC_60559 /* added in ISO C 23 */
|       |     ^~~~~~~~~~~~~~~~~
| ../../sources/m4-1.4.20/tests/test-float-h.c:284:11: error: use of undeclared identifier 'FLT_IS_IEC_60559'
|   284 |   ASSERT (FLT_IS_IEC_60559);
|       |           ^~~~~~~~~~~~~~~~
| ../../sources/m4-1.4.20/tests/test-float-h.c:383:11: error: use of undeclared identifier 'DBL_IS_IEC_60559'
|   383 |   ASSERT (DBL_IS_IEC_60559);
|       |           ^~~~~~~~~~~~~~~~
| ../../sources/m4-1.4.20/tests/test-float-h.c:479:11: error: use of undeclared identifier 'LDBL_IS_IEC_60559'
|   479 |   ASSERT (LDBL_IS_IEC_60559);
|       |           ^~~~~~~~~~~~~~~~~
| 6 errors generated.
| make: *** [Makefile:8331: test-float-h.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/m4/m4-1.4.21.inc        |  1 +
 ...-fallback-definitions-for-C23-IEC-60.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/m4/m4/0001-test-float-h-Add-fallback-definitions-for-C23-IEC-60.patch

diff --git a/meta/recipes-devtools/m4/m4-1.4.21.inc b/meta/recipes-devtools/m4/m4-1.4.21.inc
index ce9fe2be8e..1af9b9a783 100644
--- a/meta/recipes-devtools/m4/m4-1.4.21.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.21.inc
@@ -11,6 +11,7 @@ SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
 SRC_URI:append:class-target = " file://run-ptest \
                                 file://0001-test-c32ispunct-Check-for-musl-along-with-glibc.patch \
                                 file://serial-tests-config.patch \
+                                file://0001-test-float-h-Add-fallback-definitions-for-C23-IEC-60.patch \
                               "
 
 SRC_URI[sha256sum] = "38ae59f7a30bf9c108193cc5c25fbb06014f21e230c7ede2eff614f7b7c37ed8"
diff --git a/meta/recipes-devtools/m4/m4/0001-test-float-h-Add-fallback-definitions-for-C23-IEC-60.patch b/meta/recipes-devtools/m4/m4/0001-test-float-h-Add-fallback-definitions-for-C23-IEC-60.patch
new file mode 100644
index 0000000000..b524d94960
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4/0001-test-float-h-Add-fallback-definitions-for-C23-IEC-60.patch
@@ -0,0 +1,33 @@
+From 0e7b8e00e0c670295340a6472f5d5a164697cdcd Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sun, 1 Mar 2026 19:28:29 +0100
+Subject: [PATCH] float-h: Ensure ISO C23 compliance with clang 22.
+
+* m4/float_h.m4 (gl_FLOAT_H): Test also whether the provided <float.h>
+defines {FLT,DBL,LDBL}_IS_IEC_60559.
+
+Upstream-Status: Backport [https://gitweb.git.savannah.gnu.org/gitweb/?p=gnulib.git;a=commit;h=0e7b8e00e0c670295340a6472f5d5a164697cdcd]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ ChangeLog     | 6 ++++++
+ m4/float_h.m4 | 3 ++-
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+--- a/m4/float_h.m4
++++ b/m4/float_h.m4
+@@ -1,5 +1,5 @@
+ # float_h.m4
+-# serial 16
++# serial 17
+ dnl Copyright (C) 2007, 2009-2026 Free Software Foundation, Inc.
+ dnl This file is free software; the Free Software Foundation
+ dnl gives unlimited permission to copy and/or distribute it,
+@@ -63,6 +63,7 @@ changequote([,])dnl
+        [AC_LANG_PROGRAM(
+           [[#include <float.h>
+             int x[] = { FLT_DECIMAL_DIG, DBL_DECIMAL_DIG, LDBL_DECIMAL_DIG };
++            int y[] = { FLT_IS_IEC_60559, DBL_IS_IEC_60559, LDBL_IS_IEC_60559 };
+             float maxf = FLT_NORM_MAX;
+             double maxd = DBL_NORM_MAX;
+             long double maxl = LDBL_NORM_MAX;

