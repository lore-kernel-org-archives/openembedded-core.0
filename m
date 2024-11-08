Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA00D5C0DE
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:25 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.14266.1731077655707092793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ioTAePkw;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37ed7eb07a4so1500544f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077654; x=1731682454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMj6/4kn2R1ioP2Tqtn1NVMh4jMUB3/+CE3rDQ3TYUw=;
        b=ioTAePkw3vboZBO8jLfZBehUdfX33NCETWTY0TzLr52Kp4V/b2cFTFtCPVKDaN7L80
         uIfieaYbHLLqK21t1//22QwlOboGt131Wd49OagwPdlz9Ba+dikhxxpdOi2Udbjg+MJr
         I6R1f/ECF7iO6zIjdJVawsuJqeFtBri/46osjNSUiq9sWvOICj1rDzyn+q2UfYXs6A2q
         VIkJdmFYYME1QVA8GzA7Fq74jYfEQfoyNErheDo9CETSVY5cZmXWPDhAXmVxewGbjmBU
         8Z0qGKXoUIScec13vw2IESIEn4oyJVP7r1jr42aAGE+fWTaj1Z/vYbF/cMvF51+/1cHW
         W7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077654; x=1731682454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMj6/4kn2R1ioP2Tqtn1NVMh4jMUB3/+CE3rDQ3TYUw=;
        b=U9auOiGv0QaWOynwoHRiSY5GjLD66sTfQEvQySYBGbNIOJCstwMjSvPKohAYz3Tgn7
         /VKNAnjIbly1L8a1Dd91pAp/3FfpcTpdoUzCgC1WJHWy0OTJkWmqU/I118wUHBDjf1e6
         ZVKlGbkPVFmHd9vxjW607Lf8kRk2UdI0ryOltiis5HksFz3ftaV+RLzAC8R4n8n0Bzv5
         +v/2gTCRteXL5WuJbm9jEt7cMpVPGpS+QWDoXOfmI6UCx91J+KPWGwE+DZwlvGC5cGdk
         AlZnyfAaB0h8/wz1hlSYuo/lMNnmnbsx2btgMO64i1tH12ZAPkGpkP5W/UKKhYwkMEwO
         iqGA==
X-Gm-Message-State: AOJu0YyXxJwkeemliuP1O5fGq/ilFvKd8rybDxoHyHMVOcAvuyF3c2pv
	3NQYDy3vvAK5YrkW0uP73hLZEuW72eS2p1r/3Fs5fTAZ/IY0/9lVo41BwQ==
X-Google-Smtp-Source: AGHT+IF8TVEt4YLPBfuXaDOv7FjL9H14CxuADYFGqu6y+4lYqVF87v+vlshSgKfBFuNrNBwDySnq5g==
X-Received: by 2002:a5d:5985:0:b0:37c:cee0:96e6 with SMTP id ffacd0b85a97d-381f1822ec4mr3189215f8f.27.1731077654024;
        Fri, 08 Nov 2024 06:54:14 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5f82sm74458985e9.42.2024.11.08.06.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 10/12] pseudo: Fix to work with glibc 2.40
Date: Fri,  8 Nov 2024 15:53:34 +0100
Message-ID: <20241108145336.224466-10-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206884

From: Richard Purdie <richard.purdie@linuxfoundation.org>

glibc 2.40 renames some internal header variables. Update our hack to
work with the new version. These kinds of problems illustrate we need to
address the issue properly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index da4b8caee3..dfb5c283f6 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -9,7 +9,7 @@ Index: git/pseudo_wrappers.c
 ===================================================================
 --- git.orig/pseudo_wrappers.c
 +++ git/pseudo_wrappers.c
-@@ -6,6 +6,15 @@
+@@ -6,6 +6,18 @@
   * SPDX-License-Identifier: LGPL-2.1-only
   *
   */
@@ -21,6 +21,9 @@ Index: git/pseudo_wrappers.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
 +
  #include <assert.h>
  #include <stdlib.h>
@@ -29,7 +32,7 @@ Index: git/pseudo_util.c
 ===================================================================
 --- git.orig/pseudo_util.c
 +++ git/pseudo_util.c
-@@ -8,6 +8,14 @@
+@@ -8,6 +8,17 @@
   */
  /* we need access to RTLD_NEXT for a horrible workaround */
  #define _GNU_SOURCE
@@ -41,6 +44,9 @@ Index: git/pseudo_util.c
 +#undef __GLIBC_USE_ISOC2X
 +#undef __GLIBC_USE_C2X_STRTOL
 +#define __GLIBC_USE_C2X_STRTOL 0
++#undef __GLIBC_USE_ISOC23
++#undef __GLIBC_USE_C23_STRTOL
++#define __GLIBC_USE_C23_STRTOL 0
  
  #include <ctype.h>
  #include <errno.h>
-- 
2.47.0


