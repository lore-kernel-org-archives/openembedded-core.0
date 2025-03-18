Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AF5C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.4316.1742272751767534124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A6Ul7iXY;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22438c356c8so89496415ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272751; x=1742877551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=A6Ul7iXYABCw/88ls+gk117NpNkkV5xKWwzCPUrPrvdWJxL6IzNLobZn1O1nJ4h39q
         2+GHS1PXwr3ApnSVOMLjLcP2ts21JVow7GOo0DAni4TadV9dIRiwMgeoWgNhLVbaHpiI
         9XqbVEXGHlQcNzkQqervWcaaTJSmbbf/nGm+6+zuf2XM2J5KYX50z7ss6PoRHObYebtV
         Om45o3R2ax1zHx8pAZ4nwEjpF4akfDalEehrwA7gwsthYItxpkQ052tWlPAG/CDl+1OH
         DmJELuf1SwqS/Eg0/8wgwhDWG134cMcJ48RO5hG9BgIB9Sn8kUemmq6Mtu1TPkjS1pVu
         VjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272751; x=1742877551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=Rm4t11j9q3CoPS8wZp8NqwJlCIOz7Nreb/QA13fDYUai0Oc3bPiWY1HxbyE9LflP31
         pcQE5RjZFqJv2nyu9yFLypoFd1pOlQfZFy7HiIk9PDuBDxlZizkmjrMzqkMM05SAvS0z
         TI+JOlj6T7ovXKgUp4kCKTjCWb8GanZQgCMlt8Wu3GldriGbSGdRRBDT26w4JxXJsiDK
         XnVGfhd+jiUsc+3Y8Z8S+DJ1Kcl3pV1g+WX9RCRTgtrtp2GeGSYgQATgldx76ZClXeeZ
         A2Z+5hzU3sJQ75CW2TIRwCe5VorAuc0W0QET6hWoAZOZENq7+eVT4CxjE3oxPA8xFPdw
         7aCA==
X-Gm-Message-State: AOJu0YxT5s34CVZGgkMwufJAyvVli2QqFeVllDFdn9sp11rQ2Oo08lGU
	Rvog5WOJJDNbGMNgpelhvu3eZUL6X89xPKdtUwa4nhoPCOtsk3WiWA9XsrkU
X-Gm-Gg: ASbGnctfaVAzGFvnH9tQGfvn886icUoUQNb9Ppw/uXt2JulMFZs6wBDkg0HiS8qr3Yv
	PeM/HbZAYFFS+e/wt+l2PgItbNZlf0eMeYtsts+NIaCOhLBTQ7r+aAZJ6vJmP0PTMstnZh+OuVE
	OML0ohvWjZTc7k5dSq8s+7z2+wLAUM0oBlWFypzQuzy7SYkC6mq1IE6ECQmkMiDjGS+lb7Upwqd
	fJ0XB4muUCvhXsUJs9ylRAKcwyVQ2kYrecmwy8/AOS7/ludLS72VM+Zh3ru5IpASjEtjxlkrTaR
	8hU3/VgLEUmtcqaWebVB0NL6S59tzuQlW3Th
X-Google-Smtp-Source: AGHT+IGMlgoQPsXBeP8eKvKFOorj1PUKePFd9UCgv4/kV8dYPAlKP0uIERFTcXje6+tqtLwBesKbng==
X-Received: by 2002:a17:903:2412:b0:223:5ca1:3b0b with SMTP id d9443c01a7336-225e0af4fe0mr208208095ad.40.1742272750949;
        Mon, 17 Mar 2025 21:39:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 24/24] at: Remove mktime signature from posixtm.c
Date: Mon, 17 Mar 2025 21:38:44 -0700
Message-ID: <20250318043846.2422141-24-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213158

This is in conflict with signature from system time.h

extern time_t mktime (struct tm *__tp) __THROW;

GCC-15 with C23 on, this is treated at error

 posixtm.c:45:8: error: conflicting types for 'mktime'; have 'time_t(void)' {aka 'long int(void)'}
|    45 | time_t mktime ();
|       |        ^~~~~~
|

config.h is local include file to use quotes to include it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/at/at/posixtm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/at/at/posixtm.c b/meta/recipes-extended/at/at/posixtm.c
index 5514ba4fe26..bba8312d9a8 100644
--- a/meta/recipes-extended/at/at/posixtm.c
+++ b/meta/recipes-extended/at/at/posixtm.c
@@ -20,7 +20,7 @@
 /* Yacc-based version written by Jim Kingdon and David MacKenzie.
    Rewritten by Jim Meyering.  */
 
-#include <config.h>
+#include "config.h"
 
 #include "posixtm.h"
 
@@ -42,8 +42,6 @@
    of `digit' even when the host does not conform to POSIX.  */
 #define ISDIGIT(c) ((unsigned int) (c) - '0' <= 9)
 
-time_t mktime ();
-
 /*
   POSIX requires:
 

