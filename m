Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.2012.1627458991181068975
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 00:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p6BGdA5z;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: nagesh.shamnur@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id c16so1685654plh.7
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=WMTDHD4Ooy4TfB6FNdc6ZsqvapmhjI7C099Xqi8+W50=;
        b=p6BGdA5zFqoTTtfOtsUee18jssu5PW3VRXYEIcUjItp2IT+8BlBfcpy3Jwv9sboYiS
         yQIlnE0cE+pKmG46mj12ggvzpphuWhBszgMbiuYXBep3ivkDCQc1YzF9/x8hEKi3LwTy
         vDMJ0L3g36Bx/iFLLkUW9AclApFRh490ftgNDmYwmZc7E47PTYG7U7SDjJaQXSRLcx4c
         hoB8JDWZUky+8xFCyRPNWhkrh1nH46i/x3EM/d8TLjojnjd8GVQPhg0lqgWtgVhjJa8r
         HCtQCuXzv3eDJiZ+KdvitexipcrrElWExast50F3Z+gjXVhGSPHWPRiSrNC9/ZTd3wWJ
         geNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=WMTDHD4Ooy4TfB6FNdc6ZsqvapmhjI7C099Xqi8+W50=;
        b=ZAI5KK2kfMeA9piCCfi3akLghOgQq6pMxdfw1jei1RCZZUbZLB5bsZsftH7WYQSOyd
         Dj0dp7YZg4ozSqE78HtpaFgl8UxYjeC9m0KzbuLKXzCwBJLsau4pLk4gBiJgITrjc7P5
         /nz47LQ2ucXCqucIOsixdRL4TOhmvBzCFm2dGc39ey8TTcgkC8HLq5gkD5Qpq2QIMv8N
         6oj28UZDswIp5/TXDXlD4I4Yu1Tl7s6tfmebHko/nwKXAZcrt4t3qKJD/vLTh5GiQ+c4
         mE88S+azk4P6GCzT04nBCoA3e1tzRYOxo0rEUKtpRhQMFtHDUM+OXZ6yh2hLduw3XLAX
         YkDg==
X-Gm-Message-State: AOAM530zFOL7zr51w4qiSH9KBP3G900XP8ptvKQrdUfIsrqRQ1oybDWe
	Jtv6TzNExlpLoGEb6PXrFMbooWJqQjEAtRjxUULtp1w6ykXjyw==
X-Google-Smtp-Source: ABdhPJyj5c/98nNvg6ccNGxr5IZc/M4UI6xTbkUEGeqKi1LymHlwyKi4fo+Sp6DgidU3eNg0ZDJ1O/g72uR69RwOMB0=
X-Received: by 2002:a17:90a:5d8a:: with SMTP id t10mr8511090pji.6.1627458990255;
 Wed, 28 Jul 2021 00:56:30 -0700 (PDT)
MIME-Version: 1.0
From: "nagesh shamnur" <nagesh.shamnur@gmail.com>
Date: Wed, 28 Jul 2021 13:26:19 +0530
Message-ID: <CAA_JV5N=FQu_Mgcg5E8qzDyNzrUVfv-fuk85oaG5KfwoH6uMhg@mail.gmail.com>
Subject: [PATCH 1/1] fix compilation error when add libgloss under DEPENDS in recipe
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"

Dear Group,
   When include newlib and libgloss under DEPENDS in custom recipe,
then newlib compilation is successful however libgloss compilation
fails since it is unable to find the needed include path under
recipe-sysroot/usr/include. This patch is to fix this issue by
including recipe-sysroot/usr/include while configuring libgloss.

Regards,
Nagesh

From 773a10fbc2858f2397abcf64c60e64384a92f25f Mon Sep 17 00:00:00 2001
From: Nagesh <nagesh.shamnur@huawei.com>
Date: Wed, 28 Jul 2021 13:09:50 +0530
Subject: [PATCH 1/1] fix compilation error when add libgloss under
DEPENDS in recipe

Signed-off-by: Nagesh <nagesh.shamnur@huawei.com>
---
 meta/recipes-core/newlib/newlib.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/newlib/newlib.inc
b/meta/recipes-core/newlib/newlib.inc
index 0aba21fae7..edf4d1b52b 100644
--- a/meta/recipes-core/newlib/newlib.inc
+++ b/meta/recipes-core/newlib/newlib.inc
@@ -26,6 +26,7 @@ B = "${WORKDIR}/build"

 ## disable stdlib
 TARGET_CC_ARCH_append = " -nostdlib"
+CFLAGS_prepend = "-I${RECIPE_SYSROOT}/usr/include"

 EXTRA_OECONF = " \
                 --build=${BUILD_SYS}  \
-- 
2.25.1
