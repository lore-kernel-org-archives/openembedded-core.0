Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3704ACAC59F
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:35 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.33517.1758139527924468423
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=i3bWvPu8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77b0a93e067so269357b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139527; x=1758744327; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kiL2HVvkrv+tbkel4bHPWBtsm0kk6ktcQpasWgRXYZc=;
        b=i3bWvPu8AOtDwytOC9czufJ5p/J1Bcfqeh7qbRE5XaEz3WeHjlGaRaYuNgvsxHZ8t1
         TbdC5UENJ/NOJZiHsE4vyKzWNPPP/YkTA1/SQrrUHl81C/QJNQ6B+tF//1XHg5EPGgK1
         rMeuL+n5eWo85jkGKclkE8d70u+AE1KDzrvq4FmffvTqBAX/q+q5DjM8KUHRmfn0Ee4S
         BXBzcb/P2m/kTUHe298BOGYecYSWjgPjjc6LQlg8DrI2BaOdDi5Jzqt/jw7afxO5ZV6Q
         /mrzN63PjfRDoSadyA03Z7mVNXr7nq4lIwZsGz0uagqWnv6i6pcN1O2kiUV1uYPq59v2
         EHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139527; x=1758744327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiL2HVvkrv+tbkel4bHPWBtsm0kk6ktcQpasWgRXYZc=;
        b=X02BU/Zm022plWhwQF8/hbN87hjYMc3DEZ3y1cnVCjWNEewtN5JvBB37qDlQDG90Ef
         AamXtmAcoqf0PIv23q5V9XUuwlQkg5Zs1XSg0LzF+R86BfIzSb8okJKiUhXLX2XWbN3m
         6cEpIE8wvw2zzsAvHISbZkT/jU1q1S9gFduo4foeNkIjrB/vyaw+x/u0V4GF8zNEJFks
         HpWPwXTFoDM6i1QXZBISvjOdK5cdGFrhO/tQ2agKAjIG4lwBlrLzU+UdMzoaagyxaWrk
         CQ7blndhBvA6Kaa+N1dHCnE1r0hVlHMmgGIuGH1ywxu4hARsHDYZ6kMJNjFf4q6Tnuqv
         lxfg==
X-Gm-Message-State: AOJu0YxktwMp8nB4y5G+Tqs07aOAllyD2NeRGRhGAwbeA+Ivwjim3amQ
	ktTE4oMFLOalDrFFm41yM2hjJ22zU5MqIucxZYCJJuoCNjLnmtyaL+Um3Dj1HyLkrfBPffSjkpz
	Ljx+E
X-Gm-Gg: ASbGncu3KqYUXz+UpimZcCYpTarmX21YP6CVyl/K1HVNJtrPrtaXS+iu8lF7AM1yZSQ
	uzHcY6rhIpXD9MBrervd+204GUs9c/RUoWbj4B4Frb5XCJlVkh6lbBe/Nnv/5emTjv2Nj65gZ0z
	C2wf0jb4JGVEDDCRl97VVFd1CcBTkIxI5NIWpBPSIssPpdrwORYTq65diZCyUSxRmBtgbPx24lS
	lnowkwmMYr6uaUTMB6UloUu1nHN5uz9bABvNnQrXY7wt91S+FUlvEG0d8aj/DqNLQmMluDLHo1f
	tRMbxb6ZUYN/2WZR8b7ylnF5ELBhSG4+Gq9RAZSVJSTEau5nhGGN6dI2MNN1+oa8Lh2DWU/kFT4
	z++Y9RMF9aWJ/X27AchLlpyJ64vrp42zU
X-Google-Smtp-Source: AGHT+IF4E9/rs/8aK1+0vutSiRFU2QWDvvUYzt2m9fYhRqTgfNlWl1G3kiHrcoggIS7mXPsBZV8gaA==
X-Received: by 2002:a05:6a00:2d1e:b0:76e:99fc:dde7 with SMTP id d2e1a72fcca58-77bf9465fe1mr3830465b3a.22.1758139527185;
        Wed, 17 Sep 2025 13:05:27 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.05.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:05:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/8] runqemu: fix special characters bug
Date: Wed, 17 Sep 2025 13:04:44 -0700
Message-ID: <0276bd0e8d5cefb6f98d685bc9faa0451780bef9.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758139278.git.steve@sakoman.com>
References: <cover.1758139278.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223622

From: Libo Chen <libo.chen.cn@windriver.com>

Fix the bug in runqemu that happens when the file path contains
the specific words such as 'vmlinux', e.g. /home/frank/vmlinux.

runqemu - ERROR - wic doesn't need kernel

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3c186fe7741adecb0887e36c8a9164a58fc16437)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 2ab36fd03d..f189dbfb60 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -368,12 +368,13 @@ class BaseConfig(object):
         - Check whether it is an NFS dir
         - Check whether it is an OVMF flash file
         """
+        n = os.path.basename(p)
         if p.endswith('.qemuboot.conf'):
             self.qemuboot = p
             self.qbconfload = True
-        elif re.search('\\.bin$', p) or re.search('bzImage', p) or \
-             re.search('zImage', p) or re.search('vmlinux', p) or \
-             re.search('fitImage', p) or re.search('uImage', p):
+        elif re.search('\\.bin$', n) or re.search('bzImage', n) or \
+             re.search('zImage', n) or re.search('vmlinux', n) or \
+             re.search('fitImage', n) or re.search('uImage', n):
             self.kernel =  p
         elif os.path.isfile(p) and ('-image-' in os.path.basename(p) or '.rootfs.' in os.path.basename(p)):
             self.rootfs = p
-- 
2.43.0


