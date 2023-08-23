Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE78EE49B5
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:17 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.13091.1692801432460552607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=t5XWFB9C;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68a4025b5e8so2731955b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801431; x=1693406231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tkYWnFWuYHpgB4WHRPyQ99NbLwBNxkMyjNs3HpRe4K4=;
        b=t5XWFB9Cgd7ELwZXjFx10fPDYIZbW5wFX35M4rmQ6z7JGLOR8IMPWBlSrfxPZW9CLp
         I5E3ux/xaCQlG/zfQ4WJklSDa73YaSQp7pVkSE2ghqcQhvFeH8GeG2x9s12Ks7PMcPSY
         Wd0B7XR2ZbyB8KPJ3vH9jyTaFQ3jLhr6vk5tg2WbJYjpLBoXAqR6YMkWBob9nC3BXtmp
         ay4xUhoeRNxauErgIsPR6wdGAzrR7RtqpqF7RS5pk2NxQUVD7f4g2QW7Xq+fabzpek4M
         v0UoiYnjmBumQEbWVXxAAaUe7cGbKYDzvIJujB2n5q8d1wR0m6SJ2UJ+r+r6q8/zqa/c
         uILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801431; x=1693406231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkYWnFWuYHpgB4WHRPyQ99NbLwBNxkMyjNs3HpRe4K4=;
        b=AGE1jL+65II5q/dpxwGPFrcd30FvyTbmJitjfQSAcluU9gs0odAedvo8ctitestvbn
         k3IKyOL6Q2Tmhqr43T1Gy2vtbwexvoc0V58+jNs3rKr7nVKr0yQYvQuQ2J52d1ZuNKvW
         egypyg0SBvtbC48wfi11c1OBWYB1QGbwjPsvWEUjRzrRE93TibfmnKF0UjchS8xUQ1s+
         b7qlKRcwkKg/z3bhVJYTIsX+WmESAkqlmVwnvXHd5Fv3O9BTZc4oyRB9kR2LEuhfRFY2
         4HiyRX9ecG4+9Y2rNI+dvyFWqL6TyAtxC4+xFITX932peiyfWXq8BrVyJlc8yV2xOvPa
         NkRQ==
X-Gm-Message-State: AOJu0YxX0W5Avwu1WbMi7bs7pZ1PFVvtIyicfIq+KVikNTv3IVzDEPqf
	xDKAnscPPSpzob3De3Vbf5iGdBgA34WsoPSqj/M=
X-Google-Smtp-Source: AGHT+IHgOShvZXRI6Vggji9z5f1+KD73Em7lbDk8tLSn/F8Ae6eL9w1Ut0Bnp/3y7X67hsLDXsHJjw==
X-Received: by 2002:a05:6a20:8e1c:b0:149:8cc1:f30b with SMTP id y28-20020a056a208e1c00b001498cc1f30bmr6553537pzj.38.1692801431580;
        Wed, 23 Aug 2023 07:37:11 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/36] rpm: Pick debugfs package db files/dirs explicitly
Date: Wed, 23 Aug 2023 04:35:55 -1000
Message-Id: <007a57ce36a06f9a78675563020f24e1afa3caa1.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186606

From: Alex Kiernan <alex.kiernan@gmail.com>

Rather than copying the entire /etc hierarchy, specify the pieces we
actually need.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f0fea55ab02b013484282177a636795a254e7986)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oe/package_manager/rpm/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/rpm/rootfs.py b/meta/lib/oe/package_manager/rpm/rootfs.py
index 00d07cd9cc..a120092b83 100644
--- a/meta/lib/oe/package_manager/rpm/rootfs.py
+++ b/meta/lib/oe/package_manager/rpm/rootfs.py
@@ -108,7 +108,7 @@ class PkgRootfs(Rootfs):
         if self.progress_reporter:
             self.progress_reporter.next_stage()
 
-        self._setup_dbg_rootfs(['/etc', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
+        self._setup_dbg_rootfs(['/etc/rpm', '/etc/rpmrc', '/etc/dnf', '/var/lib/rpm', '/var/cache/dnf', '/var/lib/dnf'])
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
 
-- 
2.34.1


