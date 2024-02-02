Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BC1C4828E
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 04:31:36 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.16073.1706848294579134075
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 20:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vkz++ILa;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-295f95ac74aso1371740a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 20:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706848294; x=1707453094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fz3kh/ZVDZ9R52E0cZ85I6uzauaiv9GXvMj6Fql6iDU=;
        b=Vkz++ILaa5VlqN4Jh8mF18hF0PlEmI14mE7Nxlf+2U0Bvy8+lKPUesZNR8r/+bEprf
         LecUDj/bGm94Zje+xMwYvG0qhGLo7H3cqy0y5X/YTN1C4WCVY2KkIcrJ+4TKR3e06VAE
         mLeKelVvziTbq0fnDsGFGDrUAkNUD/9H9XLpszDhjSGf0IbFRRpXQ0JjB8lGUj2UUqKg
         Fgq/j7F7fylLsXTvStn1WM5fMFnfgYYFdiqqm/DQ/d5JGtklGkMMKytX4xfZc+cRm018
         MAQBLudhwlQj0KFHDW8hJJo07+DErF32B1eZWsP3iZjNnjmt4rPmY1f+YQ537nr8TtEk
         rL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706848294; x=1707453094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fz3kh/ZVDZ9R52E0cZ85I6uzauaiv9GXvMj6Fql6iDU=;
        b=Fq85TnJ4ECezSP27lkW8StnqtaYB5ZNIhKWeM4NIFJ7+hm8yRwRDZ5ukVn3W5MEab7
         CDzMc2D/9+0SRJgLqeyp6YMxVrklkmXRMhW5g+CUAj2+UsoNNfWEMrTQ3BqHyYWbmU6g
         G5nkMqB6v4yaF6JUySCKyFWld04zjWEOoBai2LoPE2uancoAHOKJF1TSukCcQiSUTc+E
         UGWZLovz/mLi6rqC5TmvyNA7EaXy9YQFmpaOsc00t4hv+KPijRhsUGzmpJ1yTTCh2rV5
         xw03C187hiYh3+LdkxPEzjBTZfxOzuTjxsUc182xd+sKIUSlm1a+eIAQD0R9o4podTql
         kH8A==
X-Gm-Message-State: AOJu0YzEbv4S1UfiSnwyb5ri+EENI2KSKL+h1rCA8UXtuNwgjMkVsE2e
	HzAZ0IaA9dnVkmtg3zLy2A6dPjMazD6tqdugCbKQBHvMzk9zel8otuauDt0bYg0=
X-Google-Smtp-Source: AGHT+IFOU+rgJheugVxhkDUhceVIsCACjkTsrHWwcoRyFL6WCCFnl8m5F9tpOJ5fTR+0fc8uFSBdfw==
X-Received: by 2002:a17:90a:e610:b0:296:2ffc:4f58 with SMTP id j16-20020a17090ae61000b002962ffc4f58mr1133716pjy.16.1706848293643;
        Thu, 01 Feb 2024 20:31:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW/b04ShCOe78jjyzouErFA+tNV5Wen1DlPH/HcsGej41wNCexBsiiyM9ugs9HHNcEHXaGG+jWEDKEXwC2ldj+IwJuY37mz+NCNOleG
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f76c])
        by smtp.gmail.com with ESMTPSA id fy18-20020a17090b021200b00295fac343cfsm3475976pjb.8.2024.02.01.20.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 20:31:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org,
	yocto@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [pseudo][PATCH] pseudolog.c: Fix build warnings seen with gcc-14
Date: Thu,  1 Feb 2024 20:31:30 -0800
Message-ID: <20240202043130.398590-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 04:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194782

Define _XOPEN_SOURCE or we do not get strptime() signature defined
resulting in implicit-function-declaration which is an error in gcc-14

Swap the parameters of calloc call to fix calloc-transposed-args warning

pseudolog.c: In function 'plog_trait':
pseudolog.c:378:34: warning: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
  378 |         new_trait = calloc(sizeof(*new_trait), 1);
      |                                  ^
pseudolog.c:378:34: note: earlier argument should specify number of elements, later size of each element

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 pseudolog.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/pseudolog.c b/pseudolog.c
index 1101f28..ad04753 100644
--- a/pseudolog.c
+++ b/pseudolog.c
@@ -8,7 +8,8 @@
  */
 /* We need _XOPEN_SOURCE for strptime(), but if we define that,
  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
-#define _GNU_SOURCE
+#define _DEFAULT_SOURCE
+#define _XOPEN_SOURCE
 
 #include <ctype.h>
 #include <limits.h>
@@ -374,7 +375,7 @@ plog_trait(int opt, char *string) {
 		pseudo_diag("invalid empty string for -%c\n", opt);
 		return 0;
 	}
-	new_trait = calloc(sizeof(*new_trait), 1);
+	new_trait = calloc(1, sizeof(*new_trait));
 	if (!new_trait) {
 		pseudo_diag("Couldn't allocate requested trait (for -%c %s)\n",
 			opt, string ? string : "<nil>");
-- 
2.43.0


