Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D02CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 10:56:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.19658.1755168971959305019
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 03:56:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=koBgAvQc;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so3832745e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 03:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755168970; x=1755773770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msQVRBT72D5ZrIOvXtRWC7tW0X0ELTBu/FzMBr4iYQE=;
        b=koBgAvQcQmMKm9Om8ml5dBuXZtBFtO4bxeE+1Asg+s64P2UaPeCRTPjcpn5Lnb4MiD
         0lnAr30yGrD0U99w7W7311SYrLj7RAPGYGSNts3Ax/ly+6biCS6VeG2CwRCDNpy7TG+k
         8+MkmpIuj3DdIsxwDNQZ0b99K2dorAr262MQNQx1UbwDCR34s8+Vx1f1FSSzlujyCMNp
         Xmv9KGlHtttPijABScd0qeSYdxwFt6+oPh2DWnFtfrgkQNaukHMruNKw8eQ9JLjdOppz
         ulDdqE7qz7qYMmNxQMOlE8EF9pSbo3yRVXeyuKXb94gjBPatx4eS9jpdw9QPnXiut8A1
         naiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168970; x=1755773770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msQVRBT72D5ZrIOvXtRWC7tW0X0ELTBu/FzMBr4iYQE=;
        b=TUn/WMh51XJXmvuPAmnVslCktRRx05x4iBi+i7e/NVSpCxFiNuUJoPu4L2F1MsJddh
         8JnmZiiYKbcgelSJG0OH6lImWHGt5A0yiQr4t6XFAYJjWhkgKLxz0rHfgEXSi92Pg1+J
         fFpZ46wo/l+szx8q7ZSpXdEq3W6U7uigP5F5jPQXpXReblrGJvw7kVyrMu2EIToaa3lf
         CEJR9K3ulvXKWpJ1kaGO7ogHmKfeQObLsPhcHegCxDTtdXkRy1HQEByY78QHq/7fhZpr
         PmuSoabjLwoxcaWQA0stuCNMEoWpQGMP/I4SUCSAD0fmyh7byc8Yvt2tVkHBqNZ+qlM3
         EfkA==
X-Gm-Message-State: AOJu0YwWrdWviHa03a9HNQEQtDN7gHIMwHYPWlp/YS/H66qC9yl6z93H
	4p9qXnd9Yy/aephGVmywhoEydFhuc9oZXXjVzGeRi00TU7QgNKHSgNcuXLRZGA==
X-Gm-Gg: ASbGncuf5hcNsLha9GcdnQ9ZHjfYabkzReGWbuowySKFXwAhsywvl7HviowPkWz+hms
	HSafu0Rkk1mxqApn91qOnxLyMBSrboHQv0zsE52s/upGVJLqOg58lqlBdlKfL3N5XSHoBTAwP+p
	HGtYBXFbyMY+P0F8h9EDwA5qwojE0vzrpeu0YpvzAhlU8jiCH6F/1AONIOJQXOYMnxlC05c0yIL
	hLCwx3V0eEUzv5rISAs7XMXn8kHzYy4ToVleWSltwC7UMoC+V3YyNVGQDqx3tDrx0t6JHvPb3Gu
	+KwaAexPdBCx7vp4IySd2iUzXQeHnNTj38cKUEXSjVbwOGSPAY++iqevtmkOWdPT/YZbwyX6KrU
	DxZ0mPMf++O+cZcBu10hFrbmgjqbbI7/Zw1HoFkpiym4ah9jiIj1QVlg9Negw8VB2w/USUOfCDW
	0DBKWY
X-Google-Smtp-Source: AGHT+IG9TSz2VShg+nyB9lY0LigzYtNyYv7xm/D0TXBWap1YRUvzFn94jJxwTwRBimXDt4n4Ce2rhg==
X-Received: by 2002:a05:600c:19d1:b0:459:dfde:332e with SMTP id 5b1f17b1804b1-45a1b668446mr19360955e9.29.1755168970033;
        Thu, 14 Aug 2025 03:56:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b793f37sm12937605e9.2.2025.08.14.03.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:56:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] fragments/autobuilder: add go to SDK_TOOLCHAIN_LANGS
Date: Thu, 14 Aug 2025 12:56:04 +0200
Message-Id: <20250814105604.3586651-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 10:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221857

From: Alexander Kanavin <alex@linutronix.de>

For reasons unknown, only rust was listed, which means
nativesdk-go was not built or tested, which lead to
breakage like one fixed in
https://git.yoctoproject.org/poky/commit/?id=a669cd2e0c760da9d7e872daea9590fc9e86d766

Note that with this change only building and installing go
into SDKsis tested, but no tests are performed with the
toolchain itself in testsdk/testimage.

For that, a bug has been filed:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15953

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/fragments/yocto-autobuilder/autobuilder.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
index e3bac343390..85987b08995 100644
--- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -9,5 +9,5 @@ IMAGE_CLASSES += 'testimage'
 SDK_EXT_TYPE = 'minimal'
 SDK_INCLUDE_TOOLCHAIN = '1'
 ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
-SDK_TOOLCHAIN_LANGS += 'rust'
+SDK_TOOLCHAIN_LANGS += 'go rust'
 
-- 
2.39.5


