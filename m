Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBEAEE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:17 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.13091.1692801428558193337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VXUI8Cjh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c09673b006so11946455ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801427; x=1693406227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHYh5Z6j8DY4Fh06xGHPkB/EYBVgKd7YUQHj6rsRAHc=;
        b=VXUI8CjhIpY0IfbJTOv4uyFFt6GqJGktPaFJJoq+j5rRGtA/rEalqqR1wcG4kGxDMv
         +tDuhDyjJ0iBBu894vvE0hGN4HNYEWW+cWBju2ughhgIXiKkkSax2xXdsuXrs1kCJi5m
         4fOwIEY2pCzvmjfBmQ/9iHgaaXQenQpxmRNLzs7SSaQEH7YgHLKz0l0NiVtPpVdV6gZl
         ldKqxfdN1abA9Uj8Qi/wTqDch6/gLaRBxErQlHK5idejd3KP42/lZx4Tx4+xg2k7v5fc
         q4CX5urPfiu1cjr29uS92Bc0oDVnKeZZiwpSuGAE15LgTBUHukbAV0iYtWcJnab0k6LP
         6lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801427; x=1693406227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHYh5Z6j8DY4Fh06xGHPkB/EYBVgKd7YUQHj6rsRAHc=;
        b=T19gOoLhRAQva05dhL/cw+EHHebn7bJ+0jzlSw/BlfQakHj2L895Zbm4/FILjxLpMs
         RA+NUVst4XaB3p9jx4sj27e1GLVC+nGFVUVpz/GNct/LTAPy92tqXcMsMVd5pPSHJWPb
         wlyZ7xu3IPb+uZxypccpIYwmWjRF4c4dGEfPgvuHKqYa4wuMGQYd2y/Ch1ABlkpbvaKz
         W3xLMBXPW/bqQzf0j6EEOSvJxGKt4jFJ3QjC/2MIrqiDjGM2xAHeeEpHo+VseLOMG+YZ
         xuVSZEVLG8U/C9vsy5y5N4UnJrPBNAk7eFcJNrBpFJJTBTbzCp6RXyZ/JB7E/s3pkFLx
         P8VQ==
X-Gm-Message-State: AOJu0Yxwkj+pTkD3RHu8c0poleKcD44M9wsH1pnX5fUdj8vpnxt0xfjy
	3MmNPBYQYyYVcSxyVEpstiHdZEhihVg7JBbow7I=
X-Google-Smtp-Source: AGHT+IHecVYWU5sJELX3zPZnyo9p7MuJY4EtNS888111QZcw8KmRqn8umUVnYW13FLRrz61iG/SKXg==
X-Received: by 2002:a17:902:c20c:b0:1b8:6cae:4400 with SMTP id 12-20020a170902c20c00b001b86cae4400mr10846913pll.37.1692801427691;
        Wed, 23 Aug 2023 07:37:07 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/36] selftest/cases/glibc.py: fix the override syntax
Date: Wed, 23 Aug 2023 04:35:53 -1000
Message-Id: <60ca407ce3113d8b507aaa0876b28902aab7ed5b.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186604

From: Anuj Mittal <anuj.mittal@intel.com>

Fix the override so we actually pass the correct value to glibc.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 38fd2120f0f48512091ddad6205ce19839eaf589)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 6fc98e9cb4..783c2d8541 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -24,7 +24,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
             features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
             # force single threaded test execution
-            features.append('EGLIBCPARALLELISM_task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
+            features.append('EGLIBCPARALLELISM:task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
         self.write_config("\n".join(features))
 
         bitbake("glibc-testsuite -c check")
-- 
2.34.1


