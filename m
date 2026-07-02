Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B720DC44500
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 15:22:28 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71764.1783005740416003623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 08:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=GSGvMEZC;
 spf=pass (domain: baylibre.com, ip: 209.85.219.68, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so6528356d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783005739; x=1783610539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZGeLKXT0HNmaCbQvlUa7YeY647guNQMYPQ4WF2lJCY=;
        b=GSGvMEZCI0xerKaAwml7fsJlFM2CWJwodOfskCpXhS81lgxGwJbBNSYxc12WmLwWjN
         vZ2xs2eiETwV26ase3v/kKvRKJPrOzPgbsw6PJoKMt6V+FfVhftSgJQelR1FFPksyPu+
         A/psRfI3Lu3dkTJHEYv87ilTXa/AXGGPV3y+7nziYFHJe3OuSwwatQnYXP7P7vP0KdsT
         I6mCxBgVZ7xpB5d9nbKGHNzVyNkDuvK7TmX+ej+dqhMo0HjIq11zJVN+61dF0eB59VOc
         xk1iv2LV1Tr0ZwER8Zub1pcOPiLj4qdfqHvMg+ud6gz6G5GuNQyqEStp+baWmnCsQ2Dx
         EFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005739; x=1783610539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZGeLKXT0HNmaCbQvlUa7YeY647guNQMYPQ4WF2lJCY=;
        b=hhb0med2z7mlDPqi+7NTB5PgMSUOzlU1Wlqc+8fjlrvCkY0XjQyAnzsTih0kehWGVn
         vYZ4vGB/g829e55NGfYnbFVdtWHe6zZmnHeFqry3QX/qdfW/6HkWqwNh8UEuO35D59Dj
         rJvmTsdWmxfNyQi5JSmx2COD8lMsuqvxWIjLL+Kfqe8vQT20tzsZI8pQ1D+ONIgWGY9Z
         oF6Va+LZZ4W04wcQOvRxv8AiaRAlzYA4k/3KyKLWNW6QxHknkzsVbbEOl/9bH2SrMq/a
         +omvy+JinO+aFS7mNiODsIvFo0z04gFgaYTYpMaTNCyUIGRNt7tfcZc75y5xC1SChkIm
         NucQ==
X-Gm-Message-State: AOJu0YwmcvfCjfg6VXQnCYpKoYb9fyR9wUXIOykRX5PKbjNyCQ2j0rMd
	OgkcaxCSfZCUfufjHeDetD2qtHgPvGSlmGd3RPXVcJzOIJQ6xzzbt85x3Mf2LWNYmJbEMnEodSV
	c5InCEI1bzEvH
X-Gm-Gg: AfdE7cmBtTqaBEsU3vCuN/EuqF70REcUBr56kXbrlM+2ToFNSc3zNhaiOSVlkoHKyZa
	z/PZ6CxbNiVz+igdUe56bNfuQ5eM4J+8fx4KxLzEUI/aPHH6STy3p9OP+PSr2BJP69nl1aWMaff
	mWmg9Cyyr+k+0FGf9nUOlCR9HSvHhc5MqN39I9DE6M32zcveZVjac1Q5CvtNtI9iV3Q1BHN0Vwg
	WeJwuTRSd90XkRNG+VFwhQK/NURFDkyUh0NHRIXY9Ry/yvyW4VseZSrz6sR3+Is2++biaRh2NFh
	YhaMg+qNMzjXiPAv8xJUmzEif7nZmJfrE/qLqxq5NFmGQO2tLvfQeX4BKTGwItaVlPSyhhJbexb
	o8U5PhVhHPNmWa2mB/VKsA1gsKl9BAVCnF0ZO7peNPwY+fnyXx1iq6VJ8Gfllt+GFkRue3Cqt/W
	HMoWrHAvKv9SZa+hra
X-Received: by 2002:a05:6214:1305:b0:8f1:5e32:9b06 with SMTP id 6a1803df08f44-8f5bca89c22mr5232736d6.13.1783005739163;
        Thu, 02 Jul 2026 08:22:19 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f46e942af0sm29462366d6.14.2026.07.02.08.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 08:22:18 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][PATCH 1/6] patchtest: tests: base.py: remove duplicate Commit object
Date: Thu,  2 Jul 2026 11:22:08 -0400
Message-ID: <20260702152213.1439717-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702152213.1439717-1-tgamblin@baylibre.com>
References: <20260702152213.1439717-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 15:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240059

This is declared twice, so delete one occurrence.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/tests/base.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 919ca136bb..8263932dda 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -22,10 +22,6 @@ info = logger.info
 warn = logger.warn
 error = logger.error
 
-Commit = collections.namedtuple(
-    "Commit", ["author", "subject", "commit_message", "shortlog", "payload"]
-)
-
 Commit = collections.namedtuple('Commit', ['author', 'subject', 'commit_message', 'shortlog', 'payload'])
 
 class PatchtestOEError(Exception):
-- 
2.54.0


