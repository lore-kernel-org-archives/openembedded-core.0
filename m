Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FDBC04FE0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:37 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.21399.1691683531324404154
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FZijIsLg;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a7d7df4e67so367518b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683530; x=1692288330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wckujM9DqnUI69fZfGgHZYJcuarudNmiVQ7noj0KYRY=;
        b=FZijIsLgXbH3A9KuTN+smRqPnCCXcW+5Y0P6yh5ECNN/z2nlHExhJeTmfFjtJBwW9Z
         Uip95kske2ng7OauuY1gD50j/6Y2qsPLMm2/LMnIohG6Q8F6Hmaa32B9az5XMoGqtNvA
         6QG2I1AFNxYgRXAcX+JHl+pu9WVqH7bQz2J1SCndAdcMlz28DdLriUK5N+5MKq2ctSqE
         yb0hvZPF7r75gaBqHMkeTDzwM/qg6ZeVNru4KDCbMTtRBVo960Uq9oyG8+T6vMTre+3B
         b313eI4V5Dtd2YvBBZ9JZtQ7LiDehITqhPhhBLLDDFN4XkbYWJmrUoEaWaiOnmNvXje5
         bxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683530; x=1692288330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wckujM9DqnUI69fZfGgHZYJcuarudNmiVQ7noj0KYRY=;
        b=E1BYOvNcYFpgh832zIXGR6qCeCdogWgAb9+qX9bEprdeeqwa0I5Z+B7YSl3cgDVEQW
         UM6nM2MyBHWNKiVsdFTMNT+iF0hCskDPRK71/n8xPK7JuSXayPRSmYcPe9yw5B9HLpOC
         kGh83Pgrqqy/2vZ8bUJCKj6dwJZOPGzMaINVaxo/vSQj+QruMbwiAq7S24AjFYdypIKM
         7VTwbwsToHByq/o838QyTioTVCoIZBVeuSXFKomHNv2PM+sN6jcanPcNHesXoUgHeNrN
         vF0e+Yl2D4dUmDvEcKB9EhIZkLysyFtO0E+v53AW2LbinFTktIiLJznmR3dAkTln5dHw
         yVxg==
X-Gm-Message-State: AOJu0YxIbXjqYPCJF/Ej6CUy4DR4Tewvh/9Ki/Jxo54/jtbnZm2lvASz
	/AOZlQdNu8aZOi9vjKMZ5LEOVTCKxwQT0s8QZi4=
X-Google-Smtp-Source: AGHT+IEV0rhU2/oYh+SvW3KZI2rER8n7+maLSubwGNH19bq0IoWKGLYtbtq+yydC4c0fRaeprzMH4A==
X-Received: by 2002:a05:6808:3ce:b0:3a7:c13:c8d1 with SMTP id o14-20020a05680803ce00b003a70c13c8d1mr2885719oie.17.1691683530247;
        Thu, 10 Aug 2023 09:05:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 21/37] selftest/cases/glibc.py: fix the override syntax
Date: Thu, 10 Aug 2023 06:04:20 -1000
Message-Id: <8ad6000c814631e1147fddd5d2462b39ea44b99e.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185783

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
index a446543a17..4ec4b85d67 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -28,7 +28,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             features.append('TOOLCHAIN_TEST_HOST_USER = "root"')
             features.append('TOOLCHAIN_TEST_HOST_PORT = "22"')
             # force single threaded test execution
-            features.append('EGLIBCPARALLELISM_task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
+            features.append('EGLIBCPARALLELISM:task-check:pn-glibc-testsuite = "PARALLELMFLAGS="-j1""')
         self.write_config("\n".join(features))
 
         bitbake("glibc-testsuite -c check")
-- 
2.34.1


