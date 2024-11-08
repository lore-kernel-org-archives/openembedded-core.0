Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D2DD5C0DD
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 14:54:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.14506.1731077652339419448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 06:54:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OIIdM+yS;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315baec69eso20125215e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 06:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731077651; x=1731682451; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3suObvGfxbof3lNDqnDkYuvyVKahFoerulEMJg4yDk=;
        b=OIIdM+ySZBVk4xDGWAxquM/o76PGRNvDQha9NfakI+grLdyhvu3KVNECmTm0OLD+sJ
         uxn0MLwn98/LKf9MCAzYdTBaq3UnSFB4l/LA3p/+HZF5A9WK8N4jVWuGiA6+MIaEIzJn
         7gdpFTR+8eX+mxPIcw+np00LxzBSjEVEX7TuvLaiMEaPD0aMpfqly3HCNgguKHOQ92f2
         0HYvCUzlX3ghkcg4pXRFIGhMgknAPtRnPE6M05UibJKNxLZL9HUddCNXMVPyjMItyV1g
         jXtRphSHlOsQjj3n+TxO9HDkWzanozk0CGZqmgh8qnwO6pQXkMhTRSMx8tIzroB42/Gi
         jE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731077651; x=1731682451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3suObvGfxbof3lNDqnDkYuvyVKahFoerulEMJg4yDk=;
        b=I0RNQ8ETwGSWFQwNUbCJyds4QP/JdX3+NoMkyPIogVZGyr9lhQS0eeY1FEBoIg9Box
         ut0AziFmAGm7XV/HsxuuAv4gGZjtmrxDlkDAG3YDhbgSMsx12QXGQ40udz+YdQKWMbk8
         H2N9RtiOB/I9lUHJeyjo1B2Gv5eA86Y7o457OWEH6FQC0dfzON+BBcWqELHOZI5oPHwT
         PRjMhChMspp9WdNhz5Rt/SZU6s+ht8O3YcfTQprHKmZdUepa97ogjJxUbgdjvV977c4f
         2YV0/EvGbqInTUn1QEvhJO5i2g7i0H+epFvuUj5jFlb6xMBuwVXdLn71EhQs7cwDO7l3
         WI3A==
X-Gm-Message-State: AOJu0YxXG8SmyUKuE9WSY0ljGN+SoBLTl/nkGnCyQmgWXPq2VxvDmch7
	jZ34TiXDjg+WusKVvzYaIti2knWRuZi5PsfyGjs6wHo8c18uSYR/XlxEUg==
X-Google-Smtp-Source: AGHT+IHeXwsniwIrfnyslV1rEaPu8zvPanzVrI42yHIkPnkYk+i3dmbBXMzQqZWiF/fpMp5+apoHhQ==
X-Received: by 2002:a05:600c:3b9a:b0:431:52f5:f497 with SMTP id 5b1f17b1804b1-432b7502771mr26509215e9.9.1731077650669;
        Fri, 08 Nov 2024 06:54:10 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c202asm74917415e9.30.2024.11.08.06.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:54:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 07/12] pseudo: Update to pull in gcc14 fix and missing statvfs64 intercept
Date: Fri,  8 Nov 2024 15:53:31 +0100
Message-ID: <20241108145336.224466-7-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108145336.224466-1-martin.jansa@gmail.com>
References: <20241108145336.224466-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 14:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206881

From: Richard Purdie <richard.purdie@linuxfoundation.org>

rpm 4.19 now builds with LFS64 support enabled by default,
so it calls statvfs64() to get the space available on the
filesystem it is installing packages into.  This is not
getting caught by pseudo, so rpm is checking the host's
root filesystem, rather than the filesystem where the
build is happening.

Merge in that fix and a gcc14 fix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/files/glibc238.patch | 13 -------------
 meta/recipes-devtools/pseudo/pseudo_git.bb        |  2 +-
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/files/glibc238.patch b/meta/recipes-devtools/pseudo/files/glibc238.patch
index 76ca8c11eb..da4b8caee3 100644
--- a/meta/recipes-devtools/pseudo/files/glibc238.patch
+++ b/meta/recipes-devtools/pseudo/files/glibc238.patch
@@ -44,19 +44,6 @@ Index: git/pseudo_util.c
  
  #include <ctype.h>
  #include <errno.h>
-Index: git/pseudolog.c
-===================================================================
---- git.orig/pseudolog.c
-+++ git/pseudolog.c
-@@ -8,7 +8,7 @@
-  */
- /* We need _XOPEN_SOURCE for strptime(), but if we define that,
-  * we then don't get S_IFSOCK... _GNU_SOURCE turns on everything. */
--#define _GNU_SOURCE
-+#define _DEFAULT_SOURCE
- 
- #include <ctype.h>
- #include <limits.h>
 Index: git/pseudo_client.c
 ===================================================================
 --- git.orig/pseudo_client.c
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 067fb6b378..ad7067a08f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -14,7 +14,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "a8453eea4d902bbb0e01c786f1cb4a178c3bbee3"
+SRCREV = "516a0a3c4b46f046895d27bfa019d685fe462dfa"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.47.0


