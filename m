Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66380C6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 07:24:31 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.62556.1678605866077270622
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 23:24:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TAe47PC8;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id kb15so9149729pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 23:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678605865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwUS6CvAnSFZZzMErvh+tPxkPdt+kSrmxbJwvoAqtHE=;
        b=TAe47PC86nwaEZb9FTO51CaZDJPPfR9mF6fjfbUpPoAFePH84Mxe1N/HqmXuWO0NOL
         6ycU8R4nLJ9p6/WDuLNnACdR57CAL736xd+KMsgcoi0J3XJfI0GvEDmRUxwDMjl7pvLH
         xikGYJGsVmwh2AlBH/ht5LVY2uNG3/Hn3bZRSC7O2zuNg4gKr6hao+k6i+I50CUsr85U
         maeRy6k/+wEho8A9WLv7v6tgsNGu385GdN963UwlZoVbZZfuyN3l5kpQHqetwpzBIC3V
         tNq40H9exLeUCNj/BFb4E2ZyzMGpceabMp06W2jk/F77dfbeygLQBZkNyeM7eiVdTCXW
         aeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678605865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwUS6CvAnSFZZzMErvh+tPxkPdt+kSrmxbJwvoAqtHE=;
        b=4mQybZvRjJEvcFniDL89i6ws31ATdk1dUNcwAIfYYsZ7dS/BdDSzSlu3yzcyc4K5x6
         Q8Gk2UGqiOSn3TSjsbqWSwQhE7lTEhStbadCIwl433CrirysqCLMhUUqqvE8YHEQYeI2
         I4BRaRtwwn+kcjd0uP9DhHifvtwrJLqSlj211VAuEP5+WfrC3ra8Qauqk+O8f2X3VMrg
         fBhlbcCo2QerZsFO0XS2m4uWj6rTKsfSr8TlCwIV3Z6woIRM+75z1tyzL3ri3WmFJJ7R
         dm8Z5KK9/8EEgiUK7r+pP8iSLakwQBMMF1m3UCHqFFxbHnlUBNkEZogwPRVyYA83YdPP
         jG3g==
X-Gm-Message-State: AO0yUKV+VFsWBs870zm5Vqc0fVPpPqtofrIhLHfls2WPa/b0tC+PCTkA
	mmX0pLXHRI1igu51uuqxBfzYPiJzq9Y=
X-Google-Smtp-Source: AK7set8qN7R4i7fDdXGhZtoZjfrnb5w7DwNaRfNzQjd2unNiCFDj9klGRM8a8Wc439BKhxOiuK3dEA==
X-Received: by 2002:a17:902:d504:b0:19c:e842:a9e0 with SMTP id b4-20020a170902d50400b0019ce842a9e0mr11963665plg.16.1678605865092;
        Sat, 11 Mar 2023 23:24:25 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::522c])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709026b4100b0019a97f180fcsm2456955plt.37.2023.03.11.23.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 23:24:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] systemd: Fix musl fix patch
Date: Sat, 11 Mar 2023 23:24:22 -0800
Message-Id: <20230312072422.2626859-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178376

Current patch with fail when stdint.h is in include path before this
typedef which can also happen with re-includes. Therefore shunt that
by defining __DEFINED_wchar_t which helps musl builds of systemd-boot
recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...rc-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
index 927f914848..43173ac32d 100644
--- a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
+++ b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
@@ -21,17 +21,16 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  src/boot/efi/efi-string.c | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
-index 22923d60f6..22a8d1ef71 100644
 --- a/src/boot/efi/efi-string.c
 +++ b/src/boot/efi/efi-string.c
-@@ -2,7 +2,12 @@
+@@ -2,7 +2,13 @@
  
  #include <stdbool.h>
  #include <stdint.h>
 +
 +#if SD_BOOT
 +typedef __WCHAR_TYPE__ wchar_t;
++#define __DEFINED_wchar_t
 +#else
  #include <wchar.h>
 +#endif
-- 
2.39.2


