Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DB0EF3705
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 08:03:32 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9188.1773043409392996453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 01:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YVN6aHWp;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483487335c2so94100965e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773043408; x=1773648208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O8w30QYFFCicJqCK41GsFnxo9FQusrmSjOzMfp11vQY=;
        b=YVN6aHWpHAfiL6MpILwz/Ek24jX4mNTfcE/R4+biaDbV8MOEPHT113Z/ayRhQMJIM2
         Ge10lqeHxbfc1TZ5MGOXVMkhTroKcbsCO0r6E3N3lvi8B9GBvbqTSYmj+LCc2ehyXB9M
         1Jd5s0/R5fADHeeRHnSYMk1Vl/pguR7u1VKvKeeXGHWi/6Afn0oqMfROm9NtiW8fNd1E
         z3RQeTBaWLKyIXCTfb587FTSxbC4nlBFP3/2n6SF+fmxvqdP9A1M9cD/w9WlQ/FTIqpE
         cFdjgL1qEJjXBQX7wjFf9qU1+zPDchM2Vv9sL3sgP8OlelhWvMC37W/IwfKaNg9QnK05
         85hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043408; x=1773648208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8w30QYFFCicJqCK41GsFnxo9FQusrmSjOzMfp11vQY=;
        b=Ut1FhSGWKMiZVPcpELJxESaXQTdXT6WBIWgSknsxIzsWMWO6LFQ/6/3iqblf4CbL2s
         6rENox5y+t+d0Ps9TQhsMoljopYO2OBqTUOccWcN19C9hBM2SXGGSxMmcXJqCYinuLgG
         DKCBLj5FjrB1agpgl42NKohV7T4Nqh2dQlMGgkovCXmsndOdFRuJKVgM9RzGI1jYzfba
         KW8hUWV9OM69HXyC3yvSQOHQHwK8mPz9VhcKdCpvvCuXie61mfQ5yOtAt7YhqcLqOj3d
         QOfjSOku5EBZOt5I/HKojmutwT5HAyD0bxvoEF+LsOVLJIj40vfKdo6OmxeE6RNXVosq
         fUPQ==
X-Gm-Message-State: AOJu0Yyu7ZJel09Nv7wQBNeHTFqWIyKG74WhnCTQTzYAagWzQd/cv3qj
	bsqljn6w5zD5dIgSBM9Ggx4vrWV9ef8JRhXtKC1JUlwyE4Se/PO6d0D5Vj4m+wq/
X-Gm-Gg: ATEYQzxruy1o6FcZBlwT7Mjt6cmXIVsjD7No8iVzDdrEAqlUDbvj6QcaEGDLk5xwHp8
	NHbDmRmND8S2ePbDtKs8egW3CJeI+l091Zb4jEb4S5NKuSf/i6G0JOP6jfVohqWVez1aCcdPgIX
	ARB6TplLjrPp1q6uQwk9rijC6evOsq6da5cUgWTGZkBhJa2m8LtY+1FQzCXcYZ9lkYAmahlP7cj
	XNP1rZprIg+WZMb6JX5qQLHLqAeoj24G7IvnQOmbtjwKfYYEyeyQtfGJQnGJcJ4oRwVCXRB2aQS
	Rp4MHFCbxPSTv6A5xmKQkjiAUwQ8FgMEaln52Y/9mFA7Na0T6EhmZBXerQz78fSmWWSlZzdVYUv
	oXDk6uyy4kQWUQ+5/xxV+meZO/kyFOZrOz9+8OKPwXFbpo+6+2ulXCYhXac8SQyoiAL7pf9wN8A
	1c0Yc3ZbUc2Z3RJNJv2FDWkIN11w==
X-Received: by 2002:a05:600c:3b0c:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-48526979668mr170689535e9.24.1773043407338;
        Mon, 09 Mar 2026 01:03:27 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae45786sm26778545f8f.32.2026.03.09.01.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 01:03:26 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Steve Sakoman <steve@sakoman.com>
Subject: [kirkstone][PATCH 1/2] libpam: re-add missing libgen include
Date: Mon,  9 Mar 2026 09:03:23 +0100
Message-ID: <20260309080324.470847-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 08:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232687

From: Martin Jansa <martin.jansa@gmail.com>

It was added by original commit for CVE-2025-6020-01.patch
https://github.com/linux-pam/linux-pam/commit/475bd60c552b98c7eddb3270b0b4196847c0072e#diff-05f443e6acbe32a148a45648148739bf6f02f13acc5c20c6037bf933223d4d77
but removed here in the rebase, causing:

../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:11: error: call to undeclared function 'dirname'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
  326 |         parent = dirname(buf);
      |                  ^
../../../Linux-PAM-1.5.3/modules/pam_namespace/pam_namespace.c:326:9: error: incompatible integer to pointer conversion assigning to 'char*' from 'int' [-Wint-conversion]
  326 |         parent = dirname(buf);
      |                ^ ~~~~~~~~~~~~

Backport 6d88a28ac7b6ff61808eb46e5c85dabd17c77f2e from scarthgap.
It's reproducible with clang-18 from kirkstone-clang18 branch of
meta-clang.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch b/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
index 4f5f780f9c..53ae2bd2ee 100644
--- a/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
+++ b/meta/recipes-extended/pam/libpam/CVE-2025-6020-01.patch
@@ -1528,7 +1528,7 @@ diff --git a/modules/pam_namespace/pam_namespace.h b/modules/pam_namespace/pam_n
 index b51f284..abd570d 100644
 --- a/modules/pam_namespace/pam_namespace.h
 +++ b/modules/pam_namespace/pam_namespace.h
-@@ -44,21 +44,16 @@
+@@ -44,21 +44,17 @@
  #include <stdlib.h>
  #include <errno.h>
  #include <syslog.h>
@@ -1542,7 +1542,7 @@ index b51f284..abd570d 100644
 -#include <sys/resource.h>
  #include <sys/mount.h>
  #include <sys/wait.h>
--#include <libgen.h>
+ #include <libgen.h>
  #include <fcntl.h>
  #include <sched.h>
  #include <glob.h>

