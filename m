Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB077C36009
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.2930.1742372200803241635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWgdAkQJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-224191d92e4so126431895ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372200; x=1742977000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=aWgdAkQJ003LUfhqTXa7nvNUs9e6MRHR2uR2tSfC57rsKBxCRyC6xHUxSFC/oIxs6f
         czhE9edsgxOMTYIh+iQYAfWxS30J4s2XaVYhLuhZmALNt32vPEOQ9g3UjyJOfAHu9qrC
         6vBwN4w2lm2Ee+QexiuUCu+IgZD9J/8eyVEVPKanMxukKgnbzRXKuF/L56qFAd/Ue4Ur
         vRV8FMgjdHAYi9/SO8BFQy0QBEUDNEu2vdWM8DQ1P7p7wZuqLaVffFzfE9YKcKPHVFnI
         XSUdfqeI5jgXoLAaVTfIzfc3I7+U7hbjWAViNSYk57qTObOlZbh+KMgY74HWvWMx/TTw
         x3nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372200; x=1742977000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPHM28uBdjpHooxMXjSAs93HbFmeeD990oxPLiAte2E=;
        b=s5IdvHaIzvDusKHKxFYO+NhSFt6z1X+aADQoxkiA5GSCJY+htzEtlNeUcoG5aQwM13
         636u4FmaFeAhQwQpOH1UDzq8U9hp5kB2w0GK2hR7q5o4LKiIEGJeR88cP8RgpCDAlxmo
         /4oY4u89VNQam9DKJifnA+rFHJyawLAbwnPUeDfpOYRTqWPeJOT2ZzrvD8GBsN8YNc2T
         PsLIWVzVvbxa31NJNy9xo4tSV/AhW2f+UrCx+IDtIjnNlYw/Qjb9uwenrYMI5Cn6w6km
         cw4uA6QrmpDh0LEeoorvmElFVO33C0ksPYMHVdT3fXT5ZyHmt2qVgd1kIMfyssZofcPK
         9JOg==
X-Gm-Message-State: AOJu0YwT7ynboSRivPMAahwf48Nkg896+NTobri9v4CCjvCqEppKISic
	/JgMSa3wSa34uZ2ppfMP8U8Vi7TtpjKuiAwOX6zZx4hz3Uj4xWmmt4HyApI6
X-Gm-Gg: ASbGncvb45I77LlNPLDW1EutPAUcsjOisN0Y6ElVLvJ0gI+Hnbj98EBGu58MMH6Zlxu
	uzQ8kPlxTvTX2hVWkEIvWZeyJ+ERBV0pAg52aEU5pKhJ1ewGGO6ywdB+hRole/ucGXjF4i2btBc
	AvDBChp3JgaULZY3rTWtyyafwulxv39tQRdwEkxWYi6armktPwdj8ogI24fHu77pYZyzyLKveJv
	4LDkFNz837enEvZNzT//C7Jbqn6CI/2RUMDCK0egxB9/Hk1kIPmeTKCXO4xst21AM0FtEJKW6f2
	BLl1WnjkDfQbIXqTqeXjxjUP6we41XdyNHTZ
X-Google-Smtp-Source: AGHT+IG98F0n/c8SZ+9IA7di2jWlkusAsFGhpdQ7lC+ICFiVjdfba0dThR4+MMieTcrD4r4B42LKWA==
X-Received: by 2002:a05:6a21:1394:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-1fbeb79ad3amr3113485637.10.1742372200058;
        Wed, 19 Mar 2025 01:16:40 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 22/27] at: Remove mktime signature from posixtm.c
Date: Wed, 19 Mar 2025 01:16:00 -0700
Message-ID: <20250319081610.3536475-32-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213298

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
 

